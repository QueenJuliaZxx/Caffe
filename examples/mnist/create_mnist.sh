#!/usr/bin/env sh
# 这个脚本将mnist数据转换为lmdb/leveldb 格式,
#格式具体是lmdb/leveldb取决于设置$BACKEND.
set -e

EXAMPLE=examples/mnist
DATA=data/mnist
BUILD=build/examples/mnist
#格式具体是lmdb/leveldb取决于设置$BACKEND
BACKEND="lmdb"

echo "Creating ${BACKEND}..."
#如果已经存在则删除
rm -rf $EXAMPLE/mnist_train_${BACKEND}
rm -rf $EXAMPLE/mnist_test_${BACKEND}

$BUILD/convert_mnist_data.bin $DATA/train-images-idx3-ubyte \
  $DATA/train-labels-idx1-ubyte $EXAMPLE/mnist_train_${BACKEND} --backend=${BACKEND}
$BUILD/convert_mnist_data.bin $DATA/t10k-images-idx3-ubyte \
  $DATA/t10k-labels-idx1-ubyte $EXAMPLE/mnist_test_${BACKEND} --backend=${BACKEND}

echo "Done."

@interface TMLPointer
+ (id)pointerWithReadBlock:(id)a3 writeBlock:(id)a4;
- (id)pointee;
- (id)readBlock;
- (id)writeBlock;
- (void)setPointee:(id)a3;
- (void)setReadBlock:(id)a3;
- (void)setWriteBlock:(id)a3;
@end

@implementation TMLPointer

+ (id)pointerWithReadBlock:(id)a3 writeBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(TMLPointer);
  objc_msgSend_setReadBlock_(v7, v8, v9, v6);

  objc_msgSend_setWriteBlock_(v7, v10, v11, v5);
  return v7;
}

- (id)pointee
{
  return (id)(*((uint64_t (**)(void))self->_readBlock + 2))();
}

- (void)setPointee:(id)a3
{
}

- (id)readBlock
{
  return self->_readBlock;
}

- (void)setReadBlock:(id)a3
{
}

- (id)writeBlock
{
  return self->_writeBlock;
}

- (void)setWriteBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeBlock, 0);
  objc_storeStrong(&self->_readBlock, 0);
}

@end
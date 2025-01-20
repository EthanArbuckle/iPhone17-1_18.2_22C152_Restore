@interface SOSDictionaryUpdate
- (BOOL)hasChanged:(__CFDictionary *)a3;
- (OS_dispatch_queue)queue;
- (SOSDictionaryUpdate)init;
- (void)dealloc;
- (void)onqueueFreeHashBuff;
- (void)reset;
- (void)setQueue:(id)a3;
@end

@implementation SOSDictionaryUpdate

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)reset
{
  v3 = [(SOSDictionaryUpdate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002019E0;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)hasChanged:(__CFDictionary *)a3
{
  v4 = sub_100201AD4(a3);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [(SOSDictionaryUpdate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100201CB8;
  block[3] = &unk_1003097F0;
  void block[5] = &v8;
  block[6] = v4;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)onqueueFreeHashBuff
{
  v3 = [(SOSDictionaryUpdate *)self queue];
  dispatch_assert_queue_V2(v3);

  currentHashBuf = self->currentHashBuf;
  if (currentHashBuf)
  {
    free(currentHashBuf);
    self->currentHashBuf = 0;
  }
}

- (void)dealloc
{
  [(SOSDictionaryUpdate *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)SOSDictionaryUpdate;
  [(SOSDictionaryUpdate *)&v3 dealloc];
}

- (SOSDictionaryUpdate)init
{
  v7.receiver = self;
  v7.super_class = (Class)SOSDictionaryUpdate;
  v2 = [(SOSDictionaryUpdate *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->currentHashBuf = 0;
    dispatch_queue_t v4 = dispatch_queue_create("SOSDictionaryUpdate", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

@end
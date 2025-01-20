@interface EPSagaServiceOOBStash
- (EPSagaServiceOOBStash)init;
- (NSData)oobKey;
- (id)recallOOBKey;
- (void)_clearOOBKey;
- (void)clearOOBKey;
- (void)setOobKey:(id)a3;
- (void)storeOOBKeyWithTimeout:(id)a3;
@end

@implementation EPSagaServiceOOBStash

- (EPSagaServiceOOBStash)init
{
  v7.receiver = self;
  v7.super_class = (Class)EPSagaServiceOOBStash;
  v2 = [(EPSagaServiceOOBStash *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.saga.service.oobstashexpiration", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)storeOOBKeyWithTimeout:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E7584;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)_clearOOBKey
{
  keyData = self->_keyData;
  self->_keyData = 0;

  [(AbstractTimer *)self->_keyExpirationTimer invalidate];
  keyExpirationTimer = self->_keyExpirationTimer;
  self->_keyExpirationTimer = 0;
}

- (void)clearOOBKey
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7720;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)recallOOBKey
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000E7818;
  v10 = sub_1000E7828;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E7830;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSData)oobKey
{
  return (NSData *)[(EPSagaServiceOOBStash *)self recallOOBKey];
}

- (void)setOobKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyExpirationTimer, 0);

  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
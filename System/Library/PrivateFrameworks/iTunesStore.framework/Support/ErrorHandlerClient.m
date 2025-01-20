@interface ErrorHandlerClient
- (NSSet)failureTypes;
- (id)popAllSessions;
- (id)popSessionWithIdentifier:(int64_t)a3;
- (void)addSession:(id)a3;
- (void)dealloc;
- (void)setFailureTypes:(id)a3;
@end

@implementation ErrorHandlerClient

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ErrorHandlerClient;
  [(XPCClient *)&v3 dealloc];
}

- (void)addSession:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100189CB4;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (NSSet)failureTypes
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100189E54;
  v10 = sub_100189E64;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100189E70;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)popAllSessions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100189E54;
  v10 = sub_100189E64;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100189FAC;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)popSessionWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_100189E54;
  dispatchQueue = self->super._dispatchQueue;
  uint64_t v11 = sub_100189E64;
  uint64_t v12 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A108;
  block[3] = &unk_1003A80A8;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setFailureTypes:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10018A214;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

@end
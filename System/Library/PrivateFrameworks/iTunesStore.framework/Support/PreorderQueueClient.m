@interface PreorderQueueClient
- (BOOL)supportsItemKind:(id)a3;
- (NSSet)itemKinds;
- (void)dealloc;
- (void)setItemKinds:(id)a3;
@end

@implementation PreorderQueueClient

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PreorderQueueClient;
  [(XPCClient *)&v3 dealloc];
}

- (NSSet)itemKinds
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100100378;
  v10 = sub_100100388;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100100394;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setItemKinds:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100100454;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)supportsItemKind:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  dispatchQueue = self->super._dispatchQueue;
  char v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010055C;
  block[3] = &unk_1003A5450;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
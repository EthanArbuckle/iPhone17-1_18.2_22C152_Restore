@interface DownloadHandlerClient
- (BOOL)sessionsNeedPowerAssertion;
- (BOOL)sessionsShouldBlockOtherDownloads;
- (DownloadHandlerClient)initWithInputConnection:(id)a3;
- (NSSet)disavowedSessionProperties;
- (NSSet)downloadPhasesToIgnore;
- (id)description;
- (id)resetDisavowedSessionProperties;
- (int64_t)handlerIdentifier;
- (void)addDisavowedSessionProperties:(id)a3;
- (void)dealloc;
- (void)setDownloadPhasesToIgnore:(id)a3;
- (void)setHandlerIdentifier:(int64_t)a3;
- (void)setSessionsNeedPowerAssertion:(BOOL)a3;
- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3;
@end

@implementation DownloadHandlerClient

- (DownloadHandlerClient)initWithInputConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadHandlerClient;
  result = [(XPCClient *)&v4 initWithInputConnection:a3];
  if (result)
  {
    result->_sessionsNeedPowerAssertion = 1;
    result->_sessionsShouldBlockOtherDownloads = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadHandlerClient;
  [(XPCClient *)&v3 dealloc];
}

- (void)addDisavowedSessionProperties:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100028C60;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (NSSet)disavowedSessionProperties
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100028DDC;
  v10 = sub_100028DEC;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028DF8;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)downloadPhasesToIgnore
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_100028DDC;
  v10 = sub_100028DEC;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028F34;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSSet *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)handlerIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002902C;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)resetDisavowedSessionProperties
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_100028DDC;
  v10 = sub_100028DEC;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029144;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)sessionsNeedPowerAssertion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029258;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)sessionsShouldBlockOtherDownloads
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029330;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDownloadPhasesToIgnore:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000293CC;
  v4[3] = &unk_1003A3380;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setHandlerIdentifier:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029498;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setSessionsNeedPowerAssertion:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029530;
  v4[3] = &unk_1003A3860;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000295CC;
  v4[3] = &unk_1003A3860;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_100028DDC;
  v10 = sub_100028DEC;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000296E0;
  v5[3] = &unk_1003A3810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
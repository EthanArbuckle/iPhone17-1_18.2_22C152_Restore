@interface RMHeadphoneMotionProvider
- (id)startProducingDataWithCallback:(id)a3;
- (void)stopProducingData;
@end

@implementation RMHeadphoneMotionProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  sub_1000025FC((uint64_t)self, v5);

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000B698;
  v13 = &unk_100024D18;
  v14 = self;
  id v15 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(&v10);
  if (self) {
    audioAccessoryManager = self->_audioAccessoryManager;
  }
  else {
    audioAccessoryManager = 0;
  }
  -[RMAudioAccessoryManager startDeviceMotionUpdatesWithHandler:](audioAccessoryManager, "startDeviceMotionUpdatesWithHandler:", v7, v10, v11, v12, v13, v14);

  return 0;
}

- (void)stopProducingData
{
  v2 = self;
  if (self) {
    self = (RMHeadphoneMotionProvider *)self->_audioAccessoryManager;
  }
  [(RMHeadphoneMotionProvider *)self stopDeviceMotionUpdates];

  sub_1000025FC((uint64_t)v2, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);

  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end
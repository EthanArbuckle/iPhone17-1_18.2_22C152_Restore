@interface RMHeadphoneActivityProvider
- (id)startProducingDataWithCallback:(id)a3;
- (void)stopProducingData;
@end

@implementation RMHeadphoneActivityProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  sub_1000025EC((uint64_t)self, v5);

  +[CMAudioAccessoryManager _isAvailable];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000744C;
  v13 = &unk_100024B78;
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
  -[RMAudioAccessoryManager startActivityUpdatesWithHandler:](audioAccessoryManager, "startActivityUpdatesWithHandler:", v7, v10, v11, v12, v13, v14);

  return 0;
}

- (void)stopProducingData
{
  if (self)
  {
    [(RMAudioAccessoryManager *)self->_audioAccessoryManager stopActivityUpdates];
    sub_1000025EC((uint64_t)self, 0);
    objc_setProperty_atomic(self, v3, 0, 24);
  }
  else
  {
    [0 stopActivityUpdates];
    sub_1000025EC(0, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);

  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end
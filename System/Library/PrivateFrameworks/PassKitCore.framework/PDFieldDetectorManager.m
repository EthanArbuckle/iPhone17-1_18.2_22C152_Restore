@interface PDFieldDetectorManager
- (PDFieldDetectorManager)init;
- (void)dealloc;
- (void)receivedSecureFieldEntranceEventWithProperties:(id)a3;
- (void)receivedSecureFieldExitEvent;
@end

@implementation PDFieldDetectorManager

- (void)receivedSecureFieldExitEvent
{
  v3 = sub_10002149C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BA70;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (PDFieldDetectorManager)init
{
  return 0;
}

- (void)dealloc
{
  PDNFSecureXPCUnregisterFieldDetectObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PDFieldDetectorManager;
  [(PDFieldDetectorManager *)&v3 dealloc];
}

- (void)receivedSecureFieldEntranceEventWithProperties:(id)a3
{
  id v4 = a3;
  v5 = sub_10002149C();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A58CC;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldProbe, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
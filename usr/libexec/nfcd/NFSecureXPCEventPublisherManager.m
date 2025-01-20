@interface NFSecureXPCEventPublisherManager
+ (id)sharedManager;
- (NFSecureXPCEventPublisher)homed;
- (NFSecureXPCEventPublisher)wallet;
- (void)invalidate;
- (void)setHomed:(id)a3;
- (void)setWallet:(id)a3;
- (void)startPublisherWithQueue:(id)a3;
- (void)startPublisherWithXPCQueue:(id)a3 eventSendQueue:(id)a4;
@end

@implementation NFSecureXPCEventPublisherManager

- (NFSecureXPCEventPublisher)wallet
{
  return self->_wallet;
}

+ (id)sharedManager
{
  if (qword_1003472E0 != -1) {
    dispatch_once(&qword_1003472E0, &stru_100301680);
  }
  v2 = (void *)qword_1003472E8;

  return v2;
}

- (void)startPublisherWithQueue:(id)a3
{
}

- (void)startPublisherWithXPCQueue:(id)a3 eventSendQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NFSecureXPCEventPublisherManager *)self wallet];
  [v8 invalidate];

  v9 = [(NFSecureXPCEventPublisherManager *)self homed];
  [v9 invalidate];

  id v10 = [objc_alloc((Class)NFSecureXPCEventPublisher) initWithMachPort:@"com.apple.passd.nf-events" xpcConnectionQueue:v7 eventSendQueue:v6];
  [(NFSecureXPCEventPublisherManager *)self setWallet:v10];

  id v11 = [objc_alloc((Class)NFSecureXPCEventPublisher) initWithMachPort:@"com.apple.nfcd.xpc.homed.uaevents" xpcConnectionQueue:v7 eventSendQueue:v6];
  [(NFSecureXPCEventPublisherManager *)self setHomed:v11];
}

- (void)invalidate
{
  v3 = [(NFSecureXPCEventPublisherManager *)self wallet];
  [v3 invalidate];

  [(NFSecureXPCEventPublisherManager *)self setWallet:0];
  v4 = [(NFSecureXPCEventPublisherManager *)self homed];
  [v4 invalidate];

  [(NFSecureXPCEventPublisherManager *)self setHomed:0];
}

- (void)setWallet:(id)a3
{
}

- (NFSecureXPCEventPublisher)homed
{
  return self->_homed;
}

- (void)setHomed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homed, 0);

  objc_storeStrong((id *)&self->_wallet, 0);
}

@end
@interface JSNetwork
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)environmentMonitorDidChangeTelephonyStatus:(id)a3;
@end

@implementation JSNetwork

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 sharedMonitor];
  [v6 unregisterObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(JSObject *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
}

- (void)environmentMonitorDidChangeTelephonyStatus:(id)a3
{
}

@end
@interface KeychainItemUpgradeRequestServer
+ (id)server;
- (KeychainItemUpgradeRequestController)controller;
- (KeychainItemUpgradeRequestServer)initWithLockStateTracker:(id)a3;
- (void)setController:(id)a3;
@end

@implementation KeychainItemUpgradeRequestServer

- (void).cxx_destruct
{
}

- (void)setController:(id)a3
{
}

- (KeychainItemUpgradeRequestController)controller
{
  return (KeychainItemUpgradeRequestController *)objc_getProperty(self, a2, 8, 1);
}

- (KeychainItemUpgradeRequestServer)initWithLockStateTracker:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeychainItemUpgradeRequestServer;
  v5 = [(KeychainItemUpgradeRequestServer *)&v9 init];
  if (v5)
  {
    v6 = [[KeychainItemUpgradeRequestController alloc] initWithLockStateTracker:v4];
    controller = v5->_controller;
    v5->_controller = v6;
  }
  return v5;
}

+ (id)server
{
  if (qword_10035CCD0 != -1) {
    dispatch_once(&qword_10035CCD0, &stru_1002F7D58);
  }
  v2 = (void *)qword_10035CCC8;

  return v2;
}

@end
@interface BYSourceDeviceMigration
+ (id)createDeviceTransferTask:(id)a3;
- (BOOL)requiresProcessAssertion;
- (void)cancelDeviceTransferTask;
- (void)startDeviceTransferTask;
@end

@implementation BYSourceDeviceMigration

- (void)startDeviceTransferTask
{
  id v2 = [(BYSourceDeviceMigration *)self sourceDeviceTransferTask];
  [v2 start];
}

- (void)cancelDeviceTransferTask
{
  id v2 = [(BYSourceDeviceMigration *)self sourceDeviceTransferTask];
  [v2 cancel];
}

+ (id)createDeviceTransferTask:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F78020];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithFileTransferSession:v4];

  return v5;
}

- (BOOL)requiresProcessAssertion
{
  return 0;
}

@end
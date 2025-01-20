@interface CBStackAdaptorBTStack
- (Class)accessoryMonitorClass;
- (Class)addressMonitorClass;
- (Class)bleAdvertiserClass;
- (Class)bleScannerClass;
- (Class)classicScannerClass;
- (Class)controllerClass;
- (Class)deviceMonitorClass;
- (Class)userControllerClass;
@end

@implementation CBStackAdaptorBTStack

- (Class)accessoryMonitorClass
{
  return (Class)objc_opt_class();
}

- (Class)addressMonitorClass
{
  return (Class)objc_opt_class();
}

- (Class)bleAdvertiserClass
{
  return (Class)objc_opt_class();
}

- (Class)bleScannerClass
{
  return (Class)objc_opt_class();
}

- (Class)classicScannerClass
{
  return (Class)objc_opt_class();
}

- (Class)controllerClass
{
  return (Class)objc_opt_class();
}

- (Class)deviceMonitorClass
{
  return (Class)objc_opt_class();
}

- (Class)userControllerClass
{
  return (Class)objc_opt_class();
}

@end
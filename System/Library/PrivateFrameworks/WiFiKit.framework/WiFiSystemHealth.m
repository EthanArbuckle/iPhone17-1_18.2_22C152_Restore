@interface WiFiSystemHealth
- (unint64_t)getComponentStatusWithError:(id *)a3;
@end

@implementation WiFiSystemHealth

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  v3 = (const void *)WiFiManagerClientCreate();
  int HardwareFailure = WiFiManagerClientGetHardwareFailure();
  if (v3) {
    CFRelease(v3);
  }
  if (HardwareFailure == 2) {
    return 2;
  }
  else {
    return HardwareFailure == 1;
  }
}

@end
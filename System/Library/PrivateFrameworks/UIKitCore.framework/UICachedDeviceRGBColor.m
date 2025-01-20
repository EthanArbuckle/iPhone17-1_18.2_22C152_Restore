@interface UICachedDeviceRGBColor
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (unint64_t)retainCount;
@end

@implementation UICachedDeviceRGBColor

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)allowsWeakReference
{
  return 1;
}

- (BOOL)retainWeakReference
{
  return 1;
}

@end
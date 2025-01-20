@interface UICachedDeviceWhiteColor
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (unint64_t)retainCount;
@end

@implementation UICachedDeviceWhiteColor

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
@interface WebDefaultFrameLoadDelegate
+ (id)sharedFrameLoadDelegate;
@end

@implementation WebDefaultFrameLoadDelegate

+ (id)sharedFrameLoadDelegate
{
  id result = (id)sharedFrameLoadDelegate_sharedDelegate;
  if (!sharedFrameLoadDelegate_sharedDelegate)
  {
    id result = objc_alloc_init(WebDefaultFrameLoadDelegate);
    sharedFrameLoadDelegate_sharedDelegate = (uint64_t)result;
  }
  return result;
}

@end
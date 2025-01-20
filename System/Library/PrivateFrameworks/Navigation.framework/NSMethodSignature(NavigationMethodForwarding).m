@interface NSMethodSignature(NavigationMethodForwarding)
+ (id)_navigation_methodSignatureForEmptyMethod;
@end

@implementation NSMethodSignature(NavigationMethodForwarding)

+ (id)_navigation_methodSignatureForEmptyMethod
{
  if (qword_1EB59BFD8 != -1) {
    dispatch_once(&qword_1EB59BFD8, &__block_literal_global_0);
  }
  v0 = (void *)_MergedGlobals_16;
  return v0;
}

@end
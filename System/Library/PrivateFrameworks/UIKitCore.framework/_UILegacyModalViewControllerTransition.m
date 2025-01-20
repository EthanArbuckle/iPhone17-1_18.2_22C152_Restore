@interface _UILegacyModalViewControllerTransition
+ (id)transitionWithStyle:(int64_t)a3;
- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3;
- (BOOL)_isSupportedGivenTraits:(id)a3;
- (void)_wasAssignedToViewController:(id)a3;
@end

@implementation _UILegacyModalViewControllerTransition

+ (id)transitionWithStyle:(int64_t)a3
{
  v4 = (void *)[objc_alloc((Class)a1) _init];
  v4[1] = a3;
  return v4;
}

- (void)_wasAssignedToViewController:(id)a3
{
}

- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3
{
  return 0;
}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  return 1;
}

@end
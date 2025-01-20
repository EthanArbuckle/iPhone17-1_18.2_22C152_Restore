@interface UIImageView(NUCrossFadeViewAnimatable)
- (uint64_t)nu_crossFadeViewClearVisibleState;
- (void)nu_crossFadeViewSetValue:()NUCrossFadeViewAnimatable;
@end

@implementation UIImageView(NUCrossFadeViewAnimatable)

- (void)nu_crossFadeViewSetValue:()NUCrossFadeViewAnimatable
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [a1 setImage:v4];
}

- (uint64_t)nu_crossFadeViewClearVisibleState
{
  return [a1 setImage:0];
}

@end
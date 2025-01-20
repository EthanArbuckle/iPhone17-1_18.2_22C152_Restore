@interface UIView(Utilities)
+ (uint64_t)ic_animateWithDuration:()Utilities animations:;
+ (uint64_t)ic_performWithoutAnimation:()Utilities;
+ (void)ic_animateWithDuration:()Utilities animations:completion:;
+ (void)ic_performWithoutAnimationOnMainThread:()Utilities;
- (double)ic_backingScaleFactor;
- (double)ic_hairlineWidth;
@end

@implementation UIView(Utilities)

- (double)ic_hairlineWidth
{
  objc_msgSend(a1, "ic_backingScaleFactor");
  return 1.0 / v1;
}

- (double)ic_backingScaleFactor
{
  double v1 = [a1 window];
  v2 = [v1 screen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  v5 = v4;

  [v5 scale];
  if (v6 >= 1.0) {
    double v7 = v6;
  }
  else {
    double v7 = 1.0;
  }

  return v7;
}

+ (uint64_t)ic_performWithoutAnimation:()Utilities
{
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:");
}

+ (void)ic_performWithoutAnimationOnMainThread:()Utilities
{
  id v4 = a3;
  id v3 = v4;
  performBlockOnMainThread();
}

+ (uint64_t)ic_animateWithDuration:()Utilities animations:
{
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:completion:", a3, 0);
}

+ (void)ic_animateWithDuration:()Utilities animations:completion:
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__UIView_Utilities__ic_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E5FD9DF0;
  id v11 = v7;
  id v9 = v7;
  [v8 animateWithDuration:a4 animations:v10 completion:a1];
}

@end
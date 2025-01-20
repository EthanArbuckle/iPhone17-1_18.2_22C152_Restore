@interface UIView(Private)
+ (uint64_t)smu_animateUsingSpringWithDuration:()Private delay:options:mass:stiffness:damping:initialVelocity:animations:;
+ (uint64_t)smu_coreAnimationDefaultCurve;
+ (uint64_t)smu_isInAnimationBlock;
+ (void)smu_animateUsingSpringWithTension:()Private friction:animations:completion:;
@end

@implementation UIView(Private)

+ (uint64_t)smu_isInAnimationBlock
{
  v0 = objc_opt_class();

  return [v0 _isInAnimationBlock];
}

+ (uint64_t)smu_coreAnimationDefaultCurve
{
  return 327680;
}

+ (uint64_t)smu_animateUsingSpringWithDuration:()Private delay:options:mass:stiffness:damping:initialVelocity:animations:
{
  return objc_msgSend(a1, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", a3, a4, 0);
}

+ (void)smu_animateUsingSpringWithTension:()Private friction:animations:completion:
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__UIView_Private__smu_animateUsingSpringWithTension_friction_animations_completion___block_invoke;
  v12[3] = &unk_264DBD008;
  id v13 = v10;
  id v11 = v10;
  [a1 _animateUsingSpringWithTension:0 friction:a5 interactive:v12 animations:a2 completion:a3];
}

@end
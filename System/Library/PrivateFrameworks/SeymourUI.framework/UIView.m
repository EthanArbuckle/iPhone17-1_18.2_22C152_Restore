@interface UIView
@end

@implementation UIView

uint64_t __84__UIView_Private__smu_animateUsingSpringWithTension_friction_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end
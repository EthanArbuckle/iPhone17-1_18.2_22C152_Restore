@interface UIDocumentCarouselViewAnimateWithTracking
@end

@implementation UIDocumentCarouselViewAnimateWithTracking

void ___UIDocumentCarouselViewAnimateWithTracking_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    +[UIView _trackVelocity:*(void *)(a1 + 32)];
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.55];
    [v3 setInertialTargetSmoothing:0.0];
    +[UIView _animateUsingSpringBehavior:v3 tracking:*(unsigned __int8 *)(a1 + 48) animations:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

@end
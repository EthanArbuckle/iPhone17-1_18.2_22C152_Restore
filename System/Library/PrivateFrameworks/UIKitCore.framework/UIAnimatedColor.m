@interface UIAnimatedColor
@end

@implementation UIAnimatedColor

void __37___UIAnimatedColor__patternCallbacks__block_invoke()
{
  LODWORD(xmmword_1EB25CE30) = 1;
  *((void *)&xmmword_1EB25CE30 + 1) = _patternCallback;
  qword_1EB25CE40 = (uint64_t)_releaseCallback;
}

uint64_t __39___UIAnimatedColor_initWithParentView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

void __55___UIAnimatedColor_initWithBounds_invalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentationValueChanged];
}

@end
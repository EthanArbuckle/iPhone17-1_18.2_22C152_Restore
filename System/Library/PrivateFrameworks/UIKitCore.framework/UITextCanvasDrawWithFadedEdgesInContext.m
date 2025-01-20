@interface UITextCanvasDrawWithFadedEdgesInContext
@end

@implementation UITextCanvasDrawWithFadedEdgesInContext

void ___UITextCanvasDrawWithFadedEdgesInContext_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DCA0]);
  *(_OWORD *)components = xmmword_186B9ABD8;
  long long v3 = unk_186B9ABE8;
  long long v1 = xmmword_186B89740;
  _UITextCanvasDrawWithFadedEdgesInContext_leftFadeGradient = (uint64_t)CGGradientCreateWithColorComponents(v0, components, (const CGFloat *)&v1, 2uLL);
  CGColorSpaceRelease(v0);
}

@end
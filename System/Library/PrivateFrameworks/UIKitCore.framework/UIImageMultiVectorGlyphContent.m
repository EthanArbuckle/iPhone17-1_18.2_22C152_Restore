@interface UIImageMultiVectorGlyphContent
@end

@implementation UIImageMultiVectorGlyphContent

uint64_t __42___UIImageMultiVectorGlyphContent_CGImage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 CGContext];
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 40);
  return objc_msgSend(v4, "_drawWithSize:scale:inContext:effect:", v3, 0, v7, v5, v6);
}

@end
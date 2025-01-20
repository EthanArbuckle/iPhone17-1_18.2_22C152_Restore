@interface UIDragPreviewBlockProvider
@end

@implementation UIDragPreviewBlockProvider

void __52___UIDragPreviewBlockProvider__createImageComponent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextTranslateCTM((CGContextRef)[v3 CGContext], -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  id v5 = [*(id *)(a1 + 32) layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

@end
@interface UIContextMenuAccessoryView
@end

@implementation UIContextMenuAccessoryView

uint64_t __51___UIContextMenuAccessoryView_setVisible_animated___block_invoke(uint64_t a1)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  if (*(unsigned char *)(a1 + 40))
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v3;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v7, 0.1, 0.1);
  }
  v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v7;
  return [v4 setTransform:&v6];
}

@end
@interface UIRectangularBoundingPath
@end

@implementation UIRectangularBoundingPath

void __50___UIRectangularBoundingPath__imageRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[UIColor whiteColor];
  [v3 setFill];

  objc_msgSend(v5, "fillRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = +[UIColor blackColor];
  [v4 setFill];

  objc_msgSend(v5, "fillRect:", *(double *)(*(void *)(a1 + 32) + 16), *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40));
}

@end
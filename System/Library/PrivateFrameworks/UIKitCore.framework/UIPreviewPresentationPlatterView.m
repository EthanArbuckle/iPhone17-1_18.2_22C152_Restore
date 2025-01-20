@interface UIPreviewPresentationPlatterView
@end

@implementation UIPreviewPresentationPlatterView

void __51___UIPreviewPresentationPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) contentTransformView];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

@end
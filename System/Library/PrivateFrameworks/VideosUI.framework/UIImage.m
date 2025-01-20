@interface UIImage
@end

@implementation UIImage

uint64_t __46__UIImage_VideosUI__vui_aspectFitImageOfSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __48__UIImage_VideosExtras__imageForPlaceholderURL___block_invoke()
{
  v0 = (void *)imageForPlaceholderURL____resourceNameMapping;
  imageForPlaceholderURL____resourceNameMapping = (uint64_t)&unk_1F3F3E800;
}

@end
@interface UIRenderViewImageAfterCommit
@end

@implementation UIRenderViewImageAfterCommit

uint64_t ___UIRenderViewImageAfterCommit_block_invoke_77(uint64_t a1)
{
  v2 = _UIRenderView(*(void **)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_460);
  if (v2)
  {
    v3 = v2;
    uint64_t CGImage = _UIRenderingBufferCreateCGImage(v2, *(void **)(a1 + 40));
    if (CGImage)
    {
      v5 = (CGImage *)CGImage;
      uint64_t v6 = +[UIImage imageWithCGImage:CGImage scale:0 orientation:_UIRenderingBufferGetScale(v3)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      CGImageRelease(v5);
    }
    CFRelease(v3);
  }
  v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v9();
}

@end
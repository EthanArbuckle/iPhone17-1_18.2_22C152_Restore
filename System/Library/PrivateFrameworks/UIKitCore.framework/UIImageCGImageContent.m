@interface UIImageCGImageContent
@end

@implementation UIImageCGImageContent

uint64_t __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) contentWithCGImage:a2];
    v4 = -[_UIImageCGImageContent _contentWithCARenderRef](v3);

    +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageContent, v4, *(void **)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = AsyncFallbackPreparationQueue();
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 48));
  }

  v5 = *(void **)(a1 + 32);
  objc_setAssociatedObject(v5, @"com.apple.UIKit.active-decompressor", 0, (void *)0x301);
}

void __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke(uint64_t a1, CGContextRef c)
{
  v2.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v2.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v2.size.width = *(CGFloat *)(a1 + 32);
  v2.size.height = *(CGFloat *)(a1 + 40);
  CGContextDrawImage(c, v2, *(CGImageRef *)(a1 + 48));
}

uint64_t __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void __56___UIImageCGImageContent__provideCGImageWithSize_scale___block_invoke(double *a1, void *a2)
{
  CGFloat v3 = *MEMORY[0x1E4F1DAD8];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat v5 = a1[5];
  CGFloat v6 = a1[6];
  id v9 = a2;
  v7 = (CGContext *)[v9 CGContext];
  v8 = (CGImage *)atomic_load((unint64_t *)(*((void *)a1 + 4) + 40));
  v11.origin.x = v3;
  v11.origin.y = v4;
  v11.size.width = v5;
  v11.size.height = v6;
  CGContextDrawImage(v7, v11, v8);
}

void __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  CGRect v2 = -[_UIImageCGImageContent _contentWithCARenderRef](*(void **)(a1 + 32));
  self;
  CGFloat v3 = _UIImageDecompressionCompletionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E52E3298;
  uint64_t v4 = *(void *)(a1 + 32);
  CGFloat v5 = *(void **)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageContent, *(void **)(a1 + 32), *(void **)(a1 + 40));
  CGRect v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __72___UIImageCGImageContent_optimizeContentForImageSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentOptimizedForImageSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end
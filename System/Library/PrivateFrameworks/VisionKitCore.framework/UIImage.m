@interface UIImage
@end

@implementation UIImage

void __44__UIImage_Utilities__vk_imageWithTint_size___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextSetBlendMode(v3, kCGBlendModeNormal);
  [*(id *)(a1 + 32) setFill];
  CGContextFillRect(v3, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(v3, kCGBlendModeDestinationIn);
  v4 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "vk_cgImage");
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  CGContextDrawImage(v3, *(CGRect *)&v5, v4);
}

uint64_t __51__UIImage_Utilities__vk_scaledImageWithSize_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __51__UIImage_Utilities__vk_imageDataWithRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = mmap(0, [v3 length], 3, 4097, -1, 0);
  id v5 = v3;
  memcpy(v4, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  size_t v6 = [v5 length];

  dispatch_data_t v7 = dispatch_data_create(v4, v6, 0, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)vk_decodeWithCompletion__drawingDecodingOperationQueue;
  vk_decodeWithCompletion__drawingDecodingOperationQueue = (uint64_t)v0;

  [(id)vk_decodeWithCompletion__drawingDecodingOperationQueue setName:@"com.apple.notes.drawing-decoding-queue"];
  v2 = (void *)vk_decodeWithCompletion__drawingDecodingOperationQueue;
  return [v2 setMaxConcurrentOperationCount:2];
}

void __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "vk_decodeInBackground");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke_3;
  v5[3] = &unk_1E6BF1330;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __46__UIImage_Utilities__vk_decodeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __43__UIImage_Utilities__vk_decodeInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
}

@end
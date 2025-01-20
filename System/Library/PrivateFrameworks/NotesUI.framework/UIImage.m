@interface UIImage
@end

@implementation UIImage

uint64_t __43__UIImage_Utilities__ic_decodeInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
}

uint64_t __53__UIImage_Utilities__ic_symbolsNeedingPrivateCatalog__block_invoke()
{
  ic_symbolsNeedingPrivateCatalog_symbolsNeedingPrivateCatalog = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"quicknote", @"calculator", @"calculator.fill", @"apple.math.notes", @"apple.writing.tools", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t __46__UIImage_Utilities__ic_symbolsNeedingUIAsset__block_invoke()
{
  ic_symbolsNeedingUIAsset_symbolsNeedingUIAsset = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"thumbnailbar.rectangle", @"math.operators", @"surprisebox", 0);
  return MEMORY[0x1F41817F8]();
}

void __44__UIImage_Utilities__ic_imageWithTint_size___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextSetBlendMode(v3, kCGBlendModeNormal);
  [*(id *)(a1 + 32) setFill];
  CGContextFillRect(v3, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(v3, kCGBlendModeDestinationIn);
  v4 = (CGImage *)objc_msgSend(*(id *)(a1 + 40), "ic_CGImage");
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  CGContextDrawImage(v3, *(CGRect *)&v5, v4);
}

uint64_t __51__UIImage_Utilities__ic_scaledImageWithSize_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __50__UIImage_Utilities__ic_imageWithBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 set];
  [*(id *)(a1 + 40) size];
  double v6 = v5;
  [*(id *)(a1 + 40) size];
  objc_msgSend(v4, "fillRect:", 0.0, 0.0, v6, v7);

  [*(id *)(a1 + 40) size];
  double v9 = v8;
  [*(id *)(a1 + 40) size];
  v11 = *(void **)(a1 + 40);
  return objc_msgSend(v11, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v9, v10, 1.0);
}

uint64_t __76__UIImage_Utilities__ic_imageCenteredWithBackgroundColor_size_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB14C0];
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = a2;
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v4, v5, v6);
  id v8 = objc_claimAutoreleasedReturnValue();
  double v9 = (const CGPath *)[v8 CGPath];

  CGContextAddPath((CGContextRef)[v7 CGContext], v9);
  CGContextSetFillColorWithColor((CGContextRef)[v7 CGContext], (CGColorRef)objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  CGContextClosePath((CGContextRef)[v7 CGContext]);
  double v10 = (CGContext *)[v7 CGContext];

  CGContextFillPath(v10);
  v11 = *(void **)(a1 + 40);
  double v12 = *(double *)(a1 + 48) * 0.5;
  [v11 size];
  double v14 = v12 - v13 * 0.5;
  double v15 = *(double *)(a1 + 56) * 0.5;
  [*(id *)(a1 + 40) size];
  double v17 = v15 - v16 * 0.5;
  return objc_msgSend(v11, "drawAtPoint:", v14, v17);
}

uint64_t __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)ic_decodeWithCompletion__drawingDecodingOperationQueue;
  ic_decodeWithCompletion__drawingDecodingOperationQueue = (uint64_t)v0;

  [(id)ic_decodeWithCompletion__drawingDecodingOperationQueue setName:@"com.apple.notes.drawing-decoding-queue"];
  v2 = (void *)ic_decodeWithCompletion__drawingDecodingOperationQueue;
  return [v2 setMaxConcurrentOperationCount:2];
}

void __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_decodeInBackground");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_3;
  v5[3] = &unk_1E5FD8F20;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end
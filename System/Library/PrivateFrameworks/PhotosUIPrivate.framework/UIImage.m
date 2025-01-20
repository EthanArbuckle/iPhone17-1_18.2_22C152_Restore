@interface UIImage
@end

@implementation UIImage

void __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
  {
    [*(id *)(a1 + 40) size];
    CGFloat width = v20.width;
    CGFloat height = v20.height;
    CGFloat v4 = *(double *)(a1 + 72) + v20.width * -0.5;
    CGFloat v5 = *(double *)(a1 + 80) + v20.height * -0.5;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    v6 = *(void **)(a1 + 48);
    v22.origin.x = v4;
    v22.origin.y = v5;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat v7 = -CGRectGetMinX(v22);
    v23.origin.x = v4;
    v23.origin.y = v5;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat v8 = -CGRectGetMinY(v23);
    CGRect v24 = CGRectOffset(*(CGRect *)(a1 + 88), v7, v8);
    objc_msgSend(v6, "px_drawInRect:withContentMode:", *(void *)(a1 + 120), v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
    {
      v10 = [v9 _applyBackdropViewSettings:pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings];
      if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
      {
        v11 = [v9 _applyBackdropViewSettings:pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings];
        if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
        {
          [v10 size];
          UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
          double v12 = *MEMORY[0x1E4F1DAD8];
          double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], v13);
          objc_msgSend(*(id *)(a1 + 56), "drawAtPoint:blendMode:alpha:", 22, v12, v13, 1.0);
          objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 24, v12, v13, 1.0);
          objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
          v14 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          if (*(unsigned char *)(a1 + 128))
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_3;
            v17[3] = &unk_1E5F2EA60;
            id v15 = *(id *)(a1 + 64);
            id v18 = v14;
            id v19 = v15;
            id v16 = v14;
            dispatch_async(MEMORY[0x1E4F14428], v17);
          }
          else
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
        }
      }
    }
  }
}

uint64_t __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  v3 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings = v2;

  [(id)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings setColorTintAlpha:0.0];
  CGFloat v4 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings;

  return [v4 setGrayscaleTintAlpha:0.0];
}

uint64_t __63__UIImage_PhotosUI__pu_centeredImage_withBackgroundColor_size___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  CGFloat v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 set];
  objc_msgSend(v8, "fillRect:", v3, v4, v5, v6);

  [*(id *)(a1 + 40) size];
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  v9 = *(void **)(a1 + 40);

  return objc_msgSend(v9, "drawInRect:");
}

void __119__UIImage_PhotosUI__pu_imageWithIconImage_iconImageColor_text_font_textColor_fillColor_strokeColor_cornerRadius_inset___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  double v3 = [v12 format];
  [v3 scale];
  if (v4 <= 1.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = 1.0 / v4;
  }
  double v6 = (void *)MEMORY[0x1E4FB14C0];
  CGRect v14 = CGRectInset(*(CGRect *)(a1 + 80), v5 * 0.5, v5 * 0.5);
  CGFloat v7 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height, *(double *)(a1 + 112));
  [v7 setLineWidth:v5];
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 setFill];
    [v7 fill];
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    [v9 setStroke];
    [v7 stroke];
  }
  if (*(void *)(a1 + 48)) {
    CGContextSetFillColorWithColor((CGContextRef)[v12 CGContext], (CGColorRef)objc_msgSend(*(id *)(a1 + 48), "CGColor"));
  }
  double v10 = *(double *)(a1 + 120);
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 56), "drawAtPoint:", v10, CGRectGetMidY(*(CGRect *)(a1 + 80)) - *(double *)(a1 + 144) * 0.5);
    double v10 = v10 + *(double *)(a1 + 152) + *(double *)(a1 + 136);
    double v11 = *(double *)(a1 + 104) * 0.5 - *(double *)(a1 + 168) * 0.5;
  }
  else
  {
    double v11 = *(double *)(a1 + 128);
  }
  objc_msgSend(*(id *)(a1 + 64), "drawAtPoint:withAttributes:", *(void *)(a1 + 72), v10, v11);
}

@end
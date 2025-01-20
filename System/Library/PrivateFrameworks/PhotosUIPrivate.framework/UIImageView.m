@interface UIImageView
@end

@implementation UIImageView

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
  {
    [(id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask size];
    CGFloat width = v20.width;
    CGFloat height = v20.height;
    CGFloat v4 = *(double *)(a1 + 56) + v20.width * -0.5;
    CGFloat v5 = *(double *)(a1 + 64) + v20.height * -0.5;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    v6 = *(void **)(a1 + 40);
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
    CGRect v24 = CGRectOffset(*(CGRect *)(a1 + 72), v7, v8);
    objc_msgSend(v6, "px_drawInRect:withContentMode:", *(void *)(a1 + 104), v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
    {
      v10 = [v9 _applyBackdropViewSettings:pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings];
      if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
      {
        v11 = [v9 _applyBackdropViewSettings:pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings];
        if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
        {
          [v10 size];
          UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
          double v12 = *MEMORY[0x1E4F1DAD8];
          double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], v13);
          objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask, "drawAtPoint:blendMode:alpha:", 22, v12, v13, 1.0);
          objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 24, v12, v13, 1.0);
          objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
          v14 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          if (*(unsigned char *)(a1 + 112))
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_4;
            v17[3] = &unk_1E5F2EA60;
            id v15 = *(id *)(a1 + 48);
            id v18 = v14;
            id v19 = v15;
            id v16 = v14;
            dispatch_async(MEMORY[0x1E4F14428], v17);
          }
          else
          {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          }
        }
      }
    }
  }
}

uint64_t __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  v3 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings = v2;

  [(id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings setColorTintAlpha:0.0];
  [(id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings setGrayscaleTintAlpha:0.0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayBackgroundMask");
  CGFloat v5 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask = v4;

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayGlyphMask");
  CGFloat v7 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask = v6;

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayApproximation");
  v9 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage = v8;
}

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("pu_extractPlayOverlayBackgroundImageFromCenter", v2);
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue = (uint64_t)v0;
}

@end
@interface UIImage
@end

@implementation UIImage

uint64_t __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v2 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 1);
    objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 0);
    objc_claimAutoreleasedReturnValue();
    [v2 size];
    UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
    PXSizeScale();
  }
  return result;
}

uint64_t __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  v1 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__backgroundBlurSettings;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__backgroundBlurSettings = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:2010 graphicsQuality:100];
  CGSize v3 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings = v2;

  [(id)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings setColorTintAlpha:0.0];
  v4 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings;
  return [v4 setGrayscaleTintAlpha:0.0];
}

void __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("px_extractPlayOverlayBackgroundImageFromLocation", v2);
  v1 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue = (uint64_t)v0;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 0, 0.959999979, 0.959999979, 0.300000012);
  uint64_t v2 = (void *)px_playOverlayImage__normalButtonImage;
  px_playOverlayImage__normalButtonImage = v1;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 0, 0.959999979, 0.959999979, 0.5);
  uint64_t v2 = (void *)px_playOverlayImage__highlightedButtonImage;
  px_playOverlayImage__highlightedButtonImage = v1;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 5, 0.959999979, 0.959999979, 0.300000012);
  uint64_t v2 = (void *)px_playOverlayImage__normalButtonImage_59;
  px_playOverlayImage__normalButtonImage_59 = v1;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 5, 0.959999979, 0.959999979, 0.5);
  uint64_t v2 = (void *)px_playOverlayImage__highlightedButtonImage_61;
  px_playOverlayImage__highlightedButtonImage_61 = v1;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_7()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPauseVideoOverlayApproximation");
  uint64_t v1 = (void *)px_playOverlayImage__approximationImage_52;
  px_playOverlayImage__approximationImage_52 = v0;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_6()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPauseVideoOverlayGlyphMask");
  uint64_t v1 = (void *)px_playOverlayImage__overlayGlyphMask_45;
  px_playOverlayImage__overlayGlyphMask_45 = v0;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_3()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayApproximation");
  uint64_t v1 = (void *)px_playOverlayImage__approximationImage;
  px_playOverlayImage__approximationImage = v0;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayBackgroundMask");
  uint64_t v1 = (void *)px_playOverlayImage__overlayBackgroundMask;
  px_playOverlayImage__overlayBackgroundMask = v0;
}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayGlyphMask");
  uint64_t v1 = (void *)px_playOverlayImage__overlayGlyphMask;
  px_playOverlayImage__overlayGlyphMask = v0;
}

@end
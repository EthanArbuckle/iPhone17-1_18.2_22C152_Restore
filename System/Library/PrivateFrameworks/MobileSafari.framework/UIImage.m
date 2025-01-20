@interface UIImage
@end

@implementation UIImage

uint64_t __92__UIImage_MobileSafariFrameworkExtras__sf_registerFaviconForDarkUserInterfaceStyleWithSize___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 set];

  v3 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), 3.0);
  [v3 fill];

  v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);

  return objc_msgSend(v4, "drawInRect:", v5, v6, v7, v8);
}

void __104__UIImage_MobileSafariFrameworkExtras__sf_chicletStyleImageWithImage_backgroundColor_size_cornerRadius___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 addClip];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  double v5 = [v3 imageWithTintColor:v4 renderingMode:1];

  [v5 size];
  double v8 = _SFCGRectOfSizeAlignedWithinRect(0, 0, v6, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  [v5 drawInRect:_SFRoundRectToPixels(v8)];
}

@end
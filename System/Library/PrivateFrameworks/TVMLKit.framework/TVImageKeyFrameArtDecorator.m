@interface TVImageKeyFrameArtDecorator
@end

@implementation TVImageKeyFrameArtDecorator

void __69___TVImageKeyFrameArtDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  v23[3] = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v3 = *(id *)(a1 + 40);
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _imageFixedForRotation:*(void *)(a1 + 48)];

    id v3 = (id)v4;
  }
  objc_msgSend(v3, "drawInRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), ceil(*(double *)(a1 + 80) * (*(double *)(a1 + 88) / *(double *)(a1 + 96))));
  double v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(a1 + 80) + -75.0;
  id v7 = v3;
  v8 = (CGImage *)[v7 CGImage];
  v24.origin.x = 0.0;
  v24.origin.y = v6;
  v24.size.width = v5;
  v24.size.height = 75.0;
  v9 = CGImageCreateWithImageInRect(v8, v24);
  v10 = [MEMORY[0x263F1C6B0] imageWithCGImage:v9];
  CGImageRelease(v9);
  v11 = [MEMORY[0x263F1C550] colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:0.2];
  v12 = _TVBlurredImageWithOptionsAndOverlayColorForImage(v10, 13, v11, v5, 75.0, 40.0);

  objc_msgSend(v12, "drawInRect:", 0.0, v6, v5, 75.0);
  if ([*(id *)(*(void *)(a1 + 32) + 120) length])
  {
    double v13 = *(double *)(a1 + 80) + -75.0 + 15.0;
    double v14 = *(double *)(a1 + 72) + -15.0 + -15.0;
    v15 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v16 = [MEMORY[0x263F1C358] defaultParagraphStyle];
    v17 = (void *)[v16 mutableCopy];

    [v17 setAlignment:0];
    uint64_t v18 = *MEMORY[0x263F1C238];
    v23[0] = v15;
    uint64_t v19 = *MEMORY[0x263F1C240];
    v22[0] = v18;
    v22[1] = v19;
    v20 = [MEMORY[0x263F1C550] whiteColor];
    v22[2] = *MEMORY[0x263F1C268];
    v23[1] = v20;
    v23[2] = v17;
    v21 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "drawWithRect:options:attributes:context:", 33, v21, 0, 15.0, v13, v14, 45.0);
  }
}

@end
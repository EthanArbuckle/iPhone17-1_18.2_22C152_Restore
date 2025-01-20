@interface TVImage16x9Decorator
@end

@implementation TVImage16x9Decorator

void __62___TVImage16x9Decorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  v23[3] = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = [MEMORY[0x263F1C550] colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:0.2];
  v4 = _TVBlurredImageWithOptionsAndOverlayColorForImage(*(void **)(a1 + 40), 13, v3, *(double *)(a1 + 72), *(double *)(a1 + 80), 150.0);
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v5 = *(id *)(a1 + 40);
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _imageFixedForRotation:*(void *)(a1 + 48)];

    id v5 = (id)v6;
  }
  double v7 = *(double *)(a1 + 80) + -20.0 + -20.0;
  double v8 = ceil(v7 * (*(double *)(a1 + 88) / *(double *)(a1 + 96)));
  objc_msgSend(v5, "drawInRect:", 20.0, 20.0, v8, v7);
  if ([*(id *)(*(void *)(a1 + 32) + 120) length])
  {
    v24.origin.x = 20.0;
    v24.origin.y = 20.0;
    v24.size.width = v8;
    v24.size.height = v7;
    double v9 = CGRectGetMaxX(v24) + 15.0;
    double v10 = *(double *)(a1 + 72) + -15.0 + -15.0;
    v25.origin.x = 20.0;
    v25.origin.y = 20.0;
    v25.size.width = v8;
    v25.size.height = v7;
    double v11 = v10 - CGRectGetMaxX(v25);
    double v12 = *(double *)(a1 + 80) + -15.0 + -15.0;
    v13 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v14 = [MEMORY[0x263F1C358] defaultParagraphStyle];
    v15 = (void *)[v14 mutableCopy];

    [v15 setAlignment:0];
    uint64_t v16 = *MEMORY[0x263F1C238];
    v23[0] = v13;
    uint64_t v17 = *MEMORY[0x263F1C240];
    v22[0] = v16;
    v22[1] = v17;
    v18 = [MEMORY[0x263F1C550] whiteColor];
    v22[2] = *MEMORY[0x263F1C268];
    v23[1] = v18;
    v23[2] = v15;
    v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "boundingRectWithSize:options:attributes:context:", 33, v19, 0, v11, v12);
    if (v12 <= v20) {
      double v21 = 15.0;
    }
    else {
      double v21 = (v12 - v20) * 0.5;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "drawWithRect:options:attributes:context:", 33, v19, 0, v9, v21, v11, v12);
  }
}

@end
@interface TVMonogramInitialsSilhouetteImageGenerator
@end

@implementation TVMonogramInitialsSilhouetteImageGenerator

void __76___TVMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke(uint64_t a1, void *a2)
{
  v42[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    [*(id *)(a1 + 32) setFill];
    UIRectFill(*(CGRect *)(a1 + 72));
  }
  else
  {
    double v5 = *(double *)(a1 + 72);
    double v6 = *(double *)(a1 + 80);
    double v7 = *(double *)(a1 + 88);
    double v8 = *(double *)(a1 + 96);
    if (fabs(*(double *)(a1 + 56) * 0.5) == v4) {
      objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v5, v6, v7, v8);
    }
    else {
    v9 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v5, v6, v7, v8);
    }
    [v9 addClip];
    [*(id *)(a1 + 32) set];
    [v9 fill];
  }
  v10 = [*(id *)(a1 + 40) font];
  v11 = [*(id *)(a1 + 40) text];
  if ([v11 length])
  {
    v12 = [*(id *)(a1 + 40) text];
  }
  else
  {
    v13 = objc_opt_class();
    v14 = [*(id *)(a1 + 40) firstName];
    v15 = [*(id *)(a1 + 40) lastName];
    v12 = [v13 _initialsForFirstName:v14 lastName:v15];
  }
  uint64_t v16 = [v12 length];
  v17 = *(void **)(a1 + 40);
  if (v16)
  {
    v18 = [v17 textColor];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x263F1C550] colorWithRed:0.941176471 green:0.941176471 blue:0.956862745 alpha:1.0];
    }
    v23 = v20;

    id v24 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v25 = *MEMORY[0x263F1C240];
    v41[0] = *MEMORY[0x263F1C238];
    v41[1] = v25;
    v42[0] = v10;
    v42[1] = v23;
    v26 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    v27 = (void *)[v24 initWithString:v12 attributes:v26];

    [v27 size];
    UIRectCenteredXInRect();
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v34 = *(double *)(a1 + 96);
    [v10 capHeight];
    double v36 = (v34 - v35) * -0.5;
    double v37 = *(double *)(a1 + 96);
    [v10 pointSize];
    double v39 = v37 - v38 + v36;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    objc_msgSend(v27, "drawInRect:", v29, v39, v31, v33);

    goto LABEL_17;
  }
  if ([v17 shouldFallBackToSilhouette])
  {
    v21 = (void *)MEMORY[0x263F1C6B0];
    v22 = +[TVMLUtilities TVMLKitBundle];
    v23 = [v21 imageNamed:@"monogram-silhouette" inBundle:v22];

    objc_msgSend(v23, "drawInRect:blendMode:alpha:", 22, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), 1.0);
LABEL_17:
  }
}

void __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled] & 1) == 0)
  {
    v2 = +[_TVMonogramInitialsSilhouetteImageGenerator monogramImageWithDescription:*(void *)(a1 + 32)];
    id v3 = [TVImage alloc];
    id v4 = v2;
    double v5 = -[TVImage initWithCGImageRef:preserveAlpha:](v3, "initWithCGImageRef:preserveAlpha:", [v4 CGImage], 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    block[3] = &unk_264BA8F58;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v6 = (id)v8;
    long long v11 = v8;
    v10 = v5;
    double v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

@end
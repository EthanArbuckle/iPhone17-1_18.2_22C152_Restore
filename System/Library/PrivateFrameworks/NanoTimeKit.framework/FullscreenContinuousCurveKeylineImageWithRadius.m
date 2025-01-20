@interface FullscreenContinuousCurveKeylineImageWithRadius
@end

@implementation FullscreenContinuousCurveKeylineImageWithRadius

id ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke(uint64_t a1)
{
  NTKFaceFullscreenKeylineFrame();
  double v3 = v2;
  double v5 = v4;
  double v6 = *(double *)(a1 + 32);
  double v7 = v6 * NTKFaceLibraryPageWidthForZoomLevel(1) / v2;
  v8 = [MEMORY[0x1E4FB17E0] defaultFormat];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v8, v3, v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke_2;
  v12[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v12[4] = v7;
  v10 = [v9 imageWithActions:v12];

  return v10;
}

void ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 format];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGRect v16 = CGRectInset(v15, 0.75, 0.75);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, *(double *)(a1 + 32));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [v12 set];

  [v13 setLineWidth:1.5];
  [v13 stroke];
}

@end
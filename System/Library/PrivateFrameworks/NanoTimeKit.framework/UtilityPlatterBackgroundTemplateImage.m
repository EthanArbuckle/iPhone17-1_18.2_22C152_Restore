@interface UtilityPlatterBackgroundTemplateImage
@end

@implementation UtilityPlatterBackgroundTemplateImage

void ___UtilityPlatterBackgroundTemplateImage_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x1C1875BE0]();
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  _LayoutConstants_49(v2, v20);
  double v5 = v21;
  v6 = [MEMORY[0x1E4FB17E0] preferredFormat];
  [v2 screenScale];
  objc_msgSend(v6, "setScale:");
  [v6 setPreferredRange:0];
  [v6 setOpaque:0];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v6, v5 + v5, v5 + v5);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___UtilityPlatterBackgroundTemplateImage_block_invoke_2;
  v13[3] = &unk_1E62C9368;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  id v14 = v4;
  double v17 = v5 + v5;
  double v18 = v5 + v5;
  double v19 = v5;
  id v8 = v4;
  v9 = [v7 imageWithActions:v13];
  v10 = [v9 imageWithRenderingMode:2];

  uint64_t v11 = objc_msgSend(v10, "resizableImageWithCapInsets:", v5, v5, v5, v5);
  v12 = (void *)_UtilityPlatterBackgroundTemplateImage_backgroundImage;
  _UtilityPlatterBackgroundTemplateImage_backgroundImage = v11;
}

void ___UtilityPlatterBackgroundTemplateImage_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) set];
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 fill];
}

@end
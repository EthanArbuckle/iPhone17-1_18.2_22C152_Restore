@interface CUINamedImage(UIKitAdditions)
- UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:optionalVectorImage:;
- (id)configuration;
@end

@implementation CUINamedImage(UIKitAdditions)

- UIImageWithAsset:()UIKitAdditions configuration:flippedHorizontally:optionalVectorImage:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  int v13 = [a1 exifOrientation];
  if ((unint64_t)(v13 - 1) >= 8) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = (0x27365140u >> (4 * v13 - 4)) & 7;
  }
  [a1 scale];
  if (v11)
  {
    v16 = [_UIImageCUIVectorImageContent alloc];
    uint64_t v17 = [a1 image];
    [a1 scale];
    v18 = -[_UIImageCUIVectorImageContent initWithCGImage:CUIVectorImage:scale:](v16, "initWithCGImage:CUIVectorImage:scale:", v17, v11);
  }
  else
  {
    v18 = -[_UIImageCGImageContent initWithCGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImage:scale:", [a1 image], v15);
  }
  v19 = v18;
  v20 = [[UIImage alloc] _initWithContent:v18 orientation:v14];
  [v20 _setConfiguration:v12];

  if (a5)
  {
    [v20 _horizontallyFlipImageOrientation];
    v20[26] |= 0x20u;
  }
  if ([a1 hasSliceInformation])
  {
    [a1 edgeInsets];
    uint64_t v25 = objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", objc_msgSend(a1, "resizingMode") != 0, v21, v22, v23, v24);

    v20 = (_DWORD *)v25;
  }
  if (v10)
  {
    [v20 _setNamed:1];
    [v20 _setImageAsset:v10];
  }
  [a1 alignmentEdgeInsets];
  if (v29 != 0.0 || v26 != 0.0 || v28 != 0.0 || v27 != 0.0) {
    objc_msgSend(v20, "_setAlignmentRectInsets:");
  }
  uint64_t v30 = [a1 templateRenderingMode];
  if (v30 == 1)
  {
    uint64_t v31 = 2;
    goto LABEL_23;
  }
  if (!v30 && dyld_program_sdk_at_least())
  {
    uint64_t v31 = 1;
LABEL_23:
    [v20 _setRenderingMode:v31];
  }

  return v20;
}

- (id)configuration
{
  v2 = [a1 baseKey];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __46__CUINamedImage_UIKitAdditions__configuration__block_invoke;
  id v11 = &unk_1E52F18D0;
  id v12 = v2;
  int v13 = a1;
  id v3 = v2;
  v4 = +[UITraitCollection traitCollectionWithTraits:&v8];
  v5 = v4;
  if (v4) {
    v4 = objc_msgSend(v4, "imageConfiguration", v8, v9, v10, v11, v12, v13);
  }
  id v6 = v4;

  return v6;
}

@end
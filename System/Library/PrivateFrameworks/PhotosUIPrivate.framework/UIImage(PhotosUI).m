@interface UIImage(PhotosUI)
+ (id)pu_PhotosUIImageNamed:()PhotosUI;
+ (id)pu_centeredImage:()PhotosUI withBackgroundColor:size:;
+ (id)pu_imageFromView:()PhotosUI isOpaque:;
+ (id)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:;
+ (uint64_t)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:;
+ (uint64_t)pu_imageWithText:()PhotosUI font:textColor:fillColor:strokeColor:cornerRadius:;
- (PUImageExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI inRect:contentMode:asynchronously:handler:;
- (id)pu_overlayedImageWithColor:()PhotosUI;
- (id)pu_tintedImageWithColor:()PhotosUI;
@end

@implementation UIImage(PhotosUI)

- (PUImageExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI inRect:contentMode:asynchronously:handler:
{
  id v21 = a5;
  if (!v21)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"UIImage+PhotosUI.m", 137, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v22 = objc_alloc_init(PUImageExtraction);
  if (pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__onceToken != -1) {
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__onceToken, &__block_literal_global_103759);
  }
  v23 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayBackgroundMask");
  v24 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayGlyphMask");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_2;
  aBlock[3] = &unk_1E5F2EA38;
  v25 = v22;
  v37 = v25;
  id v26 = v23;
  double v42 = a6;
  double v43 = a7;
  id v38 = v26;
  uint64_t v39 = a1;
  double v44 = a8;
  double v45 = a9;
  double v46 = a10;
  double v47 = a11;
  uint64_t v48 = a3;
  id v27 = v24;
  id v40 = v27;
  char v49 = a4;
  id v28 = v21;
  id v41 = v28;
  v29 = _Block_copy(aBlock);
  v30 = v29;
  if (a4)
  {
    v31 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXPlayVideoOverlayApproximation");
    (*((void (**)(id, void *))v28 + 2))(v28, v31);
    v32 = dispatch_get_global_queue(2, 0);
    dispatch_async(v32, v30);
  }
  else
  {
    (*((void (**)(void *))v29 + 2))(v29);
  }
  v33 = v25;

  return v33;
}

- (id)pu_overlayedImageWithColor:()PhotosUI
{
  CGFloat v4 = *MEMORY[0x1E4F1DB28];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v6 = a3;
  [a1 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [a1 scale];
  CGFloat v12 = v11;
  v16.width = v8;
  v16.height = v10;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
  [v6 setFill];

  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v8;
  v17.size.height = v10;
  UIRectFillUsingBlendMode(v17, kCGBlendModeNormal);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)pu_tintedImageWithColor:()PhotosUI
{
  CGFloat v4 = *MEMORY[0x1E4F1DB28];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v6 = a3;
  [a1 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [a1 scale];
  CGFloat v12 = v11;
  v16.width = v8;
  v16.height = v10;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
  [v6 setFill];

  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v8;
  v17.size.height = v10;
  UIRectFillUsingBlendMode(v17, kCGBlendModeSourceIn);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

+ (id)pu_PhotosUIImageNamed:()PhotosUI
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  CGFloat v5 = objc_msgSend(v3, "pu_PhotosUIFrameworkBundle");
  id v6 = [MEMORY[0x1E4FB1818] imageNamed:v4 inBundle:v5];

  return v6;
}

+ (id)pu_centeredImage:()PhotosUI withBackgroundColor:size:
{
  id v9 = a5;
  id v10 = a6;
  double v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a1, a2);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__UIImage_PhotosUI__pu_centeredImage_withBackgroundColor_size___block_invoke;
  v16[3] = &unk_1E5F2EA10;
  double v19 = a1;
  double v20 = a2;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  v14 = [v11 imageWithActions:v16];

  return v14;
}

+ (id)pu_imageFromView:()PhotosUI isOpaque:
{
  id v5 = a3;
  [v5 bounds];
  v12.width = v6;
  v12.height = v7;
  UIGraphicsBeginImageContextWithOptions(v12, a4, 0.0);
  CGFloat v8 = [v5 layer];

  [v8 renderInContext:UIGraphicsGetCurrentContext()];
  id v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

+ (uint64_t)pu_imageWithText:()PhotosUI font:textColor:fillColor:strokeColor:cornerRadius:
{
  return objc_msgSend(a1, "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:", 0, 0, a3, a4, a5, a6, a7);
}

+ (uint64_t)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:
{
  return objc_msgSend(a1, "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", a3, a3 + 2.0, a3);
}

+ (id)pu_imageWithIconImage:()PhotosUI iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:
{
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  v24 = &stru_1F06BE7B8;
  if (a8) {
    v24 = a8;
  }
  v25 = v24;
  id v26 = a10;
  if (!v21)
  {
    id v27 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] systemFontSize];
    objc_msgSend(v27, "systemFontOfSize:");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v26, *MEMORY[0x1E4FB0700], v21, *MEMORY[0x1E4FB06F8], 0);

  [(__CFString *)v25 sizeWithAttributes:v28];
  double v30 = v29;
  double v32 = v31;
  [v19 size];
  double v34 = v33;
  double v36 = v35;
  double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v38 = v33 == *MEMORY[0x1E4F1DB30];
  if (v36 != v37) {
    BOOL v38 = 0;
  }
  BOOL v39 = v30 == *MEMORY[0x1E4F1DB30];
  if (v32 != v37) {
    BOOL v39 = 0;
  }
  if (v38 || v39) {
    double v40 = 0.0;
  }
  else {
    double v40 = 3.0;
  }
  if (v33 >= v32) {
    double v41 = v33;
  }
  else {
    double v41 = v32;
  }
  double v42 = v30 + v33 + v40 + a2 * 2.0;
  double v54 = a2;
  double v43 = a3;
  double v44 = v41 + a3 * 2.0;
  double v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v42, v44);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __119__UIImage_PhotosUI__pu_imageWithIconImage_iconImageColor_text_font_textColor_fillColor_strokeColor_cornerRadius_inset___block_invoke;
  v56[3] = &unk_1E5F2E9E8;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  double v65 = v42;
  double v66 = v44;
  id v57 = v22;
  id v58 = v23;
  double v67 = a1;
  double v68 = v54;
  id v59 = v20;
  id v60 = v19;
  double v69 = v43;
  double v70 = v34;
  double v71 = v36;
  double v72 = v40;
  double v73 = v30;
  double v74 = v32;
  v61 = v25;
  id v62 = v28;
  id v46 = v28;
  double v47 = v25;
  id v48 = v19;
  id v49 = v20;
  id v50 = v23;
  id v51 = v22;
  v52 = [v45 imageWithActions:v56];

  return v52;
}

@end
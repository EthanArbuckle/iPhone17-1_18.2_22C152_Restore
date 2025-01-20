@interface VUIGraphicsImageRenderer
+ (id)_imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5;
+ (id)decodedImage:(id)a3 opaque:(BOOL)a4;
+ (id)formatWithCGImage:(CGImage *)a3;
+ (id)formatWithCGImage:(CGImage *)a3 preferredFormat:(id)a4;
+ (id)formatWithUIImage:(id)a3;
+ (id)formatWithUIImage:(id)a3 preferredFormat:(id)a4;
+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5;
+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5;
+ (id)preferredFormat;
+ (void)SVGImagesWithDataDescriptors:(id)a3 format:(id)a4 completion:(id)a5;
@end

@implementation VUIGraphicsImageRenderer

void __57__VUIGraphicsImageRenderer_imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextSetInterpolationQuality((CGContextRef)[v3 CGContext], kCGInterpolationHigh);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__VUIGraphicsImageRenderer__imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (CGContext *)[v4 CGContext];
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__VUIGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke(uint64_t a1, void *a2)
{
  [a2 CGContext];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 cgContextActions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__VUIGraphicsImageRenderer_imageWithSize_format_cgContextActions___block_invoke;
  v13[3] = &unk_1E6DDD538;
  id v14 = v9;
  id v10 = v9;
  v11 = objc_msgSend(a1, "_imageWithSize:format:actions:", a4, v13, width, height);

  return v11;
}

+ (id)formatWithCGImage:(CGImage *)a3
{
  id v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F42A80] vuiImageWithCGImage:a3];
  v6 = [v4 formatWithUIImage:v5 preferredFormat:0];

  return v6;
}

+ (id)formatWithUIImage:(id)a3 preferredFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (formatWithUIImage_preferredFormat__onceToken != -1) {
    dispatch_once(&formatWithUIImage_preferredFormat__onceToken, &__block_literal_global_16);
  }
  v7 = objc_msgSend(MEMORY[0x1E4F42D90], "vui_main");
  objc_msgSend(v7, "vui_scale");
  double v9 = v8;

  id v10 = [MEMORY[0x1E4F42948] currentDevice];
  int v11 = [v10 _supportsDeepColor];

  if (!v11)
  {
    v12 = 0;
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_10;
  }
  v12 = [v5 imageRendererFormat];
  [v12 setScale:v9];
  if (!v12
    || formatWithUIImage_preferredFormat__sOverrideDefault && formatWithUIImage_preferredFormat__sPrefersExtendedRange)
  {
    if (v6)
    {
LABEL_8:
      id v13 = v6;
LABEL_11:
      id v14 = v13;

      v12 = v14;
      goto LABEL_12;
    }
LABEL_10:
    id v13 = +[VUIGraphicsImageRenderer preferredFormat];
    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

+ (id)_imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__VUIGraphicsImageRenderer__imageWithSize_format_actions___block_invoke;
  v13[3] = &unk_1E6DDD560;
  double v15 = width;
  double v16 = height;
  id v14 = v9;
  id v10 = v9;
  int v11 = objc_msgSend(a1, "imageWithSize:format:actions:", a4, v13, width, height);

  return v11;
}

+ (id)imageWithSize:(CGSize)a3 format:(id)a4 actions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F42A58];
  id v10 = a4;
  int v11 = objc_msgSend([v9 alloc], "initWithSize:format:", v10, width, height);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__VUIGraphicsImageRenderer_imageWithSize_format_actions___block_invoke;
  v15[3] = &unk_1E6DDD538;
  id v16 = v8;
  id v12 = v8;
  id v13 = [v11 imageWithActions:v15];

  return v13;
}

void __62__VUIGraphicsImageRenderer_formatWithUIImage_preferredFormat___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  formatWithUIImage_preferredFormat__sPrefersExtendedRange = CFPreferencesGetAppBooleanValue(@"PrefersExtendedRange", (CFStringRef)[v0 bundleIdentifier], (Boolean *)&formatWithUIImage_preferredFormat__sOverrideDefault);
}

+ (id)preferredFormat
{
  v2 = objc_msgSend(MEMORY[0x1E4F42D90], "vui_main");
  id v3 = [v2 vuiTraitCollection];

  id v4 = [MEMORY[0x1E4F42A60] formatForTraitCollection:v3];

  return v4;
}

+ (id)formatWithCGImage:(CGImage *)a3 preferredFormat:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_class();
  v7 = [MEMORY[0x1E4F42A80] vuiImageWithCGImage:a3];
  id v8 = [v6 formatWithUIImage:v7 preferredFormat:v5];

  return v8;
}

+ (id)formatWithUIImage:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() formatWithUIImage:v3 preferredFormat:0];

  return v4;
}

+ (id)decodedImage:(id)a3 opaque:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    id v6 = +[VUIGraphicsImageRenderer formatWithUIImage:v5];
    [v6 setScale:1.0];
    [v6 setOpaque:v4];
    [v5 size];
    double v8 = v7;
    double v10 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__VUIGraphicsImageRenderer_decodedImage_opaque___block_invoke;
    v13[3] = &unk_1E6DDD588;
    id v14 = v5;
    int v11 = +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v6, v13, v8, v10);
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

uint64_t __48__VUIGraphicsImageRenderer_decodedImage_opaque___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v1 size];
  return objc_msgSend(v1, "drawInRect:", v2, v3, v4, v5);
}

+ (void)SVGImagesWithDataDescriptors:(id)a3 format:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    int v11 = dispatch_get_global_queue(2, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke;
    v12[3] = &unk_1E6DDD690;
    id v13 = v8;
    id v15 = v10;
    id v16 = a1;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

void __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v3)
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v44 = *(void *)v71;
    id v43 = v2;
    do
    {
      uint64_t v45 = v3;
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v71 != v44) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v8 = [v7 data];
        uint64_t v9 = CGSVGDocumentCreateFromData();
        if (v9)
        {
          CGSVGDocumentGetCanvasSize();
          double v11 = v10;
          double v13 = v12;
          id v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
          id v15 = [(id)v75[5] objectForKey:v14];
          id v16 = v15;
          if (v15)
          {
            [v15 CGContext];
            CGContextClear();
            [v16 CGContext];
            CGContextDrawSVGDocument();
            v17 = [v16 currentImage];
          }
          else
          {
            v20 = *(void **)(a1 + 56);
            uint64_t v21 = *(void *)(a1 + 40);
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2_18;
            v60[3] = &unk_1E6DDD618;
            v63 = &v74;
            id v61 = v14;
            id v62 = &__block_literal_global_11;
            uint64_t v64 = v9;
            v17 = objc_msgSend(v20, "_imageWithSize:format:actions:", v21, v60, v11, v13);
          }
          CGSVGDocumentRelease();
          [v7 renderSize];
          double v23 = v22;
          double v25 = v24;
          [v7 backgroundSize];
          if (v27 != v4 || v26 != v5)
          {
            [v7 backgroundSize];
            double v23 = v28;
            double v25 = v29;
          }
          v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v23, v25);
          BOOL v31 = v25 == v5 && v23 == v4;
          if (v31 || !v17)
          {
            v32 = v16;
            v34 = v17;
          }
          else
          {
            v32 = [(id)v75[5] objectForKey:v30];

            if (v32)
            {
              [v32 CGContext];
              CGContextClear();
              v33 = (CGContext *)[v32 CGContext];
              __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3(v23, v25, (uint64_t)v33, v33, v7, v17);
              v34 = [v32 currentImage];
            }
            else
            {
              v35 = *(void **)(a1 + 56);
              uint64_t v36 = *(void *)(a1 + 40);
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3_19;
              v52[3] = &unk_1E6DDD640;
              v57 = &v74;
              id v37 = v30;
              id v56 = &__block_literal_global_14;
              id v53 = v37;
              v54 = v7;
              id v38 = v17;
              id v55 = v38;
              double v58 = v23;
              double v59 = v25;
              uint64_t v39 = v36;
              id v2 = v43;
              v34 = objc_msgSend(v35, "_imageWithSize:format:actions:", v39, v52, v23, v25);

              v32 = 0;
              v17 = v53;
            }
          }
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v47 = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_4;
          v48 = &unk_1E6DDD668;
          id v51 = *(id *)(a1 + 48);
          v49 = v7;
          id v40 = v34;
          id v50 = v40;
          v41 = v46;
          if ([MEMORY[0x1E4F29060] isMainThread]) {
            v47(v41);
          }
          else {
            dispatch_async(MEMORY[0x1E4F14428], v41);
          }
        }
        else
        {
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v66 = __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_16;
          v67 = &unk_1E6DDD5F0;
          id v18 = *(id *)(a1 + 48);
          v68 = v7;
          id v69 = v18;
          v19 = v65;
          if ([MEMORY[0x1E4F29060] isMainThread]) {
            v66((uint64_t)v19);
          }
          else {
            dispatch_async(MEMORY[0x1E4F14428], v19);
          }

          id v14 = v69;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v3);
  }

  v42 = (void *)v75[5];
  v75[5] = 0;

  _Block_object_dispose(&v74, 8);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2()
{
  return CGContextDrawSVGDocument();
}

void __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3(CGFloat a1, CGFloat a2, uint64_t a3, CGContext *a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  [v10 size];
  double v13 = v12;
  [v10 size];
  double v15 = v14;
  id v16 = [v11 backgroundColor];
  [v11 scaleWithinRenderSize];
  double v18 = v17;

  double v19 = v15 * (a1 / v13);
  double v20 = v13 * (a1 / v13);
  if (v19 > a2)
  {
    CGFloat v21 = a2 / v19;
    double v19 = v19 * (a2 / v19);
    double v20 = v20 * v21;
  }
  if (v16)
  {
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v16 CGColor]);
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.double width = a1;
    v29.size.double height = a2;
    CGContextFillRect(a4, v29);
  }
  double v22 = 1.0;
  if (v18 != 0.0) {
    double v22 = v18;
  }
  CGFloat v23 = v22 * v20;
  CGFloat v24 = v22 * v19;
  CGFloat v25 = (a2 - v22 * v19) * 0.5;
  id v27 = v10;
  double v26 = (CGImage *)[v27 CGImage];
  v30.origin.x = (a1 - v23) * 0.5;
  v30.origin.y = v25;
  v30.size.double width = v23;
  v30.size.double height = v24;
  CGContextDrawImage(a4, v30, v26);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_2_18(void *a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v4 = a1[4];
  id v5 = a2;
  [v3 setObject:v5 forKey:v4];
  uint64_t v6 = a1[5];
  uint64_t v7 = [v5 CGContext];

  uint64_t v8 = a1[7];
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v9(v6, v7, v8);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_3_19(void *a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1[8] + 8) + 40);
  uint64_t v4 = a1[4];
  id v5 = a2;
  [v3 setObject:v5 forKey:v4];
  uint64_t v6 = a1[7];
  uint64_t v7 = [v5 CGContext];

  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))(v6 + 16);
  v11.n128_u64[0] = a1[9];
  v12.n128_u64[0] = a1[10];
  return v10(v6, v7, v8, v9, v11, v12);
}

uint64_t __75__VUIGraphicsImageRenderer_SVGImagesWithDataDescriptors_format_completion___block_invoke_4(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

@end
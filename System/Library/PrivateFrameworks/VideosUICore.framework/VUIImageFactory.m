@interface VUIImageFactory
+ (id)URLFromDescriptor:(id)a3;
+ (id)URLFromSource:(id)a3 extension:(id)a4 p3Specifier:(id)a5 cropCode:(id)a6 imageSize:(CGSize)a7 displayScaleIsPointMultiplier:(BOOL)a8 centerGrowth:(BOOL)a9 focusSizeIncrease:(double)a10;
+ (id)_getResourceImageFromDescriptor:(id)a3;
+ (id)_imageProxyWithURL:(id)a3;
+ (id)_makeImageViewWithDescriptor:(id)a3 proxy:(id)a4 existingView:(id)a5;
+ (id)_makeSourceStringFromSource:(id)a3 p3Specifier:(id)a4;
+ (id)makeImageProxyWithDescriptor:(id)a3;
+ (id)makeImageViewWithDescriptor:(id)a3 existingView:(id)a4;
+ (id)makeImageViewWithDescriptor:(id)a3 imageProxy:(id)a4 existingView:(id)a5;
+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4;
+ (id)makeImageWithImage:(id)a3 existingView:(id)a4;
@end

@implementation VUIImageFactory

+ (id)_makeImageViewWithDescriptor:(id)a3 proxy:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = 0;
    goto LABEL_53;
  }
  v11 = [v7 tintColor];
  v12 = [v7 highlightColor];
  [v7 boundingSize];
  double v14 = v13;
  double v16 = v15;
  [v7 borderRadii];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [v7 scaleMode];
  uint64_t v26 = [v7 optimizedImageRendering];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [v7 borderColor];
    [v7 borderWidth];
    double v29 = v28;
    if ([v7 decoratorType] == 1 || (v26 & 1) != 0 || !v27 || v29 <= 0.0)
    {
      v30 = objc_alloc_init(VUIImageScaleDecorator);
    }
    else
    {
      +[VUIImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](VUIImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v27, v29, v29, v29, v29);
      v30 = (VUIImageScaleDecorator *)objc_claimAutoreleasedReturnValue();
    }
    v31 = v30;
    if (v30)
    {
      -[VUIImageScaleDecorator setScaleToSize:](v30, "setScaleToSize:", v14, v16);
      [(VUIImageScaleDecorator *)v31 setScaleMode:v25];
      if ((v26 & 1) == 0)
      {
        -[VUIImageScaleDecorator setCornerRadii:](v31, "setCornerRadii:", v18, v20, v22, v24);
        -[VUIImageScaleDecorator setCornerContinuous:](v31, "setCornerContinuous:", [v7 continuousBorder]);
      }
      if (v25 == 2)
      {
        v32 = [v7 backgroundColor];
        [(VUIImageScaleDecorator *)v31 setBgColor:v32];
      }
      v33 = [v8 decorator];

      if (!v33)
      {
        [v8 setDecorator:v31];
        [v8 setOptimizedImageRendering:v26];
      }
    }
  }
  if (v14 != *MEMORY[0x1E4F1DB30] || v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v35 = (VUIImageView *)v9;
    }
    else {
      v35 = objc_alloc_init(VUIImageView);
    }
    v10 = v35;
    v36 = objc_msgSend(v7, "accessibilityText", v11);
    uint64_t v37 = [v36 length];

    if (v37)
    {
      v38 = [v7 accessibilityText];
      [(UIView *)v10 vui_setAccessibilityText:v38];

      [(UIView *)v10 vui_isAccessibilityElement:1];
    }
    if (([v7 sizeComputationOnly] & 1) == 0) {
      -[VUIImageView setBounds:](v10, "setBounds:", 0.0, 0.0, v14, v16);
    }
    if (([v7 sizeComputationOnly] & 1) == 0) {
      -[VUIImageView setImageProxy:clearingExisting:completion:](v10, "setImageProxy:clearingExisting:completion:", v8, [v7 clearsExisting], 0);
    }
    if (v26)
    {
      +[VUICoreUtilities radiusFromCornerRadii:](VUICoreUtilities, "radiusFromCornerRadii:", v18, v20, v22, v24);
      -[VUIImageView setCornerRadius:](v10, "setCornerRadius:");
      v39 = [v7 borderColor];
      [(VUIImageView *)v10 setBorderColor:v39];

      [v7 borderWidth];
      -[VUIImageView setBorderWidth:](v10, "setBorderWidth:");
      if ([v7 scaleMode] == 1)
      {
        v40 = v10;
        uint64_t v41 = 1;
LABEL_38:
        [(VUIImageView *)v40 setVuiContentMode:v41];
        goto LABEL_39;
      }
      if ([v7 scaleMode] == 3)
      {
        v40 = v10;
        uint64_t v41 = 2;
        goto LABEL_38;
      }
    }
    else
    {
      [(VUIImageView *)v10 setImageContainsCornerRadius:1];
    }
LABEL_39:
    v42 = [v7 placeholderSrc];
    v43 = [v7 placeholderColor];
    v62 = v12;
    uint64_t v44 = v25;
    if (v43)
    {
      [(VUIImageView *)v10 setPlaceholderColor:v43];
    }
    else if ([v42 length])
    {
      v45 = [v7 accessibilityText];
      v46 = +[VUICoreUtilities imageForResource:v42 accessibilityDescription:v45];

      [(VUIImageView *)v10 setPlaceholderImage:v46];
    }
    v47 = [v7 shadow];
    if (v47)
    {
      [(VUIImageView *)v10 setImageContainsShadow:1];
      -[VUIImageView setAnimatesShadowChanges:](v10, "setAnimatesShadowChanges:", [v7 animatesShadowChanges]);
      -[VUIImageView setShadowRadii:](v10, "setShadowRadii:", v18, v20, v22, v24);
      v48 = [(VUIImageView *)v10 layer];
      [v48 setMasksToBounds:0];

      v49 = [(VUIImageView *)v10 layer];
      [v7 containerSize];
      objc_msgSend(v49, "setShadowPath:", +[VUICoreUtilities shadowPathWithCornerRadii:andScaledSize:](VUICoreUtilities, "shadowPathWithCornerRadii:andScaledSize:", v18, v20, v22, v24, v50, v51));

      v52 = [(VUIImageView *)v10 layer];
      [v47 shadowOffset];
      objc_msgSend(v52, "setShadowOffset:");

      v53 = [(VUIImageView *)v10 layer];
      [v47 shadowBlurRadius];
      objc_msgSend(v53, "setShadowRadius:");

      v54 = [(VUIImageView *)v10 layer];
      id v55 = [v47 shadowColor];
      objc_msgSend(v54, "setShadowColor:", objc_msgSend(v55, "CGColor"));

      v56 = [(VUIImageView *)v10 layer];
      v57 = v56;
      LODWORD(v58) = 1.0;
    }
    else
    {
      [(VUIImageView *)v10 setImageContainsShadow:0];
      [(VUIImageView *)v10 setAnimatesShadowChanges:0];
      -[VUIImageView setShadowRadii:](v10, "setShadowRadii:", 0.0, 0.0, 0.0, 0.0);
      v56 = [(VUIImageView *)v10 layer];
      v57 = v56;
      double v58 = 0.0;
    }
    [v56 setShadowOpacity:v58];
    v11 = v61;

    if (v44 == 3) {
      uint64_t v59 = 2;
    }
    else {
      uint64_t v59 = 1;
    }
    [(VUIImageView *)v10 setVuiContentMode:v59];
    [(VUIImageView *)v10 setContentsPosition:2];
    [(VUIImageView *)v10 _setTintColor:v61];
    v12 = v62;
    [(VUIImageView *)v10 _setFocusedColor:v62];
    if ([v7 loadsImmediately]) {
      [(VUIImageView *)v10 _loadImage];
    }

    goto LABEL_52;
  }
  v10 = 0;
LABEL_52:

LABEL_53:
  return v10;
}

+ (id)makeImageViewWithDescriptor:(id)a3 existingView:(id)a4
{
  return (id)[a1 makeImageViewWithDescriptor:a3 imageProxy:0 existingView:a4];
}

+ (id)_imageProxyWithURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "vuicore_isAppIconURL"))
  {
    v5 = [v4 host];
    v6 = [VUIImageProxy alloc];
    id v7 = +[VUIAppIconImageLoader sharedInstance];
    id v8 = [(VUIImageProxy *)v6 initWithObject:v5 imageLoader:v7 groupType:0];

    [(VUIImageProxy *)v8 setCacheOnLoad:+[VUICoreUtilities canHandleDecodingOnRenderThread] ^ 1];
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "vuicore_imageURLType") != 1)
  {
    id v9 = [VUIImageProxy alloc];
    v10 = +[VUIURLImageLoader sharedInstance];
    id v8 = [(VUIImageProxy *)v9 initWithObject:v4 imageLoader:v10 groupType:0];

    [(VUIImageProxy *)v8 setCacheOnLoad:+[VUICoreUtilities canHandleDecodingOnRenderThread] ^ 1];
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (id)makeImageViewWithDescriptor:(id)a3 imageProxy:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = v8;
    if (!v10)
    {
      id v10 = +[VUIImageFactory makeImageProxyWithDescriptor:v7];
    }
    v11 = +[VUIImageFactory _makeImageViewWithDescriptor:v7 proxy:v10 existingView:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)makeImageProxyWithDescriptor:(id)a3
{
  id v3 = +[VUIImageFactory URLFromDescriptor:a3];
  if (v3)
  {
    v4 = +[VUIImageFactory _imageProxyWithURL:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)URLFromDescriptor:(id)a3
{
  id v3 = a3;
  v4 = [v3 src];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 src];
    id v7 = [v3 extension];
    id v8 = [v3 p3Specifier];
    id v9 = [v3 cropCode];
    [v3 downloadSize];
    if (v11 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      [v3 boundingSize];
    }
    else {
      [v3 downloadSize];
    }
    double v15 = +[VUIImageFactory URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:](VUIImageFactory, "URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:", v6, v7, v8, v9, [v3 displayScaleIsPointMultiplier], 0, v13, v14, 0.0);
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

+ (id)URLFromSource:(id)a3 extension:(id)a4 p3Specifier:(id)a5 cropCode:(id)a6 imageSize:(CGSize)a7 displayScaleIsPointMultiplier:(BOOL)a8 centerGrowth:(BOOL)a9 focusSizeIncrease:(double)a10
{
  BOOL v11 = a9;
  double height = a7.height;
  double width = a7.width;
  id v19 = a3;
  double v20 = (__CFString *)a4;
  id v21 = a5;
  double v22 = (__CFString *)a6;
  if (URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__onceToken == -1)
  {
    if (a8)
    {
LABEL_3:
      double v23 = [MEMORY[0x1E4F42D90] mainScreen];
      objc_msgSend(v23, "vui_scale");
      double v25 = v24;

      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__onceToken, &__block_literal_global_8);
    if (a8) {
      goto LABEL_3;
    }
  }
  double v25 = *(double *)&URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__sPointMultiplier;
LABEL_6:
  double v26 = fabs(round(width * v25));
  double v27 = round(height * v25);
  double v28 = fabs(v27);
  if (v11)
  {
    double v29 = v28 + a10 * v25;
  }
  else
  {
    float v30 = v27;
    double v31 = round(v26 / fabsf(v30) * 100.0) / 100.0;
    if (v26 <= v28)
    {
      double v29 = v28 + a10 * v25;
      double v26 = round(v29 * v31);
    }
    else
    {
      double v26 = v26 + a10 * v25;
      double v29 = round(v26 / v31);
    }
  }
  v32 = (void *)MEMORY[0x1E4F28B88];
  id v33 = v19;
  v34 = [v32 whitespaceAndNewlineCharacterSet];
  v35 = [v33 stringByTrimmingCharactersInSet:v34];

  LODWORD(v36) = vcvtpd_s64_f64(v26);
  uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v36);
  v38 = [v35 stringByReplacingOccurrencesOfString:@"{w}" withString:v37];

  LODWORD(v39) = vcvtpd_s64_f64(v29);
  v40 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v39);
  uint64_t v41 = [v38 stringByReplacingOccurrencesOfString:@"{h}" withString:v40];

  if (v22) {
    v42 = v22;
  }
  else {
    v42 = &stru_1F3DEFD80;
  }
  v43 = [v41 stringByReplacingOccurrencesOfString:@"{c}" withString:v42];

  if (v20) {
    uint64_t v44 = v20;
  }
  else {
    uint64_t v44 = &stru_1F3DEFD80;
  }
  v45 = [v43 stringByReplacingOccurrencesOfString:@"{f}" withString:v44];

  v46 = [a1 _makeSourceStringFromSource:v45 p3Specifier:v21];

  v47 = [MEMORY[0x1E4F1CB10] URLWithString:v46];

  return v47;
}

+ (id)_makeSourceStringFromSource:(id)a3 p3Specifier:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  if ([(__CFString *)v6 length])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F42D90], "vui_main");
    int v8 = objc_msgSend(v7, "vui_canRepresentDisplayGamutP3");

    id v9 = &stru_1F3DEFD80;
    if (v8)
    {
      if (v6) {
        double v10 = v6;
      }
      else {
        double v10 = &stru_1F3DEFD80;
      }
      id v9 = v10;
    }
  }
  else
  {
    id v9 = &stru_1F3DEFD80;
  }
  BOOL v11 = [v5 stringByReplacingOccurrencesOfString:@"{p3}" withString:v9];

  return v11;
}

+ (id)_getResourceImageFromDescriptor:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  id v5 = v4;
  if (v3 && [v4 length])
  {
    if ([v3 type])
    {
      v6 = [v3 accessibilityText];
      id v7 = +[VUICoreUtilities imageForResource:v5 accessibilityDescription:v6];

      if (![v3 shouldRenderAsTemplate]) {
        goto LABEL_9;
      }
      uint64_t v8 = [v7 vuiTemplateImage];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F42A80];
      id v7 = [v3 symbolConfiguration];
      double v10 = [v3 accessibilityText];
      uint64_t v8 = [v9 vuiSystemImageNamed:v5 withConfiguration:v7 accessibilityDescription:v10];
    }
    id v7 = (void *)v8;
  }
  else
  {
    id v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 type];
  uint64_t v8 = +[VUIImageFactory _getResourceImageFromDescriptor:v5];
  if (!v8)
  {
    double v10 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v6;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  double v10 = v9;
  BOOL v11 = v7 == 1;
  BOOL v12 = v7 == 1;
  uint64_t v13 = !v11;
  [v9 setImage:v8];
  [v10 setSymbolImage:v13];
  [v10 setResourceImage:v12];
  [v5 size];
  objc_msgSend(v10, "setResourceOrSymbolSize:");
  double v14 = [v5 tintColor];
  [v10 _setTintColor:v14];

  double v15 = [v5 highlightColor];
  [v10 _setFocusedColor:v15];

  [v5 borderRadii];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (!+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:"))
  {
    +[VUICoreUtilities radiusFromCornerRadii:](VUICoreUtilities, "radiusFromCornerRadii:", v17, v19, v21, v23);
    objc_msgSend(v10, "setCornerRadius:");
  }
  if ([v5 scaleMode] == 1)
  {
    uint64_t v24 = 1;
LABEL_15:
    [v10 setVuiContentMode:v24];
    goto LABEL_16;
  }
  if ([v5 scaleMode] == 3)
  {
    uint64_t v24 = 2;
    goto LABEL_15;
  }
LABEL_16:
  double v25 = [v5 accessibilityText];
  if ([v25 length])
  {
    objc_msgSend(v10, "vui_setAccessibilityText:", v25);
    objc_msgSend(v10, "vui_isAccessibilityElement:", 1);
  }

LABEL_19:
  return v10;
}

void __135__VUIImageFactory_URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease___block_invoke()
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  objc_msgSend(v0, "vui_scale");
  double v2 = v1;

  double v3 = 2.0;
  if (v2 == 2.0) {
    double v3 = 1.5;
  }
  URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__sPointMultiplier = *(void *)&v3;
}

+ (id)makeImageWithImage:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;
  [v7 setImage:v5];

  return v8;
}

@end
@interface TVViewFactory
+ (CGSize)decorateImageProxy:(id)a3 forLayout:(id)a4;
+ (id)imageProxyWithURL:(id)a3;
+ (id)imageStackViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5;
+ (id)imageURLWithDescription:(id)a3;
+ (id)imageViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5;
@end

@implementation TVViewFactory

+ (id)imageURLWithDescription:(id)a3
{
  id v3 = a3;
  if (imageURLWithDescription__onceToken != -1) {
    dispatch_once(&imageURLWithDescription__onceToken, &__block_literal_global_35);
  }
  [v3 imageSize];
  double v5 = round(v4 * *(double *)&imageURLWithDescription__sPointMultiplier);
  [v3 imageSize];
  double v7 = round(v6 * *(double *)&imageURLWithDescription__sPointMultiplier);
  if ([v3 centerGrowth])
  {
    [v3 focusSizeIncrease];
    double v9 = v7 + v8 * *(double *)&imageURLWithDescription__sPointMultiplier;
  }
  else
  {
    float v10 = v7;
    double v11 = v5 / v10;
    [v3 focusSizeIncrease];
    BOOL v12 = v5 <= v7;
    double v14 = v7 + v13 * *(double *)&imageURLWithDescription__sPointMultiplier;
    double v15 = ceil(v11 * v14);
    double v16 = v5 + v13 * *(double *)&imageURLWithDescription__sPointMultiplier;
    double v17 = ceil(v16 / v11);
    if (v5 > v7) {
      double v9 = v17;
    }
    else {
      double v9 = v14;
    }
    if (v12) {
      double v5 = v15;
    }
    else {
      double v5 = v16;
    }
  }
  v18 = [v3 url];
  v19 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v20 = [v18 stringByTrimmingCharactersInSet:v19];

  LODWORD(v21) = vcvtpd_s64_f64(v5);
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v21);
  v23 = [v20 stringByReplacingOccurrencesOfString:@"{w}" withString:v22];

  LODWORD(v24) = vcvtpd_s64_f64(v9);
  v25 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v24);
  v26 = [v23 stringByReplacingOccurrencesOfString:@"{h}" withString:v25];

  uint64_t v27 = [v3 cropCode];
  v28 = (void *)v27;
  if (v27) {
    v29 = (__CFString *)v27;
  }
  else {
    v29 = &stru_26E5657A8;
  }
  v30 = [v26 stringByReplacingOccurrencesOfString:@"{c}" withString:v29];

  uint64_t v31 = [v3 urlFormat];
  v32 = (void *)v31;
  if (v31) {
    v33 = (__CFString *)v31;
  }
  else {
    v33 = &stru_26E5657A8;
  }
  v34 = [v30 stringByReplacingOccurrencesOfString:@"{f}" withString:v33];

  v35 = [NSURL URLWithString:v34];

  return v35;
}

void __41__TVViewFactory_imageURLWithDescription___block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  id v4 = [v0 traitCollection];

  [v4 displayScale];
  BOOL v2 = v1 == 2.0;
  double v3 = 1.5;
  if (!v2) {
    double v3 = 2.0;
  }
  imageURLWithDescription__sPointMultiplier = *(void *)&v3;
}

+ (id)imageProxyWithURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "tv_isAppIconURL"))
  {
    double v5 = [v4 host];
    double v6 = [TVImageProxy alloc];
    double v7 = +[_TVAppIconImageLoader sharedInstance];
    double v8 = [(TVImageProxy *)v6 initWithObject:v5 imageLoader:v7 groupType:0];

    [(TVImageProxy *)v8 setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "tv_imageURLType") != 1)
  {
    double v9 = [TVImageProxy alloc];
    float v10 = +[TVURLImageLoader sharedInstance];
    double v8 = [(TVImageProxy *)v9 initWithObject:v4 imageLoader:v10 groupType:0];

    [(TVImageProxy *)v8 setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
  }
  else
  {
LABEL_5:
    double v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (CGSize)decorateImageProxy:(id)a3 forLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 decoratorSize];
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v11 = v5;
  BOOL v12 = [v6 imageTreatment];
  [v6 padding];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  char v21 = [v6 allowsNonOpaqueShadows];
  [v6 focusSizeIncrease];
  double v23 = v22;
  [v6 borderRadii];
  +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:");
  double v25 = v24;
  uint64_t v26 = [v6 scaleMode];
  if (![v12 isEqualToString:@"postcard"])
  {
    if ([v12 isEqualToString:@"16x9"])
    {
      v28 = _TVImage16x9Decorator;
    }
    else
    {
      if (![v12 isEqualToString:@"keyframeArt"])
      {
        v38 = [v6 tintColor];

        if (!v38)
        {
          uint64_t v27 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v8, v10);
          goto LABEL_10;
        }
        v39 = [_TVTintedImageDecorator alloc];
        v30 = [v6 ikTintColor];
        uint64_t v31 = [(_TVTintedImageDecorator *)v39 initWithTintColor:v30];
        goto LABEL_9;
      }
      v28 = _TVImageKeyFrameArtDecorator;
    }
    id v29 = [v28 alloc];
    v30 = [v6 inlineTitle];
    uint64_t v31 = [v29 initWithInlineTitle:v30];
LABEL_9:
    uint64_t v27 = (TVImageScaleDecorator *)v31;

    goto LABEL_10;
  }
  double v8 = v8 + v16 + v20;
  double v10 = v10 + v14 + v18;
  uint64_t v27 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v8, v10);
  uint64_t v26 = 2;
LABEL_10:
  -[TVImageScaleDecorator setCenterGrowth:](v27, "setCenterGrowth:", [v6 centerGrowth]);
  -[TVImageScaleDecorator setScaleToSize:](v27, "setScaleToSize:", v8, v10);
  -[TVImageScaleDecorator setPadding:](v27, "setPadding:", v14, v16, v18, v20);
  [(TVImageScaleDecorator *)v27 setScaleMode:v26];
  [(TVImageScaleDecorator *)v27 setFocusedSizeIncrease:v23];
  if (((v21 & 1) != 0
     || !+[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread"))&& ([v6 centerGrowth] & 1) == 0)
  {
    +[TVCornerUtilities radiiFromRadius:v25];
    -[TVImageScaleDecorator setCornerRadii:](v27, "setCornerRadii:");
  }
  if (v26 == 2)
  {
    v32 = [v6 backgroundColor];
    [(TVImageScaleDecorator *)v27 setBgColor:v32];
  }
  v33 = [v11 decorator];

  if (!v33) {
    [v11 setDecorator:v27];
  }
  [v11 expectedSize];
  double v8 = v34;
  double v10 = v35;

LABEL_19:
  double v36 = v8;
  double v37 = v10;
  result.height = v37;
  result.width = v36;
  return result;
}

+ (id)imageStackViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 configureForMetrics];
  [v8 decoratorSize];
  if (v10 >= 0.00000011920929 && v9 >= 0.00000011920929)
  {
    BOOL v12 = [v7 imageProxy];
    [a1 decorateImageProxy:v12 forLayout:v8];

    objc_msgSend(0, "tv_setLayout:", v8);
  }

  return 0;
}

+ (id)imageViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v7 imageProxy];
  id v11 = [v8 tintColor];
  uint64_t v84 = [v8 highlightColor];
  [v8 decoratorSize];
  double v13 = v12;
  double v15 = v14;
  [v8 padding];
  double v17 = v16;
  double v19 = v18;
  double v82 = v21;
  double v83 = v20;
  [v8 focusSizeIncrease];
  double v81 = v22;
  [v8 borderRadii];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = [v8 continuousBorder];
  uint64_t v32 = [v8 scaleMode];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  double v76 = v19;
  double v77 = v17;
  double v78 = v30;
  double v79 = v28;
  double v33 = v15;
  double v34 = v26;
  double v35 = v24;
  v80 = v11;
  double v36 = [v8 borderColor];
  [v8 borderWidth];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [v8 imageTreatment];
  if ([v7 isInBackgroundOrBanner])
  {
    v46 = objc_alloc_init(TVImageScaleDecorator);
LABEL_14:
    v47 = v46;
    double v24 = v35;
    double v26 = v34;
    double v15 = v33;
    goto LABEL_15;
  }
  if (v36
    && (v40 != *(double *)(MEMORY[0x263F1D1C0] + 8)
     || v38 != *MEMORY[0x263F1D1C0]
     || v44 != *(double *)(MEMORY[0x263F1D1C0] + 24)
     || v42 != *(double *)(MEMORY[0x263F1D1C0] + 16)))
  {
    +[TVImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](TVImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v36, v38, v40, v42, v44);
    v46 = (TVImageScaleDecorator *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ([v45 isEqualToString:@"postcard"])
  {
    double v13 = v13 + v76 + v82;
    double v15 = v33 + v77 + v83;
    v47 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v13, v15);
    uint64_t v32 = 2;
    double v24 = v35;
    double v26 = v34;
LABEL_15:
    double v30 = v78;
    double v28 = v79;
    goto LABEL_16;
  }
  double v24 = v35;
  double v26 = v34;
  double v15 = v33;
  double v30 = v78;
  double v28 = v79;
  if ([v7 hasGradient])
  {
    v48 = [_TVTintedImageDecorator alloc];
    v49 = [v8 ikTintColor];
    uint64_t v50 = [(_TVTintedImageDecorator *)v48 initWithTintColor:v49];
  }
  else
  {
    if (![v45 isEqualToString:@"16x9"])
    {
      v47 = objc_alloc_init(TVImageScaleDecorator);
      goto LABEL_16;
    }
    v75 = [_TVImage16x9Decorator alloc];
    v49 = [v8 inlineTitle];
    uint64_t v50 = [(_TVImage16x9Decorator *)v75 initWithInlineTitle:v49];
  }
  v47 = (TVImageScaleDecorator *)v50;

LABEL_16:
  if (v47)
  {
    -[TVImageScaleDecorator setScaleToSize:](v47, "setScaleToSize:", v13, v15);
    -[TVImageScaleDecorator setPadding:](v47, "setPadding:", v77, v76, v83, v82);
    [(TVImageScaleDecorator *)v47 setFocusedSizeIncrease:v81];
    [(TVImageScaleDecorator *)v47 setScaleMode:v32];
    -[TVImageScaleDecorator setCornerRadii:](v47, "setCornerRadii:", v24, v26, v28, v30);
    [(TVImageScaleDecorator *)v47 setCornerContinuous:v31];
    if (v32 == 2)
    {
      v51 = [v8 backgroundColor];
      [(TVImageScaleDecorator *)v47 setBgColor:v51];
    }
    v52 = [v10 decorator];

    if (!v52) {
      [v10 setDecorator:v47];
    }
  }

  id v11 = v80;
LABEL_22:
  if (v13 == *MEMORY[0x263F001B0] && v15 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v55 = 0;
    v56 = (void *)v84;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v54 = (_TVImageView *)v9;
    }
    else {
      v54 = objc_alloc_init(_TVImageView);
    }
    v55 = v54;
    -[_TVImageView setSemanticContentAttribute:](v54, "setSemanticContentAttribute:", [v7 semanticContentAttribute]);
    v57 = [v7 accessibilityText];
    uint64_t v58 = [v57 length];

    if (v58)
    {
      v59 = [v7 accessibilityText];
      [(UIView *)v55 tv_setAccessibilityText:v59];
    }
    v60 = [v7 siriData];
    [(UIView *)v55 tv_setSiriData:v60];

    -[_TVImageView setBounds:](v55, "setBounds:", 0.0, 0.0, v13, v15);
    if (([v7 configureForMetrics] & 1) == 0)
    {
      v61 = v11;
      [(_TVImageView *)v55 setImageProxy:v10];
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v24, v26, v28, v30);
      -[_TVImageView setCornerRadius:](v55, "setCornerRadius:");
      [(_TVImageView *)v55 setImageContainsCornerRadius:1];
      v62 = [v7 placeholderImage];
      [(_TVImageView *)v55 setPlaceholderImage:v62];

      v63 = [v8 shadow];
      v64 = [(_TVImageView *)v55 layer];
      v65 = v64;
      if (v63)
      {
        objc_msgSend(v64, "setShadowPath:", +[TVMLUtilities shadowPathWithCornerRadii:andScaledSize:](TVMLUtilities, "shadowPathWithCornerRadii:andScaledSize:", v24, v26, v28, v30, v13, v15));

        v66 = [(_TVImageView *)v55 layer];
        [v63 shadowOffset];
        objc_msgSend(v66, "setShadowOffset:");

        v67 = [(_TVImageView *)v55 layer];
        [v63 shadowBlurRadius];
        objc_msgSend(v67, "setShadowRadius:");

        v68 = [(_TVImageView *)v55 layer];
        id v69 = [v63 shadowColor];
        objc_msgSend(v68, "setShadowColor:", objc_msgSend(v69, "CGColor"));

        v64 = [(_TVImageView *)v55 layer];
        v65 = v64;
        LODWORD(v70) = 1.0;
      }
      else
      {
        double v70 = 0.0;
      }
      [v64 setShadowOpacity:v70];

      id v11 = v61;
    }
    if (v32 == 3) {
      uint64_t v71 = 2;
    }
    else {
      uint64_t v71 = 1;
    }
    [(_TVImageView *)v55 setContentMode:v71];
    [(_TVImageView *)v55 setContentsPosition:2];
    [(_TVImageView *)v55 _setTintColor:v11];
    v72 = [v8 darkTintColor];
    [(_TVImageView *)v55 _setDarkTintColor:v72];

    v56 = (void *)v84;
    [(_TVImageView *)v55 _setFocusedColor:v84];
    v73 = [v8 imageSymbolConfiguration];
    [(_TVImageView *)v55 _setPreferredSymbolConfiguration:v73];

    [(UIView *)v55 tv_setLayout:v8];
  }

  return v55;
}

@end
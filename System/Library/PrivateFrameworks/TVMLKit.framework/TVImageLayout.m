@interface TVImageLayout
+ (id)layoutWithLayout:(id)a3 element:(id)a4;
- (BOOL)allowsNonOpaqueShadows;
- (BOOL)continuousBorder;
- (BOOL)useInSearchPartial;
- (CGSize)_aspectFitToSize:(CGSize)a3 scaleToSize:(CGSize)a4 aspectRatio:(double)a5;
- (CGSize)decoratorSize;
- (CGSize)imageSize;
- (IKColor)ikDarkTintColor;
- (IKColor)ikTintColor;
- (IKFourTuple)ikBorderRadius;
- (NSShadow)shadow;
- (NSString)cropCode;
- (NSString)imageTreatment;
- (NSString)inlineTitle;
- (NSString)placeholderArtworkName;
- (TVCornerRadii)borderRadii;
- (TVImageLayout)init;
- (UIColor)borderColor;
- (UIEdgeInsets)borderWidth;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (double)aspectRatio;
- (double)defaultFocusSizeIncrease;
- (double)upscaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)scaleMode;
- (void)setAllowsNonOpaqueShadows:(BOOL)a3;
- (void)setAspectRatio:(double)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderRadii:(TVCornerRadii)a3;
- (void)setBorderWidth:(UIEdgeInsets)a3;
- (void)setContinuousBorder:(BOOL)a3;
- (void)setCropCode:(id)a3;
- (void)setIkBorderRadius:(id)a3;
- (void)setIkDarkTintColor:(id)a3;
- (void)setIkTintColor:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setImageTreatment:(id)a3;
- (void)setInlineTitle:(id)a3;
- (void)setPlaceholderArtworkName:(id)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setShadow:(id)a3;
- (void)setUpscaleFactor:(double)a3;
- (void)setUseInSearchPartial:(BOOL)a3;
@end

@implementation TVImageLayout

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v22 = v6;
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = 0;
    goto LABEL_91;
  }
  id v8 = v6;
  if (!v8) {
    id v8 = (id)objc_opt_new();
  }
  v102.receiver = a1;
  v102.super_class = (Class)&OBJC_METACLASS___TVImageLayout;
  id v9 = objc_msgSendSuper2(&v102, sel_layoutWithLayout_element_, v8, v7);
  id v10 = v7;
  v11 = [v10 style];
  v12 = objc_msgSend(v11, "tv_tintColor");
  if (![v12 colorType])
  {
    v13 = objc_msgSend(v11, "tv_tintColor");
    id v14 = [v13 color];

    if (!v14) {
      goto LABEL_9;
    }
    [v8 setTintColor:v14];
    [v8 setDarkTintColor:v14];
    v12 = v14;
  }

LABEL_9:
  v15 = objc_msgSend(v11, "tv_darkTintColor");
  if (![v15 colorType])
  {
    v16 = objc_msgSend(v11, "tv_darkTintColor");
    id v17 = [v16 color];

    if (!v17) {
      goto LABEL_13;
    }
    [v8 setDarkTintColor:v17];
    v15 = v17;
  }

LABEL_13:
  v18 = objc_msgSend(v11, "tv_highlightColor");
  uint64_t v19 = [v18 color];

  if (v19) {
    [v8 setHighlightColor:v19];
  }
  objc_msgSend(v11, "tv_width");
  if (v20 == 0.0) {
    [v10 width];
  }
  else {
    objc_msgSend(v11, "tv_width");
  }
  double v23 = v21;
  objc_msgSend(v11, "tv_height");
  if (v24 == 0.0) {
    [v10 height];
  }
  else {
    objc_msgSend(v11, "tv_height");
  }
  double v26 = v25;
  if (v23 == 0.0)
  {
    [v8 imageSize];
    double v23 = v27;
  }
  v97 = (void *)v19;
  id v98 = v7;
  if (v26 == 0.0)
  {
    [v8 imageSize];
    double v26 = v28;
  }
  id v29 = [v8 imageSymbolConfiguration];
  uint64_t v30 = objc_msgSend(v11, "tv_symbolScale");
  if (v30)
  {
    v31 = [MEMORY[0x263F1C6C8] configurationWithScale:v30];
    v32 = v31;
    if (v29)
    {
      uint64_t v33 = [v29 configurationByApplyingConfiguration:v31];

      id v29 = (id)v33;
    }
    else
    {
      id v29 = v31;
    }
  }
  uint64_t v34 = objc_msgSend(v11, "tv_symbolWeight");
  if (v34)
  {
    v35 = [MEMORY[0x263F1C6C8] configurationWithWeight:v34];
    v36 = v35;
    if (v29)
    {
      uint64_t v37 = [v29 configurationByApplyingConfiguration:v35];

      id v29 = (id)v37;
    }
    else
    {
      id v29 = v35;
    }
  }
  objc_msgSend(v11, "tv_symbolPointSize");
  if (v38 != 0.0)
  {
    v39 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:");
    v40 = v39;
    if (v29)
    {
      uint64_t v41 = [v29 configurationByApplyingConfiguration:v39];

      id v29 = (id)v41;
    }
    else
    {
      id v29 = v39;
    }
  }
  uint64_t v42 = objc_msgSend(v11, "tv_symbolTextStyle");
  v96 = (void *)v42;
  if (v42)
  {
    v43 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:v42];
    v44 = v43;
    if (v29)
    {
      uint64_t v45 = [v29 configurationByApplyingConfiguration:v43];

      id v29 = (id)v45;
    }
    else
    {
      id v29 = v43;
    }
  }
  [v8 setImageSymbolConfiguration:v29];
  if (v23 != *MEMORY[0x263F001B0] || v26 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    goto LABEL_57;
  }
  v46 = [v10 url];
  int v47 = objc_msgSend(v46, "tv_isResourceURL");

  if (v47)
  {
    id v48 = +[TVInterfaceFactory sharedInterfaceFactory];
    v49 = [v10 url];
    v50 = objc_msgSend(v49, "tv_resourceName");
    v51 = [v48 imageForResource:v50];

    goto LABEL_54;
  }
  v52 = [v10 url];
  int v53 = objc_msgSend(v52, "tv_isSymbolURL");

  if (v53)
  {
    v54 = (void *)MEMORY[0x263F1C6B0];
    v55 = [v10 url];
    v56 = objc_msgSend(v55, "tv_symbolName");
    v57 = [v8 imageSymbolConfiguration];
    id v48 = [v54 systemImageNamed:v56 withConfiguration:v57];

    if (!v48)
    {
      v51 = 0;
LABEL_55:

      if (v51)
      {
        [v51 size];
        double v23 = v60;
        double v26 = v61;
      }
      goto LABEL_57;
    }
    v58 = (void *)MEMORY[0x263F1C6B0];
    id v48 = v48;
    uint64_t v59 = [v48 CGImage];
    v49 = [MEMORY[0x263F1C920] mainScreen];
    [v49 scale];
    v51 = objc_msgSend(v58, "imageWithCGImage:scale:orientation:", v59, 0);
LABEL_54:

    goto LABEL_55;
  }
LABEL_57:
  objc_msgSend(v8, "setImageSize:", v23, v26);
  [v10 aspectRatio];
  if (v62 != 0.0) {
    objc_msgSend(v8, "setAspectRatio:");
  }
  objc_msgSend(v11, "tv_imageUpscaleFactor");
  if (v63 != 0.0) {
    objc_msgSend(v8, "setUpscaleFactor:");
  }
  uint64_t v64 = objc_msgSend(v10, "tv_scaleModeWithDefaultMode:", objc_msgSend(v8, "scaleMode"));
  if (v64) {
    [v8 setScaleMode:v64];
  }
  v65 = objc_msgSend(v11, "tv_borderColor");
  uint64_t v66 = [v65 color];

  if (v66) {
    [v8 setBorderColor:v66];
  }
  objc_msgSend(v11, "tv_borderWidths");
  if (v70 != *(double *)(MEMORY[0x263F1D1C0] + 8)
    || v67 != *MEMORY[0x263F1D1C0]
    || v69 != *(double *)(MEMORY[0x263F1D1C0] + 24)
    || v68 != *(double *)(MEMORY[0x263F1D1C0] + 16))
  {
    objc_msgSend(v8, "setBorderWidth:");
  }
  uint64_t v71 = objc_msgSend(v11, "tv_shadow");
  if (v71) {
    [v8 setShadow:v71];
  }
  v94 = (void *)v71;
  v72 = objc_msgSend(v11, "tv_tintColor");

  if (v72)
  {
    v73 = objc_msgSend(v11, "tv_tintColor");
    [v8 setIkTintColor:v73];

    v74 = objc_msgSend(v11, "tv_tintColor");
    [v8 setIkDarkTintColor:v74];
  }
  uint64_t v75 = objc_msgSend(v11, "tv_imageTreatment");
  if (v75) {
    [v8 setImageTreatment:v75];
  }
  v93 = (void *)v75;
  v76 = [v11 valueForStyle:@"tv-placeholder"];
  if (v76)
  {
    v77 = v76;
    if ([v76 isEqualToString:@"none"])
    {

      v77 = 0;
    }
    [v8 setPlaceholderArtworkName:v77];
  }
  v78 = [v10 attributes];
  v79 = [v78 valueForKey:@"inline-title"];

  if (v79) {
    [v8 setInlineTitle:v79];
  }
  v80 = [v11 borderRadius];
  if (v80) {
    [v8 setIkBorderRadius:v80];
  }
  long long v100 = TVCornerRadiiZero;
  long long v101 = *(_OWORD *)&qword_230C384E8;
  if (+[TVMLUtilities _cornerRadiiFromImageLayout:v8 cornerRadii:&v100 circle:0])
  {
    objc_msgSend(v8, "setBorderRadii:", v100, v101);
  }
  v95 = v29;
  id v99 = v6;
  v81 = [v11 valueForStyle:@"tv-border-continuous"];

  if (v81) {
    objc_msgSend(v8, "setContinuousBorder:", objc_msgSend(v11, "tv_borderContinuous"));
  }
  v82 = (void *)v66;
  v83 = [v10 attributes];
  [v83 objectForKeyedSubscript:@"opaque"];
  v85 = v84 = v10;

  if (v85)
  {
    v86 = [v84 attributes];
    v87 = [v86 objectForKeyedSubscript:@"opaque"];
    objc_msgSend(v8, "setAllowsNonOpaqueShadows:", objc_msgSend(v87, "BOOLValue") ^ 1);
  }
  v88 = [v84 appDocument];
  v89 = [v88 templateElement];
  v90 = [v89 style];
  v91 = objc_msgSend(v90, "tv_searchStyle");
  objc_msgSend(v8, "setUseInSearchPartial:", objc_msgSend(v91, "isEqualToString:", @"partial"));

  id v22 = v8;
  id v7 = v98;
  id v6 = v99;
LABEL_91:

  return v22;
}

- (TVImageLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVImageLayout;
  result = [(TVViewLayout *)&v3 init];
  if (result) {
    result->_scaleMode = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TVImageLayout;
  id v5 = -[TVViewLayout copyWithZone:](&v16, sel_copyWithZone_);
  objc_msgSend(v5, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
  [v5 setUpscaleFactor:self->_upscaleFactor];
  [v5 setAspectRatio:self->_aspectRatio];
  [v5 setScaleMode:self->_scaleMode];
  objc_msgSend(v5, "setBorderRadii:", self->_borderRadii.topLeft, self->_borderRadii.topRight, self->_borderRadii.bottomLeft, self->_borderRadii.bottomRight);
  objc_msgSend(v5, "setBorderWidth:", self->_borderWidth.top, self->_borderWidth.left, self->_borderWidth.bottom, self->_borderWidth.right);
  id v6 = (void *)[(UIColor *)self->_borderColor copyWithZone:a3];
  [v5 setBorderColor:v6];

  [v5 setContinuousBorder:self->_continuousBorder];
  id v7 = (void *)[(IKColor *)self->_ikTintColor copyWithZone:a3];
  [v5 setIkTintColor:v7];

  id v8 = (void *)[(IKColor *)self->_ikDarkTintColor copyWithZone:a3];
  [v5 setIkDarkTintColor:v8];

  id v9 = (void *)[(NSShadow *)self->_shadow copyWithZone:a3];
  [v5 setShadow:v9];

  id v10 = (void *)[(NSString *)self->_placeholderArtworkName copyWithZone:a3];
  [v5 setPlaceholderArtworkName:v10];

  v11 = (void *)[(NSString *)self->_cropCode copyWithZone:a3];
  [v5 setCropCode:v11];

  v12 = (void *)[(UIImageSymbolConfiguration *)self->_imageSymbolConfiguration copyWithZone:a3];
  [v5 setImageSymbolConfiguration:v12];

  v13 = (void *)[(NSString *)self->_imageTreatment copyWithZone:a3];
  [v5 setImageTreatment:v13];

  [v5 setIkBorderRadius:self->_ikBorderRadius];
  id v14 = (void *)[(NSString *)self->_inlineTitle copyWithZone:a3];
  [v5 setInlineTitle:v14];

  return v5;
}

- (CGSize)decoratorSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  double aspectRatio = self->_aspectRatio;
  if (aspectRatio != 0.0)
  {
    if (width == 0.0)
    {
      double width = ceil(height * aspectRatio);
    }
    else if (height == 0.0)
    {
      double height = ceil(width / aspectRatio);
    }
  }
  [(TVViewLayout *)self maxWidth];
  if (v6 != 0.0 || ([(TVViewLayout *)self maxHeight], v7 != 0.0))
  {
    if (self->_scaleMode == 1)
    {
      [(TVViewLayout *)self maxWidth];
      double v9 = v8;
      [(TVViewLayout *)self maxHeight];
      -[TVImageLayout _aspectFitToSize:scaleToSize:aspectRatio:](self, "_aspectFitToSize:scaleToSize:aspectRatio:", v9, v10, width, height, aspectRatio);
      double width = v11;
      double height = v12;
    }
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_aspectFitToSize:(CGSize)a3 scaleToSize:(CGSize)a4 aspectRatio:(double)a5
{
  double width = a4.width;
  CGFloat height = a3.height;
  CGFloat v7 = a3.width;
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    if (a3.height != 0.0)
    {
      if (a5 != 0.0 && a4.width == *MEMORY[0x263F001B0] && a4.height == *(double *)(MEMORY[0x263F001B0] + 8))
      {
        double width = ceil(a3.height * a5);
      }
      else
      {
        if (a4.height <= a3.height) {
          goto LABEL_30;
        }
        double width = a3.height * (a4.width / a4.height);
      }
      a4.CGFloat height = a3.height;
      goto LABEL_30;
    }
    if (a3.width == 0.0) {
      goto LABEL_30;
    }
    if (a5 != 0.0
      && (a4.width == *MEMORY[0x263F001B0] ? (BOOL v18 = a4.height == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v18 = 0), v18))
    {
      double v19 = a3.width / a5;
    }
    else
    {
      if (a4.width <= a3.width || a4.height <= 0.0) {
        goto LABEL_30;
      }
      double v19 = a3.width / (a4.width / a4.height);
    }
    a4.CGFloat height = ceil(v19);
    double width = v7;
    goto LABEL_30;
  }
  double v8 = ceil(a3.height * a5);
  if (a4.width != *MEMORY[0x263F001B0] || a4.height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v8 = a4.width;
    a3.CGFloat height = a4.height;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  CGFloat v11 = v7;
  CGRect v23 = AVMakeRectWithAspectRatioInsideRect(a3, *(CGRect *)(&height - 3));
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat v14 = v23.size.width;
  CGFloat v15 = v23.size.height;
  double width = ceil(CGRectGetWidth(v23));
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = v14;
  v24.size.CGFloat height = v15;
  a4.CGFloat height = ceil(CGRectGetHeight(v24));
LABEL_30:
  double v20 = width;
  double v21 = a4.height;
  result.CGFloat height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)upscaleFactor
{
  return self->_upscaleFactor;
}

- (void)setUpscaleFactor:(double)a3
{
  self->_upscaleFactor = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_double aspectRatio = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (TVCornerRadii)borderRadii
{
  double topLeft = self->_borderRadii.topLeft;
  double topRight = self->_borderRadii.topRight;
  double bottomLeft = self->_borderRadii.bottomLeft;
  double bottomRight = self->_borderRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(TVCornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIEdgeInsets)borderWidth
{
  double top = self->_borderWidth.top;
  double left = self->_borderWidth.left;
  double bottom = self->_borderWidth.bottom;
  double right = self->_borderWidth.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderWidth:(UIEdgeInsets)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (BOOL)continuousBorder
{
  return self->_continuousBorder;
}

- (void)setContinuousBorder:(BOOL)a3
{
  self->_continuousBorder = a3;
}

- (IKColor)ikTintColor
{
  return self->_ikTintColor;
}

- (void)setIkTintColor:(id)a3
{
}

- (IKColor)ikDarkTintColor
{
  return self->_ikDarkTintColor;
}

- (void)setIkDarkTintColor:(id)a3
{
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (NSString)placeholderArtworkName
{
  return self->_placeholderArtworkName;
}

- (void)setPlaceholderArtworkName:(id)a3
{
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
}

- (NSString)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(id)a3
{
}

- (IKFourTuple)ikBorderRadius
{
  return self->_ikBorderRadius;
}

- (void)setIkBorderRadius:(id)a3
{
}

- (NSString)inlineTitle
{
  return self->_inlineTitle;
}

- (void)setInlineTitle:(id)a3
{
}

- (BOOL)allowsNonOpaqueShadows
{
  return self->_allowsNonOpaqueShadows;
}

- (void)setAllowsNonOpaqueShadows:(BOOL)a3
{
  self->_allowsNonOpaqueShadows = a3;
}

- (BOOL)useInSearchPartial
{
  return self->_useInSearchPartial;
}

- (void)setUseInSearchPartial:(BOOL)a3
{
  self->_useInSearchPartial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineTitle, 0);
  objc_storeStrong((id *)&self->_ikBorderRadius, 0);
  objc_storeStrong((id *)&self->_imageTreatment, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_placeholderArtworkName, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_ikDarkTintColor, 0);
  objc_storeStrong((id *)&self->_ikTintColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (double)defaultFocusSizeIncrease
{
  if ([(TVViewLayout *)self centerGrowth]) {
    return 60.0;
  }
  [(TVImageLayout *)self decoratorSize];
  double v5 = v4;
  double v7 = v6;
  double upscaleFactor = self->_upscaleFactor;
  BOOL v9 = [(TVImageLayout *)self useInSearchPartial];
  +[TVMLUtilities focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:](TVMLUtilities, "focusedSizeIncreaseForSize:upscaleFactor:useInSearchPartial:", v9, v5, v7, upscaleFactor);
  return result;
}

@end
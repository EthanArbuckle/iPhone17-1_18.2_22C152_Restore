@interface CACLabeledBadgeView
+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6;
+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6 contrasted:(BOOL)a7;
+ (double)_heightForBadgeWithTextWithOrientation:(int64_t)a3;
+ (double)badgeFontSize;
+ (id)_badgeFont;
+ (id)_badgeFontTextStyle;
+ (id)_badgeImageWithDoubleRightArrow;
+ (id)_badgeImageWithDownArrow;
+ (id)_badgeImageWithNoArrow;
+ (id)_badgeImageWithNoArrowAndBorder;
+ (id)_badgeImageWithRightArrow;
+ (id)_badgeImageWithTinyRightArrow;
+ (id)_maskImageForArrowOrientation:(int64_t)a3 badgePresentation:(int64_t)a4 badgeIndicator:(int64_t)a5;
+ (id)imageBundle;
- (BOOL)isContrastBackdrop;
- (CACAdaptiveBackdropView)_backdropView;
- (CACLabeledBadgeView)initWithFrame:(CGRect)a3;
- (CACLabeledBadgeView)initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7;
- (NSString)label;
- (UIImageView)badgeMaskImageView;
- (UILabel)_labelView;
- (id)_initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7 isContrasted:(BOOL)a8;
- (id)contrastedCopy;
- (id)copy;
- (int64_t)arrowOrientation;
- (int64_t)badgeIndicatorMask;
- (int64_t)badgePresentation;
- (void)_setUpSubviews;
- (void)layoutSubviews;
- (void)setBadgeMaskImageView:(id)a3;
- (void)setIsContrastBackdrop:(BOOL)a3;
- (void)set_backdropView:(id)a3;
- (void)set_labelView:(id)a3;
@end

@implementation CACLabeledBadgeView

+ (double)badgeFontSize
{
  v2 = [a1 _badgeFont];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

+ (double)_heightForBadgeWithTextWithOrientation:(int64_t)a3
{
  double v3 = [a1 _badgeFont];
  [v3 lineHeight];
  double v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  UIRoundToScale();
  double v6 = v5;

  return v6;
}

+ (id)_badgeFontTextStyle
{
  return (id)*MEMORY[0x263F835F0];
}

+ (id)_badgeFont
{
  double v3 = [MEMORY[0x263F82438] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  double v6 = (void *)MEMORY[0x263F82770];
  v7 = [a1 _badgeFontTextStyle];
  v8 = [v6 metricsForTextStyle:v7];
  v9 = [MEMORY[0x263F82760] systemFontOfSize:15.0 weight:*MEMORY[0x263F83638]];
  if (IsAccessibilityCategory)
  {
    v10 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83430]];
    v11 = [v8 scaledFontForFont:v9 compatibleWithTraitCollection:v10];
  }
  else
  {
    v11 = [v8 scaledFontForFont:v9];
  }

  return v11;
}

+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6
{
  [a1 sizeOfBadgeGivenNumberOfDisplayedDigits:a3 arrowOrientation:a4 badgePresentation:a5 badgeIndicator:a6 contrasted:0];
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)sizeOfBadgeGivenNumberOfDisplayedDigits:(int64_t)a3 arrowOrientation:(int64_t)a4 badgePresentation:(int64_t)a5 badgeIndicator:(int64_t)a6 contrasted:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = [CACLabeledBadgeView alloc];
  unint64_t v13 = a3 - 1;
  if (v13 > 3)
  {
    v14 = @"88";
  }
  else
  {
    v14 = [&unk_26EB4D118 objectAtIndexedSubscript:v13];
  }
  v15 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v12, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v14, a4, a5, a6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v13 <= 3) {

  }
  -[CACLabeledBadgeView systemLayoutSizeFittingSize:](v15, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  if (v7) {
    double v18 = v17 * 1.08;
  }
  else {
    double v18 = v17;
  }
  if (v7) {
    double v19 = v16 * 1.08;
  }
  else {
    double v19 = v16;
  }

  double v20 = v19;
  double v21 = v18;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (id)_badgeImageWithNoArrow
{
  double v3 = [a1 _badgeFont];
  if (!_badgeImageWithNoArrow_sBadgeFont
    || ([(id)_badgeImageWithNoArrow_sBadgeFont isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithNoArrow_sBadgeFont, v3);
    double v4 = (void *)MEMORY[0x263F827E8];
    double v5 = [a1 imageBundle];
    double v6 = [v4 imageNamed:@"badge-platter-tail-none" inBundle:v5];
    uint64_t v7 = objc_msgSend(v6, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0);
    v8 = (void *)_badgeImageWithNoArrow_sBadgeImage;
    _badgeImageWithNoArrow_sBadgeImage = v7;

    uint64_t v9 = objc_msgSend((id)_badgeImageWithNoArrow_sBadgeImage, "resizableImageWithCapInsets:", 4.0, 4.0, 4.0, 4.0);
    v10 = (void *)_badgeImageWithNoArrow_sBadgeImage;
    _badgeImageWithNoArrow_sBadgeImage = v9;
  }
  id v11 = (id)_badgeImageWithNoArrow_sBadgeImage;

  return v11;
}

+ (id)_badgeImageWithNoArrowAndBorder
{
  double v3 = [a1 _badgeFont];
  if (!_badgeImageWithNoArrowAndBorder_sBadgeFont
    || ([(id)_badgeImageWithNoArrowAndBorder_sBadgeFont isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithNoArrowAndBorder_sBadgeFont, v3);
    double v4 = (void *)MEMORY[0x263F827E8];
    double v5 = [a1 imageBundle];
    double v6 = [v4 imageNamed:@"badge-platter-bordered" inBundle:v5];
    uint64_t v7 = objc_msgSend(v6, "resizableImageWithCapInsets:", 6.5, 6.5, 6.5, 6.5);
    v8 = (void *)_badgeImageWithNoArrowAndBorder_sBadgeImage;
    _badgeImageWithNoArrowAndBorder_sBadgeImage = v7;

    uint64_t v9 = objc_msgSend((id)_badgeImageWithNoArrowAndBorder_sBadgeImage, "resizableImageWithCapInsets:", 6.5, 6.5, 6.5, 6.5);
    v10 = (void *)_badgeImageWithNoArrowAndBorder_sBadgeImage;
    _badgeImageWithNoArrowAndBorder_sBadgeImage = v9;
  }
  id v11 = (id)_badgeImageWithNoArrowAndBorder_sBadgeImage;

  return v11;
}

+ (id)_badgeImageWithRightArrow
{
  double v3 = [a1 _badgeFont];
  if (!_badgeImageWithRightArrow_sBadgeFont
    || ([(id)_badgeImageWithRightArrow_sBadgeFont isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithRightArrow_sBadgeFont, v3);
    double v4 = (void *)MEMORY[0x263F827E8];
    double v5 = [a1 imageBundle];
    double v6 = [v4 imageNamed:@"badge-platter-single-tail-right" inBundle:v5];
    uint64_t v7 = objc_msgSend(v6, "_stretchableImageWithCapInsets:", 0.0, 4.0, 0.0, 12.4);
    v8 = (void *)_badgeImageWithRightArrow_sBadgeImage;
    _badgeImageWithRightArrow_sBadgeImage = v7;
  }
  id v9 = (id)_badgeImageWithRightArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithDownArrow
{
  double v3 = [a1 _badgeFont];
  if (!_badgeImageWithDownArrow_sBadgeFont
    || ([(id)_badgeImageWithDownArrow_sBadgeFont isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithDownArrow_sBadgeFont, v3);
    double v4 = (void *)MEMORY[0x263F827E8];
    double v5 = [a1 imageBundle];
    double v6 = [v4 imageNamed:@"badge-platter-single-tail-down" inBundle:v5];
    uint64_t v7 = objc_msgSend(v6, "_stretchableImageWithCapInsets:", 4.0, 4.0, 12.4, 4.0);
    v8 = (void *)_badgeImageWithDownArrow_sBadgeImage;
    _badgeImageWithDownArrow_sBadgeImage = v7;
  }
  id v9 = (id)_badgeImageWithDownArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithDoubleRightArrow
{
  double v3 = [a1 _badgeFont];
  if (!_badgeImageWithDoubleRightArrow_sBadgeFont
    || ([(id)_badgeImageWithDoubleRightArrow_sBadgeFont isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&_badgeImageWithDoubleRightArrow_sBadgeFont, v3);
    double v4 = (void *)MEMORY[0x263F827E8];
    double v5 = [a1 imageBundle];
    double v6 = [v4 imageNamed:@"badge-platter-double-tail-right" inBundle:v5];
    uint64_t v7 = objc_msgSend(v6, "_stretchableImageWithCapInsets:", 0.0, 4.0, 0.0, 14.4);
    v8 = (void *)_badgeImageWithDoubleRightArrow_sBadgeImage;
    _badgeImageWithDoubleRightArrow_sBadgeImage = v7;
  }
  id v9 = (id)_badgeImageWithDoubleRightArrow_sBadgeImage;

  return v9;
}

+ (id)_badgeImageWithTinyRightArrow
{
  if (_badgeImageWithTinyRightArrow_onceToken != -1) {
    dispatch_once(&_badgeImageWithTinyRightArrow_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)_badgeImageWithTinyRightArrow_sBadgeImage;
  return v2;
}

void __52__CACLabeledBadgeView__badgeImageWithTinyRightArrow__block_invoke()
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 scale];
  CGFloat v2 = v1;
  v9.width = 10.0;
  v9.height = 6.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, v2);

  id v7 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v7, "moveToPoint:", 0.25, 2.25);
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 2.25, 2.25, 2.0, 3.14159265, 4.71238898);
  objc_msgSend(v7, "addLineToPoint:", 4.0, 0.25);
  objc_msgSend(v7, "addLineToPoint:", 9.75, 3.0);
  objc_msgSend(v7, "addLineToPoint:", 4.0, 5.75);
  objc_msgSend(v7, "addLineToPoint:", 2.25, 5.75);
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 2.25, 3.75, 2.0, 1.57079633, 3.14159265);
  [v7 closePath];
  [v7 setLineWidth:0.5];
  double v3 = [MEMORY[0x263F825C8] blackColor];
  [v3 set];

  [v7 fill];
  double v4 = [MEMORY[0x263F825C8] whiteColor];
  [v4 set];

  [v7 stroke];
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  double v6 = (void *)_badgeImageWithTinyRightArrow_sBadgeImage;
  _badgeImageWithTinyRightArrow_sBadgeImage = v5;

  UIGraphicsEndImageContext();
}

+ (id)_maskImageForArrowOrientation:(int64_t)a3 badgePresentation:(int64_t)a4 badgeIndicator:(int64_t)a5
{
  if (a4)
  {
    if (a4 != 2)
    {
      if (a4 == 1)
      {
        uint64_t v5 = [(id)objc_opt_class() _badgeImageWithNoArrowAndBorder];
        goto LABEL_11;
      }
LABEL_9:
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = [(id)objc_opt_class() _badgeImageWithTinyRightArrow];
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        char v7 = a5;
        v8 = objc_opt_class();
        if ((v7 & 2) != 0) {
          [v8 _badgeImageWithDoubleRightArrow];
        }
        else {
        uint64_t v5 = [v8 _badgeImageWithRightArrow];
        }
        goto LABEL_11;
      }
      if (!a3)
      {
        uint64_t v5 = [(id)objc_opt_class() _badgeImageWithNoArrow];
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    uint64_t v5 = [(id)objc_opt_class() _badgeImageWithDownArrow];
  }
LABEL_11:
  return v5;
}

+ (id)imageBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CACLabeledBadgeView_imageBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (imageBundle_onceToken_0 != -1) {
    dispatch_once(&imageBundle_onceToken_0, block);
  }
  CGFloat v2 = (void *)imageBundle_sImageBundle_0;
  return v2;
}

uint64_t __34__CACLabeledBadgeView_imageBundle__block_invoke()
{
  imageBundle_sImageBundle_0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

- (id)_initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7 isContrasted:(BOOL)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CACLabeledBadgeView;
  double v19 = -[CACLabeledBadgeView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  double v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_label, a4);
    v20->_arrowOrientation = a5;
    v20->_badgePresentation = a6;
    v20->_badgeIndicatorMask = a7;
    double v21 = [MEMORY[0x263F825C8] clearColor];
    [(CACLabeledBadgeView *)v20 setBackgroundColor:v21];

    [(CACLabeledBadgeView *)v20 setAlpha:1.0];
    v20->_isContrastBackdrop = a8;
    [(CACLabeledBadgeView *)v20 _setUpSubviews];
  }

  return v20;
}

- (CACLabeledBadgeView)initWithFrame:(CGRect)a3 label:(id)a4 arrowOrientation:(int64_t)a5 badgePresentation:(int64_t)a6 badgeIndicator:(int64_t)a7
{
  return (CACLabeledBadgeView *)-[CACLabeledBadgeView _initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:](self, "_initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:", a4, a5, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CACLabeledBadgeView)initWithFrame:(CGRect)a3
{
  return -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](self, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", &stru_26EB332F0, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)contrastedCopy
{
  [(CACLabeledBadgeView *)self frame];
  double v7 = CACCGRectIncreasedByPercentage(v3, v4, v5, v6, 0.08);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [CACLabeledBadgeView alloc];
  v15 = [(CACLabeledBadgeView *)self label];
  id v16 = -[CACLabeledBadgeView _initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:](v14, "_initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:isContrasted:", v15, [(CACLabeledBadgeView *)self arrowOrientation], [(CACLabeledBadgeView *)self badgePresentation], [(CACLabeledBadgeView *)self badgeIndicatorMask], 1, v7, v9, v11, v13);

  return v16;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CACLabeledBadgeView;
  [(CACLabeledBadgeView *)&v2 layoutSubviews];
}

- (void)_setUpSubviews
{
  v139[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CACLabeledBadgeView *)self addSubview:v8];
  id v9 = objc_alloc(MEMORY[0x263F82828]);
  double v10 = objc_msgSend((id)objc_opt_class(), "_maskImageForArrowOrientation:badgePresentation:badgeIndicator:", -[CACLabeledBadgeView arrowOrientation](self, "arrowOrientation"), -[CACLabeledBadgeView badgePresentation](self, "badgePresentation"), -[CACLabeledBadgeView badgeIndicatorMask](self, "badgeIndicatorMask"));
  double v11 = (void *)[v9 initWithImage:v10];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v134 = v8;
  v135 = v11;
  [v8 addSubview:v11];
  if ([(CACLabeledBadgeView *)self isContrastBackdrop])
  {
    double v12 = +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", v4, v5, v6, v7);
  }
  else
  {
    double v12 = objc_opt_new();
  }
  double v13 = v12;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v13 layer];
  [v14 setCaptureOnly:0];

  uint64_t v15 = *MEMORY[0x263F15D80];
  id v16 = [v13 layer];
  [v16 setCompositingFilter:v15];

  [v8 addSubview:v13];
  double v17 = [(CACLabeledBadgeView *)self layer];
  [v17 setAllowsGroupBlending:0];

  id v18 = [MEMORY[0x263EFF980] array];
  v132 = v13;
  v133 = v18;
  if ([(CACLabeledBadgeView *)self badgePresentation] == 2)
  {
    double v19 = [(id)objc_opt_class() _badgeImageWithTinyRightArrow];
    double v20 = [v135 widthAnchor];
    [v19 size];
    double v21 = -[CACLabeledBadgeView constraintEqualToConstant:](v20, "constraintEqualToConstant:");
    v137[0] = v21;
    v22 = [v135 heightAnchor];
    [v19 size];
    double v24 = v23;
    BOOL v25 = [(CACLabeledBadgeView *)self isContrastBackdrop];
    double v26 = 1.08;
    if (!v25) {
      double v26 = 1.0;
    }
    v27 = [v22 constraintEqualToConstant:v24 * v26];
    v137[1] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:2];
    [v18 addObjectsFromArray:v28];
    goto LABEL_34;
  }
  double v19 = objc_opt_new();
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 setTextAlignment:1];
  v29 = [MEMORY[0x263F825C8] whiteColor];
  [v19 setTextColor:v29];

  v30 = [(id)objc_opt_class() _badgeFont];
  [v19 setFont:v30];

  v31 = [(CACLabeledBadgeView *)self label];
  [v19 setText:v31];

  objc_msgSend(v19, "setHidden:", -[CACLabeledBadgeView isContrastBackdrop](self, "isContrastBackdrop"));
  double v20 = self;
  [(CACLabeledBadgeView *)v20 addSubview:v19];
  v32 = [MEMORY[0x263F82438] sharedApplication];
  v33 = [v32 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v33);

  uint64_t v35 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83430]];
  v36 = (void *)MEMORY[0x263F82770];
  v37 = [(id)objc_opt_class() _badgeFontTextStyle];
  v38 = [v36 metricsForTextStyle:v37];

  v130 = v38;
  if ([(CACLabeledBadgeView *)v20 badgePresentation] != 1
    || ([v19 text],
        v39 = objc_claimAutoreleasedReturnValue(),
        unint64_t v40 = [v39 length],
        v39,
        v38 = v130,
        double v41 = 1.25,
        v40 <= 1))
  {
    uint64_t v42 = [(CACLabeledBadgeView *)v20 arrowOrientation];
    double v41 = 3.0;
    if (v42 == 2)
    {
      v43 = objc_msgSend(v19, "text", 3.0);
      unint64_t v44 = [v43 length];

      v38 = v130;
      double v41 = 3.0;
      if (v44 > 1) {
        double v41 = 1.25;
      }
    }
  }
  if (IsAccessibilityCategory) {
    [v38 scaledValueForValue:v35 compatibleWithTraitCollection:v41];
  }
  else {
    [v38 scaledValueForValue:v41];
  }
  double v46 = v45;
  double v47 = dbl_238415E10[([(CACLabeledBadgeView *)v20 badgeIndicatorMask] & 2) == 0];
  if (IsAccessibilityCategory)
  {
    [v38 scaledValueForValue:v35 compatibleWithTraitCollection:v47];
    double v49 = v48 + v46 * -0.5;
    if ([(CACLabeledBadgeView *)v20 arrowOrientation] == 1) {
      double v50 = v49;
    }
    else {
      double v50 = v46;
    }
    double v51 = 0.0;
    [v38 scaledValueForValue:v35 compatibleWithTraitCollection:0.0];
    double v53 = v52;
    if ([(CACLabeledBadgeView *)v20 badgePresentation] != 1) {
      goto LABEL_28;
    }
    [v38 scaledValueForValue:v35 compatibleWithTraitCollection:2.5];
  }
  else
  {
    [v38 scaledValueForValue:v47];
    double v56 = v55 + v46 * -0.25;
    if ([(CACLabeledBadgeView *)v20 arrowOrientation] == 1) {
      double v50 = v56;
    }
    else {
      double v50 = v46;
    }
    double v51 = 0.0;
    [v38 scaledValueForValue:0.0];
    double v53 = v57;
    if ([(CACLabeledBadgeView *)v20 badgePresentation] != 1) {
      goto LABEL_28;
    }
    [v38 scaledValueForValue:2.5];
  }
  double v51 = v54;
LABEL_28:
  v128 = (void *)v35;
  objc_msgSend((id)objc_opt_class(), "_heightForBadgeWithTextWithOrientation:", -[CACLabeledBadgeView arrowOrientation](v20, "arrowOrientation"));
  double v59 = v58 + v51 * 2.0;
  BOOL v60 = [(CACLabeledBadgeView *)v20 isContrastBackdrop];
  double v61 = 1.08;
  if (!v60) {
    double v61 = 1.0;
  }
  double v62 = v59 * v61;
  uint64_t v63 = [(CACLabeledBadgeView *)v20 arrowOrientation];
  v64 = [v19 topAnchor];
  v28 = [(CACLabeledBadgeView *)v20 topAnchor];
  double v65 = v53 + v51;
  v126 = v64;
  if (v63 == 2)
  {
    v66 = [v64 constraintEqualToAnchor:v28 constant:v65 + 2.0];
    v139[0] = v66;
    v67 = [v19 bottomAnchor];
    v124 = [(CACLabeledBadgeView *)v20 bottomAnchor];
    v122 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", -(v65 + 8.4 + -2.0));
    v139[1] = v122;
    v68 = [v19 leadingAnchor];
    v118 = [(CACLabeledBadgeView *)v20 leadingAnchor];
    v120 = v68;
    v116 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v46 + v51);
    v139[2] = v116;
    v69 = [v19 trailingAnchor];
    v112 = [(CACLabeledBadgeView *)v20 trailingAnchor];
    v114 = v69;
    v110 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", -(v50 + v51));
    v139[3] = v110;
    v70 = [v135 heightAnchor];
    v71 = [v70 constraintEqualToConstant:v62];
    v139[4] = v71;
    v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:5];
    [v133 addObjectsFromArray:v72];
  }
  else
  {
    uint64_t v108 = [v64 constraintEqualToAnchor:v28 constant:v65];
    v138[0] = v108;
    v106 = [v19 bottomAnchor];
    v124 = [(CACLabeledBadgeView *)v20 bottomAnchor];
    v122 = objc_msgSend(v106, "constraintEqualToAnchor:constant:", -v65);
    v138[1] = v122;
    v73 = [v19 leadingAnchor];
    v118 = [(CACLabeledBadgeView *)v20 leadingAnchor];
    v120 = v73;
    v116 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", v46 + v51);
    v138[2] = v116;
    v74 = [v19 trailingAnchor];
    v112 = [(CACLabeledBadgeView *)v20 trailingAnchor];
    v114 = v74;
    v110 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", -(v50 + v51));
    v138[3] = v110;
    v70 = [v135 widthAnchor];
    v71 = [v135 heightAnchor];
    v72 = [v70 constraintGreaterThanOrEqualToAnchor:v71];
    v138[4] = v72;
    v75 = [v135 heightAnchor];
    [v75 constraintEqualToConstant:v62];
    v77 = v76 = v28;
    v138[5] = v77;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:6];
    v79 = v78 = self;
    [v133 addObjectsFromArray:v79];

    self = v78;
    v28 = v76;
    v67 = v106;

    v66 = (void *)v108;
  }
  double v13 = v132;

  double v21 = v128;
  v22 = v130;
  v27 = v126;
LABEL_34:
  v98 = self;

  v131 = [v135 topAnchor];
  v129 = [(CACLabeledBadgeView *)self topAnchor];
  v127 = [v131 constraintEqualToAnchor:v129];
  v136[0] = v127;
  v125 = [v135 bottomAnchor];
  v123 = [(CACLabeledBadgeView *)self bottomAnchor];
  v121 = [v125 constraintEqualToAnchor:v123];
  v136[1] = v121;
  v119 = [v135 leadingAnchor];
  v117 = [(CACLabeledBadgeView *)self leadingAnchor];
  v115 = [v119 constraintEqualToAnchor:v117];
  v136[2] = v115;
  v113 = [v135 trailingAnchor];
  v111 = [(CACLabeledBadgeView *)self trailingAnchor];
  v109 = [v113 constraintEqualToAnchor:v111];
  v136[3] = v109;
  v107 = [v134 topAnchor];
  v105 = [v135 topAnchor];
  v104 = [v107 constraintEqualToAnchor:v105];
  v136[4] = v104;
  v103 = [v134 bottomAnchor];
  v102 = [v135 bottomAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v136[5] = v101;
  v100 = [v134 leadingAnchor];
  v99 = [v135 leadingAnchor];
  v97 = [v100 constraintEqualToAnchor:v99];
  v136[6] = v97;
  v96 = [v134 trailingAnchor];
  v95 = [v135 trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v136[7] = v94;
  v93 = [v13 topAnchor];
  v92 = [(CACLabeledBadgeView *)self topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v136[8] = v91;
  v80 = [v13 bottomAnchor];
  v81 = [(CACLabeledBadgeView *)self bottomAnchor];
  [v80 constraintEqualToAnchor:v81];
  v83 = v82 = v13;
  v136[9] = v83;
  v84 = [v82 leadingAnchor];
  v85 = [(CACLabeledBadgeView *)self leadingAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  v136[10] = v86;
  v87 = [v82 trailingAnchor];
  v88 = [(CACLabeledBadgeView *)self trailingAnchor];
  v89 = [v87 constraintEqualToAnchor:v88];
  v136[11] = v89;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:12];
  [v133 addObjectsFromArray:v90];

  [MEMORY[0x263F08938] activateConstraints:v133];
  [(CACLabeledBadgeView *)v98 setBadgeMaskImageView:v135];
}

- (id)copy
{
  id v3 = [CACLabeledBadgeView alloc];
  [(CACLabeledBadgeView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CACLabeledBadgeView *)self label];
  double v13 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v3, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v12, [(CACLabeledBadgeView *)self arrowOrientation], [(CACLabeledBadgeView *)self badgePresentation], [(CACLabeledBadgeView *)self badgeIndicatorMask], v5, v7, v9, v11);

  return v13;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (int64_t)arrowOrientation
{
  return self->_arrowOrientation;
}

- (int64_t)badgePresentation
{
  return self->_badgePresentation;
}

- (int64_t)badgeIndicatorMask
{
  return self->_badgeIndicatorMask;
}

- (UIImageView)badgeMaskImageView
{
  return self->_badgeMaskImageView;
}

- (void)setBadgeMaskImageView:(id)a3
{
}

- (CACAdaptiveBackdropView)_backdropView
{
  return self->__backdropView;
}

- (void)set_backdropView:(id)a3
{
}

- (UILabel)_labelView
{
  return self->__labelView;
}

- (void)set_labelView:(id)a3
{
}

- (BOOL)isContrastBackdrop
{
  return self->_isContrastBackdrop;
}

- (void)setIsContrastBackdrop:(BOOL)a3
{
  self->_isContrastBackdrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__labelView, 0);
  objc_storeStrong((id *)&self->__backdropView, 0);
  objc_storeStrong((id *)&self->_badgeMaskImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
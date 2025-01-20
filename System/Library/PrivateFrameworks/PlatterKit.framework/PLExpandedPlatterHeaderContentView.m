@interface PLExpandedPlatterHeaderContentView
- (CGRect)_titleLabelBoundsForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_headerHeightForWidth:(double)a3;
- (double)_iconDimension;
- (double)_iconLeadingPadding;
- (double)_iconTrailingPadding;
- (double)_largeTextLabelBaselineOffsetFromBottom;
- (double)_largeTextTitleLabelBaselineOffset;
- (double)_titleFirstLineCenterY;
- (id)_ellipsisHighlightedBackgroundImage;
- (id)_newIconButton;
- (void)_configureIconButton:(id)a3 withIcon:(id)a4;
- (void)_configureUtilityButton;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_layoutTitleLabelWithScale:(double)a3;
- (void)_layoutUtilityButtonWithScale:(double)a3;
- (void)_updateStylingForTitleLabel:(id)a3;
- (void)_updateUtilityButtonFont;
@end

@implementation PLExpandedPlatterHeaderContentView

- (double)_iconDimension
{
  return 20.0;
}

- (double)_iconLeadingPadding
{
  return 16.0;
}

- (double)_iconTrailingPadding
{
  return 8.0;
}

- (double)_headerHeightForWidth:(double)a3
{
  BOOL v5 = [(PLPlatterHeaderContentView *)self _usesLargeTextLayout];
  if (a3 <= 0.0 || !v5)
  {
    v8 = [(PLPlatterHeaderContentView *)self _titleLabelFont];
    [v8 _scaledValueForValue:16.0];
    double v10 = v7 * 2.0 + 20.0;
  }
  else
  {
    [(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection];
    -[PLExpandedPlatterHeaderContentView _titleLabelBoundsForSize:](self, "_titleLabelBoundsForSize:", a3 + -16.0 + -56.0, 1.79769313e308);
    [(PLExpandedPlatterHeaderContentView *)self _largeTextLabelBaselineOffsetFromBottom];
    v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
    UIRoundToScale();
    double v10 = v9;
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0)
  {
    CGFloat width = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    CGFloat width = a3.width;
    -[PLExpandedPlatterHeaderContentView _headerHeightForWidth:](self, "_headerHeightForWidth:");
    double v5 = v4;
  }
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterHeaderContentView;
  [(PLExpandedPlatterHeaderContentView *)&v10 _dynamicUserInterfaceTraitDidChange];
  v3 = +[PLMappedImageCache sharedCache];
  double v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = [v4 stringWithFormat:@"%@.ellipsesHighlightImage", v6];
  [v3 removeImageForKey:v7];

  v8 = [(PLPlatterHeaderContentView *)self _utilityButton];
  double v9 = [(PLExpandedPlatterHeaderContentView *)self _ellipsisHighlightedBackgroundImage];
  [v8 setBackgroundImage:v9 forState:1];

  [(PLExpandedPlatterHeaderContentView *)self setNeedsLayout];
}

- (id)_newIconButton
{
  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterHeaderContentView;
  id v3 = [(PLPlatterHeaderContentView *)&v8 _newIconButton];
  double v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [v3 setPointerInteractionEnabled:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PLExpandedPlatterHeaderContentView__newIconButton__block_invoke;
    v7[3] = &unk_1E6B5FF20;
    v7[4] = self;
    [v3 setPointerStyleProvider:v7];
  }
  return v3;
}

id __52__PLExpandedPlatterHeaderContentView__newIconButton__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F42ED8]);
  id v3 = [*(id *)(a1 + 32) iconButtons];
  double v4 = [v3 firstObject];
  uint64_t v5 = [v4 imageView];
  double v6 = (void *)[v2 initWithView:v5];

  double v7 = [MEMORY[0x1E4F42CA8] effectWithPreview:v6];
  objc_super v8 = [MEMORY[0x1E4F42CC0] styleWithEffect:v7 shape:0];

  return v8;
}

- (void)_configureIconButton:(id)a3 withIcon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(PLExpandedPlatterHeaderContentView *)self traitCollection];
  double v9 = objc_msgSend(v6, "mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterHeaderContentView;
  [(PLPlatterHeaderContentView *)&v10 _configureIconButton:v7 withIcon:v9];
}

- (void)_updateStylingForTitleLabel:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = a3;
  id v5 = [v3 _secondaryLabelColor];
  [v4 setTextColor:v5];
}

- (void)_updateUtilityButtonFont
{
  id v3 = [(PLPlatterHeaderContentView *)self _utilityButton];

  if (v3)
  {
    id v7 = [(PLPlatterHeaderContentView *)self utilityButton];
    id v4 = [v7 titleLabel];
    id v5 = [(PLPlatterHeaderContentView *)self _fontProvider];
    id v6 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:8];
    [v4 setFont:v6];
  }
}

- (id)_ellipsisHighlightedBackgroundImage
{
  id v2 = +[PLMappedImageCache sharedCache];
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@.ellipsesHighlightImage", v5];
  id v7 = [v2 imageForKey:v6 generatingIfNecessaryWithBlock:&__block_literal_global_5];

  return v7;
}

id __73__PLExpandedPlatterHeaderContentView__ellipsisHighlightedBackgroundImage__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  BSRectWithSize();
  objc_msgSend(v0, "setBounds:");
  id v1 = [MEMORY[0x1E4F428B8] _tertiaryLabelColor];
  objc_msgSend(v0, "setBackgroundColor:", objc_msgSend(v1, "CGColor"));

  [v0 setCornerRadius:15.0];
  double v2 = PLMainScreenScale();
  v6.height = 30.0;
  v6.CGFloat width = 40.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, v2);
  [v0 renderInContext:UIGraphicsGetCurrentContext()];
  id v3 = UIGraphicsGetImageFromCurrentImageContext();

  return v3;
}

- (void)_configureUtilityButton
{
  v16.receiver = self;
  v16.super_class = (Class)PLExpandedPlatterHeaderContentView;
  [(PLPlatterHeaderContentView *)&v16 _configureUtilityButton];
  id v3 = (void *)MEMORY[0x1E4F42A80];
  id v4 = PlatterKitFrameworkBundle();
  id v5 = [v3 imageNamed:@"ellipsis" inBundle:v4];
  CGSize v6 = [MEMORY[0x1E4F428B8] _secondaryLabelColor];
  id v7 = [v5 _flatImageWithColor:v6];

  objc_super v8 = [(PLPlatterHeaderContentView *)self utilityButton];
  [v8 setImage:v7 forState:0];

  double v9 = [(PLPlatterHeaderContentView *)self utilityButton];
  objc_super v10 = [(PLExpandedPlatterHeaderContentView *)self _ellipsisHighlightedBackgroundImage];
  [v9 setBackgroundImage:v10 forState:1];

  v11 = [(PLPlatterHeaderContentView *)self utilityButton];
  [v11 setAdjustsImageWhenHighlighted:0];

  v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v14 = [(PLPlatterHeaderContentView *)self utilityButton];
    [v14 setPointerInteractionEnabled:1];

    v15 = [(PLPlatterHeaderContentView *)self utilityButton];
    [v15 setPointerStyleProvider:&__block_literal_global_21];
  }
  [(PLExpandedPlatterHeaderContentView *)self _updateUtilityButtonVibrantStyling];
}

id __61__PLExpandedPlatterHeaderContentView__configureUtilityButton__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (objc_class *)MEMORY[0x1E4F42ED8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithView:v3];
  id v5 = [MEMORY[0x1E4F42C88] effectWithPreview:v4];
  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", v7, v9, v11, v13, 13.0);
  v15 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:v14];

  return v15;
}

- (void)_layoutTitleLabelWithScale:(double)a3
{
  id v4 = [(PLPlatterHeaderContentView *)self _titleLabel];
  if (v4)
  {
    id v49 = v4;
    [(PLExpandedPlatterHeaderContentView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    BOOL v13 = [(PLPlatterHeaderContentView *)self _usesLargeTextLayout];
    int v14 = [(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection];
    if (v13)
    {
      [(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection];
      v51.origin.x = v6;
      v51.origin.y = v8;
      v51.size.CGFloat width = v10;
      v51.size.height = v12;
      -[PLExpandedPlatterHeaderContentView _titleLabelBoundsForSize:](self, "_titleLabelBoundsForSize:", CGRectGetWidth(v51) + -16.0 + -56.0, 1.79769313e308);
      objc_msgSend(v49, "setBounds:");
      [v49 frame];
      CGFloat v46 = v16;
      CGFloat v48 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      v21 = [(PLPlatterHeaderContentView *)self iconButtons];
      [v21 count];

      if (v14)
      {
        v52.origin.x = v6;
        v52.origin.y = v8;
        v52.size.CGFloat width = v10;
        v52.size.height = v12;
        CGRectGetWidth(v52);
        v53.origin.y = v46;
        v53.origin.x = v48;
        v53.size.CGFloat width = v18;
        v53.size.height = v20;
        CGRectGetWidth(v53);
      }
      [(PLExpandedPlatterHeaderContentView *)self _largeTextTitleLabelBaselineOffset];
      [v49 _firstLineBaselineOffsetFromBoundsTop];
    }
    else
    {
      [v49 sizeToFit];
      [v49 frame];
      CGFloat v45 = v22;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      v29 = [(PLPlatterHeaderContentView *)self _dateLabel];
      if (v29)
      {
        double v30 = 72.0;
      }
      else
      {
        v31 = [(PLPlatterHeaderContentView *)self _utilityButton];
        if (v31) {
          double v30 = 72.0;
        }
        else {
          double v30 = 0.0;
        }
      }
      CGFloat v47 = v28;
      CGFloat v32 = v24;
      CGFloat v33 = v26;
      CGFloat v34 = v6;
      if (v14)
      {
        CGFloat v35 = v8;
      }
      else
      {
        v54.origin.x = v6;
        CGFloat v35 = v8;
        v54.origin.y = v8;
        v54.size.CGFloat width = v10;
        v54.size.height = v12;
        double v30 = CGRectGetMaxX(v54) - v30;
      }
      v36 = [(PLPlatterHeaderContentView *)self iconButtons];
      if ([v36 count]) {
        double v37 = 16.0;
      }
      else {
        double v37 = 17.0;
      }

      if (v14)
      {
        v55.origin.x = v34;
        v55.origin.y = v35;
        v55.size.CGFloat width = v10;
        v55.size.height = v12;
        CGFloat v43 = v10;
        CGFloat v44 = v12;
        CGFloat v38 = CGRectGetWidth(v55) - v37;
        v56.origin.y = v32;
        v56.size.CGFloat width = v33;
        v56.origin.x = v45;
        v56.size.height = v47;
        double v39 = v38 - CGRectGetWidth(v56);
        if (v30 >= v39) {
          CGFloat v40 = v30;
        }
        else {
          CGFloat v40 = v39;
        }
        v57.origin.x = v40;
        v57.origin.y = v32;
        v57.size.CGFloat width = v33;
        v57.size.height = v47;
        CGRectGetWidth(v57);
        v58.origin.x = v34;
        v58.origin.y = v35;
        v58.size.CGFloat width = v10;
        v58.size.height = v44;
        CGRectGetMaxX(v58);
        v59.origin.x = v40;
        v59.origin.y = v32;
        v59.size.CGFloat width = v33;
        v59.size.height = v47;
        CGRectGetMinX(v59);
      }
      else
      {
        v60.origin.x = v37;
        v60.origin.y = v32;
        v60.size.CGFloat width = v33;
        v60.size.height = v47;
        CGRectGetWidth(v60);
        v61.origin.x = v37;
        v61.origin.y = v32;
        v61.size.CGFloat width = v33;
        v61.size.height = v47;
        CGRectGetMinX(v61);
      }
      v41 = objc_msgSend(v49, "font", *(void *)&v43, *(void *)&v44);
      [v41 capHeight];
      v42 = [v49 font];
      [v42 _scaledValueForValue:16.0];
      [v49 _firstLineBaselineOffsetFromBoundsTop];
    }
    UIRectIntegralWithScale();
    objc_msgSend(v49, "setFrame:");
    id v4 = v49;
  }
}

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  id v24 = [(PLPlatterHeaderContentView *)self utilityButton];
  BSRectWithSize();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(PLPlatterHeaderContentView *)self _utilityButtonHorizontalLayoutReference];
  if (v12 <= 0.0)
  {
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.CGFloat width = v9;
    v27.size.height = v11;
    double Width = CGRectGetWidth(v27);
    double v19 = [v24 imageForState:0];
    [v19 size];
    double v21 = (Width - v20) * 0.5;

    if ([(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection])
    {
      [(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection];
      double v14 = 16.0 - v21;
    }
    else
    {
      [(PLExpandedPlatterHeaderContentView *)self bounds];
      double v22 = CGRectGetWidth(v28);
      [(PLExpandedPlatterHeaderContentView *)self _shouldReverseLayoutDirection];
      double v14 = v21 + v22 + -16.0 + -40.0;
    }
  }
  else
  {
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.CGFloat width = v9;
    v26.size.height = v11;
    CGRectGetMidY(v26);
    UIRectCenteredAboutPoint();
    double v14 = v13;
    CGFloat v7 = v15;
    CGFloat v9 = v16;
    CGFloat v11 = v17;
  }
  [(PLExpandedPlatterHeaderContentView *)self frame];
  [(PLExpandedPlatterHeaderContentView *)self _headerHeightForWidth:v23];
  if ([(PLPlatterHeaderContentView *)self _usesLargeTextLayout])
  {
    [(PLExpandedPlatterHeaderContentView *)self _titleFirstLineCenterY];
  }
  else
  {
    v29.origin.x = v14;
    v29.origin.y = v7;
    v29.size.CGFloat width = v9;
    v29.size.height = v11;
    CGRectGetHeight(v29);
  }
  UIRectIntegralWithScale();
  objc_msgSend(v24, "setFrame:");
}

- (double)_titleFirstLineCenterY
{
  id v3 = [(PLPlatterHeaderContentView *)self _titleLabelFont];
  [v3 capHeight];
  double v5 = v4;

  [(PLExpandedPlatterHeaderContentView *)self _largeTextTitleLabelBaselineOffset];
  return v6 + v5 * -0.5;
}

- (CGRect)_titleLabelBoundsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(PLPlatterHeaderContentView *)self _titleLabel];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  BSRectWithSize();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)_largeTextTitleLabelBaselineOffset
{
  double v2 = [(PLPlatterHeaderContentView *)self _titleLabelFont];
  [v2 _scaledValueForValue:16.5];
  double v4 = v3;

  return v4;
}

- (double)_largeTextLabelBaselineOffsetFromBottom
{
  double v2 = [(PLPlatterHeaderContentView *)self _titleLabelFont];
  [v2 _scaledValueForValue:6.5];
  double v4 = v3;

  return v4;
}

@end
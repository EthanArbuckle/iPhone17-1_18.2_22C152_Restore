@interface TLKTextButton
- (BOOL)allowsVibrancy;
- (BOOL)alwaysShowPlaceholderView;
- (BOOL)attributedTitleExplicitlySet;
- (BOOL)hasTemplateUIImage;
- (BOOL)isImageMode;
- (BOOL)matchesHeightForAlignmentRectWithIntrinsicContentSize;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)maximumLayoutSize;
- (CGSize)minimumLayoutSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (TLKImage)tlkImage;
- (TLKImageView)tlkImageView;
- (TLKRichText)richTitle;
- (TLKTextButton)init;
- (UIFont)font;
- (int64_t)alignment;
- (unint64_t)prominence;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary;
- (void)setAlignment:(int64_t)a3;
- (void)setAlwaysShowPlaceholderView:(BOOL)a3;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setAttributedTitleExplicitlySet:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setMatchesHeightForAlignmentRectWithIntrinsicContentSize:(BOOL)a3;
- (void)setMaximumLayoutSize:(CGSize)a3;
- (void)setMinimumLayoutSize:(CGSize)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setRichTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTlkImage:(id)a3;
- (void)setTlkImageView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAttributedTitle;
- (void)updateImageViewAlignment;
@end

@implementation TLKTextButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TLKTextButton;
  [(TLKTextButton *)&v5 setImage:a3 forState:a4];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (UIFont)font
{
  v2 = [(TLKTextButton *)self titleLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TLKTextButton;
  [(TLKTextButton *)&v12 layoutSubviews];
  [(TLKTextButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TLKTextButton *)self tlkImageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (TLKImageView)tlkImageView
{
  return self->_tlkImageView;
}

void __41__TLKTextButton_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) titleLabel];
  [v2 enableAppearanceForView:v3];

  LODWORD(v3) = [*(id *)(a1 + 40) hasTemplateUIImage];
  double v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) imageView];
  if (v3) {
    [v4 enableAppearanceForView:v5];
  }
  else {
    [v4 disableAppearanceForView:v5];
  }
}

- (BOOL)hasTemplateUIImage
{
  v2 = [(TLKTextButton *)self imageView];
  double v3 = [v2 image];

  LOBYTE(v2) = +[TLKImage isTemplateImage:v3];
  return (char)v2;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLKTextButton;
  [(UIView *)&v15 tlk_updateForAppearance:v4];
  id v5 = objc_msgSend(v4, "buttonColorForProminence:", -[TLKTextButton prominence](self, "prominence"));
  [(TLKTextButton *)self setTintColor:v5];

  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __41__TLKTextButton_tlk_updateForAppearance___block_invoke;
  objc_super v12 = &unk_1E5FD3020;
  id v7 = v4;
  id v13 = v7;
  v14 = self;
  [v6 performWithoutAnimation:&v9];
  if ([(TLKTextButton *)self isImageMode]
    && ![(TLKTextButton *)self hasTemplateUIImage])
  {
    double v8 = [(TLKTextButton *)self imageView];
    +[TLKView makeContainerShadowCompatible:v8];
  }
  if ([(TLKTextButton *)self isImageMode]
    && ![(TLKTextButton *)self hasTemplateUIImage])
  {
    [v7 disableAppearanceForView:self];
  }
  else
  {
    [v7 enableAppearanceForView:self];
  }
  [(TLKTextButton *)self updateAttributedTitle];
  [(TLKTextButton *)self matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary];
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (void)updateAttributedTitle
{
  if (![(TLKTextButton *)self attributedTitleExplicitlySet])
  {
    double v3 = [(TLKTextButton *)self font];
    id v4 = [(TLKTextButton *)self titleLabel];
    int v5 = [v4 adjustsFontForContentSizeCategory];

    if (v5)
    {
      uint64_t v6 = [v3 _fontAdjustedForCurrentContentSizeCategory];

      double v3 = (void *)v6;
    }
    id v7 = [(TLKTextButton *)self richTitle];
    double v8 = +[TLKAppearance bestAppearanceForView:self];
    unint64_t v9 = [(TLKTextButton *)self prominence];
    int64_t v10 = [(TLKTextButton *)self alignment];
    [(TLKTextButton *)self effectiveScreenScale];
    double v12 = v11;
    id v13 = +[TLKAppearance bestAppearanceForView:self];
    LOBYTE(v17) = [v13 isDark];
    v14 = +[TLKFontUtilities attributedStringForRichText:v7 appearance:v8 prominence:v9 alignment:v10 font:v3 isButton:1 scale:v12 isDark:v17];
    objc_super v15 = (void *)[v14 mutableCopy];

    v18.receiver = self;
    v18.super_class = (Class)TLKTextButton;
    [(TLKTextButton *)&v18 setAttributedTitle:v15 forState:0];
    if (![(TLKTextButton *)self isImageMode])
    {
      v16 = [(TLKTextButton *)self tlkImageView];
      [v16 setTlkImage:0];
    }
  }
}

- (void)matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary
{
  [(TLKTextButton *)self customAlignmentRectInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (![(TLKTextButton *)self matchesHeightForAlignmentRectWithIntrinsicContentSize])goto LABEL_16; {
  double v12 = [(TLKTextButton *)self attributedTitleForState:0];
  }
  uint64_t v13 = [v12 length];
  if (!v13)
  {
    v2 = [(TLKTextButton *)self richTitle];
    if (!v2)
    {
      double v16 = 0.0;
LABEL_7:

      goto LABEL_8;
    }
  }
  v14 = [(TLKTextButton *)self titleLabel];
  [v14 intrinsicContentSize];
  double v16 = v15;

  if (!v13) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v17 = [(TLKTextButton *)self tlkImage];
  [v17 size];
  if (v18 == 0.0)
  {
    v19 = [(TLKTextButton *)self tlkImage];
    v20 = [v19 uiImage];
    [v20 size];
    double v22 = v21;
  }
  else
  {
    double v22 = v18;
  }

  if (v16 < v22) {
    double v16 = v22;
  }
  if (v16 != 0.0)
  {
    [(TLKTextButton *)self intrinsicContentSize];
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:(v23 - v16) * 0.5];
    double v9 = v24;
    double v11 = 0.0;
    double v7 = 0.0;
    double v5 = v24;
  }

LABEL_16:
  -[TLKTextButton setCustomAlignmentRectInsets:](self, "setCustomAlignmentRectInsets:", v5, v7, v9, v11);
}

- (BOOL)isImageMode
{
  double v3 = [(TLKTextButton *)self richTitle];
  if ([v3 hasContent])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(TLKTextButton *)self title];
    if ([v5 length])
    {
      BOOL v4 = 0;
    }
    else
    {
      double v6 = [(TLKTextButton *)self tlkImage];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (TLKRichText)richTitle
{
  return self->_richTitle;
}

- (TLKImage)tlkImage
{
  return self->_tlkImage;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)matchesHeightForAlignmentRectWithIntrinsicContentSize
{
  return self->_matchesHeightForAlignmentRectWithIntrinsicContentSize;
}

- (BOOL)attributedTitleExplicitlySet
{
  return self->_attributedTitleExplicitlySet;
}

- (CGSize)intrinsicContentSize
{
  if ([(TLKTextButton *)self isImageMode])
  {
    double v3 = [(TLKTextButton *)self tlkImageView];
    [v3 intrinsicContentSize];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TLKTextButton;
    [(TLKTextButton *)&v10 intrinsicContentSize];
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setMatchesHeightForAlignmentRectWithIntrinsicContentSize:(BOOL)a3
{
  self->_matchesHeightForAlignmentRectWithIntrinsicContentSize = a3;
}

- (TLKTextButton)init
{
  double v3 = [(id)objc_opt_class() buttonWithType:1];

  if (v3)
  {
    double v4 = [(TLKTextButton *)v3 layer];
    [v4 setAllowsGroupOpacity:0];

    [(TLKTextButton *)v3 _setDisableAutomaticTitleAnimations:1];
  }
  return v3;
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  BOOL v6 = a3 != 0;
  id v7 = a3;
  [(TLKTextButton *)self setAttributedTitleExplicitlySet:v6];
  v8.receiver = self;
  v8.super_class = (Class)TLKTextButton;
  [(TLKTextButton *)&v8 setAttributedTitle:v7 forState:a4];
}

- (void)setAttributedTitleExplicitlySet:(BOOL)a3
{
  self->_attributedTitleExplicitlySet = a3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    [(UIView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkImageView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tlkImage, 0);
  objc_storeStrong((id *)&self->_richTitle, 0);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKTextButton;
  [(TLKTextButton *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(TLKTextButton *)self isImageMode])
  {
    BOOL v6 = [(TLKTextButton *)self tlkImageView];
    objc_msgSend(v6, "sizeThatFits:", width, height);
    double v8 = v7;
    double v10 = v9;

    double v11 = v8;
    double v12 = v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TLKTextButton;
    -[TLKTextButton sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(TLKTextButton *)self isImageMode])
  {
    v16.receiver = self;
    v16.super_class = (Class)TLKTextButton;
    -[TLKTextButton imageRectForContentRect:](&v16, sel_imageRectForContentRect_, x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  double v5 = [(TLKTextButton *)self titleLabel];
  [v5 setFont:v4];

  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  BOOL v6 = +[TLKMultilineText textWithString:v5];
  richTitle = self->_richTitle;
  self->_richTitle = v6;

  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKTextButton;
  [(TLKTextButton *)&v9 traitCollectionDidChange:v4];
  id v5 = [(TLKTextButton *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  BOOL v6 = [(TLKTextButton *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (BOOL)allowsVibrancy
{
  return ![(TLKTextButton *)self isImageMode];
}

- (void)setTlkImage:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_tlkImage, a3);
  id v5 = [(TLKTextButton *)self tlkImageView];

  if (!v5)
  {
    BOOL v6 = objc_opt_new();
    [(TLKTextButton *)self setTlkImageView:v6];

    [(TLKTextButton *)self updateImageViewAlignment];
    uint64_t v7 = objc_opt_new();
    [(TLKTextButton *)self setImage:v7 forState:0];

    uint64_t v8 = [(TLKTextButton *)self imageView];
    objc_super v9 = [(TLKTextButton *)self tlkImageView];
    [v8 addSubview:v9];
  }
  double v10 = [(TLKTextButton *)self tlkImageView];
  [v10 setTlkImage:v12];

  double v11 = [(TLKTextButton *)self tlkImageView];
  [v11 setHidden:v12 == 0];

  [(UIView *)self tlk_updateWithCurrentAppearance];
  [(TLKTextButton *)self invalidateIntrinsicContentSize];
}

- (CGSize)maximumLayoutSize
{
  v2 = [(TLKTextButton *)self tlkImageView];
  [v2 maximumLayoutSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setMaximumLayoutSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(TLKTextButton *)self tlkImageView];
  objc_msgSend(v5, "setMaximumLayoutSize:", width, height);
}

- (CGSize)minimumLayoutSize
{
  v2 = [(TLKTextButton *)self tlkImageView];
  [v2 minimumLayoutSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setMinimumLayoutSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(TLKTextButton *)self tlkImageView];
  objc_msgSend(v5, "setMinimumLayoutSize:", width, height);
}

- (BOOL)alwaysShowPlaceholderView
{
  v2 = [(TLKTextButton *)self tlkImageView];
  BOOL v3 = [v2 placeholderVisibility] == 1;

  return v3;
}

- (void)setAlwaysShowPlaceholderView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKTextButton *)self tlkImageView];
  [v4 setPlaceholderVisibility:v3];
}

- (void)setRichTitle:(id)a3
{
  id v5 = (TLKRichText *)a3;
  p_richTitle = &self->_richTitle;
  if (self->_richTitle != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_richTitle, a3);
    double v7 = [(TLKTextButton *)self window];

    if (v7) {
      p_richTitle = (TLKRichText **)[(UIView *)self tlk_updateWithCurrentAppearance];
    }
    else {
      p_richTitle = (TLKRichText **)[(TLKTextButton *)self updateAttributedTitle];
    }
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](p_richTitle, v5);
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
  [(TLKTextButton *)self updateAttributedTitle];
  [(TLKTextButton *)self updateImageViewAlignment];
}

- (void)updateImageViewAlignment
{
  BOOL v3 = [(TLKTextButton *)self alignment] == 2;
  id v4 = [(TLKTextButton *)self tlkImageView];
  [v4 setAlignment:v3];
}

- (void)setTlkImageView:(id)a3
{
}

@end
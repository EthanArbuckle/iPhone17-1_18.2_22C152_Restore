@interface _UIActivityContentTitleView
- (BOOL)customButtonMode;
- (BOOL)hasCloseButton;
- (BOOL)isCloseButtonOnLeadingEdge;
- (BOOL)photosCarouselMode;
- (LPLinkView)linkView;
- (int64_t)preferredContentSizeForSize:(int64_t)a3;
- (void)_updateContent;
- (void)contentDidChange;
- (void)layoutSubviews;
- (void)setCustomButtonMode:(BOOL)a3;
- (void)setHasCloseButton:(BOOL)a3;
- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3;
- (void)setLinkView:(id)a3;
- (void)setPhotosCarouselMode:(BOOL)a3;
@end

@implementation _UIActivityContentTitleView

- (void)setLinkView:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_linkView;
  v7 = (LPLinkView *)v5;
  v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      char v9 = [(LPLinkView *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_linkView, a3);
    [(_UIActivityContentTitleView *)self addSubview:v8];
    v21 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(_UIActivityContentTitleView *)self linkView];
    v27 = [v29 leadingAnchor];
    v28 = [(_UIActivityContentTitleView *)self layoutMarginsGuide];
    v26 = [v28 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(_UIActivityContentTitleView *)self linkView];
    v22 = [v24 trailingAnchor];
    v23 = [(_UIActivityContentTitleView *)self layoutMarginsGuide];
    v20 = [v23 trailingAnchor];
    v19 = [v22 constraintEqualToAnchor:v20];
    v30[1] = v19;
    v18 = [(_UIActivityContentTitleView *)self linkView];
    v10 = [v18 heightAnchor];
    v11 = [(_UIActivityContentTitleView *)self heightAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v30[2] = v12;
    v13 = [(_UIActivityContentTitleView *)self linkView];
    v14 = [v13 centerYAnchor];
    v15 = [(_UIActivityContentTitleView *)self centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v30[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v21 activateConstraints:v17];

    [(_UIActivityContentTitleView *)self _updateContent];
  }
LABEL_8:
}

- (void)setHasCloseButton:(BOOL)a3
{
  if (self->_hasCloseButton != a3)
  {
    self->_hasCloseButton = a3;
    [(_UIActivityContentTitleView *)self setNeedsLayout];
  }
}

- (void)setPhotosCarouselMode:(BOOL)a3
{
  if (self->_photosCarouselMode != a3)
  {
    self->_photosCarouselMode = a3;
    [(_UIActivityContentTitleView *)self _updateContent];
    [(_UIActivityContentTitleView *)self setNeedsLayout];
    [(_UINavigationBarTitleView *)self preferredContentSizeDidChange];
  }
}

- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3
{
  if (self->_isCloseButtonOnLeadingEdge != a3)
  {
    self->_isCloseButtonOnLeadingEdge = a3;
    [(_UIActivityContentTitleView *)self setNeedsLayout];
  }
}

- (void)_updateContent
{
  BOOL v3 = [(_UIActivityContentTitleView *)self photosCarouselMode];
  v4 = [(_UIActivityContentTitleView *)self linkView];
  [v4 setHidden:v3];

  uint64_t v5 = [(_UIActivityContentTitleView *)self photosCarouselMode] ^ 1;
  [(_UINavigationBarTitleView *)self setHideStandardTitle:v5];
}

- (void)contentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityContentTitleView;
  [(_UINavigationBarTitleView *)&v3 contentDidChange];
  [(_UIActivityContentTitleView *)self setNeedsLayout];
}

- (int64_t)preferredContentSizeForSize:(int64_t)a3
{
  if ([(_UIActivityContentTitleView *)self photosCarouselMode]) {
    return a3;
  }
  else {
    return 3;
  }
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)_UIActivityContentTitleView;
  [(_UIActivityContentTitleView *)&v34 layoutSubviews];
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([(_UIActivityContentTitleView *)self hasCloseButton])
  {
    v7 = [(_UINavigationBarTitleView *)self contentOverlayRects];
    v8 = [v7 firstObject];
    [v8 CGRectValue];
    double v10 = v9;

    int v11 = dyld_program_sdk_at_least();
    if (v10 == 0.0) {
      int v12 = v11;
    }
    else {
      int v12 = 1;
    }
    if (v12) {
      double v13 = v10 + 16.0;
    }
    else {
      double v13 = 59.0;
    }
    v14 = [(_UIActivityContentTitleView *)self linkView];
    uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

    BOOL v16 = [(_UIActivityContentTitleView *)self isCloseButtonOnLeadingEdge];
    BOOL v17 = [(_UIActivityContentTitleView *)self isCloseButtonOnLeadingEdge];
    if (v16) {
      double v18 = v13;
    }
    else {
      double v18 = v4;
    }
    if (v17) {
      double v19 = v6;
    }
    else {
      double v19 = v13;
    }
    if (v16) {
      double v20 = v4;
    }
    else {
      double v20 = v13;
    }
    if (v17) {
      double v21 = v13;
    }
    else {
      double v21 = v6;
    }
    if (v15 == 1) {
      double v6 = v21;
    }
    else {
      double v6 = v19;
    }
    if (v15 == 1) {
      double v4 = v20;
    }
    else {
      double v4 = v18;
    }
  }
  v22 = [(_UIActivityContentTitleView *)self linkView];
  objc_msgSend(v22, "_setTextSafeAreaInset:", v3, v4, v5, v6);

  [(_UIActivityContentTitleView *)self size];
  double v24 = v23;
  [(_UIActivityContentTitleView *)self layoutMargins];
  double v26 = v25;
  [(_UIActivityContentTitleView *)self layoutMargins];
  double v28 = v27;
  BOOL v29 = [(_UIActivityContentTitleView *)self photosCarouselMode];
  double v30 = 0.0;
  if (!v29)
  {
    v31 = [(_UIActivityContentTitleView *)self linkView];
    objc_msgSend(v31, "sizeThatFits:", v24 - (v26 + v28), 1.79769313e308);
    double v33 = v32;

    double v30 = 72.0;
    if (v33 >= 72.0) {
      double v30 = v33;
    }
  }
  [(_UINavigationBarTitleView *)self setHeight:v30];
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (BOOL)photosCarouselMode
{
  return self->_photosCarouselMode;
}

- (BOOL)customButtonMode
{
  return self->_customButtonMode;
}

- (void)setCustomButtonMode:(BOOL)a3
{
  self->_customButtonMode = a3;
}

- (BOOL)isCloseButtonOnLeadingEdge
{
  return self->_isCloseButtonOnLeadingEdge;
}

- (BOOL)hasCloseButton
{
  return self->_hasCloseButton;
}

- (void).cxx_destruct
{
}

@end
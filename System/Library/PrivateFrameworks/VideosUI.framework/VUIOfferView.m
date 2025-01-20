@interface VUIOfferView
- (BOOL)_shouldDisplaySeparator;
- (BOOL)isEntitled;
- (CGSize)computeSizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIEdgeInsets)padding;
- (UIView)appIconView;
- (UIView)channelImageBackgroundView;
- (UIView)imageView;
- (UIView)logoView;
- (UIView)versionsButton;
- (VUILabel)channelNameLabel;
- (VUILabel)subtitleLabel;
- (VUILabel)textLabel;
- (VUILabel)titleLabel;
- (VUISeparatorView)separatorView;
- (double)_chinHeightForSize:(CGSize)a3;
- (double)secondLineBaselineMargin;
- (double)topPartAspectRatio;
- (void)layoutOfferSubviewsWithSize:(CGSize)a3;
- (void)prepareForCellReuse;
- (void)setAppIconView:(id)a3;
- (void)setChannelImageBackgroundView:(id)a3;
- (void)setChannelNameLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsEntitled:(BOOL)a3;
- (void)setLogoView:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSecondLineBaselineMargin:(double)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopPartAspectRatio:(double)a3;
- (void)setVersionsButton:(id)a3;
@end

@implementation VUIOfferView

- (void)prepareForCellReuse
{
  __35__VUIOfferView_prepareForCellReuse__block_invoke((uint64_t)self, self->_imageView);
  __35__VUIOfferView_prepareForCellReuse__block_invoke(v3, self->_logoView);
  __35__VUIOfferView_prepareForCellReuse__block_invoke(v4, self->_appIconView);
  [(VUILabel *)self->_channelNameLabel setVuiText:0];
  [(VUILabel *)self->_titleLabel setVuiText:0];
  [(VUILabel *)self->_subtitleLabel setVuiText:0];
  textLabel = self->_textLabel;
  [(VUILabel *)textLabel setVuiText:0];
}

void __35__VUIOfferView_prepareForCellReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 setImage:0];
  }
}

- (void)setChannelImageBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_channelImageBackgroundView];
  if (self->_channelImageBackgroundView != v5) {
    objc_storeStrong((id *)&self->_channelImageBackgroundView, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setChannelNameLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_channelNameLabel];
  if (self->_channelNameLabel != v5) {
    objc_storeStrong((id *)&self->_channelNameLabel, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_titleLabel];
  if (self->_titleLabel != v5) {
    objc_storeStrong((id *)&self->_titleLabel, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setSubtitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_subtitleLabel];
  if (self->_subtitleLabel != v5) {
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setTextLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_textLabel];
  if (self->_textLabel != v5) {
    objc_storeStrong((id *)&self->_textLabel, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setImageView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_imageView];
  if (self->_imageView != v5) {
    objc_storeStrong((id *)&self->_imageView, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setLogoView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_logoView];
  if (self->_logoView != v5) {
    objc_storeStrong((id *)&self->_logoView, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setAppIconView:(id)a3
{
  v5 = (UIView *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_appIconView];
  if (self->_appIconView != v5) {
    objc_storeStrong((id *)&self->_appIconView, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setVersionsButton:(id)a3
{
  v5 = (UIView *)a3;
  [(VUIOfferView *)self vui_addSubview:v5 oldView:self->_versionsButton];
  if (self->_versionsButton != v5) {
    objc_storeStrong((id *)&self->_versionsButton, a3);
  }
  [(VUIOfferView *)self vui_setNeedsLayout];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIOfferView;
  -[VUIOfferView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(VUILabel *)self->_textLabel setSemanticContentAttribute:a3];
  [(VUILabel *)self->_subtitleLabel setSemanticContentAttribute:a3];
  [(VUILabel *)self->_titleLabel setSemanticContentAttribute:a3];
  [(VUILabel *)self->_channelNameLabel setSemanticContentAttribute:a3];
  [(UIView *)self->_versionsButton setSemanticContentAttribute:a3];
}

- (BOOL)_shouldDisplaySeparator
{
  return self->_channelNameLabel || self->_imageView || self->_logoView || self->_appIconView;
}

- (double)_chinHeightForSize:(CGSize)a3
{
  double width = a3.width;
  [(VUIOfferView *)self padding];
  double v7 = width - v5 - v6;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UIView vui_sizeThatFits:](titleLabel, "vui_sizeThatFits:", v7, 0.0);
    v9 = [(VUILabel *)self->_titleLabel textLayout];
    [v9 margin];
    double v11 = v10;

    [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:v11];
    double v13 = v12;
    VUIRoundValue();
    double v15 = v13 + v14 + 0.0;
    v16 = self->_titleLabel;
  }
  else
  {
    v16 = 0;
    double v15 = 0.0;
  }
  textLabel = self->_textLabel;
  if (textLabel)
  {
    v18 = [(VUILabel *)textLabel textLayout];
    [v18 margin];
    double v20 = v19;

    -[UIView vui_sizeThatFits:](self->_textLabel, "vui_sizeThatFits:", v7, 0.0);
    [(VUILabel *)self->_textLabel topMarginToLabel:v16 withBaselineMargin:v20];
    double v22 = v21;
    VUIRoundValue();
    double v15 = v15 + v22 + v23;
    v24 = self->_textLabel;

    v16 = v24;
  }
  [(VUIOfferView *)self padding];
  double v26 = v25;
  v27 = self->_titleLabel;
  if (v27) {
    v28 = v27;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v30 = [(VUILabel *)subtitleLabel vuiText];
    uint64_t v31 = [v30 length];

    if (v31)
    {
      -[UIView vui_sizeThatFits:](self->_subtitleLabel, "vui_sizeThatFits:", v7, 0.0);
      v32 = [(VUILabel *)self->_subtitleLabel textLayout];
      [v32 margin];
      if (!self->_textLabel) {
        double secondLineBaselineMargin = self->_secondLineBaselineMargin;
      }
      [(VUILabel *)self->_subtitleLabel topMarginToLabel:v16 withBaselineMargin:secondLineBaselineMargin];
      double v35 = v34;
      VUIRoundValue();
      double v15 = v15 + v35 + v36;
      v37 = self->_subtitleLabel;

      v38 = self->_subtitleLabel;
      v27 = v38;
      v16 = v37;
    }
  }
  if (self->_versionsButton)
  {
    objc_opt_class();
    double v39 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      v40 = [(UIView *)self->_versionsButton textContentView];
      if (v40)
      {
        v41 = v40;
        v42 = [v40 textLayout];
        [v42 margin];
        double v39 = v43;
      }
    }
    if (v16)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v45 = 0.0;
      if (isKindOfClass) {
        [(UIView *)self->_versionsButton topMarginToLabel:v16 withBaselineMargin:v39];
      }
    }
    else
    {
      [(UIView *)self->_versionsButton topMarginWithBaselineMargin:v39];
    }
    double v46 = v15 + v45;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UIView vui_sizeThatFits:](self->_versionsButton, "vui_sizeThatFits:", v7, 0.0);
    }
    VUIRoundValue();
    double v15 = v46 + v47;
    v48 = self->_versionsButton;

    v27 = (VUILabel *)v48;
  }
  [(VUILabel *)v27 bottomMarginWithBaselineMargin:v26];
  double v50 = v15 + v49;

  return v50;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  if (a4)
  {
    -[VUIOfferView computeSizeThatFits:](self, "computeSizeThatFits:", a3.width, a3.height);
  }
  else
  {
    -[VUIOfferView layoutOfferSubviewsWithSize:](self, "layoutOfferSubviewsWithSize:", a3.width, a3.height);
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v5;
  result.double width = v4;
  return result;
}

- (void)layoutOfferSubviewsWithSize:(CGSize)a3
{
  double width = a3.width;
  int v5 = [(VUIOfferView *)self vuiIsRTL];
  [(VUIOfferView *)self padding];
  double v7 = v6;
  double v9 = v8;
  double v10 = width - v6;
  [(VUIOfferView *)self topPartAspectRatio];
  VUIRoundValue();
  double v12 = v11;
  if (!self->_imageView)
  {
    channelImageBackgroundView = self->_channelImageBackgroundView;
    if (channelImageBackgroundView)
    {
      -[UIView setFrame:](channelImageBackgroundView, "setFrame:", 0.0, 0.0, width, v11);
      double v14 = self->_channelImageBackgroundView;
      double v15 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIView *)v14 setVuiBackgroundColor:v15];
    }
  }
  double v84 = v9;
  double v16 = v10 - v9;
  channelNameLabel = self->_channelNameLabel;
  if (channelNameLabel)
  {
    -[UIView vui_sizeThatFits:](channelNameLabel, "vui_sizeThatFits:", v16, 0.0);
    double v19 = v18;
    double v20 = [(VUILabel *)self->_channelNameLabel textLayout];
    [v20 margin];
    double v22 = v21;

    [(VUILabel *)self->_channelNameLabel topMarginWithBaselineMargin:v22];
    -[VUILabel setFrame:](self->_channelNameLabel, "setFrame:", v7, v23, v16, v19);
    -[VUILabel setVuiCenter:](self->_channelNameLabel, "setVuiCenter:", width * 0.5, v12 * 0.5);
    goto LABEL_15;
  }
  imageView = self->_imageView;
  if (imageView)
  {
    -[UIView setFrame:](imageView, "setFrame:", 0.0, 0.0, width, v12);
    goto LABEL_15;
  }
  appIconView = self->_appIconView;
  if (appIconView)
  {
    -[UIView vui_sizeThatFits:](appIconView, "vui_sizeThatFits:", 0.0, v12);
    VUIRoundValue();
    VUIRoundValue();
    -[UIView setFrame:](self->_appIconView, "setFrame:");
    double v26 = self->_channelImageBackgroundView;
    if (v26)
    {
      -[UIView setFrame:](v26, "setFrame:", 0.0, 0.0, width, v12);
      v27 = [MEMORY[0x1E4FB1618] lightGrayColor];
      [(UIView *)self->_channelImageBackgroundView setVuiBackgroundColor:v27];
    }
    v28 = self->_appIconView;
  }
  else
  {
    logoView = self->_logoView;
    if (!logoView) {
      goto LABEL_15;
    }
    -[UIView vui_sizeThatFits:](logoView, "vui_sizeThatFits:", 0.0, v12);
    -[UIView setFrame:](self->_logoView, "setFrame:", v7, 0.0, v30, v31);
    -[UIView setVuiCenter:](self->_logoView, "setVuiCenter:", width * 0.5, v12 * 0.5);
    v28 = self->_logoView;
  }
  -[VUIOfferView vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:", v28, *(void *)&v84);
LABEL_15:
  if ([(VUIOfferView *)self _shouldDisplaySeparator])
  {
    separatorView = self->_separatorView;
    if (!separatorView)
    {
      v33 = [VUISeparatorView alloc];
      double v34 = -[VUISeparatorView initWithFrame:](v33, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v35 = self->_separatorView;
      self->_separatorView = v34;

      [(VUIOfferView *)self addSubview:self->_separatorView];
      separatorView = self->_separatorView;
    }
    [(VUIOfferView *)self bringSubviewToFront:separatorView];
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", 0.0, v12, width, 1.0);
    double v12 = v12 + 1.0;
  }
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    if (!self->_subtitleLabel && !self->_textLabel && !self->_versionsButton) {
      return;
    }
    goto LABEL_25;
  }
  v37 = [(VUILabel *)titleLabel vuiText];
  uint64_t v38 = [v37 length];

  if (!v38)
  {
LABEL_25:
    double v46 = 0;
    goto LABEL_26;
  }
  -[UIView vui_sizeThatFits:](self->_titleLabel, "vui_sizeThatFits:", v16, 0.0);
  double v39 = [(VUILabel *)self->_titleLabel textLayout];
  [v39 margin];
  double v41 = v40;

  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:v41];
  double v43 = v12 + v42;
  VUIRoundValue();
  double v45 = v44;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v7, v43, v16, v44);
  double v12 = v43 + v45;
  double v46 = self->_titleLabel;
LABEL_26:
  textLabel = self->_textLabel;
  if (textLabel)
  {
    v86 = v46;
    v48 = [(VUILabel *)textLabel vuiText];
    uint64_t v49 = [v48 length];

    if (v49)
    {
      double v50 = [(VUILabel *)self->_textLabel textLayout];
      [v50 margin];
      double v52 = v51;

      [(VUILabel *)self->_textLabel topMarginToLabel:v86 withBaselineMargin:v52];
      double v54 = v12 + v53;
      -[UIView vui_sizeThatFits:](self->_textLabel, "vui_sizeThatFits:", v16, 0.0);
      VUIRoundValue();
      double v56 = v55;
      -[VUILabel setFrame:](self->_textLabel, "setFrame:", v7, v54, v16, v55);
      double v12 = v54 + v56;
      v57 = self->_textLabel;

      double v46 = v57;
    }
    else
    {
      double v46 = v86;
    }
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v87 = v46;
    v59 = [(VUILabel *)subtitleLabel vuiText];
    uint64_t v60 = [v59 length];

    if (v60)
    {
      -[UIView vui_sizeThatFits:](self->_subtitleLabel, "vui_sizeThatFits:", v16, 0.0);
      v61 = [(VUILabel *)self->_subtitleLabel textLayout];
      [v61 margin];
      double secondLineBaselineMargin = v62;

      if (!self->_textLabel) {
        double secondLineBaselineMargin = self->_secondLineBaselineMargin;
      }
      v64 = self->_subtitleLabel;
      if (v87) {
        [(VUILabel *)v64 topMarginToLabel:v87 withBaselineMargin:secondLineBaselineMargin];
      }
      else {
        [(VUILabel *)v64 topMarginWithBaselineMargin:secondLineBaselineMargin];
      }
      double v66 = v65;
      v67 = self->_subtitleLabel;
      double v68 = v12 + v65;
      VUIRoundValue();
      -[VUILabel setFrame:](v67, "setFrame:", v7, v68, v16, v69);
      VUIRoundValue();
      double v12 = v12 + v66 + v70;
      v71 = self->_subtitleLabel;

      double v46 = v71;
    }
    else
    {
      double v46 = v87;
    }
  }
  if (self->_versionsButton)
  {
    v88 = v46;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[UIView vui_sizeThatFits:](self->_versionsButton, "vui_sizeThatFits:", v16, 0.0);
      double v73 = v72;
      v74 = [(UIView *)self->_versionsButton textContentView];
    }
    else
    {
      v74 = 0;
      double v73 = *MEMORY[0x1E4F1DB30];
    }
    if (v5) {
      double v75 = width - v85 - v73;
    }
    else {
      double v75 = v7;
    }
    v76 = [v74 textLayout];
    [v76 margin];
    double v78 = v77;

    if (v88)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v80 = 0.0;
      if (isKindOfClass) {
        [(UIView *)self->_versionsButton topMarginToLabel:v88 withBaselineMargin:v78];
      }
    }
    else
    {
      [(UIView *)self->_versionsButton topMarginWithBaselineMargin:v78];
    }
    double v81 = v12 + v80;
    versionsButton = self->_versionsButton;
    VUIRoundValue();
    -[UIView setFrame:](versionsButton, "setFrame:", v75, v81, v73, v83);

    double v46 = v88;
  }
}

- (CGSize)computeSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  VUIRoundValue();
  double v7 = v6;
  if ([(VUIOfferView *)self _shouldDisplaySeparator]) {
    double v7 = v7 + 1.0;
  }
  if (self->_titleLabel || self->_subtitleLabel || self->_textLabel)
  {
    -[VUIOfferView _chinHeightForSize:](self, "_chinHeightForSize:", width, height);
    double v7 = v7 + v8;
  }
  double v9 = width;
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  double v9 = [(VUIOfferView *)self subviews];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__VUIOfferView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v11[3] = &unk_1E6DF5948;
  BOOL v13 = a3;
  BOOL v14 = a4;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];
}

uint64_t __62__VUIOfferView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41) withAnimationCoordinator:*(void *)(a1 + 32)];
}

- (UIView)imageView
{
  return self->_imageView;
}

- (UIView)logoView
{
  return self->_logoView;
}

- (UIView)appIconView
{
  return self->_appIconView;
}

- (VUILabel)channelNameLabel
{
  return self->_channelNameLabel;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)textLabel
{
  return self->_textLabel;
}

- (UIView)versionsButton
{
  return self->_versionsButton;
}

- (UIView)channelImageBackgroundView
{
  return self->_channelImageBackgroundView;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (void)setIsEntitled:(BOOL)a3
{
  self->_isEntitled = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)topPartAspectRatio
{
  return self->_topPartAspectRatio;
}

- (void)setTopPartAspectRatio:(double)a3
{
  self->_topPartAspectRatio = a3;
}

- (double)secondLineBaselineMargin
{
  return self->_secondLineBaselineMargin;
}

- (void)setSecondLineBaselineMargin:(double)a3
{
  self->_double secondLineBaselineMargin = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_channelImageBackgroundView, 0);
  objc_storeStrong((id *)&self->_versionsButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_channelNameLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
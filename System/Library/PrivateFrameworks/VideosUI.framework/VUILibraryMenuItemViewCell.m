@interface VUILibraryMenuItemViewCell
- (BOOL)hasImage;
- (BOOL)hideChevron;
- (BOOL)shouldAppearAsHeader;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)imageName;
- (NSString)title;
- (VUILabel)titleLabel;
- (VUILibraryMenuItemViewCell)initWithFrame:(CGRect)a3;
- (VUISeparatorView)bottomSeparatorView;
- (VUISeparatorView)topSeparatorView;
- (void)layoutSubviews;
- (void)setHideChevron:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setShouldAppearAsHeader:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTopSeparatorView:(id)a3;
@end

@implementation VUILibraryMenuItemViewCell

- (VUILibraryMenuItemViewCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VUILibraryMenuItemViewCell;
  v3 = -[VUILibraryMenuItemViewCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v4 setTextStyle:2];
    [(VUITextLayout *)v4 setFontWeight:0];
    v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(VUITextLayout *)v4 setColor:v5];

    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(VUITextLayout *)v4 setHighlightOrSelectedColor:v6];

    uint64_t v7 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v4 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v7;

    v9 = [(VUILibraryMenuItemViewCell *)v3 contentView];
    [v9 addSubview:v3->_titleLabel];

    v10 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v10;

    v12 = [(VUILibraryMenuItemViewCell *)v3 contentView];
    [v12 addSubview:v3->_bottomSeparatorView];

    v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    v14 = [VUIVideosImageView alloc];
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v19 = -[VUIVideosImageView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], v16, v17, v18);
    accessoryView = v3->_accessoryView;
    v3->_accessoryView = (VUIVideosImageView *)v19;

    v21 = v3->_accessoryView;
    v22 = [MEMORY[0x1E4FB1618] lightGrayColor];
    v23 = [v13 imageWithTintColor:v22 renderingMode:1];
    [(VUIVideosImageView *)v21 setImage:v23];

    v24 = v3->_accessoryView;
    v25 = [MEMORY[0x1E4FB1618] whiteColor];
    v26 = [v13 imageWithTintColor:v25 renderingMode:1];
    [(VUIVideosImageView *)v24 setHighlightOrSelectedImage:v26];

    v27 = [(VUILibraryMenuItemViewCell *)v3 contentView];
    [v27 addSubview:v3->_accessoryView];

    v28 = -[VUIVideosImageView initWithFrame:]([VUIVideosImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    imageView = v3->_imageView;
    v3->_imageView = v28;

    [(VUIVideosImageView *)v3->_imageView setContentMode:2];
    v30 = [(VUILibraryMenuItemViewCell *)v3 contentView];
    [v30 addSubview:v3->_imageView];

    v31 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIListCollectionViewCell *)v3 setBackgroundColor:v31];

    v32 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(VUIListCollectionViewCell *)v3 setHighlightedBackgroundColor:v32];

    [(VUILibraryMenuItemViewCell *)v3 setHideChevron:0];
  }
  return v3;
}

- (void)setImageName:(id)a3
{
  v5 = (NSString *)a3;
  p_imageName = &self->_imageName;
  if (self->_imageName != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)p_imageName, a3);
    uint64_t v7 = [MEMORY[0x1E4FB1830] configurationPreferringMonochrome];
    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v14 withConfiguration:v7];
    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E4FB1818];
      v10 = [MEMORY[0x1E4F28B50] mainBundle];
      v8 = [v9 imageNamed:v14 inBundle:v10 withConfiguration:0];
    }
    [(VUIVideosImageView *)self->_imageView setImage:v8];
    imageView = self->_imageView;
    v12 = [MEMORY[0x1E4FB1618] whiteColor];
    v13 = [v8 imageWithTintColor:v12 renderingMode:1];
    [(VUIVideosImageView *)imageView setHighlightOrSelectedImage:v13];

    [(VUILibraryMenuItemViewCell *)self setNeedsLayout];
  }
  MEMORY[0x1F4181820](p_imageName);
}

- (BOOL)hasImage
{
  return [(NSString *)self->_imageName length] != 0;
}

- (void)setTopSeparatorView:(id)a3
{
  v5 = (VUISeparatorView *)a3;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    uint64_t v7 = v5;
    [(VUISeparatorView *)topSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (self->_topSeparatorView) {
      -[VUILibraryMenuItemViewCell addSubview:](self, "addSubview:");
    }
    [(VUILibraryMenuItemViewCell *)self setNeedsLayout];
    v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding", a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  v9 = (void *)MEMORY[0x1E4FB3C70];
  v10 = [(VUILibraryMenuItemViewCell *)self vuiTraitCollection];
  [v9 scaleContentSizeValue:v10 forTraitCollection:20.0];
  double v12 = v11;

  v13 = [(VUIVideosImageView *)self->_accessoryView image];
  [v13 size];
  double v15 = v14;

  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6 - v8 + -10.0 + -10.0 - v15 - v12, 1.79769313e308);
  double v17 = v16;
  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:32.0];
  double v19 = v18;
  [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:16.0];
  double v21 = v17 + v19 + v20;
  double v22 = width;
  result.height = v21;
  result.double width = v22;
  return result;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)VUILibraryMenuItemViewCell;
  [(VUILibraryMenuItemViewCell *)&v58 layoutSubviews];
  [(VUILibraryMenuItemViewCell *)self bounds];
  double Width = CGRectGetWidth(v59);
  [(VUILibraryMenuItemViewCell *)self bounds];
  double Height = CGRectGetHeight(v60);
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", Width);
  double v6 = v5;
  double v57 = v7;
  double v8 = [(VUILibraryMenuItemViewCell *)self contentView];
  uint64_t v9 = [v8 effectiveUserInterfaceLayoutDirection];

  v10 = [(VUILibraryMenuItemViewCell *)self contentView];
  [v10 bounds];

  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView)
  {
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", Width - v6, 1.79769313e308);
    double v13 = v12;
    double v15 = v14;
    double v16 = 0.0;
    double v17 = v6;
    if (v9 == 1) {
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    }
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v17, v16, v13, v15);
  }
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView)
  {
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", Width - v6, 1.79769313e308);
    double v20 = v19;
    double v22 = v21;
    double v23 = Height - v21;
    double v24 = v6;
    if (v9 == 1) {
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    }
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v24, v23, v20, v22);
  }
  v25 = (void *)MEMORY[0x1E4FB3C70];
  v26 = [(VUILibraryMenuItemViewCell *)self vuiTraitCollection];
  [v25 scaleContentSizeValue:v26 forTraitCollection:20.0];
  double v28 = v27;

  if ([(VUILibraryMenuItemViewCell *)self hasImage])
  {
    double v29 = (Height - v28) * 0.5;
    double v30 = v6;
    double v31 = v28;
    double v32 = v28;
    if (v9 == 1) {
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    }
    -[VUIVideosImageView setFrame:](self->_imageView, "setFrame:", v30, v29, v31, v32);
  }
  v33 = [(VUIVideosImageView *)self->_accessoryView image];
  [v33 size];
  double v35 = v34;
  double v37 = v36;

  if (![(VUILibraryMenuItemViewCell *)self hideChevron])
  {
    double v38 = Width - v57 - v35;
    double v39 = (Height - v37) * 0.5;
    double v40 = v35;
    if (v9 == 1)
    {
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v37 = v41;
    }
    -[VUIVideosImageView setFrame:](self->_accessoryView, "setFrame:", v38, v39, v40, v37);
  }
  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:32.0];
  double v43 = v42;
  double v44 = Width - v6 - v57;
  BOOL v45 = [(VUILibraryMenuItemViewCell *)self hideChevron];
  double v46 = v35 + 10.0;
  if (v45) {
    double v46 = 0.0;
  }
  double v47 = v44 - v46;
  BOOL v48 = [(VUILibraryMenuItemViewCell *)self hasImage];
  double v49 = v28 + 10.0;
  if (v48) {
    double v50 = v28 + 10.0;
  }
  else {
    double v50 = 0.0;
  }
  double v51 = v47 - v50;
  if (!v48) {
    double v49 = -0.0;
  }
  double v52 = v6 + v49;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v51, 1.79769313e308);
  if (v9 == 1)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v52 = v53;
    double v43 = v54;
    double v51 = v55;
    uint64_t v56 = 2;
  }
  else
  {
    uint64_t v56 = 0;
  }
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v52, v43, v51);
  [(VUILabel *)self->_titleLabel setTextAlignment:v56];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (void)setHideChevron:(BOOL)a3
{
  self->_hideChevron = a3;
}

- (BOOL)shouldAppearAsHeader
{
  return self->_shouldAppearAsHeader;
}

- (void)setShouldAppearAsHeader:(BOOL)a3
{
  self->_shouldAppearAsHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
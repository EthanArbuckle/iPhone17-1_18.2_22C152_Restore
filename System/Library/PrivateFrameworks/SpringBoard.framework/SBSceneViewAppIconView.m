@interface SBSceneViewAppIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PLPlatterView)shadowView;
- (SBIconImageView)imageView;
- (SBSceneViewAppIconView)initWithIcon:(id)a3;
- (UILabel)label;
- (void)layoutSubviews;
@end

@implementation SBSceneViewAppIconView

- (SBSceneViewAppIconView)initWithIcon:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBSceneViewAppIconView *)self init];
  if (v5)
  {
    v6 = (SBIconImageView *)objc_alloc_init(MEMORY[0x1E4FA63E0]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    v8 = v5->_imageView;
    v9 = +[SBIconController sharedInstance];
    v10 = [v9 iconManager];
    v11 = [v10 iconImageCache];
    [(SBIconImageView *)v8 setIconImageCache:v11];

    [(SBIconImageView *)v5->_imageView setIcon:v4 location:*MEMORY[0x1E4FA66D0] animated:0];
    [(SBSceneViewAppIconView *)v5 addSubview:v5->_imageView];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    label = v5->_label;
    v5->_label = v12;

    [(UILabel *)v5->_label setTextAlignment:1];
    v14 = v5->_label;
    v15 = [v4 displayNameForLocation:*MEMORY[0x1E4FA66C8]];
    [(UILabel *)v14 setText:v15];

    [(UILabel *)v5->_label setAdjustsFontSizeToFitWidth:1];
    v16 = v5->_label;
    v17 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v16 setFont:v17];

    [(UILabel *)v5->_label setAdjustsFontForContentSizeCategory:1];
    [(SBSceneViewAppIconView *)v5 addSubview:v5->_label];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:1];
    shadowView = v5->_shadowView;
    v5->_shadowView = (PLPlatterView *)v18;

    v20 = v5->_shadowView;
    [(SBIconImageView *)v5->_imageView iconImageInfo];
    [(PLPlatterView *)v20 _setContinuousCornerRadius:v21];
    [(PLPlatterView *)v5->_shadowView setUsesBackgroundView:0];
    v22 = v5->_shadowView;
    *(_OWORD *)&v28[4] = *MEMORY[0x1E4F1DB30];
    int v24 = 1053609165;
    long long v25 = *(_OWORD *)v28;
    int v26 = *(_DWORD *)&v28[16];
    uint64_t v27 = 0x403E000000000000;
    [(PLPlatterView *)v22 setShadowAttributes:&v24];
    [(SBSceneViewAppIconView *)v5 addSubview:v5->_shadowView];
    [(SBSceneViewAppIconView *)v5 sendSubviewToBack:v5->_shadowView];
    [(SBSceneViewAppIconView *)v5 sizeToFit];
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SBSceneViewAppIconView *)self imageView];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  v11 = [(SBSceneViewAppIconView *)self label];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;
  double v15 = v14;

  if (width >= v13 || width <= 0.0) {
    double v17 = v13;
  }
  else {
    double v17 = width;
  }
  if (v13 <= v8) {
    double v17 = v8;
  }
  double v18 = v10 + 4.0 + v15;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SBSceneViewAppIconView;
  [(SBSceneViewAppIconView *)&v24 layoutSubviews];
  [(SBSceneViewAppIconView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBSceneViewAppIconView *)self imageView];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  double v13 = v12;
  double v15 = v14;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  double MidX = CGRectGetMidX(v25);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.double width = v13;
  v26.size.double height = v15;
  CGFloat v17 = MidX + CGRectGetWidth(v26) * -0.5;
  double v18 = [(SBSceneViewAppIconView *)self imageView];
  objc_msgSend(v18, "setFrame:", v17, 0.0, v13, v15);

  v19 = [(SBSceneViewAppIconView *)self shadowView];
  objc_msgSend(v19, "setFrame:", v17, 0.0, v13, v15);

  v20 = [(SBSceneViewAppIconView *)self label];
  objc_msgSend(v20, "sizeThatFits:", v8, v10);
  double v22 = v21;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  double Width = CGRectGetWidth(v27);
  v28.origin.y = 0.0;
  v28.origin.x = v17;
  v28.size.double width = v13;
  v28.size.double height = v15;
  objc_msgSend(v20, "setFrame:", 0.0, CGRectGetMaxY(v28) + 4.0, Width, v22);
}

- (SBIconImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (PLPlatterView)shadowView
{
  return self->_shadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
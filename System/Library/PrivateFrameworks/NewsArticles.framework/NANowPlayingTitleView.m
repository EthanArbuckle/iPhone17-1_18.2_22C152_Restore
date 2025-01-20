@interface NANowPlayingTitleView
- (BOOL)hasPublisherLogo;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUMarqueeView)publisherMarqueeContainer;
- (MPUMarqueeView)titleMarqueeContainer;
- (NANowPlayingTitleView)initWithFrame:(CGRect)a3 layoutSpecProvider:(id)a4;
- (NANowPlayingTitleViewDelegate)delegate;
- (NANowPlayingTitleViewLayoutSpecProvider)layoutSpecProvider;
- (NATouchInsetsButton)ellipsisButton;
- (UIImageView)publisherImageView;
- (UILabel)titleLabel;
- (double)publisherLogoHeight;
- (void)_setPublisherImage:(id)a3;
- (void)ellipsisButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEllipsisButton:(id)a3;
- (void)setLayoutSpecProvider:(id)a3;
- (void)setMarqueeRunning:(BOOL)a3;
- (void)setPublisherImage:(id)a3 fallbackName:(id)a4;
- (void)setPublisherImageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation NANowPlayingTitleView

- (NANowPlayingTitleView)initWithFrame:(CGRect)a3 layoutSpecProvider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)NANowPlayingTitleView;
  v10 = -[NANowPlayingTitleView initWithFrame:](&v35, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke;
    v33[3] = &unk_1E6406068;
    v12 = v10;
    v34 = v12;
    uint64_t v13 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke((uint64_t)v33);
    publisherImageView = v12->_publisherImageView;
    v12->_publisherImageView = (UIImageView *)v13;

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2;
    v31[3] = &unk_1E6406158;
    v15 = v12;
    v32 = v15;
    uint64_t v16 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2((uint64_t)v31);
    publisherMarqueeContainer = v15->_publisherMarqueeContainer;
    v15->_publisherMarqueeContainer = (MPUMarqueeView *)v16;

    uint64_t v18 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3();
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = (UILabel *)v18;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4;
    v29[3] = &unk_1E6406158;
    v20 = v15;
    v30 = v20;
    uint64_t v21 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4((uint64_t)v29);
    titleMarqueeContainer = v20->_titleMarqueeContainer;
    v20->_titleMarqueeContainer = (MPUMarqueeView *)v21;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5;
    v27[3] = &unk_1E64060E0;
    v23 = v20;
    v28 = v23;
    uint64_t v24 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5((uint64_t)v27);
    id v25 = v23[55];
    v23[55] = (id)v24;

    objc_storeWeak(v23 + 57, v9);
  }

  return v11;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = [*(id *)(a1 + 32) layoutSpecProvider];
  [v3 publisherLogoHeight];
  v5 = objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 0.0, v4);

  [v5 setContentMode:1];
  [v5 setAccessibilityIgnoresInvertColors:1];
  objc_msgSend(v5, "setAccessibilityTraits:", objc_msgSend(v5, "accessibilityTraits") & ~*MEMORY[0x1E4FB2558]);
  uint64_t v6 = [v5 accessibilityTraits];
  [v5 setAccessibilityTraits:*MEMORY[0x1E4FB25A0] | v6];
  return v5;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F73A18]);
  [v2 setMarqueeEnabled:1];
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  [v2 setContentGap:32.0];
  v3 = [v2 contentView];
  double v4 = [*(id *)(a1 + 32) publisherImageView];
  [v3 addSubview:v4];

  [*(id *)(a1 + 32) addSubview:v2];
  return v2;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1930]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setAdjustsFontForContentSizeCategory:1];
  return v1;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F73A18]);
  [v2 setMarqueeEnabled:1];
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  [v2 setContentGap:32.0];
  v3 = [v2 contentView];
  double v4 = [*(id *)(a1 + 32) titleLabel];
  [v3 addSubview:v4];

  v5 = [*(id *)(a1 + 32) publisherMarqueeContainer];
  [v2 addCoordinatedMarqueeView:v5];

  uint64_t v6 = [*(id *)(a1 + 32) titleLabel];
  [v2 setViewForContentSize:v6];

  [*(id *)(a1 + 32) addSubview:v2];
  return v2;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v1 = +[NATouchInsetsButton buttonWithType:0];
  id v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0 weight:*MEMORY[0x1E4FB09E0]];
  double v4 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2998]];
  v5 = [v4 scaledFontForFont:v3 maximumPointSize:26.0];
  [v5 pointSize];
  double v7 = v6;

  v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:v7];
  id v9 = (void *)MEMORY[0x1E4FB1830];
  v10 = [MEMORY[0x1E4FB1618] whiteColor];
  v19[0] = v10;
  v11 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v19[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v13 = [v9 configurationWithPaletteColors:v12];
  v14 = [v8 configurationByApplyingConfiguration:v13];

  [v1 setImage:v2 forState:0];
  [v1 setPreferredSymbolConfiguration:v14 forImageInState:0];
  [v1 addTarget:*(void *)(a1 + 32) action:sel_ellipsisButtonTapped_ forControlEvents:0x2000];
  v15 = NABundle();
  uint64_t v16 = [v15 localizedStringForKey:@"more" value:&stru_1F1AD8EC0 table:0];
  [v1 setAccessibilityLabel:v16];

  [*(id *)(a1 + 32) addSubview:v1];
  return v1;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)NANowPlayingTitleView;
  [(NANowPlayingTitleView *)&v54 layoutSubviews];
  double v7 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v7 sizeToFit];

  v8 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v8 frame];
  double Width = CGRectGetWidth(v55);

  [(NANowPlayingTitleView *)self bounds];
  double v10 = CGRectGetWidth(v56) + -16.0;
  BOOL v11 = [(NANowPlayingTitleView *)self hasPublisherLogo];
  if (v11)
  {
    v8 = [(NANowPlayingTitleView *)self layoutSpecProvider];
    [v8 publisherLogoHeight];
    double v13 = v12;
    id v2 = [(NANowPlayingTitleView *)self publisherImageView];
    v3 = [v2 image];
    [v3 size];
    double v15 = v13 * v14;
    double v4 = [(NANowPlayingTitleView *)self publisherImageView];
    v5 = [v4 image];
    [v5 size];
    double v17 = v15 / v16;
  }
  else
  {
    double v17 = 0.0;
  }
  double v18 = v10 - Width;
  v19 = [(NANowPlayingTitleView *)self layoutSpecProvider];
  [v19 publisherLogoHeight];
  double v21 = v20;

  if (v11)
  {
  }
  v22 = [(NANowPlayingTitleView *)self publisherMarqueeContainer];
  objc_msgSend(v22, "setContentSize:", v17, v21);

  v23 = [(NANowPlayingTitleView *)self publisherImageView];
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v17, v21);

  uint64_t v24 = [(NANowPlayingTitleView *)self publisherMarqueeContainer];
  objc_msgSend(v24, "setFrame:", 0.0, 0.0, v18, v21);

  id v25 = [(NANowPlayingTitleView *)self publisherMarqueeContainer];
  [v25 frame];
  double MaxY = CGRectGetMaxY(v57);

  if ([(NANowPlayingTitleView *)self hasPublisherLogo])
  {
    v27 = [(NANowPlayingTitleView *)self layoutSpecProvider];
    [v27 publisherLogoBottomMargin];
    double MaxY = MaxY + v28;
  }
  v29 = [(NANowPlayingTitleView *)self titleLabel];
  [v29 bounds];
  double Height = CGRectGetHeight(v58);
  v31 = [(NANowPlayingTitleView *)self titleMarqueeContainer];
  objc_msgSend(v31, "setFrame:", 0.0, MaxY, v18, Height);

  v32 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v32 bounds];
  double v33 = CGRectGetHeight(v59);

  if ([(NANowPlayingTitleView *)self hasPublisherLogo])
  {
    v34 = [(NANowPlayingTitleView *)self publisherMarqueeContainer];
    [v34 frame];
    double v35 = CGRectGetMaxY(v60);
    v36 = [(NANowPlayingTitleView *)self layoutSpecProvider];
    [v36 publisherLogoBottomMargin];
    double MidY = v35 + v37 * 0.5;
  }
  else
  {
    v34 = [(NANowPlayingTitleView *)self titleMarqueeContainer];
    [v34 frame];
    double MidY = CGRectGetMidY(v61);
  }

  double v39 = v33 * -0.5;
  [(NANowPlayingTitleView *)self bounds];
  double v40 = CGRectGetWidth(v62);
  v41 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v41 bounds];
  double v42 = v40 - CGRectGetWidth(v63);
  double v43 = MidY + v39;
  v44 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v44 bounds];
  double v45 = CGRectGetWidth(v64);
  v46 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v46 bounds];
  double v47 = CGRectGetHeight(v65);
  v48 = [(NANowPlayingTitleView *)self ellipsisButton];
  objc_msgSend(v48, "setFrame:", v42, v43, v45, v47);

  v49 = [(NANowPlayingTitleView *)self ellipsisButton];
  [v49 bounds];
  [(NATouchInsetsButton *)self->_ellipsisButton setTouchInsets:NAInsetsToMinimumTapTargetForFrame(v50, v51, v52, v53)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = (void *)MEMORY[0x1E4FB08E0];
  double v6 = [(NANowPlayingTitleView *)self layoutSpecProvider];
  [v6 titleLabelFontSize];
  double v7 = objc_msgSend(v5, "systemFontOfSize:weight:");
  [v7 pointSize];
  double v9 = v8;

  if ([(NANowPlayingTitleView *)self hasPublisherLogo])
  {
    double v10 = [(NANowPlayingTitleView *)self layoutSpecProvider];
    [v10 publisherLogoHeight];
    double v12 = v11;
    double v13 = [(NANowPlayingTitleView *)self layoutSpecProvider];
    [v13 publisherLogoBottomMargin];
    double v9 = v9 + v12 + v14;
  }
  double v15 = width;
  double v16 = v9;
  result.double height = v16;
  result.CGFloat width = v15;
  return result;
}

- (void)setPublisherImage:(id)a3 fallbackName:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6)
  {
    double v9 = self;
    id v10 = v6;
  }
  else
  {
    if (v7)
    {
      double v11 = (void *)MEMORY[0x1E4FB08E0];
      double v12 = [(NANowPlayingTitleView *)self layoutSpecProvider];
      [v12 publisherLogoHeight];
      double v13 = objc_msgSend(v11, "systemFontOfSize:weight:");

      uint64_t v14 = *MEMORY[0x1E4F247E8];
      v27[0] = *MEMORY[0x1E4FB06F8];
      v27[1] = v14;
      v28[0] = v13;
      v28[1] = &unk_1F1B03838;
      v27[2] = *MEMORY[0x1E4FB0700];
      double v15 = [MEMORY[0x1E4FB1618] whiteColor];
      v28[2] = v15;
      double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

      [v8 sizeWithAttributes:v16];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      double v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v21 scale];
      CGFloat v23 = v22;
      v29.CGFloat width = v18;
      v29.double height = v20;
      UIGraphicsBeginImageContextWithOptions(v29, 0, v23);

      objc_msgSend(v8, "drawAtPoint:withAttributes:", v16, 0.0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSetShouldAntialias(CurrentContext, 1);
      id v25 = UIGraphicsGetCurrentContext();
      CGContextSetAllowsAntialiasing(v25, 1);
      v26 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(NANowPlayingTitleView *)self _setPublisherImage:v26];

      goto LABEL_6;
    }
    double v9 = self;
    id v10 = 0;
  }
  [(NANowPlayingTitleView *)v9 _setPublisherImage:v10];
LABEL_6:
}

- (void)_setPublisherImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v6 = [(NANowPlayingTitleView *)self publisherImageView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NANowPlayingTitleView__setPublisherImage___block_invoke;
  v8[3] = &unk_1E64060B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 transitionWithView:v6 duration:5242880 options:v8 animations:0 completion:0.25];
}

uint64_t __44__NANowPlayingTitleView__setPublisherImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) publisherImageView];
  [v3 setImage:v2];

  id v4 = [*(id *)(a1 + 40) accessibilityLabel];
  v5 = [*(id *)(a1 + 32) publisherImageView];
  [v5 setAccessibilityLabel:v4];

  id v6 = [*(id *)(a1 + 40) accessibilityLabel];
  id v7 = [*(id *)(a1 + 32) publisherImageView];
  [v7 setIsAccessibilityElement:v6 != 0];

  double v8 = *(void **)(a1 + 32);
  return [v8 setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = [(NANowPlayingTitleView *)self layoutSpecProvider];
  [v6 titleLabelFontSize];
  id v7 = objc_msgSend(v5, "systemFontOfSize:weight:");

  double v8 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2990]];
  id v9 = [v8 scaledFontForFont:v7 maximumPointSize:26.0];

  uint64_t v10 = *MEMORY[0x1E4F247E8];
  v20[0] = *MEMORY[0x1E4FB06F8];
  v20[1] = v10;
  v21[0] = v9;
  v21[1] = &unk_1F1B03838;
  v20[2] = *MEMORY[0x1E4FB0700];
  double v11 = [MEMORY[0x1E4FB1618] whiteColor];
  v21[2] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  double v13 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v14 = [(NANowPlayingTitleView *)self titleLabel];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__NANowPlayingTitleView_setTitle___block_invoke;
  v17[3] = &unk_1E6406180;
  v17[4] = self;
  id v18 = v4;
  id v19 = v12;
  id v15 = v12;
  id v16 = v4;
  [v13 transitionWithView:v14 duration:5242880 options:v17 animations:0 completion:0.25];
}

uint64_t __34__NANowPlayingTitleView_setTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 40) attributes:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setAttributedText:v2];

  id v4 = [*(id *)(a1 + 32) titleLabel];
  [v4 sizeToFit];

  v5 = *(void **)(a1 + 32);
  return [v5 setNeedsLayout];
}

- (void)setMarqueeRunning:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NANowPlayingTitleView *)self publisherMarqueeContainer];
  [v5 setMarqueeEnabled:v3];

  id v6 = [(NANowPlayingTitleView *)self titleMarqueeContainer];
  [v6 setMarqueeEnabled:v3];
}

- (double)publisherLogoHeight
{
  uint64_t v2 = [(NANowPlayingTitleView *)self layoutSpecProvider];
  [v2 publisherLogoHeight];
  double v4 = v3;

  return v4;
}

- (BOOL)hasPublisherLogo
{
  uint64_t v2 = [(NANowPlayingTitleView *)self publisherImageView];
  double v3 = [v2 image];
  [v3 size];
  BOOL v5 = v4 > 0.0;

  return v5;
}

- (void)ellipsisButtonTapped:(id)a3
{
  double v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "ellipsisButtonTouchUpInside:", v6, 2u);
  }

  BOOL v5 = [(NANowPlayingTitleView *)self delegate];
  [v5 nowPlayingTitleViewDidTapEllipsis:self];
}

- (UIImageView)publisherImageView
{
  return self->_publisherImageView;
}

- (void)setPublisherImageView:(id)a3
{
}

- (MPUMarqueeView)publisherMarqueeContainer
{
  return self->_publisherMarqueeContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (MPUMarqueeView)titleMarqueeContainer
{
  return self->_titleMarqueeContainer;
}

- (NATouchInsetsButton)ellipsisButton
{
  return self->_ellipsisButton;
}

- (void)setEllipsisButton:(id)a3
{
}

- (NANowPlayingTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NANowPlayingTitleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NANowPlayingTitleViewLayoutSpecProvider)layoutSpecProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutSpecProvider);
  return (NANowPlayingTitleViewLayoutSpecProvider *)WeakRetained;
}

- (void)setLayoutSpecProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutSpecProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ellipsisButton, 0);
  objc_storeStrong((id *)&self->_titleMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_publisherMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_publisherImageView, 0);
}

@end
@interface VUILibraryAlertView
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (VUILibraryAlertView)initWithFrame:(CGRect)a3;
- (void)configureSubtitleTextLayout:(id)a3;
- (void)configureTitleTextLayout:(id)a3;
- (void)layoutSubviews;
@end

@implementation VUILibraryAlertView

- (VUILibraryAlertView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryAlertView;
  v3 = -[VUILibraryAlertView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v4;

    [(UIScrollView *)v3->_scrollView setAutoresizingMask:18];
    [(UIScrollView *)v3->_scrollView setDirectionalLockEnabled:1];
    [(UIScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
    [(VUILibraryAlertView *)v3 addSubview:v3->_scrollView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v3->_containerView;
    v3->_containerView = v6;

    [(UIScrollView *)v3->_scrollView addSubview:v3->_containerView];
    v8 = objc_alloc_init(VUITextLayout);
    [(VUILibraryAlertView *)v3 configureTitleTextLayout:v8];
    uint64_t v9 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v8 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v9;

    [(UIView *)v3->_containerView addSubview:v3->_titleLabel];
    v11 = objc_alloc_init(VUITextLayout);
    [(VUILibraryAlertView *)v3 configureSubtitleTextLayout:v11];
    uint64_t v12 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v11 existingLabel:0];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (VUILabel *)v12;

    [(UIView *)v3->_containerView addSubview:v3->_subtitleLabel];
    v14 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUILibraryAlertView *)v3 setBackgroundColor:v14];

    [(UIScrollView *)v3->_scrollView setContentInsetAdjustmentBehavior:3];
  }
  return v3;
}

- (void)configureTitleTextLayout:(id)a3
{
  id v4 = a3;
  [v4 setTextStyle:2];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [v4 setColor:v3];

  [v4 setFontWeight:10];
  [v4 setAlignment:1];
  [v4 setNumberOfLines:0];
}

- (void)configureSubtitleTextLayout:(id)a3
{
  id v4 = a3;
  [v4 setTextStyle:14];
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [v4 setColor:v3];

  [v4 setAlignment:1];
  [v4 setNumberOfLines:0];
}

- (void)layoutSubviews
{
  [(VUILibraryAlertView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  scrollView = self->_scrollView;
  [(VUILibraryAlertView *)self bounds];
  -[UIScrollView setFrame:](scrollView, "setFrame:");
  [(VUILibraryAlertView *)self bounds];
  double Width = CGRectGetWidth(v36);
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v14 = v13;
  double v16 = Width - (v13 + v15);
  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled])
  {
    if ([(VUILibraryAlertView *)self vuiIsRTL]) {
      double v17 = v10;
    }
    else {
      double v17 = v6;
    }
    double v16 = v16 - v17;
  }
  [(VUILibraryAlertView *)self bounds];
  double v18 = CGRectGetHeight(v37) - v4 - v8;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v16, 1.79769313e308);
  double v20 = v19;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v16, 1.79769313e308);
  double v22 = v21;
  [(VUILabel *)self->_subtitleLabel topMarginToLabel:self->_titleLabel withBaselineMargin:35.0];
  double v24 = v23;
  double v25 = v20 + v22 + v23;
  BOOL v26 = v25 > v18;
  if (v25 <= v18) {
    double v27 = (v18 - v25) * 0.5;
  }
  else {
    double v27 = 0.0;
  }
  [(UIScrollView *)self->_scrollView setScrollEnabled:v26];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:[(UIScrollView *)self->_scrollView isScrollEnabled]];
  v28 = self->_scrollView;
  [(VUILibraryAlertView *)self bounds];
  -[UIScrollView setContentSize:](v28, "setContentSize:", v16, fmax(v25, CGRectGetHeight(v38)));
  -[UIView setFrame:](self->_containerView, "setFrame:", v14, v27, v16, v20 + v22 + v24);
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v16, v20);
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    uint64_t v30 = [(VUILabel *)subtitleLabel text];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [(VUILabel *)self->_subtitleLabel text];
      char v33 = [v32 isEqualToString:&stru_1F3E921E0];

      if ((v33 & 1) == 0)
      {
        v34 = self->_subtitleLabel;
        -[VUILabel setFrame:](v34, "setFrame:", 0.0, v20 + v24, v16, v22);
      }
    }
  }
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
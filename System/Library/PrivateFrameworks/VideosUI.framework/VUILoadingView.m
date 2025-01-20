@interface VUILoadingView
- (NSString)loadingMessage;
- (NSString)loadingTitle;
- (UIActivityIndicatorView)indicatorView;
- (VUILabel)loadingLabel;
- (VUILabel)loadingMessageLabel;
- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4;
- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4 loadingMessage:(id)a5;
- (VUITextLayout)messageTextLayout;
- (VUITextLayout)titleTextLayout;
- (double)delay;
- (void)_setupLabels:(id)a3 message:(id)a4;
- (void)configureMessageTextLayout:(id)a3;
- (void)configureTitleTextLayout:(id)a3;
- (void)layoutSubviews;
- (void)setDelay:(double)a3;
- (void)setIndicatorView:(id)a3;
- (void)setLoadingLabel:(id)a3;
- (void)setLoadingMessage:(id)a3;
- (void)setLoadingMessageLabel:(id)a3;
- (void)setLoadingTitle:(id)a3;
- (void)setMessageTextLayout:(id)a3;
- (void)setTitleTextLayout:(id)a3;
- (void)startTimer;
@end

@implementation VUILoadingView

- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4
{
  return -[VUILoadingView initWithFrame:loadingTitle:loadingMessage:](self, "initWithFrame:loadingTitle:loadingMessage:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4 loadingMessage:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VUILoadingView;
  v13 = -[VUILoadingView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_deladouble y = 1.5;
    v15 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUILoadingView *)v14 setBackgroundColor:v15];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    indicatorView = v14->_indicatorView;
    v14->_indicatorView = (UIActivityIndicatorView *)v16;

    [(VUILoadingView *)v14 _setupLabels:v11 message:v12];
    [(VUILoadingView *)v14 addSubview:v14->_indicatorView];
  }

  return v14;
}

- (void)_setupLabels:(id)a3 message:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    id v7 = v17;
    id v8 = v6;
  }
  else
  {
    v9 = +[VUILocalizationManager sharedInstance];
    id v7 = [v9 localizedStringForKey:@"LOADING"];

    id v10 = v6;
    if (!v7) {
      goto LABEL_5;
    }
  }
  id v11 = objc_alloc_init(VUITextLayout);
  [(VUILoadingView *)self configureTitleTextLayout:v11];
  objc_storeStrong((id *)&self->_loadingTitle, v7);
  id v12 = +[VUILabel labelWithString:self->_loadingTitle textLayout:v11 existingLabel:0];
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v12;

  [(VUILabel *)self->_loadingLabel setHidden:1];
  [(VUILoadingView *)self addSubview:self->_loadingLabel];

LABEL_5:
  if (v6)
  {
    v14 = objc_alloc_init(VUITextLayout);
    [(VUILoadingView *)self configureMessageTextLayout:v14];
    objc_storeStrong((id *)&self->_loadingMessage, a4);
    v15 = +[VUILabel labelWithString:self->_loadingMessage textLayout:v14 existingLabel:0];
    loadingMessageLabel = self->_loadingMessageLabel;
    self->_loadingMessageLabel = v15;

    [(VUILabel *)self->_loadingMessageLabel setHidden:1];
    [(VUILoadingView *)self addSubview:self->_loadingMessageLabel];
  }
}

- (void)setTitleTextLayout:(id)a3
{
  id v8 = (VUITextLayout *)a3;
  if (self->_titleTextLayout != v8)
  {
    objc_storeStrong((id *)&self->_titleTextLayout, a3);
    v5 = [(VUILoadingView *)self loadingTitle];
    id v6 = +[VUILabel labelWithString:v5 textLayout:v8 existingLabel:self->_loadingLabel];
    loadingLabel = self->_loadingLabel;
    self->_loadingLabel = v6;

    [(VUILabel *)self->_loadingLabel setNeedsDisplay];
  }
}

- (void)setMessageTextLayout:(id)a3
{
  id v8 = (VUITextLayout *)a3;
  if (self->_messageTextLayout != v8)
  {
    objc_storeStrong((id *)&self->_messageTextLayout, a3);
    v5 = [(VUILoadingView *)self loadingMessage];
    id v6 = +[VUILabel labelWithString:v5 textLayout:v8 existingLabel:self->_loadingMessageLabel];
    loadingMessageLabel = self->_loadingMessageLabel;
    self->_loadingMessageLabel = v6;

    [(VUILabel *)self->_loadingMessageLabel setNeedsDisplay];
  }
}

- (void)startTimer
{
  indicatorView = self->_indicatorView;
  [(VUILoadingView *)self delay];
  -[UIActivityIndicatorView performSelector:withObject:afterDelay:](indicatorView, "performSelector:withObject:afterDelay:", sel_startAnimating, 0);
  objc_initWeak(&location, self);
  [(VUILoadingView *)self delay];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__VUILoadingView_startTimer__block_invoke;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __28__VUILoadingView_startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained loadingLabel];

  if (v1)
  {
    v2 = [WeakRetained loadingLabel];
    [v2 setHidden:0];
  }
  v3 = [WeakRetained loadingMessageLabel];

  if (v3)
  {
    double v4 = [WeakRetained loadingMessageLabel];
    [v4 setHidden:0];
  }
}

- (void)layoutSubviews
{
  [(VUILoadingView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIActivityIndicatorView *)self->_indicatorView sizeToFit];
  double v11 = 0.0;
  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled])
  {
    [(VUILoadingView *)self safeAreaInsets];
    double v13 = v12;
    double v15 = v14;
    if ([(VUILoadingView *)self vuiIsRTL]) {
      double v16 = v15;
    }
    else {
      double v16 = v13;
    }
    double v11 = v16 * 0.5;
  }
  v45.origin.double x = v4;
  v45.origin.double y = v6;
  v45.size.double width = v8;
  v45.size.double height = v10;
  double MidX = CGRectGetMidX(v45);
  [(UIActivityIndicatorView *)self->_indicatorView bounds];
  double v19 = v11 + MidX + v18 * -0.5;
  v46.origin.double x = v4;
  v46.origin.double y = v6;
  v46.size.double width = v8;
  v46.size.double height = v10;
  double MidY = CGRectGetMidY(v46);
  [(UIActivityIndicatorView *)self->_indicatorView bounds];
  double v22 = MidY - (v21 + 4.5);
  [(UIActivityIndicatorView *)self->_indicatorView bounds];
  double v24 = v23;
  [(UIActivityIndicatorView *)self->_indicatorView bounds];
  -[UIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", v19, v22, v24);
  loadingLabel = self->_loadingLabel;
  double v43 = v11;
  if (loadingLabel)
  {
    [(VUILabel *)loadingLabel sizeToFit];
    v47.origin.double x = v4;
    v47.origin.double y = v6;
    v47.size.double width = v8;
    v47.size.double height = v10;
    double v26 = CGRectGetMidX(v47);
    [(VUILabel *)self->_loadingLabel bounds];
    double v28 = v11 + v26 + v27 * -0.5;
    v48.origin.double x = v4;
    v48.origin.double y = v6;
    v48.size.double width = v8;
    v48.size.double height = v10;
    double v29 = CGRectGetMidY(v48) + 4.5;
    [(VUILabel *)self->_loadingLabel bounds];
    double v31 = v30;
    [(VUILabel *)self->_loadingLabel bounds];
    CGFloat v33 = v32;
    -[VUILabel setFrame:](self->_loadingLabel, "setFrame:", v28, v29, v31);
  }
  else
  {
    double v28 = *MEMORY[0x1E4F1DB28];
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  loadingMessageLabel = self->_loadingMessageLabel;
  if (loadingMessageLabel)
  {
    [(VUILabel *)loadingMessageLabel sizeToFit];
    v49.origin.double x = v28;
    v49.origin.double y = v29;
    v49.size.double width = v31;
    v49.size.double height = v33;
    double MaxY = CGRectGetMaxY(v49);
    v50.origin.double x = v4;
    v50.origin.double y = v6;
    v50.size.double width = v8;
    v50.size.double height = v10;
    double v36 = CGRectGetMidY(v50);
    if (MaxY < v36) {
      double MaxY = v36;
    }
    v37 = self->_loadingMessageLabel;
    v51.origin.double x = v4;
    v51.origin.double y = v6;
    v51.size.double width = v8;
    v51.size.double height = v10;
    double v38 = CGRectGetMidX(v51);
    [(VUILabel *)self->_loadingMessageLabel bounds];
    double v40 = v43 + v38 + v39 * -0.5;
    [(VUILabel *)self->_loadingMessageLabel bounds];
    double v42 = v41;
    [(VUILabel *)self->_loadingMessageLabel bounds];
    -[VUILabel setFrame:](v37, "setFrame:", v40, MaxY + 4.5, v42);
  }
}

- (void)configureTitleTextLayout:(id)a3
{
  id v3 = a3;
  [v3 setTextStyle:2];
  [v3 setFontWeight:10];
  objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setColor:v4];
}

- (void)configureMessageTextLayout:(id)a3
{
  id v3 = a3;
  [v3 setTextStyle:14];
  objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setColor:v4];
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_deladouble y = a3;
}

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (VUITextLayout)messageTextLayout
{
  return self->_messageTextLayout;
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (void)setLoadingTitle:(id)a3
{
}

- (VUILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void)setLoadingLabel:(id)a3
{
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
}

- (VUILabel)loadingMessageLabel
{
  return self->_loadingMessageLabel;
}

- (void)setLoadingMessageLabel:(id)a3
{
}

- (NSString)loadingMessage
{
  return self->_loadingMessage;
}

- (void)setLoadingMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMessage, 0);
  objc_storeStrong((id *)&self->_loadingMessageLabel, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_storeStrong((id *)&self->_messageTextLayout, 0);
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
}

@end
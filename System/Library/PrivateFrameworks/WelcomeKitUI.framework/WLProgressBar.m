@interface WLProgressBar
+ (double)height;
- (WLProgressBar)initWithFrame:(CGRect)a3;
- (void)addTopBorderWithColor:(id)a3 andWidth:(double)a4;
- (void)setProgress:(double)a3;
- (void)setProgressText:(id)a3;
@end

@implementation WLProgressBar

- (WLProgressBar)initWithFrame:(CGRect)a3
{
  v45[3] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)WLProgressBar;
  v3 = -[WLProgressBar initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemGrayColor];
    [(WLProgressBar *)v3 addTopBorderWithColor:v4 andWidth:0.5];

    v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WLProgressBar *)v3 setBackgroundColor:v5];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F82AF0]) initWithProgressViewStyle:0];
    progressView = v3->_progressView;
    v3->_progressView = (UIProgressView *)v6;

    [(UIProgressView *)v3->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WLProgressBar *)v3 addSubview:v3->_progressView];
    v37 = (void *)MEMORY[0x263F08938];
    v41 = [(UIProgressView *)v3->_progressView topAnchor];
    v39 = [(WLProgressBar *)v3 topAnchor];
    v8 = [v41 constraintEqualToAnchor:v39 constant:25.0];
    v45[0] = v8;
    v9 = [(UIProgressView *)v3->_progressView leadingAnchor];
    v10 = [(WLProgressBar *)v3 leadingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10 constant:25.0];
    v45[1] = v11;
    v12 = [(UIProgressView *)v3->_progressView trailingAnchor];
    v13 = [(WLProgressBar *)v3 trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:-25.0];
    v45[2] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    [v37 activateConstraints:v15];

    id v16 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v17;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setTextAlignment:1];
    v19 = v3->_label;
    v20 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v3->_label setNumberOfLines:1];
    [(UILabel *)v3->_label setLineBreakMode:3];
    v21 = v3->_label;
    v22 = WLLocalizedString();
    [(UILabel *)v21 setText:v22];

    [(WLProgressBar *)v3 addSubview:v3->_label];
    v35 = (void *)MEMORY[0x263F08938];
    v42 = [(UILabel *)v3->_label topAnchor];
    v40 = [(UIProgressView *)v3->_progressView bottomAnchor];
    v38 = [v42 constraintEqualToAnchor:v40 constant:-20.0];
    v44[0] = v38;
    v36 = [(UILabel *)v3->_label leadingAnchor];
    v23 = [(WLProgressBar *)v3 leadingAnchor];
    v24 = [v36 constraintEqualToAnchor:v23 constant:20.0];
    v44[1] = v24;
    v25 = [(UILabel *)v3->_label trailingAnchor];
    v26 = [(WLProgressBar *)v3 trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-20.0];
    v44[2] = v27;
    v28 = [(UILabel *)v3->_label bottomAnchor];
    v29 = [(WLProgressBar *)v3 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v44[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    [v35 activateConstraints:v31];

    v32 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    formatter = v3->_formatter;
    v3->_formatter = v32;

    [(NSDateComponentsFormatter *)v3->_formatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v3->_formatter setAllowedUnits:96];
    [(NSDateComponentsFormatter *)v3->_formatter setIncludesApproximationPhrase:1];
  }
  return v3;
}

- (void)addTopBorderWithColor:(id)a3 andWidth:(double)a4
{
  id v5 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setBackgroundColor:v5];

  [v6 setAutoresizingMask:34];
  [(WLProgressBar *)self frame];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0);
  [(WLProgressBar *)self addSubview:v6];
}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  [(UIProgressView *)self->_progressView setProgress:a3];
}

- (void)setProgressText:(id)a3
{
}

+ (double)height
{
  return 100.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
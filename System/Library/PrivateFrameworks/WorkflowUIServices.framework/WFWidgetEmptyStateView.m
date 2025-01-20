@interface WFWidgetEmptyStateView
- (NSString)lastKnownContentSizeCategory;
- (UIImageView)iconView;
- (UILabel)titleLabel;
- (WFWidgetEmptyStateView)initWithTitle:(id)a3;
- (WFWidgetEmptyStateViewDelegate)delegate;
- (void)handleTapGesture;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIconView:(id)a3;
- (void)setLastKnownContentSizeCategory:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFWidgetEmptyStateView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lastKnownContentSizeCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIconView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setLastKnownContentSizeCategory:(id)a3
{
}

- (NSString)lastKnownContentSizeCategory
{
  return self->_lastKnownContentSizeCategory;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetEmptyStateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetEmptyStateViewDelegate *)WeakRetained;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetEmptyStateView;
  [(WFWidgetEmptyStateView *)&v13 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];
  v6 = [(WFWidgetEmptyStateView *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  if (v5 == (void *)v7)
  {
  }
  else
  {
    v8 = (void *)v7;
    v9 = [v4 preferredContentSizeCategory];
    v10 = [(WFWidgetEmptyStateView *)self traitCollection];
    v11 = [v10 preferredContentSizeCategory];
    char v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0) {
      [(WFWidgetEmptyStateView *)self setNeedsLayout];
    }
  }
}

- (void)setTitleString:(id)a3
{
  id v4 = a3;
  v5 = [(WFWidgetEmptyStateView *)self titleLabel];
  v6 = [v5 text];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    v9 = [(WFWidgetEmptyStateView *)self titleLabel];
    [v9 setText:v10];

    [(WFWidgetEmptyStateView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)handleTapGesture
{
  v3 = [(WFWidgetEmptyStateView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFWidgetEmptyStateView *)self delegate];
    [v5 emptyStateViewWasTapped:self];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)WFWidgetEmptyStateView;
  [(WFWidgetEmptyStateView *)&v26 layoutSubviews];
  v3 = [(WFWidgetEmptyStateView *)self titleLabel];
  [v3 sizeToFit];

  char v4 = [(WFWidgetEmptyStateView *)self iconView];
  id v5 = [v4 image];
  [v5 size];
  double v7 = v6;

  char v8 = [(WFWidgetEmptyStateView *)self iconView];
  v9 = [v8 image];
  [v9 size];
  double v11 = v10;

  char v12 = [(WFWidgetEmptyStateView *)self titleLabel];
  [v12 frame];
  double v14 = v13;

  [(WFWidgetEmptyStateView *)self bounds];
  v15 = [(WFWidgetEmptyStateView *)self traitCollection];
  [v15 displayScale];
  BSFloatRoundForScale();
  double v17 = v16;

  [(WFWidgetEmptyStateView *)self bounds];
  v18 = [(WFWidgetEmptyStateView *)self traitCollection];
  [v18 displayScale];
  BSFloatRoundForScale();
  double v20 = v19;

  v21 = [(WFWidgetEmptyStateView *)self iconView];
  objc_msgSend(v21, "setFrame:", v20, v17, v7, v11);

  double v22 = v11 + v17 + 9.0;
  [(WFWidgetEmptyStateView *)self bounds];
  double v24 = v23;
  v25 = [(WFWidgetEmptyStateView *)self titleLabel];
  objc_msgSend(v25, "setFrame:", 0.0, v22, v24, v14);
}

- (WFWidgetEmptyStateView)initWithTitle:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFWidgetEmptyStateView;
  id v5 = [(WFWidgetEmptyStateView *)&v27 init];
  if (v5)
  {
    double v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    [(UIImageView *)v6 setContentMode:1];
    double v7 = [MEMORY[0x263F825C8] labelColor];
    [(UIImageView *)v6 setTintColor:v7];

    [(UIImageView *)v6 setClipsToBounds:1];
    [(WFWidgetEmptyStateView *)v5 addSubview:v6];
    iconView = v5->_iconView;
    v5->_iconView = v6;
    v9 = v6;

    double v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    double v11 = (void *)[v4 copy];
    [(UILabel *)v10 setText:v11];

    char v12 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v10 setTextColor:v12];

    [(UILabel *)v10 setNumberOfLines:2];
    [(UILabel *)v10 setTextAlignment:1];
    [(UILabel *)v10 setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
    [(UILabel *)v10 setAdjustsFontForContentSizeCategory:1];
    id v13 = objc_alloc(MEMORY[0x263F82770]);
    uint64_t v14 = *MEMORY[0x263F835B8];
    v15 = (void *)[v13 initForTextStyle:*MEMORY[0x263F835B8]];
    double v16 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v14 weight:*MEMORY[0x263F81840]];
    double v17 = [v15 scaledFontForFont:v16];
    [(UILabel *)v10 setFont:v17];

    [(WFWidgetEmptyStateView *)v5 addSubview:v10];
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v10;
    double v19 = v10;

    double v20 = [MEMORY[0x263F82818] configurationWithPointSize:6 weight:34.0];
    v21 = [MEMORY[0x263F827E8] _systemImageNamed:@"app.2.stack.3d"];
    double v22 = [v21 imageWithConfiguration:v20];
    double v23 = [(WFWidgetEmptyStateView *)v5 iconView];
    [v23 setImage:v22];

    double v24 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v5 action:sel_handleTapGesture];
    [(WFWidgetEmptyStateView *)v5 addGestureRecognizer:v24];

    v25 = v5;
  }

  return v5;
}

@end
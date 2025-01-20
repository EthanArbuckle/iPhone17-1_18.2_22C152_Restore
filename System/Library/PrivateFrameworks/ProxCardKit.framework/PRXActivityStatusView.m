@interface PRXActivityStatusView
- (NSLayoutConstraint)activityIndicatorVerticalConstraint;
- (PRXActivityStatusView)initWithFrame:(CGRect)a3;
- (PRXLabel)statusLabel;
- (UIActivityIndicatorView)activityIndicator;
- (double)activityIndicatorVerticalShift;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRXActivityStatusView

- (PRXActivityStatusView)initWithFrame:(CGRect)a3
{
  v35[7] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)PRXActivityStatusView;
  v3 = -[PRXActivityStatusView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXActivityStatusView *)v3 addSubview:v3->_activityIndicator];
    uint64_t v6 = +[PRXLabel labelWithStyle:2];
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = (PRXLabel *)v6;

    [(PRXLabel *)v3->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXActivityStatusView *)v3 addSubview:v3->_statusLabel];
    v8 = [(UIActivityIndicatorView *)v3->_activityIndicator bottomAnchor];
    v9 = [(PRXLabel *)v3->_statusLabel firstBaselineAnchor];
    [(PRXActivityStatusView *)v3 activityIndicatorVerticalShift];
    uint64_t v10 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
    activityIndicatorVerticalConstraint = v3->_activityIndicatorVerticalConstraint;
    v3->_activityIndicatorVerticalConstraint = (NSLayoutConstraint *)v10;

    v26 = (void *)MEMORY[0x263F08938];
    v33 = [(UIActivityIndicatorView *)v3->_activityIndicator leadingAnchor];
    v32 = [(PRXActivityStatusView *)v3 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v35[0] = v31;
    v30 = [(PRXLabel *)v3->_statusLabel leadingAnchor];
    v29 = [(UIActivityIndicatorView *)v3->_activityIndicator trailingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:7.0];
    v35[1] = v28;
    v27 = [(PRXLabel *)v3->_statusLabel trailingAnchor];
    v25 = [(PRXActivityStatusView *)v3 trailingAnchor];
    v24 = [v27 constraintEqualToAnchor:v25];
    v35[2] = v24;
    v35[3] = v3->_activityIndicatorVerticalConstraint;
    v23 = [(PRXLabel *)v3->_statusLabel topAnchor];
    v12 = [(PRXActivityStatusView *)v3 topAnchor];
    v13 = [v23 constraintGreaterThanOrEqualToAnchor:v12];
    v35[4] = v13;
    v14 = [(PRXLabel *)v3->_statusLabel bottomAnchor];
    v15 = [(PRXActivityStatusView *)v3 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v35[5] = v16;
    v17 = [(PRXActivityStatusView *)v3 heightAnchor];
    v18 = [(UIActivityIndicatorView *)v3->_activityIndicator heightAnchor];
    v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
    v35[6] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:7];
    [v26 activateConstraints:v20];

    v21 = v3;
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRXActivityStatusView;
  [(PRXActivityStatusView *)&v7 traitCollectionDidChange:a3];
  [(PRXActivityStatusView *)self activityIndicatorVerticalShift];
  double v5 = v4;
  uint64_t v6 = [(PRXActivityStatusView *)self activityIndicatorVerticalConstraint];
  [v6 setConstant:v5];
}

- (double)activityIndicatorVerticalShift
{
  v3 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D260]];
  double v4 = [(PRXActivityStatusView *)self statusLabel];
  double v5 = [v4 font];
  [v5 lineHeight];
  double v7 = v6;
  v8 = [MEMORY[0x263F1CB00] currentTraitCollection];
  [v3 scaledValueForValue:v8 compatibleWithTraitCollection:v7];
  double v10 = v9;

  double v11 = 4.0;
  if (v10 > 20.0) {
    double v11 = 4.0 - (floor(v10 / 10.0) + -1.0);
  }

  return v11;
}

- (PRXLabel)statusLabel
{
  return self->_statusLabel;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (NSLayoutConstraint)activityIndicatorVerticalConstraint
{
  return self->_activityIndicatorVerticalConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
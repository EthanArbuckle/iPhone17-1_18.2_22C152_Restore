@interface SiriUIActivityIndicatorTemplateView
- (SiriUIActivityIndicatorTemplateView)initWithDataSource:(id)a3;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)detailTextLabel;
- (double)desiredHeight;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDetailTextLabel:(id)a3;
- (void)setSpinnerView:(id)a3;
@end

@implementation SiriUIActivityIndicatorTemplateView

- (SiriUIActivityIndicatorTemplateView)initWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  v3 = [(SiriUIBaseTemplateView *)&v12 initWithDataSource:a3];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredBodyLabel");
    detailTextLabel = v3->_detailTextLabel;
    v3->_detailTextLabel = (UILabel *)v4;

    [(UILabel *)v3->_detailTextLabel setUseSecondaryTextColor];
    v6 = v3->_detailTextLabel;
    v7 = [(SiriUIBaseTemplateView *)v3 dataSource];
    v8 = [v7 detailText];
    [(UILabel *)v6 setText:v8];

    [(SiriUIActivityIndicatorTemplateView *)v3 addSubview:v3->_detailTextLabel];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIActivityIndicatorView *)v9;

    [(UIActivityIndicatorView *)v3->_spinnerView startAnimating];
    [(SiriUIActivityIndicatorTemplateView *)v3 addSubview:v3->_spinnerView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  [(SiriUIActivityIndicatorTemplateView *)&v18 layoutSubviews];
  [(SiriUIActivityIndicatorTemplateView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_detailTextLabel sizeToFit];
  [(UILabel *)self->_detailTextLabel frame];
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v7 * -0.5 + v4 * 0.5, v6 * 0.5);
  [(UIActivityIndicatorView *)self->_spinnerView sizeToFit];
  [(UIActivityIndicatorView *)self->_spinnerView frame];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(UILabel *)self->_detailTextLabel text];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    [(UILabel *)self->_detailTextLabel frame];
    double v15 = v14 - v11 + -10.0;
  }
  else
  {
    double v15 = v11 * -0.5 + v6 * 0.5;
  }
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v9 * -0.5 + v4 * 0.5, v15, v9, v11);
  spinnerView = self->_spinnerView;
  CGAffineTransformMakeScale(&v17, 1.5, 1.5);
  [(UIActivityIndicatorView *)spinnerView setTransform:&v17];
}

- (void)reloadData
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUIActivityIndicatorTemplateView;
  [(SiriUIBaseTemplateView *)&v6 reloadData];
  detailTextLabel = self->_detailTextLabel;
  double v4 = [(SiriUIBaseTemplateView *)self dataSource];
  double v5 = [v4 detailText];
  [(UILabel *)detailTextLabel setText:v5];
}

- (double)desiredHeight
{
  return 180.0;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
}

@end
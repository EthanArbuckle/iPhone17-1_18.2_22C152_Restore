@interface LoadingLabel
- (LoadingLabel)init;
- (id)text;
- (void)setHidden:(BOOL)a3;
- (void)setText:(id)a3 showingActivity:(BOOL)a4;
- (void)sizeToFit;
@end

@implementation LoadingLabel

- (LoadingLabel)init
{
  v12.receiver = self;
  v12.super_class = (Class)LoadingLabel;
  v2 = -[LoadingLabel initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    label = v2->_label;
    v2->_label = v3;

    v5 = +[StocksStyle sharedStyle];
    v6 = [v5 lightFontOfSize:14.0];
    [(UILabel *)v2->_label setFont:v6];

    v7 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
    [(UILabel *)v2->_label setTextColor:v7];

    v8 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v2->_label setBackgroundColor:v8];

    uint64_t v9 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:1];
    activityIndicator = v2->_activityIndicator;
    v2->_activityIndicator = (UIActivityIndicatorView *)v9;

    [(UIActivityIndicatorView *)v2->_activityIndicator setHidesWhenStopped:1];
    [(LoadingLabel *)v2 addSubview:v2->_label];
    [(LoadingLabel *)v2 addSubview:v2->_activityIndicator];
  }
  return v2;
}

- (void)sizeToFit
{
  [(UIActivityIndicatorView *)self->_activityIndicator frame];
  double v4 = v3;
  if ([(UIActivityIndicatorView *)self->_activityIndicator isHidden]) {
    double v5 = 0.0;
  }
  else {
    double v5 = v4 + 8.0;
  }
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v12.origin.y = 0.0;
  v12.origin.x = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  CGRectGetMaxX(v12);
  [(LoadingLabel *)self frame];
  -[LoadingLabel setFrame:](self, "setFrame:");
  UIRectCenteredYInRect();
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:");
  UIRectCenteredYInRect();
  label = self->_label;

  -[UILabel setFrame:](label, "setFrame:");
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  }
  v5.receiver = self;
  v5.super_class = (Class)LoadingLabel;
  [(LoadingLabel *)&v5 setHidden:v3];
}

- (id)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3 showingActivity:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  double v6 = +[NetPreferences sharedPreferences];
  char v7 = [v6 isNetworkReachable];

  if (v7)
  {
    [(UILabel *)self->_label setText:v10];
    if (v4)
    {
      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
      goto LABEL_6;
    }
  }
  else
  {
    double v8 = +[StocksBundles getBundle:0];
    CGFloat v9 = [v8 localizedStringForKey:@"Network Unavailable" value:&stru_26D5DA820 table:@"Localizable"];
    [(UILabel *)self->_label setText:v9];
  }
  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
LABEL_6:
  [(LoadingLabel *)self sizeToFit];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
@interface ICQCommerceSpinnerView
- (ICQCommerceSpinnerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ICQCommerceSpinnerView

- (ICQCommerceSpinnerView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ICQCommerceSpinnerView;
  v3 = -[ICQCommerceSpinnerView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_spinner startAnimating];
    [(ICQCommerceSpinnerView *)v3 addSubview:v3->_spinner];
    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    completeingPurchaseLabel = v3->_completeingPurchaseLabel;
    v3->_completeingPurchaseLabel = (UILabel *)v7;

    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"COMLPETING_PURCHASE" value:&stru_26DFF2C90 table:@"Localizable"];
    [(UILabel *)v3->_completeingPurchaseLabel setText:v10];

    v11 = [MEMORY[0x263F825C8] grayColor];
    [(UILabel *)v3->_completeingPurchaseLabel setTextColor:v11];

    v12 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
    [(UILabel *)v3->_completeingPurchaseLabel setFont:v12];

    v13 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_completeingPurchaseLabel setBackgroundColor:v13];

    [(UILabel *)v3->_completeingPurchaseLabel sizeToFit];
    [(ICQCommerceSpinnerView *)v3 addSubview:v3->_completeingPurchaseLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(ICQCommerceSpinnerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_completeingPurchaseLabel frame];
  double v12 = v11;
  double v14 = v13;
  CGFloat v15 = floor((v4 - v8 - v11 + -5.0) * 0.5);
  CGFloat v16 = floor((v6 - v10) * 0.5);
  v21.origin.x = v15;
  v21.origin.y = v16;
  v21.size.width = v8;
  v21.size.height = v10;
  double v17 = CGRectGetMaxX(v21) + 5.0;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v15, v16, v8, v10);
  completeingPurchaseLabel = self->_completeingPurchaseLabel;
  double v19 = v16 + floor((v10 - v14) * 0.5);
  -[UILabel setFrame:](completeingPurchaseLabel, "setFrame:", v17, v19, v12, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeingPurchaseLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
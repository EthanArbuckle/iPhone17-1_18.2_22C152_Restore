@interface ICQCloudStorageDataAndMailBarButtonView
+ (id)barButtonItemWithData:(id)a3 andMail:(id)a4;
- (ICQCloudStorageDataAndMailBarButtonView)initWithData:(id)a3 andMail:(id)a4;
- (void)layoutSubviews;
- (void)sizeToFit;
@end

@implementation ICQCloudStorageDataAndMailBarButtonView

+ (id)barButtonItemWithData:(id)a3 andMail:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ICQCloudStorageDataAndMailBarButtonView alloc] initWithData:v6 andMail:v5];

  [(ICQCloudStorageDataAndMailBarButtonView *)v7 setNeedsLayout];
  [(ICQCloudStorageDataAndMailBarButtonView *)v7 layoutIfNeeded];
  [(ICQCloudStorageDataAndMailBarButtonView *)v7 sizeToFit];
  v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v7];

  return v8;
}

- (ICQCloudStorageDataAndMailBarButtonView)initWithData:(id)a3 andMail:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ICQCloudStorageDataAndMailBarButtonView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[ICQCloudStorageDataAndMailBarButtonView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    data = v12->_data;
    v12->_data = (UILabel *)v13;

    v15 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v12->_data setFont:v15];

    v16 = PSToolbarLabelsTextColor();
    [(UILabel *)v12->_data setTextColor:v16];

    v17 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v12->_data setBackgroundColor:v17];

    [(UILabel *)v12->_data setTextAlignment:1];
    [(UILabel *)v12->_data setLineBreakMode:4];
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"STORAGE_LABEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
    [(UILabel *)v12->_data setText:v19];

    [(UILabel *)v12->_data sizeToFit];
    [(ICQCloudStorageDataAndMailBarButtonView *)v12 addSubview:v12->_data];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    dataSizes = v12->_dataSizes;
    v12->_dataSizes = (UILabel *)v20;

    v22 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v12->_dataSizes setFont:v22];

    v23 = PSToolbarLabelsTextColor();
    [(UILabel *)v12->_dataSizes setTextColor:v23];

    v24 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v12->_dataSizes setBackgroundColor:v24];

    [(UILabel *)v12->_dataSizes setTextAlignment:1];
    [(UILabel *)v12->_dataSizes setLineBreakMode:4];
    [(UILabel *)v12->_dataSizes setText:v6];
    [(UILabel *)v12->_dataSizes sizeToFit];
    [(ICQCloudStorageDataAndMailBarButtonView *)v12 addSubview:v12->_dataSizes];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    mail = v12->_mail;
    v12->_mail = (UILabel *)v25;

    v27 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v12->_mail setFont:v27];

    v28 = PSToolbarLabelsTextColor();
    [(UILabel *)v12->_mail setTextColor:v28];

    v29 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v12->_mail setBackgroundColor:v29];

    [(UILabel *)v12->_mail setTextAlignment:1];
    [(UILabel *)v12->_mail setLineBreakMode:4];
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"MAIL_LABEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
    [(UILabel *)v12->_mail setText:v31];

    [(UILabel *)v12->_mail sizeToFit];
    [(ICQCloudStorageDataAndMailBarButtonView *)v12 addSubview:v12->_mail];
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    mailSizes = v12->_mailSizes;
    v12->_mailSizes = (UILabel *)v32;

    v34 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v12->_mailSizes setFont:v34];

    v35 = PSToolbarLabelsTextColor();
    [(UILabel *)v12->_mailSizes setTextColor:v35];

    v36 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v12->_mailSizes setBackgroundColor:v36];

    [(UILabel *)v12->_mailSizes setTextAlignment:1];
    [(UILabel *)v12->_mailSizes setLineBreakMode:4];
    [(UILabel *)v12->_mailSizes setText:v7];
    [(UILabel *)v12->_mailSizes sizeToFit];
    [(ICQCloudStorageDataAndMailBarButtonView *)v12 addSubview:v12->_mailSizes];
  }

  return v12;
}

- (void)sizeToFit
{
  [(UILabel *)self->_mail frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_mailSizes frame];
  v37.origin.CGFloat x = v11;
  v37.origin.CGFloat y = v12;
  v37.size.CGFloat width = v13;
  v37.size.CGFloat height = v14;
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  CGRect v33 = CGRectUnion(v32, v37);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  [(UILabel *)self->_data frame];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [(UILabel *)self->_dataSizes frame];
  v38.origin.CGFloat x = v27;
  v38.origin.CGFloat y = v28;
  v38.size.CGFloat width = v29;
  v38.size.CGFloat height = v30;
  v34.origin.CGFloat x = v20;
  v34.origin.CGFloat y = v22;
  v34.size.CGFloat width = v24;
  v34.size.CGFloat height = v26;
  CGRect v39 = CGRectUnion(v34, v38);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectUnion(v35, v39);
  -[ICQCloudStorageDataAndMailBarButtonView setBounds:](self, "setBounds:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
}

- (void)layoutSubviews
{
  [(UILabel *)self->_data frame];
  double v4 = v3;
  CGFloat v6 = v5;
  [(UILabel *)self->_dataSizes frame];
  double v8 = v7;
  double v28 = v9;
  [(UILabel *)self->_mail frame];
  double v11 = v10;
  double v25 = v12;
  [(UILabel *)self->_mailSizes frame];
  double v14 = v13;
  double v26 = v8;
  double v27 = v15;
  double v24 = v13;
  if (v4 + 2.0 + v8 >= v11 + 2.0 + v13) {
    double v16 = v4 + 2.0 + v8;
  }
  else {
    double v16 = v11 + 2.0 + v13;
  }
  CGFloat v17 = floor((v8 + v16 - v4 + 2.0) * 0.5);
  v30.origin.CGFloat y = 0.0;
  v30.origin.CGFloat x = v17;
  v30.size.CGFloat width = v4;
  double v18 = v6;
  v30.size.CGFloat height = v6;
  CGFloat v23 = CGRectGetMaxX(v30) + 2.0;
  v31.origin.CGFloat y = 0.0;
  v31.origin.CGFloat x = v17;
  v31.size.CGFloat width = v4;
  v31.size.CGFloat height = v6;
  double v19 = CGRectGetMaxY(v31) + -2.0;
  CGFloat v20 = floor((v14 + v16 - v11 + 2.0) * 0.5);
  v32.origin.CGFloat x = v20;
  v32.origin.CGFloat y = v19;
  v32.size.CGFloat width = v11;
  v32.size.CGFloat height = v25;
  double v21 = CGRectGetMaxX(v32) + 2.0;
  -[UILabel setFrame:](self->_data, "setFrame:", v17, 0.0, v4, v18);
  -[UILabel setFrame:](self->_dataSizes, "setFrame:", v23, 0.0, v26, v28);
  -[UILabel setFrame:](self->_mail, "setFrame:", v20, v19, v11, v25);
  mailSizes = self->_mailSizes;
  -[UILabel setFrame:](mailSizes, "setFrame:", v21, v19, v24, v27);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailSizes, 0);
  objc_storeStrong((id *)&self->_mail, 0);
  objc_storeStrong((id *)&self->_dataSizes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
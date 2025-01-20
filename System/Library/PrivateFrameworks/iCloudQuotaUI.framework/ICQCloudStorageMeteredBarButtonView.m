@interface ICQCloudStorageMeteredBarButtonView
+ (id)barButtonItemWithString:(id)a3 andPercentUsed:(double)a4;
- (ICQCloudStorageMeteredBarButtonView)initWithString:(id)a3 andPercentUsed:(double)a4;
- (void)layoutSubviews;
- (void)sizeToFit;
@end

@implementation ICQCloudStorageMeteredBarButtonView

+ (id)barButtonItemWithString:(id)a3 andPercentUsed:(double)a4
{
  id v5 = a3;
  v6 = [[ICQCloudStorageMeteredBarButtonView alloc] initWithString:v5 andPercentUsed:a4];

  [(ICQCloudStorageMeteredBarButtonView *)v6 setNeedsLayout];
  [(ICQCloudStorageMeteredBarButtonView *)v6 layoutIfNeeded];
  [(ICQCloudStorageMeteredBarButtonView *)v6 sizeToFit];
  v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v6];

  return v7;
}

- (ICQCloudStorageMeteredBarButtonView)initWithString:(id)a3 andPercentUsed:(double)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQCloudStorageMeteredBarButtonView;
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = -[ICQCloudStorageMeteredBarButtonView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    storageString = v11->_storageString;
    v11->_storageString = (UILabel *)v12;

    v14 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v11->_storageString setFont:v14];

    v15 = PSToolbarLabelsTextColor();
    [(UILabel *)v11->_storageString setTextColor:v15];

    v16 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v11->_storageString setBackgroundColor:v16];

    [(UILabel *)v11->_storageString setTextAlignment:1];
    [(UILabel *)v11->_storageString setLineBreakMode:4];
    [(UILabel *)v11->_storageString setText:v6];
    [(UILabel *)v11->_storageString sizeToFit];
    [(ICQCloudStorageMeteredBarButtonView *)v11 addSubview:v11->_storageString];
    v11->_percentUsed = fmin(a4, 1.0);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F82AF0]) initWithProgressViewStyle:1];
    progressBar = v11->_progressBar;
    v11->_progressBar = (UIProgressView *)v17;

    v19 = v11->_progressBar;
    v20 = [MEMORY[0x263F825C8] lightGrayColor];
    [(UIProgressView *)v19 setTrackTintColor:v20];

    *(float *)&double v21 = a4;
    [(UIProgressView *)v11->_progressBar setProgress:v21];
    if (v11->_percentUsed >= 0.949999988)
    {
      v22 = [MEMORY[0x263F825C8] redColor];
      [(UIProgressView *)v11->_progressBar setProgressTintColor:v22];
    }
    [(ICQCloudStorageMeteredBarButtonView *)v11 addSubview:v11->_progressBar];
  }

  return v11;
}

- (void)layoutSubviews
{
  [(ICQCloudStorageMeteredBarButtonView *)self bounds];
  double v4 = v3;
  [(UILabel *)self->_storageString frame];
  CGFloat v6 = v5;
  float v7 = v4;
  float v8 = ceilf(v7);
  double v9 = v8;
  double v10 = floor((282.0 - v8) * 0.5);
  if (v8 >= 282.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v10;
  }
  double v12 = floor((v9 + -282.0) * 0.5);
  if (v8 >= 282.0) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  -[UILabel setFrame:](self->_storageString, "setFrame:", v11, 0.0, v9, v5);
  [(UIProgressView *)self->_progressBar frame];
  double v15 = v14;
  v19.origin.y = 0.0;
  v19.origin.x = v11;
  v19.size.width = v9;
  v19.size.height = v6;
  double MaxY = CGRectGetMaxY(v19);
  progressBar = self->_progressBar;
  -[UIProgressView setFrame:](progressBar, "setFrame:", v13, MaxY + 4.0, 282.0, v15);
}

- (void)sizeToFit
{
  [(UIProgressView *)self->_progressBar frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_storageString frame];
  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.width = v13;
  v18.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGRect v17 = CGRectUnion(v16, v18);
  -[ICQCloudStorageMeteredBarButtonView setBounds:](self, "setBounds:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_storageString, 0);
}

@end
@interface ICQDeviceIdentificationView
+ (void)initialize;
- (ICQDeviceIdentificationView)initWithFrame:(CGRect)a3 deviceName:(id)a4 deviceIdentifier:(id)a5 imageURL:(id)a6 isCurrentDevice:(BOOL)a7;
- (UIImage)deviceImage;
- (double)bottomMargin;
- (double)imageTextPadding;
- (double)leftExtraMargin;
- (double)topMargin;
- (void)layoutSubviews;
- (void)loadImageForDeviceIdentifier:(id)a3 URL:(id)a4;
- (void)setBottomMargin:(double)a3;
- (void)setDeviceImage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageTextPadding:(double)a3;
- (void)setLeftExtraMargin:(double)a3;
- (void)setTopMargin:(double)a3;
- (void)sizeToFit;
@end

@implementation ICQDeviceIdentificationView

+ (void)initialize
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  int v3 = objc_msgSend(v2, "sf_isiPad");

  double v4 = 20.0;
  if (v3) {
    double v4 = 25.0;
  }
  double v5 = 3.0;
  if (v3) {
    double v5 = 10.0;
  }
  kTopMargin = *(void *)&v4;
  kBottomMargin = 0x4014000000000000;
  kImageTextPadding = *(void *)&v5;
}

- (ICQDeviceIdentificationView)initWithFrame:(CGRect)a3 deviceName:(id)a4 deviceIdentifier:(id)a5 imageURL:(id)a6 isCurrentDevice:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v43.receiver = self;
  v43.super_class = (Class)ICQDeviceIdentificationView;
  v18 = -[ICQDeviceIdentificationView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  if (v18)
  {
    v19 = [MEMORY[0x263F825C8] clearColor];
    [(ICQDeviceIdentificationView *)v18 setBackgroundColor:v19];

    *(void *)&v18->_topMargin = kTopMargin;
    *(void *)&v18->_bottomMargin = kBottomMargin;
    v18->_leftExtraMargin = 0.0;
    *(void *)&v18->_imageTextPadding = kImageTextPadding;
    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    deviceImageView = v18->_deviceImageView;
    v18->_deviceImageView = v20;

    v22 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    deviceNameLabel = v18->_deviceNameLabel;
    v18->_deviceNameLabel = v22;

    v24 = v18->_deviceNameLabel;
    v25 = [MEMORY[0x263F81708] boldSystemFontOfSize:18.0];
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v18->_deviceNameLabel setText:v15];
    v26 = v18->_deviceNameLabel;
    v27 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v26 setTextColor:v27];

    v28 = v18->_deviceNameLabel;
    v29 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v28 setBackgroundColor:v29];

    [(UILabel *)v18->_deviceNameLabel setLineBreakMode:4];
    [(UILabel *)v18->_deviceNameLabel setNumberOfLines:2];
    [(ICQDeviceIdentificationView *)v18 addSubview:v18->_deviceNameLabel];
    if (v7)
    {
      v30 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      deviceModelLabel = v18->_deviceModelLabel;
      v18->_deviceModelLabel = v30;

      v32 = v18->_deviceModelLabel;
      v33 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
      [(UILabel *)v32 setFont:v33];

      v34 = v18->_deviceModelLabel;
      v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v36 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"THIS_DEVICE"];
      v37 = [v35 localizedStringForKey:v36 value:&stru_26DFF2C90 table:@"Backup"];
      [(UILabel *)v34 setText:v37];

      v38 = v18->_deviceModelLabel;
      v39 = [MEMORY[0x263F825C8] labelColor];
      [(UILabel *)v38 setTextColor:v39];

      v40 = v18->_deviceModelLabel;
      v41 = [MEMORY[0x263F825C8] clearColor];
      [(UILabel *)v40 setBackgroundColor:v41];

      [(ICQDeviceIdentificationView *)v18 addSubview:v18->_deviceModelLabel];
    }
    [(ICQDeviceIdentificationView *)v18 loadImageForDeviceIdentifier:v16 URL:v17];
    [(ICQDeviceIdentificationView *)v18 addSubview:v18->_deviceImageView];
  }

  return v18;
}

- (void)sizeToFit
{
  [(ICQDeviceIdentificationView *)self bounds];
  -[ICQDeviceIdentificationView setBounds:](self, "setBounds:");
}

- (void)setFrame:(CGRect)a3
{
  if (a3.origin.x == 0.0)
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)ICQDeviceIdentificationView;
    -[ICQDeviceIdentificationView setFrame:](&v5, sel_setFrame_);
  }
}

- (void)loadImageForDeviceIdentifier:(id)a3 URL:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 lowercaseString];
  if (v7)
  {
    v8 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v9 = [v8 objectAtIndex:0];
  }
  else
  {
    v9 = 0;
  }
  v10 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v11 = [v10 bundleIdentifier];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_26DFF2C90;
  }
  v14 = [v9 stringByAppendingPathComponent:v13];

  id v15 = [NSString stringWithFormat:@"deviceImage_%@.png", v7];
  id v16 = [v14 stringByAppendingPathComponent:v15];

  id v17 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke;
  block[3] = &unk_264923418;
  id v22 = v16;
  id v23 = v6;
  v24 = self;
  id v25 = v14;
  id v18 = v14;
  id v19 = v6;
  id v20 = v16;
  dispatch_async(v17, block);
}

void __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke(void *a1)
{
  if (a1[4]
    && (objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:"), (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = (void *)v2;
    int v4 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a1[5]];
    int v4 = 1;
  }
  objc_super v5 = [MEMORY[0x263F827E8] imageWithData:v3];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke_2;
  uint64_t v11 = &unk_264921B68;
  uint64_t v12 = a1[6];
  id v6 = v5;
  id v13 = v6;
  dispatch_async(MEMORY[0x263EF83A0], &v8);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08850]);
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a1[7], 1, 0, 0, v8, v9, v10, v11, v12);
    [v3 writeToFile:a1[4] atomically:0];
  }
}

uint64_t __64__ICQDeviceIdentificationView_loadImageForDeviceIdentifier_URL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceImage:*(void *)(a1 + 40)];
}

- (UIImage)deviceImage
{
  return [(UIImageView *)self->_deviceImageView image];
}

- (void)setDeviceImage:(id)a3
{
  [(UIImageView *)self->_deviceImageView setImage:a3];
  [(ICQDeviceIdentificationView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  PSTableViewSideInset();
  double v4 = v3;
  [(ICQDeviceIdentificationView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  int v13 = [(ICQDeviceIdentificationView *)self _shouldReverseLayoutDirection];
  double v14 = v4 + self->_leftExtraMargin;
  CGFloat rect = v8;
  if (v13)
  {
    v41.origin.double x = v6;
    v41.origin.double y = v8;
    v41.size.double width = v10;
    v41.size.double height = v12;
    double v14 = CGRectGetWidth(v41) + -60.0 - v14 - self->_leftExtraMargin;
  }
  -[UIImageView setFrame:](self->_deviceImageView, "setFrame:", v14, self->_topMargin, 60.0, 60.0);
  CGFloat v15 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v16 = v4 + self->_leftExtraMargin + 60.0 + self->_imageTextPadding;
  double v17 = v10 - v16;
  CGFloat v37 = v6;
  if (v13)
  {
    v42.origin.double x = v6;
    v42.origin.double y = v8;
    v42.size.double width = v10;
    v42.size.double height = v12;
    double Width = CGRectGetWidth(v42);
    v43.origin.double x = v16;
    v43.origin.double y = v15;
    v43.size.double width = v10 - v16;
    v43.size.double height = 1.79769313e308;
    double v19 = Width - CGRectGetWidth(v43);
    v44.origin.double x = v16;
    v44.origin.double y = v15;
    v44.size.double width = v10 - v16;
    v44.size.double height = 1.79769313e308;
    double v16 = v19 - CGRectGetMinX(v44);
  }
  v45.origin.double x = v16;
  v45.origin.double y = v15;
  v45.size.double width = v17;
  v45.size.double height = 1.79769313e308;
  double v20 = CGRectGetWidth(v45);
  -[UILabel sizeThatFits:](self->_deviceNameLabel, "sizeThatFits:", v17, 1.79769313e308);
  double v22 = v21;
  double v24 = v23;
  if (v13)
  {
    v46.origin.double x = v16;
    v46.origin.double y = v15;
    v46.size.double width = v22;
    v46.size.double height = v24;
    double v16 = v16 + v20 - CGRectGetWidth(v46);
  }
  deviceModelLabel = self->_deviceModelLabel;
  double v26 = v24;
  if (deviceModelLabel)
  {
    [(UILabel *)deviceModelLabel sizeToFit];
    [(UILabel *)self->_deviceModelLabel bounds];
    double v26 = v24 + v27;
  }
  float v28 = self->_topMargin + (60.0 - v26) * 0.5;
  double v29 = floorf(v28);
  -[UILabel setFrame:](self->_deviceNameLabel, "setFrame:", v16, v29, v22, v24, *(void *)&v37);
  v30 = self->_deviceModelLabel;
  if (v30)
  {
    [(UILabel *)v30 bounds];
    double v32 = v31;
    double v34 = v33;
    double v35 = self->_imageTextPadding + v4 + self->_leftExtraMargin + 60.0;
    if (v13)
    {
      v47.origin.double x = v38;
      v47.origin.double y = rect;
      v47.size.double width = v10;
      v47.size.double height = v12;
      double v35 = CGRectGetWidth(v47) - v32 - v35;
    }
    v36 = self->_deviceModelLabel;
    -[UILabel setFrame:](v36, "setFrame:", v35, v24 + v29, v32, v34);
  }
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)leftExtraMargin
{
  return self->_leftExtraMargin;
}

- (void)setLeftExtraMargin:(double)a3
{
  self->_leftExtraMargin = a3;
}

- (double)imageTextPadding
{
  return self->_imageTextPadding;
}

- (void)setImageTextPadding:(double)a3
{
  self->_imageTextPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModelLabel, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end
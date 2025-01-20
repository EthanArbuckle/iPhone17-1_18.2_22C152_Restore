@interface REUIScaledFullColorImageView
- (CLKMonochromeFilterProvider)filterProvider;
- (UIImageView)imageView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
@end

@implementation REUIScaledFullColorImageView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)REUIScaledFullColorImageView;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = -[REUIScaledFullColorImageView initWithFrame:](&v14, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v3, v4, v5, v6);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v8;

    [(UIImageView *)v7->_imageView setContentMode:2];
    [(UIImageView *)v7->_imageView setClipsToBounds:1];
    v10 = [(UIImageView *)v7->_imageView layer];
    [v10 setShouldRasterize:1];

    v11 = [(UIImageView *)v7->_imageView layer];
    v12 = [MEMORY[0x263F1C920] mainScreen];
    [v12 scale];
    objc_msgSend(v11, "setRasterizationScale:");

    [(REUIScaledFullColorImageView *)v7 addSubview:v7->_imageView];
  }
  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  uint64_t v5 = [a3 metadata];
  id v8 = [(id)v5 objectForKeyedSubscript:REUIScaledFullColorImageViewImageMetadataKey];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();
  double v6 = [(REUIScaledFullColorImageView *)self imageView];
  if (v5) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [v6 setImage:v7];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)REUIScaledFullColorImageView;
  [(REUIScaledFullColorImageView *)&v17 layoutSubviews];
  [(REUIScaledFullColorImageView *)self bounds];
  CGFloat Width = CGRectGetWidth(v18);
  [(REUIScaledFullColorImageView *)self bounds];
  CGFloat Height = CGRectGetHeight(v19);
  uint64_t v5 = [(REUIScaledFullColorImageView *)self imageView];
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.width = Width;
  v20.size.height = Height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.width = Width;
  v21.size.height = Height;
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v21));

  v22.origin.double x = 0.0;
  v22.origin.double y = 0.0;
  v22.size.width = Width;
  v22.size.height = Height;
  CGRect v23 = CGRectInset(v22, 1.5, 1.5);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double v9 = v23.size.width;
  double v10 = v23.size.height;
  v11 = [(REUIScaledFullColorImageView *)self imageView];
  objc_msgSend(v11, "setBounds:", x, y, v9, v10);

  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.width = v9;
  v24.size.height = v10;
  double v12 = CGRectGetWidth(v24);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.width = v9;
  v25.size.height = v10;
  double v13 = CGRectGetHeight(v25);
  if (v12 >= v13) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }
  v15 = [(REUIScaledFullColorImageView *)self imageView];
  v16 = [v15 layer];
  [v16 setCornerRadius:v14 * 0.5];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_destroyWeak((id *)&self->filterProvider);
}

@end
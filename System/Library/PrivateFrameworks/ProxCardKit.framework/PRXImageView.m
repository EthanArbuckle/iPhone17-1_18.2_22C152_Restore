@interface PRXImageView
+ (id)imageViewWithStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (PRXImageView)initWithStyle:(int64_t)a3;
- (int64_t)style;
@end

@implementation PRXImageView

- (PRXImageView)initWithStyle:(int64_t)a3
{
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (a3 == 1)
  {
    double v7 = 60.0;
    double v6 = 60.0;
  }
  v19.receiver = self;
  v19.super_class = (Class)PRXImageView;
  v8 = -[PRXImageView initWithFrame:](&v19, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    if (a3 == 1)
    {
      [(PRXImageView *)v8 _setContinuousCornerRadius:12.0];
      id v10 = [MEMORY[0x263F1C550] blackColor];
      uint64_t v11 = [v10 CGColor];
      v12 = [(PRXImageView *)v9 layer];
      [v12 setShadowColor:v11];

      v13 = [(PRXImageView *)v9 layer];
      LODWORD(v14) = 1045220557;
      [v13 setShadowOpacity:v14];

      v15 = [(PRXImageView *)v9 layer];
      [v15 setShadowRadius:10.0];

      v16 = [(PRXImageView *)v9 layer];
      objc_msgSend(v16, "setShadowOffset:", 0.0, 8.0);
    }
    v17 = v9;
  }

  return v9;
}

+ (id)imageViewWithStyle:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithStyle:a3];
  return v3;
}

- (CGSize)intrinsicContentSize
{
  if (self->_style == 1)
  {
    double v2 = 60.0;
    double v3 = 60.0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRXImageView;
    [(PRXImageView *)&v4 intrinsicContentSize];
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

@end
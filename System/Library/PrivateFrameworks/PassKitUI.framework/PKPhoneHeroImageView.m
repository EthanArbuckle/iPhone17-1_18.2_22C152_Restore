@interface PKPhoneHeroImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPhoneHeroImageView)initWithImage:(id)a3;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
@end

@implementation PKPhoneHeroImageView

- (PKPhoneHeroImageView)initWithImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPhoneHeroImageView;
    v5 = -[PKPhoneHeroImageView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
      phoneView = v5->_phoneView;
      v5->_phoneView = (UIImageView *)v6;

      [(PKPhoneHeroImageView *)v5 addSubview:v5->_phoneView];
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPhoneHeroImageView;
  [(PKPhoneHeroImageView *)&v4 layoutSubviews];
  phoneView = self->_phoneView;
  [(PKPhoneHeroImageView *)self bounds];
  -[UIImageView setFrame:](phoneView, "setFrame:");
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhoneHeroImageView;
  -[PKPhoneHeroImageView setContentMode:](&v5, sel_setContentMode_);
  [(UIImageView *)self->_phoneView setContentMode:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(UIImageView *)self->_phoneView image];
  [v3 size];
  PKSizeAspectFit();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
}

@end
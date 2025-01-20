@interface _SBUIWallpaperInstructionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_SBUIWallpaperInstructionView)initWithImage:(id)a3 text:(id)a4 font:(id)a5;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation _SBUIWallpaperInstructionView

- (_SBUIWallpaperInstructionView)initWithImage:(id)a3 text:(id)a4 font:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SBUIWallpaperInstructionView;
  v11 = [(_SBUIWallpaperInstructionView *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
    imageView = v11->_imageView;
    v11->_imageView = (UIImageView *)v12;

    [(_SBUIWallpaperInstructionView *)v11 addSubview:v11->_imageView];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    textLabel = v11->_textLabel;
    v11->_textLabel = v14;

    [(UILabel *)v11->_textLabel setText:v9];
    [(UILabel *)v11->_textLabel setFont:v10];
    [(UILabel *)v11->_textLabel setNumberOfLines:0];
    [(_SBUIWallpaperInstructionView *)v11 addSubview:v11->_textLabel];
  }

  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8 + 5.0;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width - (v8 + 5.0), height);
  double v12 = v9 + v11;
  if (v7 >= v10) {
    double v10 = v7;
  }
  result.double height = v10;
  result.double width = v12;
  return result;
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBUIWallpaperInstructionView;
  id v4 = a3;
  [(_SBUIWallpaperInstructionView *)&v5 setTintColor:v4];
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v4, v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  [(_SBUIWallpaperInstructionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v5);
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v4 - (v7 + 5.0), v6);
  BSRectWithSize();
  UIRectCenteredYInRectScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BSRectWithSize();
  UIRectCenteredYInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v23.origin.x = 0.0;
  v23.origin.y = v9;
  v23.size.double width = v11;
  v23.size.double height = v13;
  double v20 = CGRectGetMaxX(v23) + 5.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, v9, v11, v13, 0);
  textLabel = self->_textLabel;
  -[UILabel setFrame:](textLabel, "setFrame:", v20, v15, v17, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
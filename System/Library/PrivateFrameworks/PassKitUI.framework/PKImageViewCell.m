@interface PKImageViewCell
- (PKImageViewCell)initWithReuseIdentifier:(id)a3;
- (UIEdgeInsets)imageViewMargins;
- (UIImage)image;
- (double)imageViewCornerRadius;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageViewCornerRadius:(double)a3;
- (void)setImageViewMargins:(UIEdgeInsets)a3;
@end

@implementation PKImageViewCell

- (PKImageViewCell)initWithReuseIdentifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKImageViewCell;
  v3 = [(PKImageViewCell *)&v14 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(PKImageViewCell *)v3 setAccessoryType:0];
    double v5 = *MEMORY[0x1E4FB2848];
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[PKImageViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E4FB2848], v6, v7, v8);
    v9 = [(PKImageViewCell *)v4 textLabel];
    [v9 setHidden:1];

    v10 = [(PKImageViewCell *)v4 detailTextLabel];
    [v10 setHidden:1];

    v13.receiver = v4;
    v13.super_class = (Class)PKImageViewCell;
    v11 = [(PKImageViewCell *)&v13 imageView];
    [v11 setContentMode:1];
    objc_msgSend(v11, "setLayoutMargins:", v5, v6, v7, v8);
  }
  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKImageViewCell;
  [(PKImageViewCell *)&v7 layoutSubviews];
  v6.receiver = self;
  v6.super_class = (Class)PKImageViewCell;
  v3 = [(PKImageViewCell *)&v6 imageView];
  v4 = [(PKImageViewCell *)self contentView];
  [v4 bounds];
  [v3 layoutMargins];

  double v5 = [v3 image];
  [v5 size];
  PKSizeAspectFit();

  PKSizeAlignedInRect();
  objc_msgSend(v3, "setFrame:");
}

- (void)setImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKImageViewCell;
  id v3 = a3;
  v4 = [(PKImageViewCell *)&v5 imageView];
  objc_msgSend(v4, "setImage:", v3, v5.receiver, v5.super_class);
}

- (UIImage)image
{
  v5.receiver = self;
  v5.super_class = (Class)PKImageViewCell;
  v2 = [(PKImageViewCell *)&v5 imageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIEdgeInsets)imageViewMargins
{
  v15.receiver = self;
  v15.super_class = (Class)PKImageViewCell;
  v2 = [(PKImageViewCell *)&v15 imageView];
  [v2 layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setImageViewMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)PKImageViewCell;
  double v7 = [(PKImageViewCell *)&v8 imageView];
  objc_msgSend(v7, "setLayoutMargins:", top, left, bottom, right);
}

- (double)imageViewCornerRadius
{
  v7.receiver = self;
  v7.super_class = (Class)PKImageViewCell;
  v2 = [(PKImageViewCell *)&v7 imageView];
  double v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (void)setImageViewCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKImageViewCell;
  double v4 = [(PKImageViewCell *)&v6 imageView];
  double v5 = [v4 layer];

  [v5 setCornerRadius:a3];
  [v5 setMasksToBounds:a3 > 0.0];
}

@end
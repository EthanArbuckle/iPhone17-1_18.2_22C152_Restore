@interface PKCellAccessoryMultiSelectIndicator
+ (id)accessoryWithSelected:(BOOL)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCellAccessoryMultiSelectIndicator)initWithSelected:(BOOL)a3;
- (void)layoutSubviews;
@end

@implementation PKCellAccessoryMultiSelectIndicator

+ (id)accessoryWithSelected:(BOOL)a3
{
  v3 = [[PKCellAccessoryMultiSelectIndicator alloc] initWithSelected:a3];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v3 placement:0];

  return v4;
}

- (PKCellAccessoryMultiSelectIndicator)initWithSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCellAccessoryMultiSelectIndicator;
  v4 = -[PKCellAccessoryMultiSelectIndicator initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    if (v3) {
      v5 = @"checkmark.circle.fill";
    }
    else {
      v5 = @"circle";
    }
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    [(UIImageView *)v4->_imageView setContentMode:1];
    [(PKCellAccessoryMultiSelectIndicator *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 36.0;
  double v4 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(PKCellAccessoryMultiSelectIndicator *)self bounds];
  [(PKCellAccessoryMultiSelectIndicator *)self _shouldReverseLayoutDirection];
  PKContentAlignmentMake();
  imageView = self->_imageView;
  PKSizeAlignedInRect();

  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end
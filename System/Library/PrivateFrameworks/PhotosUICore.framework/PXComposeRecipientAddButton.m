@interface PXComposeRecipientAddButton
- (CGSize)imageSizeToAlignWith;
- (PXComposeRecipientAddButton)initWithCoder:(id)a3;
- (PXComposeRecipientAddButton)initWithFrame:(CGRect)a3;
- (double)inset;
- (void)_commmonPXComposeRecipientAddButtonInitialization;
- (void)layoutSubviews;
- (void)setImageSizeToAlignWith:(CGSize)a3;
- (void)setInset:(double)a3;
@end

@implementation PXComposeRecipientAddButton

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

- (double)inset
{
  return self->_inset;
}

- (void)setImageSizeToAlignWith:(CGSize)a3
{
  self->_imageSizeToAlignWith = a3;
}

- (CGSize)imageSizeToAlignWith
{
  double width = self->_imageSizeToAlignWith.width;
  double height = self->_imageSizeToAlignWith.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PXComposeRecipientAddButton;
  [(PXComposeRecipientAddButton *)&v17 layoutSubviews];
  if ([(PXComposeRecipientAddButton *)self contentHorizontalAlignment] == 4)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXComposeRecipientAddButton semanticContentAttribute](self, "semanticContentAttribute"));
    [(PXComposeRecipientAddButton *)self imageSizeToAlignWith];
    double v5 = v4;
    [(PXComposeRecipientAddButton *)self inset];
    double v7 = v6;
    v8 = [(PXComposeRecipientAddButton *)self imageView];
    v9 = [v8 image];
    [v9 size];
    double v11 = v7 + v5 * 0.5 - v10 * 0.5;

    v12 = [(PXComposeRecipientAddButton *)self imageView];
    v13 = [v12 image];
    [v13 size];
    double v15 = v7 + v7 + v5 - v14;

    if (v3 == 1)
    {
      -[PXComposeRecipientAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, 0.0, 0.0, v11);
      double v16 = 0.0;
    }
    else
    {
      -[PXComposeRecipientAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v11, 0.0, 0.0);
      double v16 = v15;
      double v15 = 0.0;
    }
    -[PXComposeRecipientAddButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v16, 0.0, v15);
  }
}

- (PXComposeRecipientAddButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientAddButton;
  uint64_t v3 = [(PXComposeRecipientAddButton *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PXComposeRecipientAddButton *)v3 _commmonPXComposeRecipientAddButtonInitialization];
  }
  return v4;
}

- (PXComposeRecipientAddButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientAddButton;
  uint64_t v3 = -[PXComposeRecipientAddButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PXComposeRecipientAddButton *)v3 _commmonPXComposeRecipientAddButtonInitialization];
  }
  return v4;
}

- (void)_commmonPXComposeRecipientAddButtonInitialization
{
  [(PXComposeRecipientAddButton *)self setContentHorizontalAlignment:4];
  id v10 = [(PXComposeRecipientAddButton *)self titleLabel];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 32770, 2);
  [v10 setFont:v3];
  double v4 = [MEMORY[0x1E4FB1618] tableCellBlueTextColor];
  double v5 = [v4 colorWithAlphaComponent:0.5];
  [(PXComposeRecipientAddButton *)self setTitleColor:v4 forState:0];
  [(PXComposeRecipientAddButton *)self setTitleColor:v5 forState:1];
  objc_super v6 = PXLocalizedStringFromTable(@"PXComposeRecipientAddPeople", @"PhotosUICore");
  [(PXComposeRecipientAddButton *)self setTitle:v6 forState:0];

  double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  v8 = objc_msgSend(v7, "px_tintedImageWithColor:", v4);
  v9 = objc_msgSend(v7, "px_tintedImageWithColor:", v5);
  [(PXComposeRecipientAddButton *)self setImage:v8 forState:0];
  [(PXComposeRecipientAddButton *)self setImage:v9 forState:1];
}

@end
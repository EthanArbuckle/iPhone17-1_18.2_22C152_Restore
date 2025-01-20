@interface PXComposeRecipientAddRecipientTableViewCell
- (PXComposeRecipientAddButton)addRecipientButton;
- (PXComposeRecipientAddRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation PXComposeRecipientAddRecipientTableViewCell

- (void).cxx_destruct
{
}

- (PXComposeRecipientAddButton)addRecipientButton
{
  return self->_addRecipientButton;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientAddRecipientTableViewCell;
  [(PXComposeRecipientAddRecipientTableViewCell *)&v3 layoutSubviews];
  [(PXComposeRecipientAddRecipientTableViewCell *)self bounds];
  -[PXComposeRecipientAddButton setFrame:](self->_addRecipientButton, "setFrame:");
}

- (PXComposeRecipientAddRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXComposeRecipientAddRecipientTableViewCell;
  v4 = [(PXComposeRecipientAddRecipientTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(PXComposeRecipientAddButton);
    addRecipientButton = v4->_addRecipientButton;
    v4->_addRecipientButton = v5;

    +[PXComposeRecipientTableCellModel imageDiameter];
    -[PXComposeRecipientAddButton setImageSizeToAlignWith:](v4->_addRecipientButton, "setImageSizeToAlignWith:", v7, v7);
    +[PXComposeRecipientTableCellModel imageInset];
    -[PXComposeRecipientAddButton setInset:](v4->_addRecipientButton, "setInset:");
    [(PXComposeRecipientAddRecipientTableViewCell *)v4 addSubview:v4->_addRecipientButton];
  }
  return v4;
}

@end
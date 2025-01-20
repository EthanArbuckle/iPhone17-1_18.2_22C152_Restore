@interface PXSharedLibraryParticipantAddButton
- (CGSize)imageSizeToAlignWith;
- (PXSharedLibraryParticipantAddButton)initWithCoder:(id)a3;
- (PXSharedLibraryParticipantAddButton)initWithFrame:(CGRect)a3;
- (double)inset;
- (void)_commonInit;
- (void)layoutSubviews;
- (void)setImageSizeToAlignWith:(CGSize)a3;
- (void)setInset:(double)a3;
@end

@implementation PXSharedLibraryParticipantAddButton

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
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryParticipantAddButton;
  [(PXSharedLibraryParticipantAddButton *)&v16 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXSharedLibraryParticipantAddButton semanticContentAttribute](self, "semanticContentAttribute"));
  [(PXSharedLibraryParticipantAddButton *)self imageSizeToAlignWith];
  double v5 = v4;
  [(PXSharedLibraryParticipantAddButton *)self inset];
  double v7 = v6;
  v8 = [(PXSharedLibraryParticipantAddButton *)self imageView];
  v9 = [v8 image];
  [v9 size];
  double v11 = v7 + v5 * 0.5 - v10 * 0.5;

  v12 = [(PXSharedLibraryParticipantAddButton *)self imageView];
  v13 = [v12 image];
  [v13 size];
  double v15 = v7 + v7 + v5 - v14;

  if (v3 == 1) {
    PXEdgeInsetsByFlippingHorizontally();
  }
  -[PXSharedLibraryParticipantAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v11, 0.0, 0.0);
  -[PXSharedLibraryParticipantAddButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v15, 0.0, 0.0);
}

- (PXSharedLibraryParticipantAddButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryParticipantAddButton;
  uint64_t v3 = [(PXSharedLibraryParticipantAddButton *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PXSharedLibraryParticipantAddButton *)v3 _commonInit];
  }
  return v4;
}

- (PXSharedLibraryParticipantAddButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryParticipantAddButton;
  uint64_t v3 = -[PXSharedLibraryParticipantAddButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PXSharedLibraryParticipantAddButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(PXSharedLibraryParticipantAddButton *)self setContentHorizontalAlignment:4];
  id v11 = [(PXSharedLibraryParticipantAddButton *)self titleLabel];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 0x8000, 2);
  [v11 setFont:v3];
  [v11 setLineBreakMode:1];
  double v4 = [MEMORY[0x1E4FB1618] tableCellBlueTextColor];
  double v5 = [v4 colorWithAlphaComponent:0.5];
  objc_super v6 = [MEMORY[0x1E4FB1618] grayColor];
  [(PXSharedLibraryParticipantAddButton *)self setTitleColor:v4 forState:0];
  [(PXSharedLibraryParticipantAddButton *)self setTitleColor:v5 forState:1];
  [(PXSharedLibraryParticipantAddButton *)self setTitleColor:v6 forState:2];
  double v7 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_AddPeople_Button");
  [(PXSharedLibraryParticipantAddButton *)self setTitle:v7 forState:0];

  v8 = PXSharedLibraryCellSystemImageNamed(@"plus");
  v9 = objc_msgSend(v8, "px_tintedImageWithColor:", v5);
  double v10 = objc_msgSend(v8, "px_tintedImageWithColor:", v6);
  [(PXSharedLibraryParticipantAddButton *)self setImage:v8 forState:0];
  [(PXSharedLibraryParticipantAddButton *)self setImage:v9 forState:1];
  [(PXSharedLibraryParticipantAddButton *)self setImage:v10 forState:2];
}

@end
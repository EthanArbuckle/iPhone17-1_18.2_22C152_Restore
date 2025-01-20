@interface PUPhotosSharingSelectionView
- (PUPhotosSharingSelectionView)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PUPhotosSharingSelectionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkView, 0);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIImageView *)self->_selectedCheckmarkView setHidden:!a3];
  unselectedCheckmarkView = self->_unselectedCheckmarkView;
  [(UIImageView *)unselectedCheckmarkView setHidden:v3];
}

- (PUPhotosSharingSelectionView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUPhotosSharingSelectionView;
  BOOL v3 = -[PUPhotosSharingSelectionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:backgroundColor:", @"checkmark.circle", v4);
    selectedCheckmarkView = v3->_selectedCheckmarkView;
    v3->_selectedCheckmarkView = (UIImageView *)v5;

    [(UIImageView *)v3->_selectedCheckmarkView setHidden:1];
    [(PUPhotosSharingSelectionView *)v3 addSubview:v3->_selectedCheckmarkView];
    [(PUPhotosSharingSelectionView *)v3 bounds];
    -[UIImageView setFrame:](v3->_selectedCheckmarkView, "setFrame:");
    v7 = (void *)MEMORY[0x1E4FB1EB0];
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v9 = objc_msgSend(v7, "px_circularGlyphViewWithName:backgroundColor:", @"circle", v8);
    unselectedCheckmarkView = v3->_unselectedCheckmarkView;
    v3->_unselectedCheckmarkView = (UIImageView *)v9;

    [(PUPhotosSharingSelectionView *)v3 addSubview:v3->_unselectedCheckmarkView];
    [(PUPhotosSharingSelectionView *)v3 bounds];
    -[UIImageView setFrame:](v3->_unselectedCheckmarkView, "setFrame:");
  }
  return v3;
}

@end
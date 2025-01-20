@interface PXPeopleRecoCollectionView
- (PXPeopleRecoCollectionViewDelegate)recoCollectionViewDelegate;
- (void)setFrame:(CGRect)a3;
- (void)setRecoCollectionViewDelegate:(id)a3;
@end

@implementation PXPeopleRecoCollectionView

- (void).cxx_destruct
{
}

- (void)setRecoCollectionViewDelegate:(id)a3
{
}

- (PXPeopleRecoCollectionViewDelegate)recoCollectionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recoCollectionViewDelegate);
  return (PXPeopleRecoCollectionViewDelegate *)WeakRetained;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleRecoCollectionView;
  -[PXPeopleRecoCollectionView setFrame:](&v9, sel_setFrame_);
  v8 = [(PXPeopleRecoCollectionView *)self recoCollectionViewDelegate];
  objc_msgSend(v8, "collectionView:frameDidChange:", self, x, y, width, height);
}

@end
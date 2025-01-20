@interface BKLibraryBookshelfCollectionView
- (BKLibraryBookshelfCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (BKLibraryBookshelfCollectionViewAccessibilityLabelProvider)bkaxLabelProvider;
- (id)accessibilityLabel;
- (int64_t)currentUserInterfaceStyle;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)setBkaxLabelProvider:(id)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
@end

@implementation BKLibraryBookshelfCollectionView

- (BKLibraryBookshelfCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BKLibraryBookshelfCollectionView;
  v4 = -[BKLibraryBookshelfCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = [(BKLibraryBookshelfCollectionView *)v4 traitCollection];
    v5->_currentUserInterfaceStyle = (int64_t)[v6 userInterfaceStyle];

    v7 = +[UITraitCollection bc_allAPITraits];
    id v8 = [(BKLibraryBookshelfCollectionView *)v5 registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v5;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(BKLibraryBookshelfCollectionView *)self traitCollection];
  -[BKLibraryBookshelfCollectionView setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", [v5 userInterfaceStyle]);
}

- (id)accessibilityLabel
{
  v2 = [(BKLibraryBookshelfCollectionView *)self bkaxLabelProvider];
  v3 = [v2 bkaxLabel];

  return v3;
}

- (BKLibraryBookshelfCollectionViewAccessibilityLabelProvider)bkaxLabelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->bkaxLabelProvider);

  return (BKLibraryBookshelfCollectionViewAccessibilityLabelProvider *)WeakRetained;
}

- (void)setBkaxLabelProvider:(id)a3
{
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
}

@end
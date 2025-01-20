@interface ShortcutsRowBackgroundView
- (ShortcutsRowBackgroundView)initWithCollectionView:(id)a3;
- (UICollectionView)collectionView;
- (void)layoutSubviews;
@end

@implementation ShortcutsRowBackgroundView

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)ShortcutsRowBackgroundView;
  [(ShortcutsRowBackgroundView *)&v27 layoutSubviews];
  if (self->_myPlacesFeaturesEnabled)
  {
    [(ShortcutsRowBackgroundView *)self bounds];
    double y = v4;
    double v7 = v6;
    double Height = v8;
  }
  else
  {
    id v10 = [(ShortcutsRowBackgroundView *)self effectiveUserInterfaceLayoutDirection];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    [WeakRetained contentOffset];
    double v13 = v12;

    id v14 = objc_loadWeakRetained((id *)&self->_collectionView);
    [v14 contentSize];
    double Width = v15;

    id v17 = objc_loadWeakRetained((id *)&self->_collectionView);
    [v17 bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v28.origin.x = v19;
    v28.origin.double y = v21;
    v28.size.width = v23;
    v28.size.height = v25;
    if (Width <= CGRectGetWidth(v28))
    {
      v29.origin.x = v19;
      v29.origin.double y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      double Width = CGRectGetWidth(v29);
    }
    double y = CGRectZero.origin.y;
    double v7 = Width + -32.0;
    v30.origin.x = v19;
    v30.origin.double y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    double Height = CGRectGetHeight(v30);
    if (v10 == (id)1)
    {
      [(ShortcutsRowBackgroundView *)self bounds];
      double MaxX = CGRectGetMaxX(v31);
      v32.origin.x = CGRectZero.origin.x;
      v32.origin.double y = y;
      v32.size.width = v7;
      v32.size.height = Height;
      double v3 = v13 + MaxX - CGRectGetWidth(v32) + -16.0;
    }
    else
    {
      double v3 = 16.0 - v13;
    }
  }
  -[UIView setFrame:](self->_platterView, "setFrame:", v3, y, v7, Height);
}

- (ShortcutsRowBackgroundView)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ShortcutsRowBackgroundView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v8 = -[ShortcutsRowBackgroundView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v4);
    id v10 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    platterView = v9->_platterView;
    v9->_platterView = v10;

    double v12 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(UIView *)v9->_platterView setBackgroundColor:v12];

    [(UIView *)v9->_platterView _setContinuousCornerRadius:10.0];
    unsigned int v13 = +[LibraryUIUtilities isMyPlacesEnabled];
    v9->_myPlacesFeaturesEnabled = v13;
    if (v13)
    {
      id v14 = [(UIView *)v9->_platterView layer];
      [v14 setMaskedCorners:0];
    }
    [(ShortcutsRowBackgroundView *)v9 addSubview:v9->_platterView];
  }

  return v9;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);

  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
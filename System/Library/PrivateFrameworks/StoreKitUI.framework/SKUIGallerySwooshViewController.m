@interface SKUIGallerySwooshViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (SKUIGallerySwooshViewController)initWithGallerySwoosh:(id)a3;
- (SKUISwooshPageComponent)gallerySwoosh;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_newViewWithMediaComponent:(id)a3;
- (id)artworkForItemAtIndex:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathsForVisibleItems;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)performActionForItemAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
@end

@implementation SKUIGallerySwooshViewController

- (SKUIGallerySwooshViewController)initWithGallerySwoosh:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGallerySwooshViewController initWithGallerySwoosh:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGallerySwooshViewController;
  v6 = [(SKUIGallerySwooshViewController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    p_gallerySwoosh = (id *)&v6->_gallerySwoosh;
    objc_storeStrong((id *)&v6->_gallerySwoosh, a3);
    v9 = [*p_gallerySwoosh mediaComponents];
    uint64_t v10 = [v9 count];

    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [(SKUIGallerySwooshViewController *)v7 artworkForItemAtIndex:i];
        double itemHeight = v7->_itemHeight;
        double v14 = (double)[v12 height];
        if (itemHeight >= v14) {
          double v14 = itemHeight;
        }
        v7->_double itemHeight = v14;
      }
    }
    if ([*p_gallerySwoosh showsMediaTitles]) {
      v7->_double itemHeight = v7->_itemHeight + 27.0;
    }
  }

  return v7;
}

- (id)artworkForItemAtIndex:(int64_t)a3
{
  v4 = [(SKUISwooshPageComponent *)self->_gallerySwoosh mediaComponents];
  id v5 = [v4 objectAtIndex:a3];

  v6 = [v5 bestThumbnailArtwork];

  return v6;
}

- (void)performActionForItemAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  collectionView = self->_collectionView;
  v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v8 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

  v7 = [v8 contentChildView];
  [v7 beginPlaybackAnimated:v4];
}

- (void)setColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUISwooshViewController *)self colorScheme];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIGallerySwooshViewController;
    [(SKUISwooshViewController *)&v6 setColorScheme:v4];
    [(SKUISwooshView *)self->_swooshView setColoringWithColorScheme:v4];
  }
}

- (id)indexPathsForVisibleItems
{
  return [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUIGallerySwooshViewController;
  [(SKUISwooshViewController *)&v5 setDelegate:v4];
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  collectionView = self->_collectionView;
  objc_super v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a3;
  id v8 = [v6 indexPathForItem:a4 inSection:0];
  id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

  v9 = [v10 contentChildView];
  [v9 setThumbnailImage:v7];
}

- (void)loadView
{
  if (!self->_swooshView)
  {
    v3 = objc_alloc_init(SKUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    objc_super v5 = self->_swooshView;
    objc_super v6 = [(SKUISwooshViewController *)self colorScheme];
    [(SKUISwooshView *)v5 setColoringWithColorScheme:v6];

    id v7 = self->_swooshView;
    id v8 = [(SKUISwooshPageComponent *)self->_gallerySwoosh title];
    [(SKUISwooshView *)v7 setTitle:v8];

    [(SKUISwooshView *)self->_swooshView contentInsets];
    -[SKUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", 0.0, -v9, 0.0, -v10);
  }
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v12 = objc_alloc_init(SKUISwooshCollectionViewLayout);
    [(UICollectionViewFlowLayout *)v12 setMinimumInteritemSpacing:20.0];
    [(UICollectionViewFlowLayout *)v12 setMinimumLineSpacing:20.0];
    [(UICollectionViewFlowLayout *)v12 setScrollDirection:1];
    [(SKUISwooshCollectionViewLayout *)v12 setSnapsToItemBoundaries:1];
    v13 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v12, 0.0, 0.0, 0.0, self->_itemHeight);
    double v14 = self->_collectionView;
    self->_collectionView = v13;

    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"0"];
    [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    v15 = self->_collectionView;
    objc_super v16 = [(SKUISwooshView *)self->_swooshView backgroundColor];
    [(UICollectionView *)v15 setBackgroundColor:v16];

    [(UICollectionView *)self->_collectionView setDataSource:self];
    v17 = self->_collectionView;
    +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate];
    [(UICollectionView *)v17 setDecelerationRate:v18];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setScrollsToTop:0];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setPrefetchingEnabled:0];

    collectionView = self->_collectionView;
  }
  [(SKUISwooshView *)self->_swooshView setCollectionView:collectionView];
  [(SKUISwooshView *)self->_swooshView sizeToFit];
  v19 = self->_swooshView;

  [(SKUIGallerySwooshViewController *)self setView:v19];
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v9 = a3;
  objc_super v6 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v9 bounds];
    objc_msgSend(v9, "convertRect:toView:", self->_collectionView);
    id v7 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    id v8 = v7;
    if (v7) {
      objc_msgSend(v6, "swoosh:didChangePlaybackState:forItemAtIndex:", self, a4, objc_msgSend(v7, "item"));
    }
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"0" forIndexPath:v6];
  id v9 = [v7 backgroundColor];

  [v8 setBackgroundColor:v9];
  uint64_t v10 = [v6 item];

  v11 = [(SKUISwooshPageComponent *)self->_gallerySwoosh mediaComponents];
  v12 = [v11 objectAtIndex:v10];

  v13 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v14 = [v13 swoosh:self imageForCellAtIndex:v10];
  }
  else
  {
    double v14 = 0;
  }
  v15 = [v12 bestThumbnailArtwork];
  id v16 = [(SKUIGallerySwooshViewController *)self _newViewWithMediaComponent:v12];
  [v16 setThumbnailImage:v14];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v21 = (double)[v15 width];
  double v22 = (double)[v15 height];
  v23 = [MEMORY[0x1E4FB1618] blackColor];
  [v16 setBackgroundColor:v23];

  objc_msgSend(v16, "setFrame:", v18, v20, v21, v22);
  [v8 setContentChildView:v16];
  if ([(SKUISwooshPageComponent *)self->_gallerySwoosh showsMediaTitles])
  {
    v24 = [(SKUISwooshViewController *)self colorScheme];
    [v8 setColoringWithColorScheme:v24];

    uint64_t v25 = [v12 title];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = &stru_1F1C879E8;
    }
    [v8 setTitle:v27];
  }
  if (self->_delegateWantsWillDisplay) {
    [v13 swoosh:self willDisplayCellAtIndex:v10];
  }

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(SKUISwooshPageComponent *)self->_gallerySwoosh mediaComponents];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v5 = [(SKUISwooshViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "swoosh:didSelectCellAtIndex:", self, objc_msgSend(v6, "item"));
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 15.0;
  double v7 = 0.0;
  double v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double itemHeight = self->_itemHeight;
  double v6 = -[SKUIGallerySwooshViewController artworkForItemAtIndex:](self, "artworkForItemAtIndex:", objc_msgSend(a5, "item", a3, a4));
  double v7 = (double)[v6 width];

  double v8 = v7;
  double v9 = itemHeight;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(SKUIEmbeddedMediaView);
  double v6 = [v4 accessibilityLabel];
  [(SKUIEmbeddedMediaView *)v5 setAccessibilityLabel:v6];

  [(SKUIEmbeddedMediaView *)v5 setDelegate:self];
  -[SKUIEmbeddedMediaView setMediaType:](v5, "setMediaType:", [v4 mediaType]);
  double v7 = [v4 mediaURLString];

  [(SKUIEmbeddedMediaView *)v5 setMediaURLString:v7];
  return v5;
}

- (SKUISwooshPageComponent)gallerySwoosh
{
  return self->_gallerySwoosh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_gallerySwoosh, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)initWithGallerySwoosh:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGallerySwooshViewController initWithGallerySwoosh:]";
}

@end
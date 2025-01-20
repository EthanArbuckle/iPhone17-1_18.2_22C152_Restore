@interface PXWallpaperSuggestionGadgetView
- (PXDisplayAsset)asset;
- (PXWallpaperSuggestionGadgetView)initWithFrame:(CGRect)a3;
- (PXWallpaperSuggestionView)wallpaperView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAsset:(id)a3;
- (void)setWallpaperView:(id)a3;
@end

@implementation PXWallpaperSuggestionGadgetView

- (void).cxx_destruct
{
}

- (void)setWallpaperView:(id)a3
{
}

- (PXWallpaperSuggestionView)wallpaperView
{
  return self->_wallpaperView;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  if (self->_asset != a3)
  {
    self->_asset = (PXDisplayAsset *)a3;
    id v4 = a3;
    id v5 = [(PXWallpaperSuggestionGadgetView *)self wallpaperView];
    [v5 setAsset:v4];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PXWallpaperSuggestionGadgetView;
  [(PXWallpaperSuggestionGadgetView *)&v12 layoutSubviews];
  [(PXWallpaperSuggestionGadgetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXWallpaperSuggestionGadgetView *)self wallpaperView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXWallpaperSuggestionGadgetView;
  [(PXWallpaperSuggestionGadgetView *)&v3 prepareForReuse];
  [(PXWallpaperSuggestionGadgetView *)self setAsset:0];
}

- (PXWallpaperSuggestionGadgetView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXWallpaperSuggestionGadgetView;
  objc_super v3 = -[PXWallpaperSuggestionGadgetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_alloc_init(PXWallpaperSuggestionView);
    wallpaperView = v3->_wallpaperView;
    v3->_wallpaperView = v4;

    double v6 = [(PXWallpaperSuggestionGadgetView *)v3 contentView];
    [v6 addSubview:v3->_wallpaperView];
  }
  return v3;
}

@end
@interface PXOverlayBadgeUIViewTile
+ (void)preloadResources;
- (PXAssetBadgeManager)badgeManager;
- (PXImageRequester)imageRequester;
- (PXOverlayBadgeUIViewTile)initWithFrame:(CGRect)a3;
- (PXUIAssetBadgeView)_badgeView;
- (unint64_t)_badgeOptions;
- (void)_invalidateBadgeView;
- (void)_setBadgeOptions:(unint64_t)a3;
- (void)_updateBadgeViewIfNeeded;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setBadgeManager:(id)a3;
- (void)setImageRequester:(id)a3;
@end

@implementation PXOverlayBadgeUIViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (unint64_t)_badgeOptions
{
  return self->__badgeOptions;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (PXAssetBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXImageRequesterObserverContext_184756 == a5)
  {
    id v10 = v8;
    id v9 = [(PXOverlayBadgeUIViewTile *)self imageRequester];
    if (v9 == v10)
    {

      id v8 = v10;
      if ((v6 & 0x15) == 0) {
        goto LABEL_7;
      }
      [(PXOverlayBadgeUIViewTile *)self _invalidateBadgeView];
    }
    else
    {
    }
    id v8 = v10;
  }
LABEL_7:
}

- (void)_updateBadgeViewIfNeeded
{
  if (self->_needsUpdateFlags.badgeView)
  {
    v3 = [(PXOverlayBadgeUIViewTile *)self _badgeView];
    v4 = [(PXOverlayBadgeUIViewTile *)self imageRequester];
    v5 = v4;
    if (v4)
    {
      char v6 = [v4 image];
      if (v6) {
        int v7 = 0;
      }
      else {
        int v7 = [v5 isInCloud];
      }

      uint64_t v8 = [v5 asset];
      long long v13 = 0u;
      long long v14 = 0u;
      id v9 = [(PXOverlayBadgeUIViewTile *)self badgeManager];
      id v10 = v9;
      if (v9)
      {
        [v9 badgeInfoForAsset:v8 inCollection:0 options:0];
      }
      else
      {
        long long v13 = 0u;
        long long v14 = 0u;
      }

      if (([(PXOverlayBadgeUIViewTile *)self _badgeOptions] & 2) == 0) {
        *(void *)&long long v13 = 0;
      }
      if (v7) {
        *(void *)&long long v13 = v13 | 0x20;
      }
      long long v11 = v13;
      long long v12 = v14;
      [v3 setBadgeInfo:&v11];
      long long v11 = v13;
      long long v12 = v14;
      PXAssetBadgeInfoIsNull();
    }
    [v3 setHidden:1];
  }
}

- (void)_invalidateBadgeView
{
  self->_needsUpdateFlags.badgeView = 1;
  [(PXOverlayBadgeUIViewTile *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PXOverlayBadgeUIViewTile;
  [(PXOverlayBadgeUIViewTile *)&v15 layoutSubviews];
  [(PXOverlayBadgeUIViewTile *)self _updateBadgeViewIfNeeded];
  [(PXOverlayBadgeUIViewTile *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  +[PXUIAssetBadgeView preferredHeightForStyle:1];
  double v12 = v11;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGFloat v13 = CGRectGetMaxY(v16) - v12;
  long long v14 = [(PXOverlayBadgeUIViewTile *)self _badgeView];
  objc_msgSend(v14, "setFrame:", v4, v13, v8, v12);
}

- (void)_setBadgeOptions:(unint64_t)a3
{
  if (self->__badgeOptions != a3)
  {
    self->__badgeOptions = a3;
    [(PXOverlayBadgeUIViewTile *)self _invalidateBadgeView];
  }
}

- (void)setBadgeManager:(id)a3
{
  double v5 = (PXAssetBadgeManager *)a3;
  if (self->_badgeManager != v5)
  {
    CGFloat v6 = v5;
    objc_storeStrong((id *)&self->_badgeManager, a3);
    [(PXOverlayBadgeUIViewTile *)self _invalidateBadgeView];
    double v5 = v6;
  }
}

- (void)setImageRequester:(id)a3
{
  double v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  double v7 = v5;
  if (imageRequester != v5)
  {
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext_184756];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXImageRequester *)v7 registerChangeObserver:self context:PXImageRequesterObserverContext_184756];
    [(PXOverlayBadgeUIViewTile *)self _invalidateBadgeView];
  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  if (a4) {
    uint64_t v5 = objc_msgSend(a4, "badgeOptions", a3);
  }
  else {
    uint64_t v5 = 0;
  }
  [(PXOverlayBadgeUIViewTile *)self _setBadgeOptions:v5];
  [(PXOverlayBadgeUIViewTile *)self layoutIfNeeded];
}

- (void)prepareForReuse
{
  id v2 = [(PXOverlayBadgeUIViewTile *)self view];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  double v3 = [(PXOverlayBadgeUIViewTile *)self view];
  [v3 setHidden:1];

  [(PXOverlayBadgeUIViewTile *)self setImageRequester:0];
}

- (PXOverlayBadgeUIViewTile)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXOverlayBadgeUIViewTile;
  double v3 = -[PXOverlayBadgeUIViewTile initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXOverlayBadgeUIViewTile *)v3 setUserInteractionEnabled:0];
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXOverlayBadgeUIViewTile *)v4 setBackgroundColor:v5];

    CGFloat v6 = [PXUIAssetBadgeView alloc];
    [(PXOverlayBadgeUIViewTile *)v4 bounds];
    uint64_t v7 = -[PXUIAssetBadgeView initWithFrame:](v6, "initWithFrame:");
    badgeView = v4->__badgeView;
    v4->__badgeView = (PXUIAssetBadgeView *)v7;

    [(PXUIAssetBadgeView *)v4->__badgeView setStyle:1];
    [(PXUIAssetBadgeView *)v4->__badgeView setHidden:1];
    [(PXOverlayBadgeUIViewTile *)v4 addSubview:v4->__badgeView];
    double v9 = [(PXOverlayBadgeUIViewTile *)v4 layer];
    [v9 setAllowsGroupOpacity:0];
  }
  return v4;
}

+ (void)preloadResources
{
}

@end
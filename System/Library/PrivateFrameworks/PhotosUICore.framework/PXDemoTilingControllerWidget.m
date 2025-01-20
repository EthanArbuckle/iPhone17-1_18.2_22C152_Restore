@interface PXDemoTilingControllerWidget
- (BOOL)hasContentForCurrentInput;
- (NSMutableSet)_tilesInUse;
- (NSString)localizedCaption;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PXAssetsDataSourceManager)_dataSourceManager;
- (PXBasicUIViewTileAnimator)_tileAnimator;
- (PXDemoTilingControllerWidget)init;
- (PXPhotoKitUIMediaProvider)_mediaProvider;
- (PXPhotosDetailsContext)context;
- (PXTilingController)_tilingController;
- (PXTilingController)contentTilingController;
- (PXUIAssetsScene)_scene;
- (PXWidgetDelegate)widgetDelegate;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)_demoTilingLayoutForDataSource:(id)a3;
- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (void)_loadTilingController;
- (void)_setLocalizedSubtitle:(id)a3;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)setContext:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)userDidSelectSubtitle;
@end

@implementation PXDemoTilingControllerWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->__scene, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (PXUIAssetsScene)_scene
{
  return self->__scene;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXPhotoKitUIMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (PXAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (void)setContext:(id)a3
{
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXDemoTilingControllerWidget *)self _scene];
  v9 = [v8 tilingController:v7 tileIdentifierConverterForChange:v6];

  v10 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  v11 = [PXComposedTileIdentifierConverter alloc];
  v15[0] = v9;
  v15[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v13 = [(PXComposedTileIdentifierConverter *)v11 initWithTileIdentifierConverters:v12];

  return v13;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  if (*(_OWORD *)&a4->length == __PAIR128__(6432423, 5))
  {
    v8 = [(PXDemoTilingControllerWidget *)self _scene];
    long long v9 = *(_OWORD *)&a4->index[3];
    long long v10 = *(_OWORD *)&a4->index[7];
    long long v29 = *(_OWORD *)&a4->index[5];
    long long v30 = v10;
    unint64_t v31 = a4->index[9];
    long long v11 = *(_OWORD *)&a4->index[1];
    long long v26 = *(_OWORD *)&a4->length;
    long long v27 = v11;
    long long v28 = v9;
    [v8 checkInTile:a3 withIdentifier:&v26];
  }
  else
  {
    +[PXDemoTilingControllerWidgetLayout backgroundTileIdentifier];
    long long v12 = *(_OWORD *)&a4->index[3];
    long long v13 = *(_OWORD *)&a4->index[7];
    long long v29 = *(_OWORD *)&a4->index[5];
    long long v30 = v13;
    unint64_t v31 = a4->index[9];
    long long v14 = *(_OWORD *)&a4->index[1];
    long long v26 = *(_OWORD *)&a4->length;
    long long v27 = v14;
    long long v28 = v12;
    BOOL v15 = (void)v26 == v25[0];
    if ((void)v26 && (void)v26 == v25[0])
    {
      unint64_t v16 = 1;
      do
      {
        uint64_t v17 = *((void *)&v26 + v16);
        uint64_t v18 = v25[v16];
        BOOL v15 = v17 == v18;
        if (v16 >= (unint64_t)v26) {
          break;
        }
        ++v16;
      }
      while (v17 == v18);
    }
    if (v15)
    {
      v19 = a3;
      v20 = [(PXDemoTilingControllerWidget *)self _tilesInUse];
      [v20 removeObject:v19];

      v8 = [v19 view];

      [v8 removeFromSuperview];
    }
    else
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v21 = *(_OWORD *)&a4->index[3];
      long long v22 = *(_OWORD *)&a4->index[7];
      long long v29 = *(_OWORD *)&a4->index[5];
      long long v30 = v22;
      unint64_t v31 = a4->index[9];
      long long v23 = *(_OWORD *)&a4->index[1];
      long long v26 = *(_OWORD *)&a4->length;
      long long v27 = v23;
      long long v28 = v21;
      v24 = PXTileIdentifierDescription((unint64_t *)&v26);
      [v8 handleFailureInMethod:a2, self, @"PXDemoTilingControllerWidget.m", 164, @"unknown identifier %@", v24 object file lineNumber description];
    }
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  if (*(_OWORD *)&a3->length == __PAIR128__(6432423, 5))
  {
    v8 = [(PXDemoTilingControllerWidget *)self _scene];
    long long v9 = *(_OWORD *)&a3->index[3];
    long long v10 = *(_OWORD *)&a3->index[7];
    long long v33 = *(_OWORD *)&a3->index[5];
    long long v34 = v10;
    unint64_t v35 = a3->index[9];
    long long v11 = *(_OWORD *)&a3->index[1];
    long long v30 = *(_OWORD *)&a3->length;
    long long v31 = v11;
    long long v32 = v9;
    long long v12 = (PXDemoTilingControllerWidgetTile *)[(PXDemoTilingControllerWidgetTile *)v8 checkOutTileForIdentifier:&v30 layout:v7];
  }
  else
  {
    +[PXDemoTilingControllerWidgetLayout backgroundTileIdentifier];
    long long v13 = *(_OWORD *)&a3->index[3];
    long long v14 = *(_OWORD *)&a3->index[7];
    long long v33 = *(_OWORD *)&a3->index[5];
    long long v34 = v14;
    unint64_t v35 = a3->index[9];
    long long v15 = *(_OWORD *)&a3->index[1];
    long long v30 = *(_OWORD *)&a3->length;
    long long v31 = v15;
    long long v32 = v13;
    BOOL v16 = (void)v30 == v29[0];
    if ((void)v30 && (void)v30 == v29[0])
    {
      unint64_t v17 = 1;
      do
      {
        uint64_t v18 = *((void *)&v30 + v17);
        uint64_t v19 = v29[v17];
        BOOL v16 = v18 == v19;
        if (v17 >= (unint64_t)v30) {
          break;
        }
        ++v17;
      }
      while (v18 == v19);
    }
    if (v16)
    {
      v8 = objc_alloc_init(PXDemoTilingControllerWidgetTile);
      v20 = [(PXDemoTilingControllerWidget *)self _tilingController];
      long long v21 = [v20 scrollController];

      long long v22 = [(PXDemoTilingControllerWidgetTile *)v8 view];
      [v21 addSubview:v22];

      long long v23 = [(PXDemoTilingControllerWidget *)self _tilesInUse];
      [v23 addObject:v8];

      long long v12 = v8;
    }
    else
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v24 = *(_OWORD *)&a3->index[3];
      long long v25 = *(_OWORD *)&a3->index[7];
      long long v33 = *(_OWORD *)&a3->index[5];
      long long v34 = v25;
      unint64_t v35 = a3->index[9];
      long long v26 = *(_OWORD *)&a3->index[1];
      long long v30 = *(_OWORD *)&a3->length;
      long long v31 = v26;
      long long v32 = v24;
      long long v27 = PXTileIdentifierDescription((unint64_t *)&v30);
      [(PXDemoTilingControllerWidgetTile *)v8 handleFailureInMethod:a2, self, @"PXDemoTilingControllerWidget.m", 149, @"unknown identifier %@", v27 object file lineNumber description];

      long long v12 = 0;
    }
  }

  return v12;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  return [(PXDemoTilingControllerWidget *)self _demoTilingLayoutForDataSource:a4];
}

- (void)userDidSelectSubtitle
{
  v3 = [(PXDemoTilingControllerWidget *)self localizedSubtitle];
  id v4 = (id)[v3 mutableCopy];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"i", @"_#_", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"o", @"i", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"_#_", @"o", 0, 0, objc_msgSend(v4, "length"));
  [(PXDemoTilingControllerWidget *)self _setLocalizedSubtitle:v4];
}

- (NSString)localizedCaption
{
  return (NSString *)@"13 photos nearby";
}

- (NSString)localizedTitle
{
  return (NSString *)@"Demo Tiling Controller";
}

- (PXTilingController)contentTilingController
{
  [(PXDemoTilingControllerWidget *)self _loadTilingController];
  return [(PXDemoTilingControllerWidget *)self _tilingController];
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return a3 * 0.75;
}

- (BOOL)hasContentForCurrentInput
{
  v2 = +[PXPhotosDetailsSettings sharedInstance];
  char v3 = [v2 showDemoTilingViewWidget];

  return v3;
}

- (void)_setLocalizedSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  v5 = self->_localizedSubtitle;
  id v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(NSString *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_localizedSubtitle, a3);
    id v6 = [(PXDemoTilingControllerWidget *)self widgetDelegate];
    [v6 widgetLocalizedSubtitleDidChange:self];
  }

LABEL_5:
}

- (id)_demoTilingLayoutForDataSource:(id)a3
{
  id v3 = a3;
  id v4 = [(PXAssetsTilingLayout *)[PXDemoTilingControllerWidgetLayout alloc] initWithDataSource:v3];

  return v4;
}

- (void)_loadTilingController
{
  if (!self->__tilingController)
  {
    id v3 = [(PXDemoTilingControllerWidget *)self context];
    id v20 = [v3 assetCollections];

    id v4 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v20 options:0];
    v5 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v4];
    id v6 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v5];
    dataSourceManager = self->__dataSourceManager;
    self->__dataSourceManager = &v6->super;

    v8 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = self->__mediaProvider;
    self->__mediaProvider = v8;

    long long v10 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v10;

    long long v12 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v12;

    long long v14 = [(PXAssetsDataSourceManager *)self->__dataSourceManager dataSource];
    long long v15 = [(PXDemoTilingControllerWidget *)self _demoTilingLayoutForDataSource:v14];

    BOOL v16 = [[PXTilingController alloc] initWithLayout:v15];
    tilingController = self->__tilingController;
    self->__tilingController = v16;

    [(PXTilingController *)self->__tilingController setTileAnimator:self->__tileAnimator];
    uint64_t v18 = [(PXAssetsScene *)[PXUIAssetsScene alloc] initWithTilingController:self->__tilingController mediaProvider:self->__mediaProvider dataSourceManager:self->__dataSourceManager delegate:self];
    scene = self->__scene;
    self->__scene = v18;

    [(PXTilingController *)self->__tilingController setTileSource:self];
    [(PXTilingController *)self->__tilingController setTransitionDelegate:self];
    [(PXTilingController *)self->__tilingController setScrollDelegate:self->__scene];
  }
}

- (PXDemoTilingControllerWidget)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXDemoTilingControllerWidget;
  v2 = [(PXDemoTilingControllerWidget *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    localizedSubtitle = v2->_localizedSubtitle;
    v2->_localizedSubtitle = (NSString *)@"3 Infinite Loop";
  }
  return v3;
}

@end
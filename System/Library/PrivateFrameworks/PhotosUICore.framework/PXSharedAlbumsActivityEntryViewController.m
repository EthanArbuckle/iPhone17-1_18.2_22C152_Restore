@interface PXSharedAlbumsActivityEntryViewController
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result;
- (PXSharedAlbumsActivityEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (void)_itemListManagerDidChange:(id)a3;
- (void)loadView;
@end

@implementation PXSharedAlbumsActivityEntryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
}

- (void)_itemListManagerDidChange:(id)a3
{
  v4 = [(PXGLayout *)self->_layout createAnchorForVisibleArea];
  id v5 = (id)[v4 autoInvalidate];

  layout = self->_layout;
  v7 = self->_itemList;
  [(PXGLayout *)layout applySublayoutChangeDetails:0 countAfterChanges:[(PXSharedAlbumsActivityEntryItemList *)v7 count] sublayoutProvider:self];
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  v4 = [(PXSharedAlbumsActivityEntryItemList *)self->_itemList itemAtIndex:a4];
  id v5 = [[PXSharedAlbumsActivityEntryLayout alloc] initWithItem:v4];

  return v5;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5 = (double)(100 * a4 + 100);
  result.height = v5;
  return result;
}

- (void)loadView
{
  v3 = self->_itemList;
  v4 = objc_alloc_init(PXGStackLayout);
  layout = self->_layout;
  self->_layout = v4;

  [(PXGStackLayout *)self->_layout setAxis:1];
  [(PXGStackLayout *)self->_layout setInterlayoutSpacing:20.0];
  -[PXGStackLayout insertSublayoutProvider:inRange:](self->_layout, "insertSublayoutProvider:inRange:", self, 0, [(PXSharedAlbumsActivityEntryItemList *)v3 count]);
  v6 = -[PXGLayout createAnchorForScrollingToContentEdges:padding:](self->_layout, "createAnchorForScrollingToContentEdges:padding:", 4, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  id v7 = (id)[v6 autoInvalidate];

  id v11 = objc_alloc_init(MEMORY[0x1E4F390D0]);
  v8 = [[PXPhotoKitUIMediaProvider alloc] initWithImageManager:v11];
  mediaProvider = self->_mediaProvider;
  self->_mediaProvider = &v8->super.super;

  v10 = objc_alloc_init(PXGView);
  [(PXGView *)v10 setRootLayout:self->_layout];
  [(PXGView *)v10 registerAllTextureProvidersWithMediaProvider:self->_mediaProvider];

  [(PXSharedAlbumsActivityEntryViewController *)self setView:v10];
}

- (PXSharedAlbumsActivityEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXSharedAlbumsActivityEntryViewController;
  v4 = [(PXSharedAlbumsActivityEntryViewController *)&v13 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v6 = objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
    id v7 = +[PXSharedAlbumsActivityEntry fetchActivitiesWithOptions:v6];

    v8 = [PXSharedAlbumsActivityEntryItemList alloc];
    v9 = [v7 fetchedObjects];
    uint64_t v10 = [(PXSharedAlbumsActivityEntryItemList *)v8 initWithActivities:v9];

    itemList = v4->_itemList;
    v4->_itemList = (PXSharedAlbumsActivityEntryItemList *)v10;
  }
  return v4;
}

@end
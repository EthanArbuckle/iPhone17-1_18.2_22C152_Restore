@interface _PXFeedInlinePlaybackController
- (BOOL)canPlayAsset:(id)a3;
- (CGRect)currentVisibleRect;
- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4;
- (PXFeedViewModel)viewModel;
- (PXGLayout)containerLayout;
- (UIEdgeInsets)criticallyVisibleEdgeInsets;
- (_PXFeedInlinePlaybackController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5;
- (id)_itemLayoutForPlaybackRecord:(id)a3;
- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)currentHoveredDisplayAsset;
- (id)itemLayoutDesiredPlayStateSetter;
- (void)_playbackRecord:(id)a3 setDesiredPlayState:(int64_t)a4;
@end

@implementation _PXFeedInlinePlaybackController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemLayoutDesiredPlayStateSetter, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_containerLayout, 0);
}

- (id)itemLayoutDesiredPlayStateSetter
{
  return self->_itemLayoutDesiredPlayStateSetter;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXGLayout)containerLayout
{
  return self->_containerLayout;
}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double top = self->_criticallyVisibleEdgeInsets.top;
  double left = self->_criticallyVisibleEdgeInsets.left;
  double bottom = self->_criticallyVisibleEdgeInsets.bottom;
  double right = self->_criticallyVisibleEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_playbackRecord:(id)a3 setDesiredPlayState:(int64_t)a4
{
  id v6 = a3;
  v7 = [(_PXFeedInlinePlaybackController *)self _itemLayoutForPlaybackRecord:v6];
  v8 = [(_PXFeedInlinePlaybackController *)self itemLayoutDesiredPlayStateSetter];
  if (v6) {
    [v6 bestVideoTimeRange];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  ((void (**)(void, void *, BOOL, _OWORD *))v8)[2](v8, v7, a4 == 1, v9);
}

- (id)_itemLayoutForPlaybackRecord:(id)a3
{
  return (id)[a3 geometryReference];
}

- (BOOL)canPlayAsset:(id)a3
{
  if ((unint64_t)([a3 playbackStyle] - 3) > 2) {
    return 0;
  }
  v3 = +[PXStorySettings sharedInstance];
  char v4 = [v3 wantsInlinePlayback];

  return v4;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  v5 = -[_PXFeedInlinePlaybackController _itemLayoutForPlaybackRecord:](self, "_itemLayoutForPlaybackRecord:", a3, a4);
  [(_PXFeedInlinePlaybackController *)self containerLayout];
  objc_claimAutoreleasedReturnValue();
  [v5 contentSize];
  PXRectWithOriginAndSize();
}

- (id)currentHoveredDisplayAsset
{
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(_PXFeedInlinePlaybackController *)self viewModel];
  char v4 = [v3 selectionSnapshot];
  v5 = v4;
  if (v4)
  {
    [v4 pendingIndexPath];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }

  if ((void)v14 == *(void *)off_1E5DAAED8)
  {
    id v6 = 0;
  }
  else
  {
    v7 = [(_PXFeedInlinePlaybackController *)self viewModel];
    v8 = [v7 dataSource];
    v13[0] = v14;
    v13[1] = v15;
    id v6 = [v8 objectReferenceAtIndexPath:v13];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
LABEL_11:
    v10 = v9;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 keyAssetReference];
    goto LABEL_11;
  }
  v10 = 0;
LABEL_13:
  v11 = [v10 asset];

  return v11;
}

- (CGRect)currentVisibleRect
{
  v2 = [(_PXFeedInlinePlaybackController *)self containerLayout];
  [v2 visibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(PXGridInlinePlaybackRecord *)[_PXFeedInlinePlaybackRecord alloc] initWithDisplayAsset:v10 mediaProvider:v9 geometryReference:v8];

  [(_PXFeedInlinePlaybackRecord *)v11 setInlinePlaybackController:self];
  return v11;
}

- (_PXFeedInlinePlaybackController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_PXFeedInlinePlaybackController;
  id v10 = [(PXGridInlinePlaybackController *)&v16 init];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_containerLayout, a3);
    uint64_t v12 = [v9 copy];
    id itemLayoutDesiredPlayStateSetter = v11->_itemLayoutDesiredPlayStateSetter;
    v11->_id itemLayoutDesiredPlayStateSetter = (id)v12;

    double v14 = +[PXStorySettings sharedInstance];
    [v14 inlinePlaybackCriticalInsets];

    PXEdgeInsetsMake();
  }

  return 0;
}

@end
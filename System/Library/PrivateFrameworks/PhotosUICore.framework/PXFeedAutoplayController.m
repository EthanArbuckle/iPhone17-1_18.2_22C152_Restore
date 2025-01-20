@interface PXFeedAutoplayController
- (BOOL)isContainerLayoutVisible;
- (NSMapTable)playbackRecordsByItemLayout;
- (PXFeedAutoplayController)init;
- (PXFeedAutoplayController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5;
- (_PXFeedInlinePlaybackController)inlinePlaybackController;
- (void)addItemLayout:(id)a3 withDisplayAsset:(id)a4;
- (void)containerLayoutVisibleRectDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)removeItemLayout:(id)a3;
- (void)setIsContainerLayoutVisible:(BOOL)a3;
@end

@implementation PXFeedAutoplayController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRecordsByItemLayout, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
}

- (NSMapTable)playbackRecordsByItemLayout
{
  return self->_playbackRecordsByItemLayout;
}

- (_PXFeedInlinePlaybackController)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ViewModelObservationContext_263912 != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXFeedAutoplayController.m" lineNumber:85 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 4) != 0)
  {
    id v14 = v9;
    v10 = [(PXFeedAutoplayController *)self inlinePlaybackController];
    int v11 = [v10 shouldPlayOnHover];

    id v9 = v14;
    if (v11)
    {
      v12 = [(PXFeedAutoplayController *)self inlinePlaybackController];
      [v12 invalidatePlayingRecords];

      id v9 = v14;
    }
  }
}

- (void)removeItemLayout:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedAutoplayController *)self playbackRecordsByItemLayout];
  id v9 = [v5 objectForKey:v4];

  char v6 = [(PXFeedAutoplayController *)self playbackRecordsByItemLayout];
  [v6 removeObjectForKey:v4];

  v7 = [v9 displayAsset];
  if (v7)
  {
    v8 = [(PXFeedAutoplayController *)self inlinePlaybackController];
    [v8 checkInPlaybackRecordForDisplayAsset:v7];
  }
}

- (void)addItemLayout:(id)a3 withDisplayAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXFeedAutoplayController *)self inlinePlaybackController];
  id v10 = [v8 checkOutPlaybackRecordForDisplayAsset:v6 mediaProvider:0 geometryReference:v7];

  id v9 = [(PXFeedAutoplayController *)self playbackRecordsByItemLayout];
  [v9 setObject:v10 forKey:v7];
}

- (void)setIsContainerLayoutVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXFeedAutoplayController *)self inlinePlaybackController];
  [v4 setIsContentViewVisible:v3];
}

- (BOOL)isContainerLayoutVisible
{
  v2 = [(PXFeedAutoplayController *)self inlinePlaybackController];
  char v3 = [v2 isContentViewVisible];

  return v3;
}

- (void)containerLayoutVisibleRectDidChange
{
  id v2 = [(PXFeedAutoplayController *)self inlinePlaybackController];
  [v2 visibleRectDidChange];
}

- (PXFeedAutoplayController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXFeedAutoplayController;
  int v11 = [(PXFeedAutoplayController *)&v17 init];
  if (v11)
  {
    v12 = [[_PXFeedInlinePlaybackController alloc] initWithContainerLayout:v8 viewModel:v9 itemLayoutDesiredPlayStateSetter:v10];
    inlinePlaybackController = v11->_inlinePlaybackController;
    v11->_inlinePlaybackController = v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    playbackRecordsByItemLayout = v11->_playbackRecordsByItemLayout;
    v11->_playbackRecordsByItemLayout = (NSMapTable *)v14;

    [v9 registerChangeObserver:v11 context:ViewModelObservationContext_263912];
  }

  return v11;
}

- (PXFeedAutoplayController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedAutoplayController.m", 35, @"%s is not available as initializer", "-[PXFeedAutoplayController init]");

  abort();
}

@end
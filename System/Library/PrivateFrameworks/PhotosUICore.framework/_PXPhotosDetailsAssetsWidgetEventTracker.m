@interface _PXPhotosDetailsAssetsWidgetEventTracker
- (BOOL)isDisplayingCuratedContent;
- (NSString)visibleState;
- (_PXPhotosDetailsAssetsWidgetEventTracker)init;
- (int64_t)visibleStateSignpost;
- (void)_invalidateVisibleState;
- (void)_logDidEndViewingState:(id)a3;
- (void)_logDidStartViewingState:(id)a3;
- (void)_updateVisibleState;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setIsDisplayingCuratedContent:(BOOL)a3;
- (void)setVisibleState:(id)a3;
- (void)setVisibleStateSignpost:(int64_t)a3;
@end

@implementation _PXPhotosDetailsAssetsWidgetEventTracker

- (void).cxx_destruct
{
}

- (void)setVisibleStateSignpost:(int64_t)a3
{
  self->_visibleStateSignpost = a3;
}

- (int64_t)visibleStateSignpost
{
  return self->_visibleStateSignpost;
}

- (NSString)visibleState
{
  return self->_visibleState;
}

- (BOOL)isDisplayingCuratedContent
{
  return self->_isDisplayingCuratedContent;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)EventTrackerObservationContext_207416 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsAssetsWidgetEventTracker.m" lineNumber:104 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(_PXPhotosDetailsAssetsWidgetEventTracker *)self _invalidateVisibleState];
    id v9 = v11;
  }
}

- (void)_logDidEndViewingState:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F56658];
  id v5 = a3;
  int64_t v6 = [(_PXPhotosDetailsAssetsWidgetEventTracker *)self visibleStateSignpost];
  uint64_t v7 = *MEMORY[0x1E4F56440];
  uint64_t v9 = *MEMORY[0x1E4F56580];
  v10[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 endSignpost:v6 forEventName:v7 withPayload:v8];

  [(_PXPhotosDetailsAssetsWidgetEventTracker *)self setVisibleStateSignpost:0];
}

- (void)_logDidStartViewingState:(id)a3
{
  if ([(_PXPhotosDetailsAssetsWidgetEventTracker *)self visibleStateSignpost])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXPhotosDetailsAssetsWidgetEventTracker.m", 85, @"Invalid parameter not satisfying: %@", @"self.visibleStateSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  uint64_t v5 = [MEMORY[0x1E4F56658] startSignpost];
  [(_PXPhotosDetailsAssetsWidgetEventTracker *)self setVisibleStateSignpost:v5];
}

- (void)setVisibleState:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_visibleState;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      if (self->_visibleState) {
        -[_PXPhotosDetailsAssetsWidgetEventTracker _logDidEndViewingState:](self, "_logDidEndViewingState:");
      }
      int64_t v6 = (NSString *)[(NSString *)v8 copy];
      visibleState = self->_visibleState;
      self->_visibleState = v6;

      if (self->_visibleState) {
        -[_PXPhotosDetailsAssetsWidgetEventTracker _logDidStartViewingState:](self, "_logDidStartViewingState:");
      }
    }
  }
}

- (void)_updateVisibleState
{
  if ([(PXUserInterfaceElementEventTracker *)self isVisible])
  {
    BOOL v3 = [(_PXPhotosDetailsAssetsWidgetEventTracker *)self isDisplayingCuratedContent];
    v4 = @"com.apple.photos.CPAnalytics.photosDetailsAssetsAllDisplayed";
    if (v3) {
      v4 = @"com.apple.photos.CPAnalytics.photosDetailsAssetsSummaryDisplayed";
    }
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  int64_t v6 = v5;
  [(_PXPhotosDetailsAssetsWidgetEventTracker *)self setVisibleState:v5];
}

- (void)_invalidateVisibleState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67___PXPhotosDetailsAssetsWidgetEventTracker__invalidateVisibleState__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(_PXPhotosDetailsAssetsWidgetEventTracker *)self performChanges:v2];
}

- (void)setIsDisplayingCuratedContent:(BOOL)a3
{
  if (self->_isDisplayingCuratedContent != a3)
  {
    self->_isDisplayingCuratedContent = a3;
    [(_PXPhotosDetailsAssetsWidgetEventTracker *)self _invalidateVisibleState];
  }
}

- (_PXPhotosDetailsAssetsWidgetEventTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosDetailsAssetsWidgetEventTracker;
  v2 = [(PXUserInterfaceElementEventTracker *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(_PXPhotosDetailsAssetsWidgetEventTracker *)v2 registerChangeObserver:v2 context:EventTrackerObservationContext_207416];
    v4 = [(PXUserInterfaceElementEventTracker *)v3 updater];
    [v4 addUpdateSelector:sel__updateVisibleState];
  }
  return v3;
}

@end
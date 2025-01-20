@interface PXMediaViewControllerEventTracker
- (NSString)viewName;
- (PXDisplayAsset)displayedAsset;
- (PXDisplayAssetCollection)displayedAssetCollection;
- (PXMediaViewControllerEventTracker)init;
- (PXMediaViewControllerEventTracker)initWithViewName:(id)a3;
- (_PXTrackedMediaRecord)currentlyVisibleMediaRecord;
- (id)lastVisibleMedia;
- (int64_t)mediaViewedSignpost;
- (int64_t)specificMediaViewedSignpost;
- (void)_invalidateCurrentlyVisibleMedia;
- (void)_updateCurrentlyVisibleMedia;
- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5;
- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCurrentlyVisibleMediaRecord:(id)a3;
- (void)setDisplayedAsset:(id)a3;
- (void)setDisplayedAssetCollection:(id)a3;
- (void)setLastVisibleMedia:(id)a3;
- (void)setMediaViewedSignpost:(int64_t)a3;
- (void)setSpecificMediaViewedSignpost:(int64_t)a3;
@end

@implementation PXMediaViewControllerEventTracker

- (NSString)viewName
{
  return self->_viewName;
}

- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4
{
  id v7 = a3;
  if ([(PXMediaViewControllerEventTracker *)self mediaViewedSignpost])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXMediaViewControllerEventTracker.m", 125, @"Invalid parameter not satisfying: %@", @"self.mediaViewedSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  -[PXMediaViewControllerEventTracker setMediaViewedSignpost:](self, "setMediaViewedSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  if ([(PXMediaViewControllerEventTracker *)self specificMediaViewedSignpost])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXMediaViewControllerEventTracker.m", 127, @"Invalid parameter not satisfying: %@", @"self.specificMediaViewedSignpost == CPAnalyticsSignpostIDNull" object file lineNumber description];
  }
  -[PXMediaViewControllerEventTracker setSpecificMediaViewedSignpost:](self, "setSpecificMediaViewedSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
  v8 = [(PXMediaViewControllerEventTracker *)self lastVisibleMedia];
  int v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0) {
    [(PXMediaViewControllerEventTracker *)self setLastVisibleMedia:v7];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  v11 = v10;
  switch(a4)
  {
    case 2:
      v12 = (void *)MEMORY[0x1E4F56548];
LABEL_13:
      [v10 setObject:v7 forKeyedSubscript:*v12];
      break;
    case 1:
      v12 = (void *)MEMORY[0x1E4F56558];
      goto LABEL_13;
    case 0:
      PXAssertGetLog();
  }
  v13 = [(PXMediaViewControllerEventTracker *)self viewName];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F56560]];

  v14 = [NSNumber numberWithBool:v9 ^ 1u];
  [v11 setObject:v14 forKeyedSubscript:@"isFirstAppearance"];

  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.mediaAppeared" withPayload:v11];
}

- (int64_t)specificMediaViewedSignpost
{
  return self->_specificMediaViewedSignpost;
}

- (void)setSpecificMediaViewedSignpost:(int64_t)a3
{
  self->_specificMediaViewedSignpost = a3;
}

- (void)setMediaViewedSignpost:(int64_t)a3
{
  self->_mediaViewedSignpost = a3;
}

- (void)setLastVisibleMedia:(id)a3
{
}

- (int64_t)mediaViewedSignpost
{
  return self->_mediaViewedSignpost;
}

- (id)lastVisibleMedia
{
  return self->_lastVisibleMedia;
}

- (void)_updateCurrentlyVisibleMedia
{
  if (![(PXViewControllerEventTracker *)self isViewVisible]) {
    goto LABEL_10;
  }
  v3 = [(PXMediaViewControllerEventTracker *)self displayedAsset];

  if (!v3)
  {
    v6 = [(PXMediaViewControllerEventTracker *)self displayedAssetCollection];

    if (v6)
    {
      uint64_t v4 = [(PXMediaViewControllerEventTracker *)self displayedAssetCollection];
      uint64_t v5 = 2;
      if (v4) {
        goto LABEL_7;
      }
    }
LABEL_10:
    [(PXMediaViewControllerEventTracker *)self setCurrentlyVisibleMediaRecord:0];
    return;
  }
  uint64_t v4 = [(PXMediaViewControllerEventTracker *)self displayedAsset];
  uint64_t v5 = 1;
  if (!v4) {
    goto LABEL_10;
  }
LABEL_7:
  id v9 = (id)v4;
  id v7 = [_PXTrackedMediaRecord alloc];
  [(PXUserInterfaceElementEventTracker *)self currentTimestamp];
  v8 = -[_PXTrackedMediaRecord initWithMedia:mediaKind:timestamp:](v7, "initWithMedia:mediaKind:timestamp:", v9, v5);
  [(PXMediaViewControllerEventTracker *)self setCurrentlyVisibleMediaRecord:v8];
}

- (PXDisplayAsset)displayedAsset
{
  return self->_displayedAsset;
}

- (void)setCurrentlyVisibleMediaRecord:(id)a3
{
  id v13 = a3;
  id v5 = [v13 media];
  p_currentlyVisibleMediaRecord = &self->_currentlyVisibleMediaRecord;
  id v7 = [(_PXTrackedMediaRecord *)self->_currentlyVisibleMediaRecord media];
  if (v5 == v7)
  {

    goto LABEL_8;
  }
  v8 = v7;
  char v9 = [v5 isEqual:v7];

  if ((v9 & 1) == 0)
  {
    if (*p_currentlyVisibleMediaRecord)
    {
      [(_PXTrackedMediaRecord *)*p_currentlyVisibleMediaRecord timestamp];
      -[PXUserInterfaceElementEventTracker timeIntervalSinceTimestamp:](self, "timeIntervalSinceTimestamp:");
      double v11 = v10;
      v12 = [(_PXTrackedMediaRecord *)*p_currentlyVisibleMediaRecord media];
      [(PXMediaViewControllerEventTracker *)self logDidEndViewingMedia:v12 mediaKind:[(_PXTrackedMediaRecord *)*p_currentlyVisibleMediaRecord mediaKind] duration:v11];
    }
    objc_storeStrong((id *)&self->_currentlyVisibleMediaRecord, a3);
    if (*p_currentlyVisibleMediaRecord)
    {
      id v5 = [v13 media];
      -[PXMediaViewControllerEventTracker logDidStartViewingMedia:mediaKind:](self, "logDidStartViewingMedia:mediaKind:", v5, [v13 mediaKind]);
LABEL_8:
    }
  }
}

- (void)setDisplayedAssetCollection:(id)a3
{
  id v7 = (PXDisplayAssetCollection *)a3;
  id v5 = self->_displayedAssetCollection;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXDisplayAssetCollection *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedAssetCollection, a3);
      [(PXMediaViewControllerEventTracker *)self _invalidateCurrentlyVisibleMedia];
    }
  }
}

- (void)setDisplayedAsset:(id)a3
{
  id v7 = (PXDisplayAsset *)a3;
  id v5 = self->_displayedAsset;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXDisplayAsset *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedAsset, a3);
      [(PXMediaViewControllerEventTracker *)self _invalidateCurrentlyVisibleMedia];
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)EventTrackerObservationContext == a5)
  {
    if ((a4 & 8) != 0) {
      [(PXMediaViewControllerEventTracker *)self _invalidateCurrentlyVisibleMedia];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXMediaViewControllerEventTracker;
    [(PXViewControllerEventTracker *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

- (void)_invalidateCurrentlyVisibleMedia
{
  if (!self->_didInvalidateCurrentlyVisibleMediaOnce)
  {
    self->_didInvalidateCurrentlyVisibleMediaOnce = 1;
    v3 = [(PXUserInterfaceElementEventTracker *)self updater];
    [v3 addUpdateSelector:sel__updateCurrentlyVisibleMedia];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXMediaViewControllerEventTracker__invalidateCurrentlyVisibleMedia__block_invoke;
  v4[3] = &unk_1E5DD0FA8;
  v4[4] = self;
  [(PXMediaViewControllerEventTracker *)self performChanges:v4];
}

void __69__PXMediaViewControllerEventTracker__invalidateCurrentlyVisibleMedia__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 setNeedsUpdateOf:sel__updateCurrentlyVisibleMedia];
}

- (PXMediaViewControllerEventTracker)initWithViewName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMediaViewControllerEventTracker;
  id v5 = [(PXViewControllerEventTracker *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    viewName = v5->_viewName;
    v5->_viewName = (NSString *)v6;

    [(PXMediaViewControllerEventTracker *)v5 registerChangeObserver:v5 context:EventTrackerObservationContext];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastVisibleMedia, 0);
  objc_storeStrong((id *)&self->_currentlyVisibleMediaRecord, 0);
  objc_storeStrong((id *)&self->_displayedAssetCollection, 0);
  objc_storeStrong((id *)&self->_displayedAsset, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
}

- (_PXTrackedMediaRecord)currentlyVisibleMediaRecord
{
  return self->_currentlyVisibleMediaRecord;
}

- (PXDisplayAssetCollection)displayedAssetCollection
{
  return self->_displayedAssetCollection;
}

- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5
{
  id v7 = a3;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  objc_super v9 = v8;
  switch(a4)
  {
    case 2:
      [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F56548]];
      double v11 = (id *)MEMORY[0x1E4F563F0];
LABEL_8:
      id v10 = *v11;
      goto LABEL_9;
    case 1:
      [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F56558]];
      double v11 = (id *)MEMORY[0x1E4F56428];
      goto LABEL_8;
    case 0:
      PXAssertGetLog();
  }
  id v10 = 0;
LABEL_9:
  v12 = [(PXMediaViewControllerEventTracker *)self viewName];
  [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F56560]];

  id v13 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v9];
  v14 = (void *)MEMORY[0x1E4F56658];
  int64_t v15 = [(PXMediaViewControllerEventTracker *)self mediaViewedSignpost];
  [v14 endSignpost:v15 forEventName:*MEMORY[0x1E4F56448] withPayload:v13];
  [(PXMediaViewControllerEventTracker *)self setMediaViewedSignpost:0];
  if (v10) {
    objc_msgSend(MEMORY[0x1E4F56658], "endSignpost:forEventName:withPayload:", -[PXMediaViewControllerEventTracker specificMediaViewedSignpost](self, "specificMediaViewedSignpost"), v10, v13);
  }
  [(PXMediaViewControllerEventTracker *)self setSpecificMediaViewedSignpost:0];
}

- (PXMediaViewControllerEventTracker)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMediaViewControllerEventTracker.m", 46, @"%s is not available as initializer", "-[PXMediaViewControllerEventTracker init]");

  abort();
}

@end
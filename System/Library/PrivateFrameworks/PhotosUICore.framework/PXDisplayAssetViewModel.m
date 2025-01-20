@interface PXDisplayAssetViewModel
- (BOOL)allowsTextSelection;
- (BOOL)isDisplayingFullQualityContent;
- (BOOL)wantsLivePhotoPlayback;
- (NSArray)audioIdentifiersToHighlight;
- (NSArray)humanActionIdentifiersToHighlight;
- (NSArray)personLocalIdentifiersToHighlight;
- (NSArray)sceneIdentifiersToHighlight;
- (NSArray)stringsToHighlight;
- (NSArray)timeRangesToHighlight;
- (NSError)loadingError;
- (PXDisplayAsset)asset;
- (PXDisplayAssetViewModel)init;
- (PXDisplayAssetViewModelHighlightTimeRangeController)timeRangeController;
- (PXUpdater)updater;
- (UIEdgeInsets)contentSafeAreaInsets;
- (UIImage)currentImage;
- (double)assetAspectRatio;
- (float)loadingProgress;
- (int64_t)contentMode;
- (int64_t)playbackStyle;
- (void)_invalidateAssetAspectRatio;
- (void)_setNeedsUpdate;
- (void)_updateAssetAspectRatio;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setAllowsTextSelection:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAssetAspectRatio:(double)a3;
- (void)setAudioIdentifiersToHighlight:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setCurrentImage:(id)a3;
- (void)setHumanActionIdentifiersToHighlight:(id)a3;
- (void)setIsDisplayingFullQualityContent:(BOOL)a3;
- (void)setLoadingError:(id)a3;
- (void)setLoadingProgress:(float)a3;
- (void)setPersonLocalIdentifiersToHighlight:(id)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setSceneIdentifiersToHighlight:(id)a3;
- (void)setStringsToHighlight:(id)a3;
- (void)setTimeRangesToHighlight:(id)a3;
- (void)setWantsLivePhotoPlayback:(BOOL)a3;
@end

@implementation PXDisplayAssetViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeController, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_timeRangesToHighlight, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_audioIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersToHighlight, 0);
  objc_storeStrong((id *)&self->_stringsToHighlight, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PXDisplayAssetViewModelHighlightTimeRangeController)timeRangeController
{
  return self->_timeRangeController;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (float)loadingProgress
{
  return self->_loadingProgress;
}

- (NSArray)timeRangesToHighlight
{
  return self->_timeRangesToHighlight;
}

- (NSArray)personLocalIdentifiersToHighlight
{
  return self->_personLocalIdentifiersToHighlight;
}

- (NSArray)humanActionIdentifiersToHighlight
{
  return self->_humanActionIdentifiersToHighlight;
}

- (NSArray)audioIdentifiersToHighlight
{
  return self->_audioIdentifiersToHighlight;
}

- (NSArray)sceneIdentifiersToHighlight
{
  return self->_sceneIdentifiersToHighlight;
}

- (NSArray)stringsToHighlight
{
  return self->_stringsToHighlight;
}

- (BOOL)allowsTextSelection
{
  return self->_allowsTextSelection;
}

- (BOOL)isDisplayingFullQualityContent
{
  return self->_isDisplayingFullQualityContent;
}

- (UIEdgeInsets)contentSafeAreaInsets
{
  double top = self->_contentSafeAreaInsets.top;
  double left = self->_contentSafeAreaInsets.left;
  double bottom = self->_contentSafeAreaInsets.bottom;
  double right = self->_contentSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (BOOL)wantsLivePhotoPlayback
{
  return self->_wantsLivePhotoPlayback;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (double)assetAspectRatio
{
  return self->_assetAspectRatio;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)_updateAssetAspectRatio
{
  id v2 = [(PXDisplayAssetViewModel *)self asset];
  [v2 pixelWidth];
  [v2 pixelHeight];
  PXSizeGetAspectRatioWithDefault();
}

- (void)_invalidateAssetAspectRatio
{
  id v2 = [(PXDisplayAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetAspectRatio];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetViewModel;
  [(PXDisplayAssetViewModel *)&v4 didPerformChanges];
  v3 = [(PXDisplayAssetViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetViewModel.m", 181, @"%s must be called on the main thread", "-[PXDisplayAssetViewModel performChanges:]");
  }
  v7.receiver = self;
  v7.super_class = (Class)PXDisplayAssetViewModel;
  [(PXDisplayAssetViewModel *)&v7 performChanges:v5];
}

- (void)setLoadingError:(id)a3
{
  v8 = (NSError *)a3;
  objc_super v4 = self->_loadingError;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSError *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSError *)[(NSError *)v8 copy];
      loadingError = self->_loadingError;
      self->_loadingError = v6;

      [(PXDisplayAssetViewModel *)self signalChange:1024];
    }
  }
}

- (void)setTimeRangesToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_timeRangesToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      timeRangesToHighlight = self->_timeRangesToHighlight;
      self->_timeRangesToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:0x10000];
    }
  }
}

- (void)setLoadingProgress:(float)a3
{
  if (self->_loadingProgress != a3)
  {
    self->_loadingProgress = a3;
    [(PXDisplayAssetViewModel *)self signalChange:512];
  }
}

- (void)setStringsToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_stringsToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      stringsToHighlight = self->_stringsToHighlight;
      self->_stringsToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:256];
    }
  }
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  if (self->_allowsTextSelection != a3)
  {
    self->_allowsTextSelection = a3;
    [(PXDisplayAssetViewModel *)self signalChange:128];
  }
}

- (void)setIsDisplayingFullQualityContent:(BOOL)a3
{
  if (self->_isDisplayingFullQualityContent != a3)
  {
    self->_isDisplayingFullQualityContent = a3;
    [(PXDisplayAssetViewModel *)self signalChange:64];
  }
}

- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)setCurrentImage:(id)a3
{
  objc_super v7 = (UIImage *)a3;
  char v5 = self->_currentImage;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIImage *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentImage, a3);
      [(PXDisplayAssetViewModel *)self signalChange:32];
    }
  }
}

- (void)setWantsLivePhotoPlayback:(BOOL)a3
{
  self->_wantsLivePhotoPlayback = a3;
  [(PXDisplayAssetViewModel *)self signalChange:16];
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    [(PXDisplayAssetViewModel *)self signalChange:8];
  }
}

- (void)setAssetAspectRatio:(double)a3
{
  if (self->_assetAspectRatio != a3)
  {
    self->_assetAspectRatio = a3;
    [(PXDisplayAssetViewModel *)self signalChange:4];
  }
}

- (void)setPlaybackStyle:(int64_t)a3
{
  if (self->_playbackStyle != a3)
  {
    self->_playbackStyle = a3;
    [(PXDisplayAssetViewModel *)self signalChange:2];
  }
}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_personLocalIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      personLocalIdentifiersToHighlight = self->_personLocalIdentifiersToHighlight;
      self->_personLocalIdentifiersToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:0x8000];
    }
  }
}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_humanActionIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      humanActionIdentifiersToHighlight = self->_humanActionIdentifiersToHighlight;
      self->_humanActionIdentifiersToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:0x4000];
    }
  }
}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_audioIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      audioIdentifiersToHighlight = self->_audioIdentifiersToHighlight;
      self->_audioIdentifiersToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:0x2000];
    }
  }
}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  v8 = (NSArray *)a3;
  objc_super v4 = self->_sceneIdentifiersToHighlight;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      sceneIdentifiersToHighlight = self->_sceneIdentifiersToHighlight;
      self->_sceneIdentifiersToHighlight = v6;

      [(PXDisplayAssetViewModel *)self signalChange:4096];
    }
  }
}

- (void)setAsset:(id)a3
{
  char v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXDisplayAssetViewModel *)self signalChange:1];
    [(PXDisplayAssetViewModel *)self setPlaybackStyle:[(PXDisplayAsset *)self->_asset playbackStyle]];
    [(PXDisplayAssetViewModel *)self _invalidateAssetAspectRatio];
    [(PXDisplayAssetViewModel *)self setCurrentImage:0];
    -[PXDisplayAssetViewModel setContentSafeAreaInsets:](self, "setContentSafeAreaInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    [(PXDisplayAssetViewModel *)self setIsDisplayingFullQualityContent:0];
    [(PXDisplayAssetViewModel *)self setLoadingProgress:0.0];
    [(PXDisplayAssetViewModel *)self setLoadingError:0];
    char v5 = v6;
  }
}

- (PXDisplayAssetViewModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetViewModel;
  id v2 = [(PXDisplayAssetViewModel *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v2 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v3;

    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateAssetAspectRatio];
    timeRangesToHighlight = v2->_timeRangesToHighlight;
    v2->_timeRangesToHighlight = (NSArray *)MEMORY[0x1E4F1CBF0];

    char v6 = [[PXDisplayAssetViewModelHighlightTimeRangeController alloc] initWithViewModel:v2];
    timeRangeController = v2->_timeRangeController;
    v2->_timeRangeController = v6;
  }
  return v2;
}

@end
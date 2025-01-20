@interface PXSubjectTrackingView
+ (CGPoint)denormalizePoint:(CGPoint)a3 masterSize:(CGSize)a4 flipYCoordinate:(BOOL)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentCinematographyTime;
- (BOOL)_focusOnFixedLocationAtDetection:(id)a3 strong:(BOOL)a4;
- (BOOL)_focusOnFixedLocationAtPoint:(CGPoint)a3 strong:(BOOL)a4;
- (BOOL)_focusOnGroup:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)_focusOnTrackWithID:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)_isValidTrackingRect:(CGRect)a3;
- (BOOL)badgeVisibleAndWillAutoClose;
- (BOOL)focusOnDetection:(id)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)isAnimating;
- (BOOL)needsUpdateFrame;
- (BOOL)needsUpdateFrameTime;
- (BOOL)needsUpdateViewCache;
- (BOOL)viewCanBeEnabled;
- (BOOL)viewEnabled;
- (CGPoint)normalizedPointForViewPoint:(CGPoint)a3;
- (CGPoint)viewPointForNormalizedPoint:(CGPoint)a3;
- (CGRect)_reframeWithinVideo:(CGRect)a3 isFixedFocus:(BOOL)a4 fixedFocusCenter:(CGPoint)a5;
- (CGRect)frameForDetection:(id)a3;
- (CGRect)viewFrameForNormalizedRect:(CGRect)a3;
- (NSDictionary)detectionViewCache;
- (NSNumber)primaryKey;
- (NSTimer)hideFocusStateBadgeTimer;
- (NUMediaView)mediaView;
- (PTCinematographyFrame)cinematographyFrame;
- (PXCinematicEditController)cineController;
- (PXSubjectTrackingLayoutDelegate)layoutDelegate;
- (PXSubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4;
- (PXSubjectTrackingViewDelegate)delegate;
- (UIView)focusStateBadge;
- (UIView)inProgressTrackingView;
- (double)_smoothenFromValue:(double)a3 toNewValue:(double)a4 forTime:(double)a5 tolerance:(double)a6;
- (double)lastLayoutTime;
- (id)_axDescriptionForCacheKey:(id)a3;
- (id)_hitDetectionAtPoint:(CGPoint)a3;
- (id)playbackTimeObserver;
- (int64_t)addFocusTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (int64_t)focusState;
- (int64_t)inProgressTrackID;
- (void)_disparitySampleFinishedWithResponse:(id)a3 time:(id *)a4 rect:(CGRect)a5 strong:(BOOL)a6;
- (void)_finishedProcessingTrackedObject:(id)a3;
- (void)_newTrackWasAddedAndFocusedAtTime:(id *)a3;
- (void)_objectTrackingStartedAtTime:(id *)a3;
- (void)_playbackTimeDidUpdate;
- (void)_setPrimaryDetection:(id)a3 focusState:(int64_t)a4 animated:(BOOL)a5;
- (void)_trackAndFocusObjectAtPoint:(CGPoint)a3 strong:(BOOL)a4;
- (void)_trackedObjectAtPoint:(CGPoint)a3 failedWithError:(id)a4;
- (void)_trackedObjectAtPoint:(CGPoint)a3 finishedWithResponse:(id)a4 trackStartTime:(id *)a5 strongTrack:(BOOL)a6;
- (void)_trackedObjectWasUpdatedAtTime:(id *)a3 trackedRect:(CGRect)a4 confidence:(float)a5 shouldStop:(BOOL *)a6;
- (void)_updateCinematographyFrameWithTime:(id *)a3;
- (void)_updateDetectionViewCache;
- (void)_updateFocusStateAnimated:(BOOL)a3;
- (void)decisionsDidChangeInScript:(id)a3 timeRange:(id *)a4;
- (void)enableUIForCinematographyScriptLoad:(BOOL)a3;
- (void)framesDidChangeInScript:(id)a3 timeRange:(id *)a4;
- (void)handleDoubleSelectOnPoint:(CGPoint)a3;
- (void)handleInteractionBegan;
- (void)handleLongSelectOnPoint:(CGPoint)a3;
- (void)handleSingleSelectOnPoint:(CGPoint)a3;
- (void)layoutSubviews;
- (void)renderDidChange:(BOOL)a3;
- (void)scriptDidUpdate;
- (void)setBadgeVisibleAndWillAutoClose:(BOOL)a3;
- (void)setCinematographyFrame:(id)a3;
- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDetectionViewCache:(id)a3;
- (void)setFocusState:(int64_t)a3 detection:(id)a4;
- (void)setFocusStateBadge:(id)a3;
- (void)setFocusStateBadgeVisible:(BOOL)a3 autoHide:(BOOL)a4;
- (void)setHideFocusStateBadgeTimer:(id)a3;
- (void)setInProgressTrackID:(int64_t)a3;
- (void)setInProgressTrackingView:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setLastLayoutTime:(double)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setNeedsUpdateFrame;
- (void)setNeedsUpdateFrame:(BOOL)a3;
- (void)setNeedsUpdateFrameTime;
- (void)setNeedsUpdateFrameTime:(BOOL)a3;
- (void)setNeedsUpdateViewCache:(BOOL)a3;
- (void)setPlaybackTimeObserver:(id)a3;
- (void)setPrimaryKey:(id)a3;
- (void)setViewCanBeEnabled:(BOOL)a3;
- (void)setViewEnabled:(BOOL)a3;
- (void)showTrackingInformationalString:(id)a3;
@end

@implementation PXSubjectTrackingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cineController, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_hideFocusStateBadgeTimer, 0);
  objc_storeStrong((id *)&self->_focusStateBadge, 0);
  objc_storeStrong((id *)&self->_primaryKey, 0);
  objc_storeStrong((id *)&self->_cinematographyFrame, 0);
  objc_storeStrong((id *)&self->_inProgressTrackingView, 0);
  objc_storeStrong((id *)&self->_detectionViewCache, 0);
  objc_storeStrong(&self->_playbackTimeObserver, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PXCinematicEditController)cineController
{
  return self->_cineController;
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setViewCanBeEnabled:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
}

- (BOOL)viewCanBeEnabled
{
  return self->_viewCanBeEnabled;
}

- (void)setBadgeVisibleAndWillAutoClose:(BOOL)a3
{
  self->_badgeVisibleAndWillAutoClose = a3;
}

- (BOOL)badgeVisibleAndWillAutoClose
{
  return self->_badgeVisibleAndWillAutoClose;
}

- (void)setLastLayoutTime:(double)a3
{
  self->_lastLayoutTime = a3;
}

- (double)lastLayoutTime
{
  return self->_lastLayoutTime;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (int64_t)focusState
{
  return self->_focusState;
}

- (void)setHideFocusStateBadgeTimer:(id)a3
{
}

- (NSTimer)hideFocusStateBadgeTimer
{
  return self->_hideFocusStateBadgeTimer;
}

- (void)setFocusStateBadge:(id)a3
{
}

- (UIView)focusStateBadge
{
  return self->_focusStateBadge;
}

- (void)setNeedsUpdateViewCache:(BOOL)a3
{
  self->_needsUpdateViewCache = a3;
}

- (BOOL)needsUpdateViewCache
{
  return self->_needsUpdateViewCache;
}

- (void)setNeedsUpdateFrameTime:(BOOL)a3
{
  self->_needsUpdateFrameTime = a3;
}

- (BOOL)needsUpdateFrameTime
{
  return self->_needsUpdateFrameTime;
}

- (void)setNeedsUpdateFrame:(BOOL)a3
{
  self->_needsUpdateFrame = a3;
}

- (BOOL)needsUpdateFrame
{
  return self->_needsUpdateFrame;
}

- (void)setPrimaryKey:(id)a3
{
}

- (NSNumber)primaryKey
{
  return self->_primaryKey;
}

- (PTCinematographyFrame)cinematographyFrame
{
  return self->_cinematographyFrame;
}

- (void)setInProgressTrackID:(int64_t)a3
{
  self->_inProgressTrackID = a3;
}

- (int64_t)inProgressTrackID
{
  return self->_inProgressTrackID;
}

- (void)setInProgressTrackingView:(id)a3
{
}

- (UIView)inProgressTrackingView
{
  return self->_inProgressTrackingView;
}

- (void)setDetectionViewCache:(id)a3
{
}

- (void)setPlaybackTimeObserver:(id)a3
{
}

- (id)playbackTimeObserver
{
  return self->_playbackTimeObserver;
}

- (BOOL)viewEnabled
{
  return self->_viewEnabled;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (PXSubjectTrackingLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (PXSubjectTrackingLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXSubjectTrackingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSubjectTrackingViewDelegate *)WeakRetained;
}

- (id)_axDescriptionForCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [(PXSubjectTrackingView *)self cinematographyFrame];
  v6 = v5;
  if (v5
    && ([v5 allDetections],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    v9 = objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v4, "integerValue"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E4F921E8], "accessibilityLabelForDetectionType:", objc_msgSend(v9, "detectionType"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1F00B0030;
    }
  }
  else
  {
    v11 = &stru_1F00B0030;
  }

  return v11;
}

- (void)showTrackingInformationalString:(id)a3
{
  id v4 = a3;
  [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:1 autoHide:1];
  v5 = [(PXSubjectTrackingView *)self delegate];
  v6 = [(PXSubjectTrackingView *)self focusStateBadge];
  [v5 setMessage:v4 forFocusStateBadge:v6];

  [(PXSubjectTrackingView *)self setNeedsLayout];
}

- (int64_t)addFocusTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(PXSubjectTrackingView *)self cineController];
  v10 = [v9 cinematographyScript];
  int v11 = [v10 addTrack:v8];

  if (v11)
  {
    v12 = [(PXSubjectTrackingView *)self cineController];
    v13 = [v12 cinematographyScript];
    uint64_t v14 = [v8 trackIdentifier];
    long long v18 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    int v15 = [v13 focusOnTrackIdentifier:v14 atTime:&v18 strong:v5];

    if (v15) {
      int64_t v16 = 0;
    }
    else {
      int64_t v16 = 2;
    }
  }
  else
  {
    int64_t v16 = 1;
  }

  return v16;
}

- (void)_trackedObjectAtPoint:(CGPoint)a3 finishedWithResponse:(id)a4 trackStartTime:(id *)a5 strongTrack:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  id v20 = 0;
  int v11 = [a4 result:&v20];
  id v12 = v20;
  if (v11)
  {
    uint64_t v13 = [v11 completedTrack];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      long long v18 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      int64_t v15 = [(PXSubjectTrackingView *)self addFocusTrack:v13 atTime:&v18 strong:v6];
      if (v15 == 2)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Tap-to-track error: cinematographyScript failed to focus on new track: %@", v14);
      }
      else
      {
        if (v15 != 1)
        {
          [(PXSubjectTrackingView *)self _finishedProcessingTrackedObject:v14];
          long long v18 = *(_OWORD *)&a5->var0;
          int64_t var3 = a5->var3;
          [(PXSubjectTrackingView *)self _newTrackWasAddedAndFocusedAtTime:&v18];
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Tap-to-track error: cinematographyScript failed to add new track: %@", v14);
      v17 = };
      -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v17, x, y);
    }
    else
    {
      int64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Tap-to-track error: result did not contain completedTrack: %@", v11);
      -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v16, x, y);

      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithUnderlyingError:debugDescription:", v12, @"Tap-to-track error: tracking failed with error %@", v12);
    -[PXSubjectTrackingView _trackedObjectAtPoint:failedWithError:](self, "_trackedObjectAtPoint:failedWithError:", v14, x, y);
  }
LABEL_11:
}

- (void)_trackedObjectAtPoint:(CGPoint)a3 failedWithError:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Tap-to-track failed with error: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(PXSubjectTrackingView *)self delegate];
  [v9 objectTrackingFinishedWithSuccess:0];

  v10 = [(PXSubjectTrackingView *)self inProgressTrackingView];
  [v10 removeFromSuperview];

  [(PXSubjectTrackingView *)self setInProgressTrackingView:0];
  [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:0 autoHide:0];
  -[PXSubjectTrackingView _focusOnFixedLocationAtPoint:strong:](self, "_focusOnFixedLocationAtPoint:strong:", 0, x, y);
}

- (void)_finishedProcessingTrackedObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Tap-to-track finished with success", v12, 2u);
  }

  BOOL v6 = [(PXSubjectTrackingView *)self delegate];
  [v6 objectTrackingFinishedWithSuccess:1];

  uint64_t v7 = [v4 trackIdentifier];
  id v8 = [(PXSubjectTrackingView *)self detectionViewCache];
  v9 = [NSNumber numberWithInteger:v7];
  v10 = [v8 objectForKey:v9];

  if (v10)
  {
    int v11 = [(PXSubjectTrackingView *)self inProgressTrackingView];
    [v11 removeFromSuperview];

    [(PXSubjectTrackingView *)self setInProgressTrackingView:0];
  }
  else
  {
    [(PXSubjectTrackingView *)self setInProgressTrackID:v7];
    [(PXSubjectTrackingView *)self setNeedsUpdateViewCache:1];
  }
  [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:0 autoHide:0];
}

- (void)_trackedObjectWasUpdatedAtTime:(id *)a3 trackedRect:(CGRect)a4 confidence:(float)a5 shouldStop:(BOOL *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v30 = *a3;
    uint64_t v14 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v30);
    LODWORD(v30.var0) = 138412290;
    *(int64_t *)((char *)&v30.var0 + 4) = (int64_t)v14;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Tap-to-track progress: t=%@", (uint8_t *)&v30, 0xCu);
  }
  int64_t v15 = [(PXSubjectTrackingView *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v30 = *a3;
  [v15 trackedObjectWasUpdatedAtTime:&v30 shouldStop:a6];

  int64_t v16 = [(PXSubjectTrackingView *)self inProgressTrackingView];

  if (!v16)
  {
    -[PXSubjectTrackingView viewFrameForNormalizedRect:](self, "viewFrameForNormalizedRect:", x, y, width, height);
    -[PXSubjectTrackingView _reframeWithinVideo:isFixedFocus:fixedFocusCenter:](self, "_reframeWithinVideo:isFixedFocus:fixedFocusCenter:", 0);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [(PXSubjectTrackingView *)self delegate];
    v26 = objc_msgSend(v25, "newTrackingViewWithFrame:initialState:", 5, v18, v20, v22, v24);
    [(PXSubjectTrackingView *)self setInProgressTrackingView:v26];

    v27 = [(PXSubjectTrackingView *)self inProgressTrackingView];
    [(PXSubjectTrackingView *)self insertSubview:v27 atIndex:0];

    [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:1 autoHide:0];
    v28 = [(PXSubjectTrackingView *)self delegate];
    v29 = [(PXSubjectTrackingView *)self focusStateBadge];
    [v28 setTrackingInProgressTextForFocusStateBadge:v29];
  }
}

- (void)_objectTrackingStartedAtTime:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
    BOOL v6 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v8);
    LODWORD(v8.var0) = 138412290;
    *(int64_t *)((char *)&v8.var0 + 4) = (int64_t)v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Tap-to-track started: t=%@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(PXSubjectTrackingView *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [v7 objectTrackingStartedAtTime:&v8];
}

- (void)_trackAndFocusObjectAtPoint:(CGPoint)a3 strong:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(PXSubjectTrackingView *)self delegate];
  uint64_t v9 = [v8 composition];

  long long v28 = 0uLL;
  uint64_t v29 = 0;
  [(PXSubjectTrackingView *)self _currentCinematographyTime];
  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", x, y);
  double v11 = v10;
  double v13 = v12;
  objc_initWeak(&location, self);
  long long v25 = v28;
  uint64_t v26 = v29;
  [(PXSubjectTrackingView *)self _objectTrackingStartedAtTime:&v25];
  id v14 = objc_alloc(MEMORY[0x1E4F8A3C8]);
  long long v25 = v28;
  uint64_t v26 = v29;
  int64_t v15 = objc_msgSend(v14, "initWithComposition:startTime:pointToTrack:", v9, &v25, v11, v13);
  uint64_t v16 = MEMORY[0x1E4F14428];
  id v17 = MEMORY[0x1E4F14428];
  [v15 setResponseQueue:v16];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke;
  v23[3] = &unk_1E5DC47D0;
  objc_copyWeak(&v24, &location);
  [v15 setProgressHandler:v23];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke_2;
  v18[3] = &unk_1E5DC47F8;
  objc_copyWeak(v19, &location);
  v19[1] = *(id *)&x;
  v19[2] = *(id *)&y;
  long long v20 = v28;
  uint64_t v21 = v29;
  BOOL v22 = a4;
  [v15 submit:v18];
  objc_destroyWeak(v19);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke(uint64_t a1, long long *a2, uint64_t a3, double a4, double a5, double a6, double a7, float a8)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v17 = *a2;
  uint64_t v18 = *((void *)a2 + 2);
  *(float *)&double v16 = a8;
  objc_msgSend(WeakRetained, "_trackedObjectWasUpdatedAtTime:trackedRect:confidence:shouldStop:", &v17, a3, a4, a5, a6, a7, v16);
}

void __60__PXSubjectTrackingView__trackAndFocusObjectAtPoint_strong___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  double v7 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  objc_msgSend(WeakRetained, "_trackedObjectAtPoint:finishedWithResponse:trackStartTime:strongTrack:", v4, &v9, v6, v7, v8);
}

- (void)_disparitySampleFinishedWithResponse:(id)a3 time:(id *)a4 rect:(CGRect)a5 strong:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  double v12 = objc_msgSend(a3, "result:", &v25, a4);
  id v13 = v25;
  if (v12)
  {
    [v12 sampledDisparityValue];
    int v15 = v14;
    id v16 = objc_alloc(MEMORY[0x1E4F921E8]);
    *(_OWORD *)buf = *MEMORY[0x1E4F1F9F0];
    uint64_t v27 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
    LODWORD(v17) = v15;
    uint64_t v18 = objc_msgSend(v16, "initWithTime:rect:focusDistance:", buf, x, y, width, height, v17);
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F921F0]) initWithDetection:v18];
    memset(buf, 0, sizeof(buf));
    uint64_t v27 = 0;
    [(PXSubjectTrackingView *)self _currentCinematographyTime];
    long long v23 = *(_OWORD *)buf;
    uint64_t v24 = v27;
    int64_t v20 = [(PXSubjectTrackingView *)self addFocusTrack:v19 atTime:&v23 strong:v6];
    if (v20 == 2)
    {
      uint64_t v21 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        BOOL v22 = "Tap-to-track error: couldn't focus on track";
        goto LABEL_10;
      }
    }
    else
    {
      if (v20 != 1)
      {
        long long v23 = *(_OWORD *)buf;
        uint64_t v24 = v27;
        [(PXSubjectTrackingView *)self _newTrackWasAddedAndFocusedAtTime:&v23];
        goto LABEL_13;
      }
      uint64_t v21 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        BOOL v22 = "Fixed-focus error: couldn't add track";
LABEL_10:
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 2u);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v18 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v13;
    _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "Fixed-focus error: disparity sampling failed with error %@", buf, 0xCu);
  }
LABEL_14:
}

- (BOOL)_focusOnFixedLocationAtPoint:(CGPoint)a3 strong:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [(PXSubjectTrackingView *)self delegate];
  long long v9 = [v8 composition];

  long long v30 = 0uLL;
  uint64_t v31 = 0;
  [(PXSubjectTrackingView *)self _currentCinematographyTime];
  -[PXSubjectTrackingView normalizedPointForViewPoint:](self, "normalizedPointForViewPoint:", x, y);
  double v11 = v10;
  double v13 = v12;
  objc_initWeak(&location, self);
  id v14 = objc_alloc(MEMORY[0x1E4F8A2B0]);
  double v15 = v11 + -0.05;
  double v16 = v13 + -0.05;
  long long v27 = v30;
  uint64_t v28 = v31;
  double v17 = objc_msgSend(v14, "initWithComposition:time:sampleRect:", v9, &v27, v15, v16, 0.1, 0.1);
  uint64_t v18 = MEMORY[0x1E4F14428];
  id v19 = MEMORY[0x1E4F14428];
  [v17 setResponseQueue:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__PXSubjectTrackingView__focusOnFixedLocationAtPoint_strong___block_invoke;
  v21[3] = &unk_1E5DC47A8;
  objc_copyWeak(v22, &location);
  uint64_t v25 = v31;
  v22[1] = *(id *)&v15;
  v22[2] = *(id *)&v16;
  int64x2_t v23 = vdupq_n_s64(0x3FB999999999999AuLL);
  long long v24 = v30;
  BOOL v26 = a4;
  [v17 submit:v21];
  objc_destroyWeak(v22);

  objc_destroyWeak(&location);
  return 1;
}

void __61__PXSubjectTrackingView__focusOnFixedLocationAtPoint_strong___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 88);
  objc_msgSend(WeakRetained, "_disparitySampleFinishedWithResponse:time:rect:strong:", v4, &v7, v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_focusOnFixedLocationAtDetection:(id)a3 strong:(BOOL)a4
{
  BOOL v4 = a4;
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  id v6 = a3;
  [(PXSubjectTrackingView *)self _currentCinematographyTime];
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F921F0]) initWithDetection:v6];

  long long v13 = v15;
  uint64_t v14 = v16;
  int64_t v8 = [(PXSubjectTrackingView *)self addFocusTrack:v7 atTime:&v13 strong:v4];
  if (v8 == 2)
  {
    long long v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      double v10 = "Tap-to-track error: couldn't focus on track";
      goto LABEL_7;
    }
  }
  else
  {
    if (v8 != 1)
    {
      long long v13 = v15;
      uint64_t v14 = v16;
      [(PXSubjectTrackingView *)self _newTrackWasAddedAndFocusedAtTime:&v13];
      BOOL v11 = 1;
      goto LABEL_10;
    }
    long long v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      double v10 = "Fixed-focus error: couldn't add track";
LABEL_7:
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 2u);
    }
  }

  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)_newTrackWasAddedAndFocusedAtTime:(id *)a3
{
  [(PXSubjectTrackingView *)self setNeedsUpdateViewCache:1];
  [(PXSubjectTrackingView *)self _updateFocusStateAnimated:1];
  BOOL v5 = [(PXSubjectTrackingView *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v5 trackingWasEditedAtTime:&v6];
}

- (BOOL)focusOnDetection:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 groupIdentifier];
  if (PTGroupIDIsValid())
  {
    uint64_t v9 = [v8 groupIdentifier];

    long long v12 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    return [(PXSubjectTrackingView *)self _focusOnGroup:v9 atTime:&v12 strong:v5];
  }
  else
  {
    uint64_t v11 = [v8 trackIdentifier];

    long long v12 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    return [(PXSubjectTrackingView *)self _focusOnTrackWithID:v11 atTime:&v12 strong:v5];
  }
}

- (BOOL)_focusOnGroup:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(PXSubjectTrackingView *)self cineController];
  double v10 = [v9 cinematographyScript];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  int v11 = [v10 focusOnGroupIdentifier:a3 atTime:&v17 strong:v5];

  long long v12 = PLPhotoEditGetLog();
  long long v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = @"weak";
      if (v5) {
        uint64_t v14 = @"strong";
      }
      LODWORD(v17.var0) = 138412546;
      *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v14;
      LOWORD(v17.var2) = 2048;
      *(void *)((char *)&v17.var2 + 2) = a3;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Engine successfully placed %@ focus on group with ID %ld", (uint8_t *)&v17, 0x16u);
    }

    long long v13 = [(PXSubjectTrackingView *)self delegate];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
    [v13 trackingWasEditedAtTime:&v17];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v15 = @"weak";
    if (v5) {
      long long v15 = @"strong";
    }
    LODWORD(v17.var0) = 138412546;
    *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v15;
    LOWORD(v17.var2) = 2048;
    *(void *)((char *)&v17.var2 + 2) = a3;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Engine failed to place %@ focus on group with ID %ld", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

- (BOOL)_focusOnTrackWithID:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(PXSubjectTrackingView *)self cineController];
  double v10 = [v9 cinematographyScript];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  int v11 = [v10 focusOnTrackIdentifier:a3 atTime:&v17 strong:v5];

  long long v12 = PLPhotoEditGetLog();
  long long v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = @"weak";
      if (v5) {
        uint64_t v14 = @"strong";
      }
      LODWORD(v17.var0) = 138412546;
      *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v14;
      LOWORD(v17.var2) = 2048;
      *(void *)((char *)&v17.var2 + 2) = a3;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Engine successfully placed %@ focus on track with ID %ld", (uint8_t *)&v17, 0x16u);
    }

    long long v13 = [(PXSubjectTrackingView *)self delegate];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
    [v13 trackingWasEditedAtTime:&v17];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v15 = @"weak";
    if (v5) {
      long long v15 = @"strong";
    }
    LODWORD(v17.var0) = 138412546;
    *(int64_t *)((char *)&v17.var0 + 4) = (int64_t)v15;
    LOWORD(v17.var2) = 2048;
    *(void *)((char *)&v17.var2 + 2) = a3;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Engine failed to place %@ focus on track with ID %ld", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [a3 trackIdentifier];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  return [(PXSubjectTrackingView *)self _focusOnTrackWithID:v8 atTime:&v10 strong:v5];
}

- (void)handleInteractionBegan
{
  id v2 = [(PXSubjectTrackingView *)self delegate];
  [v2 interactionBegan];
}

- (void)handleLongSelectOnPoint:(CGPoint)a3
{
}

- (void)handleDoubleSelectOnPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = -[PXSubjectTrackingView _hitDetectionAtPoint:](self, "_hitDetectionAtPoint:");
  long long v7 = v6;
  if (v6)
  {
    [v6 time];
    [(PXSubjectTrackingView *)self focusOnDetection:v7 atTime:v10 strong:1];
  }
  else
  {
    uint64_t v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14.CGFloat x = x;
      v14.CGFloat y = y;
      uint64_t v9 = NSStringFromCGPoint(v14);
      *(_DWORD *)buf = 138412290;
      long long v12 = v9;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "handleDoubleSelectOnPoint: No detection at %@", buf, 0xCu);
    }
  }
}

- (void)handleSingleSelectOnPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(PXSubjectTrackingView *)self cineController];
  long long v7 = [v6 cinematographyScript];

  uint64_t v8 = -[PXSubjectTrackingView _hitDetectionAtPoint:](self, "_hitDetectionAtPoint:", x, y);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 time];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v7 primaryDecisionAtTime:v28];
    [v10 groupIdentifier];
    int v11 = PTGroupIDIsValid();
    [v9 groupIdentifier];
    int v12 = PTGroupIDIsValid();
    BOOL v13 = 0;
    if (v11 && v12)
    {
      uint64_t v14 = [v10 groupIdentifier];
      BOOL v13 = v14 == [v9 groupIdentifier];
    }
    uint64_t v15 = [v10 trackIdentifier];
    uint64_t v16 = [v9 trackIdentifier];
    if (v13 || v15 == v16)
    {
      int v17 = [v10 isStrongDecision];
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      if (v10) {
        [v10 time];
      }
      long long v24 = v26;
      uint64_t v25 = v27;
      uint64_t v18 = [v7 frameNearestTime:&v24];
      id v19 = [v18 focusDetection];
      uint64_t v20 = [v19 trackIdentifier];
      int v21 = v20 == [v9 trackIdentifier] || v13;
      if (v21 == 1)
      {
        [(PXSubjectTrackingView *)self _currentCinematographyTime];
        [(PXSubjectTrackingView *)self focusOnDetection:v9 atTime:v23 strong:v17 ^ 1u];
      }
    }
    else
    {
      [(PXSubjectTrackingView *)self _currentCinematographyTime];
      [(PXSubjectTrackingView *)self focusOnDetection:v9 atTime:&v22 strong:0];
    }
  }
  else
  {
    -[PXSubjectTrackingView _trackAndFocusObjectAtPoint:strong:](self, "_trackAndFocusObjectAtPoint:strong:", 0, x, y);
  }
}

- (id)_hitDetectionAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(PXSubjectTrackingView *)self cinematographyFrame];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v7 = objc_msgSend(v6, "allDetections", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = 0;
    uint64_t v11 = *(void *)v24;
    double v12 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 detectionType] != 100)
        {
          [(PXSubjectTrackingView *)self frameForDetection:v14];
          CGFloat v15 = v31.origin.x;
          CGFloat v16 = v31.origin.y;
          CGFloat width = v31.size.width;
          CGFloat height = v31.size.height;
          v30.CGFloat x = x;
          v30.CGFloat y = y;
          if (CGRectContainsPoint(v31, v30))
          {
            v32.origin.CGFloat x = v15;
            v32.origin.CGFloat y = v16;
            v32.size.CGFloat width = width;
            v32.size.CGFloat height = height;
            double v19 = CGRectGetWidth(v32);
            v33.origin.CGFloat x = v15;
            v33.origin.CGFloat y = v16;
            v33.size.CGFloat width = width;
            v33.size.CGFloat height = height;
            double v20 = v19 * CGRectGetHeight(v33);
            if (v20 < v12)
            {
              id v21 = v14;

              double v12 = v20;
              $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v21;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = 0;
  }

  return v10;
}

- (CGPoint)normalizedPointForViewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(PXSubjectTrackingView *)self layoutDelegate];

  if (v6)
  {
    long long v7 = [(PXSubjectTrackingView *)self layoutDelegate];
    objc_msgSend(v7, "normalizedPoint:fromView:", self, x, y);
  }
  else
  {
    long long v7 = [(PXSubjectTrackingView *)self mediaView];
    objc_msgSend(v7, "convertPoint:toNormalizedYDownSourceSpaceFromView:", v7, x, y);
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGRect)_reframeWithinVideo:(CGRect)a3 isFixedFocus:(BOOL)a4 fixedFocusCenter:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  BOOL v7 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (CGRectIsEmpty(a3)) {
    goto LABEL_14;
  }
  double v13 = [(PXSubjectTrackingView *)self layoutDelegate];

  double v52 = x;
  double v53 = y;
  if (v13)
  {
    uint64_t v14 = [(PXSubjectTrackingView *)self layoutDelegate];
    [v14 videoFrame];
    CGFloat v16 = v15;
    CGFloat v55 = v18;
    CGFloat v56 = v17;
    CGFloat rect = v19;
  }
  else
  {
    double v20 = [(PXSubjectTrackingView *)self mediaView];
    [v20 imageFrame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    uint64_t v14 = [(PXSubjectTrackingView *)self mediaView];
    uint64_t v29 = [v14 superview];
    -[PXSubjectTrackingView convertRect:fromView:](self, "convertRect:fromView:", v29, v22, v24, v26, v28);
    CGFloat v16 = v30;
    CGFloat v55 = v32;
    CGFloat v56 = v31;
    CGFloat rect = v33;
  }
  v57.origin.CGFloat x = v11;
  v57.origin.CGFloat y = v10;
  v57.size.double width = width;
  v57.size.double height = height;
  double MidX = CGRectGetMidX(v57);
  v58.origin.CGFloat x = v11;
  v58.origin.CGFloat y = v10;
  v58.size.double width = width;
  v58.size.double height = height;
  double MidY = CGRectGetMidY(v58);
  double v36 = v7 ? v53 : MidY;
  double v37 = v7 ? v52 : MidX;
  v59.origin.CGFloat x = v16;
  v59.size.double width = v55;
  v59.origin.CGFloat y = v56;
  v59.size.double height = rect;
  if (!CGRectContainsPoint(v59, *(CGPoint *)(&v36 - 1)))
  {
LABEL_14:
    double v11 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_15;
  }
  if (v7)
  {
    double v11 = v52 + -37.5;
    double v10 = v53 + -37.5;
    BOOL v38 = 1;
    double width = 75.0;
    int v39 = 1;
    double height = 75.0;
  }
  else
  {
    BOOL v38 = width < 50.0;
    if (width < 50.0)
    {
      v60.origin.CGFloat x = v11;
      v60.origin.CGFloat y = v10;
      v60.size.double width = width;
      v60.size.double height = height;
      double v11 = CGRectGetMidX(v60) + -25.0;
      double width = 50.0;
    }
    if (height >= 50.0)
    {
      int v39 = 0;
    }
    else
    {
      v61.origin.CGFloat x = v11;
      v61.origin.CGFloat y = v10;
      v61.size.double width = width;
      v61.size.double height = height;
      double v10 = CGRectGetMidY(v61) + -25.0;
      int v39 = 1;
      double height = 50.0;
    }
  }
  v62.origin.CGFloat x = v16;
  v62.origin.CGFloat y = v56;
  v62.size.double width = v55;
  v62.size.double height = rect;
  CGRect v63 = CGRectInset(v62, width * 0.05 + 3.0, height * 0.05 + 3.0);
  CGFloat v44 = v63.origin.x;
  CGFloat v45 = v63.origin.y;
  CGFloat v46 = v63.size.width;
  CGFloat v47 = v63.size.height;
  if (v38)
  {
    double MinX = CGRectGetMinX(v63);
    if (v11 < MinX) {
      double v11 = MinX;
    }
    v64.origin.CGFloat x = v44;
    v64.origin.CGFloat y = v45;
    v64.size.double width = v46;
    v64.size.double height = v47;
    double v49 = CGRectGetMaxX(v64) - width;
    if (v11 >= v49) {
      double v11 = v49;
    }
    if (!v39)
    {
LABEL_23:
      if (v7) {
        goto LABEL_15;
      }
      goto LABEL_35;
    }
  }
  else if (!v39)
  {
    goto LABEL_23;
  }
  v65.origin.CGFloat x = v44;
  v65.origin.CGFloat y = v45;
  v65.size.double width = v46;
  v65.size.double height = v47;
  double MinY = CGRectGetMinY(v65);
  if (v10 < MinY) {
    double v10 = MinY;
  }
  v66.origin.CGFloat x = v44;
  v66.origin.CGFloat y = v45;
  v66.size.double width = v46;
  v66.size.double height = v47;
  double v51 = CGRectGetMaxY(v66) - height;
  if (v10 >= v51) {
    double v10 = v51;
  }
  if (!v7)
  {
LABEL_35:
    v67.origin.CGFloat x = v44;
    v67.origin.CGFloat y = v45;
    v67.size.double width = v46;
    v67.size.double height = v47;
    v71.origin.CGFloat x = v11;
    v71.origin.CGFloat y = v10;
    v71.size.double width = width;
    v71.size.double height = height;
    if (!CGRectContainsRect(v67, v71))
    {
      v68.origin.CGFloat x = v44;
      v68.origin.CGFloat y = v45;
      v68.size.double width = v46;
      v68.size.double height = v47;
      v72.origin.CGFloat x = v11;
      v72.origin.CGFloat y = v10;
      v72.size.double width = width;
      v72.size.double height = height;
      CGRect v69 = CGRectIntersection(v68, v72);
      double v11 = v69.origin.x;
      double v10 = v69.origin.y;
      double width = v69.size.width;
      double height = v69.size.height;
    }
  }
LABEL_15:
  double v40 = v11;
  double v41 = v10;
  double v42 = width;
  double v43 = height;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (CGRect)frameForDetection:(id)a3
{
  id v4 = a3;
  [v4 rect];
  -[PXSubjectTrackingView viewFrameForNormalizedRect:](self, "viewFrameForNormalizedRect:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(PXSubjectTrackingView *)self cineController];
  uint64_t v14 = [v13 cinematographyScript];
  double v15 = objc_msgSend(v14, "trackForIdentifier:", objc_msgSend(v4, "trackIdentifier"));

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v17 = 0.0;
  double v18 = 0.0;
  if (isKindOfClass)
  {
    [v4 rect];
    double MidX = CGRectGetMidX(v34);
    [v4 rect];
    -[PXSubjectTrackingView viewPointForNormalizedPoint:](self, "viewPointForNormalizedPoint:", MidX, CGRectGetMidY(v35));
    double v17 = v20;
    double v18 = v21;
  }
  -[PXSubjectTrackingView _reframeWithinVideo:isFixedFocus:fixedFocusCenter:](self, "_reframeWithinVideo:isFixedFocus:fixedFocusCenter:", isKindOfClass & 1, v6, v8, v10, v12, v17, v18);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGPoint)viewPointForNormalizedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PXSubjectTrackingView *)self layoutDelegate];

  if (v6)
  {
    double v7 = [(PXSubjectTrackingView *)self layoutDelegate];
    objc_msgSend(v7, "viewPointForNormalizedPoint:", x, y);
  }
  else
  {
    [(NUMediaView *)self->_mediaView _masterSizeWithoutGeometry];
    +[PXSubjectTrackingView denormalizePoint:masterSize:flipYCoordinate:](PXSubjectTrackingView, "denormalizePoint:masterSize:flipYCoordinate:", 1, x, y, v10, v11);
    double v13 = v12;
    double v15 = v14;
    double v7 = [(PXSubjectTrackingView *)self mediaView];
    objc_msgSend(v7, "convertPoint:fromSpace:toView:", @"/masterSpace", self, v13, v15);
  }
  double v16 = v8;
  double v17 = v9;

  double v18 = v16;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGRect)viewFrameForNormalizedRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PXSubjectTrackingView *)self layoutDelegate];

  if (!v8) {
    PXRectFlippedVertically();
  }
  double v9 = [(PXSubjectTrackingView *)self layoutDelegate];
  objc_msgSend(v9, "viewRectForNormalizedRect:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentCinematographyTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  double v5 = [(PXSubjectTrackingView *)self cinematographyFrame];

  if (v5)
  {
    double v6 = [(PXSubjectTrackingView *)self cinematographyFrame];
    double v7 = v6;
    if (v6)
    {
      [v6 time];
    }
    else
    {
      long long v21 = 0uLL;
      int64_t v22 = 0;
    }
    *(_OWORD *)&retstr->var0 = v21;
    int64_t v11 = v22;
  }
  else
  {
    double v8 = [(PXSubjectTrackingView *)self mediaView];
    double v9 = [v8 player];
    double v10 = v9;
    if (v9)
    {
      [v9 currentTime];
    }
    else
    {
      long long v21 = 0uLL;
      int64_t v22 = 0;
    }
    *(_OWORD *)&retstr->var0 = v21;
    retstr->int64_t var3 = v22;

    long long v21 = 0uLL;
    int64_t v22 = 0;
    double v12 = [(PXSubjectTrackingView *)self mediaView];
    double v13 = [v12 player];
    double v14 = v13;
    if (v13)
    {
      [v13 currentSeekTime];
    }
    else
    {
      long long v21 = 0uLL;
      int64_t v22 = 0;
    }

    if (BYTE12(v21))
    {
      *(_OWORD *)&retstr->var0 = v21;
      retstr->int64_t var3 = v22;
    }
    double v15 = [(PXSubjectTrackingView *)self delegate];
    double v7 = v15;
    if (v15)
    {
      long long v17 = *(_OWORD *)&retstr->var0;
      int64_t var3 = retstr->var3;
      [v15 unadjustedTimeForPlayerTime:&v17];
    }
    else
    {
      long long v19 = 0uLL;
      int64_t v20 = 0;
    }
    *(_OWORD *)&retstr->var0 = v19;
    int64_t v11 = v20;
  }
  retstr->int64_t var3 = v11;

  return result;
}

- (void)setFocusStateBadgeVisible:(BOOL)a3 autoHide:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3 || ![(PXSubjectTrackingView *)self badgeVisibleAndWillAutoClose])
  {
    double v7 = [(PXSubjectTrackingView *)self mediaView];
    double v8 = [v7 player];
    [v8 playbackRate];
    double v10 = v9;

    if (v5 && v10 == 0.0)
    {
      int64_t v11 = [(PXSubjectTrackingView *)self focusStateBadge];

      if (!v11)
      {
        double v12 = [(PXSubjectTrackingView *)self delegate];
        double v13 = (void *)[v12 newFocusStatusBadge];
        [(PXSubjectTrackingView *)self setFocusStateBadge:v13];

        double v14 = [(PXSubjectTrackingView *)self focusStateBadge];
        [v14 setAlpha:0.0];

        double v15 = [(PXSubjectTrackingView *)self focusStateBadge];
        [(PXSubjectTrackingView *)self addSubview:v15];
      }
      double v16 = [(PXSubjectTrackingView *)self focusStateBadge];
      [(PXSubjectTrackingView *)self bringSubviewToFront:v16];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke;
      v30[3] = &unk_1E5DD36F8;
      v30[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v30 animations:0.3];
      long long v17 = [(PXSubjectTrackingView *)self hideFocusStateBadgeTimer];
      [v17 invalidate];

      if (v4)
      {
        [(PXSubjectTrackingView *)self setBadgeVisibleAndWillAutoClose:1];
        objc_initWeak(&location, self);
        double v18 = (void *)MEMORY[0x1E4F1CB00];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_2;
        v27[3] = &unk_1E5DC4780;
        v28[1] = (id)0x3FD3333333333333;
        objc_copyWeak(v28, &location);
        v27[4] = self;
        long long v19 = [v18 scheduledTimerWithTimeInterval:0 repeats:v27 block:1.3];
        [(PXSubjectTrackingView *)self setHideFocusStateBadgeTimer:v19];

        objc_destroyWeak(v28);
        objc_destroyWeak(&location);
      }
      else
      {
        [(PXSubjectTrackingView *)self setBadgeVisibleAndWillAutoClose:0];
      }
    }
    else
    {
      int64_t v20 = [(PXSubjectTrackingView *)self hideFocusStateBadgeTimer];
      int v21 = [v20 isValid];

      if (v21)
      {
        id v25 = [(PXSubjectTrackingView *)self hideFocusStateBadgeTimer];
        [v25 fire];
      }
      else
      {
        int64_t v22 = [(PXSubjectTrackingView *)self focusStateBadge];
        [v22 alpha];
        double v24 = v23;

        if (v24 > 0.0)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_4;
          v26[3] = &unk_1E5DD36F8;
          v26[4] = self;
          [MEMORY[0x1E4FB1EB0] animateWithDuration:v26 animations:0.3];
        }
      }
    }
  }
}

void __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) focusStateBadge];
  [v1 setAlpha:1.0];
}

void __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4FB1EB0];
  double v5 = *(double *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_3;
  v6[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6[4] = *(void *)(a1 + 32);
  [v4 animateWithDuration:v6 animations:v5];
  objc_destroyWeak(&v7);
}

uint64_t __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) focusStateBadge];
  [v2 setAlpha:0.0];

  id v3 = *(void **)(a1 + 32);
  return [v3 setBadgeVisibleAndWillAutoClose:0];
}

uint64_t __60__PXSubjectTrackingView_setFocusStateBadgeVisible_autoHide___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained focusStateBadge];
  [v3 setAlpha:0.0];

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 setBadgeVisibleAndWillAutoClose:0];
}

- (void)_setPrimaryDetection:(id)a3 focusState:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(PXSubjectTrackingView *)self setFocusState:a4 detection:v8];
  uint64_t v9 = [v8 trackIdentifier];

  id v17 = [(PXSubjectTrackingView *)self primaryKey];
  double v10 = [NSNumber numberWithInteger:v9];
  [(PXSubjectTrackingView *)self setPrimaryKey:v10];
  if ([v17 integerValue] != v9)
  {
    [(PXSubjectTrackingView *)self setNeedsUpdateViewCache:1];
    int64_t v11 = [(PXSubjectTrackingView *)self detectionViewCache];
    double v12 = [v11 objectForKey:v17];

    if (v12)
    {
      double v13 = [(PXSubjectTrackingView *)self delegate];
      [v13 subjectTrackingStateDidChange:0 forView:v12 animated:v5];
    }
  }
  double v14 = [(PXSubjectTrackingView *)self detectionViewCache];
  double v15 = [v14 objectForKey:v10];

  double v16 = [(PXSubjectTrackingView *)self delegate];
  [v16 subjectTrackingStateDidChange:a4 forView:v15 animated:v5];
}

- (void)_updateFocusStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXSubjectTrackingView *)self cinematographyFrame];
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 allDetections];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      long long v23 = 0uLL;
      uint64_t v24 = 0;
      [v6 time];
      uint64_t v9 = [(PXSubjectTrackingView *)self cineController];
      double v10 = [v9 cinematographyScript];

      long long v21 = v23;
      uint64_t v22 = v24;
      int64_t v11 = [v10 primaryDecisionAtTime:&v21];
      double v12 = objc_msgSend(v10, "trackForIdentifier:", objc_msgSend(v11, "trackIdentifier"));
      long long v21 = v23;
      uint64_t v22 = v24;
      double v13 = [v12 detectionNearestTime:&v21];
      if ([v13 detectionType] == 100)
      {
        [(PXSubjectTrackingView *)self setPrimaryKey:0];
        [(PXSubjectTrackingView *)self _updateDetectionViewCache];
      }
      else
      {
        uint64_t v14 = [v13 groupIdentifier];
        if (PTGroupIDIsValid())
        {
          uint64_t v15 = [v6 bestDetectionForGroupIdentifier:v14];

          double v13 = (void *)v15;
        }
        int v16 = [v12 isDiscrete];
        int v17 = [v11 isStrongDecision];
        uint64_t v18 = 1;
        if (v17) {
          uint64_t v18 = 2;
        }
        uint64_t v19 = 3;
        if (v17) {
          uint64_t v19 = 4;
        }
        if (v16) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = v19;
        }
        [(PXSubjectTrackingView *)self _setPrimaryDetection:v13 focusState:v20 animated:v3];
      }
    }
  }
}

- (void)_updateDetectionViewCache
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXSubjectTrackingView *)self cinematographyFrame];
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 allDetections];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      detectionViewCache = self->_detectionViewCache;
      if (detectionViewCache)
      {
        uint64_t v8 = v4;
        uint64_t v9 = (NSDictionary *)[(NSDictionary *)detectionViewCache mutableCopy];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        double v10 = [(NSDictionary *)v9 allValues];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v71 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v70 + 1) + 8 * i) setHidden:1];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v80 count:16];
          }
          while (v12);
        }

        BOOL v4 = v8;
      }
      else
      {
        uint64_t v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      CGRect v57 = self;
      uint64_t v15 = [v4 focusDetection];
      int v16 = [v4 allDetections];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      CGRect v59 = v15;
      CGRect v58 = v16;
      uint64_t v61 = [v16 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (v61)
      {
        uint64_t v60 = *(void *)v67;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v67 != v60) {
              objc_enumerationMutation(v16);
            }
            uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * v17);
            if ([v18 detectionType] != 100)
            {
              uint64_t v19 = [v18 trackIdentifier];
              uint64_t v20 = [v15 trackIdentifier];
              uint64_t v21 = [v18 groupIdentifier];
              if (PTGroupIDIsValid())
              {
                uint64_t v22 = [v4 bestDetectionForGroupIdentifier:v21];
                uint64_t v23 = [v18 trackIdentifier];
                uint64_t v24 = v9;
                id v25 = v4;
                uint64_t v26 = [v22 trackIdentifier];
                uint64_t v27 = [v59 groupIdentifier];
                BOOL v28 = v23 == v26;
                BOOL v4 = v25;
                uint64_t v9 = v24;
                uint64_t v15 = v59;
                int v29 = v28;
                BOOL v30 = v19 == v20;
                if (!v28) {
                  BOOL v30 = 0;
                }
                if (v21 == v27) {
                  int v31 = v30;
                }
                else {
                  int v31 = v29;
                }

                int v16 = v58;
              }
              else
              {
                int v31 = 0;
              }
              if (v19 == v20 || v31 != 0)
              {
                uint64_t v33 = [v18 trackIdentifier];
                CGRect v34 = [NSNumber numberWithInteger:v33];
                CGRect v35 = [(NSDictionary *)v9 objectForKey:v34];
                if (!v35)
                {
                  [(PXSubjectTrackingView *)v57 frameForDetection:v18];
                  double x = v82.origin.x;
                  double y = v82.origin.y;
                  double width = v82.size.width;
                  double height = v82.size.height;
                  if (CGRectIsNull(v82)) {
                    goto LABEL_41;
                  }
                  v83.origin.double x = x;
                  v83.origin.double y = y;
                  v83.size.double width = width;
                  v83.size.double height = height;
                  if (CGRectIsInfinite(v83)
                    || (v84.origin.double x = x,
                        v84.origin.double y = y,
                        v84.size.double width = width,
                        v84.size.double height = height,
                        CGRectIsEmpty(v84)))
                  {
LABEL_41:
                    CGFloat v44 = PLPhotoEditGetLog();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    {
                      v85.origin.double x = x;
                      v85.origin.double y = y;
                      v85.size.double width = width;
                      v85.size.double height = height;
                      CGFloat v45 = NSStringFromCGRect(v85);
                      *(_DWORD *)buf = 138412546;
                      v76 = v45;
                      __int16 v77 = 2112;
                      v78 = v18;
                      _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_ERROR, "Unable to create new tracker view with frame %@ detection %@", buf, 0x16u);
                    }
                    CGRect v35 = 0;
                  }
                  else
                  {
                    uint64_t v40 = [(PXSubjectTrackingView *)v57 inProgressTrackingView];
                    if (v40
                      && (double v41 = (void *)v40,
                          uint64_t v42 = [(PXSubjectTrackingView *)v57 inProgressTrackID],
                          v41,
                          v33 == v42))
                    {
                      double v43 = [(PXSubjectTrackingView *)v57 inProgressTrackingView];
                      [(NSDictionary *)v9 setObject:v43 forKey:v34];
                      [(PXSubjectTrackingView *)v57 setInProgressTrackingView:0];
                      [(PXSubjectTrackingView *)v57 setInProgressTrackID:0x7FFFFFFFFFFFFFFFLL];

                      CGRect v35 = 0;
                    }
                    else
                    {
                      CGFloat v46 = PLPhotoEditGetLog();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v76 = v18;
                        _os_log_impl(&dword_1A9AE7000, v46, OS_LOG_TYPE_DEFAULT, "Creating new tracker view for detection %@", buf, 0xCu);
                      }

                      CGFloat v47 = [(PXSubjectTrackingView *)v57 delegate];
                      CGRect v35 = objc_msgSend(v47, "newTrackingViewWithFrame:initialState:", 0, x, y, width, height);

                      if (v35)
                      {
                        [(PXSubjectTrackingView *)v57 insertSubview:v35 atIndex:0];
                        [(NSDictionary *)v9 setObject:v35 forKey:v34];
                      }
                    }
                    int v16 = v58;
                  }
                }
                [v35 setHidden:0];
              }
            }
            ++v17;
          }
          while (v61 != v17);
          uint64_t v48 = [v16 countByEnumeratingWithState:&v66 objects:v79 count:16];
          uint64_t v61 = v48;
        }
        while (v48);
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      double v49 = [(NSDictionary *)v9 allKeys];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v63 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v62 + 1) + 8 * j);
            CGFloat v55 = [(NSDictionary *)v9 objectForKey:v54];
            if ([v55 isHidden])
            {
              [v55 removeFromSuperview];
              [(NSDictionary *)v9 removeObjectForKey:v54];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v62 objects:v74 count:16];
        }
        while (v51);
      }

      [MEMORY[0x1E4F39CF8] commit];
      CGFloat v56 = v57->_detectionViewCache;
      v57->_detectionViewCache = v9;
    }
  }
}

- (NSDictionary)detectionViewCache
{
  if ([(PXSubjectTrackingView *)self needsUpdateViewCache]
    || (detectionViewCache = self->_detectionViewCache) == 0)
  {
    [(PXSubjectTrackingView *)self setNeedsUpdateViewCache:0];
    [(PXSubjectTrackingView *)self _updateDetectionViewCache];
    detectionViewCache = self->_detectionViewCache;
  }
  return detectionViewCache;
}

- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = v7;
  if (self->_needsUpdateFrame || ([v7 isEqual:self->_cinematographyFrame] & 1) == 0)
  {
    self->_needsUpdateFrame = 0;
    objc_storeStrong((id *)&self->_cinematographyFrame, a3);
    [(PXSubjectTrackingView *)self setNeedsUpdateViewCache:1];
    if (v4)
    {
      if (![(PXSubjectTrackingView *)self isAnimating])
      {
        [(PXSubjectTrackingView *)self setNeedsLayout];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke;
        v10[3] = &unk_1E5DCFE98;
        v10[4] = self;
        char v11 = 0;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke_2;
        v9[3] = &unk_1E5DD2188;
        v9[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v9 completion:0.2];
      }
    }
    else
    {
      [(PXSubjectTrackingView *)self setNeedsLayout];
      [(PXSubjectTrackingView *)self _updateFocusStateAnimated:0];
    }
  }
}

uint64_t __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimating:1];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _updateFocusStateAnimated:v3];
}

uint64_t __56__PXSubjectTrackingView_setCinematographyFrame_animate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimating:0];
}

- (void)setCinematographyFrame:(id)a3
{
}

- (void)_updateCinematographyFrameWithTime:(id *)a3
{
  BOOL v5 = [(PXSubjectTrackingView *)self cineController];
  uint64_t v6 = [v5 cinematographyScript];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  id v7 = [v6 frameNearestTime:&v8];

  [(PXSubjectTrackingView *)self setCinematographyFrame:v7 animate:0];
}

- (void)_playbackTimeDidUpdate
{
  if (self->_viewEnabled)
  {
    uint64_t v3 = [(PXSubjectTrackingView *)self mediaView];
    BOOL v4 = [v3 player];
    uint64_t v5 = [v4 playbackState];

    if ((unint64_t)(v5 - 4) >= 0xFFFFFFFFFFFFFFFELL)
    {
      long long v20 = 0uLL;
      uint64_t v21 = 0;
      uint64_t v6 = [(PXSubjectTrackingView *)self mediaView];
      id v7 = [v6 player];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = v7;
      if (v7)
      {
        [v7 currentTime];
      }
      else
      {
        long long v20 = 0uLL;
        uint64_t v21 = 0;
      }

      long long v18 = 0uLL;
      uint64_t v19 = 0;
      uint64_t v9 = [(PXSubjectTrackingView *)self mediaView];
      double v10 = [v9 player];
      char v11 = v10;
      if (v10)
      {
        [v10 currentSeekTime];
      }
      else
      {
        long long v18 = 0uLL;
        uint64_t v19 = 0;
      }

      if (BYTE12(v18))
      {
        long long v20 = v18;
        uint64_t v21 = v19;
      }
      uint64_t v12 = [(PXSubjectTrackingView *)self delegate];
      uint64_t v13 = v12;
      if (v12)
      {
        long long v14 = v20;
        uint64_t v15 = v21;
        [v12 unadjustedTimeForPlayerTime:&v14];
      }
      else
      {
        long long v16 = 0uLL;
        uint64_t v17 = 0;
      }
      long long v20 = v16;
      uint64_t v21 = v17;

      long long v16 = v20;
      uint64_t v17 = v21;
      [(PXSubjectTrackingView *)self _updateCinematographyFrameWithTime:&v16];
    }
  }
}

- (void)setNeedsUpdateFrameTime
{
  self->_needsUpdateFrameTime = 1;
}

- (void)setNeedsUpdateFrame
{
  self->_needsUpdateFrame = 1;
}

- (void)scriptDidUpdate
{
  if ([(PXSubjectTrackingView *)self needsUpdateFrameTime])
  {
    [(PXSubjectTrackingView *)self setNeedsUpdateFrameTime:0];
    [(PXSubjectTrackingView *)self _playbackTimeDidUpdate];
  }
  uint64_t v3 = [(PXCinematicEditController *)self->_cineController cinematographyScript];
  [v3 setChangesDelegate:self];

  long long v6 = 0uLL;
  uint64_t v7 = 0;
  [(PXSubjectTrackingView *)self _currentCinematographyTime];
  if ((unsigned __int128)0 >> 96)
  {
    long long v4 = v6;
    uint64_t v5 = v7;
    [(PXSubjectTrackingView *)self _updateCinematographyFrameWithTime:&v4];
  }
}

- (void)renderDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXSubjectTrackingView *)self setNeedsLayout];
  if (v3)
  {
    [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:0 autoHide:1];
  }
}

- (void)decisionsDidChangeInScript:(id)a3 timeRange:(id *)a4
{
}

uint64_t __62__PXSubjectTrackingView_decisionsDidChangeInScript_timeRange___block_invoke(uint64_t a1)
{
  memset(&v7, 0, sizeof(v7));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 _currentCinematographyTime];
  }
  long long v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  CMTime v5 = v7;
  uint64_t result = CMTimeRangeContainsTime(&range, &v5);
  if (result) {
    return [*(id *)(a1 + 32) _updateFocusStateAnimated:1];
  }
  return result;
}

- (void)framesDidChangeInScript:(id)a3 timeRange:(id *)a4
{
}

uint64_t __59__PXSubjectTrackingView_framesDidChangeInScript_timeRange___block_invoke(uint64_t a1)
{
  memset(&v7, 0, sizeof(v7));
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 _currentCinematographyTime];
  }
  long long v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  CMTime v5 = v7;
  uint64_t result = CMTimeRangeContainsTime(&range, &v5);
  if (result) {
    return [*(id *)(a1 + 32) scriptDidUpdate];
  }
  return result;
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
  -[PXSubjectTrackingView setViewEnabled:](self, "setViewEnabled:");
}

- (void)setViewEnabled:(BOOL)a3
{
  BOOL v3 = self->_viewCanBeEnabled && a3;
  if (self->_viewEnabled != v3)
  {
    if (v3)
    {
      self->_viewEnabled = 1;
      [(PXSubjectTrackingView *)self _playbackTimeDidUpdate];
    }
    else
    {
      self->_viewEnabled = 0;
    }
  }
}

- (double)_smoothenFromValue:(double)a3 toNewValue:(double)a4 forTime:(double)a5 tolerance:(double)a6
{
  double v7 = a3;
  double v8 = a4 - a3;
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  if (v8 <= a6) {
    return v7;
  }
  [(PXSubjectTrackingView *)self lastLayoutTime];
  if (v10 >= a5 || v10 + 0.1 <= a5) {
    return a4;
  }
  double v13 = (v10 * -1000.0 + a5 * 1000.0) / -100.0 + 1.0;
  return (1.0 - v13) * a4 + v13 * v7;
}

- (BOOL)_isValidTrackingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3)) {
    return 0;
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  if (CGRectIsInfinite(v8)) {
    return 0;
  }
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return !CGRectIsEmpty(v9);
}

- (void)layoutSubviews
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)PXSubjectTrackingView;
  [(PXSubjectTrackingView *)&v71 layoutSubviews];
  BOOL v3 = [(PXSubjectTrackingView *)self delegate];
  long long v4 = [(PXSubjectTrackingView *)self focusStateBadge];
  [v3 rectForFocusStateBadge:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(PXSubjectTrackingView *)self focusStateBadge];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  long long v14 = [(PXSubjectTrackingView *)self cinematographyFrame];
  uint64_t v15 = v14;
  if (v14)
  {
    long long v16 = [v14 allDetections];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      memset(&v70, 0, sizeof(v70));
      long long v18 = [(PXSubjectTrackingView *)self mediaView];
      uint64_t v19 = [v18 player];
      long long v20 = v19;
      if (v19) {
        [v19 currentTime];
      }
      else {
        memset(&v70, 0, sizeof(v70));
      }

      CMTime time = v70;
      BOOL v59 = (v70.flags & 0x1D) == 1;
      uint64_t v21 = [(PXSubjectTrackingView *)self detectionViewCache];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v22 = [v21 allKeys];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v72 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v67;
        double v63 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v64 = *MEMORY[0x1E4F1DB28];
        double v61 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v62 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        uint64_t v65 = *(void *)v67;
        do
        {
          uint64_t v26 = 0;
          uint64_t v60 = v24;
          do
          {
            if (*(void *)v67 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8 * v26);
            BOOL v28 = [v21 objectForKey:v27];
            int v29 = objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v27, "integerValue"));
            [v28 frame];
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;
            double v37 = v36;
            [(PXSubjectTrackingView *)self frameForDetection:v29];
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            double v45 = v44;
            if (-[PXSubjectTrackingView _isValidTrackingRect:](self, "_isValidTrackingRect:"))
            {
              if (-[PXSubjectTrackingView _isValidTrackingRect:](self, "_isValidTrackingRect:", v31, v33, v35, v37))
              {
                CGFloat v46 = v22;
                CGFloat v47 = v21;
                uint64_t v48 = v15;
                double v49 = [(PXSubjectTrackingView *)self mediaView];
                uint64_t v50 = [v49 player];
                BOOL v51 = [v50 playbackState] == 3 && v59;

                if (v51)
                {
                  -[PXSubjectTrackingView _smoothenFromValue:toNewValue:forTime:tolerance:](self, "_smoothenFromValue:toNewValue:forTime:tolerance:", v31, v39, v58);
                  double v39 = v52;
                  [(PXSubjectTrackingView *)self _smoothenFromValue:v33 toNewValue:v41 forTime:v58 tolerance:v45 / 100.0];
                  double v41 = v53;
                  [(PXSubjectTrackingView *)self _smoothenFromValue:v35 toNewValue:v43 forTime:v58 tolerance:v43 / 100.0];
                  double v43 = v54;
                  [(PXSubjectTrackingView *)self _smoothenFromValue:v37 toNewValue:v45 forTime:v58 tolerance:v45 / 100.0];
                  double v45 = v55;
                }
                uint64_t v15 = v48;
                uint64_t v21 = v47;
                uint64_t v22 = v46;
                uint64_t v24 = v60;
                uint64_t v25 = v65;
              }
            }
            else
            {
              CGFloat v56 = PLPhotoEditGetLog();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v75.origin.CGFloat x = v39;
                v75.origin.CGFloat y = v41;
                v75.size.CGFloat width = v43;
                v75.size.CGFloat height = v45;
                CGRect v57 = NSStringFromCGRect(v75);
                LODWORD(time.value) = 138412546;
                *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v57;
                LOWORD(time.flags) = 2112;
                *(void *)((char *)&time.flags + 2) = v29;
                _os_log_impl(&dword_1A9AE7000, v56, OS_LOG_TYPE_ERROR, "Invalid tracker view frame %@ detection %@", (uint8_t *)&time, 0x16u);

                uint64_t v25 = v65;
              }

              double v45 = v61;
              double v43 = v62;
              double v41 = v63;
              double v39 = v64;
            }
            objc_msgSend(v28, "setFrame:", v39, v41, v43, v45);
            v76.origin.CGFloat x = v39;
            v76.origin.CGFloat y = v41;
            v76.size.CGFloat width = v43;
            v76.size.CGFloat height = v45;
            [v28 setHidden:CGRectIsEmpty(v76)];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v66 objects:v72 count:16];
        }
        while (v24);
      }

      if (v59) {
        [(PXSubjectTrackingView *)self setLastLayoutTime:v58];
      }
    }
  }
}

- (void)setFocusState:(int64_t)a3 detection:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 5) > 0xFFFFFFFFFFFFFFFDLL || self->_focusState != a3)
  {
    id v11 = v6;
    self->_focusState = a3;
    double v7 = [(PXSubjectTrackingView *)self undoManager];
    if (![(PXSubjectTrackingView *)self badgeVisibleAndWillAutoClose]
      && ([v7 isUndoing] & 1) == 0
      && ([v7 isRedoing] & 1) == 0)
    {
      if ((unint64_t)a3 > 3 || a3 == 2)
      {
        [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:1 autoHide:1];
        double v8 = [(PXSubjectTrackingView *)self delegate];
        double v9 = [(PXSubjectTrackingView *)self focusStateBadge];
        [v11 focusDistance];
        [v8 subjectFocusStateDidChange:a3 forBadge:v9 focusedDisparity:v10];

        [(PXSubjectTrackingView *)self setNeedsLayout];
      }
      else
      {
        [(PXSubjectTrackingView *)self setFocusStateBadgeVisible:0 autoHide:0];
      }
    }

    id v6 = v11;
  }
}

- (PXSubjectTrackingView)initWithMediaView:(id)a3 cineController:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  float v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXSubjectTrackingView.m", 63, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PXSubjectTrackingView.m", 64, @"Invalid parameter not satisfying: %@", @"cineController != nil" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)PXSubjectTrackingView;
  id v11 = -[PXSubjectTrackingView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaView, a3);
    objc_storeStrong((id *)&v12->_cineController, a4);
    double v13 = [(PXCinematicEditController *)v12->_cineController cinematographyScript];
    [v13 setChangesDelegate:v12];

    v12->_focusState = 0;
    v12->_viewEnabled = 0;
    v12->_viewCanBeEnabled = 1;
    objc_initWeak(&location, v12);
    long long v14 = [v8 player];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke;
    v20[3] = &unk_1E5DCE850;
    objc_copyWeak(&v21, &location);
    uint64_t v15 = [v14 addPlaybackTimeObserver:v20];
    id playbackTimeObserver = v12->_playbackTimeObserver;
    v12->_id playbackTimeObserver = (id)v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __58__PXSubjectTrackingView_initWithMediaView_cineController___block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained viewEnabled];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _playbackTimeDidUpdate];
  }
}

+ (CGPoint)denormalizePoint:(CGPoint)a3 masterSize:(CGSize)a4 flipYCoordinate:(BOOL)a5
{
  double v5 = a3.x * a4.width;
  double v6 = a3.y * a4.height;
  if (a5) {
    double v6 = a4.height - v6;
  }
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

@end
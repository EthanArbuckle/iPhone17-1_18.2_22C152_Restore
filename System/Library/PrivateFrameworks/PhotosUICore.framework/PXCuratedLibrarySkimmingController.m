@interface PXCuratedLibrarySkimmingController
+ (PXCuratedLibrarySkimmingController)new;
- (BOOL)canStartSkimming;
- (BOOL)endTouchingGestureEnded:(BOOL)a3;
- (BOOL)isTouching;
- (BOOL)skimmingSlideshowEnabled;
- (NSArray)skimmingIndexes;
- (NSTimer)slideshowTimer;
- (PXAssetCollectionReference)preSkimmedAssetCollectionReference;
- (PXCuratedLibraryAssetCollectionSkimmingModel)skimmingModel;
- (PXCuratedLibrarySkimmingController)init;
- (PXCuratedLibrarySkimmingController)initWithSkimmingModel:(id)a3;
- (PXCuratedLibrarySkimmingControllerDelegate)delegate;
- (double)lastPanningTranslation;
- (int64_t)currentSkimmingIndex;
- (int64_t)skimmingDataSourceIdentifier;
- (int64_t)state;
- (void)_adoptIndexesFromSkimmingModel;
- (void)_cancelEnteringTouchingState;
- (void)_cleanupFeedbackGenerator;
- (void)_ensureFeedbackGenerator;
- (void)_enterIdleStatePersistSkimmingState:(BOOL)a3;
- (void)_enterSlideshowStateForAssetCollectionReference:(id)a3;
- (void)_enterTouchingStateForAssetCollectionReference:(id)a3;
- (void)_generateFeedbackForSkimmingGesture;
- (void)_slideshowTimerTick:(id)a3;
- (void)_startOrResumeSlideshowTouchesEnded:(BOOL)a3;
- (void)_stopSlideshow;
- (void)_updateSlideshow;
- (void)endPanning;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCurrentSkimmingIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastPanningTranslation:(double)a3;
- (void)setPreSkimmedAssetCollectionReference:(id)a3;
- (void)setSkimmingDataSourceIdentifier:(int64_t)a3;
- (void)setSkimmingIndexes:(id)a3;
- (void)setSkimmingSlideshowEnabled:(BOOL)a3;
- (void)setSlideshowTimer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)startPanningForAssetCollectionReference:(id)a3;
- (void)startTouchingForAssetCollectionReference:(id)a3;
- (void)updatePanningWithTranslation:(CGPoint)a3;
@end

@implementation PXCuratedLibrarySkimmingController

- (void)_cancelEnteringTouchingState
{
  v3 = [(PXCuratedLibrarySkimmingController *)self preSkimmedAssetCollectionReference];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4FBA8A8];
    v5 = [(PXCuratedLibrarySkimmingController *)self preSkimmedAssetCollectionReference];
    [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__enterTouchingStateForAssetCollectionReference_ object:v5];

    [(PXCuratedLibrarySkimmingController *)self setPreSkimmedAssetCollectionReference:0];
  }
}

- (PXAssetCollectionReference)preSkimmedAssetCollectionReference
{
  return self->_preSkimmedAssetCollectionReference;
}

- (void)setDelegate:(id)a3
{
}

- (PXCuratedLibrarySkimmingController)initWithSkimmingModel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibrarySkimmingController;
  v6 = [(PXCuratedLibrarySkimmingController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_skimmingModel, a3);
    v8 = [v5 viewModel];
    [v8 registerChangeObserver:v7 context:PXCuratedLibraryViewModelObserverContext];

    v9 = +[PXCuratedLibrarySettings sharedInstance];
    -[PXCuratedLibrarySkimmingController setSkimmingSlideshowEnabled:](v7, "setSkimmingSlideshowEnabled:", [v9 enableSlideshowInYears]);
    [v9 slideshowTriggerDelay];
    v7->_slideshowTriggerDelay = v10;
    [v9 slideshowIntervalDelay];
    v7->_slideshowIntervalDelay = v11;
  }
  return v7;
}

- (void)setSkimmingSlideshowEnabled:(BOOL)a3
{
  if (self->_skimmingSlideshowEnabled != a3)
  {
    self->_skimmingSlideshowEnabled = a3;
    if (a3) {
      [(PXCuratedLibrarySkimmingController *)self _updateSlideshow];
    }
    else {
      -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:");
    }
  }
}

- (void)_updateSlideshow
{
  if ([(PXCuratedLibrarySkimmingController *)self skimmingSlideshowEnabled])
  {
    v3 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    int v4 = [v3 canStartSkimming];

    if (v4)
    {
      [(PXCuratedLibrarySkimmingController *)self _startOrResumeSlideshowTouchesEnded:0];
    }
    else
    {
      [(PXCuratedLibrarySkimmingController *)self _stopSlideshow];
    }
  }
}

- (BOOL)skimmingSlideshowEnabled
{
  return self->_skimmingSlideshowEnabled;
}

- (PXCuratedLibraryAssetCollectionSkimmingModel)skimmingModel
{
  return self->_skimmingModel;
}

- (void)_stopSlideshow
{
  if ([(PXCuratedLibrarySkimmingController *)self state] == 1)
  {
    [(PXCuratedLibrarySkimmingController *)self _enterIdleStatePersistSkimmingState:0];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySkimmingController.m" lineNumber:85 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x2804) != 0)
  {
    id v13 = v9;
    double v10 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    double v11 = [v10 viewModel];

    if (![v11 zoomLevelTransitionPhase] && objc_msgSend(v11, "scrollRegime") <= 1)
    {
      if ([(PXCuratedLibrarySkimmingController *)self skimmingSlideshowEnabled]) {
        [(PXCuratedLibrarySkimmingController *)self _updateSlideshow];
      }
      else {
        [(PXCuratedLibrarySkimmingController *)self _enterIdleStatePersistSkimmingState:0];
      }
    }

    id v9 = v13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slideshowTimer, 0);
  objc_storeStrong((id *)&self->_skimmingIndexes, 0);
  objc_storeStrong((id *)&self->_preSkimmedAssetCollectionReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skimmingModel, 0);
  objc_storeStrong((id *)&self->_skimmingFeedbackGenerator, 0);
}

- (void)setSlideshowTimer:(id)a3
{
}

- (NSTimer)slideshowTimer
{
  return self->_slideshowTimer;
}

- (void)setSkimmingDataSourceIdentifier:(int64_t)a3
{
  self->_skimmingDataSourceIdentifier = a3;
}

- (int64_t)skimmingDataSourceIdentifier
{
  return self->_skimmingDataSourceIdentifier;
}

- (void)setSkimmingIndexes:(id)a3
{
}

- (NSArray)skimmingIndexes
{
  return self->_skimmingIndexes;
}

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  self->_currentSkimmingIndex = a3;
}

- (int64_t)currentSkimmingIndex
{
  return self->_currentSkimmingIndex;
}

- (void)setLastPanningTranslation:(double)a3
{
  self->_lastPanningTranslation = a3;
}

- (double)lastPanningTranslation
{
  return self->_lastPanningTranslation;
}

- (void)setPreSkimmedAssetCollectionReference:(id)a3
{
}

- (PXCuratedLibrarySkimmingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibrarySkimmingControllerDelegate *)WeakRetained;
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    self->_int64_t state = a3;
    if (state == 2) {
      double v6 = 0.5;
    }
    else {
      double v6 = 0.0;
    }
    if (state == 3) {
      double v7 = 1.0;
    }
    else {
      double v7 = v6;
    }
    BOOL v8 = state == 3 || state == 2;
    if ((unint64_t)(a3 - 2) < 2)
    {
      int v9 = 1;
      double v10 = 0.2;
    }
    else
    {
      int v9 = 0;
      if ((unint64_t)a3 <= 1) {
        double v10 = 0.5;
      }
      else {
        double v10 = 0.0;
      }
    }
    if ([(PXCuratedLibrarySkimmingController *)self skimmingSlideshowEnabled])
    {
      double v11 = [(PXCuratedLibrarySkimmingController *)self slideshowTimer];
      [v11 invalidate];

      [(PXCuratedLibrarySkimmingController *)self setSlideshowTimer:0];
      if (a3 == 1)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F1CB00]);
        id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_slideshowTriggerDelay];
        v14 = (void *)[v12 initWithFireDate:v13 interval:self target:sel__slideshowTimerTick_ selector:0 userInfo:1 repeats:self->_slideshowIntervalDelay];

        [(PXCuratedLibrarySkimmingController *)self setSlideshowTimer:v14];
        v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [v15 addTimer:v14 forMode:*MEMORY[0x1E4F1C3A0]];
      }
    }
    if ((v8 | v9 ^ 1))
    {
      if ((v9 | !v8)) {
        return;
      }
      id v18 = [(PXCuratedLibrarySkimmingController *)self delegate];
      [v18 skimmingControllerDidStopSkimming:self animationDuration:v7];
    }
    else
    {
      id v18 = [(PXCuratedLibrarySkimmingController *)self delegate];
      v16 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
      v17 = [v16 containingAssetCollectionReference];
      [v18 skimmingController:self willStartSkimmingAssetCollectionReference:v17 animationDuration:v10];
    }
  }
}

- (void)_enterIdleStatePersistSkimmingState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXCuratedLibrarySkimmingController *)self state])
  {
    id v5 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    [v5 tearDownAfterSkimmingShowHints:0 persistState:v3];

    [(PXCuratedLibrarySkimmingController *)self _cancelEnteringTouchingState];
    [(PXCuratedLibrarySkimmingController *)self setSkimmingIndexes:0];
    [(PXCuratedLibrarySkimmingController *)self setCurrentSkimmingIndex:0x7FFFFFFFFFFFFFFFLL];
    [(PXCuratedLibrarySkimmingController *)self setSkimmingDataSourceIdentifier:0];
    [(PXCuratedLibrarySkimmingController *)self setState:0];
  }
}

- (void)_adoptIndexesFromSkimmingModel
{
  BOOL v3 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  int v4 = [v3 indexPathSetForSkimming];
  long long v14 = 0u;
  long long v15 = 0u;
  if (v3) {
    [v3 initialIndexPath];
  }
  if (v4)
  {
    [v4 anySectionIndexPath];
    uint64_t v5 = v12;
  }
  else
  {
    uint64_t v5 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = [v4 sectionIndexSetForDataSourceIdentifier:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PXCuratedLibrarySkimmingController__adoptIndexesFromSkimmingModel__block_invoke;
  v10[3] = &unk_1E5DD3010;
  id v11 = v6;
  id v8 = v6;
  [v7 enumerateIndexesUsingBlock:v10];

  [(PXCuratedLibrarySkimmingController *)self setSkimmingDataSourceIdentifier:v5];
  [(PXCuratedLibrarySkimmingController *)self setSkimmingIndexes:v8];
  int v9 = [NSNumber numberWithInteger:*((void *)&v14 + 1)];
  -[PXCuratedLibrarySkimmingController setCurrentSkimmingIndex:](self, "setCurrentSkimmingIndex:", [v8 indexOfObject:v9]);
}

void __68__PXCuratedLibrarySkimmingController__adoptIndexesFromSkimmingModel__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (void)_enterTouchingStateForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 indexPath];
  }
  else {
    memset(&v12[2], 0, 32);
  }
  id v6 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  double v7 = [v6 containingAssetCollectionReference];
  id v8 = v7;
  if (v7)
  {
    [v7 indexPath];
    uint64_t v9 = *(void *)&v12[0];
  }
  else
  {
    uint64_t v9 = 0;
    memset(v12, 0, 32);
  }
  if (*(void *)&v12[2] == v9 && *(_OWORD *)((char *)&v12[2] + 8) == *(_OWORD *)((char *)v12 + 8))
  {

    if (*((void *)&v12[3] + 1) == *((void *)&v12[1] + 1))
    {
      [(PXCuratedLibrarySkimmingController *)self setState:2];
      double v10 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
      [v10 transitionToSkimming];

      goto LABEL_14;
    }
  }
  else
  {
  }
  if ((unint64_t)[(PXCuratedLibrarySkimmingController *)self state] <= 2)
  {
    id v11 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    [v11 prepareForSkimmingInAssetCollectionReference:v5];

    [(PXCuratedLibrarySkimmingController *)self _adoptIndexesFromSkimmingModel];
    [(PXCuratedLibrarySkimmingController *)self setState:2];
  }
LABEL_14:
}

- (void)_enterSlideshowStateForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 indexPath];
  }
  else {
    memset(&v21[6], 0, 32);
  }
  id v6 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  double v7 = [v6 containingAssetCollectionReference];
  id v8 = v7;
  if (v7)
  {
    [v7 indexPath];
    uint64_t v9 = *(void *)&v21[4];
  }
  else
  {
    uint64_t v9 = 0;
    memset(&v21[4], 0, 32);
  }
  if (*(void *)&v21[6] == v9 && *(_OWORD *)((char *)&v21[6] + 8) == *(_OWORD *)((char *)&v21[4] + 8))
  {

    if (*((void *)&v21[7] + 1) == *((void *)&v21[5] + 1))
    {
      unint64_t v10 = [(PXCuratedLibrarySkimmingController *)self state];
      if (v10 <= 3 && v10 != 1)
      {
        [(PXCuratedLibrarySkimmingController *)self setState:1];
        id v11 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
        [v11 transitionToSlideshow];
      }
      goto LABEL_27;
    }
  }
  else
  {
  }
  long long v12 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  long long v13 = v12;
  if (v12) {
    [v12 skimmedIndexPath];
  }
  else {
    memset(&v21[2], 0, 32);
  }
  long long v14 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  long long v15 = v14;
  if (v14)
  {
    [v14 initialIndexPath];
    uint64_t v16 = *(void *)&v21[0];
  }
  else
  {
    uint64_t v16 = 0;
    memset(v21, 0, 32);
  }
  BOOL v17 = *(void *)&v21[2] != v16
     || *(_OWORD *)((char *)&v21[2] + 8) != *(_OWORD *)((char *)v21 + 8)
     || *((void *)&v21[3] + 1) != *((void *)&v21[1] + 1);
  -[PXCuratedLibrarySkimmingController _enterIdleStatePersistSkimmingState:](self, "_enterIdleStatePersistSkimmingState:", v17, *(void *)&v21[0]);

  id v18 = [v5 assetCollection];
  uint64_t v19 = objc_msgSend(v18, "px_highlightKind");

  if (v19 == 2 && (unint64_t)[(PXCuratedLibrarySkimmingController *)self state] <= 1)
  {
    v20 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    [v20 prepareForSlideshowForAssetCollectionReference:v5];

    [(PXCuratedLibrarySkimmingController *)self _adoptIndexesFromSkimmingModel];
    [(PXCuratedLibrarySkimmingController *)self setState:1];
  }
LABEL_27:
}

- (void)_cleanupFeedbackGenerator
{
  skimmingFeedbackGenerator = self->_skimmingFeedbackGenerator;
  self->_skimmingFeedbackGenerator = 0;
}

- (void)_generateFeedbackForSkimmingGesture
{
  [(UISelectionFeedbackGenerator *)self->_skimmingFeedbackGenerator selectionChanged];
  skimmingFeedbackGenerator = self->_skimmingFeedbackGenerator;
  [(UISelectionFeedbackGenerator *)skimmingFeedbackGenerator prepare];
}

- (void)_ensureFeedbackGenerator
{
  id v3 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
  skimmingFeedbackGenerator = self->_skimmingFeedbackGenerator;
  self->_skimmingFeedbackGenerator = v3;

  uint64_t v5 = self->_skimmingFeedbackGenerator;
  [(UISelectionFeedbackGenerator *)v5 prepare];
}

- (void)endPanning
{
  if ([(PXCuratedLibrarySkimmingController *)self state] == 3)
  {
    [(PXCuratedLibrarySkimmingController *)self _cleanupFeedbackGenerator];
    if ([(PXCuratedLibrarySkimmingController *)self skimmingSlideshowEnabled])
    {
      [(PXCuratedLibrarySkimmingController *)self _startOrResumeSlideshowTouchesEnded:1];
    }
    else
    {
      [(PXCuratedLibrarySkimmingController *)self _enterIdleStatePersistSkimmingState:1];
    }
  }
}

- (void)updatePanningWithTranslation:(CGPoint)a3
{
  double x = a3.x;
  if ([(PXCuratedLibrarySkimmingController *)self state] == 3)
  {
    uint64_t v5 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    [v5 transitionToSkimming];

    [(PXCuratedLibrarySkimmingController *)self lastPanningTranslation];
    if (vabdd_f64(x, v6) >= 15.0)
    {
      [(PXCuratedLibrarySkimmingController *)self setLastPanningTranslation:x];
      [(PXCuratedLibrarySkimmingController *)self skimmingIndexes];
      objc_claimAutoreleasedReturnValue();
      [(PXCuratedLibrarySkimmingController *)self currentSkimmingIndex];
      PXFloatSign();
    }
  }
}

- (void)startPanningForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  int v6 = [v5 canStartSkimming];

  if (v6)
  {
    double v7 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    uint64_t v9 = [v7 validatedAssetCollectionReference:v4];

    if ([(PXCuratedLibrarySkimmingController *)self state] != 2)
    {
      [(PXCuratedLibrarySkimmingController *)self _cancelEnteringTouchingState];
      [(PXCuratedLibrarySkimmingController *)self _enterTouchingStateForAssetCollectionReference:v9];
    }
    [(PXCuratedLibrarySkimmingController *)self setLastPanningTranslation:0.0];
    [(PXCuratedLibrarySkimmingController *)self setState:3];
    [(PXCuratedLibrarySkimmingController *)self _ensureFeedbackGenerator];
    id v8 = (void *)v9;
  }
  else
  {
    id v8 = v4;
  }
}

- (BOOL)endTouchingGestureEnded:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXCuratedLibrarySkimmingController *)self _cancelEnteringTouchingState];
  if (v3)
  {
    if ([(PXCuratedLibrarySkimmingController *)self state] == 2)
    {
      LOBYTE(v3) = 1;
      if ([(PXCuratedLibrarySkimmingController *)self skimmingSlideshowEnabled]) {
        [(PXCuratedLibrarySkimmingController *)self _startOrResumeSlideshowTouchesEnded:1];
      }
      else {
        [(PXCuratedLibrarySkimmingController *)self _enterIdleStatePersistSkimmingState:1];
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)startTouchingForAssetCollectionReference:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  int v6 = [v5 canStartSkimming];

  if (v6)
  {
    double v7 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    uint64_t v8 = [v7 validatedAssetCollectionReference:v4];

    [(PXCuratedLibrarySkimmingController *)self setPreSkimmedAssetCollectionReference:v8];
    v10[0] = *MEMORY[0x1E4F1C4B0];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(PXCuratedLibrarySkimmingController *)self performSelector:sel__enterTouchingStateForAssetCollectionReference_ withObject:v8 afterDelay:v9 inModes:0.15];

    id v4 = (id)v8;
  }
}

- (BOOL)isTouching
{
  return [(PXCuratedLibrarySkimmingController *)self state] == 2;
}

- (BOOL)canStartSkimming
{
  v2 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
  char v3 = [v2 canStartSkimming];

  return v3;
}

- (void)_slideshowTimerTick:(id)a3
{
  if ([(PXCuratedLibrarySkimmingController *)self state] == 1)
  {
    id v4 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    uint64_t v5 = [v4 viewModel];
    uint64_t v6 = [v5 scrollRegime];

    if (!v6)
    {
      double v7 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
      [v7 transitionToSlideshow];

      uint64_t v8 = [(PXCuratedLibrarySkimmingController *)self skimmingIndexes];
      unint64_t v9 = [v8 count];

      if (v9 >= 2)
      {
        unint64_t v10 = [(PXCuratedLibrarySkimmingController *)self skimmingIndexes];
        int64_t v11 = [(PXCuratedLibrarySkimmingController *)self currentSkimmingIndex];
        if (v11 + 1 < (unint64_t)[v10 count]) {
          unint64_t v12 = v11 + 1;
        }
        else {
          unint64_t v12 = 0;
        }
        if (v12 < [v10 count])
        {
          [(PXCuratedLibrarySkimmingController *)self setCurrentSkimmingIndex:v12];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v13 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
          long long v14 = v13;
          if (v13)
          {
            [v13 skimmedIndexPath];
          }
          else
          {
            long long v22 = 0u;
            long long v23 = 0u;
          }

          int64_t v15 = [(PXCuratedLibrarySkimmingController *)self skimmingDataSourceIdentifier];
          uint64_t v16 = [v10 objectAtIndexedSubscript:v12];
          uint64_t v17 = [v16 integerValue];
          id v18 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
          v20[0] = v15;
          v20[1] = v17;
          int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          [v18 setSkimmedIndexPath:v20];

          uint64_t v19 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
          if (v19) {
            [v19 skimmedIndexPath];
          }
          PXSimpleIndexPathCompare();
        }
      }
    }
  }
}

- (void)_startOrResumeSlideshowTouchesEnded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXCuratedLibrarySkimmingController *)self delegate];
  uint64_t v6 = [v5 assetCollectionReferenceForSkimmingSlideshow:self];

  if (v6)
  {
    double v7 = [(PXCuratedLibrarySkimmingController *)self skimmingModel];
    id v10 = [v7 validatedAssetCollectionReference:v6];

    if (v10)
    {
      unint64_t v8 = [(PXCuratedLibrarySkimmingController *)self state];
      if (v8 < 2
        || v8 - 2 <= 1
        && ([(PXCuratedLibrarySkimmingController *)self skimmingModel],
            unint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v9 persistSkimmingState],
            v9,
            v3))
      {
        [(PXCuratedLibrarySkimmingController *)self _enterSlideshowStateForAssetCollectionReference:v10];
      }
      else
      {
        [(PXCuratedLibrarySkimmingController *)self _enterIdleStatePersistSkimmingState:1];
      }
    }
  }
}

- (PXCuratedLibrarySkimmingController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibrarySkimmingController.m", 62, @"%s is not available as initializer", "-[PXCuratedLibrarySkimmingController init]");

  abort();
}

+ (PXCuratedLibrarySkimmingController)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCuratedLibrarySkimmingController.m", 66, @"%s is not available as initializer", "+[PXCuratedLibrarySkimmingController new]");

  abort();
}

@end
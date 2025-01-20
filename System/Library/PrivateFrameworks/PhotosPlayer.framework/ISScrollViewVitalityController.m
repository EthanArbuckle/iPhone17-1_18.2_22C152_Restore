@interface ISScrollViewVitalityController
- (BOOL)_isPerformingChanges;
- (BOOL)canPerformVitality;
- (BOOL)hasTargetContentOffset;
- (BOOL)isDecelerating;
- (BOOL)isEnabled;
- (BOOL)isScrolling;
- (CGPoint)targetContentOffset;
- (ISScrollViewVitalityController)init;
- (ISVisibilityOffsetHelper)visibilityOffsetHelper;
- (NSDate)estimatedScrollEndDate;
- (NSHashTable)_playerViews;
- (UIScrollView)_scrollView;
- (id)_newVitalityFilter;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_setScrollView:(id)a3;
- (void)_updateVitalityFilters;
- (void)addPlayerView:(id)a3;
- (void)canPerformVitalityDidChange;
- (void)didLayoutPlayerViews;
- (void)performChanges:(id)a3;
- (void)removePlayerView:(id)a3;
- (void)setDecelerating:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEstimatedScrollEndDate:(id)a3;
- (void)setHasTargetContentOffset:(BOOL)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setTargetContentOffset:(CGPoint)a3;
@end

@implementation ISScrollViewVitalityController

- (NSHashTable)_playerViews
{
  return self->__playerViews;
}

- (BOOL)hasTargetContentOffset
{
  return self->_hasTargetContentOffset;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)canPerformVitality
{
  return 1;
}

- (BOOL)isDecelerating
{
  return self->_decelerating;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isScrolling
{
  return self->_scrolling;
}

- (ISScrollViewVitalityController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISScrollViewVitalityController;
  v2 = [(ISScrollViewVitalityController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    playerViews = v2->__playerViews;
    v2->__playerViews = (NSHashTable *)v3;

    v2->_enabled = 1;
  }
  return v2;
}

void __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        char v23 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        [v3 getVisibility:&v23 offset:&v22 targetVisibilityOffset:&v21 forView:v9];
        v10 = [v9 livePhotoPlayer];
        uint64_t v11 = [v10 vitalityFilter];
        id v12 = (id)v11;
        if (*(unsigned char *)(a1 + 56))
        {
          if (!v11)
          {
            id v12 = (id)[*(id *)(a1 + 40) _newVitalityFilter];
            [v10 setVitalityFilter:v12];
          }
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke_2;
          v13[3] = &unk_1E6BECB80;
          id v12 = v12;
          id v14 = v12;
          char v18 = v23;
          char v19 = *(unsigned char *)(a1 + 57);
          uint64_t v16 = v22;
          uint64_t v17 = v21;
          id v15 = *(id *)(a1 + 48);
          __int16 v20 = *(_WORD *)(a1 + 58);
          [v12 performInputChanges:v13];
        }
        else
        {
          [v10 setVitalityFilter:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)setScrolling:(BOOL)a3
{
  self->_scrolling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityOffsetHelper, 0);
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, 0);
  objc_storeStrong((id *)&self->__playerViews, 0);

  objc_destroyWeak((id *)&self->__scrollView);
}

- (ISVisibilityOffsetHelper)visibilityOffsetHelper
{
  return self->_visibilityOffsetHelper;
}

- (NSDate)estimatedScrollEndDate
{
  return self->_estimatedScrollEndDate;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setScrollView:(id)a3
{
}

- (UIScrollView)_scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)_updateVitalityFilters
{
  id v3 = [(ISScrollViewVitalityController *)self _scrollView];
  BOOL v4 = [(ISScrollViewVitalityController *)self isScrolling];
  BOOL v5 = [(ISScrollViewVitalityController *)self isDecelerating];
  [(ISScrollViewVitalityController *)self targetContentOffset];
  double v7 = v6;
  double v9 = v8;
  v10 = [(ISScrollViewVitalityController *)self estimatedScrollEndDate];
  BOOL v11 = [(ISScrollViewVitalityController *)self hasTargetContentOffset];
  id v12 = [(ISScrollViewVitalityController *)self _playerViews];
  v13 = [v12 allObjects];

  if ([(ISScrollViewVitalityController *)self canPerformVitality]) {
    BOOL v14 = [(ISScrollViewVitalityController *)self isEnabled];
  }
  else {
    BOOL v14 = 0;
  }
  id v15 = [(ISScrollViewVitalityController *)self visibilityOffsetHelper];
  [v15 setDirection:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke;
  v18[3] = &unk_1E6BECBA8;
  BOOL v22 = v14;
  id v19 = v13;
  __int16 v20 = self;
  BOOL v23 = v11;
  id v21 = v10;
  BOOL v24 = v4;
  BOOL v25 = v5;
  id v16 = v10;
  id v17 = v13;
  objc_msgSend(v15, "computeVisibilityOffsetsInScrollView:withTargetContentOffset:usingBlock:", v3, v18, v7, v9);
}

uint64_t __56__ISScrollViewVitalityController__updateVitalityFilters__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisible:*(unsigned __int8 *)(a1 + 64)];
  [*(id *)(a1 + 32) setVisibilityOffset:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) setHasTargetVisibilityOffset:*(unsigned __int8 *)(a1 + 65)];
  [*(id *)(a1 + 32) setTargetVisibilityOffset:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setEstimatedScrollEndDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setScrolling:*(unsigned __int8 *)(a1 + 66)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 67);

  return [v2 setDecelerating:v3];
}

- (id)_newVitalityFilter
{
  v2 = +[ISVitalitySettings sharedInstance];
  uint64_t v3 = [v2 oneUpSettings];

  BOOL v4 = [(ISLivePhotoVitalityFilter *)[ISLivePhotoAutoplayVitalityFilter alloc] initWithSettings:v3];
  return v4;
}

- (void)canPerformVitalityDidChange
{
}

- (void)setEstimatedScrollEndDate:(id)a3
{
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (void)setHasTargetContentOffset:(BOOL)a3
{
  self->_hasTargetContentOffset = a3;
}

- (void)setDecelerating:(BOOL)a3
{
  self->_decelerating = a3;
}

- (void)performChanges:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  BOOL v4 = [(ISScrollViewVitalityController *)self _isPerformingChanges];
  [(ISScrollViewVitalityController *)self _setPerformingChanges:1];
  if (v5) {
    v5[2](v5);
  }
  [(ISScrollViewVitalityController *)self _setPerformingChanges:v4];
  if (!v4) {
    [(ISScrollViewVitalityController *)self _updateVitalityFilters];
  }
}

- (void)didLayoutPlayerViews
{
}

- (void)removePlayerView:(id)a3
{
  id v4 = a3;
  id v5 = [(ISScrollViewVitalityController *)self _playerViews];
  [v5 removeObject:v4];
}

- (void)addPlayerView:(id)a3
{
  id v4 = a3;
  id v5 = [(ISScrollViewVitalityController *)self _playerViews];
  [v5 addObject:v4];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __45__ISScrollViewVitalityController_setEnabled___block_invoke;
    v3[3] = &unk_1E6BED088;
    v3[4] = self;
    BOOL v4 = a3;
    [(ISScrollViewVitalityController *)self performChanges:v3];
  }
}

uint64_t __45__ISScrollViewVitalityController_setEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

@end
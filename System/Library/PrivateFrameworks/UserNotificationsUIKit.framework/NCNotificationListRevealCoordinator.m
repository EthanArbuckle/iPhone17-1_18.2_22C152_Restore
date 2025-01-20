@interface NCNotificationListRevealCoordinator
- (BOOL)_isRevealSectionVisibleForListView:(id)a3;
- (BOOL)_revealSectionHasContent;
- (BOOL)_shouldAllowNotificationListReveal;
- (BOOL)_shouldAllowNotificationListRevealTransition;
- (BOOL)isForceRevealed;
- (BOOL)isHapticPrepared;
- (BOOL)isSectionRevealed;
- (BOOL)isSectionRevealedStateLocked;
- (BOOL)shouldLimitTargetContentOffsetForNotificationListReveal;
- (NCNotificationListRevealCoordinatorDelegate)delegate;
- (NSArray)subLists;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (double)_settlingYPositionForReveal;
- (double)_updateRevealPercentageForNotificationListView:(id)a3;
- (double)interactionTranslation;
- (double)revealPercentage;
- (id)_revealListView;
- (id)_stringForRevealState:(int)a3;
- (int)revealState;
- (unint64_t)indexForReveal;
- (void)_performHaptic;
- (void)_performRevealForSubviewsIfNecessary;
- (void)_prepareHaptic;
- (void)_refetchSubListViews;
- (void)_releaseHaptic;
- (void)notificationListDidScroll:(id)a3;
- (void)notificationListViewDidEndDecelerating:(id)a3;
- (void)notificationListViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)notificationListViewWillEndDragging:(id)a3 withTargetContentOffset:(CGPoint *)a4;
- (void)notificationListWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setForceRevealed:(BOOL)a3;
- (void)setHapticPrepared:(BOOL)a3;
- (void)setIndexForReveal:(unint64_t)a3;
- (void)setInteractionTranslation:(double)a3;
- (void)setRevealPercentage:(double)a3;
- (void)setRevealState:(int)a3;
- (void)setSectionRevealed:(BOOL)a3;
- (void)setSectionRevealedStateLocked:(BOOL)a3;
- (void)setShouldLimitTargetContentOffsetForNotificationListReveal:(BOOL)a3;
- (void)setSubLists:(id)a3;
@end

@implementation NCNotificationListRevealCoordinator

- (void)notificationListWillBeginDragging:(id)a3
{
  id v6 = a3;
  [(NCNotificationListRevealCoordinator *)self _refetchSubListViews];
  [v6 setActiveRevealTransitioning:0];
  int v4 = [(NCNotificationListRevealCoordinator *)self revealState];
  if (v4 == 2)
  {
    [(NCNotificationListRevealCoordinator *)self setSectionRevealedStateLocked:1];
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    if ([(NCNotificationListRevealCoordinator *)self _isRevealSectionVisibleForListView:v6]&& [(NCNotificationListRevealCoordinator *)self _shouldAllowNotificationListReveal])
    {
      goto LABEL_10;
    }
    [(NCNotificationListRevealCoordinator *)self setRevealState:0];
  }
  else if (!v4 {
         && [(NCNotificationListRevealCoordinator *)self _isRevealSectionVisibleForListView:v6]&& [(NCNotificationListRevealCoordinator *)self _shouldAllowNotificationListReveal])
  }
  {
    [(NCNotificationListRevealCoordinator *)self setRevealState:1];
LABEL_10:
    [v6 setActiveRevealTransitioning:1];
  }
LABEL_12:
  [(NCNotificationListRevealCoordinator *)self setShouldLimitTargetContentOffsetForNotificationListReveal:0];
  v5 = [(NCNotificationListRevealCoordinator *)self _revealListView];
  [v5 setActiveRevealTransitioning:0];
  [v5 setRevealTransitionScrolling:0];
  [v5 setListRevealTargetContentOffsetClamped:0];
  [v6 setNeedsLayout];
}

- (void)notificationListDidScroll:(id)a3
{
  id v14 = a3;
  [v14 contentOffset];
  double v5 = v4;
  if ([(NCNotificationListRevealCoordinator *)self shouldLimitTargetContentOffsetForNotificationListReveal])
  {
    if (([v14 isTracking] & 1) == 0)
    {
      [(NCNotificationListRevealCoordinator *)self _settlingYPositionForReveal];
      if (v5 > v6) {
        objc_msgSend(v14, "setContentOffset:", 0.0, v6);
      }
    }
  }
  double v7 = 0.0;
  if ([(NCNotificationListRevealCoordinator *)self _shouldAllowNotificationListReveal])
  {
    if ([(NCNotificationListRevealCoordinator *)self revealState] != 2
      || ![(NCNotificationListRevealCoordinator *)self isSectionRevealedStateLocked])
    {
      [(NCNotificationListRevealCoordinator *)self _updateRevealPercentageForNotificationListView:v14];
      double v7 = v8;
      if (v8 <= 0.6) {
        [(NCNotificationListRevealCoordinator *)self _releaseHaptic];
      }
      else {
        [(NCNotificationListRevealCoordinator *)self _prepareHaptic];
      }
    }
    if ([(NCNotificationListRevealCoordinator *)self revealState] != 2) {
      [(NCNotificationListRevealCoordinator *)self _performRevealForSubviewsIfNecessary];
    }
  }
  v9 = [(NCNotificationListRevealCoordinator *)self delegate];
  int v10 = [(NCNotificationListRevealCoordinator *)self revealState];
  if (v10 == 2)
  {
    if ([(NCNotificationListRevealCoordinator *)self isSectionRevealed]
      && ![(NCNotificationListRevealCoordinator *)self isSectionRevealedStateLocked]
      && (int v12 = [v14 isDragging], v7 < 1.0)
      && v12)
    {
      [(NCNotificationListRevealCoordinator *)self setSectionRevealed:0];
      [(NCNotificationListRevealCoordinator *)self setRevealState:1];
      [(NCNotificationListRevealCoordinator *)self setShouldLimitTargetContentOffsetForNotificationListReveal:0];
      [v14 setActiveRevealTransitioning:1];
      [(NCNotificationListRevealCoordinator *)self _performHaptic];
    }
    else if ([(NCNotificationListRevealCoordinator *)self isSectionRevealedStateLocked])
    {
      [(NCNotificationListRevealCoordinator *)self _releaseHaptic];
    }
  }
  else if (v10 == 1)
  {
    [v9 notificationListRevealCoordinator:self updatedRevealPercentage:v7];
    if (v7 >= 1.0
      && [(NCNotificationListRevealCoordinator *)self _revealSectionHasContent]
      && [(NCNotificationListRevealCoordinator *)self _shouldAllowNotificationListRevealTransition])
    {
      [(NCNotificationListRevealCoordinator *)self setSectionRevealed:1];
      [(NCNotificationListRevealCoordinator *)self setRevealState:2];
      [(NCNotificationListRevealCoordinator *)self setShouldLimitTargetContentOffsetForNotificationListReveal:1];
      [v14 setActiveRevealTransitioning:1];
      v11 = [(NCNotificationListRevealCoordinator *)self _revealListView];
      [v11 setActiveRevealTransitioning:1];
      [v11 setRevealTransitionScrolling:1];
      [(NCNotificationListRevealCoordinator *)self _performHaptic];
      [v9 revealCoordinatorDidScrollToReveal:self];
    }
    [v14 setActiveRevealTransitioning:1];
  }
  if (([v14 isTracking] & 1) == 0)
  {
    [v14 setActiveRevealTransitioning:0];
    v13 = [(NCNotificationListRevealCoordinator *)self _revealListView];
    [v13 setActiveRevealTransitioning:0];
  }
}

- (void)notificationListViewWillEndDragging:(id)a3 withTargetContentOffset:(CGPoint *)a4
{
  id v14 = a3;
  if ([(NCNotificationListRevealCoordinator *)self shouldLimitTargetContentOffsetForNotificationListReveal])
  {
    [(NCNotificationListRevealCoordinator *)self _settlingYPositionForReveal];
    double y = a4->y;
    if (y > v6)
    {
      a4->x = 0.0;
      a4->double y = v6;
      double v8 = [(NCNotificationListRevealCoordinator *)self _revealListView];
      v9 = v8;
      uint64_t v10 = 0;
LABEL_6:
      [v8 setListRevealTargetContentOffsetClamped:v10];

      goto LABEL_7;
    }
    [v14 contentInset];
    if (y == -v11)
    {
      double v8 = [(NCNotificationListRevealCoordinator *)self _revealListView];
      v9 = v8;
      uint64_t v10 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  if (![(NCNotificationListRevealCoordinator *)self isSectionRevealedStateLocked]
    && [(NCNotificationListRevealCoordinator *)self revealState] == 2)
  {
    int v12 = +[NCNotificationEventTracker sharedInstance];
    [v12 notificationCenterAppeared];

    [(NCNotificationListRevealCoordinator *)self setSectionRevealedStateLocked:1];
  }
  if ([(NCNotificationListRevealCoordinator *)self revealState] != 2)
  {
    [(NCNotificationListRevealCoordinator *)self setRevealPercentage:0.0];
    [(NCNotificationListRevealCoordinator *)self _performRevealForSubviewsIfNecessary];
  }
  [v14 setActiveRevealTransitioning:0];
  v13 = [(NCNotificationListRevealCoordinator *)self _revealListView];
  [v13 setActiveRevealTransitioning:0];

  [v14 setNeedsLayout];
}

- (void)notificationListViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if ([(NCNotificationListRevealCoordinator *)self revealState] != 2)
  {
    [(NCNotificationListRevealCoordinator *)self setRevealState:0];
    [(NCNotificationListRevealCoordinator *)self setRevealPercentage:0.0];
    [(NCNotificationListRevealCoordinator *)self _performRevealForSubviewsIfNecessary];
  }
  if (!a4)
  {
    double v6 = [(NCNotificationListRevealCoordinator *)self _revealListView];
    int v7 = [v6 isRevealTransitionScrolling];

    if (v7)
    {
      id v8 = [(NCNotificationListRevealCoordinator *)self _revealListView];
      [v8 setRevealTransitionScrolling:0];
    }
  }
}

- (void)notificationListViewDidEndDecelerating:(id)a3
{
  if ([(NCNotificationListRevealCoordinator *)self revealState] != 2)
  {
    [(NCNotificationListRevealCoordinator *)self setRevealState:0];
    [(NCNotificationListRevealCoordinator *)self setRevealPercentage:0.0];
    [(NCNotificationListRevealCoordinator *)self _performRevealForSubviewsIfNecessary];
  }
  id v4 = [(NCNotificationListRevealCoordinator *)self _revealListView];
  [v4 setRevealTransitionScrolling:0];
}

- (void)setRevealState:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_revealState != a3)
  {
    uint64_t v3 = *(void *)&a3;
    double v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      double v6 = v5;
      int v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = [(NCNotificationListRevealCoordinator *)self _stringForRevealState:self->_revealState];
      uint64_t v10 = [(NCNotificationListRevealCoordinator *)self _stringForRevealState:v3];
      int v12 = 138543874;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting notification list history reveal state from %@ to %@", (uint8_t *)&v12, 0x20u);
    }
    self->_revealState = v3;
    +[NCListDebugHUDModelBridge plotProperty:@"reveal state" label:0 inListView:(double)v3];
    double v11 = [(NCNotificationListRevealCoordinator *)self delegate];
    [v11 notificationListRevealCoordinator:self updatedRevealState:v3 == 2];
  }
}

- (void)setForceRevealed:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[NCNotificationEventTracker sharedInstance];
  double v6 = v5;
  if (v3)
  {
    [v5 notificationCenterAppeared];
    uint64_t v7 = 2;
    double v8 = 1.0;
  }
  else
  {
    [v5 notificationCenterDisappeared];
    uint64_t v7 = 0;
    double v8 = 0.0;
  }

  [(NCNotificationListRevealCoordinator *)self _refetchSubListViews];
  [(NCNotificationListRevealCoordinator *)self setRevealState:v7];
  [(NCNotificationListRevealCoordinator *)self setRevealPercentage:v8];
  [(NCNotificationListRevealCoordinator *)self setSectionRevealedStateLocked:v3];
  [(NCNotificationListRevealCoordinator *)self _releaseHaptic];

  [(NCNotificationListRevealCoordinator *)self _performRevealForSubviewsIfNecessary];
}

- (void)setSectionRevealedStateLocked:(BOOL)a3
{
  self->_sectionRevealedStateLocked = a3;
}

- (void)_refetchSubListViews
{
  id v5 = [(NCNotificationListRevealCoordinator *)self delegate];
  BOOL v3 = [v5 subListsForNotificationListRevealCoordinator:self];
  subLists = self->_subLists;
  self->_subLists = v3;
}

- (BOOL)_shouldAllowNotificationListReveal
{
  v2 = self;
  BOOL v3 = [(NCNotificationListRevealCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListRevealCoordinatorShouldAllowReveal:v2];

  return (char)v2;
}

- (BOOL)_shouldAllowNotificationListRevealTransition
{
  v2 = self;
  BOOL v3 = [(NCNotificationListRevealCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListRevealCoordinatorShouldAllowRevealTransition:v2];

  return (char)v2;
}

- (BOOL)_revealSectionHasContent
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  BOOL v3 = [(NCNotificationListRevealCoordinator *)self subLists];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__NCNotificationListRevealCoordinator__revealSectionHasContent__block_invoke;
  v5[3] = &unk_1E6A93DF0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = v7[3] > 0.0;
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__NCNotificationListRevealCoordinator__revealSectionHasContent__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) indexForReveal] <= a3)
  {
    [v5 frame];
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetHeight(v7)
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                             + 24);
  }
}

- (BOOL)_isRevealSectionVisibleForListView:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListRevealCoordinator *)self _revealListView];
  id v6 = [v5 superview];
  if (v6 == v4)
  {
    [v5 frame];
    double MinY = CGRectGetMinY(v12);
    [v4 contentOffset];
    double v10 = v9;
    [v4 frame];
    BOOL v7 = MinY < v10 + CGRectGetHeight(v13);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)_settlingYPositionForReveal
{
  v2 = [(NCNotificationListRevealCoordinator *)self _revealListView];
  [v2 frame];
  double v3 = CGRectGetMinY(v5) + -40.0;

  return v3;
}

- (double)_updateRevealPercentageForNotificationListView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListRevealCoordinator *)self indexForReveal] - 1;
  if (v5 < 0
    || ([(NCNotificationListRevealCoordinator *)self subLists],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v5 >= v7))
  {
    v28 = (void *)*MEMORY[0x1E4FB3778];
    double v29 = 1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationListRevealCoordinator *)v28 _updateRevealPercentageForNotificationListView:v5];
    }
  }
  else
  {
    uint64_t v8 = [(NCNotificationListRevealCoordinator *)self subLists];
    double v9 = [v8 objectAtIndex:v5];

    double v10 = [(NCNotificationListRevealCoordinator *)self _revealListView];
    [v9 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [v4 contentInset];
    double v20 = v19;
    v37.origin.x = v12;
    v37.origin.double y = v14;
    v37.size.width = v16;
    v37.size.height = v18;
    double MaxY = CGRectGetMaxY(v37);
    [v4 frame];
    double Height = CGRectGetHeight(v38);
    [v4 contentOffset];
    double v24 = v23;
    [v4 contentOffset];
    if (MaxY >= Height - v20)
    {
      double v30 = Height + v25;
      [v10 frame];
      double v26 = v30 - CGRectGetMinY(v39);
      double v27 = 200.0;
    }
    else
    {
      double v26 = v20 + v24;
      double v27 = 75.0;
    }
    double v31 = v26 / v27;
    [(NCNotificationListRevealCoordinator *)self interactionTranslation];
    if (v32 > 0.0)
    {
      [(NCNotificationListRevealCoordinator *)self interactionTranslation];
      double v34 = v33 / 75.0;
      if (v34 >= v31) {
        double v31 = v34;
      }
    }
    double v35 = 1.0;
    if (v31 <= 1.0) {
      double v35 = v31;
    }
    if (v35 >= 0.0) {
      double v29 = v35;
    }
    else {
      double v29 = 0.0;
    }
    if (self->_revealPercentage != v29) {
      self->_revealPercentage = v29;
    }
  }
  return v29;
}

- (id)_revealListView
{
  double v3 = [(NCNotificationListRevealCoordinator *)self subLists];
  unint64_t v4 = [v3 count];
  if (v4 >= [(NCNotificationListRevealCoordinator *)self indexForReveal] + 1)
  {
    uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", -[NCNotificationListRevealCoordinator indexForReveal](self, "indexForReveal"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_performRevealForSubviewsIfNecessary
{
  id v15 = [(NCNotificationListRevealCoordinator *)self subLists];
  double v3 = [v15 objectAtIndex:0];
  unint64_t v4 = [v15 count];
  [(NCNotificationListRevealCoordinator *)self revealPercentage];
  double v6 = v5;
  BOOL v7 = v5 >= 1.0 && [(NCNotificationListRevealCoordinator *)self revealState] != 0;
  unint64_t v8 = [(NCNotificationListRevealCoordinator *)self indexForReveal];
  if (v8 < v4)
  {
    unint64_t v9 = v8;
    uint64_t v10 = 0;
    do
    {
      double v11 = [v15 objectAtIndex:v9];
      CGFloat v12 = v11;
      if (v3 && v11)
      {
        [v11 setRevealPercentage:v6 / (double)(unint64_t)(v10 + 1)];
        [v12 setRevealed:v7];
        [v12 setLeadingRevealView:v10 == 0];
        [v12 setRevealIndexOffset:v10];
        [v12 setNeedsLayout];
        if ([v12 isGrouped])
        {
          uint64_t v13 = 2;
        }
        else
        {
          uint64_t v14 = [v12 count];
          if (v14) {
            uint64_t v13 = v14 + 1;
          }
          else {
            uint64_t v13 = 0;
          }
        }
        v10 += v13;
      }

      ++v9;
    }
    while (v4 != v9);
  }
}

- (id)_stringForRevealState:(int)a3
{
  double v3 = @"DEACTIVATED";
  if (a3 == 1) {
    double v3 = @"ACTIVATED";
  }
  if (a3 == 2) {
    return @"TRIGGERED";
  }
  else {
    return v3;
  }
}

- (void)_prepareHaptic
{
  if (![(NCNotificationListRevealCoordinator *)self isHapticPrepared])
  {
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      unint64_t v4 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
      double v5 = self->_feedbackGenerator;
      self->_feedbackGenerator = v4;

      feedbackGenerator = self->_feedbackGenerator;
    }
    [(UIImpactFeedbackGenerator *)feedbackGenerator prepare];
    [(NCNotificationListRevealCoordinator *)self setHapticPrepared:1];
  }
}

- (void)_releaseHaptic
{
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

  [(NCNotificationListRevealCoordinator *)self setHapticPrepared:0];
}

- (void)_performHaptic
{
}

- (NCNotificationListRevealCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListRevealCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isForceRevealed
{
  return self->_forceRevealed;
}

- (unint64_t)indexForReveal
{
  return self->_indexForReveal;
}

- (void)setIndexForReveal:(unint64_t)a3
{
  self->_indexForReveal = a3;
}

- (NSArray)subLists
{
  return self->_subLists;
}

- (void)setSubLists:(id)a3
{
}

- (double)interactionTranslation
{
  return self->_interactionTranslation;
}

- (void)setInteractionTranslation:(double)a3
{
  self->_interactionTranslation = a3;
}

- (int)revealState
{
  return self->_revealState;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (void)setRevealPercentage:(double)a3
{
  self->_revealPercentage = a3;
}

- (BOOL)isSectionRevealed
{
  return self->_sectionRevealed;
}

- (void)setSectionRevealed:(BOOL)a3
{
  self->_sectionRevealed = a3;
}

- (BOOL)isSectionRevealedStateLocked
{
  return self->_sectionRevealedStateLocked;
}

- (BOOL)shouldLimitTargetContentOffsetForNotificationListReveal
{
  return self->_shouldLimitTargetContentOffsetForNotificationListReveal;
}

- (void)setShouldLimitTargetContentOffsetForNotificationListReveal:(BOOL)a3
{
  self->_shouldLimitTargetContentOffsetForNotificationListReveal = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)isHapticPrepared
{
  return self->_hapticPrepared;
}

- (void)setHapticPrepared:(BOOL)a3
{
  self->_hapticPrepared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_subLists, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updateRevealPercentageForNotificationListView:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v5 = a1;
  double v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  unint64_t v8 = [a2 subLists];
  int v9 = 138543874;
  uint64_t v10 = v7;
  __int16 v11 = 2050;
  uint64_t v12 = a3;
  __int16 v13 = 2050;
  uint64_t v14 = [v8 count];
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "%{public}@ The top view index, '%{public}lu,' is out of bounds. Sublists size: %{public}lu", (uint8_t *)&v9, 0x20u);
}

@end
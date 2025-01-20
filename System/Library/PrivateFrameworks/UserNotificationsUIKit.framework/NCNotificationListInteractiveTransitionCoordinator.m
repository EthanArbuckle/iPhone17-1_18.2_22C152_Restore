@interface NCNotificationListInteractiveTransitionCoordinator
- (BOOL)_isCurrentDigestVisible;
- (BOOL)_isHiddenListRevealed;
- (BOOL)_isHighlightVisible;
- (BOOL)_isPersistentSettingTransitionForGestureRecognizer:(id)a3;
- (BOOL)_isScrollingListContent;
- (BOOL)_shouldAllowExpandInteractiveTranslation;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isHapticPrepared;
- (BOOL)isPanGestureRecognizerActive;
- (BOOL)isPerformingExclusiveScrollInteractiveTranslation;
- (BOOL)shouldPerformInteractiveCollapseTransition;
- (BOOL)shouldPerformInteractiveExpandTransition;
- (NCNotificationListInteractiveTransitionCoordinator)initWithParentListView:(id)a3 interactiveListView:(id)a4 revealListView:(id)a5;
- (NCNotificationListInteractiveTransitionCoordinatorDelegate)delegate;
- (NCNotificationListView)interactiveListView;
- (NCNotificationListView)parentListView;
- (NCNotificationListView)revealListView;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIPanGestureRecognizer)interactiveTransitionPanGestureRecognizer;
- (UIPinchGestureRecognizer)interactiveTransitionPinchGestureRecognizer;
- (double)_bottomPositionForInteractiveListView;
- (double)_interactionTranslationFocalPointYForGestureRecognizer:(id)a3;
- (double)_interactionTranslationPercentageForGestureRecognizer:(id)a3;
- (double)_interactionTranslationVelocityForGestureRecognizer:(id)a3;
- (id)_stringForReason:(int64_t)a3;
- (int64_t)_interactionTranslationReasonForGestureRecognizer:(id)a3;
- (int64_t)currentListDisplayStyleSetting;
- (unint64_t)_countForInteractiveListView;
- (unint64_t)_indexForInteractiveListView;
- (void)_gestureRecognizerDidRecognize:(id)a3;
- (void)_migrateProminentNotificationsForHiddenSetting;
- (void)_performHapticForListDisplayStyleTransition;
- (void)_prepareHapticForListDisplayStyleTransition;
- (void)_releaseHapticForListDisplayStyleTransition;
- (void)_updateListDisplayStyleSetting:(int64_t)a3 isPersistentSetting:(BOOL)a4 hideRevealedList:(BOOL)a5;
- (void)_updateNotificationListForInteractionTranslationPercentage:(double)a3 interactionTranslationVelocity:(double)a4 interactionTranslationFocalPointY:(double)a5 isPersistentSetting:(BOOL)a6 isIntentionalInteraction:(BOOL)a7 forReason:(int64_t)a8;
- (void)interactiveTranslationDidEnd;
- (void)interactiveTranslationWillBegin;
- (void)setCurrentListDisplayStyleSetting:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHapticPrepared:(BOOL)a3;
- (void)setInteractiveListView:(id)a3;
- (void)setInteractiveTransitionPanGestureRecognizer:(id)a3;
- (void)setInteractiveTransitionPinchGestureRecognizer:(id)a3;
- (void)setParentListView:(id)a3;
- (void)setRevealListView:(id)a3;
- (void)setShouldPerformInteractiveCollapseTransition:(BOOL)a3;
- (void)setShouldPerformInteractiveExpandTransition:(BOOL)a3;
- (void)updateScrollInteractiveTranslation;
@end

@implementation NCNotificationListInteractiveTransitionCoordinator

- (NCNotificationListInteractiveTransitionCoordinator)initWithParentListView:(id)a3 interactiveListView:(id)a4 revealListView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationListInteractiveTransitionCoordinator;
  v11 = [(NCNotificationListInteractiveTransitionCoordinator *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_parentListView, v8);
    objc_storeWeak((id *)&v12->_interactiveListView, v9);
    objc_storeWeak((id *)&v12->_revealListView, v10);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:v12 action:sel__gestureRecognizerDidRecognize_];
    interactiveTransitionPinchGestureRecognizer = v12->_interactiveTransitionPinchGestureRecognizer;
    v12->_interactiveTransitionPinchGestureRecognizer = (UIPinchGestureRecognizer *)v13;

    [v8 addGestureRecognizer:v12->_interactiveTransitionPinchGestureRecognizer];
    [(UIPinchGestureRecognizer *)v12->_interactiveTransitionPinchGestureRecognizer setEnabled:0];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v12 action:sel__gestureRecognizerDidRecognize_];
    interactiveTransitionPanGestureRecognizer = v12->_interactiveTransitionPanGestureRecognizer;
    v12->_interactiveTransitionPanGestureRecognizer = (UIPanGestureRecognizer *)v15;

    [(UIPanGestureRecognizer *)v12->_interactiveTransitionPanGestureRecognizer setDelegate:v12];
    [v8 addGestureRecognizer:v12->_interactiveTransitionPanGestureRecognizer];
    v17 = [v8 panGestureRecognizer];
    [v17 requireGestureRecognizerToFail:v12->_interactiveTransitionPanGestureRecognizer];
  }
  return v12;
}

- (BOOL)isPerformingExclusiveScrollInteractiveTranslation
{
  unint64_t v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self _countForInteractiveListView];
  if ([(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting] == 1&& v3 > 1)
  {
    return 1;
  }
  if ([(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting] != 2)return 0; {
  if (v3)
  }
    return 1;

  return [(NCNotificationListInteractiveTransitionCoordinator *)self _isCurrentDigestVisible];
}

- (void)updateScrollInteractiveTranslation
{
  id v12 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
  [v12 contentOffset];
  double v4 = v3;
  [v12 contentInset];
  double v6 = (v4 + v5) / 100.0;
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  double v7 = fmax(v6, -1.0);
  id v8 = [v12 panGestureRecognizer];
  [v8 velocityInView:v12];
  double v10 = v9;

  self->_shouldPerformInteractiveExpandTransition = [(NCNotificationListInteractiveTransitionCoordinator *)self _shouldAllowExpandInteractiveTranslation];
  [(NCNotificationListInteractiveTransitionCoordinator *)self _bottomPositionForInteractiveListView];
  [(NCNotificationListInteractiveTransitionCoordinator *)self _updateNotificationListForInteractionTranslationPercentage:0 interactionTranslationVelocity:[(NCNotificationListInteractiveTransitionCoordinator *)self _isScrollingListContent] interactionTranslationFocalPointY:0 isPersistentSetting:v7 isIntentionalInteraction:v10 forReason:v11];
}

- (void)interactiveTranslationWillBegin
{
  self->_shouldPerformInteractiveCollapseTransition = 1;
  self->_shouldPerformInteractiveExpandTransition = [(NCNotificationListInteractiveTransitionCoordinator *)self _shouldAllowExpandInteractiveTranslation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_revealListView);
  [WeakRetained setListRevealTargetContentOffsetClamped:0];
}

- (void)interactiveTranslationDidEnd
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveListView);
  [WeakRetained setInteractionTranslationPercentage:0.0];

  id v4 = objc_loadWeakRetained((id *)&self->_parentListView);
  [v4 setInteractionTranslation:0.0];

  id v5 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  objc_msgSend(v5, "notificationListInteractiveTransitionCoordinator:didUpdateScrollTranslation:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (BOOL)isPanGestureRecognizerActive
{
  uint64_t v2 = [(UIPanGestureRecognizer *)self->_interactiveTransitionPanGestureRecognizer state];
  return v2 == 2 || (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (UIPanGestureRecognizer *)a3;
  if (self->_interactiveTransitionPanGestureRecognizer == v4)
  {
    double v6 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
    [(UIPanGestureRecognizer *)v4 velocityInView:v6];
    double v8 = v7;
    [(UIPanGestureRecognizer *)v4 velocityInView:v6];
    if (fabs(v8) <= fabs(v9))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      [v6 contentOffset];
      [v6 contentInset];
      if (BSFloatApproximatelyEqualToFloat()) {
        int v10 = 1;
      }
      else {
        int v10 = BSFloatLessThanFloat();
      }
      if ([(NCNotificationListInteractiveTransitionCoordinator *)self _countForInteractiveListView]|| [(NCNotificationListInteractiveTransitionCoordinator *)self _isCurrentDigestVisible])
      {
        int v11 = 0;
      }
      else
      {
        int v11 = ![(NCNotificationListInteractiveTransitionCoordinator *)self _isHiddenListRevealed];
      }
      id v12 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
      [(UIPanGestureRecognizer *)v4 locationInView:v12];
      double v14 = v13;

      BOOL v15 = [(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting] != 2;
      if (v8 <= 0.0) {
        int v10 = 0;
      }
      int v16 = v15 & ~v11 & v10;
      if (v14 >= 0.0) {
        int v17 = v16;
      }
      else {
        int v17 = 0;
      }
      if ([(NCNotificationListInteractiveTransitionCoordinator *)self isPerformingExclusiveScrollInteractiveTranslation])
      {
        BOOL v18 = [(NCNotificationListInteractiveTransitionCoordinator *)self _shouldAllowExpandInteractiveTranslation];
        BOOL v19 = v8 < 0.0 && v18;
      }
      else
      {
        BOOL v19 = 0;
      }
      if ([(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting])
      {
        int v20 = 0;
      }
      else
      {
        int v21 = [(NCNotificationListInteractiveTransitionCoordinator *)self _isHiddenListRevealed] & ~v11 & v10;
        if (v14 >= 0.0) {
          int v20 = v21;
        }
        else {
          int v20 = 0;
        }
      }
      if (v20) {
        int v5 = 0;
      }
      else {
        int v5 = v17 | v19;
      }
      v22 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 67109888;
        v24[1] = v5;
        __int16 v25 = 1024;
        int v26 = v20;
        __int16 v27 = 1024;
        int v28 = v17;
        __int16 v29 = 1024;
        BOOL v30 = v19;
        _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "Interactive transition coordinator should begin pan gesture = %{BOOL}d [ shouldDriveByScrollViewWhenDismissNC:%{BOOL}d shouldCollapse:%{BOOL}d ; shouldExpand:%{BOOL}d ]",
          (uint8_t *)v24,
          0x1Au);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_gestureRecognizerDidRecognize:(id)a3
{
  BOOL v18 = (UIPanGestureRecognizer *)a3;
  BOOL v4 = [(NCNotificationListInteractiveTransitionCoordinator *)self _isPersistentSettingTransitionForGestureRecognizer:v18];
  uint64_t v5 = [(UIPanGestureRecognizer *)v18 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveTranslationDidEnd];
    if (v4) {
      [(NCNotificationListInteractiveTransitionCoordinator *)self _releaseHapticForListDisplayStyleTransition];
    }
  }
  else if (v5 == 2)
  {
    [(NCNotificationListInteractiveTransitionCoordinator *)self _interactionTranslationPercentageForGestureRecognizer:v18];
    double v7 = v6;
    int64_t v8 = [(NCNotificationListInteractiveTransitionCoordinator *)self _interactionTranslationReasonForGestureRecognizer:v18];
    [(NCNotificationListInteractiveTransitionCoordinator *)self _interactionTranslationVelocityForGestureRecognizer:v18];
    double v10 = v9;
    [(NCNotificationListInteractiveTransitionCoordinator *)self _interactionTranslationFocalPointYForGestureRecognizer:v18];
    [(NCNotificationListInteractiveTransitionCoordinator *)self _updateNotificationListForInteractionTranslationPercentage:v4 interactionTranslationVelocity:1 interactionTranslationFocalPointY:v8 isPersistentSetting:v7 isIntentionalInteraction:v10 forReason:v11];
    if (self->_interactiveTransitionPanGestureRecognizer == v18)
    {
      id v12 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
      [(UIPanGestureRecognizer *)v18 translationInView:v12];
      double v14 = v13;
      double v16 = v15;

      int v17 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
      objc_msgSend(v17, "notificationListInteractiveTransitionCoordinator:didUpdateScrollTranslation:", self, v14, v16);
    }
  }
  else if (v5 == 1)
  {
    if (v4) {
      [(NCNotificationListInteractiveTransitionCoordinator *)self _prepareHapticForListDisplayStyleTransition];
    }
    [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveTranslationWillBegin];
  }
}

- (BOOL)_isPersistentSettingTransitionForGestureRecognizer:(id)a3
{
  return self->_interactiveTransitionPinchGestureRecognizer == a3;
}

- (double)_interactionTranslationPercentageForGestureRecognizer:(id)a3
{
  BOOL v4 = (UIPanGestureRecognizer *)a3;
  uint64_t v5 = v4;
  if ((UIPanGestureRecognizer *)self->_interactiveTransitionPinchGestureRecognizer == v4)
  {
    [(UIPanGestureRecognizer *)v4 scale];
    double v10 = v9 + -1.0;
    if (v10 > 1.0) {
      double v10 = 1.0;
    }
    double v6 = fmax(v10, -1.0);
  }
  else
  {
    double v6 = 0.0;
    if (self->_interactiveTransitionPanGestureRecognizer == v4)
    {
      double v7 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
      [(UIPanGestureRecognizer *)v5 translationInView:v7];
      double v6 = v8 / -100.0;
    }
  }

  return v6;
}

- (int64_t)_interactionTranslationReasonForGestureRecognizer:(id)a3
{
  if (self->_interactiveTransitionPinchGestureRecognizer == a3) {
    return 2;
  }
  if (self->_interactiveTransitionPanGestureRecognizer == a3) {
    return 1;
  }
  return -1;
}

- (double)_interactionTranslationVelocityForGestureRecognizer:(id)a3
{
  BOOL v4 = (UIPinchGestureRecognizer *)a3;
  uint64_t v5 = v4;
  if ((UIPinchGestureRecognizer *)self->_interactiveTransitionPanGestureRecognizer == v4)
  {
    double v8 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
    [(UIPinchGestureRecognizer *)v5 velocityInView:v8];
    double v6 = fabs(v9);
  }
  else
  {
    double v6 = 0.0;
    if (self->_interactiveTransitionPinchGestureRecognizer == v4)
    {
      [(UIPinchGestureRecognizer *)v4 velocity];
      double v6 = v7;
    }
  }

  return v6;
}

- (double)_bottomPositionForInteractiveListView
{
  uint64_t v2 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
  [v2 visibleRect];
  double MaxY = CGRectGetMaxY(v5);

  return MaxY;
}

- (double)_interactionTranslationFocalPointYForGestureRecognizer:(id)a3
{
  BOOL v4 = (UIPinchGestureRecognizer *)a3;
  CGRect v5 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
  [(NCNotificationListInteractiveTransitionCoordinator *)self _bottomPositionForInteractiveListView];
  if (self->_interactiveTransitionPinchGestureRecognizer == v4)
  {
    [(UIPinchGestureRecognizer *)v4 locationInView:v5];
    double v7 = v8;
  }
  else
  {
    double v7 = v6;
  }

  return v7;
}

- (void)_updateNotificationListForInteractionTranslationPercentage:(double)a3 interactionTranslationVelocity:(double)a4 interactionTranslationFocalPointY:(double)a5 isPersistentSetting:(BOOL)a6 isIntentionalInteraction:(BOOL)a7 forReason:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int64_t v15 = [(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting];
  unint64_t v16 = [(NCNotificationListInteractiveTransitionCoordinator *)self _countForInteractiveListView];
  uint64_t v17 = [(NCNotificationListInteractiveTransitionCoordinator *)self _isHiddenListRevealed];
  BOOL v18 = [(NCNotificationListInteractiveTransitionCoordinator *)self _isCurrentDigestVisible];
  BOOL v19 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
  int v20 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
  int64_t v21 = [(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting];
  if (v21 == 2)
  {
    if (v16) {
      int v23 = 1;
    }
    else {
      int v23 = v18;
    }
    BOOL v24 = a3 <= 0.4 || v23 == 0;
    if (v24
      || ![(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveExpandTransition])
    {
      if (a3 < -0.4 && v9)
      {
        [(NCNotificationListInteractiveTransitionCoordinator *)self _migrateProminentNotificationsForHiddenSetting];
        goto LABEL_68;
      }
      goto LABEL_67;
    }
    [v19 setInteractionVelocity:a4];
    uint64_t v17 = 0;
    int64_t v15 = [(NCNotificationListInteractiveTransitionCoordinator *)self _isHighlightVisible] ^ 1;
LABEL_54:
    *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 256;
    goto LABEL_68;
  }
  if (v21 != 1)
  {
    if (!v21)
    {
      if (a3 < 0.0 && v9)
      {
        [v19 setInteractionTranslationFocalPointY:a5];
        [v19 setInteractionTranslationPercentage:a3];
        if (a8 == 1) {
          [v20 setInteractionTranslation:a3 * -100.0];
        }
      }
      if (a3 < -0.4
        && [(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveCollapseTransition]&& v9)
      {
        if (v16) {
          int v22 = 1;
        }
        else {
          int v22 = v18;
        }
        if (v22 == 1)
        {
          if (v16 == 1 || !v16 && v18)
          {
            if (v17) {
              int64_t v15 = 1;
            }
            else {
              int64_t v15 = 2;
            }
          }
          else
          {
            int64_t v15 = 1;
          }
          *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 1;
          [v19 setInteractionVelocity:a4];
        }
        [v19 setInteractionTranslationPercentage:0.0];
        [v20 setInteractionTranslation:0.0];
        goto LABEL_68;
      }
    }
LABEL_67:
    uint64_t v17 = 0;
    goto LABEL_68;
  }
  if (v9)
  {
    BOOL v25 = [(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveExpandTransition];
    int v26 = a3 < 0.0 || v25;
    double v27 = 0.0;
    double v28 = a3 >= 0.0 ? a3 : 0.0;
    double v29 = v26 ? a3 : 0.0;
    double v30 = [(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveCollapseTransition]? v29: v28;
    [v19 setInteractionTranslationPercentage:v30];
    if (a8 == 1)
    {
      if (a3 < 0.0)
      {
        if ([(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveCollapseTransition])
        {
          double v27 = a3 * -100.0;
        }
        else
        {
          double v27 = 0.0;
        }
      }
      [v20 setInteractionTranslation:v27];
    }
  }
  if (a3 > 0.4
    && [(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveExpandTransition])
  {
    [v19 setInteractionTranslationPercentage:0.0];
    if (a8 == 1) {
      [v19 setInteractionVelocity:a4];
    }
    uint64_t v17 = 0;
    int64_t v15 = 0;
    goto LABEL_54;
  }
  if (a3 >= -0.4
    || ![(NCNotificationListInteractiveTransitionCoordinator *)self shouldPerformInteractiveCollapseTransition])
  {
    goto LABEL_67;
  }
  if (v16) {
    int v32 = 1;
  }
  else {
    int v32 = v18;
  }
  int v33 = v32 & v9;
  if ((v33 ^ 1 | v17))
  {
    uint64_t v17 = v33 & v17;
  }
  else
  {
    [v19 setInteractionTranslationPercentage:0.0];
    [v20 setInteractionTranslation:0.0];
    if (a8 == 1) {
      [v19 setInteractionVelocity:a4];
    }
    uint64_t v17 = 0;
    *(_WORD *)&self->_shouldPerformInteractiveExpandTransition = 1;
    int64_t v15 = 2;
  }
LABEL_68:
  int64_t v34 = [(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting];
  if (v15 != v34 || v17)
  {
    v35 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v20;
      v44 = v19;
      BOOL v36 = v10;
      v37 = (void *)MEMORY[0x1E4FB3808];
      v38 = v35;
      v39 = [v37 stringForNotificationListDisplayStyleSetting:v15];
      int64_t v40 = a8;
      v41 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationListInteractiveTransitionCoordinator currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      v42 = [(NCNotificationListInteractiveTransitionCoordinator *)self _stringForReason:v40];
      *(_DWORD *)buf = 138544386;
      v46 = v39;
      __int16 v47 = 2114;
      v48 = v41;
      __int16 v49 = 2114;
      v50 = v42;
      __int16 v51 = 1024;
      BOOL v52 = v36;
      __int16 v53 = 1024;
      int v54 = v17;
      _os_log_impl(&dword_1D7C04000, v38, OS_LOG_TYPE_DEFAULT, "Interactive transition coordinator changing list display state to %{public}@ from %{public}@ for %{public}@ [ persistentSetting=%{BOOL}d; hideRevealedList=%{BOOL}d ]",
        buf,
        0x2Cu);

      BOOL v10 = v36;
      int v20 = v43;
      BOOL v19 = v44;
    }
    -[NCNotificationListInteractiveTransitionCoordinator _updateListDisplayStyleSetting:isPersistentSetting:hideRevealedList:](self, "_updateListDisplayStyleSetting:isPersistentSetting:hideRevealedList:", v15, v10, v17, v43, v44);
    if (v15 != v34 && v10) {
      [(NCNotificationListInteractiveTransitionCoordinator *)self _performHapticForListDisplayStyleTransition];
    }
  }
}

- (id)_stringForReason:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3) {
    return &stru_1F2F516F8;
  }
  else {
    return off_1E6A94660[a3 + 1];
  }
}

- (void)_prepareHapticForListDisplayStyleTransition
{
  if (![(NCNotificationListInteractiveTransitionCoordinator *)self isHapticPrepared])
  {
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      BOOL v4 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
      CGRect v5 = self->_feedbackGenerator;
      self->_feedbackGenerator = v4;

      feedbackGenerator = self->_feedbackGenerator;
    }
    [(UIImpactFeedbackGenerator *)feedbackGenerator prepare];
    [(NCNotificationListInteractiveTransitionCoordinator *)self setHapticPrepared:1];
  }
}

- (void)_releaseHapticForListDisplayStyleTransition
{
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

  [(NCNotificationListInteractiveTransitionCoordinator *)self setHapticPrepared:0];
}

- (void)_performHapticForListDisplayStyleTransition
{
}

- (BOOL)_shouldAllowExpandInteractiveTranslation
{
  if ([(NCNotificationListInteractiveTransitionCoordinator *)self currentListDisplayStyleSetting] == 1)
  {
    double v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
    BOOL v4 = [(NCNotificationListInteractiveTransitionCoordinator *)self parentListView];
    unint64_t v5 = [(NCNotificationListInteractiveTransitionCoordinator *)self _indexForInteractiveListView];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = [v4 isRolledUnderView:v3 atIndex:v5] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_updateListDisplayStyleSetting:(int64_t)a3 isPersistentSetting:(BOOL)a4 hideRevealedList:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  [v9 notificationListInteractiveTransitionCoordinator:self didUpdateListDisplaySetting:a3 isPersistentSetting:v6 hideRevealedList:v5];
}

- (unint64_t)_countForInteractiveListView
{
  double v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  BOOL v4 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
  unint64_t v5 = [v3 notificationListInteractiveTransitionCoordinator:self requestsCountForInteractiveListView:v4];

  return v5;
}

- (BOOL)_isHiddenListRevealed
{
  uint64_t v2 = self;
  double v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListInteractiveTransitionCoordinatorRequestsIsHiddenListRevealed:v2];

  return (char)v2;
}

- (BOOL)_isScrollingListContent
{
  uint64_t v2 = self;
  double v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListInteractiveTransitionCoordinatorRequestsIsScrollingListContent:v2];

  return (char)v2;
}

- (void)_migrateProminentNotificationsForHiddenSetting
{
  id v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  [v3 notificationListInteractiveTransitionCoordinatorRequestsMigratingProminentNotificationsForHiddenSetting:self];
}

- (BOOL)_isCurrentDigestVisible
{
  uint64_t v2 = self;
  id v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListInteractiveTransitionCoordinatorRequestsIsCurrentDigestVisible:v2];

  return (char)v2;
}

- (unint64_t)_indexForInteractiveListView
{
  id v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  BOOL v4 = [(NCNotificationListInteractiveTransitionCoordinator *)self interactiveListView];
  unint64_t v5 = [v3 notificationListInteractiveTransitionCoordinator:self requestsIndexForInteractiveListView:v4];

  return v5;
}

- (BOOL)_isHighlightVisible
{
  uint64_t v2 = self;
  id v3 = [(NCNotificationListInteractiveTransitionCoordinator *)self delegate];
  LOBYTE(v2) = [v3 notificationListInteractiveTransitionCoordinatorRequestsIsHighlightVisible:v2];

  return (char)v2;
}

- (NCNotificationListInteractiveTransitionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListInteractiveTransitionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentListDisplayStyleSetting
{
  return self->_currentListDisplayStyleSetting;
}

- (void)setCurrentListDisplayStyleSetting:(int64_t)a3
{
  self->_currentListDisplayStyleSetting = a3;
}

- (NCNotificationListView)parentListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListView);

  return (NCNotificationListView *)WeakRetained;
}

- (void)setParentListView:(id)a3
{
}

- (NCNotificationListView)interactiveListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveListView);

  return (NCNotificationListView *)WeakRetained;
}

- (void)setInteractiveListView:(id)a3
{
}

- (NCNotificationListView)revealListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_revealListView);

  return (NCNotificationListView *)WeakRetained;
}

- (void)setRevealListView:(id)a3
{
}

- (UIPinchGestureRecognizer)interactiveTransitionPinchGestureRecognizer
{
  return self->_interactiveTransitionPinchGestureRecognizer;
}

- (void)setInteractiveTransitionPinchGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)interactiveTransitionPanGestureRecognizer
{
  return self->_interactiveTransitionPanGestureRecognizer;
}

- (void)setInteractiveTransitionPanGestureRecognizer:(id)a3
{
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

- (BOOL)shouldPerformInteractiveExpandTransition
{
  return self->_shouldPerformInteractiveExpandTransition;
}

- (void)setShouldPerformInteractiveExpandTransition:(BOOL)a3
{
  self->_shouldPerformInteractiveExpandTransition = a3;
}

- (BOOL)shouldPerformInteractiveCollapseTransition
{
  return self->_shouldPerformInteractiveCollapseTransition;
}

- (void)setShouldPerformInteractiveCollapseTransition:(BOOL)a3
{
  self->_shouldPerformInteractiveCollapseTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionPinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_revealListView);
  objc_destroyWeak((id *)&self->_interactiveListView);
  objc_destroyWeak((id *)&self->_parentListView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
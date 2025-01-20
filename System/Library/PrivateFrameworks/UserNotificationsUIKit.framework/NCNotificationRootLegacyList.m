@interface NCNotificationRootLegacyList
- (BOOL)_isAdditionalPanGestureActive;
- (BOOL)didExpandHighlights;
- (BOOL)isPerformingExclusiveScrollInteractiveTranslation;
- (BOOL)notificationListInteractiveTransitionCoordinatorRequestsIsHighlightVisible:(id)a3;
- (BOOL)notificationListRevealCoordinatorShouldAllowReveal:(id)a3;
- (BOOL)notificationListRevealCoordinatorShouldAllowRevealTransition:(id)a3;
- (BOOL)shouldAllowNotificationHistoryReveal;
- (NCNotificationListInteractiveTransitionCoordinator)interactiveTransitionCoordinator;
- (NCNotificationListRevealCoordinator)revealCoordinator;
- (NCNotificationRootLegacyList)initWithListView:(id)a3;
- (UIViewFloatAnimatableProperty)highlightExpansionValue;
- (double)scrollCompletionBlockOffsetThreshold;
- (id)scrollCompletionBlock;
- (id)subListsForNotificationListRevealCoordinator:(id)a3;
- (unint64_t)_indexForReveal;
- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsCountForInteractiveListView:(id)a4;
- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsIndexForInteractiveListView:(id)a4;
- (void)_backlightChangedToBacklightLuminance:(int64_t)a3;
- (void)_currentDisplayListStyleSettingsWillChange:(int64_t)a3;
- (void)_notificationListDidChangeContent;
- (void)_setForceRevealed:(BOOL)a3;
- (void)_setRevealed:(BOOL)a3 forSection:(id)a4;
- (void)_updateHighlightExpansion:(double)a3;
- (void)_updateIndexForReveal;
- (void)_updateRevealCoordinator;
- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)notificationListBaseComponent:(id)a3 didSetGrouped:(BOOL)a4;
- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5;
- (void)notificationListInteractiveTransitionCoordinator:(id)a3 didUpdateListDisplaySetting:(int64_t)a4 isPersistentSetting:(BOOL)a5 hideRevealedList:(BOOL)a6;
- (void)notificationListInteractiveTransitionCoordinator:(id)a3 didUpdateScrollTranslation:(CGPoint)a4;
- (void)notificationListInteractiveTransitionCoordinatorRequestsMigratingProminentNotificationsForHiddenSetting:(id)a3;
- (void)notificationListRevealCoordinator:(id)a3 updatedRevealState:(BOOL)a4;
- (void)revealCoordinatorDidScrollToReveal:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDidExpandHighlights:(BOOL)a3;
- (void)setHighlightExpansionValue:(id)a3;
- (void)setInteractiveTransitionCoordinator:(id)a3;
- (void)setPerformingExclusiveScrollInteractiveTranslation:(BOOL)a3;
- (void)setRevealCoordinator:(id)a3;
- (void)setScrollCompletionBlock:(id)a3;
- (void)setScrollCompletionBlockOffsetThreshold:(double)a3;
- (void)setShouldAllowNotificationHistoryReveal:(BOOL)a3;
@end

@implementation NCNotificationRootLegacyList

- (NCNotificationRootLegacyList)initWithListView:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NCNotificationRootLegacyList;
  v5 = [(NCNotificationRootList *)&v28 initWithListView:v4];
  if (v5)
  {
    v6 = objc_alloc_init(NCNotificationListRevealCoordinator);
    revealCoordinator = v5->_revealCoordinator;
    v5->_revealCoordinator = v6;

    [(NCNotificationListRevealCoordinator *)v5->_revealCoordinator setDelegate:v5];
    v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [(NCNotificationRootList *)v5 logDescription];
      *(_DWORD *)buf = 138543362;
      v31 = v10;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ configuring interactive transition coordinator", buf, 0xCu);
    }
    v11 = [(NCNotificationRootList *)v5 incomingSectionList];
    v12 = [v11 listView];

    v13 = [(NCNotificationRootList *)v5 historySectionList];
    v14 = [v13 listView];

    v15 = [[NCNotificationListInteractiveTransitionCoordinator alloc] initWithParentListView:v4 interactiveListView:v12 revealListView:v14];
    interactiveTransitionCoordinator = v5->_interactiveTransitionCoordinator;
    v5->_interactiveTransitionCoordinator = v15;

    [(NCNotificationListInteractiveTransitionCoordinator *)v5->_interactiveTransitionCoordinator setDelegate:v5];
    [(NCNotificationListInteractiveTransitionCoordinator *)v5->_interactiveTransitionCoordinator setCurrentListDisplayStyleSetting:[(NCNotificationRootList *)v5 currentListDisplayStyleSetting]];
    v17 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    highlightExpansionValue = v5->_highlightExpansionValue;
    v5->_highlightExpansionValue = v17;

    objc_initWeak((id *)buf, v5);
    v19 = (void *)MEMORY[0x1E4FB1EB0];
    v29 = v5->_highlightExpansionValue;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __49__NCNotificationRootLegacyList_initWithListView___block_invoke;
    v26 = &unk_1E6A919A0;
    objc_copyWeak(&v27, (id *)buf);
    [v19 _createTransformerWithInputAnimatableProperties:v20 presentationValueChangedCallback:&v23];

    v21 = [(NCNotificationRootList *)v5 rootListView];
    [v21 setDelegate:v5];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  return v5;
}

void __49__NCNotificationRootLegacyList_initWithListView___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = [WeakRetained highlightedSectionList];
    if (v2)
    {
      [v5[43] presentationValue];
      double v4 = v3;
      objc_msgSend(v2, "setExpandedPercentage:");
      [v2 setIsExpanded:v4 >= 0.5];
    }

    WeakRetained = v5;
  }
}

- (void)insertNotificationRequest:(id)a3
{
  id v5 = a3;
  [(NCNotificationRootList *)self _checkAndReloadSuggestionForNotificationRequest:v5];
  id v4 = [(NCNotificationRootList *)self _insertNotificationRequest:v5];
  [(NCNotificationRootLegacyList *)self _notificationListDidChangeContent];
}

- (void)_setForceRevealed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  [v4 setForceRevealed:v3];
}

- (void)_updateIndexForReveal
{
  BOOL v3 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  [v3 indexForReveal];

  id v10 = [(NCNotificationRootList *)self notificationListSections];
  id v4 = [(NCNotificationRootList *)self incomingSectionList];
  uint64_t v5 = [v10 indexOfObject:v4];

  if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
  {
    if ([(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])
    {
      v6 = [(NCNotificationRootList *)self currentDigestSectionList];
      uint64_t v5 = [v10 indexOfObject:v6];
    }
  }
  else
  {
    ++v5;
  }
  v7 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  [v7 setIndexForReveal:v5];

  v8 = [(NCNotificationRootList *)self rootListView];
  [v8 setIndexForReveal:v5];

  v9 = [(NCNotificationRootList *)self rootListView];
  [v9 setNeedsLayout];
}

- (unint64_t)_indexForReveal
{
  v2 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  unint64_t v3 = [v2 indexForReveal];

  return v3;
}

- (void)_updateRevealCoordinator
{
  id v5 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  unint64_t v3 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  id v4 = [(NCNotificationRootLegacyList *)self subListsForNotificationListRevealCoordinator:v3];
  [v5 setSubLists:v4];
}

- (void)_currentDisplayListStyleSettingsWillChange:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  -[NCNotificationListInteractiveTransitionCoordinator setCurrentListDisplayStyleSetting:](self->_interactiveTransitionCoordinator, "setCurrentListDisplayStyleSetting:");
  id v5 = [(NCNotificationRootList *)self highlightedSectionList];
  v6 = [(NCNotificationRootList *)self rootListView];
  if ([v6 isTracking] & 1) != 0 || !v5 || (objc_msgSend(v5, "isExpanded"))
  {
  }
  else
  {

    if (!a3)
    {
      v7 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = [(NCNotificationRootList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ listDisplayStyleSetting is .list without tracking but highlight not expanded; force highlight expansion",
          buf,
          0xCu);
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __75__NCNotificationRootLegacyList__currentDisplayListStyleSettingsWillChange___block_invoke;
      v10[3] = &unk_1E6A91BB0;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:1 friction:v10 interactive:&__block_literal_global_3 animations:80.0 completion:10.0];
    }
  }
}

void __75__NCNotificationRootLegacyList__currentDisplayListStyleSettingsWillChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) highlightExpansionValue];
  [v1 setValue:1.0];
}

- (BOOL)_isAdditionalPanGestureActive
{
  return [(NCNotificationListInteractiveTransitionCoordinator *)self->_interactiveTransitionCoordinator isPanGestureRecognizerActive];
}

- (void)_setRevealed:(BOOL)a3 forSection:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [v5 listView];
  [v6 setRevealed:v4];

  id v8 = [v5 listView];

  double v7 = 0.0;
  if (v4) {
    double v7 = 1.0;
  }
  [v8 setRevealPercentage:v7];
}

- (void)_backlightChangedToBacklightLuminance:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
  {
    v7[7] = v3;
    v7[8] = v4;
    v6 = [(NCNotificationRootList *)self highlightedSectionList];

    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70__NCNotificationRootLegacyList__backlightChangedToBacklightLuminance___block_invoke;
      v7[3] = &unk_1E6A91BB0;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v7];
      [(NCNotificationRootLegacyList *)self setDidExpandHighlights:0];
    }
  }
}

void __70__NCNotificationRootLegacyList__backlightChangedToBacklightLuminance___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) highlightExpansionValue];
  [v2 setValue:0.0];

  id v3 = [*(id *)(a1 + 32) highlightExpansionValue];
  [v3 setVelocity:0.0];
}

- (void)_notificationListDidChangeContent
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRootLegacyList;
  [(NCNotificationRootList *)&v8 _notificationListDidChangeContent];
  id v3 = [(NCNotificationRootList *)self highlightedSectionList];

  if (v3)
  {
    uint64_t v4 = [(NCNotificationRootList *)self highlightedSectionList];
    uint64_t v5 = [v4 count];

    v6 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    double v7 = v6;
    if (v5) {
      [v6 setValue:&unk_1F2F84220 forKey:@"NCNotificationListDisplayStyleReasonOverrideHighlightShowing"];
    }
    else {
      [v6 removeObjectForKey:@"NCNotificationListDisplayStyleReasonOverrideHighlightShowing"];
    }

    [(NCNotificationRootList *)self _updateNotificationListDisplayStyleSetting];
  }
}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  id v42 = a3;
  objc_super v8 = (void (**)(void))a5;
  id v9 = [(NCNotificationRootList *)self upcomingDigestSectionList];
  id v10 = v42;
  if (v9 == v42) {
    goto LABEL_6;
  }
  uint64_t v11 = [(NCNotificationRootList *)self upcomingMissedSectionList];
  if ((id)v11 == v42)
  {

    id v10 = v9;
LABEL_6:

    goto LABEL_7;
  }
  v12 = (void *)v11;
  id v13 = [(NCNotificationRootList *)self currentDigestSectionList];
  if (v13 != v42)
  {

LABEL_10:
    v26 = [(NCNotificationRootList *)self notificationListSections];
    uint64_t v16 = [v26 indexOfObject:v42];

    goto LABEL_11;
  }
  uint64_t v23 = [(NCNotificationRootList *)self historySectionList];
  uint64_t v24 = [(NCNotificationRootList *)self currentDigestSectionList];
  char v25 = [v23 containsSectionList:v24];

  if ((v25 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  v14 = [(NCNotificationRootList *)self notificationSections];
  v15 = [(NCNotificationRootList *)self historySectionList];
  uint64_t v16 = [v14 indexOfObject:v15];

  v17 = [(NCNotificationRootList *)self historySectionList];
  uint64_t v18 = [v17 indexOfSectionList:v42];

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = [(NCNotificationRootList *)self historySectionList];
    v20 = [v19 listView];
    [v20 layoutOffsetForViewAtIndex:v18];
    double v22 = v21;

    a4 = v22 + a4;
  }
LABEL_11:
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v27 = [(NCNotificationRootList *)self rootListView];
    [v27 layoutOffsetForViewAtIndex:v16];
    double v29 = v28;

    double v30 = a4 + v29;
    v31 = [(NCNotificationRootList *)self rootListView];
    [v31 contentOffset];
    if (v30 <= v32) {
      double v30 = v30 + -100.0;
    }

    scrollCompletionBlock = (void (**)(void))self->_scrollCompletionBlock;
    if (scrollCompletionBlock)
    {
      scrollCompletionBlock[2]();
      id v34 = self->_scrollCompletionBlock;
      self->_scrollCompletionBlock = 0;
    }
    self->_double scrollCompletionBlockOffsetThreshold = v30 + 10.0;
    v35 = [(NCNotificationRootList *)self rootListView];
    [v35 contentOffset];
    double v37 = v36;
    double scrollCompletionBlockOffsetThreshold = self->_scrollCompletionBlockOffsetThreshold;

    if (v37 >= scrollCompletionBlockOffsetThreshold)
    {
      v39 = [(NCNotificationRootList *)self rootListView];
      objc_msgSend(v39, "_setContentOffsetWithDecelerationAnimation:", 0.0, v30);

      v40 = (void *)[v8 copy];
      id v41 = self->_scrollCompletionBlock;
      self->_scrollCompletionBlock = v40;

      goto LABEL_21;
    }
LABEL_19:
    v8[2](v8);
    goto LABEL_21;
  }
  if (v8) {
    goto LABEL_19;
  }
LABEL_21:
}

- (void)notificationListBaseComponent:(id)a3 didSetGrouped:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(NCNotificationRootList *)self highlightedSectionList];
  id v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !a4
    && v7
    && ([v7 isExpanded] & 1) == 0
    && [v7 containsNotificationGroup:v8])
  {
    [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:0 forReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition" hideNotificationCount:0];
  }
}

- (void)notificationListInteractiveTransitionCoordinator:(id)a3 didUpdateListDisplaySetting:(int64_t)a4 isPersistentSetting:(BOOL)a5 hideRevealedList:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = [(NCNotificationRootList *)self incomingSectionList];
  [v10 regroupNotificationGroups];

  uint64_t v11 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
  v12 = [NSNumber numberWithInteger:a4];
  [v11 setValue:v12 forKey:@"NCNotificationListDisplayStyleReasonInteractiveTransition"];

  if (v7)
  {
    id v13 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    v14 = [NSNumber numberWithInteger:a4];
    [v13 setValue:v14 forKey:@"NCNotificationListDisplayStyleReasonSystemSetting"];

    [(NCNotificationRootLegacyList *)self _updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:a4];
  }
  [(NCNotificationRootList *)self _updateNotificationListDisplayStyleSetting];
  if (v6 && [(NCNotificationRootList *)self isNotificationHistoryRevealed])
  {
    v15 = [(NCNotificationRootList *)self historySectionList];
    [v15 regroupNotificationGroups];

    [(NCNotificationRootList *)self _setNotificationHistoryWasRevealed:0];
    uint64_t v16 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    [v16 setForceRevealed:0];
  }
  if (a4 == 2)
  {
    [(NCNotificationRootList *)self _setListDisplayStyleWasHiddenForUserInteraction:1];
  }
}

- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsCountForInteractiveListView:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(NCNotificationRootList *)self incomingSectionList];
  id v7 = [v6 listView];

  if (v7 != v5) {
    return 0;
  }
  id v9 = [(NCNotificationRootList *)self incomingSectionList];
  unint64_t v10 = [v9 count];

  return v10;
}

- (void)notificationListInteractiveTransitionCoordinatorRequestsMigratingProminentNotificationsForHiddenSetting:(id)a3
{
  if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
  {
    uint64_t v4 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    uint64_t v5 = [v4 notificationCount];

    if (v5)
    {
      [(NCNotificationRootList *)self _migrateNotificationsFromProminentIncomingSectionToIncomingSection];
      [(NCNotificationRootLegacyList *)self _notificationListDidChangeContent];
    }
  }
}

- (unint64_t)notificationListInteractiveTransitionCoordinator:(id)a3 requestsIndexForInteractiveListView:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(NCNotificationRootList *)self incomingSectionList];
  id v7 = [v6 listView];

  if (v7 != v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v9 = [(NCNotificationRootList *)self notificationListSections];
  unint64_t v10 = [(NCNotificationRootList *)self incomingSectionList];
  unint64_t v11 = [v9 indexOfObject:v10];

  return v11;
}

- (BOOL)notificationListInteractiveTransitionCoordinatorRequestsIsHighlightVisible:(id)a3
{
  uint64_t v4 = [(NCNotificationRootList *)self highlightedSectionList];

  if (!v4) {
    return 0;
  }
  id v5 = [(NCNotificationRootList *)self highlightedSectionList];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)notificationListInteractiveTransitionCoordinator:(id)a3 didUpdateScrollTranslation:(CGPoint)a4
{
}

- (BOOL)notificationListRevealCoordinatorShouldAllowReveal:(id)a3
{
  id v3 = self;
  uint64_t v4 = [(NCNotificationRootList *)self delegate];
  LOBYTE(v3) = [v4 notificationRootListShouldAllowNotificationHistoryReveal:v3];

  return (char)v3;
}

- (BOOL)notificationListRevealCoordinatorShouldAllowRevealTransition:(id)a3
{
  id v3 = [(NCNotificationRootList *)self historySectionList];
  BOOL v4 = [v3 notificationCount] != 0;

  return v4;
}

- (id)subListsForNotificationListRevealCoordinator:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(NCNotificationRootList *)self supplementaryViewsSections];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke;
  v14[3] = &unk_1E6A91E38;
  id v6 = v4;
  id v15 = v6;
  [v5 enumerateObjectsUsingBlock:v14];

  id v7 = [(NCNotificationRootList *)self notificationSections];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke_2;
  v12[3] = &unk_1E6A91C70;
  id v8 = v6;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 listView];
  [v2 addObject:v3];
}

void __77__NCNotificationRootLegacyList_subListsForNotificationListRevealCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 listView];
  [v2 addObject:v3];
}

- (void)notificationListRevealCoordinator:(id)a3 updatedRevealState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(NCNotificationRootList *)self _setNotificationHistoryWasRevealed:a4];
  id v6 = [(NCNotificationRootList *)self rootListView];
  id v7 = v6;
  if (v4)
  {
    id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    objc_msgSend(v7, "setShowsVerticalScrollIndicator:", objc_msgSend(v8, "userInterfaceIdiom") != 1);

    id v9 = [(NCNotificationRootList *)self rootListView];
    [v9 setSublistsRevealed:1];

    if ([(NCNotificationRootList *)self currentListDisplayStyleSetting]) {
      [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:0 forReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition" hideNotificationCount:0];
    }
  }
  else
  {
    [v6 setShowsVerticalScrollIndicator:0];

    id v10 = [(NCNotificationRootList *)self rootListView];
    [v10 setSublistsRevealed:0];
  }
  unint64_t v11 = [(NCNotificationRootList *)self delegate];
  [v11 notificationListComponentChangedContent:self];

  if (v4)
  {
    if ([(NCNotificationRootList *)self isUpcomingDigestVisible])
    {
      v12 = [(NCNotificationRootList *)self upcomingDigestSectionList];
      uint64_t v13 = [v12 notificationCount];

      if (v13)
      {
        v14 = [(NCNotificationRootList *)self upcomingDigestSectionList];
        id v15 = [v14 summaryOrderProvider];
        [v15 atxLogSummaryPlatterShownIsUpcoming:1];
      }
    }
    uint64_t v16 = [(NCNotificationRootList *)self upcomingMissedSectionList];
    uint64_t v17 = [v16 notificationCount];

    if (v17)
    {
      uint64_t v18 = [(NCNotificationRootList *)self upcomingMissedSectionList];
      v19 = [v18 summaryOrderProvider];
      [v19 atxLogSummaryPlatterShownIsUpcoming:1];
    }
  }
  v20 = [(NCNotificationRootList *)self highlightedSectionList];
  double v21 = v20;
  if (v20)
  {
    if (!v4 && ([v20 isExpanded] & 1) == 0)
    {
      [v21 expandedPercentage];
      if (v22 != 0.0)
      {
        uint64_t v23 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = v23;
          char v25 = [(NCNotificationRootList *)self logDescription];
          [v21 expandedPercentage];
          *(_DWORD *)buf = 138543618;
          double v29 = v25;
          __int16 v30 = 2048;
          uint64_t v31 = v26;
          _os_log_impl(&dword_1D7C04000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ highlight expandedPercentage %.2f but revealCoordinator is not revealed; reset the expandedPercentage to 0.0",
            buf,
            0x16u);
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __85__NCNotificationRootLegacyList_notificationListRevealCoordinator_updatedRevealState___block_invoke;
        v27[3] = &unk_1E6A91BB0;
        v27[4] = self;
        [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v27];
        [(NCNotificationRootLegacyList *)self setDidExpandHighlights:0];
      }
    }
  }
}

void __85__NCNotificationRootLegacyList_notificationListRevealCoordinator_updatedRevealState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) highlightExpansionValue];
  [v2 setValue:0.0];

  id v3 = [*(id *)(a1 + 32) highlightExpansionValue];
  [v3 setVelocity:0.0];
}

- (void)revealCoordinatorDidScrollToReveal:(id)a3
{
  id v4 = [(NCNotificationRootList *)self delegate];
  [v4 notificationRootListDidScrollToRevealNotificationHistory:self];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (([v4 isDecelerating] & 1) == 0)
  {
    id v5 = *MEMORY[0x1E4FB3778];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]))
    {
      *(_WORD *)id v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7C04000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_BEGIN", " enableTelemetry=YES ", v10, 2u);
    }
    kdebug_trace();
  }
  id v6 = [(NCNotificationRootList *)self delegate];
  [v6 notificationRootList:self scrollViewWillBeginDragging:v4];

  [(NCNotificationListInteractiveTransitionCoordinator *)self->_interactiveTransitionCoordinator interactiveTranslationWillBegin];
  [(NCNotificationRootLegacyList *)self setPerformingExclusiveScrollInteractiveTranslation:[(NCNotificationListInteractiveTransitionCoordinator *)self->_interactiveTransitionCoordinator isPerformingExclusiveScrollInteractiveTranslation]];
  if ([v6 notificationRootListShouldAllowNotificationHistoryReveal:self]) {
    BOOL v7 = ![(NCNotificationRootLegacyList *)self isPerformingExclusiveScrollInteractiveTranslation];
  }
  else {
    LOBYTE(v7) = 0;
  }
  self->_shouldAllowNotificationHistoryReveal = v7;
  if ([(NCNotificationRootLegacyList *)self shouldAllowNotificationHistoryReveal])
  {
    id v8 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    id v9 = [(NCNotificationRootList *)self rootListView];
    [v8 notificationListWillBeginDragging:v9];
  }
  [(NCNotificationRootList *)self _cancelTouchesOnLiveActivities:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v30 = a3;
  id v4 = [(NCNotificationRootList *)self delegate];
  [v4 notificationRootList:self scrollViewDidScroll:v30];

  [v30 contentOffset];
  double v6 = v5;
  double v8 = v7;
  id v9 = [v30 panGestureRecognizer];
  [v9 velocityInView:v30];
  double v11 = v10;
  [v9 translationInView:v30];
  double v13 = v12;
  [(NCNotificationRootLegacyList *)self _updateHighlightExpansion:v12];
  v14 = [(NCNotificationRootList *)self rootListView];
  [v14 contentLayoutOffset];
  double v16 = v15;

  if (v16 > 0.0)
  {
    uint64_t v17 = [(NCNotificationRootList *)self historySectionList];
    if ([v17 count]) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = [(NCNotificationRootList *)self currentListDisplayStyleSetting] != 0;
    }

    if ([v30 isTracking])
    {
      BOOL v19 = v11 != 0.0 || v18;
      if (v11 < 0.0 || !v19)
      {
        [v30 contentInset];
        double v8 = -v20;
        double v21 = [(NCNotificationRootList *)self rootListView];
        [v21 setInteractionTranslation:v13];

        double v6 = 0.0;
      }
    }
    if (-[NCNotificationRootLegacyList shouldAllowNotificationHistoryReveal](self, "shouldAllowNotificationHistoryReveal")&& [v30 isTracking])
    {
      double v22 = [(NCNotificationRootLegacyList *)self revealCoordinator];
      [v22 setInteractionTranslation:-v13];
    }
    objc_msgSend(v30, "setContentOffset:", v6, v8);
  }
  uint64_t v23 = [(NCNotificationRootList *)self rootListView];
  [v23 frame];
  [(NCNotificationRootList *)self _updateVisibleRectForContentOffset:v6 size:v8];

  if ([(NCNotificationRootLegacyList *)self shouldAllowNotificationHistoryReveal])
  {
    uint64_t v24 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    char v25 = [(NCNotificationRootList *)self rootListView];
    [v24 notificationListDidScroll:v25];
  }
  if (self->_scrollCompletionBlock)
  {
    [(NCNotificationRootLegacyList *)self scrollCompletionBlockOffsetThreshold];
    if (v8 < v26)
    {
      (*((void (**)(void))self->_scrollCompletionBlock + 2))();
      id scrollCompletionBlock = self->_scrollCompletionBlock;
      self->_id scrollCompletionBlock = 0;
    }
  }
  if ([v30 isTracking]) {
    [(NCNotificationListInteractiveTransitionCoordinator *)self->_interactiveTransitionCoordinator updateScrollInteractiveTranslation];
  }
  [v30 contentInset];
  if (v8 + v28 <= 24.0)
  {
    double v29 = [(NCNotificationRootList *)self rootListView];
    [v29 setNeedsLayout];
  }
}

- (void)_updateHighlightExpansion:(double)a3
{
  double v5 = [(NCNotificationRootList *)self highlightedSectionList];
  double v6 = v5;
  if (v5
    && ([v5 isExpanded] & 1) == 0
    && ![(NCNotificationRootLegacyList *)self didExpandHighlights])
  {
    double v7 = fmax(fmin(a3 / -200.0, 1.0), 0.0);
    if (v7 > 0.2)
    {
      [(NCNotificationRootLegacyList *)self setDidExpandHighlights:1];
      [(NCNotificationRootList *)self setNotificationHistoryRevealed:1];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__NCNotificationRootLegacyList__updateHighlightExpansion___block_invoke;
    v8[3] = &unk_1E6A91E60;
    v8[4] = self;
    *(double *)&v8[5] = v7;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v8 interactive:&__block_literal_global_16 animations:80.0 completion:10.0];
  }
}

void __58__NCNotificationRootLegacyList__updateHighlightExpansion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) highlightExpansionValue];
  char v2 = [*(id *)(a1 + 32) didExpandHighlights];
  double v3 = 1.0;
  if ((v2 & 1) == 0) {
    double v3 = *(double *)(a1 + 40);
  }
  [v4 setValue:v3];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  double v10 = [(NCNotificationRootList *)self delegate];
  objc_msgSend(v10, "notificationRootList:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, v9, a5, x, y);

  double v11 = [(NCNotificationRootList *)self rootListView];
  [v11 contentLayoutOffset];
  double v13 = v12;

  if (v13 != 0.0)
  {
    v14 = [(NCNotificationRootList *)self rootListView];
    [v14 contentInset];
    a5->double x = 0.0;
    a5->double y = -v15;
  }
  if ([(NCNotificationRootLegacyList *)self shouldAllowNotificationHistoryReveal])
  {
    double v16 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    uint64_t v17 = [(NCNotificationRootList *)self rootListView];
    [v16 notificationListViewWillEndDragging:v17 withTargetContentOffset:a5];
  }
  BOOL v18 = [(NCNotificationRootList *)self rootListView];
  [v18 setActiveRevealTransitioning:0];

  BOOL v19 = [(NCNotificationRootList *)self rootListView];
  [v19 setInteractionTranslation:0.0];

  id v20 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  [v20 setInteractionTranslation:0.0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4FB3778];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]))
  {
    *(_WORD *)double v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_END", " enableTelemetry=YES ", v13, 2u);
  }
  kdebug_trace();
  [(NCNotificationRootLegacyList *)self setPerformingExclusiveScrollInteractiveTranslation:0];
  double v6 = [(NCNotificationRootList *)self rootListView];
  [v6 setInteractionTranslation:0.0];

  double v7 = [(NCNotificationRootLegacyList *)self revealCoordinator];
  [v7 setInteractionTranslation:0.0];

  double v8 = [(NCNotificationRootList *)self rootListView];
  [v8 frame];
  -[NCNotificationRootList updateListViewVisibleRectForSize:](self, "updateListViewVisibleRectForSize:", v9, v10);

  if ([(NCNotificationRootLegacyList *)self shouldAllowNotificationHistoryReveal])
  {
    double v11 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    double v12 = [(NCNotificationRootList *)self rootListView];
    [v11 notificationListViewDidEndDecelerating:v12];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4)
  {
    double v7 = *MEMORY[0x1E4FB3778];
    if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]))
    {
      *(_WORD *)double v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7C04000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_LIST_SCROLL_END", " enableTelemetry=YES ", v10, 2u);
    }
    kdebug_trace();
  }
  if ([(NCNotificationRootLegacyList *)self shouldAllowNotificationHistoryReveal])
  {
    double v8 = [(NCNotificationRootLegacyList *)self revealCoordinator];
    double v9 = [(NCNotificationRootList *)self rootListView];
    [v8 notificationListViewDidEndDragging:v9 willDecelerate:v4];
  }
  [(NCNotificationListInteractiveTransitionCoordinator *)self->_interactiveTransitionCoordinator interactiveTranslationDidEnd];
  [(NCNotificationRootList *)self _cancelTouchesOnLiveActivities:0];
}

- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3
{
  id v8 = [(NCNotificationRootList *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v5 = [v8 notificationSystemSettingsForNotificationListComponent:self];
    id v6 = v5;
    if (v5 && [v5 listDisplayStyleSetting] != a3)
    {
      double v7 = (void *)[v6 mutableCopy];
      [v7 setListDisplayStyleSetting:a3];
      if (objc_opt_respondsToSelector()) {
        [v8 notificationListComponent:self setNotificationSystemSettings:v7];
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (NCNotificationListRevealCoordinator)revealCoordinator
{
  return self->_revealCoordinator;
}

- (void)setRevealCoordinator:(id)a3
{
}

- (NCNotificationListInteractiveTransitionCoordinator)interactiveTransitionCoordinator
{
  return self->_interactiveTransitionCoordinator;
}

- (void)setInteractiveTransitionCoordinator:(id)a3
{
}

- (BOOL)shouldAllowNotificationHistoryReveal
{
  return self->_shouldAllowNotificationHistoryReveal;
}

- (void)setShouldAllowNotificationHistoryReveal:(BOOL)a3
{
  self->_shouldAllowNotificationHistoryReveal = a3;
}

- (id)scrollCompletionBlock
{
  return self->_scrollCompletionBlock;
}

- (void)setScrollCompletionBlock:(id)a3
{
}

- (double)scrollCompletionBlockOffsetThreshold
{
  return self->_scrollCompletionBlockOffsetThreshold;
}

- (void)setScrollCompletionBlockOffsetThreshold:(double)a3
{
  self->_double scrollCompletionBlockOffsetThreshold = a3;
}

- (BOOL)isPerformingExclusiveScrollInteractiveTranslation
{
  return self->_performingExclusiveScrollInteractiveTranslation;
}

- (void)setPerformingExclusiveScrollInteractiveTranslation:(BOOL)a3
{
  self->_performingExclusiveScrollInteractiveTranslation = a3;
}

- (UIViewFloatAnimatableProperty)highlightExpansionValue
{
  return self->_highlightExpansionValue;
}

- (void)setHighlightExpansionValue:(id)a3
{
}

- (BOOL)didExpandHighlights
{
  return self->_didExpandHighlights;
}

- (void)setDidExpandHighlights:(BOOL)a3
{
  self->_didExpandHighlights = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightExpansionValue, 0);
  objc_storeStrong(&self->_scrollCompletionBlock, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionCoordinator, 0);

  objc_storeStrong((id *)&self->_revealCoordinator, 0);
}

@end
@interface SBIconDragContext
- (BOOL)dragItemWasConsumedExternally;
- (BOOL)duplicatesSourceIcons;
- (BOOL)hasDestinationIconView:(id)a3;
- (BOOL)hasDragItem:(id)a3;
- (BOOL)hasDraggedIcon:(id)a3;
- (BOOL)hasEnteredIconListView:(id)a3;
- (BOOL)hasFolderDraggedIcons;
- (BOOL)hasFolderSourceIcons;
- (BOOL)hasGrabbedIcon:(id)a3;
- (BOOL)hasIconViewBorrowAssertions;
- (BOOL)hasItemIdentifier:(id)a3;
- (BOOL)hasMessageExpectationNamed:(id)a3;
- (BOOL)hasNonDefaultSizedDraggedIcons;
- (BOOL)hasNonDefaultSizedSourceIcons;
- (BOOL)hasSourceIconView:(id)a3;
- (BOOL)hasUserDragged;
- (BOOL)isAnimatingDropForDragItem:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isExternalDrag;
- (BOOL)isSnapToGridAllowed;
- (BOOL)isUserActive;
- (BOOL)isWaitingForMessage;
- (BOOL)isWaitingToSetPlaceholderViewController;
- (BOOL)notifiedDelegateForDropSession;
- (BOOL)performedIconDrop;
- (BOOL)wasLastUpdateContainedInDestinationIconListView;
- (BSInvalidatable)destinationStackIconViewPauseLayoutAssertion;
- (CGPoint)currentEnteredIconListViewLastLocation;
- (CGPoint)initialTouchOffsetFromIconImageCenter;
- (CGPoint)pauseLocation;
- (NSArray)createdApplicationIcons;
- (NSArray)createdIcons;
- (NSArray)createdWidgetIcons;
- (NSArray)draggedIcons;
- (NSArray)droppedIcons;
- (NSArray)externallyDraggedIcons;
- (NSArray)grabbedIconViews;
- (NSArray)itemIdentifiers;
- (NSArray)sourceIcons;
- (NSDate)lastUserInteractionDate;
- (NSSet)appLocalContexts;
- (NSSet)expectedMessages;
- (NSSet)removedMatchingLeafIcons;
- (NSString)description;
- (NSString)dragPlaceholderGridSizeClass;
- (NSString)draggedIconGridSizeClass;
- (NSString)sourceIconGridSizeClass;
- (NSTimer)pauseTimer;
- (NSTimer)watchdogTimer;
- (OS_os_activity)activity;
- (SBHIconLayoutHidingUpdating)draggedIconsHiddenAssertion;
- (SBIcon)candidateRecipientIcon;
- (SBIconDragContext)init;
- (SBIconListView)currentEnteredIconListView;
- (SBIconListView)dragPlaceholderListView;
- (SBIconListViewPlaceholderPositioning)dragPlaceholder;
- (SBIconView)primaryIconView;
- (SBIconView)recipientIconView;
- (double)currentEnteredIconListViewDragDistance;
- (id)additionalMatchingIconForDroppedIconIdentifier:(id)a3;
- (id)appDragLocalContextForDragItem:(id)a3;
- (id)appDragLocalContextWithIconIdentifier:(id)a3;
- (id)borrowedViewControllerForIconView:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)destinationFolderIconViewForIconWithIdentifier:(id)a3;
- (id)destinationStackIconViewForIconWithIdentifier:(id)a3;
- (id)dragPreviewForIconView:(id)a3;
- (id)iconViewBorrowAssertionForIconView:(id)a3;
- (id)initialIndexPathForIcon:(id)a3;
- (id)initialIndexPathForIconWithIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)targetIconViewForCancellingIconView:(id)a3;
- (int64_t)dragRejectionReason;
- (int64_t)state;
- (unint64_t)recipientIconEntryRegion;
- (void)_addPrepareForDropAssertionForIconView:(id)a3;
- (void)addAppLocalContext:(id)a3;
- (void)addDestinationIconView:(id)a3;
- (void)addDiscardedSourceIconView:(id)a3;
- (void)addDropAnimatingDragItem:(id)a3;
- (void)addDroppedIcon:(id)a3;
- (void)addDroppedIcons:(id)a3;
- (void)addEnteredIconListView:(id)a3;
- (void)addGrabbedIconView:(id)a3;
- (void)addIconViewDroppingAssertion:(id)a3 forIconView:(id)a4;
- (void)addItemIdentifier:(id)a3;
- (void)addMessageExpectationNamed:(id)a3;
- (void)addSourceIcon:(id)a3;
- (void)addSourceIconView:(id)a3;
- (void)addSourceIcons:(id)a3;
- (void)clearAllDropAssertions;
- (void)clearDropAssertionsForIconView:(id)a3;
- (void)dealloc;
- (void)enumerateDestinationIconViewsUsingBlock:(id)a3;
- (void)enumerateDiscardedSourceIconViewsUsingBlock:(id)a3;
- (void)enumerateDragPreviewsUsingBlock:(id)a3;
- (void)enumerateDraggedIconUsingBlock:(id)a3;
- (void)enumerateEnteredIconListViewsUsingBlock:(id)a3;
- (void)enumerateSourceIconViewsUsingBlock:(id)a3;
- (void)invalidateIconViewBorrowAssertions;
- (void)removeAllMessageExpectations;
- (void)removeMessageExpectationNamed:(id)a3;
- (void)resetDragPlaceholder;
- (void)resetDraggedIconsHiddenAssertion;
- (void)resetLastUserInteractionDate;
- (void)setAdditionalMatchingIcon:(id)a3 forDroppedIconIdentifier:(id)a4;
- (void)setAppDragLocalContext:(id)a3 forDragItem:(id)a4;
- (void)setBorrowedViewController:(id)a3 forIconView:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setCandidateRecipientIcon:(id)a3;
- (void)setCreatedApplicationIcons:(id)a3;
- (void)setCreatedWidgetIcons:(id)a3;
- (void)setCurrentEnteredIconListView:(id)a3;
- (void)setCurrentEnteredIconListViewDragDistance:(double)a3;
- (void)setCurrentEnteredIconListViewLastLocation:(CGPoint)a3;
- (void)setDestinationFolderIconView:(id)a3 forIconWithIdentifier:(id)a4;
- (void)setDestinationStackIconView:(id)a3 forIconWithIdentifier:(id)a4;
- (void)setDestinationStackIconViewPauseLayoutAssertion:(id)a3;
- (void)setDragItemWasConsumedExternally:(BOOL)a3;
- (void)setDragPlaceholder:(id)a3;
- (void)setDragPlaceholderGridSizeClass:(id)a3;
- (void)setDragPlaceholderListView:(id)a3;
- (void)setDragPreview:(id)a3 forIconView:(id)a4;
- (void)setDragRejectionReason:(int64_t)a3;
- (void)setDraggedIconsHiddenAssertion:(id)a3;
- (void)setDroppedIcons:(id)a3;
- (void)setDuplicatesSourceIcons:(BOOL)a3;
- (void)setExternalDrag:(BOOL)a3;
- (void)setExternallyDraggedIcons:(id)a3;
- (void)setGrabbedIconViews:(id)a3;
- (void)setIconViewBorrowAssertion:(id)a3 forIconView:(id)a4;
- (void)setInitialIndexPath:(id)a3 forIcon:(id)a4;
- (void)setInitialTouchOffsetFromIconImageCenter:(CGPoint)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setLastUserInteractionDate:(id)a3;
- (void)setNotifiedDelegateForDropSession:(BOOL)a3;
- (void)setPauseLocation:(CGPoint)a3;
- (void)setPauseTimer:(id)a3;
- (void)setPerformedIconDrop:(BOOL)a3;
- (void)setPrimaryIconView:(id)a3;
- (void)setRecipientIconEntryRegion:(unint64_t)a3;
- (void)setRecipientIconView:(id)a3;
- (void)setRemovedMatchingLeafIcons:(id)a3;
- (void)setSnapToGridAllowed:(BOOL)a3;
- (void)setSourceIcons:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetIconView:(id)a3 forCancellingIconView:(id)a4;
- (void)setWaitingToSetPlaceholderViewController:(BOOL)a3;
- (void)setWasLastUpdateContainedInDestinationIconListView:(BOOL)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)swapSourceIconWithIdentifier:(id)a3 withIcon:(id)a4;
@end

@implementation SBIconDragContext

- (SBIconDragContext)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBIconDragContext;
  v2 = [(SBIconDragContext *)&v11 init];
  v3 = v2;
  if (v2)
  {
    grabbedIconViews = v2->_grabbedIconViews;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_grabbedIconViews = (NSArray *)MEMORY[0x1E4F1CBF0];

    itemIdentifiers = v3->_itemIdentifiers;
    v3->_itemIdentifiers = v5;

    externallyDraggedIcons = v3->_externallyDraggedIcons;
    v3->_externallyDraggedIcons = v5;

    os_activity_t v8 = _os_activity_create(&dword_1D7F0A000, "Icon Drag", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v3->_activity;
    v3->_activity = (OS_os_activity *)v8;

    os_activity_scope_enter((os_activity_t)v3->_activity, &v3->_activityState);
  }
  return v3;
}

- (void)dealloc
{
  os_activity_scope_leave(&self->_activityState);
  v3.receiver = self;
  v3.super_class = (Class)SBIconDragContext;
  [(SBIconDragContext *)&v3 dealloc];
}

- (BOOL)isUserActive
{
  unint64_t v3 = [(SBIconDragContext *)self state];
  BOOL result = 0;
  if (v3 <= 4 && ((1 << v3) & 0x1A) != 0) {
    return ![(SBIconDragContext *)self dragItemWasConsumedExternally];
  }
  return result;
}

- (BOOL)hasUserDragged
{
  return (unint64_t)([(SBIconDragContext *)self state] - 3) < 4;
}

- (void)addItemIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(SBIconDragContext *)self itemIdentifiers];
  v5 = [v6 arrayByAddingObject:v4];

  [(SBIconDragContext *)self setItemIdentifiers:v5];
}

- (BOOL)hasItemIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconDragContext *)self itemIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addGrabbedIconView:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconDragContext *)self grabbedIconViews];
  char v6 = [v5 arrayByAddingObject:v4];
  [(SBIconDragContext *)self setGrabbedIconViews:v6];

  uint64_t v11 = [v4 icon];

  v7 = (void *)v11;
  if (v11)
  {
    grabbedIcons = self->_grabbedIcons;
    if (!grabbedIcons)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v10 = self->_grabbedIcons;
      self->_grabbedIcons = v9;

      grabbedIcons = self->_grabbedIcons;
    }
    [(NSMutableSet *)grabbedIcons addObject:v11];
    v7 = (void *)v11;
  }
}

- (BOOL)hasGrabbedIcon:(id)a3
{
  return [(NSMutableSet *)self->_grabbedIcons containsObject:a3];
}

- (NSArray)sourceIcons
{
  sourceIcons = self->_sourceIcons;
  if (sourceIcons)
  {
    unint64_t v3 = [(NSMutableOrderedSet *)sourceIcons array];
  }
  else
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (void)setSourceIcons:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  char v6 = (NSMutableOrderedSet *)[[v4 alloc] initWithArray:v5];

  sourceIcons = self->_sourceIcons;
  self->_sourceIcons = v6;
}

- (void)addSourceIcon:(id)a3
{
  id v4 = a3;
  sourceIcons = self->_sourceIcons;
  id v8 = v4;
  if (!sourceIcons)
  {
    char v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v7 = self->_sourceIcons;
    self->_sourceIcons = v6;

    id v4 = v8;
    sourceIcons = self->_sourceIcons;
  }
  [(NSMutableOrderedSet *)sourceIcons addObject:v4];
}

- (void)addSourceIcons:(id)a3
{
  id v4 = a3;
  sourceIcons = self->_sourceIcons;
  id v8 = v4;
  if (!sourceIcons)
  {
    char v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v7 = self->_sourceIcons;
    self->_sourceIcons = v6;

    id v4 = v8;
    sourceIcons = self->_sourceIcons;
  }
  [(NSMutableOrderedSet *)sourceIcons addObjectsFromArray:v4];
}

- (NSArray)droppedIcons
{
  if (self->_droppedIcons) {
    return (NSArray *)self->_droppedIcons;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)addDroppedIcon:(id)a3
{
  id v4 = a3;
  droppedIcons = self->_droppedIcons;
  id v8 = v4;
  if (!droppedIcons)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_droppedIcons;
    self->_droppedIcons = v6;

    id v4 = v8;
    droppedIcons = self->_droppedIcons;
  }
  [(NSMutableArray *)droppedIcons addObject:v4];
}

- (void)addDroppedIcons:(id)a3
{
  id v4 = a3;
  droppedIcons = self->_droppedIcons;
  id v8 = v4;
  if (!droppedIcons)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_droppedIcons;
    self->_droppedIcons = v6;

    id v4 = v8;
    droppedIcons = self->_droppedIcons;
  }
  [(NSMutableArray *)droppedIcons addObjectsFromArray:v4];
}

- (void)setAdditionalMatchingIcon:(id)a3 forDroppedIconIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  if (!additionalMatchingDroppedIcons)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_additionalMatchingDroppedIcons;
    self->_additionalMatchingDroppedIcons = v8;

    additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  }
  [(NSMutableDictionary *)additionalMatchingDroppedIcons setObject:v10 forKey:v6];
}

- (id)additionalMatchingIconForDroppedIconIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_additionalMatchingDroppedIcons objectForKey:a3];
}

- (void)swapSourceIconWithIdentifier:(id)a3 withIcon:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconDragContext *)self sourceIcons];
  v9 = (void *)[v8 mutableCopy];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke;
  v38[3] = &unk_1E6AAF238;
  id v10 = v6;
  id v39 = v10;
  uint64_t v11 = [v9 indexOfObjectPassingTest:v38];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [v9 addObject:v7];
  }
  else {
    [v9 replaceObjectAtIndex:v11 withObject:v7];
  }
  v27 = v9;
  [(SBIconDragContext *)self setSourceIcons:v9];
  v12 = [(SBIconDragContext *)self itemIdentifiers];
  v13 = (void *)[v12 mutableCopy];

  v14 = [v7 nodeIdentifier];
  [v13 removeObject:v10];
  [v13 addObject:v14];
  [(SBIconDragContext *)self setItemIdentifiers:v13];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_2;
  v35[3] = &unk_1E6AADEB0;
  id v15 = v8;
  id v36 = v15;
  id v16 = v7;
  id v37 = v16;
  [(SBIconDragContext *)self enumerateSourceIconViewsUsingBlock:v35];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_3;
  v32[3] = &unk_1E6AB31B8;
  id v26 = v15;
  id v33 = v26;
  id v25 = v16;
  id v34 = v25;
  [(SBIconDragContext *)self enumerateDragPreviewsUsingBlock:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = self->_appLocalContexts;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v23 = [v22 uniqueIdentifier];
        int v24 = [v23 isEqualToString:v10];

        if (v24) {
          [v22 setUniqueIdentifier:v14];
        }
      }
      uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v19);
  }
}

uint64_t __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 nodeIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 icon];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [v6 setIcon:*(void *)(a1 + 40)];
  }
}

void __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 icon];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [v6 setIcon:*(void *)(a1 + 40)];
  }
}

- (BOOL)hasNonDefaultSizedSourceIcons
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(SBIconDragContext *)self sourceIcons];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 gridSizeClass];
        if (v8 == @"SBHIconGridSizeClassDefault")
        {
        }
        else
        {
          v9 = v8;
          id v10 = [v7 gridSizeClass];
          int v11 = [v10 isEqualToString:@"SBHIconGridSizeClassDefault"];

          if (!v11)
          {
            BOOL v12 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)sourceIconGridSizeClass
{
  v2 = [(SBIconDragContext *)self sourceIcons];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 gridSizeClass];

  return (NSString *)v4;
}

- (BOOL)hasFolderSourceIcons
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SBIconDragContext *)self itemIdentifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (+[SBFolder isFolderNodeIdentifier:*(void *)(*((void *)&v7 + 1) + 8 * i)])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)draggedIcons
{
  uint64_t v3 = [(SBIconDragContext *)self sourceIcons];
  uint64_t v4 = [(SBIconDragContext *)self createdIcons];
  uint64_t v5 = [(SBIconDragContext *)self externallyDraggedIcons];
  uint64_t v6 = [v3 count];
  uint64_t v7 = [v4 count];
  uint64_t v8 = [v5 count];
  uint64_t v9 = v8;
  if (v6 && !v7 && !v8)
  {
    id v10 = v3;
LABEL_13:
    id v12 = v10;
    goto LABEL_14;
  }
  if (v7) {
    BOOL v11 = v6 != 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v8 == 0)
  {
    id v10 = v4;
    goto LABEL_13;
  }
  if (v6 == 0 && v7 == 0 && v8)
  {
    id v10 = v5;
    goto LABEL_13;
  }
  long long v14 = (void *)[v3 mutableCopy];
  long long v15 = v14;
  if (v7) {
    [v14 addObjectsFromArray:v4];
  }
  if (v9) {
    [v15 addObjectsFromArray:v5];
  }
  additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __33__SBIconDragContext_draggedIcons__block_invoke;
  v19[3] = &unk_1E6AB31E0;
  id v20 = 0;
  id v17 = v15;
  id v21 = v17;
  [(NSMutableDictionary *)additionalMatchingDroppedIcons enumerateKeysAndObjectsUsingBlock:v19];
  uint64_t v18 = v21;
  id v12 = v17;

LABEL_14:
  return (NSArray *)v12;
}

void __33__SBIconDragContext_draggedIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SBIconDragContext_draggedIcons__block_invoke_2;
  v7[3] = &unk_1E6AAF238;
  id v5 = v3;
  id v8 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v7];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(a1 + 40) removeObjectAtIndex:v6];
  }
}

uint64_t __33__SBIconDragContext_draggedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)enumerateDraggedIconUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v5 = [(SBIconDragContext *)self sourceIcons];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke;
  v16[3] = &unk_1E6AB1E00;
  id v6 = v4;
  id v17 = v6;
  uint64_t v18 = &v19;
  [v5 enumerateObjectsUsingBlock:v16];
  if (!*((unsigned char *)v20 + 24))
  {
    uint64_t v7 = [(SBIconDragContext *)self createdIcons];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_2;
    v13[3] = &unk_1E6AB1E00;
    id v8 = v6;
    id v14 = v8;
    long long v15 = &v19;
    [v7 enumerateObjectsUsingBlock:v13];
    if (!*((unsigned char *)v20 + 24))
    {
      uint64_t v9 = [(SBIconDragContext *)self externallyDraggedIcons];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_3;
      v10[3] = &unk_1E6AB1E00;
      id v11 = v8;
      id v12 = &v19;
      [v9 enumerateObjectsUsingBlock:v10];
    }
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)hasDraggedIcon:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SBIconDragContext_hasDraggedIcon___block_invoke;
  v7[3] = &unk_1E6AB3208;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBIconDragContext *)self enumerateDraggedIconUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __36__SBIconDragContext_hasDraggedIcon___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasNonDefaultSizedDraggedIcons
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(SBIconDragContext *)self draggedIcons];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 gridSizeClass];
        if (v8 == @"SBHIconGridSizeClassDefault")
        {
        }
        else
        {
          uint64_t v9 = v8;
          uint64_t v10 = [v7 gridSizeClass];
          int v11 = [v10 isEqualToString:@"SBHIconGridSizeClassDefault"];

          if (!v11)
          {
            BOOL v12 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)draggedIconGridSizeClass
{
  v2 = [(SBIconDragContext *)self draggedIcons];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    uint64_t v4 = [v3 gridSizeClass];
  }
  else
  {
    uint64_t v4 = @"SBHIconGridSizeClassDefault";
  }
  uint64_t v5 = v4;

  return (NSString *)v5;
}

- (BOOL)hasFolderDraggedIcons
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SBIconDragContext *)self draggedIcons];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isFolderIcon])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)createdIcons
{
  uint64_t v3 = [(SBIconDragContext *)self createdApplicationIcons];
  uint64_t v4 = [(SBIconDragContext *)self createdWidgetIcons];
  uint64_t v5 = v4;
  if (v3 && !v4)
  {
    id v6 = v3;
LABEL_10:
    long long v7 = v6;
    goto LABEL_11;
  }
  if (!v3 && v4)
  {
    id v6 = v4;
    goto LABEL_10;
  }
  long long v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3 && v4)
  {
    id v6 = [v3 arrayByAddingObjectsFromArray:v4];
    goto LABEL_10;
  }
LABEL_11:

  return (NSArray *)v7;
}

- (BOOL)hasSourceIconView:(id)a3
{
  return [(NSMutableSet *)self->_sourceIconViews containsObject:a3];
}

- (void)addSourceIconView:(id)a3
{
  id v4 = a3;
  sourceIconViews = self->_sourceIconViews;
  id v8 = v4;
  if (!sourceIconViews)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v7 = self->_sourceIconViews;
    self->_sourceIconViews = v6;

    id v4 = v8;
    sourceIconViews = self->_sourceIconViews;
  }
  [(NSMutableSet *)sourceIconViews addObject:v4];
}

- (void)enumerateSourceIconViewsUsingBlock:(id)a3
{
}

- (void)addDiscardedSourceIconView:(id)a3
{
  id v4 = a3;
  discardedSourceIconViews = self->_discardedSourceIconViews;
  id v8 = v4;
  if (!discardedSourceIconViews)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v7 = self->_discardedSourceIconViews;
    self->_discardedSourceIconViews = v6;

    id v4 = v8;
    discardedSourceIconViews = self->_discardedSourceIconViews;
  }
  [(NSMutableSet *)discardedSourceIconViews addObject:v4];
}

- (void)enumerateDiscardedSourceIconViewsUsingBlock:(id)a3
{
}

- (BOOL)hasDragItem:(id)a3
{
  id v4 = objc_msgSend(a3, "sbh_appDragLocalContext");
  if (v4) {
    char v5 = [(NSMutableSet *)self->_appLocalContexts containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)addMessageExpectationNamed:(id)a3
{
  id v4 = a3;
  messageExpectations = self->_messageExpectations;
  id v8 = v4;
  if (!messageExpectations)
  {
    id v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    long long v7 = self->_messageExpectations;
    self->_messageExpectations = v6;

    id v4 = v8;
    messageExpectations = self->_messageExpectations;
  }
  [(NSCountedSet *)messageExpectations addObject:v4];
}

- (void)removeMessageExpectationNamed:(id)a3
{
}

- (BOOL)hasMessageExpectationNamed:(id)a3
{
  return [(NSCountedSet *)self->_messageExpectations containsObject:a3];
}

- (void)removeAllMessageExpectations
{
}

- (NSSet)expectedMessages
{
  messageExpectations = self->_messageExpectations;
  if (messageExpectations) {
    id v3 = (id)[(NSCountedSet *)messageExpectations copy];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  return (NSSet *)v3;
}

- (BOOL)isWaitingForMessage
{
  return [(NSCountedSet *)self->_messageExpectations count] != 0;
}

- (void)addDestinationIconView:(id)a3
{
  id v4 = a3;
  destinationIconViews = self->_destinationIconViews;
  id v8 = v4;
  if (!destinationIconViews)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v7 = self->_destinationIconViews;
    self->_destinationIconViews = v6;

    id v4 = v8;
    destinationIconViews = self->_destinationIconViews;
  }
  [(NSMutableSet *)destinationIconViews addObject:v4];
}

- (BOOL)hasDestinationIconView:(id)a3
{
  return [(NSMutableSet *)self->_destinationIconViews containsObject:a3];
}

- (void)enumerateDestinationIconViewsUsingBlock:(id)a3
{
}

- (void)addIconViewDroppingAssertion:(id)a3 forIconView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  iconViewDroppingAssertions = self->_iconViewDroppingAssertions;
  if (!iconViewDroppingAssertions)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v9 = self->_iconViewDroppingAssertions;
    self->_iconViewDroppingAssertions = v8;

    iconViewDroppingAssertions = self->_iconViewDroppingAssertions;
  }
  id v10 = [(NSMapTable *)iconViewDroppingAssertions objectForKey:v6];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMapTable *)self->_iconViewDroppingAssertions setObject:v10 forKey:v6];
  }
  [v10 addObject:v11];
}

- (BOOL)hasEnteredIconListView:(id)a3
{
  return [(NSMutableSet *)self->_enteredIconListViews containsObject:a3];
}

- (void)addEnteredIconListView:(id)a3
{
  id v4 = a3;
  enteredIconListViews = self->_enteredIconListViews;
  id v8 = v4;
  if (!enteredIconListViews)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v7 = self->_enteredIconListViews;
    self->_enteredIconListViews = v6;

    id v4 = v8;
    enteredIconListViews = self->_enteredIconListViews;
  }
  [(NSMutableSet *)enteredIconListViews addObject:v4];
}

- (void)enumerateEnteredIconListViewsUsingBlock:(id)a3
{
}

- (void)setTargetIconView:(id)a3 forCancellingIconView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  targetsForCancellingIconViews = self->_targetsForCancellingIconViews;
  if (!targetsForCancellingIconViews)
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v9 = self->_targetsForCancellingIconViews;
    self->_targetsForCancellingIconViews = v8;

    targetsForCancellingIconViews = self->_targetsForCancellingIconViews;
  }
  [(NSMapTable *)targetsForCancellingIconViews setObject:v10 forKey:v6];
}

- (id)targetIconViewForCancellingIconView:(id)a3
{
  return [(NSMapTable *)self->_targetsForCancellingIconViews objectForKey:a3];
}

- (void)setRecipientIconView:(id)a3
{
  char v5 = (SBIconView *)a3;
  recipientIconView = self->_recipientIconView;
  if (recipientIconView != v5)
  {
    long long v7 = (objc_class *)MEMORY[0x1E4FB1ED8];
    id v11 = v5;
    id v8 = recipientIconView;
    id v9 = [v7 alloc];
    +[SBHIconManager defaultIconLayoutAnimationDuration];
    id v10 = objc_msgSend(v9, "initWithDuration:curve:animations:", 0, 0);
    [(SBIconView *)v8 setShowsDropGlow:0 animator:v10];
    [(SBIconView *)v11 setShowsDropGlow:1 animator:v10];
    objc_storeStrong((id *)&self->_recipientIconView, a3);

    [v10 startAnimation];
    if (!v11) {
      [(SBIconDragContext *)self setRecipientIconEntryRegion:0];
    }

    char v5 = v11;
  }
}

- (id)dragPreviewForIconView:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v5 = self->_dragPreviewForIconViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = self;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
      id v11 = [v10 icon];
      uint64_t v12 = [v4 icon];
      int v13 = [v11 isEqual:v12];

      if (v13) {
        break;
      }
      if ([v11 isPlaceholder])
      {
        id v14 = v11;
        long long v15 = [v4 icon];
        int v16 = [v14 referencesIcon:v15];

        if (v16)
        {
          long long v17 = [(NSMapTable *)v19->_dragPreviewForIconViews objectForKey:v10];

          goto LABEL_15;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    long long v17 = [(NSMapTable *)v19->_dragPreviewForIconViews objectForKey:v10];
LABEL_15:

    goto LABEL_16;
  }
LABEL_12:
  long long v17 = 0;
LABEL_16:

  return v17;
}

- (void)setDragPreview:(id)a3 forIconView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dragPreviewForIconViews = self->_dragPreviewForIconViews;
  if (!dragPreviewForIconViews)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    uint64_t v9 = self->_dragPreviewForIconViews;
    self->_dragPreviewForIconViews = v8;

    dragPreviewForIconViews = self->_dragPreviewForIconViews;
  }
  [(NSMapTable *)dragPreviewForIconViews setObject:v10 forKey:v6];
}

- (void)enumerateDragPreviewsUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_dragPreviewForIconViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      id v11 = [(NSMapTable *)self->_dragPreviewForIconViews objectForKey:v10];
      unsigned __int8 v12 = 0;
      v4[2](v4, v11, v10, &v12);
      LODWORD(v10) = v12;

      if (v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addAppLocalContext:(id)a3
{
  id v4 = a3;
  appLocalContexts = self->_appLocalContexts;
  id v8 = v4;
  if (!appLocalContexts)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_appLocalContexts;
    self->_appLocalContexts = v6;

    id v4 = v8;
    appLocalContexts = self->_appLocalContexts;
  }
  [(NSMutableSet *)appLocalContexts addObject:v4];
}

- (NSSet)appLocalContexts
{
  appLocalContexts = self->_appLocalContexts;
  if (appLocalContexts)
  {
    id v3 = appLocalContexts;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v3;
}

- (id)appDragLocalContextWithIconIdentifier:(id)a3
{
  id v4 = a3;
  appLocalContexts = self->_appLocalContexts;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SBIconDragContext_appDragLocalContextWithIconIdentifier___block_invoke;
  v10[3] = &unk_1E6AB3230;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSMutableSet *)appLocalContexts objectsPassingTest:v10];
  id v8 = [v7 anyObject];

  return v8;
}

uint64_t __59__SBIconDragContext_appDragLocalContextWithIconIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)resetLastUserInteractionDate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [(SBIconDragContext *)self setLastUserInteractionDate:v3];
}

- (void)setDestinationFolderIconView:(id)a3 forIconWithIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  destinationFolderIconViews = self->_destinationFolderIconViews;
  if (!destinationFolderIconViews)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_destinationFolderIconViews;
    self->_destinationFolderIconViews = v8;

    destinationFolderIconViews = self->_destinationFolderIconViews;
  }
  [(NSMutableDictionary *)destinationFolderIconViews setObject:v10 forKey:v6];
  [(SBIconDragContext *)self _addPrepareForDropAssertionForIconView:v10];
}

- (id)destinationFolderIconViewForIconWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_destinationFolderIconViews objectForKey:a3];
}

- (void)setDestinationStackIconView:(id)a3 forIconWithIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  destinationStackIconViews = self->_destinationStackIconViews;
  if (!destinationStackIconViews)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_destinationStackIconViews;
    self->_destinationStackIconViews = v8;

    destinationStackIconViews = self->_destinationStackIconViews;
  }
  [(NSMutableDictionary *)destinationStackIconViews setObject:v10 forKey:v6];
  [(SBIconDragContext *)self _addPrepareForDropAssertionForIconView:v10];
}

- (id)destinationStackIconViewForIconWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_destinationStackIconViews objectForKey:a3];
}

- (void)_addPrepareForDropAssertionForIconView:(id)a3
{
  id v4 = a3;
  iconViewPrepareForDropAssertions = self->_iconViewPrepareForDropAssertions;
  id v9 = v4;
  if (!iconViewPrepareForDropAssertions)
  {
    id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v7 = self->_iconViewPrepareForDropAssertions;
    self->_iconViewPrepareForDropAssertions = v6;

    id v4 = v9;
    iconViewPrepareForDropAssertions = self->_iconViewPrepareForDropAssertions;
  }
  id v8 = [v4 prepareForIconDrop];
  [(NSMapTable *)iconViewPrepareForDropAssertions setObject:v8 forKey:v9];
}

- (void)clearDropAssertionsForIconView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(NSMapTable *)self->_iconViewPrepareForDropAssertions objectForKey:v4];
  [v5 invalidate];
  [(NSMapTable *)self->_iconViewPrepareForDropAssertions removeObjectForKey:v4];
  id v6 = [(NSMapTable *)self->_iconViewDroppingAssertions objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [(NSMapTable *)self->_iconViewDroppingAssertions removeObjectForKey:v4];
}

- (void)clearAllDropAssertions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [(NSMapTable *)self->_iconViewPrepareForDropAssertions keyEnumerator];
  id v4 = [v3 allObjects];
  char v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SBIconDragContext *)self clearDropAssertionsForIconView:*(void *)(*((void *)&v21 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(NSMapTable *)self->_iconViewDroppingAssertions keyEnumerator];
  long long v11 = [v10 allObjects];
  long long v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SBIconDragContext *)self clearDropAssertionsForIconView:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)addDropAnimatingDragItem:(id)a3
{
  id v4 = a3;
  dropAnimatingDragItems = self->_dropAnimatingDragItems;
  id v8 = v4;
  if (!dropAnimatingDragItems)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_dropAnimatingDragItems;
    self->_dropAnimatingDragItems = v6;

    id v4 = v8;
    dropAnimatingDragItems = self->_dropAnimatingDragItems;
  }
  [(NSMutableSet *)dropAnimatingDragItems addObject:v4];
}

- (BOOL)isAnimatingDropForDragItem:(id)a3
{
  return [(NSMutableSet *)self->_dropAnimatingDragItems containsObject:a3];
}

- (id)initialIndexPathForIcon:(id)a3
{
  id v4 = [a3 nodeIdentifier];
  char v5 = [(SBIconDragContext *)self initialIndexPathForIconWithIdentifier:v4];

  return v5;
}

- (id)initialIndexPathForIconWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_initialIconPaths objectForKey:a3];
}

- (void)setInitialIndexPath:(id)a3 forIcon:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  initialIconPaths = self->_initialIconPaths;
  if (!initialIconPaths)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_initialIconPaths;
    self->_initialIconPaths = v8;

    initialIconPaths = self->_initialIconPaths;
  }
  uint64_t v10 = [v6 nodeIdentifier];
  [(NSMutableDictionary *)initialIconPaths setObject:v11 forKey:v10];
}

- (void)setAppDragLocalContext:(id)a3 forDragItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(SBIconDragContext *)self addAppLocalContext:v10];
  appDragLocalContexts = self->_appDragLocalContexts;
  if (!appDragLocalContexts)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v9 = self->_appDragLocalContexts;
    self->_appDragLocalContexts = v8;

    appDragLocalContexts = self->_appDragLocalContexts;
  }
  [(NSMapTable *)appDragLocalContexts setObject:v10 forKey:v6];
}

- (id)appDragLocalContextForDragItem:(id)a3
{
  return [(NSMapTable *)self->_appDragLocalContexts objectForKey:a3];
}

- (void)resetDraggedIconsHiddenAssertion
{
  id v3 = [(SBIconDragContext *)self draggedIconsHiddenAssertion];
  [v3 invalidate];
  [(SBIconDragContext *)self setDraggedIconsHiddenAssertion:0];
}

- (void)resetDragPlaceholder
{
  id v3 = [(SBIconDragContext *)self dragPlaceholder];
  [v3 invalidate];
  [(SBIconDragContext *)self setDragPlaceholder:0];
  [(SBIconDragContext *)self setDragPlaceholderListView:0];
  [(SBIconDragContext *)self setDragPlaceholderGridSizeClass:0];
}

- (NSString)dragPlaceholderGridSizeClass
{
  id v3 = self->_dragPlaceholderGridSizeClass;
  if (!v3)
  {
    id v4 = [(SBIconDragContext *)self draggedIcons];
    char v5 = [v4 firstObject];
    id v3 = [v5 gridSizeClass];
  }
  return v3;
}

- (void)setIconViewBorrowAssertion:(id)a3 forIconView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  if (!iconViewBorrowAssertions)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v9 = self->_iconViewBorrowAssertions;
    self->_iconViewBorrowAssertions = v8;

    iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  }
  [(NSMapTable *)iconViewBorrowAssertions setObject:v10 forKey:v6];
}

- (id)iconViewBorrowAssertionForIconView:(id)a3
{
  return [(NSMapTable *)self->_iconViewBorrowAssertions objectForKey:a3];
}

- (BOOL)hasIconViewBorrowAssertions
{
  return [(NSMapTable *)self->_iconViewBorrowAssertions count] != 0;
}

- (void)invalidateIconViewBorrowAssertions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = self->_iconViewBorrowAssertions;
  iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  self->_iconViewBorrowAssertions = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = v3;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[NSMapTable objectForKey:](v5, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        [v10 invalidate];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setBorrowedViewController:(id)a3 forIconView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  borrowedViewControllers = self->_borrowedViewControllers;
  if (!borrowedViewControllers)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    uint64_t v9 = self->_borrowedViewControllers;
    self->_borrowedViewControllers = v8;

    borrowedViewControllers = self->_borrowedViewControllers;
  }
  [(NSMapTable *)borrowedViewControllers setObject:v10 forKey:v6];
}

- (id)borrowedViewControllerForIconView:(id)a3
{
  return [(NSMapTable *)self->_borrowedViewControllers objectForKey:a3];
}

- (NSString)description
{
  return (NSString *)[(SBIconDragContext *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconDragContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v5 = [(SBIconDragContext *)self state];
  if (v5 > 6) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E6AB3250[v5];
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"state"];
  id v8 = (id)[v4 appendObject:self->_draggedIconsHiddenAssertion withName:@"draggedIconsHiddenAssertion" skipIfNil:1];
  dragPlaceholder = self->_dragPlaceholder;
  if (dragPlaceholder)
  {
    id v10 = (id)[v4 appendObject:dragPlaceholder withName:@"dragPlaceholder"];
    id v11 = (id)[v4 appendObject:self->_dragPlaceholderListView withName:@"dragPlaceholderListView"];
    long long v12 = SBHStringForIconGridSizeClass(self->_dragPlaceholderGridSizeClass);
    [v4 appendString:v12 withName:@"dragPlaceholderGridSizeClass"];
  }
  id v13 = (id)[v4 appendObject:self->_grabbedIconViews withName:@"grabbedIconViews" skipIfNil:1];
  id v14 = (id)[v4 appendObject:self->_itemIdentifiers withName:@"itemIdentifiers" skipIfNil:1];
  id v15 = (id)[v4 appendObject:self->_sourceIcons withName:@"sourceIcons" skipIfNil:1];
  id v16 = (id)[v4 appendObject:self->_sourceIconViews withName:@"sourceIconViews" skipIfNil:1];
  id v17 = (id)[v4 appendObject:self->_primaryIconView withName:@"primaryIconView" skipIfNil:1];
  id v18 = (id)[v4 appendObject:self->_destinationIconViews withName:@"destinationIconViews" skipIfNil:1];
  id v19 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconDragContext performedIconDrop](self, "performedIconDrop"), @"performedIconDrop", 1);
  id v20 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconDragContext isCancelled](self, "isCancelled"), @"cancelled", 1);
  id v21 = (id)[v4 appendObject:self->_messageExpectations withName:@"messageExpectations" skipIfNil:1];
  id v22 = (id)[v4 appendObject:self->_enteredIconListViews withName:@"enteredIconListViews" skipIfNil:1];
  id v23 = (id)[v4 appendObject:self->_targetsForCancellingIconViews withName:@"targetsForCancellingIconViews" skipIfNil:1];
  id v24 = (id)[v4 appendObject:self->_recipientIconView withName:@"recipientIconView" skipIfNil:1];
  id v25 = (id)[v4 appendObject:self->_dragPreviewForIconViews withName:@"dragPreviewForIconViews" skipIfNil:1];
  id v26 = (id)[v4 appendObject:self->_appLocalContexts withName:@"appLocalContexts" skipIfNil:1];
  id v27 = (id)[v4 appendObject:self->_lastUserInteractionDate withName:@"lastUserInteractionDate" skipIfNil:1];
  id v28 = (id)[v4 appendObject:self->_destinationFolderIconViews withName:@"destinationFolderIconViews" skipIfNil:1];
  id v29 = (id)[v4 appendObject:self->_dropAnimatingDragItems withName:@"dropAnimatingDragItems" skipIfNil:1];
  id v30 = (id)[v4 appendBool:self->_notifiedDelegateForDropSession withName:@"notifiedDelegateForDropSession"];
  id v31 = (id)[v4 appendObject:self->_droppedIcons withName:@"droppedIcons" skipIfNil:1];
  id v32 = (id)[v4 appendBool:self->_dragItemWasConsumedExternally withName:@"dragItemWasConsumedExternally" ifEqualTo:1];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconDragContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (BOOL)isExternalDrag
{
  return self->_externalDrag;
}

- (void)setExternalDrag:(BOOL)a3
{
  self->_externalDrag = a3;
}

- (BOOL)isSnapToGridAllowed
{
  return self->_snapToGridAllowed;
}

- (void)setSnapToGridAllowed:(BOOL)a3
{
  self->_snapToGridAllowed = a3;
}

- (SBHIconLayoutHidingUpdating)draggedIconsHiddenAssertion
{
  return self->_draggedIconsHiddenAssertion;
}

- (void)setDraggedIconsHiddenAssertion:(id)a3
{
}

- (SBIconListViewPlaceholderPositioning)dragPlaceholder
{
  return self->_dragPlaceholder;
}

- (void)setDragPlaceholder:(id)a3
{
}

- (SBIconListView)dragPlaceholderListView
{
  return self->_dragPlaceholderListView;
}

- (void)setDragPlaceholderListView:(id)a3
{
}

- (void)setDragPlaceholderGridSizeClass:(id)a3
{
}

- (NSArray)grabbedIconViews
{
  return self->_grabbedIconViews;
}

- (void)setGrabbedIconViews:(id)a3
{
}

- (NSArray)createdApplicationIcons
{
  return self->_createdApplicationIcons;
}

- (void)setCreatedApplicationIcons:(id)a3
{
}

- (NSArray)createdWidgetIcons
{
  return self->_createdWidgetIcons;
}

- (void)setCreatedWidgetIcons:(id)a3
{
}

- (NSArray)externallyDraggedIcons
{
  return self->_externallyDraggedIcons;
}

- (void)setExternallyDraggedIcons:(id)a3
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (NSSet)removedMatchingLeafIcons
{
  return self->_removedMatchingLeafIcons;
}

- (void)setRemovedMatchingLeafIcons:(id)a3
{
}

- (void)setDroppedIcons:(id)a3
{
}

- (SBIconView)primaryIconView
{
  return self->_primaryIconView;
}

- (void)setPrimaryIconView:(id)a3
{
}

- (BOOL)duplicatesSourceIcons
{
  return self->_duplicatesSourceIcons;
}

- (void)setDuplicatesSourceIcons:(BOOL)a3
{
  self->_duplicatesSourceIcons = a3;
}

- (BOOL)performedIconDrop
{
  return self->_performedIconDrop;
}

- (void)setPerformedIconDrop:(BOOL)a3
{
  self->_performedIconDrop = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)dragItemWasConsumedExternally
{
  return self->_dragItemWasConsumedExternally;
}

- (void)setDragItemWasConsumedExternally:(BOOL)a3
{
  self->_dragItemWasConsumedExternally = a3;
}

- (SBIconListView)currentEnteredIconListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEnteredIconListView);
  return (SBIconListView *)WeakRetained;
}

- (void)setCurrentEnteredIconListView:(id)a3
{
}

- (CGPoint)currentEnteredIconListViewLastLocation
{
  double x = self->_currentEnteredIconListViewLastLocation.x;
  double y = self->_currentEnteredIconListViewLastLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentEnteredIconListViewLastLocation:(CGPoint)a3
{
  self->_currentEnteredIconListViewLastLocation = a3;
}

- (double)currentEnteredIconListViewDragDistance
{
  return self->_currentEnteredIconListViewDragDistance;
}

- (void)setCurrentEnteredIconListViewDragDistance:(double)a3
{
  self->_currentEnteredIconListViewDragDistance = a3;
}

- (SBIconView)recipientIconView
{
  return self->_recipientIconView;
}

- (SBIcon)candidateRecipientIcon
{
  return self->_candidateRecipientIcon;
}

- (void)setCandidateRecipientIcon:(id)a3
{
}

- (unint64_t)recipientIconEntryRegion
{
  return self->_recipientIconEntryRegion;
}

- (void)setRecipientIconEntryRegion:(unint64_t)a3
{
  self->_recipientIconEntryRegion = a3;
}

- (NSDate)lastUserInteractionDate
{
  return self->_lastUserInteractionDate;
}

- (void)setLastUserInteractionDate:(id)a3
{
}

- (NSTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
}

- (CGPoint)initialTouchOffsetFromIconImageCenter
{
  double x = self->_initialTouchOffsetFromIconImageCenter.x;
  double y = self->_initialTouchOffsetFromIconImageCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTouchOffsetFromIconImageCenter:(CGPoint)a3
{
  self->_initialTouchOffsetFromIconImageCenter = a3;
}

- (BOOL)notifiedDelegateForDropSession
{
  return self->_notifiedDelegateForDropSession;
}

- (void)setNotifiedDelegateForDropSession:(BOOL)a3
{
  self->_notifiedDelegateForDropSession = a3;
}

- (BSInvalidatable)destinationStackIconViewPauseLayoutAssertion
{
  return self->_destinationStackIconViewPauseLayoutAssertion;
}

- (void)setDestinationStackIconViewPauseLayoutAssertion:(id)a3
{
}

- (BOOL)wasLastUpdateContainedInDestinationIconListView
{
  return self->_wasLastUpdateContainedInDestinationIconListView;
}

- (void)setWasLastUpdateContainedInDestinationIconListView:(BOOL)a3
{
  self->_wasLastUpdateContainedInDestinationIconListView = a3;
}

- (BOOL)isWaitingToSetPlaceholderViewController
{
  return self->_waitingToSetPlaceholderViewController;
}

- (void)setWaitingToSetPlaceholderViewController:(BOOL)a3
{
  self->_waitingToSetPlaceholderViewController = a3;
}

- (int64_t)dragRejectionReason
{
  return self->_dragRejectionReason;
}

- (void)setDragRejectionReason:(int64_t)a3
{
  self->_dragRejectionReason = a3;
}

- (NSTimer)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setPauseTimer:(id)a3
{
}

- (CGPoint)pauseLocation
{
  double x = self->_pauseLocation.x;
  double y = self->_pauseLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPauseLocation:(CGPoint)a3
{
  self->_pauseLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_destinationStackIconViewPauseLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_lastUserInteractionDate, 0);
  objc_storeStrong((id *)&self->_candidateRecipientIcon, 0);
  objc_storeStrong((id *)&self->_recipientIconView, 0);
  objc_destroyWeak((id *)&self->_currentEnteredIconListView);
  objc_storeStrong((id *)&self->_primaryIconView, 0);
  objc_storeStrong((id *)&self->_removedMatchingLeafIcons, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_externallyDraggedIcons, 0);
  objc_storeStrong((id *)&self->_createdWidgetIcons, 0);
  objc_storeStrong((id *)&self->_createdApplicationIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIconViews, 0);
  objc_storeStrong((id *)&self->_dragPlaceholderGridSizeClass, 0);
  objc_storeStrong((id *)&self->_dragPlaceholderListView, 0);
  objc_storeStrong((id *)&self->_dragPlaceholder, 0);
  objc_storeStrong((id *)&self->_draggedIconsHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_discardedSourceIconViews, 0);
  objc_storeStrong((id *)&self->_borrowedViewControllers, 0);
  objc_storeStrong((id *)&self->_iconViewBorrowAssertions, 0);
  objc_storeStrong((id *)&self->_droppedIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIcons, 0);
  objc_storeStrong((id *)&self->_additionalMatchingDroppedIcons, 0);
  objc_storeStrong((id *)&self->_iconViewDroppingAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewPrepareForDropAssertions, 0);
  objc_storeStrong((id *)&self->_appDragLocalContexts, 0);
  objc_storeStrong((id *)&self->_initialIconPaths, 0);
  objc_storeStrong((id *)&self->_dropAnimatingDragItems, 0);
  objc_storeStrong((id *)&self->_destinationStackIconViews, 0);
  objc_storeStrong((id *)&self->_destinationFolderIconViews, 0);
  objc_storeStrong((id *)&self->_appLocalContexts, 0);
  objc_storeStrong((id *)&self->_dragPreviewForIconViews, 0);
  objc_storeStrong((id *)&self->_targetsForCancellingIconViews, 0);
  objc_storeStrong((id *)&self->_enteredIconListViews, 0);
  objc_storeStrong((id *)&self->_messageExpectations, 0);
  objc_storeStrong((id *)&self->_destinationIconViews, 0);
  objc_storeStrong((id *)&self->_sourceIconViews, 0);
  objc_storeStrong((id *)&self->_sourceIcons, 0);
}

@end
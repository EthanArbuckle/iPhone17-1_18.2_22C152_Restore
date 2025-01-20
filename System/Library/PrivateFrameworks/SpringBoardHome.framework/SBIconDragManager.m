@interface SBIconDragManager
+ (void)cancelAllDrags;
+ (void)enumerateAppDragContextsInDragItems:(id)a3 usingBlock:(id)a4;
+ (void)enumerateMedusaPlatterDragPreviewsInDragItems:(id)a3 usingBlock:(id)a4;
- (BOOL)_isTrackingDrag:(id)a3;
- (BOOL)_isTrackingDragWithIdentifier:(id)a3;
- (BOOL)_shouldPerformRippleAnimationForInsertingDragItem:(id)a3 toIconListView:(id)a4;
- (BOOL)allowsNestedFolders;
- (BOOL)canAcceptDropInSession:(id)a3 inIconListView:(id)a4;
- (BOOL)canHandleIconDropSession:(id)a3 inIconListView:(id)a4;
- (BOOL)canMakeIconViewRecipient:(id)a3;
- (BOOL)canSnapToGridBasedOnContentOfListModel:(id)a3 withDragIdentifier:(id)a4;
- (BOOL)canSnapToGridInIconLocation:(id)a3;
- (BOOL)createsStacksFromWidgets;
- (BOOL)doesIconLocationRepresentRealIconPosition:(id)a3;
- (BOOL)doesIconRepresentRealIconPosition:(id)a3 dragIdentifier:(id)a4;
- (BOOL)doesIconRepresentRealIconPosition:(id)a3 inLocation:(id)a4;
- (BOOL)doesIconViewRepresentRealIconPosition:(id)a3;
- (BOOL)dragsSupportSystemDragsForIconView:(id)a3;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4;
- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5;
- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)isDelegateScrolling;
- (BOOL)isEditing;
- (BOOL)isEditingAllowedForListView:(id)a3;
- (BOOL)isEditingForListView:(id)a3;
- (BOOL)isIconContentPossiblyVisibleOverApplication;
- (BOOL)isIconDragging;
- (BOOL)isModifyingRootFolder;
- (BOOL)isRootFolderContentVisible;
- (BOOL)isSnapToGridAllowed;
- (BOOL)isSnapToGridEnabledForDragWithIdentifier:(id)a3 iconLocation:(id)a4 listModel:(id)a5 placeholderGridSizeClass:(id)a6;
- (BOOL)isTrackingActiveDragOfIcon:(id)a3;
- (BOOL)isTrackingActiveOrDroppingIconDrags;
- (BOOL)isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView:(id)a3;
- (BOOL)isTrackingDragMatchingPredicate:(id)a3;
- (BOOL)isTrackingDragOfIcon:(id)a3;
- (BOOL)isTrackingDragOriginatingFromIconView:(id)a3;
- (BOOL)isTrackingDragOriginatingFromOrDroppingIntoIconView:(id)a3 otherThanDragWithIdentifier:(id)a4;
- (BOOL)isTrackingDragWithGhostTreatmentForIcon:(id)a3;
- (BOOL)isTrackingDropIntoDestinationIconView:(id)a3;
- (BOOL)isTrackingDroppingIconDrags;
- (BOOL)isTrackingMultipleIconDrags;
- (BOOL)isTrackingMultipleItemIconDrags;
- (BOOL)isTrackingUserActiveDragOriginatingFromIconView:(id)a3;
- (BOOL)isTrackingUserActiveIconDrags;
- (BOOL)isTrackingWidgetIconDrags;
- (BOOL)isTrackingWidgetStackIconDrags;
- (BOOL)isUndoEnabled;
- (BOOL)movePlaceholderForDraggedIcons:(id)a3 toGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6;
- (BOOL)performIconDropInDestinationListIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 placeholderGridPath:(id)a5 placeholderGridSizeClass:(id)a6 dropSession:(id)a7;
- (BOOL)performIconDropInParentFolderIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5;
- (BOOL)performIconDropOnRecipientIconIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5;
- (BOOL)prioritizesDirectIconPlacement;
- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3;
- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3 placeholderPath:(id *)a4;
- (BOOL)shouldAllowSpringLoadedInteractionForIconDropSession:(id)a3 onIconView:(id)a4;
- (BOOL)shouldBeginEditingWhenDragBegins;
- (BOOL)shouldCancelDragsWhenEditingEnds;
- (BOOL)shouldDisallowBumpingIconsFromCurrentList;
- (BOOL)shouldMinimizeLayoutDisruptionForIconLocation:(id)a3;
- (BOOL)shouldUseGhostIconForIconView:(id)a3;
- (BOOL)shouldUseIconCenterForDragPositionForIcon:(id)a3;
- (BOOL)swapTrackedIconWithIdentifier:(id)a3 withIcon:(id)a4;
- (CGPoint)adjustedLocationForDropSession:(id)a3 inView:(id)a4;
- (NSString)description;
- (SBIconDragManager)init;
- (SBIconDragManagerDelegate)delegate;
- (SBIconDraggingEditContext)draggingEditContext;
- (double)additionalDragLiftScaleForIconView:(id)a3;
- (double)defaultIconLayoutAnimationDuration;
- (double)delayAfterAfterLiftPreviewToBeginEditing;
- (double)placeholderRepositioningDelay;
- (id)_applicationBundleIdentifierForDragItem:(id)a3;
- (id)_iconForDragItem:(id)a3 inIconListView:(id)a4;
- (id)_iconIdentifierForDragItem:(id)a3;
- (id)_iconViewForDragItem:(id)a3 inIconListView:(id)a4;
- (id)_windowForDragPreviewsForPlatterView:(id)a3 forWindowScene:(id)a4;
- (id)allDragIdentifiers;
- (id)appDragLocalContextForDragItem:(id)a3;
- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dragItemsForIconView:(id)a3;
- (id)dragPlaceholderGridPathForDragWithIdentifier:(id)a3;
- (id)dragPlaceholderPathForDragWithIdentifier:(id)a3;
- (id)draggedIconForIdentifier:(id)a3;
- (id)draggedIconIdentifiersForDragDropSession:(id)a3;
- (id)draggedIconsForDragDropSession:(id)a3;
- (id)draggedIconsForIdentifiers:(id)a3;
- (id)duplicateIconsIfNecessary:(id)a3 forDropSession:(id)a4;
- (id)firstHiddenIconIdentifierInDrag:(id)a3;
- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6;
- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)gridSizeClassDomain;
- (id)iconDragContextForDragDropSession:(id)a3;
- (id)iconDragContextForDragItem:(id)a3;
- (id)iconDragContextForDragSession:(id)a3;
- (id)iconDragContextForDragWithIdentifier:(id)a3;
- (id)iconDragContextForDropSession:(id)a3;
- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4;
- (id)iconLayoutHider;
- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4;
- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5;
- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5;
- (id)iconListViewContainingIcon:(id)a3;
- (id)iconListViewForIndexPath:(id)a3;
- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6;
- (id)iconViewWillCancelDrag:(id)a3;
- (id)launchActionsForIconView:(id)a3;
- (id)launchURLForIconView:(id)a3;
- (id)leafIconForIdentifier:(id)a3;
- (id)leafIconsInList:(id)a3 matchingApplicationBundleIdentifierOfIcons:(id)a4;
- (id)localizedFolderNameForCombiningIcon:(id)a3 withIcon:(id)a4;
- (id)model;
- (id)rootFolder;
- (id)rootListModel;
- (id)rootListView;
- (id)rootView;
- (id)startForbiddingAccessoryUpdatesInFoldersInIconListView:(id)a3;
- (id)startingIconLocationForIcon:(id)a3 dragIdentifier:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)undoProvider;
- (id)uniqueIdentifierForIconDragSession:(id)a3;
- (id)uniqueIdentifierForIconDropSession:(id)a3;
- (int64_t)_animationTypeForGridSizeClass:(id)a3;
- (int64_t)_animationTypeForGridSizeClass:(id)a3 inIconListView:(id)a4 draggedIconCount:(unint64_t)a5;
- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4;
- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6;
- (int64_t)reasonForRejectingDropInSession:(id)a3 inIconListView:(id)a4;
- (unint64_t)countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:(id)a3;
- (unint64_t)folderMutationOptionsForInsertingIcon:(id)a3 intoList:(id)a4 inLocation:(id)a5 isSnapToGridEnabled:(BOOL)a6;
- (unint64_t)iconLayoutHidingOptions;
- (unint64_t)listGridCellInfoOptions;
- (unint64_t)maximumAllowedIconDroppingAnimationsForListView:(id)a3;
- (unint64_t)placeholderGridCellIndexForDragPlacement:(int64_t)a3 onGridCellIndex:(unint64_t)a4 icon:(id)a5 inListView:(id)a6 forDragWithIdentifier:(id)a7;
- (unint64_t)placeholderOptionsForListView:(id)a3 forDragWithIdentifier:(id)a4;
- (void)_cleanUpAllDraggingState;
- (void)_handleScaleAdjustmentForDropSession:(id)a3 currentListView:(id)a4;
- (void)_invalidateAutoScrollAssistant;
- (void)_removeDraggedIconsFromLayout:(id)a3 iconLocation:(id)a4 dragIdentifier:(id)a5;
- (void)_startTrackingDragWithIdentifier:(id)a3 session:(id)a4;
- (void)_startTrackingDragWithIdentifier:(id)a3 session:(id)a4 primaryIconView:(id)a5;
- (void)_stopTrackingDragIfPossibleWithIdentifier:(id)a3;
- (void)_stopTrackingDragWithIdentifier:(id)a3;
- (void)_teardownWaitRunloopObserverIfNeeded;
- (void)_updateAutoScrollAssistantForDropSession:(id)a3;
- (void)_updateDragDistanceForDropSession:(id)a3 currentIconListLocation:(CGPoint)a4;
- (void)_updateDragPreviewIconViewForDropSession:(id)a3 inIconListView:(id)a4;
- (void)_updateDragPreviewsForEditingState:(BOOL)a3 animated:(BOOL)a4;
- (void)addAppLocalContextsFromDragItems:(id)a3 toDragWithIdentifier:(id)a4;
- (void)addApplicationIconsFromDragItems:(id)a3 session:(id)a4 toDragWithIdentifier:(id)a5;
- (void)addIcons:(id)a3 intoFolderIcon:(id)a4 openFolderOnFinish:(BOOL)a5;
- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4;
- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4 interfaceOrientation:(int64_t)a5;
- (void)autoScrollAssistant:(id)a3 triggeredAutoScrollInDirection:(int64_t)a4;
- (void)beginModifyingRootFolder;
- (void)cancelAllDrags;
- (void)cancelEditingAndAllDrags;
- (void)changeStateOfDragWithIdentifier:(id)a3 toState:(int64_t)a4;
- (void)clearAllUndoRegistrations;
- (void)closeFolderControllerContainingListView:(id)a3;
- (void)compactAndLayoutRootIconLists;
- (void)compactAndLayoutRootIconListsWithDuration:(double)a3;
- (void)concludeIconDrop:(id)a3;
- (void)configureIconView:(id)a3;
- (void)createIconsFromDragItemsIfNecessary:(id)a3 withDragIdentifier:(id)a4;
- (void)dealloc;
- (void)endModifyingRootFolder;
- (void)enumerateIconDragContextsUsingBlock:(id)a3;
- (void)enumerateIconDragIdentifiersUsingBlock:(id)a3;
- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6;
- (void)handleIconView:(id)a3 dragSession:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)handleIconView:(id)a3 dragSession:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)iconDropSessionDidEnd:(id)a3;
- (void)iconDropSessionDidEnter:(id)a3 inIconListView:(id)a4;
- (void)iconDropSessionDidExit:(id)a3 fromIconListView:(id)a4;
- (void)iconListView:(id)a3 concludeIconDrop:(id)a4;
- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4;
- (void)iconListView:(id)a3 performIconDrop:(id)a4;
- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4;
- (void)iconListView:(id)a3 willConfigureIconView:(id)a4 forIcon:(id)a5;
- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5;
- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4;
- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5;
- (void)iconView:(id)a3 willAddDragItems:(id)a4 toSession:(id)a5;
- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5;
- (void)iconView:(id)a3 willUsePreviewForCancelling:(id)a4 targetIconView:(id)a5;
- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4;
- (void)informQuickActionPlatterDidFinishPresentation:(id)a3;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)modifyRootFolderUsingBlock:(id)a3 orRootListModelUsingBlock:(id)a4;
- (void)noteDragItemWasConsumedExternallyForDropSession:(id)a3;
- (void)noteFolderBeganScrolling;
- (void)noteFolderControllerDidClose:(id)a3;
- (void)noteFolderControllerWillOpen;
- (void)noteIconManagerEditingDidChange;
- (void)noteIconTapped;
- (void)noteRootFolderDidMutate;
- (void)pauseTimerDidFire:(id)a3;
- (void)performBeforeRunLoopWaitsUsingBlock:(id)a3;
- (void)performBlocksBeforeRunLoopWait;
- (void)performIconDrop:(id)a3 inIconListView:(id)a4;
- (void)performSpringLoadedInteractionForIconDragOnIconView:(id)a3;
- (void)pruneCancelableSourceFoldersInDestinationListView:(id)a3 withDragIdentifier:(id)a4;
- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)pushExpandedIconView:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)registerUndoWithUndoManager:(id)a3 preparation:(id)a4 draggedIcons:(id)a5;
- (void)removeEmptyFolders;
- (void)removeEmptyFoldersInFolder:(id)a3;
- (void)removeEmptyFoldersInListModel:(id)a3;
- (void)removeNearestLeafIconsMatchingIcons:(id)a3 inList:(id)a4 dragContext:(id)a5;
- (void)removePlatterViewFromMedusaDragOffscreenWindow:(id)a3;
- (void)resetWatchdogTimerForDragWithIdentifier:(id)a3 timeout:(double)a4;
- (void)scrollToIconListContainingIcon:(id)a3 animated:(BOOL)a4;
- (void)setCreatesStacksFromWidgets:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggingEditContext:(id)a3;
- (void)setIndexPath:(id)a3 whenRevertingIconsWithPathPrefix:(id)a4;
- (void)setModifyingRootFolder:(BOOL)a3;
- (void)setPlaceholderRepositioningDelay:(double)a3;
- (void)setPrioritizesDirectIconPlacement:(BOOL)a3;
- (void)startPlaceholderPauseTimerWithDragLocation:(CGPoint)a3 withDragIdentifier:(id)a4;
- (void)startTrackingDragLocationForEditingFromDropSession:(id)a3 orDragSession:(id)a4;
- (void)stopPlaceholderPauseTimerWithDragLocationWithDragIdentifier:(id)a3;
- (void)stopTrackingDragLocationForEditingForDragWithIdentifier:(id)a3;
- (void)updateDragPauseForDragWithIdentifier:(id)a3;
- (void)updatePlaceholderPositionForDragWithIdentifier:(id)a3;
- (void)updatePlaceholderPositionIfNecessaryForDragWithIdentifier:(id)a3;
- (void)watchdogDragWithIdentifier:(id)a3;
- (void)watchdogTimerDidFire:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBIconDragManager

- (void)enumerateIconDragContextsUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  v5 = (void *)[(NSMapTable *)self->_iconDrags copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
      v12 = [v6 objectForKey:v11];
      unsigned __int8 v13 = 0;
      v4[2](v4, v12, v11, &v13);
      LODWORD(v11) = v13;

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)isIconDragging
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SBIconDragManager_isIconDragging__block_invoke;
  v4[3] = &unk_1E6AAD948;
  v4[4] = &v5;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)configureIconView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 icon];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SBIconDragManager_configureIconView___block_invoke;
  v8[3] = &unk_1E6AADAB8;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
}

- (BOOL)isTrackingMultipleItemIconDrags
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SBIconDragManager_isTrackingMultipleItemIconDrags__block_invoke;
  v4[3] = &unk_1E6AAD948;
  v4[4] = &v5;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isTrackingDropIntoDestinationIconView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke;
  v7[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDragOriginatingFromIconView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBIconDragManager_isTrackingDragOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDragMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBIconDragManager_isTrackingDragMatchingPredicate___block_invoke;
  v7[3] = &unk_1E6AADA00;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDroppingIconDrags
{
  return [(SBIconDragManager *)self isTrackingDragMatchingPredicate:&__block_literal_global_67];
}

- (BOOL)isTrackingUserActiveIconDrags
{
  return [(SBIconDragManager *)self isTrackingDragMatchingPredicate:&__block_literal_global_9];
}

- (void)noteFolderBeganScrolling
{
  char v2 = SBLogIconDragging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_INFO, "noting folder began scrolling", v3, 2u);
  }
}

- (void)noteIconTapped
{
  char v2 = SBLogIconDragging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_INFO, "noting icon tapped", v3, 2u);
  }
}

- (void)noteFolderControllerWillOpen
{
  unint64_t v3 = [(SBIconDragManager *)self iconLayoutHidingOptions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBIconDragManager_noteFolderControllerWillOpen__block_invoke;
  v4[3] = &__block_descriptor_40_e34_v32__0__SBIconDragContext_8_16_B24l;
  v4[4] = v3;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v4];
}

- (unint64_t)iconLayoutHidingOptions
{
  unint64_t v3 = [(SBIconDragManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 isAnimatingFolderIconTransitionForIconDragManager:self] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && [v3 isFolderOpenForIconDragManager:self])
  {
    unint64_t v4 = 37;
  }
  else
  {
    unint64_t v4 = 45;
  }

  return v4;
}

- (SBIconDragManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconDragManagerDelegate *)WeakRetained;
}

- (SBIconDragManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBIconDragManager;
  char v2 = [(SBIconDragManager *)&v9 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_createsStacksFromWidgets = 1;
    objc_initWeak(&location, v2);
    id v4 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v7, &location);
    id v5 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

__CFString *__25__SBIconDragManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained description];
  if (![(__CFString *)v2 length])
  {

    char v2 = @"(null description)";
  }

  return v2;
}

- (void)dealloc
{
  [(SBIconDragManager *)self _teardownWaitRunloopObserverIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)SBIconDragManager;
  [(SBIconDragManager *)&v3 dealloc];
}

- (BOOL)isUndoEnabled
{
  return 1;
}

- (BOOL)isSnapToGridAllowed
{
  objc_super v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 allowsSnappingIconsToGridForIconDragManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canSnapToGridInIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconDragManager:self canSnapIconsToGridInLocation:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)canSnapToGridBasedOnContentOfListModel:(id)a3 withDragIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasFixedIconLocations])
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_super v9 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v7];
    [v9 draggedIcons];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(v6, "directlyContainsIcon:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
          {

            BOOL v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [v9 currentEnteredIconListViewDragDistance];
    BOOL v8 = v15 > 30.0;
LABEL_13:
  }
  return v8;
}

- (BOOL)isSnapToGridEnabledForDragWithIdentifier:(id)a3 iconLocation:(id)a4 listModel:(id)a5 placeholderGridSizeClass:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v13];
  char v15 = [v14 isSnapToGridAllowed];
  BOOL v16 = [(SBIconDragManager *)self canSnapToGridInIconLocation:v12];

  LOBYTE(v12) = [v11 isInsertionFixedForIconGridSizeClass:v10 options:128];
  LOBYTE(self) = [(SBIconDragManager *)self canSnapToGridBasedOnContentOfListModel:v11 withDragIdentifier:v13];

  return v15 & v16 & v12 & self;
}

- (id)model
{
  char v2 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [v2 iconModel];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)rootFolder
{
  objc_super v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 rootFolderForIconDragManager:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)rootListModel
{
  objc_super v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 rootListModelForIconDragManager:self];
  }
  else
  {
    id v5 = [(SBIconDragManager *)self rootListView];
    id v4 = [v5 model];
  }
  return v4;
}

- (void)modifyRootFolderUsingBlock:(id)a3 orRootListModelUsingBlock:(id)a4
{
  objc_super v9 = (void (**)(id, void *))a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(SBIconDragManager *)self rootFolder];
  if (v7)
  {
    v9[2](v9, v7);
  }
  else
  {
    BOOL v8 = [(SBIconDragManager *)self rootListModel];
    if (v8) {
      v6[2](v6, v8);
    }
  }
}

- (id)leafIconForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self model];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 leafIconForIdentifier:v4];
  }
  else
  {
    BOOL v8 = [(SBIconDragManager *)self rootFolder];
    objc_super v9 = v8;
    if (v8)
    {
      id v10 = [v8 iconWithIdentifier:v4];
      if ([v10 isLeafIcon]) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
      id v7 = v11;
    }
    else
    {
      id v12 = [(SBIconDragManager *)self rootListModel];
      id v10 = v12;
      if (v12)
      {
        id v13 = [v12 directlyContainedIconWithIdentifier:v4];
        if ([v13 isLeafIcon]) {
          long long v14 = v13;
        }
        else {
          long long v14 = 0;
        }
        id v7 = v14;
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  return v7;
}

- (id)gridSizeClassDomain
{
  char v2 = [(SBIconDragManager *)self model];
  objc_super v3 = [v2 gridSizeClassDomain];

  return v3;
}

- (double)defaultIconLayoutAnimationDuration
{
  objc_super v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v3 defaultIconLayoutAnimationDurationForIconDragManager:self];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.225;
  }

  return v5;
}

- (BOOL)isEditing
{
  char v2 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 isEditing];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isEditingForListView:(id)a3
{
  id v4 = a3;
  if ([(SBIconDragManager *)self isEditing])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(SBIconDragManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 isEditingForIconListView:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isEditingAllowedForListView:(id)a3
{
  id v4 = a3;
  char v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 isEditingAllowedForIconListView:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isRootFolderContentVisible
{
  char v2 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 isRootFolderContentVisible];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isIconContentPossiblyVisibleOverApplication
{
  char v2 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 isIconContentPossiblyVisibleOverApplication];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)rootView
{
  char v3 = [(SBIconDragManager *)self delegate];
  id v4 = [v3 rootViewForIconDragManager:self];

  return v4;
}

- (id)rootListView
{
  char v2 = [(SBIconDragManager *)self rootView];
  char v3 = self;
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)iconListViewForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 iconListViewForIndexPath:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)iconListViewContainingIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self rootFolder];
  char v6 = [v5 indexPathForIcon:v4];

  if (v6) {
    [(SBIconDragManager *)self iconListViewForIndexPath:v6];
  }
  else {
  id v7 = [(SBIconDragManager *)self rootListView];
  }

  return v7;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 layoutIconListsWithAnimationType:a3 forceRelayout:v4];
  }
}

- (void)scrollToIconListContainingIcon:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconDragManager:self wantsScrollToIconListContainingIcon:v7 animated:v4];
  }
}

- (unint64_t)listGridCellInfoOptions
{
  char v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 listGridCellInfoOptionsForIconDragManager:self];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)iconLayoutHider
{
  char v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 iconLayoutHiderForIconDragManager:self];
  }
  else {
  unint64_t v4 = [(SBIconDragManager *)self rootListView];
  }

  return v4;
}

- (void)_cleanUpAllDraggingState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  iconDrags = self->_iconDrags;
  self->_iconDrags = 0;

  uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
  self->_uniqueIdentifiersPerDropSession = 0;

  uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
  self->_uniqueIdentifiersPerDragSession = 0;

  if ([(NSMutableArray *)self->_singleUseDragWindows count]) {
    NSLog(&cfstr_SingleUseDragW.isa);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_singleUseDragWindows;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setHidden:", 1, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t __35__SBIconDragManager_isIconDragging__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)isTrackingMultipleIconDrags
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconDragManager_isTrackingMultipleIconDrags__block_invoke;
  v4[3] = &unk_1E6AAD948;
  v4[4] = &v5;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v4];
  BOOL v2 = (unint64_t)v6[3] > 1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SBIconDragManager_isTrackingMultipleIconDrags__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 state];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

uint64_t __52__SBIconDragManager_isTrackingMultipleItemIconDrags__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)isTrackingDragOfIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 nodeIdentifier];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SBIconDragManager_isTrackingDragOfIcon___block_invoke;
  v8[3] = &unk_1E6AAD970;
  uint64_t v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __42__SBIconDragManager_isTrackingDragOfIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 itemIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 containsObject:*(void *)(a1 + 32)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)isTrackingActiveDragOfIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 nodeIdentifier];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SBIconDragManager_isTrackingActiveDragOfIcon___block_invoke;
  v8[3] = &unk_1E6AAD970;
  uint64_t v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __48__SBIconDragManager_isTrackingActiveDragOfIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 itemIdentifiers];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];
  if (v7) {
    LOBYTE(v7) = [v8 isUserActive];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t __59__SBIconDragManager_isTrackingDragOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hasSourceIconView:*(void *)(a1 + 32)];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isTrackingUserActiveDragOriginatingFromIconView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SBIconDragManager_isTrackingUserActiveDragOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __69__SBIconDragManager_isTrackingUserActiveDragOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSourceIconView:*(void *)(a1 + 32)]
    && [v3 isUserActive])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__SBIconDragManager_isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __82__SBIconDragManager_isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSourceIconView:*(void *)(a1 + 32)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 state] == 1;
  }
}

void __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke_2;
  v6[3] = &unk_1E6AAD6B8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 enumerateDestinationIconViewsUsingBlock:v6];
}

uint64_t __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __50__SBIconDragManager_isTrackingUserActiveIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isUserActive];
}

BOOL __48__SBIconDragManager_isTrackingDroppingIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 5;
}

- (BOOL)isTrackingActiveOrDroppingIconDrags
{
  return [(SBIconDragManager *)self isTrackingDragMatchingPredicate:&__block_literal_global_69];
}

BOOL __56__SBIconDragManager_isTrackingActiveOrDroppingIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 state] - 3) < 3;
}

- (BOOL)isTrackingWidgetIconDrags
{
  return [(SBIconDragManager *)self isTrackingDragMatchingPredicate:&__block_literal_global_71];
}

uint64_t __46__SBIconDragManager_isTrackingWidgetIconDrags__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 draggedIcons];
  uint64_t v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_74);

  return v3;
}

uint64_t __46__SBIconDragManager_isTrackingWidgetIconDrags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3 == @"SBHIconGridSizeClassDefault")
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  return v5;
}

- (BOOL)isTrackingWidgetStackIconDrags
{
  return [(SBIconDragManager *)self isTrackingDragMatchingPredicate:&__block_literal_global_76];
}

uint64_t __51__SBIconDragManager_isTrackingWidgetStackIconDrags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 draggedIcons];
  uint64_t v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_78);

  return v3;
}

uint64_t __51__SBIconDragManager_isTrackingWidgetStackIconDrags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3 == @"SBHIconGridSizeClassDefault")
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [v2 gridSizeClass];
    if ([v4 isEqualToString:@"SBHIconGridSizeClassDefault"]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [v2 isWidgetStackIcon];
    }
  }
  return v5;
}

uint64_t __53__SBIconDragManager_isTrackingDragMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SBIconDragManager_countOfTrackedDragsOriginatingFromOrDroppingIntoIconView___block_invoke;
  v8[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__SBIconDragManager_countOfTrackedDragsOriginatingFromOrDroppingIntoIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 hasSourceIconView:*(void *)(a1 + 32)] & 1) != 0
    || [v3 hasDestinationIconView:*(void *)(a1 + 32)])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (BOOL)isTrackingDragOriginatingFromOrDroppingIntoIconView:(id)a3 otherThanDragWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__SBIconDragManager_isTrackingDragOriginatingFromOrDroppingIntoIconView_otherThanDragWithIdentifier___block_invoke;
  v11[3] = &unk_1E6AADA28;
  id v8 = v7;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __101__SBIconDragManager_isTrackingDragOriginatingFromOrDroppingIntoIconView_otherThanDragWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) isEqual:a3] & 1) == 0
    && (([v7 hasSourceIconView:*(void *)(a1 + 40)] & 1) != 0
     || [v7 hasDestinationIconView:*(void *)(a1 + 40)]))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isTrackingDragWithGhostTreatmentForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBIconDragManager_isTrackingDragWithGhostTreatmentForIcon___block_invoke;
  v7[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __61__SBIconDragManager_isTrackingDragWithGhostTreatmentForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasGrabbedIcon:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateIconDragIdentifiersUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  id v5 = (void *)[(NSMapTable *)self->_iconDrags copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      char v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)allDragIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SBIconDragManager_allDragIdentifiers__block_invoke;
  v6[3] = &unk_1E6AADA50;
  id v4 = v3;
  id v7 = v4;
  [(SBIconDragManager *)self enumerateIconDragIdentifiersUsingBlock:v6];

  return v4;
}

uint64_t __39__SBIconDragManager_allDragIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)uniqueIdentifierForIconDropSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localDragSession];
  if (v5
    && ([(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v5],
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || ([(NSMapTable *)self->_uniqueIdentifiersPerDropSession objectForKey:v4],
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (id v6 = objc_alloc_init(MEMORY[0x1E4F29128])) != 0)
  {
    id v7 = [(NSMapTable *)self->_uniqueIdentifiersPerDropSession objectForKey:v4];

    if (!v7)
    {
      uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
      if (!uniqueIdentifiersPerDropSession)
      {
        uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        uint64_t v10 = self->_uniqueIdentifiersPerDropSession;
        self->_uniqueIdentifiersPerDropSession = v9;

        uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
      }
      [(NSMapTable *)uniqueIdentifiersPerDropSession setObject:v6 forKey:v4];
    }
  }

  return v6;
}

- (id)uniqueIdentifierForIconDragSession:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_uniqueIdentifiersPerDragSession objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
    if (!uniqueIdentifiersPerDragSession)
    {
      id v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      uint64_t v8 = self->_uniqueIdentifiersPerDragSession;
      self->_uniqueIdentifiersPerDragSession = v7;

      uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
    }
    [(NSMapTable *)uniqueIdentifiersPerDragSession setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)iconDragContextForDropSession:(id)a3
{
  id v4 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:a3];
  id v5 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v4];

  return v5;
}

- (id)iconDragContextForDragSession:(id)a3
{
  id v4 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:a3];
  id v5 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v4];

  return v5;
}

- (id)iconDragContextForDragDropSession:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F3102E38])
  {
    uint64_t v5 = [(SBIconDragManager *)self iconDragContextForDropSession:v4];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 conformsToProtocol:&unk_1F3102F20])
  {
    uint64_t v5 = [(SBIconDragManager *)self iconDragContextForDragSession:v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)iconDragContextForDragWithIdentifier:(id)a3
{
  return [(NSMapTable *)self->_iconDrags objectForKey:a3];
}

- (id)iconDragContextForDragItem:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__3;
  long long v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SBIconDragManager_iconDragContextForDragItem___block_invoke;
  v8[3] = &unk_1E6AAD998;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __48__SBIconDragManager_iconDragContextForDragItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 hasDragItem:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_isTrackingDrag:(id)a3
{
  id v3 = [(SBIconDragManager *)self iconDragContextForDropSession:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isTrackingDragWithIdentifier:(id)a3
{
  id v3 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_startTrackingDragWithIdentifier:(id)a3 session:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogIconDragging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "start tracking drag with identifier %{public}@", (uint8_t *)&v16, 0xCu);
  }

  iconDrags = self->_iconDrags;
  if (!iconDrags)
  {
    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v11 = self->_iconDrags;
    self->_iconDrags = v10;

    iconDrags = self->_iconDrags;
  }
  char v12 = [(NSMapTable *)iconDrags objectForKey:v6];

  if (!v12)
  {
    uint64_t v13 = objc_alloc_init(SBIconDragContext);
    [(SBIconDragContext *)v13 setSnapToGridAllowed:[(SBIconDragManager *)self isSnapToGridAllowed]];
    [(NSMapTable *)self->_iconDrags setObject:v13 forKey:v6];
    if (v7)
    {
      long long v14 = [(SBIconDragManager *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v14 iconDragManager:self shouldDuplicateIconsInDragSession:v7])
      {
        [(SBIconDragContext *)v13 setDuplicatesSourceIcons:1];
      }
    }
    long long v15 = [v7 items];
    if (v15) {
      [(SBIconDragManager *)self addAppLocalContextsFromDragItems:v15 toDragWithIdentifier:v6];
    }
    [(SBIconDragManager *)self resetWatchdogTimerForDragWithIdentifier:v6 timeout:60.0];
  }
}

- (void)_stopTrackingDragWithIdentifier:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NSMapTable *)self->_iconDrags objectForKey:v4];
    *(_DWORD *)buf = 138543618;
    double v39 = *(double *)&v4;
    __int16 v40 = 2112;
    double v41 = *(double *)&v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "stop tracking drag with identifier %{public}@. Context: %@", buf, 0x16u);
  }
  [(SBIconDragManager *)self stopTrackingDragLocationForEditingForDragWithIdentifier:v4];
  id v7 = [(SBIconDragManager *)self delegate];
  BOOL v8 = [(SBIconDragManager *)self isIconDragging];
  if (v4)
  {
    id v9 = [(NSMapTable *)self->_iconDrags objectForKey:v4];
    uint64_t v10 = [v9 primaryIconView];
    uint64_t v11 = [v9 lastUserInteractionDate];
    uint64_t v12 = [v9 hasUserDragged];
    uint64_t v13 = SBLogIconDragging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      [v10 lastTouchDownDate];
      long long v14 = v32 = v8;
      [v14 timeIntervalSinceNow];
      double v16 = fabs(v15);
      [v11 timeIntervalSinceNow];
      double v18 = fabs(v17);
      long long v19 = [v10 lastTouchDownDate];
      [v11 timeIntervalSinceDate:v19];
      *(_DWORD *)buf = 134218752;
      double v39 = v16;
      __int16 v40 = 2048;
      double v41 = v18;
      __int16 v42 = 2048;
      uint64_t v43 = v20;
      __int16 v44 = 1024;
      int v45 = v12;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "drag ended %fs after icon view touch began. last interaction %fs ago. time between interaction start and end: %fs. user did begin drag: %{BOOL}u", buf, 0x26u);

      BOOL v8 = v32;
    }

    [v10 removeObserver:self];
    if (objc_opt_respondsToSelector()) {
      [v7 iconDragManager:self didEndDragOriginatingFromIconView:v10 userDidBeginDrag:v12 lastUserInteractionDate:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      v21 = objc_alloc_init(SBIconDragResult);
      [(SBIconDragResult *)v21 setDragIdentifier:v4];
      uint64_t v22 = [v9 draggedIcons];
      -[SBIconDragResult setNumberOfDraggedItems:](v21, "setNumberOfDraggedItems:", [v22 count]);

      -[SBIconDragResult setPerformedDrop:](v21, "setPerformedDrop:", [v9 performedIconDrop]);
      -[SBIconDragResult setDragRejectionReason:](v21, "setDragRejectionReason:", [v9 dragRejectionReason]);
      [v7 iconDragManager:self didEndDragWithResult:v21];
    }
    [v9 enumerateSourceIconViewsUsingBlock:&__block_literal_global_173];
    [v9 enumerateDiscardedSourceIconViewsUsingBlock:&__block_literal_global_176];
    v23 = [v9 grabbedIconViews];
    uint64_t v24 = [v23 count];

    if (v24) {
      [v9 enumerateEnteredIconListViewsUsingBlock:&__block_literal_global_179];
    }
    v25 = [MEMORY[0x1E4F1CA80] set];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_4;
    v35[3] = &unk_1E6AADAB8;
    id v36 = v9;
    id v26 = v25;
    id v37 = v26;
    id v27 = v9;
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_6;
    v33[3] = &unk_1E6AADAE0;
    id v34 = v26;
    id v28 = v26;
    [v27 enumerateEnteredIconListViewsUsingBlock:v33];
    [v27 enumerateDestinationIconViewsUsingBlock:&__block_literal_global_184];
    [v27 enumerateDragPreviewsUsingBlock:&__block_literal_global_187];
    [v27 resetDraggedIconsHiddenAssertion];
    [v27 resetDragPlaceholder];
    [v27 invalidateIconViewBorrowAssertions];
    v29 = [v27 watchdogTimer];
    [v29 invalidate];

    [v27 setWatchdogTimer:0];
    [(NSMapTable *)self->_iconDrags removeObjectForKey:v4];
  }
  if (v8 && ![(SBIconDragManager *)self isIconDragging])
  {
    v30 = SBLogIconDragging();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v30, OS_LOG_TYPE_INFO, "all drags have ended, cleaning up", buf, 2u);
    }

    v31 = [(SBIconDragManager *)self model];
    objc_msgSend(v31, "checkModelConsistencyWithListGridCellInfoOptions:", -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions"));
    [(SBIconDragManager *)self removeEmptyFolders];
    [(SBIconDragManager *)self _cleanUpAllDraggingState];
    [(SBIconDragManager *)self compactAndLayoutRootIconLists];
    [(SBIconDragManager *)self _invalidateAutoScrollAssistant];
    if (objc_opt_respondsToSelector()) {
      [v7 iconDragManagerIconDraggingDidChange:self];
    }
  }
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHighlighted])
  {
    id v3 = SBLogIconDragging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_2((uint64_t)v2, v3);
    }

    [v2 setHighlighted:0];
  }
  if ([v2 isGrabbed])
  {
    id v4 = SBLogIconDragging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_1((uint64_t)v2, v4);
    }

    [v2 setGrabbed:0];
  }
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_174(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_181];
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setGrabbed:0];
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) != a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_5;
    v3[3] = &unk_1E6AAD830;
    id v4 = *(id *)(a1 + 40);
    [a2 enumerateSourceIconViewsUsingBlock:v3];
  }
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 clearDraggedIconViewsExcludingSet:*(void *)(a1 + 32)];
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setOverrideCustomIconImageViewController:0];
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 cleanUp];
  }
}

- (void)_stopTrackingDragIfPossibleWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v4];
  if ([v5 isWaitingForMessage])
  {
    id v6 = SBLogIconDragging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 expectedMessages];
      int v8 = 138543618;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "drag with identifier %{public}@ is still waiting for messages: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [(SBIconDragManager *)self _stopTrackingDragWithIdentifier:v4];
  }
}

- (void)changeStateOfDragWithIdentifier:(id)a3 toState:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v6];
  if ([v7 state] == a4) {
    goto LABEL_22;
  }
  BOOL v8 = [(SBIconDragManager *)self isIconDragging];
  BOOL v9 = [(SBIconDragManager *)self isTrackingUserActiveIconDrags];
  __int16 v10 = SBLogIconDragging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = SBStringForIconDragContextState(a4);
    *(_DWORD *)buf = 138543874;
    id v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 1024;
    BOOL v22 = v8;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_INFO, "change state of drag with identifier %{public}@ to state '%{public}@' (was dragging before: %{BOOL}u)", buf, 0x1Cu);
  }
  int v12 = [v7 isUserActive];
  [v7 setState:a4];
  uint64_t v13 = [(SBIconDragManager *)self delegate];
  BOOL v14 = [(SBIconDragManager *)self isIconDragging];
  if (v8)
  {
    if (v14) {
      goto LABEL_10;
    }
  }
  else if (!v14)
  {
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector()) {
    [v13 iconDragManagerIconDraggingDidChange:self];
  }
LABEL_10:
  BOOL v15 = [(SBIconDragManager *)self isTrackingUserActiveIconDrags];
  if (!v9)
  {
    if (!v15) {
      goto LABEL_16;
    }
LABEL_14:
    if (objc_opt_respondsToSelector()) {
      [v13 iconDragManagerUserActiveIconDraggingDidChange:self];
    }
    goto LABEL_16;
  }
  if (!v15) {
    goto LABEL_14;
  }
LABEL_16:
  if (v12)
  {
    if (([v7 isUserActive] & 1) == 0)
    {
      [v7 resetLastUserInteractionDate];
      if (![(SBIconDragManager *)self isEditing])
      {
        if ([v7 hasUserDragged])
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __61__SBIconDragManager_changeStateOfDragWithIdentifier_toState___block_invoke;
          block[3] = &unk_1E6AAC810;
          block[4] = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
    }
  }
  [(SBIconDragManager *)self resetWatchdogTimerForDragWithIdentifier:v6 timeout:60.0];

LABEL_22:
}

void __61__SBIconDragManager_changeStateOfDragWithIdentifier_toState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) rootFolder];
  [v3 compactLists];
  id v2 = [*(id *)(a1 + 32) model];
  [v2 saveIconStateIfNeeded];
  [v2 clearDesiredIconState];
}

- (void)resetWatchdogTimerForDragWithIdentifier:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v9 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v6];
  id v7 = [v9 watchdogTimer];
  [v7 invalidate];

  BOOL v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_watchdogTimerDidFire_ selector:v6 userInfo:0 repeats:a4];

  [v8 setTolerance:10.0];
  [v9 setWatchdogTimer:v8];
}

- (void)watchdogTimerDidFire:(id)a3
{
  id v9 = [a3 userInfo];
  id v4 = -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  id v5 = [v4 lastUserInteractionDate];
  id v6 = v5;
  if (v5)
  {
    [v5 timeIntervalSinceNow];
    double v8 = fabs(v7);
    if (v8 >= 60.0) {
      [(SBIconDragManager *)self watchdogDragWithIdentifier:v9];
    }
    else {
      [(SBIconDragManager *)self resetWatchdogTimerForDragWithIdentifier:v9 timeout:60.0 - v8];
    }
  }
}

- (void)_startTrackingDragWithIdentifier:(id)a3 session:(id)a4 primaryIconView:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = a4;
  __int16 v10 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v14];

  [(SBIconDragManager *)self _startTrackingDragWithIdentifier:v14 session:v9];
  if (!v10)
  {
    uint64_t v11 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v14];
    int v12 = [v8 icon];
    [v11 setPrimaryIconView:v8];
    [v11 addSourceIcon:v12];
    [v11 addSourceIconView:v8];
    uint64_t v13 = [v12 nodeIdentifier];
    [v11 addItemIdentifier:v13];
  }
}

- (void)addAppLocalContextsFromDragItems:(id)a3 toDragWithIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "sbh_appDragLocalContext", (void)v15);
        if (v14) {
          [v7 setAppDragLocalContext:v14 forDragItem:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)createIconsFromDragItemsIfNecessary:(id)a3 withDragIdentifier:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  double v7 = -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (!v8)
  {
    v48 = 0;
    goto LABEL_32;
  }
  uint64_t v9 = v8;
  v48 = 0;
  uint64_t v10 = *(void *)v57;
  id v36 = v7;
  uint64_t v35 = *(void *)v57;
  do
  {
    uint64_t v11 = 0;
    uint64_t v37 = v9;
    do
    {
      if (*(void *)v57 != v10) {
        objc_enumerationMutation(obj);
      }
      int v12 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * v11), "sbh_appDragLocalContext");
      uint64_t v13 = [v12 customIconDataSourceConfigurations];
      __int16 v42 = v12;
      id v14 = [v12 uniqueIdentifier];
      long long v15 = [v7 sourceIcons];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __76__SBIconDragManager_createIconsFromDragItemsIfNecessary_withDragIdentifier___block_invoke;
      v54[3] = &unk_1E6AADB28;
      id v40 = v14;
      id v55 = v40;
      char v16 = objc_msgSend(v15, "bs_containsObjectPassingTest:", v54);

      double v41 = v13;
      if ([v13 count] && (v16 & 1) == 0)
      {
        uint64_t v39 = v11;
        long long v17 = [[SBWidgetIcon alloc] initWithLeafIdentifier:v40 applicationBundleID:0];

        long long v18 = [v42 gridSizeClass];
        uint64_t v46 = v17;
        [(SBIcon *)v17 setGridSizeClass:v18];

        int v45 = [v42 activeCustomIconDataSourceUniqueIdentifier];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v43 = v41;
        uint64_t v47 = [v43 countByEnumeratingWithState:&v50 objects:v65 count:16];
        if (!v47)
        {
          v49 = 0;
          goto LABEL_27;
        }
        v49 = 0;
        uint64_t v44 = *(void *)v51;
        while (1)
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v51 != v44) {
              objc_enumerationMutation(v43);
            }
            uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            __int16 v21 = [v20 objectForKey:@"kind"];

            if (v21)
            {
              BOOL v22 = [v20 objectForKey:@"kind"];
              uint64_t v23 = [v20 objectForKey:@"uniqueIdentifier"];
              uint64_t v24 = [v20 objectForKey:@"extensionBundleIdentifier"];
              v25 = [v20 objectForKey:@"containerBundleIdentifier"];
              id v26 = [v20 objectForKey:@"supportedGridSizeClasses"];
              id v27 = [[SBHWidget alloc] initWithUniqueIdentifier:v23 kind:v22 extensionBundleIdentifier:v24 containerBundleIdentifier:v25 supportedGridSizeClasses:v26];
              id v28 = SBLogWidgets();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [(SBHWidget *)v27 extensionBundleIdentifier];
                v30 = [(SBHWidget *)v27 uniqueIdentifier];
                *(_DWORD *)buf = 138543618;
                v62 = v29;
                __int16 v63 = 2114;
                v64 = v30;
                _os_log_impl(&dword_1D7F0A000, v28, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for drag.", buf, 0x16u);
              }
              v31 = v27;
              if ([v23 isEqualToString:v45])
              {
                BOOL v32 = v31;
              }
              else
              {
                BOOL v32 = v49;
              }
            }
            else
            {
              BOOL v22 = [v20 objectForKey:@"uniqueIdentifier"];
              uint64_t v23 = [v20 objectForKey:@"elementIdentifier"];
              v31 = (SBHWidget *)objc_msgSend(objc_alloc(+[SBHCustomIconElement elementClassWithIdentifier:](SBHCustomIconElement, "elementClassWithIdentifier:", v23)), "initWithUniqueIdentifier:", v22);
              if (![v22 isEqualToString:v45]) {
                goto LABEL_23;
              }
              v31 = v31;
              BOOL v32 = v31;
              uint64_t v24 = v49;
            }

            v49 = v32;
LABEL_23:

            [(SBLeafIcon *)v46 addIconDataSource:v31];
          }
          uint64_t v47 = [v43 countByEnumeratingWithState:&v50 objects:v65 count:16];
          if (!v47)
          {
LABEL_27:

            [(SBLeafIcon *)v46 setActiveDataSource:v49];
            v48 = v46;
            double v7 = v36;
            uint64_t v9 = v37;
            uint64_t v10 = v35;
            uint64_t v11 = v39;
            break;
          }
        }
      }

      ++v11;
    }
    while (v11 != v9);
    uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  }
  while (v9);
LABEL_32:

  if ([(SBLeafIcon *)v48 iconDataSourceCount])
  {
    v60 = v48;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    [v7 setCreatedWidgetIcons:v33];
  }
}

uint64_t __76__SBIconDragManager_createIconsFromDragItemsIfNecessary_withDragIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)addApplicationIconsFromDragItems:(id)a3 session:(id)a4 toDragWithIdentifier:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v10];
  int v12 = [v11 externallyDraggedIcons];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v15)
    {
      id v17 = v14;
      goto LABEL_21;
    }
    uint64_t v16 = v15;
    id v24 = v10;
    id v25 = v9;
    id v26 = v8;
    id v17 = 0;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "sbh_appDragLocalContext");
        __int16 v21 = v20;
        if (v20)
        {
          BOOL v22 = [v20 uniqueIdentifier];
          if (v22)
          {
            uint64_t v23 = [(SBIconDragManager *)self leafIconForIdentifier:v22];
            if (v23 && ([v11 hasDraggedIcon:v23] & 1) == 0)
            {
              if (!v17) {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v17 addObject:v23];
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);

    id v9 = v25;
    id v8 = v26;
    id v10 = v24;
    if (v17)
    {
      [v11 setExternallyDraggedIcons:v17];
LABEL_21:
    }
  }
}

- (id)appDragLocalContextForDragItem:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "sbh_appDragLocalContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__3;
    id v14 = __Block_byref_object_dispose__3;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SBIconDragManager_appDragLocalContextForDragItem___block_invoke;
    v7[3] = &unk_1E6AAD970;
    id v9 = &v10;
    id v8 = v4;
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v7];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __52__SBIconDragManager_appDragLocalContextForDragItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 appDragLocalContextForDragItem:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  id v3 = [(SBIconDragManager *)self appDragLocalContextForDragItem:a3];
  id v4 = [v3 uniqueIdentifier];

  return v4;
}

- (id)_applicationBundleIdentifierForDragItem:(id)a3
{
  id v3 = [(SBIconDragManager *)self appDragLocalContextForDragItem:a3];
  id v4 = [v3 applicationBundleIdentifier];

  return v4;
}

- (id)draggedIconForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self leafIconForIdentifier:v4];
  if (!v5)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    BOOL v22 = __Block_byref_object_copy__3;
    uint64_t v23 = __Block_byref_object_dispose__3;
    id v24 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __46__SBIconDragManager_draggedIconForIdentifier___block_invoke;
    uint64_t v16 = &unk_1E6AAD998;
    id v6 = v4;
    id v17 = v6;
    uint64_t v18 = &v19;
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:&v13];
    uint64_t v7 = (void *)v20[5];
    if (v7)
    {
      id v5 = v7;

      _Block_object_dispose(&v19, 8);
      goto LABEL_12;
    }

    _Block_object_dispose(&v19, 8);
    id v8 = [(SBIconDragManager *)self rootFolder];
    uint64_t v9 = [v8 indexPathForIconWithIdentifier:v6];
    if (!v9)
    {

LABEL_8:
      uint64_t v11 = [(SBIconDragManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        id v5 = [v11 iconDragManager:self draggedIconForIdentifier:v6];
      }
      else
      {
        id v5 = 0;
      }

      goto LABEL_12;
    }
    uint64_t v10 = (void *)v9;
    id v5 = [v8 iconAtIndexPath:v9];

    if (!v5) {
      goto LABEL_8;
    }
  }
LABEL_12:

  return v5;
}

void __46__SBIconDragManager_draggedIconForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a2, "draggedIcons", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 nodeIdentifier];
        int v13 = [v12 isEqual:*(void *)(a1 + 32)];

        if (v13)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)draggedIconsForIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[SBIconDragManager draggedIconForIdentifier:](self, "draggedIconForIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)dragPlaceholderPathForDragWithIdentifier:(id)a3
{
  id v4 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a3];
  id v5 = [v4 dragPlaceholderListView];
  id v6 = [v5 model];
  uint64_t v7 = [(SBIconDragManager *)self rootFolder];
  uint64_t v8 = [v7 indexPathForList:v6];
  uint64_t v9 = [v4 dragPlaceholder];
  uint64_t v10 = [v9 effectiveGridCellIndex];
  uint64_t v11 = [v5 gridCellInfo];
  uint64_t v12 = [v11 iconIndexForGridCellIndex:v10];

  if (v8)
  {
    long long v13 = [v8 indexPathByAddingIndex:v12];
  }
  else
  {
    long long v13 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v12];
  }

  return v13;
}

- (id)dragPlaceholderGridPathForDragWithIdentifier:(id)a3
{
  id v4 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a3];
  id v5 = [v4 dragPlaceholderListView];
  id v6 = [v5 model];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 folder];
    uint64_t v9 = [v4 dragPlaceholder];
    uint64_t v10 = [v9 effectiveGridCellIndex];
    unint64_t v11 = [(SBIconDragManager *)self listGridCellInfoOptions];
    uint64_t v12 = [SBHIconGridPath alloc];
    long long v13 = [v8 uniqueIdentifier];
    long long v14 = [v7 uniqueIdentifier];
    long long v15 = [(SBHIconGridPath *)v12 initWithFolderIdentifier:v13 listIdentifier:v14 gridCellIndex:v10 gridCellInfoOptions:v11];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3
{
  return [(SBIconDragManager *)self removeDragPlaceholdersForDragWithIdentifier:a3 placeholderPath:0];
}

- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3 placeholderPath:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v6];
  uint64_t v8 = [(SBIconDragManager *)self dragPlaceholderPathForDragWithIdentifier:v6];
  uint64_t v9 = SBLogIconDragging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2112;
    long long v14 = v8;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "remove drag placeholder for drag with identifier %{public}@. Placeholder path: %@", (uint8_t *)&v11, 0x16u);
  }

  [v7 resetDragPlaceholder];
  if (a4) {
    *a4 = v8;
  }

  return v8 != 0;
}

- (void)_removeDraggedIconsFromLayout:(id)a3 iconLocation:(id)a4 dragIdentifier:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a5];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  BOOL v22 = __79__SBIconDragManager__removeDraggedIconsFromLayout_iconLocation_dragIdentifier___block_invoke;
  uint64_t v23 = &unk_1E6AADB50;
  id v24 = self;
  id v11 = v8;
  id v25 = v11;
  id v12 = objc_msgSend(v9, "bs_filter:", &v20);

  __int16 v13 = SBLogIconDragging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    long long v27 = v12;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "hide dragged icons '%@' (icon location: %{public}@)", buf, 0x16u);
  }

  if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24))
  {
    long long v14 = [v10 draggedIconsHiddenAssertion];

    if (!v14)
    {
      uint64_t v15 = [(SBIconDragManager *)self iconLayoutHider];
      if (!v15)
      {
        uint64_t v15 = [(SBIconDragManager *)self rootListView];
      }
      long long v16 = objc_msgSend(v15, "beginHidingIconsFromLayout:reason:options:", v12, @"drag", -[SBIconDragManager iconLayoutHidingOptions](self, "iconLayoutHidingOptions"));
      [v10 setDraggedIconsHiddenAssertion:v16];
      long long v17 = SBLogIconDragging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v27 = v16;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "made icon hiding assertion %@", buf, 0xCu);
      }

      uint64_t v18 = [v12 firstObject];
      uint64_t v19 = [v18 gridSizeClass];
      [v10 setDragPlaceholderGridSizeClass:v19];
    }
  }
}

uint64_t __79__SBIconDragManager__removeDraggedIconsFromLayout_iconLocation_dragIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) doesIconRepresentRealIconPosition:a2 inLocation:*(void *)(a1 + 40)];
}

- (void)removeNearestLeafIconsMatchingIcons:(id)a3 inList:(id)a4 dragContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v18 = a5;
  uint64_t v19 = v8;
  uint64_t v10 = [(SBIconDragManager *)self leafIconsInList:v9 matchingApplicationBundleIdentifierOfIcons:v8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v17 = SBLogIconDragging();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v16;
          _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "removing leaf icon %@ because the incoming drag is effectively picking it up", buf, 0xCu);
        }

        [v9 removeIcon:v16];
        if (!v13) {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        [v13 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }
  [v18 setRemovedMatchingLeafIcons:v13];
}

- (id)leafIconsInList:(id)a3 matchingApplicationBundleIdentifierOfIcons:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) applicationBundleID];
        id v13 = [v5 lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:v12];
        if (v13)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v9 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)removeEmptyFolders
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__SBIconDragManager_removeEmptyFolders__block_invoke;
  v3[3] = &unk_1E6AADB78;
  void v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__SBIconDragManager_removeEmptyFolders__block_invoke_2;
  v2[3] = &unk_1E6AADBA0;
  v2[4] = self;
  [(SBIconDragManager *)self modifyRootFolderUsingBlock:v3 orRootListModelUsingBlock:v2];
}

uint64_t __39__SBIconDragManager_removeEmptyFolders__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEmptyFoldersInFolder:a2];
}

uint64_t __39__SBIconDragManager_removeEmptyFolders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEmptyFoldersInListModel:a2];
}

- (void)removeEmptyFoldersInFolder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "remove empty folders in folder: %@", buf, 0xCu);
  }

  id v6 = [v4 folderIcons];
  uint64_t v7 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "folder", (void)v15);
          if ([v14 isEmpty]) {
            [v7 iconDragManager:self wantsAnimatedRemovalOfIcon:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)removeEmptyFoldersInListModel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "remove empty folders in list model: %@", buf, 0xCu);
  }

  id v6 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SBIconDragManager_removeEmptyFoldersInListModel___block_invoke;
    v7[3] = &unk_1E6AADBC8;
    id v8 = v6;
    uint64_t v9 = self;
    [v4 enumerateFolderIconsUsingBlock:v7];
  }
}

void __51__SBIconDragManager_removeEmptyFoldersInListModel___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 folder];
  if ([v3 isEmpty]) {
    [*(id *)(a1 + 32) iconDragManager:*(void *)(a1 + 40) wantsAnimatedRemovalOfIcon:v4];
  }
}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void))a7;
  long long v15 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v15 pushExpandedIcon:v16 location:v12 context:v13 animated:v8 completionHandler:v14];
  }
  else if (v14)
  {
    v14[2](v14, 0);
  }
}

- (void)pushExpandedIconView:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [v12 icon];
  id v13 = [v12 location];

  [(SBIconDragManager *)self pushExpandedIcon:v14 location:v13 context:v11 animated:v6 completionHandler:v10];
}

- (void)addIcons:(id)a3 intoFolderIcon:(id)a4 openFolderOnFinish:(BOOL)a5
{
  BOOL v30 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 folder];
  v31 = [(SBIconDragManager *)self iconListViewContainingIcon:v8];
  uint64_t v32 = v8;
  id v10 = [v31 iconViewForIcon:v8];
  id v11 = [v10 superview];
  [v11 bringSubviewToFront:v10];

  id v29 = v10;
  [v10 setAllowsEditingAnimation:0];
  __int16 v28 = self;
  unint64_t v12 = [(SBIconDragManager *)self listGridCellInfoOptions];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    long long v15 = 0;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (v15)
        {
          uint64_t v19 = [v9 insertIcon:*(void *)(*((void *)&v34 + 1) + 8 * i) afterIcon:v15 options:0 listGridCellInfoOptions:v12];
          int v20 = [v19 containsObject:v18];

          if (!v20) {
            goto LABEL_12;
          }
        }
        if ([v9 containsIcon:v18])
        {
          id v21 = [v18 gridSizeClass];
          uint64_t v22 = [v9 gridPathForFirstFreeSlotOfRangeOfSizeClass:v21 avoidingFirstList:0 listGridCellInfoOptions:v12];

          if (v22)
          {
            long long v23 = [v9 insertIcon:v18 atGridPath:v22 options:0];
            int v24 = [v23 containsObject:v18];

            if (!v24) {
              goto LABEL_12;
            }
          }
        }
        uint64_t v25 = [v9 addIcon:v18];

        if (v25)
        {
LABEL_12:
          id v26 = v18;

          long long v15 = v26;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
  else
  {
    long long v15 = 0;
  }

  [v29 setAllowsEditingAnimation:1];
  if (v30)
  {
    uint64_t v27 = [v29 location];
    [(SBIconDragManager *)v28 pushExpandedIcon:v32 location:v27 context:0 animated:1 completionHandler:0];
  }
}

- (id)localizedFolderNameForCombiningIcon:(id)a3 withIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 iconDragManager:self localizedFolderNameForCombiningIcon:v6 withIcon:v7];
  }
  else
  {
    id v10 = [(SBIconDragManager *)self model];
    uint64_t v9 = [v10 localizedDefaultFolderName];
  }
  return v9;
}

- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4
{
  id v6 = a3;
  id v7 = [(SBIconDragManager *)self localizedFolderNameForCombiningIcon:a4 withIcon:v6];
  id v8 = [(SBIconDragManager *)self model];
  uint64_t v9 = [v8 makeFolderWithDisplayName:v7];
  [v9 setCancelable:1];
  id v10 = [[SBFolderIcon alloc] initWithFolder:v9];
  unint64_t v11 = [(SBIconDragManager *)self listGridCellInfoOptions];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke;
  v19[3] = &unk_1E6AADBF0;
  id v20 = v6;
  id v21 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke_2;
  v15[3] = &unk_1E6AADC18;
  id v16 = v20;
  long long v17 = v21;
  unint64_t v18 = v11;
  unint64_t v12 = v21;
  id v13 = v20;
  [(SBIconDragManager *)self modifyRootFolderUsingBlock:v19 orRootListModelUsingBlock:v15];
  [v8 addIcon:v12];

  return v9;
}

uint64_t __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke(uint64_t a1, void *a2)
{
  return [a2 replaceIcon:*(void *)(a1 + 32) withIcon:*(void *)(a1 + 40)];
}

id __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke_2(void *a1, void *a2)
{
  return (id)[a2 replaceIcon:a1[4] withIcon:a1[5] gridCellInfoOptions:a1[6] mutationOptions:0];
}

- (void)startTrackingDragLocationForEditingFromDropSession:(id)a3 orDragSession:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if ([(SBIconDragManager *)self isEditing]) {
    goto LABEL_19;
  }
  id v8 = [(SBIconDragManager *)self draggingEditContext];
  if (v8)
  {
    if (v6)
    {
LABEL_4:
      uint64_t v9 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v6];
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = objc_alloc_init(SBIconDraggingEditContext);
    [(SBIconDragManager *)self setDraggingEditContext:v8];
    if (v6) {
      goto LABEL_4;
    }
  }
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v7];
LABEL_8:
  id v10 = (void *)v9;
LABEL_9:
  [(SBIconDraggingEditContext *)v8 setDraggingUniqueIdentifier:v10];
  unint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  unint64_t v12 = [v11 coordinateSpace];

  if (!(v6 | v7))
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Need either UIDropSession or UIDragSession to track a drag" userInfo:0];
    objc_exception_throw(v20);
  }
  id v13 = [(SBIconDragManager *)self rootView];
  if (v13)
  {
    if (v6) {
      uint64_t v14 = (void *)v6;
    }
    else {
      uint64_t v14 = (void *)v7;
    }
    [v14 locationInView:v13];
    objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v12);
    uint64_t v15 = v17;
    uint64_t v16 = v18;
    -[SBIconDraggingEditContext setEnteredScreenLocation:](v8, "setEnteredScreenLocation:");
  }
  else
  {
    [(SBIconDraggingEditContext *)v8 setEnteredScreenLocationNeedsUpdate:1];
    uint64_t v15 = 0x7FF8000000000000;
    uint64_t v16 = 0x7FF8000000000000;
  }
  uint64_t v19 = SBLogIconDragging();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543874;
    uint64_t v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    __int16 v25 = 2048;
    uint64_t v26 = v16;
    _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_INFO, "start tracking drag location for editing from drag identifier '%{public}@', location: (%f,%f))", (uint8_t *)&v21, 0x20u);
  }

LABEL_19:
}

- (void)stopTrackingDragLocationForEditingForDragWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "stop tracking drag location for editing from drag identifier '%{public}@'", (uint8_t *)&v8, 0xCu);
  }

  unint64_t v6 = [(SBIconDragManager *)self draggingEditContext];
  id v7 = [v6 draggingUniqueIdentifier];

  if (v7 == v4) {
    [(SBIconDragManager *)self setDraggingEditContext:0];
  }
}

- (BOOL)swapTrackedIconWithIdentifier:(id)a3 withIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SBIconDragManager_swapTrackedIconWithIdentifier_withIcon___block_invoke;
  v11[3] = &unk_1E6AADA28;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v15;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __60__SBIconDragManager_swapTrackedIconWithIdentifier_withIcon___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if ([v3 hasItemIdentifier:v4])
  {
    id v5 = SBLogIconDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 40) nodeIdentifier];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "swapping dragging icon '%@' for icon '%@'", (uint8_t *)&v7, 0x16u);
    }
    [v3 swapSourceIconWithIdentifier:v4 withIcon:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)compactAndLayoutRootIconListsWithDuration:(double)a3
{
}

- (void)compactAndLayoutRootIconLists
{
  [(SBIconDragManager *)self defaultIconLayoutAnimationDuration];
  [(SBIconDragManager *)self compactAndLayoutRootIconListsWithDuration:"compactAndLayoutRootIconListsWithDuration:"];
}

- (void)setIndexPath:(id)a3 whenRevertingIconsWithPathPrefix:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  revertingReplacementIndexPaths = self->_revertingReplacementIndexPaths;
  if (v13)
  {
    if (!revertingReplacementIndexPaths)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v11 = self->_revertingReplacementIndexPaths;
      self->_revertingReplacementIndexPaths = v10;

      id v7 = v13;
      revertingReplacementIndexPaths = self->_revertingReplacementIndexPaths;
    }
    [(NSMutableDictionary *)revertingReplacementIndexPaths setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)revertingReplacementIndexPaths removeObjectForKey:v8];
    if (![(NSMutableDictionary *)self->_revertingReplacementIndexPaths count])
    {
      id v12 = self->_revertingReplacementIndexPaths;
      self->_revertingReplacementIndexPaths = 0;
    }
  }
}

void __49__SBIconDragManager_noteFolderControllerWillOpen__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 draggedIconsHiddenAssertion];
  [v3 setOptions:*(void *)(a1 + 32)];
}

- (void)noteFolderControllerDidClose:(id)a3
{
  unint64_t v4 = [(SBIconDragManager *)self iconLayoutHidingOptions];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBIconDragManager_noteFolderControllerDidClose___block_invoke;
  v5[3] = &__block_descriptor_40_e34_v32__0__SBIconDragContext_8_16_B24l;
  v5[4] = v4;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v5];
  [(SBIconDragManager *)self layoutIconListsWithAnimationType:0 forceRelayout:0];
}

void __50__SBIconDragManager_noteFolderControllerDidClose___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 draggedIconsHiddenAssertion];
  [v3 setOptions:*(void *)(a1 + 32)];
}

- (void)cancelEditingAndAllDrags
{
  id v3 = SBLogIconDragging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "cancel editing and all drags", v5, 2u);
  }

  unint64_t v4 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 setEditing:0];
  }
  [(SBIconDragManager *)self cancelAllDrags];
}

- (void)cancelAllDrags
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBIconDragManager *)self allDragIdentifiers];
  unint64_t v4 = SBLogIconDragging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    char v18 = v3;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "cancel all drags. active drags: %{public}@", buf, 0xCu);
  }

  BOOL v5 = [(SBIconDragManager *)self isIconDragging];
  BOOL v6 = [(SBIconDragManager *)self isTrackingUserActiveIconDrags];
  if (v5 && !v6)
  {
    id v7 = SBLogIconDragging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "will not cancel all drags because a drag exists that is animating into final place", buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  [(id)objc_opt_class() cancelAllDrags];
  if ([(SBIconDragManager *)self isIconDragging])
  {
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:&__block_literal_global_248];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[SBIconDragManager _stopTrackingDragWithIdentifier:](self, "_stopTrackingDragWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
    goto LABEL_15;
  }
LABEL_16:
}

void __35__SBIconDragManager_cancelAllDrags__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 primaryIconView];
  [v3 cancelDrag];
  [v3 cancelDragLift];
  [v2 removeAllMessageExpectations];
  [v2 setRecipientIconView:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = objc_msgSend(v2, "appLocalContexts", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) portaledPreview];
        if (objc_opt_respondsToSelector()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        id v11 = v10;

        if ([v11 dragState] == 3) {
          [v11 setDragState:4];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)noteDragItemWasConsumedExternallyForDropSession:(id)a3
{
  if (a3)
  {
    id v3 = -[SBIconDragManager iconDragContextForDragDropSession:](self, "iconDragContextForDragDropSession:");
    if (v3)
    {
      id v4 = v3;
      [v3 setDragItemWasConsumedExternally:1];
      id v3 = v4;
    }
  }
}

- (void)watchdogDragWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[SBIconDragManager watchdogDragWithIdentifier:]((uint64_t)v4, v5);
  }

  uint64_t v6 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v4];
  uint64_t v7 = [v6 primaryIconView];
  [v7 cancelDrag];
  [v6 removeAllMessageExpectations];
  [v6 setRecipientIconView:0];
  [(SBIconDragManager *)self _stopTrackingDragWithIdentifier:v4];
}

- (BOOL)shouldUseGhostIconForIconView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 location];
  if ([v5 isEqualToString:@"SBIconLocationAddWidgetSheet"])
  {
    LOBYTE(v6) = 0;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v7 = [v4 location];
  char v8 = [v7 isEqualToString:@"SBIconLocationStackConfiguration"];

  if ((v8 & 1) == 0)
  {
    uint64_t v5 = [(SBIconDragManager *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ![v5 isEditingAllowedForIconView:v4]) {
      goto LABEL_10;
    }
    uint64_t v9 = [v4 location];
    if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v9)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v10 = [v5 isIconContentPossiblyVisibleOverApplication];

      if (v10)
      {
LABEL_10:
        LOBYTE(v6) = 1;
        goto LABEL_13;
      }
    }
    else
    {
    }
    BOOL v6 = ![(SBIconDragManager *)self doesIconViewRepresentRealIconPosition:v4];
    goto LABEL_13;
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6;
}

- (id)startingIconLocationForIcon:(id)a3 dragIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a4];
  char v8 = [v6 uniqueIdentifier];

  uint64_t v9 = [v7 appDragLocalContextWithIconIdentifier:v8];
  uint64_t started = SBHAppDragLocalContextStartLocationFromSBSLocation([v9 startLocation]);
  id v11 = SBHIconLocationForSBHAppDragLocalContextStartLocation(started);

  return v11;
}

- (BOOL)doesIconViewRepresentRealIconPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 icon];
  id v6 = [v4 location];

  LOBYTE(self) = [(SBIconDragManager *)self doesIconRepresentRealIconPosition:v5 inLocation:v6];
  return (char)self;
}

- (BOOL)doesIconRepresentRealIconPosition:(id)a3 dragIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBIconDragManager *)self startingIconLocationForIcon:v6 dragIdentifier:a4];
  LOBYTE(self) = [(SBIconDragManager *)self doesIconRepresentRealIconPosition:v6 inLocation:v7];

  return (char)self;
}

- (BOOL)doesIconRepresentRealIconPosition:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [v8 iconDragManager:self doesIconRepresentRealIconPosition:v6 inLocation:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    char v9 = [v8 iconDragManager:self doesIconViewRepresentRealIconPosition:0];
  }
  else
  {
    char v9 = [(SBIconDragManager *)self doesIconLocationRepresentRealIconPosition:v7];
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)doesIconLocationRepresentRealIconPosition:(id)a3
{
  return SBIconLocationGroupContainsLocation(@"SBIconLocationGroupIconHierarchy", a3);
}

- (BOOL)shouldBeginEditingWhenDragBegins
{
  if ([(SBIconDragManager *)self isRootFolderContentVisible]) {
    return 1;
  }
  return [(SBIconDragManager *)self isIconContentPossiblyVisibleOverApplication];
}

- (BOOL)shouldCancelDragsWhenEditingEnds
{
  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 0;
  }
  return v2;
}

- (double)delayAfterAfterLiftPreviewToBeginEditing
{
  BOOL v3 = [(SBIconDragManager *)self isRootFolderContentVisible];
  double result = 0.0;
  if (v3)
  {
    BOOL v5 = [(SBIconDragManager *)self shouldBeginEditingWhenLiftPreviewBegins];
    double result = 1.6;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (BOOL)shouldDisallowBumpingIconsFromCurrentList
{
  BOOL v2 = [(SBIconDragManager *)self rootFolder];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 maxListCount] == 1;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldMinimizeLayoutDisruptionForIconLocation:(id)a3
{
  id v4 = a3;
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v4))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(SBIconDragManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 iconDragManager:self shouldMinimizeLayoutDisruptionInLocation:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)canMakeIconViewRecipient:(id)a3
{
  id v4 = a3;
  char v5 = [(SBIconDragManager *)self isEditing];
  id v6 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v6 iconDragManager:self canMakeIconViewDragRecipient:v4];
  }

  return v5;
}

- (BOOL)shouldUseIconCenterForDragPositionForIcon:(id)a3
{
  return 1;
}

+ (void)cancelAllDrags
{
}

- (void)_handleScaleAdjustmentForDropSession:(id)a3 currentListView:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [a3 items];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "sbh_appDragLocalContext");
          long long v12 = [v11 portaledPreview];
          if (objc_opt_respondsToSelector()) {
            long long v13 = v12;
          }
          else {
            long long v13 = 0;
          }
          id v14 = v13;

          if (v14)
          {
            long long v15 = (void *)MEMORY[0x1E4FB1EB0];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __74__SBIconDragManager__handleScaleAdjustmentForDropSession_currentListView___block_invoke;
            v16[3] = &unk_1E6AACA90;
            id v17 = v14;
            id v18 = v5;
            [v15 _animateUsingSpringInteractive:0 animations:v16 completion:0];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __74__SBIconDragManager__handleScaleAdjustmentForDropSession_currentListView___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconContentScale];
  return objc_msgSend(v1, "setIconContentScale:");
}

- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4
{
}

- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v28 = a3;
  id v8 = a4;
  uint64_t v9 = [(SBIconDragManager *)self _windowForDragPreviewsForPlatterView:v28 forWindowScene:v8];
  uint64_t v10 = v9;
  if (a5)
  {
    [v9 _setWindowInterfaceOrientation:a5];
    if (v8)
    {
      [v8 _referenceBounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double Width = v17;
    }
    else
    {
      long long v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v19 _referenceBounds];
      double v12 = v20;
      double v14 = v21;
      double v16 = v22;
      double Width = v23;
    }
    if ((unint64_t)(a5 - 3) <= 1)
    {
      v30.origin.x = v12;
      v30.origin.y = v14;
      v30.size.width = v16;
      v30.size.height = Width;
      CGFloat Height = CGRectGetHeight(v30);
      v31.origin.x = v12;
      v31.origin.y = v14;
      v31.size.width = v16;
      v31.size.height = Width;
      double Width = CGRectGetWidth(v31);
      double v16 = Height;
    }
    objc_msgSend(v10, "setFrame:", v12, v14, v16, Width);
  }
  [v10 beginTrackingPlatterView:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    singleUseDragWindows = self->_singleUseDragWindows;
    if (!singleUseDragWindows)
    {
      uint64_t v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v27 = self->_singleUseDragWindows;
      self->_singleUseDragWindows = v26;

      singleUseDragWindows = self->_singleUseDragWindows;
    }
    [(NSMutableArray *)singleUseDragWindows addObject:v10];
  }
}

- (void)removePlatterViewFromMedusaDragOffscreenWindow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 window];
  [v5 stopTrackingPlatterView:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NSMutableArray *)self->_singleUseDragWindows removeObject:v5];
    [v5 setHidden:1];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_singleUseDragWindows;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "windowScene", (void)v13);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v8 addObject:v11];
          [v11 setHidden:1];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  [(NSMutableArray *)self->_singleUseDragWindows removeObjectsInArray:v8];
}

- (id)_windowForDragPreviewsForPlatterView:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBIconDragManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v6 windowForIconDragPreviewsForIconDragManager:self forWindowScene:v5],
        (uint64_t v7 = (SBDefaultIconDragPreviewWindow *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [[SBDefaultIconDragPreviewWindow alloc] initWithWindowScene:v5];
    id v8 = objc_alloc_init(SBDefaultIconDragPreviewViewController);
    [(SBDefaultIconDragPreviewWindow *)v7 setRootViewController:v8];

    [(SBDefaultIconDragPreviewWindow *)v7 setWindowLevel:*MEMORY[0x1E4FB3110] + -4.0];
    [(SBDefaultIconDragPreviewWindow *)v7 setHidden:0];
    [(SBDefaultIconDragPreviewWindow *)v7 setUserInteractionEnabled:0];
  }

  return v7;
}

- (void)_updateDragPreviewIconViewForDropSession:(id)a3 inIconListView:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SBIconDragManager *)self canAcceptDropInSession:v6 inIconListView:v7])
  {
    char v8 = [v7 iconViewConfigurationOptions];
    uint64_t v9 = [v7 iconLocation];
    id v18 = v7;
    double v20 = [v7 layoutProvider];
    [MEMORY[0x1E4F39CF8] begin];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v6;
    id obj = [v6 items];
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "sbh_appDragLocalContext");
          long long v15 = [v14 portaledPreview];
          if (objc_opt_respondsToSelector()) {
            long long v16 = v15;
          }
          else {
            long long v16 = 0;
          }
          id v17 = v16;

          if (objc_opt_respondsToSelector()) {
            [v17 setIconViewListLayoutProvider:v20];
          }
          [v17 updateDestinationIconLocation:v9 allowsLabelArea:(v8 & 2) == 0 animated:1];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    [MEMORY[0x1E4F39CF8] commit];
    id v7 = v18;
    id v6 = v19;
  }
}

- (void)_updateDragDistanceForDropSession:(id)a3 currentIconListLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = [(SBIconDragManager *)self iconDragContextForDropSession:a3];
  if (![(SBIconDragManager *)self isDelegateScrolling])
  {
    [v11 currentEnteredIconListViewLastLocation];
    double v9 = hypot(x - v7, y - v8);
    [v11 currentEnteredIconListViewDragDistance];
    [v11 setCurrentEnteredIconListViewDragDistance:v9 + v10];
  }
  objc_msgSend(v11, "setCurrentEnteredIconListViewLastLocation:", x, y);
}

- (id)_iconForDragItem:(id)a3 inIconListView:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "sbh_appDragLocalContext");
  double v7 = v6;
  if (v6)
  {
    double v8 = [v6 uniqueIdentifier];
    double v9 = [v5 model];
    double v10 = [v9 folder];
    id v11 = [v10 indexPathForIconWithIdentifier:v8 includingPlaceholders:1];
    if (v11)
    {
      uint64_t v12 = [v10 iconAtIndexPath:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_iconViewForDragItem:(id)a3 inIconListView:(id)a4
{
  id v6 = a4;
  double v7 = [(SBIconDragManager *)self _iconForDragItem:a3 inIconListView:v6];
  if (v7)
  {
    double v8 = [v6 displayedIconViewForIcon:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (unint64_t)maximumAllowedIconDroppingAnimationsForListView:(id)a3
{
  return [a3 iconsInRowForSpacingCalculation];
}

+ (void)enumerateAppDragContextsInDragItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sbh_appDragLocalContext");
        if (v12)
        {
          char v13 = 0;
          v6[2](v6, v12, &v13);
          if (v13)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

+ (void)enumerateMedusaPlatterDragPreviewsInDragItems:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SBIconDragManager_enumerateMedusaPlatterDragPreviewsInDragItems_usingBlock___block_invoke;
  v8[3] = &unk_1E6AADC80;
  id v9 = v6;
  id v7 = v6;
  [a1 enumerateAppDragContextsInDragItems:a3 usingBlock:v8];
}

void __78__SBIconDragManager_enumerateMedusaPlatterDragPreviewsInDragItems_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    BOOL v3 = v5;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)draggedIconIdentifiersForDragDropSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(SBIconDragManager *)self _iconIdentifierForDragItem:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)draggedIconsForDragDropSession:(id)a3
{
  id v4 = [(SBIconDragManager *)self draggedIconIdentifiersForDragDropSession:a3];
  id v5 = [(SBIconDragManager *)self draggedIconsForIdentifiers:v4];

  return v5;
}

- (id)firstHiddenIconIdentifierInDrag:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconDragManager *)self draggedIconIdentifiersForDragDropSession:a3];
  id v5 = [(SBIconDragManager *)self model];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v11 = objc_msgSend(v5, "leafIconForIdentifier:", v10, (void)v13);
          if (v11 && ![v5 isIconVisible:v11])
          {
            id v7 = v10;

            goto LABEL_14;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)beginModifyingRootFolder
{
}

- (void)endModifyingRootFolder
{
}

- (void)performBeforeRunLoopWaitsUsingBlock:(id)a3
{
  id v4 = a3;
  if (!self->_waitRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    long long v14 = __57__SBIconDragManager_performBeforeRunLoopWaitsUsingBlock___block_invoke;
    long long v15 = &unk_1E6AAD210;
    objc_copyWeak(&v16, &location);
    self->_waitRunLoopObserver = CFRunLoopObserverCreateWithHandler(v5, 0xA0uLL, 0, 0, &v12);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_waitRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  runLoopWaitBlocks = self->_runLoopWaitBlocks;
  if (!runLoopWaitBlocks)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = self->_runLoopWaitBlocks;
    self->_runLoopWaitBlocks = v8;

    runLoopWaitBlocks = self->_runLoopWaitBlocks;
  }
  uint64_t v10 = objc_msgSend(v4, "copy", v12, v13, v14, v15);
  id v11 = _Block_copy(v10);
  [(NSMutableArray *)runLoopWaitBlocks addObject:v11];
}

void __57__SBIconDragManager_performBeforeRunLoopWaitsUsingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performBlocksBeforeRunLoopWait];
}

- (void)_teardownWaitRunloopObserverIfNeeded
{
  waitRunLoopObserver = self->_waitRunLoopObserver;
  if (waitRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(waitRunLoopObserver);
    CFRelease(self->_waitRunLoopObserver);
    self->_waitRunLoopObserver = 0;
  }
}

- (void)performBlocksBeforeRunLoopWait
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SBIconDragManager *)self _teardownWaitRunloopObserverIfNeeded];
  BOOL v3 = self->_runLoopWaitBlocks;
  runLoopWaitBlocks = self->_runLoopWaitBlocks;
  self->_runLoopWaitBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFAllocatorRef v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)allowsNestedFolders
{
  BOOL v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 allowsNestedFoldersForIconDragManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

void __39__SBIconDragManager_configureIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 hasGrabbedIcon:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 40) setGrabbed:1];
    [v6 addGrabbedIconView:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (CGPoint)adjustedLocationForDropSession:(id)a3 inView:(id)a4
{
  id v6 = a3;
  [v6 locationInView:a4];
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(SBIconDragManager *)self iconDragContextForDropSession:v6];

  [v11 initialTouchOffsetFromIconImageCenter];
  double v13 = v8 - v12;
  double v15 = v10 - v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (unint64_t)folderMutationOptionsForInsertingIcon:(id)a3 intoList:(id)a4 inLocation:(id)a5 isSnapToGridEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [v12 gridSizeClass];
  double v14 = v13;
  if (v13 == @"SBHIconGridSizeClassDefault")
  {

    uint64_t v17 = 0;
  }
  else
  {
    double v15 = [v12 gridSizeClass];
    int v16 = [v15 isEqualToString:@"SBHIconGridSizeClassDefault"];

    uint64_t v17 = 2;
    if (v16) {
      uint64_t v17 = 0;
    }
  }
  if (v6) {
    uint64_t v18 = v17 | 0xE00;
  }
  else {
    uint64_t v18 = v17;
  }
  int v19 = [v11 directlyContainsIcon:v12];

  if (v19) {
    unint64_t v20 = v18 | 4;
  }
  else {
    unint64_t v20 = v18;
  }
  BOOL v21 = [(SBIconDragManager *)self shouldMinimizeLayoutDisruptionForIconLocation:v10];

  if (v21) {
    return v20 | 0x1000000;
  }
  else {
    return v20;
  }
}

- (void)closeFolderControllerContainingListView:(id)a3
{
  id v10 = a3;
  char v4 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = v10;
    BOOL v6 = v5;
    do
    {
      double v7 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v9 = [v6 nextResponder];

      BOOL v6 = (void *)v9;
    }
    while (v9);
    [v4 iconDragManager:self folderController:v6 draggedIconShouldDropFromListView:v5];
  }
}

- (BOOL)isDelegateScrolling
{
  BOOL v2 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 isScrolling];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)pruneCancelableSourceFoldersInDestinationListView:(id)a3 withDragIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a4];
  double v8 = [v7 sourceIcons];
  uint64_t v9 = [v6 model];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__SBIconDragManager_pruneCancelableSourceFoldersInDestinationListView_withDragIdentifier___block_invoke;
  v26[3] = &unk_1E6AADBC8;
  id v11 = v8;
  id v27 = v11;
  id v12 = v10;
  id v28 = v12;
  [v9 enumerateFolderIconsUsingBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v19 = objc_msgSend(v18, "firstObject", (void)v22);
        unint64_t v20 = [v18 lastObject];
        id v21 = (id)[v9 replaceIcon:v19 withIcon:v20 options:0];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v15);
  }
}

void __90__SBIconDragManager_pruneCancelableSourceFoldersInDestinationListView_withDragIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 folder];
  if ([v4 isCancelable])
  {
    id v5 = [v4 allIcons];
    id v6 = (void *)[v5 mutableCopy];

    [v6 removeObjectsInArray:*(void *)(a1 + 32)];
    if ([v6 count] == 1)
    {
      double v7 = [v6 firstObject];
      double v8 = *(void **)(a1 + 40);
      v10[0] = v3;
      v10[1] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
      [v8 addObject:v9];
    }
  }
}

- (id)undoProvider
{
  id v3 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 undoProviderForIconDragManager:self];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)registerUndoWithUndoManager:(id)a3 preparation:(id)a4 draggedIcons:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = SBLogIconDragging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "Registering for undo", v16, 2u);
  }

  id v12 = +[SBHIconManager undoActionNameForDraggedIcons:v9];

  [v10 registerWithUndoManager:v8 actionName:v12 observer:self];
  registeredUndoManagers = self->_registeredUndoManagers;
  if (!registeredUndoManagers)
  {
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v15 = self->_registeredUndoManagers;
    self->_registeredUndoManagers = v14;

    registeredUndoManagers = self->_registeredUndoManagers;
  }
  [(NSHashTable *)registeredUndoManagers addObject:v8];
}

- (void)clearAllUndoRegistrations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBIconDragManager *)self undoProvider];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v4 = self->_registeredUndoManagers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "removeAllUndoRegistrationsInUndoManager:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSHashTable *)self->_registeredUndoManagers removeAllObjects];
}

- (NSString)description
{
  return (NSString *)[(SBIconDragManager *)self descriptionWithMultilinePrefix:@"\t"];
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  id v4 = a3;
  if ([(SBIconDragManager *)self isTrackingUserActiveIconDrags])
  {
    uint64_t v5 = SBLogIconDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "disallowing icon drag because there is already a drag in progress", v9, 2u);
    }

    uint64_t v6 = [(SBIconDragManager *)self delegate];
    char v7 = 0;
  }
  else
  {
    uint64_t v6 = [(SBIconDragManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v7 = [v6 iconDragManager:self canBeginIconDragForIconView:v4];
    }
    else {
      char v7 = 1;
    }
  }

  return v7;
}

- (id)dragItemsForIconView:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 iconDragManager:self dragItemsForIconView:v4];
  }
  else
  {
    char v7 = [v4 icon];
    uint64_t v8 = SBHIconDragItemWithIconAndIconView(v7, v4, (void *)*MEMORY[0x1E4FA6E60]);
    v10[0] = v8;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  return v6;
}

- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4
{
  id v6 = a3;
  char v7 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    a4 = [v7 iconDragManager:self draggingStartLocationForIconView:v6 proposedStartLocation:a4];
  }

  return a4;
}

- (double)additionalDragLiftScaleForIconView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 iconDragManager:self additionalDragLiftScaleForIconView:v4];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.1;
  }

  return v7;
}

- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = SBLogIconDragging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v8;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "icon view will animate drag lift: %@", buf, 0xCu);
  }

  long long v12 = [v8 icon];
  id v40 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v10];
  -[SBIconDragManager _startTrackingDragWithIdentifier:session:primaryIconView:](self, "_startTrackingDragWithIdentifier:session:primaryIconView:");
  id v13 = [(SBIconDragManager *)self iconDragContextForDragSession:v10];
  [v13 resetLastUserInteractionDate];
  [v13 addMessageExpectationNamed:@"iconViewLiftAnimationComplete"];
  [v8 addObserver:self];
  BOOL v38 = [(SBIconDragManager *)self shouldUseGhostIconForIconView:v8];
  if (v38)
  {
    uint64_t v14 = SBLogIconDragging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v8;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, "will use ghost icon for icon view: %@", buf, 0xCu);
    }

    [v13 addGrabbedIconView:v8];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
    v52[3] = &unk_1E6AAC810;
    id v53 = v8;
    [v9 addAnimations:v52];
  }
  if ([(SBIconDragManager *)self shouldUseIconCenterForDragPositionForIcon:v12])
  {
    id v15 = [v13 primaryIconView];

    if (v15 == v8)
    {
      [v10 locationInView:v8];
      double v17 = v16;
      double v19 = v18;
      [v8 iconImageCenter];
      objc_msgSend(v13, "setInitialTouchOffsetFromIconImageCenter:", v17 - v20, v19 - v21);
    }
  }
  long long v22 = [(SBIconDragManager *)self iconListViewContainingIcon:v12];
  long long v23 = [v10 items];
  long long v24 = [v23 firstObject];
  long long v25 = objc_msgSend(v24, "sbh_appDragLocalContext");

  uint64_t v39 = v25;
  uint64_t v26 = [v25 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_2;
  v49[3] = &unk_1E6AACA90;
  id v29 = v28;
  id v50 = v29;
  id v30 = v8;
  id v51 = v30;
  [v9 addAnimations:v49];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_3;
  v41[3] = &unk_1E6AADCD0;
  v41[4] = self;
  id v31 = v30;
  id v42 = v31;
  id v32 = v29;
  id v43 = v32;
  BOOL v48 = v38;
  id v33 = v12;
  id v44 = v33;
  id v34 = v40;
  id v45 = v34;
  id v35 = v13;
  id v46 = v35;
  id v36 = v22;
  id v47 = v36;
  [v9 addCompletion:v41];
  [(SBIconDragManager *)self changeStateOfDragWithIdentifier:v34 toState:1];
  long long v37 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v37 iconDragManager:self iconView:v31 willAnimateDragLiftWithAnimator:v9 session:v10];
  }
}

uint64_t __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGrabbed:1];
}

uint64_t __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconContentScale];
  objc_msgSend(v2, "setIconContentScale:");
  uint64_t result = [*(id *)(a1 + 32) dragState];
  if (!result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 setDragState:1];
  }
  return result;
}

void __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_4;
  double v17 = &unk_1E6AADCA8;
  id v4 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v4 enumerateIconDragContextsUsingBlock:&v14];
  uint64_t v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = a2;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "icon view lift animation did complete at position: %lu", buf, 0xCu);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHighlighted:", 0, v14, v15, v16, v17);
    if (*(unsigned char *)(a1 + 88)) {
      goto LABEL_12;
    }
    double v6 = [*(id *)(a1 + 40) location];
    double v7 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 56);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v7 _removeDraggedIconsFromLayout:v8 iconLocation:v6 dragIdentifier:*(void *)(a1 + 64)];

    id v9 = [*(id *)(a1 + 72) dragPlaceholder];
    if (!v9)
    {
      id v10 = [*(id *)(a1 + 80) model];
      int v11 = [v10 directlyContainsIcon:*(void *)(a1 + 56)];

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      long long v12 = *(void **)(a1 + 72);
      id v13 = [*(id *)(a1 + 56) gridSizeClass];
      [v12 setDragPlaceholderGridSizeClass:v13];

      [*(id *)(a1 + 72) setDragPlaceholderListView:*(void *)(a1 + 80)];
      id v9 = objc_msgSend(*(id *)(a1 + 80), "addPlaceholderRepresentingIcon:reason:options:", *(void *)(a1 + 56), @"drag", objc_msgSend(*(id *)(a1 + 32), "placeholderOptionsForListView:forDragWithIdentifier:", *(void *)(a1 + 80), *(void *)(a1 + 64)));
      [*(id *)(a1 + 72) setDragPlaceholder:v9];
    }

    goto LABEL_11;
  }
  if (a2 == 1) {
    objc_msgSend(*(id *)(a1 + 48), "draggingSourceCancelAnimationCompleted", v14, v15, v16, v17);
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 72), "removeMessageExpectationNamed:", @"iconViewLiftAnimationComplete", v14, v15, v16, v17);
  [*(id *)(a1 + 32) _stopTrackingDragIfPossibleWithIdentifier:*(void *)(a1 + 64)];
}

void __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 state] == 5)
  {
    id v3 = [v4 dragPreviewForIconView:*(void *)(a1 + 32)];
    [v3 dropDestinationAnimationCompleted];
  }
}

- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = SBLogIconDragging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "icon view drag lift animation did change direction: %@, new position: %li", buf, 0x16u);
  }

  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBIconDragManager *)self defaultIconLayoutAnimationDuration];
  double v10 = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke;
  v18[3] = &unk_1E6AAD728;
  id v11 = v6;
  id v19 = v11;
  BOOL v20 = a4 == 1;
  [v8 animateWithDuration:v18 animations:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke_2;
  v14[3] = &unk_1E6AADCF8;
  id v12 = v11;
  id v15 = v12;
  double v16 = self;
  BOOL v17 = a4 == 1;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v14];
  id v13 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 iconDragManager:self iconView:v12 dragLiftAnimationDidChangeDirection:a4];
  }
}

uint64_t __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setHighlighted:*(unsigned char *)(a1 + 40) == 0];
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setGrabbed:0];
  }
  return result;
}

void __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 hasSourceIconView:*(void *)(a1 + 32)])
  {
    [v7 resetLastUserInteractionDate];
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    [*(id *)(a1 + 40) changeStateOfDragWithIdentifier:v5 toState:v6];
  }
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogIconDragging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "icon view will begin drag: %@", buf, 0xCu);
  }

  double v9 = [(SBIconDragManager *)self delegate];
  if (![(SBIconDragManager *)self isEditing]
    && [(SBIconDragManager *)self shouldBeginEditingWhenDragBegins])
  {
    if (objc_opt_respondsToSelector())
    {
      [v9 setEditing:1 fromIconView:v6];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v9 setEditing:1];
    }
  }
  double v10 = [(SBIconDragManager *)self iconDragContextForDragSession:v7];
  [v10 addMessageExpectationNamed:@"iconViewEndSession"];
  id v11 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v7];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v7 items];
    objc_msgSend(v9, "iconDragManager:willBeginIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v11, objc_msgSend(v12, "count"));
  }
  if (objc_opt_respondsToSelector()) {
    [v9 iconDragManager:self iconView:v6 willBeginDragSession:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v6 window];
    uint64_t v14 = [v13 windowScene];
    [v9 dismissLibraryForIconDragManager:self windowScene:v14];
  }
  [(SBIconDragManager *)self changeStateOfDragWithIdentifier:v11 toState:3];
  [(SBIconDragManager *)self startTrackingDragLocationForEditingFromDropSession:0 orDragSession:v7];
  id v15 = [v7 items];
  [(SBIconDragManager *)self addAppLocalContextsFromDragItems:v15 toDragWithIdentifier:v11];

  double v16 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBIconDragManager *)self defaultIconLayoutAnimationDuration];
  double v18 = v17;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int64_t v24 = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke;
  uint64_t v25 = &unk_1E6AADD48;
  uint64_t v26 = self;
  id v27 = v7;
  id v28 = v6;
  id v29 = v10;
  id v19 = v10;
  id v20 = v6;
  id v21 = v7;
  [v16 animateWithDuration:&v22 animations:v18];
  [(SBIconDragManager *)self _updateDragPreviewsForEditingState:[(SBIconDragManager *)self isEditing] animated:0];
}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke(uint64_t a1)
{
  BOOL v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 40) items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_2;
  v6[3] = &unk_1E6AADD20;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 56);
  [v2 enumerateMedusaPlatterDragPreviewsInDragItems:v3 usingBlock:v6];
}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) customIconImageViewController];
  uint64_t v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    double v17 = __Block_byref_object_copy__3;
    double v18 = __Block_byref_object_dispose__3;
    id v19 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_3;
    void v10[3] = &unk_1E6AADA28;
    id v7 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 32);
    id v13 = &v14;
    [v7 enumerateIconDragContextsUsingBlock:v10];
    id v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    id v4 = v8;
  }
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = [*(id *)(a1 + 32) borrowIconImageView];
    [*(id *)(a1 + 48) setIconViewBorrowAssertion:v9 forIconView:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setBorrowedViewController:v4 forIconView:*(void *)(a1 + 32)];
    [v4 removeFromParentViewController];
    [v3 setIconViewCustomIconImageViewController:v4];
  }
  [v3 setDragState:2];
}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ((void *)a1[4] != a2)
  {
    id v6 = [a2 borrowedViewControllerForIconView:a1[5]];
    if (v6)
    {
      id v7 = v6;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
      id v6 = v7;
      *a4 = 1;
    }
  }
}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 icon];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = [v7 items];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "sbh_appDragLocalContext");

        if (!v14)
        {

          goto LABEL_24;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v39 = *MEMORY[0x1E4FA6E60];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  char v16 = [v7 hasItemsConformingToTypeIdentifiers:v15];

  if ((v16 & 1) == 0)
  {
LABEL_24:
    id v19 = [(SBIconDragManager *)self iconDragContextForDragSession:v7];
LABEL_25:
    id v27 = [(SBIconDragManager *)self delegate];
    goto LABEL_26;
  }
  int v17 = [v8 canBeAddedToMultiItemDrag];
  double v18 = [(SBIconDragManager *)self iconDragContextForDragSession:v7];
  id v19 = v18;
  if (!v17) {
    goto LABEL_25;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = objc_msgSend(v18, "draggedIcons", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        if (([*(id *)(*((void *)&v30 + 1) + 8 * j) canBeAddedToMultiItemDrag] & 1) == 0)
        {

          goto LABEL_25;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = [v8 nodeIdentifier];
  int v26 = [v19 hasItemIdentifier:v25];

  if (v26) {
    goto LABEL_25;
  }
  id v27 = [(SBIconDragManager *)self delegate];
  if (![(SBIconDragManager *)self isEditing])
  {
LABEL_26:
    char v28 = 0;
    goto LABEL_27;
  }
  if (objc_opt_respondsToSelector()) {
    char v28 = [v27 iconDragManager:self canAddDragItemsToSession:v7 fromIconView:v6];
  }
  else {
    char v28 = 1;
  }
LABEL_27:

  return v28;
}

- (void)iconView:(id)a3 willAddDragItems:(id)a4 toSession:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SBLogIconDragging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "icon view will add drag items: %@", buf, 0xCu);
  }

  uint64_t v12 = [v8 icon];
  id v13 = [(SBIconDragManager *)self delegate];
  uint64_t v14 = [(SBIconDragManager *)self iconListViewContainingIcon:v12];
  id v15 = [(SBIconDragManager *)self iconDragContextForDragSession:v10];
  if ([(SBIconDragManager *)self doesIconViewRepresentRealIconPosition:v8])
  {
    char v16 = [v15 draggedIconsHiddenAssertion];
    int v17 = SBLogIconDragging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v12;
      __int16 v29 = 2112;
      long long v30 = v16;
      _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "adding icon %@ to icon hiding assertion %@", buf, 0x16u);
    }

    [v16 addIcon:v12];
  }
  [v15 addSourceIcon:v12];
  [v15 addSourceIconView:v8];
  double v18 = [v12 nodeIdentifier];
  [v15 addItemIdentifier:v18];

  id v19 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v10];
  if (objc_opt_respondsToSelector())
  {
    id v20 = [v10 items];
    objc_msgSend(v13, "iconDragManager:didAddItemsToIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v19, objc_msgSend(v20, "count"));
  }
  int v26 = v8;
  uint64_t v21 = [v15 state];
  [(SBIconDragManager *)self changeStateOfDragWithIdentifier:v19 toState:4];
  uint64_t v25 = v14;
  [v14 layoutIconsIfNeededWithAnimationType:0 options:1];
  [(SBIconDragManager *)self layoutIconListsWithAnimationType:0 forceRelayout:0];
  if ([(SBIconDragManager *)self shouldBeginEditingWhenAddingDragItems]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v13 setEditing:1];
  }
  uint64_t v22 = v9;
  [(SBIconDragManager *)self addAppLocalContextsFromDragItems:v9 toDragWithIdentifier:v19];
  uint64_t v23 = objc_opt_class();
  int64_t v24 = [v10 items];
  [v23 enumerateMedusaPlatterDragPreviewsInDragItems:v24 usingBlock:&__block_literal_global_321];

  [v15 resetLastUserInteractionDate];
  if (v21 != 4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v13 iconDragManagerMultiItemIconDraggingDidChange:self];
  }
}

uint64_t __57__SBIconDragManager_iconView_willAddDragItems_toSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFlocked:1];
}

- (void)handleIconView:(id)a3 dragSession:(id)a4 willEndWithOperation:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = SBLogIconDragging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2048;
    unint64_t v12 = a5;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "icon view drag session will end: %@, operation: %lu", (uint8_t *)&v9, 0x16u);
  }

  if (![(SBIconDragManager *)self isTrackingUserActiveIconDrags]) {
    [(SBIconDragManager *)self _invalidateAutoScrollAssistant];
  }
}

- (void)handleIconView:(id)a3 dragSession:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = SBLogIconDragging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2048;
    unint64_t v21 = a5;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_INFO, "icon view drag session did end: %@, operation: %lu", buf, 0x16u);
  }

  __int16 v11 = [(SBIconDragManager *)self iconDragContextForDragSession:v9];
  if ([v11 hasMessageExpectationNamed:@"iconViewEndSession"])
  {
    [v8 setHighlighted:0];
    unint64_t v12 = objc_opt_class();
    uint64_t v13 = [v9 items];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__SBIconDragManager_handleIconView_dragSession_didEndWithOperation___block_invoke;
    v17[3] = &__block_descriptor_40_e33_v24__0___SBIconDragPreview__8_B16l;
    v17[4] = a5;
    [v12 enumerateMedusaPlatterDragPreviewsInDragItems:v13 usingBlock:v17];

    uint64_t v14 = [(SBIconDragManager *)self uniqueIdentifierForIconDragSession:v9];
    id v15 = [(SBIconDragManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v16 = [v9 items];
      objc_msgSend(v15, "iconDragManager:didEndIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v14, objc_msgSend(v16, "count"));
    }
    if (objc_opt_respondsToSelector()) {
      [v15 iconDragManager:self iconView:v8 didEndDragSession:v9 withOperation:a5];
    }
    [v11 removeMessageExpectationNamed:@"iconViewEndSession"];
    if (([v11 performedIconDrop] & 1) == 0 && (objc_msgSend(v11, "isCancelled") & 1) == 0) {
      [v8 setGrabbed:0];
    }
    [(SBIconDragManager *)self _stopTrackingDragIfPossibleWithIdentifier:v14];
  }
  else
  {
    uint64_t v14 = SBLogIconDragging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, "already received iconView:dragSession:didEndWithOperation: so exiting early", buf, 2u);
    }
  }
}

uint64_t __68__SBIconDragManager_handleIconView_dragSession_didEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 draggingSourceDroppedWithOperation:*(void *)(a1 + 32)];
}

- (id)iconViewWillCancelDrag:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "icon view will cancel drag: %@", buf, 0xCu);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke;
  v29[3] = &unk_1E6AADCA8;
  id v6 = v4;
  id v30 = v6;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v29];
  id v7 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 iconViewQueryableForIconDragManager:self];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 icon];
  id v10 = [v6 location];
  uint64_t v11 = [v8 iconViewForIcon:v9 location:v10];
  if (v11)
  {
    id v12 = (id)v11;
    goto LABEL_8;
  }
  uint64_t v14 = objc_opt_class();
  id v9 = v9;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v15 = v9;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    uint64_t v17 = [v16 referencedIcon];

    id v12 = [v8 iconViewForIcon:v17 location:v10];

    id v9 = (id)v17;
    if (v12) {
      goto LABEL_8;
    }
  }
  uint64_t v13 = [(SBIconDragManager *)self iconListViewContainingIcon:v9];
  if (![v13 restoreDraggedIconView:v6]) {
    goto LABEL_20;
  }
  id v12 = v6;

  if (v12)
  {
LABEL_8:
    uint64_t v13 = v12;
    if (SBIconViewQueryingDisplayingIcon(v8, v9, 17)) {
      goto LABEL_21;
    }
LABEL_20:

    id v12 = 0;
  }
LABEL_21:
  if (![(SBIconDragManager *)self isIconDragging])
  {

    id v12 = 0;
  }
  double v18 = [v12 markAsDropping];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke_2;
  v25[3] = &unk_1E6AADDB0;
  id v26 = v18;
  id v27 = v6;
  id v19 = v12;
  id v28 = v19;
  id v20 = v6;
  id v21 = v18;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v25];
  uint64_t v22 = v28;
  id v23 = v19;

  return v23;
}

void __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSourceIconView:*(void *)(a1 + 32)]) {
    [v3 setCancelled:1];
  }
}

void __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (a1[4] && a1[5] && objc_msgSend(v6, "hasSourceIconView:")) {
    [v6 addIconViewDroppingAssertion:a1[4] forIconView:a1[6]];
  }
}

- (void)iconView:(id)a3 willUsePreviewForCancelling:(id)a4 targetIconView:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = SBLogIconDragging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "icon view will cancel drag using target icon view: %@ %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__SBIconDragManager_iconView_willUsePreviewForCancelling_targetIconView___block_invoke;
  v12[3] = &unk_1E6AADAB8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v12];
}

void __73__SBIconDragManager_iconView_willUsePreviewForCancelling_targetIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasSourceIconView:*(void *)(a1 + 32)]) {
    [v3 setTargetIconView:*(void *)(a1 + 40) forCancellingIconView:*(void *)(a1 + 32)];
  }
}

- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SBLogIconDragging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v8;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "icon view will animate drag cancel: %@", buf, 0xCu);
  }

  id v12 = objc_msgSend(v9, "sbh_appDragLocalContext");
  id v13 = [v12 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke;
    v35[3] = &unk_1E6AACDE0;
    id v36 = v12;
    id v37 = v15;
    id v38 = v8;
    [v10 addAnimations:v35];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_2;
  v33[3] = &unk_1E6AACB50;
  id v16 = v15;
  id v34 = v16;
  [v10 addCompletion:v33];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_3;
  v29[3] = &unk_1E6AADDB0;
  id v17 = v8;
  id v30 = v17;
  id v18 = v10;
  id v31 = v18;
  id v32 = self;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v29];
  [(SBIconDragManager *)self layoutIconListsWithAnimationType:0 forceRelayout:0];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  int64_t v24 = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_6;
  uint64_t v25 = &unk_1E6AADDD8;
  id v26 = self;
  id v19 = v17;
  id v27 = v19;
  id v20 = v9;
  id v28 = v20;
  [v18 addCompletion:&v22];
  id v21 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v21 iconDragManager:self iconView:v19 item:v20 willAnimateDragCancelWithAnimator:v18];
  }
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke(id *a1)
{
  if ([a1[4] cancelsViaScaleAndFade]) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 3;
  }
  id v3 = a1[5];
  [a1[6] iconContentScale];
  objc_msgSend(v3, "setIconContentScale:");
  objc_msgSend(a1[5], "setIconAllowsLabelArea:", objc_msgSend(a1[6], "allowsLabelArea"));
  id v4 = a1[5];
  return [v4 setDragState:v2];
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) draggingSourceCancelAnimationCompleted];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) setIcon:0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setIconViewCustomIconImageViewController:0];
  }
  return result;
}

void __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 hasSourceIconView:*(void *)(a1 + 32)])
  {
    id v7 = [v5 targetIconViewForCancellingIconView:*(void *)(a1 + 32)];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 markAsDropping];
      id v10 = *(void **)(a1 + 40);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_4;
      v19[3] = &unk_1E6AACB50;
      id v20 = v9;
      id v11 = v9;
      [v10 addCompletion:v19];
    }
    [v5 resetDraggedIconsHiddenAssertion];
    [v5 resetDragPlaceholder];
    [v5 resetLastUserInteractionDate];
    [*(id *)(a1 + 48) changeStateOfDragWithIdentifier:v6 toState:5];
    id v12 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_5;
    v15[3] = &unk_1E6AADDD8;
    id v13 = v5;
    uint64_t v14 = *(void *)(a1 + 48);
    id v16 = v13;
    uint64_t v17 = v14;
    id v18 = v6;
    [v12 addCompletion:v15];
  }
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateIconViewBorrowAssertions];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 changeStateOfDragWithIdentifier:v3 toState:6];
}

void __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_6(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:*(void *)(a1 + 40)] <= 1)objc_msgSend(*(id *)(a1 + 40), "cleanUpAfterDropAnimation"); {
  id v2 = [*(id *)(a1 + 32) iconDragContextForDragItem:*(void *)(a1 + 48)];
  }
  [v2 clearAllDropAssertions];
}

- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = SBLogIconDragging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, "icon view '%@' drag preview for item '%@'", buf, 0x16u);
  }

  id v15 = [(SBIconDragManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v15 iconDragManager:self dragPreviewForIconView:v10],
        (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    int64_t v24 = __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke;
    uint64_t v25 = &unk_1E6AADD48;
    id v18 = v16;
    id v26 = v18;
    id v27 = v10;
    id v28 = self;
    id v29 = v12;
    [v17 performWithoutAnimation:&v22];
    id v19 = objc_msgSend(v11, "sbh_appDragLocalContext", v22, v23, v24, v25);
    [v19 setPortaledPreview:v18];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v18 parameters:v13];
    objc_msgSend(v20, "set_springboardPlatterStyle:", 1);

    if (v20) {
      goto LABEL_12;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v20 = [v15 iconDragManager:self targetedDragPreviewForIconView:v10 item:v11 session:v12 previewParameters:v13];
    id v18 = 0;
    if (v20) {
      goto LABEL_12;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v20 = [v10 defaultDragPreviewWithParameters:v13];
LABEL_12:

  return v20;
}

void __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:0];
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", objc_msgSend(*(id *)(a1 + 40), "allowsLabelArea"));
  id v2 = [*(id *)(a1 + 48) uniqueIdentifierForIconDragSession:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 48) _isTrackingDragWithIdentifier:v2]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [*(id *)(a1 + 32) setDragState:v3];
  [*(id *)(a1 + 40) iconImageCenter];
  double v5 = v4;
  double v7 = v6;
  id v8 = *(void **)(a1 + 40);
  id v9 = [v8 window];
  objc_msgSend(v8, "convertPoint:toView:", v9, v5, v7);
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", v11, v13);
  uint64_t v14 = [*(id *)(a1 + 40) window];
  uint64_t v15 = [v14 _windowInterfaceOrientation];
  id v16 = *(void **)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = [*(id *)(a1 + 40) window];
  id v19 = [v18 windowScene];
  [v16 addPlatterViewToMedusaDragOffscreenWindow:v17 forWindowScene:v19 interfaceOrientation:v15];

  id v20 = *(void **)(a1 + 32);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke_2;
  v22[3] = &unk_1E6AADE00;
  v22[4] = *(void *)(a1 + 48);
  [v20 setCleanUpHandler:v22];
  [*(id *)(a1 + 48) _startTrackingDragWithIdentifier:v2 session:*(void *)(a1 + 56) primaryIconView:*(void *)(a1 + 40)];
  id v21 = [*(id *)(a1 + 48) iconDragContextForDragWithIdentifier:v2];
  [v21 resetLastUserInteractionDate];
  [v21 setDragPreview:*(void *)(a1 + 32) forIconView:*(void *)(a1 + 40)];
}

void __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v7;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  [*(id *)(a1 + 32) removePlatterViewFromMedusaDragOffscreenWindow:v6];
}

- (void)_updateDragPreviewsForEditingState:(BOOL)a3 animated:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke;
  v4[3] = &__block_descriptor_34_e34_v32__0__SBIconDragContext_8_16_B24l;
  BOOL v5 = a3;
  BOOL v6 = a4;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v4];
}

uint64_t __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke_2;
  v3[3] = &__block_descriptor_34_e54_v32__0__UIView_SBIconDragPreview__8__SBIconView_16_B24l;
  __int16 v4 = *(_WORD *)(a1 + 32);
  return [a2 enumerateDragPreviewsUsingBlock:v3];
}

void __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 dragState] != 1) {
    [v3 setIconIsEditing:*(unsigned __int8 *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 33)];
  }
}

- (BOOL)dragsSupportSystemDragsForIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconDragManager:self dragsSupportSystemDragsForIconView:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)launchActionsForIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconDragManager:self launchActionsForIconView:v4];
  }
  else {
  char v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (id)launchURLForIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 iconDragManager:self launchURLForIconView:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)canHandleIconDropSession:(id)a3 inIconListView:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 iconDragTypeIdentifier];
  id v9 = (void *)v8;
  if (!v8) {
    goto LABEL_12;
  }
  v20[0] = v8;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  int v11 = [v6 hasItemsConformingToTypeIdentifiers:v10];

  if (!v11) {
    goto LABEL_12;
  }
  if (![(SBIconDragManager *)self isEditingForListView:v7])
  {
    double v12 = [v6 localDragSession];
    if (v12 && [(SBIconDragManager *)self _isTrackingDrag:v6])
    {
      BOOL v13 = [(SBIconDragManager *)self isIconContentPossiblyVisibleOverApplication];

      if (!v13)
      {
LABEL_12:
        BOOL v18 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if (([v7 isDragSpringloadingEnabled] & 1) == 0)
  {
    uint64_t v14 = [(SBIconDragManager *)self iconDragContextForDropSession:v6];
    uint64_t v15 = [v14 draggedIcons];
    id v16 = [v7 model];
    int v17 = [v16 isAllowedToContainIcons:v15];

    if (!v17) {
      goto LABEL_12;
    }
  }
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

- (BOOL)canAcceptDropInSession:(id)a3 inIconListView:(id)a4
{
  return [(SBIconDragManager *)self reasonForRejectingDropInSession:a3 inIconListView:a4] == 0;
}

- (int64_t)reasonForRejectingDropInSession:(id)a3 inIconListView:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBIconDragManager *)self delegate];
  if ([(SBIconDragManager *)self isEditingAllowedForListView:v7])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v8 iconDragManager:self canAcceptDropInSession:v6 inIconListView:v7] & 1) != 0)
    {
      id v9 = [(SBIconDragManager *)self iconDragContextForDropSession:v6];
      double v10 = [v9 draggedIcons];
      uint64_t v11 = [(SBIconDragManager *)self duplicateIconsIfNecessary:v10 forDropSession:v6];

      double v12 = [v9 recipientIconView];
      uint64_t v23 = [(SBIconDragManager *)self draggedIconIdentifiersForDragDropSession:v6];
      BOOL v13 = [v7 model];
      uint64_t v14 = [v13 folder];
      if (v12) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v13;
      }
      id v16 = v15;
      int64_t v24 = (void *)v11;
      uint64_t v22 = v16;
      if (v14 && ([v14 canAddIcons:v11 startingAtList:v16] & 1) == 0)
      {
        int v17 = SBLogIconDragging();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v20 = v23;
          *(_DWORD *)buf = 134217984;
          uint64_t v26 = [v23 count];
          _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "rejecting drop session because folder can't accommodate all items in drag (%lu)", buf, 0xCu);
          int64_t v19 = 5;
          goto LABEL_15;
        }
        int64_t v19 = 5;
      }
      else
      {
        int v17 = [(SBIconDragManager *)self firstHiddenIconIdentifierInDrag:v6];
        if (v17)
        {
          BOOL v18 = SBLogIconDragging();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = (uint64_t)v17;
            _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "rejecting drop session entirely because it contains an icon which is not visible (%@)", buf, 0xCu);
          }
          int64_t v19 = 7;
        }
        else if ([(SBIconDragManager *)self isEditingForListView:v7])
        {
          if (v14 && ([v14 isAllowedToContainIcons:v11] & 1) == 0)
          {
            BOOL v18 = SBLogIconDragging();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "rejecting drop session because folder isn't allowed to contain some or all of the items in drag", buf, 2u);
            }
            int64_t v19 = 5;
          }
          else if ([v13 isAllowedToContainIcons:v11])
          {
            if (([v14 isRootFolder] & 1) != 0
              || ![v9 hasFolderDraggedIcons]
              || [(SBIconDragManager *)self allowsNestedFolders])
            {
              int64_t v19 = 0;
              goto LABEL_14;
            }
            BOOL v18 = SBLogIconDragging();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "rejecting drop session because the drag has a folder and we aren't allowed to nest folders", buf, 2u);
            }
            int64_t v19 = 8;
          }
          else
          {
            BOOL v18 = SBLogIconDragging();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "rejecting drop session because destination list isn't allowed to contain some or all of the items in drag", buf, 2u);
            }
            int64_t v19 = 6;
          }
        }
        else
        {
          BOOL v18 = SBLogIconDragging();
          int64_t v19 = 1;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            int64_t v19 = 1;
            _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "rejecting drop session entirely because editing mode is not active", buf, 2u);
          }
        }
      }
LABEL_14:
      id v20 = v23;
LABEL_15:

      goto LABEL_22;
    }
    id v9 = SBLogIconDragging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "rejecting drop session because icon manager delegate doesn't allow it", buf, 2u);
    }
    int64_t v19 = 4;
  }
  else
  {
    id v9 = SBLogIconDragging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int64_t v19 = 2;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "rejecting drop session because editing is not allowed", buf, 2u);
    }
    else
    {
      int64_t v19 = 2;
    }
  }
LABEL_22:

  return v19;
}

- (void)iconDropSessionDidEnter:(id)a3 inIconListView:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBIconDragManager *)self draggedIconIdentifiersForDragDropSession:v6];
  id v9 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v6];
  double v10 = SBLogIconDragging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v8;
    __int16 v43 = 2048;
    id v44 = v7;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_INFO, "drop session did enter with identifier: %{public}@, dragged identifiers: %@, icon list view: %p", buf, 0x20u);
  }

  BOOL v11 = [(SBIconDragManager *)self _isTrackingDrag:v6];
  [(SBIconDragManager *)self _startTrackingDragWithIdentifier:v9 session:v6];
  double v12 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v9];
  [v12 setItemIdentifiers:v8];
  [v12 setDragItemWasConsumedExternally:0];
  if (!v11) {
    [v12 setExternalDrag:1];
  }
  BOOL v13 = [(SBIconDragManager *)self delegate];
  if (![(SBIconDragManager *)self isEditing] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v13 setEditing:1 fromIconListView:v7];
  }
  if (v6) {
    [v7 addDragObserver:self forDropSession:v6];
  }
  if (([v12 hasEnteredIconListView:v7] & 1) == 0)
  {
    [v12 addMessageExpectationNamed:@"dropSessionDidEnd"];
    [v12 addEnteredIconListView:v7];
    uint64_t v14 = [v6 items];
    [(SBIconDragManager *)self addAppLocalContextsFromDragItems:v14 toDragWithIdentifier:v9];

    uint64_t v15 = [v6 items];
    [(SBIconDragManager *)self createIconsFromDragItemsIfNecessary:v15 withDragIdentifier:v9];

    id v16 = [v6 items];
    [(SBIconDragManager *)self addApplicationIconsFromDragItems:v16 session:v6 toDragWithIdentifier:v9];

    int v17 = [v6 items];
    if ((unint64_t)[v17 count] <= 1) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 4;
    }
    [(SBIconDragManager *)self changeStateOfDragWithIdentifier:v9 toState:v18];
  }
  [v12 setCurrentEnteredIconListView:v7];
  [(SBIconDragManager *)self adjustedLocationForDropSession:v6 inView:v7];
  objc_msgSend(v12, "setCurrentEnteredIconListViewLastLocation:");
  [v12 setCurrentEnteredIconListViewDragDistance:0.0];
  if (!v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v30 = v9;
    id v32 = v7;
    id v29 = v13;
    id v31 = self;
    int64_t v19 = [v13 iconViewDelegateForExternalDragForIconDragManager:self];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = v6;
    id v20 = [v6 items];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "sbh_appDragLocalContext");
          uint64_t v26 = [v25 portaledPreview];
          if (objc_opt_respondsToSelector()) {
            uint64_t v27 = v26;
          }
          else {
            uint64_t v27 = 0;
          }
          id v28 = v27;

          if (v28)
          {
            if (objc_opt_respondsToSelector()) {
              [v28 setIconViewDelegate2:v19];
            }
            else {
              [v28 setIconViewDelegate:v19];
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }

    id v7 = v32;
    id v6 = v33;
    self = v31;
    id v9 = v30;
    BOOL v13 = v29;
  }
  [(SBIconDragManager *)self _updateDragPreviewIconViewForDropSession:v6 inIconListView:v7];
  [(SBIconDragManager *)self _updateAutoScrollAssistantForDropSession:v6];
  if (([v12 notifiedDelegateForDropSession] & 1) == 0)
  {
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 iconDragManager:self iconDropSessionDidEnter:v6];
    }
    [v12 setNotifiedDelegateForDropSession:1];
  }
  if (objc_opt_respondsToSelector()) {
    [v13 iconDragManager:self iconDropSession:v6 didEnterIconListView:v7];
  }
  [v12 resetLastUserInteractionDate];
}

- (void)informQuickActionPlatterDidFinishPresentation:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__3;
    int v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __67__SBIconDragManager_informQuickActionPlatterDidFinishPresentation___block_invoke;
    double v10 = &unk_1E6AAD998;
    id v11 = v4;
    double v12 = &v13;
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:&v7];
    uint64_t v6 = v14[5];
    if (v6) {
      -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v6, 0, v7, v8, v9, v10);
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __67__SBIconDragManager_informQuickActionPlatterDidFinishPresentation___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  uint64_t v8 = [a2 primaryIconView];
  int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBIconDragManager *)self adjustedLocationForDropSession:v6 inView:v7];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v6];
  uint64_t v13 = SBLogIconDragging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    double v52 = *(double *)&v12;
    __int16 v53 = 2048;
    double v54 = *(double *)&v7;
    __int16 v55 = 2048;
    double v56 = v9;
    __int16 v57 = 2048;
    double v58 = v11;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "drop session did update: identifier %{public}@, icon list view: %p, location in list view: (%f,%f)", buf, 0x2Au);
  }

  [(SBIconDragManager *)self _handleScaleAdjustmentForDropSession:v6 currentListView:v7];
  [(SBIconDragManager *)self _updateDragPreviewIconViewForDropSession:v6 inIconListView:v7];
  uint64_t v14 = [(SBIconDragManager *)self iconDragContextForDropSession:v6];
  [v14 resetLastUserInteractionDate];
  -[SBIconDragManager _updateDragDistanceForDropSession:currentIconListLocation:](self, "_updateDragDistanceForDropSession:currentIconListLocation:", v6, v9, v11);
  [v7 bounds];
  v61.double x = v9;
  v61.double y = v11;
  objc_msgSend(v14, "setWasLastUpdateContainedInDestinationIconListView:", CGRectContainsPoint(v62, v61));
  uint64_t v15 = objc_msgSend(v7, "iconAtPoint:index:", 0, v9, v11);
  uint64_t v16 = objc_msgSend(v7, "dragHitRegionForPoint:icon:", v15, v9, v11);
  v49 = [v14 recipientIconView];
  uint64_t v17 = [v49 icon];
  id v18 = (void *)v17;
  id v50 = (void *)v12;
  if (v7 && v17)
  {
    int64_t v19 = [v15 uniqueIdentifier];
    id v20 = [v18 uniqueIdentifier];
    char v21 = [v19 isEqual:v20];

    if ((v16 & 1) == 0 && (v21 & 1) == 0)
    {
      uint64_t v22 = SBLogIconDragging();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v23 = "clearing recipient icon because we got a None drag hit region";
LABEL_23:
        uint64_t v26 = v22;
        uint32_t v27 = 2;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    if ((v21 & 1) == 0)
    {
      uint64_t v22 = SBLogIconDragging();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v23 = "clearing recipient icon because we the icons don't match";
        goto LABEL_23;
      }
LABEL_25:

      [v14 setRecipientIconView:0];
      uint64_t v12 = (uint64_t)v50;
      goto LABEL_26;
    }
    uint64_t v12 = (uint64_t)v50;
    if ((v16 & 3) == 1)
    {
      if ((uint64_t v24 = [v14 recipientIconEntryRegion], v25 = v24, (v24 & 0x10) != 0) && (v16 & 0x20) != 0
        || (v24 & 0x20) != 0 && (v16 & 0x10) != 0
        || (v24 & 4) != 0 && (v16 & 8) != 0
        || (v24 & 8) != 0 && (v16 & 4) != 0)
      {
        uint64_t v22 = SBLogIconDragging();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          double v52 = *(double *)&v16;
          __int16 v53 = 2048;
          double v54 = *(double *)&v25;
          uint64_t v23 = "clearing recipient icon because the current hit region (%li) is on the opposite side of the entry region (%li)";
          uint64_t v26 = v22;
          uint32_t v27 = 22;
LABEL_24:
          _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_INFO, v23, buf, v27);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
  }
LABEL_26:
  id v28 = [v14 recipientIconView];

  if (v15 && !v28)
  {
    [v14 setCandidateRecipientIcon:v15];
    [v14 setRecipientIconEntryRegion:v16];
  }
  if (![(SBIconDragManager *)self isEditing])
  {
    id v29 = [(SBIconDragManager *)self draggingEditContext];
    id v30 = [v29 draggingUniqueIdentifier];

    if (v30 == (void *)v12)
    {
      id v31 = [MEMORY[0x1E4FB1BA8] mainScreen];
      id v32 = [v31 coordinateSpace];
      objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v32, v9, v11);
      double v34 = v33;
      double v36 = v35;

      if ([v29 enteredScreenLocationNeedsUpdate])
      {
        long long v37 = SBLogIconDragging();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          double v52 = v34;
          __int16 v53 = 2048;
          double v54 = v36;
          _os_log_impl(&dword_1D7F0A000, v37, OS_LOG_TYPE_INFO, "updating screen location for edit tracking to (%f,%f)", buf, 0x16u);
        }

        objc_msgSend(v29, "setEnteredScreenLocation:", v34, v36);
        [v29 setEnteredScreenLocationNeedsUpdate:0];
      }
    }
  }
  int64_t v38 = [(SBIconDragManager *)self reasonForRejectingDropInSession:v6 inIconListView:v7];
  [v14 setDragRejectionReason:v38];
  if (v15) {
    [(SBIconDragManager *)self updatePlaceholderPositionIfNecessaryForDragWithIdentifier:v12];
  }
  else {
    [(SBIconDragManager *)self updatePlaceholderPositionForDragWithIdentifier:v12];
  }
  uint64_t v39 = 2 * (v38 == 0);
  if (v38)
  {
    uint64_t v40 = 0;
  }
  else if ([v14 duplicatesSourceIcons])
  {
    __int16 v41 = [v14 removedMatchingLeafIcons];

    if (v41) {
      uint64_t v40 = 2;
    }
    else {
      uint64_t v40 = 3;
    }
  }
  else
  {
    uint64_t v40 = 2;
  }
  id v42 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v39];
  [v42 setPrefersFullSizePreview:1];
  [v42 _setPreferredBadgeStyle:v40];
  __int16 v43 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v44 = [v14 draggedIcons];
    uint64_t v45 = [MEMORY[0x1E4F1CAD0] setWithArray:v44];
    id v46 = [v43 iconDragManager:self iconDropSessionDidUpdate:v6 inIconListView:v7 draggedIcons:v45 proposedDropProposal:v42];

    if (v46 != v42)
    {
      id v47 = SBLogIconDragging();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        double v52 = *(double *)&v42;
        __int16 v53 = 2112;
        double v54 = *(double *)&v46;
        _os_log_impl(&dword_1D7F0A000, v47, OS_LOG_TYPE_INFO, "the delegate told us to adjust the drop proposal from %@ to %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v46 = v42;
  }

  return v46;
}

- (void)updatePlaceholderPositionIfNecessaryForDragWithIdentifier:(id)a3
{
  id v5 = a3;
  [(SBIconDragManager *)self placeholderRepositioningDelay];
  if (v4 <= 0.0) {
    [(SBIconDragManager *)self updatePlaceholderPositionForDragWithIdentifier:v5];
  }
  else {
    [(SBIconDragManager *)self updateDragPauseForDragWithIdentifier:v5];
  }
}

- (void)updateDragPauseForDragWithIdentifier:(id)a3
{
  id v12 = a3;
  [(SBIconDragManager *)self placeholderRepositioningDelay];
  if (v4 > 0.0)
  {
    id v5 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v12];
    [v5 currentEnteredIconListViewLastLocation];
    double v7 = v6;
    double v9 = v8;
    double v10 = [v5 pauseTimer];
    if (!v10 || ([v5 pauseLocation], UIDistanceBetweenPoints(), v11 > 20.0)) {
      -[SBIconDragManager startPlaceholderPauseTimerWithDragLocation:withDragIdentifier:](self, "startPlaceholderPauseTimerWithDragLocation:withDragIdentifier:", v12, v7, v9);
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)updatePlaceholderPositionForDragWithIdentifier:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v4];
  if ([v5 dragRejectionReason])
  {
    double v6 = SBLogIconDragging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v68 = (unint64_t)v4;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "ignoring pause of drag session '%@' because we cannot accept the drop", buf, 0xCu);
    }
    goto LABEL_68;
  }
  if ([(SBIconDragManager *)self isIconDragging])
  {
    [(SBIconDragManager *)self stopPlaceholderPauseTimerWithDragLocationWithDragIdentifier:v4];
    [v5 currentEnteredIconListViewLastLocation];
    double v8 = v7;
    double v10 = v9;
    double v11 = SBLogIconDragging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v68 = (unint64_t)v4;
      __int16 v69 = 2048;
      double v70 = v8;
      __int16 v71 = 2048;
      double v72 = v10;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "drag session '%@' did pause at location (%f,%f)", buf, 0x20u);
    }

    double v6 = [(SBIconDragManager *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 isTrackingScroll])
    {
      id v12 = SBLogIconDragging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v68 = (unint64_t)v4;
        uint64_t v13 = "ignoring pause of drag session '%@' because scroll view is tracking";
LABEL_17:
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
        goto LABEL_67;
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v6 isAnimatingFolderIconTransitionForIconDragManager:self])
    {
      id v12 = SBLogIconDragging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v68 = (unint64_t)v4;
        uint64_t v13 = "ignoring pause of drag session '%@' because there is an animated transition inflight";
        goto LABEL_17;
      }
LABEL_67:

      goto LABEL_68;
    }
    id v12 = [v5 currentEnteredIconListView];
    uint64_t v14 = [v12 gridCellInfo];
    uint64_t v15 = [v5 dragPlaceholderGridSizeClass];
    uint64_t v16 = [v12 displayedModel];
    v65 = (void *)v15;
    __int16 v63 = v16;
    if ([(SBIconDragManager *)self prioritizesDirectIconPlacement])
    {
      if (v15) {
        unsigned int v17 = [v16 gridSizeForGridSizeClass:v15];
      }
      else {
        unsigned int v17 = 65537;
      }
      unint64_t v18 = SBIconCoordinateMakeWithGridCellIndex(-[NSObject closestGridRangeForIconOfSize:centeredAtPoint:](v12, "closestGridRangeForIconOfSize:centeredAtPoint:", v17, v8, v10), [v14 gridSize]);
    }
    else
    {
      unint64_t v18 = -[NSObject coordinateAtPoint:](v12, "coordinateAtPoint:", v8, v10);
    }
    uint64_t v20 = v18;
    uint64_t v21 = v19;
    v64 = v14;
    uint64_t v61 = objc_msgSend(v14, "gridCellIndexForCoordinate:", v18, v19);
    v66 = [v5 draggedIcons];
    uint64_t v22 = [v5 draggedIconsHiddenAssertion];

    uint64_t v59 = v22;
    if (!v22)
    {
      uint64_t v23 = [v66 firstObject];
      uint64_t v24 = [(SBIconDragManager *)self startingIconLocationForIcon:v23 dragIdentifier:v4];
      [(SBIconDragManager *)self _removeDraggedIconsFromLayout:v66 iconLocation:v24 dragIdentifier:v4];
    }
    uint64_t v25 = -[NSObject iconAtPoint:index:](v12, "iconAtPoint:index:", 0, v8, v10);
    uint64_t v26 = SBLogIconDragging();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint32_t v27 = SBHStringForIconCoordinate(v20, v21);
      *(_DWORD *)buf = 138412546;
      unint64_t v68 = (unint64_t)v25;
      __int16 v69 = 2112;
      double v70 = *(double *)&v27;
      _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_INFO, "paused over icon = %@, coordinate = %@", buf, 0x16u);
    }
    id v28 = [v12 iconViewForIcon:v25];
    if ([v28 isGrabbed])
    {
      id v29 = SBLogIconDragging();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_INFO, "icon under paused drag is already grabbed -- bailing", buf, 2u);
      }
      id v30 = v65;
      goto LABEL_66;
    }
    double v58 = [v5 dragPlaceholder];
    v60 = v25;
    uint64_t v31 = -[NSObject dragHitRegionForPoint:icon:](v12, "dragHitRegionForPoint:icon:", v25, v8, v10);
    id v32 = SBLogIconDragging();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      double v33 = SBStringForIconListDragHitRegion(v31);
      *(_DWORD *)buf = 138412546;
      unint64_t v68 = (unint64_t)v33;
      __int16 v69 = 2048;
      double v70 = *(double *)&v31;
      _os_log_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_INFO, "drag hit region: %@ (%lx)", buf, 0x16u);
    }
    uint64_t v34 = v31;
    int64_t v35 = [(SBIconDragManager *)self placeholderMovementForDragHitRegion:v31 onGridCellIndex:v61 inListView:v12 forDragWithIdentifier:v4];
    double v36 = [v5 recipientIconView];
    long long v37 = [v36 icon];

    if (v60) {
      char v38 = objc_msgSend(v37, "isEqual:");
    }
    else {
      char v38 = 0;
    }
    uint64_t v39 = v37;
    uint64_t v40 = v34;
    __int16 v57 = v39;
    if (v35 == 2 || (v38 & 1) != 0)
    {
      uint64_t v25 = v60;
      if (v35 == 2)
      {
        id v62 = v60;
        id v55 = v28;
        uint64_t v53 = [v5 recipientIconView];
        uint64_t v45 = SBLogIconDragging();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v68 = (unint64_t)v62;
          _os_log_impl(&dword_1D7F0A000, v45, OS_LOG_TYPE_INFO, "Updating recipient icon to %@", buf, 0xCu);
        }

        [v5 setRecipientIconView:v55];
        if (v55 != (id)v53)
        {
          id v46 = [v5 candidateRecipientIcon];
          if (v46 != v62 || ![v5 recipientIconEntryRegion]) {
            objc_msgSend(v5, "setRecipientIconEntryRegion:", v40, v53);
          }
        }
        objc_msgSend(v5, "setCandidateRecipientIcon:", 0, v53);
      }
      id v30 = v65;
      if (v59) {
        goto LABEL_65;
      }
    }
    else
    {
      __int16 v41 = v28;
      uint64_t v25 = v60;
      unint64_t v42 = [(SBIconDragManager *)self placeholderGridCellIndexForDragPlacement:v35 onGridCellIndex:v61 icon:v60 inListView:v12 forDragWithIdentifier:v4];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v43 = [v6 iconDragManager:self willMoveDragPlaceholderToGridCellIndex:v42 inIconListView:v12 draggedIcons:v66];
        if (v43 != v42)
        {
          id v44 = SBLogIconDragging();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v42;
            __int16 v69 = 2048;
            double v70 = *(double *)&v43;
            _os_log_impl(&dword_1D7F0A000, v44, OS_LOG_TYPE_INFO, "the delegate told us to adjust the spot of the placeholder from %lu to %lu", buf, 0x16u);
          }
        }
        if (v43 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v5 resetDragPlaceholder];

          double v58 = 0;
          unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v42 = v43;
        }
      }
      BOOL v47 = [(SBIconDragManager *)self movePlaceholderForDraggedIcons:v66 toGridCellIndex:v42 inListView:v12 forDragWithIdentifier:v4];
      id v30 = v65;
      id v28 = v41;
      uint64_t v39 = v57;
      if (!v47) {
        goto LABEL_65;
      }
    }
    double v56 = v28;
    BOOL v48 = SBLogIconDragging();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v48, OS_LOG_TYPE_INFO, "Laying out list view after moving placeholders", buf, 2u);
    }

    int64_t v49 = [(SBIconDragManager *)self _animationTypeForGridSizeClass:v30];
    id v50 = [v12 iconLocation];
    if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v50))
    {
      uint64_t v51 = 1;
    }
    else
    {
      double v52 = [v12 iconLocation];
      uint64_t v51 = [v52 isEqualToString:@"SBIconLocationStackConfiguration"];
    }
    uint64_t v39 = v57;

    [v12 layoutIconsIfNeededWithAnimationType:v49 options:v51];
    id v30 = v65;
    id v28 = v56;
LABEL_65:
    [(SBIconDragManager *)self resetWatchdogTimerForDragWithIdentifier:v4 timeout:60.0];

    id v29 = v58;
LABEL_66:

    goto LABEL_67;
  }
  double v6 = SBLogIconDragging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(SBIconDragManager *)(uint64_t)self updatePlaceholderPositionForDragWithIdentifier:v6];
  }
LABEL_68:
}

- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v67 = self;
  id v12 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v11];
  uint64_t v13 = [v10 gridCellInfo];
  uint64_t v14 = [v10 displayedModel];
  int v15 = [v13 gridSize];
  uint64_t v76 = [v10 userInterfaceLayoutDirection];
  int v72 = v15;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v79 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    unint64_t v17 = SBIconCoordinateMakeWithGridCellIndex(a4, v15);
    uint64_t v16 = objc_msgSend(v10, "iconAtCoordinate:", v17, v18);
    if (v16)
    {
      v79 = [v10 displayedIconViewForIcon:v16];
      int v75 = 1;
      goto LABEL_7;
    }
    v79 = 0;
  }
  int v75 = 0;
LABEL_7:
  int v74 = [v16 isPlaceholder];
  __int16 v71 = [v12 dragPlaceholder];
  unint64_t v19 = [v71 effectiveGridCellIndex];
  uint64_t v20 = [v12 dragPlaceholderGridSizeClass];
  unint64_t v68 = v14;
  id v69 = v11;
  v77 = v16;
  double v70 = (void *)v20;
  if (v20) {
    int v21 = [v14 gridSizeForGridSizeClass:v20];
  }
  else {
    int v21 = 65537;
  }
  uint64_t v22 = v12;
  id v78 = [v12 dragPlaceholderListView];

  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = v13;
    int v26 = 0;
    unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v25 = v13;
    unint64_t v24 = a4;
    unint64_t v27 = [v13 gridRangeForGridCellIndex:a4];
    int v26 = v28;
    SBHIconGridRangeAnchoredEdges(v27, v28, 0, v72, v72);
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v29 = v78 != v10 || v19 == 0x7FFFFFFFFFFFFFFFLL;
  int v30 = v75;
  if (v29) {
    int v30 = 0;
  }
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  if (v30 == 1) {
    uint64_t v31 = SBHIconGridDistanceBetweenGridRanges(v27, v26, v19, v21, v72);
  }
  uint64_t v73 = v25;
  if ((a3 >> 1) & 1 | v74 & 1)
  {
    uint64_t v32 = a3 & 2;
    unint64_t v33 = v24;
LABEL_27:
    uint64_t v34 = v22;
    goto LABEL_28;
  }
  unint64_t v33 = v24;
  if ((a3 & 4) != 0)
  {
    uint64_t v32 = 7;
    goto LABEL_27;
  }
  uint64_t v34 = v22;
  if ((a3 & 8) != 0)
  {
    uint64_t v32 = 6;
  }
  else if ((a3 & 0x30) != 0)
  {
    uint64_t v32 = 7;
  }
  else
  {
    uint64_t v32 = ((uint64_t)(a3 << 63) >> 63) & 7;
  }
LABEL_28:
  unint64_t v35 = a3 & 0x3C;
  BOOL v36 = v76 == 1;
  BOOL v37 = v35 != 16 || v76 == 1;
  uint64_t v38 = v23;
  if (!v37 && !v23 && v31 == -1) {
    goto LABEL_53;
  }
  if (v35 != 32) {
    BOOL v36 = 1;
  }
  if (!v36 && !v23 && v31 == 1
    || v35 == 16 && v76 == 1 && !v23 && v31 == 1
    || v35 == 32 && v76 == 1 && !v23 && v31 == -1
    || v35 == 4 && v23 == -1 && !v31
    || v35 == 8 && v23 == 1 && !v31)
  {
LABEL_53:
    uint64_t v39 = SBLogIconDragging();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v39, OS_LOG_TYPE_INFO, "moving drag placeholder movement to 'overlapping' due to proximity to placeholder", buf, 2u);
    }

    uint64_t v32 = 2;
  }
  uint64_t v40 = [v34 recipientIconView];
  __int16 v41 = v40;
  if (v32 == 2)
  {
    unint64_t v42 = [v40 icon];
    uint64_t v43 = [v42 uniqueIdentifier];
    id v44 = [v77 uniqueIdentifier];
    char v45 = [v43 isEqual:v44];

    if (v45)
    {
LABEL_58:
      uint64_t v32 = 2;
LABEL_86:
      BOOL v48 = v68;
      BOOL v47 = v69;
      int64_t v49 = v77;

      goto LABEL_87;
    }
    char v50 = v75 ^ 1;
    if (!v79) {
      char v50 = 1;
    }
    if ((v50 & 1) == 0 && -[SBIconDragManager canMakeIconViewRecipient:](v67, "canMakeIconViewRecipient:"))
    {
      [v34 draggedIcons];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v52 = [v51 countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (!v52)
      {
LABEL_76:

        goto LABEL_58;
      }
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v81;
LABEL_69:
      uint64_t v55 = 0;
      while (1)
      {
        if (*(void *)v81 != v54) {
          objc_enumerationMutation(v51);
        }
        if (*(void *)(*((void *)&v80 + 1) + 8 * v55) && !objc_msgSend(v79, "canReceiveGrabbedIcon:")) {
          break;
        }
        if (v53 == ++v55)
        {
          uint64_t v53 = [v51 countByEnumeratingWithState:&v80 objects:v85 count:16];
          if (v53) {
            goto LABEL_69;
          }
          goto LABEL_76;
        }
      }

      if (v38) {
        char v56 = v74;
      }
      else {
        char v56 = 1;
      }
      if ((v56 & 1) != 0
        || (uint64_t v57 = [v73 gridRangeForGridCellIndex:v33],
            unsigned __int16 v59 = v58,
            unint64_t v60 = SBHIconGridRangeRelativeCellIndexForCellIndex(v57, v58, v33, v72),
            !SBHIconGridRangeRelativeColumnForRelativeCellIndex(v57, v59, v60)))
      {
        if (v74) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = 7;
        }
        goto LABEL_86;
      }
    }
    uint64_t v32 = 7;
    goto LABEL_86;
  }
  if (v40)
  {
    id v46 = SBLogIconDragging();
    BOOL v48 = v68;
    BOOL v47 = v69;
    int64_t v49 = v77;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v46, OS_LOG_TYPE_INFO, "Clearing recipient icon", buf, 2u);
    }

    [v34 setRecipientIconView:0];
  }
  else
  {
    BOOL v48 = v68;
    BOOL v47 = v69;
    int64_t v49 = v77;
  }
LABEL_87:
  if (v32) {
    BOOL v61 = 1;
  }
  else {
    BOOL v61 = v78 == v10;
  }
  if (v61) {
    int64_t v62 = v32;
  }
  else {
    int64_t v62 = 7;
  }
  if (v62 == 2)
  {
    __int16 v63 = v70;
  }
  else
  {
    v64 = [v10 iconLocation];
    v65 = [v10 model];
    __int16 v63 = v70;
    if ([(SBIconDragManager *)v67 isSnapToGridEnabledForDragWithIdentifier:v47 iconLocation:v64 listModel:v65 placeholderGridSizeClass:v70])
    {
      int64_t v62 = 7;
    }
  }
  return v62;
}

- (unint64_t)placeholderGridCellIndexForDragPlacement:(int64_t)a3 onGridCellIndex:(unint64_t)a4 icon:(id)a5 inListView:(id)a6 forDragWithIdentifier:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a7];
  int v15 = [v14 dragPlaceholder];
  uint64_t v16 = [v15 effectiveGridCellIndex];
  unint64_t v17 = v16;
  uint64_t v18 = [v14 dragPlaceholderGridSizeClass];
  if (a3)
  {
    id v37 = v12;
    unint64_t v19 = [v13 model];
    uint64_t v39 = [v13 gridCellInfo];
    int v36 = [v13 gridSizeForCurrentOrientation];
    uint64_t v38 = [v13 gridCellInfoOptions];
    if (v18)
    {
      uint64_t v20 = objc_alloc_init(SBIcon);
    }
    else
    {
      unint64_t v35 = v15;
      int v21 = [v14 draggedIcons];
      uint64_t v22 = [v21 firstObject];
      uint64_t v18 = [v22 gridSizeClass];

      uint64_t v20 = objc_alloc_init(SBIcon);
      if (!v18)
      {
        int v15 = v35;
LABEL_9:
        if ([v19 isValidGridCellIndex:a4 options:v38]) {
          unint64_t v17 = [v19 bestGridCellIndexForInsertingIcon:v20 atGridCellIndex:a4 gridCellInfo:v39];
        }
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v23 = v16;
        }
        else {
          unint64_t v23 = v17;
        }
        if (a3 == 6)
        {
          unint64_t v27 = SBLogIconDragging();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_impl(&dword_1D7F0A000, v27, OS_LOG_TYPE_INFO, "moving placeholder below %@", buf, 0xCu);
          }

          *(void *)buf = v23;
          *(void *)&buf[8] = 65537;
          int v25 = v36;
          uint64_t v26 = 0;
        }
        else
        {
          if (a3 != 3)
          {
LABEL_23:
            unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v28 = [v13 iconGridSizeForClass:v18];
              if (-[NSObject isValidGridRange:options:](v19, "isValidGridRange:options:", v23, v28, v38))
              {
                unint64_t v17 = v23;
              }
              else
              {
                uint64_t v29 = SBHIconGridRangeFitInsideIconGridRange(0, v36, v23, v28, v36);
                if (v29 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  int v30 = SBLogIconDragging();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v31 = SBHStringForIconGridRange(v23, v28);
                    SBHStringForIconGridSize([v19 gridSize]);
                    v33 = uint64_t v32 = v15;
                    *(_DWORD *)buf = 138543618;
                    *(void *)&uint8_t buf[4] = v31;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v33;
                    _os_log_impl(&dword_1D7F0A000, v30, OS_LOG_TYPE_INFO, "not moving placeholder to grid range %{public}@ because it doesn't fit in %{public}@", buf, 0x16u);

                    int v15 = v32;
                  }

                  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else
                {
                  unint64_t v17 = [v19 bestGridCellIndexForInsertingIcon:v20 atGridCellIndex:v29 gridCellInfo:v39];
                }
              }
            }

            id v12 = v37;
            goto LABEL_33;
          }
          unint64_t v24 = SBLogIconDragging();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_INFO, "moving placeholder after %@", buf, 0xCu);
          }

          *(void *)buf = v23;
          *(void *)&buf[8] = 65537;
          int v25 = v36;
          uint64_t v26 = 3;
        }
        SBHIconGridRangeOffset((unint64_t *)buf, v26, 1, v25);
        unint64_t v23 = *(void *)buf;
        goto LABEL_23;
      }
      int v15 = v35;
    }
    [(SBIcon *)v20 setGridSizeClass:v18];
    goto LABEL_9;
  }
  unint64_t v19 = SBLogIconDragging();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_INFO, "not moving placeholder because placeholder movement is unchanged", buf, 2u);
  }
LABEL_33:

  return v17;
}

- (unint64_t)placeholderOptionsForListView:(id)a3 forDragWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 iconLocation];
  uint64_t v9 = [(SBIconDragManager *)self shouldMinimizeLayoutDisruptionForIconLocation:v8];
  if ([(SBIconDragManager *)self shouldDisallowBumpingIconsFromCurrentList]) {
    uint64_t v10 = v9 | 8;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v6];
  id v12 = [v7 model];

  id v13 = [v11 dragPlaceholderGridSizeClass];
  BOOL v14 = [(SBIconDragManager *)self isSnapToGridEnabledForDragWithIdentifier:v6 iconLocation:v8 listModel:v12 placeholderGridSizeClass:v13];

  if (v14) {
    unint64_t v15 = v10 | 0x14;
  }
  else {
    unint64_t v15 = v10;
  }

  return v15;
}

- (BOOL)movePlaceholderForDraggedIcons:(id)a3 toGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v12];
  BOOL v14 = [v13 dragPlaceholder];
  uint64_t v39 = [v13 dragPlaceholderGridSizeClass];
  uint64_t v15 = [v13 dragPlaceholderListView];
  uint64_t v16 = [v11 model];
  unint64_t v17 = [(SBIconDragManager *)self placeholderOptionsForListView:v11 forDragWithIdentifier:v12];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = (void *)v15;
    unint64_t v19 = SBLogIconDragging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_INFO, "not moving placeholder because no new grid cell index could be found", buf, 2u);
    }

    BOOL v20 = 0;
    int v21 = (void *)v39;
    goto LABEL_30;
  }
  id v37 = (void *)v15;
  uint64_t v38 = v16;
  uint64_t v22 = v10;
  if ((id)v15 == v11)
  {
    uint64_t v28 = [v13 dragPlaceholder];

    if (v28)
    {
      [v14 setGridCellIndex:a4];
      BOOL v20 = 1;
      id v10 = v22;
LABEL_21:
      uint64_t v16 = v38;
      int v21 = (void *)v39;
      uint64_t v18 = v37;
      goto LABEL_30;
    }
  }
  [v13 resetDragPlaceholder];

  if (![v11 allowsAddingIconCount:1])
  {
    unint64_t v27 = SBLogIconDragging();
    id v10 = v22;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v27, OS_LOG_TYPE_INFO, "not creating placeholder because list view cannot add another icon", buf, 2u);
    }

    BOOL v20 = 0;
    BOOL v14 = 0;
    goto LABEL_21;
  }
  id v10 = v22;
  unint64_t v35 = objc_msgSend(v22, "bs_compactMap:", &__block_literal_global_373);
  uint64_t v23 = [v35 componentsJoinedByString:@","];
  unint64_t v24 = @"drag";
  if (v23) {
    unint64_t v24 = (__CFString *)v23;
  }
  int v36 = v24;
  if ([v22 count] != 1) {
    goto LABEL_23;
  }
  int v25 = [v22 firstObject];
  if (!v25)
  {
LABEL_24:
    uint64_t v34 = v25;
    uint64_t v29 = SBLogIconDragging();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = [(SBIconDragManager *)self gridSizeClassDomain];
      uint64_t v31 = [v30 descriptionForGridSizeClass:v39];
      *(_DWORD *)buf = 134218242;
      unint64_t v41 = a4;
      __int16 v42 = 2114;
      uint64_t v43 = v31;
      _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_INFO, "creating new drag placeholder at grid cell index %lu size class '%{public}@'", buf, 0x16u);

      id v10 = v22;
    }

    int v21 = (void *)v39;
    BOOL v14 = [v11 addPlaceholderAtGridCellIndex:a4 gridSizeClass:v39 reason:v36 options:v17];
    uint64_t v16 = v38;
    goto LABEL_27;
  }
  if (![(SBIconDragManager *)self doesIconRepresentRealIconPosition:v25 dragIdentifier:v12])
  {

LABEL_23:
    int v25 = 0;
    goto LABEL_24;
  }
  if (![v38 directlyContainsIcon:v25]) {
    goto LABEL_24;
  }
  uint64_t v26 = SBLogIconDragging();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v41 = (unint64_t)v25;
    _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_INFO, "creating new drag placeholder representing icon %@", buf, 0xCu);
  }

  uint64_t v34 = v25;
  BOOL v14 = [v11 addPlaceholderAtGridCellIndex:a4 representingIcon:v25 reason:v36 options:v17];
  uint64_t v16 = v38;
  int v21 = (void *)v39;
LABEL_27:
  uint64_t v32 = SBLogIconDragging();
  uint64_t v18 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v41 = (unint64_t)v14;
    _os_log_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_INFO, "created new drag placeholder %@", buf, 0xCu);
  }

  [v13 setDragPlaceholder:v14];
  [v13 setDragPlaceholderListView:v11];
  [v13 setDragPlaceholderGridSizeClass:v21];

  BOOL v20 = 1;
LABEL_30:
  objc_msgSend(v14, "setOptions:", v17, v34);

  return v20;
}

uint64_t __101__SBIconDragManager_movePlaceholderForDraggedIcons_toGridCellIndex_inListView_forDragWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)startPlaceholderPauseTimerWithDragLocation:(CGPoint)a3 withDragIdentifier:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v11 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v7];
  [(SBIconDragManager *)self placeholderRepositioningDelay];
  double v9 = v8;
  [(SBIconDragManager *)self stopPlaceholderPauseTimerWithDragLocationWithDragIdentifier:v7];
  id v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_pauseTimerDidFire_ selector:v7 userInfo:0 repeats:v9];

  [v11 setPauseTimer:v10];
  objc_msgSend(v11, "setPauseLocation:", x, y);
}

- (void)pauseTimerDidFire:(id)a3
{
  id v4 = a3;
  id v7 = [v4 userInfo];
  id v5 = -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  id v6 = [v5 pauseTimer];

  if (v6 == v4) {
    [v5 setPauseTimer:0];
  }
  [(SBIconDragManager *)self updatePlaceholderPositionForDragWithIdentifier:v7];
}

- (void)stopPlaceholderPauseTimerWithDragLocationWithDragIdentifier:(id)a3
{
  id v4 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:a3];
  id v3 = [v4 pauseTimer];
  [v3 invalidate];
  [v4 setPauseTimer:0];
}

- (void)iconDropSessionDidExit:(id)a3 fromIconListView:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v6];
  double v9 = SBLogIconDragging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v8;
    __int16 v30 = 2048;
    id v31 = v7;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "drop session did exit: %{public}@, icon list view: %p", buf, 0x16u);
  }

  [(SBIconDragManager *)self stopTrackingDragLocationForEditingForDragWithIdentifier:v8];
  id v10 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v8];
  id v11 = [v10 dragPlaceholderGridSizeClass];
  int64_t v12 = [(SBIconDragManager *)self _animationTypeForGridSizeClass:v11];
  id v13 = [v10 currentEnteredIconListView];

  if (v13 == v7)
  {
    [(SBIconDragManager *)self _updateDragPreviewIconViewForDropSession:v6 inIconListView:v7];
    [v10 setCurrentEnteredIconListView:0];
    objc_msgSend(v10, "setCurrentEnteredIconListViewLastLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [v10 setCurrentEnteredIconListViewDragDistance:0.0];
    BOOL v14 = [v10 pauseTimer];
    [v14 invalidate];

    [v10 setPauseTimer:0];
  }
  id v15 = [v10 dragPlaceholderListView];

  if (v15 == v7) {
    [v10 resetDragPlaceholder];
  }
  if (![(SBIconDragManager *)self isEditing]) {
    [v10 resetDraggedIconsHiddenAssertion];
  }
  [v10 resetLastUserInteractionDate];
  [v10 setRecipientIconView:0];
  uint64_t v16 = [v10 grabbedIconViews];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    [(SBIconDragManager *)self defaultIconLayoutAnimationDuration];
    double v20 = v19;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke;
    v26[3] = &unk_1E6AAC810;
    id v27 = v7;
    [v18 animateWithDuration:v26 animations:v20];
  }
  int v21 = [v10 primaryIconView];
  uint64_t v22 = [v21 draggingStartLocation];

  if (v22 == 10) {
    [(SBIconDragManager *)self _invalidateAutoScrollAssistant];
  }
  uint64_t v23 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v23 iconDragManager:self iconDropSession:v6 didExitIconListView:v7];
  }
  unint64_t v24 = [v7 iconLocation];
  uint64_t v25 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v24);

  [v7 layoutIconsIfNeededWithAnimationType:v12 options:v25];
}

uint64_t __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateIconViewsUsingBlock:&__block_literal_global_381];
}

uint64_t __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setGrabbed:0];
}

- (void)performIconDrop:(id)a3 inIconListView:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v6];
  double v9 = SBLogIconDragging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v49 = (uint64_t)v8;
    __int16 v50 = 2048;
    id v51 = v7;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "perform icon drop with identifier: %{public}@, icon list view: %p", buf, 0x16u);
  }

  id v10 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v8];
  unint64_t v11 = [(SBIconDragManager *)self reasonForRejectingDropInSession:v6 inIconListView:v7];
  [v10 setDragRejectionReason:v11];
  if (v11)
  {
    int64_t v12 = SBHStringForDragRejectionReason(v11);
    uint64_t v13 = SBLogIconDragging();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = (uint64_t)v12;
      _os_log_impl(&dword_1D7F0A000, (os_log_t)v13, OS_LOG_TYPE_INFO, "bailing on icon drop for reason: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    int64_t v12 = [(SBIconDragManager *)self draggedIconsForDragDropSession:v6];
    uint64_t v13 = [(SBIconDragManager *)self rootFolder];
    uint64_t v14 = [(SBIconDragManager *)self rootListModel];
    id v15 = (void *)v14;
    if (v13 | v14)
    {
      unint64_t v35 = (void *)v14;
      uint64_t v17 = [(SBIconDragManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v17 iconDragManager:self willPerformIconDrop:v6 withIcons:v12 inIconListView:v7];
      }
      uint64_t v39 = [v10 dragPlaceholderGridSizeClass];
      int v36 = [(SBIconDragManager *)self dragPlaceholderGridPathForDragWithIdentifier:v8];
      [v10 resetDragPlaceholder];
      [v10 resetDraggedIconsHiddenAssertion];
      uint64_t v18 = [(SBIconDragManager *)self startForbiddingAccessoryUpdatesInFoldersInIconListView:v7];
      uint64_t v40 = [(SBIconDragManager *)self duplicateIconsIfNecessary:v12 forDropSession:v6];

      double v19 = SBLogIconDragging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = v40;
        __int16 v50 = 2114;
        id v51 = v36;
        _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_INFO, "dropped icons: %@, placeholder path: %{public}@", buf, 0x16u);
      }

      if ([(SBIconDragManager *)self isUndoEnabled])
      {
        uint64_t v20 = [v7 undoManager];
        int v21 = [(SBIconDragManager *)self undoProvider];
        uint64_t v38 = [v21 prepareForUndo];
      }
      else
      {
        uint64_t v20 = 0;
        uint64_t v38 = 0;
      }
      [(SBIconDragManager *)self beginModifyingRootFolder];
      BOOL v22 = -[SBIconDragManager performIconDropOnRecipientIconIfPossibleWithDraggedIcons:inIconListView:dropSession:](self, "performIconDropOnRecipientIconIfPossibleWithDraggedIcons:inIconListView:dropSession:", v40, v7, v6)|| -[SBIconDragManager performIconDropInParentFolderIfPossibleWithDraggedIcons:inIconListView:dropSession:](self, "performIconDropInParentFolderIfPossibleWithDraggedIcons:inIconListView:dropSession:", v40, v7, v6)|| -[SBIconDragManager performIconDropInDestinationListIfPossibleWithDraggedIcons:inIconListView:placeholderGridPath:placeholderGridSizeClass:dropSession:](self, "performIconDropInDestinationListIfPossibleWithDraggedIcons:inIconListView:placeholderGridPath:placeholderGridSizeClass:dropSession:", v40, v7, v36, v39,
              v6);
      uint64_t v34 = v17;
      [(SBIconDragManager *)self endModifyingRootFolder];
      if (v22 && v20 && v38) {
        [(SBIconDragManager *)self registerUndoWithUndoManager:v20 preparation:v38 draggedIcons:v40];
      }
      unint64_t v33 = (void *)v20;
      id v37 = [v10 droppedIcons];
      uint64_t v32 = [v37 count];
      int64_t v31 = -[SBIconDragManager _animationTypeForGridSizeClass:inIconListView:draggedIconCount:](self, "_animationTypeForGridSizeClass:inIconListView:draggedIconCount:", v39, v7);
      if (v31 != 3)
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __52__SBIconDragManager_performIconDrop_inIconListView___block_invoke;
        v45[3] = &unk_1E6AAD830;
        id v46 = v10;
        [v46 enumerateDestinationIconViewsUsingBlock:v45];
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v23 = v18;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "invalidate", v31);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v25);
      }

      uint64_t v28 = SBLogIconDragging();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v28, OS_LOG_TYPE_INFO, "laying out icon lists now", buf, 2u);
      }

      [(SBIconDragManager *)self layoutIconListsWithAnimationType:v31 forceRelayout:0];
      uint64_t v16 = v34;
      if (v32)
      {
        uint64_t v29 = [v37 firstObject];
        [(SBIconDragManager *)self scrollToIconListContainingIcon:v29 animated:1];
      }
      objc_msgSend(v10, "setPerformedIconDrop:", 1, v31);
      [v10 addMessageExpectationNamed:@"concludeDrop"];
      [v10 resetLastUserInteractionDate];
      [(SBIconDragManager *)self changeStateOfDragWithIdentifier:v8 toState:5];
      __int16 v30 = SBLogIconDragging();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v30, OS_LOG_TYPE_INFO, "will wait for conclude drag", buf, 2u);
      }

      if (objc_opt_respondsToSelector()) {
        [v34 iconDragManager:self didPerformIconDrop:v6 withIcons:v37 inIconListView:v7];
      }

      id v15 = v35;
      int64_t v12 = (void *)v40;
    }
    else
    {
      uint64_t v16 = SBLogIconDragging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBIconDragManager performIconDrop:inIconListView:](v16);
      }
    }
  }
}

void __52__SBIconDragManager_performIconDrop_inIconListView___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 markAsDropping];
  if (v4 && v3) {
    [*(id *)(a1 + 32) addIconViewDroppingAssertion:v3 forIconView:v4];
  }
}

- (id)startForbiddingAccessoryUpdatesInFoldersInIconListView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 model];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBIconDragManager_startForbiddingAccessoryUpdatesInFoldersInIconListView___block_invoke;
  v11[3] = &unk_1E6AADBC8;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 enumerateFolderIconsUsingBlock:v11];

  double v8 = v13;
  id v9 = v6;

  return v9;
}

void __76__SBIconDragManager_startForbiddingAccessoryUpdatesInFoldersInIconListView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) displayedIconViewForIcon:a2];
  id v3 = [v4 startForbiddingAccessoryUpdatesWithReason:@"drop" animated:0];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)duplicateIconsIfNecessary:(id)a3 forDropSession:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBIconDragManager *)self iconDragContextForDropSession:a4];
  if (([v7 duplicatesSourceIcons] & 1) == 0)
  {
    id v9 = v6;
    goto LABEL_5;
  }
  double v8 = [v7 createdApplicationIcons];

  if (v8)
  {
    id v9 = [v7 draggedIcons];
LABEL_5:
    id v30 = v9;
    goto LABEL_6;
  }
  uint64_t v28 = v7;
  uint64_t v29 = [(SBIconDragManager *)self model];
  unint64_t v11 = [(SBIconDragManager *)self rootFolder];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v26 = v6;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = [v11 indexPathForIcon:v16 includingPlaceholders:0];
        if ([v16 isApplicationIcon]) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          double v19 = [v16 applicationBundleID];
          uint64_t v20 = [v29 addAdditionalIconMatchingIcon:v16];
          int v21 = SBLogIconDragging();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v22)
            {
              *(_DWORD *)buf = 138543362;
              id v37 = v19;
              _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "adding additional matching icon for '%{public}@'", buf, 0xCu);
            }

            [v30 addObject:v20];
            id v23 = [v16 uniqueIdentifier];
            [v28 setAdditionalMatchingIcon:v20 forDroppedIconIdentifier:v23];
            [v27 addObject:v20];
            uint64_t v24 = [v20 uniqueIdentifier];
            uint64_t v25 = [v28 appDragLocalContextWithIconIdentifier:v23];
            [v25 setDroppedIconIdentifier:v24];
          }
          else
          {
            if (v22)
            {
              *(_DWORD *)buf = 138543362;
              id v37 = v19;
              _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "could not add additional matching icon for '%{public}@'", buf, 0xCu);
            }

            [v30 addObject:v16];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v13);
  }

  id v7 = v28;
  [v28 setCreatedApplicationIcons:v27];

  id v6 = v26;
LABEL_6:

  return v30;
}

- (BOOL)performIconDropOnRecipientIconIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBIconDragManager *)self iconDragContextForDropSession:a5];
  unint64_t v11 = [v10 recipientIconView];
  uint64_t v12 = [v11 icon];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_5;
  }
  if (![v12 isFolderIcon]
    || ([v13 folder],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isFull],
        v14,
        !v15))
  {
    uint64_t v17 = [(SBIconDragManager *)self model];
    uint64_t v55 = v11;
    if ([v13 isFolderIcon])
    {
      id v18 = v13;
      id v19 = v8;
    }
    else
    {
      if (![v13 isLeafIcon])
      {
        int v36 = 0;
        id v18 = 0;
        id v21 = 0;
        BOOL v16 = 0;
LABEL_53:

        unint64_t v11 = v55;
        goto LABEL_54;
      }
      if ([v13 isWidgetIcon]
        && [(SBIconDragManager *)self createsStacksFromWidgets])
      {
        id v50 = v8;
        id v51 = v9;
        id v20 = v8;
        id v21 = v13;
        [v21 addDataSourcesFromWidgetIcons:v20];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v65 != v25) {
                objc_enumerationMutation(v22);
              }
              objc_msgSend(v17, "removeIcon:", *(void *)(*((void *)&v64 + 1) + 8 * i), v50);
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v64 objects:v73 count:16];
          }
          while (v24);
        }

        id v27 = SBLogIconDragging();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v72 = v21;
          _os_log_impl(&dword_1D7F0A000, v27, OS_LOG_TYPE_INFO, "created new stack for drop: %@", buf, 0xCu);
        }

        if (!v22)
        {
          int v36 = 0;
          id v18 = 0;
          BOOL v16 = 0;
          id v8 = v50;
          id v9 = v51;
          goto LABEL_53;
        }
        uint64_t v28 = [v51 iconViewForIcon:v21];
        if (!v28)
        {
          id v18 = 0;
          id v8 = v50;
          id v9 = v51;
          goto LABEL_51;
        }
        uint64_t v53 = [v51 pauseLayoutForIconView:v28 forReason:@"PauseLayoutForDropAnimation"];
        objc_msgSend(v10, "setDestinationStackIconViewPauseLayoutAssertion:");
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v29 = v22;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v61 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * j), "uniqueIdentifier", v50);
              [v10 setDestinationStackIconView:v28 forIconWithIdentifier:v34];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v31);
        }

        id v18 = 0;
        id v8 = v50;
        id v9 = v51;
        long long v35 = v53;
LABEL_50:

LABEL_51:
        BOOL v16 = 1;
LABEL_52:
        int v36 = v8;
        goto LABEL_53;
      }
      id v37 = [v8 firstObject];
      uint64_t v38 = [(SBIconDragManager *)self createNewFolderFromRecipientIcon:v13 grabbedIcon:v37];

      uint64_t v39 = [v38 icon];
      uint64_t v40 = SBLogIconDragging();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v38;
        _os_log_impl(&dword_1D7F0A000, v40, OS_LOG_TYPE_INFO, "created new folder for drop: %@", buf, 0xCu);
      }

      id v18 = (id)v39;
    }
    BOOL v16 = 0;
    id v21 = 0;
    if (!v8 || !v18) {
      goto LABEL_52;
    }
    id v54 = v18;
    uint64_t v28 = [v9 iconViewForIcon:v18];
    if ([v13 isLeafIcon])
    {
      id v69 = v13;
      long long v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
      [(SBIconDragManager *)self addIcons:v41 intoFolderIcon:v54 openFolderOnFinish:0];

      [v28 layoutIfNeeded];
    }
    if (v28)
    {
      id v49 = v8;
      id v52 = v9;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v42 = v8;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v42);
            }
            BOOL v47 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "uniqueIdentifier", v49);
            [v10 setDestinationFolderIconView:v28 forIconWithIdentifier:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v44);
      }

      id v8 = v49;
      id v9 = v52;
    }
    id v18 = v54;
    -[SBIconDragManager addIcons:intoFolderIcon:openFolderOnFinish:](self, "addIcons:intoFolderIcon:openFolderOnFinish:", v8, v54, 0, v49);
    long long v35 = SBLogIconDragging();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v54;
      _os_log_impl(&dword_1D7F0A000, v35, OS_LOG_TYPE_INFO, "adding dropped icons into folder icon %@", buf, 0xCu);
    }
    id v21 = 0;
    goto LABEL_50;
  }
  [v10 setRecipientIconView:0];
LABEL_5:
  BOOL v16 = 0;
LABEL_54:

  return v16;
}

- (BOOL)performIconDropInParentFolderIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v35 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:a5];
  id v10 = -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  unint64_t v11 = [v9 iconLocation];
  if ([v11 isEqualToString:@"SBIconLocationFolder"]
    && ([v10 wasLastUpdateContainedInDestinationIconListView] & 1) == 0)
  {
    id v29 = [v9 model];
    uint64_t v28 = [v29 folder];
    uint64_t v13 = [v28 parentFolder];
    id v27 = [v13 icon];
    uint64_t v14 = objc_msgSend(v13, "indexOfListContainingIcon:");
    uint64_t v30 = v11;
    long long v34 = v13;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v15 = 0;
    }
    else
    {
      int v15 = [v13 listAtIndex:v14];
    }
    id v31 = v9;
    BOOL v16 = [v9 iconLocation];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v8;
    id obj = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v22 = [v21 gridSizeClass];
          unint64_t v23 = [(SBIconDragManager *)self folderMutationOptionsForInsertingIcon:v21 intoList:v15 inLocation:v16 isSnapToGridEnabled:[(SBIconDragManager *)self isSnapToGridEnabledForDragWithIdentifier:v35 iconLocation:@"SBIconLocationRoot" listModel:v15 placeholderGridSizeClass:v22]];
          if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
            id v24 = (id)[v34 addIcon:v21 options:v23];
          }
          else {
            id v25 = (id)[v34 addIcon:v21 toListAtIndex:v14 options:v23];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }

    id v9 = v31;
    [(SBIconDragManager *)self closeFolderControllerContainingListView:v31];

    BOOL v12 = 1;
    id v8 = v32;
    unint64_t v11 = v30;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)performIconDropInDestinationListIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 placeholderGridPath:(id)a5 placeholderGridSizeClass:(id)a6 dropSession:(id)a7
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v71 = a4;
  id v72 = a5;
  id v69 = a6;
  v79 = self;
  id v67 = a7;
  double v70 = -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:");
  long long v80 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v70];
  uint64_t v74 = [v71 model];
  uint64_t v73 = [v74 folder];
  uint64_t v13 = [(SBIconDragManager *)self rootFolder];
  int v75 = [(SBIconDragManager *)self rootListModel];
  unint64_t v14 = [(SBIconDragManager *)self listGridCellInfoOptions];
  unsigned int v68 = [v73 isCancelable];
  [v73 setCancelable:0];
  [(SBIconDragManager *)self pruneCancelableSourceFoldersInDestinationListView:v71 withDragIdentifier:v70];
  if (v72)
  {
    unsigned int v15 = [v71 iconGridSizeForClass:v69];
    if (v13)
    {
      id v16 = [v13 listAtGridPath:v72];
    }
    else
    {
      id v16 = v75;
    }
    uint64_t v18 = v16;
    uint64_t v19 = [v72 gridCellIndex];
    uint64_t v20 = [v72 gridCellInfoOptions];
    id v21 = SBLogIconDragging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v72;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_INFO, "list model for placeholder at path %{public}@: %@", buf, 0x16u);
    }

    int v22 = v15;
    if ((objc_msgSend(v18, "isValidGridRange:options:", v19, v15, v20) & 1) == 0)
    {
      unint64_t v23 = SBLogIconDragging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = SBHStringForIconGridRange(v19, v22);
        id v25 = SBHStringForIconGridSize([v18 gridSize]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_INFO, "discarding placeholder path because the targeted grid range is not valid. %{public}@ vs. %{public}@", buf, 0x16u);
      }
      id v72 = 0;
    }
    if (v18 == v74) {
      int v17 = [v74 directlyContainsIcons:v12];
    }
    else {
      int v17 = 0;
    }
  }
  else
  {
    int v17 = [v74 directlyContainsIcons:v12];
    id v72 = 0;
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v12;
  uint64_t v26 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v94 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v30 = [v13 indexPathForIcon:v29];
        if (v30) {
          [v80 setInitialIndexPath:v30 forIcon:v29];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
    }
    while (v26);
  }

  if (([v73 canAddIcons:obj startingAtList:v74] & 1) == 0
    && ((v17 | [v13 canAddIcons:obj] ^ 1) & 1) == 0)
  {
    id v31 = SBLogIconDragging();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v73;
      _os_log_impl(&dword_1D7F0A000, v31, OS_LOG_TYPE_INFO, "discarding drop destination folder '%@' because it can't accommodate all the dragged icons", buf, 0xCu);
    }

    id v32 = v13;
    uint64_t v73 = v32;
    uint64_t v74 = 0;
    id v72 = 0;
  }
  int v33 = [v73 canAddIcons:obj startingAtList:v74];
  if ((v17 | v33 | [v75 isAllowedToContainIcons:obj]) == 1)
  {
    long long v66 = [v71 iconLocation];
    if ([v80 isSnapToGridAllowed]) {
      uint64_t v34 = [(SBIconDragManager *)v79 canSnapToGridInIconLocation:v66];
    }
    else {
      uint64_t v34 = 0;
    }
    long long v65 = [obj firstObject];
    unint64_t v35 = +[SBFolder listModelMutationOptionsForFolderMutationOptions:[(SBIconDragManager *)v79 folderMutationOptionsForInsertingIcon:v65 intoList:v74 inLocation:v66 isSnapToGridEnabled:v34]];
    id v36 = v72;
    if (!v36)
    {
      long long v37 = [v65 gridSizeClass];
      uint64_t v38 = [v74 firstFreeGridCellIndexOfRangeOfSizeClass:v37 gridCellInfoOptions:v14];
      if (v38 != 0x7FFFFFFFFFFFFFFFLL
        && (!v13
          ? (long long v39 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", 0, &stru_1F2FA0300, v38, v14)): ([v13 gridPathWithList:v74 gridCellIndex:v38 listGridCellInfoOptions:v14], long long v39 = (SBHIconGridPath *)objc_claimAutoreleasedReturnValue()), (v40 = (uint64_t)v39) != 0)|| (objc_msgSend(v73, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:listGridCellInfoOptions:", v37, v74, v14), (v40 = objc_claimAutoreleasedReturnValue()) != 0))
      {

        id v36 = (id)v40;
      }
      else
      {
        uint64_t v63 = [v13 gridPathForFirstFreeSlotOfRangeOfSizeClass:v37 startingAtList:v74 listGridCellInfoOptions:v14];

        id v36 = (id)v63;
        if (!v63)
        {
          long long v64 = 0;
          goto LABEL_47;
        }
      }
    }
    long long v64 = v36;
    if (v13)
    {
      uint64_t v41 = objc_msgSend(v13, "insertIcons:atGridPath:options:", obj);
    }
    else
    {
      if (!v75)
      {
LABEL_47:
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v42 = obj;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v89 objects:v104 count:16];
        if (!v43) {
          goto LABEL_59;
        }
        uint64_t v44 = *(void *)v90;
        while (1)
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v90 != v44) {
              objc_enumerationMutation(v42);
            }
            uint64_t v46 = *(void *)(*((void *)&v89 + 1) + 8 * j);
            if (!v13)
            {
              if (![v75 directlyContainsIcon:*(void *)(*((void *)&v89 + 1) + 8 * j)]) {
                continue;
              }
LABEL_56:
              [v80 addDroppedIcon:v46];
              continue;
            }
            if ([v13 containsIcon:*(void *)(*((void *)&v89 + 1) + 8 * j)]) {
              goto LABEL_56;
            }
          }
          uint64_t v43 = [v42 countByEnumeratingWithState:&v89 objects:v104 count:16];
          if (!v43)
          {
LABEL_59:

            [v74 setOverflowSlotCount:0];
            [v80 droppedIcons];
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v76 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v47 = [v76 countByEnumeratingWithState:&v85 objects:v103 count:16];
            if (!v47) {
              goto LABEL_82;
            }
            uint64_t v77 = *(void *)v86;
            while (1)
            {
              uint64_t v48 = 0;
              do
              {
                if (*(void *)v86 != v77) {
                  objc_enumerationMutation(v76);
                }
                id v49 = *(void **)(*((void *)&v85 + 1) + 8 * v48);
                id v50 = [(SBIconDragManager *)v79 iconListViewContainingIcon:v49];
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&uint8_t buf[16] = 0x3032000000;
                v100 = __Block_byref_object_copy__3;
                v101 = __Block_byref_object_dispose__3;
                id v102 = 0;
                v81[0] = MEMORY[0x1E4F143A8];
                v81[1] = 3221225472;
                v81[2] = __152__SBIconDragManager_performIconDropInDestinationListIfPossibleWithDraggedIcons_inIconListView_placeholderGridPath_placeholderGridSizeClass_dropSession___block_invoke;
                v81[3] = &unk_1E6AADE88;
                v81[4] = v49;
                v84 = buf;
                id v51 = v50;
                id v82 = v51;
                id v52 = v80;
                id v83 = v52;
                [v52 enumerateSourceIconViewsUsingBlock:v81];
                [v51 clearDraggedIconViews];
                uint64_t v53 = *(void *)(*(void *)&buf[8] + 40);
                if (!v53)
                {
                  uint64_t v55 = 0;
                  id v54 = 0;
                  goto LABEL_71;
                }
                id v54 = objc_msgSend(v52, "iconViewBorrowAssertionForIconView:");

                if (*(void *)(*(void *)&buf[8] + 40))
                {
                  uint64_t v55 = objc_msgSend(v52, "borrowedViewControllerForIconView:");
                  if (!v54)
                  {
                    uint64_t v53 = 0;
                    goto LABEL_71;
                  }
LABEL_70:
                  id v54 = [v51 addOverridingLayoutDelegate:v79 reason:@"drop animation"];
                  uint64_t v53 = 1;
                  goto LABEL_71;
                }
                uint64_t v55 = 0;
                if (v54) {
                  goto LABEL_70;
                }
                uint64_t v53 = 0;
                id v54 = 0;
LABEL_71:
                [v52 setWaitingToSetPlaceholderViewController:v53];
                long long v56 = [v51 iconViewForIcon:v49];
                if (v55) {
                  [v52 setBorrowedViewController:v55 forIconView:v56];
                }
                [v54 invalidate];
                [v52 setWaitingToSetPlaceholderViewController:0];
                if (v56)
                {
                  [v52 addDestinationIconView:v56];
                  [v56 setDisallowCursorInteraction:1];
                }
                else
                {
                  long long v57 = SBLogIconDragging();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    long long v58 = [v49 nodeIdentifier];
                    *(_DWORD *)v97 = 138412290;
                    v98 = v58;
                    _os_log_impl(&dword_1D7F0A000, v57, OS_LOG_TYPE_INFO, "did not find a destination icon view for icon '%@'", v97, 0xCu);
                  }
                }

                _Block_object_dispose(buf, 8);
                ++v48;
              }
              while (v47 != v48);
              uint64_t v59 = [v76 countByEnumeratingWithState:&v85 objects:v103 count:16];
              uint64_t v47 = v59;
              if (!v59)
              {
LABEL_82:

                goto LABEL_83;
              }
            }
          }
        }
      }
      uint64_t v41 = objc_msgSend(v75, "insertIcons:atGridCellIndex:gridCellInfoOptions:mutationOptions:", obj, objc_msgSend(v36, "gridCellIndex"), v14, v35);
    }

    goto LABEL_47;
  }
LABEL_83:
  [v73 setCancelable:v68];
  long long v60 = [v80 droppedIcons];
  BOOL v61 = [v60 count] != 0;

  return v61;
}

void __152__SBIconDragManager_performIconDropInDestinationListIfPossibleWithDraggedIcons_inIconListView_placeholderGridPath_placeholderGridSizeClass_dropSession___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v4 = [v6 icon];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  if ([*(id *)(a1 + 40) isDisplayingIconView:v6])
  {
    [*(id *)(a1 + 40) forgetIconView:v6];
    [v6 setHidden:1];
    [*(id *)(a1 + 48) addDiscardedSourceIconView:v6];
    [v6 setDelegate:0];
  }
}

- (void)concludeIconDrop:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v4];
  id v6 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v5];
  id v7 = SBLogIconDragging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v5;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "conclude icon drop: %{public}@", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __38__SBIconDragManager_concludeIconDrop___block_invoke;
  v20[3] = &unk_1E6AADEB0;
  v20[4] = self;
  id v8 = v5;
  id v21 = v8;
  [v6 enumerateDestinationIconViewsUsingBlock:v20];
  [v6 enumerateSourceIconViewsUsingBlock:&__block_literal_global_399];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(v6, "itemIdentifiers", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [v6 destinationStackIconViewForIconWithIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
        [v14 cleanUpAfterDropAnimation];
        [v14 setShowsImageAndLabelDuringDrop:0];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  [v6 enumerateDestinationIconViewsUsingBlock:&__block_literal_global_401];
  [v6 clearAllDropAssertions];
  [v6 removeMessageExpectationNamed:@"concludeDrop"];
  unsigned int v15 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v15 iconDragManager:self iconDropSessionDidConclude:v4];
  }
  [(SBIconDragManager *)self _stopTrackingDragIfPossibleWithIdentifier:v8];
}

void __38__SBIconDragManager_concludeIconDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isTrackingDragOriginatingFromOrDroppingIntoIconView:otherThanDragWithIdentifier:") & 1) == 0)objc_msgSend(v3, "cleanUpAfterDropAnimation"); {
}
  }

uint64_t __38__SBIconDragManager_concludeIconDrop___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setGrabbed:0];
}

uint64_t __38__SBIconDragManager_concludeIconDrop___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setOverrideCustomIconImageViewController:0];
}

- (void)iconDropSessionDidEnd:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SBIconDragManager *)self draggedIconIdentifiersForDragDropSession:v4];
  id v6 = [(SBIconDragManager *)self uniqueIdentifierForIconDropSession:v4];

  id v7 = SBLogIconDragging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "icon drop session did end: %{public}@, dragged identifiers: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [(SBIconDragManager *)self iconDragContextForDragWithIdentifier:v6];
  if (v8)
  {
    if ([(SBIconDragManager *)self removeDragPlaceholdersForDragWithIdentifier:v6])
    {
      [(SBIconDragManager *)self compactAndLayoutRootIconLists];
    }
    [v8 setRecipientIconView:0];
    [v8 removeMessageExpectationNamed:@"dropSessionDidEnd"];
    [(SBIconDragManager *)self _stopTrackingDragIfPossibleWithIdentifier:v6];
  }
}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = [(SBIconDragManager *)self _iconIdentifierForDragItem:v10];
  uint64_t v12 = [(SBIconDragManager *)self iconDragContextForDragItem:v10];

  uint64_t v13 = [v12 additionalMatchingIconForDroppedIconIdentifier:v11];
  unint64_t v14 = v9;
  if (v13)
  {
    unint64_t v14 = [v8 iconViewForIcon:v13];
  }
  return v14;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [v10 markAsDropping];
  if (v10 && v8)
  {
    id v9 = [(SBIconDragManager *)self iconDragContextForDragItem:v7];
    [v9 addIconViewDroppingAssertion:v8 forIconView:v10];
  }
}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(SBIconDragManager *)self _iconIdentifierForDragItem:v9];
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = __Block_byref_object_copy__3;
  id v52 = __Block_byref_object_dispose__3;
  id v12 = v10;
  id v53 = v12;
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  uint64_t v40 = __81__SBIconDragManager_iconListView_previewForDroppingIconDragItem_proposedPreview___block_invoke;
  uint64_t v41 = &unk_1E6AADED8;
  id v13 = v11;
  id v42 = v13;
  uint64_t v43 = self;
  id v14 = v8;
  id v44 = v14;
  uint64_t v47 = &v48;
  id v15 = v9;
  id v45 = v15;
  id v16 = v12;
  id v46 = v16;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:&v38];
  if ((id)v49[5] == v16)
  {
    long long v17 = objc_msgSend(v15, "sbh_appDragLocalContext", v38, v39, v40, v41, v42, v43, v44, v45);
    long long v18 = v17;
    if (v17 && ([v17 isSourceLocal] & 1) == 0)
    {
      long long v19 = [v14 model];
      uint64_t v20 = [v19 lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:v13];
      if (v20)
      {
        id v21 = [v14 makeIconView];
        [v14 configureIconView:v21 forIcon:v20];
        [v21 setEditing:0];
        [v21 iconImageInfo];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        id v28 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
        uint64_t v29 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v23, v25, v27);
        [v28 setVisiblePath:v29];

        id v30 = objc_alloc(MEMORY[0x1E4FB1B38]);
        [v14 centerForIcon:v20];
        id v31 = objc_msgSend(v30, "initWithContainer:center:", v14);
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v21 parameters:v28 target:v31];
        int v33 = (void *)v49[5];
        v49[5] = v32;
      }
    }
  }
  uint64_t v34 = SBLogIconDragging();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = v49[5];
    *(_DWORD *)buf = 134218754;
    id v55 = v14;
    __int16 v56 = 2112;
    uint64_t v57 = v35;
    __int16 v58 = 2112;
    id v59 = v15;
    __int16 v60 = 2112;
    id v61 = v13;
    _os_log_impl(&dword_1D7F0A000, v34, OS_LOG_TYPE_INFO, "icon list view: %p, will use preview %@ for drop of item %@ (%@)", buf, 0x2Au);
  }

  id v36 = (id)v49[5];
  _Block_object_dispose(&v48, 8);

  return v36;
}

void __81__SBIconDragManager_iconListView_previewForDroppingIconDragItem_proposedPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasItemIdentifier:*(void *)(a1 + 32)])
  {
    id v4 = [v3 destinationFolderIconViewForIconWithIdentifier:*(void *)(a1 + 32)];
    if (v4
      || ([v3 itemIdentifiers],
          int v5 = objc_claimAutoreleasedReturnValue(),
          unint64_t v6 = [v5 count],
          unint64_t v7 = [*(id *)(a1 + 40) maximumAllowedIconDroppingAnimationsForListView:*(void *)(a1 + 48)],
          v5,
          v6 <= v7))
    {
      [v3 addDropAnimatingDragItem:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
    id v10 = [v3 destinationStackIconViewForIconWithIdentifier:*(void *)(a1 + 32)];
    __int16 v11 = v10;
    if (v10)
    {
      [v10 center];
      double v13 = v12;
      double v15 = v14;
      [*(id *)(a1 + 48) iconContentScale];
      memset(&v25, 0, sizeof(v25));
      CGAffineTransformMakeScale(&v25, v16, v16);
      long long v17 = [v11 markAsDropping];
      [v11 setShowsImageAndLabelDuringDrop:1];
      long long v18 = [v11 dropContainerView];
      id v19 = objc_alloc(MEMORY[0x1E4FB1728]);
      objc_msgSend(v18, "convertPoint:fromView:", *(void *)(a1 + 48), v13, v15);
      CGAffineTransform v24 = v25;
      uint64_t v20 = objc_msgSend(v19, "initWithContainer:center:transform:", v18, &v24);
      uint64_t v21 = [*(id *)(a1 + 64) retargetedPreviewWithTarget:v20];
      uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
      double v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "set_springboardPlatterStyle:", 1);
      if (v17) {
        [v3 addIconViewDroppingAssertion:v17 forIconView:v11];
      }
    }
  }
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(SBIconDragManager *)self _iconIdentifierForDragItem:v9];
  double v12 = SBLogIconDragging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v9;
    __int16 v49 = 2112;
    uint64_t v50 = v11;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_INFO, "icon list view: %p, will animate drop of item %@ (%@)", buf, 0x20u);
  }

  double v13 = objc_msgSend(v9, "sbh_appDragLocalContext");
  double v14 = [v13 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    double v15 = v14;
  }
  else {
    double v15 = 0;
  }
  id v16 = v15;

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
  v38[3] = &unk_1E6AADF28;
  id v17 = v10;
  id v39 = v17;
  uint64_t v40 = self;
  id v18 = v9;
  id v41 = v18;
  id v19 = v11;
  id v42 = v19;
  id v20 = v16;
  id v43 = v20;
  id v21 = v8;
  id v44 = v21;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v38];
  uint64_t v22 = [(SBIconDragManager *)self _iconViewForDragItem:v18 inIconListView:v21];
  if (v20)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_8;
    v35[3] = &unk_1E6AACA90;
    id v23 = v20;
    id v36 = v23;
    id v37 = v21;
    [v17 addAnimations:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_9;
    v33[3] = &unk_1E6AACB50;
    id v34 = v23;
    [v17 addCompletion:v33];
  }
  if (v22)
  {
    CGAffineTransform v24 = [v22 superview];
    [v24 bringSubviewToFront:v22];

    if ([(SBIconDragManager *)self _shouldPerformRippleAnimationForInsertingDragItem:v18 toIconListView:v21])
    {
      CGAffineTransform v25 = [(SBIconDragManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        double v26 = [v22 icon];
        [v25 widgetInsertionRippleIconAnimatorForIcon:v26 iconListView:v21 withReferenceIconView:0];
        double v27 = v29 = v13;

        [v27 animateWithCompletion:0];
        double v13 = v29;
      }
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_10;
    v30[3] = &unk_1E6AADDD8;
    v30[4] = self;
    id v31 = v22;
    id v32 = v18;
    [v17 addCompletion:v30];
  }
  id v28 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v28 iconDragManager:self iconListView:v21 item:v18 willAnimateDropWithAnimator:v17];
  }
}

void __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2;
  v35[3] = &unk_1E6AADF00;
  unint64_t v7 = *(void **)(a1 + 32);
  void v35[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v36 = v8;
  [v7 addCompletion:v35];
  if ([v5 isAnimatingDropForDragItem:*(void *)(a1 + 48)])
  {
    id v9 = [v5 destinationFolderIconViewForIconWithIdentifier:*(void *)(a1 + 56)];
    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3;
      v33[3] = &unk_1E6AAC810;
      id v34 = *(id *)(a1 + 64);
      [v10 addAnimations:v33];
      __int16 v11 = *(void **)(a1 + 32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4;
      v30[3] = &unk_1E6AADF00;
      id v31 = v5;
      id v32 = v9;
      [v11 addCompletion:v30];
    }
    double v12 = [v5 destinationStackIconViewForIconWithIdentifier:*(void *)(a1 + 56)];
    if (v12)
    {
      double v13 = [v5 destinationStackIconViewPauseLayoutAssertion];
      [v13 invalidate];

      [v5 setDestinationStackIconViewPauseLayoutAssertion:0];
      double v14 = [*(id *)(a1 + 72) iconLocation];
      uint64_t v15 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v14);

      [*(id *)(a1 + 72) layoutIconsIfNeededWithAnimationType:0 options:v15];
      id v16 = *(void **)(a1 + 32);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_5;
      v28[3] = &unk_1E6AAC810;
      id v29 = *(id *)(a1 + 64);
      [v16 addAnimations:v28];
      id v17 = *(void **)(a1 + 32);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_6;
      v25[3] = &unk_1E6AADF00;
      id v26 = v12;
      id v27 = v5;
      [v17 addCompletion:v25];
    }
    id v18 = [*(id *)(a1 + 64) delayCleanUpForReason:@"DropAnimation"];
    id v19 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_7;
    v21[3] = &unk_1E6AADDD8;
    id v22 = v18;
    id v23 = *(id *)(a1 + 64);
    id v24 = v5;
    id v20 = v18;
    [v19 addCompletion:v21];
  }
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeStateOfDragWithIdentifier:*(void *)(a1 + 40) toState:6];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconAllowsLabelArea:0];
  [*(id *)(a1 + 32) setIconAllowsAccessory:0];
  [*(id *)(a1 + 32) setIconCanShowCloseBox:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setIconCanShowResizeHandle:0];
  }
  return result;
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) clearDropAssertionsForIconView:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);
  return [v2 scrollToFirstGapAnimated:1];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconAllowsLabelArea:0];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanUpAfterDropAnimation];
  [*(id *)(a1 + 32) setShowsImageAndLabelDuringDrop:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  return [v2 clearDropAssertionsForIconView:v3];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  char v2 = objc_opt_respondsToSelector();
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 setIconViewDelegate2:0];
  }
  else {
    [v3 setIconViewDelegate:0];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) setIconViewCustomIconImageViewController:0];
  }
  id v4 = *(void **)(a1 + 48);
  return [v4 invalidateIconViewBorrowAssertions];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_8(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) iconContentScale];
  objc_msgSend(v2, "setIconContentScale:");
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setDragState:3];
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) dropDestinationAnimationCompleted];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) setIcon:0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setIconViewCustomIconImageViewController:0];
  }
  return result;
}

void __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_10(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:*(void *)(a1 + 40)] <= 1)objc_msgSend(*(id *)(a1 + 40), "cleanUpAfterDropAnimation"); {
  id v2 = [*(id *)(a1 + 32) iconDragContextForDragItem:*(void *)(a1 + 48)];
  }
  [v2 clearAllDropAssertions];
}

- (int64_t)_animationTypeForGridSizeClass:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(SBIconDragManager *)self delegate];
  int64_t v6 = ((objc_opt_respondsToSelector() & 1) == 0
     || [v5 shouldNonDefaultGridSizeClassesUseClusterAnimationForIconDragManager:self])
    && @"SBHIconGridSizeClassDefault" != v4
    && !-[__CFString isEqualToString:](v4, "isEqualToString:");

  return v6;
}

- (int64_t)_animationTypeForGridSizeClass:(id)a3 inIconListView:(id)a4 draggedIconCount:(unint64_t)a5
{
  id v8 = a4;
  int64_t v9 = [(SBIconDragManager *)self _animationTypeForGridSizeClass:a3];
  unint64_t v10 = [(SBIconDragManager *)self maximumAllowedIconDroppingAnimationsForListView:v8];

  if (v10 >= a5) {
    return v9;
  }
  else {
    return 3;
  }
}

- (BOOL)shouldAllowSpringLoadedInteractionForIconDropSession:(id)a3 onIconView:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34[0] = *MEMORY[0x1E4FA6E60];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  int v9 = [v6 hasItemsConformingToTypeIdentifiers:v8];

  if (v9 && ![(SBIconDragManager *)self isEditing])
  {
    LOBYTE(v17) = 0;
    goto LABEL_14;
  }
  unint64_t v10 = [v7 icon];
  __int16 v11 = [(SBIconDragManager *)self iconDragContextForDropSession:v6];
  double v12 = [v10 gridSizeClass];
  if ([v10 isWidgetStackIcon]
    && [(SBIconDragManager *)self isTrackingWidgetIconDrags]
    && ![(SBIconDragManager *)self isTrackingWidgetStackIconDrags]
    && [(SBIconDragManager *)self createsStacksFromWidgets])
  {
    uint64_t v13 = [v11 draggedIconGridSizeClass];
    if ((void *)v13 == v12)
    {
      LOBYTE(v17) = 1;
      id v22 = v12;
      goto LABEL_49;
    }
    double v14 = (void *)v13;
    uint64_t v15 = [v11 draggedIconGridSizeClass];
    char v16 = [v15 isEqualToString:v12];

    if (v16) {
      goto LABEL_30;
    }
  }
  if ([v10 isPlaceholder] & 1) != 0 || (objc_msgSend(v7, "isGrabbed")) {
    goto LABEL_11;
  }
  if ((v9 & 1) == 0)
  {
    if ([v10 isWidgetIcon])
    {
      id v22 = [v10 activeDataSource];
      id v23 = SBHContainerBundleIdentifierForDataSource(v22);
      if (v23)
      {
        id v24 = [(SBIconDragManager *)self model];
        CGAffineTransform v25 = [v24 applicationIconForBundleIdentifier:v23];
        if (v25) {
          LOBYTE(v17) = [v24 isIconVisible:v25];
        }
        else {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }

      goto LABEL_49;
    }
    if ([v10 isApplicationIcon])
    {
LABEL_30:
      LOBYTE(v17) = 1;
      goto LABEL_12;
    }
  }
  id v19 = [v7 location];
  if (!SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v19)
    || ([v10 isFolderIcon] & 1) != 0
    || [(SBIconDragManager *)self isEditing])
  {

    goto LABEL_20;
  }

  if ((v9 & 1) == 0)
  {
LABEL_20:
    if ([v10 isFolderIcon])
    {
      id v20 = [v10 folder];
      char v21 = [v20 isFull];

      if (v21) {
        goto LABEL_11;
      }
    }
    if (![(SBIconDragManager *)self allowsNestedFolders])
    {
      if ([v11 hasFolderDraggedIcons]) {
        goto LABEL_11;
      }
      id v26 = [(SBIconDragManager *)self rootFolder];
      id v27 = [v26 indexPathForIcon:v10];
      if (v27)
      {
        id v28 = [v26 folderContainingIndexPath:v27 relativeIndexPath:0];
      }
      else
      {
        id v28 = 0;
      }
      int v33 = [v28 isEqual:v26];

      if (!v33) {
        goto LABEL_11;
      }
    }
    id v22 = [(SBIconDragManager *)self firstHiddenIconIdentifierInDrag:v6];
    if (v22) {
      goto LABEL_24;
    }
    id v29 = [v10 gridSizeClass];
    id v30 = v29;
    if (v29 == @"SBHIconGridSizeClassDefault")
    {
    }
    else
    {
      id v31 = [v10 gridSizeClass];
      int v32 = [v31 isEqualToString:@"SBHIconGridSizeClassDefault"];

      if (!v32)
      {
LABEL_24:
        LOBYTE(v17) = 0;
LABEL_49:

        goto LABEL_12;
      }
    }
    int v17 = [v11 hasNonDefaultSizedDraggedIcons] ^ 1;
    goto LABEL_49;
  }
LABEL_11:
  LOBYTE(v17) = 0;
LABEL_12:

LABEL_14:
  return v17;
}

- (void)performSpringLoadedInteractionForIconDragOnIconView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "performing springload on icon view: %@", buf, 0xCu);
  }

  id v6 = [v4 icon];
  if ([v6 isFolderIcon])
  {
    [(SBIconDragManager *)self pushExpandedIconView:v4 context:0 animated:1 completionHandler:0];
  }
  else if ([v6 isWidgetStackIcon] {
         && [(SBIconDragManager *)self createsStacksFromWidgets])
  }
  {
    [v4 presentStackConfigurationCard];
  }
  else if ([v6 isLeafIcon])
  {
    iconDrags = self->_iconDrags;
    id v8 = v6;
    int v9 = [(NSMapTable *)iconDrags objectEnumerator];
    unint64_t v10 = [v9 nextObject];

    __int16 v11 = [v10 itemIdentifiers];
    double v12 = [v11 firstObject];
    uint64_t v13 = [(SBIconDragManager *)self draggedIconForIdentifier:v12];

    double v14 = [(SBIconDragManager *)self createNewFolderFromRecipientIcon:v8 grabbedIcon:v13];
    id v17 = v8;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];

    char v16 = [v14 icon];
    [(SBIconDragManager *)self addIcons:v15 intoFolderIcon:v16 openFolderOnFinish:1];
  }
}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  if ([(SBIconDragManager *)self _shouldPerformRippleAnimationForInsertingDragItem:a4 toIconListView:a3])
  {
    id v4 = +[SBHHomeScreenDomain rootSettings];
    id v5 = [v4 widgetSettings];

    id v6 = [v5 dropInsertionAnimationSettings];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_shouldPerformRippleAnimationForInsertingDragItem:(id)a3 toIconListView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsReduceMotionEnabled()
    || ([(SBIconDragManager *)self appDragLocalContextForDragItem:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t started = SBHAppDragLocalContextStartLocationFromSBSLocation([v8 startLocation]),
        v8,
        started == 2))
  {
    LOBYTE(v10) = 0;
    goto LABEL_6;
  }
  if (started != 3)
  {
    double v12 = [(SBIconDragManager *)self _iconForDragItem:v6 inIconListView:v7];
    uint64_t v13 = v12;
    if (v12 && ![v12 isWidgetIcon])
    {
      LOBYTE(v10) = 0;
LABEL_16:

      goto LABEL_6;
    }
    double v14 = [(SBIconDragManager *)self _iconIdentifierForDragItem:v6];
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__3;
    id v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __86__SBIconDragManager__shouldPerformRippleAnimationForInsertingDragItem_toIconListView___block_invoke;
    id v23 = &unk_1E6AAD998;
    id v15 = v14;
    id v24 = v15;
    CGAffineTransform v25 = &v26;
    [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:&v20];
    char v16 = [(SBIconDragManager *)self rootFolder];
    if ([v16 isIconAtIndexPathInTodayList:v27[5]])
    {
    }
    else
    {
      id v17 = [(SBIconDragManager *)self rootFolder];
      int v18 = [v17 isIconAtIndexPathInFavoriteTodayList:v27[5]];

      if (!v18)
      {
        LOBYTE(v10) = 0;
        goto LABEL_15;
      }
    }
    id v19 = [v7 iconLocation];
    int v10 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v19) ^ 1;

LABEL_15:
    _Block_object_dispose(&v26, 8);

    goto LABEL_16;
  }
  LOBYTE(v10) = 1;
LABEL_6:

  return v10;
}

void __86__SBIconDragManager__shouldPerformRippleAnimationForInsertingDragItem_toIconListView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 hasItemIdentifier:*(void *)(a1 + 32)])
  {
    uint64_t v6 = [v9 initialIndexPathForIconWithIdentifier:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)_updateAutoScrollAssistantForDropSession:(id)a3
{
  id v4 = a3;
  autoScrollAssistant = self->_autoScrollAssistant;
  id v9 = v4;
  if (!autoScrollAssistant)
  {
    uint64_t v6 = [(SBIconDragManager *)self rootView];
    uint64_t v7 = [[SBHIconDragAutoScrollAssistant alloc] initWithDelegate:self referenceView:v6];
    id v8 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = v7;

    id v4 = v9;
    autoScrollAssistant = self->_autoScrollAssistant;
  }
  [(SBHIconDragAutoScrollAssistant *)autoScrollAssistant setActiveDropSession:v4];
}

- (void)_invalidateAutoScrollAssistant
{
  autoScrollAssistant = self->_autoScrollAssistant;
  if (autoScrollAssistant)
  {
    [(SBHIconDragAutoScrollAssistant *)autoScrollAssistant invalidate];
    id v4 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = 0;

    autoScrollAssistant = self->_autoScrollAssistant;
  }
  self->_autoScrollAssistant = 0;
}

- (void)autoScrollAssistant:(id)a3 triggeredAutoScrollInDirection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 rootFolderControllerForIconDragManager:self];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v8 contentView];
  int v10 = [v9 window];
  __int16 v11 = [v10 windowScene];

  if (v8
    && ([v8 isScrolling] & 1) == 0
    && [(SBIconDragManager *)self isRootFolderContentVisible])
  {
    if (a4 == 2)
    {
      if ([v7 isOverlayTodayViewVisible])
      {
        uint64_t v22 = 0;
        id v23 = &v22;
        uint64_t v24 = 0x2020000000;
        char v25 = 1;
        if ([(SBIconDragManager *)self isTrackingWidgetIconDrags])
        {
          id v15 = [v8 currentIconListModel];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke;
          v19[3] = &unk_1E6AAD998;
          id v16 = v15;
          id v20 = v16;
          uint64_t v21 = &v22;
          [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v19];
        }
        if (*((unsigned char *)v23 + 24) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 dismissTodayOverlayForIconDragManager:self];
        }
        _Block_object_dispose(&v22, 8);
      }
      else
      {
        uint64_t v18 = [v8 currentPageIndex];
        if (v18 == [v8 lastIconPageIndex]
          && ![(SBIconDragManager *)self isTrackingWidgetIconDrags]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v7 presentLibraryForIconDragManager:self windowScene:v11];
        }
      }
    }
    else if (a4 == 1)
    {
      if ([v7 isMainDisplayLibraryViewVisible])
      {
        if (objc_opt_respondsToSelector())
        {
          double v12 = [v8 contentView];
          uint64_t v13 = [v12 window];
          double v14 = [v13 windowScene];
          [v7 dismissLibraryForIconDragManager:self windowScene:v14];
        }
      }
      else
      {
        uint64_t v17 = [v8 currentPageIndex];
        if (v17 == [v8 firstIconPageIndex]
          && [(SBIconDragManager *)self isTrackingWidgetIconDrags]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v7 presentTodayOverlayForIconDragManager:self];
        }
      }
    }
  }
}

void __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke_2;
  v9[3] = &unk_1E6AAD6B8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a2 enumerateSourceIconViewsUsingBlock:v9];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 icon];
  LOBYTE(v5) = [v5 isAllowedToContainIcon:v6];

  if ((v5 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void)noteIconManagerEditingDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBIconDragManager *)self isEditing];
  id v4 = SBLogIconDragging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "icon controller is now editing: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  [(SBIconDragManager *)self _updateDragPreviewsForEditingState:v3 animated:1];
  if (!v3)
  {
    id v5 = [(SBIconDragManager *)self draggingEditContext];
    [v5 setEnteredScreenLocationNeedsUpdate:1];

    if ([(SBIconDragManager *)self shouldCancelDragsWhenEditingEnds]) {
      [(SBIconDragManager *)self cancelAllDrags];
    }
  }
}

- (void)noteRootFolderDidMutate
{
  if (![(SBIconDragManager *)self isModifyingRootFolder])
  {
    BOOL v3 = SBLogIconDragging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "clearing all undo registrations because the root folder was mutated by someone else", v4, 2u);
    }

    [(SBIconDragManager *)self clearAllUndoRegistrations];
  }
}

- (void)iconListView:(id)a3 concludeIconDrop:(id)a4
{
}

- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4
{
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  return [(SBIconDragManager *)self canHandleIconDropSession:a4 inIconListView:a3];
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  return [(SBIconDragManager *)self iconDropSessionDidUpdate:a4 inIconListView:a3];
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  return [(SBIconDragManager *)self shouldAllowSpringLoadedInteractionForIconDropSession:a4 onIconView:a5];
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconDragManager:self folderController:v8 draggedIconShouldDropFromListView:v6];
  }
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  return [(SBIconDragManager *)self canHandleIconDropSession:a5 inIconListView:a4];
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  return [(SBIconDragManager *)self iconDropSessionDidUpdate:a5 inIconListView:a4];
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  return [(SBIconDragManager *)self iconListView:a4 iconViewForDroppingIconDragItem:a5 proposedIconView:a6];
}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  return [(SBIconDragManager *)self iconListView:a4 previewForDroppingIconDragItem:a5 proposedPreview:a6];
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  return [(SBIconDragManager *)self shouldAllowSpringLoadedInteractionForIconDropSession:a5 onIconView:a6];
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v7 = a5;
  -[SBIconDragManager performSpringLoadedInteractionForIconDragOnIconView:](self, "performSpringLoadedInteractionForIconDragOnIconView:");
  id v6 = [(SBIconDragManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconDragManager:self didSpringLoadIconView:v7];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  return [(SBIconDragManager *)self iconListView:a4 customSpringAnimationBehaviorForDroppingItem:a5];
}

- (void)iconListView:(id)a3 willConfigureIconView:(id)a4 forIcon:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SBIconDragManager_iconListView_willConfigureIconView_forIcon___block_invoke;
  v8[3] = &unk_1E6AADCA8;
  id v9 = v6;
  id v7 = v6;
  [(SBIconDragManager *)self enumerateIconDragContextsUsingBlock:v8];
}

void __64__SBIconDragManager_iconListView_willConfigureIconView_forIcon___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isWaitingToSetPlaceholderViewController])
  {
    BOOL v3 = objc_alloc_init(SBIconDragPlaceholderIconViewController);
    [*(id *)(a1 + 32) setOverrideCustomIconImageViewController:v3];
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBIconDragManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_iconDrags withName:@"iconDrags"];
  id v6 = (id)[v4 appendObject:self->_revertingReplacementIndexPaths withName:@"revertingReplacementIndexPaths" skipIfNil:1];
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBIconDragManager *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)createsStacksFromWidgets
{
  return self->_createsStacksFromWidgets;
}

- (void)setCreatesStacksFromWidgets:(BOOL)a3
{
  self->_createsStacksFromWidgets = a3;
}

- (BOOL)prioritizesDirectIconPlacement
{
  return self->_prioritizesDirectIconPlacement;
}

- (void)setPrioritizesDirectIconPlacement:(BOOL)a3
{
  self->_prioritizesDirectIconPlacement = a3;
}

- (double)placeholderRepositioningDelay
{
  return self->_placeholderRepositioningDelay;
}

- (void)setPlaceholderRepositioningDelay:(double)a3
{
  self->_placeholderRepositioningDeladouble y = a3;
}

- (SBIconDraggingEditContext)draggingEditContext
{
  return self->_draggingEditContext;
}

- (void)setDraggingEditContext:(id)a3
{
}

- (BOOL)isModifyingRootFolder
{
  return self->_modifyingRootFolder;
}

- (void)setModifyingRootFolder:(BOOL)a3
{
  self->_modifyingRootFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingEditContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_runLoopWaitBlocks, 0);
  objc_storeStrong((id *)&self->_registeredUndoManagers, 0);
  objc_storeStrong((id *)&self->_autoScrollAssistant, 0);
  objc_storeStrong((id *)&self->_singleUseDragWindows, 0);
  objc_storeStrong((id *)&self->_revertingReplacementIndexPaths, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersPerDragSession, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersPerDropSession, 0);
  objc_storeStrong((id *)&self->_iconDrags, 0);
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "icon view '%@' is marked as grabbed when cleaning up the drag", (uint8_t *)&v2, 0xCu);
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "icon view '%@' is marked as highlighted when cleaning up the drag", (uint8_t *)&v2, 0xCu);
}

- (void)watchdogDragWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_FAULT, "Error: watchdog for user icon drag fired. Will abort and try to clean up. %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updatePlaceholderPositionForDragWithIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "ERROR: We have no grabbed icon! Tracked drags: %@, this drag: %@", (uint8_t *)&v4, 0x16u);
}

- (void)performIconDrop:(os_log_t)log inIconListView:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "bailing on icon drop because we don't have a root folder or a root list model", v1, 2u);
}

@end
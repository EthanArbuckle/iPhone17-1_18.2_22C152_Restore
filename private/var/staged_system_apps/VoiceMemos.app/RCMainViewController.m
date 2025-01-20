@interface RCMainViewController
- (BOOL)_canDelete;
- (BOOL)_canDuplicate;
- (BOOL)_cardDismissalRequiredForSwitchToIdleFromActivityType:(int64_t)a3 subActivityType:(int64_t)a4;
- (BOOL)_isRecordingOrBlockedByModal;
- (BOOL)_libraryIsEditing;
- (BOOL)_shouldPresentPlaybackQuickActions;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canDelete;
- (BOOL)canDuplicateRecording;
- (BOOL)canEditRecording;
- (BOOL)canHandleCancel;
- (BOOL)canHandleCustomAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canHandleDone;
- (BOOL)canJumpBackward;
- (BOOL)canJumpForward;
- (BOOL)canMoveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4 toFolderType:(int64_t)a5 fromFolderUUID:(id)a6;
- (BOOL)canMoveSelectedRecordingsFromFolderWithUUID:(id)a3 toFolderWithDisplayModel:(id)a4 excludedFolderUUIDsForSelection:(id)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPlayRecording;
- (BOOL)canRenameRecording;
- (BOOL)canShareRecording;
- (BOOL)canStartNewRecording;
- (BOOL)canSwipeToNavigateBack;
- (BOOL)canToggleEnhanceRecording;
- (BOOL)canToggleFavoriteRecording;
- (BOOL)canToggleRemoveSilence;
- (BOOL)canToggleSidebar;
- (BOOL)canTrimRecording;
- (BOOL)currentSelectionHasSilenceRemoved;
- (BOOL)currentSelectionIsEnhanced;
- (BOOL)currentSelectionIsFavorite;
- (BOOL)hideNavigationTitle;
- (BOOL)isEditingInFlightForUUID:(id)a3;
- (BOOL)isFavoriteForUUID:(id)a3;
- (BOOL)isInForeground;
- (BOOL)isPlayingForUUID:(id)a3;
- (BOOL)isQuickRecordingWorkflowDismissal;
- (BOOL)isRecording;
- (BOOL)isShowingRecentlyDeleted;
- (BOOL)isSilencing;
- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3;
- (BOOL)remoteToggleShouldPauseRecording;
- (BOOL)toggleRecording;
- (NSMutableDictionary)editingProgressItems;
- (NSString)oldFolderName;
- (NSString)selectedUUID;
- (NSString)uuidToSelectAfterDismiss;
- (RCFolderBrowsingCollectionViewController)browseFoldersViewController;
- (RCFolderSelectionContainerViewController)presentedSelectFolderViewController;
- (RCMainControllerHelper)mainControllerHelper;
- (RCMainViewController)initWithCoder:(id)a3;
- (RCMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (RCMainViewControllerDelegate)mainViewControllerDelegate;
- (RCPlaybackSettings)playbackSettings;
- (RCPlaybackSettingsViewController)presentedPlaybackSettingsViewController;
- (RCPlaybackViewController)playbackViewController;
- (RCRecordingCardViewController)presentedCardViewController;
- (RCRecordingStartTimeInfo)recordingStartTimeInfo;
- (RCRecordingsModelInteractor)recordingsModelInteractor;
- (RCUndoManager)mainUndoManager;
- (RCUndoManager)undoManager;
- (UIAlertAction)createNewFolderSaveAction;
- (UIAlertAction)renameFolderSaveAction;
- (UIBarButtonItem)createNewFolderButtonItem;
- (UIBarButtonItem)flexBarItem;
- (UIViewController)presentedConfirmationController;
- (UIViewController)presentingPlaybackSettingsViewController;
- (VMAudioPlayer)audioPlayer;
- (VMAudioRecorder)audioRecorder;
- (double)currentTime;
- (id)_recordingCardSheetPresentationController;
- (id)_sharedAnimationControllerResolverForFromVC:(id)a3 toVC:(id)a4;
- (id)_stringForAudioEditingStatus:(int)a3;
- (id)_uuidOfRecordingForPlaybackActivities;
- (id)activeFolderViewController;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)availableQuickActions;
- (id)contentScrollView;
- (id)folderUUIDsToExcludeWhenMovingRecordingUUIDs:(id)a3;
- (id)foregroundCompletionBlock;
- (id)lockScreenRecordingViewController;
- (id)moveToFolderContainerViewControllerWithUUIDs:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)overviewWaveformViewController;
- (id)platterViewControllerForPresentationStyle:(unint64_t)a3;
- (id)recordingInProgressUUID;
- (id)selectedComposition;
- (id)waveformViewController;
- (int64_t)state;
- (unint64_t)_cardSheetOptionsForDefaultRecordingView;
- (unint64_t)_cardSheetOptionsForLargeDetentOnly;
- (unint64_t)activeDragSessionCount;
- (unint64_t)sheetPresentationState;
- (unint64_t)supportedInterfaceOrientations;
- (void)__animateRecordingCardDetentTransitionForSheetPresentationController:(id)a3;
- (void)_axAnnounceDidSetEnhanced:(BOOL)a3;
- (void)_collapsePresentedCompactRecordingCard;
- (void)_commonInit;
- (void)_dismissCardView:(id)a3;
- (void)_dismissShareMemoVCIfNeededForDeletedUUIDs:(id)a3;
- (void)_displayMultiLayerAlertIfNeeded;
- (void)_endDescriptionViewTextEditing;
- (void)_expandPresentedCompactRecordingCard;
- (void)_handleNewFolder;
- (void)_myPresentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_newFolderTextDidChange:(id)a3;
- (void)_openForModifyRecordingWithUUID:(id)a3 enterTrim:(BOOL)a4;
- (void)_prepareToDisplayCardViewWithCompletionBlock:(id)a3;
- (void)_presentCardViewWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_presentMoveToFolderUIForRecordingWithUUID:(id)a3;
- (void)_presentMoveToFolderUIForRecordingsWithUUIDs:(id)a3;
- (void)_presentMoveToFolderUIForSelectedRecordings;
- (void)_presentNameTakenAlertWithName:(id)a3 sourceController:(id)a4;
- (void)_presentPlaybackSettingsUIWithSource:(id)a3;
- (void)_presentViewController:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 widthHeightConstraintConstant:(double)a6 completion:(id)a7;
- (void)_processMoveOfUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4;
- (void)_removeFromUserFolderRecordingsWithUUIDs:(id)a3;
- (void)_renamingTextDidChange:(id)a3;
- (void)_reparentAfterDismiss;
- (void)_restyleCardViewAndReparentIfNeeded;
- (void)_restyleRecordingCardSheetPresentationController;
- (void)_selectLargeDetentOnRecordingCardSheetPresentationController;
- (void)_selectLargeDetentOnSheetPresentationController:(id)a3;
- (void)_selectRecordingWithUUID:(id)a3 inRecordingsCollectionViewController:(id)a4;
- (void)_setCorrectOriginalFolderForRecordingWithUUID:(id)a3 folderType:(int64_t)a4 userFolderName:(id)a5;
- (void)_showGrabberOnRecordingCardSheetPresentationController:(BOOL)a3;
- (void)_showGrabberOnSheetPresentationController:(id)a3 showGrabber:(BOOL)a4;
- (void)_startCapturing:(id)a3 completion:(id)a4;
- (void)_styleRecordingCardSheetPresentationControllerWithOptions:(unint64_t)a3 customDetentHeight:(double)a4;
- (void)_styleSheetPresentationController:(id)a3 options:(unint64_t)a4 customDetentHeight:(double)a5;
- (void)_styleView;
- (void)_switchToCapturingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 waveformDataSource:(id)a5 isReplaceOrAppend:(BOOL)a6;
- (void)_switchToEditingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 withComposition:(id)a5 enterTrim:(BOOL)a6;
- (void)_switchToIdleFromPreviousActivityType:(int64_t)a3 fromSubActivityType:(int64_t)a4 toSubActivityType:(int64_t)a5 displayModel:(id)a6 withUUID:(id)a7;
- (void)_switchToPlayingBackFromPreviousActivityType:(int64_t)a3 withUUID:(id)a4;
- (void)_transitionPresentedCompactRecordingCardToTrimMode:(BOOL)a3;
- (void)_transitionToBrowsing:(id)a3;
- (void)_transitionToCaptureAndModifyWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_updateControllersToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5;
- (void)_updateRecordingViewStatusBarHeight;
- (void)_updateSheetPresentationOptions:(BOOL)a3;
- (void)_updateToolbar;
- (void)backupTimerFiredForUUID:(id)a3;
- (void)cancelTrimMode;
- (void)captureFailedWithError:(id)a3;
- (void)closeSidebar;
- (void)confirmEraseAllWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5;
- (void)confirmEraseSelectedWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5;
- (void)confirmEraseWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 eraseAllDeleted:(BOOL)a6;
- (void)confirmRecoverAllWithSourceController:(id)a3 source:(id)a4;
- (void)confirmRecoverSelectedWithSourceController:(id)a3 source:(id)a4;
- (void)confirmRecoverWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6;
- (void)copyTranscript:(id)a3;
- (void)delete:(id)a3;
- (void)deleteFolder:(id)a3 controller:(id)a4 completionBlock:(id)a5;
- (void)deleteRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 showInfo:(BOOL)a6;
- (void)didCancelFolderSelection;
- (void)didCompleteFolderSelection;
- (void)didEndDragSession;
- (void)didHidePlaybackSettingsViewController;
- (void)didReturnToFoldersList;
- (void)didSelectFolderOfType:(int64_t)a3;
- (void)didSelectForUUID:(id)a3 resetPosition:(BOOL)a4 force:(BOOL)a5;
- (void)didTransitionWithTransitionInfo:(id)a3;
- (void)didUpdateRecordingViewDisplayStyle;
- (void)didUpdateToStatus:(int)a3 progress:(float)a4 forRecordingWithUUID:(id)a5;
- (void)displayPlaybackSettingsUI;
- (void)doActionEditRecordingInSharingSheetWithUUID:(id)a3;
- (void)duplicateRecording;
- (void)editRecording;
- (void)enableUndoFirstResponder;
- (void)endEditing;
- (void)endRecording;
- (void)eraseRecording;
- (void)exitTrimMode;
- (void)expandCardFromLockScreenInput;
- (void)finishInitialSetup:(id)a3 goToAllRecordings:(BOOL)a4;
- (void)goToAllRecordingsIfNeeded:(BOOL)a3 completion:(id)a4;
- (void)goToFolderOfType:(int64_t)a3 withName:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)goToRecentlyDeletedIfNeededWithCompletion:(id)a3;
- (void)handleCancel;
- (void)handleDone;
- (void)handleEndOfWelcome;
- (void)hideBackButtonTitle:(BOOL)a3;
- (void)hideFolderSelectionViewController;
- (void)hidePlaybackSettingsViewController;
- (void)jumpSelectionBackward;
- (void)jumpSelectionForward;
- (void)libraryWillChangeEditingState:(BOOL)a3;
- (void)loadView;
- (void)mostRecentRecordingIsSelectable;
- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4;
- (void)moveRecordingsWithUUIDs:(id)a3 fromFolderOfType:(int64_t)a4 toBuiltInFolderOfType:(int64_t)a5;
- (void)moveRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4 source:(id)a5;
- (void)moveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4;
- (void)moveRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4 source:(id)a5;
- (void)openSidebar;
- (void)pauseRecording;
- (void)performAction:(int64_t)a3 atPosition:(double)a4 forUUID:(id)a5 sourceController:(id)a6 source:(id)a7;
- (void)performAction:(int64_t)a3 atPosition:(double)a4 forUUID:(id)a5 sourceController:(id)a6 source:(id)a7 trackIndex:(unint64_t)a8;
- (void)performClearAllRecentlyDeleted;
- (void)performDelayedSetup;
- (void)performDoneButtonFromLockScreenInput;
- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4;
- (void)playRecording;
- (void)playRecordingWithUUID:(id)a3;
- (void)playbackSettingsViewController:(id)a3 contentSizeChanged:(CGSize)a4;
- (void)recordingDidEnd;
- (void)recordingDurationUpdated:(double)a3;
- (void)recordingView:(id)a3 didUpdateViewHeight:(double)a4;
- (void)recoverRecording;
- (void)recoverRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6;
- (void)refreshDisplayWithDisplayModel:(id)a3;
- (void)reloadWaveformsFromComposition:(id)a3;
- (void)removeLockScreenRecordingViewController;
- (void)renameFolder:(id)a3 toName:(id)a4;
- (void)renameRecording;
- (void)replaceRecording:(unint64_t)a3;
- (void)restyle;
- (void)resumeRecording:(unint64_t)a3;
- (void)saveAsNewDoneButtonAction:(BOOL)a3;
- (void)selectNewRecordingForDismiss;
- (void)selectRecordingWithUUID:(id)a3 returnToBrowse:(BOOL)a4;
- (void)separateRecordingLayers:(id)a3;
- (void)setActiveDragSessionCount:(unint64_t)a3;
- (void)setBrowseFoldersViewController:(id)a3;
- (void)setCreateNewFolderButtonItem:(id)a3;
- (void)setCreateNewFolderSaveAction:(id)a3;
- (void)setCurrentTime:(double)a3 withUUID:(id)a4;
- (void)setEditingProgressItems:(id)a3;
- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4;
- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4;
- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4;
- (void)setFlexBarItem:(id)a3;
- (void)setForegroundCompletionBlock:(id)a3;
- (void)setHideNavigationTitle:(BOOL)a3;
- (void)setIsInForeground:(BOOL)a3;
- (void)setLayerMix:(double)a3 forUUID:(id)a4;
- (void)setMainControllerHelper:(id)a3;
- (void)setMainUndoManager:(id)a3;
- (void)setMainViewControllerDelegate:(id)a3;
- (void)setOldFolderName:(id)a3;
- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4;
- (void)setPlaybackViewController:(id)a3;
- (void)setPresentedCardViewController:(id)a3;
- (void)setPresentedConfirmationController:(id)a3;
- (void)setPresentedPlaybackSettingsViewController:(id)a3;
- (void)setPresentedSelectFolderViewController:(id)a3;
- (void)setPresentingPlaybackSettingsViewController:(id)a3;
- (void)setRecordingStartTimeInfo:(id)a3;
- (void)setRecordingsModelInteractor:(id)a3;
- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4;
- (void)setRenameFolderSaveAction:(id)a3;
- (void)setSheetPresentationState:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5;
- (void)setUuidToSelectAfterDismiss:(id)a3;
- (void)shareRecording:(id)a3;
- (void)shouldEnableTrimSave:(BOOL)a3;
- (void)showNewFolderUIFromController:(id)a3;
- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4;
- (void)startNewRecordingAction;
- (void)stopPlayback;
- (void)toggleEnhanceRecording;
- (void)toggleEnhanceRecordingForUUID:(id)a3;
- (void)toggleFavoriteForUUID:(id)a3;
- (void)toggleFavoriteRecording;
- (void)toggleRemoveSilence;
- (void)toggleRemoveSilenceForUUID:(id)a3;
- (void)toggleTranscriptView;
- (void)trimRecording;
- (void)undo;
- (void)updateLibraryViewInEditModeForMedusa;
- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4;
- (void)updatePlaybackContentUnavailableViewIfNeeded;
- (void)updatePlaybackSettings;
- (void)updateQuickActions;
- (void)updateUndoButtonStateFromUndoManager;
- (void)userDidDeleteRecordingsWithUUIDs:(id)a3;
- (void)userDidEraseRecordingsWithUUIDs:(id)a3;
- (void)userDidRecoverRecordingsWithUUIDs:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wasDeselectedForUUID:(id)a3;
- (void)waveformTimeUpdated:(double)a3;
- (void)willBeginDragSession;
- (void)willTransitionFromHorizontalSizeClass:(int64_t)a3 toHorizontalSizeClass:(int64_t)a4;
@end

@implementation RCMainViewController

- (void)setIsInForeground:(BOOL)a3
{
  if (self->_isInForeground != a3)
  {
    self->_isInForeground = a3;
    if (a3)
    {
      v4 = [(RCMainViewController *)self foregroundCompletionBlock];

      if (v4)
      {
        v5 = [(RCMainViewController *)self foregroundCompletionBlock];
        v5[2]();

        id foregroundCompletionBlock = self->_foregroundCompletionBlock;
        self->_id foregroundCompletionBlock = 0;
      }
    }
  }
}

- (void)stopPlayback
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  [v2 stopPlayback];
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (void)finishInitialSetup:(id)a3 goToAllRecordings:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(void))a3;
  if (v4)
  {
    v8 = v6;
    v7 = [(RCMainViewController *)self browseFoldersViewController];
    [v7 goToBuiltInFolderOfType:0 animated:0 completion:v8];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    v8 = v6;
    v6[2]();
  }
  v6 = v8;
LABEL_6:
}

- (RCMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCMainViewController;
  BOOL v4 = [(RCMainViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(RCMainViewController *)v4 _commonInit];
  }
  return v5;
}

- (void)handleEndOfWelcome
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v2 = [v3 activeRecordingsCollectionViewController];
  [v2 becomeFirstResponder];
}

- (void)didSelectFolderOfType:(int64_t)a3
{
  [(RCMainViewController *)self stopPlayback];
  BOOL v4 = [(RCMainViewController *)self playbackViewController];
  [v4 clear];

  [(RCMainViewController *)self updatePlaybackContentUnavailableViewIfNeeded];
}

- (void)didSelectForUUID:(id)a3 resetPosition:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v31 = a3;
  v8 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v31];
  v9 = [(RCMainViewController *)self playbackViewController];
  [v9 stopScrolling];
  if (v31)
  {
    if (v8)
    {
      v10 = [v9 uuidBeingDisplayed];
      unsigned int v11 = [v10 isEqualToString:v31];

      if (!v11 || v5)
      {
        v12 = [v9 contentUnavailableConfiguration];
        BOOL v13 = v12 != 0;

        v14 = [(RCMainViewController *)self mainControllerHelper];
        [v14 prepareForPlaybackForUUID:v31 force:v13];
        v15 = [v9 uuidBeingDisplayed];
        if (v15 && ([v31 isEqualToString:v15] & 1) == 0) {
          [v14 stopForUUID:v15];
        }
        v16 = [v14 compositionForUUID:v31];
        v17 = [(RCMainViewController *)self browseFoldersViewController];
        v18 = [v17 selectedRecording];

        [v9 updateWithRecordingModel:v8];
        if (v18)
        {
          v19 = [v14 currentRecordingDisplayModel];

          if (v19 != v8) {
            [v14 setCurrentRecordingDisplayModel:v8];
          }
        }
        +[CATransaction begin];
        +[CATransaction setDisableActions:1];
        v20 = [(RCMainViewController *)self presentedCardViewController];

        if (!v20)
        {
          v21 = [(RCMainViewController *)self mainControllerHelper];
          [v21 timeController];
          v30 = v15;
          BOOL v22 = v6;
          v23 = v18;
          v25 = v24 = v16;
          [v9 enablePlaybackWithComposition:v24 displayModel:v8 timeController:v25];

          v16 = v24;
          v18 = v23;
          BOOL v6 = v22;
          v15 = v30;
        }
        +[CATransaction commit];
        [(RCMainViewController *)self updatePlaybackContentUnavailableViewIfNeeded];
        if (([v14 isPlayingForUUID:v31] & 1) == 0)
        {
          if (v6)
          {
            [v14 setCurrentTime:0.0];
          }
          else
          {
            v26 = [v14 timeController];
            [v26 currentTime];
            double v28 = v27;
            v29 = [v14 timeController];
            [v29 setTargetTime:v28];
          }
        }
      }
    }
  }
}

- (void)updateNavBarTitleAndDeleteButtonForRecordingsCount:(unint64_t)a3 isEditMode:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(RCMainViewController *)self browseFoldersViewController];
  id v9 = [v6 currentActiveFolderViewController];

  objc_super v7 = [v9 view];
  v8 = [v7 window];

  if (v8) {
    [v9 updateNavBarTitleAndDeleteButtonForRecordingsCount:a3 isEditMode:v4];
  }
}

- (void)performDelayedSetup
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v4 = [v3 activeRecordingsCollectionViewController];
  [v4 performDelayedSetup];

  BOOL v5 = [(RCMainViewController *)self navigationItem];
  [v5 setBackButtonTitle:@" "];

  id v6 = [(RCMainViewController *)self mainControllerHelper];
  [v6 startMonitoringFinalizingRecordings];
}

- (void)updatePlaybackContentUnavailableViewIfNeeded
{
  id v3 = [(RCMainViewController *)self playbackViewController];

  if (v3)
  {
    BOOL v4 = [(RCMainViewController *)self browseFoldersViewController];
    id v13 = [v4 activeRecordingsCollectionViewController];

    BOOL v5 = [v13 recordingsDataCoordinator];
    id v6 = [v5 recordingDataArray];
    id v7 = [v6 count];

    v8 = [(RCMainViewController *)self playbackViewController];
    id v9 = [v8 uuidBeingDisplayed];

    if ([v13 isEditing]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = (v7 != 0) & ~[v13 willSelectRecordingAfterExitingEditMode];
    }
    if (v9) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = v10;
    }
    v12 = [(RCMainViewController *)self playbackViewController];
    [v12 updateContentUnavailableViewState:v11];
  }
}

- (RCPlaybackViewController)playbackViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackViewController);

  return (RCPlaybackViewController *)WeakRetained;
}

- (void)_commonInit
{
  id v19 = (id)objc_opt_new();
  [v19 setLibraryActionHandler:self];
  [v19 setRecordingViewControllerDelegate:self];
  [v19 setSelectionDelegate:self];
  [v19 setBrowsingDelegate:self];
  [(RCMainViewController *)self setBrowseFoldersViewController:v19];
  [(RCMainViewController *)self addChildViewController:v19];
  [v19 didMoveToParentViewController:self];
  id v3 = (RCMainControllerHelper *)objc_opt_new();
  mainControllerHelper = self->_mainControllerHelper;
  self->_mainControllerHelper = v3;

  [(RCMainControllerHelper *)self->_mainControllerHelper setDelegate:self];
  BOOL v5 = +[RCRecordingsModelInteractor sharedRecordingsModelInteractor];
  recordingsModelInteractor = self->_recordingsModelInteractor;
  self->_recordingsModelInteractor = v5;

  id v7 = (RCUndoManager *)objc_opt_new();
  currentUndoManager = self->_currentUndoManager;
  self->_currentUndoManager = v7;

  [v19 setUndoManager:self->_currentUndoManager];
  [(RCMainViewController *)self setDefinesPresentationContext:1];
  id v9 = (NSMutableDictionary *)objc_opt_new();
  editingProgressItems = self->_editingProgressItems;
  self->_editingProgressItems = v9;

  uint64_t v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  v12 = [v11 createNewFolderImage];

  id v13 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v12 style:0 target:self action:"_handleNewFolder"];
  createNewFolderButtonItem = self->_createNewFolderButtonItem;
  self->_createNewFolderButtonItem = v13;

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"AX_NEW_FOLDER" value:&stru_100228BC8 table:0];
  [(UIBarButtonItem *)self->_createNewFolderButtonItem setAccessibilityLabel:v16];

  v17 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:self action:0];
  flexBarItem = self->_flexBarItem;
  self->_flexBarItem = v17;
}

- (id)contentScrollView
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 collectionViewIfLoaded];

  return v3;
}

- (RCFolderBrowsingCollectionViewController)browseFoldersViewController
{
  return self->_browseFoldersViewController;
}

- (double)currentTime
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (BOOL)isPlayingForUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCMainViewController *)self mainControllerHelper];
  unsigned __int8 v6 = [v5 isPlayingForUUID:v4];

  return v6;
}

- (RCMainControllerHelper)mainControllerHelper
{
  return self->_mainControllerHelper;
}

- (void)setPlaybackViewController:(id)a3
{
}

- (void)setMainViewControllerDelegate:(id)a3
{
}

- (void)setBrowseFoldersViewController:(id)a3
{
}

- (id)foregroundCompletionBlock
{
  return self->_foregroundCompletionBlock;
}

- (VMAudioRecorder)audioRecorder
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  double v3 = [v2 audioRecorder];

  return (VMAudioRecorder *)v3;
}

- (VMAudioPlayer)audioPlayer
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  double v3 = [v2 audioPlayer];

  return (VMAudioPlayer *)v3;
}

- (id)recordingInProgressUUID
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  double v3 = [v2 recordingInProgressUUID];

  return v3;
}

- (void)openSidebar
{
  id v2 = [(RCMainViewController *)self splitViewController];
  [v2 showColumn:0];
}

- (void)closeSidebar
{
  double v3 = [(RCMainViewController *)self splitViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(RCMainViewController *)self splitViewController];
    if ([v6 isCollapsedAndShowingPrimary])
    {
      [(RCMainViewController *)self goToAllRecordingsIfNeeded:1 completion:0];
    }
    else if (([v6 isCollapsed] & 1) == 0)
    {
      BOOL v5 = [(RCMainViewController *)self splitViewController];
      [v5 hideColumn:0];
    }
  }
}

- (void)goToFolderOfType:(int64_t)a3 withName:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v13 = a4;
  id v10 = a6;
  uint64_t v11 = [(RCMainViewController *)self browseFoldersViewController];
  v12 = v11;
  if (a3 == 4) {
    [v11 goToUserFolderWithName:v13 animated:v7 completion:v10];
  }
  else {
    [v11 goToBuiltInFolderOfType:a3 animated:v7 completion:v10];
  }
}

- (id)activeFolderViewController
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  double v3 = [v2 currentActiveFolderViewController];

  return v3;
}

- (RCPlaybackSettings)playbackSettings
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  double v3 = [v2 currentRecordingDisplayModel];
  id v4 = [v3 UUID];

  if (v4)
  {
    BOOL v5 = [v2 playbackSettingsForUUID:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (RCPlaybackSettings *)v5;
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 1)
    {
      id v9 = v8;
      [(RCMainViewController *)self _transitionToCaptureAndModifyWithOptions:a4 completion:v8];
    }
    else
    {
      if (a3) {
        goto LABEL_7;
      }
      id v9 = v8;
      [(RCMainViewController *)self _transitionToBrowsing:v8];
    }
    id v8 = v9;
  }
LABEL_7:
}

- (void)setForegroundCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_foregroundCompletionBlock)
  {
    BOOL v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10016DEAC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  id v13 = [v4 copy];
  id foregroundCompletionBlock = self->_foregroundCompletionBlock;
  self->_id foregroundCompletionBlock = v13;

  unsigned int v15 = [(RCMainViewController *)self isInForeground];
  if (v4 && v15)
  {
    v4[2](v4);
    id v16 = self->_foregroundCompletionBlock;
    self->_id foregroundCompletionBlock = 0;
  }
}

- (BOOL)isRecording
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  unsigned __int8 v3 = [v2 isRecording];

  return v3;
}

- (BOOL)isSilencing
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  unsigned __int8 v3 = [v2 isSilencing];

  return v3;
}

- (RCMainViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCMainViewController;
  unsigned __int8 v3 = [(RCMainViewController *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(RCMainViewController *)v3 _commonInit];
  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)RCMainViewController;
  [(RCMainViewController *)&v6 loadView];
  unsigned __int8 v3 = objc_opt_new();
  [(RCMainViewController *)self setView:v3];
  [(RCMainViewController *)self _styleView];
  id v4 = [(RCMainViewController *)self navigationItem];
  [v4 setBackButtonTitle:@" "];

  BOOL v5 = [(RCMainViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RCMainViewController *)self browseFoldersViewController];
  objc_super v6 = [v5 view];
  uint64_t v7 = [(RCMainViewController *)self view];
  [v7 setBrowseFoldersView:v6];

  self->_viewIsAppearingOrDisappearing = 1;
  v9.receiver = self;
  v9.super_class = (Class)RCMainViewController;
  [(RCMainViewController *)&v9 viewWillAppear:v3];
  [(RCMainViewController *)self _styleView];
  uint64_t v8 = [(RCMainViewController *)self navigationController];
  [v8 setToolbarHidden:0 animated:0];

  [(RCMainViewController *)self _updateToolbar];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCMainViewController;
  [(RCMainViewController *)&v4 viewDidAppear:a3];
  self->_viewIsAppearingOrDisappearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_viewIsAppearingOrDisappearing = 1;
  v3.receiver = self;
  v3.super_class = (Class)RCMainViewController;
  [(RCMainViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCMainViewController;
  [(RCMainViewController *)&v4 viewDidDisappear:a3];
  self->_viewIsAppearingOrDisappearing = 0;
}

- (void)_updateToolbar
{
  objc_super v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v3 sidebarHasTransparentNavigationBar])
  {
    objc_super v4 = [(RCMainViewController *)self navigationController];
    BOOL v5 = [v4 navigationBar];
    [v5 setBarStyle:4];

    id v6 = objc_alloc_init((Class)UIImage);
    uint64_t v7 = [(RCMainViewController *)self navigationController];
    uint64_t v8 = [v7 navigationBar];
    [v8 setShadowImage:v6];

    objc_super v9 = [(RCMainViewController *)self navigationController];
    uint64_t v10 = [v9 toolbar];
    [v10 setBarStyle:4];

    id v11 = objc_alloc_init((Class)UIImage);
    uint64_t v12 = [(RCMainViewController *)self navigationController];
    id v13 = [v12 toolbar];
    [v13 setShadowImage:v11 forToolbarPosition:0];

    v14 = [(RCMainViewController *)self navigationController];
    unsigned int v15 = [v14 toolbar];
    id v16 = [v3 sidebarNavBarNewFolderImageTintColor];
    [v15 setTintColor:v16];
  }
  else
  {
    id v6 = [v3 recordingCardBottomAccessoryBackgroundColor];
    id v11 = [(RCMainViewController *)self navigationController];
    v14 = [v11 toolbar];
    [v14 setBarTintColor:v6];
  }

  v17 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v18 = [v17 isEditing];

  if (v18)
  {
    [(RCMainViewController *)self setToolbarItems:0 animated:1];
  }
  else
  {
    id v19 = [(RCMainViewController *)self flexBarItem];
    v22[0] = v19;
    v20 = [(RCMainViewController *)self createNewFolderButtonItem];
    v22[1] = v20;
    v21 = +[NSArray arrayWithObjects:v22 count:2];
    [(RCMainViewController *)self setToolbarItems:v21 animated:1];
  }
}

- (void)_handleNewFolder
{
}

- (void)restyle
{
  [(RCMainViewController *)self _restyleCardViewAndReparentIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  [WeakRetained restyle];

  objc_super v4 = [(RCMainViewController *)self playbackViewController];
  [v4 restyle];

  BOOL v5 = [(RCMainViewController *)self presentedCardViewController];
  id v6 = [v5 view];
  [v6 restyle];

  uint64_t v7 = [(RCMainViewController *)self browseFoldersViewController];
  [v7 restyle];

  [(RCMainViewController *)self _styleView];
  [(RCMainViewController *)self _updateRecordingViewStatusBarHeight];

  [(RCMainViewController *)self updateLibraryViewInEditModeForMedusa];
}

- (void)willTransitionFromHorizontalSizeClass:(int64_t)a3 toHorizontalSizeClass:(int64_t)a4
{
  [(RCMainViewController *)self updatePlaybackSettings];
  BOOL v5 = [(RCMainViewController *)self presentedPlaybackSettingsViewController];

  if (v5) {
    [(RCMainViewController *)self hidePlaybackSettingsViewController];
  }
  id v6 = +[RCShareMemoViewController presentedController];

  if (v6)
  {
    id v7 = [(RCMainViewController *)self presentedViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)updateLibraryViewInEditModeForMedusa
{
  objc_super v3 = [(RCMainViewController *)self browseFoldersViewController];
  objc_super v4 = [v3 recordingViewController];
  unsigned int v5 = [v4 isEditing];

  if (v5)
  {
    id v7 = [(RCMainViewController *)self browseFoldersViewController];
    id v6 = [v7 activeRecordingsCollectionViewController];
    [v6 updateToolbarAndFooterView];
  }
}

- (void)_restyleCardViewAndReparentIfNeeded
{
  objc_super v3 = +[UIApplication sharedApplication];
  id v4 = [v3 applicationState];

  if (v4 != (id)2)
  {
    [(RCMainViewController *)self _restyleRecordingCardSheetPresentationController];
    id v6 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v5 = [v6 recordingViewController];
    [v5 restyle];
  }
}

- (void)_styleView
{
  id v12 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (([v12 usesLargeTitles] & 1) == 0)
  {
    id v3 = [objc_alloc((Class)_UINavigationBarTitleView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v4 = [(RCMainViewController *)self splitViewController];
    if ([v4 splitBehavior] == (id)1)
    {
      unsigned __int8 v5 = [v12 sidebarPresentsWithGesture];

      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    [v3 setHideBackButton:1];
    [v3 setHeight:0.0];
LABEL_7:
    [v3 setHideStandardTitle:1];
    [v3 setHideLeadingBarButtons:1];
    [v3 setHideTrailingBarButtons:1];
    id v6 = [(RCMainViewController *)self navigationItem];
    [v6 setLargeTitleDisplayMode:2];

    id v7 = [(RCMainViewController *)self navigationItem];
    [v7 setTitleView:v3];
  }
  uint64_t v8 = [(RCMainViewController *)self navigationItem];
  if ([v12 usesLargeTitles])
  {
    [v8 setLargeTitleDisplayMode:1];
    objc_super v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"DEFAULT_NAVIGATION_TITLE" value:&stru_100228BC8 table:0];
    [v8 setTitle:v10];

    [v8 _setSupportsTwoLineLargeTitles:1];
  }
  id v11 = [(RCMainViewController *)self view];
  [v11 restyle];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RCMainViewController;
  id v7 = a4;
  -[RCMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A4054;
  v8[3] = &unk_100221960;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)doActionEditRecordingInSharingSheetWithUUID:(id)a3
{
}

- (id)selectedComposition
{
  id v3 = [(RCMainControllerHelper *)self->_mainControllerHelper currentRecordingDisplayModel];
  id v4 = [v3 UUID];

  unsigned __int8 v5 = [(RCMainControllerHelper *)self->_mainControllerHelper compositionForUUID:v4];

  return v5;
}

- (void)saveAsNewDoneButtonAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCMainViewController *)self mainControllerHelper];
  [v4 doneButtonShouldSaveAsNew:v3];
}

- (void)_transitionToBrowsing:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(RCMainViewController *)self mainControllerHelper];
  [v5 exitEditMode];

  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_1000A43D8;
  v26 = &unk_100222A98;
  double v27 = self;
  id v28 = v4;
  id v6 = v4;
  [(RCMainViewController *)self _dismissCardView:&v23];
  id v7 = [(RCMainViewController *)self browseFoldersViewController];
  uint64_t v8 = [v7 recordingViewController];

  objc_super v9 = [v8 uuidBeingDisplayed];
  uint64_t v10 = [(RCMainViewController *)self browseFoldersViewController];
  id v11 = [v10 recordingViewController];
  [v11 reset];

  id v12 = [(RCMainViewController *)self browseFoldersViewController];
  id v13 = [v12 selectedRecording];
  id v14 = [v13 uuid];

  unsigned int v15 = [(RCMainViewController *)self mainControllerHelper];
  LODWORD(v13) = [v15 shouldSaveAsNew];

  if (v13)
  {
    id v16 = [(RCMainViewController *)self recordingsModelInteractor];
    v17 = [v16 mostRecentRecording];
    unsigned int v18 = [v17 uuid];

    id v19 = v18;
    v20 = [(RCMainViewController *)self browseFoldersViewController];
    v21 = [v20 activeRecordingsCollectionViewController];

    [v21 prepareForAdditionOfNewRecordingWithUUID:v19];
    [(RCMainViewController *)self selectRecordingWithUUID:v19 returnToBrowse:1];

    [v21 scrollToTop];
    id v14 = v19;
  }
  if (!v14)
  {
    BOOL v22 = [(RCMainViewController *)self mainControllerHelper];
    id v14 = [v22 uuidOfPlayingRecording];

    if (!v14) {
      id v14 = v9;
    }
  }
  [(RCMainViewController *)self didSelectForUUID:v14 resetPosition:0 force:1];
  [(RCMainViewController *)self _updateToolbarTranscriptionButtonState];
}

- (void)_transitionToCaptureAndModifyWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)_presentCardViewWithOptions:(unint64_t)a3 completion:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [(RCMainViewController *)self presentedCardViewController];

  if (!v7)
  {
    uint64_t v8 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v9 = [v8 shouldHidePrimaryColumnInEditView];
    uint64_t v10 = [(RCMainViewController *)self splitViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v9)
    {
      id v12 = [(RCMainViewController *)self splitViewController];
      [v12 hidePrimaryColumnForEnteringEditModeIfNeeded];
    }
    id v13 = [v8 animatesRecordingCardPresentation];
    id v14 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v15 = [v14 currentActiveFolderViewController];

    v41 = v15;
    v40 = [v15 recordingsCollectionViewController];
    [v40 setEditing:0 animated:v13];
    id v16 = [(RCMainViewController *)self browseFoldersViewController];
    v17 = [v16 recordingViewController];

    unsigned int v18 = [v17 view];
    unsigned int v19 = [v8 supportsCompactRecordingCard];
    char v20 = v4 & 1;
    [v18 prepareForPresent:v4 & 1 | ((v19 & 1) == 0)];
    [(RCMainViewController *)self _updateRecordingViewStatusBarHeight];
    v21 = [[RCRecordingCardViewController alloc] initWithNibName:0 bundle:0];
    [(RCMainViewController *)self setPresentedCardViewController:v21];
    [(RCRecordingCardViewController *)v21 setTransitioningDelegate:self];
    [(RCMainViewController *)self setDefinesPresentationContext:1];
    [(RCRecordingCardViewController *)v21 setModalInPresentation:1];
    if ([v8 supportsSheetPresentationSPI])
    {
      if (v19)
      {
        [v18 intrinsicHeightForCompactView];
        [(RCMainViewController *)self _styleRecordingCardSheetPresentationControllerWithOptions:[(RCMainViewController *)self _cardSheetOptionsForDefaultRecordingView] customDetentHeight:v22];
        if ((v4 & v19) != 0) {
          [(RCMainViewController *)self _selectLargeDetentOnRecordingCardSheetPresentationController];
        }
      }
      else
      {
        [(RCMainViewController *)self _styleRecordingCardSheetPresentationControllerWithOptions:[(RCMainViewController *)self _cardSheetOptionsForDefaultRecordingView] customDetentHeight:0.0];
      }
    }
    else
    {
      [(RCRecordingCardViewController *)v21 setModalPresentationStyle:5];
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000A495C;
    v49[3] = &unk_100222E58;
    v23 = v21;
    v50 = v23;
    id v24 = v17;
    id v51 = v24;
    id v25 = v18;
    id v52 = v25;
    id v26 = v8;
    char v56 = v20;
    id v53 = v26;
    v54 = self;
    id v55 = v6;
    double v27 = objc_retainBlock(v49);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000A4B64;
    v46[3] = &unk_100221C38;
    id v28 = v25;
    id v47 = v28;
    v48 = self;
    v29 = objc_retainBlock(v46);
    [(RCMainViewController *)self presentViewController:v23 animated:v13 completion:0];
    v30 = [(RCRecordingCardViewController *)v23 transitionCoordinator];

    id v37 = v26;
    v39 = v24;
    if (v30)
    {
      id v31 = [(RCRecordingCardViewController *)v23 transitionCoordinator];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000A4BA0;
      v44[3] = &unk_100222DA8;
      v45 = v27;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000A4BB0;
      v42[3] = &unk_100222DA8;
      v43 = v29;
      [v31 animateAlongsideTransition:v44 completion:v42];
    }
    else
    {
      ((void (*)(void *))v27[2])(v27);
      ((void (*)(void *))v29[2])(v29);
    }
    v32 = [(RCMainViewController *)self undoManager];
    [(RCMainViewController *)self setMainUndoManager:v32];

    v33 = [(RCRecordingCardViewController *)v23 undoManager];
    currentUndoManager = self->_currentUndoManager;
    self->_currentUndoManager = v33;

    v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:self selector:"updateUndoButtonStateFromUndoManager" name:NSUndoManagerDidUndoChangeNotification object:self->_currentUndoManager];

    v36 = +[NSNotificationCenter defaultCenter];
    [v36 addObserver:self selector:"updateUndoButtonStateFromUndoManager" name:NSUndoManagerDidRedoChangeNotification object:self->_currentUndoManager];
  }
}

- (void)_displayMultiLayerAlertIfNeeded
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"RCLayeredRecordingsSyncAlertWasDismissed"];
  if (RCOverdubRecordingIsEnabled())
  {
    if ((v4 & 1) == 0)
    {
      unsigned __int8 v5 = [(RCMainViewController *)self mainControllerHelper];
      unsigned int v6 = [v5 willMigrateFromSingleLayerToMultiLayer];

      if (v6)
      {
        id v7 = +[NSBundle mainBundle];
        uint64_t v8 = [v7 localizedStringForKey:@"NEW_LAYERED_RECORDING_ALERT_TITLE" value:&stru_100228BC8 table:0];

        unsigned int v9 = +[NSBundle mainBundle];
        uint64_t v10 = [v9 localizedStringForKey:@"NEW_LAYERED_RECORDING_ALERT_MESSAGE" value:&stru_100228BC8 table:0];

        id v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472;
        id v14 = sub_1000A4D40;
        unsigned int v15 = &unk_100221C38;
        id v16 = v3;
        v17 = self;
        id v11 = +[UIAlertController rc_OKAlertControllerWithTitle:v8 message:v10 handler:&v12];
        [v11 rc_showInMainWindow:v12, v13, v14, v15];
      }
    }
  }
}

- (id)_recordingCardSheetPresentationController
{
  id v2 = [(RCMainViewController *)self presentedCardViewController];
  BOOL v3 = [v2 presentationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)_restyleRecordingCardSheetPresentationController
{
  BOOL v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v15 = [v3 recordingViewController];

  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v5 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  if (v5)
  {
    unsigned int v6 = [v15 view];
    unsigned int v7 = [v4 supportsCompactRecordingCard];
    double v8 = 0.0;
    if (v7)
    {
      [v6 intrinsicHeightForCompactView];
      double v8 = v9;
    }
    uint64_t v10 = [(RCMainViewController *)self browseFoldersViewController];
    id v11 = [v10 recordingViewController];
    id v12 = [v11 view];
    id v13 = [v12 recordingViewState];

    if (v13 == (id)8) {
      unint64_t v14 = [(RCMainViewController *)self _cardSheetOptionsForLargeDetentOnly];
    }
    else {
      unint64_t v14 = [(RCMainViewController *)self _cardSheetOptionsForDefaultRecordingView];
    }
    [(RCMainViewController *)self _styleSheetPresentationController:v5 options:v14 customDetentHeight:v8];
    if (v7) {
      [(RCMainViewController *)self _selectLargeDetentOnSheetPresentationController:v5];
    }
  }
}

- (void)_styleRecordingCardSheetPresentationControllerWithOptions:(unint64_t)a3 customDetentHeight:(double)a4
{
  unsigned int v7 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  if (v7)
  {
    double v8 = v7;
    [(RCMainViewController *)self _styleSheetPresentationController:v7 options:a3 customDetentHeight:a4];
    unsigned int v7 = v8;
  }
}

- (void)_styleSheetPresentationController:(id)a3 options:(unint64_t)a4 customDetentHeight:(double)a5
{
  id v7 = a3;
  double v8 = +[UISheetPresentationControllerDetent largeDetent];
  v17 = v8;
  double v9 = +[NSArray arrayWithObjects:&v17 count:1];

  if (a4)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A51B4;
    v14[3] = &unk_100222E78;
    *(double *)&v14[4] = a5;
    uint64_t v10 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"RCRecordingCardCustomDetent" resolver:v14];
    id v11 = (void *)v10;
    if ((a4 & 2) != 0)
    {
      v16[0] = v10;
      uint64_t v13 = +[UISheetPresentationControllerDetent largeDetent];
      v16[1] = v13;
      uint64_t v12 = +[NSArray arrayWithObjects:v16 count:2];

      double v9 = (void *)v13;
    }
    else
    {
      uint64_t v15 = v10;
      uint64_t v12 = +[NSArray arrayWithObjects:&v15 count:1];
    }

    double v9 = (void *)v12;
  }
  [v7 setDetents:v9];
  [v7 setPrefersGrabberVisible:(a4 >> 2) & 1];
  [v7 _setWantsFullScreen:(a4 >> 3) & 1];
}

- (unint64_t)_cardSheetOptionsForDefaultRecordingView
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v3 = [v2 supportsCompactRecordingCard];

  if (v3) {
    return 7;
  }
  else {
    return 10;
  }
}

- (unint64_t)_cardSheetOptionsForLargeDetentOnly
{
  id v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v3 = [v2 supportsCompactRecordingCard];

  if (v3) {
    return 2;
  }
  else {
    return 10;
  }
}

- (void)_expandPresentedCompactRecordingCard
{
  id v5 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  unsigned int v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v4 = [v3 supportsCompactRecordingCard];

  if (v5 && v4)
  {
    [(RCMainViewController *)self _selectLargeDetentOnSheetPresentationController:v5];
    [(RCMainViewController *)self __animateRecordingCardDetentTransitionForSheetPresentationController:v5];
  }
}

- (void)_collapsePresentedCompactRecordingCard
{
  id v5 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  unsigned int v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v4 = [v3 supportsCompactRecordingCard];

  if (v5 && v4)
  {
    [v5 setSelectedDetentIdentifier:@"RCRecordingCardCustomDetent"];
    [(RCMainViewController *)self __animateRecordingCardDetentTransitionForSheetPresentationController:v5];
  }
}

- (void)__animateRecordingCardDetentTransitionForSheetPresentationController:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v5 = [v4 expandCompactRecordingCardPropertyAnimator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A544C;
  v7[3] = &unk_100221278;
  id v8 = v3;
  id v6 = v3;
  [v5 addAnimations:v7];
  [v5 startAnimation];
}

- (void)_transitionPresentedCompactRecordingCardToTrimMode:(BOOL)a3
{
}

- (void)_updateSheetPresentationOptions:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  if (v13)
  {
    id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v6 = [v5 supportsCompactRecordingCard];

    id v7 = [(RCMainViewController *)self browseFoldersViewController];
    id v8 = [v7 recordingViewController];
    double v9 = [v8 view];

    double v10 = 0.0;
    if (v6)
    {
      [v9 intrinsicHeightForCompactView];
      double v10 = v11;
    }
    if (v3) {
      unint64_t v12 = [(RCMainViewController *)self _cardSheetOptionsForLargeDetentOnly];
    }
    else {
      unint64_t v12 = [(RCMainViewController *)self _cardSheetOptionsForDefaultRecordingView];
    }
    [(RCMainViewController *)self _styleSheetPresentationController:v13 options:v12 customDetentHeight:v10];
    if (v6) {
      [(RCMainViewController *)self _selectLargeDetentOnSheetPresentationController:v13];
    }
  }
}

- (void)_selectLargeDetentOnRecordingCardSheetPresentationController
{
  BOOL v3 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  if (v3)
  {
    unsigned int v4 = v3;
    [(RCMainViewController *)self _selectLargeDetentOnSheetPresentationController:v3];
    BOOL v3 = v4;
  }
}

- (void)_selectLargeDetentOnSheetPresentationController:(id)a3
{
}

- (void)_showGrabberOnRecordingCardSheetPresentationController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  if (v5)
  {
    unsigned int v6 = v5;
    [(RCMainViewController *)self _showGrabberOnSheetPresentationController:v5 showGrabber:v3];
    id v5 = v6;
  }
}

- (void)_showGrabberOnSheetPresentationController:(id)a3 showGrabber:(BOOL)a4
{
}

- (void)recordingView:(id)a3 didUpdateViewHeight:(double)a4
{
  id v6 = a3;
  id v7 = [(RCMainViewController *)self _recordingCardSheetPresentationController];
  id v8 = v7;
  if (v7)
  {
    double v9 = [v7 detents];
    id v10 = [v9 count];

    unint64_t v11 = (unint64_t)[v6 displayStyle];
    if (v10 == (id)2)
    {
      unint64_t v12 = v11;
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        [v6 intrinsicHeightForCompactView];
        double v14 = v13;
        uint64_t v15 = +[UIApplication sharedApplication];
        id v16 = [v15 delegate];
        v17 = [v16 window];
        [v17 safeAreaInsets];
        double v19 = v14 + v18;

        char v20 = [v6 window];
        [v20 bounds];
        double v22 = v21;
        v23 = [v6 window];
        _UISheetMinimumTopInset();
        double v25 = v22 - v24;

        double v26 = (a4 - v19) / (v25 - v19);
        double v27 = [v8 selectedDetentIdentifier];
        unsigned int v28 = [v27 isEqualToString:UISheetPresentationControllerDetentIdentifierLarge];

        BOOL v30 = v26 >= 1.0 || v26 <= 0.5 || v28 == 0;
        if (!v30 && [v6 transcriptViewState] == (id)1) {
          [v6 setTranscriptViewState:0];
        }
        if (v26 > 0.5) {
          uint64_t v31 = 2;
        }
        else {
          uint64_t v31 = 1;
        }
        [(RCMainViewController *)self setSheetPresentationState:v31];
        BOOL v32 = v12 == 3;
        if (v26 > 0.5)
        {
          BOOL v33 = 0;
        }
        else
        {
          BOOL v32 = 0;
          BOOL v33 = v12 == 2;
        }
        if (!v33 && !v32)
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1000A5924;
          v34[3] = &unk_100221278;
          id v35 = v6;
          +[UIView performWithoutAnimation:v34];
        }
      }
    }
  }
}

- (void)goToAllRecordingsIfNeeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v13 = (void (**)(void))a4;
  id v6 = [(RCMainViewController *)self browseFoldersViewController];
  id v7 = [v6 currentActiveFolderViewController];
  id v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  unsigned int v9 = [v7 supportsRecording];
  id v10 = [v8 folderType];
  int v11 = !v4;
  if (!v10) {
    int v11 = 1;
  }
  if (v9 && v11)
  {
    if (v13) {
      v13[2]();
    }
  }
  else
  {
LABEL_8:
    unint64_t v12 = [(RCMainViewController *)self browseFoldersViewController];
    [v12 goToBuiltInFolderOfType:0 animated:0 completion:v13];
  }
}

- (void)goToRecentlyDeletedIfNeededWithCompletion:(id)a3
{
  id v8 = (void (**)(void))a3;
  BOOL v4 = [(RCMainViewController *)self browseFoldersViewController];
  id v5 = [v4 currentActiveFolderViewController];
  id v6 = [v5 folderType];
  if (v5 && v6 == (id)3)
  {
    if (v8) {
      v8[2]();
    }
  }
  else
  {
    id v7 = [(RCMainViewController *)self browseFoldersViewController];
    [v7 goToBuiltInFolderOfType:3 animated:0 completion:v8];
  }
}

- (void)_updateRecordingViewStatusBarHeight
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v3 = [v2 recordingViewController];
  id v12 = [v3 view];

  BOOL v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];
  id v6 = [v5 window];
  [v6 safeAreaInsets];
  double v8 = v7;

  unsigned int v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v9 topMarginMinSafeAreaTopInsetForCardView];
  if (v8 < v10) {
    double v8 = v10;
  }
  [v9 topMarginForCardView];
  [v12 setStatusBarHeight:v11 + v8];
}

- (BOOL)toggleRecording
{
  BOOL v3 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v4 = [v3 currentActiveFolderViewController];
  id v5 = [v4 recordingsCollectionViewController];

  id v6 = [(RCMainViewController *)self browseFoldersViewController];
  if ([v6 isShowingRecentlyDeleted])
  {

LABEL_4:
    UIAccessibilityNotifications v8 = UIAccessibilityAnnouncementNotification;
    unsigned int v9 = +[NSBundle mainBundle];
    double v10 = [v9 localizedStringForKey:@"AX_RECORDING_UNAVAILABLE" value:&stru_100228BC8 table:0];
    UIAccessibilityPostNotification(v8, v10);

    BOOL v11 = 0;
    goto LABEL_9;
  }
  unsigned __int8 v7 = [v5 isEditing];

  if (v7) {
    goto LABEL_4;
  }
  id v12 = [(RCMainViewController *)self mainControllerHelper];
  unsigned int v13 = [v12 isRecording];

  if (v13) {
    [(RCMainViewController *)self endRecording];
  }
  else {
    [(RCMainViewController *)self performAction:3 atPosition:0 forUUID:0 sourceController:0 source:0.0];
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (void)_startCapturing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(void))a4;
  UIAccessibilityNotifications v8 = [(RCMainViewController *)self mainControllerHelper];
  unsigned int v9 = [v8 isRecording];

  if (v9)
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A5DFC;
    v10[3] = &unk_1002221D0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(RCMainViewController *)self goToAllRecordingsIfNeeded:0 completion:v10];
  }
}

- (void)pauseRecording
{
  BOOL v3 = [(RCMainViewController *)self mainControllerHelper];
  [v3 pauseCapturing];

  [(RCMainViewController *)self updateUndoButtonStateFromUndoManager];
}

- (void)resumeRecording:(unint64_t)a3
{
  id v4 = [(RCMainViewController *)self mainControllerHelper];
  [v4 resumeCapturing:a3];
}

- (void)replaceRecording:(unint64_t)a3
{
  id v4 = [(RCMainViewController *)self mainControllerHelper];
  [v4 replaceCapturing:a3];
}

- (void)endRecording
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  [v2 stopCapturing];
}

- (void)endEditing
{
  if ((id)[(RCMainViewController *)self state] == (id)1)
  {
    BOOL v3 = [(RCMainViewController *)self browseFoldersViewController];
    id v4 = [v3 recordingViewController];
    id v5 = [v4 view];
    id v6 = [v5 recordingViewState];

    if (v6 == (id)8) {
      [(RCMainViewController *)self cancelTrimMode];
    }
  }

  [(RCMainViewController *)self setState:0];
}

- (void)playRecordingWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  id v6 = [v5 recordingViewController];
  unsigned __int8 v7 = [v6 uuidBeingDisplayed];
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if ((v8 & 1) == 0) {
    [(RCMainViewController *)self endEditing];
  }
  unsigned int v9 = [(RCMainViewController *)self mainControllerHelper];
  [v9 playbackForUUID:v4 atPosition:0.0];

  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A62D8;
  v28[3] = &unk_1002220C0;
  objc_copyWeak(&v30, &location);
  id v10 = v4;
  id v29 = v10;
  id v11 = objc_retainBlock(v28);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000A6418;
  v25[3] = &unk_100222EA0;
  objc_copyWeak(&v27, &location);
  id v12 = v11;
  id v26 = v12;
  unsigned int v13 = objc_retainBlock(v25);
  double v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  char v20 = sub_1000A6534;
  double v21 = &unk_1002221D0;
  double v22 = self;
  id v14 = v10;
  id v23 = v14;
  uint64_t v15 = v13;
  id v24 = v15;
  id v16 = objc_retainBlock(&v18);
  v17 = [(RCMainViewController *)self presentedCardViewController];

  if (v17) {
    ((void (*)(void ***))v16[2])(v16);
  }
  else {
    [(RCMainViewController *)self dismissViewControllerAnimated:0 completion:v16];
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)exitTrimMode
{
  BOOL v3 = [(RCMainViewController *)self mainControllerHelper];
  [v3 exitTrimMode];

  [(RCMainViewController *)self updateUndoButtonStateFromUndoManager];

  [(RCMainViewController *)self _transitionPresentedCompactRecordingCardToTrimMode:0];
}

- (void)shouldEnableTrimSave:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v5 recordingViewController];
  [v4 updateTrimSaveState:v3];
}

- (void)enableUndoFirstResponder
{
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v4 = [v3 supportsMainViewControllerUndo];

  if (v4)
  {
    [(RCMainViewController *)self becomeFirstResponder];
  }
  else
  {
    id v5 = [(RCMainViewController *)self presentedCardViewController];
    [v5 becomeFirstResponder];
  }
}

- (void)didUpdateToStatus:(int)a3 progress:(float)a4 forRecordingWithUUID:(id)a5
{
  id v8 = a5;
  unsigned int v9 = v8;
  if (a3 == 1)
  {
    id v18 = v8;
    id v10 = [(RCMainViewController *)self editingProgressItems];
    id v11 = [v10 objectForKeyedSubscript:v18];

    if (!v11)
    {
      id v11 = objc_opt_new();
      [v11 setDelegate:self];
      [v11 setUUID:v18];
      unsigned int v13 = [(RCMainViewController *)self editingProgressItems];
      [v13 setObject:v11 forKeyedSubscript:v18];

      id v14 = [(RCMainViewController *)self mainControllerHelper];
      [v14 stopForUUID:v18];
    }
    *(float *)&double v12 = a4;
    [v11 setProgress:v12];
    if ([v11 hasMetTimeThreshold])
    {
      *(float *)&double v15 = a4;
      [(RCMainViewController *)self _updateControllersToEditingInFlight:1 progress:v18 forUUID:v15];
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_10;
    }
    id v18 = v8;
    id v16 = [(RCMainViewController *)self editingProgressItems];
    [v16 removeObjectForKey:v18];

    LODWORD(v17) = 1.0;
    [(RCMainViewController *)self _updateControllersToEditingInFlight:0 progress:v18 forUUID:v17];
  }
  unsigned int v9 = v18;
LABEL_10:
}

- (BOOL)isQuickRecordingWorkflowDismissal
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v3 = [v2 recordingViewController];
  unsigned int v4 = [v3 view];
  BOOL v5 = [v4 displayStyle] == (id)2;

  return v5;
}

- (void)backupTimerFiredForUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCMainViewController *)self editingProgressItems];
  id v10 = [v5 objectForKeyedSubscript:v4];

  if (v10)
  {
    [v10 progress];
    int v7 = v6;
    id v8 = [v10 UUID];
    LODWORD(v9) = v7;
    [(RCMainViewController *)self _updateControllersToEditingInFlight:1 progress:v8 forUUID:v9];
  }
}

- (void)_updateControllersToEditingInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  double v9 = [(RCMainViewController *)self browseFoldersViewController];
  id v10 = [v9 activeRecordingsCollectionViewController];
  *(float *)&double v11 = a4;
  [v10 editingIsInFlight:v6 progress:v8 forUUID:v11];

  double v12 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v13 = [v12 recordingViewController];
  *(float *)&double v14 = a4;
  [v13 updateToEditingInFlight:v6 progress:v8 forUUID:v14];

  id v16 = [(RCMainViewController *)self playbackViewController];
  *(float *)&double v15 = a4;
  [v16 updateToEditingInFlight:v6 progress:v8 forUUID:v15];
}

- (id)_stringForAudioEditingStatus:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return *(&off_100223130 + a3);
  }
}

- (BOOL)isShowingRecentlyDeleted
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v3 = [v2 isShowingRecentlyDeleted];

  return v3;
}

- (BOOL)canSwipeToNavigateBack
{
  int64_t v3 = [(RCMainViewController *)self state];
  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v5 = [v4 currentActiveFolderViewController];

  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  return !v6;
}

- (void)updateUndoButtonStateFromUndoManager
{
  BOOL v3 = [(RCUndoManager *)self->_currentUndoManager canUndo];
  id v4 = [(RCMainViewController *)self mainControllerHelper];
  BOOL v5 = [v4 audioRecorder];
  id v6 = [v5 isNewRecording];

  id v8 = [(RCMainViewController *)self browseFoldersViewController];
  int v7 = [v8 recordingViewController];
  [v7 updateUndoState:v3 isNewRecording:v6];
}

- (void)willBeginDragSession
{
  unint64_t activeDragSessionCount = self->_activeDragSessionCount;
  if (!activeDragSessionCount)
  {
    id v4 = [(RCMainViewController *)self playbackViewController];
    [v4 enableWaveformScrolling:0];

    unint64_t activeDragSessionCount = self->_activeDragSessionCount;
  }
  self->_unint64_t activeDragSessionCount = activeDragSessionCount + 1;
}

- (void)didEndDragSession
{
  unint64_t v2 = self->_activeDragSessionCount - 1;
  self->_unint64_t activeDragSessionCount = v2;
  if (!v2)
  {
    id v3 = [(RCMainViewController *)self playbackViewController];
    [v3 enableWaveformScrolling:1];
  }
}

- (void)cancelTrimMode
{
  id v3 = [(RCMainViewController *)self mainControllerHelper];
  [v3 cancelTrimModeWithDismissal:1];

  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v5 = [v4 recordingViewController];
  [v5 cleanupAfterExitTrim];

  [(RCMainViewController *)self updateUndoButtonStateFromUndoManager];

  [(RCMainViewController *)self _transitionPresentedCompactRecordingCardToTrimMode:0];
}

- (id)waveformViewController
{
  unint64_t v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 recordingViewController];
  id v4 = [v3 waveformContainerViewControllers];
  BOOL v5 = [v4 objectAtIndexedSubscript:0];

  return v5;
}

- (id)overviewWaveformViewController
{
  unint64_t v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 recordingViewController];
  id v4 = [v3 overviewWaveformViewController];

  return v4;
}

- (BOOL)remoteToggleShouldPauseRecording
{
  unint64_t v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 recordingViewController];
  BOOL v4 = [v3 recordingControlState] == (id)1;

  return v4;
}

- (void)recordingDidEnd
{
  [(RCMainViewController *)self setRecordingStartTimeInfo:0];

  [(RCMainViewController *)self saveAsNewDoneButtonAction:0];
}

- (void)updatePlaybackSettings
{
  id v8 = [(RCMainViewController *)self playbackSettings];
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v4 = [v3 recordingViewController];
  [v4 updateWithPlaybackSettings:v8];

  BOOL v5 = [(RCMainViewController *)self playbackViewController];
  [v5 updateWithPlaybackSettings:v8];

  id v6 = [(RCMainViewController *)self presentedPlaybackSettingsViewController];
  int v7 = v6;
  if (v6) {
    [v6 setPlaybackSettings:v8];
  }
}

- (void)waveformTimeUpdated:(double)a3
{
  BOOL v5 = [(RCMainViewController *)self browseFoldersViewController];
  id v6 = [v5 recordingViewController];
  int v7 = [v6 view];
  [v7 setCurrentTime:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  id v8 = [WeakRetained view];
  [v8 setCurrentTime:a3];
}

- (BOOL)recordingTitleHasBeenEditedForUUID:(id)a3
{
  return [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor recordingTitleHasBeenEditedForUUID:a3];
}

- (void)didUpdateRecordingViewDisplayStyle
{
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v9 supportsCompactRecordingCard])
  {
    id v3 = [(RCMainViewController *)self browseFoldersViewController];
    BOOL v4 = [v3 recordingViewController];
    BOOL v5 = [v4 view];
    id v6 = [v5 displayStyle];

    unint64_t v7 = [(RCMainViewController *)self sheetPresentationState];
    if (v6 == (id)3 && v7 == 1) {
      [(RCMainViewController *)self _expandPresentedCompactRecordingCard];
    }
    unint64_t v8 = [(RCMainViewController *)self sheetPresentationState];
    if (v6 == (id)2 && v8 == 2) {
      [(RCMainViewController *)self _collapsePresentedCompactRecordingCard];
    }
  }
}

- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = a4;
  unint64_t v7 = +[NSArray arrayWithObjects:&v8 count:1];

  -[RCMainViewController setFavorite:forRecordingsWithUUIDs:](self, "setFavorite:forRecordingsWithUUIDs:", v4, v7, v8);
}

- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RCMainViewController *)self mainControllerHelper];
  [v7 setFavorite:v4 forRecordingsWithUUIDs:v6];
}

- (BOOL)isFavoriteForUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCMainViewController *)self mainControllerHelper];
  unsigned __int8 v6 = [v5 isFavoriteForUUID:v4];

  return v6;
}

- (void)toggleFavoriteForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self mainControllerHelper];
  [v5 toggleFavoriteForUUID:v4];
}

- (void)_dismissCardView:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self presentedCardViewController];

  if (v5)
  {
    unsigned __int8 v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v7 = [v6 shouldHidePrimaryColumnInEditView];
    id v8 = [(RCMainViewController *)self splitViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (v7 && (isKindOfClass & 1) != 0)
    {
      id v10 = [(RCMainViewController *)self splitViewController];
      [v10 showPrimaryColumnForExitingEditModeIfNeeded];
    }
    double v11 = [(RCMainViewController *)self browseFoldersViewController];
    double v12 = [v11 currentActiveFolderViewController];

    unsigned int v13 = [v12 recordingViewController];
    double v14 = [v13 view];
    [v14 prepareForDismiss];
    id v15 = [v6 animatesRecordingCardPresentation];
    if ((v15 & 1) == 0) {
      +[UIView setAnimationsEnabled:0];
    }
    unsigned int v16 = [v6 supportsCompactRecordingCard];
    char v17 = v16;
    if (v16) {
      [(RCMainViewController *)self _showGrabberOnRecordingCardSheetPresentationController:0];
    }
    else {
      [(RCMainViewController *)self _reparentAfterDismiss];
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000A75A8;
    v25[3] = &unk_100222EC8;
    char v29 = v17;
    void v25[4] = self;
    id v26 = v6;
    char v30 = (char)v15;
    id v27 = v14;
    id v28 = v4;
    id v18 = v14;
    id v19 = v6;
    [(RCMainViewController *)self dismissViewControllerAnimated:v15 completion:v25];
    [(RCMainViewController *)self selectNewRecordingForDismiss];
    [(RCMainViewController *)self setPresentedCardViewController:0];
    char v20 = +[NSNotificationCenter defaultCenter];
    [v20 removeObserver:self name:NSUndoManagerDidUndoChangeNotification object:self->_currentUndoManager];

    double v21 = +[NSNotificationCenter defaultCenter];
    [v21 removeObserver:self name:NSUndoManagerDidRedoChangeNotification object:self->_currentUndoManager];

    double v22 = [(RCMainViewController *)self view];
    [v22 setNeedsUpdateConstraints];

    id v23 = [(RCMainViewController *)self mainUndoManager];
    currentUndoManager = self->_currentUndoManager;
    self->_currentUndoManager = v23;
  }
}

- (void)_reparentAfterDismiss
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v8 = [v3 recordingViewController];

  id v4 = [v8 view];
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v6 = [v5 currentActiveFolderViewController];

  unsigned int v7 = [v6 view];
  [v8 willMoveToParentViewController:0];
  [v8 removeFromParentViewController];
  [v7 setRecordingView:v4];
  [v6 setRecordingViewController:v8];
}

- (void)selectRecordingWithUUID:(id)a3 returnToBrowse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(RCMainViewController *)self isRecording])
  {
    unsigned int v7 = [(RCMainViewController *)self browseFoldersViewController];
    id v8 = [v7 currentActiveFolderViewController];

    id v9 = [v8 recordingsCollectionViewController];
    id v10 = v9;
    if (v9) {
      unsigned __int8 v11 = [v9 presentsRecordingWithUUID:v6];
    }
    else {
      unsigned __int8 v11 = 0;
    }
    +[CATransaction begin];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A7908;
    v12[3] = &unk_100222EF0;
    v12[4] = self;
    id v13 = v6;
    unsigned __int8 v14 = v11;
    +[CATransaction setCompletionBlock:v12];
    if (v4) {
      [(RCMainViewController *)self setState:0];
    }
    +[CATransaction commit];
  }
}

- (void)_selectRecordingWithUUID:(id)a3 inRecordingsCollectionViewController:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 uuidOfSelectedItem];
  if (([v7 isEqualToString:v8] & 1) == 0)
  {
    [v6 selectItemWithUUID:v8 animated:0];
    [(RCMainViewController *)self didSelectForUUID:v8 resetPosition:1 force:0];
  }
}

- (void)undo
{
  id v3 = [(RCMainViewController *)self undoManager];
  [v3 undo];

  [(RCMainViewController *)self updateUndoButtonStateFromUndoManager];
}

- (void)performRenameWithNewTitle:(id)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCMainViewController *)self browseFoldersViewController];
  id v9 = [v8 activeRecordingsCollectionViewController];
  id v10 = [v9 collectionView];
  [v10 becomeFirstResponder];

  [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor performRenameWithNewTitle:v7 forUUID:v6];
  unsigned __int8 v11 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v6];
  double v12 = [(RCMainViewController *)self mainControllerHelper];
  [v12 setCurrentRecordingDisplayModel:v11];

  id v13 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v14 = [v13 recordingViewController];
  [v14 renameForUUID:v6 toNewTitle:v7];

  id v15 = [(RCMainViewController *)self playbackViewController];
  [v15 renameForUUID:v6 toNewTitle:v7];

  [(RCMainViewController *)self updateQuickActions];
}

- (void)refreshDisplayWithDisplayModel:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(RCMainViewController *)self mainControllerHelper];
  id v5 = [v4 currentRecordingDisplayModel];
  id v6 = [v5 UUID];
  id v7 = [v14 UUID];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = [(RCMainViewController *)self mainControllerHelper];
    [v9 setCurrentRecordingDisplayModel:v14];
  }
  id v10 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v11 = [v10 recordingViewController];
  [v11 updateWithRecordingModel:v14 requireMatchingUUID:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  [WeakRetained updateWithRecordingModel:v14 requireMatchingUUID:1];

  id v13 = [(RCMainViewController *)self playbackViewController];
  [v13 updateWithRecordingModel:v14 requireMatchingUUID:1];
}

- (void)performClearAllRecentlyDeleted
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  [v2 performClearAllRecentlyDeleted];
}

- (void)wasDeselectedForUUID:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(RCMainViewController *)self browseFoldersViewController];
  id v5 = [v4 activeRecordingsCollectionViewController];
  [v5 showIdleForItemWithUUID:v12];

  id v6 = [(RCMainViewController *)self playbackViewController];
  [v6 showIdleForUUID:v12];

  id v7 = [(RCMainViewController *)self playbackViewController];
  unsigned int v8 = [v7 uuidBeingDisplayed];
  unsigned int v9 = [v8 isEqualToString:v12];

  if (v9)
  {
    id v10 = [(RCMainViewController *)self playbackViewController];
    [v10 clear];
  }
  unsigned __int8 v11 = [(RCMainViewController *)self mainControllerHelper];
  [v11 stopForUUID:v12];
}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 forUUID:(id)a5 sourceController:(id)a6 source:(id)a7
{
}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 forUUID:(id)a5 sourceController:(id)a6 source:(id)a7 trackIndex:(unint64_t)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14 || (unint64_t)a3 <= 0x2B && ((1 << a3) & 0x800406D80FELL) != 0)
  {
    char v17 = [(RCMainViewController *)self mainControllerHelper];
    id v18 = [(RCMainViewController *)self browseFoldersViewController];
    id v19 = [v18 recordingViewController];

    char v20 = [(RCMainViewController *)self recordingsModelInteractor];
    [(RCMainViewController *)self saveAsNewDoneButtonAction:0];
    switch(a3)
    {
      case 0:
        [v17 playbackForUUID:v14 atPosition:a4];
        break;
      case 1:
        if (v14) {
          [v17 pauseForUUID:v14];
        }
        else {
          [v17 stopPlayback];
        }
        break;
      case 2:
        if (v14) {
          [v17 toggleForUUID:v14];
        }
        else {
          [v17 togglePlayback];
        }
        break;
      case 3:
        [(RCMainViewController *)self _startCapturing:0 completion:0];
        +[RCAnalyticsUtilities sendDidCaptureNewRecording];
        break;
      case 4:
        [(RCMainViewController *)self endRecording];
        break;
      case 5:
        [(RCMainViewController *)self pauseRecording];
        break;
      case 6:
        [(RCMainViewController *)self saveAsNewDoneButtonAction:1];
        [(RCMainViewController *)self resumeRecording:a8];
        goto LABEL_17;
      case 7:
        [(RCMainViewController *)self saveAsNewDoneButtonAction:1];
        [(RCMainViewController *)self replaceRecording:a8];
LABEL_17:
        +[RCAnalyticsUtilities sendDidCaptureModifyExistingRecording];
        break;
      case 8:
        [v17 startScrubbingForUUID:v14 atPosition:a4];
        break;
      case 9:
        [v17 updateScrubbingForUUID:v14 atPosition:a4];
        break;
      case 10:
        [v17 endScrubbingForUUID:v14 atPosition:a4];
        break;
      case 11:
        [v17 jumpForwardForUUID:v14];
        break;
      case 12:
        [v17 jumpBackwardForUUID:v14];
        break;
      case 13:
        id v28 = [v20 duplicateRecordingWithUUID:v14];
        break;
      case 14:
        id v55 = v14;
        char v29 = +[NSArray arrayWithObjects:&v55 count:1];
        [(RCMainViewController *)self deleteRecordingsWithUUIDs:v29 sourceController:v15 source:v16 showInfo:1];
        goto LABEL_32;
      case 15:
        char v29 = [(RCMainViewController *)self browseFoldersViewController];
        char v30 = [v29 activeRecordingsCollectionViewController];
        uint64_t v31 = [v30 selectedUUIDs];
        goto LABEL_27;
      case 16:
        char v29 = [(RCMainViewController *)self browseFoldersViewController];
        char v30 = [v29 activeRecordingsCollectionViewController];
        uint64_t v31 = [v30 allUUIDs];
LABEL_27:
        BOOL v32 = (void *)v31;
        [(RCMainViewController *)self deleteRecordingsWithUUIDs:v31 sourceController:v15 source:v16 showInfo:1];

        goto LABEL_32;
      case 17:
        id v54 = v14;
        char v29 = +[NSArray arrayWithObjects:&v54 count:1];
        [(RCMainViewController *)self confirmEraseWithUUIDs:v29 sourceController:v15 source:v16 eraseAllDeleted:0];
        goto LABEL_32;
      case 18:
        [(RCMainViewController *)self confirmEraseSelectedWithSourceController:v15 source:v16 eraseAllDeleted:0];
        break;
      case 19:
        [(RCMainViewController *)self confirmEraseAllWithSourceController:v15 source:v16 eraseAllDeleted:1];
        break;
      case 20:
        id v53 = v14;
        char v29 = +[NSArray arrayWithObjects:&v53 count:1];
        [(RCMainViewController *)self confirmRecoverWithUUIDs:v29 sourceController:v15 source:v16 force:0];
LABEL_32:

        break;
      case 21:
        [(RCMainViewController *)self confirmRecoverSelectedWithSourceController:v15 source:v16];
        break;
      case 22:
        [(RCMainViewController *)self confirmRecoverAllWithSourceController:v15 source:v16];
        break;
      case 23:
        goto LABEL_45;
      case 24:
        BOOL v33 = self;
        uint64_t v34 = 0;
        goto LABEL_37;
      case 25:
        BOOL v33 = self;
        uint64_t v34 = 1;
LABEL_37:
        [(RCMainViewController *)v33 saveAsNewDoneButtonAction:v34];
        [v19 handleDone];
        break;
      case 26:
        [v19 handleCancel];
        break;
      case 27:
        id v35 = [v19 view];
        [v35 toggleFullCompact];
        goto LABEL_43;
      case 28:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        id v57 = v14;
        id v35 = +[NSArray arrayWithObjects:&v57 count:1];
        v36 = v17;
        id v37 = v35;
        id v38 = v15;
        id v39 = v16;
        uint64_t v40 = 0;
        goto LABEL_42;
      case 29:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        id v56 = v14;
        id v35 = +[NSArray arrayWithObjects:&v56 count:1];
        v36 = v17;
        id v37 = v35;
        id v38 = v15;
        id v39 = v16;
        uint64_t v40 = 1;
LABEL_42:
        [v36 shareRecordingsWithUUIDs:v37 inViewController:v38 source:v39 isShareButton:v40 completionWithItemsHandler:0];
LABEL_43:

        break;
      case 30:
        v41 = [(RCMainViewController *)self browseFoldersViewController];
        v42 = [v41 activeRecordingsCollectionViewController];
        v43 = [v42 selectedUUIDs];

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1000A87B8;
        v52[3] = &unk_100222F18;
        v52[4] = self;
        [v17 shareRecordingsWithUUIDs:v43 inViewController:v15 source:v16 isShareButton:1 completionWithItemsHandler:v52];

LABEL_45:
        v44 = self;
        id v45 = v14;
        uint64_t v46 = 0;
        goto LABEL_47;
      case 31:
        v44 = self;
        id v45 = v14;
        uint64_t v46 = 1;
LABEL_47:
        [(RCMainViewController *)v44 _openForModifyRecordingWithUUID:v45 enterTrim:v46];
        break;
      case 33:
        [v19 setInPointToCurrentTime];
        break;
      case 34:
        [v19 setOutPointToCurrentTime];
        break;
      case 35:
        [v17 performTrimByKeepingSelectedRangeForRecordingWithUUID:v14 source:v16];
        break;
      case 36:
        [v17 performTrimByDeletingSelectedRangeForRecordingWithUUID:v14 source:v16];
        break;
      case 37:
        [(RCMainViewController *)self undo];
        break;
      case 38:
        id v47 = self;
        uint64_t v48 = 1;
        goto LABEL_55;
      case 39:
        id v47 = self;
        uint64_t v48 = 0;
LABEL_55:
        [(RCMainViewController *)v47 setFavorite:v48 forRecordingWithUUID:v14];
        break;
      case 40:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        [v20 setEnhanced:1 forUUID:v14];
        v49 = self;
        uint64_t v50 = 1;
        goto LABEL_58;
      case 41:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        [v20 setEnhanced:0 forUUID:v14];
        v49 = self;
        uint64_t v50 = 0;
LABEL_58:
        [(RCMainViewController *)v49 _axAnnounceDidSetEnhanced:v50];
        break;
      case 42:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        [(RCMainViewController *)self _presentMoveToFolderUIForRecordingWithUUID:v14];
        break;
      case 43:
        [(RCMainViewController *)self _presentMoveToFolderUIForSelectedRecordings];
        break;
      case 44:
        [(RCMainViewController *)self _endDescriptionViewTextEditing];
        id v51 = [v19 view];
        [v51 setTranscriptViewState:0];

        [(RCMainViewController *)self _presentPlaybackSettingsUIWithSource:v16];
        break;
      case 45:
        [(RCMainViewController *)self toggleTranscriptView];
        break;
      case 46:
        [(RCMainViewController *)self copyTranscript:v14];
        break;
      case 47:
        [(RCMainViewController *)self separateRecordingLayers:v14];
        break;
      default:
        break;
    }
  }
  else
  {
    char v17 = OSLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10016DFB4(v17, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)_openForModifyRecordingWithUUID:(id)a3 enterTrim:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  if (v4 && (id)[(RCMainViewController *)self state] == (id)1)
  {
    id v6 = [(RCMainViewController *)self mainControllerHelper];
    [v6 enterTrimMode];

    id v7 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v8 = [v7 recordingViewController];
    [v8 updateForTrimMode];

LABEL_10:
    [(RCMainViewController *)self _transitionPresentedCompactRecordingCardToTrimMode:1];
    goto LABEL_11;
  }
  unsigned int v9 = [(RCMainViewController *)self mainControllerHelper];
  id v10 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v11 = [v10 activeRecordingsCollectionViewController];
  id v12 = [v11 uuidOfSelectedItem];

  if (([v12 isEqualToString:v16] & 1) == 0)
  {
    id v13 = [(RCMainViewController *)self browseFoldersViewController];
    id v14 = [v13 activeRecordingsCollectionViewController];
    [v14 selectItemWithUUID:v16];
  }
  if (v4) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [v9 openForModifyRecordingWithUUID:v16 withSubActivityType:v15];

  if (v4) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)deleteRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 showInfo:(BOOL)a6
{
  BOOL v6 = a6;
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v17 && [v17 count])
  {
    id v12 = +[NSUserDefaults sharedSettingsUserDefaults];
    id v13 = v12;
    if (v12 && objc_msgSend(v12, "rc_deletionIsImmediate"))
    {
      [(RCMainViewController *)self confirmEraseWithUUIDs:v17 sourceController:v10 source:v11 eraseAllDeleted:0];
    }
    else
    {
      id v14 = [(RCMainViewController *)self mainControllerHelper];
      uint64_t v15 = [v14 deleteWithUUIDs:v17 source:v11 showInfo:v6];

      if (v15)
      {
        id v16 = +[RCShareMemoViewController presentedController];
        [v16 dismissViewControllerAnimated:0 completion:0];

        [v15 rc_configurePopoverControllerWithSource:v11];
        [(RCMainViewController *)self _myPresentViewController:v15 sourceController:v10 animated:1 completion:0];
      }
    }
    [(RCMainViewController *)self updatePlaybackContentUnavailableViewIfNeeded];
  }
}

- (void)confirmEraseSelectedWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v11;
    id v10 = [v9 selectedUUIDs];
    [(RCMainViewController *)self confirmEraseWithUUIDs:v10 sourceController:v9 source:v8 eraseAllDeleted:v5];
  }
}

- (void)confirmEraseAllWithSourceController:(id)a3 source:(id)a4 eraseAllDeleted:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v11;
    id v10 = [v9 allUUIDs];
    [(RCMainViewController *)self confirmEraseWithUUIDs:v10 sourceController:v9 source:v8 eraseAllDeleted:v5];
  }
}

- (void)confirmEraseWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 eraseAllDeleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v18 && [v18 count])
  {
    id v12 = [(RCMainViewController *)self mainControllerHelper];
    id v13 = v12;
    if (v6)
    {
      id v14 = [v12 eraseAllRecordingsAndConfirmWithSource:v11];
    }
    else
    {
      uint64_t v15 = [(RCMainViewController *)self browseFoldersViewController];
      id v16 = [v15 activeRecordingsCollectionViewController];
      id v14 = [v13 eraseAndConfirmWithUUIDs:v18 source:v11 collectionViewController:v16];
    }
    if (v14)
    {
      id v17 = +[RCShareMemoViewController presentedController];
      [v17 dismissViewControllerAnimated:0 completion:0];

      [v14 rc_configurePopoverControllerWithSource:v11];
      [(RCMainViewController *)self _myPresentViewController:v14 sourceController:v10 animated:1 completion:0];
    }
  }
}

- (void)recoverRecordingsWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v12 && [v12 count]) {
    [(RCMainViewController *)self confirmRecoverWithUUIDs:v12 sourceController:v10 source:v11 force:v6];
  }
}

- (void)confirmRecoverSelectedWithSourceController:(id)a3 source:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v9;
    id v8 = [v7 selectedUUIDs];
    [(RCMainViewController *)self confirmRecoverWithUUIDs:v8 sourceController:v7 source:v6 force:0];
  }
}

- (void)confirmRecoverAllWithSourceController:(id)a3 source:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v9;
    id v8 = [v7 allUUIDs];
    [(RCMainViewController *)self confirmRecoverWithUUIDs:v8 sourceController:v7 source:v6 force:0];
  }
}

- (void)confirmRecoverWithUUIDs:(id)a3 sourceController:(id)a4 source:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10 && [v10 count])
  {
    BOOL v24 = v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v17);
          id v19 = [(RCMainViewController *)self mainControllerHelper];
          [v19 pauseForUUID:v18];

          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    char v20 = [(RCMainViewController *)self mainControllerHelper];
    uint64_t v21 = [(RCMainViewController *)self browseFoldersViewController];
    uint64_t v22 = [v21 activeRecordingsCollectionViewController];
    uint64_t v23 = [v20 restoreRecordingsWithUUIDs:v13 isRecover:1 source:v12 force:v24 collectionViewController:v22];

    if (v23)
    {
      [v23 rc_configurePopoverControllerWithSource:v12];
      [(RCMainViewController *)self _myPresentViewController:v23 sourceController:v11 animated:1 completion:0];
    }
  }
}

- (void)moveRecordingsWithUUIDs:(id)a3 toUserFolderNamed:(id)a4 source:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11)
  {
    id v10 = [v11 count];
    if (v8)
    {
      if (v10) {
        [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor addRecordingsWithUUIDs:v11 toUserFolderNamed:v8];
      }
    }
  }
}

- (void)moveRecordingsWithUUIDs:(id)a3 toBuiltInFolderOfType:(int64_t)a4 source:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v9 && [v9 count]) {
    [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor addRecordingsWithUUIDs:v9 toBuiltInFolderOfType:a4];
  }
}

- (void)_myPresentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  id v10 = (RCMainViewController *)a4;
  id v11 = a6;
  if (!v10)
  {
    id v12 = [(RCMainViewController *)self navigationController];
    id v10 = [v12 presentedViewController];

    if (!v10) {
      id v10 = self;
    }
  }
  [(RCMainViewController *)self setPresentedConfirmationController:v13];
  [(RCMainViewController *)v10 presentViewController:v13 animated:v7 completion:v11];
}

- (void)hideBackButtonTitle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v4 = [v5 currentActiveFolderViewController];
  [v4 setHideNavigationTitle:v3];
}

- (void)libraryWillChangeEditingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [(RCMainViewController *)self mainControllerHelper];
    [v5 stopPlayback];
  }
  id v6 = [(RCMainViewController *)self playbackViewController];
  [v6 setCollectionViewEditingShouldDisableActionButtons:v3];
}

- (BOOL)isEditingInFlightForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self editingProgressItems];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)mostRecentRecordingIsSelectable
{
  BOOL v3 = [(RCMainViewController *)self mainControllerHelper];
  unsigned int v4 = [v3 isRecording];

  if (v4)
  {
    self->_canSelectNewestRecording = 1;
    [(RCMainViewController *)self selectNewRecordingForDismiss];
  }
  else
  {
    [(RCMainViewController *)self setUuidToSelectAfterDismiss:0];
  }
}

- (void)selectNewRecordingForDismiss
{
  id v12 = [(RCMainViewController *)self uuidToSelectAfterDismiss];
  BOOL v3 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v4 = [v3 activeRecordingsCollectionViewController];
  id v5 = [v4 cellForUUID:v12];

  if (![(RCMainViewController *)self state] && self->_canSelectNewestRecording && v5 != 0)
  {
    BOOL v7 = [(RCMainViewController *)self browseFoldersViewController];
    id v8 = [v7 activeRecordingsCollectionViewController];
    [v8 selectItemWithUUID:v12];

    id v9 = [(RCMainViewController *)self playbackViewController];
    id v10 = [v9 uuidBeingDisplayed];
    unsigned __int8 v11 = [v10 isEqualToString:v12];

    if ((v11 & 1) == 0) {
      [(RCMainViewController *)self didSelectForUUID:v12 resetPosition:0 force:0];
    }
    [(RCMainViewController *)self setUuidToSelectAfterDismiss:0];
    self->_canSelectNewestRecording = 0;
  }
}

- (void)_presentMoveToFolderUIForSelectedRecordings
{
  BOOL v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v5 = [v3 activeRecordingsCollectionViewController];

  unsigned int v4 = [v5 selectedUUIDs];
  [(RCMainViewController *)self _presentMoveToFolderUIForRecordingsWithUUIDs:v4];
}

- (void)_presentMoveToFolderUIForRecordingWithUUID:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[RCMainViewController _presentMoveToFolderUIForRecordingsWithUUIDs:](self, "_presentMoveToFolderUIForRecordingsWithUUIDs:", v5, v6);
  }
}

- (void)_presentMoveToFolderUIForRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self moveToFolderContainerViewControllerWithUUIDs:v4];
  id v6 = [v5 collectionViewController];
  [v6 setPresentingDelegate:self];

  BOOL v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 presentedViewsMinimumWidth];
  double v9 = v8;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A98EC;
  v11[3] = &unk_1002220C0;
  objc_copyWeak(&v13, &location);
  id v10 = v5;
  id v12 = v10;
  [(RCMainViewController *)self _presentViewController:v10 fromViewController:self animated:1 widthHeightConstraintConstant:v11 completion:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)moveToFolderContainerViewControllerWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setModalPresentationStyle:2];
  [v5 setSelectionDelegate:self];
  [v5 setUuidsToMove:v4];

  id v6 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v7 = [v6 currentActiveFolderViewController];
  double v8 = [v7 folderUUID];
  [v5 setUuidOfSourceFolder:v8];

  double v9 = [(RCMainViewController *)self browseFoldersViewController];
  id v10 = [v9 currentActiveFolderViewController];
  [v5 setFolderTypeOfSourceFolder:[v10 folderType]];

  unsigned __int8 v11 = [[RCFolderSelectionContainerViewController alloc] initWithCollectionViewController:v5];

  return v11;
}

- (id)folderUUIDsToExcludeWhenMovingRecordingUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v6)
  {

    id v27 = 0;
    goto LABEL_24;
  }
  id v7 = v6;
  long long v25 = v4;
  id obj = v5;
  char v8 = 0;
  id v27 = 0;
  uint64_t v9 = *(void *)v30;
  int v10 = 1;
  int v11 = 1;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      id v14 = [(RCMainViewController *)self recordingsModelInteractor];
      unsigned int v15 = [v14 isRecentlyDeletedForUUID:v13];
      unsigned int v16 = [v14 isFavoriteForUUID:v13];
      id v17 = [v14 uuidOfUserFolderForRecordingWithUUID:v13];
      if (v8)
      {
LABEL_7:
        char v8 = 1;
        goto LABEL_14;
      }
      if (v27)
      {
        if (!v17 || ([v27 isEqualToString:v17] & 1) == 0) {
          goto LABEL_7;
        }
      }
      else
      {
        id v27 = v17;
      }
      char v8 = 0;
LABEL_14:
      v11 &= v15;
      v10 &= v16;
    }
    id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v7);
  id v5 = obj;

  if (v27) {
    char v18 = v8;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    id v4 = v25;
    [v25 addObject:];
    if ((v11 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  id v4 = v25;
  if (v11)
  {
LABEL_24:
    id v19 = +[RCApplicationModel sharedApplicationModel];
    char v20 = [v19 recentlyDeletedRecordingsFolder];
    goto LABEL_25;
  }
LABEL_29:
  if (v10)
  {
    id v19 = +[RCApplicationModel sharedApplicationModel];
    char v20 = [v19 favoriteRecordingsFolder];
    goto LABEL_25;
  }
  if (![v4 count])
  {
    id v19 = +[RCApplicationModel sharedApplicationModel];
    char v20 = [v19 voiceMemosRecordingsFolder];
LABEL_25:
    uint64_t v21 = v20;
    uint64_t v22 = [v20 uuid];
    [v4 addObject:v22];
  }
  uint64_t v23 = +[NSArray arrayWithArray:v4];

  return v23;
}

- (void)_presentPlaybackSettingsUIWithSource:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self playbackSettings];
  if (!v5) {
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(RCPlaybackSettingsViewController);
  [(RCPlaybackSettingsViewController *)v6 setDelegate:self];
  [(RCPlaybackSettingsViewController *)v6 setPlaybackSettings:v5];
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  long long v25 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v8 = [v25 supportsPopoverPlaybackSettingsPresentation];
  if (!v4) {
    goto LABEL_9;
  }
  unsigned int v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v10) = 0;
    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() ^ 1;
    if (!v9)
    {
LABEL_9:
      [(RCPlaybackSettingsViewController *)v6 setNeedsCloseButton:1];
      int v11 = [v7 presentationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        uint64_t v13 = +[UISheetPresentationControllerDetent mediumDetent];
        v31[0] = v13;
        id v14 = +[UISheetPresentationControllerDetent largeDetent];
        v31[1] = v14;
        unsigned int v15 = +[NSArray arrayWithObjects:v31 count:2];
        [v12 setDetents:v15];
      }
      goto LABEL_12;
    }
  }
  if (v10) {
    goto LABEL_9;
  }
  [v7 setModalPresentationStyle:7];
  [v7 rc_configurePopoverControllerWithSource:v4];
LABEL_12:
  uint64_t v16 = [(RCMainViewController *)self presentedCardViewController];
  id v17 = (void *)v16;
  if (v16) {
    char v18 = (RCMainViewController *)v16;
  }
  else {
    char v18 = self;
  }
  id v19 = v18;

  char v20 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v20 presentedViewsMinimumWidth];
  double v22 = v21;

  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000AA04C;
  v26[3] = &unk_100221250;
  objc_copyWeak(&v29, &location);
  uint64_t v23 = v6;
  id v27 = v23;
  BOOL v24 = v19;
  long long v28 = v24;
  [(RCMainViewController *)self _presentViewController:v7 fromViewController:v24 animated:1 widthHeightConstraintConstant:v26 completion:v22];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

LABEL_16:
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 widthHeightConstraintConstant:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v33 = a3;
  id v11 = a4;
  id v12 = a7;
  if (a6 > 0.0)
  {
    uint64_t v13 = [v33 view];
    id v14 = [v13 widthAnchor];
    unsigned int v15 = [v14 constraintGreaterThanOrEqualToConstant:a6];
    [v15 setActive:1];

    uint64_t v16 = [v33 view];
    id v17 = [v16 heightAnchor];
    char v18 = [v17 constraintGreaterThanOrEqualToConstant:a6];
    [v18 setActive:1];

    id v19 = +[UIApplication sharedApplication];
    char v20 = [v19 delegate];
    double v21 = [v20 window];

    if (v21)
    {
      [v21 frame];
      double v23 = v22 * 0.9;
      double v25 = v24 * 0.9;
      if (v22 * 0.9 > a6 && v25 > a6)
      {
        id v27 = [v33 view];
        long long v28 = [v27 widthAnchor];
        id v29 = [v28 constraintLessThanOrEqualToConstant:v23];
        [v29 setActive:1];

        long long v30 = [v33 view];
        long long v31 = [v30 heightAnchor];
        long long v32 = [v31 constraintLessThanOrEqualToConstant:v25];
        [v32 setActive:1];
      }
    }
  }
  [v11 presentViewController:v33 animated:v9 completion:v12];
}

- (void)_endDescriptionViewTextEditing
{
  id v2 = [(RCMainViewController *)self mainControllerHelper];
  [v2 endDescriptionViewTextEditing];
}

- (void)didCancelFolderSelection
{
}

- (void)didCompleteFolderSelection
{
}

- (void)hideFolderSelectionViewController
{
  id v3 = [(RCMainViewController *)self presentedSelectFolderViewController];
  if (v3)
  {
    id v6 = v3;
    id v4 = [(RCMainViewController *)self presentedViewController];
    unsigned int v5 = [v6 isEqual:v4];

    id v3 = v6;
    if (v5)
    {
      [(RCMainViewController *)self dismissViewControllerAnimated:1 completion:0];
      id v3 = v6;
    }
  }
}

- (void)_processMoveOfUUID:(id)a3 toBuiltInFolderOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 3:
      id v14 = v6;
      unsigned int v8 = +[NSArray arrayWithObjects:&v14 count:1];
      id v11 = [(RCMainViewController *)self browseFoldersViewController];
      [(RCMainViewController *)self deleteRecordingsWithUUIDs:v8 sourceController:v11 source:0 showInfo:0];

LABEL_11:
      break;
    case 1:
      [(RCMainViewController *)self setFavorite:1 forRecordingWithUUID:v6];
      break;
    case 0:
      unsigned int v8 = [(RCMainViewController *)self mainControllerHelper];
      BOOL v9 = [(RCMainViewController *)self recordingsModelInteractor];
      int v10 = [v9 uuidOfUserFolderForRecordingWithUUID:v7];
      if (v10)
      {
        [v9 removeRecordingWithUUID:v7 fromUserFolderWithUUID:v10];
      }
      else
      {
        unsigned int v15 = v7;
        id v12 = +[NSArray arrayWithObjects:&v15 count:1];
        id v13 = [v8 restoreRecordingsWithUUIDs:v12 isRecover:1 source:0 force:1 collectionViewController:0];
      }
      goto LABEL_11;
    default:
      [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor addRecordingWithUUID:v6 toBuiltInFolderOfType:a4];
      break;
  }
}

- (void)showNewFolderUIFromController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"NEW_FOLDER" value:&stru_100228BC8 table:0];
  id v7 = +[NSBundle mainBundle];
  unsigned int v8 = [v7 localizedStringForKey:@"ENTER_NEW_FOLDER_NAME" value:&stru_100228BC8 table:0];
  BOOL v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AA868;
  v21[3] = &unk_100222F40;
  v21[4] = self;
  [v9 addTextFieldWithConfigurationHandler:v21];
  objc_initWeak(&location, v9);
  int v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"SAVE" value:&stru_100228BC8 table:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AA924;
  v17[3] = &unk_100222F68;
  objc_copyWeak(&v19, &location);
  v17[4] = self;
  id v12 = v4;
  id v18 = v12;
  id v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v17];

  [v13 setEnabled:0];
  [(RCMainViewController *)self setCreateNewFolderSaveAction:v13];
  id v14 = +[NSBundle mainBundle];
  unsigned int v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];
  uint64_t v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:&stru_100222FA8];

  [v9 addAction:v13];
  [v9 addAction:v16];
  [(RCMainViewController *)self _myPresentViewController:v9 sourceController:v12 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[NSBundle mainBundle];
  BOOL v9 = [v8 localizedStringForKey:@"RENAME_FOLDER" value:&stru_100228BC8 table:0];
  int v10 = +[UIAlertController alertControllerWithTitle:v9 message:0 preferredStyle:1];

  [(RCMainViewController *)self setOldFolderName:v6];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = sub_1000AACEC;
  v31[3] = &unk_100222FD0;
  id v11 = v6;
  id v32 = v11;
  id v33 = self;
  [v10 addTextFieldWithConfigurationHandler:v31];
  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"SAVE" value:&stru_100228BC8 table:0];

  id v14 = [v10 textFields];
  unsigned int v15 = [v14 objectAtIndexedSubscript:0];

  [v15 setText:v11];
  double v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  double v25 = sub_1000AAD60;
  long long v26 = &unk_100222FF8;
  id v27 = self;
  id v28 = v15;
  id v29 = v7;
  id v30 = v11;
  id v16 = v11;
  id v17 = v7;
  id v18 = v15;
  id v19 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&v23];
  -[RCMainViewController setRenameFolderSaveAction:](self, "setRenameFolderSaveAction:", v19, v23, v24, v25, v26, v27);
  [(RCMainViewController *)self _renamingTextDidChange:v18];
  [v10 addAction:v19];
  char v20 = +[NSBundle mainBundle];
  double v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];

  double v22 = +[UIAlertAction actionWithTitle:v21 style:1 handler:0];
  [v10 addAction:v22];
  [v10 rc_configurePopoverControllerWithSource:v17];
  [(RCMainViewController *)self presentViewController:v10 sourceController:self animated:1 completion:0];
}

- (void)_presentNameTakenAlertWithName:(id)a3 sourceController:(id)a4
{
  id v5 = a4;
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"NEW_FOLDER_NAME_EXISTS" value:&stru_100228BC8 table:0];
  unsigned int v8 = +[NSBundle mainBundle];
  BOOL v9 = [v8 localizedStringForKey:@"NEW_FOLDER_CHOOSE_DIFFERENT" value:&stru_100228BC8 table:0];
  id v14 = +[UIAlertController alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  int v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"OK" value:&stru_100228BC8 table:0];
  id v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];

  [v14 addAction:v12];
  [(RCMainViewController *)self _myPresentViewController:v14 sourceController:v5 animated:1 completion:0];

  LODWORD(self) = UIAccessibilityScreenChangedNotification;
  id v13 = [v14 view];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)self, v13);
}

- (void)_newFolderTextDidChange:(id)a3
{
  id v6 = [a3 text];
  BOOL v4 = [v6 length] != 0;
  id v5 = [(RCMainViewController *)self createNewFolderSaveAction];
  [v5 setEnabled:v4];
}

- (void)_renamingTextDidChange:(id)a3
{
  id v7 = [a3 text];
  if ([v7 length])
  {
    BOOL v4 = [(RCMainViewController *)self oldFolderName];
    uint64_t v5 = [v7 isEqualToString:v4] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(RCMainViewController *)self renameFolderSaveAction];
  [v6 setEnabled:v5];
}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCMainViewController *)self recordingsModelInteractor];
  [v8 moveFolder:v7 toDestinationIndexPath:v6];
}

- (void)deleteFolder:(id)a3 controller:(id)a4 completionBlock:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a3;
  int v10 = [(RCMainViewController *)self mainControllerHelper];
  id v11 = [v10 deleteFolder:v9 source:v12 completionBlock:v8];

  if (v11) {
    [(RCMainViewController *)self _myPresentViewController:v11 sourceController:v12 animated:1 completion:0];
  }
}

- (void)setEnhanced:(BOOL)a3 forUUID:(id)a4
{
  if (a3) {
    uint64_t v4 = 40;
  }
  else {
    uint64_t v4 = 41;
  }
  [(RCMainViewController *)self performAction:v4 atPosition:a4 forUUID:0 sourceController:0 source:0.0];
}

- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RCMainViewController *)self mainControllerHelper];
  [v7 setRemoveSilence:v4 forUUID:v6];

  [(RCMainViewController *)self updatePlaybackSettings];
}

- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(RCMainViewController *)self mainControllerHelper];
  [v7 setPlaybackSpeed:v6 forUUID:a3];

  [(RCMainViewController *)self updatePlaybackSettings];
}

- (void)setLayerMix:(double)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(RCMainViewController *)self mainControllerHelper];
  [v7 setLayerMix:v6 forUUID:a3];

  [(RCMainViewController *)self updatePlaybackSettings];
}

- (void)hidePlaybackSettingsViewController
{
  id v7 = [(RCMainViewController *)self presentedPlaybackSettingsViewController];
  id v3 = [v7 navigationController];
  BOOL v4 = [(RCMainViewController *)self presentingPlaybackSettingsViewController];
  if (v7)
  {
    if (v4)
    {
      uint64_t v5 = [v4 presentedViewController];
      unsigned int v6 = [v3 isEqual:v5];

      if (v6)
      {
        if (([v3 isBeingDismissed] & 1) == 0) {
          [v3 dismissViewControllerAnimated:1 completion:0];
        }
      }
    }
  }
}

- (void)didHidePlaybackSettingsViewController
{
  id v4 = [(RCMainViewController *)self mainControllerHelper];
  id v3 = [(RCMainViewController *)self selectedUUID];
  [v4 setLooping:0 forUUID:v3];
}

- (void)playbackSettingsViewController:(id)a3 contentSizeChanged:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 playbackSettingsPopoverBottomPadding];
  double v9 = height + v8;

  id v10 = [v6 navigationController];

  [v10 setPreferredContentSize:width, v9];
}

- (void)didReturnToFoldersList
{
  [(RCMainViewController *)self stopPlayback];
  id v3 = [(RCMainViewController *)self playbackViewController];
  [v3 clear];
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCMainViewController *)self recordingsModelInteractor];
  [v8 renameFolder:v7 toName:v6];
}

- (BOOL)canMoveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4 toFolderType:(int64_t)a5 fromFolderUUID:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = +[RCApplicationModel sharedApplicationModel];
  id v14 = v13;
  switch(a5)
  {
    case 0:
      uint64_t v15 = [v13 voiceMemosRecordingsFolder];
      goto LABEL_8;
    case 1:
      uint64_t v15 = [v13 favoriteRecordingsFolder];
      goto LABEL_8;
    case 2:
      uint64_t v15 = [v13 capturedOnWatchRecordingsFolder];
      goto LABEL_8;
    case 3:
      uint64_t v15 = [v13 recentlyDeletedRecordingsFolder];
      goto LABEL_8;
    case 4:
      uint64_t v15 = [v13 existingFolderWithUUID:v10];
LABEL_8:
      id v16 = (void *)v15;
      break;
    default:
      id v16 = 0;
      break;
  }
  id v17 = +[RCFolderDisplayModel folderDisplayModelWithFolderModel:v16];
  id v18 = [(RCMainViewController *)self folderUUIDsToExcludeWhenMovingRecordingUUIDs:v12];

  BOOL v19 = [(RCMainViewController *)self canMoveSelectedRecordingsFromFolderWithUUID:v11 toFolderWithDisplayModel:v17 excludedFolderUUIDsForSelection:v18];
  return v19;
}

- (BOOL)canMoveSelectedRecordingsFromFolderWithUUID:(id)a3 toFolderWithDisplayModel:(id)a4 excludedFolderUUIDsForSelection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 UUID];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if (v11 & 1) != 0 || ([v10 isEqualToString:v7]) {
    unsigned __int8 v12 = 0;
  }
  else {
    unsigned __int8 v12 = [v8 representsPossibleMoveDestination];
  }

  return v12;
}

- (void)moveRecordingsWithUUIDs:(id)a3 toFolderWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCMainViewController *)self browseFoldersViewController];
  id v11 = [v8 activeRecordingsCollectionViewController];

  id v9 = [(RCMainViewController *)self mainControllerHelper];
  id v10 = [v9 restoreRecordingsWithUUIDs:v7 isRecover:1 source:0 force:1 collectionViewController:v11];

  [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor addRecordingsWithUUIDs:v7 toUserFolderWithUUID:v6];
  [v11 endEditing];
}

- (void)moveRecordingsWithUUIDs:(id)a3 fromFolderOfType:(int64_t)a4 toBuiltInFolderOfType:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(RCMainViewController *)self browseFoldersViewController];
  id v10 = [v9 activeRecordingsCollectionViewController];

  if (a4 == 3)
  {
    id v11 = [(RCMainViewController *)self mainControllerHelper];
    id v12 = [v11 restoreRecordingsWithUUIDs:v8 isRecover:1 source:0 force:1 collectionViewController:v10];
  }
  if (a5)
  {
    if (a5 == 1)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v8;
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            -[RCMainViewController setFavorite:forRecordingWithUUID:](self, "setFavorite:forRecordingWithUUID:", 1, *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), (void)v18);
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
    else if (a5 == 3)
    {
      [(RCMainViewController *)self deleteRecordingsWithUUIDs:v8 sourceController:v10 source:0 showInfo:0];
    }
  }
  else if (a4 == 4)
  {
    [(RCMainViewController *)self _removeFromUserFolderRecordingsWithUUIDs:v8];
  }
  else if (a4 == 1)
  {
    [(RCMainViewController *)self setFavorite:0 forRecordingsWithUUIDs:v8];
  }
  [v10 endEditing:v18];
}

- (void)_removeFromUserFolderRecordingsWithUUIDs:(id)a3
{
}

- (void)reloadWaveformsFromComposition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCMainViewController *)self browseFoldersViewController];
  id v6 = [v5 recordingViewController];
  [v6 reloadWaveformsFromComposition:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  [WeakRetained reloadWaveformsFromComposition:v4];
}

- (void)didTransitionWithTransitionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 toActivityType];
  id v6 = [v4 toSubType];
  id v7 = [v4 fromActivityType];
  id v8 = [v4 fromSubType];
  id v15 = [v4 displayModel];
  id v9 = [v4 waveformDataSource];
  id v10 = [v4 composition];

  switch((unint64_t)v5)
  {
    case 0uLL:
      id v11 = [v15 UUID];
      [(RCMainViewController *)self _switchToIdleFromPreviousActivityType:v7 fromSubActivityType:v8 toSubActivityType:v6 displayModel:v15 withUUID:v11];

      break;
    case 1uLL:
      [(RCMainViewController *)self _switchToCapturingFromPreviousActivityType:v7 displayModel:v15 waveformDataSource:v9 isReplaceOrAppend:v6 != (id)3];
      break;
    case 2uLL:
      id v12 = [v15 UUID];
      [(RCMainViewController *)self _switchToPlayingBackFromPreviousActivityType:v7 withUUID:v12];

      break;
    case 3uLL:
      [(RCMainViewController *)self _switchToEditingFromPreviousActivityType:v7 displayModel:v15 withComposition:v10 enterTrim:v6 == (id)2];
      break;
    default:
      break;
  }
  id v13 = [(RCMainViewController *)self browseFoldersViewController];
  id v14 = [v13 activeRecordingsCollectionViewController];
  [v14 setCaptureIsUnderway:v5 == (id)1];
}

- (void)_switchToPlayingBackFromPreviousActivityType:(int64_t)a3 withUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(RCMainViewController *)self browseFoldersViewController];
  id v7 = [v6 activeRecordingsCollectionViewController];
  [v7 showPlayingForItemWithUUID:v5];

  id v8 = [(RCMainViewController *)self browseFoldersViewController];
  id v9 = [v8 recordingViewController];
  [v9 showPlayingForUUID:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  [WeakRetained showPlayingForUUID:v5];

  id v11 = [(RCMainViewController *)self playbackViewController];
  [v11 showPlayingForUUID:v5];

  [(RCMainViewController *)self updateQuickActions];
}

- (void)_switchToEditingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 withComposition:(id)a5 enterTrim:(BOOL)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000ABF34;
  v12[3] = &unk_100223068;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  int64_t v16 = a3;
  BOOL v17 = a6;
  id v10 = v15;
  id v11 = v13;
  [(RCMainViewController *)self _prepareToDisplayCardViewWithCompletionBlock:v12];
}

- (id)lockScreenRecordingViewController
{
  p_lockScreenRecordingViewController = &self->_lockScreenRecordingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  if (!WeakRetained)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000AC74C;
    v39[3] = &unk_100221278;
    v39[4] = self;
    +[CATransaction setCompletionBlock:v39];
    id v5 = [(RCMainViewController *)self browseFoldersViewController];
    id v6 = [v5 recordingViewController];

    id v7 = [v6 view];
    [v7 cancelTextEditing];

    id WeakRetained = objc_opt_new();
    id v8 = objc_storeWeak((id *)p_lockScreenRecordingViewController, WeakRetained);
    [WeakRetained setRecordingViewControllerDelegate:self];

    id v9 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    id v10 = [v9 view];
    [v10 prepareForPresent:1];

    id v11 = [v6 view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    id v20 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    long long v21 = [v20 view];
    [v21 setFrame:v13, v15, v17, v19];

    id v22 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    double v23 = [v22 view];
    [v23 setDisplayStyle:3];

    id v24 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    double v25 = [v24 view];
    long long v26 = [v25 transcriptionButton];
    [v26 rc_setEnabled:0];

    id v27 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    [v27 restyle];

    id v28 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    [v28 updateForRecordingStart:0];

    id v29 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    id v30 = [(RCMainViewController *)self mainControllerHelper];
    long long v31 = [v30 currentRecordingDisplayModel];
    [v29 updateWithRecordingModel:v31];

    id v32 = [(RCMainViewController *)self mainControllerHelper];
    id v33 = [v32 timeController];
    id v34 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    [v34 setActiveTimeController:v33];

    id v35 = [v6 trackInfoRepository];
    id v36 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    [v36 setTrackInfoRepository:v35];

    id v37 = objc_loadWeakRetained((id *)p_lockScreenRecordingViewController);
    [v37 copyDataSourcesFromRecordingViewController:v6];

    +[CATransaction commit];
  }

  return WeakRetained;
}

- (void)removeLockScreenRecordingViewController
{
}

- (void)expandCardFromLockScreenInput
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 recordingViewController];
  id v5 = [v4 view];
  id v6 = [v5 displayStyle];

  if (v6 == (id)2)
  {
    id v9 = [(RCMainViewController *)self browseFoldersViewController];
    id v7 = [v9 recordingViewController];
    id v8 = [v7 view];
    [v8 toggleFullCompact];
  }
}

- (void)performDoneButtonFromLockScreenInput
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v2 = [v3 recordingViewController];
  [v2 handleDone];
}

- (id)platterViewControllerForPresentationStyle:(unint64_t)a3
{
  id v4 = [[RCPlatterViewController alloc] initWithPresentationStyle:a3];
  id v5 = [(RCMainViewController *)self mainControllerHelper];
  id v6 = [v5 timeController];
  [(RCPlatterViewController *)v4 setActiveTimeController:v6];

  id v7 = [(RCMainViewController *)self mainControllerHelper];
  id v8 = [v7 activityWaveformProcessor];
  [(RCPlatterViewController *)v4 setActivityWaveformProcessor:v8];

  id v9 = [(RCMainViewController *)self mainControllerHelper];
  id v10 = [v9 timeController];
  [v10 addTimeObserver:v4];

  return v4;
}

- (void)_switchToCapturingFromPreviousActivityType:(int64_t)a3 displayModel:(id)a4 waveformDataSource:(id)a5 isReplaceOrAppend:(BOOL)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000ACAA0;
  v9[3] = &unk_100222620;
  BOOL v13 = a6;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(RCMainViewController *)v10 _prepareToDisplayCardViewWithCompletionBlock:v9];
}

- (void)_prepareToDisplayCardViewWithCompletionBlock:(id)a3
{
  id v9 = (void (**)(void))a3;
  uint64_t v4 = [(RCMainViewController *)self presentedViewController];
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = (void *)v4;
  id v6 = [(RCMainViewController *)self presentedViewController];
  id v7 = [(RCMainViewController *)self presentedCardViewController];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(RCMainViewController *)self dismissViewControllerAnimated:0 completion:v9];
  }
  else {
LABEL_3:
  }
    v9[2]();
}

- (void)_setCorrectOriginalFolderForRecordingWithUUID:(id)a3 folderType:(int64_t)a4 userFolderName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8 && a4)
  {
    if (a4 == 1)
    {
      [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor setFavorite:1 forUUID:v8];
    }
    else if (a4 == 4)
    {
      id v13 = v8;
      id v10 = +[NSArray arrayWithObjects:&v13 count:1];
      [(RCMainViewController *)self moveRecordingsWithUUIDs:v10 toUserFolderNamed:v9 source:0];
    }
    else
    {
      id v12 = v8;
      id v11 = +[NSArray arrayWithObjects:&v12 count:1];
      [(RCMainViewController *)self moveRecordingsWithUUIDs:v11 toBuiltInFolderOfType:a4 source:0];
    }
  }
}

- (void)_switchToIdleFromPreviousActivityType:(int64_t)a3 fromSubActivityType:(int64_t)a4 toSubActivityType:(int64_t)a5 displayModel:(id)a6 withUUID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  double v14 = [(RCMainViewController *)self browseFoldersViewController];
  double v15 = [v14 recordingViewController];

  double v16 = [(RCMainViewController *)self playbackViewController];
  [v16 showIdleForUUID:v13];

  if (a3 == 1)
  {
    if ([(RCMainViewController *)self _cardDismissalRequiredForSwitchToIdleFromActivityType:1 subActivityType:a4])
    {
      objc_initWeak(&location, self);
      long long v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      id v28 = sub_1000AD3A0;
      id v29 = &unk_1002214F8;
      objc_copyWeak(&v30, &location);
      [(RCMainViewController *)self setState:0 withOptions:0 completion:&v26];
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    BOOL v17 = a4 == 4;
    [v15 updateForRecordingEnd:v17, v26, v27, v28, v29];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
    [WeakRetained updateForRecordingEnd:v17];
  }
  else if (a5 != 6)
  {
    double v19 = [(RCMainViewController *)self browseFoldersViewController];
    id v20 = [v19 activeRecordingsCollectionViewController];
    [v20 showIdleForItemWithUUID:v13];

    long long v21 = [(RCMainViewController *)self mainControllerHelper];
    id v22 = [v21 uuidOfPlayingRecording];
    [v15 showIdleForUUID:v22];

    id v23 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
    id v24 = [(RCMainViewController *)self mainControllerHelper];
    double v25 = [v24 uuidOfPlayingRecording];
    [v23 showIdleForUUID:v25];
  }
  [(RCMainViewController *)self updateQuickActions];
}

- (BOOL)_cardDismissalRequiredForSwitchToIdleFromActivityType:(int64_t)a3 subActivityType:(int64_t)a4
{
  return +[RCUserActivity requiresDismissalAtEndOfCaptureForActivityType:a3 subActivityType:a4];
}

- (void)captureFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if (![v5 isEqualToString:RCVoiceMemosErrorDomain]) {
    goto LABEL_4;
  }
  id v6 = [v4 code];

  if (!v6)
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"ERROR_RECORDING_FAILED" value:&stru_100228BC8 table:0];
    id v9 = [v4 localizedDescription];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_1000AD6C4;
    v16[3] = &unk_100221278;
    v16[4] = self;
    id v5 = +[UIAlertController rc_OKAlertControllerWithTitle:v8 message:v9 handler:v16];

    id v10 = [(RCMainViewController *)self browseFoldersViewController];
    id v11 = [v10 activeRecordingsCollectionViewController];
    [v11 presentViewController:v5 animated:1 completion:0];

LABEL_4:
  }
  id v12 = [v4 domain];
  if ([v12 isEqualToString:@"VMAudioServiceErrorDomain"]
    && [v4 code] == (id)6)
  {
    int64_t v13 = [(RCMainViewController *)self state];

    if (v13 != 1) {
      goto LABEL_10;
    }
    id v12 = [(RCMainViewController *)self browseFoldersViewController];
    double v14 = [v12 recordingViewController];
    [v14 handleDone];
  }
LABEL_10:
  double v15 = [(RCMainViewController *)self selectedUUID];
  if (v15) {
    [(RCMainViewController *)self didSelectForUUID:v15 resetPosition:0 force:1];
  }
}

- (void)recordingDurationUpdated:(double)a3
{
  if ([(RCMainViewController *)self isRecording]) {
    return;
  }
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  id v6 = [v5 recordingViewController];
  id v7 = [v6 view];
  [v7 setRecordingDuration:a3];

  id v30 = [(RCMainViewController *)self selectedComposition];
  id v8 = [v30 savedRecordingUUID];
  id v9 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v8];

  if (v30)
  {
    if (v9)
    {
      [v9 duration];
      if (v10 == a3) {
        goto LABEL_6;
      }
      id v11 = [v9 title];
      id v12 = [v9 creationDate];
      int64_t v13 = [v9 UUID];
      id v14 = [v9 recentlyDeleted];
      id v15 = [v9 isFavorite];
      unsigned __int8 v16 = [v9 isEnhanced];
      unsigned __int8 v17 = [v9 hasTranscription];
      BYTE2(v29) = [v9 wasManuallyRenamed];
      BYTE1(v29) = v17;
      LOBYTE(v29) = v16;
      uint64_t v18 = +[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v11, v12, v13, v14, 0, v15, a3, v29);

      id v9 = (void *)v18;
      if (v18)
      {
LABEL_6:
        double v19 = [(RCMainViewController *)self mainControllerHelper];
        id v20 = [v19 currentRecordingDisplayModel];

        if (v20 != v9)
        {
          long long v21 = [(RCMainViewController *)self mainControllerHelper];
          [v21 setCurrentRecordingDisplayModel:v9];
        }
        id v22 = [(RCMainViewController *)self presentedCardViewController];
        if (v22) {
          goto LABEL_11;
        }
        id v23 = [(RCMainViewController *)self playbackViewController];
        id v24 = [v23 uuidBeingDisplayed];
        double v25 = [v9 UUID];
        unsigned int v26 = [v24 isEqualToString:v25];

        if (v26)
        {
          id v22 = [(RCMainViewController *)self playbackViewController];
          uint64_t v27 = [(RCMainViewController *)self mainControllerHelper];
          id v28 = [v27 timeController];
          [v22 enablePlaybackWithComposition:v30 displayModel:v9 timeController:v28];

LABEL_11:
        }
      }
    }
  }
}

- (NSString)selectedUUID
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 selectedRecording];

  id v4 = [v3 uuid];

  return (NSString *)v4;
}

- (void)setCurrentTime:(double)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(RCMainViewController *)self browseFoldersViewController];
  id v8 = [v7 activeRecordingsCollectionViewController];
  [v8 setCurrentTime:v6 forItemWithUUID:a3];

  id v9 = [(RCMainViewController *)self browseFoldersViewController];
  double v10 = [v9 recordingViewController];
  [v10 updateCurrentTimeForUUID:v6 toTime:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
  [WeakRetained updateCurrentTimeForUUID:v6 toTime:a3];

  id v12 = [(RCMainViewController *)self playbackViewController];
  [v12 updateCurrentTimeForUUID:v6 toTime:a3];
}

- (void)userDidDeleteRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  [(RCMainViewController *)self _dismissShareMemoVCIfNeededForDeletedUUIDs:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
        id v11 = [(RCMainViewController *)self browseFoldersViewController];
        id v12 = [v11 activeRecordingsCollectionViewController];
        [v12 handleDeleteForUUID:v10];

        int64_t v13 = [(RCMainViewController *)self browseFoldersViewController];
        id v14 = [v13 recordingViewController];
        [v14 handleRemovalOfUUID:v10];

        id v15 = [(RCMainViewController *)self playbackViewController];
        [v15 handleRemovalOfUUID:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(RCMainViewController *)self updateQuickActions];
}

- (void)userDidRecoverRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        uint64_t v10 = [(RCMainViewController *)self playbackViewController];
        [v10 handleRemovalOfUUID:v9];

        id v11 = [(RCMainViewController *)self browseFoldersViewController];
        id v12 = [v11 activeRecordingsCollectionViewController];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v12 handleRecoverForUUID:v9];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)userDidEraseRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  [(RCMainViewController *)self _dismissShareMemoVCIfNeededForDeletedUUIDs:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = [(RCMainViewController *)self playbackViewController];
        [v11 handleRemovalOfUUID:v10];

        id v12 = [(RCMainViewController *)self browseFoldersViewController];
        long long v13 = [v12 activeRecordingsCollectionViewController];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 handleEraseForUUID:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(RCMainViewController *)self updateQuickActions];
}

- (void)_dismissShareMemoVCIfNeededForDeletedUUIDs:(id)a3
{
  id v8 = a3;
  id v4 = +[RCShareMemoViewController presentedController];
  if (v4)
  {
    id v5 = [(RCMainViewController *)self browseFoldersViewController];
    id v6 = [v5 activeRecordingsCollectionViewController];
    id v7 = [v6 uuidOfSelectedItem];

    if ([v8 containsObject:v7]) {
      [v4 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (RCUndoManager)undoManager
{
  return self->_currentUndoManager;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return [(RCMainViewController *)self _sharedAnimationControllerResolverForFromVC:a5 toVC:a6];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[RCMainViewController _sharedAnimationControllerResolverForFromVC:toVC:](self, "_sharedAnimationControllerResolverForFromVC:toVC:", a4, a3, a5);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [(RCMainViewController *)self _sharedAnimationControllerResolverForFromVC:a3 toVC:0];
}

- (id)_sharedAnimationControllerResolverForFromVC:(id)a3 toVC:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  objc_opt_class();
  int v9 = objc_opt_isKindOfClass();

  uint64_t v10 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v11 = [v10 animatesRecordingCardPresentation];

  id v12 = 0;
  if (v11 && ((isKindOfClass | v9) & 1) != 0)
  {
    id v12 = objc_alloc_init((Class)_UISheetAnimationController);
    [v12 setIsReversed:(isKindOfClass & 1) == 0];
    long long v13 = [(RCMainViewController *)self browseFoldersViewController];
    long long v14 = [v13 recordingViewController];
    long long v15 = [v14 view];

    [v15 intrinsicHeightForBottomAccessoryViewAndSafeArea];
    double v17 = v16;
    [v15 frame];
    if (CGRectIsEmpty(v29))
    {
      long long v18 = [(RCMainViewController *)self splitViewController];
      long long v19 = [v18 viewControllerForColumn:1];
      id v20 = [v19 view];
      [v20 width];
      double v22 = v21;
      [v20 bounds];
      double v24 = v23;
    }
    else
    {
      [v15 bounds];
      double v22 = v25;
      long long v18 = [v15 window];
      [v18 bounds];
      double v24 = v26;
    }

    [v12 setSourceFrame:0.0, v24 - v17, v22, v17];
  }

  return v12;
}

- (BOOL)_shouldPresentPlaybackQuickActions
{
  unsigned __int8 v3 = [(RCMainViewController *)self _isRecordingOrBlockedByModal];
  return (v3 | [(RCMainViewController *)self _libraryIsEditing]) ^ 1;
}

- (void)updateQuickActions
{
  id v4 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [(RCMainViewController *)self availableQuickActions];
  [v4 setShortcutItems:v3];
}

- (id)availableQuickActions
{
  unsigned __int8 v3 = +[NSMutableArray array];
  if ([(RCMainViewController *)self canStartNewRecording])
  {
    id v4 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"largecircle.fill.circle"];
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"START_RECORDING_QUICK_ACTION_TITLE" value:&stru_100228BC8 table:@"Localizable-OrbHW"];

    id v7 = [objc_alloc((Class)UIApplicationShortcutItem) initWithType:@"com.apple.VoiceMemos.NewRecording" localizedTitle:v6 localizedSubtitle:0 icon:v4 userInfo:0];
    [v3 addObject:v7];
  }
  if ([(RCMainViewController *)self _shouldPresentPlaybackQuickActions])
  {
    long long v18 = +[RCApplicationModel sharedApplicationModel];
    id v8 = [v18 recordings];
    for (unint64_t i = 0; i != 3; ++i)
    {
      if (i >= (unint64_t)[v8 count]) {
        break;
      }
      uint64_t v10 = [v8 objectAtIndexedSubscript:i];
      unsigned int v11 = [v10 title];
      id v12 = [v10 uuid];
      if ([v11 length] && objc_msgSend(v12, "length"))
      {
        long long v13 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"play.circle"];
        id v14 = objc_alloc((Class)UIApplicationShortcutItem);
        CFStringRef v19 = @"uniqueID";
        id v20 = v12;
        long long v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        id v16 = [v14 initWithType:@"com.apple.VoiceMemos.PlayRecording" localizedTitle:v11 localizedSubtitle:0 icon:v13 userInfo:v15];

        [v3 addObject:v16];
      }
    }
  }

  return v3;
}

- (BOOL)canHandleCustomAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 modifierFlags] & 0x100000) != 0
    || ([(RCMainViewController *)self isFirstResponder] & 1) != 0)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    double v21 = +[UIResponder currentFirstResponder];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v6 = [v21 isEditing];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  id v7 = [(RCMainViewController *)self presentedViewController];
  id v8 = [(RCMainViewController *)self presentedCardViewController];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [(RCMainViewController *)self presentedCardViewController];
    unsigned int v11 = [v10 presentedViewController];

    if (v11)
    {
      id v12 = [(RCMainViewController *)self presentedCardViewController];
      uint64_t v13 = [v12 presentedViewController];

      char v14 = 0;
      id v7 = (void *)v13;
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
  }
  long long v15 = [(RCMainViewController *)self presentedViewController];

  id v16 = [v7 modalPresentationStyle];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);

  if (v15) {
    char v18 = v14;
  }
  else {
    char v18 = 1;
  }
  if (v16 == (id)7) {
    char v18 = 1;
  }
  if (WeakRetained) {
    char v18 = 0;
  }
  if (v6) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v18;
  }

  return v19;
}

- (BOOL)canStartNewRecording
{
  unsigned int v3 = [(RCMainViewController *)self _isRecordingOrBlockedByModal];
  id v4 = [(RCMainViewController *)self activeFolderViewController];
  if (v4)
  {
    id v5 = [(RCMainViewController *)self activeFolderViewController];
    unsigned int v6 = [v5 supportsRecording];

    int v7 = v6 ^ 1;
  }
  else
  {
    int v7 = 0;
  }

  return ((v3 | v7) & 1) == 0 && !self->_viewIsAppearingOrDisappearing;
}

- (BOOL)_isRecordingOrBlockedByModal
{
  uint64_t v3 = [(RCMainViewController *)self mainControllerHelper];
  unsigned __int8 v4 = [(id)v3 isRecording];

  id v5 = [(RCMainViewController *)self mainViewControllerDelegate];
  LOBYTE(v3) = [v5 modalMustShowOrIsShowing];

  return v4 | v3;
}

- (BOOL)_libraryIsEditing
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  uint64_t v3 = [v2 activeRecordingsCollectionViewController];
  unsigned __int8 v4 = [v3 isEditing];

  return v4;
}

- (void)startNewRecordingAction
{
  id v5 = [(RCMainViewController *)self selectedComposition];
  if (!v5
    || ([v5 savedRecordingUUID],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        unsigned __int8 v4 = v5,
        v3))
  {
    [(RCMainViewController *)self performAction:3 atPosition:0 forUUID:0 sourceController:0 source:0.0];
    unsigned __int8 v4 = v5;
  }
}

- (BOOL)canPlayRecording
{
  uint64_t v3 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v4 = [v3 activeRecordingsCollectionViewController];

  id v5 = [(RCMainViewController *)self mainControllerHelper];
  if ([v5 isRecording])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v7 = [(RCMainViewController *)self mainControllerHelper];
    if ([v7 readyForPlayback])
    {
      id v8 = [(RCMainViewController *)self _uuidOfRecordingForPlaybackActivities];
      if (v8)
      {
        unsigned int v9 = [(RCMainViewController *)self playbackViewController];
        uint64_t v10 = [v9 view];
        if (([v10 textFieldIsBeingEdited] & 1) != 0
          || ([v4 selectedCellIsEditingTitle] & 1) != 0
          || ([v4 selectedCellIsInFlightEditing] & 1) != 0)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          id v12 = [(RCMainViewController *)self browseFoldersViewController];
          uint64_t v13 = [v12 recordingViewController];
          char v14 = [v13 view];
          unsigned int v6 = [v14 textFieldIsBeingEdited] ^ 1;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)playRecording
{
  id v3 = [(RCMainViewController *)self _uuidOfRecordingForPlaybackActivities];
  [(RCMainViewController *)self performAction:2 atPosition:v3 forUUID:0 sourceController:0 source:0.0];
}

- (BOOL)canRenameRecording
{
  id v3 = [(RCMainViewController *)self playbackViewController];
  unsigned __int8 v4 = [v3 uuidBeingDisplayed];
  if (v4)
  {
    id v5 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v6 = [v5 recordingViewController];
    int v7 = [v6 uuidBeingDisplayed];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)renameRecording
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v2 = [v3 activeRecordingsCollectionViewController];
  [v2 editSelectedItemTitle];
}

- (BOOL)canShareRecording
{
  id v3 = [(RCMainViewController *)self playbackViewController];
  unsigned __int8 v4 = [v3 uuidBeingDisplayed];
  if (v4)
  {
    id v5 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v6 = [v5 activeRecordingsCollectionViewController];
    unsigned int v7 = [v6 selectedCellIsInFlightEditing] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)shareRecording:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainViewController *)self playbackViewController];
  [v5 shareCurrentRecording:v4];
}

- (BOOL)canDuplicateRecording
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 activeRecordingsCollectionViewController];
  id v5 = [v4 selectedUUIDs];

  if ([v5 count] == (id)1) {
    BOOL v6 = [(RCMainViewController *)self _canDuplicate];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)canEditRecording
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 activeRecordingsCollectionViewController];

  if ([(RCMainViewController *)self state])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v6 = [(RCMainViewController *)self playbackViewController];
    unsigned int v7 = [v6 uuidBeingDisplayed];
    if (!v7
      || ([v4 selectedCellIsEditingTitle] & 1) != 0
      || ([v4 selectedCellIsInFlightEditing] & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      unsigned int v9 = [(RCMainViewController *)self browseFoldersViewController];
      unsigned int v5 = [v9 isShowingRecentlyDeleted] ^ 1;
    }
  }

  return v5;
}

- (BOOL)canTrimRecording
{
  unsigned __int8 v3 = [(RCMainViewController *)self isRecording];
  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v5 = [v4 recordingViewController];
  BOOL v6 = [v5 view];
  id v7 = [v6 recordingViewState];

  BOOL v8 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v9 = [v8 recordingViewController];
  if ([v9 isDisplayingTranscriptView])
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned int v11 = [(RCMainViewController *)self playbackViewController];
    unsigned __int8 v10 = [v11 isDisplayingTranscriptView];
  }
  uint64_t v13 = [(RCMainViewController *)self browseFoldersViewController];
  id v12 = [v13 activeRecordingsCollectionViewController];

  LOBYTE(v13) = 0;
  if (v7 == (id)8) {
    char v14 = 1;
  }
  else {
    char v14 = v3;
  }
  if ((v14 & 1) == 0 && (v10 & 1) == 0)
  {
    long long v15 = [(RCMainViewController *)self playbackViewController];
    id v16 = [v15 uuidBeingDisplayed];
    if (!v16
      || ([v12 selectedCellIsEditingTitle] & 1) != 0
      || ([v12 selectedCellIsInFlightEditing] & 1) != 0)
    {
      LOBYTE(v13) = 0;
    }
    else
    {
      char v18 = [(RCMainViewController *)self browseFoldersViewController];
      LODWORD(v13) = [v18 isShowingRecentlyDeleted] ^ 1;
    }
  }

  return (char)v13;
}

- (BOOL)canToggleFavoriteRecording
{
  unsigned __int8 v3 = [(RCMainViewController *)self playbackViewController];
  id v4 = [v3 uuidBeingDisplayed];
  if (v4)
  {
    unsigned int v5 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned int v6 = [v5 isShowingRecentlyDeleted] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)canToggleEnhanceRecording
{
  if ([(RCMainViewController *)self isRecording])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(RCMainViewController *)self playbackViewController];
    unsigned int v5 = [v4 uuidBeingDisplayed];
    if (v5)
    {
      unsigned int v6 = [(RCMainViewController *)self browseFoldersViewController];
      unsigned int v3 = [v6 isShowingRecentlyDeleted] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)canToggleRemoveSilence
{
  if ([(RCMainViewController *)self isRecording])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(RCMainViewController *)self playbackViewController];
    unsigned int v5 = [v4 uuidBeingDisplayed];
    if (v5)
    {
      unsigned int v6 = [(RCMainViewController *)self browseFoldersViewController];
      unsigned int v3 = [v6 isShowingRecentlyDeleted] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)duplicateRecording
{
  id v5 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned int v3 = [v5 activeRecordingsCollectionViewController];
  id v4 = [v3 uuidOfSelectedRecording];
  [(RCMainViewController *)self performAction:13 atPosition:v4 forUUID:0 sourceController:0 source:0.0];
}

- (void)editRecording
{
  unsigned int v3 = [(RCMainViewController *)self mainControllerHelper];
  id v4 = [v3 currentRecordingDisplayModel];
  id v6 = [v4 UUID];

  if (v6)
  {
    id v5 = [(RCMainViewController *)self playbackViewController];
    [v5 stopScrolling];

    [(RCMainViewController *)self performAction:23 atPosition:v6 forUUID:0 sourceController:0 source:0.0];
  }
}

- (void)trimRecording
{
  unsigned int v3 = [(RCMainViewController *)self playbackViewController];
  id v4 = [v3 uuidBeingDisplayed];

  if (v4)
  {
    id v5 = [(RCMainViewController *)self playbackViewController];
    [v5 stopScrolling];

    id v7 = [(RCMainViewController *)self playbackViewController];
    id v6 = [v7 uuidBeingDisplayed];
    [(RCMainViewController *)self performAction:31 atPosition:v6 forUUID:0 sourceController:0 source:0.0];
  }
}

- (BOOL)currentSelectionIsFavorite
{
  unsigned int v3 = [(RCMainViewController *)self playbackViewController];
  id v4 = [v3 uuidBeingDisplayed];

  if (v4) {
    BOOL v5 = [(RCMainViewController *)self isFavoriteForUUID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)toggleFavoriteRecording
{
  unsigned int v3 = [(RCMainViewController *)self playbackViewController];
  id v5 = [v3 uuidBeingDisplayed];

  id v4 = v5;
  if (v5)
  {
    [(RCMainViewController *)self toggleFavoriteForUUID:v5];
    id v4 = v5;
  }
}

- (BOOL)currentSelectionIsEnhanced
{
  id v2 = [(RCMainViewController *)self playbackViewController];
  unsigned int v3 = [v2 uuidBeingDisplayed];

  if (v3)
  {
    id v4 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v3];
    unsigned __int8 v5 = [v4 isEnhanced];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)toggleEnhanceRecording
{
  id v4 = [(RCMainViewController *)self playbackViewController];
  unsigned int v3 = [v4 uuidBeingDisplayed];
  [(RCMainViewController *)self toggleEnhanceRecordingForUUID:v3];
}

- (void)toggleEnhanceRecordingForUUID:(id)a3
{
  id v7 = a3;
  id v4 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:");
  unsigned __int8 v5 = v4;
  if (v4)
  {
    if ([v4 isEnhanced]) {
      uint64_t v6 = 41;
    }
    else {
      uint64_t v6 = 40;
    }
    [(RCMainViewController *)self performAction:v6 atPosition:v7 forUUID:0 sourceController:0 source:0.0];
  }
}

- (BOOL)currentSelectionHasSilenceRemoved
{
  unsigned int v3 = [(RCMainViewController *)self playbackViewController];
  id v4 = [v3 uuidBeingDisplayed];

  if (v4
    && ([(RCMainViewController *)self playbackSettings],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        [v5 uuid],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqual:v4],
        v6,
        v5,
        v7))
  {
    BOOL v8 = [(RCMainViewController *)self playbackSettings];
    unsigned __int8 v9 = [v8 silenceRemoved];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)toggleRemoveSilence
{
  id v4 = [(RCMainViewController *)self playbackViewController];
  unsigned int v3 = [v4 uuidBeingDisplayed];
  [(RCMainViewController *)self toggleRemoveSilenceForUUID:v3];
}

- (void)toggleRemoveSilenceForUUID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(RCMainViewController *)self playbackSettings];
  uint64_t v6 = [v5 uuid];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    BOOL v8 = [(RCMainViewController *)self playbackSettings];
    uint64_t v9 = [v8 silenceRemoved] ^ 1;

    [(RCMainViewController *)self setRemoveSilence:v9 forUUID:v4];
  }
  else
  {
    unsigned __int8 v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10016E02C((uint64_t)v4, self, v10);
    }
  }
}

- (void)displayPlaybackSettingsUI
{
  unsigned int v3 = [(RCMainViewController *)self playbackSettings];
  id v4 = [v3 uuid];

  unsigned __int8 v5 = [(RCMainViewController *)self playbackViewController];
  uint64_t v6 = [(RCMainViewController *)self _uuidOfRecordingForPlaybackActivities];
  unsigned int v7 = (void *)v6;
  if (v4 && (!v6 || ([v4 isEqual:v6] & 1) != 0))
  {
    BOOL v8 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v9 = [v8 supportsPopoverPlaybackSettingsPresentation];

    if (v9)
    {
      id v10 = v5;
      unsigned int v11 = [v10 playbackSettingsButtonItem];
    }
    else
    {
      id v10 = 0;
      unsigned int v11 = 0;
    }
    [(RCMainViewController *)self performAction:44 atPosition:v4 forUUID:v10 sourceController:v11 source:0.0];
  }
  else
  {
    id v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10016E100(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)toggleTranscriptView
{
  unsigned int v3 = [(RCMainViewController *)self presentedCardViewController];

  if (v3)
  {
    id v4 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned __int8 v5 = [v4 recordingViewController];
    [v5 toggleTranscriptView];
  }
  id v6 = [(RCMainViewController *)self playbackViewController];
  [v6 toggleTranscriptView];
}

- (void)copyTranscript:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 transcriptionStringForRecordingUUID:v3 completionHandler:&stru_100223110];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (![(RCMainViewController *)self canHandleCustomAction:a3 withSender:a4]
    || "delete:" != a3)
  {
    return 0;
  }

  return [(RCMainViewController *)self canDelete];
}

- (BOOL)canDelete
{
  id v3 = [(RCMainViewController *)self presentedConfirmationController];

  if (v3) {
    return 0;
  }

  return [(RCMainViewController *)self _canDelete];
}

- (void)delete:(id)a3
{
  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v5 = [v4 activeRecordingsCollectionViewController];
  unsigned __int8 v6 = [v5 selectedCellIsEditingTitle];

  if (v6) {
    return;
  }
  unsigned int v7 = [(RCMainViewController *)self browseFoldersViewController];
  BOOL v8 = [v7 activeRecordingsCollectionViewController];

  unsigned int v9 = [(RCMainViewController *)self browseFoldersViewController];
  if ([v9 isShowingRecentlyDeleted]) {
    uint64_t v10 = 18;
  }
  else {
    uint64_t v10 = 15;
  }

  int64_t v11 = [(RCMainViewController *)self state];
  if (v11 == 1)
  {
    uint64_t v14 = [(RCMainViewController *)self browseFoldersViewController];
    uint64_t v15 = [v14 recordingViewController];

    id v12 = v15;
    id v20 = [v12 uuidBeingDisplayed];
    uint64_t v16 = [v12 view];
    [(RCMainViewController *)self performAction:14 atPosition:v20 forUUID:v12 sourceController:v16 source:0.0];
  }
  else
  {
    if (v11)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = v8;
      if (![v12 isEditing]
        || ([v12 selectedUUIDs],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            !v13))
      {
        id v20 = [v12 uuidOfSelectedItem];
        uint64_t v17 = [v12 view];
        uint64_t v18 = [v17 window];
        if (v18)
        {
          uint64_t v19 = [v12 cellForUUID:v20];
        }
        else
        {
          uint64_t v19 = 0;
        }

        [(RCMainViewController *)self performAction:v10 atPosition:v20 forUUID:v12 sourceController:v19 source:0.0];
        goto LABEL_17;
      }
      [v12 deleteSelectedItems];
    }
    id v20 = 0;
  }
LABEL_17:
}

- (BOOL)canJumpForward
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 activeRecordingsCollectionViewController];

  unsigned __int8 v5 = [(RCMainViewController *)self playbackViewController];
  unsigned __int8 v6 = [v5 uuidBeingDisplayed];
  if (v6)
  {
    unsigned int v7 = [v5 view];
    if ([v7 textFieldIsBeingEdited])
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      unsigned int v9 = [(RCMainViewController *)self browseFoldersViewController];
      uint64_t v10 = [v9 recordingViewController];
      int64_t v11 = [v10 view];
      if (([v11 textFieldIsBeingEdited] & 1) != 0
        || ([v4 selectedCellIsEditingTitle] & 1) != 0
        || ([v4 selectedCellIsInFlightEditing] & 1) != 0)
      {
        unsigned __int8 v8 = 0;
      }
      else
      {
        uint64_t v13 = [(RCMainViewController *)self mainControllerHelper];
        unsigned __int8 v8 = [v13 canJumpForward];
      }
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)jumpSelectionForward
{
  id v3 = [(RCMainViewController *)self _uuidOfRecordingForPlaybackActivities];
  [(RCMainViewController *)self performAction:11 atPosition:v3 forUUID:0 sourceController:0 source:0.0];
}

- (BOOL)canJumpBackward
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 activeRecordingsCollectionViewController];

  unsigned __int8 v5 = [(RCMainViewController *)self playbackViewController];
  unsigned __int8 v6 = [v5 uuidBeingDisplayed];
  if (v6)
  {
    unsigned int v7 = [v5 view];
    if ([v7 textFieldIsBeingEdited])
    {
      unsigned __int8 v8 = 0;
    }
    else
    {
      unsigned int v9 = [(RCMainViewController *)self browseFoldersViewController];
      uint64_t v10 = [v9 recordingViewController];
      int64_t v11 = [v10 view];
      if (([v11 textFieldIsBeingEdited] & 1) != 0
        || ([v4 selectedCellIsEditingTitle] & 1) != 0
        || ([v4 selectedCellIsInFlightEditing] & 1) != 0)
      {
        unsigned __int8 v8 = 0;
      }
      else
      {
        uint64_t v13 = [(RCMainViewController *)self mainControllerHelper];
        unsigned __int8 v8 = [v13 canJumpBackward];
      }
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)jumpSelectionBackward
{
  id v3 = [(RCMainViewController *)self _uuidOfRecordingForPlaybackActivities];
  [(RCMainViewController *)self performAction:12 atPosition:v3 forUUID:0 sourceController:0 source:0.0];
}

- (BOOL)canHandleDone
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 recordingViewController];
  unsigned __int8 v5 = [v4 view];
  id v6 = [v5 recordingViewState];

  if (!v6) {
    return 0;
  }
  unsigned int v7 = [(RCMainViewController *)self browseFoldersViewController];
  unsigned __int8 v8 = [v7 recordingViewController];
  unsigned int v9 = [v8 view];
  id v10 = [v9 recordingViewState];

  if (v10 != (id)8) {
    return 1;
  }
  int64_t v11 = [(RCMainViewController *)self browseFoldersViewController];
  id v12 = [v11 recordingViewController];
  uint64_t v13 = [v12 view];
  unsigned __int8 v14 = [v13 canSaveTrimChanges];

  return v14;
}

- (void)handleDone
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v2 = [v3 recordingViewController];
  [v2 handleDone];
}

- (BOOL)canHandleCancel
{
  id v2 = [(RCMainViewController *)self browseFoldersViewController];
  id v3 = [v2 recordingViewController];
  id v4 = [v3 view];
  BOOL v5 = [v4 recordingViewState] == (id)8;

  return v5;
}

- (void)handleCancel
{
  id v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v2 = [v3 recordingViewController];
  [v2 handleCancel];
}

- (BOOL)canToggleSidebar
{
  int64_t v3 = [(RCMainViewController *)self state];
  uint64_t v4 = [(RCMainViewController *)self presentedViewController];
  int64_t v5 = v3 | v4;

  return v5 == 0;
}

- (void)recoverRecording
{
  id v4 = [(RCMainViewController *)self playbackViewController];
  int64_t v3 = [v4 uuidBeingDisplayed];
  [(RCMainViewController *)self performAction:20 atPosition:v3 forUUID:self sourceController:0 source:0.0];
}

- (void)eraseRecording
{
  id v4 = [(RCMainViewController *)self playbackViewController];
  int64_t v3 = [v4 uuidBeingDisplayed];
  [(RCMainViewController *)self performAction:17 atPosition:v3 forUUID:self sourceController:0 source:0.0];
}

- (id)_uuidOfRecordingForPlaybackActivities
{
  int64_t v3 = [(RCMainViewController *)self browseFoldersViewController];
  id v4 = [v3 activeRecordingsCollectionViewController];
  int64_t v5 = [v4 selectedRecording];
  id v6 = [v5 uuid];

  if (!v6)
  {
    unsigned int v7 = [(RCMainViewController *)self browseFoldersViewController];
    unsigned __int8 v8 = [v7 recordingViewController];
    id v6 = [v8 uuidBeingDisplayed];
  }

  return v6;
}

- (BOOL)_canDuplicate
{
  unsigned __int8 v3 = [(RCMainViewController *)self _canDelete];
  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  char v5 = [v4 isShowingRecentlyDeleted] ^ 1;

  return v3 & v5;
}

- (BOOL)_canDelete
{
  id v4 = [(RCMainViewController *)self browseFoldersViewController];
  char v5 = [v4 activeRecordingsCollectionViewController];

  if ([(RCMainViewController *)self isFirstResponder])
  {
    BOOL v6 = 0;
  }
  else
  {
    unsigned int v7 = +[UIResponder currentFirstResponder];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 selectedRange];
      BOOL v6 = v8 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  unsigned int v9 = [(RCMainViewController *)self playbackViewController];
  id v10 = [v9 uuidBeingDisplayed];
  if (!v10)
  {
    id v2 = [v5 uuidOfSelectedItem];
    if (!v2)
    {
      LOBYTE(v14) = 0;
LABEL_17:

      BOOL v15 = v14;
      goto LABEL_18;
    }
  }
  if (![(RCMainViewController *)self state]
    && ([v5 selectedCellIsEditingTitle] & 1) == 0
    && ([v5 selectedCellIsInFlightEditing] & 1) == 0)
  {
    int64_t v11 = [v5 searchController];
    id v12 = [v11 searchBar];
    uint64_t v13 = [v12 searchTextField];
    if (([v13 isEditing] & 1) == 0)
    {
      double v24 = [(RCMainViewController *)self playbackViewController];
      uint64_t v17 = [v24 view];
      if ([v17 textFieldIsBeingEdited])
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        double v23 = [(RCMainViewController *)self browseFoldersViewController];
        double v22 = [v23 recordingViewController];
        double v21 = [v22 view];
        if ([v21 textFieldIsBeingEdited])
        {
          LOBYTE(v14) = 0;
        }
        else
        {
          id v20 = [(RCMainViewController *)self browseFoldersViewController];
          uint64_t v19 = [v20 recordingViewController];
          uint64_t v18 = [v19 view];
          unsigned int v14 = ([v18 editingInFlight] | v6) ^ 1;
        }
      }

      BOOL v15 = v14;
      if (!v10) {
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  LOBYTE(v14) = 0;
  BOOL v15 = 0;
  if (!v10) {
    goto LABEL_17;
  }
LABEL_18:

  return v15;
}

- (void)_axAnnounceDidSetEnhanced:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSBundle mainBundle];
  char v5 = v4;
  if (v3) {
    CFStringRef v6 = @"AX_ENHANCE_ON_ANNOUNCE";
  }
  else {
    CFStringRef v6 = @"AX_ENHANCE_OFF_ANNOUNCE";
  }
  unsigned int v7 = [v4 localizedStringForKey:v6 value:&stru_100228BC8 table:0];

  dispatch_time_t v8 = dispatch_time(0, 800000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0738;
  block[3] = &unk_100221278;
  id v11 = v7;
  id v9 = v7;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (RCRecordingStartTimeInfo)recordingStartTimeInfo
{
  return self->recordingStartTimeInfo;
}

- (void)setRecordingStartTimeInfo:(id)a3
{
}

- (RCMainViewControllerDelegate)mainViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewControllerDelegate);

  return (RCMainViewControllerDelegate *)WeakRetained;
}

- (BOOL)hideNavigationTitle
{
  return self->_hideNavigationTitle;
}

- (void)setHideNavigationTitle:(BOOL)a3
{
  self->_hideNavigationTitle = a3;
}

- (BOOL)isInForeground
{
  return self->_isInForeground;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setMainControllerHelper:(id)a3
{
}

- (RCRecordingsModelInteractor)recordingsModelInteractor
{
  return self->_recordingsModelInteractor;
}

- (void)setRecordingsModelInteractor:(id)a3
{
}

- (RCRecordingCardViewController)presentedCardViewController
{
  return self->_presentedCardViewController;
}

- (void)setPresentedCardViewController:(id)a3
{
}

- (RCUndoManager)mainUndoManager
{
  return self->_mainUndoManager;
}

- (void)setMainUndoManager:(id)a3
{
}

- (NSString)uuidToSelectAfterDismiss
{
  return self->_uuidToSelectAfterDismiss;
}

- (void)setUuidToSelectAfterDismiss:(id)a3
{
}

- (NSMutableDictionary)editingProgressItems
{
  return self->_editingProgressItems;
}

- (void)setEditingProgressItems:(id)a3
{
}

- (UIViewController)presentedConfirmationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedConfirmationController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentedConfirmationController:(id)a3
{
}

- (RCFolderSelectionContainerViewController)presentedSelectFolderViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedSelectFolderViewController);

  return (RCFolderSelectionContainerViewController *)WeakRetained;
}

- (void)setPresentedSelectFolderViewController:(id)a3
{
}

- (RCPlaybackSettingsViewController)presentedPlaybackSettingsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedPlaybackSettingsViewController);

  return (RCPlaybackSettingsViewController *)WeakRetained;
}

- (void)setPresentedPlaybackSettingsViewController:(id)a3
{
}

- (UIViewController)presentingPlaybackSettingsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingPlaybackSettingsViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingPlaybackSettingsViewController:(id)a3
{
}

- (UIBarButtonItem)createNewFolderButtonItem
{
  return self->_createNewFolderButtonItem;
}

- (void)setCreateNewFolderButtonItem:(id)a3
{
}

- (UIBarButtonItem)flexBarItem
{
  return self->_flexBarItem;
}

- (void)setFlexBarItem:(id)a3
{
}

- (UIAlertAction)createNewFolderSaveAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewFolderSaveAction);

  return (UIAlertAction *)WeakRetained;
}

- (void)setCreateNewFolderSaveAction:(id)a3
{
}

- (UIAlertAction)renameFolderSaveAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renameFolderSaveAction);

  return (UIAlertAction *)WeakRetained;
}

- (void)setRenameFolderSaveAction:(id)a3
{
}

- (NSString)oldFolderName
{
  return self->_oldFolderName;
}

- (void)setOldFolderName:(id)a3
{
}

- (unint64_t)sheetPresentationState
{
  return self->_sheetPresentationState;
}

- (void)setSheetPresentationState:(unint64_t)a3
{
  self->_sheetPresentationState = a3;
}

- (unint64_t)activeDragSessionCount
{
  return self->_activeDragSessionCount;
}

- (void)setActiveDragSessionCount:(unint64_t)a3
{
  self->_unint64_t activeDragSessionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFolderName, 0);
  objc_destroyWeak((id *)&self->_renameFolderSaveAction);
  objc_destroyWeak((id *)&self->_createNewFolderSaveAction);
  objc_storeStrong((id *)&self->_flexBarItem, 0);
  objc_storeStrong((id *)&self->_createNewFolderButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingPlaybackSettingsViewController);
  objc_destroyWeak((id *)&self->_presentedPlaybackSettingsViewController);
  objc_destroyWeak((id *)&self->_presentedSelectFolderViewController);
  objc_destroyWeak((id *)&self->_presentedConfirmationController);
  objc_storeStrong((id *)&self->_editingProgressItems, 0);
  objc_storeStrong((id *)&self->_uuidToSelectAfterDismiss, 0);
  objc_storeStrong((id *)&self->_mainUndoManager, 0);
  objc_storeStrong((id *)&self->_presentedCardViewController, 0);
  objc_storeStrong((id *)&self->_browseFoldersViewController, 0);
  objc_storeStrong((id *)&self->_recordingsModelInteractor, 0);
  objc_storeStrong((id *)&self->_mainControllerHelper, 0);
  objc_storeStrong(&self->_foregroundCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_mainViewControllerDelegate);
  objc_destroyWeak((id *)&self->_playbackViewController);
  objc_storeStrong((id *)&self->recordingStartTimeInfo, 0);
  objc_destroyWeak((id *)&self->_lockScreenRecordingViewController);

  objc_storeStrong((id *)&self->_currentUndoManager, 0);
}

- (void)separateRecordingLayers:(id)a3
{
  uint64_t v4 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v4 - 8);
  CFStringRef v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  type metadata accessor for MainActor();
  id v11 = self;
  swift_bridgeObjectRetain();
  uint64_t v12 = static MainActor.shared.getter();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v7;
  v13[5] = v9;
  v13[6] = v11;
  sub_100151A10((uint64_t)v6, (uint64_t)&unk_100269EE8, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_release();
}

@end
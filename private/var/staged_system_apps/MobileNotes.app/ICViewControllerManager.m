@interface ICViewControllerManager
+ (BOOL)doesNoteCreateApproachUseSelectedContainerToInferSystemPaperness:(int64_t)a3;
+ (BOOL)isNoteCreateApproachForScrapPaper:(int64_t)a3;
+ (id)keyPathsForValuesAffectingSelectedContainerItemID;
+ (id)trimBuffer:(id)a3 toFrameLength:(unsigned int)a4;
+ (void)createDonationOf:(NSURL *)a3 transcript:(NSString *)a4 date:(NSDate *)a5 isFeedbackPositive:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)canAddNewNoteToSelectedContainers;
- (BOOL)canBeginEditingForNoteDisplayController:(id)a3;
- (BOOL)canPerformAddFolder;
- (BOOL)canPerformAddLink;
- (BOOL)canPerformAddNote;
- (BOOL)canPerformCmd1;
- (BOOL)canPerformCmd3;
- (BOOL)canPerformCmdReturnKey;
- (BOOL)canPerformCollapseAllSections;
- (BOOL)canPerformCollapseSection;
- (BOOL)canPerformDeleteKey;
- (BOOL)canPerformDeleteSystemPaperNote;
- (BOOL)canPerformEnclosingFolderKey;
- (BOOL)canPerformExpandAllSections;
- (BOOL)canPerformExpandSection;
- (BOOL)canPerformFindInNote;
- (BOOL)canPerformGotoNextNote;
- (BOOL)canPerformGotoPreviousNote;
- (BOOL)canPerformPrintNote;
- (BOOL)canPerformReplaceInNote;
- (BOOL)canPerformReturnKey;
- (BOOL)canPerformSystemPaperNavigateLeft;
- (BOOL)canPerformSystemPaperNavigateRight;
- (BOOL)canPerformSystemPaperShowInNotes;
- (BOOL)canPerformToggleEditorCallouts;
- (BOOL)canPerformToggleNoteActivity;
- (BOOL)canPerformToggleSearch;
- (BOOL)canTilePrimaryContent;
- (BOOL)canUserChangeNoteContainerViewMode;
- (BOOL)hasCompactHeight;
- (BOOL)hasCompactWidth;
- (BOOL)hasMultipleModernAccounts;
- (BOOL)hostedNotesAppearanceCoordinator:(id)a3 shouldHideWithModal:(id)a4;
- (BOOL)isApplyingStateRestoreArchive;
- (BOOL)isAttachmentBrowserVisible;
- (BOOL)isAutomaticallySelectingNotes;
- (BOOL)isAuxiliary;
- (BOOL)isFolderListVisible;
- (BOOL)isInHTMLEditorMode;
- (BOOL)isMainSplitViewColumnDisplaced;
- (BOOL)isMainSplitViewDisplayModeSecondaryOnly;
- (BOOL)isNoteBeingRecovered;
- (BOOL)isNoteEditorTopViewController;
- (BOOL)isNoteEditorVisible;
- (BOOL)isPrimaryContentVisible;
- (BOOL)isRecoveredNoteBeingPresented;
- (BOOL)isSearchActive;
- (BOOL)isSearchActiveWithQuery;
- (BOOL)isSelectedNoteTogglingLock;
- (BOOL)isSelectingNextRelevantNoteBrowseContainer;
- (BOOL)isSelectionAppropriateForObjectID:(id)a3;
- (BOOL)isShowingNoteBrowsersForContainerObjectIDs:(id)a3;
- (BOOL)isSplitViewExpandingOrCollapsing;
- (BOOL)isSupplementaryContentVisible;
- (BOOL)isTagBeingDeleted;
- (BOOL)isTagBeingRenamed;
- (BOOL)isTagSelected;
- (BOOL)isTrailingContentVisible;
- (BOOL)isTrashFolderSelected;
- (BOOL)isWelcomeScreenVisible;
- (BOOL)noteEditor:(id)a3 didTapAttachment:(id)a4;
- (BOOL)objectAlreadyLoadedInEditorWithObjectID:(id)a3;
- (BOOL)openURL:(id)a3;
- (BOOL)presentAttachment:(id)a3 delegate:(id)a4 displayShowInNote:(BOOL)a5 editable:(BOOL)a6 selectedSubAttachment:(id)a7 presentingViewController:(id)a8;
- (BOOL)presentAttachments:(id)a3 startingAtIndex:(unint64_t)a4 delegate:(id)a5 displayShowInNote:(BOOL)a6 editable:(BOOL)a7 selectedSubAttachment:(id)a8 presentingViewController:(id)a9;
- (BOOL)selectContainersForDeletedHashtagObjectIDs:(id)a3;
- (BOOL)selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:(id)a3 managedObjectContext:(id)a4;
- (BOOL)selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:(id)a3;
- (BOOL)selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:(id)a3;
- (BOOL)selectionStateTrackingEnabled;
- (BOOL)shouldAutomaticallySelectNoteContainerForSelectionStateController:(id)a3;
- (BOOL)shouldManagedObjectBecomeSelectedNote:(id)a3;
- (BOOL)shouldRevertToAllTagsWhenUnselectingTagsForSelectionStateController:(id)a3;
- (BOOL)shouldRevertToDefaultFolderWhenUnselectingTagsForSelectionStateController:(id)a3;
- (BOOL)shouldRevertToMostRecentlySelectedNonSearchObjectOnNavigationTransitionForSelectionStateController:(id)a3;
- (BOOL)shouldRevertToMostRecentlySelectedSearchResultOnNavigationTransitionForSelectionStateController:(id)a3;
- (BOOL)shouldSelectDefaultContainerWhenInappropriateForSelectionStateController:(id)a3;
- (BOOL)showsActivityStream;
- (BOOL)showsAttributionHighlights;
- (BOOL)validateStateRestoreArchive:(id)a3;
- (ICActivityStreamNavigationController)activityStreamNavigationController;
- (ICActivityStreamNavigationController)presentedActivityStreamNavigationController;
- (ICActivityStreamSelection)activityStreamSelection;
- (ICAttachmentPresenter)currentAttachmentPresenter;
- (ICBaseViewController)currentSearchBarViewController;
- (ICBrowseAttachmentsCollectionController)currentAttachmentBrowserViewController;
- (ICColumnVisibilityController)columnVisibilityController;
- (ICContentInsetViewController)primaryContainerViewController;
- (ICFolder)selectedSmartFolder;
- (ICFolderCreationController)folderCreationController;
- (ICFolderListViewController)folderListViewController;
- (ICHostedNotesAppearanceCoordinator)hostedNotesAppearanceCoordinator;
- (ICItemIdentifier)mostRecentNonSearchContainerItemID;
- (ICItemIdentifier)mostRecentRegularWidthSelectedNoteBrowseContainerItemID;
- (ICItemIdentifier)overrideContainerIdentifier;
- (ICItemIdentifier)selectedContainerItemID;
- (ICItemIdentifier)selectedNoteBrowseContainerItemID;
- (ICKeyboardHandler)keyboardHandler;
- (ICMainSplitViewController)mainSplitViewController;
- (ICNAEventReporter)eventReporter;
- (ICNote)selectedModernNote;
- (ICNoteBrowseViewController)currentNoteBrowseViewController;
- (ICNoteBrowseViewController)rootNoteBrowseViewController;
- (ICNoteEditing)activeEditorController;
- (ICNoteEditorViewController)noteEditorViewController;
- (ICNoteSearchViewController)searchController;
- (ICOverlayWindowPresenter)startupPresenter;
- (ICPersistenceConfiguration)persistenceConfiguration;
- (ICSearchResult)selectedSearchResult;
- (ICStartupNavigationController)startupNavigationController;
- (ICSystemPaperViewController)systemPaperViewController;
- (ICTTTextContentStorage)textContentStorage;
- (ICTagSelection)mostRecentRegularWidthTagSelection;
- (ICTagSelection)tagSelection;
- (ICTrailingSidebarContainerViewController)trailingSidebarContainerViewController;
- (ICTrailingSidebarSplitViewController)trailingSidebarSplitViewController;
- (ICTrailingSidebarViewControlling)trailingSidebarViewController;
- (ICViewControllerManager)init;
- (ICWindow)window;
- (ICWindowStateArchive)windowStateArchive;
- (NSArray)mostRecentSelections;
- (NSArray)selectedContainerObjectIDs;
- (NSDictionary)visibleObjectIDsForContainerObjectID;
- (NSManagedObjectContext)legacyManagedObjectContext;
- (NSManagedObjectContext)modernManagedObjectContext;
- (NSManagedObjectID)focusedNoteObjectID;
- (NSManagedObjectID)mostRecentRegularWidthSelectedNoteObjectID;
- (NSManagedObjectID)previousSelectedNoteObjectID;
- (NSManagedObjectID)selectedInvitationObjectID;
- (NSManagedObjectID)selectedNoteObjectID;
- (NSSet)excludedContainerIdentifiers;
- (NSSet)selectedContainerIdentifiers;
- (NSString)hostApplicationIdentifier;
- (NSString)title;
- (NSUndoManager)undoManager;
- (NSUndoManager)visibleViewsUndoManager;
- (NotesDisplayController)legacyNoteEditorViewController;
- (UIApplicationShortcutItem)selectedNewNoteShortcutItem;
- (UINavigationController)compactNavigationController;
- (UINavigationController)noteBrowseNavigationController;
- (UINavigationController)primaryNavigationController;
- (UINavigationController)secondaryNavigationController;
- (UINavigationController)supplementaryNavigationController;
- (UIViewController)childPrimaryViewController;
- (UIViewController)presentedActivityStreamPresentingViewController;
- (_TtC11MobileNotes26ICSelectionStateController)selectionStateController;
- (_TtC11MobileNotes33ICAppIntentsInteractionController)intentsInteractionController;
- (id)archiveForURL:(id)a3;
- (id)cmd3Title;
- (id)containerItemIDForContainerIdentifiers:(id)a3;
- (id)containerObjectIDForNewNoteWithApproach:(int64_t)a3;
- (id)createDeferredActionMenuElementForEditorViewController:(id)a3;
- (id)createNewNoteInContainerWithObjectID:(id)a3;
- (id)createNewNoteInContainerWithObjectID:(id)a3 isSystemPaper:(BOOL)a4;
- (id)defaultContainerObjectIDForNoteWithObjectID:(id)a3;
- (id)existingManagedObjectWithObjectID:(id)a3;
- (id)hostedNotesAppearanceCoordinatorModeButtonHidingModalTypes:(id)a3;
- (id)hostedNotesAppearanceCoordinatorModeButtonHidingPopoverTypes:(id)a3;
- (id)managedObjectIDFromURL:(id)a3;
- (id)noteObjectIDsWithQuery:(id)a3 managedObjectContext:(id)a4;
- (id)propertiesToUpdate;
- (id)quickNoteQueryOptionsFromEditor:(id)a3 additionalOptions:(id)a4;
- (id)selectedSmartFolder:(id)a3;
- (id)selectedSmartFolderNoteObjectIDs:(id)a3;
- (id)selectedTagsNoteObjectIDs:(id)a3;
- (id)selectedTagsNoteQuery:(id)a3;
- (id)selectionStateController:(id)a3 scrollStateForObjectID:(id)a4;
- (id)showNewNoteStartEditing:(BOOL)a3 inContainerWithObjectID:(id)a4 isSystemPaper:(BOOL)a5 showInkPicker:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (id)showNewNoteWithApproach:(int64_t)a3 sender:(id)a4 animated:(BOOL)a5;
- (id)showNewNoteWithApproach:(int64_t)a3 sender:(id)a4 recordAudio:(BOOL)a5 animated:(BOOL)a6;
- (id)toggleEditorCalloutsTitle;
- (id)toggleNoteActivityTitle;
- (int64_t)activityStreamViewMode;
- (int64_t)behavior;
- (int64_t)enforcedNoteContainerViewModeForContainerItemID:(id)a3;
- (int64_t)noteContainerViewMode;
- (int64_t)preferredNoteContainerViewMode;
- (int64_t)proposedMainSplitViewControllerDisplayMode;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (unint64_t)adjustedNumberOfGalleryViewColumns;
- (unint64_t)countOfAllVisibleAccounts;
- (void)accountsDidChange:(id)a3;
- (void)addNoteFromAirDropDocument:(id)a3;
- (void)addNoteFromPlaintextFile:(id)a3;
- (void)addSelectedHashtagsToNewNote:(id)a3;
- (void)adoptContainerFromSelectionStateController:(id)a3 oldModel:(id)a4;
- (void)adoptObjectFromSelectionStateController:(id)a3 oldModel:(id)a4 completion:(id)a5;
- (void)applyNoteViewModesToStateRestoreArchive:(id)a3 withContainerItemID:(id)a4;
- (void)applyStateRestoreArchive:(id)a3 completion:(id)a4;
- (void)clearRecentSelections;
- (void)closeAuxiliaryWindow;
- (void)closeAuxiliaryWindowAnimated:(BOOL)a3;
- (void)collectionViewWillDeleteTags:(id)a3;
- (void)collectionViewWillRenameTag:(id)a3;
- (void)deleteEmptyNoteIfNeeded:(id)a3;
- (void)didStartEditing:(id)a3;
- (void)didUpdateModelForSelectionStateController:(id)a3;
- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 forShowNote:(BOOL)a4 completion:(id)a5;
- (void)dismissOverlayContent;
- (void)dismissPrimaryOverlayContent;
- (void)dismissSupplementaryOverlayContent;
- (void)editorDidRecoverNote:(id)a3;
- (void)editorWillRecoverNote:(id)a3;
- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4;
- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4 dismissOverlayContent:(BOOL)a5;
- (void)ensureSearchVisible;
- (void)ensureSearchVisibleWhenApplyingArchive;
- (void)eventReporterLostSession:(id)a3;
- (void)folderWasCreated:(id)a3;
- (void)hideActivityStreamWithCompletion:(id)a3;
- (void)hideAttributionHighlights;
- (void)hidePresentedActivityStreamNavigationControllerWithCompletion:(id)a3;
- (void)initializeLegacyNoteEditor;
- (void)initializeMainSplitViewWithStateRestoreArchive:(id)a3;
- (void)initializeModernNoteEditorWithOptions:(unint64_t)a3;
- (void)initializeSecondaryNavigationControllerWithViewController:(id)a3;
- (void)initializeTrailingSidebarSplitViewWithStateRestoreArchive:(id)a3;
- (void)launchNotesAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4;
- (void)lockNotesNow;
- (void)managedObjectContextDidChange:(id)a3;
- (void)migrationStateDidChange:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)noteEditorDidTapActionMenu:(id)a3;
- (void)noteEditorDidTapAddPeople:(id)a3;
- (void)noteEditorDidTapAllNotes:(id)a3;
- (void)noteLockManagerDidToggleLock:(id)a3;
- (void)noteLockManagerWillToggleLock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performActionForShortcutItem:(id)a3;
- (void)performAddFolder:(id)a3;
- (void)performAddLinkKey:(id)a3;
- (void)performAddNote:(id)a3;
- (void)performCmd1:(id)a3;
- (void)performCmd2:(id)a3;
- (void)performCmd3:(id)a3;
- (void)performCmdReturnKey:(id)a3;
- (void)performCollapseAllSections:(id)a3;
- (void)performCollapseSection:(id)a3;
- (void)performDeleteKey:(id)a3;
- (void)performDeleteQuickNoteKey:(id)a3;
- (void)performEnclosingFolderKey:(id)a3;
- (void)performExpandAllSections:(id)a3;
- (void)performExpandSection:(id)a3;
- (void)performFindInNote:(id)a3;
- (void)performGotoNextNote:(id)a3;
- (void)performGotoPreviousNote:(id)a3;
- (void)performPrintNote:(id)a3;
- (void)performReplaceInNote:(id)a3;
- (void)performReturnKey:(id)a3;
- (void)performToggleEditorCallouts:(id)a3;
- (void)performToggleNoteActivity:(id)a3;
- (void)performToggleSearch:(id)a3;
- (void)presentActivityStreamForObject:(id)a3 viewMode:(int64_t)a4 animated:(BOOL)a5;
- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4;
- (void)searchQueryDidChange:(id)a3;
- (void)selectAttachmentWithObjectID:(id)a3 animated:(BOOL)a4;
- (void)selectContainerWithIdentifier:(id)a3 usingRootViewController:(BOOL)a4 deferUntilDataLoaded:(BOOL)a5 animated:(BOOL)a6;
- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 isChangingDisplayMode:(BOOL)a5 noteBrowseViewController:(id)a6 usingRootViewController:(BOOL)a7 deferUntilDataLoaded:(BOOL)a8 dismissOverlayContent:(id)a9 animated:(BOOL)a10 ensurePresented:(BOOL)a11 ensureSelectedNote:(id)a12 keepEditorShowing:(id)a13 dataIndexedBlock:(id)a14 dataRenderedBlock:(id)a15;
- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14;
- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 animated:(BOOL)a7;
- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 animated:(BOOL)a8;
- (void)selectInvitationWithObjectID:(id)a3 animated:(BOOL)a4;
- (void)selectModel:(id)a3;
- (void)selectNextContainerForDeletedFolder;
- (void)selectNextRelevantObjectUsingChangedInappropriateIdentifiers:(id)a3;
- (void)selectNoteStartEditingIfEmptyWithObjectID:(id)a3 scrollState:(id)a4 animated:(BOOL)a5 ensurePresented:(BOOL)a6;
- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 animated:(BOOL)a6 ensurePresented:(BOOL)a7;
- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10;
- (void)selectObjectWithObjectID:(id)a3;
- (void)selectTagSelection:(id)a3;
- (void)selectionStateController:(id)a3 didAdoptInstantNoteModelFromArchive:(id)a4;
- (void)selectionStateController:(id)a3 didAdoptModelFromArchive:(id)a4 systemPaperAlert:(BOOL)a5 completion:(id)a6;
- (void)selectionStateController:(id)a3 didAdoptModelFromOldModel:(id)a4 isNavigating:(BOOL)a5;
- (void)selectionStateController:(id)a3 didIgnoreDuplicateModel:(id)a4;
- (void)sendNotificationForNoteEditorSizeChange:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:(id)a3;
- (void)setActivityStreamNavigationController:(id)a3;
- (void)setActivityStreamSelection:(id)a3;
- (void)setColumnVisibilityController:(id)a3;
- (void)setCompactNavigationController:(id)a3;
- (void)setCurrentAttachmentPresenter:(id)a3;
- (void)setCurrentNoteBrowseViewController:(id)a3;
- (void)setCurrentNoteBrowseViewController:(id)a3 animated:(BOOL)a4 ensurePresented:(BOOL)a5 containerIdentifiers:(id)a6 excludingIdentifiers:(id)a7 ensureSelectedNote:(BOOL)a8 keepEditorShowing:(id)a9 dataIndexedBlock:(id)a10 dataRenderedBlock:(id)a11;
- (void)setEventReporter:(id)a3;
- (void)setExpandedForSectionsInSelectedRange:(BOOL)a3;
- (void)setFocusedNoteObjectID:(id)a3;
- (void)setFolderCreationController:(id)a3;
- (void)setFolderListViewController:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setHostedNotesAppearanceCoordinator:(id)a3;
- (void)setIsApplyingStateRestoreArchive:(BOOL)a3;
- (void)setIsAuxiliary:(BOOL)a3;
- (void)setIsMainSplitViewColumnDisplaced:(BOOL)a3;
- (void)setIsNoteBeingRecovered:(BOOL)a3;
- (void)setIsRecoveredNoteBeingPresented:(BOOL)a3;
- (void)setIsSearchActiveWithQuery:(BOOL)a3;
- (void)setIsSelectedNoteTogglingLock:(BOOL)a3;
- (void)setIsSelectingNextRelevantNoteBrowseContainer:(BOOL)a3;
- (void)setIsTagBeingDeleted:(BOOL)a3;
- (void)setIsTagBeingRenamed:(BOOL)a3;
- (void)setKeyboardHandler:(id)a3;
- (void)setLegacyNoteEditorViewController:(id)a3;
- (void)setMainSplitViewController:(id)a3;
- (void)setMostRecentNonSearchContainerItemID:(id)a3;
- (void)setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:(id)a3;
- (void)setMostRecentRegularWidthSelectedNoteObjectID:(id)a3;
- (void)setMostRecentRegularWidthTagSelection:(id)a3;
- (void)setNoteBrowserNavigationStackWithFolderObjectIDs:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setNoteContainerViewMode:(int64_t)a3 completion:(id)a4;
- (void)setNoteEditorAnimated:(BOOL)a3 ensurePresented:(BOOL)a4 startEditing:(BOOL)a5 showLegacy:(BOOL)a6 showLatestUpdatesIfAvailable:(BOOL)a7;
- (void)setNoteEditorViewController:(id)a3;
- (void)setPersistenceConfiguration:(id)a3;
- (void)setPreferredNoteContainerViewMode:(int64_t)a3;
- (void)setPreviousSelectedNoteObjectID:(id)a3;
- (void)setPrimaryContainerViewController:(id)a3;
- (void)setPrimaryNavigationController:(id)a3;
- (void)setProposedMainSplitViewControllerDisplayMode:(int64_t)a3;
- (void)setRootNoteBrowseViewController:(id)a3;
- (void)setSecondaryNavigationController:(id)a3;
- (void)setSelectedInvitationObjectID:(id)a3;
- (void)setSelectedInvitationObjectID:(id)a3 sideEffects:(BOOL)a4;
- (void)setSelectedNewNoteShortcutItem:(id)a3;
- (void)setSelectedNoteBrowseContainerItemID:(id)a3;
- (void)setSelectedNoteBrowseContainerItemID:(id)a3 sideEffects:(BOOL)a4;
- (void)setSelectedNoteObjectID:(id)a3;
- (void)setSelectedNoteObjectID:(id)a3 sideEffects:(BOOL)a4;
- (void)setSelectedSearchResult:(id)a3;
- (void)setSelectionStateController:(id)a3;
- (void)setSelectionStateTrackingEnabled:(BOOL)a3;
- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3;
- (void)setStartupNavigationController:(id)a3;
- (void)setStartupPresenter:(id)a3;
- (void)setSupplementaryNavigationController:(id)a3;
- (void)setSystemPaperViewController:(id)a3;
- (void)setTagSelection:(id)a3;
- (void)setTrailingSidebarContainerViewController:(id)a3;
- (void)setTrailingSidebarSplitViewController:(id)a3;
- (void)setTrailingSidebarViewController:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setWelcomeScreenVisible:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)setupViewsFromWindowStateArchive:(id)a3 systemPaperShowModernAccountAlert:(BOOL)a4 completion:(id)a5;
- (void)setupWithWindow:(id)a3 stateRestoreArchive:(id)a4 completion:(id)a5;
- (void)showAccountListAnimated:(BOOL)a3;
- (void)showActivityStreamForObjectWithObjectID:(id)a3;
- (void)showActivityStreamForObjectWithObjectID:(id)a3 collabActivityContextPath:(int64_t)a4;
- (void)showAttachmentBrowser;
- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4;
- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4 suppressSidebar:(BOOL)a5;
- (void)showAudioDonationDialog:(BOOL)a3 mediaURL:(id)a4 transcript:(id)a5 date:(id)a6;
- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(BOOL)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14;
- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 keepEditorShowing:(id)a8 animated:(BOOL)a9;
- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 keepEditorShowing:(id)a7 animated:(BOOL)a8;
- (void)showInlineAttachmentWithIdentifier:(id)a3 inNoteIdentifier:(id)a4;
- (void)showInvitationWithObjectID:(id)a3 animated:(BOOL)a4;
- (void)showNoteWithIdentifier:(id)a3;
- (void)showNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10;
- (void)showObjectWithObjectID:(id)a3;
- (void)showRecentUpdatesForNoteWithObjectID:(id)a3;
- (void)showRecentUpdatesForNoteWithObjectID:(id)a3 suppressSidebar:(BOOL)a4;
- (void)showRecentlyDeletedMathNotes;
- (void)showSearchResult:(id)a3 animated:(BOOL)a4;
- (void)showSelectionForParticipant:(id)a3 noteObjectID:(id)a4;
- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4;
- (void)showTagSelection:(id)a3;
- (void)showUpgradeNotesDialog;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3;
- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3;
- (void)startSearchWithSearchQueryString:(id)a3 becomeFirstResponder:(BOOL)a4;
- (void)stopEditing;
- (void)systemPaperNavigateLeft:(id)a3;
- (void)systemPaperNavigateRight:(id)a3;
- (void)systemPaperShowInNotes:(id)a3;
- (void)tagDidRename:(id)a3;
- (void)tagsDidDelete:(id)a3;
- (void)toggleSidebar;
- (void)updateCurrentNoteLastViewedMetadata:(id)a3;
- (void)updateForFingerDrawingEnabled:(BOOL)a3;
- (void)updateHostedNotesAppearance;
- (void)updateIgnoreTextViewTaps;
- (void)updateNewNoteForSelectedTags:(id)a3 folder:(id)a4;
- (void)updateNoteEditorBezelsIfNeededWithDisplayMode:(int64_t)a3 force:(BOOL)a4;
- (void)updateNoteEditorViewControllerWithStateArchive:(id)a3;
- (void)updateOverrideNoteContainerViewModeIfNeeded;
- (void)updatePrimaryContainerViewAppearance;
- (void)updateSceneTitle:(id)a3;
- (void)updateSplitViewForCurrentViewModeWithCompletion:(id)a3;
- (void)updateTrailingColumnWidth;
- (void)validateState;
- (void)willAdoptModelForSelectionStateController:(id)a3 isNavigating:(BOOL)a4;
- (void)willDismissSearch:(id)a3;
@end

@implementation ICViewControllerManager

- (void)updateHostedNotesAppearance
{
  id v2 = [(ICViewControllerManager *)self hostedNotesAppearanceCoordinator];
  [v2 updateAppearance];
}

- (ICHostedNotesAppearanceCoordinator)hostedNotesAppearanceCoordinator
{
  return self->_hostedNotesAppearanceCoordinator;
}

- (BOOL)canTilePrimaryContent
{
  id v2 = [(ICViewControllerManager *)self mainSplitViewController];
  unsigned __int8 v3 = [v2 _canTileSidebarColumn:0];

  return v3;
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ICViewControllerManager *)self mainSplitViewController];

  if (v7 == v6)
  {
    v8 = [(ICViewControllerManager *)self mainSplitViewController];
    if ([v8 preferredDisplacedColumn] == (id)a4)
    {
      unsigned int v9 = [(ICViewControllerManager *)self isTrailingContentVisible];

      if (v9)
      {
        v10 = [v6 transitionCoordinator];

        if (v10)
        {
          v11 = [v6 transitionCoordinator];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100043634;
          v14[3] = &unk_100625AC8;
          v14[4] = self;
          [v11 animateAlongsideTransition:v14 completion:0];
        }
        else
        {
          v12 = [(ICViewControllerManager *)self mainSplitViewController];
          id v13 = [v12 displayMode];

          if (v13 == (id)3)
          {
LABEL_10:
            [(ICViewControllerManager *)self setActivityStreamSelection:0];
            goto LABEL_11;
          }
          v11 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
          [v11 setPreferredDisplayMode:1];
        }

        goto LABEL_10;
      }
    }
    else
    {
    }
  }
LABEL_11:
}

- (void)setWindow:(id)a3
{
  p_window = &self->_window;
  id v5 = a3;
  objc_storeWeak((id *)p_window, v5);
  id v6 = [(ICViewControllerManager *)self intentsInteractionController];
  [v6 setWindow:v5];
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    unsigned __int8 v3 = [(ICViewControllerManager *)self selectionStateController];
    v4 = [v3 selectedInvitationObjectID];
  }
  else
  {
    v4 = self->_selectedInvitationObjectID;
  }

  return v4;
}

- (ICActivityStreamSelection)activityStreamSelection
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    unsigned __int8 v3 = [(ICViewControllerManager *)self selectionStateController];
    v4 = [v3 activityStreamSelection];
  }
  else
  {
    v4 = self->_activityStreamSelection;
  }

  return v4;
}

- (BOOL)isAutomaticallySelectingNotes
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self window];
  v4 = [v3 traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if ([(ICViewControllerManager *)self noteContainerViewMode]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == (id)1;
  }
  return !v6;
}

- (void)setSelectionStateTrackingEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_selectionStateTrackingEnabled = 1;
    v4 = [_TtC11MobileNotes26ICSelectionStateController alloc];
    id v5 = [(ICViewControllerManager *)self persistenceConfiguration];
    BOOL v6 = [(ICSelectionStateController *)v4 initWithPersistenceConfiguration:v5];
    selectionStateController = self->_selectionStateController;
    self->_selectionStateController = v6;

    v8 = self->_selectionStateController;
    [(ICSelectionStateController *)v8 setDelegate:self];
  }
  else
  {
    self->_selectionStateTrackingEnabled = 0;
    unsigned int v9 = self->_selectionStateController;
    self->_selectionStateController = 0;
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  v8 = (ICNoteBrowseViewController *)a3;
  id v9 = a4;
  if (![(ICViewControllerManager *)self isApplyingStateRestoreArchive])
  {
    CFNullRef v10 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    CFNullRef v11 = [(ICViewControllerManager *)self tagSelection];
    v12 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    if (![(ICNoteBrowseViewController *)v12 isCollapsed])
    {
      BOOL v13 = 0;
LABEL_6:

LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ![(ICViewControllerManager *)self selectionStateTrackingEnabled])
        {
LABEL_40:
          if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
          {
            if (!v13)
            {
              int v33 = 0;
              goto LABEL_45;
            }
LABEL_42:
            id v5 = [(ICViewControllerManager *)self selectionStateController];
            v32 = [(ICNoteBrowseViewController *)v5 selectedObjectID];
            int v33 = 1;
            unsigned int v34 = 1;
            if (v32) {
              goto LABEL_70;
            }
LABEL_45:
            int v63 = v33;
            v59 = v5;
            CFNullRef v35 = v11;
            CFNullRef v36 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
            CFNullRef v61 = v10;
            if (kCFNull == v10) {
              CFNullRef v37 = 0;
            }
            else {
              CFNullRef v37 = v10;
            }
            uint64_t v38 = v37;
            if (kCFNull == v36) {
              CFNullRef v39 = 0;
            }
            else {
              CFNullRef v39 = v36;
            }
            unint64_t v40 = v39;
            if (v38 | v40)
            {
              unint64_t v41 = v40;
              unsigned int v34 = 1;
              if (!v38 || !v40)
              {
LABEL_67:
                CFNullRef v11 = v35;
                int v47 = v63;

                CFNullRef v10 = v61;
LABEL_68:

                if (!v47)
                {
                  char v48 = 0;
                  goto LABEL_72;
                }
                v32 = 0;
                id v5 = v59;
LABEL_70:

                char v48 = 1;
LABEL_72:
                v49 = +[UIApplication sharedApplication];
                id v50 = [v49 applicationState];

                if (v34 && !v50)
                {
                  v51 = [(ICViewControllerManager *)self mainSplitViewController];
                  v52 = [v51 transitionCoordinator];

                  v66[0] = _NSConcreteStackBlock;
                  v66[1] = 3221225472;
                  v66[2] = sub_10004579C;
                  v66[3] = &unk_100625B68;
                  v66[4] = self;
                  CFNullRef v10 = v10;
                  CFNullRef v67 = v10;
                  CFNullRef v11 = v11;
                  CFNullRef v68 = v11;
                  char v69 = v48;
                  v53 = objc_retainBlock(v66);
                  v54 = v53;
                  if (v52)
                  {
                    v64[0] = _NSConcreteStackBlock;
                    v64[1] = 3221225472;
                    v64[2] = sub_1000457F8;
                    v64[3] = &unk_100625E18;
                    v65 = v53;
                    [v52 animateAlongsideTransition:&stru_100625DF0 completion:v64];
                  }
                  else
                  {
                    ((void (*)(void *))v53[2])(v53);
                  }
                }
                goto LABEL_78;
              }
              unsigned int v42 = [(id)v38 isEqual:v40];

              if (!v42)
              {
                CFNullRef v10 = v61;
                int v47 = v63;
                goto LABEL_68;
              }
            }
            uint64_t v38 = [(ICViewControllerManager *)self tagSelection];
            if (kCFNull == v11) {
              CFNullRef v43 = 0;
            }
            else {
              CFNullRef v43 = v11;
            }
            unint64_t v41 = v43;
            if (kCFNull == (const CFNullRef)v38) {
              v44 = 0;
            }
            else {
              v44 = (void *)v38;
            }
            unint64_t v45 = v44;
            v46 = (void *)v45;
            if (v41 | v45)
            {
              unsigned int v34 = 1;
              if (v41 && v45) {
                unsigned int v34 = [(id)v41 isEqual:v45] ^ 1;
              }
            }
            else
            {
              unsigned int v34 = 0;
            }

            goto LABEL_67;
          }
LABEL_78:

          goto LABEL_79;
        }
        if (v13)
        {
          if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
            goto LABEL_42;
          }
          goto LABEL_78;
        }
        id v15 = [(ICViewControllerManager *)self selectedNoteObjectID];
        BOOL v13 = v15 == 0;
LABEL_39:

        goto LABEL_40;
      }
      CFNullRef v14 = v10;
      id v15 = v9;
      v16 = [v15 noteContainer];
      v17 = [v16 objectID];
      v18 = v17;
      BOOL v62 = v13;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        CFNullRef v57 = v11;
        v23 = [v15 noteCollection];
        v24 = [v23 objectID];
        id v5 = v24;
        if (v24)
        {
          v25 = v24;
        }
        else
        {
          v25 = [v15 virtualSmartFolder];
        }
        v19 = v25;

        CFNullRef v11 = v57;
      }

      uint64_t v26 = [v15 tagSelection];

      if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {
        CFNullRef v10 = v19;
      }
      else
      {
        [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:v19];
        CFNullRef v10 = v14;
      }
      uint64_t v27 = [(ICViewControllerManager *)self compactNavigationController];
      if ((ICNoteBrowseViewController *)v27 == v8)
      {
      }
      else
      {
        id v5 = (ICNoteBrowseViewController *)v27;
        int64_t v28 = [(ICViewControllerManager *)self noteContainerViewMode];

        if (v28 != 1)
        {
LABEL_38:

          CFNullRef v11 = (CFNullRef)v26;
          BOOL v13 = v62;
          goto LABEL_39;
        }
      }
      if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {
        CFNullRef v60 = v10;
        v29 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
        v30 = [v29 collectionView];
        v31 = [v30 indexPathsForSelectedItems];
        if ([v31 count])
        {
          BOOL v62 = 0;
        }
        else
        {
          v58 = [(ICViewControllerManager *)self currentSearchBarViewController];
          v56 = [v58 noteSearchViewController];
          v55 = [v56 collectionView];
          id v5 = [v55 indexPathsForSelectedItems];
          BOOL v62 = [(ICNoteBrowseViewController *)v5 count] == 0;
        }
        CFNullRef v10 = v60;
      }
      else
      {
        [(ICViewControllerManager *)self setSelectedNoteObjectID:0];
      }
      goto LABEL_38;
    }
    id v5 = [(ICViewControllerManager *)self compactNavigationController];

    if (v5 != v8)
    {
      BOOL v13 = 0;
      goto LABEL_7;
    }
    v12 = [(ICNoteBrowseViewController *)v8 topViewController];
    uint64_t v20 = [(ICViewControllerManager *)self noteEditorViewController];
    if (v12 == (ICNoteBrowseViewController *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(ICViewControllerManager *)self legacyNoteEditorViewController];

      if (v12 != v22)
      {
        if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
        {
          BOOL v13 = 1;
          goto LABEL_83;
        }
        [(ICViewControllerManager *)self setSelectedNoteObjectID:0];
      }
    }
    BOOL v13 = 0;
LABEL_83:
    id v5 = [(ICViewControllerManager *)self folderListViewController];

    if (v12 == v5)
    {
      if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {

        CFNullRef v11 = 0;
        CFNullRef v10 = 0;
      }
      else
      {
        [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:0];
        [(ICViewControllerManager *)self setTagSelection:0];
      }
      [(ICViewControllerManager *)self setMostRecentRegularWidthTagSelection:0];
      id v5 = [[ICNoteBrowseViewController alloc] initWithViewMode:[(ICViewControllerManager *)self noteContainerViewMode] viewControllerManager:self];
      [(ICViewControllerManager *)self setRootNoteBrowseViewController:v5];

      [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:0];
    }
    goto LABEL_6;
  }
LABEL_79:
}

- (id)containerItemIDForContainerIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICViewControllerManager *)self overrideContainerIdentifier];
  if (v5
    && (BOOL v6 = (void *)v5,
        +[ICAccount globalVirtualRecentlyDeletedMathNotesFolder](ICAccount, "globalVirtualRecentlyDeletedMathNotesFolder"), id v7 = objc_claimAutoreleasedReturnValue(), v8 = [v4 containsObject:v7], v7, v6, (v8 & 1) == 0))
  {
    uint64_t v11 = [(ICViewControllerManager *)self overrideContainerIdentifier];
  }
  else
  {
    if ([v4 count])
    {
      id v9 = [v4 allObjects];
      CFNullRef v10 = [v9 ic_objectPassingTest:&stru_100625ED8];

      goto LABEL_8;
    }
    uint64_t v11 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
  }
  CFNullRef v10 = (void *)v11;
LABEL_8:

  return v10;
}

- (BOOL)objectAlreadyLoadedInEditorWithObjectID:(id)a3
{
  id v7 = a3;
  unsigned int v8 = [v7 ic_isModernNoteType];
  if (v8)
  {
    unsigned __int8 v3 = [(ICViewControllerManager *)self noteEditorViewController];
    id v4 = [v3 note];
    uint64_t v5 = [v4 objectID];
    if ([v7 isEqual:v5])
    {
      unsigned __int8 v9 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if ((objc_msgSend(v7, "ic_isInvitationType") & 1) == 0)
    {
      unsigned __int8 v9 = 0;
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(v7, "ic_isInvitationType"))
  {
    unsigned __int8 v9 = 0;
    goto LABEL_11;
  }
  CFNullRef v10 = [(ICViewControllerManager *)self noteEditorViewController];
  uint64_t v11 = [v10 invitation];
  v12 = [v11 objectID];
  unsigned __int8 v9 = [v7 isEqual:v12];

  if (v8) {
    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v7, "ic_isLegacyNoteType"))
  {
    BOOL v13 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    CFNullRef v14 = [v13 note];
    id v15 = [v14 objectID];
    unsigned __int8 v16 = [v7 isEqual:v15];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v9 | v16;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v38 = a3;
  id v6 = [v38 displayMode];
  if (v6 != (id)a4)
  {
    unint64_t v7 = (unint64_t)v6;
    id v8 = [(ICViewControllerManager *)self mainSplitViewController];

    if (v8 != v38)
    {
      id v9 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];

      if (v9 != v38) {
        goto LABEL_48;
      }
      CFNullRef v10 = [(ICViewControllerManager *)self mainSplitViewController];
      [v10 updateStateForTrailingSidebarVisible:a4 == 2];
      goto LABEL_47;
    }
    if (a4 != 6 && v7 != 6)
    {
      unsigned __int8 v11 = [(ICViewControllerManager *)self isTrailingContentVisible];
      if (a4 == 1 || (v11 & 1) == 0)
      {
        v12 = [(ICViewControllerManager *)self trailingSidebarViewController];
        BOOL v13 = [v12 view];
        [v13 bounds];
        double v15 = v14;
        double v17 = v16;

        if ([(ICViewControllerManager *)self isTrailingContentVisible])
        {
          v18 = [(ICViewControllerManager *)self trailingSidebarViewController];
          [v18 sidebarWidth];
          double v15 = v15 - v19;
        }
        if (a4 == 4 || a4 == 2)
        {
          uint64_t v20 = [(ICViewControllerManager *)self mainSplitViewController];
          id v21 = [v20 style];
          v22 = [(ICViewControllerManager *)self mainSplitViewController];
          v23 = v22;
          if (v21 == (id)2) {
            [v22 supplementaryColumnWidth];
          }
          else {
            [v22 primaryColumnWidth];
          }
          double v25 = v24;

          double v15 = v15 - v25;
        }
        if (a4 == 4)
        {
          uint64_t v26 = [(ICViewControllerManager *)self mainSplitViewController];
          [v26 primaryColumnWidth];
          double v15 = v15 - v27;
        }
        int64_t v28 = [(ICViewControllerManager *)self mainSplitViewController];
        unsigned int v29 = [v28 requiresNotificationForSecondaryColumnSize:v15, v17];

        v30 = [(ICViewControllerManager *)self trailingSidebarViewController];
        unsigned int v31 = [v30 isTransitioning];

        if (!v31 && v29)
        {
          v32 = [v38 transitionCoordinator];
          -[ICViewControllerManager sendNotificationForNoteEditorSizeChange:transitionCoordinator:](self, "sendNotificationForNoteEditorSizeChange:transitionCoordinator:", v32, v15, v17);
        }
        [(ICViewControllerManager *)self setProposedMainSplitViewControllerDisplayMode:a4];
        int v33 = [v38 transitionCoordinator];
        [(ICViewControllerManager *)self sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:v33];
      }
    }
    if ((id)[(ICViewControllerManager *)self behavior] == (id)3 && (a4 == 1 || v7 == 1)) {
      [(ICViewControllerManager *)self updateNoteEditorBezelsIfNeededWithDisplayMode:a4 force:1];
    }
    if ((unint64_t)a4 <= 6 && ((1 << a4) & 0x68) != 0) {
      [(ICViewControllerManager *)self stopEditing];
    }
    if (([v38 isCollapsed] & 1) == 0)
    {
      if (![(ICViewControllerManager *)self noteContainerViewMode]
        && (a4 == 2 ? (BOOL v34 = v7 == 4) : (BOOL v34 = 0),
            !v34 ? (char v35 = 0) : (char v35 = 1),
            v7 == 5 ? (BOOL v36 = a4 == 3) : (BOOL v36 = 0),
            v36 || (v35 & 1) != 0)
        || (int64_t v37 = [(ICViewControllerManager *)self noteContainerViewMode], a4 == 1)
        && (v7 & 0xFFFFFFFFFFFFFFFELL) == 2
        && v37 == 1)
      {
        CFNullRef v10 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
        [v10 becomeFirstResponder];
LABEL_47:
      }
    }
  }
LABEL_48:
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ICViewControllerManager *)self secondaryNavigationController];
  if (v9 != v7)
  {

    goto LABEL_11;
  }
  int64_t v10 = [(ICViewControllerManager *)self noteContainerViewMode];

  if (v10 == 1)
  {
    uint64_t v11 = [(ICViewControllerManager *)self noteEditorViewController];
    v12 = v8;
    if ((id)v11 != v8)
    {
      BOOL v13 = (void *)v11;
      id v14 = [(ICViewControllerManager *)self legacyNoteEditorViewController];

      if (v14 == v8)
      {
LABEL_8:
        if ([(ICViewControllerManager *)self isSearchActiveWithQuery])
        {
          double v15 = [(ICViewControllerManager *)self mainSplitViewController];
          [v15 setDisplayModeButtonVisibility:1];
        }
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100045754;
        v19[3] = &unk_100625AF0;
        v19[4] = self;
        [v7 ic_performBlockAfterActiveTransition:v19];
        goto LABEL_11;
      }
      v12 = [(ICViewControllerManager *)self trailingSidebarViewController];
      [v12 setSidebarHidden:1];
    }

    goto LABEL_8;
  }
LABEL_11:
  id v16 = [(ICViewControllerManager *)self compactNavigationController];
  if (v16 == v7)
  {
    unsigned __int8 v17 = [(ICViewControllerManager *)self isSplitViewExpandingOrCollapsing];

    if ((v17 & 1) == 0) {
      [(ICViewControllerManager *)self hideActivityStreamWithCompletion:0];
    }
  }
  else
  {
  }
  v18 = +[NSNotificationCenter defaultCenter];
  [v18 postNotificationName:@"ICNavigationControllerWillChange" object:v7 userInfo:0];
}

- (id)createDeferredActionMenuElementForEditorViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 note];
  id v6 = [v4 invitation];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000521E8;
  v9[3] = &unk_100626358;
  objc_copyWeak(&v10, &location);
  id v7 = +[ICNoteEditorActionMenu deferredActionMenuElementWithNote:v5 invitation:v6 presentingViewController:v4 viewControllerManager:self delegate:v4 completion:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

- (UINavigationController)primaryNavigationController
{
  primaryNavigationController = self->_primaryNavigationController;
  if (primaryNavigationController)
  {
    unsigned __int8 v3 = primaryNavigationController;
  }
  else
  {
    uint64_t v5 = [(ICViewControllerManager *)self childPrimaryViewController];
    id v6 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
    id v7 = self->_primaryNavigationController;
    self->_primaryNavigationController = v6;

    id v8 = [(UINavigationController *)self->_primaryNavigationController navigationBar];
    [v8 setPrefersLargeTitles:1];

    [(UINavigationController *)self->_primaryNavigationController setDelegate:self];
    id v9 = +[UIColor ICBackgroundColor];
    id v10 = [(UINavigationController *)self->_primaryNavigationController view];
    [v10 setBackgroundColor:v9];

    unsigned __int8 v3 = self->_primaryNavigationController;
  }

  return v3;
}

- (void)selectionStateController:(id)a3 didAdoptModelFromArchive:(id)a4 systemPaperAlert:(BOOL)a5 completion:(id)a6
{
  id v8 = a3;
  id v12 = a4;
  id v13 = a6;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  performBlockOnMainThread();
}

- (void)initializeSecondaryNavigationControllerWithViewController:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc((Class)UINavigationController);
  if (v12) {
    id v5 = [v4 initWithRootViewController:v12];
  }
  else {
    id v5 = [v4 initWithNibName:0 bundle:0];
  }
  id v6 = v5;
  [(ICViewControllerManager *)self setSecondaryNavigationController:v5];

  id v7 = [(ICViewControllerManager *)self secondaryNavigationController];
  id v8 = [v7 navigationBar];
  [v8 setPrefersLargeTitles:1];

  id v9 = +[UIColor ICBackgroundColor];
  id v10 = [(ICViewControllerManager *)self secondaryNavigationController];
  id v11 = [v10 view];
  [v11 setBackgroundColor:v9];
}

- (UINavigationController)secondaryNavigationController
{
  return self->_secondaryNavigationController;
}

- (BOOL)isNoteEditorTopViewController
{
  if ([(ICViewControllerManager *)self hasCompactWidth]) {
    [(ICViewControllerManager *)self compactNavigationController];
  }
  else {
  unsigned __int8 v3 = [(ICViewControllerManager *)self secondaryNavigationController];
  }
  id v4 = [(ICViewControllerManager *)self noteEditorViewController];
  if (v4)
  {
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    id v6 = [v3 topViewController];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)enforcedNoteContainerViewModeForContainerItemID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();
  objc_opt_class();
  id v6 = ICDynamicCast();
  if (objc_msgSend(v5, "ic_isModernContainerType"))
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = -1;
    BOOL v7 = [(ICViewControllerManager *)self modernManagedObjectContext];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000CB4C;
    v16[3] = &unk_100625700;
    v18 = &v19;
    v16[4] = self;
    id v17 = v5;
    [v7 performBlockAndWait:v16];

    int64_t v8 = v20[3];
    id v9 = v17;
LABEL_5:

    _Block_object_dispose(&v19, 8);
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "ic_isLegacyContainerType"))
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = -1;
    id v10 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000458E4;
    v13[3] = &unk_100625700;
    double v15 = &v19;
    v13[4] = self;
    id v14 = v5;
    [v10 performBlockAndWait:v13];

    int64_t v8 = v20[3];
    id v9 = v14;
    goto LABEL_5;
  }
  if (v6)
  {
    int64_t v8 = (int64_t)[v6 enforcedNoteContainerViewMode];
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1004D47B8();
    }

    int64_t v8 = -1;
  }
LABEL_6:

  return v8;
}

- (void)initializeModernNoteEditorWithOptions:(unint64_t)a3
{
  id v5 = [(ICViewControllerManager *)self noteEditorViewController];

  if (v5)
  {
    id v6 = [(ICViewControllerManager *)self noteEditorViewController];
    id v7 = [v6 options];

    if (v7 == (id)a3) {
      return;
    }
    int64_t v8 = [(ICViewControllerManager *)self noteEditorViewController];
    id v9 = [v8 attributionSidebarController];
    [v9 ic_removeObserver:self forKeyPath:@"attributionSidebarVisibility" context:&off_100698C30];
  }
  id v10 = +[ICNoteEditorViewController editorViewControllerWithIdentifier:-1 options:a3];
  [(ICViewControllerManager *)self setNoteEditorViewController:v10];

  id v11 = [(ICViewControllerManager *)self noteEditorViewController];
  [v11 setViewControllerManager:self];

  id v13 = [(ICViewControllerManager *)self noteEditorViewController];
  id v12 = [v13 attributionSidebarController];
  [v12 ic_addObserver:self forKeyPath:@"attributionSidebarVisibility" context:&off_100698C30];
}

- (BOOL)isTrashFolderSelected
{
  objc_opt_class();
  unsigned __int8 v3 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  id v4 = ICDynamicCast();

  if ([v4 isTrashFolder])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    objc_opt_class();
    id v6 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    id v7 = ICDynamicCast();

    if (objc_msgSend(v7, "ic_isEntityOfClass:", objc_opt_class()))
    {
      int64_t v8 = [(ICViewControllerManager *)self modernManagedObjectContext];
      id v9 = [v8 ic_existingObjectWithID:v7];

      unsigned __int8 v5 = [v9 isTrashFolder];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)initializeLegacyNoteEditor
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self legacyNoteEditorViewController];

  if (!v3)
  {
    id v4 = [[NotesDisplayController alloc] initWithArchivedConfiguration:0];
    [(ICViewControllerManager *)self setLegacyNoteEditorViewController:v4];

    unsigned __int8 v5 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    [v5 setViewControllerManager:self];

    id v6 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    [v6 setDelegate:self];
  }
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_splitViewExpandingOrCollapsing = a3;
  unsigned __int8 v5 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
  [v5 setSplitViewExpandingOrCollapsing:v3];

  id v6 = [(ICViewControllerManager *)self noteEditorViewController];
  [v6 setSplitViewExpandingOrCollapsing:v3];
}

- (NotesDisplayController)legacyNoteEditorViewController
{
  return self->_legacyNoteEditorViewController;
}

- (ICViewControllerManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)ICViewControllerManager;
  id v2 = [(ICViewControllerManager *)&v23 init];
  BOOL v3 = v2;
  if (v2)
  {
    selectedNoteBrowseContainerItemID = v2->_selectedNoteBrowseContainerItemID;
    v2->_selectedNoteBrowseContainerItemID = 0;

    selectedNoteObjectID = v3->_selectedNoteObjectID;
    v3->_selectedNoteObjectID = 0;

    selectedInvitationObjectID = v3->_selectedInvitationObjectID;
    v3->_selectedInvitationObjectID = 0;

    tagSelection = v3->_tagSelection;
    v3->_tagSelection = 0;

    focusedNoteObjectID = v3->_focusedNoteObjectID;
    v3->_focusedNoteObjectID = 0;

    activityStreamSelection = v3->_activityStreamSelection;
    v3->_activityStreamSelection = 0;

    mostRecentNonSearchContainerItemID = v3->_mostRecentNonSearchContainerItemID;
    v3->_mostRecentNonSearchContainerItemID = 0;

    previousSelectedNoteObjectID = v3->_previousSelectedNoteObjectID;
    v3->_previousSelectedNoteObjectID = 0;

    selectedSearchResult = v3->_selectedSearchResult;
    v3->_selectedSearchResult = 0;

    id v13 = objc_alloc_init(_TtC11MobileNotes33ICAppIntentsInteractionController);
    intentsInteractionController = v3->_intentsInteractionController;
    v3->_intentsInteractionController = v13;

    double v15 = (ICPersistenceConfiguration *)objc_alloc_init((Class)ICPersistenceConfiguration);
    persistenceConfiguration = v3->_persistenceConfiguration;
    v3->_persistenceConfiguration = v15;

    id v17 = +[ICNoteContext sharedContext];
    v18 = [v17 managedObjectContext];
    [(ICPersistenceConfiguration *)v3->_persistenceConfiguration setModernViewContext:v18];

    [(ICPersistenceConfiguration *)v3->_persistenceConfiguration setMakeModernBackgroundContext:&stru_1006256B8];
    uint64_t v19 = +[NotesApp sharedNotesApp];
    uint64_t v20 = [v19 noteContext];
    uint64_t v21 = [v20 managedObjectContext];
    [(ICPersistenceConfiguration *)v3->_persistenceConfiguration setLegacyViewContext:v21];

    [(ICPersistenceConfiguration *)v3->_persistenceConfiguration setMakeLegacyBackgroundContext:&stru_1006256D8];
    [(ICViewControllerManager *)v3 setSelectionStateTrackingEnabled:ICInternalSettingsIsSelectionStateTrackingEnabled()];
  }
  return v3;
}

- (void)applyStateRestoreArchive:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  [(ICViewControllerManager *)self setIsApplyingStateRestoreArchive:1];
  int64_t v8 = [v6 hostApplicationIdentifier];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = [v6 hostApplicationIdentifier];
    id v11 = [v10 copy];
    [(ICViewControllerManager *)self setHostApplicationIdentifier:v11];
  }
  if ((id)[(ICViewControllerManager *)self behavior] == (id)1)
  {
    id v12 = +[ICNoteContext sharedContext];
    id v13 = [(ICViewControllerManager *)self modernManagedObjectContext];
    [v12 ensureModernAccountExistsInContext:v13];
  }
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v14 = [(ICViewControllerManager *)self selectionStateController];
    [v14 setupWithArchive:v6];
  }
  double v15 = [v6 currentSearchTerm];
  if (!v15
    || ([(ICViewControllerManager *)self currentSearchBarViewController],
        id v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = objc_msgSend(v16, "ic_isViewVisible"),
        v16,
        !v17))
  {
    uint64_t v19 = +[UIApplication sharedApplication];
    unsigned __int8 v20 = [v19 supportsMultipleScenes];

    if ((v20 & 1) == 0) {
      [v6 setIsAuxiliaryWindow:0];
    }
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]
      || ([v6 currentObjectIDURL],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
LABEL_34:
      v46 = [(ICViewControllerManager *)self mainSplitViewController];

      if (v46)
      {
        [v6 setIsPrimaryContentVisible:[self isPrimaryContentVisible]];
        [v6 setIsSupplementaryContentVisible:[self isSupplementaryContentVisible]];
        int v47 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
        unsigned int v48 = [v47 isCollapsed];

        if (v48) {
          [(ICViewControllerManager *)self setFolderListViewController:0];
        }
      }
      if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {
        [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:0 sideEffects:0];
        [(ICViewControllerManager *)self setSelectedNoteObjectID:0 sideEffects:0];
        [(ICViewControllerManager *)self setSelectedInvitationObjectID:0 sideEffects:0];
        [(ICViewControllerManager *)self setFocusedNoteObjectID:0];
        if (![(ICViewControllerManager *)self validateStateRestoreArchive:v6])
        {
          uint64_t v49 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];

          id v6 = (id)v49;
        }
      }
      if (![v6 noteCreationApproach])
      {
        uint64_t v60 = 0;
        if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
          goto LABEL_66;
        }
        CFNullRef v67 = 0;
        goto LABEL_65;
      }
      id v50 = [objc_opt_class() isNoteCreateApproachForScrapPaper:[v6 noteCreationApproach]];
      if (!v50) {
        goto LABEL_49;
      }
      v51 = [(ICViewControllerManager *)self modernManagedObjectContext];
      v52 = +[ICAccount allActiveAccountsInContext:v51];
      id v53 = [v52 count];

      if (v53) {
        goto LABEL_49;
      }
      v54 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "No modern accounts were found, trying to create a blank modern local account as a fallback.", buf, 2u);
      }

      +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary];
      v55 = +[ICNoteContext sharedContext];
      [v55 addOrDeleteLocalAccountIfNecessary];

      v56 = [(ICViewControllerManager *)self modernManagedObjectContext];
      CFNullRef v57 = +[ICAccount allActiveAccountsInContext:v56];
      id v58 = [v57 count];

      if (v58)
      {
        v59 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Successfully created local account.", buf, 2u);
        }

LABEL_49:
        uint64_t v60 = 0;
        int v61 = 1;
        goto LABEL_50;
      }
      v80 = v7;
      v71 = [(ICViewControllerManager *)self modernManagedObjectContext];
      v72 = +[ICAccount allAccountsInContext:v71];
      if ([v72 count])
      {
      }
      else
      {
        v73 = +[NotesApp sharedNotesApp];
        v74 = [v73 noteContext];
        v75 = [v74 allAccounts];
        id v76 = [v75 count];

        if (!v76)
        {
          int v61 = 1;
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager applyStateRestoreArchive:completion:]", 1, 0, @"Unable to create local account.");
          uint64_t v60 = 0;
LABEL_76:
          id v7 = v80;
LABEL_50:
          BOOL v62 = -[ICViewControllerManager containerObjectIDForNewNoteWithApproach:](self, "containerObjectIDForNewNoteWithApproach:", [v6 noteCreationApproach]);
          if (!v62)
          {
            if (v61) {
              +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager applyStateRestoreArchive:completion:]", 1, 0, @"Couldn't get containerObjectID for approach %ld. Are there no accounts on the device?", [v6 noteCreationApproach]);
            }
            CFNullRef v67 = 0;
LABEL_62:

            if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
            {
              if (v67)
              {
                v70 = [(ICViewControllerManager *)self selectionStateController];
                [v70 adoptModel:v67 withArchive:v6 systemPaperAccountAlert:v60 completion:v7];

LABEL_67:
                goto LABEL_68;
              }
LABEL_66:
              CFNullRef v67 = [(ICViewControllerManager *)self selectionStateController];
              [(ICSelectionStateModel *)v67 adoptCurrentModelWithArchive:v6 systemPaperAccountAlert:v60 completion:v7];
              goto LABEL_67;
            }
LABEL_65:
            [(ICViewControllerManager *)self setupViewsFromWindowStateArchive:v6 systemPaperShowModernAccountAlert:v60 completion:v7];
            goto LABEL_67;
          }
          int v63 = [(ICViewControllerManager *)self eventReporter];
          [v63 pushNoteCreateDataWithCreateApproach:[v6 noteCreationApproach]];

          objc_opt_class();
          v64 = [(ICViewControllerManager *)self createNewNoteInContainerWithObjectID:v62 isSystemPaper:v50];
          v65 = ICDynamicCast();

          v66 = [(ICViewControllerManager *)self eventReporter];
          [v66 popNoteCreateData];

          if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
          {
            if (!v65)
            {
              CFNullRef v67 = 0;
              goto LABEL_61;
            }
            CFNullRef v67 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
            CFNullRef v68 = [v65 objectID];
            [(ICSelectionStateModel *)v67 setSelectedNoteObjectID:v68];
          }
          else
          {
            CFNullRef v68 = [v65 objectID];
            char v69 = [v68 URIRepresentation];
            [v6 setCurrentObjectIDURL:v69];

            CFNullRef v67 = 0;
          }

LABEL_61:
          goto LABEL_62;
        }
      }
      v77 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Failed to create modern local account, but legacy accounts exist. System Paper will show alert.", buf, 2u);
      }

      int v61 = 0;
      uint64_t v60 = 1;
      goto LABEL_76;
    }
    uint64_t v22 = [v6 currentObjectIDURL];
    objc_super v23 = [(ICViewControllerManager *)self managedObjectIDFromURL:v22];
    if (!objc_msgSend(v23, "ic_isModernNoteType")
      || ([(ICViewControllerManager *)self selectedContainerIdentifiers],
          double v24 = objc_claimAutoreleasedReturnValue(),
          id v25 = [v24 count],
          v24,
          !v25))
    {
LABEL_27:
      if (objc_msgSend(v23, "ic_isBaseAttachmentType"))
      {
        char v35 = [(ICViewControllerManager *)self modernManagedObjectContext];
        BOOL v36 = [v35 ic_existingObjectWithID:v23];

        int64_t v37 = [v36 note];
        id v38 = [v37 folder];
        CFNullRef v39 = v38;
        if (v36 && v37 && v38)
        {
          [v38 objectID];
          unint64_t v40 = v79 = v7;
          [v40 URIRepresentation];
          unint64_t v41 = v78 = v22;
          v82 = v41;
          unsigned int v42 = +[NSArray arrayWithObjects:&v82 count:1];
          [v6 setCurrentContainerObjectIDURLs:v42];

          id v7 = v79;
          CFNullRef v43 = [v37 objectID];
          v44 = [v43 URIRepresentation];
          [v6 setCurrentNoteObjectIDURL:v44];

          uint64_t v22 = v78;
          unint64_t v45 = +[ICTextViewScrollState scrollStateForAttachment:v36 inNote:v37];
          [v6 setScrollState:v45];
        }
      }

      goto LABEL_34;
    }
    objc_opt_class();
    uint64_t v26 = [(ICViewControllerManager *)self selectedContainerItemID];
    double v27 = ICDynamicCast();

    if (![(ICViewControllerManager *)self isSelectionAppropriateForObjectID:v23])
    {
LABEL_26:

      goto LABEL_27;
    }
    if ([(ICViewControllerManager *)self isTagSelected])
    {
      int64_t v28 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
      unsigned int v29 = [v28 allObjects];
      [v29 ic_compactMap:&stru_1006257F8];
      unsigned int v31 = v30 = v7;
      [v6 setCurrentTagIdentifiers:v31];

      id v7 = v30;
    }
    else if (v27)
    {
      v32 = [v27 type];
      [v6 setCurrentVirtualSmartFolderType:v32];

      int64_t v28 = [v27 accountObjectID];
      unsigned int v29 = [v28 URIRepresentation];
      [v6 setCurrentVirtualSmartFolderAccountObjectIDURL:v29];
    }
    else
    {
      int v33 = [(ICViewControllerManager *)self selectedContainerObjectIDs];

      if (!v33)
      {
LABEL_25:
        BOOL v34 = [v23 URIRepresentation];
        [v6 setCurrentNoteObjectIDURL:v34];

        [v6 setCurrentObjectIDURL:0];
        goto LABEL_26;
      }
      int64_t v28 = [(ICViewControllerManager *)self selectedContainerObjectIDs];
      unsigned int v29 = [v28 ic_map:&stru_100625838];
      [v6 setCurrentContainerObjectIDURLs:v29];
    }

    goto LABEL_25;
  }
  v18 = [(ICViewControllerManager *)self currentSearchBarViewController];
  [v18 startSearchWithSearchQuery:v15 searchTokens:0 searchScope:0 becomeFirstResponder:1];

  [(ICViewControllerManager *)self setIsApplyingStateRestoreArchive:0];
  if (v7) {
    v7[2](v7);
  }
LABEL_68:
}

- (ICNote)selectedModernNote
{
  BOOL v3 = [(ICViewControllerManager *)self selectedNoteObjectID];
  unsigned int v4 = [v3 ic_isModernNoteType];

  if (v4)
  {
    unsigned __int8 v5 = [(ICViewControllerManager *)self modernManagedObjectContext];
    id v6 = [(ICViewControllerManager *)self selectedNoteObjectID];
    id v7 = [v5 ic_existingObjectWithID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (ICNote *)v7;
}

- (void)setCurrentNoteBrowseViewController:(id)a3 animated:(BOOL)a4 ensurePresented:(BOOL)a5 containerIdentifiers:(id)a6 excludingIdentifiers:(id)a7 ensureSelectedNote:(BOOL)a8 keepEditorShowing:(id)a9 dataIndexedBlock:(id)a10 dataRenderedBlock:(id)a11
{
  BOOL v41 = a5;
  HIDWORD(v37) = a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  unsigned __int8 v20 = v16;
  id v43 = a11;
  unint64_t v40 = v17;
  uint64_t v21 = [v16 setByAddingObjectsFromSet:v17];
  uint64_t v22 = [(ICViewControllerManager *)self containerItemIDForContainerIdentifiers:v21];

  objc_opt_class();
  objc_super v23 = ICDynamicCast();
  objc_opt_class();
  unsigned int v42 = ICDynamicCast();
  if (v18)
  {
    LODWORD(v37) = [v18 BOOLValue];
  }
  else if ([(ICViewControllerManager *)self isTrashFolderSelected])
  {
    LODWORD(v37) = [(ICViewControllerManager *)self noteContainerViewMode] == 0;
  }
  else
  {
    LODWORD(v37) = 0;
  }
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:v22];
  }
  [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v15];
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  BOOL v64 = a8;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100010988;
  v59[3] = &unk_100625F00;
  BOOL v62 = v63;
  v59[4] = self;
  id v24 = v23;
  id v60 = v24;
  id v25 = v19;
  id v61 = v25;
  uint64_t v26 = objc_retainBlock(v59);
  if (objc_msgSend(v24, "ic_isModernContainerType"))
  {
    double v27 = [(ICViewControllerManager *)self modernManagedObjectContext];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100009814;
    v54[3] = &unk_100625F28;
    v54[4] = self;
    id v55 = v24;
    id v56 = v15;
    CFNullRef v57 = v26;
    id v58 = v43;
    [v27 performBlockAndWait:v54];
  }
  else if (objc_msgSend(v24, "ic_isLegacyContainerType"))
  {
    int64_t v28 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100046050;
    v49[3] = &unk_100625F28;
    v49[4] = self;
    id v50 = v24;
    id v51 = v15;
    v52 = v26;
    id v53 = v43;
    [v28 performBlockAndWait:v49];
  }
  else if (v42)
  {
    [v15 setVirtualSmartFolder:v42 dataIndexedBlock:v26 dataRenderedBlock:v43];
  }
  else if ([(ICViewControllerManager *)self isTagSelected])
  {
    unsigned int v29 = [(ICViewControllerManager *)self tagSelection];
    [v15 setTagSelection:v29 dataIndexedBlock:v26 dataRenderedBlock:v43];
  }
  else
  {
    v30 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "showing empty container", buf, 2u);
    }

    [v15 setNoteContainer:0 dataIndexedBlock:v26 dataRenderedBlock:v43];
  }
  if (v41)
  {
    unsigned int v31 = [(ICViewControllerManager *)self noteBrowseNavigationController];
    v32 = [v31 viewControllers];
    int v33 = (char *)[v32 indexOfObject:v15];
    if ([v32 count])
    {
      if (v33 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        [v31 pushViewController:v15 animated:v39];
LABEL_30:

        goto LABEL_31;
      }
      BOOL v34 = [v32 ic_subarrayFromIndex:v33 + 1];
      id v35 = [v34 count];
      char v36 = v38;
      if (!v35) {
        char v36 = 1;
      }
      if ((v36 & 1) == 0)
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1000460C0;
        v44[3] = &unk_100625F50;
        id v45 = v31;
        id v46 = v15;
        char v47 = v39;
        [v45 ic_performBlockAfterActiveTransition:v44];
      }
    }
    else
    {
      if (!v15) {
        goto LABEL_30;
      }
      id v65 = v15;
      BOOL v34 = +[NSArray arrayWithObjects:&v65 count:1];
      [v31 setViewControllers:v34];
    }

    goto LABEL_30;
  }
LABEL_31:

  _Block_object_dispose(v63, 8);
}

- (void)updateTrailingColumnWidth
{
  BOOL v3 = [(ICViewControllerManager *)self mainSplitViewController];
  [v3 preferredDisplacedColumnWidth];
  double v5 = v4;
  id v6 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  [v6 setPreferredPrimaryColumnWidth:v5];

  id v7 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  [v7 preferredPrimaryColumnWidth];
  double v9 = v8;
  id v10 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  [v10 setMaximumPrimaryColumnWidth:v9];

  id v14 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  [v14 preferredPrimaryColumnWidth];
  double v12 = v11;
  id v13 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  [v13 setMinimumPrimaryColumnWidth:v12];
}

- (void)initializeTrailingSidebarSplitViewWithStateRestoreArchive:(id)a3
{
  id v4 = a3;
  if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
  {
    double v5 = objc_alloc_init(ICTrailingSidebarContainerViewController);
    [(ICViewControllerManager *)self setTrailingSidebarContainerViewController:v5];

    id v6 = [(ICViewControllerManager *)self trailingSidebarContainerViewController];
    [(ICViewControllerManager *)self setTrailingSidebarViewController:v6];

    [(ICViewControllerManager *)self mainSplitViewController];
  }
  else
  {
    id v7 = [[ICTrailingSidebarSplitViewController alloc] initWithViewControllerManager:self];
    [(ICViewControllerManager *)self setTrailingSidebarSplitViewController:v7];

    double v8 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v8 setDelegate:self];

    double v9 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v9 setPresentsWithGesture:0];

    id v10 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v10 setPrimaryEdge:1];

    double v11 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v11 setDisplayModeButtonVisibility:1];

    double v12 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v12 setShowsSecondaryOnlyButton:0];

    id v13 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [v13 setPreferredDisplayMode:1];

    id v14 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    [(ICViewControllerManager *)self setTrailingSidebarViewController:v14];

    [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  }
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [[ICActivityStreamNavigationController alloc] initWithCoordinator:self hasInteractiveSizing:0];
  [(ICViewControllerManager *)self setActivityStreamNavigationController:v15];

  id v16 = [(ICViewControllerManager *)self selectedModernNote];
  id v17 = [(ICViewControllerManager *)self activityStreamNavigationController];
  [v17 setObject:v16];

  id v18 = [(ICViewControllerManager *)self activityStreamSelection];
  id v19 = [(ICViewControllerManager *)self activityStreamNavigationController];
  [v19 setSelection:v18];

  LODWORD(v18) = [v4 isAuxiliaryWindow];
  if (v18) {
    [(ICViewControllerManager *)self secondaryNavigationController];
  }
  else {
  unsigned __int8 v20 = [(ICViewControllerManager *)self mainSplitViewController];
  }
  uint64_t v21 = [(ICViewControllerManager *)self trailingSidebarViewController];
  [v21 setContentViewController:v20];

  uint64_t v22 = [(ICViewControllerManager *)self activityStreamNavigationController];
  objc_super v23 = [(ICViewControllerManager *)self trailingSidebarViewController];
  [v23 setSidebarViewController:v22];

  [(ICViewControllerManager *)self updateTrailingColumnWidth];
  compactNavigationController = self->_compactNavigationController;
  self->_compactNavigationController = 0;

  id v25 = [(ICViewControllerManager *)self compactNavigationController];
  [v26 setViewController:v25 forColumn:3];
}

- (ICTrailingSidebarSplitViewController)trailingSidebarSplitViewController
{
  return self->_trailingSidebarSplitViewController;
}

- (ICTrailingSidebarViewControlling)trailingSidebarViewController
{
  return self->_trailingSidebarViewController;
}

- (ICActivityStreamNavigationController)activityStreamNavigationController
{
  return self->_activityStreamNavigationController;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];

  if (v7 == v6)
  {
    double v8 = [(ICViewControllerManager *)self selectedNoteObjectID];
    [(ICViewControllerManager *)self setMostRecentRegularWidthSelectedNoteObjectID:v8];

    double v9 = [(ICViewControllerManager *)self tagSelection];
    [(ICViewControllerManager *)self setMostRecentRegularWidthTagSelection:v9];

    id v10 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    [(ICViewControllerManager *)self setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:v10];
  }
  double v11 = [(ICViewControllerManager *)self compactNavigationController];
  double v12 = [v11 viewControllers];
  if ([v12 count])
  {
    int64_t v13 = [(ICViewControllerManager *)self behavior];

    if (v13 != 3) {
      goto LABEL_81;
    }
  }
  else
  {
  }
  [(ICViewControllerManager *)self setSplitViewExpandingOrCollapsing:1];
  if ([(ICViewControllerManager *)self isApplyingStateRestoreArchive])
  {
    int64_t v14 = [(ICViewControllerManager *)self noteContainerViewMode];
    uint64_t v15 = [(ICViewControllerManager *)self selectedNoteObjectID];
    id v16 = (void *)v15;
    if (v14 == 1)
    {
      if (!v15)
      {
        id v17 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
        a4 = 2 * ([v17 count] != 0);
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (!v15)
    {
      id v17 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
      a4 = [v17 count] != 0;
      goto LABEL_25;
    }
    a4 = 2;
LABEL_26:

    goto LABEL_27;
  }
  id v18 = [(ICViewControllerManager *)self noteEditorViewController];
  id v19 = [v18 presentedViewController];
  unsigned int v71 = [v19 ic_hasFullScreenModalPresentationStyle];

  unsigned __int8 v20 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  uint64_t v21 = [v20 noteSearchViewController];
  if ([v21 isActive])
  {
    uint64_t v22 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
    objc_super v23 = [v22 noteSearchViewController];
    unsigned int v70 = [v23 ic_isViewVisible];
  }
  else
  {
    unsigned int v70 = 0;
  }

  unsigned int v24 = [(ICViewControllerManager *)self isMainSplitViewDisplayModeSecondaryOnly];
  unsigned int v25 = [(ICViewControllerManager *)self isTagSelected];
  int64_t v26 = [(ICViewControllerManager *)self noteContainerViewMode];
  double v27 = [(ICViewControllerManager *)self mainSplitViewController];
  id v28 = [v27 displayMode];
  if (v26)
  {
    if (v28 == (id)2)
    {
      BOOL v29 = 1;
    }
    else
    {
      v30 = [(ICViewControllerManager *)self mainSplitViewController];
      BOOL v29 = [v30 displayMode] == (id)3;
    }
    unsigned int v31 = [(ICViewControllerManager *)self secondaryNavigationController];
    v32 = [v31 viewControllers];
    if ([v32 count])
    {
      BOOL v33 = [(ICViewControllerManager *)self isMainSplitViewDisplayModeSecondaryOnly];
      goto LABEL_43;
    }
LABEL_40:
    BOOL v33 = 0;
    goto LABEL_43;
  }
  if (v28 == (id)4)
  {
    BOOL v29 = 1;
  }
  else
  {
    char v38 = [(ICViewControllerManager *)self mainSplitViewController];
    if ([v38 displayMode] == (id)6)
    {
      BOOL v29 = 1;
    }
    else
    {
      unsigned int v39 = [(ICViewControllerManager *)self mainSplitViewController];
      BOOL v29 = [v39 displayMode] == (id)5;
    }
  }

  unsigned int v31 = [(ICViewControllerManager *)self supplementaryNavigationController];
  v32 = [v31 viewControllers];
  if (![v32 count]) {
    goto LABEL_40;
  }
  unint64_t v40 = [(ICViewControllerManager *)self mainSplitViewController];
  if ([v40 displayMode] == (id)2)
  {
    BOOL v33 = 1;
  }
  else
  {
    [(ICViewControllerManager *)self mainSplitViewController];
    BOOL v41 = v69 = v25;
    BOOL v33 = [v41 displayMode] == (id)3;

    unsigned int v25 = v69;
  }

LABEL_43:
  if (((v24 | v71) & 1) != 0 || (id)[(ICViewControllerManager *)self behavior] == (id)3) {
    goto LABEL_45;
  }
  if ((!v29 | v70 | v25 & v29) != 1)
  {
    a4 = 0;
    goto LABEL_28;
  }
  if ((v33 | v70 | v25 & v29) == 1)
  {
    if (![(ICViewControllerManager *)self noteContainerViewMode])
    {
      a4 = 1;
      goto LABEL_28;
    }
LABEL_45:
    [(ICViewControllerManager *)self selectionStateTrackingEnabled];
    int v37 = 1;
    a4 = 2;
    goto LABEL_46;
  }
LABEL_27:
  if (a4 == 2) {
    goto LABEL_45;
  }
LABEL_28:
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    [(ICViewControllerManager *)self setSelectedNoteObjectID:0];
  }
  BOOL v34 = [(ICViewControllerManager *)self noteEditorViewController];
  [v34 stopTextFindingIfNecessary];

  id v35 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
  [v35 stopTextFinding];

  unsigned __int8 v36 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
  int v37 = 0;
  if (!a4 && (v36 & 1) == 0)
  {
    [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:0 sideEffects:0];
    a4 = 0;
    int v37 = 0;
  }
LABEL_46:
  unsigned int v42 = [(ICViewControllerManager *)self childPrimaryViewController];
  id v43 = +[NSMutableArray arrayWithObject:v42];

  int64_t v44 = [(ICViewControllerManager *)self noteContainerViewMode];
  if ((unint64_t)(a4 - 1) <= 1 && !v44)
  {
    id v45 = [(ICViewControllerManager *)self supplementaryNavigationController];
    id v46 = [v45 viewControllers];
    [v43 ic_addObjectsFromNonNilArray:v46];
  }
  if (v37)
  {
    if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1) {
      unsigned int v47 = ![(ICViewControllerManager *)self isNoteEditorVisible];
    }
    else {
      unsigned int v47 = 0;
    }
    unsigned int v48 = [(ICViewControllerManager *)self secondaryNavigationController];
    uint64_t v49 = [v48 viewControllers];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v50 = v49;
    id v51 = [v50 countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v73;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v73 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          if (v47)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              continue;
            }
          }
          [v43 addObject:v55];
        }
        id v52 = [v50 countByEnumeratingWithState:&v72 objects:v76 count:16];
      }
      while (v52);
    }
  }
  id v56 = [v43 copy];
  CFNullRef v57 = [(ICViewControllerManager *)self compactNavigationController];
  [v57 setViewControllers:v56];

  id v58 = [(ICViewControllerManager *)self selectedModernNote];
  LODWORD(v57) = [v58 isSharedViaICloud];

  if (!v57) {
    goto LABEL_80;
  }
  if (![(ICViewControllerManager *)self isApplyingStateRestoreArchive])
  {
    v59 = [(ICViewControllerManager *)self window];
    id v60 = [v59 rootViewController];
    id v61 = [v60 ic_topViewController];
    if (objc_msgSend(v61, "ic_hasFullScreenModalPresentationStyle"))
    {

      goto LABEL_77;
    }
    BOOL v62 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    if ([v62 displayMode] == (id)2)
    {

LABEL_76:
      uint64_t v65 = 2;
LABEL_79:
      CFNullRef v67 = [(ICViewControllerManager *)self selectedModernNote];
      [(ICViewControllerManager *)self presentActivityStreamForObject:v67 viewMode:v65 animated:0];

      goto LABEL_80;
    }
    int v63 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    id v64 = [v63 displayMode];

    if (v64 == (id)3) {
      goto LABEL_76;
    }
  }
LABEL_77:
  v66 = [(ICViewControllerManager *)self activityStreamSelection];

  if (v66)
  {
    uint64_t v65 = 1;
    goto LABEL_79;
  }
LABEL_80:

LABEL_81:
  return 3;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (UINavigationController)compactNavigationController
{
  compactNavigationController = self->_compactNavigationController;
  if (!compactNavigationController)
  {
    id v4 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithNibName:0 bundle:0];
    double v5 = self->_compactNavigationController;
    self->_compactNavigationController = v4;

    id v6 = [(UINavigationController *)self->_compactNavigationController navigationBar];
    [v6 setPrefersLargeTitles:1];

    [(UINavigationController *)self->_compactNavigationController setToolbarHidden:0];
    [(UINavigationController *)self->_compactNavigationController setDelegate:self];
    compactNavigationController = self->_compactNavigationController;
  }
  id v7 = compactNavigationController;

  return v7;
}

- (NSManagedObjectID)focusedNoteObjectID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v3 = [(ICViewControllerManager *)self selectionStateController];
    id v4 = [v3 focusedNoteObjectID];
  }
  else
  {
    id v4 = self->_focusedNoteObjectID;
  }

  return v4;
}

- (void)setupWithWindow:(id)a3 stateRestoreArchive:(id)a4 completion:(id)a5
{
  id v34 = a3;
  double v8 = (ICWindowStateArchive *)a4;
  id v9 = a5;
  [(ICViewControllerManager *)self setWindow:v34];
  [v34 setViewControllerManager:self];
  [(ICViewControllerManager *)self updateOverrideNoteContainerViewModeIfNeeded];
  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"managedObjectContextDidChange:" name:NSManagedObjectContextObjectsDidChangeNotification object:0];
  [v10 addObserver:self selector:"noteLockManagerWillToggleLock:" name:ICNoteLockManagerWillToggleLockNotification object:0];
  [v10 addObserver:self selector:"noteLockManagerDidToggleLock:" name:ICNoteLockManagerDidToggleLockNotification object:0];
  double v11 = +[NSNotification ICTagCollectionViewWillRenameTagNotification];
  [v10 addObserver:self selector:"collectionViewWillRenameTag:" name:v11 object:0];

  double v12 = +[NSNotification ICTagCollectionViewDidRenameTagNotification];
  [v10 addObserver:self selector:"tagDidRename:" name:v12 object:0];

  int64_t v13 = +[NSNotification ICTagCollectionViewWillDeleteTagsNotification];
  [v10 addObserver:self selector:"collectionViewWillDeleteTags:" name:v13 object:0];

  int64_t v14 = +[NSNotification ICTagCollectionViewDidDeleteTagsNotification];
  [v10 addObserver:self selector:"tagsDidDelete:" name:v14 object:0];

  [v10 addObserver:self selector:"migrationStateDidChange:" name:ICMigrationStateDidChangeNotification object:0];
  [v10 addObserver:self selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];
  [v10 addObserver:self selector:"folderWasCreated:" name:@"ICFolderCreationControllerFolderWasCreatedNotification" object:0];
  [v10 addObserver:self selector:"willDismissSearch:" name:@"ICBaseViewControllerWillDismissSearchControllerNotification" object:0];
  [v10 addObserver:self selector:"searchQueryDidChange:" name:@"ICNoteSearchViewControllerQueryDidChangeNotification" object:0];
  [v10 addObserver:self selector:"didStartEditing:" name:@"ICFolderListViewControllerDidStartEditingNotification" object:0];
  [v10 addObserver:self selector:"didStartEditing:" name:@"ICNoteBrowseViewControllerDidStartEditingNotification" object:0];
  [v10 addObserver:self selector:"didStartEditing:" name:ICNoteEditorViewControllerDidStartEditingNotification object:0];
  [v10 addObserver:self selector:"didStartEditing:" name:@"NotesDisplayControllerDidStartEditingNotification" object:0];
  uint64_t v15 = +[NSNotification ICRecoverNoteAlertControllerWillRecoverNoteNotification];
  [v10 addObserver:self selector:"editorWillRecoverNote:" name:v15 object:0];

  id v16 = +[NSNotification ICRecoverNoteAlertControllerDidRecoverNoteNotification];
  [v10 addObserver:self selector:"editorDidRecoverNote:" name:v16 object:0];

  id v17 = [[ICKeyboardHandler alloc] initWithDelegate:self];
  keyboardHandler = self->_keyboardHandler;
  self->_keyboardHandler = v17;

  id v19 = [[ICColumnVisibilityController alloc] initWithViewControllerManager:self];
  columnVisibilityController = self->_columnVisibilityController;
  self->_columnVisibilityController = v19;

  if (ICDebugModeEnabled()) {
    +[ICDebuggingViewController setupDebuggingGestureInWindow:v34];
  }
  uint64_t v21 = [v34 windowScene];
  uint64_t v22 = [v21 screenshotService];
  [v22 setDelegate:self];

  if ([(id)objc_opt_class() _isSecure])
  {
    if ([(ICViewControllerManager *)self isAuxiliary]) {
      uint64_t v23 = 5;
    }
    else {
      uint64_t v23 = 4;
    }
    [(ICViewControllerManager *)self initializeModernNoteEditorWithOptions:v23];
    unsigned int v24 = [(ICViewControllerManager *)self noteEditorViewController];
    [v24 setDelegate:self];

    unsigned int v25 = [(ICViewControllerManager *)self noteEditorViewController];
    [(ICViewControllerManager *)self initializeSecondaryNavigationControllerWithViewController:v25];

    int64_t v26 = [(ICViewControllerManager *)self secondaryNavigationController];
    [v34 setRootViewController:v26];

    [v34 setWindowIdentifier:@"com.apple.notes.secure-window-identifier"];
  }
  else
  {
    if (!v8)
    {
      double v8 = objc_alloc_init(ICWindowStateArchive);
      [(ICWindowStateArchive *)v8 setCurrentNoteContainerViewMode:0];
    }
    double v27 = [(ICViewControllerManager *)self overrideContainerIdentifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v29 = [(ICViewControllerManager *)self overrideContainerIdentifier];
      [(ICWindowStateArchive *)v8 setCurrentVirtualSmartFolderIdentifier:v29];
    }
    v30 = [(ICWindowStateArchive *)v8 windowIdentifier];
    [v34 setWindowIdentifier:v30];

    unsigned int v31 = [(ICWindowStateArchive *)v8 toolPickerIdentifier];
    [v34 setToolPickerIdentifier:v31];

    [(ICViewControllerManager *)self applyStateRestoreArchive:v8 completion:v9];
    if ([v34 behavior] == (id)1)
    {
      v32 = (ICHostedNotesAppearanceCoordinator *)[objc_alloc((Class)ICHostedNotesAppearanceCoordinator) initWithDelegate:self];
      hostedNotesAppearanceCoordinator = self->_hostedNotesAppearanceCoordinator;
      self->_hostedNotesAppearanceCoordinator = v32;
    }
  }
}

- (BOOL)hasCompactWidth
{
  id v2 = [(ICViewControllerManager *)self window];
  BOOL v3 = [v2 traitCollection];
  unsigned __int8 v4 = [v3 ic_hasCompactWidth];

  return v4;
}

- (int64_t)behavior
{
  id v2 = [(ICViewControllerManager *)self window];
  id v3 = [v2 behavior];

  return (int64_t)v3;
}

- (ICWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (ICWindow *)WeakRetained;
}

- (void)initializeMainSplitViewWithStateRestoreArchive:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    double v5 = [(ICViewControllerManager *)self selectionStateController];
    id v6 = [v5 selectedNoteObjectID];
    id v7 = v6;
    if (v6)
    {
      id v151 = v6;
    }
    else
    {
      id v151 = [v5 selectedInvitationObjectID];
    }

    int64_t v14 = [v5 selectedNoteBrowseContainerObjectID];

    if (v14)
    {
      uint64_t v15 = [v5 selectedNoteBrowseContainerObjectID];
      v168 = v15;
      *((void *)&v150 + 1) = +[NSArray arrayWithObjects:&v168 count:1];
    }
    else
    {
      *((void *)&v150 + 1) = 0;
    }
    *(void *)&long long v150 = [v5 selectedVirtualSmartFolderItemID];
    v145 = [v5 currentFirstVisibleObjectIDURLForContainerObjectIDURL];
    if (v150 != 0 && !v151) {
      [v4 setIsAuxiliaryWindow:0];
    }
    double v8 = [v5 tagSelection];
    id v16 = [v8 includedObjectIDs];
    double v12 = +[NSMutableSet setWithSet:v16];

    id v17 = [v8 excludedObjectIDs];
    id v18 = +[NSMutableSet setWithSet:v17];

    if ([v8 mode] == (id)1)
    {
      id v19 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      [v12 addObject:v19];
    }
    else
    {
      if ([v8 mode] != (id)2)
      {
LABEL_19:
        id v20 = [v12 copy];
        id v147 = [v18 copy];
        goto LABEL_49;
      }
      id v19 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      [v18 addObject:v19];
    }

    goto LABEL_19;
  }
  double v5 = [v4 currentNoteObjectIDURL];
  double v8 = [v4 currentContainerObjectIDURLs];
  v145 = [v4 currentFirstVisibleObjectIDURLForContainerObjectIDURL];
  id v9 = [v4 currentObjectIDURL];

  if (v9)
  {
    id v10 = [v4 currentObjectIDURL];
    double v11 = [(ICViewControllerManager *)self managedObjectIDFromURL:v10];
    if (objc_msgSend(v11, "ic_isContainerType"))
    {
      [v4 setIsAuxiliaryWindow:0];

      v167 = v10;
      +[NSArray arrayWithObjects:&v167 count:1];
      double v12 = 0;
      id v13 = 0;
      *(void *)&long long v150 = 0;
      v8 = double v5 = v8;
LABEL_34:

      double v5 = v13;
      goto LABEL_35;
    }
    if (!objc_msgSend(v11, "ic_isNoteType"))
    {
      double v12 = 0;
      *(void *)&long long v150 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (objc_msgSend(v11, "ic_isEntityOfClass:", objc_opt_class()))
    {
      uint64_t v21 = [(ICViewControllerManager *)self modernManagedObjectContext];
      uint64_t v22 = [v21 objectWithID:v11];

      if ([v22 isSystemPaper])
      {
        *(void *)&long long v150 = +[ICAccount globalVirtualSystemPaperFolder];
        double v12 = 0;
        goto LABEL_31;
      }
      unsigned int v24 = [v22 objectID];
      uint64_t v25 = [(ICViewControllerManager *)self defaultContainerObjectIDForNoteWithObjectID:v24];
    }
    else
    {
      if (!objc_msgSend(v11, "ic_isEntityOfClass:", objc_opt_class()))
      {
        *(void *)&long long v150 = 0;
        double v12 = 0;
LABEL_33:
        id v13 = v10;
        goto LABEL_34;
      }
      uint64_t v23 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      uint64_t v22 = [v23 objectWithID:v11];

      unsigned int v24 = [v22 store];
      uint64_t v25 = [v24 objectID];
    }
    double v12 = (void *)v25;

    *(void *)&long long v150 = 0;
LABEL_31:

    if (v12)
    {
      int64_t v26 = [v12 URIRepresentation];
      v166 = v26;
      uint64_t v27 = +[NSArray arrayWithObjects:&v166 count:1];

      double v8 = (void *)v27;
    }
    goto LABEL_33;
  }
  double v12 = 0;
  *(void *)&long long v150 = 0;
LABEL_36:
  id v151 = [(ICViewControllerManager *)self managedObjectIDFromURL:v5];
  v163[0] = _NSConcreteStackBlock;
  v163[1] = 3221225472;
  v163[2] = sub_100045D40;
  v163[3] = &unk_100625E40;
  v163[4] = self;
  *((void *)&v150 + 1) = [v8 ic_compactMap:v163];
  if (!(void)v150)
  {
    id v28 = [v4 currentVirtualSmartFolderType];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      *(void *)&long long v150 = 0;
    }
    else
    {
      v30 = [v4 currentVirtualSmartFolderAccountObjectIDURL];
      if (v30)
      {
        v148 = [(ICViewControllerManager *)self managedObjectIDFromURL:v30];
      }
      else
      {
        v148 = 0;
      }
      unsigned int v31 = +[ICVirtualSmartFolderItemIdentifier allTypes];
      v32 = [v4 currentVirtualSmartFolderType];
      unsigned int v33 = [v31 containsObject:v32];

      if (v33)
      {
        id v34 = objc_alloc((Class)ICVirtualSmartFolderItemIdentifier);
        id v35 = [v4 currentVirtualSmartFolderType];
        unsigned __int8 v36 = +[ICFolderListSectionIdentifier systemSectionIdentifier];
        *(void *)&long long v150 = [v34 initWithType:v35 parentIdentifier:v36 accountObjectID:v148];
      }
      else
      {
        unsigned __int8 v36 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1004D4820(v4);
        }
        *(void *)&long long v150 = 0;
        id v35 = v36;
      }
    }
  }
  int v37 = [v4 currentTagIdentifiers];
  id v18 = +[NSSet setWithArray:v37];

  v162[0] = _NSConcreteStackBlock;
  v162[1] = 3221225472;
  v162[2] = sub_100045DC0;
  v162[3] = &unk_1006252A8;
  v162[4] = self;
  [v18 ic_compactMap:v162];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v147 = 0;
LABEL_49:

  uint64_t v38 = [*((id *)&v150 + 1) lastObject];
  v146 = (void *)v38;
  if (v38) {
    uint64_t v39 = v38;
  }
  else {
    uint64_t v39 = v150;
  }
  int64_t v40 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v39];
  if (v40 != -1) {
    [v4 setCurrentNoteContainerViewMode:v40];
  }
  self->_noteContainerViewMode = (int64_t)[v4 currentNoteContainerViewMode];
  unsigned __int8 v41 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
  if (v151) {
    char v42 = v41;
  }
  else {
    char v42 = 1;
  }
  if ((v42 & 1) == 0 && ![*((id *)&v150 + 1) count])
  {
    uint64_t v43 = [(ICViewControllerManager *)self defaultContainerObjectIDForNoteWithObjectID:v151];
    int64_t v44 = (void *)v43;
    if (v43)
    {
      uint64_t v165 = v43;
      uint64_t v45 = +[NSArray arrayWithObjects:&v165 count:1];

      *((void *)&v150 + 1) = v45;
    }
  }
  id v46 = [(ICViewControllerManager *)self folderListViewController];
  BOOL v47 = v46 == 0;

  if (v47)
  {
    id v50 = [ICFolderListViewController alloc];
    id v51 = [v4 currentNoteContainerViewMode];
    uint64_t v49 = [(ICViewControllerManager *)self overrideContainerIdentifier];
    id v52 = [(ICFolderListViewController *)v50 initWithViewMode:v51 viewControllerManager:self overrideContainerIdentifier:v49];
    [(ICViewControllerManager *)self setFolderListViewController:v52];
  }
  else
  {
    id v48 = [v4 currentNoteContainerViewMode];
    uint64_t v49 = [(ICViewControllerManager *)self folderListViewController];
    [v49 setNoteContainerViewMode:v48];
  }

  -[ICViewControllerManager setPreferredNoteContainerViewMode:](self, "setPreferredNoteContainerViewMode:", [v4 preferredNoteContainerViewMode]);
  uint64_t v53 = -[ICNoteBrowseViewController initWithViewMode:viewControllerManager:]([ICNoteBrowseViewController alloc], "initWithViewMode:viewControllerManager:", [v4 currentNoteContainerViewMode], self);
  [(ICViewControllerManager *)self setRootNoteBrowseViewController:v53];

  v54 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
  [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v54];

  LODWORD(v54) = [v4 isAuxiliaryWindow];
  [(ICViewControllerManager *)self initializeLegacyNoteEditor];
  [(ICViewControllerManager *)self initializeModernNoteEditorWithOptions:v54];
  v149 = +[NSMutableArray array];
  if ([v20 count] || objc_msgSend(v147, "count"))
  {
    uint64_t v55 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    id v56 = v20;
    if (!v20)
    {
      id v56 = +[NSSet set];
    }
    if (v147)
    {
      [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v55 animated:0 ensurePresented:1 containerIdentifiers:v56 excludingIdentifiers:v147 ensureSelectedNote:0 keepEditorShowing:0 dataIndexedBlock:0 dataRenderedBlock:0];
    }
    else
    {
      CFNullRef v57 = +[NSSet set];
      [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v55 animated:0 ensurePresented:1 containerIdentifiers:v56 excludingIdentifiers:v57 ensureSelectedNote:0 keepEditorShowing:0 dataIndexedBlock:0 dataRenderedBlock:0];
    }
    if (!v20) {

    }
    id v58 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [v149 addObject:v58];
  }
  else if ((void)v150)
  {
    long long v75 = [(ICViewControllerManager *)self selectedNoteObjectID];
    id v76 = v75;
    if (v75)
    {
      id v77 = v75;
    }
    else
    {
      id v77 = [(ICViewControllerManager *)self selectedInvitationObjectID];
    }
    v134 = v77;

    int64_t v135 = [(ICViewControllerManager *)self noteContainerViewMode];
    v136 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    unsigned int v137 = [v136 isCollapsed];

    LODWORD(v136) = [(ICViewControllerManager *)self isApplyingStateRestoreArchive];
    if (([(ICViewControllerManager *)self selectionStateTrackingEnabled] & v136) == 1
      && v134)
    {
      uint64_t v138 = 1;
    }
    else if (v40 != 1 && v135 == 0)
    {
      uint64_t v138 = v137 ^ 1;
    }
    else
    {
      uint64_t v138 = 0;
    }
    v140 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    v141 = +[NSSet setWithObject:(void)v150];
    v142 = +[NSSet set];
    v143 = +[NSNumber numberWithBool:[(ICViewControllerManager *)self isNoteEditorVisible]];
    [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v140 animated:0 ensurePresented:1 containerIdentifiers:v141 excludingIdentifiers:v142 ensureSelectedNote:v138 keepEditorShowing:v143 dataIndexedBlock:0 dataRenderedBlock:0];

    v144 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [v149 addObject:v144];
  }
  else
  {
    v156[0] = _NSConcreteStackBlock;
    v156[1] = 3221225472;
    v156[2] = sub_100013CE0;
    v156[3] = &unk_100625E90;
    v156[4] = self;
    id v157 = v151;
    id v158 = v149;
    id v159 = *((id *)&v150 + 1);
    int64_t v161 = v40;
    id v160 = v145;
    [v159 enumerateObjectsUsingBlock:v156];
  }
  if (!v151) {
    goto LABEL_99;
  }
  if (([v4 isAuxiliaryWindow] & 1) == 0 && !objc_msgSend(*((id *)&v150 + 1), "count"))
  {
    unsigned int v59 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
    unsigned int v60 = (void)v150 ? v59 : 0;
    if (v60 != 1) {
      goto LABEL_99;
    }
  }
  if (objc_msgSend(v151, "ic_isEntityOfClass:", objc_opt_class()))
  {
    id v61 = [(ICViewControllerManager *)self modernManagedObjectContext];
    BOOL v62 = [v61 objectWithID:v151];

    int v63 = [(ICViewControllerManager *)self noteEditorViewController];
    [v63 setEditing:0];

    id v64 = [(ICViewControllerManager *)self noteEditorViewController];
    [v64 setNote:v62 delayedForLaunch:1 successHandler:0];

    uint64_t v65 = [v4 scrollStateForNote:v62];
    v66 = [(ICViewControllerManager *)self noteEditorViewController];
    [v66 applyScrollStateFromArchive:v65];

    CFNullRef v67 = [(ICViewControllerManager *)self noteEditorViewController];

    goto LABEL_87;
  }
  if (!objc_msgSend(v151, "ic_isEntityOfClass:", objc_opt_class()))
  {
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]
      && objc_msgSend(v151, "ic_isInvitationType"))
    {
      long long v73 = [(ICViewControllerManager *)self modernManagedObjectContext];
      BOOL v62 = [v73 objectWithID:v151];

      long long v74 = [(ICViewControllerManager *)self noteEditorViewController];
      [v74 setInvitation:v62];

      uint64_t v70 = [(ICViewControllerManager *)self noteEditorViewController];
      goto LABEL_86;
    }
    [(ICViewControllerManager *)self selectionStateTrackingEnabled];
LABEL_99:
    CFNullRef v67 = 0;
    goto LABEL_100;
  }
  CFNullRef v68 = [(ICViewControllerManager *)self legacyManagedObjectContext];
  BOOL v62 = [v68 objectWithID:v151];

  unsigned int v69 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
  [v69 displayNote:v62];

  uint64_t v70 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
LABEL_86:
  CFNullRef v67 = (void *)v70;
LABEL_87:

  unsigned __int8 v71 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
  if (v67) {
    char v72 = v71;
  }
  else {
    char v72 = 1;
  }
  if ((v72 & 1) == 0) {
    [(ICViewControllerManager *)self setSelectedNoteObjectID:v151];
  }
LABEL_100:
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    v78 = [v4 focusedNoteObjectIDURL];
    if (v78)
    {
      v79 = [(ICViewControllerManager *)self managedObjectIDFromURL:v78];
      [(ICViewControllerManager *)self setFocusedNoteObjectID:v79];
    }
  }
  if (!v67)
  {
    if ([(ICViewControllerManager *)self noteContainerViewMode]
      || [(ICViewControllerManager *)self hasCompactWidth])
    {
      CFNullRef v67 = 0;
    }
    else
    {
      CFNullRef v67 = [(ICViewControllerManager *)self noteEditorViewController];
    }
  }
  int64_t v80 = [(ICViewControllerManager *)self behavior];
  if ([v4 isAuxiliaryWindow])
  {
    [(ICViewControllerManager *)self initializeSecondaryNavigationControllerWithViewController:v67];
    goto LABEL_123;
  }
  primaryNavigationController = self->_primaryNavigationController;
  self->_primaryNavigationController = 0;

  if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1)
  {
    v82 = [[ICMainSplitViewController alloc] initWithStyle:1 viewControllerManager:self];
    [(ICViewControllerManager *)self setMainSplitViewController:v82];

    v83 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [(ICViewControllerManager *)self initializeSecondaryNavigationControllerWithViewController:v83];

    id v84 = v149;
    v85 = v84;
    if (v67)
    {
      uint64_t v86 = [v84 arrayByAddingObject:v67];

      v85 = (void *)v86;
    }
    v87 = [(ICViewControllerManager *)self secondaryNavigationController];
    [v87 setViewControllers:v85];

    v88 = [(ICViewControllerManager *)self secondaryNavigationController];
    [v88 setDelegate:self];

    if (v80 != 1) {
      goto LABEL_121;
    }
  }
  else
  {
    [(ICViewControllerManager *)self initializeSecondaryNavigationControllerWithViewController:v67];
    if (v80 == 1) {
      uint64_t v89 = 1;
    }
    else {
      uint64_t v89 = 2;
    }
    v90 = [[ICMainSplitViewController alloc] initWithStyle:v89 viewControllerManager:self];
    [(ICViewControllerManager *)self setMainSplitViewController:v90];

    v91 = [(ICViewControllerManager *)self mainSplitViewController];
    [v91 setShowsSecondaryOnlyButton:1];

    if (v80 != 1)
    {
      id v112 = [objc_alloc((Class)UINavigationController) initWithNibName:0 bundle:0];
      [(ICViewControllerManager *)self setSupplementaryNavigationController:v112];

      v113 = [(ICViewControllerManager *)self supplementaryNavigationController];
      v114 = [v113 navigationBar];
      [v114 setPrefersLargeTitles:1];

      v115 = +[UIColor ICBackgroundColor];
      v116 = [(ICViewControllerManager *)self supplementaryNavigationController];
      v117 = [v116 view];
      [v117 setBackgroundColor:v115];

      v118 = [(ICViewControllerManager *)self supplementaryNavigationController];
      [v118 setDelegate:self];

      id v119 = [v149 copy];
      v120 = [(ICViewControllerManager *)self supplementaryNavigationController];
      [v120 setViewControllers:v119];

      v121 = [(ICViewControllerManager *)self mainSplitViewController];
      v122 = [(ICViewControllerManager *)self supplementaryNavigationController];
      [v121 setViewController:v122 forColumn:1];

LABEL_121:
      v123 = [(ICViewControllerManager *)self mainSplitViewController];
      v124 = [(ICViewControllerManager *)self primaryNavigationController];
      [v123 setViewController:v124 forColumn:0];

      v125 = [(ICViewControllerManager *)self mainSplitViewController];
      [v125 setPreferredDisplayMode:0];

      goto LABEL_122;
    }
  }
  v92 = [(ICViewControllerManager *)self mainSplitViewController];
  v93 = [(ICViewControllerManager *)self primaryContainerViewController];
  [v92 setViewController:v93 forColumn:0];

  v94 = [(ICViewControllerManager *)self mainSplitViewController];
  [v94 setDisplayModeButtonVisibility:1];

  v95 = [(ICViewControllerManager *)self mainSplitViewController];
  [v95 setPreferredDisplayMode:2];

  v96 = [(ICViewControllerManager *)self mainSplitViewController];
  [v96 primaryColumnWidth];
  double v98 = v97;
  v99 = [(ICViewControllerManager *)self primaryContainerViewController];
  v100 = [v99 configuration];
  [v100 insets];
  double v102 = v101;
  v103 = [(ICViewControllerManager *)self primaryContainerViewController];
  v104 = [v103 configuration];
  [v104 insets];
  double v106 = v105;
  v107 = [(ICViewControllerManager *)self mainSplitViewController];
  [v107 setPreferredPrimaryColumnWidth:v98 + v102 + v106];

  v108 = [(ICViewControllerManager *)self mainSplitViewController];
  [v108 _setWantsFloatingSidebar:1];

  objc_initWeak(&location, self);
  v109 = [(ICViewControllerManager *)self mainSplitViewController];
  v164[0] = objc_opt_class();
  v164[1] = objc_opt_class();
  v110 = +[NSArray arrayWithObjects:v164 count:2];
  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_100045EA4;
  v153[3] = &unk_100625EB8;
  objc_copyWeak(&v154, &location);
  id v111 = [v109 registerForTraitChanges:v110 withHandler:v153];

  objc_destroyWeak(&v154);
  objc_destroyWeak(&location);
LABEL_122:
  BOOL v126 = (id)[(ICViewControllerManager *)self behavior] != (id)3;
  v127 = [(ICViewControllerManager *)self mainSplitViewController];
  [v127 setPresentsWithGesture:v126];

  v128 = [(ICViewControllerManager *)self mainSplitViewController];
  v129 = [(ICViewControllerManager *)self secondaryNavigationController];
  [v128 setViewController:v129 forColumn:2];

  v130 = [(ICViewControllerManager *)self mainSplitViewController];
  id v131 = objc_alloc_init((Class)UINavigationController);
  [v130 setViewController:v131 forColumn:3];

  v132 = [(ICViewControllerManager *)self mainSplitViewController];
  [v132 setDelegate:self];

  v133 = [(ICViewControllerManager *)self mainSplitViewController];
  [v133 setPreferredSplitBehavior:0];

LABEL_123:
  if ([v4 isAttachmentBrowserOpen])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045EE4;
    block[3] = &unk_100625AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (ICMainSplitViewController)mainSplitViewController
{
  return self->_mainSplitViewController;
}

- (ICNoteEditing)activeEditorController
{
  if ([(ICViewControllerManager *)self isInHTMLEditorMode]) {
    [(ICViewControllerManager *)self legacyNoteEditorViewController];
  }
  else {
  id v3 = [(ICViewControllerManager *)self noteEditorViewController];
  }

  return (ICNoteEditing *)v3;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  id v3 = [(ICViewControllerManager *)self systemPaperViewController];

  if (v3)
  {
    id v4 = [(ICViewControllerManager *)self systemPaperViewController];
    double v5 = [v4 currentNoteEditorViewController];
  }
  else
  {
    double v5 = self->_noteEditorViewController;
  }

  return v5;
}

- (ICSystemPaperViewController)systemPaperViewController
{
  return self->_systemPaperViewController;
}

- (UINavigationController)supplementaryNavigationController
{
  return self->_supplementaryNavigationController;
}

- (void)managedObjectContextDidChange:(id)a3
{
  id v65 = a3;
  val = self;
  id v6 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  if (v6)
  {
    int v7 = 0;
LABEL_7:
    double v8 = val;
    goto LABEL_8;
  }
  id v3 = [(ICViewControllerManager *)val selectedNoteObjectID];
  if (v3)
  {
    int v7 = 0;
    goto LABEL_7;
  }
  id v4 = [(ICViewControllerManager *)val selectedInvitationObjectID];
  if (v4)
  {
    id v3 = 0;
    int v7 = 1;
    goto LABEL_7;
  }
  double v8 = val;
  if (![(ICViewControllerManager *)val isTagSelected]) {
    goto LABEL_103;
  }
  id v4 = 0;
  id v3 = 0;
  int v7 = 1;
LABEL_8:
  if ([(ICViewControllerManager *)v8 isSelectedNoteTogglingLock]
    || [(ICViewControllerManager *)v8 isRecoveredNoteBeingPresented]
    || [(ICViewControllerManager *)v8 isApplyingStateRestoreArchive]
    || [(ICViewControllerManager *)v8 isTagBeingRenamed])
  {
    unsigned __int8 v9 = 1;
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned __int8 v9 = [(ICViewControllerManager *)v8 isTagBeingDeleted];
  if (v7) {
LABEL_13:
  }

LABEL_14:
  if (!v6) {

  }
  if ((v9 & 1) == 0)
  {
    id v10 = [v65 userInfo];
    double v11 = [v10 objectForKeyedSubscript:NSInsertedObjectsKey];

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v98;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v98 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if ([(ICViewControllerManager *)val shouldManagedObjectBecomeSelectedNote:v15])
          {
            id v16 = [v15 objectID];
            goto LABEL_27;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_27:

    CFNullRef v68 = +[NSMutableSet set];
    unsigned __int8 v71 = +[NSMutableSet set];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v102[0] = NSDeletedObjectsKey;
    v102[1] = NSUpdatedObjectsKey;
    v102[2] = NSRefreshedObjectsKey;
    id v63 = +[NSArray arrayWithObjects:v102 count:3];
    id v66 = [v63 countByEnumeratingWithState:&v93 objects:v103 count:16];
    if (v66)
    {
      uint64_t v69 = 0;
      uint64_t v64 = *(void *)v94;
      while (1)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v94 != v64)
          {
            uint64_t v18 = v17;
            objc_enumerationMutation(v63);
            uint64_t v17 = v18;
          }
          uint64_t v67 = v17;
          uint64_t v19 = *(void *)(*((void *)&v93 + 1) + 8 * v17);
          id v20 = [v65 userInfo];
          uint64_t v21 = [v20 objectForKeyedSubscript:v19];

          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v22 = v21;
          id v23 = [v22 countByEnumeratingWithState:&v89 objects:v101 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v90;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v90 != v24) {
                  objc_enumerationMutation(v22);
                }
                int64_t v26 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v25);
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  [v71 addObject:v26];
                  goto LABEL_40;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v27 = [v26 note];
                  [v71 ic_addNonNilObject:v27];

                  goto LABEL_40;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_40;
                    }
                    id v31 = v26;
                    if ([v31 markedForDeletion])
                    {
                      id v35 = [v31 objectID];
                      [v68 addObject:v35];
                    }
                    goto LABEL_60;
                  }
                }
                if ([v26 isDeleted])
                {
                  id v28 = [(ICViewControllerManager *)val selectedNoteBrowseContainerItemID];
                  BOOL v29 = [v26 objectID];
                  unsigned __int8 v30 = [v28 isEqual:v29];

                  if (v30)
                  {
                    uint64_t v69 = 0x100000001;
                    goto LABEL_40;
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v31 = v26;
                  v32 = [v31 objectID];
                  unsigned int v33 = [(ICViewControllerManager *)val selectedNoteBrowseContainerItemID];
                  unsigned int v34 = [v32 isEqual:v33];

                  if (v34)
                  {
                    if (([v31 markedForDeletion] & 1) != 0
                      || [v31 isTrashFolder] && !objc_msgSend(v31, "visibleNotesCount"))
                    {
                      HIDWORD(v69) = 1;
                    }
                  }
                  else if (![(ICViewControllerManager *)val selectionStateTrackingEnabled])
                  {
                    unsigned __int8 v36 = [(ICViewControllerManager *)val selectedNoteBrowseContainerItemID];
                    if (v36)
                    {
                    }
                    else
                    {
                      int v37 = [v31 objectID];
                      uint64_t v38 = [(ICViewControllerManager *)val mostRecentNonSearchContainerItemID];
                      if ([v37 isEqual:v38])
                      {
                        unsigned int v39 = [v31 markedForDeletion];

                        if (v39)
                        {
                          int64_t v40 = [v31 account];
                          unsigned __int8 v41 = [v40 defaultFolder];

                          char v42 = [v41 objectID];
                          [(ICViewControllerManager *)val setMostRecentNonSearchContainerItemID:v42];
                        }
                      }
                      else
                      {
                      }
                    }
                  }
LABEL_60:
                }
LABEL_40:
                if (!v16)
                {
                  if ([(ICViewControllerManager *)val shouldManagedObjectBecomeSelectedNote:v26])
                  {
                    id v16 = [v26 objectID];
                  }
                  else
                  {
                    id v16 = 0;
                  }
                }
                uint64_t v25 = (char *)v25 + 1;
              }
              while (v23 != v25);
              id v43 = [v22 countByEnumeratingWithState:&v89 objects:v101 count:16];
              id v23 = v43;
            }
            while (v43);
          }

          uint64_t v17 = v67 + 1;
        }
        while ((id)(v67 + 1) != v66);
        id v66 = [v63 countByEnumeratingWithState:&v93 objects:v103 count:16];
        if (!v66) {
          goto LABEL_77;
        }
      }
    }
    uint64_t v69 = 0;
LABEL_77:

    objc_opt_class();
    int64_t v44 = [(ICViewControllerManager *)val selectedContainerItemID];
    uint64_t v45 = ICDynamicCast();
    id v46 = +[ICNoteContext sharedContext];
    BOOL v47 = [v46 workerManagedObjectContext];
    unsigned int v48 = [v45 isHiddenInContext:v47];

    id v49 = [v68 copy];
    unsigned int v50 = [(ICViewControllerManager *)val selectContainersForDeletedHashtagObjectIDs:v49];

    if (((v48 | HIDWORD(v69)) & 1) != 0
      && ![(ICViewControllerManager *)val isNoteBeingRecovered]
      && (([(ICViewControllerManager *)val isSelectingNextRelevantNoteBrowseContainer] | v50) & 1) == 0&& ([(ICViewControllerManager *)val overrideContainerIdentifier], id v51 = objc_claimAutoreleasedReturnValue(), v52 = v51 == 0, v51, v52))
    {
      [(ICViewControllerManager *)val selectNextContainerForDeletedFolder];
    }
    else if (v16)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100046868;
      block[3] = &unk_100625860;
      block[4] = val;
      id v88 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else if (([v71 count] != 0) | v69 & 1)
    {
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x3032000000;
      id v84 = sub_10003A7F0;
      v85 = sub_10003A800;
      id v86 = 0;
      uint64_t v77 = 0;
      v78 = &v77;
      uint64_t v79 = 0x2020000000;
      char v80 = 0;
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_1000468D8;
      v76[3] = &unk_100625FC8;
      v76[4] = val;
      v76[5] = &v81;
      v76[6] = &v77;
      uint64_t v53 = [v71 ic_compactMap:v76];
      if (*((unsigned char *)v78 + 24))
      {
        v54 = [(ICViewControllerManager *)val selectedNoteObjectID];
        uint64_t v55 = +[NSSet setWithObject:v54];
        [(ICViewControllerManager *)val selectNextRelevantObjectUsingChangedInappropriateIdentifiers:v55];
      }
      else
      {
        id v56 = [(ICViewControllerManager *)val selectedSearchResult];
        BOOL v57 = v56 == 0;

        if (v57)
        {
          if (v82[5])
          {
            objc_initWeak(&location, val);
            [(ICViewControllerManager *)val setIsRecoveredNoteBeingPresented:1];
            v73[0] = _NSConcreteStackBlock;
            v73[1] = 3221225472;
            v73[2] = sub_100046F14;
            v73[3] = &unk_100625FF0;
            v73[4] = val;
            v73[5] = &v81;
            objc_copyWeak(&v74, &location);
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v73);
            objc_destroyWeak(&v74);
            objc_destroyWeak(&location);
          }
          else
          {
            if ([v53 count])
            {
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472;
              v72[2] = sub_100047130;
              v72[3] = &unk_100626018;
              v72[4] = val;
              unsigned int v58 = [v53 ic_containsObjectPassingTest:v72];
            }
            else
            {
              unsigned int v58 = 0;
            }
            if ((v69 | v58))
            {
              unsigned int v59 = [v65 object];
              unsigned int v60 = [(ICViewControllerManager *)val selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:v59];
              if (((v60 | [(ICViewControllerManager *)val selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:v59]) & 1) == 0)
              {
                id v61 = [v53 valueForKey:@"objectID"];
                [(ICViewControllerManager *)val selectNextRelevantObjectUsingChangedInappropriateIdentifiers:v61];
              }
            }
          }
        }
      }

      _Block_object_dispose(&v77, 8);
      _Block_object_dispose(&v81, 8);
    }
  }
LABEL_103:
}

- (BOOL)shouldAutomaticallySelectNoteContainerForSelectionStateController:(id)a3
{
  if ([(ICViewControllerManager *)self isApplyingStateRestoreArchive]
    || ![(ICViewControllerManager *)self hasCompactWidth])
  {
    return 1;
  }
  id v4 = [(ICViewControllerManager *)self overrideContainerIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isApplyingStateRestoreArchive
{
  return self->_isApplyingStateRestoreArchive;
}

- (BOOL)isSelectedNoteTogglingLock
{
  return self->_isSelectedNoteTogglingLock;
}

- (BOOL)isRecoveredNoteBeingPresented
{
  return self->_isRecoveredNoteBeingPresented;
}

- (BOOL)shouldSelectDefaultContainerWhenInappropriateForSelectionStateController:(id)a3
{
  if ([(ICViewControllerManager *)self isSearchActive]) {
    return 0;
  }
  BOOL v5 = [(ICViewControllerManager *)self overrideContainerIdentifier];
  BOOL v4 = v5 == 0;

  return v4;
}

- (ICItemIdentifier)overrideContainerIdentifier
{
  if ((id)[(ICViewControllerManager *)self behavior] == (id)1)
  {
    id v2 = +[ICAccount globalVirtualMathNotesFolder];
  }
  else
  {
    id v2 = 0;
  }

  return (ICItemIdentifier *)v2;
}

- (BOOL)isSearchActive
{
  id v3 = [(ICViewControllerManager *)self folderListViewController];
  BOOL v4 = [v3 navigationItem];
  uint64_t v5 = [v4 searchController];
  unsigned __int8 v6 = [(id)v5 isActive];

  int v7 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  double v8 = [v7 navigationItem];
  unsigned __int8 v9 = [v8 searchController];
  LOBYTE(v5) = [v9 isActive];

  return v6 | v5;
}

- (ICNoteBrowseViewController)currentNoteBrowseViewController
{
  return self->_currentNoteBrowseViewController;
}

- (ICKeyboardHandler)keyboardHandler
{
  return self->_keyboardHandler;
}

- (BOOL)canAddNewNoteToSelectedContainers
{
  id v3 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
  uint64_t v15 = [(ICViewControllerManager *)self modernManagedObjectContext];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  BOOL v4 = (char *)[obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v27;
    int64_t v14 = v24;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        int v7 = ICDynamicCast();
        if (objc_msgSend(v7, "ic_isModernContainerType", v14))
        {
          uint64_t v21 = 0;
          id v22 = &v21;
          uint64_t v23 = 0x3032000000;
          v24[0] = sub_10003A7F0;
          v24[1] = sub_10003A800;
          id v25 = 0;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000183F0;
          v17[3] = &unk_100625700;
          id v20 = &v21;
          id v8 = v15;
          id v18 = v8;
          id v9 = v7;
          id v19 = v9;
          [v8 performBlockAndWait:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = (id)v22[5];
            unsigned __int8 v11 = [v10 isSharedReadOnly];

            if (v11)
            {

              _Block_object_dispose(&v21, 8);
              BOOL v12 = 0;
              goto LABEL_14;
            }
          }

          _Block_object_dispose(&v21, 8);
        }
      }
      BOOL v4 = (char *)[obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (NSSet)selectedContainerIdentifiers
{
  id v3 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  BOOL v4 = [(ICViewControllerManager *)self tagSelection];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = +[NSSet ic_setFromNonNilObject:v3];
LABEL_3:
    int v7 = (void *)v6;
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_8;
  }
  id v8 = [v4 mode];
  if (!v8)
  {
    uint64_t v6 = [v5 includedObjectIDs];
    goto LABEL_3;
  }
  if (v8 == (id)1)
  {
    id v9 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
    int v7 = +[NSSet ic_setFromNonNilObject:v9];
  }
  else
  {
LABEL_8:
    int v7 = 0;
  }
LABEL_9:

  return (NSSet *)v7;
}

- (BOOL)isInHTMLEditorMode
{
  id v3 = [(ICViewControllerManager *)self selectedNoteObjectID];

  if (v3)
  {
    BOOL v4 = [(ICViewControllerManager *)self selectedNoteObjectID];
    LOBYTE(v5) = [v4 ic_isLegacyNoteType];
LABEL_5:

    return (char)v5;
  }
  uint64_t v5 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];

  if (v5)
  {
    objc_opt_class();
    BOOL v4 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    uint64_t v6 = ICDynamicCast();
    LOBYTE(v5) = [v6 ic_isLegacyContainerType];

    goto LABEL_5;
  }
  return (char)v5;
}

- (ICTagSelection)tagSelection
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v3 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v4 = [v3 tagSelection];
  }
  else
  {
    BOOL v4 = self->_tagSelection;
  }

  return v4;
}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v3 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v4 = [v3 selectedNoteBrowseContainerItemID];
  }
  else
  {
    BOOL v4 = self->_selectedNoteBrowseContainerItemID;
  }

  return v4;
}

- (NSManagedObjectID)selectedNoteObjectID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v3 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v4 = [v3 selectedNoteObjectID];
  }
  else
  {
    BOOL v4 = self->_selectedNoteObjectID;
  }

  return v4;
}

- (BOOL)selectionStateTrackingEnabled
{
  return self->_selectionStateTrackingEnabled;
}

- (_TtC11MobileNotes26ICSelectionStateController)selectionStateController
{
  return self->_selectionStateController;
}

- (BOOL)hasCompactHeight
{
  id v2 = [(ICViewControllerManager *)self window];
  id v3 = [v2 traitCollection];
  unsigned __int8 v4 = [v3 ic_hasCompactHeight];

  return v4;
}

- (UIViewController)childPrimaryViewController
{
  if ((id)[(ICViewControllerManager *)self behavior] == (id)1) {
    [(ICViewControllerManager *)self rootNoteBrowseViewController];
  }
  else {
  id v3 = [(ICViewControllerManager *)self folderListViewController];
  }

  return (UIViewController *)v3;
}

- (void)setupViewsFromWindowStateArchive:(id)a3 systemPaperShowModernAccountAlert:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ICViewControllerManager *)self window];
  unsigned int v11 = [(id)objc_opt_class() _isSecure];

  if (v11)
  {
    BOOL v12 = [(ICViewControllerManager *)self window];
    +[NSException raise:NSInternalInconsistencyException, @"Unexpectedly setting up main UI in secure window class: %@", v12 format];
  }
  uint64_t v13 = [(ICViewControllerManager *)self folderListViewController];

  int64_t v14 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100036364(v8, v14);
  }

  uint64_t v15 = &off_100524000;
  if ([v8 isSystemPaper])
  {
    id v48 = v9;
    [(ICViewControllerManager *)self setIsAuxiliary:1];
    id v16 = [v8 initialSystemPaperLink];
    uint64_t v17 = [v8 initialSystemPaperImageData];
    id v18 = +[ICSystemPaperViewController newSystemPaperViewControllerWithIncomingLink:v16 incomingImageData:v17];
    [v18 setViewControllerManager:self];
    [(ICViewControllerManager *)self setSystemPaperViewController:v18];
    BOOL v19 = v6;
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      id v20 = [(ICViewControllerManager *)self selectionStateController];
      uint64_t v21 = [v20 selectedNoteObjectID];

      if (!v21) {
        goto LABEL_18;
      }
LABEL_13:
      long long v27 = [(ICViewControllerManager *)self modernManagedObjectContext];
      long long v28 = [v27 objectWithID:v21];

      if (!v28) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((resolvedNote) != nil)", "-[ICViewControllerManager setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:]", 1, 0, @"Expected non-nil value for '%s'", "resolvedNote");
      }
      long long v29 = [(ICViewControllerManager *)self systemPaperViewController];
      [v29 setCurrentNote:v28 animated:0 direction:0 setEditing:[v8 shouldStartEditing] showInkPicker:0];

      if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
        [(ICViewControllerManager *)self setSelectedNoteObjectID:v21];
      }

      goto LABEL_18;
    }
    id v25 = [v8 currentObjectIDURL];

    if (v25)
    {
      long long v26 = [v8 currentObjectIDURL];
      uint64_t v21 = [(ICViewControllerManager *)self managedObjectIDFromURL:v26];

      if (v21) {
        goto LABEL_13;
      }
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((systemPaperID) != nil)", "-[ICViewControllerManager setupViewsFromWindowStateArchive:systemPaperShowModernAccountAlert:completion:]", 1, 0, @"Expected non-nil value for '%s'", "systemPaperID");
    }
LABEL_18:
    unsigned __int8 v30 = [(ICViewControllerManager *)self systemPaperViewController];
    [v30 setShouldShowModernAccountAlert:v19];

    id v31 = [(ICViewControllerManager *)self systemPaperViewController];
    v32 = [(ICViewControllerManager *)self window];
    [v32 setRootViewController:v31];

    uint64_t v15 = &off_100524000;
    id v9 = v48;
    goto LABEL_26;
  }
  id v22 = [(ICViewControllerManager *)self window];
  uint64_t v23 = [v22 rootViewController];

  -[ICViewControllerManager setIsAuxiliary:](self, "setIsAuxiliary:", [v8 isAuxiliaryWindow]);
  [(ICViewControllerManager *)self initializeMainSplitViewWithStateRestoreArchive:v8];
  if ([v8 isAuxiliaryWindow])
  {
    id v16 = [(ICViewControllerManager *)self secondaryNavigationController];
    uint64_t v24 = [(ICViewControllerManager *)self window];
    [v24 setRootViewController:v16];
  }
  else
  {
    if (v23)
    {
      unsigned int v33 = [(ICViewControllerManager *)self trailingSidebarContainerViewController];
      unsigned int v34 = [v33 isSidebarHidden];
      uint64_t v35 = v34 ^ [v8 isTrailingContentVisible];

      [(ICViewControllerManager *)self initializeTrailingSidebarSplitViewWithStateRestoreArchive:v8];
      unsigned __int8 v36 = [(ICViewControllerManager *)self trailingSidebarContainerViewController];
      [v36 setResizesWindow:v35];

      int v37 = [(ICViewControllerManager *)self trailingSidebarViewController];
      uint64_t v38 = [(ICViewControllerManager *)self window];
      [v38 setRootViewController:v37];

      unsigned int v39 = [(ICViewControllerManager *)self trailingSidebarViewController];
      int64_t v40 = [v39 view];
      [v40 layoutIfNeeded];
    }
    else
    {
      [(ICViewControllerManager *)self initializeTrailingSidebarSplitViewWithStateRestoreArchive:v8];
      unsigned __int8 v41 = [(ICViewControllerManager *)self trailingSidebarContainerViewController];
      [v41 setResizesWindow:0];

      unsigned int v39 = [(ICViewControllerManager *)self trailingSidebarViewController];
      int64_t v40 = [(ICViewControllerManager *)self window];
      [v40 setRootViewController:v39];
    }

    if (![(ICViewControllerManager *)self hasCompactWidth]
      && (id)[(ICViewControllerManager *)self behavior] != (id)3)
    {
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10003B9A0;
      v52[3] = &unk_100625860;
      id v53 = v8;
      v54 = self;
      +[UIView performWithoutAnimation:v52];
    }
    id v16 = [(ICViewControllerManager *)self trailingSidebarContainerViewController];
    [v16 setResizesWindow:1];
  }
LABEL_26:

  v49[0] = _NSConcreteStackBlock;
  v49[1] = *((void *)v15 + 302);
  v49[2] = sub_1000086DC;
  v49[3] = &unk_1006258B0;
  v49[4] = self;
  id v50 = v8;
  id v51 = v9;
  id v42 = v9;
  id v43 = v8;
  int64_t v44 = objc_retainBlock(v49);
  uint64_t v45 = [(ICViewControllerManager *)self folderListViewController];
  if (v13)
  {
    id v46 = [v45 folderDataSource];
    BOOL v47 = [v46 indexer];
    ((void (*)(void *, void *))v44[2])(v44, v47);
  }
  else
  {
    [v45 reloadListWithDataIndexedBlock:v44 dataRenderedBlock:0];
  }
}

- (ICFolderListViewController)folderListViewController
{
  return self->_folderListViewController;
}

- (ICTrailingSidebarContainerViewController)trailingSidebarContainerViewController
{
  return self->_trailingSidebarContainerViewController;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  id v2 = [(ICViewControllerManager *)self persistenceConfiguration];
  id v3 = [v2 modernViewContext];

  return (NSManagedObjectContext *)v3;
}

- (ICPersistenceConfiguration)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (BOOL)isWelcomeScreenVisible
{
  return self->_welcomeScreenVisible;
}

- (int64_t)proposedMainSplitViewControllerDisplayMode
{
  return self->_proposedMainSplitViewControllerDisplayMode;
}

- (BOOL)isAuxiliary
{
  return self->_isAuxiliary;
}

- (void)willAdoptModelForSelectionStateController:(id)a3 isNavigating:(BOOL)a4
{
}

- (void)updateOverrideNoteContainerViewModeIfNeeded
{
  if ((id)[(ICViewControllerManager *)self behavior] == (id)1)
  {
    id v2 = +[ICAccount globalVirtualMathNotesFolder];
    [v2 setOverrideNoteContainerViewMode:0];
  }
}

- (void)splitViewControllerDidCollapse:(id)a3
{
}

- (void)setTrailingSidebarViewController:(id)a3
{
}

- (void)setTrailingSidebarSplitViewController:(id)a3
{
}

- (void)setSupplementaryNavigationController:(id)a3
{
}

- (void)setSelectedNewNoteShortcutItem:(id)a3
{
}

- (void)setSecondaryNavigationController:(id)a3
{
}

- (void)setRootNoteBrowseViewController:(id)a3
{
}

- (void)setPreferredNoteContainerViewMode:(int64_t)a3
{
  self->_preferredNoteContainerViewMode = a3;
}

- (void)setNoteEditorViewController:(id)a3
{
}

- (void)setMostRecentRegularWidthTagSelection:(id)a3
{
}

- (void)setMostRecentRegularWidthSelectedNoteObjectID:(id)a3
{
}

- (void)setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:(id)a3
{
}

- (void)setMainSplitViewController:(id)a3
{
}

- (void)setLegacyNoteEditorViewController:(id)a3
{
}

- (void)setIsAuxiliary:(BOOL)a3
{
  self->_isAuxiliary = a3;
}

- (void)setIsApplyingStateRestoreArchive:(BOOL)a3
{
  self->_isApplyingStateRestoreArchive = a3;
}

- (void)setFolderListViewController:(id)a3
{
}

- (void)setCurrentNoteBrowseViewController:(id)a3
{
}

- (void)setActivityStreamNavigationController:(id)a3
{
}

- (ICNoteBrowseViewController)rootNoteBrowseViewController
{
  return self->_rootNoteBrowseViewController;
}

- (id)propertiesToUpdate
{
  return &off_10064B590;
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (_TtC11MobileNotes33ICAppIntentsInteractionController)intentsInteractionController
{
  return self->_intentsInteractionController;
}

- (void)didUpdateModelForSelectionStateController:(id)a3
{
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  id v2 = [(ICViewControllerManager *)self persistenceConfiguration];
  id v3 = [v2 legacyViewContext];

  return (NSManagedObjectContext *)v3;
}

- (void)setPersistenceConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceConfiguration, a3);
  id v5 = a3;
  [(ICViewControllerManager *)self setRootNoteBrowseViewController:0];
  [(ICViewControllerManager *)self setFolderListViewController:0];
  [(ICViewControllerManager *)self setNoteEditorViewController:0];
  [(ICViewControllerManager *)self setLegacyNoteEditorViewController:0];
  [(ICViewControllerManager *)self setMainSplitViewController:0];
  [(ICViewControllerManager *)self setTrailingSidebarSplitViewController:0];
  BOOL v6 = objc_alloc_init(ICWindowStateArchive);

  [(ICViewControllerManager *)self applyStateRestoreArchive:v6 completion:0];
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    unsigned __int8 v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    BOOL v6 = [(ICViewControllerManager *)self window];
    int v7 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 window:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
  }
  id v10 = self->_eventReporter;

  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  int v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (NSUndoManager)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    unsigned __int8 v4 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
    id v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }

  return undoManager;
}

- (NSUndoManager)visibleViewsUndoManager
{
  id v3 = [(ICViewControllerManager *)self undoManager];
  if (([v3 canUndo] & 1) == 0 && (objc_msgSend(v3, "canRedo") & 1) == 0)
  {
    unsigned __int8 v4 = [(ICViewControllerManager *)self window];
    id v5 = [v4 ic_topmostPresentedViewController];
    if (v5)
    {
LABEL_4:

      goto LABEL_7;
    }
    uint64_t v6 = [(ICViewControllerManager *)self noteEditorViewController];
    unsigned int v7 = [v6 ic_isViewVisible];

    if (v7 && ![(ICViewControllerManager *)self isInHTMLEditorMode])
    {
      unsigned __int8 v4 = [(ICViewControllerManager *)self noteEditorViewController];
      uint64_t v9 = [v4 textViewUndoManager];
      id v5 = v3;
      id v3 = (void *)v9;
      goto LABEL_4;
    }
  }
LABEL_7:

  return (NSUndoManager *)v3;
}

- (NSSet)excludedContainerIdentifiers
{
  id v3 = [(ICViewControllerManager *)self tagSelection];

  if (v3)
  {
    unsigned __int8 v4 = [(ICViewControllerManager *)self tagSelection];
    id v5 = [v4 mode];

    if (!v5)
    {
      uint64_t v6 = [(ICViewControllerManager *)self tagSelection];
      uint64_t v7 = [v6 excludedObjectIDs];
      goto LABEL_6;
    }
    if (v5 == (id)2)
    {
      uint64_t v6 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      uint64_t v7 = +[NSSet setWithObject:v6];
LABEL_6:
      id v3 = (void *)v7;

      goto LABEL_8;
    }
    id v3 = 0;
  }
LABEL_8:

  return (NSSet *)v3;
}

- (NSArray)selectedContainerObjectIDs
{
  id v3 = +[NSMutableArray array];
  unsigned __int8 v4 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
  id v5 = [v4 navigationController];

  objc_opt_class();
  uint64_t v6 = [(ICViewControllerManager *)self selectedContainerItemID];
  uint64_t v7 = ICDynamicCast();

  if (v5)
  {
    id v22 = v7;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [v5 viewControllers];
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v9) {
      goto LABEL_16;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          uint64_t v15 = [v14 noteCollection];

          if (v15)
          {
            id v16 = [v14 noteCollection];
            goto LABEL_12;
          }
          uint64_t v17 = [v14 noteContainer];

          if (v17)
          {
            id v16 = [v14 noteContainer];
LABEL_12:
            id v18 = v16;
            BOOL v19 = [v16 objectID];
            [v3 ic_addNonNilObject:v19];
          }
          continue;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v10)
      {
LABEL_16:

        uint64_t v7 = v22;
        goto LABEL_19;
      }
    }
  }
  if (v7) {
    [v3 ic_addNonNilObject:v7];
  }
LABEL_19:
  id v20 = [v3 copy];

  return (NSArray *)v20;
}

- (NSDictionary)visibleObjectIDsForContainerObjectID
{
  long long v23 = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
  unsigned __int8 v4 = [v3 navigationController];
  id v5 = [v4 viewControllers];

  id obj = v5;
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        id v10 = ICDynamicCast();
        uint64_t v11 = [v10 noteCollection];
        uint64_t v12 = [v11 objectID];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
        }
        else
        {
          objc_opt_class();
          id v14 = [v10 noteContainer];
          uint64_t v15 = ICDynamicCast();
          uint64_t v13 = [v15 objectID];

          if (!v13) {
            goto LABEL_10;
          }
        }
        id v16 = [v10 collectionView];
        uint64_t v17 = [v16 indexPathsForVisibleItems];
        id v18 = [v17 sortedArrayUsingSelector:"compare:"];

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        void v24[2] = sub_10003B0A4;
        v24[3] = &unk_100625728;
        id v25 = v10;
        BOOL v19 = [v18 ic_compactMap:v24];
        [v23 setObject:v19 forKeyedSubscript:v13];

LABEL_10:
      }
      uint64_t v7 = (char *)[obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  id v20 = [v23 copy];

  return (NSDictionary *)v20;
}

- (unint64_t)adjustedNumberOfGalleryViewColumns
{
  if ((id)[(ICViewControllerManager *)self noteContainerViewMode] != (id)1) {
    return 0;
  }
  id v3 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
  unsigned __int8 v4 = [v3 collectionView];
  [v4 bounds];
  id v5 = [v4 adjustedNumberOfGalleryColumnsForWidth:CGRectGetWidth(v7)];

  return (unint64_t)v5;
}

- (BOOL)isPrimaryContentVisible
{
  if ([(ICViewControllerManager *)self hasCompactWidth]) {
    return 0;
  }
  unsigned __int8 v4 = [(ICViewControllerManager *)self mainSplitViewController];
  id v5 = [v4 viewControllerForColumn:0];
  unsigned __int8 v6 = [v5 ic_isViewVisible];

  return v6;
}

- (BOOL)isSupplementaryContentVisible
{
  if ([(ICViewControllerManager *)self hasCompactWidth]) {
    return 0;
  }
  unsigned __int8 v4 = [(ICViewControllerManager *)self mainSplitViewController];
  id v5 = [v4 viewControllerForColumn:1];
  unsigned __int8 v6 = [v5 ic_isViewVisible];

  return v6;
}

- (BOOL)isTrailingContentVisible
{
  if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
  {
    id v3 = [(ICViewControllerManager *)self trailingSidebarViewController];
    if (v3)
    {
      unsigned __int8 v4 = [(ICViewControllerManager *)self trailingSidebarViewController];
      unsigned int v5 = [v4 isSidebarHidden] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    unint64_t v7 = (unint64_t)[v6 displayMode];

    return ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2) & ~[(ICViewControllerManager *)self hasCompactWidth];
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingSelectedContainerItemID
{
  return +[NSSet setWithObjects:@"isSearchActiveWithQuery", @"selectedNoteBrowseContainerItemID", 0];
}

- (ICItemIdentifier)selectedContainerItemID
{
  id v3 = [(ICViewControllerManager *)self overrideContainerIdentifier];

  if (v3)
  {
    uint64_t v4 = [(ICViewControllerManager *)self overrideContainerIdentifier];
LABEL_7:
    id v10 = (void *)v4;
    goto LABEL_8;
  }
  if (![(ICViewControllerManager *)self isSearchActiveWithQuery])
  {
    uint64_t v4 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    goto LABEL_7;
  }
  unsigned int v5 = [(ICViewControllerManager *)self folderListViewController];
  unsigned __int8 v6 = [v5 folderDataSource];
  id v7 = [v6 countOfAllVisibleAccounts];

  if (v7 == (id)1)
  {
    uint64_t v8 = [(ICViewControllerManager *)self folderListViewController];
    id v9 = [v8 folderDataSource];
    id v10 = [v9 firstRelevantItemIdentifier];
  }
  else
  {
    id v10 = 0;
  }
LABEL_8:

  return (ICItemIdentifier *)v10;
}

- (void)launchNotesAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICViewControllerManager *)self noteEditorViewController];
  id v9 = [v8 firstResponder];
  [v9 resignFirstResponder];

  id v10 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 bundleIdentifier];

  id v13 = [v7 mutableCopy];
  id v14 = [&__kCFBooleanTrue stringValue];
  [v13 setObject:v14 forKeyedSubscript:ICQuickNoteURLOptionIsContinuing];

  id v15 = [v13 copy];
  id v16 = objc_opt_new();
  [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyUnlockDevice];
  [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyPromptUnlockDevice];
  uint64_t v17 = +[ICAppURLUtilities urlForQuickNoteWithOptions:v15];
  [v16 setObject:v17 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadURL];

  id v18 = +[FBSOpenApplicationOptions optionsWithDictionary:v16];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003B764;
  v20[3] = &unk_1006257B8;
  id v21 = v6;
  id v19 = v6;
  [v10 openApplication:v12 withOptions:v18 completion:v20];
}

- (void)dismissOverlayContent
{
  [(ICViewControllerManager *)self dismissPrimaryOverlayContent];

  [(ICViewControllerManager *)self dismissSupplementaryOverlayContent];
}

- (void)showAccountListAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  unsigned int v6 = [v5 isCollapsed];

  if (v6)
  {
    id v8 = [(ICViewControllerManager *)self compactNavigationController];
    id v7 = [v8 popToRootViewControllerAnimated:v3];
  }
  else
  {
    id v8 = [(ICViewControllerManager *)self mainSplitViewController];
    [v8 ic_showColumn:0 animated:v3];
  }
}

- (void)showAttachmentBrowser
{
  BOOL v3 = [(ICViewControllerManager *)self currentAttachmentBrowserViewController];

  if (!v3)
  {
    uint64_t v4 = [ICViewAttachmentsActivity alloc];
    unsigned int v5 = [(ICViewControllerManager *)self mainSplitViewController];
    unsigned int v6 = [(ICViewControllerManager *)self eventReporter];
    id v7 = [(ICViewAttachmentsActivity *)v4 initWithPresentingViewController:v5 eventReporter:v6];

    [(ICViewAttachmentsActivity *)v7 performActivityWithCompletion:0];
  }
}

- (void)showTagSelection:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4 && ![v4 isEmpty])
  {
    id v10 = [v16 includedObjectIDs];
    id v9 = +[NSMutableSet setWithSet:v10];

    uint64_t v11 = [v16 excludedObjectIDs];
    uint64_t v12 = +[NSMutableSet setWithSet:v11];

    if ([v16 mode] == (id)1)
    {
      id v13 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      id v14 = v9;
    }
    else
    {
      if ([v16 mode] != (id)2)
      {
LABEL_13:
        id v15 = [v16 copy];
        [(ICViewControllerManager *)self setTagSelection:v15];

        [(ICViewControllerManager *)self showContainerWithIdentifiers:v9 excludingIdentifiers:v12 usingRootViewController:1 deferUntilDataLoaded:1 keepEditorShowing:&__kCFBooleanTrue animated:1];
        goto LABEL_14;
      }
      id v13 = +[ICTagAllTagsItemIdentifier sharedItemIdentifier];
      id v14 = v12;
    }
    [v14 addObject:v13];

    goto LABEL_13;
  }
  if (![(ICViewControllerManager *)self hasCompactWidth])
  {
    uint64_t v5 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
    if (v5)
    {
      unsigned int v6 = (void *)v5;
      id v7 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];

      if (!v7)
      {
        id v8 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
        [(ICViewControllerManager *)self selectContainerWithIdentifier:v8 usingRootViewController:1 deferUntilDataLoaded:0 animated:0];
      }
    }
  }
  id v9 = [(ICViewControllerManager *)self tagSelection];
  [v9 clear];
LABEL_14:
}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 keepEditorShowing:(id)a7 animated:(BOOL)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v30 = a4;
  id v15 = a7;
  unsigned int v16 = [v14 ic_containsObjectPassingTest:&stru_1006258F0];
  unsigned __int8 v17 = [v14 ic_containsObjectPassingTest:&stru_100625910];
  id v18 = [v14 count];
  uint64_t v19 = 0;
  BOOL v20 = a8;
  if ((v17 & 1) == 0 && v18)
  {
    if ([(ICViewControllerManager *)self noteContainerViewMode]) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 1;
    }
  }
  id v21 = [(ICViewControllerManager *)self containerItemIDForContainerIdentifiers:v14];
  id v22 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v21];
  if (v22 == (void *)-1)
  {
    if ([(ICViewControllerManager *)self preferredNoteContainerViewMode] == -1) {
      goto LABEL_14;
    }
    long long v23 = [(ICViewControllerManager *)self preferredNoteContainerViewMode];
    [(ICViewControllerManager *)self setPreferredNoteContainerViewMode:-1];
    if (v23 == (void *)-1) {
      goto LABEL_14;
    }
  }
  else
  {
    long long v23 = v22;
    if ((void *)[(ICViewControllerManager *)self noteContainerViewMode] != v22
      && [(ICViewControllerManager *)self preferredNoteContainerViewMode] == -1)
    {
      [(ICViewControllerManager *)self setPreferredNoteContainerViewMode:[(ICViewControllerManager *)self noteContainerViewMode]];
    }
  }
  if (v23 == (void *)[(ICViewControllerManager *)self noteContainerViewMode]) {
    goto LABEL_14;
  }
  self->_noteContainerViewMode = (int64_t)v23;
  long long v24 = [[ICNoteBrowseViewController alloc] initWithViewMode:v23 viewControllerManager:self];
  [(ICViewControllerManager *)self setRootNoteBrowseViewController:v24];

  id v25 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  unsigned __int8 v26 = [v25 isCollapsed];

  if (v26)
  {
LABEL_14:
    LOBYTE(v29) = v20;
    long long v27 = v30;
    [(ICViewControllerManager *)self showContainerWithIdentifiers:v14 excludingIdentifiers:v30 usingRootViewController:v11 deferUntilDataLoaded:v10 dismissOverlayContent:v19 keepEditorShowing:v15 animated:v29];
    goto LABEL_15;
  }
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10003C560;
  v33[3] = &unk_100625960;
  objc_copyWeak(&v37, &location);
  id v34 = v14;
  long long v27 = v30;
  id v35 = v30;
  id v36 = v15;
  long long v28 = objc_retainBlock(v33);
  if (+[UIKeyboard isInHardwareKeyboardMode])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C68C;
    block[3] = &unk_100625988;
    v32 = v28;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    ((void (*)(void *))v28[2])(v28);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
LABEL_15:
}

- (void)showNoteWithIdentifier:(id)a3
{
  id v4 = a3;
  [(ICViewControllerManager *)self modernManagedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C758;
  v7[3] = &unk_100625A00;
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v10 = self;
  id v5 = v9;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)showInlineAttachmentWithIdentifier:(id)a3 inNoteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICViewControllerManager *)self modernManagedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CC94;
  v11[3] = &unk_100625A78;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v15 = self;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)showObjectWithObjectID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ic_isContainerType"))
  {
    [(ICViewControllerManager *)self selectContainerWithIdentifier:v4 usingRootViewController:1 deferUntilDataLoaded:1 animated:1];
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "ic_isInlineAttachmentType")) {
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "ic_isNoteType"))
  {
    [(ICViewControllerManager *)self selectNoteWithObjectID:v4 scrollState:0 startEditing:0 animated:1 ensurePresented:1];
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "ic_isAttachmentType")) {
LABEL_7:
  }
    [(ICViewControllerManager *)self selectAttachmentWithObjectID:v4 animated:1];
LABEL_8:
}

- (void)showNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  BOOL v10 = a8;
  uint64_t v11 = a7;
  BOOL v12 = a6;
  uint64_t v13 = a5;
  BOOL v16 = a10;
  BOOL v17 = a9;
  id v59 = a3;
  id v18 = a4;
  unsigned __int8 v19 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
  if (!v59)
  {
    if ((v19 & 1) == 0) {
      [(ICViewControllerManager *)self setSelectedNoteObjectID:0];
    }
    long long v23 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    unsigned __int8 v24 = [v23 isCollapsed];

    if (v24)
    {
      id v25 = [(ICViewControllerManager *)self activeEditorController];
      unsigned int v26 = [v25 ic_isViewVisible];

      if (!v26) {
        goto LABEL_50;
      }
      long long v27 = [(ICViewControllerManager *)self compactNavigationController];
      id v28 = [v27 popViewControllerAnimated:1];
    }
    else
    {
      long long v27 = [(ICViewControllerManager *)self mainSplitViewController];
      [v27 showColumn:1];
    }
    goto LABEL_49;
  }
  if ((v19 & 1) == 0)
  {
    BOOL v20 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];

    if (v20)
    {
      unsigned int v58 = v13;
      id v21 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
      if ([(ICViewControllerManager *)self isSearchActive])
      {
        id v22 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
        if ([v22 isCollapsed])
        {
        }
        else
        {
          int64_t v29 = [(ICViewControllerManager *)self noteContainerViewMode];

          if (!v29) {
            goto LABEL_15;
          }
        }
      }
      if ([(ICViewControllerManager *)self isSearchActive])
      {
LABEL_17:
        if (!v21) {
          goto LABEL_50;
        }
        id v31 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
        unsigned __int8 v32 = [v31 isEqual:v21];

        if ((v32 & 1) == 0)
        {
          unsigned int v33 = [(ICViewControllerManager *)self compactNavigationController];
          id v34 = [v33 viewControllers];
          [v34 lastObject];
          id v35 = v57 = v11;
          id v36 = [(ICViewControllerManager *)self activeEditorController];

          id v37 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
          BOOL v17 = v35 != v36 && a9;
          uint64_t v38 = +[NSSet ic_setFromNonNilObject:v21];
          unsigned int v39 = +[NSSet set];
          [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v37 animated:v17 ensurePresented:1 containerIdentifiers:v38 excludingIdentifiers:v39 ensureSelectedNote:0 keepEditorShowing:0 dataIndexedBlock:0 dataRenderedBlock:0];

          uint64_t v11 = v57;
        }

        BOOL v16 = a10;
        uint64_t v13 = v58;
        goto LABEL_24;
      }
LABEL_15:
      if (![(ICViewControllerManager *)self isSelectionAppropriateForObjectID:v59])
      {
        uint64_t v30 = [(ICViewControllerManager *)self defaultContainerObjectIDForNoteWithObjectID:v59];

        id v21 = (void *)v30;
      }
      goto LABEL_17;
    }
  }
LABEL_24:
  int64_t v40 = [(ICViewControllerManager *)self systemPaperViewController];

  if (!v40)
  {
    [(ICViewControllerManager *)self dismissAnyPresentedViewControllerAnimated:v17 forShowNote:1 completion:0];
    int64_t v44 = [(ICViewControllerManager *)self noteEditorViewController];
    [v44 hideActivityStreamToolbarAnimated:v17];

    if (objc_msgSend(v59, "ic_isEntityOfClass:", objc_opt_class()))
    {
      uint64_t v45 = [(ICViewControllerManager *)self modernManagedObjectContext];
      id v46 = [v45 objectWithID:v59];

      if (v10 && [v46 isSharedViaICloud])
      {
        id v47 = [objc_alloc((Class)ICActivityStreamDigest) initWithObject:v46];
        id v48 = [v47 recentUpdatesRangeValue];
        id v49 = v48;
        if (v48)
        {
          id v50 = [v48 rangeValue];
          uint64_t v52 = +[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v50, v51, v46);

          id v18 = (id)v52;
        }
      }
      id v53 = [(ICViewControllerManager *)self noteEditorViewController];
      [v53 setNote:v46 overrideScrollState:v18];
    }
    else
    {
      if (!objc_msgSend(v59, "ic_isEntityOfClass:", objc_opt_class()))
      {
LABEL_40:
        if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
          [(ICViewControllerManager *)self setSelectedNoteObjectID:v59];
        }
        if (v16)
        {
          if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
          {
            if (v11) {
              [(ICViewControllerManager *)self dismissOverlayContent];
            }
            [(ICViewControllerManager *)self setNoteEditorAnimated:v17 ensurePresented:1 startEditing:v13 showLegacy:[(ICViewControllerManager *)self isInHTMLEditorMode] showLatestUpdatesIfAvailable:1];
          }
          else
          {
            [(ICViewControllerManager *)self ensureNoteEditorPresentedAnimated:v17 startEditing:v13 dismissOverlayContent:v11];
          }
        }
        goto LABEL_48;
      }
      v54 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      id v46 = [v54 objectWithID:v59];

      id v53 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
      [v53 displayNote:v46];
    }

    goto LABEL_40;
  }
  unsigned __int8 v41 = [(ICViewControllerManager *)self modernManagedObjectContext];
  id v42 = [v41 objectWithID:v59];

  if (!v42) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:]", 1, 0, @"Expected non-nil value for '%s'", "note");
  }
  id v43 = [(ICViewControllerManager *)self systemPaperViewController];
  [v43 setCurrentNote:v42 animated:v17 direction:0 setEditing:v13 showInkPicker:v12];

  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    [(ICViewControllerManager *)self setSelectedNoteObjectID:v59];
  }

LABEL_48:
  uint64_t v55 = [(ICViewControllerManager *)self previousSelectedNoteObjectID];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"updateCurrentNoteLastViewedMetadata:" object:v55];

  long long v27 = [(ICViewControllerManager *)self selectedNoteObjectID];
  id v56 = [v27 copy];
  [(ICViewControllerManager *)self performSelector:"updateCurrentNoteLastViewedMetadata:" withObject:v56 afterDelay:0.75];

LABEL_49:
LABEL_50:
}

- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4
{
}

- (void)ensureNoteEditorPresentedAnimated:(BOOL)a3 startEditing:(BOOL)a4 dismissOverlayContent:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  if (a5) {
    [(ICViewControllerManager *)self dismissOverlayContent];
  }
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]
    && ([(ICViewControllerManager *)self selectionStateController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 hasDeferredItem],
        v8,
        v9))
  {
    id v11 = [(ICViewControllerManager *)self selectionStateController];
    [v11 adoptDeferredAnimated:v6 startEditing:v5];
  }
  else
  {
    BOOL v10 = [(ICViewControllerManager *)self isInHTMLEditorMode];
    [(ICViewControllerManager *)self setNoteEditorAnimated:v6 ensurePresented:1 startEditing:v5 showLegacy:v10 showLatestUpdatesIfAvailable:1];
  }
}

- (void)showInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICViewControllerManager *)self systemPaperViewController];

  if (!v7)
  {
    if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      [(ICViewControllerManager *)self setSelectedInvitationObjectID:v6];
      CFNullRef v8 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
      CFNullRef v9 = +[ICAccount globalVirtualSharedWithYouFolder];
      if (kCFNull == v8) {
        CFNullRef v10 = 0;
      }
      else {
        CFNullRef v10 = v8;
      }
      unint64_t v11 = v10;
      if (kCFNull == v9) {
        CFNullRef v12 = 0;
      }
      else {
        CFNullRef v12 = v9;
      }
      unint64_t v13 = v12;
      if (v11 | v13)
      {
        id v14 = (void *)v13;
        if (v11) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
        }
        else
        {
          unsigned __int8 v16 = [(id)v11 isEqual:v13];

          if (v16) {
            goto LABEL_20;
          }
        }
        CFNullRef v8 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
        CFNullRef v9 = +[ICAccount globalVirtualSharedWithYouFolder];
        CFNullRef v25 = v9;
        BOOL v17 = +[NSArray arrayWithObjects:&v25 count:1];
        id v18 = +[NSSet ic_setFromNonNilObject:v17];
        unsigned __int8 v19 = +[NSSet set];
        [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v8 animated:v4 ensurePresented:1 containerIdentifiers:v18 excludingIdentifiers:v19 ensureSelectedNote:0 keepEditorShowing:0 dataIndexedBlock:0 dataRenderedBlock:0];
      }
    }
LABEL_20:
    [(ICViewControllerManager *)self dismissAnyPresentedViewControllerAnimated:v4 forShowNote:1 completion:0];
    BOOL v20 = [(ICViewControllerManager *)self noteEditorViewController];
    [v20 hideActivityStreamToolbarAnimated:v4];

    id v21 = [(ICViewControllerManager *)self modernManagedObjectContext];
    id v22 = [v21 objectWithID:v6];
    long long v23 = [(ICViewControllerManager *)self noteEditorViewController];
    [v23 setInvitation:v22];

    [(ICViewControllerManager *)self setNoteEditorAnimated:v4 ensurePresented:1 startEditing:0 showLegacy:0 showLatestUpdatesIfAvailable:1];
    [(ICViewControllerManager *)self dismissOverlayContent];
    unsigned __int8 v24 = [(ICViewControllerManager *)self eventReporter];
    [v24 submitCollabNotificationEventWithAction:3];

    goto LABEL_21;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager showInvitationWithObjectID:animated:]", 1, 0, @"System Paper does not support showing invitations");
LABEL_21:
}

- (BOOL)presentAttachment:(id)a3 delegate:(id)a4 displayShowInNote:(BOOL)a5 editable:(BOOL)a6 selectedSubAttachment:(id)a7 presentingViewController:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v20 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = +[NSArray arrayWithObjects:&v20 count:1];

  LOBYTE(v17) = [(ICViewControllerManager *)self presentAttachments:v18 startingAtIndex:0 delegate:v16 displayShowInNote:v10 editable:v9 selectedSubAttachment:v15 presentingViewController:v14];
  return (char)v17;
}

- (BOOL)presentAttachments:(id)a3 startingAtIndex:(unint64_t)a4 delegate:(id)a5 displayShowInNote:(BOOL)a6 editable:(BOOL)a7 selectedSubAttachment:(id)a8 presentingViewController:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  if (!v18)
  {
    unsigned __int8 v19 = [(ICViewControllerManager *)self window];
    id v20 = [v19 rootViewController];

    uint64_t v21 = [v20 presentedViewController];
    id v22 = v15;
    long long v23 = (void *)v21;
    if (v21) {
      unsigned __int8 v24 = (void *)v21;
    }
    else {
      unsigned __int8 v24 = v20;
    }
    id v18 = v24;

    id v15 = v22;
  }
  CFNullRef v25 = [(ICViewControllerManager *)self currentAttachmentPresenter];
  unsigned int v26 = v25;
  if (v25)
  {
    unint64_t v40 = a4;
    BOOL v27 = a6;
    BOOL v28 = a7;
    id v29 = v17;
    id v30 = v16;
    id v31 = v15;
    unsigned __int8 v32 = [v25 presentedViewController];
    unsigned __int8 v33 = [v32 isBeingPresented];

    if (v33)
    {
      BOOL v34 = 0;
      id v15 = v31;
      id v16 = v30;
      id v17 = v29;
      goto LABEL_17;
    }
    id v35 = [v26 galleryAttachmentEditorController];

    id v15 = v31;
    id v16 = v30;
    id v17 = v29;
    a7 = v28;
    a6 = v27;
    a4 = v40;
    if (v35)
    {
      BOOL v34 = 0;
      goto LABEL_17;
    }
  }
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10003E23C;
  v43[3] = &unk_100625AA0;
  v43[4] = self;
  id v44 = v15;
  unint64_t v48 = a4;
  id v45 = v16;
  BOOL v49 = a6;
  BOOL v50 = a7;
  id v46 = v18;
  id v47 = v17;
  id v36 = objc_retainBlock(v43);
  id v37 = v36;
  if (v26)
  {
    uint64_t v38 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_1004D4454();
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003E2BC;
    v41[3] = &unk_100625988;
    id v42 = v37;
    [v26 dismissAnimated:0 completion:v41];
  }
  else
  {
    ((void (*)(void *))v36[2])(v36);
  }

  BOOL v34 = 1;
LABEL_17:

  return v34;
}

- (void)showSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v34 = a3;
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    CFNullRef v8 = [v34 object];
    BOOL v9 = [v8 objectID];
    unsigned int v10 = [v9 ic_isNoteType];

    if (v10)
    {
      unint64_t v11 = [v34 configuration];
      CFNullRef v12 = [v11 foundAttachmentObjectID];

      if (!v12)
      {
        id v18 = [v34 object];
        unsigned __int8 v19 = [v18 objectID];
        unsigned int v20 = [v19 ic_isEntityOfClass:objc_opt_class()];

        if (v20)
        {
          uint64_t v21 = [(ICViewControllerManager *)self modernManagedObjectContext];
          id v22 = [v34 object];
          long long v23 = [v22 objectID];
          unsigned __int8 v24 = [v21 objectWithID:v23];

          CFNullRef v25 = [v34 firstMatchingRangeInNote];
          if (v25)
          {
            unsigned int v26 = [v34 firstMatchingRangeInNote];
            id v27 = [v26 rangeValue];
            uint64_t v29 = v28;
          }
          else
          {
            id v27 = 0;
            uint64_t v29 = 0;
          }

          unint64_t v13 = +[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v27, v29, v24);
        }
        else
        {
          unint64_t v13 = 0;
        }
        id v17 = [v34 object];
        id v30 = [v17 objectID];
        BYTE1(v33) = 1;
        LOBYTE(v33) = v4;
        -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v30, v13, 0, 0, 1, 0, v33);

        goto LABEL_17;
      }
      unint64_t v13 = [v34 configuration];
      uint64_t v14 = [v13 foundAttachmentObjectID];
    }
    else
    {
      id v15 = [v34 object];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_18:
        id v31 = [(ICViewControllerManager *)self noteEditorViewController];
        unsigned __int8 v32 = [v34 highlightPatternRegexFinder];
        [v31 highlightSearchMatchesForRegexFinder:v32];

        [(ICViewControllerManager *)self setSelectedSearchResult:v34];
        goto LABEL_19;
      }
      unint64_t v13 = [v34 object];
      uint64_t v14 = [v13 objectID];
    }
    id v17 = (void *)v14;
    [(ICViewControllerManager *)self selectAttachmentWithObjectID:v14 animated:v4];
LABEL_17:

    goto LABEL_18;
  }
  id v6 = v34;
  if (!v34) {
    goto LABEL_20;
  }
  id v7 = [(ICViewControllerManager *)self selectionStateController];
  [v7 pushSearchResult:v34 animated:v4];

LABEL_19:
  id v6 = v34;
LABEL_20:
}

- (void)showRecentUpdatesForNoteWithObjectID:(id)a3
{
}

- (void)showRecentUpdatesForNoteWithObjectID:(id)a3 suppressSidebar:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  objc_opt_class();
  id v6 = [(ICViewControllerManager *)self modernManagedObjectContext];
  id v7 = [v6 objectWithID:v17];
  CFNullRef v8 = ICDynamicCast();

  if (v8)
  {
    id v9 = [objc_alloc((Class)ICActivityStreamDigest) initWithObject:v8];
    unsigned int v10 = [v9 recentUpdatesFilter];
    uint64_t v11 = [v10 toDate];
    CFNullRef v12 = (void *)v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      [(ICViewControllerManager *)self hideAttributionHighlights];
      id v14 = 0;
    }
    else
    {
      id v14 = [objc_alloc((Class)ICActivityStreamSelection) initWithFilter:v10 displayDate:v11];
    }
    [(ICViewControllerManager *)self showAttributionHighlightsForNoteWithObjectID:v17 selection:v14 suppressSidebar:v4];
    id v15 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
    [v15 moveToViewMode:1];

    [v8 markLastActivityRecentUpdatesViewed];
    id v16 = [(ICViewControllerManager *)self eventReporter];
    [v16 submitCollabActivityBrowseEventForObject:v8 contextPath:0 clickContext:3 isCurrentUserMentioned:[v9 isCurrentUserMentionedInRecentSummary] hasRecentUpdates:[v9 hasRecentUpdates]];
  }
}

- (void)showActivityStreamForObjectWithObjectID:(id)a3
{
}

- (void)showActivityStreamForObjectWithObjectID:(id)a3 collabActivityContextPath:(int64_t)a4
{
  id v14 = a3;
  objc_opt_class();
  id v6 = [(ICViewControllerManager *)self modernManagedObjectContext];
  id v7 = [v6 objectWithID:v14];
  CFNullRef v8 = ICDynamicCast();

  if (v8)
  {
    if ((objc_msgSend(v14, "ic_isFolderType") & 1) != 0
      || [(ICViewControllerManager *)self showsPresentedActivityStreamAsModal])
    {
      uint64_t v9 = 4;
    }
    else if ([(ICViewControllerManager *)self hasCompactWidth])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 5;
    }
    [(ICViewControllerManager *)self presentActivityStreamForObject:v8 viewMode:v9 animated:1];
    unsigned int v10 = [(ICViewControllerManager *)self activityStreamSelection];

    if (a4 && !v10)
    {
      id v11 = [objc_alloc((Class)ICActivityStreamDigest) initWithObject:v8];
      CFNullRef v12 = [(ICViewControllerManager *)self eventReporter];
      [v12 submitCollabActivityBrowseEventForObject:v8 contextPath:a4 clickContext:4 isCurrentUserMentioned:[v11 isCurrentUserMentionedInRecentSummary] hasRecentUpdates:[v11 hasRecentUpdates]];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      [v13 markActivitySummaryViewed];
      [v13 markLastActivityRecentUpdatesViewed];
    }
  }
}

- (int64_t)activityStreamViewMode
{
  BOOL v3 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
  if (v3)
  {
    BOOL v4 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
    int64_t v5 = (int64_t)[v4 viewMode];
  }
  else if ([(ICViewControllerManager *)self isTrailingContentVisible])
  {
    int64_t v5 = 5;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)showsActivityStream
{
  return [(ICViewControllerManager *)self activityStreamViewMode] != 0;
}

- (void)presentActivityStreamForObject:(id)a3 viewMode:(int64_t)a4 animated:(BOOL)a5
{
  id v8 = a3;
  unsigned int v9 = [(ICViewControllerManager *)self showsPresentedActivityStreamAsModal];
  int64_t v10 = 4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003EC9C;
  v29[3] = &unk_100625B18;
  if (!v9) {
    int64_t v10 = a4;
  }
  int64_t v31 = v10;
  v29[4] = self;
  id v11 = v8;
  id v30 = v11;
  BOOL v32 = a5;
  CFNullRef v12 = objc_retainBlock(v29);
  [(ICViewControllerManager *)self stopEditing];
  id v13 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];

  if (v13)
  {
    id v14 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
    id v15 = [v14 object];
    id v16 = [v15 objectID];
    id v17 = [v11 objectID];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0) {
      [(ICViewControllerManager *)self hidePresentedActivityStreamNavigationControllerWithCompletion:v12];
    }
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
  unsigned __int8 v19 = [v11 objectID];
  if (objc_msgSend(v19, "ic_isNoteType"))
  {
    CFNullRef v20 = [(ICViewControllerManager *)self selectedNoteObjectID];
    CFNullRef v21 = [v11 objectID];
    if (kCFNull == v20) {
      CFNullRef v22 = 0;
    }
    else {
      CFNullRef v22 = v20;
    }
    unint64_t v23 = v22;
    if (kCFNull == v21) {
      CFNullRef v24 = 0;
    }
    else {
      CFNullRef v24 = v21;
    }
    unint64_t v25 = v24;
    if (v23 | v25)
    {
      unsigned int v26 = (void *)v25;
      if (v23 && v25)
      {
        unsigned __int8 v27 = [(id)v23 isEqual:v25];

        if (v27) {
          goto LABEL_23;
        }
      }
      else
      {
      }
      unsigned __int8 v19 = [v11 objectID];
      BYTE1(v28) = 1;
      LOBYTE(v28) = a5;
      -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v19, 0, 0, 0, 0, 1, v28);
    }
    else
    {
    }
  }

LABEL_23:
}

- (void)hideActivityStreamWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(ICViewControllerManager *)self showsPresentedActivityStreamAsModal]
    || ([(ICViewControllerManager *)self presentedActivityStreamNavigationController], int64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    [(ICViewControllerManager *)self setActivityStreamSelection:0];
  }
  id v6 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];

  if (v6)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10003F558;
    v33[3] = &unk_100625B40;
    void v33[4] = self;
    id v34 = v4;
    [(ICViewControllerManager *)self hidePresentedActivityStreamNavigationControllerWithCompletion:v33];
  }
  else
  {
    id v7 = [(ICViewControllerManager *)self noteEditorViewController];
    [v7 hideActivityStreamToolbarAnimated:1];

    id v8 = [(ICViewControllerManager *)self trailingSidebarViewController];
    if (![v8 isSidebarHidden])
    {
      unsigned int v9 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
      id v10 = [v9 displayMode];

      if (v10 == (id)1) {
        goto LABEL_9;
      }
      id v11 = [(ICViewControllerManager *)self trailingSidebarViewController];
      CFNullRef v12 = [v11 view];
      [v12 frame];
      double v14 = v13;
      double v16 = v15;

      id v17 = [(ICViewControllerManager *)self mainSplitViewController];
      [v17 nonDisplacedColumnWidth];
      double v19 = v14 - v18;

      CFNullRef v20 = [(ICViewControllerManager *)self mainSplitViewController];
      LODWORD(v12) = [v20 isDisplacingColumn];

      if (v12)
      {
        CFNullRef v21 = [(ICViewControllerManager *)self mainSplitViewController];
        [v21 preferredDisplacedColumnWidth];
        double v19 = v19 - v22;
      }
      unint64_t v23 = [(ICViewControllerManager *)self mainSplitViewController];
      unsigned int v24 = [v23 requiresNotificationForSecondaryColumnSize:v19, v16];

      unint64_t v25 = [(ICViewControllerManager *)self trailingSidebarViewController];
      [v25 setSidebarHidden:1];

      unsigned int v26 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
      id v8 = [v26 transitionCoordinator];

      unsigned __int8 v27 = [(ICViewControllerManager *)self mainSplitViewController];
      unsigned int v28 = [v27 isDisplacingColumn];

      if (v28)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10003F5AC;
        v32[3] = &unk_100625AC8;
        v32[4] = self;
        [v8 animateAlongsideTransition:v32 completion:0];
      }
      uint64_t v29 = [(ICViewControllerManager *)self mainSplitViewController];
      [v29 setIsDisplacingColumn:0];

      if (v24)
      {
        id v30 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
        int64_t v31 = [v30 transitionCoordinator];
        -[ICViewControllerManager sendNotificationForNoteEditorSizeChange:transitionCoordinator:](self, "sendNotificationForNoteEditorSizeChange:transitionCoordinator:", v31, v19, v16);
      }
    }
  }
LABEL_9:
}

- (BOOL)showsAttributionHighlights
{
  id v2 = [(ICViewControllerManager *)self activityStreamSelection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4
{
}

- (void)showAttributionHighlightsForNoteWithObjectID:(id)a3 selection:(id)a4 suppressSidebar:(BOOL)a5
{
  CFNullRef v8 = (CFNullRef)a3;
  id v9 = a4;
  id v10 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
  id v11 = [v10 activityStreamViewController];
  CFNullRef v12 = [v11 objectID];

  if (v12 && ([v12 isEqual:v8] & 1) == 0)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10003FA94;
    v47[3] = &unk_100625B68;
    v47[4] = self;
    CFNullRef v48 = v8;
    id v49 = v9;
    BOOL v50 = a5;
    [(ICViewControllerManager *)self hidePresentedActivityStreamNavigationControllerWithCompletion:v47];

    CFNullRef v20 = v48;
LABEL_28:

    goto LABEL_29;
  }
  double v13 = [(ICViewControllerManager *)self selectedModernNote];
  double v14 = [v13 objectID];
  if (![v14 isEqual:v8]) {
    goto LABEL_9;
  }
  double v15 = [(ICViewControllerManager *)self activityStreamSelection];
  if (([v15 isEqual:v9] & 1) == 0)
  {

LABEL_9:
LABEL_10:
    if ([(__CFNull *)v8 ic_isModernNoteType])
    {
      CFNullRef v21 = [(ICViewControllerManager *)self selectedNoteObjectID];
      CFNullRef v22 = v21;
      if (kCFNull == v21) {
        CFNullRef v23 = 0;
      }
      else {
        CFNullRef v23 = v21;
      }
      unint64_t v24 = v23;
      if (kCFNull == v8) {
        CFNullRef v25 = 0;
      }
      else {
        CFNullRef v25 = v8;
      }
      unint64_t v26 = v25;
      if (v24 | v26)
      {
        unsigned __int8 v27 = (void *)v26;
        if (!v24 || !v26)
        {

LABEL_31:
          BOOL v32 = [(ICViewControllerManager *)self modernManagedObjectContext];
          id v42 = [v32 ic_existingObjectWithID:v8];

          id v33 = [objc_alloc((Class)ICTTTextEditGrouper) initWithNote:v42];
          [v33 setJoinsWhitespaceAndNewlineGaps:1];
          id v34 = [v9 filter];
          [v33 setFilter:v34];

          id v35 = [v33 groupedEdits];
          id v36 = [v35 firstObject];
          id v37 = [v36 range];
          uint64_t v39 = v38;

          unint64_t v40 = +[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", v37, v39, v42);
          BYTE1(v41) = 1;
          LOBYTE(v41) = [(ICViewControllerManager *)self hasCompactWidth];
          -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v8, v40, 0, 0, 1, 1, v41);

          goto LABEL_24;
        }
        unsigned __int8 v28 = [(id)v24 isEqual:v26];

        if ((v28 & 1) == 0) {
          goto LABEL_31;
        }
      }
      else
      {
      }
    }
    [(ICViewControllerManager *)self dismissOverlayContent];
LABEL_24:
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10003FAA8;
    v43[3] = &unk_100625B68;
    v43[4] = self;
    CFNullRef v44 = v8;
    id v45 = v9;
    BOOL v46 = a5;
    uint64_t v29 = objc_retainBlock(v43);
    id v30 = [(ICViewControllerManager *)self trailingSidebarViewController];
    if (v30)
    {
      int64_t v31 = [(ICViewControllerManager *)self trailingSidebarViewController];
      [v31 ic_performBlockAfterActiveTransition:v29];
    }
    else
    {
      ((void (*)(void *))v29[2])(v29);
    }

    CFNullRef v20 = v44;
    goto LABEL_28;
  }
  double v16 = [v9 filter];

  if (!v16) {
    goto LABEL_10;
  }
  id v17 = [(ICViewControllerManager *)self noteEditorViewController];
  double v18 = [v17 authorHighlightsUpdater];
  double v19 = [v9 filter];
  [v18 flashHighlightsForFilter:v19];

LABEL_29:
}

- (void)hideAttributionHighlights
{
}

- (void)showRecentlyDeletedMathNotes
{
  if ((id)[(ICViewControllerManager *)self behavior] == (id)1)
  {
    id v5 = +[ICAccount globalVirtualRecentlyDeletedMathNotesFolder];
    BOOL v3 = +[NSSet setWithObject:v5];
    id v4 = +[NSSet set];
    [(ICViewControllerManager *)self selectContainerWithIdentifiers:v3 excludingIdentifiers:v4 usingRootViewController:0 deferUntilDataLoaded:1 animated:1];
  }
}

- (void)showSelectionForParticipant:(id)a3 noteObjectID:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id v7 = [(ICViewControllerManager *)self selectedModernNote];
  CFNullRef v8 = [v7 objectID];
  unsigned __int8 v9 = [v8 isEqual:v12];

  if ((v9 & 1) == 0) {
    [(ICViewControllerManager *)self showObjectWithObjectID:v12];
  }
  id v10 = [(ICViewControllerManager *)self noteEditorViewController];
  id v11 = [v10 realtimeCollaborationSelectionController];
  [v11 showSelectionForParticipant:v6];
}

- (BOOL)canUserChangeNoteContainerViewMode
{
  id v2 = [(ICViewControllerManager *)self mainSplitViewController];
  BOOL v3 = [v2 presentedViewController];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
}

- (void)setNoteContainerViewMode:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  CFNullRef v8 = v6;
  if (self->_noteContainerViewMode == a3
    || (v7 = [(ICViewControllerManager *)self isAuxiliary], id v6 = v8, v7))
  {
    if (!v6) {
      goto LABEL_7;
    }
    v6[2](v6);
  }
  else
  {
    self->_noteContainerViewMode = a3;
    [(ICViewControllerManager *)self updateSplitViewForCurrentViewModeWithCompletion:v8];
  }
  id v6 = v8;
LABEL_7:
}

- (void)updateSplitViewForCurrentViewModeWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = [(ICViewControllerManager *)self mainSplitViewController];
  id v6 = [v5 style];

  if (![(ICViewControllerManager *)self hasCompactWidth]
    && ([(ICViewControllerManager *)self noteContainerViewMode] || v6 == (id)2)
    && ((id)[(ICViewControllerManager *)self noteContainerViewMode] != (id)1 || v6 == (id)1))
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      unsigned int v7 = [(ICViewControllerManager *)self windowStateArchive];
      int64_t v8 = [(ICViewControllerManager *)self behavior];
      unsigned int v9 = ![(ICViewControllerManager *)self hasCompactWidth];
      if (v8 == 1) {
        unsigned int v9 = 1;
      }
      unsigned int v59 = v9;
      BOOL v60 = v8 != 1;
      int64_t v58 = [(ICViewControllerManager *)self noteContainerViewMode];
      id v10 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
      uint64_t v11 = [v10 isCollapsed] ^ 1;
      objc_opt_class();
      id v12 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
      [v12 dataSource];
      double v13 = v61 = v4;
      double v14 = [v13 firstRelevantItemIdentifier];
      double v15 = ICDynamicCast();
      double v16 = [(ICViewControllerManager *)self modernManagedObjectContext];
      id v17 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      +[ICSelectionStateUtilities updateArchive:v7 forNewViewMode:v58 requiresContainerSelection:v59 requiresObjectSelection:v11 validateContainerSelection:v60 defaultObjectID:v15 modernManagedObjectContext:v16 legacyManagedObjectContext:v17];

      BOOL v4 = v61;
      [(ICViewControllerManager *)self applyStateRestoreArchive:v7 completion:v61];
    }
    else
    {
      double v18 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
      unsigned __int8 v19 = [v18 isCollapsed];

      if ((v19 & 1) != 0 || [(ICViewControllerManager *)self noteContainerViewMode])
      {
        unsigned int v7 = 0;
      }
      else
      {
        uint64_t v51 = [(ICViewControllerManager *)self selectedNoteObjectID];
        uint64_t v52 = v51;
        if (v51)
        {
          id v53 = v51;
        }
        else
        {
          id v53 = [(ICViewControllerManager *)self previousSelectedNoteObjectID];
        }
        unsigned int v7 = v53;

        if (![(ICViewControllerManager *)self isSelectionAppropriateForObjectID:v7])
        {
          objc_opt_class();
          v54 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
          uint64_t v55 = [v54 dataSource];
          id v56 = [v55 firstRelevantItemIdentifier];
          uint64_t v57 = ICDynamicCast();

          unsigned int v7 = (void *)v57;
        }
      }
      CFNullRef v20 = [(ICViewControllerManager *)self windowStateArchive];
      [v20 setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:&__NSDictionary0__struct];
      [v20 setCurrentNoteContainerViewMode:[self noteContainerViewMode]];
      if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1)
      {
        [v20 setCurrentNoteObjectIDURL:0];
        if (![(ICViewControllerManager *)self hasCompactWidth])
        {
          CFNullRef v21 = [v20 currentContainerObjectIDURLs];
          id v22 = [v21 count];

          if (v22)
          {
            CFNullRef v23 = [v20 currentContainerObjectIDURLs];
            unint64_t v24 = [v23 lastObject];
            CFNullRef v25 = [(ICViewControllerManager *)self managedObjectIDFromURL:v24];

            objc_opt_class();
            unint64_t v26 = [(ICViewControllerManager *)self modernManagedObjectContext];
            unsigned __int8 v27 = [v26 ic_existingObjectWithID:v25];
            unsigned __int8 v28 = ICDynamicCast();

            if (v28)
            {
              BOOL v62 = [v28 ancestorFolderObjectIDs];
              uint64_t v29 = [v62 reverseObjectEnumerator];
              id v30 = [v29 allObjects];
              [v28 objectID];
              int64_t v31 = v25;
              id v33 = v32 = v4;
              id v34 = [v30 arrayByAddingObject:v33];

              BOOL v4 = v32;
              CFNullRef v25 = v31;

              id v35 = [v34 ic_map:&stru_100625BA8];
              [v20 setCurrentContainerObjectIDURLs:v35];
            }
          }
        }
      }
      else if (![(ICViewControllerManager *)self noteContainerViewMode])
      {
        [v20 setIsSupplementaryContentVisible:1];
        id v36 = [v20 currentContainerObjectIDURLs];
        id v37 = [v36 count];

        if (v37)
        {
          uint64_t v38 = [v20 currentContainerObjectIDURLs];
          uint64_t v39 = [v38 lastObject];
          id v63 = v39;
          unint64_t v40 = +[NSArray arrayWithObjects:&v63 count:1];
          [v20 setCurrentContainerObjectIDURLs:v40];
        }
        if (objc_msgSend(v7, "ic_isNoteType"))
        {
          uint64_t v41 = [v7 URIRepresentation];
          [v20 setCurrentNoteObjectIDURL:v41];
        }
        if (objc_msgSend(v7, "ic_isInvitationType"))
        {
          id v42 = [v7 URIRepresentation];
          [v20 setCurrentInvitationObjectIDURL:v42];
        }
      }
      if ([(ICViewControllerManager *)self isTagSelected])
      {
        id v43 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
        CFNullRef v44 = [v43 ic_compactMap:&stru_100625BE8];

        id v45 = [v44 allObjects];
        [v20 setCurrentTagIdentifiers:v45];
      }
      objc_opt_class();
      BOOL v46 = [(ICViewControllerManager *)self selectedContainerItemID];
      id v47 = ICDynamicCast();

      if (v47)
      {
        CFNullRef v48 = [v47 type];
        [v20 setCurrentVirtualSmartFolderType:v48];

        id v49 = [v47 accountObjectID];
        BOOL v50 = [v49 URIRepresentation];
        [v20 setCurrentVirtualSmartFolderAccountObjectIDURL:v50];
      }
      [(ICViewControllerManager *)self applyStateRestoreArchive:v20 completion:v4];
    }
  }
}

+ (BOOL)isNoteCreateApproachForScrapPaper:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 6;
}

+ (BOOL)doesNoteCreateApproachUseSelectedContainerToInferSystemPaperness:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x6007u >> a3);
}

- (id)showNewNoteWithApproach:(int64_t)a3 sender:(id)a4 animated:(BOOL)a5
{
  return [(ICViewControllerManager *)self showNewNoteWithApproach:a3 sender:a4 recordAudio:0 animated:a5];
}

- (id)showNewNoteWithApproach:(int64_t)a3 sender:(id)a4 recordAudio:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v40 = a6;
  id v9 = a4;
  id v10 = [(ICViewControllerManager *)self selectedNoteObjectID];
  unsigned int v11 = [v10 ic_isEntityOfClass:[objc_opt_class()]];

  if (v11)
  {
    id v12 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    [v12 saveNote];
  }
  objc_opt_class();
  double v13 = ICDynamicCast();
  unint64_t v14 = [v13 ic_isPencilEvent];

  HIDWORD(v36) = a3 == 10;
  BOOL v39 = a3 == 9;
  objc_opt_class();
  LODWORD(v36) = objc_opt_isKindOfClass();
  objc_opt_class();
  double v15 = ICDynamicCast();
  double v16 = v15;
  if (v15)
  {
    id v17 = [v15 allTouches];
    double v18 = [v17 anyObject];

    unsigned __int8 v19 = [v18 window];
    CFNullRef v20 = [v19 windowScene];
    [v20 delegate];
    unint64_t v21 = v14;
    v23 = BOOL v22 = a5;

    objc_opt_class();
    unint64_t v24 = ICDynamicCast();

    a5 = v22;
    unint64_t v14 = v21;
  }
  else
  {
    objc_opt_class();
    double v18 = ICDynamicCast();
    unint64_t v24 = v18;
  }

  uint64_t v25 = 0;
  if ((v14 & 1) == 0 && !a5) {
    uint64_t v25 = (a3 != 10) & ((a3 != 0) | v36);
  }
  if (v9)
  {
    unint64_t v26 = [(ICViewControllerManager *)self eventReporter];
    [v26 pushNoteCreateDataWithCreateApproach:a3];
  }
  unsigned __int8 v27 = -[ICViewControllerManager containerObjectIDForNewNoteWithApproach:](self, "containerObjectIDForNewNoteWithApproach:", a3, v36);
  if (v27)
  {
    if ([(id)objc_opt_class() isNoteCreateApproachForScrapPaper:a3])
    {
      uint64_t v28 = 1;
    }
    else if ([(id)objc_opt_class() doesNoteCreateApproachUseSelectedContainerToInferSystemPaperness:a3])
    {
      objc_opt_class();
      [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
      unsigned int v37 = v14;
      int64_t v31 = v30 = a5;
      BOOL v32 = ICDynamicCast();

      id v33 = [v32 type];
      uint64_t v28 = (uint64_t)[v33 isEqual:ICVirtualSmartFolderItemIdentifierTypeSystemPaper];

      a5 = v30;
      unint64_t v14 = v37;
    }
    else
    {
      uint64_t v28 = 0;
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100040E34;
    v41[3] = &unk_100625C10;
    char v42 = v14;
    BOOL v43 = v24 != 0;
    void v41[4] = self;
    BOOL v44 = v39;
    BOOL v45 = a5;
    char v46 = v38;
    uint64_t v29 = [(ICViewControllerManager *)self showNewNoteStartEditing:v25 inContainerWithObjectID:v27 isSystemPaper:v28 showInkPicker:v14 animated:v40 completion:v41];
    if (v9)
    {
      id v34 = [(ICViewControllerManager *)self eventReporter];
      [v34 popNoteCreateData];
    }
  }
  else
  {
    [(ICViewControllerManager *)self showUpgradeNotesDialog];
    uint64_t v29 = 0;
  }

  return v29;
}

- (void)showUpgradeNotesDialog
{
  BOOL v3 = +[NSBundle mainBundle];
  id v11 = [v3 localizedStringForKey:@"Upgrade Notes" value:&stru_10063F3D8 table:0];

  BOOL v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"To create notes directly, upgrade your notes.", &stru_10063F3D8, 0 value table];

  id v6 = +[UIAlertController alertControllerWithTitle:v11 message:v5 preferredStyle:1];
  unsigned int v7 = +[NSBundle mainBundle];
  int64_t v8 = [v7 localizedStringForKey:@"OK" value:&stru_10063F3D8 table:0];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];

  [v6 addAction:v9];
  id v10 = [(ICViewControllerManager *)self mainSplitViewController];
  [v10 presentViewController:v6 animated:1 completion:0];
}

- (void)closeAuxiliaryWindow
{
}

- (void)closeAuxiliaryWindowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICViewControllerManager *)self isAuxiliary])
  {
    unsigned int v5 = +[UIDevice ic_isiPhone];
    id v6 = os_log_create("com.apple.notes", "UI");
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending ICSystemPaperDismissAction to scene presenter", buf, 2u);
      }

      int64_t v8 = [[ICSystemPaperDismissAction alloc] initWithReason:@"done"];
      id v9 = [(ICViewControllerManager *)self window];
      id v10 = [v9 windowScene];
      id v11 = [v10 _FBSScene];

      if (v11)
      {
        id v12 = +[NSSet setWithObject:v8];
        [v11 sendActions:v12];
      }
      else
      {
        id v12 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_1004D44BC();
        }
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)double v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Closing Auxiliary Window", v16, 2u);
      }

      double v13 = [(ICViewControllerManager *)self window];
      int64_t v8 = [v13 _windowHostingScene];

      if (!v8)
      {
        id v11 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No active auxiliary window to close. Ignoring request.", v15, 2u);
        }
        goto LABEL_19;
      }
      if (v3)
      {
        id v11 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
        [v11 setWindowDismissalAnimation:2];
      }
      else
      {
        id v11 = 0;
      }
      id v12 = +[UIApplication sharedApplication];
      unint64_t v14 = [(ICSystemPaperDismissAction *)v8 session];
      [v12 requestSceneSessionDestruction:v14 options:v11 errorHandler:&stru_100625C50];
    }
LABEL_19:
  }
}

- (unint64_t)countOfAllVisibleAccounts
{
  id v2 = [(ICViewControllerManager *)self folderListViewController];
  BOOL v3 = [v2 folderDataSource];
  id v4 = [v3 countOfAllVisibleAccounts];

  return (unint64_t)v4;
}

- (NSString)title
{
  uint64_t v26 = 0;
  unsigned __int8 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10003A7F0;
  BOOL v30 = sub_10003A800;
  id v31 = 0;
  BOOL v3 = [(ICViewControllerManager *)self selectedNoteObjectID];

  if (v3)
  {
    id v4 = [(ICViewControllerManager *)self selectedNoteObjectID];
    unsigned int v5 = [v4 ic_isModernNoteType];

    if (v5)
    {
      id v6 = [(ICViewControllerManager *)self modernManagedObjectContext];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000417D8;
      v25[3] = &unk_100625C78;
      v25[4] = self;
      v25[5] = &v26;
      [v6 performBlockAndWait:v25];
    }
    else
    {
      int64_t v8 = [(ICViewControllerManager *)self selectedNoteObjectID];
      unsigned int v9 = [v8 ic_isLegacyNoteType];

      if (!v9) {
        goto LABEL_17;
      }
      id v6 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      void v24[2] = sub_100041878;
      v24[3] = &unk_100625C78;
      void v24[4] = self;
      v24[5] = &v26;
      [v6 performBlockAndWait:v24];
    }
    goto LABEL_16;
  }
  BOOL v7 = [(ICViewControllerManager *)self selectedInvitationObjectID];

  if (v7)
  {
    id v6 = [(ICViewControllerManager *)self modernManagedObjectContext];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100041918;
    v23[3] = &unk_100625C78;
    v23[4] = self;
    v23[5] = &v26;
    [v6 performBlockAndWait:v23];
LABEL_16:

    goto LABEL_17;
  }
  id v10 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];

  if (v10)
  {
    objc_opt_class();
    id v11 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
    id v6 = ICDynamicCast();

    if (objc_msgSend(v6, "ic_isModernContainerType"))
    {
      id v12 = [(ICViewControllerManager *)self modernManagedObjectContext];
      double v13 = v22;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000419B8;
      v22[3] = &unk_100625CA0;
      v22[4] = self;
      v22[5] = v6;
      v22[6] = &v26;
      [v12 performBlockAndWait:v22];
    }
    else
    {
      if (!objc_msgSend(v6, "ic_isLegacyContainerType")) {
        goto LABEL_16;
      }
      id v12 = [(ICViewControllerManager *)self modernManagedObjectContext];
      double v13 = v21;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100041A38;
      v21[3] = &unk_100625CA0;
      v21[4] = self;
      v21[5] = v6;
      v21[6] = &v26;
      [v12 performBlockAndWait:v21];
    }

    goto LABEL_16;
  }
  unint64_t v14 = [(ICViewControllerManager *)self tagSelection];
  unsigned int v15 = [v14 isNonEmpty];

  if (v15)
  {
    double v16 = [(ICViewControllerManager *)self tagSelection];
    uint64_t v17 = [v16 title];
    double v18 = (void *)v27[5];
    v27[5] = v17;
  }
LABEL_17:
  id v19 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return (NSString *)v19;
}

- (void)updateSceneTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ICViewControllerManager *)self title];
  [v4 setTitle:v5];
}

- (BOOL)isAttachmentBrowserVisible
{
  id v2 = [(ICViewControllerManager *)self currentAttachmentBrowserViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isNoteEditorVisible
{
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  if (objc_msgSend(v3, "ic_isViewVisible"))
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    unsigned __int8 v4 = [v5 ic_isViewVisible];
  }
  return v4;
}

- (BOOL)isFolderListVisible
{
  id v2 = [(ICViewControllerManager *)self folderListViewController];
  unsigned __int8 v3 = [v2 ic_isViewVisible];

  return v3;
}

- (ICNoteSearchViewController)searchController
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self folderListViewController];
  unsigned __int8 v4 = [v3 noteSearchViewController];
  unsigned int v5 = [v4 isActive];

  if (v5)
  {
    id v6 = [(ICViewControllerManager *)self folderListViewController];
    id v7 = [v6 noteSearchViewController];
  }
  else
  {
    int64_t v8 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    unsigned int v9 = [v8 navigationController];
    id v6 = [v9 topViewController];

    objc_opt_class();
    id v10 = ICDynamicCast();
    id v11 = [v10 noteSearchViewController];

    if (v11)
    {
      id v7 = v11;
    }
    else
    {
      id v12 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
      id v7 = [v12 noteSearchViewController];
    }
  }

  return (ICNoteSearchViewController *)v7;
}

- (ICBaseViewController)currentSearchBarViewController
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  if ([v3 isCollapsed])
  {
    uint64_t v4 = [(ICViewControllerManager *)self compactNavigationController];
  }
  else
  {
    if ([(ICViewControllerManager *)self noteContainerViewMode]) {
      [(ICViewControllerManager *)self secondaryNavigationController];
    }
    else {
    uint64_t v4 = [(ICViewControllerManager *)self supplementaryNavigationController];
    }
  }
  unsigned int v5 = (void *)v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 viewControllers];
  id v7 = [v6 reverseObjectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v11;
          goto LABEL_17;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return (ICBaseViewController *)v8;
}

- (ICBrowseAttachmentsCollectionController)currentAttachmentBrowserViewController
{
  objc_opt_class();
  unsigned __int8 v3 = [(ICViewControllerManager *)self mainSplitViewController];
  uint64_t v4 = [v3 ic_topViewController];
  unsigned int v5 = ICDynamicCast();

  id v6 = [v5 viewControllers];
  id v7 = [v6 ic_firstObjectOfClass:objc_opt_class()];

  return (ICBrowseAttachmentsCollectionController *)v7;
}

- (void)hidePresentedActivityStreamNavigationControllerWithCompletion:(id)a3
{
  id v8 = (void (**)(void))a3;
  uint64_t v4 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
  unsigned int v5 = [v4 presentingViewController];

  if (v5)
  {
    id v6 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
    id v7 = [v6 presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (UIViewController)presentedActivityStreamPresentingViewController
{
  if ([(ICViewControllerManager *)self isAuxiliary])
  {
    unsigned __int8 v3 = [(ICViewControllerManager *)self noteEditorViewController];
  }
  else
  {
    if ([(ICViewControllerManager *)self hasCompactWidth]) {
      [(ICViewControllerManager *)self compactNavigationController];
    }
    else {
    unsigned __int8 v3 = [(ICViewControllerManager *)self trailingSidebarViewController];
    }
  }

  return (UIViewController *)v3;
}

- (ICActivityStreamNavigationController)presentedActivityStreamNavigationController
{
  objc_opt_class();
  unsigned __int8 v3 = [(ICViewControllerManager *)self presentedActivityStreamPresentingViewController];
  uint64_t v4 = [v3 presentedViewController];
  unsigned int v5 = ICDynamicCast();

  return (ICActivityStreamNavigationController *)v5;
}

- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(ICViewControllerManager *)self isWelcomeScreenVisible])
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    unsigned __int8 v7 = +[ICStartupController hasShownWelcomeScreen];
    char v8 = +[ICStartupController shouldShowWelcomeOrWhatsNewScreen];
    uint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1004D45E8(v8, v4, v9);
    }

    id v10 = [ICStartupNavigationController alloc];
    id v11 = [(ICViewControllerManager *)self window];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000424C0;
    v33[3] = &unk_100625CF0;
    unsigned __int8 v35 = v7;
    void v33[4] = self;
    id v34 = v6;
    id v12 = [(ICStartupNavigationController *)v10 initWithForceWelcomeScreen:v4 presentingWindow:v11 dismissBlock:v33];

    long long v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1004D45B4();
    }

    [(ICViewControllerManager *)self setWelcomeScreenVisible:1];
    [(ICViewControllerManager *)self setStartupNavigationController:v12];
    [(ICStartupNavigationController *)v12 setModalInPresentation:1];
    if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
    {
      [(ICStartupNavigationController *)v12 preferredContentSize];
      double v15 = v14;
      long long v16 = [(ICViewControllerManager *)self window];
      [v16 frame];
      double Height = CGRectGetHeight(v36);

      -[ICStartupNavigationController setPreferredContentSize:](v12, "setPreferredContentSize:", v15, Height);
      id v18 = [(ICViewControllerManager *)self window];
      id v19 = [v18 rootViewController];
      [v19 presentViewController:v12 animated:0 completion:0];
    }
    else
    {
      id v20 = objc_alloc_init((Class)UIViewController);
      unint64_t v21 = +[UIColor ic_dynamicWhiteBlackColor];
      BOOL v22 = [v20 view];
      [v22 setBackgroundColor:v21];

      CFNullRef v23 = [ICOverlayWindowPresenter alloc];
      unint64_t v24 = [(ICViewControllerManager *)self window];
      uint64_t v25 = [(ICOverlayWindowPresenter *)v23 initWithRootViewController:v20 presentingWindow:v24];
      [(ICViewControllerManager *)self setStartupPresenter:v25];

      uint64_t v26 = +[UIColor blackColor];
      unsigned __int8 v27 = [(ICViewControllerManager *)self startupPresenter];
      [v27 setWindowBackgroundColor:v26];

      uint64_t v28 = [(ICViewControllerManager *)self startupPresenter];
      [v28 setPresentAnimationType:2];

      uint64_t v29 = [(ICViewControllerManager *)self startupPresenter];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100042714;
      v30[3] = &unk_100625860;
      id v31 = v20;
      BOOL v32 = v12;
      id v18 = v20;
      [v29 presentWithCompletionBlock:v30];

      id v19 = v31;
    }
  }
}

- (BOOL)hasMultipleModernAccounts
{
  id v2 = [(ICViewControllerManager *)self folderListViewController];
  unsigned __int8 v3 = [v2 folderDataSource];

  LOBYTE(v2) = (unint64_t)[v3 countOfModernAccounts] > 1;
  return (char)v2;
}

- (BOOL)isMainSplitViewDisplayModeSecondaryOnly
{
  id v2 = [(ICViewControllerManager *)self mainSplitViewController];
  BOOL v3 = [v2 displayMode] == (id)1;

  return v3;
}

- (ICTTTextContentStorage)textContentStorage
{
  objc_opt_class();
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  BOOL v4 = [v3 textView];
  unsigned int v5 = ICDynamicCast();

  objc_opt_class();
  id v6 = [v5 textLayoutManager];
  unsigned __int8 v7 = [v6 textContentManager];
  char v8 = ICDynamicCast();

  return (ICTTTextContentStorage *)v8;
}

- (void)setSelectedNoteBrowseContainerItemID:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteBrowseContainerItemID:]", 1, 0, @"VCM::setSelectedNoteBrowseContainerItemID should not be called when feature enabled");
  }
  else {
    [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:v4 sideEffects:1];
  }
}

- (void)setSelectedNoteBrowseContainerItemID:(id)a3 sideEffects:(BOOL)a4
{
  id v14 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteBrowseContainerItemID:sideEffects:]", 1, 0, @"VCM::setSelectedNoteBrowseContainerItemID should not be called when feature enabled");
  }
  else if (a4)
  {
    if (([(ICItemIdentifier *)self->_selectedNoteBrowseContainerItemID isEqual:v14] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, a3);
      if (v14)
      {
        unsigned __int8 v7 = [(ICViewControllerManager *)self tagSelection];
        [v7 clear];
      }
      else
      {
        char v8 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
        [v8 setNoteContainer:0];

        uint64_t v9 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
        [v9 setNoteCollection:0];

        id v10 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
        [v10 setVirtualSmartFolder:0];

        [(ICViewControllerManager *)self setFocusedNoteObjectID:0];
      }
      if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {
        unsigned __int8 v11 = [(ICViewControllerManager *)self isSearchActiveWithQuery];
        if (v14)
        {
          if ((v11 & 1) == 0) {
            [(ICViewControllerManager *)self setMostRecentNonSearchContainerItemID:v14];
          }
        }
      }
      id v12 = [(ICViewControllerManager *)self window];
      long long v13 = [v12 windowScene];
      [(ICViewControllerManager *)self updateSceneTitle:v13];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, a3);
  }
}

- (void)setSelectedNoteObjectID:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteObjectID:]", 1, 0, @"VCM::setSelectedNoteObjectID should not be called when feature enabled");
  }
  else {
    [(ICViewControllerManager *)self setSelectedNoteObjectID:v4 sideEffects:1];
  }
}

- (void)setSelectedNoteObjectID:(id)a3 sideEffects:(BOOL)a4
{
  id v7 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedNoteObjectID:sideEffects:]", 1, 0, @"VCM::setSelectedNoteObjectID should not be called when feature enabled");
  }
  else if (a4)
  {
    [(ICViewControllerManager *)self setPreviousSelectedNoteObjectID:self->_selectedNoteObjectID];
    objc_storeStrong((id *)&self->_selectedNoteObjectID, a3);
    char v8 = [(ICViewControllerManager *)self selectedNoteObjectID];

    if (v8) {
      [(ICViewControllerManager *)self setSelectedInvitationObjectID:0 sideEffects:0];
    }
    uint64_t v9 = [(ICViewControllerManager *)self previousSelectedNoteObjectID];
    unsigned __int8 v10 = [v9 isEqual:v7];

    if ((v10 & 1) == 0)
    {
      unsigned __int8 v11 = [(ICViewControllerManager *)self previousSelectedNoteObjectID];
      [(ICViewControllerManager *)self deleteEmptyNoteIfNeeded:v11];
    }
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    performBlockOnMainThread();
    [(ICViewControllerManager *)self setSelectedSearchResult:0];
    [(ICViewControllerManager *)self setIsSelectedNoteTogglingLock:0];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedNoteObjectID, a3);
  }
}

- (NSManagedObjectID)previousSelectedNoteObjectID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v3 = [(ICViewControllerManager *)self selectionStateController];
    id v4 = [v3 previousSelectedNoteObjectID];
  }
  else
  {
    id v4 = self->_previousSelectedNoteObjectID;
  }

  return v4;
}

- (void)setPreviousSelectedNoteObjectID:(id)a3
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setPreviousSelectedNoteObjectID:]", 1, 0, @"VCM::setPreviousSelectedNoteObjectID should not be called when feature enabled");
  }
  else {
    objc_storeStrong((id *)&self->_previousSelectedNoteObjectID, a3);
  }
}

- (void)setSelectedInvitationObjectID:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedInvitationObjectID:]", 1, 0, @"VCM::setSelectedInvitationObjectID should not be called when feature enabled");
  }
  else {
    [(ICViewControllerManager *)self setSelectedInvitationObjectID:v4 sideEffects:1];
  }
}

- (void)setSelectedInvitationObjectID:(id)a3 sideEffects:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedInvitationObjectID:sideEffects:]", 1, 0, @"VCM::setSelectedInvitationObjectID should not be called when feature enabled");
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedInvitationObjectID, a3);
    if (v4)
    {
      id v7 = [(ICViewControllerManager *)self selectedInvitationObjectID];

      if (v7) {
        [(ICViewControllerManager *)self setSelectedNoteObjectID:0 sideEffects:0];
      }
    }
  }
}

- (void)setTagSelection:(id)a3
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setTagSelection:]", 1, 0, @"VCM::setTagSelection should not be called when feature enabled");
  }
  else {
    objc_storeStrong((id *)&self->_tagSelection, a3);
  }
}

- (void)setFocusedNoteObjectID:(id)a3
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setFocusedNoteObjectID:]", 1, 0, @"VCM::setFocusedNoteObjectID should not be called when feature enabled");
  }
  else {
    objc_storeStrong((id *)&self->_focusedNoteObjectID, a3);
  }
}

- (void)setActivityStreamSelection:(id)a3
{
  id v12 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    activityStreamSelection = [(ICViewControllerManager *)self selectionStateController];
    [activityStreamSelection setActivityStreamSelection:v12];
  }
  else
  {
    id v5 = (ICActivityStreamSelection *)v12;
    activityStreamSelection = self->_activityStreamSelection;
    self->_activityStreamSelection = v5;
  }

  id v6 = [(ICViewControllerManager *)self activityStreamNavigationController];
  [v6 setSelection:v12];

  id v7 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
  [v7 setSelection:v12];

  id v8 = [(ICViewControllerManager *)self noteEditorViewController];
  uint64_t v9 = [v8 attributionSidebarController];
  unsigned __int8 v10 = [v12 filter];
  [v9 setFilter:v10 animated:1];

  if (v12)
  {
    [(ICViewControllerManager *)self stopEditing];
  }
  else
  {
    unsigned __int8 v11 = [(ICViewControllerManager *)self noteEditorViewController];
    [v11 hideActivityStreamToolbarAnimated:1];
  }
  [(ICViewControllerManager *)self updateIgnoreTextViewTaps];
}

- (ICItemIdentifier)mostRecentNonSearchContainerItemID
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v3 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v4 = [v3 mostRecentNonSearchContainerItemID];
  }
  else
  {
    BOOL v4 = self->_mostRecentNonSearchContainerItemID;
  }

  return v4;
}

- (void)setMostRecentNonSearchContainerItemID:(id)a3
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setMostRecentNonSearchContainerItemID:]", 1, 0, @"VCM::setMostRecentNonSearchContainerItemID should not be called when feature enabled");
  }
  else {
    objc_storeStrong((id *)&self->_mostRecentNonSearchContainerItemID, a3);
  }
}

- (ICSearchResult)selectedSearchResult
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v3 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v4 = [v3 currentSelectedSearchResult];
  }
  else
  {
    BOOL v4 = self->_selectedSearchResult;
  }

  return v4;
}

- (void)setSelectedSearchResult:(id)a3
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager setSelectedSearchResult:]", 1, 0, @"VCM::setSelectedSearchResult should not be called when feature enabled");
  }
  else {
    objc_storeStrong((id *)&self->_selectedSearchResult, a3);
  }
}

- (NSArray)mostRecentSelections
{
  id v2 = [(ICViewControllerManager *)self selectionStateController];
  BOOL v3 = [v2 mostRecentSelections];

  return (NSArray *)v3;
}

- (void)splitViewControllerDidExpand:(id)a3
{
}

- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3
{
  if (![(ICViewControllerManager *)self isInHTMLEditorMode])
  {
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    BOOL v4 = [v5 textView];
    [v4 _willBeginInteractiveResize];
  }
}

- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3
{
  if (![(ICViewControllerManager *)self isInHTMLEditorMode])
  {
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    BOOL v4 = [v5 textView];
    [v4 _didEndInteractiveResize];
  }
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6 = a3;
  [(ICViewControllerManager *)self setSplitViewExpandingOrCollapsing:1];
  id v7 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];

  if (v7 != v6 || [(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    goto LABEL_15;
  }
  id v8 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  if (v8) {
    goto LABEL_6;
  }
  if (![(ICViewControllerManager *)self isTagSelected])
  {
    id v8 = [(ICViewControllerManager *)self mostRecentRegularWidthSelectedNoteBrowseContainerItemID];
    [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:v8 sideEffects:0];
LABEL_6:
  }
  if (![(ICViewControllerManager *)self isTagSelected])
  {
    uint64_t v9 = [(ICViewControllerManager *)self mostRecentRegularWidthTagSelection];
    [(ICViewControllerManager *)self setTagSelection:v9];
  }
  if (![(ICViewControllerManager *)self isTagSelected])
  {
    unsigned __int8 v10 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];

    if (!v10)
    {
      unsigned __int8 v11 = [(ICViewControllerManager *)self mostRecentRegularWidthSelectedNoteBrowseContainerItemID];
      [(ICViewControllerManager *)self setSelectedNoteBrowseContainerItemID:v11 sideEffects:0];
    }
  }
  id v12 = [(ICViewControllerManager *)self selectedNoteObjectID];

  if (!v12)
  {
    long long v13 = [(ICViewControllerManager *)self mostRecentRegularWidthSelectedNoteObjectID];
    [(ICViewControllerManager *)self setSelectedNoteObjectID:v13 sideEffects:0];
  }
  [(ICViewControllerManager *)self setMostRecentRegularWidthSelectedNoteObjectID:0];
  [(ICViewControllerManager *)self setMostRecentRegularWidthTagSelection:0];
  [(ICViewControllerManager *)self setMostRecentRegularWidthSelectedNoteBrowseContainerItemID:0];
  [(ICViewControllerManager *)self updateSplitViewForCurrentViewModeWithCompletion:0];
LABEL_15:
  int64_t v14 = a4;
  double v15 = [(ICViewControllerManager *)self folderListViewController];
  long long v16 = [v15 navigationItem];
  uint64_t v17 = [v16 searchController];
  unsigned int v18 = [v17 isActive];

  if (v18)
  {
    id v19 = [(ICViewControllerManager *)self folderListViewController];
    id v20 = [v19 navigationItem];
    unint64_t v21 = [v20 searchController];

    BOOL v22 = [v21 searchBar];
    CFNullRef v23 = [v22 searchTextField];
    double v105 = [v23 text];

    unint64_t v24 = [v21 searchBar];
    uint64_t v25 = [v24 searchTextField];
    v104 = [v25 tokens];

    uint64_t v26 = [v21 searchBar];
    id v101 = [v26 selectedScopeButtonIndex];

    unsigned __int8 v27 = [v21 searchBar];
    uint64_t v28 = [v27 searchTextField];
    unsigned int v100 = [v28 isFirstResponder];

    uint64_t v29 = [(ICViewControllerManager *)self folderListViewController];
    BOOL v30 = [v29 navigationItem];
    id v31 = [v30 searchController];
    [v31 setActive:0];
  }
  else
  {
    unsigned int v100 = 0;
    id v101 = 0;
    v104 = 0;
    double v105 = 0;
  }
  v103 = v6;
  id v111 = +[NSMutableArray array];
  BOOL v32 = +[NSMutableArray array];
  id v33 = [(ICViewControllerManager *)self compactNavigationController];
  id v34 = [v33 viewControllers];

  long long v115 = 0u;
  long long v116 = 0u;
  BOOL v106 = [(ICViewControllerManager *)self noteContainerViewMode] == 0;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v34;
  id v35 = [obj countByEnumeratingWithState:&v115 objects:v120 count:16];
  int64_t v36 = v14;
  v107 = v32;
  unsigned int v102 = v18;
  if (v35)
  {
    id v37 = v35;
    BOOL v38 = v18 == 0;
    if (v18) {
      uint64_t v39 = 1;
    }
    else {
      uint64_t v39 = 3;
    }
    uint64_t v40 = *(void *)v116;
    if (v38) {
      uint64_t v41 = 5;
    }
    else {
      uint64_t v41 = 3;
    }
    uint64_t v42 = 4;
    if (!v38) {
      uint64_t v42 = 2;
    }
    int64_t v108 = v42;
    int64_t v109 = v41;
    int v110 = 1;
    while (1)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v116 != v40) {
          objc_enumerationMutation(obj);
        }
        BOOL v44 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(ICViewControllerManager *)self noteContainerViewMode])
          {
            int64_t v36 = v39;
          }
          else if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
          {
            int64_t v36 = v108;
          }
          else
          {
            int64_t v36 = v109;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1) {
              BOOL v45 = v32;
            }
            else {
              BOOL v45 = v111;
            }
            [v45 addObject:v44];
            int64_t v46 = [(ICViewControllerManager *)self behavior];
            int64_t v47 = [(ICViewControllerManager *)self noteContainerViewMode];
            int v110 = 0;
            uint64_t v48 = 2;
            if (v46 != 3) {
              uint64_t v48 = 3;
            }
            if (v47) {
              int64_t v36 = 1;
            }
            else {
              int64_t v36 = v48;
            }
          }
          else
          {
            uint64_t v49 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
            if (v44 == (void *)v49)
            {
            }
            else
            {
              BOOL v50 = (void *)v49;
              [(ICViewControllerManager *)self noteEditorViewController];
              v52 = int64_t v51 = v36;

              BOOL v38 = v44 == v52;
              int64_t v36 = v51;
              BOOL v32 = v107;
              if (!v38) {
                continue;
              }
            }
            if ((id)[(ICViewControllerManager *)self behavior] != (id)3)
            {
              [v32 addObject:v44];
              BOOL v106 = 0;
              int64_t v36 = 1;
            }
          }
        }
      }
      id v37 = [obj countByEnumeratingWithState:&v115 objects:v120 count:16];
      if (!v37) {
        goto LABEL_57;
      }
    }
  }
  int v110 = 1;
LABEL_57:

  if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1)
  {
    id v53 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    unsigned __int8 v54 = [v32 containsObject:v53];

    if ((v54 & 1) == 0)
    {
      uint64_t v55 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
      [v32 insertObject:v55 atIndex:0];
    }
  }
  if (![(ICViewControllerManager *)self noteContainerViewMode])
  {
    if ((id)[(ICViewControllerManager *)self behavior] == (id)1
      || ([(ICViewControllerManager *)self trailingSidebarSplitViewController],
          v82 = objc_claimAutoreleasedReturnValue(),
          v82,
          v82 == v103)
      && v36 == 3)
    {
      uint64_t v83 = [(ICViewControllerManager *)self noteEditorViewController];
      unsigned __int8 v84 = [v32 containsObject:v83];

      if ((v84 & 1) == 0)
      {
        v85 = [(ICViewControllerManager *)self noteEditorViewController];
        [v32 insertObject:v85 atIndex:0];
      }
    }
  }
  if ([obj count])
  {
    int64_t v56 = v36;
    uint64_t v57 = [(ICViewControllerManager *)self childPrimaryViewController];
    id v119 = v57;
    int64_t v58 = +[NSArray arrayWithObjects:&v119 count:1];
    unsigned int v59 = [(ICViewControllerManager *)self primaryNavigationController];
    [v59 setViewControllers:v58];

    id v60 = [v111 copy];
    id v61 = [(ICViewControllerManager *)self supplementaryNavigationController];
    [v61 setViewControllers:v60];

    id v62 = [v32 copy];
    id v63 = [(ICViewControllerManager *)self secondaryNavigationController];
    [v63 setViewControllers:v62];

    if (((v110 | v106) & 1) == 0)
    {
LABEL_81:
      int64_t v36 = v56;
      if (v102)
      {
        id v86 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
        [v86 startSearchWithSearchQuery:v105 searchTokens:v104 searchScope:v101 becomeFirstResponder:v100];
      }
      goto LABEL_83;
    }
    uint64_t v64 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
    if (![v64 count])
    {
      id v65 = [(ICViewControllerManager *)self excludedContainerIdentifiers];
      if (![v65 count])
      {
        id v66 = [(ICViewControllerManager *)self selectedNoteObjectID];

        if (!v66) {
          goto LABEL_68;
        }
        uint64_t v67 = [(ICViewControllerManager *)self selectedNoteObjectID];
        id v65 = [(ICViewControllerManager *)self defaultContainerObjectIDForNoteWithObjectID:v67];

        uint64_t v68 = +[NSSet ic_setFromNonNilObject:v65];

        uint64_t v64 = (void *)v68;
      }
    }
LABEL_68:
    uint64_t v69 = [(ICViewControllerManager *)self folderListViewController];
    uint64_t v70 = [v69 dataSource];
    unsigned __int8 v71 = [v70 firstRelevantItemIdentifier];

    BOOL v72 = (id)[(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v71] != (id)1;
    if (![v64 count])
    {
      long long v73 = [(ICViewControllerManager *)self excludedContainerIdentifiers];
      id v74 = [v73 count];

      if (!v74)
      {
        uint64_t v75 = +[NSSet ic_setFromNonNilObject:v71];

        uint64_t v64 = (void *)v75;
      }
    }
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_1000441B4;
    v113[3] = &unk_100625D18;
    v113[4] = self;
    BOOL v114 = v106;
    id v76 = objc_retainBlock(v113);
    if (v110 & 1 | ![(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      uint64_t v77 = [(ICViewControllerManager *)self excludedContainerIdentifiers];
      v78 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
      BOOL v79 = [(ICViewControllerManager *)self noteContainerViewMode] == 0;
      +[NSNumber numberWithBool:v106 || v72];
      v81 = char v80 = v71;
      BYTE1(v99) = v79;
      LOBYTE(v99) = 0;
      -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v64, v77, 1, v78, 1, 0, &__kCFBooleanFalse, v99, v81, 0, 0, v76);

      unsigned __int8 v71 = v80;
      BOOL v32 = v107;
    }
    else if ([(ICViewControllerManager *)self selectionStateTrackingEnabled] && v106)
    {
      ((void (*)(void *))v76[2])(v76);
    }

    goto LABEL_81;
  }
LABEL_83:
  v87 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];

  if (v87 == v103)
  {
    id v88 = [(ICViewControllerManager *)self mainSplitViewController];
    [v88 setPreferredDisplayMode:v36];

    long long v89 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];

    if (v89
      && (-[ICViewControllerManager presentedActivityStreamNavigationController](self, "presentedActivityStreamNavigationController"), long long v90 = objc_claimAutoreleasedReturnValue(), v91 = (unint64_t)[v90 viewMode], v90, v91 != 4))
    {
      [(ICViewControllerManager *)self hidePresentedActivityStreamNavigationControllerWithCompletion:0];
      long long v93 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
      unsigned int v94 = [v93 shouldRenderAsOverlay];

      if (v94)
      {
        long long v95 = [(ICViewControllerManager *)self activityStreamSelection];

        if (v95)
        {
          long long v96 = [(ICViewControllerManager *)self noteEditorViewController];
          long long v97 = [(ICViewControllerManager *)self selectedModernNote];
          long long v98 = [(ICViewControllerManager *)self activityStreamSelection];
          [v96 showActivityStreamToolbarForObject:v97 selection:v98 animated:0];
        }
        if ((v91 & 0xFFFFFFFFFFFFFFFELL) == 2) {
          int64_t v36 = 3;
        }
        else {
          int64_t v36 = 1;
        }
      }
      else
      {
        int64_t v36 = 2;
      }
    }
    else
    {
      int64_t v36 = 1;
    }
  }

  return v36;
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void, uint64_t, double, double, double, double))a4;
  if (![(ICViewControllerManager *)self isNoteEditorVisible]
    || [(ICViewControllerManager *)self isWelcomeScreenVisible]
    || ([(ICViewControllerManager *)self window],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "ic_topmostPresentedViewController"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (v5) {
      v5[2](v5, 0, 0x7FFFFFFFFFFFFFFFLL, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    }
    goto LABEL_6;
  }
  if ([(ICViewControllerManager *)self isInHTMLEditorMode])
  {
    id v8 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    uint64_t v9 = [v8 printFormatter];
    unsigned __int8 v10 = [v8 contentLayer];
    [v10 contentOffset];
    double v12 = v11;
    long long v13 = [v8 contentLayer];
    int64_t v14 = [v13 noteHTMLEditorView];
    double v15 = [v14 webView];
    long long v16 = [v15 scrollView];
    [v16 contentSize];
    double v18 = v12 / v17;

LABEL_16:
    double v32 = fmax(v18, 0.0);

    if (qword_1006AA0B8 != -1) {
      dispatch_once(&qword_1006AA0B8, &stru_100625D38);
    }
    id v33 = qword_1006AA0B0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000446FC;
    block[3] = &unk_100625DB0;
    id v36 = v9;
    double v38 = v32;
    id v37 = v5;
    id v34 = v9;
    dispatch_async(v33, block);

    goto LABEL_6;
  }
  id v8 = [(ICViewControllerManager *)self noteEditorViewController];
  id v19 = [v8 note];
  if (([v19 isPasswordProtected] & 1) == 0)
  {

    goto LABEL_15;
  }
  id v20 = [v8 note];
  unsigned __int8 v21 = [v20 isAuthenticated];

  if (v21)
  {
LABEL_15:
    BOOL v22 = [v8 note];
    CFNullRef v23 = [v8 view];
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    uint64_t v28 = [v8 traitCollection];
    uint64_t v9 = +[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v22, v28, v25, v27);

    unsigned __int8 v10 = [v8 textView];
    [v10 contentOffset];
    double v30 = v29;
    long long v13 = [v8 textView];
    [v13 contentSize];
    double v18 = v30 / v31;
    goto LABEL_16;
  }
  if (v5) {
    v5[2](v5, 0, 0x7FFFFFFFFFFFFFFFLL, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }

LABEL_6:
}

- (BOOL)canBeginEditingForNoteDisplayController:(id)a3
{
  BOOL v3 = +[ICAppDelegate sharedInstance];
  unsigned int v4 = [v3 isAnyWelcomeScreenVisible];

  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Was asked to begin editing while welcome screen was up", v7, 2u);
    }
  }
  return v4 ^ 1;
}

- (void)noteEditorDidTapAllNotes:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D46E8();
  }

  id v6 = +[ICQuickNoteSessionManager sharedManager];
  [v6 saveSession];

  id v7 = +[ICNoteContext sharedContext];
  [v7 saveImmediately];

  uint64_t v11 = ICQuickNoteURLOptionShowList;
  id v8 = [&__kCFBooleanTrue stringValue];
  double v12 = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  unsigned __int8 v10 = [(ICViewControllerManager *)self quickNoteQueryOptionsFromEditor:v4 additionalOptions:v9];

  [(ICViewControllerManager *)self launchNotesAppFromLockscreenWithQueryOptions:v10 completionBlock:0];
}

- (void)noteEditorDidTapActionMenu:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D471C();
  }

  id v6 = [v4 note];
  unsigned __int8 v7 = [v6 isEmpty];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = ICQuickNoteURLOptionShowShareSheet;
    id v8 = [&__kCFBooleanTrue stringValue];
    double v12 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    unsigned __int8 v10 = [(ICViewControllerManager *)self quickNoteQueryOptionsFromEditor:v4 additionalOptions:v9];

    [(ICViewControllerManager *)self launchNotesAppFromLockscreenWithQueryOptions:v10 completionBlock:0];
  }
}

- (void)noteEditorDidTapAddPeople:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D4750();
  }

  uint64_t v9 = ICQuickNoteURLOptionShowiCloudShareSheet;
  id v6 = [&__kCFBooleanTrue stringValue];
  unsigned __int8 v10 = v6;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v8 = [(ICViewControllerManager *)self quickNoteQueryOptionsFromEditor:v4 additionalOptions:v7];

  [(ICViewControllerManager *)self launchNotesAppFromLockscreenWithQueryOptions:v8 completionBlock:0];
}

- (BOOL)noteEditor:(id)a3 didTapAttachment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICQuickNoteSessionManager sharedManager];
  unsigned int v9 = [v8 isSecureScreenShowing];

  if (v9)
  {
    unsigned __int8 v10 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1004D4784();
    }

    if (v7)
    {
      uint64_t v15 = ICQuickNoteURLOptionAttachmentIdentifier;
      uint64_t v11 = [v7 identifier];
      long long v16 = v11;
      double v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    }
    else
    {
      double v12 = &__NSDictionary0__struct;
    }
    long long v13 = [(ICViewControllerManager *)self quickNoteQueryOptionsFromEditor:v6 additionalOptions:v12];
    [(ICViewControllerManager *)self launchNotesAppFromLockscreenWithQueryOptions:v13 completionBlock:0];
  }
  return v9;
}

- (id)quickNoteQueryOptionsFromEditor:(id)a3 additionalOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 textView];
  [v7 contentOffset];
  double v9 = v8;

  unsigned __int8 v10 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  uint64_t v11 = [v5 note];
  double v12 = [v11 identifier];

  if (v12)
  {
    long long v13 = [v5 note];
    int64_t v14 = [v13 identifier];
    [v10 setObject:v14 forKeyedSubscript:ICQuickNoteURLOptionNoteIdentifier];

    uint64_t v15 = +[NSNumber numberWithDouble:v9];
    long long v16 = [v15 stringValue];
    [v10 setObject:v16 forKeyedSubscript:ICQuickNoteURLOptionContentOffsetY];
  }
  id v17 = [v10 copy];

  return v17;
}

- (void)updateForFingerDrawingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(ICViewControllerManager *)self behavior];
  int64_t v6 = v5;
  if (v3)
  {
    int64_t v7 = [(ICViewControllerManager *)self noteContainerViewMode];
    if (v6 != 1 && v7 == 0) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    unsigned __int8 v10 = [(ICViewControllerManager *)self mainSplitViewController];
    [v10 setDisplayModeButtonVisibility:v9];

    uint64_t v11 = [(ICViewControllerManager *)self mainSplitViewController];
    [v11 setPresentsWithGesture:0];

    id v19 = [(ICViewControllerManager *)self compactNavigationController];
    double v12 = [v19 interactivePopGestureRecognizer];
    long long v13 = v12;
    uint64_t v14 = 0;
  }
  else
  {
    BOOL v15 = v5 == 1;
    long long v16 = [(ICViewControllerManager *)self mainSplitViewController];
    [v16 setDisplayModeButtonVisibility:v15];

    BOOL v17 = (id)[(ICViewControllerManager *)self behavior] != (id)3;
    double v18 = [(ICViewControllerManager *)self mainSplitViewController];
    [v18 setPresentsWithGesture:v17];

    id v19 = [(ICViewControllerManager *)self compactNavigationController];
    double v12 = [v19 interactivePopGestureRecognizer];
    long long v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setEnabled:v14];
}

- (void)startSearchWithSearchQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  [v7 startSearchWithSearchQuery:v6 searchTokens:0 searchScope:0 becomeFirstResponder:v4];
}

- (void)updateNoteEditorViewControllerWithStateArchive:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICViewControllerManager *)self noteEditorViewController];
  id v6 = [v5 note];

  if (v6)
  {
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      id v7 = [(ICViewControllerManager *)self selectionStateController];
      [v7 setupWithArchive:v4];

      double v8 = [v6 objectID];
      uint64_t v9 = [v6 objectID];
      unsigned int v10 = [v9 isTemporaryID];

      if (v10)
      {
        uint64_t v11 = [v6 managedObjectContext];
        double v32 = v6;
        double v12 = +[NSArray arrayWithObjects:&v32 count:1];
        id v27 = 0;
        unsigned int v13 = [v11 obtainPermanentIDsForObjects:v12 error:&v27];
        uint64_t v14 = (_TtC11MobileNotes21ICSelectionStateModel *)v27;

        if (!v13 || v14)
        {
          double v24 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            double v29 = v14;
            __int16 v30 = 2112;
            double v31 = v6;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Conversion of temporary ID to permanent ID failed with error %@ for note %@", buf, 0x16u);
          }

          double v25 = [(ICViewControllerManager *)self noteEditorViewController];
          [v25 loadViewIfNeeded];

          long long v16 = [v4 scrollStateForNote:v6];
          double v26 = [(ICViewControllerManager *)self noteEditorViewController];
          [v26 applyScrollStateFromArchive:v16];

          goto LABEL_16;
        }
        uint64_t v15 = [v6 objectID];

        double v8 = (void *)v15;
      }
      uint64_t v14 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
      [(ICSelectionStateModel *)v14 setSelectedNoteObjectID:v8];
      long long v16 = [(ICViewControllerManager *)self selectionStateController];
      [v16 adoptInstantNoteModel:v14 archive:v4];
LABEL_16:

      goto LABEL_17;
    }
    BOOL v17 = [v6 objectID];
    double v18 = [v17 URIRepresentation];
    id v19 = [v4 currentNoteObjectIDURL];
    unsigned int v20 = [v18 isEqual:v19];

    if (v20)
    {
      unsigned __int8 v21 = [(ICViewControllerManager *)self noteEditorViewController];
      [v21 loadViewIfNeeded];

      double v8 = [v4 scrollStateForNote:v6];
      BOOL v22 = [(ICViewControllerManager *)self noteEditorViewController];
      [v22 applyScrollStateFromArchive:v8];

LABEL_17:
      goto LABEL_18;
    }
    CFNullRef v23 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Restore Quicknote UI editor state skipping because Note ID doesn't match", buf, 2u);
    }
  }
LABEL_18:
}

- (void)applyNoteViewModesToStateRestoreArchive:(id)a3 withContainerItemID:(id)a4
{
  id v10 = a3;
  int64_t v6 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:a4];
  if (v6 == -1)
  {
    if ([(ICViewControllerManager *)self preferredNoteContainerViewMode] != -1)
    {
      [v10 setCurrentNoteContainerViewMode:[self preferredNoteContainerViewMode]];
      double v8 = v10;
      uint64_t v9 = -1;
      goto LABEL_9;
    }
    [v10 setCurrentNoteContainerViewMode:[self noteContainerViewMode]];
    goto LABEL_7;
  }
  [v10 setCurrentNoteContainerViewMode:v6];
  if ([(ICViewControllerManager *)self preferredNoteContainerViewMode] != -1)
  {
LABEL_7:
    int64_t v7 = [(ICViewControllerManager *)self preferredNoteContainerViewMode];
    goto LABEL_8;
  }
  int64_t v7 = [(ICViewControllerManager *)self noteContainerViewMode];
LABEL_8:
  uint64_t v9 = v7;
  double v8 = v10;
LABEL_9:
  [v8 setPreferredNoteContainerViewMode:v9];
}

- (void)performActionForShortcutItem:(id)a3
{
  id v15 = a3;
  [(ICViewControllerManager *)self setSelectedNewNoteShortcutItem:v15];
  id v4 = [v15 type];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.notes.newNote"];

  if (v5)
  {
    uint64_t v6 = 8;
LABEL_7:
    id v11 = [(ICViewControllerManager *)self showNewNoteWithApproach:v6 sender:self animated:1];
    goto LABEL_8;
  }
  int64_t v7 = [v15 type];
  unsigned __int8 v8 = [v7 isEqualToString:@"com.apple.notes.checklist"];

  if (v8)
  {
    uint64_t v6 = 9;
    goto LABEL_7;
  }
  uint64_t v9 = [v15 type];
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.notes.scanDocument"];

  if (v10)
  {
    uint64_t v6 = 10;
    goto LABEL_7;
  }
  double v12 = [v15 type];
  unsigned int v13 = [v12 isEqualToString:@"com.apple.notes.audio"];

  if (v13) {
    id v14 = [(ICViewControllerManager *)self showNewNoteWithApproach:0 sender:self recordAudio:1 animated:1];
  }
LABEL_8:
}

- (void)lockNotesNow
{
  id v2 = [(ICViewControllerManager *)self noteEditorViewController];
  [v2 saveNote];

  id v3 = +[ICAuthenticationState sharedState];
  [v3 deauthenticate];
}

- (void)stopEditing
{
  id v3 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
  unsigned int v4 = [v3 isEditing];

  if (v4)
  {
    unsigned __int8 v5 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    [v5 setEditing:0 animated:0];
  }
  uint64_t v6 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    id v8 = [(ICViewControllerManager *)self noteEditorViewController];
    [v8 setEditing:0 animated:0];
  }
}

- (void)toggleSidebar
{
  id v2 = [(ICViewControllerManager *)self mainSplitViewController];
  [v2 ic_toggleSidebar];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ICViewControllerManager *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Navigation/ICViewControllerManager.m"])
  {
    unsigned __int8 v13 = [(ICViewControllerManager *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

    if (a6 == &off_100698C30
      && (v13 & 1) == 0
      && [v10 isEqualToString:@"attributionSidebarVisibility"])
    {
      [(ICViewControllerManager *)self updateIgnoreTextViewTaps];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICViewControllerManager;
    [(ICViewControllerManager *)&v14 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (void)updateIgnoreTextViewTaps
{
  id v3 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned int v4 = [v3 attributionSidebarController];
  if ([v4 attributionSidebarVisibility])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(ICViewControllerManager *)self presentedActivityStreamNavigationController];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      unsigned int v7 = [(ICViewControllerManager *)self activityStreamSelection];
      BOOL v5 = v7 != 0;
    }
  }

  id v8 = [(ICViewControllerManager *)self noteEditorViewController];
  [v8 setIgnoresTaps:v5];
}

- (ICContentInsetViewController)primaryContainerViewController
{
  primaryContainerViewController = self->_primaryContainerViewController;
  if (!primaryContainerViewController)
  {
    unsigned int v4 = [ICContentInsetViewController alloc];
    BOOL v5 = [(ICViewControllerManager *)self primaryNavigationController];
    uint64_t v6 = [(ICContentInsetViewController *)v4 initWithContentViewController:v5];
    unsigned int v7 = self->_primaryContainerViewController;
    self->_primaryContainerViewController = v6;

    [(ICViewControllerManager *)self updatePrimaryContainerViewAppearance];
    primaryContainerViewController = self->_primaryContainerViewController;
  }
  id v8 = primaryContainerViewController;

  return v8;
}

- (void)updatePrimaryContainerViewAppearance
{
  if ((id)[(ICViewControllerManager *)self behavior] != (id)1
    || [(ICViewControllerManager *)self hasCompactWidth]
    || [(ICViewControllerManager *)self hasCompactHeight])
  {
    uint64_t v3 = 0;
    double top = NSDirectionalEdgeInsetsZero.top;
    double leading = NSDirectionalEdgeInsetsZero.leading;
    double bottom = NSDirectionalEdgeInsetsZero.bottom;
    double trailing = NSDirectionalEdgeInsetsZero.trailing;
    double v8 = 0.0;
  }
  else
  {
    id v10 = [(ICViewControllerManager *)self window];
    [v10 layoutMargins];
    double leading = v11 + 4.0;

    double v8 = 20.0;
    uint64_t v3 = 1;
    double bottom = 24.0;
    double top = 0.0;
    double trailing = 0.0;
  }
  id v12 = -[ICContentInsetViewControllerConfiguration initWithInsets:usesSafeAreaLayoutGuide:cornerRadius:]([ICContentInsetViewControllerConfiguration alloc], "initWithInsets:usesSafeAreaLayoutGuide:cornerRadius:", v3, top, leading, bottom, trailing, v8);
  uint64_t v9 = [(ICViewControllerManager *)self primaryContainerViewController];
  [v9 setConfiguration:v12];
}

- (UINavigationController)noteBrowseNavigationController
{
  if ([(ICViewControllerManager *)self hasCompactWidth])
  {
    uint64_t v3 = [(ICViewControllerManager *)self compactNavigationController];
  }
  else if ([(ICViewControllerManager *)self noteContainerViewMode])
  {
    uint64_t v3 = [(ICViewControllerManager *)self secondaryNavigationController];
  }
  else
  {
    unsigned int v4 = [(ICViewControllerManager *)self mainSplitViewController];
    id v5 = [v4 style];

    if (v5 == (id)2) {
      [(ICViewControllerManager *)self supplementaryNavigationController];
    }
    else {
    uint64_t v3 = [(ICViewControllerManager *)self primaryNavigationController];
    }
  }

  return (UINavigationController *)v3;
}

- (BOOL)isShowingNoteBrowsersForContainerObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICViewControllerManager *)self noteBrowseNavigationController];
  uint64_t v6 = [v5 viewControllers];

  id v7 = [v4 count];
  if (v7 == [v6 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100046420;
    v11[3] = &unk_100625F78;
    id v12 = v4;
    unsigned __int8 v8 = [v6 ic_containsObjectPassingTest:v11];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)setNoteBrowserNavigationStackWithFolderObjectIDs:(id)a3
{
  id v4 = a3;
  if (![(ICViewControllerManager *)self isShowingNoteBrowsersForContainerObjectIDs:v4])
  {
    id v5 = [(ICViewControllerManager *)self noteBrowseNavigationController];
    id v6 = [v5 popToRootViewControllerAnimated:0];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000465E4;
    v7[3] = &unk_100625FA0;
    void v7[4] = self;
    [v4 enumerateObjectsUsingBlock:v7];
  }
}

- (BOOL)shouldManagedObjectBecomeSelectedNote:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  if (objc_msgSend(v5, "ic_isNoteType") && (objc_msgSend(v4, "isDeleted") & 1) == 0)
  {
    id v7 = [v4 objectID];
    if ([v7 isTemporaryID])
    {
      BOOL v6 = 0;
    }
    else
    {
      unsigned __int8 v8 = [(ICViewControllerManager *)self selectedNoteObjectID];
      if (v8)
      {
        BOOL v6 = 0;
      }
      else
      {
        char v9 = [(ICViewControllerManager *)self selectedInvitationObjectID];
        if (v9)
        {
          BOOL v6 = 0;
        }
        else
        {
          objc_opt_class();
          id v10 = ICDynamicCast();
          if ([v10 markedForDeletion])
          {
            BOOL v6 = 0;
          }
          else
          {
            objc_opt_class();
            double v11 = ICDynamicCast();
            if ([v11 needsInitialFetchFromCloud])
            {
              BOOL v6 = 0;
            }
            else
            {
              id v12 = [v4 objectID];
              BOOL v6 = [(ICViewControllerManager *)self isSelectionAppropriateForObjectID:v12];
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)selectNextContainerForDeletedFolder
{
}

- (BOOL)selectContainersForDeletedHashtagObjectIDs:(id)a3
{
  id v4 = a3;
  if (![(ICViewControllerManager *)self isTagSelected]) {
    goto LABEL_7;
  }
  id v5 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
  if (([v5 intersectsSet:v4] & 1) == 0)
  {

    goto LABEL_7;
  }
  int64_t v6 = [(ICViewControllerManager *)self noteContainerViewMode];

  if (v6 == 1)
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  id v7 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
  id v8 = [v7 mutableCopy];

  [v8 minusSet:v4];
  char v9 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
  id v10 = [v9 mutableCopy];

  [v10 minusSet:v4];
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    double v11 = [(ICViewControllerManager *)self tagSelection];
    [v11 setIncludedObjectIDs:v8];
    [v11 setExcludedObjectIDs:v10];
    [(ICViewControllerManager *)self selectTagSelection:v11];
  }
  else
  {
    id v14 = v8;
    id v15 = v10;
    performBlockOnMainThread();
  }
  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfSmartFolderIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(ICViewControllerManager *)self selectedSmartFolder:v4];

  if (v5)
  {
    int64_t v6 = [(ICViewControllerManager *)self selectedSmartFolderNoteObjectIDs:v4];
    BOOL v7 = [(ICViewControllerManager *)self selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:v6 managedObjectContext:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfSelectedTagsIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    id v5 = [(ICViewControllerManager *)self selectedTagsNoteObjectIDs:v4];
    BOOL v6 = [(ICViewControllerManager *)self selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:v5 managedObjectContext:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)selectDefaultFolderForNoteMovedOutOfNoteObjectIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICViewControllerManager *)self selectedNoteObjectID];
  if (objc_msgSend(v8, "ic_isModernNoteType")
    && ([v6 containsObject:v8] & 1) == 0)
  {
    uint64_t v19 = 0;
    unsigned int v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000479C4;
    v15[3] = &unk_100625CA0;
    id v16 = v7;
    id v10 = v8;
    id v17 = v10;
    double v18 = &v19;
    [v16 performBlockAndWait:v15];
    if (*((unsigned char *)v20 + 24))
    {
      BOOL v9 = 0;
    }
    else
    {
      double v11 = [(ICViewControllerManager *)self defaultContainerObjectIDForNoteWithObjectID:v10];
      BOOL v12 = v11;
      BOOL v9 = v11 != 0;
      if (v11)
      {
        id v14 = v11;
        performBlockOnMainThread();
      }
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (ICFolder)selectedSmartFolder
{
  uint64_t v3 = [(ICViewControllerManager *)self modernManagedObjectContext];
  id v4 = [(ICViewControllerManager *)self selectedSmartFolder:v3];

  return (ICFolder *)v4;
}

- (id)selectedSmartFolder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  id v6 = ICDynamicCast();

  if (v6 && objc_msgSend(v6, "ic_isModernFolderType"))
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = sub_10003A7F0;
    id v17 = sub_10003A800;
    id v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100047CD8;
    v9[3] = &unk_100625CA0;
    id v10 = v4;
    id v11 = v6;
    BOOL v12 = &v13;
    [v10 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)selectedSmartFolderNoteObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICViewControllerManager *)self selectedSmartFolder:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_10003A7F0;
    uint64_t v19 = sub_10003A800;
    id v20 = 0;
    BOOL v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100047EA4;
    BOOL v12 = &unk_100626040;
    id v14 = &v15;
    id v13 = v5;
    [v4 performBlockAndWait:&v9];
    id v7 = -[ICViewControllerManager noteObjectIDsWithQuery:managedObjectContext:](self, "noteObjectIDsWithQuery:managedObjectContext:", v16[5], v4, v9, v10, v11, v12);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)selectedTagsNoteObjectIDs:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    id v5 = [(ICViewControllerManager *)self selectedTagsNoteQuery:v4];
    id v6 = [(ICViewControllerManager *)self noteObjectIDsWithQuery:v5 managedObjectContext:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)noteObjectIDsWithQuery:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = sub_10003A7F0;
    id v18 = sub_10003A800;
    id v19 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000480D0;
    v10[3] = &unk_100625CA0;
    id v11 = v6;
    id v12 = v5;
    id v13 = &v14;
    [v11 performBlockAndWait:v10];
    id v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)selectedTagsNoteQuery:(id)a3
{
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    id v4 = [(ICViewControllerManager *)self tagSelection];
    id v5 = +[ICQuery queryForNotesMatchingTagSelection:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)selectNextRelevantObjectUsingChangedInappropriateIdentifiers:(id)a3
{
  id v4 = a3;
  if ((id)[(ICViewControllerManager *)self behavior] != (id)2)
  {
    if ((id)[(ICViewControllerManager *)self noteContainerViewMode] != (id)1
      || ([(ICViewControllerManager *)self activeEditorController],
          id v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = objc_msgSend(v5, "ic_isViewVisible"),
          v5,
          v6))
    {
      if (![(ICViewControllerManager *)self isAuxiliary])
      {
        uint64_t v7 = [(ICViewControllerManager *)self selectedSearchResult];
        if (v7
          && (id v8 = (void *)v7,
              unsigned int v9 = [(ICViewControllerManager *)self isSearchActive],
              v8,
              v9))
        {
          uint64_t v10 = [(ICViewControllerManager *)self searchController];
          id v11 = [v10 dataSource];

          id v12 = [v4 allObjects];
          id v13 = [v11 nextRelevantItemIdentifierAfter:v12];

          if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
            [(ICViewControllerManager *)self setSelectedSearchResult:v13];
          }
          char v14 = 1;
        }
        else
        {
          uint64_t v15 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
          id v11 = [v15 dataSource];

          uint64_t v16 = [v4 allObjects];
          id v13 = [v11 nextRelevantItemIdentifierAfter:v16];

          if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
            [(ICViewControllerManager *)self setSelectedNoteObjectID:v13];
          }
          char v14 = 0;
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000483B4;
        block[3] = &unk_100625F50;
        char v21 = v14;
        id v19 = v13;
        id v20 = self;
        id v17 = v13;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (void)dismissPrimaryOverlayContent
{
  uint64_t v3 = [(ICViewControllerManager *)self mainSplitViewController];
  unint64_t v4 = (unint64_t)[v3 displayMode];

  if (v4 <= 6 && ((1 << v4) & 0x68) != 0)
  {
    id v6 = [(ICViewControllerManager *)self mainSplitViewController];
    [v6 hideColumn:0];
  }
}

- (void)dismissSupplementaryOverlayContent
{
  if ((id)[(ICViewControllerManager *)self noteContainerViewMode] != (id)1)
  {
    uint64_t v3 = [(ICViewControllerManager *)self mainSplitViewController];
    id v4 = [v3 displayMode];

    if (v4 == (id)5 || v4 == (id)3)
    {
      id v5 = [(ICViewControllerManager *)self mainSplitViewController];
      [v5 hideColumn:1];
    }
  }
}

- (void)sendNotificationForSplitViewDisplayModeChangeWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  +[NSNotificationCenter defaultCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100048748;
  v9[3] = &unk_100626068;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000487A4;
  v6[3] = &unk_100626068;
  id v7 = v10;
  id v8 = self;
  id v5 = v10;
  [v4 animateAlongsideTransition:v9 completion:v6];
}

- (void)sendNotificationForNoteEditorSizeChange:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(ICViewControllerManager *)self noteEditorViewController];
  if ((objc_msgSend(v8, "ic_isViewVisible") & 1) == 0) {
    goto LABEL_6;
  }
  unsigned int v9 = +[ICQuickNoteSessionManager sharedManager];
  if ([v9 isSecureScreenShowing])
  {

LABEL_6:
    goto LABEL_7;
  }
  unsigned __int8 v10 = [(ICViewControllerManager *)self isApplyingStateRestoreArchive];

  if ((v10 & 1) == 0)
  {
    v22[0] = @"ICSplitViewControllerPredictedDetailSizeUserInfo";
    id v11 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height);
    v23[0] = v11;
    v22[1] = @"ICSplitViewControllerPredictedDurationUserInfo";
    [v7 transitionDuration];
    id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v23[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    +[NSNotificationCenter defaultCenter];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100048A38;
    v18[3] = &unk_100626090;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = self;
    id v21 = v13;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100048A9C;
    v15[3] = &unk_100626068;
    id v16 = v19;
    id v17 = self;
    id v14 = v19;
    id v8 = v13;
    [v7 animateAlongsideTransition:v18 completion:v15];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 keepEditorShowing:(id)a8 animated:(BOOL)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v35 = a5;
  id v14 = a3;
  id v15 = a4;
  id v36 = a8;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100048DA0;
  v37[3] = &unk_1006260B8;
  v37[4] = self;
  BOOL v38 = a9;
  BOOL v33 = v10;
  BOOL v39 = v10;
  id v16 = objc_retainBlock(v37);
  id v17 = [(ICViewControllerManager *)self selectedNoteObjectID];
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(ICViewControllerManager *)self selectedInvitationObjectID];
  }
  id v20 = v19;
  id v34 = v15;

  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]
    && v20
    && [(ICViewControllerManager *)self hasCompactWidth]
    && ![(ICViewControllerManager *)self objectAlreadyLoadedInEditorWithObjectID:v20]&& [(ICViewControllerManager *)self isNoteEditorVisible])
  {
    char v21 = 0;
    char v22 = 1;
    if (!v11)
    {
LABEL_10:
      id v23 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    double v24 = [v14 allObjects];
    double v25 = [v24 firstObject];
    int64_t v26 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v25];

    unsigned __int8 v27 = [(ICViewControllerManager *)self isAutomaticallySelectingNotes];
    if (v26 == 1) {
      char v22 = 0;
    }
    else {
      char v22 = v27;
    }
    char v21 = 1;
    if (!v11) {
      goto LABEL_10;
    }
  }
  uint64_t v28 = [(ICViewControllerManager *)self mainSplitViewController];
  if ([v28 isCollapsed])
  {
    double v29 = 0;
  }
  else if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
  {
    double v29 = 0;
  }
  else
  {
    double v29 = v16;
  }
  id v23 = objc_retainBlock(v29);

LABEL_21:
  if (v35)
  {
    __int16 v30 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    BOOL v31 = ([v30 isCollapsed] & 1) != 0
       || [(ICViewControllerManager *)self hasCompactWidth]
       && (id)[(ICViewControllerManager *)self behavior] == (id)3
       || (id)[(ICViewControllerManager *)self behavior] == (id)1;
  }
  else
  {
    BOOL v31 = 1;
  }
  BYTE2(v32) = v22;
  BYTE1(v32) = v21;
  LOBYTE(v32) = v31;
  -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v14, v34, 0, v35, v11, v33, v32, v36, 0, v23);
  if (!v11) {
    ((void (*)(void *))v16[2])(v16);
  }
}

- (void)showContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(BOOL)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14
{
  id v38 = a3;
  id v17 = a4;
  id v18 = (ICNoteBrowseViewController *)a5;
  id v19 = a12;
  id v20 = a13;
  id v21 = a14;
  objc_opt_class();
  char v22 = [v38 allObjects];
  id v23 = [v22 firstObject];
  double v24 = ICDynamicCast();

  objc_opt_class();
  double v25 = [(ICViewControllerManager *)self existingManagedObjectWithObjectID:v24];
  int64_t v26 = ICDynamicCast();

  if (!v18)
  {
    if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1
      && ![(ICViewControllerManager *)self hasCompactWidth])
    {
      unsigned __int8 v27 = [v26 ancestorFolderObjectIDs];
      uint64_t v28 = [v27 reverseObjectEnumerator];
      double v29 = [v28 allObjects];

      if ([v29 count])
      {
        [(ICViewControllerManager *)self setNoteBrowserNavigationStackWithFolderObjectIDs:v29];
        id v18 = [[ICNoteBrowseViewController alloc] initWithViewMode:[(ICViewControllerManager *)self noteContainerViewMode] viewControllerManager:self];

        if (v18) {
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    id v36 = v26;
    if (a6)
    {
      __int16 v30 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    }
    else
    {
      __int16 v30 = [[ICNoteBrowseViewController alloc] initWithViewMode:[(ICViewControllerManager *)self noteContainerViewMode] viewControllerManager:self];
    }
    id v18 = v30;
    BOOL v31 = [(ICNoteBrowseViewController *)v30 navigationItem];
    uint64_t v32 = [v31 searchController];
    unsigned int v33 = [v32 isActive];

    if (v33)
    {
      id v34 = [(ICNoteBrowseViewController *)v18 navigationItem];
      BOOL v35 = [v34 searchController];
      [v35 setActive:0];
    }
    [(ICNoteBrowseViewController *)v18 setEditing:0];
    int64_t v26 = v36;
  }
LABEL_14:
  [(ICViewControllerManager *)self setCurrentNoteBrowseViewController:v18 animated:a9 ensurePresented:a10 containerIdentifiers:v38 excludingIdentifiers:v17 ensureSelectedNote:a11 keepEditorShowing:v19 dataIndexedBlock:v20 dataRenderedBlock:v21];
}

- (void)addSelectedHashtagsToNewNote:(id)a3
{
  id v4 = a3;
  id v5 = [v4 managedObjectContext];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
  id v7 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        BOOL v11 = ICDynamicCast();
        if (objc_msgSend(v11, "ic_isHashtagType"))
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100049340;
          v13[3] = &unk_100625A00;
          id v12 = v5;
          id v14 = v12;
          id v15 = v11;
          id v16 = v4;
          [v12 performBlockAndWait:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)updateNoteEditorBezelsIfNeededWithDisplayMode:(int64_t)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  if ((id)[(ICViewControllerManager *)self behavior] == (id)3)
  {
    int64_t v7 = [(ICViewControllerManager *)self noteContainerViewMode];
    int64_t v8 = [(ICViewControllerManager *)self noteContainerViewMode];
    BOOL v10 = a3 == 1 || v8 == 1;
    if ([(ICViewControllerManager *)self isInHTMLEditorMode])
    {
      id v11 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
      [v11 updateContentViewBezelsStandalone:a3 == 1 needsAdditionalBottomMargin:v7 == 0 needsAdditionalLeadingMargin:v10];
    }
    else
    {
      id v11 = [(ICViewControllerManager *)self noteEditorViewController];
      [v11 updateContentViewBezelsStandalone:a3 == 1 needsAdditionalBottomMargin:v7 == 0 needsAdditionalLeadingMargin:v10 force:v4];
    }
  }
}

- (void)clearRecentSelections
{
  id v2 = [(ICViewControllerManager *)self selectionStateController];
  [v2 clear];
}

- (void)noteLockManagerWillToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v10 note];
  int64_t v7 = [v6 objectID];
  int64_t v8 = [(ICViewControllerManager *)self selectedNoteObjectID];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9) {
    [(ICViewControllerManager *)self setIsSelectedNoteTogglingLock:1];
  }
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(ICViewControllerManager *)self selectedNoteObjectID];
  int64_t v7 = [v14 note];
  int64_t v8 = [v7 objectID];
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [v14 updatedNote];

    if (v10)
    {
      id v11 = [v14 updatedNote];
      id v12 = [v11 objectID];
      LOWORD(v13) = 256;
      -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v12, 0, 0, 0, 0, 1, v13);
    }
    [(ICViewControllerManager *)self setIsSelectedNoteTogglingLock:0];
  }
}

- (void)collectionViewWillRenameTag:(id)a3
{
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v4 = [(ICViewControllerManager *)self tagSelection];
    [v4 setAutomaticallyRemoveDeletedTags:0];
  }

  [(ICViewControllerManager *)self setIsTagBeingRenamed:1];
}

- (void)collectionViewWillDeleteTags:(id)a3
{
}

- (void)tagDidRename:(id)a3
{
  id v4 = a3;
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v5 = [(ICViewControllerManager *)self tagSelection];
    [v5 setAutomaticallyRemoveDeletedTags:1];
  }
  id v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v8 = [(ICViewControllerManager *)self tagSelection];
    id v9 = [v8 copy];

    id v10 = [v4 object];
    id v11 = [v4 userInfo];
    id v12 = +[NSNotification ICTagCollectionViewRenameTagOriginalTagObjectIDKey];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    id v14 = [v9 objectIDs];
    LODWORD(v12) = [v14 containsObject:v13];

    if (v12)
    {
      id v15 = [v9 excludedObjectIDs];
      id v16 = [v15 containsObject:v13];

      [v9 removeObjectID:v13 fromExcluded:v16];
      [v9 addObjectID:v10 toExcluded:v16];
      if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
      {
        if ([(ICViewControllerManager *)self isAutomaticallySelectingNotes]) {
          goto LABEL_8;
        }
        long long v17 = [(ICViewControllerManager *)self compactNavigationController];
        long long v18 = [v17 topViewController];
        long long v19 = [(ICViewControllerManager *)self rootNoteBrowseViewController];

        if (v18 == v19) {
LABEL_8:
        }
          [(ICViewControllerManager *)self selectTagSelection:v9];
      }
      else
      {
        long long v20 = _NSConcreteStackBlock;
        uint64_t v21 = 3221225472;
        char v22 = sub_1000499E4;
        id v23 = &unk_100625860;
        double v24 = self;
        id v25 = v9;
        performBlockOnMainThread();
      }
    }
  }
  -[ICViewControllerManager setIsTagBeingRenamed:](self, "setIsTagBeingRenamed:", 0, v20, v21, v22, v23, v24);
}

- (void)tagsDidDelete:(id)a3
{
  id v4 = a3;
  [(ICViewControllerManager *)self setIsTagBeingDeleted:0];
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    id v5 = [v4 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int64_t v7 = [v4 object];
      unsigned int v8 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
      id v9 = [(ICViewControllerManager *)self tagSelection];
      id v10 = v9;
      if (v8)
      {
        id v11 = +[NSSet setWithArray:v7];
        [v10 removeObjectIDs:v11];

        [(ICViewControllerManager *)self selectTagSelection:v10];
      }
      else
      {
        id v12 = [v9 copy];

        uint64_t v13 = +[NSSet setWithArray:v7];
        [v12 removeObjectIDs:v13];

        id v14 = v12;
        performBlockOnMainThread();
      }
    }
  }
}

- (void)migrationStateDidChange:(id)a3
{
  id v4 = [(ICViewControllerManager *)self folderListViewController];
  id v5 = [v4 folderDataSource];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100049CD4;
  v6[3] = &unk_100625AF0;
  void v6[4] = self;
  [v5 reloadDataAnimated:1 dataIndexedBlock:&stru_1006260F8 dataRenderedBlock:v6];
}

- (void)accountsDidChange:(id)a3
{
  if ([(ICViewControllerManager *)self isAuxiliary])
  {
    id v4 = [(ICViewControllerManager *)self noteEditorViewController];
    id v5 = [v4 note];
    id v6 = [v5 folder];
    int64_t v7 = [v6 account];
    unsigned int v8 = [v7 isDeleted];

    if (v8)
    {
      [(ICViewControllerManager *)self closeAuxiliaryWindowAnimated:1];
    }
  }
  else
  {
    id v9 = [(ICViewControllerManager *)self folderListViewController];
    id v10 = [v9 folderDataSource];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100049E20;
    v11[3] = &unk_100625AF0;
    void v11[4] = self;
    [v10 reloadDataAnimated:1 dataIndexedBlock:&stru_100626118 dataRenderedBlock:v11];
  }
}

- (void)folderWasCreated:(id)a3
{
  id v4 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  unsigned __int8 v5 = [v4 isCollapsed];

  if ((v5 & 1) == 0)
  {
    id v6 = [(ICViewControllerManager *)self mainSplitViewController];
    [v6 showColumn:0];
  }
}

- (void)willDismissSearch:(id)a3
{
  id v4 = [a3 object];
  unsigned __int8 v5 = [(ICViewControllerManager *)self currentSearchBarViewController];

  if (v4 == v5)
  {
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
    {
      id v6 = [(ICViewControllerManager *)self selectedSearchResult];

      if (v6)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10004A250;
        block[3] = &unk_100625AF0;
        void block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        return;
      }
    }
    int64_t v7 = [(ICViewControllerManager *)self noteEditorViewController];
    [v7 highlightSearchMatchesForRegexFinder:0];

    unsigned int v8 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
    if (([v8 isCollapsed] & 1) == 0)
    {
      unsigned int v9 = [(ICViewControllerManager *)self isSearchActiveWithQuery];

      if (!v9) {
        goto LABEL_10;
      }
      uint64_t v10 = [(ICViewControllerManager *)self selectedSearchResult];
      if (!v10) {
        goto LABEL_10;
      }
      id v11 = (void *)v10;
      unsigned __int8 v12 = [(ICViewControllerManager *)self isTagSelected];

      if (v12) {
        goto LABEL_10;
      }
      objc_opt_class();
      uint64_t v13 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
      unsigned int v8 = ICDynamicCast();

      if (objc_msgSend(v8, "ic_isModernFolderType"))
      {
        id v14 = [(ICViewControllerManager *)self modernManagedObjectContext];
        id v15 = [v14 ic_existingObjectWithID:v8];

        id v16 = [(ICViewControllerManager *)self folderListViewController];
        long long v17 = [v16 folderDataSource];
        long long v18 = [v15 ancestorFolderObjectIDs];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10004A294;
        v20[3] = &unk_100625860;
        void v20[4] = self;
        id v21 = v15;
        id v19 = v15;
        [v17 expandItemsWithIdentifiers:v18 completion:v20];
      }
      if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
        [(ICViewControllerManager *)self setSelectedSearchResult:0];
      }
    }

LABEL_10:
    [(ICViewControllerManager *)self setIsSearchActiveWithQuery:0];
  }
}

- (void)searchQueryDidChange:(id)a3
{
  id v10 = a3;
  id v4 = [v10 object];
  unsigned __int8 v5 = [(ICViewControllerManager *)self currentSearchBarViewController];
  id v6 = [v5 noteSearchViewController];

  int64_t v7 = v10;
  if (v4 == v6)
  {
    unsigned int v8 = [v10 userInfo];
    unsigned int v9 = [v8 objectForKeyedSubscript:@"ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey"];

    if ([v9 BOOLValue]
      && ![(ICViewControllerManager *)self isSearchActiveWithQuery])
    {
      [(ICViewControllerManager *)self setIsSearchActiveWithQuery:1];
    }

    int64_t v7 = v10;
  }
}

- (void)didStartEditing:(id)a3
{
  id v20 = a3;
  unsigned __int8 v4 = [(ICViewControllerManager *)self hasCompactWidth];
  unsigned __int8 v5 = v20;
  if ((v4 & 1) == 0)
  {
    id v6 = [v20 object];
    int64_t v7 = [(ICViewControllerManager *)self folderListViewController];

    if (v6 != v7)
    {
      unsigned int v8 = [(ICViewControllerManager *)self folderListViewController];
      [v8 setEditing:0 animated:1];
    }
    unsigned int v9 = [v20 object];
    id v10 = [(ICViewControllerManager *)self rootNoteBrowseViewController];

    unsigned __int8 v5 = v20;
    if (v9 != v10)
    {
      id v11 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
      [v11 setEditing:0 animated:1];

      unsigned __int8 v5 = v20;
    }
  }
  unsigned __int8 v12 = [v5 object];
  uint64_t v13 = [(ICViewControllerManager *)self noteEditorViewController];
  if (v12 == (void *)v13)
  {
  }
  else
  {
    id v14 = (void *)v13;
    id v15 = [(ICViewControllerManager *)self noteEditorViewController];
    unsigned __int8 v16 = [v15 isEditingOnSystemPaper];

    if (v16) {
      goto LABEL_11;
    }
    unsigned __int8 v12 = [(ICViewControllerManager *)self noteEditorViewController];
    [v12 setEditing:0 animated:1];
  }

LABEL_11:
  long long v17 = [v20 object];
  long long v18 = [(ICViewControllerManager *)self legacyNoteEditorViewController];

  if (v17 != v18)
  {
    id v19 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
    [v19 setEditing:0 animated:1];
  }
}

- (void)editorWillRecoverNote:(id)a3
{
}

- (void)editorDidRecoverNote:(id)a3
{
}

- (void)validateState
{
  objc_opt_class();
  uint64_t v3 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  ICDynamicCast();
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  if (!v36) {
    goto LABEL_7;
  }
  unsigned __int8 v4 = [(ICViewControllerManager *)self existingManagedObjectWithObjectID:v36];
  objc_opt_class();
  unsigned __int8 v5 = ICDynamicCast();
  if (v5
    || (objc_opt_class(),
        ICDynamicCast(),
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 account],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    int64_t v7 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    [v7 refreshObject:v5 mergeChanges:1];
  }
  unsigned __int8 v8 = [v5 didChooseToMigrate];
  if (v4)
  {
    char v9 = [v4 isDeleted] | v8;

    if ((v9 & 1) == 0)
    {
LABEL_7:
      id v10 = [(ICViewControllerManager *)self selectedNoteObjectID];

      if (!v10
        || ([(ICViewControllerManager *)self selectedNoteObjectID],
            id v11 = objc_claimAutoreleasedReturnValue(),
            -[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v11), v12 = objc_claimAutoreleasedReturnValue(), v11, v12)&& (unsigned __int8 v13 = [v12 isDeleted], v12, (v13 & 1) == 0))
      {
        id v14 = [(ICViewControllerManager *)self focusedNoteObjectID];

        if (!v14
          || ([(ICViewControllerManager *)self focusedNoteObjectID],
              id v15 = objc_claimAutoreleasedReturnValue(),
              -[ICViewControllerManager existingManagedObjectWithObjectID:](self, "existingManagedObjectWithObjectID:", v15), unsigned __int8 v16 = objc_claimAutoreleasedReturnValue(), v15, v16)&& (v17 = [v16 isDeleted], v16, (v17 & 1) == 0))
        {
          long long v18 = [(ICViewControllerManager *)self selectedInvitationObjectID];

          if (!v18) {
            goto LABEL_23;
          }
          id v19 = [(ICViewControllerManager *)self selectedInvitationObjectID];
          id v20 = [(ICViewControllerManager *)self existingManagedObjectWithObjectID:v19];

          if (v20)
          {
            unsigned int v21 = [v20 isDeleted];

            if (!v21) {
              goto LABEL_23;
            }
          }
        }
      }
    }
  }
  else
  {
  }
  char v22 = [(ICViewControllerManager *)self folderListViewController];
  id v23 = [v22 dataSource];
  double v24 = [v23 firstRelevantItemIdentifier];

  id v25 = [(ICViewControllerManager *)self existingManagedObjectWithObjectID:v24];
  int64_t v26 = v25;
  if (v25 && ([v25 isDeleted] & 1) == 0)
  {
    id v34 = +[NSSet ic_setFromNonNilObject:v24];
    BOOL v35 = +[NSSet set];
    [(ICViewControllerManager *)self selectContainerWithIdentifiers:v34 excludingIdentifiers:v35 usingRootViewController:1 deferUntilDataLoaded:0 dismissOverlayContent:0 animated:1];
  }
  else
  {

    unsigned __int8 v27 = [(ICViewControllerManager *)self primaryNavigationController];
    id v28 = [v27 popToRootViewControllerAnimated:1];

    double v29 = [(ICViewControllerManager *)self supplementaryNavigationController];
    id v30 = [v29 popToRootViewControllerAnimated:1];

    BOOL v31 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [v31 setNoteContainer:0];

    uint64_t v32 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [v32 setNoteCollection:0];

    unsigned int v33 = [(ICViewControllerManager *)self noteEditorViewController];
    [v33 setNote:0];

    double v24 = objc_alloc_init(ICWindowStateArchive);
    [(ICWindowStateArchive *)v24 setIsPrimaryContentVisible:[(ICViewControllerManager *)self isPrimaryContentVisible]];
    [(ICWindowStateArchive *)v24 setIsSupplementaryContentVisible:[(ICViewControllerManager *)self isSupplementaryContentVisible]];
    [(ICViewControllerManager *)self applyStateRestoreArchive:v24 completion:0];
  }

LABEL_23:
}

- (id)defaultContainerObjectIDForNoteWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  unsigned int v33 = sub_10003A7F0;
  id v34 = sub_10003A800;
  id v35 = 0;
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class()))
  {
    unsigned __int8 v5 = [(ICViewControllerManager *)self modernManagedObjectContext];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004AC98;
    v27[3] = &unk_100625CA0;
    v27[4] = self;
    id v28 = v4;
    double v29 = &v30;
    [v5 performBlockAndWait:v27];

    id v6 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class()))
  {
    int64_t v7 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    void v24[2] = sub_10004AD94;
    v24[3] = &unk_100625CA0;
    void v24[4] = self;
    id v25 = v4;
    int64_t v26 = &v30;
    [v7 performBlockAndWait:v24];

    id v6 = v25;
    goto LABEL_5;
  }
  if (!v4)
  {
    id v10 = +[ICNoteContext sharedContext];
    id v11 = [v10 managedObjectContext];

    long long v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_10004AE88;
    unsigned int v21 = &unk_100625C78;
    id v12 = v11;
    id v22 = v12;
    id v23 = &v30;
    [v12 performBlockAndWait:&v18];
    if (!v31[5])
    {
      unsigned __int8 v13 = +[NotesApp sharedNotesApp];
      id v14 = [v13 noteContext];
      id v15 = [v14 defaultStoreForNewNote];
      uint64_t v16 = [v15 objectID];
      unsigned __int8 v17 = (void *)v31[5];
      v31[5] = v16;
    }
  }
LABEL_6:
  id v8 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v8;
}

- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)dismissAnyPresentedViewControllerAnimated:(BOOL)a3 forShowNote:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v16 = (void (**)(void))a5;
  id v8 = [(ICViewControllerManager *)self mainSplitViewController];
  char v9 = [v8 presentedViewController];

  if (!v9) {
    goto LABEL_13;
  }
  if (v5)
  {
    objc_opt_class();
    id v10 = ICDynamicCast();
    id v11 = v10;
    unsigned int v12 = v10 ? [v10 shouldDismissWhenShowingNote] : 1;
  }
  else
  {
    unsigned int v12 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v12)
  {
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v13 = [(ICViewControllerManager *)self mainSplitViewController];
      id v14 = [v13 presentedViewController];

      [v14 prepareForDismissal];
    }
    id v15 = [(ICViewControllerManager *)self mainSplitViewController];
    [v15 dismissViewControllerAnimated:v6 completion:v16];
  }
  else
  {
LABEL_13:
    if (v16) {
      v16[2]();
    }
  }
  [(ICViewControllerManager *)self setCurrentAttachmentPresenter:0];
}

- (id)containerObjectIDForNewNoteWithApproach:(int64_t)a3
{
  char v4 = 0;
  if ((unint64_t)a3 > 0x14)
  {
    char v5 = 0;
  }
  else
  {
    if (((1 << a3) & 0x1F9F00) != 0)
    {
      char v4 = 1;
LABEL_4:
      char v5 = 1;
      goto LABEL_9;
    }
    if (((1 << a3) & 0xF8) != 0)
    {
      BOOL v6 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1004D48A8();
      }

      char v4 = 0;
      char v5 = 0;
    }
    else
    {
      char v5 = 0;
      if (((1 << a3) & 0x2002) != 0) {
        goto LABEL_4;
      }
    }
  }
LABEL_9:
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_10003A7F0;
  uint64_t v41 = sub_10003A800;
  id v42 = 0;
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    int64_t v7 = [(ICViewControllerManager *)self tagSelection];
    id v8 = [(ICViewControllerManager *)self modernManagedObjectContext];
    char v9 = +[ICDefaultAccountUtilities accountToAddNewNoteWithTagSelection:v7 modernContext:v8];

    char v4 = 1;
  }
  else
  {
    char v9 = 0;
  }
  objc_opt_class();
  id v10 = [(ICViewControllerManager *)self selectedContainerItemID];
  id v11 = ICDynamicCast();

  objc_opt_class();
  unsigned int v12 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
  unsigned __int8 v13 = ICDynamicCast();

  if (v4)
  {
    int v14 = 1;
  }
  else if (v11 {
         || ([(ICViewControllerManager *)self selectedContainerItemID],
  }
             (id v15 = objc_claimAutoreleasedReturnValue()) == 0)
         && v13
         || ((unsigned int v16 = [(ICViewControllerManager *)self isSearchActiveWithQuery], v13)
           ? (unsigned int v17 = v16)
           : (unsigned int v17 = 0),
             v15,
             v17 == 1))
  {
    long long v18 = [v11 accountObjectID];
    if (v18)
    {
      uint64_t v19 = [(ICViewControllerManager *)self modernManagedObjectContext];
      id v20 = [v11 accountObjectID];
      uint64_t v21 = [v19 objectWithID:v20];

      char v9 = v19;
    }
    else
    {
      uint64_t v21 = 0;
    }

    int v14 = 1;
    char v9 = (void *)v21;
  }
  else
  {
    int v14 = 0;
  }
  id v22 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
  if (v22) {
    char v23 = v5;
  }
  else {
    char v23 = 1;
  }

  if (v23)
  {
    if (!v9)
    {
      if (!v14)
      {
        double v24 = +[NotesApp sharedNotesApp];
        id v25 = [v24 noteContext];
        char v9 = +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:v25];

LABEL_35:
        goto LABEL_36;
      }
LABEL_34:
      double v24 = [(ICViewControllerManager *)self modernManagedObjectContext];
      char v9 = +[ICAccount defaultAccountInContext:v24];
      goto LABEL_35;
    }
LABEL_36:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = [v9 defaultFolder];
      uint64_t v27 = [v26 objectID];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_42;
      }
      id v26 = [v9 defaultStore];
      uint64_t v27 = [v26 objectID];
    }
    id v28 = (void *)v38[5];
    v38[5] = v27;
    goto LABEL_41;
  }
  if (v14)
  {
    if (!v9) {
      goto LABEL_34;
    }
    goto LABEL_36;
  }
  objc_opt_class();
  BOOL v31 = [(ICViewControllerManager *)self mostRecentNonSearchContainerItemID];
  uint64_t v32 = ICDynamicCast();
  unsigned int v33 = (void *)v38[5];
  v38[5] = v32;

  if (objc_msgSend((id)v38[5], "ic_isModernFolderType"))
  {
    [(ICViewControllerManager *)self modernManagedObjectContext];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10004B578;
    v34[3] = &unk_100625C78;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v26;
    id v36 = &v37;
    [v26 performBlockAndWait:v34];
    id v28 = v35;
LABEL_41:
  }
LABEL_42:
  id v29 = (id)v38[5];

  _Block_object_dispose(&v37, 8);

  return v29;
}

- (id)createNewNoteInContainerWithObjectID:(id)a3
{
  return [(ICViewControllerManager *)self createNewNoteInContainerWithObjectID:a3 isSystemPaper:0];
}

- (id)createNewNoteInContainerWithObjectID:(id)a3 isSystemPaper:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    int64_t v7 = [(ICViewControllerManager *)self modernManagedObjectContext];
    uint64_t v8 = [v7 objectWithID:v6];

    if ([(id)v8 folderType] != 1)
    {
      uint64_t v15 = 0;
      goto LABEL_18;
    }
    if ([(id)v8 folderType] == 1)
    {
      char v9 = [(id)v8 account];
      if (!v9)
      {
        id v10 = +[ICNoteContext sharedContext];
        id v11 = [v10 managedObjectContext];
        char v9 = +[ICAccount defaultAccountInContext:v11];
      }
      uint64_t v12 = [v9 defaultFolder];

      uint64_t v8 = v12;
    }
    unsigned __int8 v13 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    [v13 setNoteContainer:v8];
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    int v14 = [(ICViewControllerManager *)self modernManagedObjectContext];
    unsigned __int8 v13 = [v14 objectWithID:v6];

    uint64_t v8 = [v13 defaultFolder];
LABEL_10:
    uint64_t v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    unsigned __int8 v13 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    uint64_t v16 = [v13 objectWithID:v6];
LABEL_16:
    uint64_t v15 = v16;
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
  {
    unsigned int v17 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    unsigned __int8 v13 = [v17 objectWithID:v6];

    uint64_t v16 = [v13 defaultStore];
    goto LABEL_16;
  }
  uint64_t v15 = 0;
  uint64_t v8 = 0;
LABEL_18:
  if (!(v8 | v15))
  {
    long long v18 = [(ICViewControllerManager *)self modernManagedObjectContext];
    uint64_t v19 = +[ICAccount defaultAccountInContext:v18];
    uint64_t v8 = [v19 defaultFolder];
  }
  if (!v8)
  {
    if (v15)
    {
      id v29 = +[NotesApp sharedNotesApp];
      uint64_t v30 = [v29 noteContext];
      BOOL v31 = [v30 newlyAddedNote];

      uint64_t v32 = +[NSDate date];
      [v31 setCreationDate:v32];

      unsigned int v33 = +[NSDate ic_modificationDateForNoteBeingEdited];
      [v31 setModificationDate:v33];

      [v31 setContent:&stru_10063F3D8];
      [v31 setTitle:0];
      [v31 setStore:v15];
      id v34 = v31;
      id v35 = [v34 managedObjectContext];
      [v35 ic_save];

      id v36 = [(ICViewControllerManager *)self eventReporter];
      [v36 submitNoteCreateEventForHTMLNote:v34];

      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (![(id)v8 canMoveAddOrDeleteContents])
  {
LABEL_28:
    id v34 = 0;
    goto LABEL_36;
  }
  id v20 = +[ICNote newEmptyNoteInFolder:v8];
  objc_opt_class();
  uint64_t v21 = [(ICViewControllerManager *)self selectedNoteBrowseContainerItemID];
  id v22 = ICDynamicCast();

  char v23 = [v22 type];
  unsigned int v24 = [v23 isEqual:ICVirtualSmartFolderItemIdentifierTypeMathNotes];

  id v25 = [(ICViewControllerManager *)self hostApplicationIdentifier];
  id v26 = [v25 length];

  if (v26)
  {
    uint64_t v27 = [(ICViewControllerManager *)self hostApplicationIdentifier];
    id v28 = [v27 copy];
    [v20 setHostApplicationIdentifier:v28];

    if ([v20 isMathNote]) {
      [v20 setCalculatePreviewBehavior:2];
    }
    [v20 updateUserSpecificChangeCountWithReason:@"Set host application identifier"];
  }
  else if (v24)
  {
    [v20 setCalculatePreviewBehavior:2];
    [v20 markAsMathNoteIfNeeded:1];
  }
  [(ICViewControllerManager *)self updateNewNoteForSelectedTags:v20 folder:v8];
  if (v4)
  {
    uint64_t v37 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_1004D48E8(v20);
    }

    [v20 markAsSystemPaperIfNeeded:1];
  }
  id v38 = [(ICViewControllerManager *)self eventReporter];
  [v38 submitNoteCreateEventForModernNote:v20];

  id v34 = v20;
  [v34 updateChangeCountWithReason:@"Created note"];
  uint64_t v39 = [v34 managedObjectContext];

  [v39 ic_save];
LABEL_36:

  return v34;
}

- (void)updateNewNoteForSelectedTags:(id)a3 folder:(id)a4
{
  id v5 = a3;
  if ([(ICViewControllerManager *)self isTagSelected]) {
    [(ICViewControllerManager *)self addSelectedHashtagsToNewNote:v5];
  }
}

- (BOOL)isTagSelected
{
  id v2 = [(ICViewControllerManager *)self tagSelection];
  unsigned __int8 v3 = [v2 isNonEmpty];

  return v3;
}

- (id)showNewNoteStartEditing:(BOOL)a3 inContainerWithObjectID:(id)a4 isSystemPaper:(BOOL)a5 showInkPicker:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = [(ICViewControllerManager *)self currentSearchBarViewController];
  unsigned int v17 = [v16 noteSearchViewController];
  [v17 cancelSearch];

  long long v18 = [(ICViewControllerManager *)self createNewNoteInContainerWithObjectID:v14 isSystemPaper:v11];
  if ([v18 isModernNote])
  {
    uint64_t v19 = [(ICViewControllerManager *)self noteEditorViewController];
    objc_opt_class();
    id v20 = ICDynamicCast();
    [v19 setupLinedPaperOnNewNote:v20 willStartEditing:v12];
  }
  uint64_t v21 = [v18 objectID];

  if (v21)
  {
    if (v12)
    {
      id v22 = [(ICViewControllerManager *)self folderListViewController];
      unsigned int v23 = [v22 isEditing];

      if (v23)
      {
        unsigned int v24 = [(ICViewControllerManager *)self folderListViewController];
        [v24 setEditing:0 animated:v9];
      }
      id v25 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
      unsigned int v26 = [v25 isEditing];

      if (v26)
      {
        uint64_t v27 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
        [v27 setEditing:0 animated:v9];
      }
    }
    objc_initWeak(&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10004BF1C;
    v35[3] = &unk_100626140;
    objc_copyWeak(&v38, &location);
    id v36 = v18;
    BOOL v39 = v12;
    BOOL v40 = a6;
    BOOL v41 = v9;
    id v37 = v15;
    id v28 = objc_retainBlock(v35);
    if ([(ICViewControllerManager *)self noteContainerViewMode])
    {
      id v29 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
      uint64_t v30 = [v29 noteDataSource];
      if (v30)
      {
        unsigned __int8 v31 = +[ICFeatureFlags uniquelyiPadFluidTransitionsEnabled];

        if (v31)
        {
          uint64_t v32 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
          unsigned int v33 = [v32 noteDataSource];
          [v33 reloadDataAnimated:1 dataIndexedBlock:0 dataRenderedBlock:v28];

LABEL_15:
          objc_destroyWeak(&v38);
          objc_destroyWeak(&location);
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    ((void (*)(void *))v28[2])(v28);
    goto LABEL_15;
  }
LABEL_16:

  return v18;
}

- (void)setNoteEditorAnimated:(BOOL)a3 ensurePresented:(BOOL)a4 startEditing:(BOOL)a5 showLegacy:(BOOL)a6 showLatestUpdatesIfAvailable:(BOOL)a7
{
  [(ICViewControllerManager *)self stopEditing];
  if (a6) {
    [(ICViewControllerManager *)self legacyNoteEditorViewController];
  }
  else {
    [(ICViewControllerManager *)self noteEditorViewController];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C0F0;
  v17[3] = &unk_1006261B8;
  BOOL v19 = a4;
  void v17[4] = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v20 = a3;
  BOOL v21 = a5;
  BOOL v22 = a6;
  BOOL v23 = a7;
  id v13 = v18;
  id v14 = objc_retainBlock(v17);
  id v15 = [(ICViewControllerManager *)self mainSplitViewController];
  if (v15)
  {
    uint64_t v16 = [(ICViewControllerManager *)self mainSplitViewController];
    [v16 ic_performBlockAfterActiveTransition:v14];
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
  }
}

- (BOOL)validateStateRestoreArchive:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    int64_t v7 = [v4 currentObjectIDURL];
    [v6 ic_addNonNilObject:v7];

    uint64_t v8 = [v4 currentNoteObjectIDURL];
    [v6 ic_addNonNilObject:v8];

    BOOL v9 = [v4 currentContainerObjectIDURLs];
    [v6 ic_addObjectsFromNonNilArray:v9];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004CAAC;
    v11[3] = &unk_1006261E0;
    void v11[4] = self;
    BOOL v5 = [v6 indexOfObjectPassingTest:v11] == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)managedObjectIDFromURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICViewControllerManager *)self modernManagedObjectContext];
  id v6 = [v5 persistentStoreCoordinator];

  uint64_t v7 = [v6 ic_managedObjectIDForURIRepresentation:v4];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
  }
  else
  {
    BOOL v9 = [(ICViewControllerManager *)self legacyManagedObjectContext];
    id v10 = [v9 persistentStoreCoordinator];

    uint64_t v8 = [v10 ic_managedObjectIDForURIRepresentation:v4];
    id v6 = v10;
  }

  return v8;
}

- (id)existingManagedObjectWithObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ICViewControllerManager *)self modernManagedObjectContext];
    id v6 = [v5 existingObjectWithID:v4 error:0];

    if (!v6)
    {
      uint64_t v7 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      id v6 = [v7 existingObjectWithID:v4 error:0];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ICWindowStateArchive)windowStateArchive
{
  unsigned __int8 v3 = objc_alloc_init(ICWindowStateArchive);
  id v4 = [(ICViewControllerManager *)self window];
  BOOL v5 = [v4 windowIdentifier];
  [(ICWindowStateArchive *)v3 setWindowIdentifier:v5];

  [(ICWindowStateArchive *)v3 setAttachmentBrowserOpen:[(ICViewControllerManager *)self isAttachmentBrowserVisible]];
  id v6 = +[ICExpansionState sharedExpansionState];
  uint64_t v7 = [v6 archiveDictionary];
  [(ICWindowStateArchive *)v3 setExpansionState:v7];

  [(ICWindowStateArchive *)v3 setIsAuxiliaryWindow:[(ICViewControllerManager *)self isAuxiliary]];
  [(ICWindowStateArchive *)v3 setCurrentNoteContainerViewMode:[(ICViewControllerManager *)self noteContainerViewMode]];
  [(ICWindowStateArchive *)v3 setPreferredNoteContainerViewMode:[(ICViewControllerManager *)self preferredNoteContainerViewMode]];
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    uint64_t v8 = [(ICViewControllerManager *)self selectionStateController];
    [v8 setActivityStreamViewMode:[self activityStreamViewMode]];

    BOOL v9 = [(ICViewControllerManager *)self noteEditorViewController];
    if (objc_msgSend(v9, "ic_isViewVisible"))
    {
      id v10 = [(ICViewControllerManager *)self noteEditorViewController];
      BOOL v11 = [v10 note];
      if (v11)
      {
        BOOL v12 = [(ICViewControllerManager *)self noteEditorViewController];
        unsigned int v13 = [v12 isEditingOnSecureScreen];

        if (!v13)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
        BOOL v11 = objc_alloc_init(_TtC11MobileNotes21ICSelectionStateModel);
        BOOL v9 = [(ICViewControllerManager *)self noteEditorViewController];
        id v10 = [v9 note];
        id v14 = [v10 objectID];
        [(ICSelectionStateModel *)v11 setSelectedNoteObjectID:v14];
      }
    }
    else
    {
      BOOL v11 = 0;
    }

LABEL_11:
    BOOL v19 = [(ICViewControllerManager *)self selectionStateController];
    BOOL v20 = [v19 dataRepresentationWithEditorModel:v11];
    [(ICWindowStateArchive *)v3 setSelectionState:v20];

    BOOL v21 = [(ICViewControllerManager *)self noteEditorViewController];
    BOOL v22 = [v21 currentScrollState];
    [(ICWindowStateArchive *)v3 setScrollState:v22];
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  id v15 = [(ICViewControllerManager *)self activityStreamSelection];
  [(ICWindowStateArchive *)v3 setCurrentActivityStreamSelection:v15];

  [(ICWindowStateArchive *)v3 setCurrentActivityStreamViewMode:[(ICViewControllerManager *)self activityStreamViewMode]];
  uint64_t v16 = [(ICViewControllerManager *)self selectedNoteObjectID];

  if (v16)
  {
    unsigned int v17 = [(ICViewControllerManager *)self selectedNoteObjectID];
    id v18 = [v17 URIRepresentation];
    [(ICWindowStateArchive *)v3 setCurrentNoteObjectIDURL:v18];
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  BOOL v23 = [(ICViewControllerManager *)self selectedInvitationObjectID];

  if (v23)
  {
    unsigned int v17 = [(ICViewControllerManager *)self selectedInvitationObjectID];
    id v18 = [v17 URIRepresentation];
    [(ICWindowStateArchive *)v3 setCurrentInvitationObjectIDURL:v18];
    goto LABEL_14;
  }
  unsigned int v17 = [(ICViewControllerManager *)self noteEditorViewController];
  if (!objc_msgSend(v17, "ic_isViewVisible")) {
    goto LABEL_15;
  }
  uint64_t v49 = [(ICViewControllerManager *)self noteEditorViewController];
  BOOL v50 = [v49 note];

  if (v50)
  {
    unsigned int v17 = [(ICViewControllerManager *)self noteEditorViewController];
    id v18 = [v17 note];
    int64_t v51 = [v18 objectID];
    uint64_t v52 = [v51 URIRepresentation];
    [(ICWindowStateArchive *)v3 setCurrentNoteObjectIDURL:v52];

    goto LABEL_14;
  }
LABEL_16:
  if ([(ICViewControllerManager *)self isTagSelected])
  {
    BOOL v11 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
    BOOL v21 = [(ICSelectionStateModel *)v11 allObjects];
    BOOL v22 = [v21 ic_compactMap:&stru_100626200];
    [(ICWindowStateArchive *)v3 setCurrentTagIdentifiers:v22];
    goto LABEL_20;
  }
  unsigned int v24 = [(ICViewControllerManager *)self selectedContainerItemID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    unsigned int v26 = [(ICViewControllerManager *)self selectedContainerItemID];
    ICCheckedDynamicCast();
    BOOL v11 = (_TtC11MobileNotes21ICSelectionStateModel *)objc_claimAutoreleasedReturnValue();

    uint64_t v27 = [(ICSelectionStateModel *)v11 type];
    [(ICWindowStateArchive *)v3 setCurrentVirtualSmartFolderType:v27];

    BOOL v21 = [(ICSelectionStateModel *)v11 accountObjectID];
    BOOL v22 = [v21 URIRepresentation];
    [(ICWindowStateArchive *)v3 setCurrentVirtualSmartFolderAccountObjectIDURL:v22];
    goto LABEL_20;
  }
  uint64_t v48 = [(ICViewControllerManager *)self selectedContainerObjectIDs];

  if (v48)
  {
    BOOL v11 = [(ICViewControllerManager *)self selectedContainerObjectIDs];
    BOOL v21 = [(ICSelectionStateModel *)v11 ic_map:&stru_100626220];
    [(ICWindowStateArchive *)v3 setCurrentContainerObjectIDURLs:v21];
    goto LABEL_21;
  }
LABEL_22:
  id v28 = +[NSDate date];
  [(ICWindowStateArchive *)v3 setCurrentNoteLastViewedDate:v28];

  id v29 = [(ICViewControllerManager *)self visibleObjectIDsForContainerObjectID];
  uint64_t v30 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v29 count]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v31 = v29;
  id v32 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v54;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v37 = [v31 objectForKeyedSubscript:v36];
        id v38 = [v37 firstObject];

        BOOL v39 = [v38 URIRepresentation];
        BOOL v40 = [v36 URIRepresentation];
        [v30 setObject:v39 forKeyedSubscript:v40];
      }
      id v33 = [v31 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v33);
  }

  [(ICWindowStateArchive *)v3 setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:v30];
  [(ICWindowStateArchive *)v3 setIsPrimaryContentVisible:[(ICViewControllerManager *)self isPrimaryContentVisible]];
  [(ICWindowStateArchive *)v3 setIsSupplementaryContentVisible:[(ICViewControllerManager *)self isSupplementaryContentVisible]];
  [(ICWindowStateArchive *)v3 setIsTrailingContentVisible:[(ICViewControllerManager *)self isTrailingContentVisible]];
  if ([(ICViewControllerManager *)self isTrailingContentVisible])
  {
    BOOL v41 = [(ICViewControllerManager *)self mainSplitViewController];
    [v41 preferredPrimaryColumnWidth];
    id v42 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(ICWindowStateArchive *)v3 setMainSplitViewPrimaryColumnWidth:v42];

    BOOL v43 = [(ICViewControllerManager *)self mainSplitViewController];
    id v44 = [v43 style];

    if (v44 == (id)2)
    {
      BOOL v45 = [(ICViewControllerManager *)self mainSplitViewController];
      [v45 preferredSupplementaryColumnWidth];
      int64_t v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(ICWindowStateArchive *)v3 setMainSplitViewSupplementaryColumnWidth:v46];
    }
  }

  return v3;
}

- (void)updateCurrentNoteLastViewedMetadata:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class()))
  {
    BOOL v5 = [(ICViewControllerManager *)self modernManagedObjectContext];
    id v6 = [v5 ic_existingObjectWithID:v4];

    unsigned int v7 = [v6 updateLastViewedTimestampWithCurrentTimestamp];
    uint64_t v8 = [v6 recordID];
    if (v8)
    {
      BOOL v9 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004D69C;
      block[3] = &unk_100625AF0;
      id v12 = v8;
      dispatch_async(v9, block);
    }
    if ([(ICViewControllerManager *)self isSearchActive])
    {
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = +[NSDate date];
      [v6 setLastOpenedDate:v10];
    }
    [v6 saveAfterDelay];
LABEL_9:
  }
}

- (void)deleteEmptyNoteIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICViewControllerManager *)self mainSplitViewController];
  id v6 = [v5 transitionCoordinator];
  if (v6)
  {
  }
  else
  {
    unsigned int v7 = [(ICViewControllerManager *)self selectedNewNoteShortcutItem];

    if (v4)
    {
      if (!v7)
      {
        uint64_t v8 = [(ICViewControllerManager *)self selectedSearchResult];

        if (!v8)
        {
          if (objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class()))
          {
            BOOL v9 = [(ICViewControllerManager *)self modernManagedObjectContext];
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_10004D874;
            v14[3] = &unk_100625860;
            v14[4] = self;
            id v15 = v4;
            [v9 performBlock:v14];

            id v10 = v15;
          }
          else
          {
            if (!objc_msgSend(v4, "ic_isEntityOfClass:", objc_opt_class())) {
              goto LABEL_3;
            }
            BOOL v11 = [(ICViewControllerManager *)self legacyManagedObjectContext];
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10004D910;
            v12[3] = &unk_100625860;
            v12[4] = self;
            id v13 = v4;
            [v11 performBlock:v12];

            id v10 = v13;
          }
        }
      }
    }
  }
LABEL_3:
}

- (void)ensureSearchVisibleWhenApplyingArchive
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  unsigned int v4 = [v3 isCollapsed];

  if (v4)
  {
    BOOL v5 = [(ICViewControllerManager *)self compactNavigationController];
    id v6 = [v5 topViewController];
    unsigned int v7 = [(ICViewControllerManager *)self folderListViewController];

    if (v6 != v7)
    {
      id v10 = [(ICViewControllerManager *)self compactNavigationController];
      uint64_t v8 = [(ICViewControllerManager *)self folderListViewController];
      id v9 = [v10 popToViewController:v8 animated:0];
    }
  }
  else
  {
    [(ICViewControllerManager *)self ensureSearchVisible];
  }
}

- (void)ensureSearchVisible
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self trailingSidebarSplitViewController];
  unsigned int v4 = [v3 isCollapsed];

  if (v4)
  {
    BOOL v5 = [(ICViewControllerManager *)self compactNavigationController];
    id v6 = [v5 topViewController];
    unsigned int v7 = [(ICViewControllerManager *)self currentSearchBarViewController];

    if (v6 == v7) {
      return;
    }
    uint64_t v8 = [(ICViewControllerManager *)self compactNavigationController];
  }
  else
  {
    if (![(ICViewControllerManager *)self noteContainerViewMode])
    {
      id v14 = [(ICViewControllerManager *)self mainSplitViewController];
      [v14 ic_showColumn:1 animated:0];
      goto LABEL_11;
    }
    if ((id)[(ICViewControllerManager *)self noteContainerViewMode] != (id)1) {
      return;
    }
    id v9 = [(ICViewControllerManager *)self secondaryNavigationController];
    id v10 = [v9 topViewController];
    BOOL v11 = [(ICViewControllerManager *)self currentSearchBarViewController];

    if (v10 == v11) {
      return;
    }
    uint64_t v8 = [(ICViewControllerManager *)self secondaryNavigationController];
  }
  id v14 = (id)v8;
  id v12 = [(ICViewControllerManager *)self currentSearchBarViewController];
  id v13 = [v14 popToViewController:v12 animated:0];

LABEL_11:
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ICNoteContext sharedContext];
  id v6 = [v5 workerManagedObjectContext];

  unsigned int v7 = +[NoteContext sharedContext];
  uint64_t v8 = [v7 managedObjectContext];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    unsigned __int8 v14 = 0;
  }
  else
  {
    id v10 = [(ICViewControllerManager *)self tagSelection];
    id v11 = [v10 copyWithManagedObjectContext:v6];

    id v12 = [[ICFolderListSelectionValidator alloc] initWithModernContext:v6 htmlContext:v8];
    id v13 = [(ICViewControllerManager *)self selectedContainerIdentifiers];
    unsigned __int8 v14 = [(ICFolderListSelectionValidator *)v12 isSelectionAppropriateForObjectID:v4 selectedContainerIdentifiers:v13 tagSelection:v11];
  }
  return v14;
}

- (BOOL)canPerformAddNote
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self keyboardHandler];
  unsigned __int8 v4 = [v3 globalKeyCommandsInhibited];

  if (v4) {
    return 0;
  }
  BOOL v5 = +[ICQuickNoteSessionManager sharedManager];
  unsigned int v6 = [v5 isSecureScreenShowing];

  if (v6)
  {
    unsigned int v7 = +[ICQuickNoteSessionManager sharedManager];
    uint64_t v8 = [v7 noteEditorViewController];
    unsigned __int8 v9 = v8 != 0;
    goto LABEL_4;
  }
  id v10 = [(ICViewControllerManager *)self window];
  id v11 = [v10 ic_topmostPresentedViewController];

  if (v11) {
    return 0;
  }
  unsigned int v7 = [(ICViewControllerManager *)self folderListViewController];
  if (objc_msgSend(v7, "ic_isViewVisible"))
  {
    unsigned __int8 v9 = 1;
    goto LABEL_5;
  }
  uint64_t v8 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  if ((objc_msgSend(v8, "ic_isViewVisible") & 1) != 0
    || [(ICViewControllerManager *)self isNoteEditorVisible])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    unsigned __int8 v9 = [(ICViewControllerManager *)self isInHTMLEditorMode];
  }
LABEL_4:

LABEL_5:
  return v9;
}

- (BOOL)canPerformAddFolder
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self keyboardHandler];
  unsigned __int8 v4 = [v3 globalKeyCommandsInhibited];

  if (v4) {
    return 0;
  }
  unsigned int v6 = [(ICViewControllerManager *)self window];
  unsigned int v7 = [v6 ic_topmostPresentedViewController];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    uint64_t v8 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
    if (objc_msgSend(v8, "ic_isViewVisible"))
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      unsigned __int8 v9 = [(ICViewControllerManager *)self folderListViewController];
      unsigned __int8 v5 = [v9 ic_isViewVisible];
    }
  }

  return v5;
}

- (BOOL)canPerformToggleSearch
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self keyboardHandler];
  if (([v3 globalKeyCommandsInhibited] & 1) == 0)
  {
    unsigned __int8 v5 = +[ICQuickNoteSessionManager sharedManager];
    if (([v5 isSecureScreenShowing] & 1) != 0
      || (id)[(ICViewControllerManager *)self behavior] == (id)2)
    {
      BOOL v4 = 0;
    }
    else
    {
      unsigned __int8 v7 = [(ICViewControllerManager *)self isAuxiliary];

      if (v7) {
        return 0;
      }
      unsigned __int8 v3 = [(ICViewControllerManager *)self searchController];
      if (([v3 isFirstResponder] & 1) != 0
        || ([v3 searchBar],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v9 = [v8 isFirstResponder],
            v8,
            (v9 & 1) != 0))
      {
        BOOL v4 = 1;
        goto LABEL_7;
      }
      id v10 = [(ICViewControllerManager *)self window];
      id v11 = [v10 ic_topmostPresentedViewController];

      if (v11) {
        goto LABEL_2;
      }
      unsigned __int8 v5 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
      id v12 = [v5 dataSource];
      BOOL v4 = v12 != 0;
    }
    goto LABEL_7;
  }
LABEL_2:
  BOOL v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)canPerformFindInNote
{
  unsigned __int8 v3 = [(ICViewControllerManager *)self keyboardHandler];
  if ([v3 globalKeyCommandsInhibited]) {
    goto LABEL_4;
  }
  BOOL v4 = [(ICViewControllerManager *)self window];
  unsigned __int8 v5 = [v4 ic_topmostPresentedViewController];
  if (v5)
  {

LABEL_4:
    unsigned __int8 v6 = 0;
    goto LABEL_5;
  }
  int64_t v8 = [(ICViewControllerManager *)self behavior];

  if (v8 == 2) {
    return 0;
  }
  unsigned __int8 v3 = [(ICViewControllerManager *)self activeEditorController];
  unsigned __int8 v6 = [v3 canPerformAction:"performFindInNote:" withSender:self];
LABEL_5:

  return v6;
}

- (BOOL)canPerformReplaceInNote
{
  BOOL v3 = [(ICViewControllerManager *)self canPerformFindInNote];
  if (v3)
  {
    if ([(ICViewControllerManager *)self isInHTMLEditorMode])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      BOOL v4 = [(ICViewControllerManager *)self noteEditorViewController];
      unsigned __int8 v5 = [v4 note];
      unsigned __int8 v6 = [v5 isEditable];

      LOBYTE(v3) = v6;
    }
  }
  return v3;
}

- (BOOL)canPerformCmd1
{
  if (![(ICViewControllerManager *)self canPerformCmd3]) {
    return 0;
  }
  BOOL v3 = [(ICViewControllerManager *)self selectedContainerItemID];
  BOOL v4 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v3] == -1;

  return v4;
}

- (BOOL)canPerformCmd3
{
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  if (([v3 isEditingOnSystemPaper] & 1) != 0
    || [(ICViewControllerManager *)self isAuxiliary]
    || [(ICViewControllerManager *)self isInHTMLEditorMode])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    unsigned __int8 v6 = +[ICQuickNoteSessionManager sharedManager];
    unsigned __int8 v7 = [v6 isSecureScreenShowing];

    if (v7) {
      return 0;
    }
    if ((id)[(ICViewControllerManager *)self noteContainerViewMode] == (id)1)
    {
      BOOL v3 = [(ICViewControllerManager *)self secondaryNavigationController];
      int64_t v8 = [v3 topViewController];
      unsigned __int8 v9 = objc_opt_class();
      if ([v9 isEqual:objc_opt_class()])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        id v10 = [(ICViewControllerManager *)self compactNavigationController];
        id v11 = [v10 topViewController];
        id v12 = objc_opt_class();
        unsigned __int8 v4 = [v12 isEqual:objc_opt_class()];
      }
    }
    else
    {
      BOOL v3 = [(ICViewControllerManager *)self mainSplitViewController];
      unsigned __int8 v4 = [v3 displayMode] != (id)1;
    }
  }

  return v4;
}

- (BOOL)canPerformToggleEditorCallouts
{
  id v2 = [(ICViewControllerManager *)self noteEditorViewController];
  BOOL v3 = [v2 note];
  unsigned __int8 v4 = [v3 isSharedViaICloud];

  return v4;
}

- (BOOL)canPerformToggleNoteActivity
{
  id v2 = [(ICViewControllerManager *)self noteEditorViewController];
  BOOL v3 = [v2 note];
  unsigned __int8 v4 = [v3 isSharedViaICloud];

  return v4;
}

- (BOOL)canPerformReturnKey
{
  BOOL v3 = [(ICViewControllerManager *)self keyboardHandler];
  if ([v3 globalKeyCommandsInhibited])
  {
    unsigned __int8 v4 = 0;
LABEL_14:

    return v4;
  }
  unsigned __int8 v5 = [(ICViewControllerManager *)self window];
  uint64_t v6 = [v5 ic_topmostPresentedViewController];
  if (v6)
  {
    unsigned __int8 v7 = (void *)v6;
LABEL_12:
    unsigned __int8 v4 = 0;
LABEL_13:

    goto LABEL_14;
  }
  unsigned __int8 v7 = [(ICViewControllerManager *)self activeEditorController];
  if (!objc_msgSend(v7, "ic_isViewVisible")) {
    goto LABEL_12;
  }
  int64_t v8 = [(ICViewControllerManager *)self activeEditorController];
  if ([v8 isEditing])
  {
LABEL_11:

    goto LABEL_12;
  }
  unsigned __int8 v9 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  if (!objc_msgSend(v9, "ic_isFirstResponder"))
  {

    goto LABEL_11;
  }
  id v10 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  unsigned __int8 v11 = [v10 isEditing];

  if ((v11 & 1) == 0)
  {
    if ([(ICViewControllerManager *)self isInHTMLEditorMode]) {
      return 1;
    }
    objc_opt_class();
    BOOL v3 = [(ICViewControllerManager *)self activeEditorController];
    unsigned __int8 v5 = ICDynamicCast();
    unsigned __int8 v7 = [v5 note];
    unsigned __int8 v4 = [v7 isEditable];
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)canPerformAddLink
{
  BOOL v3 = [(ICViewControllerManager *)self activeEditorController];
  if ([v3 isEditing])
  {
    unsigned __int8 v4 = [(ICViewControllerManager *)self noteEditorViewController];
    unsigned int v5 = [v4 isEditingOnSecureScreen] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canPerformGotoPreviousNote
{
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    return 0;
  }
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned __int8 v4 = [v3 isEditingOnSecureScreen];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(ICViewControllerManager *)self selectionStateController];
  unsigned __int8 v7 = [v6 canNavigateBackwards];

  return v7;
}

- (BOOL)canPerformGotoNextNote
{
  if (![(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
    return 0;
  }
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned __int8 v4 = [v3 isEditingOnSecureScreen];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(ICViewControllerManager *)self selectionStateController];
  unsigned __int8 v7 = [v6 canNavigateForwards];

  return v7;
}

- (BOOL)canPerformCmdReturnKey
{
  BOOL v3 = [(ICViewControllerManager *)self keyboardHandler];
  if ([v3 globalKeyCommandsInhibited])
  {
    BOOL v4 = 0;
  }
  else
  {
    unsigned int v5 = +[ICQuickNoteSessionManager sharedManager];
    if ([v5 isSecureScreenShowing])
    {
      BOOL v4 = 0;
    }
    else
    {
      unsigned __int8 v7 = [(ICViewControllerManager *)self window];
      int64_t v8 = [v7 ic_topmostPresentedViewController];

      if (v8) {
        return 0;
      }
      BOOL v3 = [(ICViewControllerManager *)self activeEditorController];
      unsigned __int8 v9 = [(ICViewControllerManager *)self window];
      unsigned int v5 = [v9 firstResponder];

      if ([v3 isFirstResponder])
      {
        BOOL v4 = 1;
      }
      else
      {
        unsigned __int8 v10 = [v3 isEditing];
        if (v5) {
          BOOL v4 = v10;
        }
        else {
          BOOL v4 = 1;
        }
      }
    }
  }
  return v4;
}

- (BOOL)canPerformEnclosingFolderKey
{
  BOOL v3 = [(ICViewControllerManager *)self systemPaperViewController];

  if (v3) {
    return 0;
  }
  if ([(ICViewControllerManager *)self hasCompactWidth]) {
    [(ICViewControllerManager *)self compactNavigationController];
  }
  else {
  unsigned int v5 = [(ICViewControllerManager *)self secondaryNavigationController];
  }
  uint64_t v6 = [v5 viewControllers];
  BOOL v4 = (unint64_t)[v6 count] > 1;

  return v4;
}

- (BOOL)canPerformDeleteKey
{
  if (![(ICViewControllerManager *)self isSearchActive])
  {
    unsigned __int8 v7 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
    unsigned int v8 = [v7 hasDeletableNoteCell];

    if (!v8) {
      return 0;
    }
LABEL_5:
    unsigned __int8 v9 = [(ICViewControllerManager *)self window];
    unsigned __int8 v10 = [v9 rootViewController];
    unsigned __int8 v11 = [v10 presentedViewController];
    BOOL v6 = v11 == 0;

    return v6;
  }
  BOOL v3 = [(ICViewControllerManager *)self searchController];
  BOOL v4 = [v3 searchBar];
  unsigned __int8 v5 = [v4 isFirstResponder];

  if (v5) {
    goto LABEL_5;
  }
  return 0;
}

- (BOOL)canPerformDeleteSystemPaperNote
{
  return (id)[(ICViewControllerManager *)self behavior] == (id)2;
}

- (void)performAddNote:(id)a3
{
  id v6 = a3;
  if ((id)[(ICViewControllerManager *)self behavior] == (id)2) {
    uint64_t v4 = 18;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [(ICViewControllerManager *)self showNewNoteWithApproach:v4 sender:v6 animated:1];
}

- (void)performAddFolder:(id)a3
{
  objc_opt_class();
  uint64_t v4 = [(ICViewControllerManager *)self window];
  id v5 = [v4 ic_topmostPresentedViewController];
  ICDynamicCast();
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    id v6 = [v16 moveViewController];
    [v6 promptToAddFolderIn:0];
    goto LABEL_14;
  }
  unsigned __int8 v7 = [(ICViewControllerManager *)self folderListViewController];
  if (objc_msgSend(v7, "ic_isViewVisible")) {
    [(ICViewControllerManager *)self folderListViewController];
  }
  else {
  id v6 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  }

  if (!v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((presentingViewController) != nil)", "-[ICViewControllerManager performAddFolder:]", 1, 0, @"Expected non-nil value for '%s'", "presentingViewController");
  }
  objc_opt_class();
  unsigned int v8 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  unsigned __int8 v9 = [v8 noteContainer];
  unsigned __int8 v10 = ICDynamicCast();

  unsigned __int8 v11 = [(ICViewControllerManager *)self folderListViewController];
  if (objc_msgSend(v11, "ic_isViewVisible"))
  {

LABEL_12:
    id v13 = 0;
    goto LABEL_13;
  }
  unsigned int v12 = [v10 canAddSubfolder];

  if (!v12) {
    goto LABEL_12;
  }
  id v13 = v10;
LABEL_13:
  unsigned __int8 v14 = [[ICFolderCreationController alloc] initWithViewController:v6 noteContainer:v13 creationApproach:1];
  [(ICViewControllerManager *)self setFolderCreationController:v14];

  id v15 = [(ICViewControllerManager *)self folderCreationController];
  [v15 promptToAddFolderAllowingSmartFolder:1 withCompletionHandler:0];

LABEL_14:
}

- (void)performToggleSearch:(id)a3
{
  [(ICViewControllerManager *)self ensureSearchVisible];
  uint64_t v4 = [(ICViewControllerManager *)self mainSplitViewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004ECD0;
  v5[3] = &unk_100625AF0;
  v5[4] = self;
  [v4 ic_performBlockAfterActiveTransition:v5];
}

- (BOOL)canPerformPrintNote
{
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  uint64_t v4 = [v3 note];
  if (v4) {
    BOOL v5 = (id)[(ICViewControllerManager *)self behavior] != (id)2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)performPrintNote:(id)a3
{
  uint64_t v4 = [(ICViewControllerManager *)self noteEditorViewController];
  id v8 = [v4 note];

  BOOL v5 = [ICPrintNoteActivity alloc];
  id v6 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned __int8 v7 = [(ICPrintNoteActivity *)v5 initWithNote:v8 presentingViewController:v6];

  [(ICPrintNoteActivity *)v7 performActivityWithCompletion:0];
}

- (void)performCmd1:(id)a3
{
  if ([(ICViewControllerManager *)self canUserChangeNoteContainerViewMode])
  {
    [(ICViewControllerManager *)self setNoteContainerViewMode:0];
  }
}

- (void)performCmd2:(id)a3
{
  if ([(ICViewControllerManager *)self canUserChangeNoteContainerViewMode])
  {
    [(ICViewControllerManager *)self setNoteContainerViewMode:1];
  }
}

- (void)performCmd3:(id)a3
{
  id v4 = a3;
  if ([(ICViewControllerManager *)self isAttachmentBrowserVisible]) {
    [(ICViewControllerManager *)self currentAttachmentBrowserViewController];
  }
  else {
  id v5 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  }
  [v5 performCmd3:v4];
}

- (void)performToggleEditorCallouts:(id)a3
{
  BOOL v3 = [(ICViewControllerManager *)self noteEditorViewController];
  id v4 = [v3 attributionSidebarController];

  if ([v4 attributionSidebarVisibility]) {
    [v4 hideSidebarAnimated:1];
  }
  else {
    [v4 showSidebarAnimated:1];
  }
}

- (void)performToggleNoteActivity:(id)a3
{
  id v4 = [(ICViewControllerManager *)self noteEditorViewController];
  id v6 = [v4 note];

  if ([(ICViewControllerManager *)self activityStreamViewMode])
  {
    [(ICViewControllerManager *)self hideActivityStreamWithCompletion:0];
  }
  else
  {
    id v5 = [v6 objectID];
    [(ICViewControllerManager *)self showActivityStreamForObjectWithObjectID:v5];
  }
}

- (id)cmd3Title
{
  unsigned int v2 = [(ICViewControllerManager *)self isAttachmentBrowserVisible];
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Hide Attachments Browser";
  }
  else {
    CFStringRef v5 = @"Show Attachments Browser";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_10063F3D8 table:0];

  return v6;
}

- (id)toggleEditorCalloutsTitle
{
  unsigned int v2 = [(ICViewControllerManager *)self noteEditorViewController];
  BOOL v3 = [v2 attributionSidebarController];
  id v4 = [v3 attributionSidebarVisibility];

  CFStringRef v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"Hide Highlights";
  }
  else {
    CFStringRef v7 = @"Show Highlights";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_10063F3D8 table:0];

  return v8;
}

- (id)toggleNoteActivityTitle
{
  int64_t v2 = [(ICViewControllerManager *)self activityStreamViewMode];
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Hide Note Activity";
  }
  else {
    CFStringRef v5 = @"Show Note Activity";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_10063F3D8 table:0];

  return v6;
}

- (void)performReturnKey:(id)a3
{
  [(ICViewControllerManager *)self dismissOverlayContent];
  id v4 = [(ICViewControllerManager *)self noteEditorViewController];
  [v4 becomeFirstResponder];

  id v5 = [(ICViewControllerManager *)self noteEditorViewController];
  [v5 setEditing:1 animated:1];
}

- (void)performCmdReturnKey:(id)a3
{
  id v4 = [(ICViewControllerManager *)self window];
  id v5 = [v4 firstResponder];

  if ([(ICViewControllerManager *)self isSearchActive]) {
    [(ICViewControllerManager *)self searchController];
  }
  else {
  id v6 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  }
  CFStringRef v7 = [(ICViewControllerManager *)self activeEditorController];
  unsigned __int8 v8 = [v7 isEditing];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004F4B8;
  v19[3] = &unk_100625D18;
  v19[4] = self;
  unsigned __int8 v20 = v8;
  unsigned __int8 v9 = objc_retainBlock(v19);
  if (v5 != v6)
  {
    unsigned __int8 v10 = +[ICQuickNoteSessionManager sharedManager];
    unsigned __int8 v11 = [v10 isSecureScreenShowing];

    if ((v11 & 1) == 0)
    {
      unsigned int v12 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
      unsigned int v13 = [v12 isEditing];

      if (v13)
      {
        unsigned __int8 v14 = [(ICViewControllerManager *)self legacyNoteEditorViewController];
        id v15 = [v14 contentLayer];
        id v16 = [v15 noteHTMLEditorView];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10004F5D4;
        v17[3] = &unk_100626248;
        id v18 = v9;
        [v16 stopEditingWithCompletion:v17];
      }
      else
      {
        [v5 resignFirstResponder];
        ((void (*)(void *))v9[2])(v9);
      }
    }
  }
}

- (void)performAddLinkKey:(id)a3
{
  id v15 = a3;
  id v4 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned int v5 = [v4 isEditing];

  id v6 = [(ICViewControllerManager *)self noteEditorViewController];
  unsigned int v7 = [v6 ic_isViewVisible];

  if (v7)
  {
    if (v5)
    {
      if ([(ICViewControllerManager *)self canPerformAddLink])
      {
        unsigned __int8 v8 = [(ICViewControllerManager *)self noteEditorViewController];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          unsigned __int8 v10 = [(ICViewControllerManager *)self noteEditorViewController];
          unsigned __int8 v11 = [v10 auxiliaryResponder];

          if (v11)
          {
            objc_opt_class();
            unsigned int v12 = [(ICViewControllerManager *)self noteEditorViewController];
            unsigned int v13 = [v12 auxiliaryResponder];
            unsigned __int8 v14 = ICDynamicCast();
          }
          else
          {
            unsigned __int8 v14 = [(ICViewControllerManager *)self activeEditorController];
          }
          [v14 performSelector:"openLinkEditor:" withObject:v15];
        }
      }
    }
  }
}

- (void)performGotoPreviousNote:(id)a3
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v4 = [(ICViewControllerManager *)self selectionStateController];
    [v4 navigateBackwards];
  }
}

- (void)performGotoNextNote:(id)a3
{
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v4 = [(ICViewControllerManager *)self selectionStateController];
    [v4 navigateForwards];
  }
}

- (void)performFindInNote:(id)a3
{
  id v5 = a3;
  id v4 = [(ICViewControllerManager *)self activeEditorController];
  if ([(ICViewControllerManager *)self canPerformFindInNote]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 performSelector:"performFindInNote:" withObject:v5];
  }
}

- (void)performReplaceInNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICViewControllerManager *)self activeEditorController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICViewControllerManager *)self activeEditorController];
    [v6 performSelector:"performReplaceInNote:" withObject:v7];
  }
}

- (void)performEnclosingFolderKey:(id)a3
{
  if ([(ICViewControllerManager *)self hasCompactWidth]) {
    [(ICViewControllerManager *)self compactNavigationController];
  }
  else {
  id v7 = [(ICViewControllerManager *)self secondaryNavigationController];
  }
  id v4 = [v7 viewControllers];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2) {
    id v6 = [v7 popViewControllerAnimated:1];
  }
}

- (void)performDeleteKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICViewControllerManager *)self currentNoteBrowseViewController];
  [v5 performDeleteKey:v4];
}

- (void)performDeleteQuickNoteKey:(id)a3
{
  id v3 = [(ICViewControllerManager *)self systemPaperViewController];
  [v3 deleteCurrentNote];
}

- (BOOL)canPerformSystemPaperNavigateLeft
{
  int64_t v2 = [(ICViewControllerManager *)self systemPaperViewController];
  unsigned __int8 v3 = [v2 canSwipeInDirection:1];

  return v3;
}

- (void)systemPaperNavigateLeft:(id)a3
{
  id v3 = [(ICViewControllerManager *)self systemPaperViewController];
  [v3 synthesizeSwipeForDirection:1];
}

- (BOOL)canPerformSystemPaperNavigateRight
{
  int64_t v2 = [(ICViewControllerManager *)self systemPaperViewController];
  unsigned __int8 v3 = [v2 canSwipeInDirection:0];

  return v3;
}

- (void)systemPaperNavigateRight:(id)a3
{
  id v3 = [(ICViewControllerManager *)self systemPaperViewController];
  [v3 synthesizeSwipeForDirection:0];
}

- (BOOL)canPerformSystemPaperShowInNotes
{
  int64_t v2 = [(ICViewControllerManager *)self systemPaperViewController];
  id v3 = [v2 currentNote];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)systemPaperShowInNotes:(id)a3
{
  id v3 = [(ICViewControllerManager *)self systemPaperViewController];
  [v3 backToNotesWithKeyboard];
}

- (BOOL)canPerformExpandSection
{
  int IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled();
  if (IsCollapsibleSectionsEnabled)
  {
    BOOL v4 = [(ICViewControllerManager *)self textContentStorage];
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    id v6 = [v5 textView];
    id v7 = [v6 selectedRange];
    unsigned __int8 v9 = [v4 canExpandSectionsInRange:v7, v8];

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performExpandSection:(id)a3
{
}

- (BOOL)canPerformExpandAllSections
{
  int IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled();
  if (IsCollapsibleSectionsEnabled)
  {
    BOOL v4 = [(ICViewControllerManager *)self textContentStorage];
    id v5 = [(ICViewControllerManager *)self textContentStorage];
    id v6 = [v5 textStorage];
    id v7 = [v6 ic_range];
    unsigned __int8 v9 = [v4 canExpandSectionsInRange:v7, v8];

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performExpandAllSections:(id)a3
{
  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    id v4 = [(ICViewControllerManager *)self textContentStorage];
    [v4 expandAllSections];
  }
}

- (BOOL)canPerformCollapseSection
{
  int IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled();
  if (IsCollapsibleSectionsEnabled)
  {
    id v4 = [(ICViewControllerManager *)self textContentStorage];
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    id v6 = [v5 textView];
    id v7 = [v6 selectedRange];
    unsigned __int8 v9 = [v4 canCollapseSectionsInRange:v7, v8];

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performCollapseSection:(id)a3
{
}

- (BOOL)canPerformCollapseAllSections
{
  int IsCollapsibleSectionsEnabled = ICInternalSettingsIsCollapsibleSectionsEnabled();
  if (IsCollapsibleSectionsEnabled)
  {
    id v4 = [(ICViewControllerManager *)self textContentStorage];
    id v5 = [(ICViewControllerManager *)self textContentStorage];
    id v6 = [v5 textStorage];
    id v7 = [v6 ic_range];
    unsigned __int8 v9 = [v4 canCollapseSectionsInRange:v7, v8];

    LOBYTE(IsCollapsibleSectionsEnabled) = v9;
  }
  return IsCollapsibleSectionsEnabled;
}

- (void)performCollapseAllSections:(id)a3
{
  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    id v4 = [(ICViewControllerManager *)self textContentStorage];
    [v4 collapseAllSections];
  }
}

- (void)setExpandedForSectionsInSelectedRange:(BOOL)a3
{
  BOOL v3 = a3;
  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    objc_opt_class();
    id v5 = [(ICViewControllerManager *)self noteEditorViewController];
    id v6 = [v5 textView];
    ICDynamicCast();
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = [(ICViewControllerManager *)self textContentStorage];
    id v8 = [v13 selectedRange];
    [v7 setExpanded:v3 forSectionsInRange:v8, v9];

    unsigned __int8 v10 = [v13 textLayoutManager];
    unsigned __int8 v11 = [v13 textLayoutManager];
    unsigned int v12 = [v11 documentRange];
    [v10 invalidateLayoutForRange:v12];
  }
}

- (void)addNoteFromAirDropDocument:(id)a3
{
  id v4 = a3;
  id v5 = +[ICAirDropDocument documentAtURL:v4];
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100050230;
    v12[3] = &unk_100626270;
    v12[4] = self;
    id v6 = objc_retainBlock(v12);
    id v7 = +[NotesApp sharedNotesApp];
    id v8 = [v7 noteContext];

    if ([v5 hasDocumentForNote])
    {
      +[ICNote createNoteForAirDropDocument:v5 legacyContext:v8 completion:v6];
    }
    else if ([v5 hasDocumentForLegacyNote])
    {
      id v9 = objc_alloc_init((Class)ICTextController);
      unsigned __int8 v10 = +[ICAttachmentPreviewGenerator sharedGenerator];
      id v11 = +[NoteObject newNoteForAirDropDocument:v5 context:v8 styler:v9 attachmentPreviewGenerator:v10];

      if (v11)
      {
        ((void (*)(void *, id))v6[2])(v6, v11);
      }
      else
      {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, @"No note created for AirDrop document %@", v5);
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, @"No data found for AirDrop document %@", v5);
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "airDropDocument", "-[ICViewControllerManager addNoteFromAirDropDocument:]", 1, 0, @"Failed to load AirDrop at url %@", v4);
  }
}

- (void)addNoteFromPlaintextFile:(id)a3
{
  id v4 = a3;
  id v48 = 0;
  id v5 = +[NSString stringWithContentsOfURL:v4 usedEncoding:0 error:&v48];
  id v6 = v48;
  if (v5)
  {
    BOOL v45 = self;
  }
  else
  {
    id v47 = v6;
    id v5 = +[NSString stringWithContentsOfURL:v4 encoding:4 error:&v47];
    id v7 = v47;

    if (!v5)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content != ((void *)0)", "-[ICViewControllerManager addNoteFromPlaintextFile:]", 1, 0, @"Failed to load file content at url %@", v4);
      goto LABEL_16;
    }
    BOOL v45 = self;
    id v6 = v7;
  }
  id v8 = +[NotesApp sharedNotesApp];
  id v9 = [v8 noteContext];
  unsigned __int8 v10 = +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:v9];

  objc_opt_class();
  id v11 = ICDynamicCast();
  objc_opt_class();
  unsigned int v12 = ICDynamicCast();
  id v13 = +[NSDate date];
  if (v11)
  {
    unsigned __int8 v14 = [v11 defaultFolder];
    id v43 = v4;
    id v15 = +[ICNote newEmptyNoteInFolder:v14];

    [v15 setCreationDate:v13];
    [v15 setModificationDate:v13];
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v17 = +[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle]);
    [v16 setObject:v17 forKey:ICTTAttributeNameParagraphStyle];

    BOOL v41 = v13;
    id v18 = v10;
    id v19 = v6;
    unsigned __int8 v20 = v11;
    BOOL v21 = v12;
    id v22 = [v5 paragraphRangeForRange:0, 0];
    uint64_t v24 = v23;
    id v25 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
    [v25 setAttributes:v16 range:v22];
    unsigned int v26 = [v15 textStorage];
    [v26 appendAttributedString:v25];

    [v15 updateChangeCountWithReason:@"Created note from plaintext file"];
    uint64_t v27 = +[ICNoteContext sharedContext];
    [v27 saveImmediately];
    [v27 setCurrentNote:v15];
    id v28 = [v15 objectID];
    LOWORD(v40) = 257;
    -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](v45, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v28, 0, 0, 0, 1, 1, v40);

    unsigned int v12 = v21;
    id v11 = v20;

    id v7 = v19;
    unsigned __int8 v10 = v18;
    id v13 = v41;
    id v4 = v43;
  }
  else if (v12)
  {
    id v44 = v4;
    id v29 = +[NotesApp sharedNotesApp];
    uint64_t v30 = [v29 noteContext];
    id v31 = [v30 newlyAddedNote];

    [v31 setCreationDate:v13];
    [v31 setModificationDate:v13];
    id v42 = v12;
    id v32 = [v12 defaultStore];
    [v31 setStore:v32];

    id v33 = ICNoteTitleFromPlainText();
    [v31 setTitle:v33];

    uint64_t v34 = ICNoteHTMLFromPlainText();
    [v31 setContent:v34];

    id v35 = +[NotesApp sharedNotesApp];
    id v36 = [v35 noteContext];
    id v46 = v6;
    unsigned __int8 v37 = [v36 save:&v46];
    id v7 = v46;

    if ((v37 & 1) == 0)
    {
      id v38 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1004D496C();
      }
    }
    BOOL v39 = [v31 objectID];
    LOWORD(v40) = 257;
    -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](v45, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v39, 0, 0, 0, 1, 1, v40);

    unsigned int v12 = v42;
    id v4 = v44;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICViewControllerManager addNoteFromPlaintextFile:]", 1, 0, @"Couldn't get default account");
    id v7 = v6;
  }

LABEL_16:
}

- (BOOL)openURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isFileURL];
  id v6 = +[ICQuickNoteSessionManager sharedManager];
  unsigned int v7 = [v6 isSecureScreenShowing];

  id v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v88 = "-[ICViewControllerManager openURL:]";
    __int16 v89 = 1024;
    int v90 = 7736;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (v5)
  {
    id v85 = 0;
    id v84 = 0;
    unsigned __int8 v9 = [v4 getResourceValue:&v85 forKey:NSURLTypeIdentifierKey error:&v84];
    id v10 = v85;
    id v11 = v84;
    if (v9)
    {
      unsigned int v12 = [v4 pathExtension];
      unsigned int v13 = [v12 isEqualToString:kICAirDropDocumentExtension];

      if (v13)
      {
        [(ICViewControllerManager *)self addNoteFromAirDropDocument:v4];
LABEL_26:
        BOOL v27 = 1;
LABEL_28:

        goto LABEL_64;
      }
      id v25 = +[UTType typeWithIdentifier:v10];
      unsigned int v26 = [v25 conformsToType:UTTypePlainText];

      if (v26)
      {
        [(ICViewControllerManager *)self addNoteFromPlaintextFile:v4];
        goto LABEL_26;
      }
    }
    else
    {
      id v18 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1004D49E0(v11, (uint64_t)v4, v18);
      }
    }
    BOOL v27 = 0;
    goto LABEL_28;
  }
  if (v4) {
    unsigned int v14 = v7;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 != 1)
  {
    if (!v4) {
      goto LABEL_31;
    }
    if (!+[ICAppURLUtilities isQuickNoteModeURL:v4])
    {
      if (+[ICAppURLUtilities isTranscriptionDonationURL:v4])
      {
        unsigned __int8 v28 = +[ICAppURLUtilities isTranscriptionDonationURLPositive:v4];
        id v29 = +[ICNoteContext sharedContext];
        uint64_t v30 = [v29 workerManagedObjectContext];

        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_1000511BC;
        v73[3] = &unk_100625B68;
        id v74 = v4;
        id v75 = v30;
        id v76 = self;
        unsigned __int8 v77 = v28;
        id v31 = v30;
        [v31 performBlockAndWait:v73];
      }
      goto LABEL_31;
    }
    id v19 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1004D4AB0();
    }

    id v11 = +[ICQuickNoteSessionManager sharedManager];
    unsigned __int8 v20 = [(ICViewControllerManager *)self noteEditorViewController];
    BOOL v21 = +[ICNoteContext sharedContext];
    uint64_t v22 = [v21 managedObjectContext];

    uint64_t v23 = +[ICAppURLUtilities noteIdentifierFromQuickNoteURL:v4];
    uint64_t v67 = (void *)v23;
    if (v23)
    {
      uint64_t v24 = +[ICNote noteWithIdentifier:v23 context:v22];
    }
    else
    {
      uint64_t v24 = 0;
    }
    id v36 = +[ICQuickNoteSessionSettings showOnLockScreen];
    id v37 = +[ICQuickNoteSessionSettings showOnLockScreen];
    if (v37 == (id)3 || v36 == (id)2)
    {
      id v38 = +[ICAppDelegate sharedInstance];
      BOOL v39 = v38;
      if (v37 == (id)3) {
        [v38 quicknoteArchiveState];
      }
      else {
      uint64_t v40 = [v38 lastBackgroundedArchiveState];
      }

      if (!v24)
      {
LABEL_47:
        buf[0] = 0;
        uint64_t v24 = [v11 noteForSessionCreatingIfNecessaryInContext:v22 stateArchive:v40 canResume:1 isNewlyCreated:buf];
        if (buf[0])
        {
          BOOL v41 = [(ICViewControllerManager *)self noteEditorViewController];
          id v42 = [v41 eventReporter];

          [v42 submitNoteCreateEventForModernNote:v24 createApproach:12];
        }
      }
    }
    else
    {
      if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
        [(ICViewControllerManager *)self windowStateArchive];
      }
      else {
      uint64_t v40 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];
      }
      if (!v24) {
        goto LABEL_47;
      }
    }
    id v66 = (void *)v22;
    id v43 = [v20 lastSavedInkingTool];
    uint64_t v68 = v20;
    [v20 updateInkPickerAndTextViewToTool:v43];

    id v65 = v40;
    uint64_t v64 = [v40 scrollStateForNote:v24];
    unsigned int v44 = +[ICAppURLUtilities quickNoteURLShouldShowList:v4];
    unsigned __int8 v45 = +[ICAppURLUtilities quickNoteURLShouldShowShareSheet:v4];
    unsigned __int8 v46 = +[ICAppURLUtilities quickNoteURLShouldShowiCloudShareSheet:v4];
    uint64_t v47 = +[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:v4];
    unsigned int v48 = [v24 isPasswordProtected];
    unsigned int v69 = 0;
    if ((v44 & 1) == 0 && (v45 & 1) == 0 && (v46 & 1) == 0 && !v47)
    {
      unsigned int v49 = v48;
      if (+[ICAppURLUtilities isLaunchingQuickNoteViaPencil:v4])
      {
        unsigned int v69 = 0;
      }
      else
      {
        BOOL v50 = [v68 textView];
        unsigned int v69 = [v50 canBecomeFirstResponder] & (v49 ^ 1);
      }
    }
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
      [(ICViewControllerManager *)self windowStateArchive];
    }
    else {
    int64_t v51 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];
    }
    id v63 = (void *)v47;
    uint64_t v52 = [v24 folder];
    long long v53 = [v52 account];
    long long v54 = [v53 objectID];

    if (!v44) {
      goto LABEL_61;
    }
    long long v55 = [v54 URIRepresentation];
    id v86 = v55;
    long long v56 = +[NSArray arrayWithObjects:&v86 count:1];
    [v51 setCurrentContainerObjectIDURLs:v56];

    if (![(ICViewControllerManager *)self hasCompactWidth])
    {
LABEL_61:
      uint64_t v57 = [v24 objectID];
      int64_t v58 = [v57 URIRepresentation];
      [v51 setCurrentNoteObjectIDURL:v58];
    }
    [v51 setCurrentNoteContainerViewMode:[self noteContainerViewMode]];
    [v51 setScrollState:v64];
    [v51 setActiveEditorInEditMode:v69];
    [(ICViewControllerManager *)self applyNoteViewModesToStateRestoreArchive:v51 withContainerItemID:v54];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100051134;
    v78[3] = &unk_100626298;
    unsigned __int8 v83 = v46;
    id v79 = v68;
    char v80 = self;
    id v81 = v63;
    id v82 = v66;
    id v59 = v66;
    id v60 = v63;
    id v61 = v68;
    [(ICViewControllerManager *)self applyStateRestoreArchive:v51 completion:v78];

    goto LABEL_63;
  }
  uint64_t v15 = +[ICAppURLUtilities noteIdentifierFromNotesAppURL:v4];
  if (v15)
  {
    id v11 = (id)v15;
    id v16 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1004D4A7C();
    }

    unsigned int v17 = +[NSMutableDictionary dictionary];
    [v17 setObject:v11 forKeyedSubscript:ICQuickNoteURLOptionNoteIdentifier];
    [(ICViewControllerManager *)self launchNotesAppFromLockscreenWithQueryOptions:v17 completionBlock:0];

    goto LABEL_63;
  }
LABEL_31:
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v32 = [(ICViewControllerManager *)self selectedNoteObjectID];
    id v33 = [(ICViewControllerManager *)self selectionStateController];
    uint64_t v34 = [(ICViewControllerManager *)self rootNoteBrowseViewController];
    int64_t v35 = [(ICViewControllerManager *)self noteContainerViewMode];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1000514A8;
    v70[3] = &unk_1006262E8;
    v70[4] = self;
    id v71 = v32;
    id v72 = v4;
    id v11 = v32;
    [v33 openURL:v72 rootNoteBrowseViewController:v34 currentNoteContainerViewMode:v35 completion:v70];

LABEL_63:
    BOOL v27 = 1;
    goto LABEL_64;
  }
  id v11 = [(ICViewControllerManager *)self archiveForURL:v4];
  BOOL v27 = v11 != 0;
  if (v11) {
    [(ICViewControllerManager *)self applyStateRestoreArchive:v11 completion:0];
  }
LABEL_64:

  return v27;
}

- (void)showAudioDonationDialog:(BOOL)a3 mediaURL:(id)a4 transcript:(id)a5 date:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = +[NSBundle mainBundle];
  unsigned __int8 v28 = [v11 localizedStringForKey:@"Help Improve Transcriptions?" value:&stru_10063F3D8 table:0];

  unsigned int v12 = +[NSBundle mainBundle];
  BOOL v27 = [v12 localizedStringForKey:@"Would you like to submit this recording to Apple to improve transcription accuracy?\n\nRecordings will only be used to improve the quality of speech recognition in Apple products.\n\nDo not submit recordings if you believe the speaker would be uncomfortable with you submitting the content to Apple." value:&stru_10063F3D8 table:0];

  unsigned int v13 = +[UIAlertController alertControllerWithTitle:v28 message:v27 preferredStyle:1];
  unsigned int v14 = +[NSBundle mainBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"Submit" value:&stru_10063F3D8 table:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000518B0;
  v29[3] = &unk_100626330;
  id v30 = v8;
  id v31 = v9;
  id v32 = v10;
  BOOL v33 = a3;
  id v25 = v10;
  id v16 = v9;
  id v17 = v8;
  id v18 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v29];

  id v19 = +[NSBundle mainBundle];
  unsigned __int8 v20 = [v19 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];
  BOOL v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];

  [v13 addAction:v18];
  [v13 addAction:v21];
  uint64_t v22 = [(ICViewControllerManager *)self noteEditorViewController];
  uint64_t v23 = [v22 presentedViewController];
  [v23 presentViewController:v13 animated:1 completion:0];
}

- (id)archiveForURL:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000C1484();
  unsigned int v5 = +[ICNoteContext sharedContext];
  if (v5)
  {
    id v6 = +[ICAppURLUtilities objectIDForModernFolderMentionedInURL:v3 noteContext:v5];
    if (v6)
    {
LABEL_3:
      unsigned int v7 = v6;
      id v8 = [v6 URIRepresentation];
LABEL_6:
      id v79 = 0;
      id v9 = 0;
      id v10 = 0;
      id v11 = 0;
LABEL_7:
      BOOL v12 = 0;
      goto LABEL_8;
    }
    if (+[ICAppURLUtilities isShowVirtualSmartFolderURL:v3])
    {
      unsigned int v26 = [v5 managedObjectContext];
      id v11 = +[ICAppURLUtilities virtualSmartFolderMentionedInURL:v3 context:v26];

      unsigned int v7 = 0;
      id v8 = 0;
      id v79 = 0;
      id v9 = 0;
      id v10 = 0;
      goto LABEL_7;
    }
    if (+[ICAppURLUtilities isShowNoteInVirtualSmartFolderURL:v3])
    {
      BOOL v27 = [v5 managedObjectContext];
      id v11 = +[ICAppURLUtilities virtualSmartFolderMentionedInURL:v3 context:v27];

      unsigned __int8 v28 = +[ICAppURLUtilities notePredicateFromNoteInVirtualSmartFolderInURL:v3];
      if (v28)
      {
        id v29 = [v5 managedObjectContext];
        id v30 = +[ICNote notesMatchingPredicate:v28 context:v29];

        if ([v30 count])
        {
          [v30 firstObject];
          v32 = id v31 = v5;
          BOOL v33 = [v32 objectID];
          id v8 = [v33 URIRepresentation];

          if (v11) {
            uint64_t v34 = v8;
          }
          else {
            uint64_t v34 = 0;
          }
          id v79 = v34;
          if (v11) {
            id v8 = 0;
          }

          unsigned int v5 = v31;
        }
        else
        {
          id v79 = 0;
          id v8 = 0;
        }
      }
      else
      {
        id v79 = 0;
        id v8 = 0;
      }

      id v9 = 0;
LABEL_69:
      BOOL v12 = (char)v79;
      unsigned int v7 = 0;
      if (v79)
      {
        id v10 = 0;
        BOOL v12 = [v9 count] != 0;
      }
      else
      {
        id v79 = 0;
        id v10 = 0;
      }
      goto LABEL_8;
    }
  }
  else if (+[ICAppURLUtilities isShowVirtualSmartFolderURL:v3])
  {
    goto LABEL_5;
  }
  if (v4)
  {
    id v6 = +[ICAppURLUtilities objectIDForHTMLFolderMentionedInURL:v3 context:v4];
    if (v6) {
      goto LABEL_3;
    }
    if (+[ICAppURLUtilities isShowDefaultFolderURL:v3])
    {
      int64_t v35 = +[ICDefaultAccountUtilities defaultFolderWithHTMLNoteContext:v4];
      id v36 = [v35 objectID];
      id v8 = [v36 URIRepresentation];

LABEL_38:
      unsigned int v7 = 0;
      goto LABEL_6;
    }
  }
  if (+[ICAppURLUtilities isShowNoteURL:v3])
  {
    uint64_t v37 = +[ICAppURLUtilities predicateForNotesMentionedInURL:v3];
    id v38 = (void *)v37;
    id v9 = 0;
    if (v5)
    {
      id v79 = 0;
      id v8 = 0;
      if (v37)
      {
        BOOL v39 = [v5 managedObjectContext];
        uint64_t v40 = +[ICNote notesMatchingPredicate:v38 context:v39];

        long long v73 = v40;
        BOOL v41 = [v40 firstObject];
        id v42 = +[ICAppURLUtilities folderIdentifierForShowNoteURL:v3];
        if (v42)
        {
          id v43 = [v5 managedObjectContext];
          unsigned int v44 = +[ICFolder folderWithIdentifier:v42 context:v43];

          if (v44
            && v41
            && ([v44 visibleNotes],
                unsigned __int8 v45 = objc_claimAutoreleasedReturnValue(),
                unsigned int v46 = [v45 containsObject:v41],
                v45,
                v46))
          {
            uint64_t v47 = [v41 objectID];
            id v79 = [v47 URIRepresentation];

            id v72 = [v44 objectID];
            unsigned int v48 = [v72 URIRepresentation];
            char v80 = v48;
            id v9 = +[NSArray arrayWithObjects:&v80 count:1];

            uint64_t v49 = 0;
          }
          else
          {
            uint64_t v57 = [v41 objectID];
            uint64_t v49 = [v57 URIRepresentation];

            id v9 = 0;
            id v79 = 0;
          }
        }
        else
        {
          id v66 = [v41 objectID];
          uint64_t v49 = [v66 URIRepresentation];

          id v9 = 0;
          id v79 = 0;
        }

        id v8 = (void *)v49;
      }
    }
    else
    {
      id v79 = 0;
      id v8 = 0;
    }

    id v11 = 0;
    goto LABEL_69;
  }
  uint64_t v50 = +[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:v3];
  if (!v50)
  {
    if (+[ICAppURLUtilities isShowNoteFocusedInFolderURL:v3])
    {
      unsigned __int8 v77 = v4;
      uint64_t v51 = +[ICAppURLUtilities predicateForFolderWithNoteFocusedInURL:v3];
      uint64_t v52 = (void *)v51;
      id v11 = 0;
      id v10 = 0;
      id v8 = 0;
      if (v5 && v51)
      {
        id v75 = v5;
        long long v53 = [v5 managedObjectContext];
        long long v54 = +[ICNote notesMatchingPredicate:v52 context:v53];

        objc_opt_class();
        long long v55 = [v54 firstObject];
        long long v56 = ICDynamicCast();

        if (!v56) {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((firstNote) != nil)", "-[ICViewControllerManager archiveForURL:]", 1, 0, @"Expected non-nil value for '%s'", "firstNote");
        }
        if ([v56 isSystemPaper])
        {
          id v11 = +[ICAccount globalVirtualSystemPaperFolder];
        }
        else
        {
          id v11 = 0;
        }
        if ([v56 isMathNote])
        {
          uint64_t v67 = +[ICAccount globalVirtualMathNotesFolder];

          id v11 = (void *)v67;
        }
        if ([v56 isCallNote])
        {
          +[ICAccount globalVirtualCallNotesFolder];
          uint64_t v68 = 0;
          id v11 = v69 = v11;
        }
        else
        {
          unsigned int v69 = [v56 folder];
          uint64_t v70 = [v69 objectID];
          uint64_t v68 = [v70 URIRepresentation];
        }
        id v71 = [v56 objectID];
        id v10 = [v71 URIRepresentation];

        unsigned int v5 = v75;
        id v8 = (void *)v68;
      }

      unsigned int v7 = 0;
      id v79 = 0;
      id v9 = 0;
      BOOL v12 = 0;
      id v4 = v77;
LABEL_8:
      if (!v8 && !v12 && !v11)
      {
        id v8 = 0;
        unsigned int v13 = 0;
        if (!+[ICAppURLUtilities isShowFolderListURL:v3])goto LABEL_20; {
      }
        }
      goto LABEL_12;
    }
    if (NotesAppIsValidURL())
    {
      int64_t v58 = NotesAppPredicateForNoteMentionedInURL();
      if (v58)
      {
        id v59 = +[NotesApp sharedNotesApp];
        id v60 = [v59 noteContext];
        id v61 = [v60 allVisibleNotesMatchingPredicate:v58 sorted:1];

        id v62 = [v61 firstObject];
        [v62 objectID];
        id v63 = v5;
        v65 = uint64_t v64 = v4;
        id v8 = [v65 URIRepresentation];

        id v4 = v64;
        unsigned int v5 = v63;
      }
      else
      {
        id v8 = 0;
      }

      goto LABEL_38;
    }
LABEL_5:
    unsigned int v7 = 0;
    id v8 = 0;
    goto LABEL_6;
  }
  id v8 = (void *)v50;
  id v11 = 0;
  id v10 = 0;
  id v9 = 0;
  id v79 = 0;
  unsigned int v7 = 0;
LABEL_12:
  id v74 = v5;
  id v76 = v4;
  id v14 = v3;
  uint64_t v15 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];
  unsigned int v13 = v15;
  if (v10) {
    [v15 setFocusedNoteObjectIDURL:v10];
  }
  id v16 = v10;
  uint64_t v17 = [(ICViewControllerManager *)self managedObjectIDFromURL:v8];
  id v18 = (void *)v17;
  id v19 = v11;
  if (v17) {
    unsigned __int8 v20 = (void *)v17;
  }
  else {
    unsigned __int8 v20 = v11;
  }
  id v21 = v20;

  if (v21) {
    [(ICViewControllerManager *)self applyNoteViewModesToStateRestoreArchive:v13 withContainerItemID:v21];
  }
  [v13 setCurrentObjectIDURL:v8];
  [v13 setCurrentNoteObjectIDURL:v79];
  [v13 setCurrentContainerObjectIDURLs:v9];
  uint64_t v22 = [v19 type];
  [v13 setCurrentVirtualSmartFolderType:v22];

  uint64_t v23 = [v19 accountObjectID];
  uint64_t v24 = [v23 URIRepresentation];
  [v13 setCurrentVirtualSmartFolderAccountObjectIDURL:v24];

  id v11 = v19;
  id v3 = v14;
  unsigned int v5 = v74;
  id v4 = v76;
  id v10 = v16;
LABEL_20:

  return v13;
}

- (void)selectTagSelection:(id)a3
{
  id v6 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v4 = [(ICViewControllerManager *)self selectionStateController];
    id v5 = [v6 copy];
    [v4 pushTagSelection:v5];
  }
  else
  {
    [(ICViewControllerManager *)self showTagSelection:v6];
  }
}

- (void)selectContainerWithIdentifier:(id)a3 usingRootViewController:(BOOL)a4 deferUntilDataLoaded:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v13 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    if (v13) {
      +[NSSet setWithObject:](NSSet, "setWithObject:");
    }
    else {
    id v10 = +[NSSet set];
    }
    id v11 = +[NSSet set];
    BYTE1(v12) = 1;
    LOBYTE(v12) = a6;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v10, v11, 0, v8, v7, &__kCFBooleanFalse, v12, 0, 0, 0, 0);
  }
  else
  {
    id v10 = +[NSSet ic_setFromNonNilObject:v13];
    id v11 = +[NSSet set];
    LOBYTE(v12) = a6;
    [(ICViewControllerManager *)self showContainerWithIdentifiers:v10 excludingIdentifiers:v11 usingRootViewController:v8 deferUntilDataLoaded:v7 dismissOverlayContent:0 keepEditorShowing:0 animated:v12];
  }
}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  id v14 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BYTE1(v13) = 1;
    LOBYTE(v13) = v7;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v14, v12, 0, v9, v8, 0, v13, 0, 0, 0, 0);
  }
  else
  {
    [(ICViewControllerManager *)self showContainerWithIdentifiers:v14 excludingIdentifiers:v12 usingRootViewController:v9 deferUntilDataLoaded:v8 keepEditorShowing:0 animated:v7];
  }
}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 usingRootViewController:(BOOL)a5 deferUntilDataLoaded:(BOOL)a6 dismissOverlayContent:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v17 = a3;
  id v14 = a4;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    uint64_t v15 = +[NSNumber numberWithBool:v9];
    BYTE1(v16) = 1;
    LOBYTE(v16) = a8;
    -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v17, v14, 0, v11, v10, v15, v16, 0, 0, 0, 0);
  }
  else
  {
    LOBYTE(v16) = a8;
    [(ICViewControllerManager *)self showContainerWithIdentifiers:v17 excludingIdentifiers:v14 usingRootViewController:v11 deferUntilDataLoaded:v10 dismissOverlayContent:v9 keepEditorShowing:0 animated:v16];
  }
}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 noteBrowseViewController:(id)a5 usingRootViewController:(BOOL)a6 deferUntilDataLoaded:(BOOL)a7 dismissOverlayContent:(id)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10 ensureSelectedNote:(id)a11 keepEditorShowing:(id)a12 dataIndexedBlock:(id)a13 dataRenderedBlock:(id)a14
{
  LOWORD(v14) = __PAIR16__(a10, a9);
  -[ICViewControllerManager selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "selectContainerWithIdentifiers:excludingIdentifiers:isChangingDisplayMode:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", a3, a4, 0, a5, a6, a7, a8, v14, a11, a12, a13, a14);
}

- (void)selectContainerWithIdentifiers:(id)a3 excludingIdentifiers:(id)a4 isChangingDisplayMode:(BOOL)a5 noteBrowseViewController:(id)a6 usingRootViewController:(BOOL)a7 deferUntilDataLoaded:(BOOL)a8 dismissOverlayContent:(id)a9 animated:(BOOL)a10 ensurePresented:(BOOL)a11 ensureSelectedNote:(id)a12 keepEditorShowing:(id)a13 dataIndexedBlock:(id)a14 dataRenderedBlock:(id)a15
{
  BOOL v43 = a8;
  BOOL v40 = a5;
  BOOL v42 = a7;
  id v45 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a9;
  id v21 = a12;
  id v44 = a13;
  unint64_t v22 = (unint64_t)a14;
  unint64_t v23 = (unint64_t)a15;
  unsigned int v24 = [(ICViewControllerManager *)self selectionStateTrackingEnabled];
  id v25 = [v45 allObjects];
  unsigned int v26 = [v25 firstObject];
  if (!v24)
  {
    int64_t v29 = [(ICViewControllerManager *)self enforcedNoteContainerViewModeForContainerItemID:v26];

    BOOL v41 = v20 != 0;
    unsigned __int8 v30 = [(ICViewControllerManager *)self isAutomaticallySelectingNotes];
    id v31 = v20;
    id v32 = v19;
    id v33 = v21;
    id v34 = v18;
    if (v29 == 1) {
      unsigned __int8 v35 = 0;
    }
    else {
      unsigned __int8 v35 = v30;
    }
    unsigned int v26 = +[NSNumber numberWithBool:[(ICViewControllerManager *)self isTrashFolderSelected]];
    BYTE2(v39) = v35;
    id v18 = v34;
    id v21 = v33;
    id v19 = v32;
    id v20 = v31;
    LOWORD(v39) = __PAIR16__(a11, a10);
    -[ICViewControllerManager showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:](self, "showContainerWithIdentifiers:excludingIdentifiers:noteBrowseViewController:usingRootViewController:deferUntilDataLoaded:dismissOverlayContent:animated:ensurePresented:ensureSelectedNote:keepEditorShowing:dataIndexedBlock:dataRenderedBlock:", v45, v18, v19, v42, v43, v41, v39, v26, v22, v23);
    goto LABEL_12;
  }

  if ([(id)objc_opt_class() conformsToProtocol:&OBJC_PROTOCOL___ICItemIdentifier])
  {
    if (![(ICViewControllerManager *)self hasCompactWidth])
    {
      BOOL v27 = [(ICViewControllerManager *)self selectionStateController];
      if ([v27 selectedContainerEqualTo:v26] && !v40)
      {
        unsigned int v28 = [(ICViewControllerManager *)self isSearchActive];

        if (v28) {
          goto LABEL_14;
        }
        goto LABEL_12;
      }
    }
LABEL_14:
    if (v22 | v23) {
      uint64_t v37 = [[ICSelectionStateModelContainerSelectionOptionsCompletionBlocks alloc] initWithDataIndexedBlock:v22 dataRenderedBlock:v23];
    }
    else {
      uint64_t v37 = 0;
    }
    id v38 = [(ICViewControllerManager *)self selectionStateController];
    id v36 = v44;
    LOWORD(v39) = __PAIR16__(a11, a10);
    [v38 pushContainerSelectionWithObjectID:v26 forceApply:v40 noteBrowseViewController:v19 super_class:v42 deferUntilDataLoaded:v43 dismissOverlayContent:v20 animated:v39 ensurePresented:v21 ensureSelectedNote:v44 keepEditorShowing:v37 containerSelectionCompletionBlocks:];

    goto LABEL_18;
  }
LABEL_12:
  id v36 = v44;
LABEL_18:
}

- (void)selectObjectWithObjectID:(id)a3
{
  id v6 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]
    && (objc_msgSend(v6, "ic_isContainerType") & 1) == 0)
  {
    id v4 = [(ICViewControllerManager *)self selectionStateController];
    [v4 pushObjectWithObjectID:v6];
  }
  else
  {
    if ([(ICViewControllerManager *)self selectionStateTrackingEnabled]) {
      [(ICViewControllerManager *)self windowStateArchive];
    }
    else {
    id v4 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];
    }
    id v5 = [v6 URIRepresentation];
    [v4 setCurrentObjectIDURL:v5];

    [(ICViewControllerManager *)self applyNoteViewModesToStateRestoreArchive:v4 withContainerItemID:v6];
    [(ICViewControllerManager *)self applyStateRestoreArchive:v4 completion:0];
  }
}

- (void)selectInvitationWithObjectID:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v6 = [(ICViewControllerManager *)self selectionStateController];
    [v6 pushInvitationWithObjectID:v7 animated:v4];
  }
  else
  {
    [(ICViewControllerManager *)self showInvitationWithObjectID:v7 animated:v4];
  }
}

- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 animated:(BOOL)a6 ensurePresented:(BOOL)a7
{
  BYTE1(v7) = a7;
  LOBYTE(v7) = a6;
  -[ICViewControllerManager selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "selectNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", a3, a4, a5, 0, 1, 1, v7);
}

- (void)selectNoteWithObjectID:(id)a3 scrollState:(id)a4 startEditing:(BOOL)a5 showInkPicker:(BOOL)a6 dismissOverlayContent:(BOOL)a7 showLatestUpdatesIfAvailable:(BOOL)a8 animated:(BOOL)a9 ensurePresented:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v20 = a3;
  id v16 = a4;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    id v17 = [(ICViewControllerManager *)self selectionStateController];
    if ([(ICViewControllerManager *)self isSearchActive])
    {
      id v18 = [(ICViewControllerManager *)self selectedSearchResult];
      LOWORD(v19) = __PAIR16__(a10, a9);
      [v17 pushNoteSelectionWithObjectID:v20 scrollState:v16 startEditing:v13 showInkPicker:v12 dismissOverlayContent:v11 showLatestUpdatesIfAvailable:v10 animated:v19 ensurePresented:v18];
    }
    else
    {
      LOWORD(v19) = __PAIR16__(a10, a9);
      [v17 pushNoteSelectionWithObjectID:v20 scrollState:v16 startEditing:v13 showInkPicker:v12 dismissOverlayContent:v11 showLatestUpdatesIfAvailable:v10 animated:v19 ensurePresented:0 searchResult:0];
    }
  }
  else
  {
    LOWORD(v19) = __PAIR16__(a10, a9);
    -[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v20, v16, v13, v12, v11, v10, v19);
  }
}

- (void)selectNoteStartEditingIfEmptyWithObjectID:(id)a3 scrollState:(id)a4 animated:(BOOL)a5 ensurePresented:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    if (objc_msgSend(v10, "ic_isModernNoteType"))
    {
      BOOL v12 = [(ICViewControllerManager *)self modernManagedObjectContext];
      BOOL v13 = v15;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100052DC4;
      v15[3] = &unk_100625CA0;
      void v15[4] = self;
      v15[5] = v10;
      v15[6] = &v16;
      [v12 performBlockAndWait:v15];
    }
    else
    {
      if (!objc_msgSend(v10, "ic_isLegacyNoteType"))
      {
LABEL_7:
        [(ICViewControllerManager *)self selectNoteWithObjectID:v10 scrollState:v11 startEditing:*((unsigned __int8 *)v17 + 24) animated:v7 ensurePresented:v6];
        _Block_object_dispose(&v16, 8);
        goto LABEL_8;
      }
      BOOL v12 = [(ICViewControllerManager *)self legacyManagedObjectContext];
      BOOL v13 = v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100052E38;
      v14[3] = &unk_100625CA0;
      v14[4] = self;
      void v14[5] = v10;
      v14[6] = &v16;
      [v12 performBlockAndWait:v14];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)selectAttachmentWithObjectID:(id)a3 animated:(BOOL)a4
{
  id v12 = a3;
  if ([(ICViewControllerManager *)self selectionStateTrackingEnabled])
  {
    BOOL v6 = [(ICViewControllerManager *)self selectionStateController];
    BYTE1(v11) = 1;
    LOBYTE(v11) = a4;
    [v6 pushAttachmentSelectionWithObjectID:v12 scrollState:0 startEditing:0 showInkPicker:0 dismissOverlayContent:1 showLatestUpdatesIfAvailable:1 animated:0 ensurePresented:v11];
  }
  else
  {
    if (!objc_msgSend(v12, "ic_isBaseAttachmentType")) {
      goto LABEL_6;
    }
    BOOL v7 = [(ICViewControllerManager *)self modernManagedObjectContext];
    BOOL v6 = [v7 objectWithID:v12];

    BOOL v8 = [v6 note];
    BOOL v9 = +[ICTextViewScrollState scrollStateForAttachment:v6 inNote:v8];
    id v10 = [v8 objectID];
    BYTE1(v11) = 1;
    LOBYTE(v11) = a4;
    -[ICViewControllerManager showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:](self, "showNoteWithObjectID:scrollState:startEditing:showInkPicker:dismissOverlayContent:showLatestUpdatesIfAvailable:animated:ensurePresented:", v10, v9, 0, 0, 1, 0, v11);
  }
LABEL_6:
}

- (void)selectModel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ICViewControllerManager *)self selectionStateController];
    [v5 pushModel:v4 navigating:0];
  }
}

- (void)adoptContainerFromSelectionStateController:(id)a3 oldModel:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  performBlockOnMainThread();
}

- (void)adoptObjectFromSelectionStateController:(id)a3 oldModel:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  performBlockOnMainThread();
}

- (void)selectionStateController:(id)a3 didAdoptModelFromOldModel:(id)a4 isNavigating:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100053D40;
  v17[3] = &unk_100625A00;
  void v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  uint64_t v16 = objc_retainBlock(v17);
  id v11 = v16;
  id v12 = v10;
  id v13 = v9;
  performBlockOnMainThread();
}

- (BOOL)shouldRevertToDefaultFolderWhenUnselectingTagsForSelectionStateController:(id)a3
{
  BOOL v4 = [(ICViewControllerManager *)self hasCompactWidth];
  if (v4)
  {
    LOBYTE(v4) = [(ICViewControllerManager *)self isNoteEditorVisible];
  }
  return v4;
}

- (BOOL)shouldRevertToAllTagsWhenUnselectingTagsForSelectionStateController:(id)a3
{
  BOOL v4 = [(ICViewControllerManager *)self hasCompactWidth];
  if (v4) {
    LOBYTE(v4) = ![(ICViewControllerManager *)self isNoteEditorVisible];
  }
  return v4;
}

- (BOOL)shouldRevertToMostRecentlySelectedNonSearchObjectOnNavigationTransitionForSelectionStateController:(id)a3
{
  if ([(ICViewControllerManager *)self isSearchActive]) {
    return 0;
  }

  return [(ICViewControllerManager *)self isAutomaticallySelectingNotes];
}

- (BOOL)shouldRevertToMostRecentlySelectedSearchResultOnNavigationTransitionForSelectionStateController:(id)a3
{
  BOOL v4 = [(ICViewControllerManager *)self isSearchActive];
  if (v4)
  {
    LOBYTE(v4) = [(ICViewControllerManager *)self isAutomaticallySelectingNotes];
  }
  return v4;
}

- (void)selectionStateController:(id)a3 didAdoptInstantNoteModelFromArchive:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  performBlockOnMainThread();
}

- (void)selectionStateController:(id)a3 didIgnoreDuplicateModel:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  performBlockOnMainThread();
}

- (id)selectionStateController:(id)a3 scrollStateForObjectID:(id)a4
{
  id v5 = a4;
  if (objc_msgSend(v5, "ic_isModernNoteType")
    && [(ICViewControllerManager *)self objectAlreadyLoadedInEditorWithObjectID:v5])
  {
    id v6 = [(ICViewControllerManager *)self noteEditorViewController];
    id v7 = [v6 currentScrollState];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)hostedNotesAppearanceCoordinatorModeButtonHidingModalTypes:(id)a3
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (id)hostedNotesAppearanceCoordinatorModeButtonHidingPopoverTypes:(id)a3
{
  Class v3 = NSClassFromString(@"PKPaletteAttributeViewController");
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (BOOL)hostedNotesAppearanceCoordinator:(id)a3 shouldHideWithModal:(id)a4
{
  return +[ICAudioRecordingViewController presentedViewControllerIsAudio:a4];
}

- (void)setKeyboardHandler:(id)a3
{
}

- (void)setSystemPaperViewController:(id)a3
{
}

- (void)setWelcomeScreenVisible:(BOOL)a3
{
  self->_welcomeScreenVisible = a3;
}

- (ICAttachmentPresenter)currentAttachmentPresenter
{
  return self->_currentAttachmentPresenter;
}

- (void)setCurrentAttachmentPresenter:(id)a3
{
}

- (UIApplicationShortcutItem)selectedNewNoteShortcutItem
{
  return self->_selectedNewNoteShortcutItem;
}

- (ICStartupNavigationController)startupNavigationController
{
  return self->_startupNavigationController;
}

- (void)setStartupNavigationController:(id)a3
{
}

- (void)setProposedMainSplitViewControllerDisplayMode:(int64_t)a3
{
  self->_proposedMainSplitViewControllerDisplayMode = a3;
}

- (ICOverlayWindowPresenter)startupPresenter
{
  return self->_startupPresenter;
}

- (void)setStartupPresenter:(id)a3
{
}

- (void)setPrimaryContainerViewController:(id)a3
{
}

- (void)setPrimaryNavigationController:(id)a3
{
}

- (void)setCompactNavigationController:(id)a3
{
}

- (void)setTrailingSidebarContainerViewController:(id)a3
{
}

- (ICColumnVisibilityController)columnVisibilityController
{
  return self->_columnVisibilityController;
}

- (void)setColumnVisibilityController:(id)a3
{
}

- (int64_t)preferredNoteContainerViewMode
{
  return self->_preferredNoteContainerViewMode;
}

- (void)setIsSelectedNoteTogglingLock:(BOOL)a3
{
  self->_isSelectedNoteTogglingLock = a3;
}

- (BOOL)isTagBeingRenamed
{
  return self->_isTagBeingRenamed;
}

- (void)setIsTagBeingRenamed:(BOOL)a3
{
  self->_isTagBeingRenamed = a3;
}

- (BOOL)isTagBeingDeleted
{
  return self->_isTagBeingDeleted;
}

- (void)setIsTagBeingDeleted:(BOOL)a3
{
  self->_isTagBeingDeleted = a3;
}

- (BOOL)isNoteBeingRecovered
{
  return self->_isNoteBeingRecovered;
}

- (void)setIsNoteBeingRecovered:(BOOL)a3
{
  self->_isNoteBeingRecovered = a3;
}

- (void)setIsRecoveredNoteBeingPresented:(BOOL)a3
{
  self->_isRecoveredNoteBeingPresented = a3;
}

- (BOOL)isSelectingNextRelevantNoteBrowseContainer
{
  return self->_isSelectingNextRelevantNoteBrowseContainer;
}

- (void)setIsSelectingNextRelevantNoteBrowseContainer:(BOOL)a3
{
  self->_isSelectingNextRelevantNoteBrowseContainer = a3;
}

- (BOOL)isMainSplitViewColumnDisplaced
{
  return self->_isMainSplitViewColumnDisplaced;
}

- (void)setIsMainSplitViewColumnDisplaced:(BOOL)a3
{
  self->_isMainSplitViewColumnDisplaced = a3;
}

- (ICItemIdentifier)mostRecentRegularWidthSelectedNoteBrowseContainerItemID
{
  return self->_mostRecentRegularWidthSelectedNoteBrowseContainerItemID;
}

- (ICTagSelection)mostRecentRegularWidthTagSelection
{
  return self->_mostRecentRegularWidthTagSelection;
}

- (NSManagedObjectID)mostRecentRegularWidthSelectedNoteObjectID
{
  return self->_mostRecentRegularWidthSelectedNoteObjectID;
}

- (BOOL)isSearchActiveWithQuery
{
  return self->_isSearchActiveWithQuery;
}

- (void)setIsSearchActiveWithQuery:(BOOL)a3
{
  self->_isSearchActiveWithQuery = a3;
}

- (void)setEventReporter:(id)a3
{
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
}

- (void)setUndoManager:(id)a3
{
}

- (void)setSelectionStateController:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (void)setHostedNotesAppearanceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedNotesAppearanceCoordinator, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionStateController, 0);
  objc_storeStrong((id *)&self->_intentsInteractionController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthTagSelection, 0);
  objc_storeStrong((id *)&self->_mostRecentRegularWidthSelectedNoteBrowseContainerItemID, 0);
  objc_storeStrong((id *)&self->_columnVisibilityController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarSplitViewController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarContainerViewController, 0);
  objc_storeStrong((id *)&self->_compactNavigationController, 0);
  objc_storeStrong((id *)&self->_secondaryNavigationController, 0);
  objc_storeStrong((id *)&self->_supplementaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryContainerViewController, 0);
  objc_storeStrong((id *)&self->_startupPresenter, 0);
  objc_storeStrong((id *)&self->_startupNavigationController, 0);
  objc_storeStrong((id *)&self->_selectedNewNoteShortcutItem, 0);
  objc_storeStrong((id *)&self->_currentAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_systemPaperViewController, 0);
  objc_storeStrong((id *)&self->_activityStreamNavigationController, 0);
  objc_storeStrong((id *)&self->_currentNoteBrowseViewController, 0);
  objc_storeStrong((id *)&self->_rootNoteBrowseViewController, 0);
  objc_storeStrong((id *)&self->_folderListViewController, 0);
  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
  objc_storeStrong((id *)&self->_legacyNoteEditorViewController, 0);
  objc_storeStrong((id *)&self->_mainSplitViewController, 0);
  objc_storeStrong((id *)&self->_trailingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_keyboardHandler, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_persistenceConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedSearchResult, 0);
  objc_storeStrong((id *)&self->_previousSelectedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_mostRecentNonSearchContainerItemID, 0);
  objc_storeStrong((id *)&self->_activityStreamSelection, 0);
  objc_storeStrong((id *)&self->_focusedNoteObjectID, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
  objc_storeStrong((id *)&self->_selectedInvitationObjectID, 0);
  objc_storeStrong((id *)&self->_selectedNoteObjectID, 0);

  objc_storeStrong((id *)&self->_selectedNoteBrowseContainerItemID, 0);
}

+ (void)createDonationOf:(NSURL *)a3 transcript:(NSString *)a4 date:(NSDate *)a5 isFeedbackPositive:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_10002F214(&qword_1006A09A0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = a1;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  id v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1006A3588;
  void v19[5] = v17;
  id v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  void v20[4] = &unk_1006A3590;
  void v20[5] = v19;
  id v21 = a3;
  unint64_t v22 = a4;
  unint64_t v23 = a5;
  sub_1003E0CC4((uint64_t)v15, (uint64_t)&unk_1006A3598, (uint64_t)v20);
  swift_release();
}

+ (id)trimBuffer:(id)a3 toFrameLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  sub_10032FAF0(v5, v4);
  id v7 = v6;

  return v7;
}

@end
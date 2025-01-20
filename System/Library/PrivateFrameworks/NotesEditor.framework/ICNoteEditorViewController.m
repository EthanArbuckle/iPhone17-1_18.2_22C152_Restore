@interface ICNoteEditorViewController
+ (UIMenu)formatKeyboardShortcutMenu;
+ (id)editorViewControllerWithIdentifier:(int64_t)a3 options:(unint64_t)a4;
+ (id)keyPathsForValuesAffectingTextView;
+ (void)dismissChildPresentedViewControllersInPostOrder:(id)a3 animated:(BOOL)a4 completion:(id)a5;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)addDocumentScanAfterViewAppears;
- (BOOL)addSystemPaperLink:(id)a3 updateFirstResponder:(BOOL)a4;
- (BOOL)addToDoListAfterViewAppears;
- (BOOL)allowsAccessibilityChildReparenting;
- (BOOL)allowsNewTextLength:(unint64_t)a3;
- (BOOL)attachmentPresenter:(id)a3 useFullPDFTransitionForAttachment:(id)a4;
- (BOOL)attachmentView:(id)a3 shouldRespondToPanGestureTouch:(id)a4 forAttachment:(id)a5;
- (BOOL)becomeFirstResponder;
- (BOOL)canAddToTags;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canConvertToTag;
- (BOOL)canConvertToText;
- (BOOL)canFindInNote;
- (BOOL)canIndentByAmount:(int64_t)a3;
- (BOOL)canIndentLeft;
- (BOOL)canIndentRight;
- (BOOL)canMoveSelectedListItemDown;
- (BOOL)canMoveSelectedListItemUp;
- (BOOL)canOpenLink;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformCreateImageWithSelection;
- (BOOL)canShowLinkBar;
- (BOOL)currentSelectionContainsListOrFixedWidth;
- (BOOL)didDrawWithPencilWithoutPalette;
- (BOOL)didEndEditingForAddingImageAttachment;
- (BOOL)doNotAdvanceInsertionPointAfterInsertingAttachment;
- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)handleTapGestureForAttribution:(id)a3;
- (BOOL)hasKeyboardBeenVisibleBefore;
- (BOOL)hasMadeEdits;
- (BOOL)ignoresTaps;
- (BOOL)inStartEditingForWritingTools;
- (BOOL)inkPalette:(id)a3 shouldResignFirstResponder:(id)a4;
- (BOOL)isAddingImageAttachment;
- (BOOL)isBlockQuoteSet;
- (BOOL)isConvertToTag;
- (BOOL)isDocumentCameraAvailable;
- (BOOL)isDrawingStroke;
- (BOOL)isDrawingStrokeWithPencil;
- (BOOL)isEditingNewNote;
- (BOOL)isEditingOnSystemPaperOnPad;
- (BOOL)isEditingOnSystemPaperOnPhone;
- (BOOL)isInkPickerShowing;
- (BOOL)isLoadingStyleSelectorInputView;
- (BOOL)isNewInk:(id)a3;
- (BOOL)isOnlyBlockQuoteEnabled;
- (BOOL)isPaperLinkBarShowing;
- (BOOL)isPasswordEntryShowing;
- (BOOL)isPerformingDeleteAnimation;
- (BOOL)isPhotosLibraryAvailable;
- (BOOL)isPositionOnTodoItem:(CGPoint)a3;
- (BOOL)isPreviewingAttachmentFromNote;
- (BOOL)isSelecting;
- (BOOL)isSettingEditing;
- (BOOL)isSettingSelection;
- (BOOL)isShowingAudioInspector;
- (BOOL)isShowingChecklistItems;
- (BOOL)isShowingIndentationItems;
- (BOOL)isShowingMiniPlayer;
- (BOOL)isSplitViewExpandingOrCollapsing;
- (BOOL)isStyleSelectorInputViewPresenting;
- (BOOL)isSwipeOnTodoItem:(id)a3;
- (BOOL)isTogglingLock;
- (BOOL)keyboardResizerAutoscrollAboveKeyboard;
- (BOOL)languageHasSpaces;
- (BOOL)linksBarNeedsAnimationWhileEditorIsVisible;
- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3;
- (BOOL)needsInitialBarConfiguration;
- (BOOL)needsToPerformInitialPaperAnimations;
- (BOOL)noteHasAnyPencilKitDrawings;
- (BOOL)preventSnappingToLastPaperDocument;
- (BOOL)previouslyHadMarkedText;
- (BOOL)quickNoteiPhoneDidSaveOrCancel;
- (BOOL)resignFirstResponder;
- (BOOL)rulerHostWantsSharedRuler;
- (BOOL)shouldAllowAttributionSidebar;
- (BOOL)shouldBeginEditingAfterNoteUnlock;
- (BOOL)shouldBlockHitTestOnTextView:(id)a3 event:(id)a4;
- (BOOL)shouldClearBackgroundColorAfterPreview;
- (BOOL)shouldClearCornerRadiusAfterPreview;
- (BOOL)shouldEnablePencilGestures;
- (BOOL)shouldFireNoteViewEventOnViewDisappear;
- (BOOL)shouldForceLightContent;
- (BOOL)shouldIgnoreTapToStartEditingTextView:(id)a3;
- (BOOL)shouldInputAccessoryViewButtonsBeVisible;
- (BOOL)shouldInsertNewDrawingsAsPaper;
- (BOOL)shouldLockTextViewContentOffset;
- (BOOL)shouldOverscrollScrollState;
- (BOOL)shouldRemoveEmptyNoteWhenViewDisappeared;
- (BOOL)shouldResetTextViewContentOffsetWhenAppearing;
- (BOOL)shouldShowFloatingSuggestions;
- (BOOL)shouldShowMenuItems;
- (BOOL)shouldStartEditingForTapGesture:(id)a3;
- (BOOL)shouldTrackNoteViewEventAnalyticsFromSettingNote;
- (BOOL)shouldUseiPadBarLayout;
- (BOOL)showInkPickerAfterViewAppears;
- (BOOL)showInsertUIAfterViewAppears;
- (BOOL)startEditingAfterViewAppears;
- (BOOL)styleSelectorInputViewShowing;
- (BOOL)styleSelectorShouldDisableTextStyles:(id)a3;
- (BOOL)styleSelectorShouldUseCompactTopInset:(id)a3;
- (BOOL)suspendBarButtonUpdates;
- (BOOL)suspendSelectedRangeUpdates;
- (BOOL)suspendTapGestureRecognizer;
- (BOOL)tableButtonsShowMore;
- (BOOL)textView:(id)a3 canAddDrawingAtIndex:(unint64_t)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textViewCanAddStroke:(id)a3;
- (BOOL)textViewCanSelectDrawing:(id)a3;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (BOOL)toggleInkPickerAnimated:(BOOL)a3;
- (BOOL)updateContentSizeCategoryWhenVisible;
- (BOOL)useInputViewForStyleSelector;
- (BOOL)userWantsToSeeDateLabel;
- (BOOL)usesCustomTransition;
- (BOOL)wantsToRemainFirstResponder;
- (BOOL)wasEditingBeforeDrawing;
- (BOOL)wasWindowlessDuringTransitionToSize;
- (CGPoint)changePasswordContentOffset;
- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6;
- (ICActivityStreamDockView)activityStreamToolbar;
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICAttachmentPresenter)quickNoteiPhoneAttachmentPresenter;
- (ICAttributionSidebarController)attributionSidebarController;
- (ICAttributionSidebarView)attributionSidebarView;
- (ICAudioAttachmentEditorCoordinator)audioAttachmentEditorCoordinator;
- (ICAudioBarViewController)audioBarViewController;
- (ICAuthorHighlightsController)authorHighlightsController;
- (ICAuthorHighlightsUpdater)authorHighlightsUpdater;
- (ICAuxiliaryStyling)auxiliaryStylingController;
- (ICBluetoothKeyboardHintViewController)bluetoothKeyboardHintViewController;
- (ICCalculateGraphingController)calculateGraphingController;
- (ICCalculateRecognitionController)calculateRecognitionController;
- (ICCalculateScrubberController)calculateScrubberController;
- (ICCollaborationButtonsController)collaborationButtonsController;
- (ICHandwritingDebugPresenter)handwritingDebugPresenter;
- (ICHashtagController)hashtagController;
- (ICInkPaletteController)inkPaletteController;
- (ICInkToolPickerResponder)paletteResponder;
- (ICInlineCanvasTextAttachment)selectedCanvasAttachment;
- (ICInvitation)invitation;
- (ICInvitationViewController)invitationViewController;
- (ICLinkAcceleratorController)linkAcceleratorController;
- (ICManagedObjectContextChangeController)inlineAttachmentChangeController;
- (ICManagedObjectContextChangeController)noteAndFolderChangeController;
- (ICMentionsController)mentionsController;
- (ICNAEventReporter)audioEventReporter;
- (ICNAEventReporter)eventReporter;
- (ICNAFindResultExposureReporter)findResultReporter;
- (ICNote)previousNote;
- (ICNoteContext)noteContext;
- (ICNoteEditorDelegate)delegate;
- (ICNoteEditorInputAccessoryView)textViewInputAccessoryView;
- (ICNoteEditorNavigationItemConfiguration)navigationItemConfiguration;
- (ICNoteEditorTextFindingController)textFindingController;
- (ICNoteEditorViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4;
- (ICNoteFormattingViewController)noteFormattingController;
- (ICNoteFormattingViewController)noteFormattingControllerCreateIfNecessary;
- (ICNoteUserActivityState)noteUserActivityState;
- (ICPaperTextAttachmentManager)paperTextAttachmentManager;
- (ICPasswordEntryViewController)lockIconCoverViewController;
- (ICPasswordEntryViewController)passwordEntryViewController;
- (ICSearchResultRegexMatchFinder)searchRegexFinder;
- (ICSelectorDelayer)applyAccessibilityInfoDelayer;
- (ICSelectorDelayer)noteOrFolderChangedCallbackSelectorDelayer;
- (ICSelectorDelayer)showOrHideSearchPatternHighlightsDelayer;
- (ICSelectorDelayer)updateNoteUserActivityStateDelayer;
- (ICShareNoteExporter)noteExporter;
- (ICStyleSelectorViewController)styleSelectorController;
- (ICSystemPaperLinkBarViewController)paperLinkBarViewController;
- (ICTTMergeableStringSelection)originalEndOfNote;
- (ICTTTextStorage)textStorage;
- (ICTextController)textController;
- (ICTextView)textView;
- (ICTextView)textViewIfLoaded;
- (ICTextViewController)textViewController;
- (ICTextViewScrollState)archivedScrollStateToApply;
- (ICTextViewScrollState)currentScrollState;
- (ICUnsupportedNoteView)unsupportedNoteView;
- (ICViewControllerManager)viewControllerManager;
- (ICVisualAssetImportController)visualAssetImportController;
- (LinkEditorViewController)linkEditorViewController;
- (NSArray)extraItemsBeforeCustomCalloutOptions;
- (NSArray)indentKeyCommands;
- (NSArray)indentRTLKeyCommands;
- (NSArray)keyboardButtonItems;
- (NSArray)swipeGestureRecognizers;
- (NSDate)dateOfLastStrokeOrNewDrawing;
- (NSDate)keyboardAnimateInFinishTime;
- (NSDate)keyboardDidShowAnimationDate;
- (NSDate)noteLastModificationDate;
- (NSLayoutConstraint)activityStreamToolbarBottomConstraint;
- (NSLayoutConstraint)paperLinkBarTopConstraint;
- (NSManagedObjectID)noteViewEventSourceObjectID;
- (NSMutableDictionary)savedScrollStates;
- (NSMutableSet)enabledSubviews;
- (NSString)hostBundleIdentifier;
- (NSUUID)createdGalleryAttachmentUUID;
- (NSUndoManager)magicGenerativePlaygroundUndoManager;
- (NSUndoManager)textViewUndoManager;
- (NSUserActivity)noteUserActivity;
- (NotesBackgroundView)backgroundView;
- (OS_dispatch_queue)userActivityUpdateQueue;
- (PKTool)lastSavedInkingTool;
- (UIActivityItemsConfigurationProviding)activityItemsConfigurationProvider;
- (UIAlertController)limitExceededAlertController;
- (UIBarButtonItem)collaborationBarButtonItem;
- (UIBarButtonItem)icaxAddAttachmentBarItem;
- (UIBarButtonItem)icaxCameraBarButton;
- (UIBarButtonItem)icaxCameraBarButtonCompact;
- (UIBarButtonItem)icaxDrawBarButton;
- (UIBarButtonItem)icaxDrawBarButtonCompact;
- (UIBarButtonItem)icaxRecordAudioBarButton;
- (UIBarButtonItem)icaxRecordAudioBarButtonCompact;
- (UIBarButtonItem)icaxSelectStyleBarItem;
- (UIBarButtonItem)icaxToggleTodoBarItem;
- (UIEdgeInsets)textViewScrollIndicatorInsetsThatWeWant;
- (UIResponder)auxiliaryResponder;
- (UITapGestureRecognizer)unsupportedNoteTapGestureRecognizer;
- (UITextRange)selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation;
- (UITouch)currentStrokeStartTouch;
- (UIView)rulerHostingView;
- (UIView)styleSelectorDummyInputView;
- (UIViewController)rootViewController;
- (_NSRange)charRangeForSwipeTextRange:(id)a3;
- (_NSRange)lastSelectedRange;
- (_NSRange)lastSelectedRangeForAccelerator;
- (_NSRange)textViewVisibleRange;
- (_NSRange)visibleRange;
- (double)inputAccessoryViewHeight;
- (double)textViewBottomInsetThatWeWant;
- (double)textViewBottomInsetThatWeWantForEditing:(BOOL)a3;
- (double)textViewBottomPaddingVisibleRatio;
- (double)textViewMinimumBottomInset;
- (double)textViewScrollIndicatorBottomInsetOverride;
- (double)textViewScrollIndicatorBottomInsetOverrideToRestore;
- (double)textViewScrollPosition;
- (double)textViewTopInsetThatWeWant;
- (id)addNewNote;
- (id)addNewNoteWithEvent:(id)a3;
- (id)addQuickNoteWithPencil:(BOOL)a3;
- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4;
- (id)attachmentViewForTextAttachment:(id)a3 characterIndex:(int64_t)a4;
- (id)attributedStringFromHTML:(id)a3;
- (id)barButtonItemWithImage:(id)a3 selector:(SEL)a4;
- (id)contextMenuInteraction:(id)a3;
- (id)createNewNote;
- (id)currentStylesForStyleSelectorIgnoreTypingAttributes:(BOOL)a3;
- (id)currentValidToolForNewDrawingOrNote;
- (id)defaultInkColor;
- (id)documentCameraControllerCreateDataCryptorIfNecessary;
- (id)drawingsForHandwritingDebug;
- (id)dynamicBarColor;
- (id)firstEmbeddedScrollViewInView:(id)a3;
- (id)flexibleSpaceBarButtonItem;
- (id)getTableControllerFor:(id)a3;
- (id)iCloudShareBarButtonItem;
- (id)icSplitViewController;
- (id)inkPaletteButtonView:(id)a3;
- (id)inkPaletteUndoManager:(id)a3;
- (id)inlineDrawingAttachmentForPoint:(CGPoint)a3;
- (id)lastPaperDocumentAttachmentView;
- (id)linkForSelection;
- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4;
- (id)nibBundle;
- (id)noteEditorNavigationItemConfigurationChecklistAccessibilityValue:(id)a3;
- (id)noteEditorNavigationItemConfigurationInputAccessoryToolbar:(id)a3;
- (id)noteEditorNavigationItemConfigurationInputAssistantItem:(id)a3;
- (id)noteEditorNavigationItemConfigurationTableAttachmentViewController:(id)a3;
- (id)noteEditorNavigationItemConfigurationToolbar:(id)a3;
- (id)noteFormattingTintColor;
- (id)notePreviewView:(id)a3;
- (id)notesQuickLookActivityItem:(id)a3 transitionViewForPreviewItem:(id)a4 previewController:(id)a5;
- (id)radarTitleForHandwritingDebug;
- (id)scanDataDelegateWithIdentifier:(id)a3;
- (id)systemImageNameForAddCollaboratorsActivity:(id)a3;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 newAttachmentForFileType:(id)a4;
- (id)textView:(id)a3 writingToolsIgnoredRangesInEnclosingRange:(_NSRange)a4;
- (id)titleForAddCollaboratorsActivity:(id)a3;
- (id)undoManager;
- (id)userActivity;
- (id)viewForAttachment:(id)a3;
- (int64_t)attributionSidebarVisibility;
- (int64_t)currentEmphasisType;
- (int64_t)currentWritingDirection;
- (int64_t)icasPalettePositionFromPKPalettePosition:(int64_t)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)uniqueCollapsibleSectionAffordanceExposures;
- (int64_t)uniqueCollapsibleSectionAffordanceUsages;
- (int64_t)writingDirection;
- (unint64_t)currentBIUSForStyleSelector;
- (unint64_t)inkPickerState;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_scrollViewDidInterruptDecelerating:(id)a3;
- (void)_textViewDidEndUndoCoalescingForWritingTools:(id)a3;
- (void)_textViewWillBeginUndoCoalescingForWritingTools:(id)a3;
- (void)acceleratorOriginNeedsUpdate;
- (void)addKVOObserversForNote:(id)a3;
- (void)addNewNoteIfNeeded;
- (void)addNote:(id)a3;
- (void)addNote:(id)a3 event:(id)a4 shouldInstrumentAsNewNoteAffordanceUsage:(BOOL)a5;
- (void)addSystemPaperAttachment;
- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4;
- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4 forceAddToPaper:(BOOL)a5;
- (void)addTable:(id)a3;
- (void)addToGraph:(id)a3;
- (void)addToTags:(id)a3;
- (void)addTodoListAtEndOfNote;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applyAccessibilityInfo;
- (void)applyScrollStateFromArchive:(id)a3;
- (void)applyScrollStateIfAvailable;
- (void)attachFile:(id)a3;
- (void)attachmentBrickDidChangeSize;
- (void)attachmentInsertionController:(id)a3 didAddAttachment:(id)a4 atRange:(_NSRange)a5;
- (void)attachmentInsertionController:(id)a3 didAddInlineAttachment:(id)a4 atRange:(_NSRange)a5 textStorage:(id)a6;
- (void)attachmentInsertionController:(id)a3 willAddAttachment:(id)a4 atRange:(_NSRange)a5;
- (void)attachmentPresenterDidDismiss:(id)a3;
- (void)attachmentView:(id)a3 shouldPresentAttachment:(id)a4;
- (void)attachmentView:(id)a3 shouldPresentNote:(id)a4;
- (void)attachmentView:(id)a3 shouldShareAttachment:(id)a4;
- (void)audioBarViewControllerDone:(id)a3;
- (void)audioEventReporterLostSession:(id)a3;
- (void)audioFindInTranscript:(id)a3;
- (void)audioPlaybackPlayNotification:(id)a3;
- (void)audioRecordingStarted:(id)a3;
- (void)audioRecordingStopped:(id)a3;
- (void)audioTranscriptInteraction:(id)a3;
- (void)authenticationAuthenticateBiometricsAttemptDidFail:(id)a3;
- (void)blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:(double)a3;
- (void)calculateDocumentControllerDidUpdateHighlights:(id)a3;
- (void)cancelFromSystemPaperCard:(id)a3;
- (void)changeIndentationByIncreasing:(BOOL)a3 sender:(id)a4;
- (void)changeStyle:(id)a3;
- (void)checkAll:(id)a3;
- (void)cleanupAfterAddImageAttachmentOperation;
- (void)cleanupAfterBarSourcedPopoverPresentation;
- (void)cleanupAfterFingerDrawing;
- (void)clearTextViewSelection;
- (void)contentSizeCategoryDidChange;
- (void)convertToTag:(id)a3;
- (void)convertToText:(id)a3;
- (void)createAndPresentCloudSharingControllerBySender:(id)a3;
- (void)createImage:(id)a3;
- (void)createInkPickerControllerIfNecessary;
- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7;
- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6;
- (void)createSystemPaperLinkBarIfNecessary;
- (void)createTodoListItem:(id)a3;
- (void)dealloc;
- (void)decreaseIndentation:(id)a3;
- (void)deleteCurrentNote:(id)a3;
- (void)didAddAttachmentForNoteNotification:(id)a3;
- (void)didBeginFindInteraction;
- (void)didEndEditingNote;
- (void)didEndFindInteraction;
- (void)didInvokeAnalyticsCalloutBarButtonActionOfType:(int64_t)a3;
- (void)didInvokeAnalyticsChecklistActionChecked:(BOOL)a3;
- (void)didInvokePasteWithAttributedString:(id)a3;
- (void)didUpdateSearchQueryInFindInteraction:(id)a3;
- (void)disableBoldface;
- (void)disableItalics;
- (void)disableStrikethrough;
- (void)disableUnderline;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6;
- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7;
- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3;
- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4;
- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)donateEditingIntentIfNecessary;
- (void)doneEditing;
- (void)doneEditing:(id)a3;
- (void)enableBoldface;
- (void)enableItalics;
- (void)enableStrikethrough;
- (void)enableUnderline;
- (void)ensurePaperPreviewsExistIfNecessary;
- (void)ensureValidInkForNewDrawingOrNote;
- (void)eventReporterLostSession:(id)a3;
- (void)fetchAll;
- (void)gridViewBack:(id)a3;
- (void)handleLeftOrRightSwipe:(id)a3;
- (void)handleMenuBarButtonTap:(id)a3;
- (void)handwritingDebugShouldClose;
- (void)hashtagInsertedInNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5;
- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4;
- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4;
- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4;
- (void)hideAcceleratorIfNecessary;
- (void)hideActivityStreamToolbarAnimated:(BOOL)a3;
- (void)hideAndDismissPresentedViewController;
- (void)hideInkPicker;
- (void)iCloudShareButtonPressed:(id)a3;
- (void)icaxToggleTodoStyle;
- (void)increaseIndentation:(id)a3;
- (void)indentLeft:(id)a3;
- (void)indentRight:(id)a3;
- (void)indentSelectionIfPossibleByAmount:(int64_t)a3;
- (void)inkPalette:(id)a3 didChangeColor:(id)a4;
- (void)inkPalette:(id)a3 didChangePalettePositionStart:(int64_t)a4 end:(int64_t)a5;
- (void)inkPalette:(id)a3 didHideAnimated:(BOOL)a4;
- (void)inkPalette:(id)a3 didPickTool:(id)a4;
- (void)inkPalette:(id)a3 didShowAnimated:(BOOL)a4;
- (void)inkPalette:(id)a3 willHideAnimated:(BOOL)a4;
- (void)inkPalette:(id)a3 willShowAnimated:(BOOL)a4;
- (void)inkPaletteDidHideWithDoneButton:(id)a3;
- (void)inkPaletteDidToggleRuler:(id)a3 isRulerActive:(BOOL)a4;
- (void)inlineAttachmentDeleted:(id)a3;
- (void)inputAccessoryDisclosureStateDidChange:(id)a3 tapped:(BOOL)a4;
- (void)inputAccessoryDisclosureStateWillChange:(id)a3;
- (void)insertGraph:(id)a3;
- (void)insertSidecarItems:(id)a3 service:(int64_t)a4;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardResizerAdjustInsetsWithKeyboardFrame:(CGRect)a3 scrollAboveHeight:(double)a4 duration:(double)a5;
- (void)lastSavedInkingTool;
- (void)linkEditorWillDismiss;
- (void)localeChanged:(id)a3;
- (void)lockBarButtonPressed:(id)a3;
- (void)lockNoteManagerDidToggleLock:(id)a3;
- (void)lockNoteManagerWillToggleLock:(id)a3;
- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4;
- (void)mentionInsertedInNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6;
- (void)mergeRelatedOperationsDidEnd:(id)a3;
- (void)moveCheckedToBottom:(id)a3;
- (void)moveSelectedListItemDown:(id)a3;
- (void)moveSelectedListItemUp:(id)a3;
- (void)moveToFolderPressed:(id)a3;
- (void)noteAnalyticsAddAttachment:(id)a3;
- (void)noteDecryptedStatusDidChange:(id)a3;
- (void)noteDidChangeCalculatePreviewBehaviorNotification:(id)a3;
- (void)noteDidDeauthenticateAfterMerge:(id)a3;
- (void)noteEditorNavigationItemConfiguration:(id)a3 addChecklistFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 addNoteFromBarButtonItem:(id)a4 event:(id)a5;
- (void)noteEditorNavigationItemConfiguration:(id)a3 addTableFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 changeStyleFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 closeAuxiliaryWindowFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 deleteFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 didCompleteAnimationFromInlineSketchBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 doneEditingFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 inlineSketchFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 insertMediaWithSourceType:(unint64_t)a4 mediaBarButtonItem:(id)a5;
- (void)noteEditorNavigationItemConfiguration:(id)a3 insertSidecarItemWithMenuItems:(id)a4 service:(int64_t)a5 mediaBarButtonItem:(id)a6;
- (void)noteEditorNavigationItemConfiguration:(id)a3 moveFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidCancelFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidSaveFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteShowAllNotesFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 redoFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 shareFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 showWritingToolsFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleLockFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleSidebarFromBarButtonItem:(id)a4;
- (void)noteEditorNavigationItemConfiguration:(id)a3 undoFromBarButtonItem:(id)a4;
- (void)noteFormattingDidFinish:(id)a3;
- (void)noteFormattingNeedsUpdate:(id)a3;
- (void)noteOrFolderChangedCallback;
- (void)noteWillAppear:(id)a3;
- (void)noteWillBeDeleted:(id)a3;
- (void)notesContextRefreshNotification:(id)a3;
- (void)observeAttachmentDeleted:(id)a3;
- (void)observeDrawingConverted:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openExperimentalHashtagUI:(id)a3;
- (void)openLink:(id)a3;
- (void)openLinkEditor:(id)a3;
- (void)openLinkEditorForLink:(id)a3;
- (void)openLinkEditorForLinkTextItem:(id)a3;
- (void)paperKitBundleDidMerge:(id)a3;
- (void)paperTextAttachmentManager:(id)a3 beginTrackingUndoManager:(id)a4;
- (void)paperTextAttachmentManager:(id)a3 endTrackingUndoManager:(id)a4;
- (void)passwordEntryAlertControllerAttemptDidFail:(id)a3;
- (void)performAddCollaboratorsActivity:(id)a3;
- (void)performDeleteAnimation:(id)a3;
- (void)performFindInNote:(id)a3;
- (void)performReplaceInNote:(id)a3;
- (void)prepareForBarSourcedPopoverPresentation;
- (void)prepareSelectionForAddingAttachment;
- (void)prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:(id)a3;
- (void)presentAttachment:(id)a3;
- (void)presentRecordingStoppedAlertForNoteIfNeeded:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)quickNoteAllNotes:(id)a3;
- (void)rebuildInputAccessoryView;
- (void)recreateTextView;
- (void)recreateTextViewIfNecessary;
- (void)recreateTextViewIfPasswordEntryScreenExistsButNoteIsUnlocked;
- (void)redoAction:(id)a3;
- (void)registerForTraitChanges;
- (void)reloadCurrentNote;
- (void)rememberNoteContentForEditingIntent;
- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4;
- (void)removeChecked:(id)a3;
- (void)removeCurrentScrollState;
- (void)removeKVOObserversForNote:(id)a3;
- (void)removeLinkForLinkTextItem:(id)a3;
- (void)removeLinksFromCurrentSelection;
- (void)removeLinksFromRange:(_NSRange)a3;
- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4;
- (void)resetBarButtonsAnimated:(BOOL)a3;
- (void)resetBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4;
- (void)resetDateView;
- (void)resetTextViewContentOffset;
- (void)resetTextViewUndoManager;
- (void)restoreTextViewScrollPosition:(double)a3;
- (void)restoreTextViewVisibleRange:(_NSRange)a3 animated:(BOOL)a4;
- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5;
- (void)runTableHorizontalScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5;
- (void)saveCurrentScrollState;
- (void)saveFromSystemPaperCard:(id)a3;
- (void)saveInlineDrawings;
- (void)saveNote;
- (void)saveToolAsCurrentTool:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4;
- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6;
- (void)scrollRangeToVisibleWhenViewAppears:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectDrawingAttachmentIfNeeded:(id)a3;
- (void)setActivityItemsConfigurationProvider:(id)a3;
- (void)setActivityStreamToolbar:(id)a3;
- (void)setActivityStreamToolbarBottomConstraint:(id)a3;
- (void)setAddDocumentScanAfterViewAppears:(BOOL)a3;
- (void)setAddToDoListAfterViewAppears:(BOOL)a3;
- (void)setApplyAccessibilityInfoDelayer:(id)a3;
- (void)setArchivedScrollStateToApply:(id)a3;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setAudioAttachmentEditorCoordinator:(id)a3;
- (void)setAudioBarViewController:(id)a3;
- (void)setAudioEventReporter:(id)a3;
- (void)setAuthorHighlightsController:(id)a3;
- (void)setAuthorHighlightsUpdater:(id)a3;
- (void)setAuxiliaryResponder:(id)a3;
- (void)setAuxiliaryStylingController:(id)a3;
- (void)setBluetoothKeyboardHintViewController:(id)a3;
- (void)setBodyStyle:(id)a3;
- (void)setBulletedListStyle:(id)a3;
- (void)setCalculateGraphingController:(id)a3;
- (void)setCalculateRecognitionController:(id)a3;
- (void)setCalculateScrubberController:(id)a3;
- (void)setCanShowLinkBar:(BOOL)a3;
- (void)setChangePasswordContentOffset:(CGPoint)a3;
- (void)setCollaborationBarButtonItem:(id)a3;
- (void)setCollaborationButtonsController:(id)a3;
- (void)setCreatedGalleryAttachmentUUID:(id)a3;
- (void)setCurrentStrokeStartTouch:(id)a3;
- (void)setCurrentTextStyle:(unsigned int)a3;
- (void)setCurrentWritingDirection:(int64_t)a3;
- (void)setDashedListStyle:(id)a3;
- (void)setDateOfLastStrokeOrNewDrawing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDrawWithPencilWithoutPalette:(BOOL)a3;
- (void)setDidEndEditingForAddingImageAttachment:(BOOL)a3;
- (void)setDoNotAdvanceInsertionPointAfterInsertingAttachment:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabledSubviews:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setExtraItemsBeforeCustomCalloutOptions:(id)a3;
- (void)setFindResultReporter:(id)a3;
- (void)setFixedWidthStyle:(id)a3;
- (void)setHandwritingDebugPresenter:(id)a3;
- (void)setHasKeyboardBeenVisibleBefore:(BOOL)a3;
- (void)setHasMadeEdits;
- (void)setHasMadeEdits:(BOOL)a3;
- (void)setHashtagController:(id)a3;
- (void)setHeadingStyle:(id)a3;
- (void)setHostBundleIdentifier:(id)a3;
- (void)setIgnoresTaps:(BOOL)a3;
- (void)setInStartEditingForWritingTools:(BOOL)a3;
- (void)setIndentKeyCommands:(id)a3;
- (void)setIndentRTLKeyCommands:(id)a3;
- (void)setInkPaletteController:(id)a3;
- (void)setInkPickerState:(unint64_t)a3;
- (void)setInlineAttachmentChangeController:(id)a3;
- (void)setInputAccessoryViewHeight:(double)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationViewController:(id)a3;
- (void)setIsAddingImageAttachment:(BOOL)a3;
- (void)setIsConvertToTag:(BOOL)a3;
- (void)setIsDrawingStroke:(BOOL)a3;
- (void)setIsDrawingStrokeWithPencil:(BOOL)a3;
- (void)setIsEditingNewNote:(BOOL)a3;
- (void)setIsLoadingStyleSelectorInputView:(BOOL)a3;
- (void)setIsPerformingDeleteAnimation:(BOOL)a3;
- (void)setIsPreviewingAttachmentFromNote:(BOOL)a3;
- (void)setIsSelecting:(BOOL)a3;
- (void)setIsSettingEditing:(BOOL)a3;
- (void)setIsSettingSelection:(BOOL)a3;
- (void)setKeyboardAnimateInFinishTime:(id)a3;
- (void)setKeyboardButtonItems:(id)a3;
- (void)setKeyboardDidShowAnimationDate:(id)a3;
- (void)setLastSelectedRange:(_NSRange)a3;
- (void)setLimitExceededAlertController:(id)a3;
- (void)setLinkAcceleratorController:(id)a3;
- (void)setLinkEditorViewController:(id)a3;
- (void)setLinksBarNeedsAnimationWhileEditorIsVisible:(BOOL)a3;
- (void)setLockIconCoverViewController:(id)a3;
- (void)setMagicGenerativePlaygroundUndoManager:(id)a3;
- (void)setMentionsController:(id)a3;
- (void)setNavigationItemConfiguration:(id)a3;
- (void)setNeedsInitialBarConfiguration:(BOOL)a3;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setNeedsToPerformInitialPaperAnimations:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setNote:(id)a3 delayedForLaunch:(BOOL)a4 successHandler:(id)a5;
- (void)setNote:(id)a3 overrideScrollState:(id)a4;
- (void)setNoteAndFolderChangeController:(id)a3;
- (void)setNoteExporter:(id)a3;
- (void)setNoteFormattingController:(id)a3;
- (void)setNoteLastModificationDate:(id)a3;
- (void)setNoteOrFolderChangedCallbackSelectorDelayer:(id)a3;
- (void)setNoteUserActivity:(id)a3;
- (void)setNoteUserActivityState:(id)a3;
- (void)setNoteViewEventSourceObjectID:(id)a3;
- (void)setNumberedListStyle:(id)a3;
- (void)setOriginalEndOfNote:(id)a3;
- (void)setPaletteResponder:(id)a3;
- (void)setPaperLinkBarShowing:(BOOL)a3;
- (void)setPaperLinkBarTopConstraint:(id)a3;
- (void)setPaperLinkBarViewController:(id)a3;
- (void)setPaperTextAttachmentManager:(id)a3;
- (void)setPasswordEntryViewController:(id)a3;
- (void)setPreventSnappingToLastPaperDocument:(BOOL)a3;
- (void)setPreviousNote:(id)a3;
- (void)setPreviouslyHadMarkedText:(BOOL)a3;
- (void)setQuickNoteiPhoneAttachmentPresenter:(id)a3;
- (void)setQuickNoteiPhoneDidSaveOrCancel:(BOOL)a3;
- (void)setRulerHostingView:(id)a3;
- (void)setSavedScrollStates:(id)a3;
- (void)setSearchRegexFinder:(id)a3;
- (void)setSelectedCanvasAttachment:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:(id)a3;
- (void)setShouldAllowAttributionSidebar:(BOOL)a3;
- (void)setShouldBeginEditingAfterNoteUnlock:(BOOL)a3;
- (void)setShouldClearBackgroundColorAfterPreview:(BOOL)a3;
- (void)setShouldClearCornerRadiusAfterPreview:(BOOL)a3;
- (void)setShouldFireNoteViewEventOnViewDisappear:(BOOL)a3;
- (void)setShouldInputAccessoryViewButtonsBeVisible:(BOOL)a3;
- (void)setShouldOverscrollScrollState:(BOOL)a3;
- (void)setShouldRemoveEmptyNoteWhenViewDisappeared:(BOOL)a3;
- (void)setShouldResetTextViewContentOffsetWhenAppearing:(BOOL)a3;
- (void)setShouldTrackNoteViewEventAnalyticsFromSettingNote:(BOOL)a3;
- (void)setShowInkPickerAfterViewAppears:(BOOL)a3;
- (void)setShowInsertUIAfterViewAppears:(BOOL)a3;
- (void)setShowOrHideSearchPatternHighlightsDelayer:(id)a3;
- (void)setShowingChecklistItems:(BOOL)a3;
- (void)setShowingIndentationItems:(BOOL)a3;
- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3;
- (void)setStartEditingAfterViewAppears:(BOOL)a3;
- (void)setStyleSelectorController:(id)a3;
- (void)setStyleSelectorDummyInputView:(id)a3;
- (void)setStyleSelectorInputViewPresenting:(BOOL)a3;
- (void)setSubheadingStyle:(id)a3;
- (void)setSuspendBarButtonUpdates:(BOOL)a3;
- (void)setSuspendSelectedRangeUpdates:(BOOL)a3;
- (void)setSuspendTapGestureRecognizer:(BOOL)a3;
- (void)setSwipeGestureRecognizers:(id)a3;
- (void)setTableButtonsShowMore:(BOOL)a3;
- (void)setTextStyle:(unsigned int)a3 sender:(id)a4;
- (void)setTextViewController:(id)a3;
- (void)setTextViewInputAccessoryView:(id)a3;
- (void)setTextViewMinimumBottomInset:(double)a3;
- (void)setTextViewScrollIndicatorBottomInsetOverride:(double)a3;
- (void)setTextViewScrollIndicatorBottomInsetOverrideToRestore:(double)a3;
- (void)setTitleStyle:(id)a3;
- (void)setTogglingLock:(BOOL)a3;
- (void)setUnsupportedNoteTapGestureRecognizer:(id)a3;
- (void)setUnsupportedNoteView:(id)a3;
- (void)setUpdateContentSizeCategoryWhenVisible:(BOOL)a3;
- (void)setUpdateNoteUserActivityStateDelayer:(id)a3;
- (void)setUserActivityUpdateQueue:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUserWantsToSeeDateLabel:(BOOL)a3;
- (void)setViewControllerManager:(id)a3;
- (void)setVisualAssetImportController:(id)a3;
- (void)setWasEditingBeforeDrawing:(BOOL)a3;
- (void)setWasWindowlessDuringTransitionToSize:(BOOL)a3;
- (void)setupForFingerDrawing;
- (void)setupLinedPaperOnNewNote:(id)a3 willStartEditing:(BOOL)a4;
- (void)shareButtonPressedWithSender:(id)a3;
- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3;
- (void)shiftReturn:(id)a3;
- (void)shiftTab:(id)a3;
- (void)showActivityStreamToolbarForObject:(id)a3 selection:(id)a4 animated:(BOOL)a5;
- (void)showDocumentCamera;
- (void)showDocumentPicker;
- (void)showDrawingUpdateAlert;
- (void)showHandwritingDebug:(BOOL)a3;
- (void)showInkPicker:(BOOL)a3 animated:(BOOL)a4;
- (void)showInkPicker:(id)a3;
- (void)showInkPickerAndEndEditingIfNecessary;
- (void)showInsertUIForSourceType:(unint64_t)a3 sender:(id)a4;
- (void)showInsertUIWithPreferredSourceType:(unint64_t)a3;
- (void)showOrHideActivityStreamToolbarIfNeeded;
- (void)showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:(BOOL)a3;
- (void)showOrHidePasswordEntryViewControllerIfNeeded;
- (void)showOrHideSearchPatternHighlightsIfNecessary;
- (void)showOverscrollContentAndScrollToTop;
- (void)showPhotoLibrary;
- (void)showRecoverNoteAlert;
- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4;
- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5;
- (void)showStyleSelectorInputView:(BOOL)a3 animated:(BOOL)a4 doneEditing:(BOOL)a5;
- (void)showStyleSelectorPopover:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5;
- (void)splitViewModeChangeDidEnd:(id)a3;
- (void)startEditing;
- (void)startEditingForWritingTools;
- (void)stopTextFindingIfNecessary;
- (void)strikethrough:(id)a3;
- (void)styleSelector:(id)a3 didChangeIndentAmount:(int64_t)a4;
- (void)styleSelector:(id)a3 didSelectStyle:(unsigned int)a4;
- (void)styleSelector:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)styleSelector:(id)a3 toggleBIUS:(unint64_t)a4;
- (void)styleSelectorDidCancel:(id)a3;
- (void)styleSelectorDidIndentLeft:(id)a3;
- (void)styleSelectorDidIndentRight:(id)a3;
- (void)styleSelectorWillShowInlineMenu:(id)a3;
- (void)submitChecklistAnalyticsEventForActionType:(int64_t)a3;
- (void)submitNoteEditEventIfNecessary;
- (void)submitNoteViewEventForModernNote:(id)a3;
- (void)systemPaperLinkBarVisibilityPreferenceChanged:(id)a3;
- (void)tab:(id)a3;
- (void)tableCellFirstResponderChanged;
- (void)tearDownAudioPlayers;
- (void)teardownSystemPaperLinkBarIfNecessary;
- (void)textView:(id)a3 didRemoveDrawingAtIndex:(unint64_t)a4;
- (void)textView:(id)a3 upgradeDrawingAtIndex:(unint64_t)a4 itemProviders:(id)a5 insertionLocationInDrawing:(CGPoint)a6;
- (void)textView:(id)a3 willAddDrawingAtIndex:(unint64_t)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidBreakRubberBand:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)textViewDidEndStroke:(id)a3;
- (void)textViewWillBeginStroke:(id)a3 forTouch:(id)a4;
- (void)textViewWritingToolsDidEnd:(id)a3;
- (void)textViewWritingToolsWillBegin:(id)a3;
- (void)toggleBIUS:(unint64_t)a3 sender:(id)a4;
- (void)toggleBlockQuote:(id)a3;
- (void)toggleBoldface;
- (void)toggleEmphasis;
- (void)toggleEmphasisWithType:(int64_t)a3;
- (void)toggleItalics;
- (void)toggleStrikethrough;
- (void)toggleTodoChecked:(id)a3;
- (void)toggleTodoStyle:(id)a3;
- (void)toggleUnderline;
- (void)uncheckAll:(id)a3;
- (void)undoAction:(id)a3;
- (void)undoablySwitchToPPK:(BOOL)a3;
- (void)updateActionMenu;
- (void)updateAuthorHighlightsIfNeeded;
- (void)updateBarButtons;
- (void)updateBarButtonsAnimated:(BOOL)a3;
- (void)updateBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4;
- (void)updateBottomContentPadding;
- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6;
- (void)updateDataOwnerForCopyAndPaste;
- (void)updateDateLabelAccessibility;
- (void)updateDrawingAttachmentsIfNeeded;
- (void)updateDrawingAttachmentsInNote;
- (void)updateForceLightContentIfNecessary;
- (void)updateFormatToolbarLayoutWithSize:(CGSize)a3;
- (void)updateInkPickerAndTextViewToTool:(id)a3;
- (void)updateInlineDrawings;
- (void)updateInlineDrawingsPaletteVisibility;
- (void)updateLastViewedMetadataIfNessessary;
- (void)updateNoteUserActivityState;
- (void)updateParticipantsInDrawings;
- (void)updatePencilKitPaperStyleType;
- (void)updatePencilKitSelectionViewEnabled;
- (void)updateSelectionOnUndo:(id)a3;
- (void)updateStyleSelectorStateIfNeededIgnoreTypingAttributes:(BOOL)a3;
- (void)updateTextInputAccessoryViewForDidBeginEditing:(id)a3;
- (void)updateTextInputAccessoryViewForDidEndEditing:(id)a3;
- (void)updateTextViewBackground;
- (void)updateTextViewContentInsetsAnimated:(BOOL)a3;
- (void)updateTextViewContentOffset;
- (void)updateUIEnabledStatePencilActive:(BOOL)a3;
- (void)updateUnsupportedNoteView;
- (void)updateUserAndDateViewVisibility;
- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3;
- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3 forSydney:(BOOL)a4;
- (void)upgradePencilKitDrawingsForNewInksPromptingIfNecessary;
- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)userActivityWillSave:(id)a3;
- (void)viewControllerWillStartEditModeNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)warnLimitExceededWithTitle:(id)a3 andMessage:(id)a4;
- (void)warnUserAttachmentLimitExceeded;
- (void)warnUserAttachmentSizeExceededWithAttachmentCount:(unint64_t)a3;
- (void)warnUserNoteLengthExceeded;
- (void)willAddAttachmentForNoteNotification:(id)a3;
@end

@implementation ICNoteEditorViewController

- (void)rememberNoteContentForEditingIntent
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = [(ICNoteEditorBaseViewController *)self note];
  -[ICNoteEditorViewController setIsEditingNewNote:](self, "setIsEditingNewNote:", [v3 isEmpty]);

  v4 = [(ICNoteEditorBaseViewController *)self note];
  v5 = [v4 textStorage];
  v6 = [v5 mergeableString];
  v7 = (void *)MEMORY[0x263F08D40];
  v8 = [(ICNoteEditorBaseViewController *)self note];
  v9 = [v8 textStorage];
  v10 = [v9 mergeableString];
  v11 = objc_msgSend(v7, "valueWithRange:", objc_msgSend(v10, "length"), 0);
  v14[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v13 = [v6 selectionForCharacterRanges:v12];
  [(ICNoteEditorViewController *)self setOriginalEndOfNote:v13];
}

- (void)setOriginalEndOfNote:(id)a3
{
}

- (void)setIsEditingNewNote:(BOOL)a3
{
  self->_isEditingNewNote = a3;
}

- (NotesBackgroundView)backgroundView
{
  objc_opt_class();
  v3 = [(ICNoteEditorViewController *)self view];
  v4 = ICCheckedDynamicCast();

  return (NotesBackgroundView *)v4;
}

- (double)textViewBottomPaddingVisibleRatio
{
  double v3 = 1.0;
  if (([(ICNoteEditorViewController *)self isEditing] & 1) == 0)
  {
    v4 = [(ICNoteEditorViewController *)self textStorage];
    uint64_t v5 = [v4 length];

    double v3 = 0.5;
    if (v5)
    {
      v6 = [(ICNoteEditorViewController *)self textStorage];
      v7 = [v6 string];
      v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v9 = [v8 invertedSet];
      uint64_t v10 = [v7 rangeOfCharacterFromSet:v9 options:4];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_opt_class();
        v11 = [(ICNoteEditorViewController *)self textStorage];
        v12 = [v11 attribute:*MEMORY[0x263F814A0] atIndex:v10 effectiveRange:0];
        v13 = ICDynamicCast();

        if (v13) {
          return 0.9;
        }
        else {
          return 0.5;
        }
      }
    }
  }
  return v3;
}

id __45__ICNoteEditorViewController_dynamicBarColor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v5 = [v3 traitCollectionByModifyingTraits:&__block_literal_global_862];

    v4 = (void *)v5;
  }
  v6 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:v4];
  v7 = objc_msgSend(v4, "ic_appearanceInfo");
  [v7 navigationBarAlpha];
  v8 = objc_msgSend(v6, "colorWithAlphaComponent:");

  return v8;
}

- (UIEdgeInsets)textViewScrollIndicatorInsetsThatWeWant
{
  [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
  double v44 = v3;
  [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromBottom];
  double v43 = v4;
  [(ICNoteEditorViewController *)self textViewScrollIndicatorBottomInsetOverride];
  double v42 = v5;
  v6 = [(ICNoteEditorViewController *)self textView];
  [v6 verticalScrollIndicatorInsets];
  double v39 = v8;
  double v40 = v7;

  v9 = [(ICNoteEditorViewController *)self textView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v45.origin.double x = v11;
  v45.origin.double y = v13;
  v45.size.double width = v15;
  v45.size.double height = v17;
  CGFloat v18 = CGRectGetHeight(v45) / 3.0;
  v46.origin.double x = v11;
  v46.origin.double y = v13;
  v46.size.double width = v15;
  v46.size.double height = v17;
  CGRect v47 = CGRectInset(v46, 0.0, v18);
  double x = v47.origin.x;
  double y = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;
  v23 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v23, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, x, y, width, height);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  v48.origin.double x = v25;
  v48.origin.double y = v27;
  v48.size.double width = v29;
  v48.size.double height = v31;
  if (CGRectIsNull(v48))
  {
    double v32 = v39;
    double v33 = v40;
  }
  else
  {
    v49.origin.double x = v25;
    v49.origin.double y = v27;
    v49.size.double width = v29;
    v49.size.double height = v31;
    double MinX = CGRectGetMinX(v49);
    v50.origin.double x = v11;
    v50.origin.double y = v13;
    v50.size.double width = v15;
    v50.size.double height = v17;
    CGFloat v34 = CGRectGetMinX(v50);
    v51.size.double height = v17;
    double v33 = MinX - v34;
    v51.origin.double x = v11;
    v51.origin.double y = v13;
    v51.size.double width = v15;
    double MaxX = CGRectGetMaxX(v51);
    v52.origin.double x = v25;
    v52.origin.double y = v27;
    v52.size.double width = v29;
    v52.size.double height = v31;
    double v32 = MaxX - CGRectGetMaxX(v52);
  }
  if (v43 >= v42) {
    double v36 = v43;
  }
  else {
    double v36 = v42;
  }
  double v37 = v44;
  double v38 = v33;
  result.right = v32;
  result.bottom = v36;
  result.left = v38;
  result.top = v37;
  return result;
}

- (double)textViewScrollIndicatorBottomInsetOverride
{
  return self->_textViewScrollIndicatorBottomInsetOverride;
}

- (ICCalculateRecognitionController)calculateRecognitionController
{
  return self->_calculateRecognitionController;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return self->_attachmentInsertionController;
}

- (ICMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (ICHashtagController)hashtagController
{
  return self->_hashtagController;
}

- (double)textViewTopInsetThatWeWant
{
  double v3 = 0.0;
  if ((objc_msgSend(MEMORY[0x263F82670], "ic_isVision") & 1) == 0 && (ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromTop];
    double v3 = v4;
  }
  double v5 = [(ICNoteEditorViewController *)self textView];
  v6 = [v5 compatibilityBannerView];

  if (v6)
  {
    double v7 = [(ICNoteEditorViewController *)self textView];
    double v8 = [v7 compatibilityBannerView];
    [v8 preferredHeight];
    double v3 = v3 + v9;
  }
  if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
  {
    double v10 = [(ICNoteEditorViewController *)self textView];
    CGFloat v11 = [v10 dateView];
    [v11 preferredHeight];
    double v13 = v12;
    double v14 = [(ICNoteEditorViewController *)self textView];
    CGFloat v15 = [v14 userTitleView];
    [v15 preferredHeight];
    double v3 = v3 + v13 + v16;
  }
  CGFloat v17 = [(ICNoteEditorViewController *)self audioBarViewController];

  if (v17)
  {
    CGFloat v18 = [(ICNoteEditorViewController *)self audioBarViewController];
    [v18 height];
    double v3 = v3 + v19;
  }
  if (self->_paperLinkBarShowing)
  {
    +[ICSystemPaperConstants linkBarHeight];
    return v3 + v20;
  }
  return v3;
}

- (BOOL)userWantsToSeeDateLabel
{
  return self->_userWantsToSeeDateLabel;
}

- (ICAudioBarViewController)audioBarViewController
{
  return self->_audioBarViewController;
}

- (ICCalculateGraphingController)calculateGraphingController
{
  return self->_calculateGraphingController;
}

- (ICCalculateScrubberController)calculateScrubberController
{
  return self->_calculateScrubberController;
}

- (BOOL)shouldAllowAttributionSidebar
{
  double v3 = [(ICNoteEditorBaseViewController *)self note];
  if ([v3 isSharedViaICloud]
    && ![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper])
  {
    BOOL v4 = ![(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)setVisualAssetImportController:(id)a3
{
}

- (void)setSwipeGestureRecognizers:(id)a3
{
}

- (void)setCalculateScrubberController:(id)a3
{
}

- (void)setCalculateGraphingController:(id)a3
{
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (void)rebuildInputAccessoryView
{
  id v12 = [(ICNoteEditorViewController *)self icSplitViewController];
  double v3 = [MEMORY[0x263F82670] currentDevice];
  if ([v3 userInterfaceIdiom])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [ICNoteEditorInputAccessoryView alloc];
    v6 = [v12 view];
    [v6 frame];
    BOOL v4 = -[ICNoteEditorInputAccessoryView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F82D70]);
  double v8 = [MEMORY[0x263F825C8] whiteColor];
  [v7 setBackgroundColor:v8];

  [(ICNoteEditorInputAccessoryView *)v4 setToolbar:v7];
  [(ICNoteEditorViewController *)self setTextViewInputAccessoryView:v4];
  double v9 = [(ICNoteEditorViewController *)self textView];
  [v9 setInputAccessoryView:v4];

  objc_opt_class();
  double v10 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  CGFloat v11 = ICDynamicCast();

  [v11 setInputAccessoryView:v4];
  [(ICNoteEditorInputAccessoryView *)v4 setDelegate:self];
}

- (void)setTextViewInputAccessoryView:(id)a3
{
}

- (id)icSplitViewController
{
  if ([(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
  {
    double v3 = 0;
  }
  else
  {
    BOOL v4 = [(ICNoteEditorViewController *)self viewControllerManager];
    double v3 = [v4 mainSplitViewController];
  }

  return v3;
}

- (void)addKVOObserversForNote:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"noteHasChanges", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"modificationDate", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"lastActivitySummaryViewedDate", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"attachmentViewType", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"paperStyleType", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"isEmpty", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"serverShareData", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"isSharedViaICloud", &compoundliteral_2986);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"prefersLightBackground", &compoundliteral_2984);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = +[ICNoteEditorUserTitleView noteKeyPathsAffectingUserTitleView];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, *(void *)(*((void *)&v10 + 1) + 8 * v9++), &compoundliteral_2988);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)hideAcceleratorIfNecessary
{
  double v3 = [(ICNoteEditorViewController *)self linkAcceleratorController];
  int v4 = [v3 isShowing];

  if (v4)
  {
    id v5 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v5 hideAccelerator];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v20 = a3;
  id v4 = [(ICNoteEditorViewController *)self textView];

  id v5 = v20;
  if (v4 == v20)
  {
    uint64_t v6 = [(ICNoteEditorViewController *)self backgroundView];
    [v20 contentOffset];
    objc_msgSend(v6, "scrollView:didChangeContentOffset:", v20);

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      uint64_t v7 = [(ICNoteEditorViewController *)self textView];
      char v8 = [v7 shouldUpdateVisibleSupplementalViewsInLayoutSubviews];

      if ((v8 & 1) == 0)
      {
        objc_opt_class();
        uint64_t v9 = [(ICNoteEditorViewController *)self textView];
        long long v10 = [v9 layoutManager];
        long long v11 = ICDynamicCast();

        [v11 updateVisibleSupplementalViews];
        [v11 ensureLayoutForSurroundingPages];
      }
    }
    [(ICNoteEditorViewController *)self updateUserAndDateViewVisibility];
    long long v12 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    int v13 = [v12 isShowing];

    if (v13)
    {
      double v14 = [(ICNoteEditorViewController *)self linkAcceleratorController];
      [v14 hideAccelerator];
    }
    uint64_t v15 = [(ICNoteEditorViewController *)self calculateScrubberController];
    int v16 = [v15 isShowing];

    if (v16)
    {
      CGFloat v17 = [(ICNoteEditorViewController *)self calculateScrubberController];
      [v17 hideScrubber];
    }
    CGFloat v18 = [(ICNoteEditorViewController *)self audioAttachmentEditorCoordinator];
    double v19 = [(ICNoteEditorViewController *)self textView];
    [v18 textViewDidScroll:v19];

    id v5 = v20;
  }
}

- (BOOL)isShowingAudioInspector
{
  v2 = [(ICNoteEditorViewController *)self audioAttachmentEditorCoordinator];
  char v3 = [v2 isShowingInspector];

  return v3;
}

- (ICAudioAttachmentEditorCoordinator)audioAttachmentEditorCoordinator
{
  return self->_audioAttachmentEditorCoordinator;
}

- (void)updateUserAndDateViewVisibility
{
  if ([(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper])
  {
    char v3 = [(ICNoteEditorViewController *)self textView];
    id v4 = [v3 userTitleView];
    [v4 alpha];
    if (fabs(v5) >= 0.00999999978)
    {
      CGFloat v17 = [(ICNoteEditorViewController *)self textView];
      CGFloat v18 = [v17 dateView];
      [v18 alpha];
      BOOL v6 = fabs(v19) < 0.00999999978;
    }
    else
    {
      BOOL v6 = 1;
    }

    id v20 = [(ICNoteEditorViewController *)self textView];
    [v20 safeAreaInsets];
    if (v21 == 0.0)
    {
      double v24 = 0.0;
    }
    else
    {
      v22 = [(ICNoteEditorViewController *)self textView];
      [v22 safeAreaInsets];
      double v24 = -v23;
    }
    CGFloat v25 = [(ICNoteEditorViewController *)self textView];
    [v25 contentOffset];
    double v27 = v26;
    double v28 = [(ICNoteEditorViewController *)self textView];
    [v28 contentInset];
    double v30 = v29;

    if (v27 < v24 - v30 && v6)
    {
      double v32 = (void *)MEMORY[0x263F82E00];
      +[ICSystemPaperConstants linkBarAnimationDuration];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __61__ICNoteEditorViewController_updateUserAndDateViewVisibility__block_invoke;
      v34[3] = &unk_2640B8140;
      v34[4] = self;
      objc_msgSend(v32, "animateWithDuration:animations:", v34);
    }
  }
  else if ([(ICNoteEditorViewController *)self usesCustomTransition])
  {
    uint64_t v7 = [(ICNoteEditorViewController *)self textView];
    [v7 safeAreaInsets];
    double v9 = v8;

    long long v10 = [(ICNoteEditorViewController *)self textView];
    [v10 contentOffset];
    double v12 = fabs(v11);

    if ((v12 - v9) * 0.0625 <= 1.0) {
      double v13 = (v12 - v9) * 0.0625;
    }
    else {
      double v13 = 1.0;
    }
    double v14 = [(ICNoteEditorViewController *)self textView];
    uint64_t v15 = [v14 userTitleView];
    [v15 setAlpha:v13];

    id v33 = [(ICNoteEditorViewController *)self textView];
    int v16 = [v33 dateView];
    [v16 setAlpha:v13];
  }
}

- (id)iCloudShareBarButtonItem
{
  char v3 = [(ICNoteEditorBaseViewController *)self note];
  if [v3 isPubliclySharedOrHasInvitees] && (objc_opt_respondsToSelector())
  {
    id v4 = [(ICNoteEditorViewController *)self collaborationButtons_collaborationBarButtonItem];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)noteEditorNavigationItemConfigurationToolbar:(id)a3
{
  char v3 = [(ICNoteEditorViewController *)self navigationController];
  id v4 = [v3 toolbar];

  return v4;
}

- (id)noteEditorNavigationItemConfigurationInputAssistantItem:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isiPad", a3))
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    double v5 = [v4 inputAssistantItem];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)noteEditorNavigationItemConfigurationChecklistAccessibilityValue:(id)a3
{
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  double v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  double v8 = objc_msgSend(v4, "checklistStyleAccessibilityDescriptionForRange:", v6, v7);

  return v8;
}

- (void)updateForceLightContentIfNecessary
{
  BOOL v3 = [(ICNoteEditorViewController *)self shouldForceLightContent];
  BOOL v4 = v3;
  if (v3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(ICNoteEditorViewController *)self setOverrideUserInterfaceStyle:v3];
  uint64_t v6 = [(ICNoteEditorViewController *)self view];
  [v6 setOverrideUserInterfaceStyle:v4];

  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setOverrideUserInterfaceStyle:v4];

  [(ICNoteEditorViewController *)self updateTextViewBackground];
  double v8 = [(ICNoteEditorViewController *)self textView];
  [v8 setNeedsDisplay];

  double v9 = [(ICNoteEditorViewController *)self navigationController];
  long long v10 = [v9 navigationBar];
  [v10 setOverrideUserInterfaceStyle:v4];

  double v11 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  [v11 setOverrideUserInterfaceStyle:v4];

  double v12 = [(ICNoteEditorViewController *)self textView];
  [v12 setKeyboardAppearance:v5];

  id v35 = [(ICNoteEditorViewController *)self dynamicBarColor];
  id v13 = objc_alloc_init(MEMORY[0x263F829A8]);
  [v13 configureWithTransparentBackground];
  [v13 setBackgroundColor:v35];
  double v14 = [(ICNoteEditorViewController *)self navigationItem];
  [v14 setStandardAppearance:v13];

  uint64_t v15 = [(ICNoteEditorViewController *)self navigationItem];
  [v15 setCompactAppearance:v13];

  if (![(ICNoteEditorViewController *)self usesCustomTransition])
  {
    int v16 = [(ICNoteEditorViewController *)self navigationItem];
    [v16 setScrollEdgeAppearance:v13];
  }
  CGFloat v17 = [(ICNoteEditorViewController *)self navigationController];
  CGFloat v18 = [v17 toolbar];
  double v19 = [v18 standardAppearance];

  [v19 configureWithTransparentBackground];
  [v19 setBackgroundColor:v35];
  id v20 = [(ICNoteEditorViewController *)self navigationController];
  double v21 = [v20 toolbar];
  [v21 setStandardAppearance:v19];

  v22 = [(ICNoteEditorViewController *)self navigationController];
  double v23 = [v22 toolbar];
  [v23 setCompactAppearance:v19];

  double v24 = [(ICNoteEditorViewController *)self navigationController];
  CGFloat v25 = [v24 toolbar];
  [v25 setScrollEdgeAppearance:v19];

  double v26 = [(ICNoteEditorViewController *)self navigationController];
  double v27 = [v26 toolbar];
  [v27 setCompactScrollEdgeAppearance:v19];

  [(ICNoteEditorViewController *)self setNeedsStatusBarAppearanceUpdate];
  double v28 = [(ICNoteEditorViewController *)self inkPaletteController];

  if (v4 || v28)
  {
    double v29 = [(ICNoteEditorViewController *)self inkPaletteController];
    double v30 = [v29 selectedTool];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v32 = [(ICNoteEditorViewController *)self inkPaletteController];
      id v33 = [v32 colorCorrectedTool];
      [(ICNoteEditorViewController *)self updateInkPickerAndTextViewToTool:v33];
    }
    CGFloat v34 = [(ICNoteEditorViewController *)self inkPaletteController];
    [v34 setColorUserInterfaceStyle:v4];
  }
}

- (ICInkPaletteController)inkPaletteController
{
  return self->_inkPaletteController;
}

- (BOOL)usesCustomTransition
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  BOOL v3 = [(ICNoteEditorViewController *)self preferredTransition];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)dynamicBarColor
{
  BOOL v3 = [(ICNoteEditorViewController *)self shouldForceLightContent];
  BOOL v4 = [(ICNoteEditorViewController *)self textView];
  uint64_t v5 = [v4 backgroundColor];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v8 = v7;

  double v9 = (void *)MEMORY[0x263F825C8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__ICNoteEditorViewController_dynamicBarColor__block_invoke;
  v13[3] = &unk_2640B9470;
  BOOL v15 = v3;
  id v14 = v8;
  id v10 = v8;
  double v11 = [v9 colorWithDynamicProvider:v13];

  return v11;
}

- (BOOL)shouldForceLightContent
{
  v2 = [(ICNoteEditorBaseViewController *)self note];
  if ([v2 prefersLightBackground]) {
    char v3 = 1;
  }
  else {
    char v3 = objc_msgSend(MEMORY[0x263F82DA0], "ic_alwaysShowLightContent");
  }

  return v3;
}

- (id)noteEditorNavigationItemConfigurationInputAccessoryToolbar:(id)a3
{
  char v3 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  BOOL v4 = [v3 toolbar];

  return v4;
}

- (ICNoteEditorInputAccessoryView)textViewInputAccessoryView
{
  return self->_textViewInputAccessoryView;
}

- (void)updateTextViewBackground
{
  if (![(ICNoteEditorViewController *)self ic_isViewVisible]) {
    return;
  }
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    double v8 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
    double v9 = [(ICNoteEditorViewController *)self textViewController];
    [v9 setBackgroundColor:v8];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      return;
    }
    id v10 = [(ICNoteEditorViewController *)self textViewController];
    BOOL v4 = [v10 backgroundColor];
    uint64_t v5 = [(ICNoteEditorViewController *)self view];
    uint64_t v6 = v5;
    id v7 = v4;
    goto LABEL_9;
  }
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    char v3 = [(ICNoteEditorViewController *)self textView];
    [v3 setBackgroundColor:0];

    objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v4 = [(ICNoteEditorViewController *)self backgroundView];
    uint64_t v5 = [v4 contentView];
    uint64_t v6 = v5;
    id v7 = v10;
LABEL_9:
    [v5 setBackgroundColor:v7];

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(ICNoteEditorViewController *)self view];
  [v4 setBackgroundColor:v10];
LABEL_10:
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v4 setNeedsStatusBarAppearanceUpdate];
  char v3 = [(ICNoteEditorViewController *)self navigationController];
  [v3 setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLayoutSubviews
{
  char v3 = [(ICNoteEditorViewController *)self textView];

  if (!v3)
  {
    [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:[(ICNoteEditorViewController *)self needsInitialBarConfiguration]];
    [(ICNoteEditorViewController *)self recreateTextViewIfNecessary];
    [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:0];
  }
  [(ICNoteEditorViewController *)self updateBottomContentPadding];
  if ([(ICNoteEditorViewController *)self shouldResetTextViewContentOffsetWhenAppearing])
  {
    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      [(ICNoteEditorViewController *)self resetTextViewContentOffset];
      objc_super v4 = [(ICNoteEditorViewController *)self textViewController];
      [v4 applyInitialScrollState];
    }
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0
    && [(ICNoteEditorViewController *)self _appearState] == 1)
  {
    [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
  }
  if ([(ICNoteEditorViewController *)self needsInitialBarConfiguration])
  {
    [(ICNoteEditorViewController *)self setNeedsInitialBarConfiguration:0];
    [(ICNoteEditorViewController *)self resetBarButtonsAnimated:0 checkIfVisible:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorViewController;
  [(ICScrollViewDelegateViewController *)&v6 viewDidLayoutSubviews];
  uint64_t v5 = [(ICNoteEditorViewController *)self viewControllerManager];
  [v5 updateHostedNotesAppearance];

  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self ppt_noteEditorDidLayoutSubviews];
  }
}

- (BOOL)needsInitialBarConfiguration
{
  return self->_needsInitialBarConfiguration;
}

- (BOOL)shouldResetTextViewContentOffsetWhenAppearing
{
  return self->_shouldResetTextViewContentOffsetWhenAppearing;
}

- (void)updateTextViewContentInsetsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  [v5 contentInset];
  double v7 = v6;
  double v49 = v8;

  double v9 = [(ICNoteEditorViewController *)self textView];
  [v9 verticalScrollIndicatorInsets];
  double v11 = v10;
  double v48 = v12;

  [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
  double v14 = v13;
  [(ICNoteEditorViewController *)self textViewBottomInsetThatWeWant];
  double v16 = v15;
  [(ICNoteEditorViewController *)self textViewScrollIndicatorInsetsThatWeWant];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
  {
    CGFloat v25 = [(ICNoteEditorViewController *)self textView];
    double v26 = [v25 dateView];
    [v26 preferredHeight];
    double v47 = v18;
    double v27 = v16;
    double v28 = v14;
    double v29 = v11;
    double v30 = v22;
    double v31 = v7;
    double v32 = v20;
    double v33 = v24;
    double v35 = v34;
    double v36 = [(ICNoteEditorViewController *)self textView];
    double v37 = [v36 userTitleView];
    [v37 preferredHeight];
    double v39 = v35 + v38;
    double v24 = v33;
    double v20 = v32;
    double v7 = v31;
    double v22 = v30;
    double v11 = v29;
    double v14 = v28;
    double v16 = v27;
    double v18 = v47 - v39;
  }
  double v40 = [(ICNoteEditorViewController *)self textView];
  v41 = [v40 compatibilityBannerView];

  if (v41)
  {
    double v42 = [(ICNoteEditorViewController *)self textView];
    double v43 = [v42 compatibilityBannerView];
    [v43 preferredHeight];
    double v18 = v18 - v44;
  }
  if (vabdd_f64(v49, v16) >= 0.00999999978
    || vabdd_f64(v7, v14) >= 0.00999999978
    || vabdd_f64(v48, v22) >= 0.00999999978
    || vabdd_f64(v11, v18) >= 0.00999999978)
  {
    if (v3)
    {
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __66__ICNoteEditorViewController_updateTextViewContentInsetsAnimated___block_invoke;
      v50[3] = &unk_2640B9158;
      v50[4] = self;
      *(double *)&v50[5] = v14;
      v50[6] = 0;
      *(double *)&v50[7] = v16;
      v50[8] = 0;
      *(double *)&v50[9] = v18;
      *(double *)&v50[10] = v20;
      *(double *)&v50[11] = v22;
      *(double *)&v50[12] = v24;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v50 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      CGRect v45 = [(ICNoteEditorViewController *)self textView];
      objc_msgSend(v45, "setContentInset:", v14, 0.0, v16, 0.0);

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        CGRect v46 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v46, "setVerticalScrollIndicatorInsets:", v18, v20, v22, v24);
      }
    }
  }
  [(ICNoteEditorViewController *)self updateBottomContentPadding];
}

- (void)updateBottomContentPadding
{
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  char v4 = [v3 isTransitioningToNewSize];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self backgroundView];
    double v6 = [v5 contentView];
    [v6 bounds];
    double v8 = v7;
    [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromTop];
    double v10 = v8 - v9;

    [(ICNoteEditorViewController *)self textViewBottomInsetThatWeWant];
    double v12 = v10 - (v11 + 0.0 + 70.0);
    [(ICNoteEditorViewController *)self textViewBottomPaddingVisibleRatio];
    double v14 = v13 * v12;
    double v15 = [(ICNoteEditorViewController *)self textView];
    double v16 = [v15 bottomContentPadding];
    [v16 targetValue];
    double v18 = vabdd_f64(v17, v14);

    if (v18 >= 0.00999999978)
    {
      unsigned int v19 = [MEMORY[0x263F5AEB0] BOOLForKey:*MEMORY[0x263F5AF10]];
      double v20 = [(ICNoteEditorViewController *)self textView];
      double v21 = [v20 bottomContentPadding];
      [v21 setMode:v19];

      id v23 = [(ICNoteEditorViewController *)self textView];
      double v22 = [v23 bottomContentPadding];
      [v22 setTargetValue:v14];
    }
  }
}

- (double)textViewBottomInsetThatWeWant
{
  uint64_t v3 = [(ICNoteEditorViewController *)self isEditing];

  [(ICNoteEditorViewController *)self textViewBottomInsetThatWeWantForEditing:v3];
  return result;
}

- (double)textViewBottomInsetThatWeWantForEditing:(BOOL)a3
{
  [(ICNoteEditorViewController *)self textViewScrollIndicatorInsetsThatWeWant];
  double v6 = v5;
  if (a3)
  {
    if ([(ICNoteEditorViewController *)self isShowingMiniPlayer]) {
      double v6 = v6 + 70.0;
    }
    if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0)
    {
      double v7 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
      if ([(ICNoteEditorViewController *)self isSelecting]
        && v7
        && ([v7 buttonsVisible] & 1) == 0)
      {
        [(ICNoteEditorViewController *)self inputAccessoryViewHeight];
        double v6 = v6 - v8;
      }
      double v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
      char v10 = [v9 BOOLForKey:*MEMORY[0x263F5AEF8]];

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0 && (v10 & 1) == 0)
      {
        double v11 = [(ICNoteEditorBaseViewController *)self note];
        double v12 = [v11 textStorage];

        uint64_t v13 = [v12 length];
        if (v13)
        {
          uint64_t v14 = v13;
          double v15 = [v12 string];
          uint64_t v16 = v14 - 1;
          uint64_t v17 = [v15 characterAtIndex:v16];

          double v18 = [MEMORY[0x263F08708] newlineCharacterSet];
          LODWORD(v17) = [v18 characterIsMember:v17];

          if (v17)
          {
            unsigned int v19 = [(ICNoteEditorViewController *)self textView];
            uint64_t v20 = [v19 selectedRange];
            uint64_t v22 = v21;

            if (!v22 && v20 == v16)
            {
              id v23 = [(ICNoteEditorViewController *)self textView];
              double v24 = [v23 layoutManager];
              [v24 extraLineFragmentRect];
              double v6 = v6 - v25;
            }
          }
        }
      }
    }
  }
  else if (v5 < 0.0)
  {
    return 0.0;
  }
  return v6;
}

- (void)resetBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
  [v7 reset];

  if (![(ICNoteEditorViewController *)self suspendBarButtonUpdates])
  {
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:v5 checkIfVisible:v4];
  }
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICNoteEditorViewController *)self inlineAttachmentChangeController];

  if (v8 == v6)
  {
    uint64_t v10 = objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_562);
    goto LABEL_5;
  }
  id v9 = [(ICNoteEditorViewController *)self noteAndFolderChangeController];

  if (v9 != v6)
  {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteEditorViewController managedObjectContextChangeController:managedObjectIDsToUpdateForUpdatedManagedObjects:]" simulateCrash:1 showAlert:0 format:@"Need to update this method for a new change controller"];
    uint64_t v10 = [MEMORY[0x263EFFA08] set];
LABEL_5:
    double v11 = (void *)v10;
    goto LABEL_7;
  }
  double v12 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v13 = [v12 folder];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke_2;
  v17[3] = &unk_2640B91C8;
  id v18 = v12;
  id v19 = v13;
  id v14 = v13;
  id v15 = v12;
  double v11 = objc_msgSend(v7, "ic_compactMap:", v17);

LABEL_7:

  return v11;
}

- (ICManagedObjectContextChangeController)inlineAttachmentChangeController
{
  return self->_inlineAttachmentChangeController;
}

- (void)calculateDocumentControllerDidUpdateHighlights:(id)a3
{
  id v3 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
  [v3 scheduleUpdateAnimated:0 force:1];
}

- (ICAuthorHighlightsUpdater)authorHighlightsUpdater
{
  return self->_authorHighlightsUpdater;
}

- (BOOL)doNotAdvanceInsertionPointAfterInsertingAttachment
{
  return self->_doNotAdvanceInsertionPointAfterInsertingAttachment;
}

- (ICCollaborationButtonsController)collaborationButtonsController
{
  return self->_collaborationButtonsController;
}

- (BOOL)becomeFirstResponder
{
  if ([(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    id v3 = [(ICNoteEditorViewController *)self paletteResponder];
    char v4 = [v3 becomeFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorViewController;
    return [(ICNoteEditorViewController *)&v6 becomeFirstResponder];
  }
}

- (ICAuthorHighlightsController)authorHighlightsController
{
  return self->_authorHighlightsController;
}

- (int64_t)attributionSidebarVisibility
{
  v2 = [(ICNoteEditorViewController *)self attributionSidebarController];
  int64_t v3 = [v2 attributionSidebarVisibility];

  return v3;
}

- (void)setAuthorHighlightsController:(id)a3
{
}

- (void)updateBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4
{
  BOOL v5 = a3;
  if ((!a4
     || [(ICNoteEditorViewController *)self _appearState] != 3
     && [(ICNoteEditorViewController *)self _appearState])
    && ![(ICNoteEditorViewController *)self suspendBarButtonUpdates])
  {
    if (objc_opt_respondsToSelector()) {
      [(ICNoteEditorViewController *)self collaborationButtons_updateCollaborationStateIfNeeded];
    }
    id v7 = [(ICNoteEditorBaseViewController *)self note];
    BOOL v153 = v5;
    if ([v7 isEditable])
    {
      id v8 = [(ICNoteEditorBaseViewController *)self note];
      char v4 = [v8 folder];
      if ([v4 supportsEditingNotes])
      {
        id v9 = [(ICNoteEditorViewController *)self invitation];
        if (v9)
        {
          uint64_t v10 = 0;
        }
        else
        {
          double v11 = [(ICNoteEditorBaseViewController *)self note];
          if ([v11 isPasswordProtectedAndLocked])
          {
            uint64_t v10 = 0;
          }
          else
          {
            double v12 = [(ICNoteEditorBaseViewController *)self note];
            if ([v12 isUnsupported])
            {
              uint64_t v10 = 0;
            }
            else
            {
              uint64_t v13 = [(ICNoteEditorViewController *)self unsupportedNoteView];
              uint64_t v10 = v13 == 0;
            }
          }
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }

    id v14 = [(ICNoteEditorViewController *)self textStorage];
    id v15 = [(ICNoteEditorViewController *)self textView];
    uint64_t v16 = [v15 selectedRange];
    if (objc_msgSend(v14, "ic_containsBlockAttachmentsInRange:", v16, v17))
    {
      int v18 = 0;
    }
    else
    {
      id v19 = [(ICNoteEditorViewController *)self auxiliaryResponder];
      if (v19) {
        int v18 = 0;
      }
      else {
        int v18 = v10;
      }
    }
    uint64_t v20 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    if ([v20 canToggleTodo])
    {
      BOOL v148 = 1;
      goto LABEL_41;
    }
    uint64_t v21 = [(ICNoteEditorViewController *)self textView];
    char v22 = [v21 isFirstResponder];
    if ((v22 & 1) != 0
      || ([(ICNoteEditorViewController *)self auxiliaryResponder],
          (char v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v23 = [(ICNoteEditorViewController *)self textView];
      if (objc_msgSend(v23, "ic_canChangeStyle"))
      {
        double v24 = [(ICNoteEditorViewController *)self auxiliaryResponder];
        BOOL v148 = v24 == 0;

        if (v22) {
          goto LABEL_40;
        }
      }
      else
      {

        BOOL v148 = 0;
        if (v22) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      BOOL v148 = 1;
    }

LABEL_40:
LABEL_41:

    double v25 = [(ICNoteEditorViewController *)self textView];
    char v26 = objc_msgSend(v25, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

    if (v26)
    {
      int v27 = 1;
    }
    else
    {
      double v28 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
      if ([v28 canStyleText])
      {
        int v27 = 1;
      }
      else
      {
        double v29 = [(ICNoteEditorViewController *)self textView];
        int v27 = objc_msgSend(v29, "ic_canChangeStyle");
      }
    }
    double v30 = [(ICNoteEditorBaseViewController *)self note];
    if (v30)
    {
      BOOL v150 = 1;
    }
    else
    {
      double v31 = [(ICNoteEditorViewController *)self invitation];
      BOOL v150 = v31 != 0;
    }
    if ([MEMORY[0x263F828A0] isInHardwareKeyboardMode])
    {
      double v32 = [MEMORY[0x263F828B0] sharedInstance];
      int v33 = [v32 isMinimized];
    }
    else
    {
      int v33 = 0;
    }
    double v34 = [(ICNoteEditorViewController *)self traitCollection];
    int v35 = objc_msgSend(v34, "ic_hasCompactWidth");

    int v36 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    uint64_t v37 = v36 ^ 1u;
    LODWORD(v152) = v35;
    if ((v36 & 1) == 0 && (v35 & 1) == 0) {
      uint64_t v37 = objc_msgSend(MEMORY[0x263F82670], "ic_isiPhone");
    }
    v151 = (void *)[(ICNoteEditorViewController *)self ic_behavior];
    uint64_t v38 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
    double v39 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v39 setAccessibilityTextSizeEnabled:v38];

    int v40 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    LODWORD(v154) = v27;
    int v149 = v33;
    int v41 = v10;
    if (v40)
    {
      uint64_t v10 = [(ICNoteEditorBaseViewController *)self note];
      if (v10)
      {
        int v42 = 0;
        BOOL v43 = 1;
      }
      else
      {
        v147 = [(ICNoteEditorViewController *)self viewControllerManager];
        double v39 = [v147 selectedContainerItemID];
        BOOL v43 = v39 != 0;
        int v42 = 1;
      }
    }
    else
    {
      int v42 = 0;
      BOOL v43 = 0;
    }
    double v44 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v44 setCanShowPillOrnament:v43];

    if (v42)
    {
    }
    if (v40) {

    }
    CGRect v45 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v45 setCompact:v37];

    CGRect v46 = [(ICNoteEditorBaseViewController *)self note];
    double v47 = (void *)[v46 isDeletedOrInTrash];
    double v48 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v48 setDeleted:v47];

    int v49 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    if (v49)
    {
      double v47 = [(ICNoteEditorViewController *)self viewControllerManager];
      uint64_t v50 = [v47 canTilePrimaryContent] ^ 1;
    }
    else
    {
      uint64_t v50 = 0;
    }
    int v51 = v41;
    CGRect v52 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v52 setHidesBackButton:v50];

    if (v49) {
    v53 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    }
    [v53 setHidesDefaultCenterItems:v151 == (void *)1];

    v54 = [(ICNoteEditorViewController *)self ic_windowScene];
    BOOL v55 = (unint64_t)([v54 interfaceOrientation] - 3) < 2;
    v56 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v56 setLandscape:v55];

    BOOL v57 = [(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen];
    v58 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v58 setInSecureScreen:v57];

    v59 = [(ICNoteEditorViewController *)self viewControllerManager];
    BOOL v60 = [v59 proposedMainSplitViewControllerDisplayMode] == 4;
    v61 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v61 setInTripleColumnSplitView:v60];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      uint64_t v62 = 0;
    }
    else {
      uint64_t v62 = [(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPhone] ^ 1;
    }
    v63 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v63 setShowsDoneWhileEditing:v62];

    if (v151 == (void *)1) {
      uint64_t v64 = v152 ^ 1;
    }
    else {
      uint64_t v64 = 0;
    }
    uint64_t v65 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [(id)v65 setShowsSidebarButton:v64];

    v66 = [(ICNoteEditorViewController *)self auxiliaryResponder];
    objc_opt_class();
    LOBYTE(v65) = objc_opt_isKindOfClass();
    v67 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v67 setTableSelected:v65 & 1];

    int v68 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    if (v68)
    {
      v66 = [(ICNoteEditorViewController *)self viewControllerManager];
      BOOL v69 = [v66 noteContainerViewMode] == 1;
    }
    else
    {
      BOOL v69 = 0;
    }
    v70 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v70 setUsesCustomBackButton:v69];

    if (v68) {
    uint64_t v71 = objc_msgSend(MEMORY[0x263F82670], "ic_isLargeiPad") & (v149 ^ 1);
    }
    v72 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v72 setUsesOnlyTrailingInputAssistantItems:v71];

    uint64_t v73 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    v74 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v74 setUsesPillOrnament:v73];

    uint64_t v75 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    v76 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v76 setUsesSidecarMenu:v75];

    uint64_t v77 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    v78 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v78 setUsesStyleMenu:v77];

    BOOL v79 = ([(ICNoteEditorViewController *)self isEditing] & 1) != 0
       || [(ICNoteEditorViewController *)self didEndEditingForAddingImageAttachment];
    v80 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v80 setEditing:v79];

    if ([(ICNoteEditorViewController *)self isInkPickerShowing])
    {
      v81 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
      v82 = v81;
      uint64_t v83 = 3;
    }
    else if ([(ICNoteEditorViewController *)self isDrawingStrokeWithPencil])
    {
      v81 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
      v82 = v81;
      uint64_t v83 = 1;
    }
    else
    {
      BOOL v84 = [(ICNoteEditorViewController *)self didDrawWithPencilWithoutPalette];
      v81 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
      v82 = v81;
      if (v84) {
        uint64_t v83 = 2;
      }
      else {
        uint64_t v83 = 0;
      }
    }
    [v81 setInlineSketchEditingState:v83];

    v85 = [(ICNoteEditorViewController *)self firstResponder];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v87 = (([(ICNoteEditorViewController *)self isSplitViewExpandingOrCollapsing] | v18) ^ 1) & isKindOfClass;
    v88 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v88 setEditingTable:v87];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && [MEMORY[0x263F82B10] _isWritingToolsAvailable])
    {
      uint64_t v89 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision") ^ 1;
    }
    else
    {
      uint64_t v89 = 0;
    }
    v90 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v90 setCanShowWritingTools:v89];

    if (v89)
    {
      v90 = [(ICNoteEditorBaseViewController *)self note];
      uint64_t v91 = [v90 isPasswordProtectedAndLocked] ^ 1;
    }
    else
    {
      uint64_t v91 = 0;
    }
    v92 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v92 setCanUseWritingTools:v91];

    if (v89) {
    int v93 = isKindOfClass ^ 1;
    }
    v94 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v94 setCanAddChecklist:(v148 & v51 | !v150) & (isKindOfClass ^ 1u)];

    v95 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v95 setCanAddMedia:v51 | !v150];

    v96 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v97 = [v96 isEmpty];
    if (v97)
    {
      uint64_t v98 = 0;
    }
    else
    {
      v95 = [(ICNoteEditorViewController *)self viewControllerManager];
      uint64_t v98 = [v95 canAddNewNoteToSelectedContainers];
    }
    v99 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v99 setCanAddNote:v98];

    if ((v97 & 1) == 0) {
    uint64_t v100 = v154;
    }
    if (v18)
    {
      BOOL v101 = 1;
    }
    else
    {
      uint64_t v97 = [(ICNoteEditorViewController *)self auxiliaryResponder];
      BOOL v101 = v97 != 0;
    }
    v102 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v102 setCanAddTable:v101];

    if ((v18 & 1) == 0) {
    if ((v154 & v51) == 1)
    }
      uint64_t v103 = [(ICNoteEditorViewController *)self isEditing] & v93;
    else {
      uint64_t v103 = 0;
    }
    v104 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v104 setCanChangeStyle:v103];

    uint64_t v105 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision") ^ 1;
    v106 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v106 setCanCustomizeCenterItems:v105];

    v107 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    if (!v107
      || ([(ICNoteEditorViewController *)self passwordEntryViewController],
          id v154 = (id)objc_claimAutoreleasedReturnValue(),
          [v154 isAnimatingOut]))
    {
      uint64_t v113 = [(ICNoteEditorViewController *)self invitationViewController];
      if (v113)
      {
        uint64_t v100 = v113;
        int v109 = 0;
        int v110 = 0;
        int v111 = 0;
        uint64_t v112 = 0;
        int v108 = 1;
      }
      else
      {
        uint64_t v114 = [(ICNoteEditorViewController *)self unsupportedNoteView];
        if (v114)
        {
          v102 = (void *)v114;
          uint64_t v100 = 0;
          int v110 = 0;
          int v111 = 0;
          uint64_t v112 = 0;
          int v108 = 1;
          int v109 = 1;
        }
        else
        {
          uint64_t v115 = [(ICNoteEditorBaseViewController *)self note];
          if (v115)
          {
            v152 = (void *)v115;
            v151 = [(ICNoteEditorBaseViewController *)self note];
            uint64_t v112 = [v151 isEditable];
            uint64_t v100 = 0;
            v102 = 0;
            int v108 = 1;
            int v109 = 1;
            int v110 = 1;
            int v111 = 1;
          }
          else
          {
            uint64_t v100 = 0;
            v102 = 0;
            v152 = 0;
            int v111 = 0;
            int v108 = 1;
            int v109 = 1;
            int v110 = 1;
            uint64_t v112 = 1;
          }
        }
      }
    }
    else
    {
      int v108 = 0;
      int v109 = 0;
      int v110 = 0;
      int v111 = 0;
      uint64_t v112 = 0;
    }
    v116 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v116 setCanInlineSketch:v112];

    if (v111) {
    if (v110)
    }
    {

      if (!v109) {
        goto LABEL_127;
      }
    }
    else if (!v109)
    {
LABEL_127:
      if (v108) {
        goto LABEL_128;
      }
      goto LABEL_132;
    }

    if (v108)
    {
LABEL_128:

      if (!v107)
      {
LABEL_134:

        v117 = [(ICNoteEditorBaseViewController *)self note];
        uint64_t v118 = [v117 isEmpty] ^ 1;
        v119 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
        [v119 setCanSaveQuickNote:v118];

        v120 = [(ICNoteEditorViewController *)self invitation];
        if (v120)
        {
          uint64_t v121 = 0;
        }
        else
        {
          v117 = [(ICNoteEditorBaseViewController *)self note];
          uint64_t v121 = [v117 isSharable];
        }
        v122 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
        [v122 setCanShare:v121];

        if (!v120) {
        v123 = [(ICNoteEditorViewController *)self magicGenerativePlaygroundUndoManager];
        }
        v124 = v123;
        if (v123)
        {
          id v155 = v123;
        }
        else
        {
          v125 = [(ICNoteEditorViewController *)self textView];
          id v155 = [v125 undoManager];
        }
        v126 = [(ICNoteEditorBaseViewController *)self note];
        if ([v126 isEditable]) {
          uint64_t v127 = [v155 canRedo];
        }
        else {
          uint64_t v127 = 0;
        }
        v128 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
        [v128 setCanRedo:v127];

        v129 = [(ICNoteEditorBaseViewController *)self note];
        if ([v129 isEditable]) {
          uint64_t v130 = [v155 canUndo];
        }
        else {
          uint64_t v130 = 0;
        }
        v131 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
        [v131 setCanUndo:v130];

        v132 = [(ICNoteEditorViewController *)self viewControllerManager];
        int v133 = [v132 isAuxiliary];

        if (v133)
        {
          if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
            uint64_t v134 = 2;
          }
          else {
            uint64_t v134 = 1;
          }
        }
        else
        {
          uint64_t v134 = 0;
        }
        v135 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
        [v135 setAuxiliaryWindowType:v134];

        v136 = [(ICNoteEditorBaseViewController *)self note];
        if ([v136 isPasswordProtected])
        {
          v137 = [(ICNoteEditorBaseViewController *)self note];
          char v138 = [v137 isUnsupported];

          if (v138)
          {
            uint64_t v139 = 0;
LABEL_161:
            v140 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
            [v140 setLockState:v139];

            if ([(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPhone]) {
              uint64_t v141 = 2;
            }
            else {
              uint64_t v141 = [(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPad];
            }
            v142 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
            [v142 setQuickNoteType:v141];

            BOOL v143 = [(ICNoteEditorViewController *)self hasMadeEdits];
            BOOL v144 = v139 != 1 && v143;
            v145 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
            [v145 setCanShowUndoRedo:v144];

            v146 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
            [v146 updateAnimated:v153];

            return;
          }
          v136 = [(ICNoteEditorBaseViewController *)self note];
          if ([v136 isAuthenticated]) {
            uint64_t v139 = 2;
          }
          else {
            uint64_t v139 = 1;
          }
        }
        else
        {
          uint64_t v139 = 0;
        }

        goto LABEL_161;
      }
LABEL_133:

      goto LABEL_134;
    }
LABEL_132:
    if (!v107) {
      goto LABEL_134;
    }
    goto LABEL_133;
  }
}

- (ICNoteEditorNavigationItemConfiguration)navigationItemConfiguration
{
  return self->_navigationItemConfiguration;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (UIResponder)auxiliaryResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryResponder);

  return (UIResponder *)WeakRetained;
}

- (ICUnsupportedNoteView)unsupportedNoteView
{
  return self->_unsupportedNoteView;
}

- (ICPasswordEntryViewController)passwordEntryViewController
{
  return self->_passwordEntryViewController;
}

- (ICInvitation)invitation
{
  return self->_invitation;
}

- (BOOL)isEditingOnSystemPaperOnPhone
{
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]) {
    return 0;
  }
  int64_t v3 = [(ICNoteEditorViewController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] == 0;

  return v4;
}

- (ICAuxiliaryStyling)auxiliaryStylingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);

  return (ICAuxiliaryStyling *)WeakRetained;
}

- (BOOL)suspendBarButtonUpdates
{
  return self->_suspendBarButtonUpdates;
}

- (BOOL)isInkPickerShowing
{
  int64_t v3 = [(ICNoteEditorViewController *)self inkPaletteController];
  if (v3)
  {
    BOOL v4 = [(ICNoteEditorViewController *)self inkPaletteController];
    char v5 = [v4 isInkPaletteShowing];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (ICInvitationViewController)invitationViewController
{
  return self->_invitationViewController;
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (BOOL)isEditingOnSystemPaperOnPad
{
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]) {
    return 0;
  }
  int64_t v3 = [(ICNoteEditorViewController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  return v4;
}

- (BOOL)isDrawingStrokeWithPencil
{
  return self->_isDrawingStrokeWithPencil;
}

- (BOOL)hasMadeEdits
{
  return self->_hasMadeEdits;
}

- (BOOL)didEndEditingForAddingImageAttachment
{
  return self->_didEndEditingForAddingImageAttachment;
}

- (BOOL)didDrawWithPencilWithoutPalette
{
  return self->_didDrawWithPencilWithoutPalette;
}

- (BOOL)shouldLockTextViewContentOffset
{
  if ([(ICNoteEditorViewController *)self isDrawingStroke]) {
    return 1;
  }
  int64_t v3 = [(ICNoteEditorViewController *)self dateOfLastStrokeOrNewDrawing];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [MEMORY[0x263EFF910] date];
  char v5 = [(ICNoteEditorViewController *)self dateOfLastStrokeOrNewDrawing];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7 < 0.1;
}

- (BOOL)isDrawingStroke
{
  return self->_isDrawingStroke;
}

- (NSDate)dateOfLastStrokeOrNewDrawing
{
  return self->_dateOfLastStrokeOrNewDrawing;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)nibBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)applyScrollStateFromArchive:(id)a3
{
  if (a3) {
    -[ICNoteEditorViewController setArchivedScrollStateToApply:](self, "setArchivedScrollStateToApply:");
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  char v5 = [v4 object];
  double v6 = [(ICNoteEditorViewController *)self viewIfLoaded];
  double v7 = [v6 window];
  id v8 = [v7 windowScene];
  int v9 = [v5 isEqual:v8];

  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v10 = [(ICNoteEditorBaseViewController *)self note];
  if ([v10 isPasswordProtected])
  {
    double v11 = [(ICNoteEditorViewController *)self viewControllerManager];
    uint64_t v12 = [v11 selectedNoteObjectID];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      id v14 = [(ICNoteEditorViewController *)self viewControllerManager];
      id v15 = [v14 selectedNoteObjectID];
      uint64_t v16 = [(ICNoteEditorBaseViewController *)self note];
      uint64_t v17 = [v16 objectID];
      char v18 = [v15 isEqual:v17];

      if (v18) {
        goto LABEL_8;
      }
      uint64_t v10 = [(ICNoteEditorViewController *)self viewControllerManager];
      double v11 = [v10 selectedModernNote];
      [(ICNoteEditorViewController *)self setNote:v11];
    }
  }
LABEL_8:
  [(ICNoteEditorViewController *)self showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:0];
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    id v19 = [(ICNoteEditorBaseViewController *)self note];

    if (v19)
    {
      uint64_t v20 = [(ICNoteEditorViewController *)self eventReporter];
      uint64_t v21 = [(ICNoteEditorBaseViewController *)self note];
      [v20 startNoteViewEventDurationTrackingForModernNote:v21 reportCoreAnalytics:0];
    }
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v22, &location);
    dispatchMainAfterDelay();
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
LABEL_13:
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    BOOL v3 = [(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPhone];
    id v4 = objc_alloc(MEMORY[0x263F5A768]);
    char v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    if (v3)
    {
      double v7 = (ICNAEventReporter *)[v4 initWithSubTrackerName:v6];
      eventReporter = self->_eventReporter;
      self->_eventReporter = v7;
    }
    else
    {
      eventReporter = [(ICNoteEditorViewController *)self view];
      int v9 = (ICNAEventReporter *)[v4 initWithSubTrackerName:v6 view:eventReporter];
      uint64_t v10 = self->_eventReporter;
      self->_eventReporter = v9;
    }
    double v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  uint64_t v12 = self->_eventReporter;

  return v12;
}

- (void)showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    return;
  }
  if (v3)
  {
    char v5 = [(ICNoteEditorBaseViewController *)self note];
    if ([v5 isPasswordProtected])
    {
      double v6 = [(ICNoteEditorBaseViewController *)self note];
      int v7 = [v6 isAuthenticated];

      if (v7)
      {
        if (![(ICNoteEditorViewController *)self styleSelectorInputViewShowing])
        {
          id v8 = [(ICNoteEditorViewController *)self visualAssetImportController];
          char v9 = [v8 isShowing];

          if ((v9 & 1) == 0)
          {
            uint64_t v10 = [(ICNoteEditorViewController *)self viewControllerManager];
            double v11 = [v10 currentAttachmentPresenter];
            [v11 dismissAnimated:0 completion:0];

            [(ICNoteEditorViewController *)self hideAndDismissPresentedViewController];
          }
        }
        uint64_t v12 = [(ICNoteEditorViewController *)self lockIconCoverViewController];

        if (v12)
        {
          uint64_t v13 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
          id v14 = [v13 view];
          [v14 removeFromSuperview];

          [(ICNoteEditorViewController *)self setLockIconCoverViewController:0];
        }
        id v15 = (void *)[objc_alloc(MEMORY[0x263F5B418]) initWithNibName:0 bundle:0 note:0 intent:0];
        [(ICNoteEditorViewController *)self setLockIconCoverViewController:v15];

        uint64_t v16 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
        [v16 setMode:1];

        uint64_t v17 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
        char v18 = [v17 view];
        [v18 setAutoresizingMask:18];

        id v19 = [(ICNoteEditorViewController *)self view];
        [v19 bounds];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v28 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
        double v29 = [v28 view];
        objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

        double v30 = [(ICNoteEditorViewController *)self view];
        double v31 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
        double v32 = [v31 view];
        [v30 addSubview:v32];

        if (ICInternalSettingsIsTextKit2Enabled())
        {
          int v33 = [(ICNoteEditorViewController *)self view];
          double v34 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
          int v35 = [v34 view];
          [v33 bringSubviewToFront:v35];
        }
        if ([(ICNoteEditorViewController *)self isEditing])
        {
          int v36 = [(ICNoteEditorViewController *)self textView];
          char v37 = [v36 hidePrediction];

          if ((v37 & 1) == 0)
          {
            uint64_t v38 = [(ICNoteEditorViewController *)self textView];
            [v38 setHidePrediction:1];

            id v47 = [MEMORY[0x263F828A0] activeKeyboard];
            [v47 textInputTraitsDidChange];
          }
        }
        return;
      }
    }
    else
    {
    }
  }
  double v39 = [(ICNoteEditorViewController *)self lockIconCoverViewController];
  int v40 = v39;
  if (v39)
  {
    int v41 = (void *)MEMORY[0x263F82E00];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke;
    v50[3] = &unk_2640B8140;
    id v51 = v39;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke_2;
    v48[3] = &unk_2640B93C0;
    id v49 = v51;
    [v41 animateWithDuration:v50 animations:v48 completion:0.5];
  }
  int v42 = [(ICNoteEditorViewController *)self textView];
  int v43 = [v42 hidePrediction];

  if (v43)
  {
    double v44 = [(ICNoteEditorViewController *)self textView];
    [v44 setHidePrediction:0];

    CGRect v45 = [(ICNoteEditorViewController *)self textView];
    LODWORD(v44) = [v45 isEditing];

    if (v44)
    {
      CGRect v46 = [MEMORY[0x263F828A0] activeKeyboard];
      [v46 textInputTraitsDidChange];
    }
  }
}

- (ICPasswordEntryViewController)lockIconCoverViewController
{
  return self->_lockIconCoverViewController;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if (([(ICNoteEditorViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/ICNoteEditorViewController.m"] & 1) == 0)
  {
    v73.receiver = self;
    v73.super_class = (Class)ICNoteEditorViewController;
    [(ICNoteEditorViewController *)&v73 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];

    goto LABEL_10;
  }
  char v13 = [(ICNoteEditorViewController *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

  if ((v13 & 1) == 0)
  {
    if (a6 == &compoundliteral_2984)
    {
      [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
      goto LABEL_10;
    }
    if (a6 != &compoundliteral_2986)
    {
      if (a6 != &compoundliteral_2988)
      {
        if (a6 == &compoundliteral_0)
        {
          if ([(ICNoteEditorViewController *)self isInkPickerShowing])
          {
            double v23 = [(ICNoteEditorViewController *)self textViewController];
            int v24 = [v23 isViewLoaded];

            if (v24)
            {
              if ([MEMORY[0x263F82A20] prefersPencilOnlyDrawing]) {
                [(ICNoteEditorViewController *)self cleanupAfterFingerDrawing];
              }
              else {
                [(ICNoteEditorViewController *)self setupForFingerDrawing];
              }
            }
          }
        }
        else if (a6 == &compoundliteral_2982)
        {
          [(ICNoteEditorViewController *)self forceLightContentDidChange:0];
        }
        goto LABEL_10;
      }
      double v20 = [(ICNoteEditorViewController *)self textViewIfLoaded];
      double v21 = [(ICNoteEditorBaseViewController *)self note];
      [v20 createUserTitleViewIfNecessaryForNote:v21];

      if (![(ICNoteEditorViewController *)self usesCustomTransition]) {
        goto LABEL_10;
      }
      id v19 = [(ICNoteEditorViewController *)self textView];
      double v22 = [v19 userTitleView];
      [v22 setAlpha:0.0];

LABEL_18:
      goto LABEL_10;
    }
    uint64_t v14 = [(ICNoteEditorBaseViewController *)self note];
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = [(ICNoteEditorBaseViewController *)self note];
      uint64_t v17 = [v16 noteHasChanges];
      if ([v17 BOOLValue])
      {
        int v18 = [v10 isEqualToString:@"noteHasChanges"];

        if (v18)
        {
          id v19 = [(ICNoteEditorBaseViewController *)self note];
          [v19 setNoteHasChanges:MEMORY[0x263EFFA80]];
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    uint64_t v25 = [(ICNoteEditorBaseViewController *)self note];
    if (v25)
    {
      double v26 = (void *)v25;
      int v27 = [v10 isEqualToString:@"modificationDate"];

      if (v27)
      {
        [(ICNoteEditorViewController *)self updateLastViewedMetadataIfNessessary];
        goto LABEL_10;
      }
    }
    uint64_t v28 = [(ICNoteEditorBaseViewController *)self note];
    if (v28)
    {
      double v29 = (void *)v28;
      int v30 = [v10 isEqualToString:@"attachmentViewType"];

      if (v30)
      {
        objc_opt_class();
        double v31 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        double v32 = ICDynamicCast();

        objc_opt_class();
        int v33 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        double v34 = ICDynamicCast();

        if (!v34) {
          goto LABEL_73;
        }
        int v35 = (void *)*MEMORY[0x263EFFD08];
        int v36 = (void *)*MEMORY[0x263EFFD08] == v32 ? 0 : v32;
        unint64_t v37 = v36;
        uint64_t v38 = v35 == v34 ? 0 : v34;
        unint64_t v39 = v38;
        if (!(v37 | v39)) {
          goto LABEL_73;
        }
        int v40 = (void *)v39;
        if (v37 && v39)
        {
          char v41 = [(id)v37 isEqual:v39];

          if (v41) {
            goto LABEL_73;
          }
        }
        else
        {
        }
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          [(ICNoteEditorViewController *)self resetTextViewContentOffset];
          objc_opt_class();
          BOOL v69 = [(ICNoteEditorViewController *)self textView];
          v70 = [v69 layoutManager];
          uint64_t v71 = ICDynamicCast();

          [v71 invalidateLayoutAfterAttachmentViewTypeChangeIfNecessary];
        }
        goto LABEL_73;
      }
    }
    uint64_t v42 = [(ICNoteEditorBaseViewController *)self note];
    if (v42)
    {
      int v43 = (void *)v42;
      int v44 = [v10 isEqualToString:@"paperStyleType"];

      if (v44)
      {
        [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
        goto LABEL_10;
      }
    }
    uint64_t v45 = [(ICNoteEditorBaseViewController *)self note];
    if (v45)
    {
      CGRect v46 = (void *)v45;
      int v47 = [v10 isEqualToString:@"isEmpty"];

      if (v47)
      {
        objc_opt_class();
        double v48 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        double v32 = ICCheckedDynamicCast();

        objc_opt_class();
        id v49 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        double v34 = ICCheckedDynamicCast();

        if (!v34) {
          goto LABEL_73;
        }
        uint64_t v50 = (void *)*MEMORY[0x263EFFD08];
        id v51 = (void *)*MEMORY[0x263EFFD08] == v32 ? 0 : v32;
        unint64_t v52 = v51;
        v53 = v50 == v34 ? 0 : v34;
        unint64_t v54 = v53;
        if (!(v52 | v54)) {
          goto LABEL_73;
        }
        BOOL v55 = (void *)v54;
        if (v52 && v54)
        {
          char v56 = [(id)v52 isEqual:v54];

          if (v56) {
            goto LABEL_73;
          }
        }
        else
        {
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__ICNoteEditorViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_2640B8140;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_73:

        goto LABEL_10;
      }
    }
    uint64_t v57 = [(ICNoteEditorBaseViewController *)self note];
    if (v57
      && (v58 = (void *)v57,
          int v59 = [v10 isEqualToString:@"serverShareData"],
          v58,
          v59))
    {
      BOOL v60 = [(ICNoteEditorViewController *)self mentionsController];
      [v60 updateNoteParticipants];

      [(ICNoteEditorViewController *)self updateParticipantsInDrawings];
    }
    else
    {
      uint64_t v61 = [(ICNoteEditorBaseViewController *)self note];
      if (v61
        && (uint64_t v62 = (void *)v61,
            int v63 = [v10 isEqualToString:@"isSharedViaICloud"],
            v62,
            v63))
      {
        BOOL v64 = [(ICNoteEditorViewController *)self shouldAllowAttributionSidebar];
        uint64_t v65 = [(ICNoteEditorViewController *)self attributionSidebarController];
        [v65 setEnabled:v64];

        [(ICNoteEditorViewController *)self resetDateView];
      }
      else
      {
        uint64_t v66 = [(ICNoteEditorBaseViewController *)self note];
        if (v66)
        {
          v67 = (void *)v66;
          int v68 = [v10 isEqualToString:@"lastActivitySummaryViewedDate"];

          if (v68) {
            [(ICNoteEditorViewController *)self resetBarButtonsAnimated:0];
          }
        }
      }
    }
  }
LABEL_10:
}

- (void)setViewControllerManager:(id)a3
{
}

- (void)setActivityItemsConfigurationProvider:(id)a3
{
}

- (void)setNote:(id)a3 delayedForLaunch:(BOOL)a4 successHandler:(id)a5
{
  BOOL v6 = a4;
  v149[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v134 = (void (**)(void))a5;
  [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:1];
  char v9 = [(ICNoteEditorViewController *)self textViewController];
  [v9 setIgnoresTaps:0];

  id v10 = [(ICNoteEditorViewController *)self unsupportedNoteTapGestureRecognizer];

  if (v10)
  {
    id v11 = [(ICNoteEditorViewController *)self view];
    id v12 = [(ICNoteEditorViewController *)self unsupportedNoteTapGestureRecognizer];
    [v11 removeGestureRecognizer:v12];

    [(ICNoteEditorViewController *)self setUnsupportedNoteTapGestureRecognizer:0];
  }
  if ([v8 isUnsupported] && objc_msgSend(v8, "isDeletedOrInTrash"))
  {
    char v13 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_showRecoverNoteAlert];
    [(ICNoteEditorViewController *)self setUnsupportedNoteTapGestureRecognizer:v13];

    uint64_t v14 = [(ICNoteEditorViewController *)self view];
    id v15 = [(ICNoteEditorViewController *)self unsupportedNoteTapGestureRecognizer];
    [v14 addGestureRecognizer:v15];
  }
  if (v8 && objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    uint64_t v16 = [(ICNoteEditorViewController *)self viewControllerManager];
    if ([v16 isMainSplitViewDisplayModeSecondaryOnly])
    {
      uint64_t v17 = 1;
    }
    else
    {
      int v18 = [(ICNoteEditorViewController *)self viewControllerManager];
      uint64_t v17 = [v18 isAuxiliary];
    }
    id v19 = [(ICNoteEditorViewController *)self viewControllerManager];
    BOOL v20 = [v19 noteContainerViewMode] == 0;

    double v21 = [(ICNoteEditorViewController *)self viewControllerManager];
    if ([v21 noteContainerViewMode] == 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v17;
    }

    [(ICNoteEditorViewController *)self updateContentViewBezelsStandalone:v17 needsAdditionalBottomMargin:v20 needsAdditionalLeadingMargin:v22 force:0];
  }
  if ([v8 isSharedReadOnly]) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = [v8 isSharedAndEmpty];
  }
  [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:v23];
  id v135 = [(ICNoteEditorBaseViewController *)self note];
  if (v135 != v8)
  {
    [(ICNoteEditorViewController *)self setHasMadeEdits:0];
    BOOL v24 = [(ICNoteEditorViewController *)self shouldTrackNoteViewEventAnalyticsFromSettingNote];
    if (v135)
    {
      if (v24)
      {
        uint64_t v25 = [(ICNoteEditorViewController *)self viewIfLoaded];
        double v26 = [v25 window];

        if (v26) {
          [(ICNoteEditorViewController *)self submitNoteViewEventForModernNote:v135];
        }
      }
    }
    [(ICNoteEditorViewController *)self submitNoteEditEventIfNecessary];
    int v27 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController setNote:delayedForLaunch:successHandler:]((uint64_t)self, v8);
    }

    uint64_t v28 = [MEMORY[0x263F5ABC0] sharedState];
    [v28 extendDeauthenticationTimer];

    v132 = [(ICNoteEditorViewController *)self presentedViewController];
    objc_opt_class();
    double v29 = ICDynamicCast();
    v129 = v29;
    if (v29) {
      int v30 = objc_msgSend(v29, "shouldDismissWhenShowingNote", v29);
    }
    else {
      int v30 = 1;
    }
    if (NSClassFromString(&cfstr_Icallownotific.isa)) {
      v30 &= ~objc_opt_isKindOfClass();
    }
    if (v30 && v132) {
      [(ICNoteEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
    -[ICNoteEditorViewController setPaperTextAttachmentManager:](self, "setPaperTextAttachmentManager:", 0, v129);
    [(ICNoteEditorViewController *)self setMagicGenerativePlaygroundUndoManager:0];
    [(ICNoteEditorViewController *)self setAuthorHighlightsController:0];
    [(ICNoteEditorViewController *)self setAuthorHighlightsUpdater:0];
    [(ICNoteEditorViewController *)self setMentionsController:0];
    [(ICNoteEditorViewController *)self setHashtagController:0];
    [(ICNoteEditorViewController *)self setCalculateRecognitionController:0];
    [(ICNoteEditorViewController *)self setCollaborationButtonsController:0];
    [(ICNoteEditorViewController *)self setCollaborationBarButtonItem:0];
    int v133 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    if (v133)
    {
      if ([v133 isShowing]) {
        [v133 hideAccelerator];
      }
      [v133 setLinkDelegate:0];
    }
    [(ICNoteEditorViewController *)self setLinkAcceleratorController:0];
    int v33 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v33 setLinkDelegate:0];

    if (v135)
    {
      [(ICNoteEditorViewController *)self setInkPickerState:2];
      [(ICNoteEditorViewController *)self showInkPicker:0 animated:0];
      [(ICNoteEditorViewController *)self updateInlineDrawingsPaletteVisibility];
      double v34 = [MEMORY[0x263F5B3E0] sharedController];
      [v34 sendPendingNotifications];

      [v135 markActivitySummaryViewed];
      if ([v135 isPasswordProtected])
      {
        int v35 = [v135 account];
        int v36 = [v35 accountData];
        unint64_t v37 = [v36 cryptoPassphraseVerifier];
        BOOL v38 = v37 == 0;

        if (!v38)
        {
          unint64_t v39 = [MEMORY[0x263F5B3B0] sharedMigrator];
          [v39 migrateNoteToV1NeoIfNeeded:v135 completionHandler:&__block_literal_global_816];
        }
      }
      [(ICNoteEditorViewController *)self presentRecordingStoppedAlertForNoteIfNeeded:v135];
    }
    [(ICNoteEditorViewController *)self showStyleSelector:0 animated:0];
    [(ICNoteEditorViewController *)self tearDownAudioPlayers];
    [(ICNoteEditorViewController *)self stopTextFindingIfNecessary];
    [(ICNoteEditorViewController *)self saveCurrentScrollState];
    +[ICMovieController stopIfPlaying];
    if (v6)
    {
      int v40 = [v8 textStorage];
      BOOL v41 = (unint64_t)[v40 length] > 0x10000;

      if (v41)
      {
        id v42 = v8;
        int v43 = (void *)[v134 copy];
        dispatch_time_t v44 = dispatch_time(0, 0);
        uint64_t v45 = MEMORY[0x263EF83A0];
        id v46 = MEMORY[0x263EF83A0];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_818;
        block[3] = &unk_2640B8230;
        block[4] = self;
        id v47 = v42;
        id v145 = v47;
        id v48 = v43;
        id v146 = v48;
        dispatch_after(v44, v45, block);

        id v8 = 0;
      }
    }
    int v131 = [(ICNoteEditorViewController *)self isEditing];
    if (v131)
    {
      [(ICNoteEditorViewController *)self textViewScrollIndicatorBottomInsetOverride];
      -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverrideToRestore:](self, "setTextViewScrollIndicatorBottomInsetOverrideToRestore:");
    }
    id v49 = (void *)MEMORY[0x263F5AA48];
    uint64_t v50 = (void *)MEMORY[0x263F5B078];
    id v51 = (void *)MEMORY[0x263F5B118];
    if (v135)
    {
      -[ICNoteEditorViewController removeKVOObserversForNote:](self, "removeKVOObserversForNote:");
      unint64_t v52 = [MEMORY[0x263F08A00] defaultCenter];
      [v52 removeObserver:self name:*v49 object:v135];
      [v52 removeObserver:self name:*MEMORY[0x263F5AA80] object:v135];
      [v52 removeObserver:self name:*MEMORY[0x263F5A9F0] object:v135];
      v53 = [v135 calculateDocumentController];
      [v52 removeObserver:self name:*v50 object:v53];

      [v52 removeObserver:self name:*v51 object:v135];
      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        objc_opt_class();
        unint64_t v54 = [(ICNoteEditorViewController *)self textView];
        BOOL v55 = [v54 layoutManager];
        char v56 = ICCheckedDynamicCast();

        [v56 clearAllSupplementalViews];
      }
      uint64_t v57 = [(ICNoteEditorViewController *)self textController];
      [v57 resetTrackedToDoParagraphs];

      v58 = [(ICNoteEditorViewController *)self calculateRecognitionController];
      [v58 discardPreviewedResult];

      [(ICNoteEditorViewController *)self setNoteAndFolderChangeController:0];
      [(ICNoteEditorViewController *)self setInlineAttachmentChangeController:0];
      int v59 = +[ICSystemPaperDocumentController sharedInstance];
      [v59 removePresenter:self];

      if ([(ICNoteEditorBaseViewController *)self viewAppearanceState] <= 1) {
        goto LABEL_59;
      }
      [(ICNoteEditorBaseViewController *)self noteWillDisappear:v135];
      if (!v8)
      {
LABEL_64:
        [(ICNoteEditorViewController *)self resetTextViewUndoManager];
        BOOL v61 = v8 != 0;
LABEL_65:
        id v63 = [(ICNoteEditorViewController *)self previousNote];
        BOOL v64 = v8 == v63;

        if (!v64)
        {
          uint64_t v65 = [(ICNoteEditorViewController *)self previousNote];
          [v65 setHandwritingRecognitionEnabled:0];
        }
        [(ICNoteEditorViewController *)self setPreviousNote:v135];
        v143.receiver = self;
        v143.super_class = (Class)ICNoteEditorViewController;
        [(ICNoteEditorBaseViewController *)&v143 setNote:v8];
        -[ICNoteEditorViewController setLastSelectedRange:](self, "setLastSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        if ([v8 needsRefresh]) {
          [(ICNoteEditorViewController *)self fetchAll];
        }
        uint64_t v66 = [MEMORY[0x263F5ACA0] sharedContext];
        [v66 setCurrentNote:v8];

        if (v61)
        {
          [(ICNoteEditorViewController *)self addKVOObserversForNote:v8];
          v67 = [MEMORY[0x263F08A00] defaultCenter];
          [v67 addObserver:self selector:sel_attachmentsExceeded_ name:*v49 object:v8];
          [v67 addObserver:self selector:sel_mergeRelatedOperationsDidEnd_ name:*MEMORY[0x263F5AA80] object:v8];
          [v67 addObserver:self selector:sel_inlineAttachmentDeleted_ name:*MEMORY[0x263F5A9F0] object:v8];
          int v68 = [v8 calculateDocumentController];
          [v67 addObserver:self selector:sel_calculateDocumentControllerDidUpdateHighlights_ name:*v50 object:v68];

          [v67 addObserver:self selector:sel_noteDidChangeCalculatePreviewBehaviorNotification_ name:*v51 object:v8];
          [(ICNoteEditorViewController *)self setInvitation:0];
          id v69 = objc_alloc(MEMORY[0x263F5B3C0]);
          v70 = (void *)MEMORY[0x263EFFA08];
          uint64_t v71 = [v8 managedObjectContext];
          v72 = [v70 setWithObject:v71];
          objc_super v73 = (void *)[v69 initWithManagedObjectContexts:v72 delegate:self];
          [(ICNoteEditorViewController *)self setNoteAndFolderChangeController:v73];

          v74 = [(ICNoteEditorViewController *)self noteAndFolderChangeController];
          [v74 setObjectTypes:9];

          id v75 = objc_alloc(MEMORY[0x263F5B3C0]);
          v76 = (void *)MEMORY[0x263EFFA08];
          uint64_t v77 = [v8 managedObjectContext];
          v78 = [v76 setWithObject:v77];
          BOOL v79 = (void *)[v75 initWithManagedObjectContexts:v78 delegate:self];
          [(ICNoteEditorViewController *)self setInlineAttachmentChangeController:v79];

          v80 = +[ICSystemPaperDocumentController sharedInstance];
          [v80 addPresenter:self];
        }
        if ([(ICNoteEditorBaseViewController *)self viewAppearanceState] >= 2)
        {
          v81 = [(ICNoteEditorViewController *)self previousNote];

          if (v81)
          {
            v82 = [(ICNoteEditorViewController *)self previousNote];
            [(ICNoteEditorBaseViewController *)self noteDidDisappear:v82];
          }
          if (v61 && [(ICNoteEditorBaseViewController *)self viewAppearanceState] == 3) {
            [(ICNoteEditorBaseViewController *)self noteDidAppear:v8];
          }
        }
        [(ICNoteEditorViewController *)self recreateTextViewIfNecessary];
        [(ICNoteEditorViewController *)self showOrHidePasswordEntryViewControllerIfNeeded];
        [(ICNoteEditorViewController *)self updateUnsupportedNoteView];
        uint64_t v83 = [MEMORY[0x263F08A00] defaultCenter];
        v148[0] = *MEMORY[0x263F5AA78];
        BOOL v84 = [(ICNoteEditorViewController *)self previousNote];
        v85 = v84;
        if (!v84)
        {
          v85 = [MEMORY[0x263EFF9D0] null];
        }
        v149[0] = v85;
        v148[1] = *MEMORY[0x263F5AA70];
        v86 = v8;
        if (!v61)
        {
          v86 = [MEMORY[0x263EFF9D0] null];
        }
        v149[1] = v86;
        uint64_t v87 = [NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:2];
        [v83 postNotificationName:*MEMORY[0x263F5AA68] object:self userInfo:v87];

        if (!v61) {
        if (!v84)
        }

        v88 = [(ICNoteEditorViewController *)self previousNote];
        char v89 = [v88 isPasswordProtectedAndLocked];

        if ((v89 & 1) == 0)
        {
          v90 = [(ICNoteEditorViewController *)self previousNote];
          uint64_t v91 = [v90 calculateDocumentController];
          [v91 resetHighlights];
        }
        v92 = [(ICNoteEditorViewController *)self textView];
        [v92 setEditable:0];

        int v93 = [(ICNoteEditorViewController *)self noteUserActivity];
        [v93 setDelegate:0];

        v94 = [(ICNoteEditorViewController *)self noteUserActivity];
        [v94 invalidate];

        [(ICNoteEditorViewController *)self setNoteUserActivity:0];
        [(ICNoteEditorViewController *)self setNoteUserActivityState:0];
        if (v61)
        {
          v95 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
          [v95 requestFire];
        }
        if ([(ICNoteEditorViewController *)self ic_isViewVisible])
        {
          [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
          if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
          {
            [(ICNoteEditorViewController *)self resetTextViewContentOffset];
            v96 = [(ICNoteEditorViewController *)self textViewController];
            [v96 applyInitialScrollState];
          }
        }
        else
        {
          [(ICNoteEditorViewController *)self setShouldResetTextViewContentOffsetWhenAppearing:1];
        }
        if (ICInternalSettingsIsTextKit2Enabled()) {
          [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
        }
        [(ICNoteEditorViewController *)self setEditing:v131 & v61];
        [(ICNoteEditorViewController *)self rememberNoteContentForEditingIntent];
        uint64_t v97 = [(ICNoteEditorBaseViewController *)self note];
        [v97 mergeUnappliedEncryptedRecordRecursivelyInBackground];

        [(ICNoteEditorViewController *)self setDidDrawWithPencilWithoutPalette:0];
        [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:0];
        [(ICNoteEditorViewController *)self setNeedsInitialBarConfiguration:0];
        if ([(ICNoteEditorViewController *)self _appearState] == 2) {
          [(ICNoteEditorViewController *)self resetBarButtonsAnimated:0];
        }
        [(ICNoteEditorViewController *)self updateActionMenu];
        if (v134) {
          v134[2]();
        }
        [(ICNoteEditorViewController *)self updateDataOwnerForCopyAndPaste];
        uint64_t v98 = [(ICNoteEditorViewController *)self textView];
        v99 = [v98 dateView];
        [v99 setNote:v8];

        uint64_t v100 = [(ICNoteEditorViewController *)self textView];
        BOOL v101 = [v100 userTitleView];
        [v101 setNote:v8];

        v102 = [(ICNoteEditorViewController *)self textView];
        [v102 icaxClearCaches];

        UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
        objc_initWeak(&location, self);
        id v103 = MEMORY[0x263EF83A0];
        v140[0] = MEMORY[0x263EF8330];
        v140[1] = 3221225472;
        v140[2] = __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_2;
        v140[3] = &unk_2640B7F90;
        objc_copyWeak(&v141, &location);
        v104 = (void *)MEMORY[0x263EF83A0];
        dispatch_async(MEMORY[0x263EF83A0], v140);

        uint64_t v105 = [(ICNoteEditorViewController *)self inkPaletteController];

        if (v105) {
          [(ICNoteEditorViewController *)self ensureValidInkForNewDrawingOrNote];
        }
        [(ICNoteEditorViewController *)self updateDrawingAttachmentsIfNeeded];
        [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
        [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
        [(ICNoteEditorViewController *)self updateAuthorHighlightsIfNeeded];
        v106 = [v8 modificationDate];
        [(ICNoteEditorViewController *)self setNoteLastModificationDate:v106];

        if ((v61 & [(ICNoteEditorViewController *)self shouldTrackNoteViewEventAnalyticsFromSettingNote]) == 1)
        {
          v107 = [(ICNoteEditorViewController *)self viewIfLoaded];
          int v108 = [v107 window];
          BOOL v109 = v108 == 0;

          if (!v109)
          {
            int v110 = [(ICNoteEditorViewController *)self eventReporter];
            [v110 startNoteViewEventDurationTrackingForModernNote:v8 reportCoreAnalytics:1];
          }
        }
        int v111 = [(ICNoteEditorViewController *)self previousNote];

        if (v111)
        {
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          uint64_t v112 = [(ICNoteEditorViewController *)self previousNote];
          uint64_t v113 = [v112 attachments];

          uint64_t v114 = [v113 countByEnumeratingWithState:&v136 objects:v147 count:16];
          if (v114)
          {
            uint64_t v115 = *(void *)v137;
            do
            {
              for (uint64_t i = 0; i != v114; ++i)
              {
                if (*(void *)v137 != v115) {
                  objc_enumerationMutation(v113);
                }
                v117 = *(void **)(*((void *)&v136 + 1) + 8 * i);
                if (([v117 hasChanges] & 1) == 0)
                {
                  uint64_t v118 = [v117 managedObjectContext];
                  objc_msgSend(v118, "ic_refreshObject:mergeChanges:", v117, 0);
                }
              }
              uint64_t v114 = [v113 countByEnumeratingWithState:&v136 objects:v147 count:16];
            }
            while (v114);
          }

          v119 = [(ICNoteEditorViewController *)self previousNote];
          char v120 = [v119 hasChanges];

          if ((v120 & 1) == 0)
          {
            uint64_t v121 = [(ICNoteEditorViewController *)self previousNote];
            v122 = [v121 managedObjectContext];
            v123 = [(ICNoteEditorViewController *)self previousNote];
            objc_msgSend(v122, "ic_refreshObject:mergeChanges:", v123, 0);
          }
        }
        if ([v8 isPasswordProtected])
        {
          v124 = [MEMORY[0x263F5ACC0] sharedController];
          v125 = [v8 account];
          [v124 reaskPasswordForAccountIfNecessary:v125];
        }
        uint64_t v126 = [v8 isEditable];
        uint64_t v127 = [(ICNoteEditorViewController *)self textView];
        [v127 setDisplayingEditableContent:v126];

        v128 = [(ICNoteEditorViewController *)self bluetoothKeyboardHintViewController];
        [v128 hide];

        if (objc_opt_respondsToSelector()) {
          [(ICNoteEditorViewController *)self updateViewAnnotation];
        }
        objc_destroyWeak(&v141);
        objc_destroyWeak(&location);

        goto LABEL_121;
      }
    }
    else
    {
      uint64_t v60 = [(ICNoteEditorBaseViewController *)self viewAppearanceState];
      if (!v8 || v60 < 2) {
        goto LABEL_64;
      }
    }
    [(ICNoteEditorViewController *)self noteWillAppear:v8];
LABEL_59:
    [(ICNoteEditorViewController *)self resetTextViewUndoManager];
    BOOL v61 = v8 != 0;
    if (v8) {
      BOOL v62 = v135 != 0;
    }
    else {
      BOOL v62 = 0;
    }
    if (v62)
    {
      [(ICNoteEditorViewController *)self donateEditingIntentIfNecessary];
      BOOL v61 = 1;
    }
    goto LABEL_65;
  }
  if ([(ICNoteEditorViewController *)self shouldAllowAttributionSidebar])
  {
    double v31 = [(ICNoteEditorViewController *)self attributionSidebarView];
    [v31 reload];
  }
  [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:0];
  [(ICNoteEditorViewController *)self updateBarButtonsAnimated:[(ICNoteEditorViewController *)self ic_isViewVisible]];
  double v32 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  [v32 setIsAnimatingOut:0];

  [(ICNoteEditorViewController *)self showOrHidePasswordEntryViewControllerIfNeeded];
LABEL_121:
}

- (ICNote)previousNote
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNote);

  return (ICNote *)WeakRetained;
}

- (ICLinkAcceleratorController)linkAcceleratorController
{
  return self->_linkAcceleratorController;
}

- (void)setSuspendBarButtonUpdates:(BOOL)a3
{
  self->_suspendBarButtonUpdates = a3;
}

- (BOOL)shouldTrackNoteViewEventAnalyticsFromSettingNote
{
  return self->_shouldTrackNoteViewEventAnalyticsFromSettingNote;
}

- (NSUserActivity)noteUserActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 1312, 1);
}

- (void)updatePencilKitPaperStyleType
{
  BOOL v3 = (void *)MEMORY[0x263F5B410];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  objc_msgSend(v3, "linedPaperWithPaperStyleType:", (int)objc_msgSend(v4, "paperStyleType"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [(ICNoteEditorViewController *)self viewIfLoaded];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    char v7 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");

    if ((v7 & 1) == 0)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F82D78]);
      [v8 configureWithTransparentBackground];
      char v9 = [(ICNoteEditorViewController *)self dynamicBarColor];
      [v8 setBackgroundColor:v9];

      id v10 = [(ICNoteEditorViewController *)self navigationController];
      id v11 = [v10 toolbar];
      [v11 setScrollEdgeAppearance:v8];

      id v12 = [(ICNoteEditorViewController *)self navigationController];
      char v13 = [v12 toolbar];
      [v13 setCompactScrollEdgeAppearance:v8];
    }
  }
  uint64_t v14 = [(ICNoteEditorViewController *)self textView];
  [v14 setLinedPaper:v15];
}

- (void)updateBarButtonsAnimated:(BOOL)a3
{
}

- (void)setUserWantsToSeeDateLabel:(BOOL)a3
{
  self->_userWantsToSeeDateLabel = a3;
  if (!a3 && [(ICNoteEditorViewController *)self usesCustomTransition])
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    uint64_t v5 = [v4 dateView];
    [v5 setAlpha:0.0];

    id v7 = [(ICNoteEditorViewController *)self textView];
    BOOL v6 = [v7 userTitleView];
    [v6 setAlpha:0.0];
  }
}

- (void)setShouldResetTextViewContentOffsetWhenAppearing:(BOOL)a3
{
  self->_shouldResetTextViewContentOffsetWhenAppearing = a3;
}

- (void)setNeedsInitialBarConfiguration:(BOOL)a3
{
  self->_needsInitialBarConfiguration = a3;
}

- (void)updateBarButtons
{
}

- (void)showOrHidePasswordEntryViewControllerIfNeeded
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  if ([v4 isPasswordProtectedAndLocked] && (objc_msgSend(v3, "isUnsupported") & 1) == 0) {
    int v5 = [v3 hasMissingKeychainItem] ^ 1;
  }
  else {
    int v5 = 0;
  }

  BOOL v6 = [(ICNoteEditorBaseViewController *)self note];
  int v7 = [v6 isPasswordProtected];

  if (!v7)
  {
    uint64_t v17 = [(ICNoteEditorViewController *)self passwordEntryViewController];

    if (v17)
    {
      int v18 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      id v19 = [v18 view];
      [v19 removeFromSuperview];

      BOOL v20 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      [(ICNoteEditorViewController *)self removeChildViewController:v20];

      [(ICNoteEditorViewController *)self setPasswordEntryViewController:0];
      [(ICNoteEditorViewController *)self recreateTextViewIfNecessary];
      double v21 = [(ICNoteEditorViewController *)self textView];
      [v21 setAlpha:1.0];

LABEL_45:
      [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
      [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
      goto LABEL_46;
    }
    id v34 = [(ICNoteEditorViewController *)self textView];
    [v34 setAlpha:1.0];
    goto LABEL_21;
  }
  if (v5)
  {
    [(ICNoteEditorViewController *)self stopTextFindingIfNecessary];
    [(ICNoteEditorViewController *)self blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:2.0];
    id v8 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    int v9 = [v8 isAnimatingOut];

    if (v9)
    {
      id v10 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      id v11 = [v10 view];
      [v11 removeFromSuperview];

      id v12 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      [v12 removeFromParentViewController];

      [(ICNoteEditorViewController *)self setPasswordEntryViewController:0];
    }
    char v13 = [(ICNoteEditorViewController *)self passwordEntryViewController];

    if (v13) {
      goto LABEL_33;
    }
    uint64_t v14 = [(ICNoteEditorViewController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      id v15 = [(ICNoteEditorViewController *)self presentedViewController];
      uint64_t v16 = [v15 performSelector:sel_canAppearAbovePasswordEntryView];

      if (v16)
      {
LABEL_28:
        id v49 = [(ICNoteEditorViewController *)self textView];
        int v50 = [v49 isEditing];

        if (v50)
        {
          id v51 = [(ICNoteEditorViewController *)self textView];
          [v51 endEditing:1];
        }
        if ([(ICNoteEditorViewController *)self isEditing]) {
          [(ICNoteEditorViewController *)self setEditing:0 animated:0];
        }
        unint64_t v52 = (void *)[objc_alloc(MEMORY[0x263F5B418]) initWithNibName:0 bundle:0 note:v3 intent:0];
        [(ICNoteEditorViewController *)self setPasswordEntryViewController:v52];

        v53 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        [v53 setMode:0];

        objc_initWeak(&location, self);
        v89[0] = MEMORY[0x263EF8330];
        v89[1] = 3221225472;
        v89[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke;
        v89[3] = &unk_2640B9498;
        objc_copyWeak(&v90, &location);
        unint64_t v54 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        [v54 setPasswordEntryCompletionHandler:v89];

        BOOL v55 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        char v56 = [v55 view];
        [v56 setAutoresizingMask:18];

        uint64_t v57 = [(ICNoteEditorViewController *)self view];
        [v57 bounds];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        uint64_t v66 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        v67 = [v66 view];
        objc_msgSend(v67, "setFrame:", v59, v61, v63, v65);

        int v68 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        [(ICNoteEditorViewController *)self addChildViewController:v68];

        objc_destroyWeak(&v90);
        objc_destroyWeak(&location);
LABEL_33:
        id v69 = [(ICNoteEditorBaseViewController *)self note];
        v70 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        [v70 setNote:v69];

        uint64_t v71 = [(ICNoteEditorViewController *)self backgroundView];
        v72 = [(ICNoteEditorViewController *)self passwordEntryViewController];
        objc_super v73 = [v72 view];
        [v71 addSubviewAboveAllViews:v73];

        v74 = [(ICNoteEditorViewController *)self traitCollection];
        if (objc_msgSend(v74, "ic_hasCompactWidth"))
        {
          uint64_t v75 = 1;
        }
        else
        {
          v76 = [(ICNoteEditorViewController *)self viewControllerManager];
          if ([v76 isAuxiliary])
          {
            uint64_t v75 = 1;
          }
          else if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
          {
            uint64_t v77 = [(ICNoteEditorViewController *)self viewControllerManager];
            uint64_t v75 = [v77 isMainSplitViewDisplayModeSecondaryOnly];
          }
          else
          {
            uint64_t v75 = 0;
          }
        }
        v78 = [(ICNoteEditorViewController *)self viewControllerManager];
        BOOL v79 = [v78 noteContainerViewMode] == 0;

        v80 = [(ICNoteEditorViewController *)self viewControllerManager];
        if ([v80 noteContainerViewMode] == 1) {
          uint64_t v81 = 1;
        }
        else {
          uint64_t v81 = v75;
        }

        [(ICNoteEditorViewController *)self updateContentViewBezelsStandalone:v75 needsAdditionalBottomMargin:v79 needsAdditionalLeadingMargin:v81 force:1];
        v82 = [(ICNoteEditorViewController *)self view];
        [v82 layoutIfNeeded];

        [(ICNoteEditorViewController *)self recreateTextView];
        uint64_t v83 = [(ICNoteEditorViewController *)self textView];
        [v83 setHidden:1];

        [(ICNoteEditorViewController *)self hideInkPicker];
        [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
        goto LABEL_45;
      }
    }
    else
    {
    }
    [(ICNoteEditorViewController *)self hideAndDismissPresentedViewController];
    goto LABEL_28;
  }
  uint64_t v22 = [(ICNoteEditorViewController *)self passwordEntryViewController];

  if (v22)
  {
    uint64_t v23 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    BOOL v24 = [v23 note];
    uint64_t v25 = [(ICNoteEditorBaseViewController *)self note];

    if (v24 != v25)
    {
      [(ICNoteEditorViewController *)self recreateTextView];
      double v26 = [(ICNoteEditorViewController *)self textView];
      [v26 layoutIfNeeded];

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        int v27 = [(ICNoteEditorViewController *)self textView];
        uint64_t v28 = [v27 layoutManager];
        double v29 = [(ICNoteEditorViewController *)self textView];
        int v30 = [v29 textContainer];
        [v28 ensureLayoutForTextContainer:v30];
      }
      [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
      [(ICNoteEditorViewController *)self resetTextViewContentOffset];
      [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
      [(ICNoteEditorViewController *)self updateBarButtonsAnimated:[(ICNoteEditorViewController *)self ic_isViewVisible]];
      double v31 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      double v32 = [v31 view];
      [v32 removeFromSuperview];

      int v33 = [(ICNoteEditorViewController *)self passwordEntryViewController];
      [v33 removeFromParentViewController];

      [(ICNoteEditorViewController *)self setPasswordEntryViewController:0];
      [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
      goto LABEL_46;
    }
    int v35 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    char v36 = [v35 isAnimatingOut];

    if (v36) {
      goto LABEL_46;
    }
    unint64_t v37 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    [v37 setIsAnimatingOut:1];

    [(ICNoteEditorViewController *)self recreateTextView];
    BOOL v38 = [(ICNoteEditorViewController *)self textView];
    [v38 layoutIfNeeded];

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      unint64_t v39 = [(ICNoteEditorViewController *)self textView];
      int v40 = [v39 layoutManager];
      BOOL v41 = [(ICNoteEditorViewController *)self textView];
      id v42 = [v41 textContainer];
      [v40 ensureLayoutForTextContainer:v42];
    }
    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
    double v43 = *MEMORY[0x263F00148];
    double v44 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v45 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v45, "setContentOffset:", v43, v44);

    [(ICNoteEditorViewController *)self resetTextViewContentOffset];
    [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:[(ICNoteEditorViewController *)self ic_isViewVisible]];
    id v46 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    id v47 = [(ICNoteEditorViewController *)self textView];
    [v47 setAlpha:0.0];

    id v48 = (void *)MEMORY[0x263F82E00];
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_2;
    v87[3] = &unk_2640B8140;
    id v88 = v46;
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_3;
    v84[3] = &unk_2640B94C0;
    v84[4] = self;
    id v85 = v88;
    id v86 = v3;
    id v34 = v88;
    [v48 animateWithDuration:v87 animations:v84 completion:0.25];

LABEL_21:
  }
LABEL_46:
}

- (void)setPaperTextAttachmentManager:(id)a3
{
}

- (void)setMentionsController:(id)a3
{
}

- (void)setLinkAcceleratorController:(id)a3
{
}

- (void)setHashtagController:(id)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    int v7 = [(ICNoteEditorViewController *)self textView];
    if ([v7 canBecomeFirstResponder])
    {
    }
    else
    {
      BOOL v8 = [(ICNoteEditorViewController *)self isSettingEditing];

      if (!v8) {
        return;
      }
    }
  }
  if ([(ICNoteEditorViewController *)self isEditing] != v5)
  {
    [(ICNoteEditorViewController *)self setIsSettingEditing:1];
    if (v5)
    {
      int v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 postNotificationName:@"ICViewControllerWillStartEditModeNotification" object:self];

      id v10 = [(ICNoteEditorViewController *)self textView];
      if (![v10 isFirstResponder])
      {
        id v11 = [(ICNoteEditorViewController *)self auxiliaryResponder];
        char v12 = [v11 isFirstResponder];

        if ((v12 & 1) == 0) {
          [(ICNoteEditorViewController *)self startEditing];
        }
        goto LABEL_15;
      }
    }
    else
    {
      char v13 = [(ICNoteEditorViewController *)self auxiliaryResponder];
      int v14 = [v13 isFirstResponder];

      if (v14)
      {
        id v15 = [(ICNoteEditorViewController *)self auxiliaryResponder];
        [v15 resignFirstResponder];
      }
      uint64_t v16 = [(ICNoteEditorViewController *)self textView];
      int v17 = [v16 isFirstResponder];

      if (!v17) {
        goto LABEL_15;
      }
      id v10 = [(ICNoteEditorViewController *)self textView];
      [v10 resignFirstResponder];
    }

LABEL_15:
    [(ICNoteEditorViewController *)self showStyleSelectorInputView:0 animated:1 doneEditing:1];
    v20.receiver = self;
    v20.super_class = (Class)ICNoteEditorViewController;
    [(ICNoteEditorViewController *)&v20 setEditing:v5 animated:v4];
    [(ICNoteEditorViewController *)self setIsSettingEditing:0];
    [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
    int v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 postNotificationName:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:self];

    id v19 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    [v19 setEditing:v5];
  }
}

- (void)setCollaborationButtonsController:(id)a3
{
}

- (void)setCalculateRecognitionController:(id)a3
{
}

- (void)setAuthorHighlightsUpdater:(id)a3
{
}

- (void)recreateTextViewIfNecessary
{
  if ([(ICNoteEditorViewController *)self isViewLoaded])
  {
    BOOL v3 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    if (v3)
    {
    }
    else
    {
      BOOL v4 = [(ICNoteEditorBaseViewController *)self note];
      char v5 = [v4 isPasswordProtectedAndLocked];

      if ((v5 & 1) == 0)
      {
        [(ICNoteEditorViewController *)self recreateTextView];
      }
    }
  }
}

- (ICManagedObjectContextChangeController)noteAndFolderChangeController
{
  return self->_noteAndFolderChangeController;
}

void __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained note];
  [v1 setHandwritingRecognitionEnabled:1];

  uint64_t v2 = [WeakRetained note];
  if (v2)
  {
    BOOL v3 = (void *)v2;
    BOOL v4 = [WeakRetained note];
    char v5 = [WeakRetained previousNote];

    if (v4 != v5)
    {
      BOOL v6 = [WeakRetained previousNote];
      [v6 setHandwritingRecognitionEnabled:0];
    }
  }
  int v7 = [WeakRetained handwritingDebugPresenter];
  [v7 refresh];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)double v26 = "-[ICNoteEditorViewController viewWillAppear:]";
    *(_WORD *)&v26[8] = 1024;
    v27[0] = 1358;
    _os_log_impl(&dword_20BE60000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v24.receiver = self;
  v24.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorBaseViewController *)&v24 viewWillAppear:v3];
  [(ICNoteEditorViewController *)self setNeedsInitialBarConfiguration:1];
  BOOL v6 = [(ICNoteEditorViewController *)self view];
  [v6 setNeedsLayout];

  [(ICNoteEditorViewController *)self updatePencilKitPaperStyleType];
  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_audioPlaybackPlayNotification_ name:*MEMORY[0x263F5B018] object:0];
  [v7 addObserver:self selector:sel_notesContextRefreshNotification_ name:*MEMORY[0x263F5AAC0] object:0];
  [v7 addObserver:self selector:sel_viewControllerWillStartEditModeNotification_ name:@"ICViewControllerWillStartEditModeNotification" object:0];
  [v7 addObserver:self selector:sel_migrationStateDidChange_ name:*MEMORY[0x263F5AE30] object:0];
  [v7 addObserver:self selector:sel_keyboardDidShow_ name:*MEMORY[0x263F837A8] object:0];
  [v7 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
  [v7 addObserver:self selector:sel_keyboardDidHide_ name:*MEMORY[0x263F837A0] object:0];
  [v7 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x263F83798] object:0];
  [v7 addObserver:self selector:sel_noteWillBeDeleted_ name:*MEMORY[0x263F5AAA8] object:0];
  [v7 addObserver:self selector:sel_noteWillBeDeleted_ name:*MEMORY[0x263F5AAA0] object:0];
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0) {
    [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
  }
  BOOL v8 = [(ICNoteEditorViewController *)self transitionCoordinator];

  if (v8)
  {
    int v9 = [(ICNoteEditorViewController *)self transitionCoordinator];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__ICNoteEditorViewController_viewWillAppear___block_invoke;
    v23[3] = &unk_2640B8050;
    v23[4] = self;
    [v9 animateAlongsideTransition:v23 completion:0];
  }
  else
  {
    [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
  }
  if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
  {
    [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:1];
  }
  else
  {
    id v10 = [(ICNoteEditorBaseViewController *)self note];
    -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", [v10 isSharedAndEmpty]);
  }
  id v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = [(ICNoteEditorViewController *)self userWantsToSeeDateLabel];
    char v13 = [(ICNoteEditorBaseViewController *)self note];
    int v14 = [v13 isSharedAndEmpty];
    id v15 = [(ICNoteEditorViewController *)self textView];
    uint64_t v16 = [v15 window];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)double v26 = v12;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v14;
    LOWORD(v27[0]) = 1024;
    *(_DWORD *)((char *)v27 + 2) = v16 != 0;
    _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_INFO, "wants to see date label: %d shared and empty: %d, has window: %d", buf, 0x14u);
  }
  if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
  {
    int v17 = [(ICNoteEditorViewController *)self textView];
    int v18 = [v17 window];

    if (v18) {
      [(ICNoteEditorViewController *)self updateTextViewContentOffset];
    }
  }
  id v19 = [(ICNoteEditorBaseViewController *)self note];
  int v20 = [v19 needsRefresh];

  if (v20) {
    [(ICNoteEditorViewController *)self fetchAll];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self link_addCreateNoteInteraction];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self link_addSetParagraphStyleInteraction];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self link_addInsertNoteLinkInteraction];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self link_addReplaceSelectionInteraction];
  }
  double v21 = [(ICNoteEditorBaseViewController *)self note];

  if (v21)
  {
    uint64_t v22 = [(ICNoteEditorBaseViewController *)self note];
    [(ICNoteEditorViewController *)self noteWillAppear:v22];
  }
}

- (void)viewDidLoad
{
  v45[4] = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v44 viewDidLoad];
  uint64_t BundleBoolSettingValue = ICInternalSettingsGetBundleBoolSettingValue();
  BOOL v4 = [(ICNoteEditorViewController *)self backgroundView];
  [v4 setHasBarBlur:BundleBoolSettingValue];

  if ([(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
  {
    id v5 = objc_alloc(MEMORY[0x263F82C08]);
    BOOL v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v7 = [(ICNoteEditorViewController *)self view];
    BOOL v8 = [v7 window];
    int v9 = [v8 windowScene];
    id v10 = [v9 statusBarManager];
    objc_msgSend(v6, "requestStyle:", objc_msgSend(v10, "statusBarStyle"));

    id v11 = [(ICNoteEditorViewController *)self view];
    [v11 addSubview:v6];

    unint64_t v37 = (void *)MEMORY[0x263F08938];
    id v42 = [v6 leftAnchor];
    double v43 = [(ICNoteEditorViewController *)self view];
    BOOL v41 = [v43 leftAnchor];
    int v40 = [v42 constraintEqualToAnchor:v41];
    v45[0] = v40;
    BOOL v38 = [v6 rightAnchor];
    unint64_t v39 = [(ICNoteEditorViewController *)self view];
    char v36 = [v39 rightAnchor];
    BOOL v12 = [v38 constraintEqualToAnchor:v36];
    v45[1] = v12;
    char v13 = [v6 topAnchor];
    int v14 = [(ICNoteEditorViewController *)self view];
    id v15 = [v14 topAnchor];
    uint64_t v16 = [v13 constraintEqualToAnchor:v15];
    v45[2] = v16;
    int v17 = [v6 heightAnchor];
    int v18 = [v17 constraintEqualToConstant:*MEMORY[0x263F839A8]];
    v45[3] = v18;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
    [v37 activateConstraints:v19];
  }
  int v20 = [(ICNoteEditorViewController *)self navigationItem];
  [v20 setLargeTitleDisplayMode:2];

  double v21 = [(ICNoteEditorViewController *)self backgroundView];
  uint64_t v22 = [(ICNoteEditorViewController *)self ic_safeAreaLayoutGuide];
  uint64_t v23 = [(ICNoteEditorViewController *)self backgroundView];
  [v21 addConstraintsForSafeAreaLayoutGuide:v22 toContainer:v23];

  objc_super v24 = [[ICNoteEditorNavigationItemConfiguration alloc] initWithDataSource:self delegate:self];
  [(ICNoteEditorViewController *)self setNavigationItemConfiguration:v24];

  uint64_t v25 = objc_alloc_init(ICStyleSelectorViewController);
  [(ICNoteEditorViewController *)self setStyleSelectorController:v25];

  double v26 = [(ICNoteEditorViewController *)self styleSelectorController];
  [v26 setDelegate:self];

  if (UIAccessibilityIsVoiceOverRunning()) {
    [(ICNoteEditorViewController *)self applyAccessibilityInfo];
  }
  int v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:self selector:sel_localeChanged_ name:*MEMORY[0x263EFF458] object:0];
  [v27 addObserver:self selector:sel_sceneWillDeactivate_ name:*MEMORY[0x263F83950] object:0];
  [v27 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  [v27 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];
  [v27 addObserver:self selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x263F83428] object:0];
  [v27 addObserver:self selector:sel_attachmentBrickDidChangeSize name:*MEMORY[0x263F5A938] object:0];
  uint64_t v28 = *MEMORY[0x263F5AE10];
  double v29 = objc_msgSend(MEMORY[0x263EFD850], "ic_mentionableNamesCache");
  [v27 addObserver:self selector:sel_updateParticipantsInDrawings name:v28 object:v29];

  [v27 addObserver:self selector:sel_splitViewModeChangeWillBegin_ name:@"ICSplitViewControllerWillBeginDisplayModeChange" object:0];
  [v27 addObserver:self selector:sel_navigationControllerWillChange_ name:@"ICNavigationControllerWillChange" object:0];
  [v27 addObserver:self selector:sel_splitViewModeChangeDidEnd_ name:@"ICSplitViewControllerDidEndDisplayModeChange" object:0];
  [v27 addObserver:self selector:sel_paperKitBundleDidMerge_ name:*MEMORY[0x263F5A950] object:0];
  [v27 addObserver:self selector:sel_observeAttachmentDeleted_ name:*MEMORY[0x263F5A928] object:0];
  [v27 addObserver:self selector:sel_observeDrawingConverted_ name:*MEMORY[0x263F5B088] object:0];
  [v27 addObserver:self selector:sel_noteAnalyticsAddAttachment_ name:*MEMORY[0x263F5AA10] object:0];
  [v27 addObserver:self selector:sel_audioFindInTranscript_ name:*MEMORY[0x263F5B100] object:0];
  [v27 addObserver:self selector:sel_audioRecordingStarted_ name:*MEMORY[0x263F5AA20] object:0];
  [v27 addObserver:self selector:sel_audioRecordingStopped_ name:*MEMORY[0x263F5AA28] object:0];
  [v27 addObserver:self selector:sel_audioTranscriptInteraction_ name:*MEMORY[0x263F5B0D0] object:0];
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self collaborationButtons_registerForSharedWithYouHighlightUpdates];
  }
  [(ICNoteEditorViewController *)self setShouldResetTextViewContentOffsetWhenAppearing:1];
  objc_msgSend(MEMORY[0x263F82A20], "ic_addObserver:forKeyPath:context:", self, @"prefersPencilOnlyDrawing", &compoundliteral_0);
  int v30 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_msgSend(v30, "ic_addObserver:forKeyPath:context:", self, *MEMORY[0x263F5AFF0], &compoundliteral_2982);

  [v27 addObserver:self selector:sel_willAddAttachmentForNoteNotification_ name:*MEMORY[0x263F5AB50] object:0];
  [v27 addObserver:self selector:sel_didAddAttachmentForNoteNotification_ name:*MEMORY[0x263F5A9E8] object:0];
  uint64_t v31 = *MEMORY[0x263F5A9C8];
  double v32 = [MEMORY[0x263F5ABC0] sharedState];
  [v27 addObserver:self selector:sel_noteDecryptedStatusDidChange_ name:v31 object:v32];

  uint64_t v33 = *MEMORY[0x263F5A9D0];
  id v34 = [MEMORY[0x263F5ABC0] sharedState];
  [v27 addObserver:self selector:sel_noteDecryptedStatusDidChange_ name:v33 object:v34];

  [v27 addObserver:self selector:sel_noteDecryptedStatusDidChange_ name:*MEMORY[0x263F5A918] object:0];
  [v27 addObserver:self selector:sel_noteDidDeauthenticateAfterMerge_ name:*MEMORY[0x263F5AA60] object:0];
  [v27 addObserver:self selector:sel_sceneDidActivate_ name:*MEMORY[0x263F83928] object:0];
  [v27 addObserver:self selector:sel_passwordEntryAlertControllerAttemptDidFail_ name:*MEMORY[0x263F5B140] object:0];
  [v27 addObserver:self selector:sel_authenticationAuthenticateBiometricsAttemptDidFail_ name:*MEMORY[0x263F5B030] object:0];
  [v27 addObserver:self selector:sel_lockNoteManagerWillToggleLock_ name:*MEMORY[0x263F5B130] object:0];
  [v27 addObserver:self selector:sel_lockNoteManagerDidToggleLock_ name:*MEMORY[0x263F5B128] object:0];
  [(ICScrollViewDelegateViewController *)self setupScrollViewKeyboardResizer];
  if (ICInternalSettingsIsAudioTranscriptionEnabled())
  {
    int v35 = [[ICAudioAttachmentEditorCoordinator alloc] initWithNoteEditorViewController:self];
    [(ICNoteEditorViewController *)self setAudioAttachmentEditorCoordinator:v35];
  }
  if (!ICInternalSettingsIsTextKit2Enabled()
    || [(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPhone])
  {
    [(ICNoteEditorViewController *)self recreateTextViewIfNecessary];
  }
}

- (ICStyleSelectorViewController)styleSelectorController
{
  return self->_styleSelectorController;
}

- (void)updateUnsupportedNoteView
{
  v36[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICNoteEditorViewController *)self unsupportedNoteView];
  [v3 removeFromSuperview];

  [(ICNoteEditorViewController *)self setUnsupportedNoteView:0];
  BOOL v4 = [(ICNoteEditorBaseViewController *)self note];
  int v5 = [v4 isUnsupported];

  if (v5)
  {
    BOOL v6 = [[ICUnsupportedNoteView alloc] initWithReason:0];
    [(ICNoteEditorViewController *)self setUnsupportedNoteView:v6];

    int v7 = [(ICNoteEditorViewController *)self unsupportedNoteView];
    [v7 setUserInteractionEnabled:0];
  }
  BOOL v8 = [(ICNoteEditorBaseViewController *)self note];
  if ([v8 canAuthenticate])
  {
  }
  else
  {
    int v9 = [(ICNoteEditorBaseViewController *)self note];
    int v10 = [v9 hasMissingKeychainItem];

    if (v10)
    {
      id v11 = [(ICNoteEditorBaseViewController *)self note];
      objc_initWeak(&location, v11);

      BOOL v12 = [[ICUnsupportedNoteView alloc] initWithReason:1];
      [(ICNoteEditorViewController *)self setUnsupportedNoteView:v12];

      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __55__ICNoteEditorViewController_updateUnsupportedNoteView__block_invoke;
      v33[3] = &unk_2640B7F90;
      objc_copyWeak(&v34, &location);
      char v13 = [(ICNoteEditorViewController *)self unsupportedNoteView];
      [v13 setDidTapActionButton:v33];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
  int v14 = [(ICNoteEditorViewController *)self unsupportedNoteView];

  if (v14)
  {
    id v15 = [(ICNoteEditorViewController *)self textView];
    [v15 setHidden:1];

    uint64_t v16 = [(ICNoteEditorViewController *)self view];
    int v17 = [(ICNoteEditorViewController *)self unsupportedNoteView];
    [v16 addSubview:v17];

    uint64_t v28 = (void *)MEMORY[0x263F08938];
    double v32 = [(ICNoteEditorViewController *)self unsupportedNoteView];
    int v30 = [v32 centerXAnchor];
    uint64_t v31 = [(ICNoteEditorViewController *)self view];
    double v29 = [v31 centerXAnchor];
    int v18 = [v30 constraintEqualToAnchor:v29];
    v36[0] = v18;
    id v19 = [(ICNoteEditorViewController *)self unsupportedNoteView];
    int v20 = [v19 centerYAnchor];
    double v21 = [(ICNoteEditorViewController *)self view];
    uint64_t v22 = [v21 centerYAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22];
    v36[1] = v23;
    objc_super v24 = [(ICNoteEditorViewController *)self unsupportedNoteView];
    uint64_t v25 = [v24 widthAnchor];
    double v26 = [v25 constraintLessThanOrEqualToConstant:310.0];
    v36[2] = v26;
    int v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
    [v28 activateConstraints:v27];
  }
}

- (ICSelectorDelayer)updateNoteUserActivityStateDelayer
{
  updateNoteUserActivityStateDelayer = self->_updateNoteUserActivityStateDelayer;
  if (!updateNoteUserActivityStateDelayer)
  {
    BOOL v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_updateNoteUserActivityState delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
    int v5 = self->_updateNoteUserActivityStateDelayer;
    self->_updateNoteUserActivityStateDelayer = v4;

    updateNoteUserActivityStateDelayer = self->_updateNoteUserActivityStateDelayer;
  }

  return updateNoteUserActivityStateDelayer;
}

- (void)updateDrawingAttachmentsIfNeeded
{
  id v4 = [MEMORY[0x263F5B310] sharedConverter];
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  [v4 convertDrawingsInNoteIfNeeded:v3];
}

- (void)updateDataOwnerForCopyAndPaste
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v3 account];
  if ([v4 isManaged]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  BOOL v6 = [(ICNoteEditorViewController *)self textView];
  [v6 _setDataOwnerForCopy:v5];

  int v7 = [(ICNoteEditorViewController *)self textView];
  [v7 _setDataOwnerForPaste:v5];

  BOOL v8 = [(ICNoteEditorViewController *)self textView];
  [v8 _setDragDataOwner:v5];

  id v9 = [(ICNoteEditorViewController *)self textView];
  [v9 _setDropDataOwner:v5];
}

- (void)updateAuthorHighlightsIfNeeded
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  id v8 = [v3 textStorageWithoutCreating];

  if (v8)
  {
    id v4 = [(ICNoteEditorViewController *)self textController];
    uint64_t v5 = [v4 authorHighlightsController];
    uint64_t v6 = objc_msgSend(v8, "ic_range");
    objc_msgSend(v5, "performHighlightUpdatesForRange:inTextStorage:updates:", v6, v7, v8, 0);
  }
}

- (void)updateActionMenu
{
  if ([(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]) {
    return;
  }
  BOOL v3 = [(ICNoteEditorViewController *)self navigationItem];

  if (!v3) {
    return;
  }
  id v4 = [(ICNoteEditorViewController *)self invitationViewController];
  if (v4)
  {
  }
  else
  {
    BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
    char v5 = [v3 isDeletedOrInTrash];

    if ((v5 & 1) == 0)
    {
      BOOL v3 = [(ICNoteEditorViewController *)self viewControllerManager];
      uint64_t v7 = [v3 createDeferredActionMenuElementForEditorViewController:self];
      int v6 = 1;
      goto LABEL_8;
    }
  }
  int v6 = 0;
  uint64_t v7 = 0;
LABEL_8:
  id v8 = [(ICNoteEditorViewController *)self navigationItem];
  [v8 setAdditionalOverflowItems:v7];

  if (v6)
  {
  }
  id v10 = [(ICNoteEditorViewController *)self navigationItem];
  id v9 = [v10 navigationBar];
  [v9 layoutSubviews];
}

- (UITapGestureRecognizer)unsupportedNoteTapGestureRecognizer
{
  return self->_unsupportedNoteTapGestureRecognizer;
}

- (ICTextViewController)textViewController
{
  return self->_textViewController;
}

- (void)tearDownAudioPlayers
{
  BOOL v3 = [(ICNoteEditorViewController *)self audioBarViewController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self audioBarViewController];
    [v4 done:self];
  }
  id v5 = [(ICNoteEditorViewController *)self audioAttachmentEditorCoordinator];
  [v5 teardown];
}

- (void)submitNoteEditEventIfNecessary
{
  id v12 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v3 = [v12 modificationDate];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(ICNoteEditorBaseViewController *)self note];
    int v6 = [v5 modificationDate];
    uint64_t v7 = [(ICNoteEditorViewController *)self noteLastModificationDate];
    char v8 = [v6 isEqualToDate:v7];

    if (v8) {
      return;
    }
    id v9 = [(ICNoteEditorViewController *)self eventReporter];
    id v10 = [(ICNoteEditorBaseViewController *)self note];
    objc_msgSend(v9, "submitNoteEditEventForModernNote:fromQuickNote:", v10, -[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"));

    id v12 = [(ICNoteEditorBaseViewController *)self note];
    id v11 = [v12 modificationDate];
    [(ICNoteEditorViewController *)self setNoteLastModificationDate:v11];
  }
}

- (void)stopTextFindingIfNecessary
{
  uint64_t v3 = [(ICNoteEditorViewController *)self textView];
  id v4 = [v3 findInteraction];
  int v5 = [v4 isFindNavigatorVisible];

  if (v5)
  {
    int v6 = [(ICNoteEditorViewController *)self textView];
    uint64_t v7 = [v6 findInteraction];
    [v7 dismissFindNavigator];

    [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
  }
}

- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)showOrHideActivityStreamToolbarIfNeeded
{
  uint64_t v3 = [(ICNoteEditorViewController *)self activityStreamToolbar];

  if (v3)
  {
    id v6 = [(ICNoteEditorViewController *)self navigationController];
    id v4 = [v6 view];
    int v5 = [(ICNoteEditorViewController *)self activityStreamToolbar];
    [v4 bringSubviewToFront:v5];
  }
}

- (void)setUnsupportedNoteView:(id)a3
{
}

- (void)setStyleSelectorController:(id)a3
{
}

- (void)setPreviousNote:(id)a3
{
}

- (void)setNoteUserActivityState:(id)a3
{
}

- (void)setNoteUserActivity:(id)a3
{
}

- (void)setNoteLastModificationDate:(id)a3
{
}

- (void)setNoteAndFolderChangeController:(id)a3
{
}

- (void)setNote:(uint64_t)a1 delayedForLaunch:(void *)a2 successHandler:.cold.1(uint64_t a1, void *a2)
{
  id v2 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v3, v4, "Setting note on editor %p: %@", v5, v6, v7, v8, v9);
}

- (void)setNavigationItemConfiguration:(id)a3
{
}

- (void)setLastSelectedRange:(_NSRange)a3
{
  self->_lastSelectedRange = a3;
}

- (void)setInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self invitation];

  if (v5 != v4)
  {
    uint64_t v6 = [v4 shareURL];

    if (!v6)
    {
      uint64_t v7 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "The invitation was likely dismissed/deleted causing the shareURL to be empty. This is an invalid state, and the invitation will be removed from the editor.", (uint8_t *)buf, 2u);
      }

      id v4 = 0;
    }
    objc_storeStrong((id *)&self->_invitation, v4);
    if (v4)
    {
      [(ICNoteEditorViewController *)self setNote:0];
      uint64_t v8 = [(ICNoteEditorViewController *)self textView];
      [v8 setHidden:1];

      uint8_t v9 = [(ICNoteEditorViewController *)self invitationViewController];

      if (!v9)
      {
        id v10 = objc_alloc_init(ICInvitationViewController);
        [(ICNoteEditorViewController *)self setInvitationViewController:v10];

        id v11 = [(ICNoteEditorViewController *)self invitationViewController];
        id v12 = [v11 view];
        [v12 setAutoresizingMask:18];

        char v13 = [(ICNoteEditorViewController *)self view];
        [v13 bounds];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        uint64_t v22 = [(ICNoteEditorViewController *)self invitationViewController];
        uint64_t v23 = [v22 view];
        objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

        objc_super v24 = [(ICNoteEditorViewController *)self invitationViewController];
        [(ICNoteEditorViewController *)self addChildViewController:v24];

        uint64_t v25 = [(ICNoteEditorViewController *)self backgroundView];
        double v26 = [(ICNoteEditorViewController *)self invitationViewController];
        int v27 = [v26 view];
        [v25 addSubviewAboveAllViews:v27];
      }
      objc_initWeak(buf, self);
      uint64_t v28 = [(ICNoteEditorViewController *)self invitationViewController];
      [v28 setInvitation:v4];

      double v29 = [v4 highlight];
      int v30 = [(ICNoteEditorViewController *)self invitationViewController];
      [v30 setHighlight:v29];

      uint64_t v31 = [(ICNoteEditorViewController *)self invitationViewController];
      [v31 setShowsActivityIndicator:0];

      uint64_t v36 = MEMORY[0x263EF8330];
      objc_copyWeak(&v38, buf);
      id v37 = v4;
      double v32 = [(ICNoteEditorViewController *)self invitationViewController];
      [v32 setDidTapViewButton:&v36];

      objc_destroyWeak(&v38);
      objc_destroyWeak(buf);
    }
    else
    {
      uint64_t v33 = [(ICNoteEditorViewController *)self invitationViewController];
      id v34 = [v33 view];
      [v34 removeFromSuperview];

      int v35 = [(ICNoteEditorViewController *)self invitationViewController];
      [(ICNoteEditorViewController *)self removeChildViewController:v35];

      [(ICNoteEditorViewController *)self setInvitationViewController:0];
      [(ICNoteEditorViewController *)self recreateTextViewIfNecessary];
    }
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
    [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
    [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
    [(ICNoteEditorViewController *)self updateActionMenu];
  }
}

- (void)setInlineAttachmentChangeController:(id)a3
{
}

- (void)setHasMadeEdits:(BOOL)a3
{
  self->_hasMadeEdits = a3;
}

- (void)setDidDrawWithPencilWithoutPalette:(BOOL)a3
{
  self->_didDrawWithPencilWithoutPalette = a3;
}

- (void)setCollaborationBarButtonItem:(id)a3
{
}

- (void)setAudioAttachmentEditorCoordinator:(id)a3
{
}

- (void)noteWillAppear:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorBaseViewController *)&v5 noteWillAppear:v4];
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self performSelector:sel_updateFastSyncParticipantCursorsForNote_ withObject:v4];
  }
}

- (ICHandwritingDebugPresenter)handwritingDebugPresenter
{
  return self->_handwritingDebugPresenter;
}

- (ICBluetoothKeyboardHintViewController)bluetoothKeyboardHintViewController
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    bluetoothKeyboardHintViewController = self->_bluetoothKeyboardHintViewController;
    if (!bluetoothKeyboardHintViewController)
    {
      id v4 = [[ICBluetoothKeyboardHintViewController alloc] initWithRootViewController:self];
      objc_super v5 = self->_bluetoothKeyboardHintViewController;
      self->_bluetoothKeyboardHintViewController = v4;

      bluetoothKeyboardHintViewController = self->_bluetoothKeyboardHintViewController;
    }
    uint64_t v6 = bluetoothKeyboardHintViewController;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (ICActivityStreamDockView)activityStreamToolbar
{
  return self->_activityStreamToolbar;
}

- (void)resetTextViewUndoManager
{
  uint64_t v3 = [(ICNoteEditorViewController *)self textView];
  [v3 resetUndoManager];

  [(ICNoteEditorViewController *)self updateBarButtons];
}

- (void)applicationDidBecomeActive:(id)a3
{
  if ([(ICNoteEditorViewController *)self isEditing])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__ICNoteEditorViewController_applicationDidBecomeActive___block_invoke;
    v5[3] = &unk_2640B8140;
    v5[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v5 animations:0.25];
  }
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
    id v4 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    [v4 setIsAnimatingOut:0];

    [(ICNoteEditorViewController *)self showOrHidePasswordEntryViewControllerIfNeeded];
    if (objc_opt_respondsToSelector()) {
      [(ICNoteEditorViewController *)self ppt_didFinishExtendedLaunch];
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v9 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    [(ICNoteEditorViewController *)self updateForceLightContentIfNecessary];
    uint64_t v6 = [(ICNoteEditorViewController *)self viewControllerManager];
    uint64_t v7 = [v6 isAuxiliary];
    uint64_t v8 = [(ICNoteEditorViewController *)self navigationItem];
    [v8 setHidesBackButton:v7];

    if (ICInternalSettingsIsTextKit2Enabled()) {
      [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
    }
  }
}

- (void)updateFormatToolbarLayoutWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(ICNoteEditorViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (!v7)
  {
    id v8 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
    objc_msgSend(v8, "updateLayoutWithSize:", width, height);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorBaseViewController *)&v53 viewDidAppear:a3];
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self collaboration_setupActivityItemsConfigurationProvider];
  }
  else {
    [(ICNoteEditorViewController *)self setActivityItemsConfigurationProvider:0];
  }
  id v4 = [(ICNoteEditorViewController *)self activityItemsConfigurationProvider];
  objc_super v5 = [(ICNoteEditorViewController *)self view];
  uint64_t v6 = [v5 window];
  uint64_t v7 = [v6 windowScene];
  [v7 setActivityItemsConfigurationSource:v4];

  [(ICNoteEditorViewController *)self setShouldTrackNoteViewEventAnalyticsFromSettingNote:1];
  id v8 = [(ICNoteEditorViewController *)self eventReporter];
  if (v8)
  {
    BOOL v9 = [(ICNoteEditorViewController *)self shouldFireNoteViewEventOnViewDisappear];

    if (!v9)
    {
      id v10 = [(ICNoteEditorViewController *)self eventReporter];
      id v11 = [(ICNoteEditorBaseViewController *)self note];
      [v10 startNoteViewEventDurationTrackingForModernNote:v11 reportCoreAnalytics:1];

      [(ICNoteEditorViewController *)self setShouldFireNoteViewEventOnViewDisappear:1];
    }
  }
  if ([(ICNoteEditorViewController *)self updateContentSizeCategoryWhenVisible])
  {
    [(ICNoteEditorViewController *)self setUpdateContentSizeCategoryWhenVisible:0];
    [(ICNoteEditorViewController *)self contentSizeCategoryDidChange];
  }
  id v12 = self;
  char v13 = [(ICNoteEditorViewController *)v12 view];
  [v13 frame];
  -[ICNoteEditorViewController updateFormatToolbarLayoutWithSize:](v12, "updateFormatToolbarLayoutWithSize:", v14, v15);

  double v16 = [(ICNoteEditorViewController *)v12 textViewInputAccessoryView];
  double v17 = [(ICNoteEditorViewController *)v12 view];
  [v17 frame];
  objc_msgSend(v16, "updateLayoutWithSize:", v18, v19);

  [(ICNoteEditorViewController *)v12 setShouldResetTextViewContentOffsetWhenAppearing:0];
  if ([(ICNoteEditorViewController *)v12 startEditingAfterViewAppears])
  {
    [(ICNoteEditorViewController *)v12 startEditing];
    [(ICNoteEditorViewController *)v12 setStartEditingAfterViewAppears:0];
  }
  if ([(ICNoteEditorViewController *)v12 showInkPickerAfterViewAppears])
  {
    double v20 = [(ICNoteEditorViewController *)v12 presentedViewController];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__ICNoteEditorViewController_viewDidAppear___block_invoke;
      block[3] = &unk_2640B8140;
      block[4] = v12;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    [(ICNoteEditorViewController *)v12 setShowInkPickerAfterViewAppears:0];
  }
  if ([(ICNoteEditorViewController *)v12 showInsertUIAfterViewAppears])
  {
    [(ICNoteEditorViewController *)v12 showInsertUIWithPreferredSourceType:1];
    [(ICNoteEditorViewController *)v12 setShowInsertUIAfterViewAppears:0];
  }
  if ([(ICNoteEditorViewController *)v12 addToDoListAfterViewAppears])
  {
    [(ICNoteEditorViewController *)v12 addTodoListAtEndOfNote];
    [(ICNoteEditorViewController *)v12 setAddToDoListAfterViewAppears:0];
  }
  if ([(ICNoteEditorViewController *)v12 addDocumentScanAfterViewAppears])
  {
    [(ICNoteEditorViewController *)v12 showInsertUIWithPreferredSourceType:4];
    [(ICNoteEditorViewController *)v12 setAddDocumentScanAfterViewAppears:0];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)v12 ppt_didFinishExtendedLaunch];
  }
  uint64_t v22 = [MEMORY[0x263F087C8] defaultCenter];
  [v22 addObserver:v12 selector:sel_systemPaperLinkBarVisibilityPreferenceChanged_ name:@"ICShouldQuickNoteLinksBarDefaultsChangedNotification" object:0];

  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)v12 ppt_didShowNoteEditor];
  }
  [(ICNoteEditorViewController *)v12 updateTextViewContentInsetsAnimated:1];
  uint64_t v23 = [(ICNoteEditorViewController *)v12 passwordEntryViewController];
  [v23 setIsAnimatingOut:0];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0
    && [(ICNoteEditorViewController *)v12 wasWindowlessDuringTransitionToSize])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    objc_super v24 = [(ICNoteEditorBaseViewController *)v12 note];
    uint64_t v25 = [v24 textStorage];
    double v26 = [v25 layoutManagers];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v49;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(v26);
          }
          int v30 = *(void **)(*((void *)&v48 + 1) + 8 * v29);
          uint64_t v31 = [(ICNoteEditorViewController *)v12 visibleRange];
          uint64_t v33 = v32;
          objc_msgSend(v30, "invalidateLayoutForCharacterRange:actualCharacterRange:", v31, v32, 0);
          objc_msgSend(v30, "invalidateDisplayForCharacterRange:", v31, v33);
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v27);
    }

    [(ICNoteEditorViewController *)v12 setWasWindowlessDuringTransitionToSize:0];
  }
  [(ICNoteEditorViewController *)v12 updateBarButtonsAnimated:0];
  id v34 = [(ICNoteEditorViewController *)v12 view];
  int v35 = [v34 window];

  if (v35)
  {
    if ([MEMORY[0x263F5AE70] deviceSupportsPencil]
      && ([MEMORY[0x263F5AE70] deviceSupportsFirstGenPencil] & 1) == 0)
    {
      objc_initWeak(&location, v12);
      uint64_t v42 = MEMORY[0x263EF8330];
      uint64_t v43 = 3221225472;
      objc_super v44 = __44__ICNoteEditorViewController_viewDidAppear___block_invoke_2;
      uint64_t v45 = &unk_2640B7F90;
      objc_copyWeak(&v46, &location);
      dispatchMainAfterDelay();
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v36 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[ICNoteEditorViewController viewDidAppear:]();
    }
  }
  id v37 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v42, v43, v44, v45);
  if ([v37 BOOLForKey:*MEMORY[0x263F5B148]]) {
    [(ICNoteEditorViewController *)v12 showHandwritingDebug:1];
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0) {
    [(ICNoteEditorViewController *)v12 applyScrollStateIfAvailable];
  }
  [(ICNoteEditorViewController *)v12 setArchivedScrollStateToApply:0];
  [(ICNoteEditorViewController *)v12 setShouldOverscrollScrollState:0];
  id v38 = [(ICNoteEditorBaseViewController *)v12 note];

  if (v38)
  {
    unint64_t v39 = [(ICNoteEditorBaseViewController *)v12 note];
    [(ICNoteEditorBaseViewController *)v12 noteDidAppear:v39];

    if (objc_opt_respondsToSelector())
    {
      int v40 = [(ICNoteEditorBaseViewController *)v12 note];
      [(ICNoteEditorViewController *)v12 performSelector:sel_updateFastSyncParticipantCursorsForNote_ withObject:v40];
    }
  }
  BOOL v41 = [(ICNoteEditorViewController *)v12 viewControllerManager];
  [v41 setSelectedNewNoteShortcutItem:0];
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_splitViewExpandingOrCollapsing = a3;
  objc_super v5 = [(ICNoteEditorViewController *)self textView];
  [v5 setShouldAvoidResigningFirstResponder:v3];

  objc_opt_class();
  uint64_t v6 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  uint64_t v7 = ICDynamicCast();
  [v7 setShouldAvoidResigningFirstResponder:v3];

  objc_opt_class();
  id v8 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  BOOL v9 = ICDynamicCast();
  [v9 setShouldAvoidResigningFirstResponder:v3];

  BOOL v10 = v3 && [(ICNoteEditorViewController *)self isInkPickerShowing];
  [(ICNoteEditorViewController *)self setShowInkPickerAfterViewAppears:v10 | [(ICNoteEditorViewController *)self showInkPickerAfterViewAppears]];
  id v11 = [(ICNoteEditorViewController *)self attributionSidebarController];
  [v11 hideSidebarAnimated:1];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      if (!v3)
      {
        id v12 = [(ICNoteEditorViewController *)self viewIfLoaded];

        if (v12)
        {
          [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
          char v13 = [(ICNoteEditorViewController *)self textView];
          [v13 frame];
          CGRect v27 = CGRectInset(v26, 1.0, 0.0);
          double x = v27.origin.x;
          double y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
          double v18 = [(ICNoteEditorViewController *)self textView];
          objc_msgSend(v18, "setFrame:", x, y, width, height);

          id v24 = [(ICNoteEditorViewController *)self textView];
          [v24 frame];
          CGRect v29 = CGRectInset(v28, -1.0, 0.0);
          double v19 = v29.origin.x;
          double v20 = v29.origin.y;
          double v21 = v29.size.width;
          double v22 = v29.size.height;
          uint64_t v23 = [(ICNoteEditorViewController *)self textView];
          objc_msgSend(v23, "setFrame:", v19, v20, v21, v22);
        }
      }
    }
  }
}

- (BOOL)showInkPickerAfterViewAppears
{
  return self->_showInkPickerAfterViewAppears;
}

- (void)setShowInkPickerAfterViewAppears:(BOOL)a3
{
  self->_showInkPickerAfterViewAppears = a3;
}

- (BOOL)updateContentSizeCategoryWhenVisible
{
  return self->_updateContentSizeCategoryWhenVisible;
}

- (BOOL)startEditingAfterViewAppears
{
  return self->_startEditingAfterViewAppears;
}

- (BOOL)showInsertUIAfterViewAppears
{
  return self->_showInsertUIAfterViewAppears;
}

- (void)setShouldTrackNoteViewEventAnalyticsFromSettingNote:(BOOL)a3
{
  self->_shouldTrackNoteViewEventAnalyticsFromSettingNote = a3;
}

- (void)setShouldOverscrollScrollState:(BOOL)a3
{
  self->_shouldOverscrollScrollState = a3;
}

- (void)saveCurrentScrollState
{
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  id v9 = +[ICTextViewScrollState scrollStateForTextView:v3];

  id v4 = [v9 note];
  objc_super v5 = [(ICNoteEditorBaseViewController *)self note];

  if (v4 == v5)
  {
    uint64_t v6 = [(ICNoteEditorViewController *)self savedScrollStates];
    uint64_t v7 = [v9 note];
    id v8 = [v7 identifier];
    objc_msgSend(v6, "ic_setNonNilObject:forNonNilKey:", v9, v8);
  }
}

- (void)setArchivedScrollStateToApply:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__4;
  double v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v6 = [v5 note];
  uint64_t v7 = [v6 managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke;
  v13[3] = &unk_2640B92A8;
  double v15 = &v16;
  id v8 = (ICTextViewScrollState *)v5;
  double v14 = v8;
  [v7 performBlockAndWait:v13];

  id v9 = [(ICNoteEditorViewController *)self savedScrollStates];
  objc_msgSend(v9, "ic_removeObjectForNonNilKey:", v17[5]);

  if (self->_archivedScrollStateToApply != v8)
  {
    objc_storeStrong((id *)&self->_archivedScrollStateToApply, a3);
    if ([(ICNoteEditorViewController *)self ic_isViewVisible])
    {
      BOOL v10 = [(ICNoteEditorBaseViewController *)self note];
      id v11 = [(ICTextViewScrollState *)self->_archivedScrollStateToApply note];

      if (v10 == v11)
      {
        [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          id v12 = v8;
          dispatchMainAfterDelay();
        }
      }
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (void)applyScrollStateIfAvailable
{
  id v31 = [(ICNoteEditorViewController *)self view];
  uint64_t v3 = [v31 window];
  if (v3)
  {
    id v4 = (void *)v3;
    int64_t v5 = +[ICExtensionSafeAPIShims applicationState];

    if (v5 != 2)
    {
      uint64_t v6 = [(ICNoteEditorBaseViewController *)self note];
      char v7 = [v6 isPasswordProtectedAndLocked];

      if ((v7 & 1) == 0)
      {
        uint64_t v33 = 0;
        id v34 = &v33;
        uint64_t v35 = 0x3032000000;
        uint64_t v36 = __Block_byref_object_copy__4;
        id v37 = __Block_byref_object_dispose__4;
        id v38 = 0;
        id v8 = [(ICNoteEditorViewController *)self archivedScrollStateToApply];
        id v9 = [v8 note];
        BOOL v10 = [v9 managedObjectContext];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __57__ICNoteEditorViewController_applyScrollStateIfAvailable__block_invoke;
        v32[3] = &unk_2640B92A8;
        v32[4] = self;
        v32[5] = &v33;
        [v10 performBlockAndWait:v32];

        id v11 = (void *)v34[5];
        id v12 = [(ICNoteEditorBaseViewController *)self note];
        char v13 = [v12 identifier];
        LODWORD(v11) = [v11 isEqualToString:v13];

        if (v11)
        {
          id v14 = [(ICNoteEditorViewController *)self archivedScrollStateToApply];
        }
        else
        {
          double v15 = [(ICNoteEditorViewController *)self savedScrollStates];
          uint64_t v16 = [(ICNoteEditorBaseViewController *)self note];
          double v17 = [v16 identifier];
          uint64_t v18 = objc_msgSend(v15, "ic_objectForNonNilKey:", v17);

          if ([v18 captureIsWithinTimeThreshold]) {
            id v14 = v18;
          }
          else {
            id v14 = 0;
          }
        }
        double v19 = [(ICNoteEditorViewController *)self view];
        [v19 layoutIfNeeded];

        double v20 = [(ICNoteEditorViewController *)self textView];
        if ([v14 applyToTextView:v20])
        {
          id v21 = [(ICNoteEditorViewController *)self archivedScrollStateToApply];

          if (v14 == v21) {
            [(ICNoteEditorViewController *)self setArchivedScrollStateToApply:0];
          }
        }
        else
        {
        }
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          if ([(ICNoteEditorViewController *)self shouldOverscrollScrollState])
          {
            double v22 = [(ICNoteEditorViewController *)self textView];
            [v22 contentOffset];
            double v24 = v23;
            double v26 = v25;

            CGRect v27 = [(ICNoteEditorViewController *)self view];
            [v27 safeAreaInsets];
            double v29 = v28;

            int v30 = [(ICNoteEditorViewController *)self textView];
            objc_msgSend(v30, "setContentOffset:", v24, fmax(v26 + -100.0, -v29));
          }
        }

        _Block_object_dispose(&v33, 8);
      }
    }
  }
  else
  {
  }
}

- (NSMutableDictionary)savedScrollStates
{
  return self->_savedScrollStates;
}

- (ICTextViewScrollState)archivedScrollStateToApply
{
  return self->_archivedScrollStateToApply;
}

- (BOOL)addToDoListAfterViewAppears
{
  return self->_addToDoListAfterViewAppears;
}

- (BOOL)addDocumentScanAfterViewAppears
{
  return self->_addDocumentScanAfterViewAppears;
}

- (UIActivityItemsConfigurationProviding)activityItemsConfigurationProvider
{
  return self->_activityItemsConfigurationProvider;
}

- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v10 = a5;
  if (v6)
  {
    id v8 = [(ICNoteEditorViewController *)self noteFormattingControllerCreateIfNecessary];
    [v8 updateWithDataSource:self ignoreTypingAttributes:0];
  }
  if ([(ICNoteEditorViewController *)self useInputViewForStyleSelector])
  {
    [(ICNoteEditorViewController *)self showStyleSelectorInputView:v6 animated:v5 doneEditing:0];
  }
  else
  {
    [(ICNoteEditorViewController *)self showStyleSelectorPopover:v6 animated:v5 sender:v10];
    id v9 = [(ICNoteEditorViewController *)self styleSelectorController];
    [v9 setElementForAXFocusOnDismissal:v10];
  }
}

- (BOOL)useInputViewForStyleSelector
{
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v3 = [v2 traitCollection];

  if ([v3 horizontalSizeClass] == 1)
  {
    LOBYTE(v4) = 1;
  }
  else if ([v3 userInterfaceIdiom] == 1)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision") ^ 1;
  }

  return v4;
}

- (void)showStyleSelectorInputView:(BOOL)a3 animated:(BOOL)a4 doneEditing:(BOOL)a5
{
  BOOL v5 = a3;
  v31[1] = *MEMORY[0x263EF8340];
  -[ICNoteEditorViewController setIsLoadingStyleSelectorInputView:](self, "setIsLoadingStyleSelectorInputView:", 1, a4, a5);
  if ([(ICNoteEditorViewController *)self styleSelectorInputViewShowing] != v5)
  {
    [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:1];
    [(ICNoteEditorViewController *)self setSuspendSelectedRangeUpdates:1];
    char v7 = [(ICNoteEditorViewController *)self textView];
    id v8 = [v7 typingAttributes];

    if (v5)
    {
      id v9 = [(ICNoteEditorViewController *)self noteFormattingControllerCreateIfNecessary];
      id v10 = [v9 presentationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = (void *)MEMORY[0x263F82BD0];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __78__ICNoteEditorViewController_showStyleSelectorInputView_animated_doneEditing___block_invoke;
        v29[3] = &unk_2640B92F8;
        id v30 = v9;
        id v12 = v10;
        char v13 = [v11 customDetentWithIdentifier:@"compactStyleSelector" resolver:v29];
        v31[0] = v13;
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
        [v12 setDetents:v14];

        [v12 setPrefersEdgeAttachedInCompactHeight:1];
        [v12 setLargestUndimmedDetentIdentifier:@"compactStyleSelector"];
        [v12 _setShouldDismissWhenTappedOutside:0];
      }
      double v15 = [v9 view];
      [v15 setHidden:0];

      [(ICNoteEditorViewController *)self presentViewController:v9 animated:1 completion:0];
      uint64_t v16 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

      double v17 = [(ICNoteEditorViewController *)self styleSelectorDummyInputView];
      if (v16)
      {
        uint64_t v18 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
        [v18 setInputView:v17];

        double v19 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
        [v19 setInputAccessoryView:0];
      }
      else
      {
        double v23 = [(ICNoteEditorViewController *)self textView];
        [v23 setInputView:v17];

        double v24 = [(ICNoteEditorViewController *)self textView];
        [v24 setInputAccessoryView:0];

        double v19 = [(ICNoteEditorViewController *)self textView];
        [v19 reloadInputViews];
      }
    }
    else
    {
      double v20 = [(ICNoteEditorViewController *)self noteFormattingController];
      [v20 dismissViewControllerAnimated:1 completion:0];

      id v21 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

      if (!v21)
      {
        double v26 = [(ICNoteEditorViewController *)self textView];
        [v26 setInputView:0];

        CGRect v27 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
        double v28 = [(ICNoteEditorViewController *)self textView];
        [v28 setInputAccessoryView:v27];

        id v9 = [(ICNoteEditorViewController *)self textView];
        [v9 reloadInputViews];
        goto LABEL_12;
      }
      double v22 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
      [v22 setInputView:0];

      id v9 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
      id v10 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
      [v10 setInputAccessoryView:v9];
    }

LABEL_12:
    double v25 = [(ICNoteEditorViewController *)self textView];
    [v25 setTypingAttributes:v8];

    [(ICNoteEditorViewController *)self setSuspendBarButtonUpdates:0];
    [(ICNoteEditorViewController *)self setSuspendSelectedRangeUpdates:0];
  }
  [(ICNoteEditorViewController *)self setIsLoadingStyleSelectorInputView:0];
}

- (void)setIsLoadingStyleSelectorInputView:(BOOL)a3
{
  self->_isLoadingStyleSelectorInputView = a3;
}

- (BOOL)styleSelectorInputViewShowing
{
  uint64_t v3 = [(ICNoteEditorViewController *)self styleSelectorDummyInputView];
  int v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
  BOOL v5 = [v4 inputView];
  if (v3 == v5)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v6 = [(ICNoteEditorViewController *)self textView];
    char v7 = [v6 inputView];
    BOOL v8 = v3 == v7;
  }
  return v8;
}

- (UIView)styleSelectorDummyInputView
{
  styleSelectorDummyInputView = self->_styleSelectorDummyInputView;
  if (!styleSelectorDummyInputView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82840]);
    BOOL v5 = (UIView *)objc_msgSend(v4, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    BOOL v6 = self->_styleSelectorDummyInputView;
    self->_styleSelectorDummyInputView = v5;

    [(UIView *)self->_styleSelectorDummyInputView setUserInteractionEnabled:0];
    styleSelectorDummyInputView = self->_styleSelectorDummyInputView;
  }

  return styleSelectorDummyInputView;
}

+ (void)initialize
{
  v5[10] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = &unk_26C138E98;
    v4[1] = &unk_26C138EC8;
    v5[0] = &unk_26C138EB0;
    v5[1] = &unk_26C138EE0;
    v4[2] = &unk_26C138EF8;
    v4[3] = &unk_26C138F28;
    v5[2] = &unk_26C138F10;
    v5[3] = &unk_26C138F40;
    v4[4] = &unk_26C138F58;
    v4[5] = &unk_26C138F88;
    v5[4] = &unk_26C138F70;
    void v5[5] = &unk_26C138FA0;
    v4[6] = &unk_26C138FB8;
    v4[7] = &unk_26C138FE8;
    v5[6] = &unk_26C138FD0;
    v5[7] = &unk_26C138EE0;
    v4[8] = &unk_26C139000;
    v4[9] = &unk_26C139030;
    v5[8] = &unk_26C139018;
    v5[9] = &unk_26C139048;
    uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
    uint64_t v3 = (void *)topoTextStylesToAnalyticsStyles;
    topoTextStylesToAnalyticsStyles = v2;
  }
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v3 = [(ICNoteEditorViewController *)self viewControllerManager];
  if ([v3 hasCompactWidth])
  {
  }
  else
  {
    BOOL v5 = [(ICNoteEditorViewController *)self viewControllerManager];
    if ([v5 isPrimaryContentVisible])
    {

      return 0;
    }
    BOOL v6 = [(ICNoteEditorViewController *)self viewControllerManager];
    char v7 = [v6 isSupplementaryContentVisible];

    if (v7) {
      return 0;
    }
  }
  if ([(ICNoteEditorViewController *)self isStyleSelectorInputViewPresenting]) {
    return 0;
  }
  id v4 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  if (v4)
  {

    return 0;
  }
  BOOL v8 = [(ICNoteEditorViewController *)self invitationViewController];

  return !v8;
}

- (BOOL)isStyleSelectorInputViewPresenting
{
  return self->_styleSelectorInputViewPresenting;
}

+ (id)editorViewControllerWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  char v7 = off_2640B6D98;
  if (!IsTextKit2Enabled) {
    char v7 = &off_2640B6C28;
  }
  BOOL v8 = (void *)[objc_alloc(*v7) initWithIdentifier:a3 options:a4];

  return v8;
}

- (ICNoteEditorViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorViewController;
  BOOL v5 = [(ICNoteEditorBaseViewController *)&v12 initWithIdentifier:a3 options:a4 nibName:0 bundle:0];
  if (v5)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      BOOL v6 = [MEMORY[0x263EFF9C0] set];
      uint64_t v7 = 1680;
    }
    else
    {
      BOOL v6 = objc_alloc_init(ICAttributionSidebarController);
      uint64_t v7 = 1216;
    }
    BOOL v8 = *(Class *)((char *)&v5->super.super.super.super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.super.super.super.isa + v7) = (Class)v6;

    v5->_canShowLinkBar = (v4 & 2) != 0;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    savedScrollStates = v5->_savedScrollStates;
    v5->_savedScrollStates = (NSMutableDictionary *)v9;

    v5->_needsInitialBarConfiguration = 1;
    [(ICNoteEditorViewController *)v5 registerForTraitChanges];
  }
  return v5;
}

- (void)registerForTraitChanges
{
  v8[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ICNoteEditorViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_2640B9130;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(ICNoteEditorViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__ICNoteEditorViewController_updateTextViewContentInsetsAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  id v6 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v6, "setContentInset:", v2, v3, v4, v5);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    double v7 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 80);
    double v9 = *(double *)(a1 + 88);
    double v10 = *(double *)(a1 + 96);
    id v11 = [*(id *)(a1 + 32) textView];
    objc_msgSend(v11, "setVerticalScrollIndicatorInsets:", v7, v8, v9, v10);
  }
}

+ (id)keyPathsForValuesAffectingTextView
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"textViewController"];
}

- (ICTextView)textView
{
  double v2 = [(ICNoteEditorViewController *)self textViewController];
  double v3 = [v2 textView];

  return (ICTextView *)v3;
}

- (ICTextView)textViewIfLoaded
{
  double v2 = [(ICNoteEditorViewController *)self textViewController];
  double v3 = [v2 textViewIfLoaded];

  return (ICTextView *)v3;
}

- (ICTextController)textController
{
  double v2 = [(ICNoteEditorViewController *)self textViewController];
  double v3 = [v2 textController];

  return (ICTextController *)v3;
}

- (void)startEditing
{
  if (([(ICNoteEditorViewController *)self ic_isViewVisible] & 1) == 0)
  {
    [(ICNoteEditorViewController *)self setStartEditingAfterViewAppears:1];
    goto LABEL_5;
  }
  double v4 = [(ICNoteEditorViewController *)self passwordEntryViewController];

  if (v4)
  {
    double v5 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    [v5 beginAuthentication];

    [(ICNoteEditorViewController *)self setShouldBeginEditingAfterNoteUnlock:1];
    goto LABEL_5;
  }
  id v6 = [(ICNoteEditorViewController *)self invitationViewController];
  if (v6)
  {

    goto LABEL_5;
  }
  double v7 = [(ICNoteEditorViewController *)self textView];
  int v8 = [v7 isFirstResponder];
  if (v8)
  {
    double v2 = [(ICNoteEditorViewController *)self textView];
    if ([v2 isEditable])
    {

      goto LABEL_5;
    }
  }
  double v9 = [(ICNoteEditorViewController *)self textView];
  char v10 = [v9 canBecomeFirstResponder];

  if (v8) {
  if (v10)
  }
  {
    [(ICNoteEditorViewController *)self stopTextFindingIfNecessary];
    id v11 = [(ICNoteEditorViewController *)self textView];
    [v11 setEditable:1];

    objc_super v12 = [(ICNoteEditorViewController *)self textView];
    uint64_t v13 = [v12 selectedRange];
    uint64_t v15 = v14;

    uint64_t v16 = [(ICNoteEditorViewController *)self textView];
    double v17 = [v16 textStorage];
    if ([v17 length] && !v15)
    {
      uint64_t v18 = [(ICNoteEditorViewController *)self textView];
      double v19 = [v18 textStorage];
      uint64_t v20 = [v19 length];

      if (v13 != v20) {
        goto LABEL_24;
      }
      objc_opt_class();
      id v21 = [(ICNoteEditorViewController *)self textView];
      double v22 = [v21 textStorage];
      double v23 = [v22 attribute:*MEMORY[0x263F814A0] atIndex:v13 - 1 effectiveRange:0];
      uint64_t v16 = ICDynamicCast();

      if (!v16 || [v16 embeddingType] != 1)
      {
LABEL_23:

LABEL_24:
        double v25 = [(ICNoteEditorViewController *)self view];
        double v26 = [v25 window];
        [v26 makeKeyWindow];

        CGRect v27 = [(ICNoteEditorViewController *)self textView];
        [v27 becomeFirstResponder];

        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          double v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
          char v29 = [v28 BOOLForKey:@"DisableInitialCursorSizeWorkaround"];

          if ((v29 & 1) == 0)
          {
            id v30 = [(ICNoteEditorViewController *)self textView];
            id v31 = [v30 textStorage];
            uint64_t v32 = [v31 length];

            if (!v32)
            {
              uint64_t v33 = [(ICNoteEditorViewController *)self textView];
              id v34 = [v33 layoutManager];
              uint64_t v35 = [(ICNoteEditorViewController *)self textView];
              uint64_t v36 = [v35 textContainer];
              objc_msgSend(v34, "setExtraLineFragmentRect:usedRect:textContainer:", v36, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
            }
          }
        }
        [(ICNoteEditorViewController *)self rememberNoteContentForEditingIntent];
        goto LABEL_5;
      }
      double v17 = [(ICNoteEditorViewController *)self textView];
      double v24 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
      [v17 _pasteAttributedString:v24 pasteAsRichText:0];
    }
    goto LABEL_23;
  }
LABEL_5:
  id v37 = [MEMORY[0x263F08A00] defaultCenter];
  [v37 postNotificationName:@"ICNoteEditorViewControllerDidStartEditingNotification" object:self];
}

- (void)keyboardDidShow:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [MEMORY[0x263EFF910] date];
  [(ICNoteEditorViewController *)self setKeyboardDidShowAnimationDate:v5];

  dispatch_time_t v6 = dispatch_time(0, 300000000);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = __46__ICNoteEditorViewController_keyboardDidShow___block_invoke;
  char v10 = &unk_2640B7F90;
  objc_copyWeak(&v11, &location);
  dispatch_after(v6, MEMORY[0x263EF83A0], &v7);
  -[ICNoteEditorViewController setWasEditingBeforeDrawing:](self, "setWasEditingBeforeDrawing:", 1, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__ICNoteEditorViewController_keyboardDidShow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setKeyboardDidShowAnimationDate:0];
}

- (void)keyboardDidHide:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self noteFormattingController];
  double v5 = [v4 popoverPresentationController];

  if (v5) {
    [(ICNoteEditorViewController *)self showStyleSelector:0 animated:1];
  }

  [(ICNoteEditorViewController *)self setWasEditingBeforeDrawing:0];
}

- (BOOL)shouldUseiPadBarLayout
{
  double v3 = [(ICNoteEditorViewController *)self traitCollection];
  if (![v3 horizontalSizeClass])
  {
    id v4 = [(ICNoteEditorViewController *)self view];
    double v5 = [v4 window];
    dispatch_time_t v6 = [v5 rootViewController];
    uint64_t v7 = [v6 traitCollection];

    double v3 = (void *)v7;
  }
  if ((objc_msgSend(v3, "ic_hasCompactWidth") & 1) != 0 || (objc_msgSend(MEMORY[0x263F82670], "ic_isiPad") & 1) == 0) {
    char v8 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
}

- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6
{
  BOOL v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v17 = a5;
  id v11 = a6;
  if ([(ICNoteEditorViewController *)self _appearState] == 2)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      objc_super v12 = [(ICNoteEditorViewController *)self textView];
      uint64_t v13 = [v12 layoutManager];
      uint64_t v14 = [(ICNoteEditorViewController *)self textView];
      uint64_t v15 = [v14 textContainer];
      [v13 ensureLayoutForTextContainer:v15];
    }
    uint64_t v16 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v16, "scrollRangeToVisible:consideringInsets:animated:inSearchableString:", location, length, 1, 0, v17);

    [(ICNoteEditorViewController *)self setSearchRegexFinder:v11];
  }
  else
  {
    -[ICNoteEditorViewController scrollRangeToVisibleWhenViewAppears:animated:inSearchableString:searchHighlightRegexFinder:](self, "scrollRangeToVisibleWhenViewAppears:animated:inSearchableString:searchHighlightRegexFinder:", location, length, v7, v17, v11);
  }
}

- (void)scrollRangeToVisibleWhenViewAppears:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a6;
  id v10 = (id)[(ICNoteEditorViewController *)self view];
  [(ICNoteEditorViewController *)self setShouldResetTextViewContentOffsetWhenAppearing:0];
  id v11 = [(ICNoteEditorBaseViewController *)self note];
  +[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", location, length, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [(ICNoteEditorViewController *)self setArchivedScrollStateToApply:v12];
  [(ICNoteEditorViewController *)self setSearchRegexFinder:v9];

  [(ICNoteEditorViewController *)self setShouldOverscrollScrollState:1];
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v5, "setSelectedRange:", location, length);
}

- (id)barButtonItemWithImage:(id)a3 selector:(SEL)a4
{
  dispatch_time_t v6 = (objc_class *)MEMORY[0x263F824A8];
  id v7 = a3;
  char v8 = (void *)[[v6 alloc] initWithImage:v7 style:0 target:self action:a4];

  return v8;
}

- (id)flexibleSpaceBarButtonItem
{
  double v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];

  return v2;
}

- (void)recreateTextViewIfPasswordEntryScreenExistsButNoteIsUnlocked
{
  uint64_t v3 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(ICNoteEditorBaseViewController *)self note];
    char v6 = [v5 isPasswordProtectedAndLocked];

    if ((v6 & 1) == 0)
    {
      [(ICNoteEditorViewController *)self recreateTextView];
    }
  }
}

- (void)recreateTextView
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "isPreviewingAttachmentFromNote = NO, recreateTextView", v2, v3, v4, v5, v6);
}

void __46__ICNoteEditorViewController_recreateTextView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDataDetectorTypes:-1];
}

- (double)inputAccessoryViewHeight
{
  uint64_t v2 = [(ICNoteEditorViewController *)self inputAccessoryView];
  [v2 intrinsicContentSize];
  double v4 = v3;

  return v4;
}

- (void)paperKitBundleDidMerge:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  double v4 = [v3 object];

  uint64_t v5 = ICDynamicCast();
  uint8_t v6 = [v5 objectID];

  if (v6)
  {
    id v7 = v6;
    performBlockOnMainThread();
  }
}

void __53__ICNoteEditorViewController_paperKitBundleDidMerge___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "note", 0);
  id v3 = [v2 visibleAttachments];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) objectID];
        int v9 = [v8 isEqual:*(void *)(a1 + 40)];

        if (v9)
        {
          id v10 = +[ICSystemPaperDocumentController sharedInstance];
          [v10 removePresenter:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

uint64_t __44__ICNoteEditorViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showInkPicker:1 animated:1];
}

void __44__ICNoteEditorViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createInkPickerControllerIfNecessary];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = (void *)MEMORY[0x263F82670];
  id v8 = a4;
  if ((objc_msgSend(v7, "ic_isVision") & 1) == 0)
  {
    int v9 = [(ICNoteEditorViewController *)self attributionSidebarController];
    [v9 hideSidebarAnimated:1];
  }
  id v10 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  [v10 hideDisclosureViewForTransition:1];

  long long v11 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  if ([v11 isFirstResponder])
  {
    long long v12 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  }
  else
  {
    long long v12 = 0;
  }

  long long v13 = [(ICNoteEditorViewController *)self textView];
  if ([v13 isFirstResponder])
  {
    id v14 = [(ICNoteEditorViewController *)self textView];
  }
  else
  {
    id v14 = v12;
  }
  uint64_t v15 = v14;

  BOOL v16 = [(ICNoteEditorViewController *)self isInkPickerShowing];
  id v17 = [(ICNoteEditorViewController *)self noteFormattingController];
  uint64_t v18 = [v17 presentingViewController];

  -[ICNoteEditorViewController updateFormatToolbarLayoutWithSize:](self, "updateFormatToolbarLayoutWithSize:", width, height);
  [(ICNoteEditorViewController *)self hideAcceleratorIfNecessary];
  double v19 = [(ICNoteEditorViewController *)self linkEditorViewController];

  if (v19)
  {
    uint64_t v20 = [(ICNoteEditorViewController *)self linkEditorViewController];
    [v20 hideAccelerator];
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v32[3] = &unk_2640B8050;
  v32[4] = self;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v28[3] = &unk_2640B9108;
  BOOL v31 = v16;
  v28[4] = self;
  id v29 = v15;
  id v30 = v18;
  id v21 = v18;
  id v22 = v15;
  [v8 animateAlongsideTransition:v32 completion:v28];
  double v23 = [(ICNoteEditorViewController *)self view];
  double v24 = [v23 window];
  [(ICNoteEditorViewController *)self setWasWindowlessDuringTransitionToSize:v24 == 0];

  double v25 = [(ICNoteEditorViewController *)self audioBarViewController];
  objc_msgSend(v25, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

  double v26 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
  objc_msgSend(v26, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

  v27.receiver = self;
  v27.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

void __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewControllerManager];
  [v1 updateHostedNotesAppearance];
}

void __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  int v2 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 viewControllerManager];
    uint64_t v5 = [v4 noteContainerViewMode];

    if (v5 == 1) {
      [*(id *)(a1 + 32) updateBarButtonsAnimated:0];
    }
  }
  else
  {
    [v3 resetBarButtonsAnimated:0];
  }
  uint64_t v6 = [*(id *)(a1 + 32) textViewInputAccessoryView];
  [v6 hideDisclosureViewForTransition:0];

  uint64_t v7 = [*(id *)(a1 + 32) textView];
  [v7 didFinishAnimatingAfterSizeTransition];

  if (*(unsigned char *)(a1 + 56) && ([*(id *)(a1 + 32) isInkPickerShowing] & 1) == 0)
  {
    int v9 = [*(id *)(a1 + 32) view];
    uint64_t v10 = [v9 window];
    if (v10)
    {
      long long v11 = (void *)v10;
      long long v12 = [*(id *)(a1 + 32) presentedViewController];

      if (!v12)
      {
        [*(id *)(a1 + 32) showInkPicker:1 animated:1];
        goto LABEL_15;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) setShowInkPickerAfterViewAppears:1];
    goto LABEL_15;
  }
  id v8 = *(void **)(a1 + 40);
  if (v8 && ([v8 isFirstResponder] & 1) == 0)
  {
    [*(id *)(a1 + 32) setEditing:1 animated:1];
    [*(id *)(a1 + 40) becomeFirstResponder];
  }
LABEL_15:
  if (*(void *)(a1 + 48) && [*(id *)(a1 + 32) useInputViewForStyleSelector]) {
    [*(id *)(a1 + 32) showStyleSelector:1 animated:1];
  }
  id v13 = [*(id *)(a1 + 32) linkAcceleratorController];
  [v13 presentLinkAcceleratorIfNecessaryWithCompletionHandler:&__block_literal_global_5];
}

uint64_t __45__ICNoteEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForceLightContentIfNecessary];
}

- (void)updateTextViewContentOffset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[ICNoteEditorViewController updateTextViewContentOffset]";
    __int16 v10 = 1024;
    int v11 = 1423;
    _os_log_impl(&dword_20BE60000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v8, 0x12u);
  }

  [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
  uint64_t v4 = [(ICNoteEditorViewController *)self textView];
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  [v5 adjustedContentInset];
  objc_msgSend(v4, "setContentOffset:", 0.0, -v6);

  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  [v7 icaxClearCachedChildrenForReparenting];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController viewWillDisappear:](&v32, sel_viewWillDisappear_);
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];

  if (v5)
  {
    double v6 = [(ICNoteEditorBaseViewController *)self note];
    [(ICNoteEditorBaseViewController *)self noteWillDisappear:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self link_removeLinkActionInteractions];
  }
  [(ICNoteEditorViewController *)self setShouldTrackNoteViewEventAnalyticsFromSettingNote:0];
  uint64_t v7 = [(ICNoteEditorBaseViewController *)self note];
  if (v7)
  {
    int v8 = (void *)v7;
    BOOL v9 = [(ICNoteEditorViewController *)self shouldFireNoteViewEventOnViewDisappear];

    if (v9)
    {
      __int16 v10 = [(ICNoteEditorBaseViewController *)self note];
      [(ICNoteEditorViewController *)self submitNoteViewEventForModernNote:v10];

      [(ICNoteEditorViewController *)self setShouldFireNoteViewEventOnViewDisappear:0];
    }
  }
  [(ICNoteEditorViewController *)self saveCurrentScrollState];
  [(ICNoteEditorViewController *)self showInkPicker:0 animated:v3];
  int v11 = [(ICNoteEditorViewController *)self textView];
  int v12 = [v11 isEditing];

  if (v12)
  {
    id v13 = [(ICNoteEditorViewController *)self noteFormattingController];
    uint64_t v14 = [v13 presentingViewController];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      BOOL v16 = [(ICNoteEditorViewController *)self isSplitViewExpandingOrCollapsing];

      if (!v16)
      {
        id v17 = [(ICNoteEditorViewController *)self noteFormattingController];
        uint64_t v18 = [v17 presentingViewController];
        [v18 dismissViewControllerAnimated:v3 completion:0];

        goto LABEL_14;
      }
    }
    else
    {
    }
    [(ICNoteEditorViewController *)self setStartEditingAfterViewAppears:1];
    double v19 = [(ICNoteEditorViewController *)self transitionCoordinator];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    void v31[2] = __48__ICNoteEditorViewController_viewWillDisappear___block_invoke;
    v31[3] = &unk_2640B8050;
    v31[4] = self;
    [v19 animateAlongsideTransition:0 completion:v31];
  }
LABEL_14:
  id v20 = objc_alloc_init(MEMORY[0x263F82D78]);
  [v20 configureWithTransparentBackground];
  id v21 = [(ICNoteEditorViewController *)self navigationController];
  id v22 = [v21 toolbar];
  [v22 setScrollEdgeAppearance:v20];

  double v23 = [(ICNoteEditorViewController *)self navigationController];
  double v24 = [v23 toolbar];
  [v24 setCompactScrollEdgeAppearance:v20];

  double v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 removeObserver:self name:*MEMORY[0x263F5B018] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F5AAC0] object:0];
  [v25 removeObserver:self name:@"ICViewControllerWillStartEditModeNotification" object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F5AE30] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F837A8] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F83798] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F5AAA8] object:0];
  [v25 removeObserver:self name:*MEMORY[0x263F5AAA0] object:0];
  double v26 = [(ICNoteEditorViewController *)self navigationController];
  objc_super v27 = [v26 toolbar];
  [v27 setAccessibilityElementsHidden:0];

  double v28 = [(ICNoteEditorViewController *)self navigationItem];
  [v28 setCenterItemGroups:MEMORY[0x263EFFA68]];

  id v29 = [(ICNoteEditorViewController *)self transitionCoordinator];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __48__ICNoteEditorViewController_viewWillDisappear___block_invoke_2;
  v30[3] = &unk_2640B8050;
  v30[4] = self;
  [v29 animateAlongsideTransition:0 completion:v30];
}

uint64_t __48__ICNoteEditorViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 setStartEditingAfterViewAppears:0];
  }
  return result;
}

uint64_t __48__ICNoteEditorViewController_viewWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 updateForceLightContentIfNecessary];
  }
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorBaseViewController *)&v16 viewDidDisappear:a3];
  uint64_t v5 = [(ICNoteEditorViewController *)self eventReporter];
  double v6 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitPendingInlineDrawingDataForNote:v6];

  [(ICNoteEditorViewController *)self submitNoteEditEventIfNecessary];
  if ([(ICNoteEditorViewController *)self shouldRemoveEmptyNoteWhenViewDisappeared])
  {
    uint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController viewDidDisappear:]((uint64_t)self, a2);
    }

    [(ICNoteEditorViewController *)self setNote:0];
  }
  if (!+[ICMovieController isFullScreen]) {
    +[ICMovieController stopIfPlaying];
  }
  [(ICNoteEditorViewController *)self highlightSearchMatchesForRegexFinder:0];
  int v8 = [(ICNoteEditorViewController *)self paletteResponder];
  [v8 resignFirstResponder];

  BOOL v9 = [(ICNoteEditorViewController *)self textView];
  [v9 setShouldAvoidResigningFirstResponder:0];

  objc_opt_class();
  __int16 v10 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  int v11 = ICDynamicCast();
  [v11 setShouldAvoidResigningFirstResponder:0];

  objc_opt_class();
  int v12 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  id v13 = ICDynamicCast();
  [v13 setShouldAvoidResigningFirstResponder:0];

  uint64_t v14 = [(ICNoteEditorBaseViewController *)self note];

  if (v14)
  {
    uint64_t v15 = [(ICNoteEditorBaseViewController *)self note];
    [(ICNoteEditorBaseViewController *)self noteDidDisappear:v15];
  }
}

void __53__ICNoteEditorViewController_registerForTraitChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = [WeakRetained view];
    [v6 setNeedsUpdateConstraints];

    [v5 updateAuthorHighlightsIfNeeded];
    [v5 updateTextViewBackground];
    [v5 updatePencilKitPaperStyleType];
    [v5 setNeedsStatusBarAppearanceUpdate];
    uint64_t v7 = [v5 inkPaletteController];

    if (v7)
    {
      int v8 = [v5 inkPaletteController];
      BOOL v9 = [v8 selectedTool];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        int v11 = [v5 traitCollection];
        int v12 = objc_msgSend(v11, "ic_isDark");
        int v13 = objc_msgSend(v20, "ic_isDark");

        if (v12 != v13)
        {
          uint64_t v14 = [v5 inkPaletteController];
          uint64_t v15 = [v14 colorCorrectedTool];
          [v5 updateInkPickerAndTextViewToTool:v15];
        }
      }
      objc_super v16 = [v5 traitCollection];
      uint64_t v17 = [v16 userInterfaceStyle];

      if ([v20 userInterfaceStyle] != v17)
      {
        uint64_t v18 = [v5 inkPaletteController];
        [v18 updateUserInterfaceStyle:v17];
      }
    }
    [v5 updateForceLightContentIfNecessary];
    double v19 = [v5 activityStreamToolbar];
    [v19 update];
  }
}

- (BOOL)resignFirstResponder
{
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self textView];
    char v6 = [v5 resignFirstResponder];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICNoteEditorViewController;
    return [(ICNoteEditorViewController *)&v8 resignFirstResponder];
  }
}

- (void)dealloc
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];

  if (v3)
  {
    int v4 = [(ICNoteEditorBaseViewController *)self note];
    [(ICNoteEditorViewController *)self removeKVOObserversForNote:v4];
  }
  objc_msgSend(MEMORY[0x263F82A20], "ic_removeObserver:forKeyPath:context:", self, @"prefersPencilOnlyDrawing", &compoundliteral_0);
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, *MEMORY[0x263F5AFF0], &compoundliteral_2982);

  char v6 = [(ICNoteEditorViewController *)self textView];
  [v6 setDelegate:0];

  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];

  objc_super v8 = [MEMORY[0x263F087C8] defaultCenter];
  [v8 removeObserver:self];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v9 dealloc];
}

- (void)warnLimitExceededWithTitle:(id)a3 andMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ICNoteEditorViewController *)self limitExceededAlertController];

  if (!v8)
  {
    objc_super v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    [(ICNoteEditorViewController *)self setLimitExceededAlertController:v9];

    __int16 v10 = [(ICNoteEditorViewController *)self limitExceededAlertController];
    int v11 = (void *)MEMORY[0x263F82400];
    int v12 = [MEMORY[0x263F086E0] mainBundle];
    int v13 = [v12 localizedStringForKey:@"OK" value:&stru_26C10E100 table:0];
    uint64_t v14 = [v11 actionWithTitle:v13 style:0 handler:0];
    [v10 addAction:v14];

    uint64_t v15 = [(ICNoteEditorViewController *)self limitExceededAlertController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__ICNoteEditorViewController_warnLimitExceededWithTitle_andMessage___block_invoke;
    v16[3] = &unk_2640B8140;
    v16[4] = self;
    [(ICNoteEditorViewController *)self presentViewController:v15 animated:1 completion:v16];
  }
}

uint64_t __68__ICNoteEditorViewController_warnLimitExceededWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLimitExceededAlertController:0];
}

- (void)warnUserNoteLengthExceeded
{
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v4 localizedStringForKey:@"Maximum note length reached." value:&stru_26C10E100 table:0];
  [(ICNoteEditorViewController *)self warnLimitExceededWithTitle:v3 andMessage:0];
}

- (void)warnUserAttachmentLimitExceeded
{
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v4 localizedStringForKey:@"Maximum attachments reached." value:&stru_26C10E100 table:0];
  [(ICNoteEditorViewController *)self warnLimitExceededWithTitle:v3 andMessage:0];
}

- (void)warnUserAttachmentSizeExceededWithAttachmentCount:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F5ABD8] sharedConfiguration];
  id v6 = [v5 maximumAttachmentSizeMB];
  uint64_t v7 = [v6 unsignedLongLongValue] << 20;

  objc_super v8 = [MEMORY[0x263F086E0] mainBundle];
  objc_super v9 = v8;
  if (a3 == 1)
  {
    __int16 v10 = [v8 localizedStringForKey:@"Large Attachment." value:&stru_26C10E100 table:0];

    int v11 = NSString;
    int v12 = [MEMORY[0x263F086E0] mainBundle];
    int v13 = v12;
    uint64_t v14 = @"To add this attachment to your note, you’ll need to make it smaller than %@.";
  }
  else
  {
    __int16 v10 = [v8 localizedStringForKey:@"Large Attachments" value:&stru_26C10E100 table:0];

    int v11 = NSString;
    int v12 = [MEMORY[0x263F086E0] mainBundle];
    int v13 = v12;
    uint64_t v14 = @"Some of these attachments are too large. Each attachment must be smaller than %@.";
  }
  uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_26C10E100 table:0];
  objc_super v16 = [MEMORY[0x263F086F0] stringFromByteCount:v7 countStyle:3];
  objc_msgSend(v11, "localizedStringWithFormat:", v15, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  [(ICNoteEditorViewController *)self warnLimitExceededWithTitle:v10 andMessage:v17];
}

- (void)showRecoverNoteAlert
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "showRecoverNoteAlert early return", v2, v3, v4, v5, v6);
}

- (BOOL)shouldIgnoreTapToStartEditingTextView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNoteEditorViewController *)self calculateRecognitionController];
  char v6 = [v5 isPreviewingResult];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(ICNoteEditorViewController *)self calculateScrubberController];
    char v8 = [v7 isShowing];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = self;
      __int16 v10 = [v9 note];
      int v11 = [v10 textStorageWithoutCreating];
      char v12 = [v11 isMarkingTextForHeadingRename];

      if ((v12 & 1) == 0)
      {
        if ([(ICNoteEditorViewController *)self isEditing])
        {
          uint64_t v15 = [(ICNoteEditorViewController *)self auxiliaryResponder];
          if (v15)
          {
            id v16 = [(ICNoteEditorViewController *)self auxiliaryResponder];
            BOOL v13 = v16 == v4;
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v15 = [(ICNoteEditorViewController *)self passwordEntryViewController];
          if (!v15)
          {
            id v16 = [(ICNoteEditorViewController *)self invitationViewController];
            BOOL v13 = v16 != 0;
            goto LABEL_12;
          }
        }
        BOOL v13 = 1;
LABEL_13:

        goto LABEL_5;
      }
    }
  }
  BOOL v13 = 0;
LABEL_5:

  return v13;
}

- (id)createNewNote
{
  objc_opt_class();
  uint64_t v3 = [(ICNoteEditorViewController *)self viewControllerManager];
  id v4 = [v3 showNewNoteWithApproach:0 sender:0 animated:0];
  uint64_t v5 = ICDynamicCast();

  return v5;
}

- (void)noteDidChangeCalculatePreviewBehaviorNotification:(id)a3
{
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  BOOL v5 = [v4 calculatePreviewBehavior] != 1;
  char v6 = [(ICNoteEditorViewController *)self calculateRecognitionController];
  [v6 setInsertsResults:v5];

  id v9 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v7 = [v9 calculatePreviewBehavior];
  char v8 = [(ICNoteEditorViewController *)self calculateRecognitionController];
  [v8 setPreviewBehavior:v7];
}

- (void)noteWillBeDeleted:(id)a3
{
  id v13 = a3;
  id v4 = [v13 object];
  BOOL v5 = [(ICNoteEditorBaseViewController *)self note];

  if (v4 != v5) {
    goto LABEL_9;
  }
  char v6 = [(ICNoteEditorViewController *)self viewControllerManager];
  if ([v6 isAuxiliary]
    && ![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper])
  {
    BOOL v7 = [(ICNoteEditorViewController *)self isTogglingLock];

    if (v7) {
      goto LABEL_7;
    }
    char v6 = [(ICNoteEditorViewController *)self viewControllerManager];
    [v6 closeAuxiliaryWindowAnimated:1];
  }

LABEL_7:
  char v8 = [v13 object];
  id v9 = [MEMORY[0x263F5B240] sharedAudioController];
  __int16 v10 = [v9 currentAttachment];
  int v11 = [v10 note];

  if (v8 == v11)
  {
    char v12 = [MEMORY[0x263F5B240] sharedAudioController];
    [v12 stop];
  }
LABEL_9:
}

- (void)showOverscrollContentAndScrollToTop
{
  [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:1];

  [(ICNoteEditorViewController *)self updateTextViewContentOffset];
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v18 = a3;
  char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (v18)
  {
    if ((IsTextKit2Enabled & 1) == 0)
    {
      id v7 = [(ICNoteEditorViewController *)self textView];

      if (v7 == v18 && !a4)
      {
        char v8 = [(ICNoteEditorViewController *)self textView];
        [v8 verticalScrollIndicatorInsets];
        double v10 = v9;
        double v12 = v11;

        [(ICNoteEditorViewController *)self textViewScrollIndicatorInsetsThatWeWant];
        double v14 = v13;
        double v16 = v15;
        id v17 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v17, "setVerticalScrollIndicatorInsets:", v10, v14, v12, v16);
      }
    }
  }
}

- (void)contentSizeCategoryDidChange
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      uint64_t v3 = [(ICNoteEditorViewController *)self textView];
      [v3 setNeedsStylingRefreshOnNextLayout:1];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = [(ICNoteEditorBaseViewController *)self note];
      BOOL v5 = [v4 textStorage];
      char v6 = [v5 layoutManagers];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * i) contentSizeCategoryDidChange];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      objc_opt_class();
      double v11 = [(ICNoteEditorViewController *)self textView];
      double v12 = [v11 textStorage];
      uint64_t v3 = ICDynamicCast();

      objc_opt_class();
      double v13 = [v3 styler];
      double v14 = ICCheckedDynamicCast();

      [v14 refreshTextStylingForTextStorage:v3 withTextController:v14];
    }

    double v15 = [(ICNoteEditorViewController *)self textView];
    double v16 = [v15 compatibilityBannerView];
    [v16 contentSizeCategoryDidChange];

    [(ICNoteEditorViewController *)self setUpdateContentSizeCategoryWhenVisible:0];
    id v17 = [(ICNoteEditorViewController *)self attributionSidebarView];
    [v17 reload];
  }
  else
  {
    [(ICNoteEditorViewController *)self setUpdateContentSizeCategoryWhenVisible:1];
  }
}

- (BOOL)isShowingMiniPlayer
{
  uint64_t v2 = [(ICNoteEditorViewController *)self audioAttachmentEditorCoordinator];
  char v3 = [v2 isShowingMiniPlayer];

  return v3;
}

- (void)audioPlaybackPlayNotification:(id)a3
{
  id v14 = a3;
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]
    && (ICInternalSettingsIsAudioTranscriptionEnabled() & 1) == 0)
  {
    id v4 = [v14 object];
    BOOL v5 = [(ICNoteEditorViewController *)self audioBarViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v7 = [(ICNoteEditorViewController *)self audioBarViewController];
    uint64_t v8 = v7;
    if (isKindOfClass)
    {
      [v7 setAudioAttachment:v4];

      uint64_t v9 = [(ICNoteEditorBaseViewController *)self note];
      double v10 = [(ICNoteEditorViewController *)self audioBarViewController];
      [v10 setNote:v9];

      double v11 = [(ICNoteEditorViewController *)self audioBarViewController];
      [(ICAudioBarViewController *)v11 addToViewController:self];
    }
    else
    {

      if (v8)
      {
        double v12 = [(ICNoteEditorViewController *)self audioBarViewController];
        [v12 done:self];
      }
      double v11 = objc_alloc_init(ICAudioPlaybackBarViewController);
      [(ICAudioPlaybackBarViewController *)v11 setAudioAttachment:v4];
      double v13 = [(ICNoteEditorBaseViewController *)self note];
      [(ICAudioBarViewController *)v11 setNote:v13];

      [(ICAudioBarViewController *)v11 setDelegate:self];
      [(ICAudioBarViewController *)v11 addToViewController:self];
      [(ICNoteEditorViewController *)self setAudioBarViewController:v11];
    }

    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
  }
}

uint64_t __77__ICNoteEditorViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBarButtons];
}

- (void)willAddAttachmentForNoteNotification:(id)a3
{
  id v4 = [a3 object];
  BOOL v5 = [(ICNoteEditorBaseViewController *)self note];

  if (v4 == v5)
  {
    objc_opt_class();
    id v8 = [(ICNoteEditorViewController *)self textView];
    char v6 = [v8 textStorage];
    uint64_t v7 = ICDynamicCast();
    [v7 breakUndoCoalescing];
  }
}

- (void)didAddAttachmentForNoteNotification:(id)a3
{
  id v4 = [a3 object];
  BOOL v5 = [(ICNoteEditorBaseViewController *)self note];

  if (v4 == v5)
  {
    objc_opt_class();
    id v8 = [(ICNoteEditorViewController *)self textView];
    char v6 = [v8 textStorage];
    uint64_t v7 = ICDynamicCast();
    [v7 breakUndoCoalescing];
  }
}

- (void)noteAnalyticsAddAttachment:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5AA18]];

  if (v5)
  {
    char v6 = [v5 managedObjectContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__ICNoteEditorViewController_noteAnalyticsAddAttachment___block_invoke;
    v7[3] = &unk_2640B82D8;
    id v8 = v5;
    uint64_t v9 = self;
    [v6 performBlock:v7];
  }
}

void __57__ICNoteEditorViewController_noteAnalyticsAddAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) parentAttachment];
  if (!v2)
  {
    char v3 = [*(id *)(a1 + 32) note];
    id v4 = [v3 objectID];
    BOOL v5 = [*(id *)(a1 + 40) note];
    char v6 = [v5 objectID];
    int v7 = [v4 isEqual:v6];

    if (!v7) {
      return;
    }
    id v8 = [*(id *)(a1 + 40) eventReporter];
    [v8 submitAttachmentAddEventForAttachment:*(void *)(a1 + 32)];
    uint64_t v2 = v8;
  }
}

- (void)audioFindInTranscript:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 userInfo];
  char v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B108]];
  int v7 = ICDynamicCast();

  objc_opt_class();
  id v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5B110]];
  double v10 = ICDynamicCast();

  double v11 = [MEMORY[0x263F5ACA0] sharedContext];
  double v12 = [v11 managedObjectContext];

  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__4;
  id v29 = __Block_byref_object_dispose__4;
  id v30 = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __52__ICNoteEditorViewController_audioFindInTranscript___block_invoke;
  long long v20 = &unk_2640B9180;
  double v24 = &v25;
  id v13 = v12;
  id v21 = v13;
  id v14 = v7;
  id v22 = v14;
  uint64_t v23 = self;
  [v13 performBlockAndWait:&v17];
  if (v26[5])
  {
    double v15 = [(ICNoteEditorViewController *)self eventReporter];
    uint64_t v16 = [v10 BOOLValue];
    [v15 submitFindInTranscriptEventWasSearchQueryEntered:v16 audioAttachment:v26[5]];
  }
  _Block_object_dispose(&v25, 8);
}

void __52__ICNoteEditorViewController_audioFindInTranscript___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  BOOL v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) note];
  char v6 = [v5 objectID];
  int v7 = [*(id *)(a1 + 48) note];
  id v8 = [v7 objectID];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (void)audioTranscriptInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 userInfo];
  char v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B0D8]];
  int v7 = ICDynamicCast();

  objc_opt_class();
  id v8 = [v4 userInfo];
  char v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5B0E0]];
  uint64_t v10 = ICDynamicCast();

  objc_opt_class();
  double v11 = [v4 userInfo];
  double v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F5B0F0]];
  id v13 = ICDynamicCast();

  objc_opt_class();
  id v14 = [v4 userInfo];
  double v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F5B0E8]];
  uint64_t v16 = ICDynamicCast();

  objc_opt_class();
  uint64_t v17 = [v4 userInfo];
  uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F5B0F8]];
  long long v19 = ICDynamicCast();

  long long v20 = [MEMORY[0x263F5ACA0] sharedContext];
  id v21 = [v20 managedObjectContext];

  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__4;
  unint64_t v39 = __Block_byref_object_dispose__4;
  id v40 = 0;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __57__ICNoteEditorViewController_audioTranscriptInteraction___block_invoke;
  id v30 = &unk_2640B9180;
  id v34 = &v35;
  id v22 = v21;
  id v31 = v22;
  id v23 = v7;
  id v32 = v23;
  uint64_t v33 = self;
  [v22 performBlockAndWait:&v27];
  if (v36[5])
  {
    double v24 = [(ICNoteEditorViewController *)self eventReporter];
    uint64_t v25 = [v10 BOOLValue];
    uint64_t v26 = [v13 BOOLValue];
    [v24 submitAudioTranscriptInteractionEventSummaryViewed:v25 transcriptViewed:v26 interactionTargets:v16 interactionTypes:v19 audioAttachment:v36[5]];
  }
  _Block_object_dispose(&v35, 8);
}

void __57__ICNoteEditorViewController_audioTranscriptInteraction___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  BOOL v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) note];
  char v6 = [v5 objectID];
  int v7 = [*(id *)(a1 + 48) note];
  id v8 = [v7 objectID];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (void)audioRecordingStarted:(id)a3
{
  id v3 = [(ICNoteEditorViewController *)self audioEventReporter];
  [v3 startAudioRecordingEvent];
}

- (void)audioRecordingStopped:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 userInfo];
  char v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5AA30]];
  int v7 = ICDynamicCast();

  objc_opt_class();
  id v8 = [v4 userInfo];
  char v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AA38]];
  uint64_t v10 = ICDynamicCast();

  objc_opt_class();
  double v11 = [v4 userInfo];
  double v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F5AA40]];
  id v13 = ICDynamicCast();

  id v14 = [MEMORY[0x263F5ACA0] sharedContext];
  double v15 = [v14 managedObjectContext];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__4;
  id v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  id v21 = __52__ICNoteEditorViewController_audioRecordingStopped___block_invoke;
  id v22 = &unk_2640B9180;
  uint64_t v26 = &v27;
  id v16 = v15;
  id v23 = v16;
  id v17 = v7;
  id v24 = v17;
  uint64_t v25 = self;
  [v16 performBlockAndWait:&v19];
  if (v28[5])
  {
    uint64_t v18 = [(ICNoteEditorViewController *)self audioEventReporter];
    objc_msgSend(v18, "submitAudioRecordingEventWithAttachment:appBackgroundOccurred:noteMultitaksingOccurred:", v28[5], objc_msgSend(v10, "BOOLValue"), objc_msgSend(v13, "BOOLValue"));
  }
  _Block_object_dispose(&v27, 8);
}

void __52__ICNoteEditorViewController_audioRecordingStopped___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  BOOL v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) note];
  char v6 = [v5 objectID];
  int v7 = [*(id *)(a1 + 48) note];
  id v8 = [v7 objectID];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (void)observeAttachmentDeleted:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5A930]];

  if (v5)
  {
    char v6 = [v5 managedObjectContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__ICNoteEditorViewController_observeAttachmentDeleted___block_invoke;
    v7[3] = &unk_2640B82D8;
    id v8 = v5;
    char v9 = self;
    [v6 performBlock:v7];
  }
}

void __55__ICNoteEditorViewController_observeAttachmentDeleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [v2 objectID];
  id v4 = [*(id *)(a1 + 40) note];
  BOOL v5 = [v4 objectID];
  int v6 = [v3 isEqual:v5];

  if (v6)
  {
    if ([*(id *)(a1 + 32) attachmentType] == 12)
    {
      id v17 = [*(id *)(a1 + 40) eventReporter];
      int v7 = *(void **)(a1 + 32);
      id v8 = [v7 note];
      [v17 submitTableRemoveEventForAttachment:v7 inNote:v8];
    }
    else if ([*(id *)(a1 + 32) attachmentType] == 11)
    {
      char v9 = [*(id *)(a1 + 40) eventReporter];
      uint64_t v10 = [*(id *)(a1 + 32) galleryModel];
      objc_msgSend(v9, "pushStartDocScanPageCountData:", objc_msgSend(v10, "subAttachmentCount"));

      double v11 = [*(id *)(a1 + 40) eventReporter];
      double v12 = [*(id *)(a1 + 32) identifier];
      [v11 pushDocScanDataWithID:v12 actionType:5 stage:2];

      id v17 = [*(id *)(a1 + 40) eventReporter];
      id v8 = [*(id *)(a1 + 32) note];
      [v17 submitDocScanEventForNote:v8 pageCount:0];
    }
    else
    {
      if ([*(id *)(a1 + 32) attachmentType] != 10
        && [*(id *)(a1 + 32) attachmentType] != 13)
      {
        return;
      }
      id v13 = objc_alloc(MEMORY[0x263F14AE0]);
      id v14 = [*(id *)(a1 + 32) mergeableData];
      id v17 = (id)[v13 initWithData:v14 error:0];

      id v8 = [*(id *)(a1 + 40) eventReporter];
      double v15 = [*(id *)(a1 + 32) identifier];
      id v16 = [*(id *)(a1 + 32) note];
      [v8 submitInlineDrawingDataForDrawingDeletion:v17 drawingID:v15 forNote:v16];
    }
  }
}

- (void)observeDrawingConverted:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B098]];

  objc_opt_class();
  int v7 = [MEMORY[0x263F5ACA0] sharedContext];
  id v8 = [v7 managedObjectContext];
  id v19 = 0;
  char v9 = [v8 existingObjectWithID:v6 error:&v19];
  id v10 = v19;
  double v11 = ICDynamicCast();

  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v14 = [v11 managedObjectContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__ICNoteEditorViewController_observeDrawingConverted___block_invoke;
    v15[3] = &unk_2640B89A8;
    id v16 = v11;
    id v17 = self;
    id v18 = v4;
    [v14 performBlock:v15];

    id v13 = v16;
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICNoteEditorViewController observeDrawingConverted:]();
    }
  }
}

void __54__ICNoteEditorViewController_observeDrawingConverted___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] note];
  uint64_t v3 = [v2 objectID];
  id v4 = [a1[5] note];
  BOOL v5 = [v4 objectID];
  int v6 = [v3 isEqual:v5];

  if (v6)
  {
    int v7 = [a1[6] userInfo];
    id v15 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5B090]];

    if ([v15 BOOLValue]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    id v9 = objc_alloc(MEMORY[0x263F14AE0]);
    id v10 = [a1[4] mergeableData];
    double v11 = (void *)[v9 initWithData:v10 error:0];

    BOOL v12 = [a1[5] eventReporter];
    id v13 = [a1[4] note];
    id v14 = [a1[4] identifier];
    [v12 submitFullscreenDrawingToInlineDrawingEventForNote:v13 drawing:v11 drawingID:v14 method:v8];
  }
}

- (void)lockNoteManagerWillToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 object];

  ICCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  int v6 = [v8 note];
  int v7 = [(ICNoteEditorBaseViewController *)self note];

  if (v6 == v7) {
    [(ICNoteEditorViewController *)self setTogglingLock:1];
  }
}

- (void)lockNoteManagerDidToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 object];

  ICCheckedDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  int v6 = [v11 note];
  int v7 = [(ICNoteEditorBaseViewController *)self note];

  if (v6 == v7)
  {
    id v8 = [v11 updatedNote];

    if (v8)
    {
      BOOL v9 = [(ICNoteEditorViewController *)self userWantsToSeeDateLabel];
      id v10 = [v11 updatedNote];
      [(ICNoteEditorViewController *)self setNote:v10];

      [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:v9];
      UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
    }
    [(ICNoteEditorViewController *)self setTogglingLock:0];
    [(ICNoteEditorViewController *)self cleanupAfterBarSourcedPopoverPresentation];
  }
}

- (void)attachmentBrickDidChangeSize
{
  objc_opt_class();
  uint64_t v3 = [(ICNoteEditorViewController *)self textView];
  id v4 = [v3 textStorage];
  ICDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  BOOL v5 = [v7 styler];
  int v6 = ICCheckedDynamicCast();

  [v6 refreshTextStylingForTextStorage:v7 withTextController:v6];
}

- (void)tableCellFirstResponderChanged
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];

  if (v3)
  {
    id v5 = [(ICNoteEditorViewController *)self mentionsController];
    id v4 = [(ICNoteEditorBaseViewController *)self note];
    [v5 tableCellFirstResponderChangedInNote:v4];
  }
}

- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ICNoteEditorViewController_sharedWithYouControllerDidUpdateHighlights___block_invoke;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__ICNoteEditorViewController_sharedWithYouControllerDidUpdateHighlights___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCollaborationBarButtonItem:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 resetBarButtonsAnimated:0];
}

- (void)passwordEntryAlertControllerAttemptDidFail:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  id v5 = [v4 note];

  if (v5)
  {
    id v8 = [(ICNoteEditorViewController *)self eventReporter];
    int v6 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    id v7 = [v6 note];
    [v8 submitPasswordFailEventForModernNote:v7];
  }
}

- (void)authenticationAuthenticateBiometricsAttemptDidFail:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  id v5 = [v4 note];

  if (v5)
  {
    id v8 = [(ICNoteEditorViewController *)self eventReporter];
    int v6 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    id v7 = [v6 note];
    [v8 submitBiometricsFailEventForModernNote:v7];
  }
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

id __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 objectID];
  if (objc_msgSend(v3, "ic_isInlineAttachmentType"))
  {
    id v4 = [v2 objectID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectID];
  id v5 = [v3 objectID];
  int v6 = [*(id *)(a1 + 32) objectID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [v3 changedValues];

    if ([v8 count] != 1) {
      goto LABEL_8;
    }
    BOOL v9 = [v8 allKeys];
    id v10 = [v9 lastObject];
    int v11 = [v10 isEqualToString:@"lastOpenedDate"];

    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v12 = [v3 objectID];

    id v13 = [*(id *)(a1 + 40) objectID];
    char v14 = [v12 isEqual:v13];

    if (v14) {
      goto LABEL_9;
    }
    id v8 = v4;
  }
  id v4 = 0;
LABEL_8:

LABEL_9:

  return v4;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(ICNoteEditorViewController *)self inlineAttachmentChangeController];

  if (v6 == v5)
  {
    id v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController managedObjectContextChangeController:performUpdatesForManagedObjectIDs:]();
    }

    objc_opt_class();
    BOOL v9 = [(ICNoteEditorViewController *)self textView];
    id v10 = [v9 textStorage];
    int v11 = ICDynamicCast();

    objc_opt_class();
    BOOL v12 = [(ICNoteEditorViewController *)self textView];
    id v13 = [v12 textLayoutManager];
    char v14 = ICDynamicCast();

    objc_opt_class();
    id v15 = [v11 styler];
    id v16 = ICCheckedDynamicCast();

    if (ICInternalSettingsIsTextKit2Enabled()) {
      [v14 reloadInlineAttachments];
    }
    else {
      [v16 refreshTextStylingForTextStorage:v11 withTextController:v16];
    }
    id v17 = [(ICNoteEditorBaseViewController *)self note];
    id v18 = [v17 visibleAttachmentTextStoragesForTextLayoutManager:v14];
    id v19 = [v18 allValues];
    uint64_t v20 = objc_msgSend(v19, "ic_flatMap:", &__block_literal_global_574);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v16, "refreshTextStylingForTextStorage:withTextController:", *(void *)(*((void *)&v26 + 1) + 8 * v25++), v16, (void)v26);
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v23);
    }
  }
  else
  {
    id v7 = [(ICNoteEditorViewController *)self noteAndFolderChangeController];

    if (v7 == v5) {
      [(ICNoteEditorViewController *)self noteOrFolderChangedCallback];
    }
    else {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteEditorViewController managedObjectContextChangeController:performUpdatesForManagedObjectIDs:]" simulateCrash:1 showAlert:0 format:@"Need to update this method for a new change controller"];
    }
  }
}

uint64_t __101__ICNoteEditorViewController_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allObjects];
}

- (void)updateTextInputAccessoryViewForDidBeginEditing:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  id v6 = [(ICNoteEditorViewController *)self noteFormattingController];
  uint64_t v7 = [v6 view];
  if (v7)
  {
    id v8 = (void *)v7;
    BOOL v9 = [(ICNoteEditorViewController *)self styleSelectorInputViewShowing];

    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = [v4 inputAccessoryView];

  [v4 setInputAccessoryView:v5];
  if (!v10 && v5) {
    [v4 reloadInputViews];
  }
LABEL_8:
  int v11 = [(ICNoteEditorViewController *)self keyboardAnimateInFinishTime];

  if (v11)
  {
    BOOL v12 = [(ICNoteEditorViewController *)self keyboardAnimateInFinishTime];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    if (v14 <= 0.0 || v14 >= 0.5)
    {
      id v15 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v28 = v14;
        _os_log_impl(&dword_20BE60000, v15, OS_LOG_TYPE_DEFAULT, "Invalid keyboard animate in finish time interval: %g, falling back to default", buf, 0xCu);
      }

      double v14 = 0.1;
    }
    [(ICNoteEditorViewController *)self setKeyboardAnimateInFinishTime:0];
  }
  else
  {
    double v14 = 0.1;
  }
  if (![MEMORY[0x263F828A0] isInHardwareKeyboardMode]
    || ([MEMORY[0x263F82670] currentDevice],
        id v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 userInterfaceIdiom],
        v16,
        !v17))
  {
    if ([(ICNoteEditorViewController *)self inStartEditingForWritingTools]) {
      [v5 hide];
    }
    else {
      [v5 showWithDelay:v14];
    }
    if (![(ICNoteEditorViewController *)self hasKeyboardBeenVisibleBefore])
    {
      [(ICNoteEditorViewController *)self setHasKeyboardBeenVisibleBefore:1];
      id v18 = [(ICNoteEditorViewController *)self view];
      id v19 = [v18 window];
      [v19 frame];
      double v21 = v20;
      double v23 = v22;

      [(ICNoteEditorViewController *)self setShouldInputAccessoryViewButtonsBeVisible:v21 < v23];
    }
    if ([(ICNoteEditorViewController *)self inStartEditingForWritingTools])
    {
      [v5 setButtonsVisible:0];
      objc_msgSend(v5, "setSetButtonsVisibleWhenShown:", -[ICNoteEditorViewController shouldInputAccessoryViewButtonsBeVisible](self, "shouldInputAccessoryViewButtonsBeVisible"));
      if (!v5) {
        goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(v5, "setButtonsVisible:", -[ICNoteEditorViewController shouldInputAccessoryViewButtonsBeVisible](self, "shouldInputAccessoryViewButtonsBeVisible"));
      if (!v5)
      {
LABEL_28:
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __77__ICNoteEditorViewController_updateTextInputAccessoryViewForDidBeginEditing___block_invoke;
        v24[3] = &unk_2640B82D8;
        id v25 = v4;
        long long v26 = self;
        dispatch_async(MEMORY[0x263EF83A0], v24);

        goto LABEL_29;
      }
    }
    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
    goto LABEL_28;
  }
LABEL_29:
}

uint64_t __77__ICNoteEditorViewController_updateTextInputAccessoryViewForDidBeginEditing___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEditing];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) isEditingOnSecureScreen];
    if ((result & 1) == 0)
    {
      id v3 = *(void **)(a1 + 40);
      return [v3 showOrHideActivityStreamToolbarIfNeeded];
    }
  }
  return result;
}

- (void)updateTextInputAccessoryViewForDidEndEditing:(id)a3
{
  id v9 = a3;
  id v4 = [(ICNoteEditorViewController *)self textView];
  if (([v4 isFirstResponder] & 1) == 0)
  {
    id v5 = [(ICNoteEditorViewController *)self auxiliaryResponder];
    char v6 = [v5 isFirstResponder];

    if (v6) {
      goto LABEL_6;
    }
    id v4 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
    -[ICNoteEditorViewController setShouldInputAccessoryViewButtonsBeVisible:](self, "setShouldInputAccessoryViewButtonsBeVisible:", [v4 buttonsVisible]);
    [v4 setButtonsVisible:0];
    [v4 hide];
    uint64_t v7 = [(ICNoteEditorViewController *)self textView];
    [v7 setInputAccessoryView:0];

    id v8 = [(ICNoteEditorViewController *)self textView];

    if (v8 != v9) {
      [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
    }
  }

LABEL_6:
}

- (void)inputAccessoryDisclosureStateWillChange:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  char v5 = [v4 buttonsVisible];

  if ((v5 & 1) == 0)
  {
    [(ICNoteEditorViewController *)self resetBarButtonsAnimated:0];
  }
}

- (void)inputAccessoryDisclosureStateDidChange:(id)a3 tapped:(BOOL)a4
{
  BOOL v4 = a4;
  [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
  char v6 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
  uint64_t v7 = [v6 buttonsVisible];

  if (!v7)
  {
    if (!v4) {
      return;
    }
    goto LABEL_9;
  }
  id v8 = [(ICNoteEditorViewController *)self textView];
  [v8 selectedRange];
  uint64_t v10 = v9;

  if (!v10)
  {
    int v11 = [(ICNoteEditorViewController *)self textView];
    BOOL v12 = [(ICNoteEditorViewController *)self textView];
    double v13 = [v12 selectedTextRange];
    double v14 = [v13 end];
    [v11 caretRectForPosition:v14];
    CGFloat v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [(ICNoteEditorViewController *)self textView];
    [v23 bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    double v31 = v30;

    id v32 = [(ICNoteEditorViewController *)self textView];
    [v32 contentInset];
    CGFloat v34 = v31 - v33;

    double v39 = v16;
    v41.origin.double x = v16;
    v41.origin.double y = v18;
    v41.size.double width = v20;
    v41.size.double height = v22;
    double MaxY = CGRectGetMaxY(v41);
    v42.origin.double x = v25;
    v42.origin.double y = v27;
    v42.size.double width = v29;
    v42.size.double height = v34;
    double v36 = MaxY - CGRectGetMaxY(v42);
    if (v36 > 0.0)
    {
      [(ICNoteEditorViewController *)self inputAccessoryViewHeight];
      if (v36 < v22 + v37)
      {
        id v38 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v38, "scrollRectToVisible:animated:", 1, v39, v18, v20, v22);
      }
    }
  }
  if (v4)
  {
LABEL_9:
    [(ICNoteEditorViewController *)self setShouldInputAccessoryViewButtonsBeVisible:v7];
  }
}

- (void)notesContextRefreshNotification:(id)a3
{
  [(ICNoteEditorViewController *)self fetchAll];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v4 refreshNoteTextFromDataStore];
}

- (void)fetchAll
{
  id v3 = [(ICNoteEditorBaseViewController *)self note];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F5AC98];
    id v9 = [(ICNoteEditorBaseViewController *)self note];
    char v5 = [v9 identifier];
    char v6 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v7 = [v6 managedObjectContext];
    id v8 = (id)[v4 refreshAllOfNoteWithIdentifier:v5 context:v7];
  }
}

- (void)viewControllerWillStartEditModeNotification:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  id v4 = [v11 object];
  char v5 = ICDynamicCast();

  char v6 = objc_msgSend(v5, "ic_windowScene");
  uint64_t v7 = [(ICNoteEditorViewController *)self ic_windowScene];

  if (v6 == v7)
  {
    id v8 = [v11 object];
    if (v8 == self || ([(ICNoteEditorViewController *)self isEditing] & 1) == 0)
    {
    }
    else
    {
      id v9 = [MEMORY[0x263F5B520] sharedInstance];
      char v10 = [v9 isSecureScreenShowing];

      if ((v10 & 1) == 0) {
        [(ICNoteEditorViewController *)self setEditing:0 animated:1];
      }
    }
  }
}

- (void)submitChecklistAnalyticsEventForActionType:(int64_t)a3
{
  char v5 = [(ICNoteEditorViewController *)self textController];
  char v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = [v6 selectedRange];
  id v8 = [(ICNoteEditorViewController *)self textView];
  id v11 = [v5 analyticsInfoForChecklistAtIndex:v7 textView:v8];

  id v9 = [(ICNoteEditorViewController *)self eventReporter];
  char v10 = [(ICNoteEditorBaseViewController *)self note];
  objc_msgSend(v9, "submitChecklistUsageEventForModernNote:countOfCheckedItems:countOfTotalItems:checklistActionType:", v10, objc_msgSend(v11, "numberOfCheckedItems"), objc_msgSend(v11, "numberOfItems"), a3);
}

- (void)donateEditingIntentIfNecessary
{
  id v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v3 textStorage];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    if ([(ICNoteEditorViewController *)self isEditingNewNote])
    {
      char v6 = [(ICNoteEditorBaseViewController *)self note];
      uint64_t v7 = +[ICIntentsUtilities interactionForCreateNote:v6];
      +[ICIntentsUtilities donateInteraction:v7];
    }
    else
    {
      id v8 = [(ICNoteEditorViewController *)self originalEndOfNote];

      if (!v8) {
        goto LABEL_11;
      }
      id v9 = [(ICNoteEditorBaseViewController *)self note];
      char v10 = [v9 textStorage];
      id v11 = [v10 mergeableString];
      BOOL v12 = [(ICNoteEditorViewController *)self originalEndOfNote];
      char v6 = [v11 characterRangesForSelection:v12];

      double v13 = [v6 firstObject];
      unint64_t v14 = [v13 rangeValue];

      double v15 = [(ICNoteEditorBaseViewController *)self note];
      CGFloat v16 = [v15 textStorage];
      unint64_t v17 = [v16 length] - v14;

      if (v17 < 2) {
        goto LABEL_10;
      }
      double v18 = [(ICNoteEditorBaseViewController *)self note];
      double v19 = [v18 textStorage];
      unint64_t v20 = [v19 length];

      if (v14 >= v20) {
        goto LABEL_10;
      }
      double v21 = [(ICNoteEditorBaseViewController *)self note];
      double v22 = [v21 textStorage];
      double v23 = [v22 string];
      uint64_t v7 = objc_msgSend(v23, "substringWithRange:", v14, v17);

      if ([v7 hasPrefix:@"\n"])
      {
        uint64_t v24 = [v7 substringFromIndex:1];

        CGFloat v25 = [(ICNoteEditorBaseViewController *)self note];
        double v26 = +[ICIntentsUtilities interactionForAppendToNote:v25 withAppendedText:v24];
        +[ICIntentsUtilities donateInteraction:v26];

        uint64_t v7 = (void *)v24;
      }
    }

LABEL_10:
  }
LABEL_11:
  [(ICNoteEditorViewController *)self setIsEditingNewNote:0];

  [(ICNoteEditorViewController *)self setOriginalEndOfNote:0];
}

- (void)didEndEditingNote
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(ICNoteEditorViewController *)self isAddingImageAttachment];

    if (!v5)
    {
      [(ICNoteEditorViewController *)self saveNote];
      id v6 = [(ICNoteEditorViewController *)self bluetoothKeyboardHintViewController];
      [v6 didEditNote];
    }
  }
}

- (void)saveNote
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 note];
  id v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_20BE60000, a2, v5, "noteEditor saving note %@", v6);
}

- (void)saveInlineDrawings
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  id v3 = [v2 textStorage];

  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x263F814A0], 0, objc_msgSend(v3, "length"), 0, &__block_literal_global_580);
}

void __48__ICNoteEditorViewController_saveInlineDrawings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = v4;
  if (v4)
  {
    [v4 saveIfNeeded];
    id v3 = v4;
  }
}

- (void)updateInlineDrawings
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    id v3 = [(ICNoteEditorViewController *)self textView];
    id v4 = [v3 layoutManager];
    ICDynamicCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 updateInlineDrawingViews];
  }
}

- (id)attributedStringFromHTML:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v19 = *MEMORY[0x263F814D0];
  v20[0] = *MEMORY[0x263F81508];
  id v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v18 = 0;
  uint64_t v7 = (void *)[v5 initWithData:v4 options:v6 documentAttributes:0 error:&v18];
  id v8 = v18;

  if (v8)
  {
    NSLog(&cfstr_FailedToConver.isa, v8);
    id v9 = objc_alloc_init(MEMORY[0x263F089B8]);

    uint64_t v7 = v9;
  }
  if ([v3 rangeOfString:@"<meta name=\"Generator\" content=\"Cocoa HTML Writer\">"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__4;
    v16[4] = __Block_byref_object_dispose__4;
    id v17 = 0;
    uint64_t v10 = [v7 length];
    uint64_t v11 = *MEMORY[0x263F814F0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__ICNoteEditorViewController_attributedStringFromHTML___block_invoke;
    v13[3] = &unk_2640B9230;
    double v15 = v16;
    id v14 = v7;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 2, v13);

    _Block_object_dispose(v16, 8);
  }

  return v7;
}

uint64_t __55__ICNoteEditorViewController_attributedStringFromHTML___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a4 == 1)
  {
    id v10 = v7;
    uint64_t v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    BOOL v12 = *(void **)(v9 + 40);
    if (!v12) {
      goto LABEL_6;
    }
    id v14 = v8;
    [v12 pointSize];
    uint64_t v11 = objc_msgSend(v14, "fontWithSize:");
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F814F0], v11, a3, a4);
  }

LABEL_6:

  return MEMORY[0x270F9A758]();
}

- (_NSRange)visibleRange
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = v4;
  if (IsTextKit2Enabled)
  {
    id v6 = [v4 textLayoutManager];
    id v7 = [v6 textViewportLayoutController];
    id v8 = [v7 viewportRange];

    uint64_t v9 = [(ICNoteEditorViewController *)self textView];
    id v10 = [v9 textLayoutManager];
    uint64_t v11 = objc_msgSend(v10, "ic_rangeForTextRange:", v8);
    uint64_t v13 = v12;
  }
  else
  {
    id v14 = [v4 textStorage];
    uint64_t v11 = [v14 length];

    if (!v11)
    {
      uint64_t v13 = 0;
      goto LABEL_7;
    }
    double v15 = [(ICNoteEditorViewController *)self textView];
    [v15 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    uint64_t v24 = [(ICNoteEditorViewController *)self textView];
    CGFloat v25 = [(ICNoteEditorViewController *)self textView];
    [v25 bounds];
    double v26 = objc_msgSend(v24, "characterRangeAtPoint:");
    id v8 = [v26 start];

    CGFloat v27 = [(ICNoteEditorViewController *)self textView];
    v36.origin.double x = v17;
    v36.origin.double y = v19;
    v36.size.double width = v21;
    v36.size.double height = v23;
    double MaxX = CGRectGetMaxX(v36);
    v37.origin.double x = v17;
    v37.origin.double y = v19;
    v37.size.double width = v21;
    v37.size.double height = v23;
    CGFloat v29 = objc_msgSend(v27, "characterRangeAtPoint:", MaxX, CGRectGetMaxY(v37));
    uint64_t v9 = [v29 end];

    double v30 = [(ICNoteEditorViewController *)self textView];
    double v31 = [(ICNoteEditorViewController *)self textView];
    id v32 = [v31 beginningOfDocument];
    uint64_t v11 = [v30 offsetFromPosition:v32 toPosition:v8];

    id v10 = [(ICNoteEditorViewController *)self textView];
    uint64_t v13 = [v10 offsetFromPosition:v8 toPosition:v9];
  }

LABEL_7:
  NSUInteger v33 = v11;
  NSUInteger v34 = v13;
  result.NSUInteger length = v34;
  result.NSUInteger location = v33;
  return result;
}

- (id)linkForSelection
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x3032000000;
  CGFloat v25 = __Block_byref_object_copy__4;
  double v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  id v3 = [(ICNoteEditorViewController *)self textView];
  unint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  if (v6)
  {
    id v7 = [(ICNoteEditorViewController *)self textView];
    id v8 = [v7 textStorage];
    uint64_t v9 = *MEMORY[0x263F81520];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __46__ICNoteEditorViewController_linkForSelection__block_invoke;
    v21[3] = &unk_2640B80C8;
    v21[4] = &v22;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, v4, v6, 0, v21);
  }
  else
  {
    id v10 = [(ICNoteEditorViewController *)self textView];
    uint64_t v11 = [v10 textStorage];
    BOOL v12 = v4 < [v11 length];

    if (!v12) {
      goto LABEL_6;
    }
    id v7 = [(ICNoteEditorViewController *)self textView];
    id v8 = [v7 textStorage];
    uint64_t v13 = [v8 attribute:*MEMORY[0x263F81520] atIndex:v4 effectiveRange:0];
    id v14 = (void *)v23[5];
    void v23[5] = v13;
  }
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = (id)v23[5];
LABEL_10:
    double v16 = v15;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [NSURL URLWithString:v23[5]];
    goto LABEL_10;
  }
  if (v23[5])
  {
    CGFloat v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = (objc_class *)objc_opt_class();
      CGFloat v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412290;
      CGFloat v29 = v19;
      _os_log_impl(&dword_20BE60000, v17, OS_LOG_TYPE_DEFAULT, "Cannot convert link attribute of type %@ to an NSURL", buf, 0xCu);
    }
  }
  double v16 = 0;
LABEL_16:
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __46__ICNoteEditorViewController_linkForSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if (v8)
  {
    id v13 = v8;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v12 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    uint64_t v11 = v12;
    if (v12)
    {
      id *v10 = 0;

      *a5 = 1;
    }
    else
    {
      objc_storeStrong(v10, a2);
    }
    id v8 = v13;
  }
}

- (BOOL)canFindInNote
{
  id v3 = [(ICNoteEditorBaseViewController *)self note];
  if (v3)
  {
    unint64_t v4 = [(ICNoteEditorBaseViewController *)self note];
    if ([v4 isPasswordProtectedAndLocked])
    {
      char v5 = 0;
    }
    else
    {
      uint64_t v6 = [(ICNoteEditorViewController *)self invitation];
      if (v6) {
        char v5 = 0;
      }
      else {
        char v5 = [(ICNoteEditorViewController *)self ic_isViewVisible];
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canOpenLink
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isLocked")) {
    return 0;
  }
  unint64_t v4 = [(ICNoteEditorViewController *)self linkForSelection];
  if (v4) {
    BOOL v3 = +[ICExtensionSafeAPIShims canOpenURL:v4];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ICNoteEditorViewController *)self viewControllerManager];
  id v8 = [v7 window];
  uint64_t v9 = objc_msgSend(v8, "ic_topmostPresentedViewController");

  id v10 = (void *)MEMORY[0x263F08D40];
  uint64_t v11 = [(ICNoteEditorViewController *)self textView];
  uint64_t v12 = [v11 selectedRange];
  id v14 = objc_msgSend(v10, "valueWithRange:", v12, v13);
  v51[0] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];

  if (sel_decreaseIndentation_ == a3 || sel_increaseIndentation_ == a3)
  {
    double v20 = [(ICNoteEditorViewController *)self textView];
    if ([v20 isEditing])
    {
      LOBYTE(v18) = [(ICNoteEditorViewController *)self canIndentLeft]
                 || [(ICNoteEditorViewController *)self canIndentRight];
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  if (sel_checkAll_ == a3)
  {
    double v20 = [(ICNoteEditorViewController *)self textController];
    CGFloat v21 = [(ICNoteEditorViewController *)self textView];
    uint64_t v22 = v20;
    uint64_t v23 = 0;
LABEL_35:
    LOBYTE(v18) = [v22 checklistItemExistsMarkedCompleted:v23 inTextView:v21 forRanges:v15];
LABEL_36:

LABEL_53:
    goto LABEL_54;
  }
  if (sel_uncheckAll_ == a3)
  {
    double v20 = [(ICNoteEditorViewController *)self textController];
    CGFloat v21 = [(ICNoteEditorViewController *)self textView];
    uint64_t v22 = v20;
    uint64_t v23 = 1;
    goto LABEL_35;
  }
  if (sel_removeChecked_ == a3)
  {
    uint64_t v24 = [(ICNoteEditorViewController *)self textController];
    CGFloat v25 = [(ICNoteEditorViewController *)self textView];
    char v26 = [v24 checklistItemExistsMarkedCompleted:1 inTextView:v25 forRanges:v15];

    id v27 = [(ICNoteEditorViewController *)self textController];
    double v18 = [(ICNoteEditorViewController *)self textView];
    double v28 = [(ICNoteEditorViewController *)self textView];
    uint64_t v29 = [v28 selectedRange];
    char v31 = objc_msgSend(v27, "containsOnlyChecklistItemsInTextView:forRange:", v18, v29, v30);

    LOBYTE(v18) = v26 & v31;
    goto LABEL_54;
  }
  if (sel_moveCheckedToBottom_ == a3)
  {
    id v32 = [(ICNoteEditorViewController *)self textController];
    NSUInteger v33 = [(ICNoteEditorViewController *)self textView];
    char v34 = [v32 checklistItemExistsMarkedCompleted:0 inTextView:v33 forRanges:v15];

    uint64_t v35 = [(ICNoteEditorViewController *)self textController];
    CGRect v36 = [(ICNoteEditorViewController *)self textView];
    uint64_t v37 = [(ICNoteEditorViewController *)self textView];
    uint64_t v38 = [(id)v37 selectedRange];
    char v40 = objc_msgSend(v35, "canMoveCheckedChecklistsToBottomInTextView:forRange:", v36, v38, v39);

    double v18 = [(ICNoteEditorViewController *)self textController];
    CGRect v41 = [(ICNoteEditorViewController *)self textView];
    CGRect v42 = [(ICNoteEditorViewController *)self textView];
    uint64_t v43 = [v42 selectedRange];
    LOBYTE(v37) = objc_msgSend(v18, "containsOnlyChecklistItemsInTextView:forRange:", v41, v43, v44);

    LOBYTE(v18) = v34 & v40 & v37;
    goto LABEL_54;
  }
  if (sel_performFindInNote_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canFindInNote];
    goto LABEL_40;
  }
  if (v9
    || ([(ICNoteEditorViewController *)self textView],
        double v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEditing],
        v16,
        !v17))
  {
LABEL_59:
    LOBYTE(v18) = 0;
    goto LABEL_54;
  }
  if (sel_moveSelectedListItemUp_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canMoveSelectedListItemUp];
    goto LABEL_40;
  }
  if (sel_moveSelectedListItemDown_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canMoveSelectedListItemDown];
    goto LABEL_40;
  }
  if (sel_openLink_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canOpenLink];
    goto LABEL_40;
  }
  LOBYTE(v18) = 1;
  if (sel_tab_ == a3 || sel_shiftTab_ == a3 || sel_shiftReturn_ == a3 || sel_strikethrough_ == a3) {
    goto LABEL_54;
  }
  if (sel_indentLeft_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canIndentLeft];
    goto LABEL_40;
  }
  if (sel_indentRight_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canIndentRight];
    goto LABEL_40;
  }
  if (sel_copy_ == a3 || sel_cut_ == a3)
  {
    v50.receiver = self;
    v50.super_class = (Class)ICNoteEditorViewController;
    if ([(ICNoteEditorViewController *)&v50 canPerformAction:a3 withSender:v6])
    {
      uint64_t v45 = [(ICNoteEditorViewController *)self textView];
      LOBYTE(v18) = [v45 isSelectionCopyableSize];
      goto LABEL_48;
    }
    goto LABEL_59;
  }
  if (sel__share_ == a3)
  {
    v49.receiver = self;
    v49.super_class = (Class)ICNoteEditorViewController;
    if (![(ICNoteEditorViewController *)&v49 canPerformAction:a3 withSender:v6]) {
      goto LABEL_59;
    }
    double v20 = [(ICNoteEditorViewController *)self textView];
    if ([v20 isSelectionCopyableSize])
    {
      CGFloat v21 = [(ICNoteEditorViewController *)self textView];
      LODWORD(v18) = objc_msgSend(v21, "ic_isInSecureWindow") ^ 1;
      goto LABEL_36;
    }
LABEL_52:
    LOBYTE(v18) = 0;
    goto LABEL_53;
  }
  if (sel_addToTags_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canAddToTags];
    goto LABEL_40;
  }
  if (sel_convertToText_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canConvertToText];
    goto LABEL_40;
  }
  if (sel_convertToTag_ == a3)
  {
    unsigned __int8 v19 = [(ICNoteEditorViewController *)self canConvertToTag];
    goto LABEL_40;
  }
  if (sel_openLinkEditor_ == a3)
  {
    if (![(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
    {
      uint64_t v45 = [(ICNoteEditorBaseViewController *)self note];
      LODWORD(v18) = [v45 isSharedReadOnly] ^ 1;
      goto LABEL_48;
    }
    goto LABEL_59;
  }
  if (sel_toggleBlockQuote_ != a3)
  {
    if (sel_createImage_ != a3)
    {
      v48.receiver = self;
      v48.super_class = (Class)ICNoteEditorViewController;
      unsigned __int8 v19 = [(ICNoteEditorViewController *)&v48 canPerformAction:a3 withSender:v6];
LABEL_40:
      LOBYTE(v18) = v19;
      goto LABEL_54;
    }
    if ([(ICNoteEditorViewController *)self canPerformCreateImageWithSelection]) {
      goto LABEL_54;
    }
    uint64_t v45 = [(ICNoteEditorViewController *)self textView];
    [v45 selectedRange];
    LOBYTE(v18) = v47 == 0;
LABEL_48:
  }
LABEL_54:

  return (char)v18;
}

- (OS_dispatch_queue)userActivityUpdateQueue
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userActivityUpdateQueue)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.user-activity", v3);
    userActivityUpdateQueue = v2->_userActivityUpdateQueue;
    v2->_userActivityUpdateQueue = (OS_dispatch_queue *)v4;
  }
  objc_sync_exit(v2);

  id v6 = v2->_userActivityUpdateQueue;

  return v6;
}

- (void)updateNoteUserActivityState
{
  v71[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
  [v3 cancelPreviousFireRequests];

  dispatch_queue_t v4 = [(ICNoteEditorBaseViewController *)self note];

  if (v4)
  {
    char v5 = [(ICNoteEditorViewController *)self noteUserActivity];
    if (v5)
    {
    }
    else
    {
      id v6 = [(ICNoteEditorBaseViewController *)self note];
      char v7 = [v6 isEmpty];

      if (v7) {
        return;
      }
    }
    if ([(ICNoteEditorViewController *)self isDrawingStroke])
    {
      id v59 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
      [v59 requestFire];
    }
    else
    {
      id v8 = [(ICNoteEditorViewController *)self noteUserActivity];

      if (!v8)
      {
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:@"com.apple.notes.activity.edit-note"];
        [v9 setEligibleForSearch:1];
        id v10 = [(ICNoteEditorBaseViewController *)self note];
        uint64_t v11 = [v10 title];
        uint64_t v12 = [v11 localizeForLanguage:0];
        [v9 setTitle:v12];

        [v9 setDelegate:self];
        [(ICNoteEditorViewController *)self setNoteUserActivity:v9];
        uint64_t v13 = [(ICNoteEditorViewController *)self noteUserActivity];
        [v13 becomeCurrent];
      }
      id v14 = [(ICNoteEditorBaseViewController *)self note];
      id v60 = [v14 objectID];

      char v58 = [(ICNoteEditorViewController *)self isEditing];
      id v15 = [(ICNoteEditorBaseViewController *)self note];
      double v16 = [v15 textStorage];
      int v17 = [v16 mergeableString];
      double v18 = (void *)MEMORY[0x263F08D40];
      unsigned __int8 v19 = [(ICNoteEditorViewController *)self textView];
      uint64_t v20 = [v19 selectedRange];
      uint64_t v22 = objc_msgSend(v18, "valueWithRange:", v20, v21);
      v71[0] = v22;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:1];
      uint64_t v24 = [v17 selectionForCharacterRanges:v23];
      uint64_t v57 = [v24 serialize];

      CGFloat v25 = [(ICNoteEditorViewController *)self textView];
      [v25 bounds];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        char v34 = [(ICNoteEditorViewController *)self textView];
        uint64_t v35 = [v34 layoutManager];
        CGRect v36 = [(ICNoteEditorViewController *)self textView];
        uint64_t v37 = [v36 textContainer];
        objc_msgSend(v35, "ensureLayoutForBoundingRect:inTextContainer:", v37, v27, v29, v31, v33);
      }
      uint64_t v38 = [(ICNoteEditorViewController *)self visibleRange];
      uint64_t v40 = v39;
      CGRect v41 = [(ICNoteEditorBaseViewController *)self note];
      CGRect v42 = [v41 textStorage];
      uint64_t v43 = [v42 mergeableString];
      uint64_t v44 = (void *)MEMORY[0x263F08D40];
      uint64_t v45 = [(ICNoteEditorViewController *)self visibleRange];
      uint64_t v47 = objc_msgSend(v44, "valueWithRange:", v45, v46);
      v70 = v47;
      objc_super v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
      objc_super v49 = [v43 selectionForCharacterRanges:v48];
      objc_super v50 = [v49 serialize];

      long long v51 = [(ICNoteEditorViewController *)self currentScrollState];
      unint64_t v52 = [(ICNoteEditorViewController *)self userActivityUpdateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke;
      block[3] = &unk_2640B9280;
      char v69 = v58;
      id v62 = v60;
      id v63 = v57;
      uint64_t v67 = v38;
      uint64_t v68 = v40;
      id v64 = v51;
      id v65 = v50;
      uint64_t v66 = self;
      id v53 = v50;
      id v54 = v51;
      id v55 = v57;
      id v56 = v60;
      dispatch_async(v52, block);
    }
  }
}

void __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x263F5ACA0] sharedContext];
    BOOL v3 = [v2 workerManagedObjectContext];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke_2;
    v7[3] = &unk_2640B9258;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    char v15 = *(unsigned char *)(a1 + 88);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    long long v14 = *(_OWORD *)(a1 + 72);
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v12 = v4;
    uint64_t v13 = v5;
    id v6 = v3;
    [v6 performBlockAndWait:v7];
  }
}

void __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x263F5AC98], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v2)
  {
    id v9 = v2;
    BOOL v3 = [[ICNoteUserActivityState alloc] initWithNote:v2];
    [(ICNoteUserActivityState *)v3 setEditing:*(unsigned __int8 *)(a1 + 96)];
    if (*(unsigned char *)(a1 + 96))
    {
      id v4 = [MEMORY[0x263EFF910] date];
      [(ICNoteUserActivityState *)v3 setModificationDate:v4];
    }
    [(ICNoteUserActivityState *)v3 setSelectionRangeData:*(void *)(a1 + 48)];
    [(ICNoteUserActivityState *)v3 setScrollState:*(void *)(a1 + 56)];
    -[ICNoteUserActivityState setVisibleRange:](v3, "setVisibleRange:", *(void *)(a1 + 80), *(void *)(a1 + 88));
    [(ICNoteUserActivityState *)v3 setVisibleRangeData:*(void *)(a1 + 64)];
    [*(id *)(a1 + 72) setNoteUserActivityState:v3];
    BOOL CanContinueActivityForNote = ICNotesCanContinueActivityForNote(v9);
    id v6 = [*(id *)(a1 + 72) noteUserActivity];
    [v6 setEligibleForHandoff:CanContinueActivityForNote];

    char v7 = [*(id *)(a1 + 72) noteUserActivity];
    [v7 setSupportsContinuationStreams:CanContinueActivityForNote];

    id v8 = [*(id *)(a1 + 72) noteUserActivity];
    [v8 setNeedsSave:1];

    id v2 = v9;
  }
}

- (void)removeCurrentScrollState
{
  id v5 = [(ICNoteEditorViewController *)self savedScrollStates];
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v3 identifier];
  objc_msgSend(v5, "ic_removeObjectForNonNilKey:", v4);
}

- (ICTextViewScrollState)currentScrollState
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  BOOL v3 = +[ICTextViewScrollState scrollStateForTextView:v2];

  return (ICTextViewScrollState *)v3;
}

void __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void **)(v1 + 1464);
  if (v2 == *(void **)(result + 40))
  {
    uint64_t v3 = result;
    *(void *)(v1 + 1464) = 0;

    id v4 = *(void **)(v3 + 32);
    return [v4 setShouldOverscrollScrollState:0];
  }
  return result;
}

void __57__ICNoteEditorViewController_applyScrollStateIfAvailable__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) archivedScrollStateToApply];
  uint64_t v2 = [v6 note];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)handleMenuBarButtonTap:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 view];

  ICDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v5 = [v7 contextMenuInteraction];
  id v6 = ICDynamicCast();

  objc_msgSend(v6, "_presentMenuAtLocation:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)updateParticipantsInDrawings
{
}

void __58__ICNoteEditorViewController_updateParticipantsInDrawings__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) note];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) textView];
    id v4 = [v3 textStorage];
  }
  else
  {
    id v4 = 0;
  }

  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x263F814A0], 0, objc_msgSend(v4, "length"), 0, &__block_literal_global_653);
}

void __58__ICNoteEditorViewController_updateParticipantsInDrawings__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v4 = objc_msgSend(v3, "attachmentViews", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
            [*(id *)(*((void *)&v9 + 1) + 8 * v8++) updateAllPossibleParticipantNameTokens];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v10 = [(ICNoteEditorViewController *)self backgroundView];
  [v10 updateContentViewBezelsStandalone:v9 needsAdditionalBottomMargin:v8 needsAdditionalLeadingMargin:v7 force:v6];
}

- (void)submitNoteViewEventForModernNote:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__4;
    void v13[4] = __Block_byref_object_dispose__4;
    id v14 = 0;
    uint64_t v5 = [v4 managedObjectContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke;
    v9[3] = &unk_2640B92D0;
    v9[4] = self;
    long long v12 = v13;
    id v6 = v5;
    id v10 = v6;
    id v7 = v4;
    id v11 = v7;
    [v6 performBlockAndWait:v9];
    [(ICNoteEditorViewController *)self setNoteViewEventSourceObjectID:0];
    id v8 = v7;
    performBlockOnMainThread();

    _Block_object_dispose(v13, 8);
  }
}

uint64_t __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) noteViewEventSourceObjectID];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F5AC98];
    id v4 = [*(id *)(a1 + 32) noteViewEventSourceObjectID];
    uint64_t v5 = objc_msgSend(v3, "ic_existingObjectWithID:context:", v4, *(void *)(a1 + 40));
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = [*(id *)(a1 + 32) eventReporter];
  objc_msgSend(v8, "submitNoteViewEventForModernNote:referringNote:collapsibleSectionAffordanceExposures:collapsibleSectionAffordanceUsages:", *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), objc_msgSend(*(id *)(a1 + 32), "uniqueCollapsibleSectionAffordanceExposures"), objc_msgSend(*(id *)(a1 + 32), "uniqueCollapsibleSectionAffordanceUsages"));

  BOOL v9 = *(void **)(a1 + 32);

  return [v9 resetCollapsibleSectionAffordanceUsageData];
}

void __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  id v3 = [*(id *)(a1 + 40) note];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    uint64_t v5 = *MEMORY[0x263F814A0];
    uint64_t v6 = [v2 length];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_3;
    v9[3] = &unk_2640B8C78;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v9);
  }
}

uint64_t __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  uint64_t v12 = ICDynamicCast();

  if (v12)
  {
    id v7 = [*(id *)(a1 + 32) attachmentViewForTextAttachment:v12 characterIndex:a3];
    objc_opt_class();
    int8x16_t v8 = ICClassAndProtocolCast();

    if (v8)
    {
      BOOL v9 = objc_msgSend(v8, "paperDocumentEngagementData", &unk_26C1B5720);
      if ([v9 hasActivity])
      {
        int8x16_t v10 = [*(id *)(a1 + 32) eventReporter];
        [v10 submitPDFWorkflowEngagementSummary:v9 modernNote:*(void *)(a1 + 40)];
      }
      [v8 resetPaperDocumentEngagementData];
    }
  }

  return MEMORY[0x270F9A790](v6);
}

- (void)audioBarViewControllerDone:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self audioBarViewController];

  if (v5 == v4) {
    [(ICNoteEditorViewController *)self setAudioBarViewController:0];
  }

  [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:0];
}

- (void)styleSelector:(id)a3 didSelectStyle:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setIsSettingStyleWithStyleUI:1];

  [(ICNoteEditorViewController *)self setCurrentTextStyle:v4];
  objc_msgSend(v6, "setCurrentBIUS:", -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"));

  int8x16_t v8 = [(ICNoteEditorViewController *)self textView];
  [v8 setIsSettingStyleWithStyleUI:0];

  BOOL v9 = (void *)topoTextStylesToAnalyticsStyles;
  int8x16_t v10 = [NSNumber numberWithUnsignedInt:v4];
  id v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 integerValue];

  if (v12)
  {
    id v14 = [(ICNoteEditorViewController *)self eventReporter];
    uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
    [v14 submitStyleFormatEventForModernNote:v13 styleTypeValue:v12];
  }
}

- (void)toggleBlockQuote:(id)a3
{
  uint64_t v4 = [(ICNoteEditorViewController *)self textController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  [v4 toggleBlockQuoteInTextView:v5];

  id v6 = [(ICNoteEditorViewController *)self textView];
  id v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = objc_msgSend(v7, "ic_visibleRange");
  objc_msgSend(v6, "updateStyleLayersInRange:", v8, v9);

  int8x16_t v10 = [(ICNoteEditorViewController *)self textView];
  [v10 setNeedsLayout];

  id v11 = [(ICNoteEditorViewController *)self textView];
  [v11 layoutIfNeeded];

  id v13 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v12 = [(ICNoteEditorBaseViewController *)self note];
  [v13 submitStyleFormatEventForModernNote:v12 styleTypeValue:15];
}

- (void)toggleEmphasis
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  [v3 selectedRange];
  uint64_t v5 = v4;

  id v6 = [(ICNoteEditorViewController *)self textView];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 textStorage];
    uint64_t v9 = *MEMORY[0x263F5AB10];
    int8x16_t v10 = [(ICNoteEditorViewController *)self textView];
    id v11 = [(ICNoteEditorViewController *)self textView];
    uint64_t v12 = [v11 selectedRange];
    id v14 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v9, objc_msgSend(v10, "firstValidEmphasisLocationWithinSelection:", v12, v13), 0);
    int v15 = [v14 intValue];
  }
  else
  {
    double v16 = [v6 typingAttributes];
    int v17 = (void *)MEMORY[0x263F5AB10];
    double v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];
    int v15 = [v18 intValue];

    unsigned __int8 v19 = [(ICNoteEditorViewController *)self textView];
    uint64_t v20 = [v19 typingAttributes];
    id v7 = (void *)[v20 mutableCopy];

    if (v15)
    {
      [v7 setObject:0 forKeyedSubscript:*v17];
    }
    else
    {
      uint64_t v21 = [NSNumber numberWithInteger:ic_currentEmphasisColorTypeDefault()];
      [v7 setObject:v21 forKeyedSubscript:*v17];
    }
    uint64_t v8 = (void *)[v7 copy];
    int8x16_t v10 = [(ICNoteEditorViewController *)self textView];
    [v10 setTypingAttributes:v8];
  }

  uint64_t v22 = [(ICNoteEditorViewController *)self textView];
  if (v15) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = ic_currentEmphasisColorTypeDefault();
  }
  objc_msgSend(v22, "ic_toggleEmphasisWithType:", v23);

  id v25 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v24 = [(ICNoteEditorBaseViewController *)self note];
  [v25 submitStyleFormatEventForModernNote:v24 styleTypeValue:16];
}

- (void)toggleEmphasisWithType:(int64_t)a3
{
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  [v5 selectedRange];
  uint64_t v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [(ICNoteEditorViewController *)self textView];
    uint64_t v9 = [v8 typingAttributes];
    int8x16_t v10 = (void *)[v9 mutableCopy];

    if (a3)
    {
      id v11 = [NSNumber numberWithInteger:a3];
      [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F5AB10]];
    }
    else
    {
      [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F5AB10]];
    }
    uint64_t v12 = (void *)[v10 copy];
    uint64_t v13 = [(ICNoteEditorViewController *)self textView];
    [v13 setTypingAttributes:v12];
  }
  if (a3 && ic_currentEmphasisColorTypeDefault() != a3) {
    ic_setCurrentEmphasisColorTypeDefault();
  }
  id v14 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v14, "ic_toggleEmphasisWithType:", a3);

  id v16 = [(ICNoteEditorViewController *)self eventReporter];
  int v15 = [(ICNoteEditorBaseViewController *)self note];
  [v16 submitStyleFormatEventForModernNote:v15 styleTypeValue:16];
}

- (void)styleSelector:(id)a3 didChangeIndentAmount:(int64_t)a4
{
  uint64_t v6 = [(ICNoteEditorViewController *)self textView];
  [v6 setIsSettingStyleWithStyleUI:1];

  [(ICNoteEditorViewController *)self indentSelectionIfPossibleByAmount:a4];
  id v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setIsSettingStyleWithStyleUI:0];
}

- (void)styleSelectorDidIndentLeft:(id)a3
{
  id v4 = a3;
  if ([(ICNoteEditorViewController *)self currentWritingDirection] == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = -1;
  }
  [(ICNoteEditorViewController *)self styleSelector:v4 didChangeIndentAmount:v5];

  if ([(ICNoteEditorViewController *)self currentWritingDirection]) {
    uint64_t v6 = 13;
  }
  else {
    uint64_t v6 = 14;
  }
  id v8 = [(ICNoteEditorViewController *)self eventReporter];
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  [v8 submitStyleFormatEventForModernNote:v7 styleTypeValue:v6];
}

- (void)styleSelectorDidIndentRight:(id)a3
{
  id v4 = a3;
  if ([(ICNoteEditorViewController *)self currentWritingDirection] == 1) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 1;
  }
  [(ICNoteEditorViewController *)self styleSelector:v4 didChangeIndentAmount:v5];

  if ([(ICNoteEditorViewController *)self currentWritingDirection]) {
    uint64_t v6 = 14;
  }
  else {
    uint64_t v6 = 13;
  }
  id v8 = [(ICNoteEditorViewController *)self eventReporter];
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  [v8 submitStyleFormatEventForModernNote:v7 styleTypeValue:v6];
}

- (void)toggleBoldface
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 toggleBoldface:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_toggleBoldface");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:9];
}

- (void)enableBoldface
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 enableBoldface:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_enableBoldface");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:9];
}

- (void)disableBoldface
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 disableBoldface:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_disableBoldface");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:9];
}

- (void)toggleItalics
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 toggleItalics:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_toggleItalics");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:10];
}

- (void)enableItalics
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 enableItalics:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_enableItalics");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:10];
}

- (void)disableItalics
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 disableItalics:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_disableItalics");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:10];
}

- (void)toggleUnderline
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 toggleUnderline:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_toggleUnderline");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:11];
}

- (void)enableUnderline
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 enableUnderline:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_enableUnderline");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:11];
}

- (void)disableUnderline
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 disableUnderline:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_disableUnderline");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:11];
}

- (void)toggleStrikethrough
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 toggleStrikethrough:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_toggleStrikethrough");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:12];
}

- (void)enableStrikethrough
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 enableStrikethrough:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_enableStrikethrough");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:12];
}

- (void)disableStrikethrough
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v4 disableStrikethrough:self];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v4, "ic_disableStrikethrough");
  }

  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitStyleFormatEventForModernNote:v5 styleTypeValue:12];
}

- (void)styleSelector:(id)a3 toggleBIUS:(unint64_t)a4
{
  id v6 = a3;
  [(ICNoteEditorViewController *)self toggleBIUS:a4 sender:v6];
  objc_msgSend(v6, "setCurrentBIUS:", -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"));
}

- (void)styleSelectorDidCancel:(id)a3
{
  [(ICNoteEditorViewController *)self showStyleSelector:0 animated:1];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  id v7 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
  uint64_t v5 = [v7 styleBarButtonItem];
  id v6 = [v5 view];
  UIAccessibilityPostNotification(v4, v6);
}

- (BOOL)styleSelectorShouldDisableTextStyles:(id)a3
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  char v4 = objc_msgSend(v3, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

  return v4;
}

- (void)styleSelector:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  [(ICNoteEditorViewController *)self doneEditing:0];
  [(ICNoteEditorViewController *)self presentViewController:v10 animated:v6 completion:v9];
}

- (void)styleSelectorWillShowInlineMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self currentStylesForStyleSelectorIgnoreTypingAttributes:0];
  objc_msgSend(v4, "setCurrentStyles:bius:animated:", v5, -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"), 0);
}

- (BOOL)styleSelectorShouldUseCompactTopInset:(id)a3
{
  if ([(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPad]) {
    return 1;
  }
  id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
  char v6 = [v5 hasCompactWidth];

  return v6;
}

- (id)currentStylesForStyleSelectorIgnoreTypingAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
  if (v5)
  {
    char v6 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v6 selectedStyles];
  }
  else
  {
    char v6 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v6, "ic_selectedStylesIgnoreTypingAttributes:", v3);
  id v7 = };

  return v7;
}

- (unint64_t)currentBIUSForStyleSelector
{
  BOOL v3 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (!v3)
  {
    char v6 = [(ICNoteEditorViewController *)self textView];
    uint64_t v7 = [v6 selectedRange];
    uint64_t v9 = v8;

    id v10 = [(ICNoteEditorViewController *)self textView];
    if (v9)
    {
      id v11 = [v10 textStorage];
      id v4 = objc_msgSend(v11, "attributesAtIndex:longestEffectiveRange:inRange:", v7, 0, v7, v9);
    }
    else
    {
      id v4 = [v10 typingAttributes];
    }

    uint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
    uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
    int v14 = [v13 intValue];

    int v15 = [v12 fontDescriptor];
    unsigned int v16 = [v15 symbolicTraits];

    int v17 = v14 | (v16 >> 1);
    double v18 = [v12 fontDescriptor];
    LOBYTE(v16) = [v18 symbolicTraits];

    unint64_t v19 = (v14 | (2 * v16)) & 2 | v17 & 1u;
    uint64_t v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F815F8]];
    uint64_t v21 = [v20 integerValue];

    if (v21) {
      unint64_t v5 = v19 | 4;
    }
    else {
      unint64_t v5 = v19;
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:*MEMORY[0x263F81570]];
    if ([v22 integerValue])
    {
    }
    else
    {
      uint64_t v23 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5AB30]];
      int v24 = [v23 BOOLValue];

      if (!v24) {
        goto LABEL_13;
      }
    }
    v5 |= 8uLL;
LABEL_13:
    id v25 = (void *)MEMORY[0x263F5AB10];
    double v26 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];
    if ([v26 integerValue])
    {
    }
    else
    {
      double v27 = [v4 objectForKeyedSubscript:*v25];
      int v28 = [v27 BOOLValue];

      if (!v28)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    v5 |= 0x10uLL;
    goto LABEL_17;
  }
  id v4 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
  unint64_t v5 = [v4 selectedStyleBIUS];
LABEL_18:

  return v5;
}

- (int64_t)currentEmphasisType
{
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  [v3 selectedRange];
  uint64_t v5 = v4;

  char v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 textStorage];
    uint64_t v9 = *MEMORY[0x263F5AB10];
    id v10 = [(ICNoteEditorViewController *)self textView];
    id v11 = [(ICNoteEditorViewController *)self textView];
    uint64_t v12 = [v11 selectedRange];
    int v14 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v9, objc_msgSend(v10, "firstValidEmphasisLocationWithinSelection:", v12, v13), 0);
    [v14 intValue];
  }
  else
  {
    uint64_t v8 = [v6 typingAttributes];
    id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];
    [v10 intValue];
  }

  return ICEmphasisColorTypeForTag();
}

- (BOOL)isBlockQuoteSet
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 textStorage];
  uint64_t v5 = [v4 string];
  char v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = [v6 selectedRange];
  int v9 = objc_msgSend(v5, "ic_rangeIsValid:", v7, v8);

  if (v9)
  {
    id v10 = [(ICNoteEditorViewController *)self textView];
    id v11 = [v10 textStorage];
    uint64_t v12 = [v11 string];
    uint64_t v13 = [(ICNoteEditorViewController *)self textView];
    uint64_t v14 = [v13 selectedRange];
    uint64_t v16 = objc_msgSend(v12, "paragraphRangeForRange:", v14, v15);
    uint64_t v18 = v17;

    unint64_t v19 = [(ICNoteEditorViewController *)self textStorage];
    uint64_t v20 = *MEMORY[0x263F5AB28];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__ICNoteEditorViewController_isBlockQuoteSet__block_invoke;
    v23[3] = &unk_2640B80C8;
    v23[4] = &v24;
    objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v16, v18, 0, v23);
  }
  char v21 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v21;
}

uint64_t __45__ICNoteEditorViewController_isBlockQuoteSet__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  int v9 = ICDynamicCast();

  if (v9 && [v9 isBlockQuote])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)isOnlyBlockQuoteEnabled
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  char v3 = objc_msgSend(v2, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

  return v3;
}

- (ICNoteFormattingViewController)noteFormattingControllerCreateIfNecessary
{
  char v3 = [(ICNoteEditorViewController *)self noteFormattingController];

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(ICNoteFormattingViewController);
    [(ICNoteEditorViewController *)self setNoteFormattingController:v4];

    uint64_t v5 = [(ICNoteEditorViewController *)self noteFormattingController];
    [v5 setFormattingDelegate:self];
  }
  char v6 = [(ICNoteEditorViewController *)self noteFormattingController];

  return (ICNoteFormattingViewController *)v6;
}

- (void)showStyleSelectorPopover:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v20 = a5;
  if (v6)
  {
    uint64_t v8 = [(ICNoteEditorViewController *)self noteFormattingControllerCreateIfNecessary];
    int v9 = [v8 presentingViewController];

    if (!v9)
    {
      if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
        uint64_t v10 = -2;
      }
      else {
        uint64_t v10 = 7;
      }
      [v8 setModalPresentationStyle:v10];
      id v11 = [v8 view];
      uint64_t v12 = [v11 backgroundColor];
      uint64_t v13 = [v8 popoverPresentationController];
      [v13 setBackgroundColor:v12];

      uint64_t v14 = [v8 popoverPresentationController];
      [v14 setDelegate:self];

      uint64_t v15 = [v8 popoverPresentationController];
      [v15 setBarButtonItem:v20];

      uint64_t v16 = [v8 popoverPresentationController];
      objc_msgSend(v16, "setPopoverLayoutMargins:", 0.0, 0.0, 0.0, 1.0);

      [(ICNoteEditorViewController *)self presentViewController:v8 animated:v5 completion:0];
    }
  }
  else
  {
    uint64_t v17 = [(ICNoteEditorViewController *)self noteFormattingController];
    uint64_t v18 = [v17 presentingViewController];

    if (!v18) {
      goto LABEL_10;
    }
    uint64_t v8 = [(ICNoteEditorViewController *)self noteFormattingController];
    unint64_t v19 = [v8 presentingViewController];
    [v19 dismissViewControllerAnimated:v5 completion:0];
  }
LABEL_10:
}

- (void)setAuxiliaryStylingController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);
    if (!v5
      || (BOOL v6 = v5,
          id v7 = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController),
          char v8 = [v7 lockSelection],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      objc_storeWeak((id *)&self->_auxiliaryStylingController, obj);
      [(ICNoteEditorViewController *)self updateBarButtons];
    }
  }
}

double __78__ICNoteEditorViewController_showStyleSelectorInputView_animated_doneEditing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  return v1;
}

- (void)setCurrentTextStyle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v5)
  {
    id v6 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v6 setTextStyleForCurrentSelection:v3];
  }
  else
  {
    id v6 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v6, "ic_setTextStyleForCurrentSelection:", v3);
  }
}

- (void)setTextStyle:(unsigned int)a3 sender:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 setIsSettingStyleWithStyleUI:1];

  [(ICNoteEditorViewController *)self setCurrentTextStyle:v4];
  id v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setIsSettingStyleWithStyleUI:0];

  char v8 = (void *)topoTextStylesToAnalyticsStyles;
  int v9 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  if (v11)
  {
    id v13 = [(ICNoteEditorViewController *)self eventReporter];
    uint64_t v12 = [(ICNoteEditorBaseViewController *)self note];
    [v13 submitStyleFormatEventForModernNote:v12 styleTypeValue:v11];
  }
}

- (void)toggleBIUS:(unint64_t)a3 sender:(id)a4
{
  id v15 = a4;
  id v6 = [(ICNoteEditorViewController *)self textView];
  char v7 = 1;
  [v6 setIsSettingStyleWithStyleUI:1];

  char v8 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
  int v9 = [(ICNoteEditorViewController *)self textView];
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  switch(a3)
  {
    case 1uLL:
      if (v8) {
        int v9 = v8;
      }
      [v9 toggleBoldface:v15];
      char v7 = 0;
      uint64_t v11 = 9;
      break;
    case 2uLL:
      if (v8) {
        int v9 = v8;
      }
      [v9 toggleItalics:v15];
      char v7 = 0;
      uint64_t v11 = 10;
      break;
    case 4uLL:
      if (v8) {
        int v9 = v8;
      }
      [v9 toggleUnderline:v15];
      char v7 = 0;
      uint64_t v11 = 11;
      break;
    case 8uLL:
      if (v8) {
        [v8 toggleStrikethrough:v15];
      }
      else {
        [(ICNoteEditorViewController *)self strikethrough:v15];
      }
      char v7 = 0;
      uint64_t v11 = 12;
      break;
    default:
      break;
  }
  uint64_t v12 = [(ICNoteEditorViewController *)self textView];
  [v12 setIsSettingStyleWithStyleUI:0];

  if ((v7 & 1) == 0)
  {
    id v13 = [(ICNoteEditorViewController *)self eventReporter];
    uint64_t v14 = [(ICNoteEditorBaseViewController *)self note];
    [v13 submitStyleFormatEventForModernNote:v14 styleTypeValue:v11];
  }
}

- (void)changeIndentationByIncreasing:(BOOL)a3 sender:(id)a4
{
  BOOL v4 = a3;
  int64_t v6 = [(ICNoteEditorViewController *)self currentWritingDirection];
  uint64_t v7 = !v4;
  char v8 = [(ICNoteEditorViewController *)self textView];
  [v8 setIsSettingStyleWithStyleUI:1];

  if (v6 == v7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 == v7) {
    uint64_t v10 = 13;
  }
  else {
    uint64_t v10 = 14;
  }
  [(ICNoteEditorViewController *)self indentSelectionIfPossibleByAmount:v9];
  uint64_t v11 = [(ICNoteEditorViewController *)self textView];
  [v11 setIsSettingStyleWithStyleUI:0];

  id v13 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v12 = [(ICNoteEditorBaseViewController *)self note];
  [v13 submitStyleFormatEventForModernNote:v12 styleTypeValue:v10];
}

- (id)noteFormattingTintColor
{
  id v2 = [(ICNoteEditorViewController *)self view];
  uint64_t v3 = [v2 tintColor];

  return v3;
}

- (void)noteFormattingNeedsUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 selectedRange];
  [v4 updateWithDataSource:self ignoreTypingAttributes:v5 != 0];
}

- (void)noteFormattingDidFinish:(id)a3
{
  if ([(ICNoteEditorViewController *)self styleSelectorInputViewShowing]) {
    [(ICNoteEditorViewController *)self showStyleSelectorInputView:0 animated:1 doneEditing:0];
  }
  else {
    [(ICNoteEditorViewController *)self cleanupAfterAddImageAttachmentOperation];
  }
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  id v7 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
  uint64_t v5 = [v7 styleBarButtonItem];
  id v6 = [v5 view];
  UIAccessibilityPostNotification(v4, v6);
}

- (void)attachmentInsertionController:(id)a3 willAddAttachment:(id)a4 atRange:(_NSRange)a5
{
  id v5 = [(ICNoteEditorViewController *)self textView];
  [v5 unmarkText];
}

- (void)attachmentInsertionController:(id)a3 didAddAttachment:(id)a4 atRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(ICNoteEditorViewController *)self textView];
    objc_opt_class();
    uint64_t v10 = [v9 textStorage];
    uint64_t v11 = ICCheckedDynamicCast();

    NSUInteger v12 = location + length;
    if (location + length > [v11 length])
    {
      id v13 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ICNoteEditorViewController attachmentInsertionController:didAddAttachment:atRange:]();
      }

      goto LABEL_22;
    }
    objc_opt_class();
    uint64_t v14 = [v11 styler];
    id v15 = ICDynamicCast();

    uint64_t v16 = [v11 string];
    NSUInteger v43 = length;
    uint64_t v17 = objc_msgSend(v16, "paragraphRangeForRange:", location, length);
    uint64_t v18 = v9;
    unint64_t v19 = self;
    id v20 = v11;
    id v21 = v8;
    uint64_t v22 = v17;
    uint64_t v24 = v23;

    uint64_t v25 = v22;
    id v8 = v21;
    uint64_t v11 = v20;
    uint64_t v26 = v19;
    uint64_t v9 = v18;
    objc_msgSend(v15, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v25, v24, v11, v18);
    [(ICNoteEditorViewController *)v26 textViewDidChange:v18];
    [v11 breakUndoCoalescing];
    [(ICNoteEditorViewController *)v26 updateBarButtons];
    UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
    unsigned int v27 = [v8 attachmentType];
    if (v27 >= 0xC && v27 - 13 >= 3)
    {
      if (v27 != 12) {
        goto LABEL_21;
      }
      double v32 = [(ICNoteEditorViewController *)v26 textStorage];
      unint64_t v33 = [v32 length];

      if (location >= v33) {
        goto LABEL_21;
      }
      objc_opt_class();
      char v34 = [(ICNoteEditorViewController *)v26 textStorage];
      uint64_t v35 = [v34 attribute:*MEMORY[0x263F814A0] atIndex:location effectiveRange:0];
      double v30 = ICDynamicCast();

      if (!v30) {
        goto LABEL_21;
      }
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        objc_opt_class();
        CGRect v36 = [(ICNoteEditorViewController *)v26 textView];
        uint64_t v37 = [v36 textLayoutManager];
        uint64_t v38 = ICDynamicCast();

        uint64_t v39 = [v38 tableViewControllerForAttachment:v30 createIfNeeded:1];
      }
      else
      {
        objc_opt_class();
        uint64_t v40 = [(ICNoteEditorViewController *)v26 textView];
        CGRect v41 = [v40 layoutManager];
        uint64_t v38 = ICDynamicCast();

        objc_opt_class();
        CGRect v42 = [v38 viewControllerForTextAttachment:v30];
        uint64_t v39 = ICDynamicCast();
      }
      [v39 setShouldBeginInitialEditing:1];
      objc_msgSend(v39, "updateTableColumnDirectionForWritingDirection:", -[ICNoteEditorViewController currentWritingDirection](v26, "currentWritingDirection"));
    }
    else
    {
      if (!-[ICNoteEditorViewController doNotAdvanceInsertionPointAfterInsertingAttachment](v26, "doNotAdvanceInsertionPointAfterInsertingAttachment")&& v12 + 1 <= [v11 length])
      {
        ++v12;
      }
      -[NSObject setSelectedRange:](v18, "setSelectedRange:", v12, 0);
      -[ICNoteEditorViewController scrollRangeToVisible:animated:](v26, "scrollRangeToVisible:animated:", location, v43, 1);
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        objc_opt_class();
        int v28 = [(ICNoteEditorViewController *)v26 textView];
        double v29 = [v28 textLayoutManager];
        double v30 = ICCheckedDynamicCast();

        if (v30 && (objc_opt_respondsToSelector() & 1) != 0) {
          [(ICNoteEditorViewController *)v26 rcc_updatePaperKitMessengerForAttachment:v8 textLayoutManager:v30];
        }
      }
      else
      {
        objc_opt_class();
        double v31 = [v18 layoutManager];
        double v30 = ICCheckedDynamicCast();

        if (v30 && (objc_opt_respondsToSelector() & 1) != 0) {
          [(ICNoteEditorViewController *)v26 rcc_updatePaperKitMessengerForAttachment:v8 layoutManager:v30];
        }
      }
    }

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ICNoteEditorViewController attachmentInsertionController:didAddAttachment:atRange:]();
  }
LABEL_23:
}

- (void)attachmentInsertionController:(id)a3 didAddInlineAttachment:(id)a4 atRange:(_NSRange)a5 textStorage:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a6;
  uint64_t v10 = [(ICNoteEditorViewController *)self textView];
  id v11 = [v10 textStorage];

  if (v11 == v9)
  {
    objc_opt_class();
    NSUInteger v12 = [(ICNoteEditorViewController *)self textView];
    id v13 = [v12 textStorage];
    ICCheckedDynamicCast();
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (([v16 isEditing] & 1) == 0)
    {
      NSUInteger v14 = location + length;
      if (location + length <= [v16 length])
      {
        if ([(ICNoteEditorViewController *)self isConvertToTag]) {
          NSUInteger v14 = location + 1;
        }
        id v15 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v15, "setSelectedRange:", v14, 0);

        -[ICNoteEditorViewController scrollRangeToVisible:animated:](self, "scrollRangeToVisible:animated:", location, length, 1);
      }
    }
    [(ICNoteEditorViewController *)self setIsConvertToTag:0];
  }
}

- (void)addSystemPaperAttachment
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];
  int v4 = [v3 canAddAttachment];

  if (v4)
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v15 = [v5 UUIDString];

    id v6 = [(ICNoteEditorBaseViewController *)self note];
    id v7 = [v6 addSystemPaperAttachmentWithIdentifier:v15];

    id v8 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    id v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = [v9 selectedRange];
    id v12 = (id)[v8 addAttachment:v7 atTextLocation:v10 + v11];

    id v13 = [(ICNoteEditorBaseViewController *)self note];
    NSUInteger v14 = [v13 managedObjectContext];
    objc_msgSend(v14, "ic_save");
  }
}

- (void)showDocumentCamera
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];
  char v4 = [v3 canAddAttachment];

  if (v4)
  {
    [(ICNoteEditorViewController *)self prepareSelectionForAddingAttachment];
    [(ICNoteEditorViewController *)self showInsertUIWithPreferredSourceType:4];
  }
  else
  {
    [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
  }
}

- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v124 = v8;
  if (v8 && !v7) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"!(warnUser && !closeViewController)" functionName:"-[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]" simulateCrash:1 showAlert:0 format:@"Cannot warn user if not closing the view controller"];
  }
  BOOL v127 = v7;
  id v15 = [v13 docInfos];
  uint64_t v16 = [v15 count];

  if (!v16) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"docInfoCollection.docInfos.count > 0" functionName:"-[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]" simulateCrash:1 showAlert:0 format:@"This should never be called with a count of 0."];
  }
  uint64_t v17 = (void *)MEMORY[0x263EFF980];
  uint64_t v18 = [v13 docInfos];
  unint64_t v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  v128 = v13;
  id v20 = [v13 docInfos];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v156 objects:v163 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v157;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v157 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v156 + 1) + 8 * i) croppedAndFilteredImageUUID];
        uint64_t v26 = [v14 getImageURL:v25 async:0];
        objc_msgSend(v19, "ic_addNonNilObject:", v26);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v156 objects:v163 count:16];
    }
    while (v22);
  }
  v129 = self;

  objc_opt_class();
  unsigned int v27 = [MEMORY[0x263F5AEB0] objectForKey:@"ICShouldSavePhotosAndVideosToCameraRollKey"];
  int v28 = ICDynamicCast();
  int v29 = [v28 BOOLValue];

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v30 = v19;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v152 objects:v162 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    unint64_t v33 = 0;
    uint64_t v34 = *(void *)v153;
    uint64_t v35 = *MEMORY[0x263EFF688];
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v153 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v37 = *(void **)(*((void *)&v152 + 1) + 8 * j);
        id v151 = 0;
        [v37 getResourceValue:&v151 forKey:v35 error:0];
        if (v151)
        {
          unint64_t v38 = [v151 unsignedIntegerValue];
          if (v33 <= v38) {
            unint64_t v33 = v38;
          }
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v152 objects:v162 count:16];
    }
    while (v32);
  }
  else
  {
    unint64_t v33 = 0;
  }

  uint64_t v39 = v129;
  uint64_t v40 = [(ICNoteEditorBaseViewController *)v129 note];
  int v41 = [v40 canAddAttachment];

  CGRect v42 = [(ICNoteEditorBaseViewController *)v129 note];
  int v43 = [v42 attachmentExceedsMaxSizeAllowed:v33];

  uint64_t v44 = [(ICNoteEditorBaseViewController *)v129 note];
  int v45 = [v44 isPasswordProtected];

  char v46 = v41;
  if (!v45 && v29 | v43 | v41 ^ 1)
  {
    char v120 = v41;
    id v122 = v12;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v47 = v30;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v147 objects:v161 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v148;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v148 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v147 + 1) + 8 * k);
          id v53 = (void *)MEMORY[0x210546100]();
          id v54 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v52];
          UIImageDataWriteToSavedPhotosAlbum();
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v147 objects:v161 count:16];
      }
      while (v49);
    }

    id v12 = v122;
    uint64_t v39 = v129;
    char v46 = v120;
  }
  id v55 = v128;
  if (v46)
  {
    if (!v43)
    {
      if (ICInternalSettingsDefaultToPaperKitPDFsAndScans())
      {
        id v59 = [(ICNoteEditorViewController *)v39 createdGalleryAttachmentUUID];
        uint64_t v125 = [v59 UUIDString];

        id v60 = [(ICNoteEditorBaseViewController *)v39 note];
        double v61 = [v60 addPaperDocumentAttachmentWithIdentifier:v125 subtype:*MEMORY[0x263F5A998]];

        id v62 = [v128 docInfos];
        uint64_t v63 = [v62 count];
        objc_opt_class();
        id v64 = [v61 paperBundleModel];
        id v65 = ICDynamicCast();
        [v65 setPaperPageCount:v63];

        uint64_t v66 = [v61 managedObjectContext];
        objc_msgSend(v66, "ic_save");

        uint64_t v67 = (void *)MEMORY[0x263F5ACB8];
        uint64_t v68 = [v128 docInfos];
        v140[0] = MEMORY[0x263EF8330];
        v140[1] = 3221225472;
        v140[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
        v140[3] = &unk_2640B9348;
        id v141 = v61;
        v142 = v39;
        id v69 = v61;
        [v67 createPaperBundleForAttachment:v69 fromDocCamInfoCollection:v68 imageCache:v14 completion:v140];

        v70 = [(ICNoteEditorViewController *)v39 eventReporter];
        uint64_t v71 = [v69 identifier];
        [v70 pushDocScanDataWithID:v71 actionType:1 stage:2];

        v72 = [(ICNoteEditorViewController *)v39 eventReporter];
        objc_super v73 = [(ICNoteEditorBaseViewController *)v39 note];
        v74 = [v128 docInfos];
        objc_msgSend(v72, "submitDocScanEventForNote:pageCount:", v73, objc_msgSend(v74, "count"));

        uint64_t v75 = (void *)v125;
        [(ICNoteEditorViewController *)v39 setCreatedGalleryAttachmentUUID:0];
        v76 = v141;
      }
      else
      {
        id v123 = v12;
        id v77 = objc_alloc(MEMORY[0x263F3AA50]);
        v78 = [v128 docInfos];
        uint64_t v79 = [v77 initWithImageCache:v14 docInfos:v78];

        uint64_t v126 = (void *)v79;
        [MEMORY[0x263F3AA48] setCachedItem:v79];
        v80 = [(ICNoteEditorBaseViewController *)v39 note];
        uint64_t v81 = [(ICNoteEditorViewController *)v39 createdGalleryAttachmentUUID];
        v82 = [v81 UUIDString];
        id v69 = [v80 addGalleryAttachmentWithIdentifier:v82];

        objc_opt_class();
        uint64_t v83 = [v69 attachmentModel];
        BOOL v84 = ICCheckedDynamicCast();

        id v85 = [v128 docInfos];
        id v86 = [v85 firstObject];

        uint64_t v87 = [MEMORY[0x263F5B318] createSubAttachmentFromDocument:v86 imageCache:v14 galleryAttachment:v69];
        id v88 = v87;
        if (v87)
        {
          char v89 = [v87 identifier];
          [v86 setScanDataDelegateIdentifier:v89];

          [v84 addSubAttachment:v88];
        }
        uint64_t v118 = v88;
        v119 = v86;
        uint64_t v121 = v84;
        [v69 saveMergeableDataIfNeeded];
        id v90 = [(ICNoteEditorViewController *)v39 attachmentInsertionController];
        uint64_t v91 = [(ICNoteEditorViewController *)v39 textView];
        uint64_t v92 = [v91 selectedRange];
        id v94 = (id)[v90 addAttachment:v69 atTextLocation:v92 + v93];

        v95 = [(ICNoteEditorBaseViewController *)v39 note];
        v96 = [v95 managedObjectContext];
        objc_msgSend(v96, "ic_saveWithLogDescription:", @"Insert gallery attachment");

        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        uint64_t v97 = [v69 subAttachments];
        uint64_t v98 = [v97 countByEnumeratingWithState:&v136 objects:v160 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          uint64_t v100 = *(void *)v137;
          do
          {
            for (uint64_t m = 0; m != v99; ++m)
            {
              if (*(void *)v137 != v100) {
                objc_enumerationMutation(v97);
              }
              uint64_t v102 = *(void *)(*((void *)&v136 + 1) + 8 * m);
              id v103 = [MEMORY[0x263F5B230] sharedGenerator];
              [v103 generatePreviewIfNeededForAttachment:v102];
            }
            uint64_t v99 = [v97 countByEnumeratingWithState:&v136 objects:v160 count:16];
          }
          while (v99);
        }

        v104 = [MEMORY[0x263F5B230] sharedGenerator];
        [v104 generatePreviewIfNeededForAttachment:v69];

        uint64_t v39 = v129;
        uint64_t v105 = [(ICNoteEditorViewController *)v129 eventReporter];
        v106 = [v69 identifier];
        [v105 pushDocScanDataWithID:v106 actionType:1 stage:2];

        v107 = [(ICNoteEditorViewController *)v129 eventReporter];
        int v108 = [(ICNoteEditorBaseViewController *)v129 note];
        id v55 = v128;
        BOOL v109 = [v128 docInfos];
        objc_msgSend(v107, "submitDocScanEventForNote:pageCount:", v108, objc_msgSend(v109, "count"));

        [(ICNoteEditorViewController *)v129 setCreatedGalleryAttachmentUUID:0];
        int v110 = [v128 docInfos];
        unint64_t v111 = [v110 count];

        if (v111 < 2)
        {
          uint64_t v75 = v126;
          [v126 doneBuildingCache];
        }
        else
        {
          uint64_t v112 = [v128 docInfos];
          uint64_t v113 = [v128 docInfos];
          uint64_t v114 = objc_msgSend(v112, "subarrayWithRange:", 1, objc_msgSend(v113, "count") - 1);

          uint64_t v115 = [MEMORY[0x263EFF980] arrayWithArray:v114];
          [v128 setDocInfos:v115];

          v116 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_756;
          block[3] = &unk_2640B8C20;
          id v132 = v69;
          id v133 = v128;
          id v134 = v14;
          uint64_t v75 = v126;
          id v135 = v126;
          dispatch_async(v116, block);
        }
        v76 = v121;
        id v12 = v123;
      }
      if (!v127)
      {
        [(ICNoteEditorViewController *)v39 cleanupAfterAddImageAttachmentOperation];
        v117 = v12;
        uint64_t v57 = 0;
        goto LABEL_68;
      }
      v130[0] = MEMORY[0x263EF8330];
      v130[1] = 3221225472;
      v130[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_4;
      v130[3] = &unk_2640B8140;
      v130[4] = v39;
      uint64_t v57 = v130;
LABEL_66:
      v117 = v12;
LABEL_68:
      [v117 dismissViewControllerAnimated:1 completion:v57];
      goto LABEL_69;
    }
    id v56 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](v39, v33, v56);
    }

    if (v127)
    {
      v143[0] = MEMORY[0x263EF8330];
      v143[1] = 3221225472;
      v143[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_732;
      v143[3] = &unk_2640B9320;
      v143[4] = v39;
      BOOL v144 = v124;
      uint64_t v57 = v143;
      goto LABEL_66;
    }
    if (v124) {
      [(ICNoteEditorViewController *)v39 warnUserAttachmentSizeExceededWithAttachmentCount:1];
    }
  }
  else
  {
    char v58 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](v39);
    }

    if (v127)
    {
      v145[0] = MEMORY[0x263EF8330];
      v145[1] = 3221225472;
      v145[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
      v145[3] = &unk_2640B9320;
      v145[4] = v39;
      BOOL v146 = v124;
      uint64_t v57 = v145;
      goto LABEL_66;
    }
    if (v124) {
      [(ICNoteEditorViewController *)v39 warnUserAttachmentLimitExceeded];
    }
  }
LABEL_69:
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cleanupAfterAddImageAttachmentOperation];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 warnUserAttachmentLimitExceeded];
  }
  return result;
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_732(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cleanupAfterAddImageAttachmentOperation];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 warnUserAttachmentSizeExceededWithAttachmentCount:1];
  }
  return result;
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3;
  v7[3] = &unk_2640B8C20;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = *(void *)(a1 + 40);
  id v5 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_cold_1(v2, a1, v3);
    }

    [MEMORY[0x263F5AB78] deleteAttachment:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", @"Deleted PaperDocumentScan attachment after error");
  }
  else
  {
    char v4 = [*(id *)(a1 + 56) attachmentInsertionController];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 56) textView];
    uint64_t v7 = [v6 selectedRange];
    id v9 = (id)[v4 addAttachment:v5 atTextLocation:v7 + v8];

    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", @"Inserted PaperDocumentScan attachment");
    id v10 = [MEMORY[0x263F5B230] sharedGenerator];
    [v10 generatePreviewIfNeededForAttachment:*(void *)(a1 + 40)];

    uint64_t v11 = [MEMORY[0x263F5ACA0] sharedContext];
    id v12 = [v11 workerManagedObjectContext];

    id v13 = [MEMORY[0x263F5B408] shared];
    id v14 = [*(id *)(a1 + 40) objectID];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_743;
    v16[3] = &unk_2640B8140;
    id v17 = v12;
    id v15 = v12;
    [v13 updateIndexForAttachment:v14 userInitiated:1 managedObjectContext:v15 completionHandler:v16];
  }
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_743(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_744;
  v2[3] = &unk_2640B8140;
  id v3 = v1;
  [v3 performBlock:v2];
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_744(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"Updated index after gallery attachment upgrade");
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_756(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5B318];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = [*(id *)(a1 + 40) docInfos];
  id v5 = (id)[v2 createAndAddSubAttachmentsToGalleryAttachment:v3 fromDocuments:v4 imageCache:*(void *)(a1 + 48) context:0];

  id v6 = *(void **)(a1 + 56);

  return [v6 doneBuildingCache];
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupAfterAddImageAttachmentOperation];
}

- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __92__ICNoteEditorViewController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke;
  v3[3] = &unk_2640B8140;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __92__ICNoteEditorViewController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupAfterAddImageAttachmentOperation];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setCreatedGalleryAttachmentUUID:0];
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];
  int v4 = [v3 isPasswordProtected];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F5AC08]);
    id v6 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = (void *)[v5 initWithObjectIdentifier:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 presentingViewController];
  [(ICNoteEditorViewController *)self documentCameraPresentingViewController:v12 didFinishWithInfoCollection:v11 imageCache:v10 warnUser:v6 closeViewController:1];
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [a3 presentingViewController];
  [(ICNoteEditorViewController *)self documentCameraPresentingViewController:v14 didFinishWithInfoCollection:v13 imageCache:v12 warnUser:v8 closeViewController:v7];
}

- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4
{
  BOOL v6 = [(ICNoteEditorViewController *)self eventReporter];
  BOOL v7 = [(ICNoteEditorViewController *)self createdGalleryAttachmentUUID];
  BOOL v8 = [v7 UUIDString];
  [v6 pushDocScanDataWithID:v8 actionType:2 stage:1];

  id v10 = [(ICNoteEditorViewController *)self eventReporter];
  id v9 = [(ICNoteEditorBaseViewController *)self note];
  [v10 submitDocScanEventForNote:v9 pageCount:a4];
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F5ABD8], "sharedConfiguration", a3);
  LOBYTE(a4) = [v5 maxSubAttachmentsPerAttachment] >= a4;

  return a4;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F5AB78];
  int v4 = (void *)MEMORY[0x263F5ACA0];
  id v5 = a3;
  BOOL v6 = [v4 sharedContext];
  BOOL v7 = [v6 managedObjectContext];
  BOOL v8 = [v3 attachmentWithIdentifier:v5 context:v7];

  return v8;
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 presentingViewController];
  BOOL v8 = [v7 imageCache];

  [(ICNoteEditorViewController *)self documentCameraPresentingViewController:v9 didFinishWithInfoCollection:v6 imageCache:v8 warnUser:1 closeViewController:1];
}

- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4
{
}

- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4 forceAddToPaper:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(ICNoteEditorBaseViewController *)self note];
  int v10 = [v9 isSharedReadOnly];

  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20BE60000, v11, OS_LOG_TYPE_DEFAULT, "Not adding system paper image data since note is read-only.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_17;
  }
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v12 = [(ICNoteEditorBaseViewController *)self note];
    id v13 = [v12 textStorage];
    id v14 = [(ICNoteEditorBaseViewController *)self note];
    id v15 = [v14 textStorage];
    uint64_t v16 = objc_msgSend(v15, "ic_range");
    uint64_t v17 = *MEMORY[0x263F814A0];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    _DWORD v27[2] = __91__ICNoteEditorViewController_addSystemPaperImageData_updateFirstResponder_forceAddToPaper___block_invoke;
    v27[3] = &unk_2640B80C8;
    v27[4] = &buf;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v17, v16, v18, 0, v27);

    BOOL v5 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  if (v6)
  {
    unint64_t v19 = [(ICNoteEditorViewController *)self textView];
    if ([v19 isFirstResponder])
    {
    }
    else
    {
      id v20 = [(ICNoteEditorViewController *)self paletteResponder];
      if ([v20 isFirstResponder])
      {
      }
      else
      {
        char v21 = [(ICNoteEditorViewController *)self isFirstResponder];

        if ((v21 & 1) == 0) {
          [(ICNoteEditorViewController *)self becomeFirstResponder];
        }
      }
    }
  }
  uint64_t v22 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v8 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_20BE60000, v22, OS_LOG_TYPE_DEFAULT, "System Paper received %lu images", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v24 = [(ICNoteEditorViewController *)self visualAssetImportController];
  [v24 addImageData:v8 typeIdentifier:0 forceAddToPaper:v5];

  uint64_t v25 = [(ICNoteEditorBaseViewController *)self note];
  [v25 updateModificationDateAndChangeCountAndSaveImmediately];

  uint64_t v26 = [MEMORY[0x263F5B230] sharedGenerator];
  [v26 generatePreviewsIfNeeded];

  if (+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote])
  {
    id v11 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
    [v11 refresh];
LABEL_17:
  }
}

void __91__ICNoteEditorViewController_addSystemPaperImageData_updateFirstResponder_forceAddToPaper___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)addSystemPaperLink:(id)a3 updateFirstResponder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char IsSystemPaperEnabled = ICInternalSettingsIsSystemPaperEnabled();
  if ((IsSystemPaperEnabled & 1) == 0)
  {
    int v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v11 = "Not adding system paper link since SystemPaper isn't enabled.";
      id v12 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_20;
  }
  id v8 = [(ICNoteEditorBaseViewController *)self note];
  int v9 = [v8 isSharedReadOnly];

  if (v9)
  {
    int v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = 0;
      id v11 = "Not adding system paper link since note is read-only.";
      id v12 = (uint8_t *)&v32;
LABEL_7:
      _os_log_impl(&dword_20BE60000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v4)
  {
    id v13 = [(ICNoteEditorViewController *)self textView];
    if (![v13 isFirstResponder])
    {
      id v14 = [(ICNoteEditorViewController *)self paletteResponder];
      if (![v14 isFirstResponder])
      {
        char v31 = [(ICNoteEditorViewController *)self isFirstResponder];

        if ((v31 & 1) == 0) {
          [(ICNoteEditorViewController *)self becomeFirstResponder];
        }
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  id v15 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v16 = [v15 addSynapseLinkAttachmentWithContentItem:v6];

  uint64_t v17 = [v6 displayTitle];
  [v16 setTitle:v17];

  [v16 updateChangeCountWithReason:@"Add System Paper Link"];
  if ([(ICNoteEditorViewController *)self isEditing])
  {
    uint64_t v18 = [(ICNoteEditorViewController *)self textView];
    uint64_t v19 = [v18 selectedRange];
    uint64_t v21 = v19 + v20;
  }
  else
  {
    uint64_t v18 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v22 = [v18 textStorage];
    uint64_t v21 = [v22 length];
  }
  uint64_t v23 = [(ICNoteEditorViewController *)self attachmentInsertionController];
  id v24 = (id)[v23 addAttachment:v16 atTextLocation:v21];

  uint64_t v25 = [(ICNoteEditorBaseViewController *)self note];
  [v25 updateModificationDateAndChangeCountAndSaveImmediately];

  uint64_t v26 = [MEMORY[0x263F5B230] sharedGenerator];
  [v26 generatePreviewsIfNeeded];

  unsigned int v27 = [MEMORY[0x263F5A760] sharedReporter];
  int v28 = [(ICNoteEditorBaseViewController *)self note];
  [v27 fireDeepLinkCreationEventWithNote:v28 contentItem:v6];

  if (+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote])
  {
    uint64_t v29 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
    [v29 refresh];
  }
LABEL_20:

  return IsSystemPaperEnabled ^ 1;
}

- (void)createSystemPaperLinkBarIfNecessary
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Attempting System Paper link bar creation.", v2, v3, v4, v5, v6);
}

- (void)teardownSystemPaperLinkBarIfNecessary
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Attempting System Paper link bar teardown.", v2, v3, v4, v5, v6);
}

- (void)systemPaperLinkBarVisibilityPreferenceChanged:(id)a3
{
  BOOL v4 = +[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote];
  uint64_t v5 = [(ICNoteEditorViewController *)self paperLinkBarViewController];

  if (!v5 || v4)
  {
    uint8_t v6 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
    if (v6) {
      BOOL v4 = 0;
    }

    if (v4)
    {
      [(ICNoteEditorViewController *)self createSystemPaperLinkBarIfNecessary];
      id v7 = [(ICNoteEditorViewController *)self paperLinkBarViewController];
      [v7 refresh];
    }
  }
  else
  {
    [(ICNoteEditorViewController *)self teardownSystemPaperLinkBarIfNecessary];
  }
}

- (void)setCanShowLinkBar:(BOOL)a3
{
  if (self->_canShowLinkBar != a3)
  {
    self->_canShowLinkBar = a3;
    if (!a3) {
      [(ICNoteEditorViewController *)self teardownSystemPaperLinkBarIfNecessary];
    }
  }
}

- (void)setPaperLinkBarShowing:(BOOL)a3
{
  LODWORD(v3) = a3;
  if ((ICInternalSettingsIsSystemPaperEnabled() & 1) == 0)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.5();
    }
    goto LABEL_14;
  }
  if (([MEMORY[0x263F5AE70] deviceSupportsSystemPaper] & 1) == 0)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.4();
    }
    goto LABEL_14;
  }
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper])
  {
    uint8_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICNoteEditorViewController setPaperLinkBarShowing:]();
    }
    goto LABEL_14;
  }
  unsigned int v5 = v3 ^ 1;
  if (![(ICNoteEditorViewController *)self canShowLinkBar] && (v5 & 1) == 0)
  {
    uint8_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController setPaperLinkBarShowing:]();
    }
LABEL_14:

    return;
  }
  if (self->_paperLinkBarShowing != v3)
  {
    if (((+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote] | v5) & 1) == 0)
    {
      uint64_t v3 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[ICNoteEditorViewController setPaperLinkBarShowing:]();
      }

      LOBYTE(v3) = 0;
    }
    self->_paperLinkBarShowing = (char)v3;
    id v7 = [(ICNoteEditorViewController *)self textView];
    id v8 = [(ICNoteEditorBaseViewController *)self note];
    [v7 createUserTitleViewIfNecessaryForNote:v8];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke;
    aBlock[3] = &unk_2640B9320;
    char v17 = (char)v3;
    aBlock[4] = self;
    int v9 = (void (**)(void))_Block_copy(aBlock);
    int v10 = [(ICNoteEditorViewController *)self view];
    [v10 setNeedsUpdateConstraints];

    if ([(ICNoteEditorViewController *)self linksBarNeedsAnimationWhileEditorIsVisible]|| [(ICNoteEditorViewController *)self needsToPerformInitialPaperAnimations])
    {
      id v11 = (void *)MEMORY[0x263F82E00];
      +[ICSystemPaperConstants linkBarAnimationDuration];
      double v13 = v12;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      void v14[2] = __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke_2;
      v14[3] = &unk_2640B8B80;
      id v15 = v9;
      [v11 animateWithDuration:v14 animations:v13];
    }
    else
    {
      v9[2](v9);
    }
    [(ICNoteEditorViewController *)self setNeedsToPerformInitialPaperAnimations:0];
    [(ICNoteEditorViewController *)self setLinksBarNeedsAnimationWhileEditorIsVisible:1];
  }
}

void __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) paperLinkBarTopConstraint];
    [v2 setConstant:0.0];

    uint64_t v3 = [*(id *)(a1 + 32) textView];
    BOOL v4 = [v3 userTitleView];
    [v4 setAlpha:0.0];

    unsigned int v5 = [*(id *)(a1 + 32) textView];
    uint8_t v6 = [v5 dateView];
    [v6 setAlpha:0.0];

    id v7 = [*(id *)(a1 + 32) paperLinkBarViewController];
    id v8 = [v7 view];
    int v9 = v8;
    double v10 = 1.0;
  }
  else
  {
    +[ICSystemPaperConstants linkBarHeight];
    double v12 = -v11;
    double v13 = [*(id *)(a1 + 32) paperLinkBarTopConstraint];
    [v13 setConstant:v12];

    id v14 = [*(id *)(a1 + 32) textView];
    id v15 = [v14 userTitleView];
    [v15 setAlpha:1.0];

    uint64_t v16 = [*(id *)(a1 + 32) textView];
    char v17 = [v16 dateView];
    [v17 setAlpha:1.0];

    id v7 = [*(id *)(a1 + 32) paperLinkBarViewController];
    id v8 = [v7 view];
    int v9 = v8;
    double v10 = 0.0;
  }
  [v8 setAlpha:v10];

  uint64_t v18 = [*(id *)(a1 + 32) textView];
  [v18 contentInset];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  [*(id *)(a1 + 32) textViewTopInsetThatWeWant];
  double v26 = v25;
  unsigned int v27 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v27, "setContentInset:", v26, v20, v22, v24);

  id v28 = [*(id *)(a1 + 32) view];
  [v28 layoutIfNeeded];
}

uint64_t __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelFromSystemPaperCard:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke;
  aBlock[3] = &unk_2640B8140;
  aBlock[4] = self;
  unsigned int v5 = (void (**)(void))_Block_copy(aBlock);
  uint8_t v6 = [(ICNoteEditorViewController *)self textStorage];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [(ICNoteEditorViewController *)self presentedViewController];
    if (!v8) {
      goto LABEL_5;
    }
    int v9 = (void *)v8;
    double v10 = [(ICNoteEditorViewController *)self presentedViewController];
    double v11 = [(ICNoteEditorViewController *)self noteFormattingController];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      double v13 = [(ICNoteEditorViewController *)self noteFormattingController];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_3;
      v30[3] = &unk_2640B82D8;
      v30[4] = self;
      id v31 = v4;
      [v13 dismissViewControllerAnimated:1 completion:v30];
    }
    else
    {
LABEL_5:
      id v14 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
      id v15 = (void *)MEMORY[0x263F82400];
      uint64_t v16 = [MEMORY[0x263F086E0] mainBundle];
      char v17 = [v16 localizedStringForKey:@"Delete Quick Note" value:&stru_26C10E100 table:0];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_4;
      v28[3] = &unk_2640B9370;
      uint64_t v29 = v5;
      uint64_t v18 = [v15 actionWithTitle:v17 style:2 handler:v28];
      [v14 addAction:v18];

      double v19 = (void *)MEMORY[0x263F82400];
      double v20 = [MEMORY[0x263F086E0] mainBundle];
      double v21 = [v20 localizedStringForKey:@"Save Quick Note" value:&stru_26C10E100 table:0];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      _DWORD v27[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_5;
      v27[3] = &unk_2640B9398;
      v27[4] = self;
      double v22 = [v19 actionWithTitle:v21 style:0 handler:v27];
      [v14 addAction:v22];

      double v23 = (void *)MEMORY[0x263F82400];
      double v24 = [MEMORY[0x263F086E0] mainBundle];
      double v25 = [v24 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
      double v26 = [v23 actionWithTitle:v25 style:1 handler:0];
      [v14 addAction:v26];

      [v14 setModalPresentationStyle:7];
      [(ICNoteEditorViewController *)self presentViewController:v14 animated:1 completion:0];
    }
  }
  else
  {
    v5[2](v5);
  }
}

void __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setQuickNoteiPhoneDidSaveOrCancel:1];
  uint64_t v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [*(id *)(a1 + 32) eventReporter];
  [v3 submitNoteDeleteEventForModernNote:v2];

  id v4 = [MEMORY[0x263F5ACA0] sharedContext];
  unsigned int v5 = [v4 managedObjectContext];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_2;
  void v8[3] = &unk_2640B89A8;
  id v9 = v5;
  id v10 = v2;
  uint64_t v11 = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v5;
  [v7 performBlockAndWait:v8];
}

void __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_2(id *a1)
{
  [a1[4] processPendingChanges];
  [a1[5] markForDeletion];
  objc_msgSend(a1[4], "ic_save");
  id v2 = [a1[6] delegate];
  [v2 noteEditorRequestsDismissal:a1[6] cancelled:1];
}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) styleSelectorInputViewShowing]) {
    [*(id *)(a1 + 32) showStyleSelector:0 animated:0];
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 cancelFromSystemPaperCard:v3];
}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveFromSystemPaperCard:*(void *)(a1 + 32)];
}

- (void)saveFromSystemPaperCard:(id)a3
{
  [(ICNoteEditorViewController *)self saveNote];
  [(ICNoteEditorViewController *)self setQuickNoteiPhoneDidSaveOrCancel:1];
  [(ICNoteEditorViewController *)self ensurePaperPreviewsExistIfNecessary];
  id v4 = [(ICNoteEditorViewController *)self delegate];
  [v4 noteEditorRequestsDismissal:self cancelled:0];
}

- (void)ensurePaperPreviewsExistIfNecessary
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v3 visibleAttachments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x210546100]();
        if ([v9 attachmentType] == 13)
        {
          uint64_t v11 = (void *)MEMORY[0x263F5ABA8];
          int v12 = [v9 identifier];
          [v11 generatePreviewsForAttachment:v9 paperIdentifier:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [MEMORY[0x263F08AB0] processInfo];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke;
  v22[3] = &unk_2640B93C0;
  id v15 = v13;
  double v23 = v15;
  [v14 performExpiringActivityWithReason:@"Generating thumbnails for System Paper card" usingBlock:v22];

  uint64_t v16 = [MEMORY[0x263F5B470] sharedService];
  char v17 = [(ICNoteEditorBaseViewController *)self note];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke_2;
  v19[3] = &unk_2640B9320;
  char v21 = 1;
  double v20 = v15;
  uint64_t v18 = v15;
  [v16 updateIfNeededForNote:v17 completion:v19];
}

intptr_t __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke(intptr_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(result + 32), 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

intptr_t __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [MEMORY[0x263F5AEC8] sharedWidget];
    [v2 reloadTimelinesWithReason:@"System Paper card saved"];
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (void)showActivityStreamToolbarForObject:(id)a3 selection:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v63[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(ICNoteEditorViewController *)self activityStreamToolbar];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    int v12 = [(ICNoteEditorViewController *)self activityStreamToolbar];
    dispatch_semaphore_t v13 = [v12 superview];
    id v14 = [(ICNoteEditorViewController *)self navigationController];
    id v15 = [v14 view];

    if (v13 != v15)
    {
      uint64_t v16 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      [v16 removeFromSuperview];

      [(ICNoteEditorViewController *)self setActivityStreamToolbar:0];
    }
  }
  char v17 = [(ICNoteEditorViewController *)self activityStreamToolbar];
  if (v17)
  {
  }
  else
  {
    uint64_t v18 = [(ICNoteEditorViewController *)self navigationController];

    if (v18)
    {
      id v60 = v8;
      id v61 = v9;
      char v58 = [(ICNoteEditorViewController *)self viewControllerManager];
      double v19 = [[ICActivityStreamDockView alloc] initWithCoordinator:v58 isDisplayedInCard:0];
      [(ICNoteEditorViewController *)self setActivityStreamToolbar:v19];

      double v20 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

      char v21 = [(ICNoteEditorViewController *)self navigationController];
      double v22 = [v21 view];
      double v23 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      [v22 addSubview:v23];

      long long v24 = [(ICNoteEditorViewController *)self navigationController];
      long long v25 = [v24 view];
      [v25 layoutIfNeeded];

      double v26 = 0.0;
      BOOL v59 = v5;
      if (v5)
      {
        long long v27 = [(ICNoteEditorViewController *)self navigationController];
        id v28 = [v27 view];
        [v28 safeAreaInsets];
        double v30 = v29;
        id v31 = [(ICNoteEditorViewController *)self activityStreamToolbar];
        [v31 frame];
        double v26 = v30 + v32;
      }
      unint64_t v33 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      uint64_t v34 = [v33 bottomAnchor];
      uint64_t v35 = [(ICNoteEditorViewController *)self navigationController];
      CGRect v36 = [v35 view];
      uint64_t v37 = [v36 bottomAnchor];
      unint64_t v38 = [v34 constraintEqualToAnchor:v37 constant:v26];
      [(ICNoteEditorViewController *)self setActivityStreamToolbarBottomConstraint:v38];

      uint64_t v52 = (void *)MEMORY[0x263F08938];
      uint64_t v57 = [(ICNoteEditorViewController *)self activityStreamToolbarBottomConstraint];
      v63[0] = v57;
      id v56 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      id v54 = [v56 leadingAnchor];
      id v55 = [(ICNoteEditorViewController *)self navigationController];
      id v53 = [v55 view];
      uint64_t v39 = [v53 leadingAnchor];
      uint64_t v40 = [v54 constraintEqualToAnchor:v39];
      v63[1] = v40;
      int v41 = [(ICNoteEditorViewController *)self activityStreamToolbar];
      CGRect v42 = [v41 trailingAnchor];
      int v43 = [(ICNoteEditorViewController *)self navigationController];
      uint64_t v44 = [v43 view];
      int v45 = [v44 trailingAnchor];
      char v46 = [v42 constraintEqualToAnchor:v45];
      v63[2] = v46;
      id v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
      [v52 activateConstraints:v47];

      if (v59)
      {
        uint64_t v48 = [(ICNoteEditorViewController *)self navigationController];
        uint64_t v49 = [v48 view];
        [v49 layoutIfNeeded];

        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __84__ICNoteEditorViewController_showActivityStreamToolbarForObject_selection_animated___block_invoke;
        v62[3] = &unk_2640B8140;
        v62[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:v62 animations:0.25];
      }

      id v8 = v60;
      id v9 = v61;
    }
  }
  uint64_t v50 = [(ICNoteEditorViewController *)self activityStreamToolbar];
  [v50 setSelection:v8];

  long long v51 = [(ICNoteEditorViewController *)self activityStreamToolbar];
  [v51 setObject:v9];
}

void __84__ICNoteEditorViewController_showActivityStreamToolbarForObject_selection_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityStreamToolbarBottomConstraint];
  [v2 setConstant:0.0];

  id v4 = [*(id *)(a1 + 32) navigationController];
  uint64_t v3 = [v4 view];
  [v3 layoutIfNeeded];
}

- (void)hideActivityStreamToolbarAnimated:(BOOL)a3
{
  if (a3
    && ([(ICNoteEditorViewController *)self activityStreamToolbar],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    BOOL v5 = [(ICNoteEditorViewController *)self activityStreamToolbar];
    uint64_t v6 = (void *)MEMORY[0x263F82E00];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke;
    v14[3] = &unk_2640B8140;
    void v14[4] = self;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke_2;
    int v12 = &unk_2640B93C0;
    id v13 = v5;
    id v7 = v5;
    [v6 animateWithDuration:v14 animations:&v9 completion:0.25];
  }
  else
  {
    id v8 = [(ICNoteEditorViewController *)self activityStreamToolbar];
    [v8 removeFromSuperview];
  }
  -[ICNoteEditorViewController setActivityStreamToolbar:](self, "setActivityStreamToolbar:", 0, v9, v10, v11, v12);
  [(ICNoteEditorViewController *)self setActivityStreamToolbarBottomConstraint:0];
}

void __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityStreamToolbar];
  [v2 frame];
  double v4 = v3;
  BOOL v5 = [*(id *)(a1 + 32) activityStreamToolbarBottomConstraint];
  [v5 setConstant:v4];

  id v7 = [*(id *)(a1 + 32) navigationController];
  uint64_t v6 = [v7 view];
  [v6 layoutIfNeeded];
}

uint64_t __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (UIViewController)rootViewController
{
  id v2 = [(ICNoteEditorViewController *)self navigationController];
  double v3 = [v2 view];
  double v4 = [v3 window];
  BOOL v5 = [v4 rootViewController];

  return (UIViewController *)v5;
}

- (void)noteOrFolderChangedCallback
{
  if ([(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPhone])
  {
    if (![(ICNoteEditorViewController *)self quickNoteiPhoneDidSaveOrCancel])
    {
      double v3 = [(ICNoteEditorBaseViewController *)self note];
      int v4 = [v3 isDeletedOrInTrash];

      if (v4)
      {
        BOOL v5 = [(ICNoteEditorViewController *)self delegate];
        char v6 = objc_opt_respondsToSelector();

        if (v6)
        {
          id v7 = [(ICNoteEditorViewController *)self delegate];
          [v7 noteEditorRequestsDismissal:self cancelled:1];
        }
      }
    }
  }
  if ([(ICNoteEditorViewController *)self isDrawingStroke])
  {
    id v8 = [(ICNoteEditorViewController *)self noteOrFolderChangedCallbackSelectorDelayer];

    if (!v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_noteOrFolderChangedCallback delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.25];
      [(ICNoteEditorViewController *)self setNoteOrFolderChangedCallbackSelectorDelayer:v9];
    }
    id v18 = [(ICNoteEditorViewController *)self noteOrFolderChangedCallbackSelectorDelayer];
    [v18 requestFire];
  }
  else
  {
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
    [(ICNoteEditorViewController *)self updateActionMenu];
    uint64_t v10 = [(ICNoteEditorViewController *)self textView];
    uint64_t v11 = [(ICNoteEditorBaseViewController *)self note];
    [v10 updateCompatibilityBannerForNote:v11 parentViewController:self updateTextViewContentInsets:1];

    [(ICNoteEditorViewController *)self showOrHidePasswordEntryViewControllerIfNeeded];
    [(ICNoteEditorViewController *)self updateBarButtons];
    if (![(ICNoteEditorViewController *)self userWantsToSeeDateLabel]
      || ([(ICNoteEditorBaseViewController *)self note],
          int v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 isSharedReadOnly],
          v12,
          v13))
    {
      [(ICNoteEditorViewController *)self resetDateView];
    }
    id v14 = [(ICNoteEditorViewController *)self textView];
    id v15 = [v14 userTitleView];
    [v15 updateContentToCurrentNote];

    [(ICNoteEditorViewController *)self updatePencilKitSelectionViewEnabled];
    id v18 = [(ICNoteEditorViewController *)self textView];
    if (objc_msgSend(v18, "ic_isFirstResponder"))
    {
      uint64_t v16 = [(ICNoteEditorBaseViewController *)self note];
      char v17 = [v16 isEditable];

      if (v17) {
        return;
      }
      id v18 = [(ICNoteEditorViewController *)self textView];
      [v18 resignFirstResponder];
    }
  }
}

- (void)resetBarButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
  [v5 reset];

  if (![(ICNoteEditorViewController *)self suspendBarButtonUpdates])
  {
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:v3];
  }
}

- (void)undoAction:(id)a3
{
  int v4 = [(ICNoteEditorViewController *)self magicGenerativePlaygroundUndoManager];

  if (v4)
  {
    id v8 = [(ICNoteEditorViewController *)self magicGenerativePlaygroundUndoManager];
    [v8 undo];
  }
  else
  {
    id v8 = [(ICNoteEditorViewController *)self textView];
    BOOL v5 = [v8 undoManager];
    if ([v5 canUndo])
    {
      BOOL v6 = [(ICNoteEditorViewController *)self isDrawingStroke];

      if (v6) {
        return;
      }
      id v8 = [(ICNoteEditorViewController *)self textView];
      id v7 = [v8 undoManager];
      [v7 undo];
    }
    else
    {
    }
  }
}

- (void)redoAction:(id)a3
{
  int v4 = [(ICNoteEditorViewController *)self magicGenerativePlaygroundUndoManager];

  if (v4)
  {
    id v8 = [(ICNoteEditorViewController *)self magicGenerativePlaygroundUndoManager];
    [v8 redo];
  }
  else
  {
    id v8 = [(ICNoteEditorViewController *)self textView];
    BOOL v5 = [v8 undoManager];
    if ([v5 canRedo])
    {
      BOOL v6 = [(ICNoteEditorViewController *)self isDrawingStroke];

      if (v6) {
        return;
      }
      id v8 = [(ICNoteEditorViewController *)self textView];
      id v7 = [v8 undoManager];
      [v7 redo];
    }
    else
    {
    }
  }
}

- (void)updateLastViewedMetadataIfNessessary
{
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
    int v4 = [v3 updateLastViewedTimestampWithCurrentTimestamp];

    if (v4)
    {
      BOOL v5 = [(ICNoteEditorBaseViewController *)self note];
      [v5 saveAfterDelay];
    }
  }
  BOOL v6 = [(ICNoteEditorBaseViewController *)self note];
  id v7 = [v6 recordID];

  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ICNoteEditorViewController_updateLastViewedMetadataIfNessessary__block_invoke;
    block[3] = &unk_2640B8140;
    id v10 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __66__ICNoteEditorViewController_updateLastViewedMetadataIfNessessary__block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F5ACE0] clearNotificationForRecordID:*(void *)(a1 + 32)];
}

- (void)localeChanged:(id)a3
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    int v4 = [(ICNoteEditorBaseViewController *)self note];
    BOOL v5 = [v4 textStorage];

    uint64_t v6 = *MEMORY[0x263F5AB28];
    uint64_t v7 = [v5 length];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__ICNoteEditorViewController_localeChanged___block_invoke;
    v9[3] = &unk_2640B9028;
    id v10 = v5;
    id v8 = v5;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v9);
  }
}

void __44__ICNoteEditorViewController_localeChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([a2 style] == 102)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "layoutManagers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
          objc_msgSend(v12, "ensureLayoutForCharacterRange:", a3, a4);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)currentSelectionContainsListOrFixedWidth
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  int v4 = objc_msgSend(v3, "ic_selectedRanges");

  id obj = v4;
  uint64_t v22 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v22)
  {
    uint64_t v24 = *(void *)v28;
    BOOL v5 = (void *)MEMORY[0x263F5AB28];
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = [(ICNoteEditorBaseViewController *)self note];
        uint64_t v9 = [v8 textStorage];
        uint64_t v10 = [v9 string];
        uint64_t v11 = [v7 rangeValue];
        unint64_t v13 = objc_msgSend(v10, "paragraphRangeForRange:", v11, v12);
        uint64_t v15 = v14;

        if (v13 < v13 + v15)
        {
          unint64_t v16 = v13;
          while (1)
          {
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            char v17 = [(ICNoteEditorBaseViewController *)self note];
            uint64_t v18 = [v17 textStorage];
            double v19 = objc_msgSend(v18, "attribute:atIndex:longestEffectiveRange:inRange:", *v5, v16, &v25, v13, v15);

            if (v19)
            {
              if ([v19 isList]) {
                break;
              }
            }
            unint64_t v16 = v26 + v25;

            if (v16 >= v13 + v15) {
              goto LABEL_11;
            }
          }

          BOOL v20 = 1;
          goto LABEL_16;
        }
LABEL_11:
        ;
      }
      BOOL v20 = 0;
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_16:

  return v20;
}

- (void)removeKVOObserversForNote:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"noteHasChanges", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"modificationDate", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"lastActivitySummaryViewedDate", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"attachmentViewType", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"paperStyleType", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"isEmpty", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"serverShareData", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"isSharedViaICloud", &compoundliteral_2986);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"prefersLightBackground", &compoundliteral_2984);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = +[ICNoteEditorUserTitleView noteKeyPathsAffectingUserTitleView];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, *(void *)(*((void *)&v10 + 1) + 8 * v9++), &compoundliteral_2988);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setNote:(id)a3
{
}

- (void)setNote:(id)a3 overrideScrollState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6) {
    [(ICNoteEditorViewController *)self setArchivedScrollStateToApply:v6];
  }
  [(ICNoteEditorViewController *)self setNote:v8];
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    uint64_t v7 = [(ICNoteEditorViewController *)self archivedScrollStateToApply];

    if (v7) {
      [(ICNoteEditorViewController *)self applyScrollStateIfAvailable];
    }
  }
}

void __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [v2 shortLoggingDescription];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_20BE60000, v3, OS_LOG_TYPE_INFO, "Migrated previous note to v1 Neo {migratedNote: %@}", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_818(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNote:*(void *)(a1 + 40) delayedForLaunch:0 successHandler:*(void *)(a1 + 48)];
}

- (void)presentRecordingStoppedAlertForNoteIfNeeded:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F5ABB8] currentAttachment];
  id v6 = [v5 note];

  if (v6 == v4)
  {
    uint64_t v7 = (void *)MEMORY[0x263F5ABB8];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke;
    void v8[3] = &unk_2640B9348;
    void v8[4] = self;
    id v9 = v4;
    [v7 cancelCurrentAudioRecordingSessionWithCompletionHandler:v8];
  }
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "AudioTranscription");
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_1();
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = (void *)MEMORY[0x263F82418];
  uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
  id v8 = [v7 localizedStringForKey:@"Recording Stopped" value:&stru_26C10E100 table:0];
  id v9 = [MEMORY[0x263F086E0] mainBundle];
  long long v10 = [v9 localizedStringForKey:@"Leaving the note stopped your audio recording. Your recording is saved in the note." value:&stru_26C10E100 table:0];
  long long v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  long long v12 = (void *)MEMORY[0x263F82400];
  long long v13 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v14 = [v13 localizedStringForKey:@"Return to Note" value:&stru_26C10E100 table:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_847;
  v20[3] = &unk_2640B9408;
  objc_copyWeak(&v22, &location);
  id v21 = *(id *)(a1 + 40);
  uint64_t v15 = [v12 actionWithTitle:v14 style:0 handler:v20];
  [v11 addAction:v15];

  unint64_t v16 = (void *)MEMORY[0x263F82400];
  char v17 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v18 = [v17 localizedStringForKey:@"OK" value:&stru_26C10E100 table:0];
  double v19 = [v16 actionWithTitle:v18 style:0 handler:&__block_literal_global_849];
  [v11 addAction:v19];

  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_847(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained viewControllerManager];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 showNoteWithIdentifier:v3];
}

- (void)reloadCurrentNote
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  id v8 = [(ICNoteEditorBaseViewController *)self note];
  [(ICNoteEditorViewController *)self setNote:0];
  [(ICNoteEditorViewController *)self setNote:v8];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v7, "setSelectedRange:", v4, v6);
}

- (void)noteDidDeauthenticateAfterMerge:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v4 = [v6 object];
    uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];

    if (v4 == v5) {
      [(ICNoteEditorViewController *)self noteDecryptedStatusDidChange:v6];
    }
  }
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5A9D8]];
  uint64_t v7 = ICCheckedDynamicCast();

  id v8 = [MEMORY[0x263F5ABC0] sharedState];
  if ([v8 isBlockingDeauthentication])
  {
  }
  else
  {
    if (v7)
    {
      id v9 = [(ICNoteEditorBaseViewController *)self note];
      long long v10 = [v9 objectID];
      int v11 = [v7 isEqual:v10];

      if (!v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    dispatchMainAfterDelay();
  }
LABEL_8:
}

void __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) note];
  int v3 = [v2 isPasswordProtected];

  if (v3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "note", 0);
    uint64_t v5 = [v4 attachments];
    id v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) checkPreviewImagesIntegrity];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v7);
    }

    uint64_t v10 = [*(id *)(a1 + 32) note];
    [(id)v10 mergeUnappliedEncryptedRecordRecursivelyInBackground];

    [*(id *)(a1 + 32) showOrHidePasswordEntryViewControllerIfNeeded];
    int v11 = [*(id *)(a1 + 32) note];
    LOBYTE(v10) = v11 == 0;

    if ((v10 & 1) == 0)
    {
      long long v12 = [*(id *)(a1 + 32) note];
      int v13 = [v12 isAuthenticated];

      if (v13)
      {
        dispatchMainAfterDelay();
        [*(id *)(a1 + 32) updateDrawingAttachmentsIfNeeded];
      }
      else
      {
        uint64_t v14 = [*(id *)(a1 + 32) note];
        int v15 = [v14 isPasswordProtected];

        if (v15)
        {
          unint64_t v16 = [*(id *)(a1 + 32) viewControllerManager];
          char v17 = [v16 currentAttachmentPresenter];
          [v17 dismissAnimated:0 completion:0];
        }
        uint64_t v18 = [*(id *)(a1 + 32) calculateScrubberController];

        if (v18)
        {
          double v19 = [*(id *)(a1 + 32) calculateScrubberController];
          [v19 hideScrubber];
        }
        BOOL v20 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v30 = 0;
        id v31 = &v30;
        uint64_t v32 = 0x2020000000;
        id v21 = (void *)getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr;
        uint64_t v33 = getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr;
        if (!getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr)
        {
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_block_invoke;
          v29[3] = &unk_2640B9818;
          void v29[4] = &v30;
          __getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_block_invoke((uint64_t)v29);
          id v21 = (void *)v31[3];
        }
        _Block_object_dispose(&v30, 8);
        if (!v21)
        {
          __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
          __break(1u);
        }
        [v20 postNotificationName:*v21 object:0];

        id v22 = [MEMORY[0x263F086E0] mainBundle];
        double v23 = [v22 localizedStringForKey:@"Notes Locked" value:&stru_26C10E100 table:0];

        ICAccessibilityPostHighPriorityAnnouncementNotification();
      }
    }
    uint64_t v24 = [*(id *)(a1 + 32) textView];
    [v24 icaxClearCaches];
  }
}

void __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_2()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 localizedStringForKey:@"Notes Unlocked" value:&stru_26C10E100 table:0];

  ICAccessibilityPostHighPriorityAnnouncementNotification();
}

uint64_t __45__ICNoteEditorViewController_dynamicBarColor__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:1];
}

- (int64_t)preferredStatusBarStyle
{
  if ([(ICNoteEditorViewController *)self shouldForceLightContent]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)hideAndDismissPresentedViewController
{
  int v3 = [(ICNoteEditorViewController *)self presentedViewController];
  id v4 = [v3 view];
  [v4 setHidden:1];

  uint64_t v5 = objc_opt_class();
  id v6 = [(ICNoteEditorViewController *)self presentedViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__ICNoteEditorViewController_hideAndDismissPresentedViewController__block_invoke;
  v7[3] = &unk_2640B8140;
  void v7[4] = self;
  [v5 dismissChildPresentedViewControllersInPostOrder:v6 animated:0 completion:v7];
}

uint64_t __67__ICNoteEditorViewController_hideAndDismissPresentedViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupAfterBarSourcedPopoverPresentation];
}

+ (void)dismissChildPresentedViewControllersInPostOrder:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = [v11 presentedViewController];

  if (v9)
  {
    uint64_t v10 = [v11 presentedViewController];
    [a1 dismissChildPresentedViewControllersInPostOrder:v10 animated:0 completion:0];
  }
  [v11 dismissViewControllerAnimated:v6 completion:v8];
}

- (void)resetTextViewContentOffset
{
  int v3 = [(ICNoteEditorViewController *)self textView];
  [v3 contentOffset];
  double v5 = v4;

  [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
  double v7 = -v6;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromTop];
    double v7 = v7 - v8;
  }
  id v9 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v9, "resetContentOffset:", v5, v7);
}

- (ICNoteContext)noteContext
{
  return (ICNoteContext *)[MEMORY[0x263F5ACA0] sharedContext];
}

- (int64_t)currentWritingDirection
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  int64_t v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (BOOL)ignoresTaps
{
  if (ICInternalSettingsIsTextKit2Enabled()) {
    return self->_ignoresTaps;
  }
  double v4 = [(ICNoteEditorViewController *)self textViewController];
  char v5 = [v4 ignoresTaps];

  return v5;
}

- (void)setIgnoresTaps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    self->_ignoresTaps = v3;
    if (v3)
    {
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      long long v24 = 0uLL;
      long long v25 = 0uLL;
      char v5 = [(ICNoteEditorViewController *)self textView];
      double v6 = [v5 subviews];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v11 isUserInteractionEnabled])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                long long v12 = [(ICNoteEditorViewController *)self enabledSubviews];
                [v12 addObject:v11];

                [v11 setUserInteractionEnabled:0];
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v8);
      }
    }
    else
    {
      long long v22 = 0uLL;
      long long v23 = 0uLL;
      long long v20 = 0uLL;
      long long v21 = 0uLL;
      int v13 = [(ICNoteEditorViewController *)self enabledSubviews];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * j) setUserInteractionEnabled:1];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v15);
      }

      double v6 = [(ICNoteEditorViewController *)self enabledSubviews];
      [v6 removeAllObjects];
    }

    uint64_t v18 = [(ICNoteEditorViewController *)self textView];
    [v18 setSelectable:v3 ^ 1];
  }
  else
  {
    id v19 = [(ICNoteEditorViewController *)self textViewController];
    [v19 setIgnoresTaps:v3];
  }
}

- (ICAttributionSidebarView)attributionSidebarView
{
  id v2 = [(ICNoteEditorViewController *)self textViewController];
  BOOL v3 = [v2 attributionSidebarView];

  return (ICAttributionSidebarView *)v3;
}

void __55__ICNoteEditorViewController_updateUnsupportedNoteView__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    BOOL v3 = [MEMORY[0x263F5ACA0] sharedContext];
    id v4 = objc_loadWeakRetained(v1);
    v6[0] = v4;
    char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [v3 undoablyTrashOrDeleteNotes:v5];
  }
}

void __44__ICNoteEditorViewController_setInvitation___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v8 = objc_loadWeakRetained(v2);
    char v5 = [*(id *)(a1 + 32) shareURL];
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = [v6 invitationViewController];
    objc_msgSend(v8, "collaborationButtons_acceptInviteWithShareURL:invitationViewController:", v5, v7);
  }
}

- (BOOL)isPasswordEntryShowing
{
  id v2 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    id v8 = WeakRetained;
    char v4 = [WeakRetained eventReporter];
    char v5 = [v8 note];
    [v4 submitPasswordSuccessEventForModernNote:v5];

    id v6 = [v8 note];
    LODWORD(v5) = [v6 isAuthenticated];

    id WeakRetained = v8;
    if (v5)
    {
      uint64_t v7 = [v8 passwordEntryViewController];

      id WeakRetained = v8;
      if (v7)
      {
        [v8 showOrHidePasswordEntryViewControllerIfNeeded];
        id WeakRetained = v8;
      }
    }
  }
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_3(id *a1, int a2)
{
  if (a2)
  {
    id v3 = [a1[4] passwordEntryViewController];
    id v4 = a1[5];

    if (v3 == v4)
    {
      id v5 = a1[6];
      id v6 = [a1[4] note];
      if (v5 == v6)
      {
        int v7 = [a1[6] isAuthenticated];

        if (v7)
        {
          [a1[4] resetDateView];
          id v8 = [a1[5] view];
          [v8 removeFromSuperview];

          [a1[4] removeChildViewController:a1[5]];
          [a1[4] setPasswordEntryViewController:0];
          [a1[4] showOrHideActivityStreamToolbarIfNeeded];
          if ([a1[4] shouldBeginEditingAfterNoteUnlock])
          {
            [a1[4] setShouldBeginEditingAfterNoteUnlock:0];
            [a1[4] startEditing];
          }
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_4;
          v9[3] = &unk_2640B8140;
          void v9[4] = a1[4];
          [MEMORY[0x263F82E00] animateWithDuration:v9 animations:0.25];
        }
      }
      else
      {
      }
    }
  }
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textView];
  [v1 setAlpha:1.0];
}

void __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 removeFromSuperview];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (!a3 && [(ICNoteEditorViewController *)self isEditing])
  {
    [(ICNoteEditorViewController *)self setEditing:0 animated:0];
  }
}

- (void)prepareForBarSourcedPopoverPresentation
{
  [(ICNoteEditorViewController *)self setUserInteractionEnabled:0];
  if (([(ICNoteEditorViewController *)self isEditing] & 1) == 0)
  {
    id v3 = [(ICNoteEditorViewController *)self textView];
    id v4 = [v3 selectedTextRange];
    [(ICNoteEditorViewController *)self setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:v4];

    id v5 = [(ICNoteEditorViewController *)self textView];
    [v5 setSelectedTextRange:0];
  }
}

- (void)cleanupAfterBarSourcedPopoverPresentation
{
  [(ICNoteEditorViewController *)self setUserInteractionEnabled:1];
  id v3 = [(ICNoteEditorViewController *)self selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation];

  if (v3)
  {
    id v4 = [(ICNoteEditorViewController *)self selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation];
    id v5 = [(ICNoteEditorViewController *)self textView];
    [v5 setSelectedTextRange:v4];

    [(ICNoteEditorViewController *)self setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:0];
  }
}

- (id)addQuickNoteWithPencil:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    id v19 = "-[ICNoteEditorViewController addQuickNoteWithPencil:]";
    __int16 v20 = 1024;
    int v21 = 6036;
    _os_log_impl(&dword_20BE60000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v18, 0x12u);
  }

  if ([(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
  {
    id v6 = [(ICNoteEditorViewController *)self textView];
    if ([v6 isFirstResponder])
    {
      BOOL v7 = !v3;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
      if ([v9 userInterfaceIdiom]) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = !v3;
      }
    }
    uint64_t v10 = (void *)MEMORY[0x263F5AB58];
    id v11 = [MEMORY[0x263F5ACA0] sharedContext];
    long long v12 = [v11 managedObjectContext];
    int v13 = [v10 defaultAccountInContext:v12];

    uint64_t v14 = [v13 defaultFolder];
    uint64_t v15 = (void *)[MEMORY[0x263F5AC98] newEmptyNoteInFolder:v14];
    uint64_t v16 = [(ICNoteEditorViewController *)self eventReporter];
    [v16 submitNoteCreateEventForModernNote:v15 createApproach:12];

    [(ICNoteEditorViewController *)self setNote:v15];
    [(ICNoteEditorViewController *)self updateBarButtons];
    [(ICNoteEditorViewController *)self setupLinedPaperOnNewNote:v15 willStartEditing:v7];
    if (v7) {
      [(ICNoteEditorViewController *)self startEditing];
    }
    id v8 = [(ICNoteEditorBaseViewController *)self note];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)addNewNote
{
  return [(ICNoteEditorViewController *)self addNewNoteWithEvent:0];
}

- (id)addNewNoteWithEvent:(id)a3
{
  id v4 = (ICNoteEditorViewController *)a3;
  [(ICNoteEditorViewController *)self saveNote];
  if ([(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
  {
    id v5 = [(ICNoteEditorViewController *)self addQuickNoteWithPencil:[(ICNoteEditorViewController *)v4 ic_isPencilEvent]];
  }
  else
  {
    BOOL v6 = [(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper];
    BOOL v7 = [(ICNoteEditorViewController *)self viewControllerManager];
    id v8 = v7;
    if (v4) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = self;
    }
    if (v6) {
      uint64_t v10 = 18;
    }
    else {
      uint64_t v10 = 2;
    }
    id v5 = [v7 showNewNoteWithApproach:v10 sender:v9 animated:1];
  }

  return v5;
}

- (void)setupLinedPaperOnNewNote:(id)a3 willStartEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  BOOL v6 = [MEMORY[0x263F5AEB0] objectForKey:@"PaperStyle"];
  BOOL v7 = ICCheckedDynamicCast();
  unsigned int v8 = [v7 intValue];

  if (v8 <= 1) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  if (v4)
  {
    uint64_t v10 = v9;
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__ICNoteEditorViewController_setupLinedPaperOnNewNote_willStartEditing___block_invoke;
    v12[3] = &unk_2640B94E8;
    id v13 = v5;
    uint64_t v14 = v10;
    dispatch_after(v11, MEMORY[0x263EF83A0], v12);
  }
  else
  {
    [v5 setPaperStyleType:(__int16)v9];
  }
}

uint64_t __72__ICNoteEditorViewController_setupLinedPaperOnNewNote_willStartEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPaperStyleType:*(__int16 *)(a1 + 40)];
}

- (void)addNote:(id)a3
{
}

- (void)addNote:(id)a3 event:(id)a4 shouldInstrumentAsNewNoteAffordanceUsage:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  if (v5)
  {
    BOOL v7 = [(ICNoteEditorViewController *)self eventReporter];
    [v7 pushNoteCreateDataWithCreateApproach:2];

    id v8 = [(ICNoteEditorViewController *)self addNewNoteWithEvent:v11];
    int v9 = [(ICNoteEditorViewController *)self eventReporter];
    [v9 popNoteCreateData];
  }
  else
  {
    id v10 = [(ICNoteEditorViewController *)self addNewNoteWithEvent:v11];
  }
}

- (void)addNewNoteIfNeeded
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x263F5B520] sharedInstance];
    int v5 = [v4 isQuickNoteSessionActive];

    if (v5)
    {
      id v6 = [(ICNoteEditorViewController *)self addQuickNoteWithPencil:1];
    }
    else
    {
      id v8 = [(ICNoteEditorViewController *)self viewControllerManager];
      id v7 = (id)[v8 showNewNoteWithApproach:0 sender:self animated:1];
    }
  }
}

- (void)deleteCurrentNote:(id)a3
{
  id v4 = a3;
  if (![(ICNoteEditorViewController *)self isPerformingDeleteAnimation])
  {
    int v5 = [(ICNoteEditorBaseViewController *)self note];

    if (v5)
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      id v11 = __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke;
      long long v12 = &unk_2640B82D8;
      id v13 = self;
      id v14 = v4;
      id v6 = (void (**)(void))_Block_copy(&v9);
      objc_opt_class();
      id v7 = [(ICNoteEditorViewController *)self presentedViewController];
      id v8 = ICDynamicCast();

      if (v8) {
        [v8 dismissViewControllerAnimated:1 completion:v6];
      }
      else {
        v6[2](v6);
      }
    }
  }
}

void __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) note];
  [*(id *)(a1 + 32) setSuspendBarButtonUpdates:1];
  if ([*(id *)(a1 + 32) isEditing]) {
    [*(id *)(a1 + 32) setEditing:0 animated:1];
  }
  id v3 = objc_alloc(NSClassFromString(&cfstr_Icdeletedecisi.isa));
  v17[0] = v2;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  int v5 = [*(id *)(a1 + 32) view];
  id v6 = [v5 window];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) eventReporter];
  uint64_t v9 = (void *)[v3 initWithSourceObjects:v4 window:v6 sender:v7 eventReporter:v8];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke_2;
  id v14 = &unk_2640B9510;
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v10;
  [v9 performDecisionWithCompletion:&v11];
  if (!v9) {
    objc_msgSend(*(id *)(a1 + 32), "setSuspendBarButtonUpdates:", 0, v11, v12, v13, v14, v15);
  }
}

uint64_t __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) performDeleteAnimation:*(void *)(a1 + 40)];
    id v3 = [MEMORY[0x263F5B520] sharedInstance];
    int v4 = [v3 isQuickNoteSessionActive];

    if (v4) {
      id v5 = (id)[*(id *)(a1 + 32) addQuickNoteWithPencil:0];
    }
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 setSuspendBarButtonUpdates:0];
}

- (void)performDeleteAnimation:(id)a3
{
  id v4 = a3;
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper])
  {
    id v5 = [v4 view];
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v7 = [(ICNoteEditorViewController *)self navigationItem];
    id v8 = [v7 rightBarButtonItem];
    uint64_t v9 = [v8 view];

    if (!v9)
    {
LABEL_3:
      int v6 = 0;
      if (v5)
      {
LABEL_7:
        [(ICNoteEditorViewController *)self setIsPerformingDeleteAnimation:1];
        uint64_t v12 = [(ICNoteEditorViewController *)self backgroundView];
        id v13 = [v12 contentView];
        id v14 = objc_alloc(MEMORY[0x263F82E00]);
        [v13 bounds];
        uint64_t v15 = objc_msgSend(v14, "initWithFrame:");
        [v13 frame];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        long long v24 = [v12 snapshotViewAfterScreenUpdates:0];
        if (UIAccessibilityIsReduceMotionEnabled())
        {
          long long v25 = 0;
        }
        else
        {
          long long v25 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v17, v19, v21, v23);
          long long v26 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
          [v25 setBackgroundColor:v26];

          if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
            objc_msgSend(v25, "ic_applyRoundedCornersFromView:", v13);
          }
          [v15 addSubview:v25];
        }
        [v15 addSubview:v24];
        long long v27 = [(ICNoteEditorViewController *)self backgroundView];
        [v27 addSubviewAboveAllViews:v15];

        [v5 bounds];
        objc_msgSend(v15, "convertRect:fromView:", v5);
        if (v6)
        {
          CGRectGetWidth(*(CGRect *)&v28);
          [(ICNoteEditorViewController *)self ic_isRTL];
        }
        uint64_t v35 = v24;
        CGRect v36 = v15;
        id v32 = v15;
        id v33 = v25;
        id v34 = v24;
        dispatchMainAfterDelay();
      }
    }
    else
    {
      uint64_t v10 = [(ICNoteEditorViewController *)self navigationItem];
      uint64_t v11 = [v10 rightBarButtonItem];
      id v5 = [v11 view];

      int v6 = 1;
      if (v5) {
        goto LABEL_7;
      }
    }
  }
}

void __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_2;
  v9[3] = &unk_2640B8B58;
  id v10 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = v3;
  id v11 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_3;
  v6[3] = &unk_2640B9510;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _animateUsingDefaultTimingWithOptions:0 animations:v9 completion:v6];
}

uint64_t __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_2(uint64_t a1)
{
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v2 = *(void **)(a1 + 32);
    return [v2 setAlpha:0.0];
  }
  else
  {
    CGAffineTransformMakeRotation(&v11, 0.42062435);
    id v4 = *(void **)(a1 + 32);
    CGAffineTransform v10 = v11;
    [v4 setTransform:&v10];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 transform];
      int v6 = *(void **)(a1 + 32);
    }
    else
    {
      int v6 = 0;
      memset(&v8, 0, sizeof(v8));
    }
    CGAffineTransformScale(&v9, &v8, 0.01, 0.01);
    CGAffineTransform v7 = v9;
    [v6 setTransform:&v7];
    TSDCenterOfRect();
    objc_msgSend(*(id *)(a1 + 32), "setCenter:");
    return [*(id *)(a1 + 40) setAlpha:0.0];
  }
}

uint64_t __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) setIsPerformingDeleteAnimation:0];
  [*(id *)(a1 + 40) setSuspendBarButtonUpdates:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 updateBarButtons];
}

- (void)moveToFolderPressed:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(ICNoteEditorViewController *)self app_showMoveToFolder];
  }
}

- (void)quickNoteAllNotes:(id)a3
{
  [(ICNoteEditorViewController *)self didEndEditingNote];
  id v4 = [(ICNoteEditorViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICNoteEditorViewController *)self delegate];
    [v6 noteEditorDidTapAllNotes:self];
  }
}

- (void)gridViewBack:(id)a3
{
}

- (void)lockBarButtonPressed:(id)a3
{
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  int v5 = [v4 isAuthenticated];

  if (v5)
  {
    [(ICNoteEditorViewController *)self saveNote];
    id v6 = [MEMORY[0x263F5ABC0] sharedState];
    [v6 deauthenticate];

    [(ICNoteEditorViewController *)self stopTextFindingIfNecessary];
    CGAffineTransform v7 = [(ICNoteEditorBaseViewController *)self note];
    id v12 = [v7 account];

    CGAffineTransform v8 = v12;
    if (!v12) {
      goto LABEL_6;
    }
    CGAffineTransform v9 = [MEMORY[0x263F5B3B0] sharedMigrator];
    CGAffineTransform v10 = [(ICNoteEditorViewController *)self view];
    CGAffineTransform v11 = [v10 window];
    [v9 showMigrationPromptAndMigrateIfNeededForAccount:v12 window:v11];
  }
  else
  {
    id v12 = [(ICNoteEditorViewController *)self passwordEntryViewController];
    [v12 beginAuthentication];
  }
  CGAffineTransform v8 = v12;
LABEL_6:
}

- (void)iCloudShareButtonPressed:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICNoteEditorViewController *)self delegate];
    [v6 noteEditorDidTapAddPeople:self];
  }
  else
  {
    id v6 = [(ICNoteEditorViewController *)self view];
    objc_msgSend(v6, "ic_crashIfWindowIsSecure");
  }
}

- (void)shareButtonPressedWithSender:(id)a3
{
  id v12 = a3;
  id v4 = [(ICNoteEditorViewController *)self textView];
  uint64_t v5 = [v4 findInteraction];
  [(id)v5 dismissFindNavigator];

  id v6 = [(ICNoteEditorViewController *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(ICNoteEditorViewController *)self delegate];
    [v7 noteEditorDidTapAddPeople:self];
  }
  else
  {
    CGAffineTransform v8 = [(ICNoteEditorViewController *)self view];
    objc_msgSend(v8, "ic_crashIfWindowIsSecure");

    objc_opt_class();
    CGAffineTransform v9 = ICDynamicCast();
    CGAffineTransform v10 = v9;
    if (v9)
    {
      id v7 = v9;
    }
    else
    {
      CGAffineTransform v11 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
      id v7 = [v11 shareBarButtonItem];
    }
    if (objc_opt_respondsToSelector()) {
      [(ICNoteEditorViewController *)self performSelector:sel_app_shareButtonPressed_ withObject:v7];
    }
  }
}

- (void)createAndPresentCloudSharingControllerBySender:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self app_createAndPresentCloudSharingControllerBySender:v4];
  }
}

- (void)didBeginFindInteraction
{
  long long v3 = [(ICNoteEditorViewController *)self noteFormattingController];
  int v4 = objc_msgSend(v3, "ic_isViewVisible");

  if (v4) {
    [(ICNoteEditorViewController *)self showStyleSelector:0 animated:1];
  }
  if ([(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    [(ICNoteEditorViewController *)self setInkPickerState:2];
    [(ICNoteEditorViewController *)self hideInkPicker];
  }
  id v5 = [(ICNoteEditorViewController *)self findResultReporter];
  [v5 startTrackingFindSession];
}

- (void)didUpdateSearchQueryInFindInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self findResultReporter];
  [v5 updateWithSearchQuery:v4];
}

- (void)didEndFindInteraction
{
  [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
  [(ICNoteEditorViewController *)self clearTextViewSelection];
  id v4 = [(ICNoteEditorViewController *)self findResultReporter];
  long long v3 = [(ICNoteEditorBaseViewController *)self note];
  [v4 submitEventIfApplicableForNote:v3];
}

- (void)performFindInNote:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [v4 findInteraction];
  [v5 presentFindNavigatorShowingReplace:0];

  [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
}

- (void)performReplaceInNote:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [v4 findInteraction];
  [v5 presentFindNavigatorShowingReplace:1];

  [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
}

- (void)doneEditing
{
  [(ICNoteEditorViewController *)self didEndEditingNote];
  [(ICNoteEditorViewController *)self doneEditing:0];

  [(ICNoteEditorViewController *)self becomeFirstResponder];
}

- (void)doneEditing:(id)a3
{
  if ([(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    [(ICNoteEditorViewController *)self setInkPickerState:2];
    [(ICNoteEditorViewController *)self hideInkPicker];
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__ICNoteEditorViewController_doneEditing___block_invoke;
    aBlock[3] = &unk_2640B8140;
    aBlock[4] = self;
    id v4 = (void (**)(void))_Block_copy(aBlock);
    id v5 = [(ICNoteEditorViewController *)self keyboardDidShowAnimationDate];

    if (v5)
    {
      id v6 = [MEMORY[0x263EFF910] date];
      id v7 = [(ICNoteEditorViewController *)self keyboardDidShowAnimationDate];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      if (v9 < 0.3
        && ([(ICNoteEditorViewController *)self textView],
            CGAffineTransform v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v10 isScrolling],
            v10,
            v11))
      {
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        double v17 = __42__ICNoteEditorViewController_doneEditing___block_invoke_2;
        double v18 = &unk_2640B8B80;
        double v19 = v4;
        dispatchMainAfterDelay();
      }
      else
      {
        v4[2](v4);
      }
    }
    else
    {
      v4[2](v4);
    }
  }
  id v12 = [(ICNoteEditorViewController *)self calculateScrubberController];
  int v13 = [v12 isShowing];

  if (v13)
  {
    id v14 = [(ICNoteEditorViewController *)self calculateScrubberController];
    [v14 hideScrubber];
  }
  [(ICNoteEditorViewController *)self submitNoteEditEventIfNecessary];
}

uint64_t __42__ICNoteEditorViewController_doneEditing___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEditing];
  if (result)
  {
    if (([*(id *)(a1 + 32) shouldUseiPadBarLayout] & 1) == 0)
    {
      long long v3 = [*(id *)(a1 + 32) navigationController];
      [v3 setToolbarHidden:0 animated:0];
    }
    id v4 = [*(id *)(a1 + 32) textView];
    int v5 = [v4 isWritingToolsActive];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) textView];
      id v7 = [v6 writingToolsCoordinator];
      [v7 stopWritingTools];
    }
    double v8 = *(void **)(a1 + 32);
    return [v8 setEditing:0 animated:1];
  }
  return result;
}

uint64_t __42__ICNoteEditorViewController_doneEditing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)toggleTodoStyle:(id)a3
{
  id v14 = a3;
  id v4 = [(ICNoteEditorViewController *)self attributionSidebarController];
  [v4 hideSidebarAnimated:1];

  int v5 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v5)
  {
    id v6 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v6 toggleTodoStyle:v14];
  }
  else
  {
    id v6 = [(ICNoteEditorViewController *)self textController];
    id v7 = [(ICNoteEditorViewController *)self textView];
    objc_opt_class();
    double v8 = [v7 textStorage];
    double v9 = ICCheckedDynamicCast();

    uint64_t v10 = [v7 selectedRange];
    id v12 = objc_msgSend(v6, "todoForRange:inTextStorage:", v10, v11, v9);
    if (v12)
    {
      [(ICNoteEditorViewController *)self setCurrentTextStyle:3];
    }
    else
    {
      [(ICNoteEditorViewController *)self setCurrentTextStyle:103];
      [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:1];
    }
    [(ICNoteEditorViewController *)self showStyleSelector:0 animated:1];
    [(ICNoteEditorViewController *)self updateBarButtons];
    int v13 = [(ICNoteEditorViewController *)self textView];
    [v13 icaxClearCaches];
  }
}

- (void)toggleTodoChecked:(id)a3
{
  id v4 = a3;
  int v5 = [(ICNoteEditorBaseViewController *)self note];
  char v6 = [v5 isEditable];

  if (v6)
  {
    id v7 = [(ICNoteEditorViewController *)self textView];
    uint64_t v8 = [v7 selectedRange];
    uint64_t v10 = v9;

    uint64_t v11 = [(ICNoteEditorViewController *)self textController];
    id v12 = [(ICNoteEditorViewController *)self textView];
    int v13 = [(ICNoteEditorViewController *)self textView];
    id v14 = [v13 textStorage];
    int v15 = objc_msgSend(v11, "paragraphStyleForRange:inTextView:inTextStorage:", v8, v10, v12, v14);

    if (v15 == 103)
    {
      uint64_t v16 = [(ICNoteEditorViewController *)self textController];
      double v17 = [(ICNoteEditorViewController *)self textView];
      double v18 = [v17 textStorage];
      int v19 = objc_msgSend(v16, "isTodoDoneRange:inTextStorage:", v8, v10, v18);

      double v20 = [(ICNoteEditorViewController *)self textController];
      double v21 = [(ICNoteEditorViewController *)self textView];
      double v22 = [v21 textStorage];
      objc_msgSend(v20, "setDone:range:inTextStorage:", v19 ^ 1u, v8, v10, v22);

      if (v19) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 3;
      }
      [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:v23];
      long long v24 = [(ICNoteEditorViewController *)self textController];
      long long v25 = [(ICNoteEditorViewController *)self textView];
      long long v26 = [v24 expandedChecklistTrackedParagraphsInTextView:v25 forIndex:v8];
      long long v27 = [v26 firstObject];

      objc_initWeak(&location, self);
      uint64_t v28 = [(ICNoteEditorViewController *)self textController];
      long long v29 = [(ICNoteEditorViewController *)self textView];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __48__ICNoteEditorViewController_toggleTodoChecked___block_invoke;
      v32[3] = &unk_2640B8FB8;
      objc_copyWeak(&v33, &location);
      [v28 autoSortChecklistIfNecessaryForTrackedParagraph:v27 textView:v29 analyticsHandler:v32];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v30 = [(ICNoteEditorBaseViewController *)self note];
    int v31 = [v30 isDeletedOrInTrash];

    if (v31) {
      [(ICNoteEditorViewController *)self showRecoverNoteAlert];
    }
  }
}

void __48__ICNoteEditorViewController_toggleTodoChecked___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = [WeakRetained eventReporter];
  [v3 submitMoveCheckedItemsToBottomSwitchEventWithNewState:a2 isInApp:1];
}

- (void)changeStyle:(id)a3
{
}

- (void)setTitleStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:0];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:1];
}

- (void)setHeadingStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:1];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:2];
}

- (void)setSubheadingStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:2];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:3];
}

- (void)setBodyStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:3];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:4];
}

- (void)setFixedWidthStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:4];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:5];
}

- (void)setBulletedListStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:100];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:6];
}

- (void)setDashedListStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:101];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:7];
}

- (void)setNumberedListStyle:(id)a3
{
  [(ICNoteEditorViewController *)self setCurrentTextStyle:102];
  id v5 = [(ICNoteEditorViewController *)self eventReporter];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v5 submitStyleFormatEventForModernNote:v4 styleTypeValue:8];
}

- (void)prepareSelectionForAddingAttachment
{
  if (([(ICNoteEditorViewController *)self isEditing] & 1) == 0)
  {
    long long v3 = [(ICNoteEditorViewController *)self textView];
    id v4 = [v3 textStorage];
    uint64_t v5 = [v4 length];

    id v6 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v6, "setSelectedRange:", v5, 0);
  }
}

- (void)createTodoListItem:(id)a3
{
  id v15 = a3;
  id v4 = [(ICNoteEditorViewController *)self attributionSidebarController];
  [v4 hideSidebarAnimated:1];

  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  uint64_t v8 = v7;

  if ([(ICNoteEditorViewController *)self isEditing])
  {
    [(ICNoteEditorViewController *)self toggleTodoStyle:v15];
  }
  else if (v6 == 0x7FFFFFFFFFFFFFFFLL || !v8)
  {
    [(ICNoteEditorViewController *)self addTodoListAtEndOfNote];
  }
  else
  {
    objc_opt_class();
    uint64_t v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = [v9 textStorage];
    uint64_t v11 = ICCheckedDynamicCast();

    id v12 = [(ICNoteEditorViewController *)self textController];
    int v13 = objc_msgSend(v12, "containsOnlyStyle:inRange:inTextStorage:", 103, v6, v8, v11);

    if (v13) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 103;
    }
    [(ICNoteEditorViewController *)self setCurrentTextStyle:v14];
    [(ICNoteEditorViewController *)self startEditing];
  }
}

- (void)addTodoListAtEndOfNote
{
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    long long v3 = [(ICNoteEditorViewController *)self viewControllerManager];
    char v4 = [v3 isWelcomeScreenVisible];

    if (v4) {
      return;
    }
    [(ICNoteEditorViewController *)self addNewNoteIfNeeded];
    id v25 = [(ICNoteEditorViewController *)self textView];
    objc_opt_class();
    uint64_t v5 = [v25 textStorage];
    uint64_t v6 = ICCheckedDynamicCast();

    uint64_t v7 = [v6 length];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v6 string];
      uint64_t v10 = [v9 characterAtIndex:v8 - 1];

      uint64_t v11 = [MEMORY[0x263F08708] newlineCharacterSet];
      if ([v11 characterIsMember:v10])
      {
        id v12 = [(ICNoteEditorViewController *)self textController];
        int v13 = [(ICNoteEditorViewController *)self textView];
        int v14 = objc_msgSend(v12, "paragraphStyleForRange:inTextView:inTextStorage:", v8 - 1, 1, v13, v6);

        if (v14 == 103)
        {
          if (v8 == 1)
          {
            uint64_t v8 = 0;
          }
          else
          {
            id v15 = [v6 string];
            uint64_t v16 = [v15 characterAtIndex:v8 - 2];

            if ([v11 characterIsMember:v16])
            {
              --v8;
            }
            else
            {
              uint64_t v23 = [(ICNoteEditorViewController *)self textController];
              [v23 insertNewlineAtCharacterIndex:v8 - 1 textStorage:v6];
            }
          }

          long long v24 = [(ICNoteEditorViewController *)self textView];
          objc_msgSend(v24, "setSelectedRange:", v8, 0);

          goto LABEL_17;
        }
      }
      else
      {
        objc_msgSend(v25, "setSelectedRange:", v8, 0);
        [v25 insertText:@"\n"];
        uint64_t v8 = [v6 length];
      }

      double v17 = [(ICNoteEditorViewController *)self textView];
      double v18 = v17;
      uint64_t v19 = v8;
    }
    else
    {
      double v17 = [(ICNoteEditorViewController *)self textView];
      double v18 = v17;
      uint64_t v19 = 0;
    }
    objc_msgSend(v17, "setSelectedRange:", v19, 0);

    [(ICNoteEditorViewController *)self setCurrentTextStyle:103];
LABEL_17:
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      objc_opt_class();
      double v20 = [(ICNoteEditorViewController *)self textView];
      double v21 = [v20 layoutManager];
      double v22 = ICDynamicCast();

      [v22 updateVisibleSupplementalViews];
    }
    [(ICNoteEditorViewController *)self startEditing];
    [(ICNoteEditorViewController *)self updateBarButtons];

    return;
  }

  [(ICNoteEditorViewController *)self setAddToDoListAfterViewAppears:1];
}

- (void)cleanupAfterAddImageAttachmentOperation
{
  [(ICNoteEditorViewController *)self setIsAddingImageAttachment:0];
  [MEMORY[0x263F82E10] attemptRotationToDeviceOrientation];
  if ([(ICNoteEditorViewController *)self didEndEditingForAddingImageAttachment])
  {
    long long v3 = [(ICNoteEditorViewController *)self textView];
    [v3 setShouldAvoidBecomingFirstResponder:0];

    if (!+[ICExtensionSafeAPIShims applicationState]) {
      [(ICNoteEditorViewController *)self startEditing];
    }
    [(ICNoteEditorViewController *)self setDidEndEditingForAddingImageAttachment:0];
  }
}

- (BOOL)isDocumentCameraAvailable
{
  if (objc_msgSend(MEMORY[0x263F82438], "ic_isExtension")) {
    return 0;
  }
  long long v3 = (void *)MEMORY[0x263F5AE70];

  return [v3 isCameraAvailable];
}

- (BOOL)isPhotosLibraryAvailable
{
  int v3 = [MEMORY[0x263F82808] isSourceTypeAvailable:0];
  if (v3) {
    LOBYTE(v3) = ![(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen];
  }
  return v3;
}

- (void)showInsertUIWithPreferredSourceType:(unint64_t)a3
{
  if ([(ICNoteEditorViewController *)self ic_isViewVisible])
  {
    switch(a3)
    {
      case 1uLL:
        if (([MEMORY[0x263F5AE70] isCameraAvailable] & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 3uLL:
        if (objc_msgSend(MEMORY[0x263F82670], "ic_isLiveTextAvailable")) {
          goto LABEL_19;
        }
        goto LABEL_18;
      case 4uLL:
        if ([(ICNoteEditorViewController *)self isDocumentCameraAvailable]) {
          goto LABEL_19;
        }
        goto LABEL_18;
      case 6uLL:
        if ((objc_msgSend(MEMORY[0x263F82670], "ic_isVision") & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
LABEL_18:
        if ([MEMORY[0x263F82808] isSourceTypeAvailable:1])
        {
LABEL_19:
          [(ICNoteEditorViewController *)self showInsertUIForSourceType:a3 sender:0];
        }
        else if ([(ICNoteEditorViewController *)self isPhotosLibraryAvailable])
        {
          [(ICNoteEditorViewController *)self showPhotoLibrary];
        }
        break;
    }
  }
  else if (a3 == 4)
  {
    [(ICNoteEditorViewController *)self setAddDocumentScanAfterViewAppears:1];
  }
  else if (a3 == 1)
  {
    [(ICNoteEditorViewController *)self setShowInsertUIAfterViewAppears:1];
  }
}

- (void)showPhotoLibrary
{
}

- (void)attachFile:(id)a3
{
  id v6 = a3;
  char v4 = [(ICNoteEditorBaseViewController *)self note];
  char v5 = [v4 canAddAttachment];

  if (v5)
  {
    [(ICNoteEditorViewController *)self prepareSelectionForAddingAttachment];
    [(ICNoteEditorViewController *)self showInsertUIForSourceType:5 sender:v6];
  }
  else
  {
    [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
  }
}

- (void)showInsertUIForSourceType:(unint64_t)a3 sender:(id)a4
{
  uint64_t v6 = [(ICNoteEditorBaseViewController *)self note];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [(ICNoteEditorBaseViewController *)self note],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 canAddAttachment],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
  }
  else
  {
    [(ICNoteEditorViewController *)self addNewNoteIfNeeded];
    [(ICNoteEditorViewController *)self prepareSelectionForAddingAttachment];
    [(ICNoteEditorViewController *)self showInkPicker:0 animated:1];
    switch(a3)
    {
      case 1uLL:
        if ([(ICNoteEditorViewController *)self isEditing]) {
          [(ICNoteEditorViewController *)self setEditing:0 animated:1];
        }
        id v26 = [(ICNoteEditorViewController *)self visualAssetImportController];
        uint64_t v10 = [(ICNoteEditorViewController *)self traitCollection];
        objc_msgSend(v26, "presentVisualAssetCaptureControllerWithDisableAutorotate:", objc_msgSend(v10, "userInterfaceIdiom") == 0);

        goto LABEL_17;
      case 2uLL:
        id v26 = [(ICNoteEditorViewController *)self visualAssetImportController];
        [v26 presentVisualAssetPickerController];
        goto LABEL_17;
      case 3uLL:
        uint64_t v11 = [(ICNoteEditorViewController *)self textView];
        [v11 becomeFirstResponder];

        id v26 = [(ICNoteEditorViewController *)self textView];
        [v26 captureTextFromCamera:self];
        goto LABEL_17;
      case 4uLL:
        id v12 = [MEMORY[0x263F08C38] UUID];
        [(ICNoteEditorViewController *)self setCreatedGalleryAttachmentUUID:v12];

        id v13 = objc_alloc(MEMORY[0x263F3AA10]);
        int v14 = [(ICNoteEditorViewController *)self documentCameraControllerCreateDataCryptorIfNecessary];
        id v26 = (id)[v13 initWithDataCryptorDelegate:v14];

        uint64_t v15 = [(ICNoteEditorViewController *)self navigationController];
        uint64_t v16 = (void *)v15;
        if (v15) {
          double v17 = (ICNoteEditorViewController *)v15;
        }
        else {
          double v17 = self;
        }
        double v18 = v17;

        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F3AA30]) initWithImageCache:v26 docCamDelegate:self remoteDocCamDelegate:self];
        [v19 setModalTransitionStyle:2];
        [(ICNoteEditorViewController *)v18 presentViewController:v19 animated:1 completion:0];
        double v20 = [(ICNoteEditorViewController *)self eventReporter];
        [v20 pushStartDocScanPageCountData:0];

        double v21 = [(ICNoteEditorViewController *)self eventReporter];
        double v22 = [(ICNoteEditorViewController *)self createdGalleryAttachmentUUID];
        uint64_t v23 = [v22 UUIDString];
        [v21 pushDocScanDataWithID:v23 actionType:1 stage:1];

        long long v24 = [(ICNoteEditorViewController *)self eventReporter];
        id v25 = [(ICNoteEditorBaseViewController *)self note];

        [v24 submitDocScanEventForNote:v25 pageCount:0];
LABEL_17:

        break;
      case 5uLL:
        [(ICNoteEditorViewController *)self showDocumentPicker];
        break;
      case 7uLL:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__ICNoteEditorViewController_showInsertUIForSourceType_sender___block_invoke;
        block[3] = &unk_2640B8140;
        void block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
        break;
      default:
        return;
    }
  }
}

void __63__ICNoteEditorViewController_showInsertUIForSourceType_sender___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) audioAttachmentEditorCoordinator];
  [v1 presentRecordingViewControllerForAttachment:0];
}

- (void)showDocumentPicker
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82698]);
  v6[0] = *MEMORY[0x263F1DA48];
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  char v5 = (void *)[v3 initForOpeningContentTypes:v4 asCopy:1];

  [v5 setAllowsMultipleSelection:0];
  [v5 setDelegate:self];
  [(ICNoteEditorViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v7 = v5;
  uint64_t v46 = *(void *)v50;
  uint64_t v45 = *MEMORY[0x263EFF608];
  uint64_t v43 = *MEMORY[0x263F1DBF0];
  uint64_t v41 = *MEMORY[0x263F5A990];
  uint64_t v42 = *MEMORY[0x263F14878];
  *(void *)&long long v6 = 138412546;
  long long v40 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v50 != v46) {
        objc_enumerationMutation(obj);
      }
      char v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      uint64_t v10 = [(ICNoteEditorBaseViewController *)self note];
      char v11 = [v10 canAddAttachment];

      if ((v11 & 1) == 0)
      {
        [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
        goto LABEL_30;
      }
      id v12 = [(ICNoteEditorBaseViewController *)self note];
      int v13 = objc_msgSend(v12, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v9, "ic_fileSize"));

      if (v13)
      {
        unint64_t v38 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v39 = [v38 localizedStringForKey:@"Maximum attachment size reached." value:&stru_26C10E100 table:0];
        [(ICNoteEditorViewController *)self warnLimitExceededWithTitle:v39 andMessage:0];

        goto LABEL_30;
      }
      int v14 = [v9 lastPathComponent];
      uint64_t v15 = [v14 stringByDeletingPathExtension];

      id v48 = 0;
      LODWORD(v14) = [v9 getResourceValue:&v48 forKey:v45 error:0];
      id v16 = v48;
      double v17 = v16;
      if (!v14 || !v16)
      {
        id v26 = [(ICNoteEditorBaseViewController *)self note];
        double v22 = [v26 addAttachmentWithFileURL:v9];
        goto LABEL_23;
      }
      if (![v16 conformsToType:v43])
      {
        id v26 = [(ICNoteEditorBaseViewController *)self note];
        long long v27 = [v17 identifier];
        double v22 = [v26 addAttachmentWithUTI:v27 withURL:v9];

        goto LABEL_23;
      }
      int v18 = ICInternalSettingsDefaultToPaperKitPDFsAndScans();
      id v19 = [(ICNoteEditorBaseViewController *)self note];
      if (!v18)
      {
        double v22 = [v17 identifier];
        uint64_t v25 = [v19 addAttachmentWithUTI:v22 withURL:v9];
LABEL_19:

        double v22 = (void *)v25;
        goto LABEL_20;
      }
      double v20 = [MEMORY[0x263F08C38] UUID];
      double v21 = [v20 UUIDString];
      double v22 = [v19 addPaperDocumentAttachmentWithIdentifier:v21 subtype:v41];

      uint64_t v23 = [v22 managedObjectContext];
      objc_msgSend((id)v23, "ic_save");

      id v47 = 0;
      LOBYTE(v23) = [MEMORY[0x263F5ACB8] createPaperDocumentForAttachment:v22 fromLegacyMediaAtURL:v9 error:&v47];
      id v19 = v47;
      if ((v23 & 1) == 0)
      {
        long long v24 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = objc_msgSend(v22, "ic_loggingDescription");
          *(_DWORD *)long long buf = v40;
          id v54 = v19;
          __int16 v55 = 2112;
          id v56 = v37;
          _os_log_error_impl(&dword_20BE60000, v24, OS_LOG_TYPE_ERROR, "Failed to create paper document from PDF with error: %@ -- deleting attachment %@", buf, 0x16u);
        }
        [MEMORY[0x263F5AB78] deleteAttachment:v22];
        uint64_t v25 = 0;
        goto LABEL_19;
      }
LABEL_20:

      id v26 = (void *)[objc_alloc(MEMORY[0x263F14740]) initWithURL:v9];
      uint64_t v28 = [v26 documentAttributes];
      long long v29 = [v28 objectForKeyedSubscript:v42];

      if ([v29 length])
      {
        id v30 = v29;

        uint64_t v15 = v30;
      }

LABEL_23:
      if (v22)
      {
        [v22 setTitle:v15];
        int v31 = [(ICNoteEditorViewController *)self attachmentInsertionController];
        id v32 = [(ICNoteEditorViewController *)self textView];
        uint64_t v33 = [v32 selectedRange];
        id v35 = (id)[v31 addAttachment:v22 atTextLocation:v33 + v34];

        CGRect v36 = [(ICNoteEditorBaseViewController *)self note];
        [v36 save];
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_30:
}

- (void)insertSidecarItems:(id)a3 service:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ICNoteEditorViewController *)self prepareSelectionForAddingAttachment];
  if (!a4)
  {
    id v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController insertSidecarItems:service:]();
    }

    objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_908);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [(ICNoteEditorViewController *)self visualAssetImportController];
    [v11 addImageData:v8 typeIdentifier:0];
    goto LABEL_10;
  }
  if ((unint64_t)a4 > 2)
  {
    if (a4 != 3) {
      goto LABEL_12;
    }
    int v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController insertSidecarItems:service:].cold.5();
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v8 = v6;
    uint64_t v14 = [v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v47 = v6;
      uint64_t v16 = *(void *)v53;
      uint64_t v17 = *MEMORY[0x263F14C60];
      double v18 = *MEMORY[0x263F14C78];
      double v19 = *MEMORY[0x263F001B0];
      double v20 = *(double *)(MEMORY[0x263F001B0] + 8);
      while (2)
      {
        uint64_t v21 = 0;
        uint64_t v48 = v15;
        do
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(v8);
          }
          double v22 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
          uint64_t v23 = [v22 type];
          char v24 = [v23 isEqualToString:v17];

          if (v24)
          {
            uint64_t v25 = [(ICNoteEditorBaseViewController *)self note];
            char v26 = [v25 canAddAttachment];

            if ((v26 & 1) == 0)
            {
              uint64_t v46 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                -[ICNoteEditorViewController insertSidecarItems:service:]();
              }

              [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
              goto LABEL_40;
            }
            uint64_t v27 = v17;
            uint64_t v28 = [v22 data];
            long long v29 = (void *)[objc_alloc(MEMORY[0x263F14AE0]) initWithData:v28 error:0];
            [v29 bounds];
            double MaxX = CGRectGetMaxX(v60);
            if (MaxX > v18)
            {
              CGAffineTransformMakeScale(&v49, v18 / MaxX, v18 / MaxX);
              [v29 _transformAllStrokes:&v49];
            }
            uint64_t v31 = v16;
            [v29 _canvasBounds];
            if (v33 == v19 && v32 == v20)
            {
              [v29 bounds];
              objc_msgSend(v29, "set_canvasBounds:", 0.0, 0.0, v18, CGRectGetMaxY(v61));
            }
            id v35 = (void *)MEMORY[0x263F5ACB8];
            CGRect v36 = [(ICNoteEditorBaseViewController *)self note];
            uint64_t v37 = [v35 createSystemPaperAttachmentWithPKDrawing:v29 inNote:v36];

            unint64_t v38 = [(ICNoteEditorViewController *)self attachmentInsertionController];
            uint64_t v39 = [(ICNoteEditorViewController *)self textView];
            uint64_t v40 = [v39 selectedRange];
            id v42 = (id)[v38 addAttachment:v37 atTextLocation:v40 + v41];

            uint64_t v43 = [(ICNoteEditorBaseViewController *)self note];
            uint64_t v44 = [v43 managedObjectContext];
            objc_msgSend(v44, "ic_save");

            uint64_t v45 = [MEMORY[0x263F5B230] sharedGenerator];
            [v45 generatePreviewIfNeededForAttachment:v37];

            uint64_t v16 = v31;
            uint64_t v17 = v27;
            uint64_t v15 = v48;
          }
          else
          {
            uint64_t v28 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[ICNoteEditorViewController insertSidecarItems:service:].cold.4(&buf, v51, v28);
            }
          }

          ++v21;
        }
        while (v15 != v21);
        uint64_t v15 = [v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_40:
      id v6 = v47;
    }
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ICNoteEditorViewController insertSidecarItems:service:]();
    }

    objc_msgSend(v6, "ic_map:", &__block_literal_global_915);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    char v9 = (void *)[objc_alloc(MEMORY[0x263F3AA10]) initWithDataCryptorDelegate:0];
    uint64_t v10 = (void *)MEMORY[0x263F3A9F8];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2;
    v56[3] = &unk_2640B95A0;
    v56[4] = self;
    id v57 = v9;
    id v11 = v9;
    [v10 infoCollectionFromSidecarItems:v8 imageCache:v11 completion:v56];

LABEL_10:
LABEL_11:
  }
LABEL_12:
}

uint64_t __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke(uint64_t a1, void *a2)
{
  return [a2 data];
}

id __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_912(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F6C550];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 data];
  id v6 = [v3 type];

  uint64_t v7 = (void *)[v4 initWithData:v5 type:v6];

  return v7;
}

void __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 32);
    [v3 documentCameraPresentingViewController:0 didFinishWithInfoCollection:a2 imageCache:v2 warnUser:1 closeViewController:0];
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2_cold_1();
    }
  }
}

- (id)getTableControllerFor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  while (1)
  {
    uint64_t v5 = v4;
    id v4 = [v4 nextResponder];

    if (!v4) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v6 = ICDynamicCast();
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (void)addTable:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  char v5 = [v4 canAddAttachment];

  if (v5)
  {
    id v6 = [(ICNoteEditorBaseViewController *)self note];
    char v7 = [v6 isEditable];

    if (v7)
    {
      [(ICNoteEditorViewController *)self showStyleSelector:0 animated:0];
      id v8 = [(ICNoteEditorViewController *)self textView];
      [v8 selectedRange];
      uint64_t v10 = v9;

      if (v10)
      {
        id v11 = [(ICNoteEditorViewController *)self textStorage];
        id v12 = [(ICNoteEditorViewController *)self textView];
        uint64_t v13 = [v12 selectedRange];
        uint64_t v15 = objc_msgSend(v11, "ic_attributedSubstringFromRange:", v13, v14);

        uint64_t v16 = [(ICNoteEditorBaseViewController *)self note];
        uint64_t v17 = [v16 managedObjectContext];
        double v18 = objc_msgSend(v15, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v17);

        double v19 = [(ICNoteEditorBaseViewController *)self note];
        id v33 = [v19 addTableAttachmentWithText:v18];
      }
      else
      {
        double v18 = [(ICNoteEditorBaseViewController *)self note];
        id v33 = [v18 addTableAttachment];
      }

      uint64_t v23 = [(ICNoteEditorViewController *)self eventReporter];
      char v24 = [(ICNoteEditorBaseViewController *)self note];
      [v23 submitTableCreateEventForAttachment:v33 inNote:v24];

      uint64_t v25 = [(ICNoteEditorViewController *)self attachmentInsertionController];
      char v26 = [(ICNoteEditorViewController *)self textView];
      uint64_t v27 = [v26 selectedRange];
      id v29 = (id)objc_msgSend(v25, "addAttachment:atTextRange:", v33, v27, v28);

      id v30 = [(ICNoteEditorViewController *)self undoManager];
      uint64_t v31 = [MEMORY[0x263F086E0] mainBundle];
      double v32 = [v31 localizedStringForKey:@"Add Table" value:&stru_26C10E100 table:0];
      [v30 setActionName:v32];
    }
    else
    {
      double v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(ICNoteEditorBaseViewController *)self note];
        double v22 = [v21 shortLoggingDescription];
        *(_DWORD *)uint8_t buf = 138412290;
        id v35 = v22;
        _os_log_impl(&dword_20BE60000, v20, OS_LOG_TYPE_DEFAULT, "Trying to add table to non-editable note %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
  }
}

- (void)resetDateView
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v2 = [v3 dateView];
  [v2 reset];
}

- (void)updatePencilKitSelectionViewEnabled
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isiPad"))
  {
    id v6 = [(ICNoteEditorBaseViewController *)self note];
    if ([v6 isEditable]) {
      BOOL v3 = [(ICNoteEditorViewController *)self attributionSidebarVisibility] == 0;
    }
    else {
      BOOL v3 = 0;
    }
    id v4 = [(ICNoteEditorViewController *)self textView];
    char v5 = objc_msgSend(v4, "ic_pkSelectionInteraction");
    [v5 setEnabled:v3];
  }
}

- (void)openLink:(id)a3
{
  id v5 = [(ICNoteEditorViewController *)self linkForSelection];
  id v4 = [(ICNoteEditorViewController *)self view];
  +[ICExtensionSafeAPIShims openURL:v5 originatingView:v4 completionHandler:0];
}

- (void)tab:(id)a3
{
  if ([(ICNoteEditorViewController *)self currentSelectionContainsListOrFixedWidth])
  {
    [(ICNoteEditorViewController *)self indentSelectionIfPossibleByAmount:1];
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self textView];
    [v4 insertText:@"\t"];
  }
}

- (void)shiftTab:(id)a3
{
}

- (void)shiftReturn:(id)a3
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  [v3 insertText:@"\u2028"];
}

- (void)strikethrough:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v5)
  {
    id v8 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    [v8 toggleStrikethrough:v4];
  }
  else
  {
    id v6 = [(ICNoteEditorViewController *)self textView];
    [v6 toggleStrikethrough];

    uint64_t v7 = [(ICNoteEditorViewController *)self textView];
    [(ICNoteEditorViewController *)self textViewDidChange:v7];

    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(ICNoteEditorViewController *)self eventReporter];
    id v4 = [(ICNoteEditorBaseViewController *)self note];
    [v8 submitNoteEditorCallOutBarButtonSelectionEventForModernNote:v4 buttonTypeValue:9];
  }
}

- (void)checkAll:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorViewController *)self textController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = (void *)MEMORY[0x263F08D40];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 selectedRange];
  uint64_t v10 = objc_msgSend(v6, "valueWithRange:", v8, v9);
  v12[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 markAllChecklistItemsCompleted:1 inTextview:v5 forSelectedRanges:v11];

  [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:2];
}

- (void)uncheckAll:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorViewController *)self textController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = (void *)MEMORY[0x263F08D40];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 selectedRange];
  uint64_t v10 = objc_msgSend(v6, "valueWithRange:", v8, v9);
  v12[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 markAllChecklistItemsCompleted:0 inTextview:v5 forSelectedRanges:v11];

  [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:3];
}

- (void)removeChecked:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorViewController *)self textController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = (void *)MEMORY[0x263F08D40];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 selectedRange];
  uint64_t v10 = objc_msgSend(v6, "valueWithRange:", v8, v9);
  v12[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 removeChecklistItemsMarkedCompleted:1 inTextView:v5 forRanges:v11];

  [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:4];
}

- (void)moveCheckedToBottom:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self textController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = [v6 selectedRange];
  objc_msgSend(v4, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v5, v7, v8, 1);

  id v10 = [(ICNoteEditorViewController *)self eventReporter];
  uint64_t v9 = [(ICNoteEditorBaseViewController *)self note];
  [v10 submitNoteEditorCallOutBarButtonSelectionEventForModernNote:v9 buttonTypeValue:14];
}

- (BOOL)canMoveSelectedListItemUp
{
  id v3 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  char v8 = objc_msgSend(v3, "canMoveListItemInDirection:inTextView:forRange:", 0, v4, v6, v7);

  return v8;
}

- (BOOL)canMoveSelectedListItemDown
{
  id v3 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  char v8 = objc_msgSend(v3, "canMoveListItemInDirection:inTextView:forRange:", 1, v4, v6, v7);

  return v8;
}

- (void)moveSelectedListItemUp:(id)a3
{
  id v8 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  objc_msgSend(v8, "moveListItemInDirection:inTextView:forRange:", 0, v4, v6, v7);
}

- (void)moveSelectedListItemDown:(id)a3
{
  id v8 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  objc_msgSend(v8, "moveListItemInDirection:inTextView:forRange:", 1, v4, v6, v7);
}

- (BOOL)canConvertToText
{
  id v3 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  char v8 = objc_msgSend(v3, "canConvertInlineAttachmentToTextInTextView:forRange:", v4, v6, v7);

  return v8;
}

- (BOOL)canConvertToTag
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  id v4 = [v3 selectedText];
  if (objc_msgSend(v4, "ic_canConvertToTag")) {
    BOOL v5 = ![(ICNoteEditorViewController *)self canConvertToText];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)convertToText:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(ICNoteEditorViewController *)self textView];
    v18.id location = [v5 selectedRange];
    uint64_t v6 = NSStringFromRange(v18);
    int v15 = 138412290;
    uint64_t v16 = v6;
    _os_log_impl(&dword_20BE60000, v4, OS_LOG_TYPE_INFO, "Converting inline attachment at %@ to text", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v7 = [(ICNoteEditorViewController *)self textController];
  char v8 = [(ICNoteEditorViewController *)self textView];
  uint64_t v9 = [(ICNoteEditorViewController *)self textView];
  uint64_t v10 = [v9 selectedRange];
  objc_msgSend(v7, "convertInlineAttachmentToTextInTextView:forRange:", v8, v10, v11);

  id v12 = [(ICNoteEditorViewController *)self textView];
  [(ICNoteEditorViewController *)self textViewDidChange:v12];

  uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
  [v13 updateChangeCountWithReason:@"Converted inline attachment to text"];

  uint64_t v14 = [(ICNoteEditorBaseViewController *)self note];
  [v14 save];
}

- (void)convertToTag:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorViewController *)self eventReporter];
  BOOL v5 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = [v6 selectedText];
  [v4 submitHashtagAddEventForNote:v5 tokenContentIdentifier:v7 viaAutoComplete:0];

  [(ICNoteEditorViewController *)self setIsConvertToTag:1];
  char v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(ICNoteEditorViewController *)self textView];
    v28.id location = [v9 selectedRange];
    uint64_t v10 = NSStringFromRange(v28);
    int v25 = 138412290;
    char v26 = v10;
    _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_INFO, "Converting text to inline attachment at %@", (uint8_t *)&v25, 0xCu);
  }
  uint64_t v11 = (void *)MEMORY[0x263F5AC68];
  id v12 = [(ICNoteEditorViewController *)self textView];
  uint64_t v13 = [v12 selectedText];
  uint64_t v14 = objc_msgSend(v13, "ic_stringByReplacingLeadingFullWidthHashSignIfPossible");
  int v15 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v16 = [v11 createHashtagAttachmentIfApplicableWithHashtagText:v14 creatingHashtagIfNecessary:1 note:v15 parentAttachment:0];

  if (v16)
  {
    uint64_t v17 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    NSRange v18 = [(ICNoteEditorViewController *)self textView];
    uint64_t v19 = [v18 selectedRange];
    id v21 = (id)objc_msgSend(v17, "addInlineAttachment:atTextRange:", v16, v19, v20);

    [v16 updateChangeCountWithReason:@"Created tag from text"];
    double v22 = [(ICNoteEditorBaseViewController *)self note];
    [v22 updateChangeCountWithReason:@"Created tag from text"];

    uint64_t v23 = [(ICNoteEditorBaseViewController *)self note];
    [v23 save];

    char v24 = [(ICNoteEditorViewController *)self hashtagController];
    [v24 updateNoteHashtags];
  }
  [(ICNoteEditorViewController *)self setEditing:1 animated:1];
}

- (BOOL)canAddToTags
{
  id v3 = [(ICNoteEditorViewController *)self textController];
  id v4 = [(ICNoteEditorViewController *)self textView];
  BOOL v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  char v8 = objc_msgSend(v3, "canAddToTagsInTextView:forRange:", v4, v6, v7);

  return v8;
}

- (void)addToTags:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteEditorViewController addToTags:](self, v4);
  }

  BOOL v5 = [(ICNoteEditorViewController *)self textController];
  uint64_t v6 = [(ICNoteEditorViewController *)self textView];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 selectedRange];
  objc_msgSend(v5, "addToTagsInTextView:forRange:", v6, v8, v9);
}

- (void)openExperimentalHashtagUI:(id)a3
{
  if (ICDebugModeEnabled())
  {
    id v4 = objc_alloc_init(ICHashtagViewController);
    [(ICHashtagViewController *)v4 setDelegate:self];
    [(ICNoteEditorViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (void)openLinkEditor:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  int v5 = [v4 isDeletedOrInTrash];

  if (v5)
  {
    [(ICNoteEditorViewController *)self showRecoverNoteAlert];
    return;
  }
  uint64_t v6 = [(ICNoteEditorViewController *)self linkForSelection];
  uint64_t v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 selectedText];

  uint64_t v9 = [(ICNoteEditorViewController *)self textView];
  uint64_t v10 = [v9 textStorage];
  uint64_t v11 = *MEMORY[0x263F814A0];
  id v12 = [(ICNoteEditorViewController *)self textView];
  uint64_t v13 = objc_msgSend(v10, "attribute:atIndex:effectiveRange:", v11, objc_msgSend(v12, "selectedRange"), 0);

  objc_opt_class();
  uint64_t v14 = ICDynamicCast();
  long long v33 = xmmword_20C1794E0;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F5AB68] detectedURLInString:v8 allowNonLinkCharacters:0];

    if (v6)
    {
      uint64_t v6 = [NSURL URLWithString:v8];
    }
    goto LABEL_11;
  }
  int v15 = [(ICNoteEditorViewController *)self textStorage];
  uint64_t v16 = *MEMORY[0x263F81520];
  uint64_t v17 = [(ICNoteEditorViewController *)self textView];
  uint64_t v18 = [v17 selectedRange];
  uint64_t v19 = [(ICNoteEditorViewController *)self textStorage];
  id v20 = (id)objc_msgSend(v15, "attribute:atIndex:longestEffectiveRange:inRange:", v16, v18, &v33, 0, objc_msgSend(v19, "length"));

  if ((void)v33 == 0x7FFFFFFFFFFFFFFFLL || !*((void *)&v33 + 1))
  {
LABEL_11:
    double v22 = [(ICNoteEditorViewController *)self textView];
    *(void *)&long long v33 = [v22 selectedRange];
    *((void *)&v33 + 1) = v25;
    goto LABEL_12;
  }
  id v21 = [(ICNoteEditorViewController *)self textView];
  double v22 = objc_msgSend(v21, "ic_textRangeFromCharacterRange:", v33);

  uint64_t v23 = [(ICNoteEditorViewController *)self textView];
  uint64_t v24 = [v23 textInRange:v22];

  uint64_t v8 = (void *)v24;
LABEL_12:

  char v26 = [(ICNoteEditorViewController *)self presentedViewController];

  if (v26) {
    [(ICNoteEditorViewController *)self hideAndDismissPresentedViewController];
  }
  uint64_t v27 = [(ICNoteEditorBaseViewController *)self note];
  NSRange v28 = [v27 mergeableString];
  id v29 = [MEMORY[0x263F08D40] valueWithRange:v33];
  v34[0] = v29;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  uint64_t v31 = [v28 selectionForCharacterRanges:v30 selectionAffinity:1];

  double v32 = +[ICLinkEditorViewControllerHelper presentFromViewController:self delegate:self text:v8 url:v6 attachment:v14 stringSelection:v31 range:v33 addApproach:3];
  [(ICNoteEditorViewController *)self setLinkEditorViewController:v32];
}

- (void)openLinkEditorForLink:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v6 = [v5 rangeForAttachment:v4];
    uint64_t v8 = v7;

    uint64_t v9 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v10 = [v9 mergeableString];
    uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v8);
    v24[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v13 = [v10 selectionForCharacterRanges:v12 selectionAffinity:1];

    uint64_t v14 = [(ICNoteEditorViewController *)self textView];
    int v15 = [v14 textStorage];
    uint64_t v16 = [v15 attribute:*MEMORY[0x263F814A0] atIndex:v6 effectiveRange:0];

    objc_opt_class();
    uint64_t v17 = ICDynamicCast();
    uint64_t v18 = [(ICNoteEditorViewController *)self presentedViewController];

    if (v18) {
      [(ICNoteEditorViewController *)self hideAndDismissPresentedViewController];
    }
    uint64_t v19 = [v4 displayText];
    id v20 = [(ICNoteEditorViewController *)self textView];
    uint64_t v21 = [v20 selectedRange];
    uint64_t v23 = +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", self, self, v19, 0, v17, v13, v21, v22, 3);
    [(ICNoteEditorViewController *)self setLinkEditorViewController:v23];
  }
}

- (void)openLinkEditorForLinkTextItem:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 range];
    uint64_t v8 = v7;
    uint64_t v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = objc_msgSend(v9, "ic_textRangeFromCharacterRange:", v6, v8);

    uint64_t v11 = [(ICNoteEditorViewController *)self textView];
    id v12 = [v11 textInRange:v10];

    uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v14 = [v13 mergeableString];
    int v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v8);
    v24[0] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v17 = [v14 selectionForCharacterRanges:v16 selectionAffinity:1];

    uint64_t v18 = [(ICNoteEditorViewController *)self presentedViewController];

    if (v18) {
      [(ICNoteEditorViewController *)self hideAndDismissPresentedViewController];
    }
    uint64_t v19 = [v5 link];
    id v20 = [(ICNoteEditorViewController *)self textView];
    uint64_t v21 = [v20 selectedRange];
    uint64_t v23 = +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", self, self, v12, v19, 0, v17, v21, v22, 3);
    [(ICNoteEditorViewController *)self setLinkEditorViewController:v23];
  }
}

- (void)removeLinkForLinkTextItem:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [a3 range];
    -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v5, v4);
  }
}

- (void)insertGraph:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  id v7 = [v5 calculateGraphingControllerInsertionDecision];

  if (v7)
  {
    uint64_t v6 = [(ICNoteEditorViewController *)self calculateGraphingController];
    [v6 performDecision:v7];
  }
}

- (void)addToGraph:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  id v7 = [v5 calculateGraphingControllerInsertionDecision];

  if (v7)
  {
    [v7 setPrefersExistingGraph:1];
    uint64_t v6 = [(ICNoteEditorViewController *)self calculateGraphingController];
    [v6 performDecision:v7];
  }
}

- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x263F5AC98];
  id v13 = a3;
  uint64_t v14 = [(ICNoteEditorBaseViewController *)self note];
  int v15 = [v14 managedObjectContext];
  uint64_t v16 = [v12 noteWithIdentifier:v13 context:v15];

  if (v16)
  {
    int64_t v34 = a6;
    uint64_t v17 = (void *)MEMORY[0x263F5AC68];
    uint64_t v18 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v19 = (void *)[v17 newLinkAttachmentToNote:v16 fromNote:v18 parentAttachment:0];

    id v20 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v21 = [v20 mergeableString];
    uint64_t v22 = [v21 characterRangesForSelection:v11];
    uint64_t v23 = [v22 firstObject];

    if (v23)
    {
      NSUInteger location = [v23 rangeValue];
      NSUInteger length = v24;
    }
    if (v19)
    {
      uint64_t v25 = [(ICNoteEditorViewController *)self attachmentInsertionController];
      id v26 = (id)objc_msgSend(v25, "addInlineAttachment:atTextRange:", v19, location, length);

      [v23 rangeValue];
      if (v27)
      {
        uint64_t v28 = [v23 rangeValue] + 1;
        id v29 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v29, "setSelectedRange:", v28, 0);
      }
      [v19 updateChangeCountWithReason:@"Created note link"];
      id v30 = [(ICNoteEditorBaseViewController *)self note];
      [v30 updateModificationDateAndChangeCountAndSaveImmediately];

      uint64_t v31 = [(ICNoteEditorViewController *)self eventReporter];
      double v32 = [(ICNoteEditorBaseViewController *)self note];
      [v31 submitAddLinkEvent:v32 addApproach:v34 contentType:1 isTokenized:1];

      [(ICNoteEditorViewController *)self startEditing];
    }
  }
  else
  {
    long long v33 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_20BE60000, v33, OS_LOG_TYPE_DEFAULT, "Attempted to create Note Link Attachment to nil Note", buf, 2u);
    }
  }
}

- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v45 = a4;
  id v10 = a5;
  id v11 = [(ICNoteEditorBaseViewController *)self note];
  id v12 = [v11 mergeableString];
  uint64_t v39 = v10;
  id v13 = [v12 characterRangesForSelection:v10];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v13;
  uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v47)
  {
    uint64_t v43 = *MEMORY[0x263F81520];
    uint64_t v44 = *(void *)v49;
    uint64_t v42 = *MEMORY[0x263F394D8];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v49 != v44) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
        uint64_t v16 = [(ICNoteEditorViewController *)self textView];
        uint64_t v17 = [v16 textStorage];
        uint64_t v18 = objc_msgSend(v17, "attributesAtIndex:effectiveRange:", objc_msgSend(v15, "rangeValue"), 0);

        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v45];
        uint64_t v20 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "addAttributes:range:", v18, v20, v21);
        uint64_t v22 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "addAttribute:value:range:", v43, v46, v22, v23);
        uint64_t v24 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "removeAttribute:range:", v42, v24, v25);
        id v26 = [(ICNoteEditorViewController *)self textView];
        uint64_t v27 = [v26 textStorage];
        uint64_t v28 = [v15 rangeValue];
        uint64_t v30 = v29;
        uint64_t v31 = (void *)[v19 copy];
        objc_msgSend(v27, "replaceCharactersInRange:withAttributedString:", v28, v30, v31);

        [v15 rangeValue];
        if (v32)
        {
          uint64_t v33 = [v15 rangeValue];
          uint64_t v34 = [v19 length];
          id v35 = [(ICNoteEditorViewController *)self textView];
          objc_msgSend(v35, "setSelectedRange:", v33, v34);
        }
        ++v14;
      }
      while (v47 != v14);
      uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v47);
  }

  uint64_t v36 = [(ICNoteEditorBaseViewController *)self note];
  [v36 updateModificationDateAndChangeCountAndSaveImmediately];

  uint64_t v37 = [(ICNoteEditorViewController *)self eventReporter];
  unint64_t v38 = [(ICNoteEditorBaseViewController *)self note];
  [v37 submitAddLinkEvent:v38 addApproach:a7 url:v46];

  [(ICNoteEditorViewController *)self startEditing];
}

- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(ICNoteEditorBaseViewController *)self note];
  id v7 = [v6 mergeableString];
  uint64_t v8 = [v7 characterRangesForSelection:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "rangeValue", (void)v16);
        -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v14, v15);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)removeLinksFromRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  if (a3.length)
  {
    NSUInteger length = a3.length;
    uint64_t v6 = [(ICNoteEditorViewController *)self textStorage];
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x263F81520], location, length);

    id v7 = [(ICNoteEditorViewController *)self textStorage];
    uint64_t v8 = *MEMORY[0x263F814A0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __51__ICNoteEditorViewController_removeLinksFromRange___block_invoke;
    v29[3] = &unk_2640B89D0;
    void v29[4] = self;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v29);
  }
  else
  {
    long long v30 = xmmword_20C1794E0;
    id v9 = [(ICNoteEditorViewController *)self textStorage];
    uint64_t v10 = *MEMORY[0x263F81520];
    uint64_t v11 = [(ICNoteEditorViewController *)self textStorage];
    id v12 = (id)objc_msgSend(v9, "attribute:atIndex:longestEffectiveRange:inRange:", v10, location, &v30, 0, objc_msgSend(v11, "length"));

    if ((void)v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = [(ICNoteEditorViewController *)self textView];
      uint64_t v14 = [v13 textStorage];
      [v14 removeAttribute:v10 range:v30];
    }
    uint64_t v15 = [(ICNoteEditorViewController *)self textView];
    long long v16 = [v15 textStorage];
    long long v17 = [v16 attribute:*MEMORY[0x263F814A0] atIndex:location effectiveRange:0];

    objc_opt_class();
    long long v18 = ICDynamicCast();
    long long v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 attachment];
      uint64_t v21 = [(ICNoteEditorBaseViewController *)self note];
      uint64_t v22 = [v21 rangeForAttachment:v20];
      uint64_t v24 = v23;

      uint64_t v25 = [(ICNoteEditorViewController *)self textView];
      id v26 = [v25 textStorage];
      uint64_t v27 = [v20 displayText];
      objc_msgSend(v26, "replaceCharactersInRange:withString:", v22, v24, v27);
    }
  }
  uint64_t v28 = [(ICNoteEditorBaseViewController *)self note];
  [v28 updateModificationDateAndChangeCountAndSaveImmediately];
}

void __51__ICNoteEditorViewController_removeLinksFromRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v14 attachment];
  id v9 = [v8 typeUTI];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F5AAD8]];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) textStorage];
    id v12 = [v14 attachment];
    uint64_t v13 = [v12 displayText];
    objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);
  }
}

- (void)removeLinksFromCurrentSelection
{
  id v3 = [(ICNoteEditorViewController *)self auxiliaryResponder];

  if (v3)
  {
    objc_opt_class();
    id v4 = [(ICNoteEditorViewController *)self auxiliaryResponder];
    ICDynamicCast();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v7 removeLinksFromCurrentSelection];
  }
  else
  {
    id v7 = [(ICNoteEditorViewController *)self textView];
    uint64_t v5 = [v7 selectedRange];
    -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v5, v6);
  }
}

- (BOOL)shouldShowFloatingSuggestions
{
  uint64_t v2 = [(ICNoteEditorViewController *)self traitCollection];
  if (objc_msgSend(v2, "ic_hasCompactSize")) {
    char v3 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)linkEditorWillDismiss
{
  [(ICNoteEditorViewController *)self setLinkEditorViewController:0];
  char v3 = [(ICNoteEditorViewController *)self textView];
  char v4 = [v3 isEditing];

  if ((v4 & 1) == 0)
  {
    [(ICNoteEditorViewController *)self startEditing];
  }
}

- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F5AC68];
  id v6 = a4;
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  id v15 = [v5 createHashtagAttachmentIfApplicableWithHashtagText:v6 creatingHashtagIfNecessary:1 note:v7 parentAttachment:0];

  if (v15)
  {
    uint64_t v8 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    id v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = [v9 selectedRange];
    id v12 = (id)objc_msgSend(v8, "addInlineAttachment:atTextRange:", v15, v10, v11);

    [v15 updateChangeCountWithReason:@"Created tag"];
    uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
    [v13 updateChangeCountWithReason:@"Inserted tag"];

    id v14 = [(ICNoteEditorBaseViewController *)self note];
    [v14 save];
  }
  [(ICNoteEditorViewController *)self setEditing:1 animated:1];
}

- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F5AC68];
  id v6 = (void *)*MEMORY[0x263F5AAD0];
  id v7 = a4;
  uint64_t v8 = [v6 stringByAppendingString:@".unknown"];
  id v9 = [(ICNoteEditorBaseViewController *)self note];
  id v17 = [v5 createInlineAttachmentIfApplicableWithTypeUTI:v8 altText:v7 tokenContentIdentifier:v7 note:v9 parentAttachment:0];

  if (v17)
  {
    uint64_t v10 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    uint64_t v11 = [(ICNoteEditorViewController *)self textView];
    uint64_t v12 = [v11 selectedRange];
    id v14 = (id)objc_msgSend(v10, "addInlineAttachment:atTextRange:", v17, v12, v13);

    [v17 updateChangeCountWithReason:@"Created unknown inline attachment"];
    id v15 = [(ICNoteEditorBaseViewController *)self note];
    [v15 updateChangeCountWithReason:@"Inserted unknown inline attachment"];

    long long v16 = [(ICNoteEditorBaseViewController *)self note];
    [v16 save];
  }
  [(ICNoteEditorViewController *)self setEditing:1 animated:1];
}

- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F5AC68];
  id v6 = a4;
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  id v15 = [v5 createHashtagAttachmentIfApplicableWithHashtagText:v6 creatingHashtagIfNecessary:1 note:v7 parentAttachment:0];

  if (v15)
  {
    objc_msgSend(v15, "requireMinimumSupportedVersionAndPropagateToChildObjects:", objc_msgSend(MEMORY[0x263F5ABF0], "currentNotesVersion") + 1);
    uint64_t v8 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    id v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = [v9 selectedRange];
    id v12 = (id)objc_msgSend(v8, "addInlineAttachment:atTextRange:", v15, v10, v11);

    [v15 updateChangeCountWithReason:@"Created tag from the future"];
    uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
    [v13 updateChangeCountWithReason:@"Inserted tag from the future"];

    id v14 = [(ICNoteEditorBaseViewController *)self note];
    [v14 save];
  }
  [(ICNoteEditorViewController *)self setEditing:1 animated:1];
}

- (void)decreaseIndentation:(id)a3
{
  id v4 = a3;
  [(ICNoteEditorViewController *)self indentSelectionIfPossibleByAmount:-1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(ICNoteEditorViewController *)self currentWritingDirection]) {
      uint64_t v6 = 12;
    }
    else {
      uint64_t v6 = 13;
    }
    id v8 = [(ICNoteEditorViewController *)self eventReporter];
    id v7 = [(ICNoteEditorBaseViewController *)self note];
    [v8 submitNoteEditorCallOutBarButtonSelectionEventForModernNote:v7 buttonTypeValue:v6];
  }
}

- (void)increaseIndentation:(id)a3
{
  id v4 = a3;
  [(ICNoteEditorViewController *)self indentSelectionIfPossibleByAmount:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(ICNoteEditorViewController *)self currentWritingDirection]) {
      uint64_t v6 = 13;
    }
    else {
      uint64_t v6 = 12;
    }
    id v8 = [(ICNoteEditorViewController *)self eventReporter];
    id v7 = [(ICNoteEditorBaseViewController *)self note];
    [v8 submitNoteEditorCallOutBarButtonSelectionEventForModernNote:v7 buttonTypeValue:v6];
  }
}

- (BOOL)canIndentLeft
{
  return [(ICNoteEditorViewController *)self canIndentByAmount:-1];
}

- (void)indentLeft:(id)a3
{
}

- (BOOL)canIndentRight
{
  return [(ICNoteEditorViewController *)self canIndentByAmount:1];
}

- (void)indentRight:(id)a3
{
}

- (void)indentSelectionIfPossibleByAmount:(int64_t)a3
{
  if (-[ICNoteEditorViewController canIndentByAmount:](self, "canIndentByAmount:"))
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

    if (v5)
    {
      uint64_t v6 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
      [v6 indentByamount:a3];
    }
    else
    {
      id v7 = [(ICNoteEditorViewController *)self textView];
      objc_msgSend(v7, "ic_indentByAmount:", a3);

      uint64_t v6 = [(ICNoteEditorViewController *)self textView];
      [(ICNoteEditorViewController *)self textViewDidChange:v6];
    }
  }
  dispatchMainAfterDelay();
}

void __64__ICNoteEditorViewController_indentSelectionIfPossibleByAmount___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textView];
  [v1 icaxSpeakIndentationLevelForCurrentSelectedRange];
}

- (BOOL)canIndentByAmount:(int64_t)a3
{
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  int v6 = [v5 isEditable];

  if (!v6) {
    return 0;
  }
  id v7 = [(ICNoteEditorViewController *)self auxiliaryStylingController];

  if (v7)
  {
    id v8 = [(ICNoteEditorViewController *)self auxiliaryStylingController];
    char v9 = [v8 canIndentByamount:a3];
  }
  else
  {
    id v8 = [(ICNoteEditorViewController *)self textView];
    char v9 = objc_msgSend(v8, "ic_canIndentByDelta:", a3);
  }
  BOOL v10 = v9;

  return v10;
}

- (void)handleLeftOrRightSwipe:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  int v6 = [(ICNoteEditorViewController *)self textController];
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  if (![v7 isEditable] || objc_msgSend(v4, "state") != 3)
  {
LABEL_15:

    goto LABEL_16;
  }
  id v8 = [(ICNoteEditorViewController *)self attributionSidebarController];
  uint64_t v9 = [v8 attributionSidebarVisibility];

  if (!v9)
  {
    [v4 locationInView:v5];
    id v7 = objc_msgSend(v5, "characterRangeAtPoint:");
    if (v7)
    {
      if ([(ICNoteEditorViewController *)self isSwipeOnTodoItem:v4])
      {
        uint64_t v10 = [(ICNoteEditorViewController *)self charRangeForSwipeTextRange:v7];
        uint64_t v12 = v11;
        uint64_t v13 = [v5 textStorage];
        objc_msgSend(v6, "paragraphStyleForRange:inTextView:inTextStorage:", v10, v12, v5, v13);

        if (ICTTNamedStyleIsList())
        {
          if ([v4 direction] == 1) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = -1;
          }
          id v15 = [v5 textStorage];
          uint64_t v16 = objc_msgSend(v6, "writingDirectionForRange:inTextView:inTextStorage:", v10, v12, v5, v15);

          if (v16 == 1) {
            uint64_t v17 = -v14;
          }
          else {
            uint64_t v17 = v14;
          }
          long long v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
          v30[0] = v18;
          long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
          uint64_t v23 = v17;
          int v20 = [v6 canIndentTextView:v5 byDelta:v17 forRanges:v19];

          if (v20)
          {
            uint64_t v21 = (void *)MEMORY[0x263EFFA20];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            void v24[2] = __53__ICNoteEditorViewController_handleLeftOrRightSwipe___block_invoke;
            v24[3] = &unk_2640B95C8;
            void v24[4] = self;
            id v25 = v5;
            uint64_t v27 = v10;
            uint64_t v28 = v12;
            id v26 = v6;
            uint64_t v29 = v23;
            id v22 = (id)[v21 scheduledTimerWithTimeInterval:0 repeats:v24 block:0.1];
          }
        }
      }
    }
    goto LABEL_15;
  }
LABEL_16:
}

void __53__ICNoteEditorViewController_handleLeftOrRightSwipe___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attributionSidebarController];
  uint64_t v3 = [v2 attributionSidebarVisibility];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) attributionSidebarController];
    [v4 cancelActiveGestures];

    [*(id *)(a1 + 40) selectedRange];
    if ([*(id *)(a1 + 32) isEditing]) {
      uint64_t v5 = TSURangeEnclosesRange();
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 72);
    id v7 = *(void **)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) TTTextStorage];
    objc_msgSend(v7, "indentRange:byAmount:inTextStorage:textView:forceUpdateAttributes:", *(void *)(a1 + 56), *(void *)(a1 + 64), v6, v8, *(void *)(a1 + 40), v5);

    id v9 = [*(id *)(a1 + 32) note];
    [v9 updateModificationDateAndChangeCountAndSaveImmediately];
  }
}

- (BOOL)isPositionOnTodoItem:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(ICNoteEditorViewController *)self textView];
  id v7 = [(ICNoteEditorViewController *)self textController];
  id v8 = objc_msgSend(v6, "characterRangeAtPoint:", x, y);
  if (v8)
  {
    uint64_t v9 = [(ICNoteEditorViewController *)self charRangeForSwipeTextRange:v8];
    uint64_t v11 = v10;
    uint64_t v12 = [v6 textStorage];
    uint64_t v13 = objc_msgSend(v7, "writingDirectionForRange:inTextView:inTextStorage:", v9, v11, v6, v12);

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      uint64_t v14 = [v6 textLayoutManager];
      id v15 = [v6 textLayoutManager];
      uint64_t v16 = [v15 documentRange];
      [v16 location];
      uint64_t v17 = v33 = v13;
      long long v18 = [v14 locationFromLocation:v17 withOffset:v9];

      long long v19 = [v6 icTextLayoutManager];
      int v20 = [v19 textLayoutFragmentForLocation:v18];
      [v20 layoutFragmentFrame];
      double v22 = v21;
      double v24 = v23;

      uint64_t v13 = v33;
    }
    else
    {
      long long v18 = [v6 layoutManager];
      [v18 lineFragmentUsedRectForGlyphAtIndex:v9 effectiveRange:0];
      double v22 = v26;
      double v24 = v27;
    }

    [v6 textContainerInset];
    [v6 textContainerInset];
    TSDAddPoints();
    v35.origin.double x = v28 - dbl_20C179600[v13 == 1];
    v35.size.double width = v22 + 286.0;
    v35.origin.double y = v29 + -22.0;
    v35.size.double height = v24 + 44.0;
    v34.double x = x;
    v34.double y = y;
    BOOL v30 = CGRectContainsPoint(v35, v34);
    uint64_t v31 = [v6 textStorage];
    objc_msgSend(v7, "paragraphStyleForRange:inTextView:inTextStorage:", v9, v11, v6, v31);

    BOOL v25 = v30 & ICTTNamedStyleIsList();
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)isSwipeOnTodoItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  return -[ICNoteEditorViewController isPositionOnTodoItem:](self, "isPositionOnTodoItem:", v7, v9);
}

- (_NSRange)charRangeForSwipeTextRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNoteEditorViewController *)self textView];
  uint64_t v6 = objc_msgSend(v5, "ic_characterRangeFromTextRange:", v4);
  uint64_t v8 = v7;

  if (v8 == 1)
  {
    double v9 = [(ICNoteEditorViewController *)self textView];
    uint64_t v10 = [v9 textStorage];
    uint64_t v11 = objc_msgSend(v10, "attributedSubstringFromRange:", v6, 1);
    uint64_t v12 = [v11 string];

    uint64_t v13 = [v12 characterAtIndex:0];
    uint64_t v14 = [MEMORY[0x263F08708] newlineCharacterSet];
    LODWORD(v13) = [v14 characterIsMember:v13];

    if (v13)
    {
      id v15 = [(ICNoteEditorViewController *)self textView];
      uint64_t v16 = [v15 textStorage];
      objc_msgSend(v16, "ic_range");
      uint64_t v6 = TSUClampRange();
      uint64_t v8 = v17;
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  NSUInteger v18 = v6;
  NSUInteger v19 = v8;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNoteEditorViewController *)self swipeGestureRecognizers];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = [(ICNoteEditorViewController *)self splitViewController];
    uint64_t v11 = [v10 displayMode];

    if (v11 == 1)
    {
      uint64_t v12 = [(ICNoteEditorViewController *)self view];
      [v7 locationInView:v12];
      BOOL v14 = v13 > 44.0;
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_5;
  }
  id v15 = [(ICNoteEditorViewController *)self attributionSidebarController];
  id v16 = [v15 panGestureRecognizer];

  if (v16 != v6)
  {
LABEL_5:
    BOOL v14 = 1;
    goto LABEL_22;
  }
  uint64_t v12 = [v7 view];
  NSClassFromString(&cfstr_Icpaperdocumen.isa);
  if (v12)
  {
    while (1)
    {
      uint64_t v17 = [(ICNoteEditorViewController *)self textView];

      if (v12 == v17)
      {
LABEL_10:

        goto LABEL_11;
      }
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v18 = [v12 superview];

      uint64_t v12 = (void *)v18;
      if (!v18) {
        goto LABEL_10;
      }
    }
    BOOL v14 = 0;
    goto LABEL_21;
  }
LABEL_11:
  if (![(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    uint64_t v12 = [(ICNoteEditorViewController *)self textView];
    NSUInteger v19 = objc_msgSend(v12, "ic_pkSelectionInteraction");
    if ([v19 hasCurrentSelection])
    {
      BOOL v14 = 0;
    }
    else
    {
      int v20 = [(ICNoteEditorViewController *)self textView];
      double v21 = objc_msgSend(v20, "ic_pkSelectionInteraction");
      BOOL v14 = ([v21 hasStrokesOrElementsSelection] & 1) == 0 && objc_msgSend(v7, "type") == 0;
    }
    goto LABEL_21;
  }
  BOOL v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICNoteEditorViewController *)self attributionSidebarController];
  id v9 = [v8 panGestureRecognizer];

  if (v9 != v7)
  {
LABEL_13:
    char v18 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [v6 view];
  uint64_t v11 = [(ICNoteEditorViewController *)self textView];
  if (v10 == (void *)v11)
  {
    id v12 = v10;
    goto LABEL_11;
  }
  id v12 = (id)v11;
  double v13 = [v6 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  BOOL v14 = [v6 view];
  id v15 = [v14 panGestureRecognizer];

  if (v15 != v6) {
    goto LABEL_12;
  }
  uint64_t v10 = [v6 view];
  id v12 = v6;
  [v12 velocityInView:v10];
  if (v16 <= 0.0)
  {
LABEL_11:

LABEL_12:
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v20 = [v6 view];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    double v22 = [v6 className];
    char v23 = [v22 isEqualToString:@"UITextRangeAdjustmentGestureRecognizer"];

    if ((isKindOfClass & 1) == 0)
    {
      char v18 = (v21 | v23) ^ 1;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  [v10 contentOffset];
  char v18 = v17 <= 0.0;
  if (v17 <= 0.0)
  {
    [v12 setState:4];
    [v10 contentOffset];
    [v10 setContentOffset:1 animated:0.0];
  }

LABEL_14:
  return v18 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNoteEditorViewController *)self swipeGestureRecognizers];
  if ([v8 containsObject:v6])
  {

LABEL_5:
    objc_opt_class();
    id v12 = ICDynamicCast();
    BOOL v11 = v12 != 0;

    goto LABEL_6;
  }
  id v9 = [(ICNoteEditorViewController *)self attributionSidebarController];
  id v10 = [v9 panGestureRecognizer];

  if (v10 == v6) {
    goto LABEL_5;
  }
  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 textStorage];

  id v6 = ICDynamicCast();

  if (v6) {
    int v7 = [v6 isDropping] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  uint64_t v8 = [(ICNoteEditorBaseViewController *)self note];
  char v9 = [v8 isEditable];

  if ((v9 & 1) == 0)
  {
    id v10 = [(ICNoteEditorBaseViewController *)self note];
    if ([v10 isDeletedOrInTrash])
    {
      BOOL v11 = [(ICNoteEditorViewController *)self isTogglingLock];

      if (!v11) {
        [(ICNoteEditorViewController *)self showRecoverNoteAlert];
      }
    }
    else
    {
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v22 = a3;
  [MEMORY[0x263F5AC00] prefetchHashtagDisplayTextsFromOtherApps];
  [(ICNoteEditorViewController *)self setEditing:1];
  id v4 = [(ICNoteEditorBaseViewController *)self note];

  if (v4)
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
    [v5 requestFire];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F5AC98];
    int v7 = [(ICNoteEditorViewController *)self noteContext];
    uint64_t v8 = [v7 managedObjectContext];
    char v9 = (void *)[v6 newEmptyNoteInContext:v8];
    [(ICNoteEditorViewController *)self setNote:v9];

    [(ICNoteEditorViewController *)self performSelector:sel_startEditing withObject:0 afterDelay:0.0];
  }
  id v10 = [(ICNoteEditorViewController *)self textController];
  uint64_t v11 = [v22 selectedRange];
  uint64_t v13 = v12;
  uint64_t v14 = [(ICNoteEditorViewController *)self isLoadingStyleSelectorInputView] ^ 1;
  id v15 = [v22 typingAttributes];
  double v16 = [(ICNoteEditorViewController *)self textStorage];
  double v17 = objc_msgSend(v10, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v11, v13, v14, v15, v16);
  [v22 setTypingAttributes:v17];

  [(ICNoteEditorViewController *)self textViewScrollIndicatorBottomInsetOverrideToRestore];
  if (v18 > 0.0)
  {
    [(ICNoteEditorViewController *)self textViewScrollIndicatorBottomInsetOverrideToRestore];
    -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverride:](self, "setTextViewScrollIndicatorBottomInsetOverride:");
    [(ICNoteEditorViewController *)self setTextViewScrollIndicatorBottomInsetOverrideToRestore:0.0];
  }
  [(ICNoteEditorViewController *)self setInkPickerState:2];
  NSUInteger v19 = [(ICNoteEditorViewController *)self textView];
  int v20 = [v19 ink];
  char v21 = [v20 _isHandwritingInk];

  if ((v21 & 1) == 0) {
    [(ICNoteEditorViewController *)self hideInkPicker];
  }
  [(ICNoteEditorViewController *)self updateTextInputAccessoryViewForDidBeginEditing:v22];
  [(ICNoteEditorViewController *)self updateStyleSelectorStateIfNeededIgnoreTypingAttributes:0];
  [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self ppt_didEditorBeginEditing];
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v10 = a3;
  id v4 = [(ICNoteEditorViewController *)self auxiliaryResponder];

  if (!v4)
  {
    if ([(ICNoteEditorViewController *)self inkPickerState] == 1) {
      [(ICNoteEditorViewController *)self showInkPicker:1 animated:1];
    }
    else {
      [(ICNoteEditorViewController *)self hideInkPicker];
    }
    [(ICNoteEditorViewController *)self showOrHideActivityStreamToolbarIfNeeded];
    [(ICNoteEditorViewController *)self updateTextInputAccessoryViewForDidEndEditing:v10];
    uint64_t v5 = [(ICNoteEditorViewController *)self calculateRecognitionController];
    [v5 discardPreviewedResult];

    id v6 = [(ICNoteEditorViewController *)self calculateScrubberController];

    if (v6)
    {
      int v7 = [(ICNoteEditorViewController *)self calculateScrubberController];
      [v7 hideScrubber];
    }
    [(ICNoteEditorViewController *)self setEditing:0];
    uint64_t v8 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
    [v8 requestFire];

    [(ICNoteEditorViewController *)self didEndEditingNote];
    char v9 = [(ICNoteEditorViewController *)self textView];
    [v9 setEditable:0];

    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
  }
  [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
  [(ICNoteEditorViewController *)self donateEditingIntentIfNecessary];
}

- (double)textViewScrollPosition
{
  uint64_t v2 = [(ICNoteEditorViewController *)self textView];
  [v2 contentOffset];
  double v4 = v3;

  return v4;
}

- (_NSRange)textViewVisibleRange
{
  uint64_t v2 = [(ICNoteEditorViewController *)self textView];
  uint64_t v3 = objc_msgSend(v2, "ic_visibleRange");
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)restoreTextViewScrollPosition:(double)a3
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    NSUInteger v5 = [(ICNoteEditorViewController *)self textView];
    NSUInteger v6 = [v5 layoutManager];
    NSUInteger v7 = [(ICNoteEditorViewController *)self textView];
    uint64_t v8 = [v7 textContainer];
    [v6 ensureLayoutForTextContainer:v8];
  }
  char v9 = [(ICNoteEditorViewController *)self textView];
  [v9 contentOffset];
  double v11 = v10;

  id v12 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v12, "setClippedContentOffset:", v11, a3);
}

- (void)restoreTextViewVisibleRange:(_NSRange)a3 animated:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    NSUInteger v7 = [(ICNoteEditorViewController *)self textView];
    uint64_t v8 = [v7 layoutManager];
    char v9 = [(ICNoteEditorViewController *)self textView];
    double v10 = [v9 textContainer];
    [v8 ensureLayoutForTextContainer:v10];
  }
  id v11 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v11, "ic_scrollRangeToVisible:consideringInsets:animated:", location, length, 1, 0);
}

- (BOOL)wantsToRemainFirstResponder
{
  if ([(ICNoteEditorViewController *)self isViewLoaded])
  {
    if ([(ICNoteEditorViewController *)self isEditing]) {
      goto LABEL_6;
    }
    uint64_t v3 = [(ICNoteEditorViewController *)self textView];
    NSUInteger v4 = [v3 selectedTextRange];

    if (v4)
    {
      int v5 = [v4 isEmpty];

      if (!v5) {
        goto LABEL_6;
      }
    }
  }
  NSUInteger v6 = [(ICNoteEditorViewController *)self textView];
  NSUInteger v7 = [v6 findInteraction];
  char v8 = [v7 isFindNavigatorVisible];

  if (v8)
  {
LABEL_6:
    LOBYTE(v9) = 1;
  }
  else
  {
    int v9 = [(ICNoteEditorViewController *)self isInkPickerShowing];
    if (v9)
    {
      LOBYTE(v9) = [(ICNoteEditorViewController *)self ic_isViewVisible];
    }
  }
  return v9;
}

- (ICTTTextStorage)textStorage
{
  objc_opt_class();
  uint64_t v3 = [(ICNoteEditorViewController *)self textView];
  NSUInteger v4 = [v3 textStorage];
  int v5 = ICCheckedDynamicCast();

  return (ICTTTextStorage *)v5;
}

- (void)textViewDidChange:(id)a3
{
  id v31 = a3;
  NSUInteger v4 = [(ICNoteEditorViewController *)self textStorage];
  int v5 = [(ICNoteEditorBaseViewController *)self note];
  NSUInteger v6 = [v5 textStorageWithoutCreating];

  if (v4 != v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"The text storage set on the editor does not match the text storage on the note"];
  }
  NSUInteger v7 = [(ICNoteEditorViewController *)self ic_topViewController];
  uint64_t v8 = [v7 modalPresentationStyle];

  if (v8 == 7)
  {
    int v9 = [(ICNoteEditorViewController *)self viewControllerManager];
    [v9 dismissOverlayContent];
  }
  [v31 updateTextViewForDidChange];
  [(ICNoteEditorViewController *)self setIsSelecting:0];
  [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
  double v10 = [(ICNoteEditorBaseViewController *)self note];
  [v10 updateModificationDateAndChangeCountAndSaveAfterDelay];

  id v11 = [(ICNoteEditorViewController *)self textStorage];
  uint64_t v12 = [v11 isEditingOrConvertingMarkedText:0];

  if (![(ICNoteEditorViewController *)self previouslyHadMarkedText])
  {
    if (v12)
    {
      uint64_t v13 = [(ICNoteEditorViewController *)self textView];
      uint64_t v14 = [v13 markedTextRange];

      if (v14)
      {
        id v15 = [(ICNoteEditorViewController *)self textView];
        double v16 = [(ICNoteEditorViewController *)self textView];
        double v17 = [v16 markedTextRange];
        uint64_t v18 = objc_msgSend(v15, "ic_characterRangeFromTextRange:", v17);
        uint64_t v20 = v19;

        char v21 = [(ICNoteEditorViewController *)self textController];
        id v22 = [(ICNoteEditorViewController *)self textView];
        char v23 = [v22 TTTextStorage];
        double v24 = [(ICNoteEditorViewController *)self textView];
        objc_msgSend(v21, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v18, v20, v23, v24);
      }
    }
  }
  BOOL v25 = [(ICNoteEditorViewController *)self calculateScrubberController];
  [v25 hideIfNotScrubbing];

  [(ICNoteEditorViewController *)self setPreviouslyHadMarkedText:v12];
  [(ICNoteEditorViewController *)self setHasMadeEdits];
  double v26 = [(ICNoteEditorBaseViewController *)self note];
  double v27 = [v26 calculateDocumentController];
  [v27 scheduleUpdateAffectingChangeCounts:1 isHighPriority:0];

  double v28 = [(ICNoteEditorViewController *)self inkPaletteController];

  if (v28) {
    [(ICNoteEditorViewController *)self ensureValidInkForNewDrawingOrNote];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self ppt_textViewDidChange];
  }
  double v29 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v30 = [(ICNoteEditorBaseViewController *)self note];
  [v29 postNotificationName:@"ICNoteEditorViewControllerDidEditNote" object:v30];
}

- (void)setHasMadeEdits
{
  if (![(ICNoteEditorViewController *)self hasMadeEdits])
  {
    [(ICNoteEditorViewController *)self setHasMadeEdits:1];
    [(ICNoteEditorViewController *)self updateBarButtons];
  }
}

- (void)updateStyleSelectorStateIfNeededIgnoreTypingAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(ICNoteEditorViewController *)self noteFormattingController];
  NSUInteger v6 = [v5 popoverPresentationController];

  if (v6)
  {
    NSUInteger v7 = [(ICNoteEditorViewController *)self noteFormattingController];
    uint64_t v8 = [v7 popoverPresentationController];
    int v9 = [v8 presentingViewController];

    if (!v9)
    {
LABEL_5:
      double v10 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
      int v11 = [v10 usesStyleMenu];

      if (!v11) {
        return;
      }
    }
  }
  else if (![(ICNoteEditorViewController *)self styleSelectorInputViewShowing])
  {
    goto LABEL_5;
  }
  id v12 = [(ICNoteEditorViewController *)self noteFormattingController];
  [v12 updateWithDataSource:self ignoreTypingAttributes:v3];
}

- (void)selectDrawingAttachmentIfNeeded:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  NSUInteger v4 = ICCheckedDynamicCast();
  [v4 setTextSelectionHidden:0];
  int v5 = [(ICNoteEditorViewController *)self selectedCanvasAttachment];
  NSUInteger v6 = [v12 window];
  [v5 setViewSelected:0 inWindow:v6];

  [v12 selectedRange];
  if (v7 == 1)
  {
    uint64_t v8 = [v12 textStorage];
    int v9 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], objc_msgSend(v12, "selectedRange"), 0);

    objc_opt_class();
    double v10 = ICDynamicCast();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && v10)
    {
      [(ICNoteEditorViewController *)self setSelectedCanvasAttachment:v10];
      int v11 = [v12 window];
      [v10 setViewSelected:1 inWindow:v11];

      [v4 setTextSelectionHidden:1];
    }
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  v58[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 selectedRange];
  uint64_t v7 = v6;
  if (v5 != [(ICNoteEditorViewController *)self lastSelectedRange] || v7 != v8)
  {
    int v9 = [MEMORY[0x263F5ABC0] sharedState];
    [v9 extendDeauthenticationTimer];

    if (![(ICNoteEditorViewController *)self isSelecting])
    {
      [v4 selectedRange];
      if (v10)
      {
        [(ICNoteEditorViewController *)self setIsSelecting:1];
        [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
      }
    }
    if (![(ICNoteEditorViewController *)self isSettingSelection])
    {
      [(ICNoteEditorViewController *)self setIsSettingSelection:1];
      int v11 = [(ICNoteEditorViewController *)self textController];
      uint64_t v12 = [v4 selectedRange];
      uint64_t v14 = v13;
      id v15 = [v4 typingAttributes];
      double v16 = [(ICNoteEditorViewController *)self textStorage];
      double v17 = objc_msgSend(v11, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v12, v14, 1, v15, v16);
      [v4 setTypingAttributes:v17];

      [(ICNoteEditorViewController *)self setIsSettingSelection:0];
    }
    uint64_t v18 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
    [v18 requestFire];

    [(ICNoteEditorViewController *)self updateBarButtons];
    [(ICNoteEditorViewController *)self selectDrawingAttachmentIfNeeded:v4];
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      uint64_t v19 = [(ICNoteEditorViewController *)self textController];
      uint64_t v20 = [v4 textStorage];
      char v21 = (void *)MEMORY[0x263F08D40];
      uint64_t v22 = [v4 selectedRange];
      double v24 = objc_msgSend(v21, "valueWithRange:", v22, v23);
      v58[0] = v24;
      BOOL v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
      double v26 = [v4 layoutManager];
      double v27 = [(ICNoteEditorViewController *)self textView];
      [v19 updateAttachmentsSelectionStateInTextStorage:v20 forSelectedRanges:v25 layoutManager:v26 textView:v27];
    }
    [(ICNoteEditorViewController *)self updateStyleSelectorStateIfNeededIgnoreTypingAttributes:0];
    double v28 = [(ICNoteEditorViewController *)self textView];
    [v28 icaxTextDidChangeSelection];

    uint64_t v29 = [v4 selectedRange];
    -[ICNoteEditorViewController setLastSelectedRange:](self, "setLastSelectedRange:", v29, v30);
    objc_opt_class();
    id v31 = [(ICNoteEditorViewController *)self textView];
    uint64_t v32 = [v31 textStorage];
    uint64_t v33 = ICDynamicCast();

    CGPoint v34 = [(ICNoteEditorViewController *)self textView];
    CGRect v35 = [(ICNoteEditorViewController *)self hashtagController];
    [v35 setHashtagKeyboardDelegate:v34];

    uint64_t v36 = [(ICNoteEditorViewController *)self textView];
    uint64_t v37 = [(ICNoteEditorViewController *)self mentionsController];
    [v37 setMentionsKeyboardDelegate:v36];

    unint64_t v38 = [(ICNoteEditorViewController *)self mentionsController];
    uint64_t v39 = [(ICNoteEditorViewController *)self lastSelectedRange];
    uint64_t v41 = v40;
    uint64_t v42 = [(ICNoteEditorBaseViewController *)self note];
    uint64_t v43 = [(ICNoteEditorViewController *)self textView];
    uint64_t v44 = [(ICNoteEditorViewController *)self textView];
    BYTE1(v56) = [v44 languageHasSpaces];
    LOBYTE(v56) = 0;
    LOBYTE(v39) = [v38 checkForMentionInEditedRange:v39 ofTextStorage:v41 note:v33 textView:v42 allowAutoExplicitMention:v43 isEndingEditing:0 languageHasSpaces:v56 parentAttachment:0];

    if ((v39 & 1) == 0)
    {
      id v45 = [(ICNoteEditorViewController *)self hashtagController];
      uint64_t v46 = [(ICNoteEditorViewController *)self lastSelectedRange];
      uint64_t v48 = v47;
      long long v49 = [(ICNoteEditorBaseViewController *)self note];
      long long v50 = [(ICNoteEditorViewController *)self textView];
      long long v51 = [(ICNoteEditorViewController *)self textView];
      BYTE1(v57) = [v51 languageHasSpaces];
      LOBYTE(v57) = 0;
      [v45 checkForHashtagInEditedRange:v46 ofTextStorage:v48 note:v33 textView:v49 allowAutoExplicitHashtag:v50 isEndingEditing:0 languageHasSpaces:v57 parentAttachment:0];
    }
    long long v52 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v52 setDelegate:self];

    uint64_t v53 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v53 setLinkDelegate:self];

    long long v54 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v54 presentLinkAcceleratorIfNecessaryWithCompletionHandler:&__block_literal_global_990];

    long long v55 = [MEMORY[0x263F08A00] defaultCenter];
    [v55 postNotificationName:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:self];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ICNoteEditorBaseViewController *)self note];

  if (!v10) {
    goto LABEL_25;
  }
  if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0)
  {
    int v11 = [(ICNoteEditorViewController *)self textView];
    int v12 = [v11 isInsertingTextFromKeyboardInput];

    if (v12)
    {
      if ([v9 isEqualToString:@"\t"])
      {
        if (objc_msgSend(MEMORY[0x263F828A0], "ic_isShiftKeyPressed")) {
          [(ICNoteEditorViewController *)self shiftTab:0];
        }
        else {
          [(ICNoteEditorViewController *)self tab:0];
        }
        goto LABEL_25;
      }
      if ([v9 isEqualToString:@"\n"]
        && objc_msgSend(MEMORY[0x263F828A0], "ic_isShiftKeyPressed"))
      {
        [(ICNoteEditorViewController *)self shiftReturn:0];
LABEL_25:
        BOOL v28 = 0;
        goto LABEL_26;
      }
    }
  }
  uint64_t v13 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v14 = [v13 textStorage];
  uint64_t v15 = [v14 length];
  uint64_t v16 = [v9 length];

  if ([v9 length] > length)
  {
    NSUInteger v17 = v15 - length + v16;
    uint64_t v18 = [(ICNoteEditorBaseViewController *)self note];
    LOBYTE(v17) = [v18 allowsNewTextLength:v17];

    if ((v17 & 1) == 0)
    {
      [(ICNoteEditorViewController *)self warnUserNoteLengthExceeded];
      goto LABEL_25;
    }
  }
  if ([v9 isEqualToString:@"\n"])
  {
    uint64_t v19 = [(ICNoteEditorViewController *)self textController];
    int v20 = [v19 insertNewlineForSpecialCasesInTextView:v8];

    if (v20)
    {
      [(ICNoteEditorViewController *)self updateBarButtons];
      goto LABEL_25;
    }
  }
  char v21 = [(ICNoteEditorViewController *)self textView];
  if ([v21 isInsertingTextFromKeyboardInput])
  {
    uint64_t v22 = [(ICNoteEditorBaseViewController *)self note];
    if ([v22 isEmpty])
    {
      unint64_t v23 = [v9 length];

      if (v23 >= 0x41)
      {
        double v24 = [(ICNoteEditorViewController *)self textView];
        BOOL v25 = [v24 typingAttributes];
        double v26 = [v25 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
        unsigned int v27 = [v26 style];

        if (v27 <= 2) {
          [(ICNoteEditorViewController *)self setCurrentTextStyle:3];
        }
      }
      goto LABEL_23;
    }
  }
LABEL_23:
  BOOL v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  int IsExtension = _UIApplicationIsExtension();
  if (a6) {
    int v11 = 0;
  }
  else {
    int v11 = IsExtension;
  }
  if (v11 == 1) {
    +[ICExtensionSafeAPIShims openURL:v9 originatingView:v8 completionHandler:0];
  }

  return v11 ^ 1;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 contentType]) {
    goto LABEL_19;
  }
  id v9 = [(ICNoteEditorBaseViewController *)self note];
  if (![v9 isSharedReadOnly])
  {
    BOOL v10 = [(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen];

    if (v10) {
      goto LABEL_19;
    }
    int v11 = [v8 children];
    int v12 = (void *)[v11 mutableCopy];

    id v13 = objc_alloc(MEMORY[0x263F5B388]);
    uint64_t v14 = [(ICNoteEditorViewController *)self attachmentInsertionController];
    uint64_t v15 = (void *)[v13 initWithInsertionController:v14];

    uint64_t v16 = &off_20C179000;
    if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]
      && objc_msgSend(v15, "canConvertLinkAtLocationToAttachment:", objc_msgSend(v7, "range")))
    {
      NSUInteger v17 = (void *)MEMORY[0x263F823D0];
      uint64_t v18 = [MEMORY[0x263F5B388] convertLinkToAttachmentActionTitle];
      uint64_t v19 = [MEMORY[0x263F5B388] convertAttachmentToLinkSystemImageName];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke;
      v73[3] = &unk_2640B95F0;
      v73[4] = self;
      id v74 = v15;
      id v75 = v7;
      int v20 = objc_msgSend(v17, "ic_actionWithTitle:imageName:handler:", v18, v19, v73);

      uint64_t v16 = &off_20C179000;
      [v12 addObject:v20];
    }
    uint64_t v63 = v15;
    char v21 = (void *)MEMORY[0x263F823D0];
    [MEMORY[0x263F086E0] mainBundle];
    uint64_t v22 = v64 = v12;
    unint64_t v23 = [v22 localizedStringForKey:@"Edit Link" value:&stru_26C10E100 table:0];
    uint64_t v67 = MEMORY[0x263EF8330];
    uint64_t v68 = *((void *)v16 + 142);
    uint64_t v24 = v68;
    id v69 = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_3;
    v70 = &unk_2640B9618;
    uint64_t v71 = self;
    id v25 = v7;
    id v72 = v25;
    uint64_t v26 = objc_msgSend(v21, "ic_actionWithTitle:imageName:handler:", v23, @"pencil", &v67);

    id v62 = (void *)v26;
    [v64 addObject:v26];
    unsigned int v27 = (void *)MEMORY[0x263F823D0];
    BOOL v28 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v29 = [v28 localizedStringForKey:@"Remove Link" value:&stru_26C10E100 table:0];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = v24;
    v65[2] = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_4;
    v65[3] = &unk_2640B9618;
    v65[4] = self;
    id v30 = v25;
    id v66 = v30;
    uint64_t v31 = objc_msgSend(v27, "ic_actionWithTitle:imageName:handler:", v29, @"trash", v65);

    CGRect v61 = (void *)v31;
    [v64 addObject:v31];
    uint64_t v32 = (void *)MEMORY[0x263F82940];
    uint64_t v33 = (void *)[v64 copy];
    CGPoint v34 = [v32 menuWithChildren:v33];

    CGRect v35 = [v30 link];
    uint64_t v36 = [v35 absoluteString];
    uint64_t v37 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier();

    CGRect v60 = (void *)v37;
    unint64_t v38 = [MEMORY[0x263F5AB68] predicateForNotesMentionedInURL:v37];
    uint64_t v39 = [MEMORY[0x263F5ACA0] sharedContext];
    uint64_t v40 = v39;
    if (v38 && v39)
    {
      uint64_t v59 = v34;
      uint64_t v41 = (void *)MEMORY[0x263F5AC98];
      uint64_t v42 = [v39 managedObjectContext];
      uint64_t v43 = [v41 notesMatchingPredicate:v38 context:v42];

      uint64_t v44 = [v43 firstObject];
      if (!v44
        || ([(ICNoteEditorViewController *)self notePreviewView:v44],
            (uint64_t v45 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        int v51 = 1;
        uint64_t v56 = v63;
        CGPoint v34 = v59;
        goto LABEL_18;
      }
      uint64_t v46 = (void *)v45;
      id v47 = objc_alloc(MEMORY[0x263F82D40]);
      uint64_t v48 = [v46 view];
      uint64_t v49 = [v47 initWithView:v48];

      long long v50 = (void *)v49;
      uint64_t v58 = v46;
      CGPoint v34 = v59;
      self = [MEMORY[0x263F82D38] configurationWithPreview:v49 menu:v59];

      int v51 = 0;
      uint64_t v43 = v58;
    }
    else
    {
      id v52 = objc_alloc(MEMORY[0x263F08BA0]);
      uint64_t v53 = [v30 link];
      uint64_t v43 = (void *)[v52 initWithURL:v53 resolvingAgainstBaseURL:0];

      long long v54 = [v43 scheme];
      self = (ICNoteEditorViewController *)[v54 isEqualToString:@"x-apple-data-detectors"];

      if (self)
      {
        id v55 = (id)[MEMORY[0x263F82D38] configurationWithMenu:v8];
        int v51 = 1;
      }
      else
      {
        self = [MEMORY[0x263F82D38] configurationWithMenu:v34];
        int v51 = 0;
      }
    }
    uint64_t v56 = v63;
LABEL_18:

    if (!v51) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

LABEL_19:
  self = [MEMORY[0x263F82D38] configurationWithMenu:v8];
LABEL_20:

  return self;
}

void __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] note];
  int v3 = [v2 canAddAttachment];

  id v4 = a1[4];
  if (v3)
  {
    uint64_t v5 = [v4 textView];
    [v5 unmarkText];

    id v6 = a1[5];
    id v7 = a1[6];
    dispatchMainAfterDelay();
  }
  else
  {
    [v4 warnUserAttachmentLimitExceeded];
  }
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) range];

  return [v1 convertLinkAtLocationToAttachment:v2];
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) openLinkEditorForLinkTextItem:*(void *)(a1 + 40)];
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeLinkForLinkTextItem:*(void *)(a1 + 40)];
}

- (void)textViewWritingToolsWillBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  id v6 = [v5 documentMergeController];
  [v6 beginBlockingMergeForReason:7 textView:v11];

  id v7 = [v11 TTTextStorage];
  [v7 setIsEditingViaWritingTools:1];

  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v11 TTTextStorage];
  [v9 setWritingToolsSessionUUID:v8];

  BOOL v10 = [v11 TTTextStorage];
  [v10 breakUndoCoalescing];
}

- (void)textViewWritingToolsDidEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [v11 TTTextStorage];
  [v5 setIsEditingViaWritingTools:0];

  id v6 = [v11 TTTextStorage];
  [v6 setWritingToolsSessionUUID:0];

  id v7 = [v11 TTTextStorage];
  [v7 breakUndoCoalescing];

  id v8 = [(ICNoteEditorBaseViewController *)self note];
  [v8 save];

  id v9 = [(ICNoteEditorBaseViewController *)self note];
  BOOL v10 = [v9 documentMergeController];
  [v10 endBlockingMergeForReason:7 textView:v11];
}

- (id)textView:(id)a3 writingToolsIgnoredRangesInEnclosingRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_opt_class();
  id v8 = ICDynamicCast();

  id v9 = [v8 TTTextStorage];

  if (v9)
  {
    BOOL v10 = [(ICNoteEditorViewController *)self textController];
    id v11 = [v8 TTTextStorage];
    int v12 = [(ICNoteEditorBaseViewController *)self note];
    id v13 = objc_msgSend(v10, "writingToolsIgnoredRangesForTextStorage:inEnclosingRange:note:", v11, location, length, v12);
  }
  else
  {
    id v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (void)_textViewWillBeginUndoCoalescingForWritingTools:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 TTTextStorage];
  [v4 setIsUndoCoalescingForWritingTools:1];
}

- (void)_textViewDidEndUndoCoalescingForWritingTools:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 TTTextStorage];
  [v4 setIsUndoCoalescingForWritingTools:0];
}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  LOBYTE(a3) = [v4 allowsNewTextLength:a3];

  return a3;
}

- (void)didInvokeAnalyticsCalloutBarButtonActionOfType:(int64_t)a3
{
  id v6 = [(ICNoteEditorViewController *)self eventReporter];
  id v5 = [(ICNoteEditorBaseViewController *)self note];
  [v6 submitNoteEditorCallOutBarButtonSelectionEventForModernNote:v5 buttonTypeValue:a3];
}

- (void)didInvokeAnalyticsChecklistActionChecked:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  [(ICNoteEditorViewController *)self submitChecklistAnalyticsEventForActionType:v3];
}

- (void)didInvokePasteWithAttributedString:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F81520];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "ic_range");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke;
  v12[3] = &unk_2640B89D0;
  void v12[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v6, v7, 0, v12);
  uint64_t v8 = *MEMORY[0x263F814A0];
  uint64_t v9 = objc_msgSend(v5, "ic_range");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke_2;
  v11[3] = &unk_2640B89D0;
  v11[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v8, v9, v10, 0, v11);
}

void __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v3 = [NSURL URLWithString:v7];
  }
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) eventReporter];
    uint64_t v6 = [*(id *)(a1 + 32) note];
    [v5 submitAddLinkEvent:v6 addApproach:1 url:v4];
  }
LABEL_7:
}

void __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    uint64_t v4 = [*(id *)(a1 + 32) eventReporter];
    id v5 = [*(id *)(a1 + 32) note];
    [v4 submitAddLinkEvent:v5 addApproach:1 contentType:1 isTokenized:1];
  }
}

- (BOOL)handleTapGestureForAttribution:(id)a3
{
  id v4 = a3;
  if ([(ICNoteEditorViewController *)self attributionSidebarVisibility] == 2)
  {
    id v5 = [(ICNoteEditorViewController *)self attributionSidebarView];
    [v5 handleTapGesture:v4];
LABEL_8:

    BOOL v11 = 1;
    goto LABEL_9;
  }
  id v6 = [(ICNoteEditorViewController *)self attributionSidebarController];
  id v7 = [v6 filter];

  if (v7)
  {
    uint64_t v8 = [(ICNoteEditorViewController *)self viewControllerManager];
    int v9 = [v8 hasCompactWidth];

    uint64_t v10 = [(ICNoteEditorViewController *)self viewControllerManager];
    id v5 = v10;
    if (v9) {
      [v10 hideActivityStreamWithCompletion:0];
    }
    else {
      [v10 hideAttributionHighlights];
    }
    goto LABEL_8;
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)shouldStartEditingForTapGesture:(id)a3
{
  id v4 = a3;
  if ([(ICNoteEditorViewController *)self attributionSidebarVisibility] != 2)
  {
    if ([(ICNoteEditorViewController *)self attributionSidebarVisibility] == 1) {
      goto LABEL_5;
    }
    int v9 = [(ICNoteEditorViewController *)self dateOfLastStrokeOrNewDrawing];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x263EFF910] date];
      BOOL v11 = [(ICNoteEditorViewController *)self dateOfLastStrokeOrNewDrawing];
      [v10 timeIntervalSinceDate:v11];
      double v13 = v12;

      if (v13 < 0.5)
      {
        id v5 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[ICNoteEditorViewController shouldStartEditingForTapGesture:](v5, v13, v14, v15);
        }
        goto LABEL_3;
      }
      if (v13 < 1.5)
      {
        uint64_t v16 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[ICNoteEditorViewController shouldStartEditingForTapGesture:](v16, v13, v17, v18);
        }

        [(ICNoteEditorViewController *)self setDateOfLastStrokeOrNewDrawing:0];
        goto LABEL_5;
      }
    }
    uint64_t v19 = [(ICNoteEditorViewController *)self viewControllerManager];
    if ([v19 hasCompactWidth])
    {
      int v20 = [(ICNoteEditorViewController *)self viewControllerManager];
      char v21 = [v20 presentedActivityStreamNavigationController];

      if (v21)
      {
        id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
        [v5 hideActivityStreamWithCompletion:0];
        goto LABEL_3;
      }
    }
    else
    {
    }
    char v6 = 1;
    goto LABEL_6;
  }
  id v5 = [(ICNoteEditorViewController *)self attributionSidebarView];
  [v5 handleTapGesture:v4];
LABEL_3:

LABEL_5:
  char v6 = 0;
LABEL_6:
  BOOL v7 = v6 & ![(ICNoteEditorViewController *)self suspendTapGestureRecognizer];

  return v7;
}

- (void)startEditingForWritingTools
{
  [(ICNoteEditorViewController *)self setInStartEditingForWritingTools:1];
  id v3 = [(ICNoteEditorBaseViewController *)self note];
  char v4 = [v3 isSharedReadOnly];

  if ((v4 & 1) == 0) {
    [(ICNoteEditorViewController *)self startEditing];
  }

  [(ICNoteEditorViewController *)self setInStartEditingForWritingTools:0];
}

- (BOOL)shouldBlockHitTestOnTextView:(id)a3 event:(id)a4
{
  id v5 = a4;
  if ([(ICNoteEditorViewController *)self isDrawingStrokeWithPencil]) {
    int v6 = objc_msgSend(v5, "ic_isPencilEvent") ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)shouldShowMenuItems
{
  if ([(ICNoteEditorViewController *)self isShowingIndentationItems]) {
    return 0;
  }
  else {
    return ![(ICNoteEditorViewController *)self isShowingChecklistItems];
  }
}

- (BOOL)shouldInsertNewDrawingsAsPaper
{
  uint64_t v2 = [(ICNoteEditorViewController *)self textView];
  char v3 = [v2 isPaperEnabled];

  return v3;
}

void __61__ICNoteEditorViewController_updateUserAndDateViewVisibility__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textView];
  char v3 = [v2 userTitleView];
  [v3 setAlpha:1.0];

  id v5 = [*(id *)(a1 + 32) textView];
  char v4 = [v5 dateView];
  [v4 setAlpha:1.0];
}

- (void)textViewDidBreakRubberBand:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self textView];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(ICNoteEditorViewController *)self setPreventSnappingToLastPaperDocument:1];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  double v11 = -a5->y;
  if (!IsTextKit2Enabled)
  {
    if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
    {
      [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
      if (v16 < v11) {
        goto LABEL_25;
      }
      [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromTop];
      if (v17 > v11 || y < 0.0) {
        goto LABEL_25;
      }
      [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:0];
      [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
      a5->double y = -v18;
      [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
    }
    else
    {
      double v19 = a5->y;
      [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
      if (vabdd_f64(-v19, v20) >= 0.00999999978 || y >= 0.0) {
        goto LABEL_25;
      }
      [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:1];
      [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
      a5->double y = -v21;
      [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
    }
LABEL_24:
    *((unsigned char *)v44 + 24) = 1;
    goto LABEL_25;
  }
  if ((objc_msgSend(MEMORY[0x263F82670], "ic_isVision") & 1) == 0)
  {
    [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromTop];
    double v11 = v11 - v12;
  }
  uint64_t v13 = [(ICNoteEditorViewController *)self userWantsToSeeDateLabel];
  if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel]
    || ([(ICNoteEditorViewController *)self textViewTopInsetThatWeWant],
        vabdd_f64(v11, v22) >= 0.00999999978)
    || y >= 0.0)
  {
    if ([(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
    {
      [(ICNoteEditorViewController *)self textViewTopInsetThatWeWant];
      BOOL v14 = v11 < 0.0;
      if (v11 > v15) {
        BOOL v14 = 1;
      }
      if (y < 0.0) {
        BOOL v14 = 1;
      }
      uint64_t v13 = v14 & v13;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }
  if (v13 != [(ICNoteEditorViewController *)self userWantsToSeeDateLabel])
  {
    [(ICNoteEditorViewController *)self setUserWantsToSeeDateLabel:v13];
    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
    goto LABEL_24;
  }
LABEL_25:
  unint64_t v23 = [MEMORY[0x263F5ABC0] sharedState];
  [v23 extendDeauthenticationTimer];

  if (!*((unsigned char *)v44 + 24))
  {
    uint64_t v24 = [(ICNoteEditorViewController *)self textView];
    id v25 = [v24 textStorage];
    uint64_t v26 = [(ICNoteEditorViewController *)self textView];
    unsigned int v27 = [v26 textStorage];
    uint64_t v28 = objc_msgSend(v27, "ic_range");
    uint64_t v30 = v29;
    uint64_t v31 = *MEMORY[0x263F814A0];
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    CGRect v35 = __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
    uint64_t v36 = &unk_2640B9688;
    uint64_t v37 = self;
    uint64_t v40 = a5;
    id v38 = v9;
    uint64_t v39 = &v43;
    CGFloat v41 = x;
    double v42 = y;
    objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", v31, v28, v30, 2, &v33);

    if (*((unsigned char *)v44 + 24))
    {
      uint64_t v32 = [(ICNoteEditorViewController *)self textView];
      [v32 setShouldRubberBand:0];
    }
  }
  _Block_object_dispose(&v43, 8);
}

void __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  objc_opt_class();
  id v9 = ICDynamicCast();

  if ([v9 viewportShouldSnapToAttachmentView])
  {
    uint64_t v10 = [*(id *)(a1 + 32) attachmentViewForTextAttachment:v9 characterIndex:a3];
    double v11 = v10;
    if (v10)
    {
      [v10 bounds];
      double Height = CGRectGetHeight(v87);
      uint64_t v13 = [*(id *)(a1 + 32) textView];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [*(id *)(a1 + 32) textView];
      [v22 safeAreaInsets];
      CGFloat v24 = v17 + v23;
      CGFloat v27 = v19 - (v25 + v26);
      v88.size.double height = v21 - (v23 + v28);
      v88.origin.CGFloat x = v15 + v25;
      v88.origin.double y = v24;
      v88.size.double width = v27;
      double v29 = CGRectGetHeight(v88);

      if (Height < v29) {
        goto LABEL_33;
      }
    }
    uint64_t v30 = [*(id *)(a1 + 32) textView];
    uint64_t v31 = [v30 textStorage];
    if (a3 == [v31 length] - 1)
    {
      char v32 = 0;
    }
    else
    {
      uint64_t v33 = [*(id *)(a1 + 32) lastPaperDocumentAttachmentView];
      char v34 = [v11 isEqual:v33];

      char v32 = v34 ^ 1;
    }

    CGRect v35 = [MEMORY[0x263F5B3F8] rootSettings];
    if (![v35 isRubberBandingEnabled]
      || (v32 & 1) != 0
      || ([*(id *)(a1 + 32) isEditing] & 1) != 0)
    {
    }
    else
    {
      int v68 = [v9 viewportShouldSnapToAttachmentView];

      if (v68)
      {
        uint64_t v69 = **(void **)(a1 + 56);
        [*(id *)(a1 + 40) contentSize];
        double v71 = v70;
        [*(id *)(a1 + 40) bounds];
        double v72 = CGRectGetHeight(v89);
        objc_super v73 = [*(id *)(a1 + 32) textView];
        id v74 = [v73 bottomContentPadding];
        [v74 currentValue];
        double v76 = v75;
        id v77 = [*(id *)(a1 + 32) textView];
        [v77 textContainerInset];
        double v79 = v78;

        if (v11)
        {
          [v11 bounds];
          objc_msgSend(v11, "convertPoint:toView:", *(void *)(a1 + 40));
          uint64_t v69 = v80;
          double v82 = v81;
          [*(id *)(a1 + 40) safeAreaInsets];
          double v84 = v82 - v83;
        }
        else
        {
          double v84 = v71 - v72 - v76 - v79;
        }
        if (*(double *)(*(void *)(a1 + 56) + 8) >= v84
          && ([*(id *)(a1 + 32) preventSnappingToLastPaperDocument] & 1) == 0)
        {
          uint64_t v85 = *(void *)(a1 + 56);
          *(void *)uint64_t v85 = v69;
          *(double *)(v85 + 8) = v84;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a5 = 1;
          goto LABEL_33;
        }
      }
    }
    if (v11)
    {
      uint64_t v36 = [MEMORY[0x263F5B3F8] rootSettings];
      [v36 snapToPDFDistanceForEndDragging];
      double v38 = v37;

      uint64_t v39 = [*(id *)(a1 + 32) textView];
      objc_msgSend(v39, "convertPoint:toView:", v11, **(double **)(a1 + 56), *(double *)(*(void *)(a1 + 56) + 8));
      double v41 = v40;

      [v11 bounds];
      double v43 = v42;
      double v45 = v44;
      [*(id *)(a1 + 40) safeAreaInsets];
      double v47 = v45 - v46;
      uint64_t v48 = [*(id *)(a1 + 32) textView];
      objc_msgSend(v48, "convertPoint:fromView:", v11, v43, v47);
      uint64_t v50 = v49;
      double v52 = v51;

      double v53 = vabdd_f64(v47, v41);
      if (v53 < v38) {
        char v54 = 1;
      }
      else {
        char v54 = v32;
      }
      if (v54)
      {
        if (v53 >= v38) {
          goto LABEL_33;
        }
      }
      else
      {
        if (*(double *)(*(void *)(a1 + 56) + 8) < v52) {
          goto LABEL_33;
        }
        id v55 = [*(id *)(a1 + 32) textView];
        int v56 = [v55 shouldRubberBand];

        if (!v56) {
          goto LABEL_33;
        }
      }
      uint64_t v57 = *(void *)(a1 + 56);
      *(void *)uint64_t v57 = v50;
      *(double *)(v57 + 8) = v52;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a5 = 1;
      if (*(double *)(a1 + 72) <= 0.0) {
        char v58 = 1;
      }
      else {
        char v58 = v32;
      }
      if ((v58 & 1) == 0 && [v9 viewportShouldSnapToAttachmentView])
      {
        uint64_t v59 = *(void **)(a1 + 56);
        CGRect v60 = [*(id *)(a1 + 32) textView];
        [v60 contentOffset];
        void *v59 = v61;
        v59[1] = v62;

        uint64_t v63 = [*(id *)(a1 + 32) textView];
        [v63 contentOffset];
        double v65 = v52 - v64;

        double v66 = *(double *)(a1 + 72) * 1000.0 / v65;
        uint64_t v67 = [*(id *)(a1 + 32) textView];
        [v67 setShouldRubberBand:0];

        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2;
        v86[3] = &unk_2640B9640;
        v86[4] = *(void *)(a1 + 32);
        v86[5] = v50;
        *(double *)&v86[6] = v52;
        [MEMORY[0x263F82E00] _animateUsingDefaultDampedSpringWithDelay:196608 initialSpringVelocity:v86 options:&__block_literal_global_1017 animations:0.0 completion:v66];
      }
    }
LABEL_33:
  }
}

void __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v3, "setContentOffset:", v1, v2);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    int v6 = [(ICNoteEditorBaseViewController *)self note];
    BOOL v7 = [v6 documentMergeController];
    id v8 = [(ICNoteEditorViewController *)self textView];
    [v7 endBlockingMergeForReason:1 textView:v8];

    [(ICNoteEditorViewController *)self setPreventSnappingToLastPaperDocument:0];
  }
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  id v6 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v4 = [v6 documentMergeController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  [v4 endBlockingMergeForReason:1 textView:v5];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(ICNoteEditorViewController *)self prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:a3];
  uint64_t v4 = [MEMORY[0x263F5ABC0] sharedState];
  [v4 extendDeauthenticationTimer];

  id v7 = [(ICNoteEditorBaseViewController *)self note];
  id v5 = [v7 documentMergeController];
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v5 beginBlockingMergeForReason:1 textView:v6];
}

- (id)lastPaperDocumentAttachmentView
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 textStorage];
  id v5 = [v4 string];
  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v7 = [v6 invertedSet];
  uint64_t v8 = [v5 rangeOfCharacterFromSet:v7 options:4];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = [v3 textStorage];
    double v11 = [v10 attribute:*MEMORY[0x263F814A0] atIndex:v8 effectiveRange:0];
    double v12 = ICDynamicCast();

    if (v12 && [v12 viewportShouldSnapToAttachmentView])
    {
      id v9 = [(ICNoteEditorViewController *)self attachmentViewForTextAttachment:v12 characterIndex:v8];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)attachmentViewForTextAttachment:(id)a3 characterIndex:(int64_t)a4
{
  id v6 = a3;
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  uint64_t v8 = [(ICNoteEditorViewController *)self textView];
  id v9 = v8;
  if (IsTextKit2Enabled)
  {
    uint64_t v10 = [v8 textContainer];
    double v11 = [v10 textLayoutManager];

    double v12 = [v11 documentRange];
    uint64_t v13 = [v12 location];
    double v14 = [v11 locationFromLocation:v13 withOffset:a4];

    double v15 = [v11 viewProviderForTextAttachment:v6 location:v14];
    id v9 = v11;
  }
  else
  {
    double v14 = [v8 icLayoutManager];
    double v15 = [v14 viewProviderForTextAttachment:v6 characterIndex:a4];
  }

  double v16 = [v15 view];

  return v16;
}

- (void)prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self textView];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[scrollView isEqual:self.textView]", "-[ICNoteEditorViewController prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:]", 1, 0, @"Unexpected scroll view: %@", v4 functionName simulateCrash showAlert format];
  }
  [(ICNoteEditorViewController *)self setPreventSnappingToLastPaperDocument:0];
  id v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setShouldRubberBand:0];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = [(ICNoteEditorBaseViewController *)self note];
  if ([v10 isEmpty])
  {
  }
  else
  {
    char v11 = [(ICNoteEditorViewController *)self isEditing];

    if ((v11 & 1) == 0)
    {
      double v12 = [(ICNoteEditorViewController *)self lastPaperDocumentAttachmentView];
      uint64_t v13 = [MEMORY[0x263F5B3F8] rootSettings];
      if ([v13 isRubberBandingEnabled] && v12)
      {
        [v12 bounds];
        double Height = CGRectGetHeight(v57);
        double v15 = [(ICNoteEditorViewController *)self textView];
        [v15 bounds];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        CGFloat v24 = [(ICNoteEditorViewController *)self textView];
        [v24 safeAreaInsets];
        CGFloat v26 = v19 + v25;
        CGFloat v29 = v21 - (v27 + v28);
        v58.size.double height = v23 - (v25 + v30);
        v58.origin.CGFloat x = v17 + v27;
        v58.origin.double y = v26;
        v58.size.double width = v29;
        double v31 = CGRectGetHeight(v58);

        if (Height >= v31)
        {
          [v12 bounds];
          objc_msgSend(v4, "convertPoint:fromView:", v12);
          double v33 = v32;
          double v35 = v34;
          [v4 safeAreaInsets];
          double v37 = v35 - v36;
          [v4 contentOffset];
          if (v38 < v37 || ([v4 contentOffset], vabdd_f64(v39, v37) < 16.0))
          {
            double v40 = [(ICNoteEditorViewController *)self textView];
            [v40 setShouldRubberBand:1];

            double v41 = [(ICNoteEditorViewController *)self textView];
            objc_msgSend(v41, "setRubberBandContentOffset:", v33, v37);
          }
          [v4 contentOffset];
          [(ICNoteEditorViewController *)self setPreventSnappingToLastPaperDocument:v42 >= v37];
        }
      }
      else
      {
      }
      double v43 = [(ICNoteEditorViewController *)self textView];
      double v44 = [v43 textStorage];
      uint64_t v51 = *MEMORY[0x263F814A0];
      double v45 = [(ICNoteEditorViewController *)self textView];
      double v46 = [v45 textStorage];
      double v52 = v12;
      uint64_t v47 = objc_msgSend(v46, "ic_range");
      uint64_t v49 = v48;
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __83__ICNoteEditorViewController_prepareToSnapToPaperDocumentAtStartOfDragIfNecessary___block_invoke;
      v53[3] = &unk_2640B96B0;
      v53[4] = self;
      id v54 = v4;
      id v55 = v8;
      id v56 = v9;
      objc_msgSend(v44, "enumerateAttribute:inRange:options:usingBlock:", v51, v47, v49, 0, v53);
    }
  }
  uint64_t v50 = [(ICNoteEditorViewController *)self textView];
  [v50 setDraggingSnapPoints:v8];
}

uint64_t __83__ICNoteEditorViewController_prepareToSnapToPaperDocumentAtStartOfDragIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  double v20 = ICDynamicCast();

  uint64_t v6 = [v20 viewportShouldSnapToAttachmentView];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) attachmentViewForTextAttachment:v20 characterIndex:a3];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 bounds];
      objc_msgSend(v8, "convertPoint:toView:", *(void *)(a1 + 40));
      double v10 = v9;
      double v12 = v11;
      [*(id *)(a1 + 40) safeAreaInsets];
      double v14 = v12 - v13;
      [*(id *)(a1 + 40) contentOffset];
      if (vabdd_f64(v15, v14) > 16.0)
      {
        double v16 = *(void **)(a1 + 48);
        double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v10, v14);
        [v16 addObject:v17];
      }
      double v18 = [*(id *)(a1 + 32) firstEmbeddedScrollViewInView:v8];
      if (v18) {
        [*(id *)(a1 + 56) addObject:v18];
      }
    }
  }

  return MEMORY[0x270F9A790](v6);
}

- (id)firstEmbeddedScrollViewInView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(ICNoteEditorViewController *)self firstEmbeddedScrollViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [v4 userTitleView];
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    [(ICNoteEditorViewController *)self updateTextViewContentInsetsAnimated:1];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self updateNoteUserActivityStateDelayer];
  [v4 requestFire];

  [(ICNoteEditorViewController *)self setPreventSnappingToLastPaperDocument:0];
  id v7 = [(ICNoteEditorBaseViewController *)self note];
  id v5 = [v7 documentMergeController];
  char v6 = [(ICNoteEditorViewController *)self textView];
  [v5 endBlockingMergeForReason:1 textView:v6];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v6 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v6 documentMergeController];
  id v5 = [(ICNoteEditorViewController *)self textView];
  [v4 endBlockingMergeForReason:1 textView:v5];
}

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self userActivityUpdateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ICNoteEditorViewController_userActivityWillSave___block_invoke;
  v7[3] = &unk_2640B82D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __51__ICNoteEditorViewController_userActivityWillSave___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) noteUserActivityState];
  [v2 updateUserActivity:*(void *)(a1 + 40)];
}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v6 = (void *)MEMORY[0x263F5AC48];
  id v7 = a5;
  id v8 = a4;
  id v9 = [v6 sharedController];
  [v9 didReceiveInputStream:v8 outputStream:v7];
}

- (id)userActivity
{
  id v3 = [(ICNoteEditorViewController *)self noteUserActivity];

  if (!v3) {
    [(ICNoteEditorViewController *)self updateNoteUserActivityState];
  }

  return [(ICNoteEditorViewController *)self noteUserActivity];
}

- (void)presentAttachment:(id)a3
{
}

- (void)attachmentView:(id)a3 shouldPresentNote:(id)a4
{
  id v5 = [(ICNoteEditorViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICNoteEditorViewController *)self delegate];
    [v7 noteEditor:self didTapAttachment:0];
  }
}

- (void)attachmentView:(id)a3 shouldPresentAttachment:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_INFO, "No attachment to present for attachment view", buf, 2u);
    }
LABEL_6:

    goto LABEL_32;
  }
  if (![MEMORY[0x263F5B310] canUpdateFullscreenSketchAttachment:v7])
  {
    id v9 = [(ICNoteEditorViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int v10 = [v7 attachmentType];

      if (v10 == 11)
      {
        int v11 = 1;
LABEL_13:
        if (ICInternalSettingsIsAudioTranscriptionEnabled()
          && v11
          && [v7 attachmentType] == 4)
        {
          if ([v7 needsInitialFetchFromCloud]) {
            goto LABEL_32;
          }
          id v8 = [(ICNoteEditorViewController *)self audioAttachmentEditorCoordinator];
          [v8 presentRecordingViewControllerForAttachment:v7];
          goto LABEL_6;
        }
        if (!v11) {
          goto LABEL_32;
        }
        double v12 = [(ICNoteEditorBaseViewController *)self note];
        long long v13 = [v12 attachmentsInOrder];

        uint64_t v14 = [v13 indexOfObject:v7];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v15 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v16 = [v7 shortLoggingDescription];
            *(_DWORD *)uint8_t buf = 138412290;
            double v27 = v16;
            _os_log_impl(&dword_20BE60000, v15, OS_LOG_TYPE_INFO, "Could not find attachment %@ in its note. Falling back to showing just this attachment", buf, 0xCu);
          }
          id v25 = v7;
          uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

          uint64_t v18 = 0;
          long long v13 = (void *)v17;
        }
        else
        {
          uint64_t v18 = v14;
        }
        double v19 = [(ICNoteEditorViewController *)self viewControllerManager];

        if (v19)
        {
          double v20 = [(ICNoteEditorViewController *)self viewControllerManager];
          -[ICAttachmentPresenter presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:](v20, "presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v13, v18, self, 0, [v7 isReadOnly] ^ 1, 0, self);
        }
        else
        {
          double v20 = [(ICNoteEditorViewController *)self quickNoteiPhoneAttachmentPresenter];
          double v21 = [(ICAttachmentPresenter *)v20 presentedViewController];
          if ([v21 isBeingPresented])
          {
          }
          else
          {
            double v22 = [(ICNoteEditorViewController *)self quickNoteiPhoneAttachmentPresenter];
            double v23 = [v22 galleryAttachmentEditorController];

            if (v23)
            {
LABEL_31:

              goto LABEL_32;
            }
            double v20 = -[ICAttachmentPresenter initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:]([ICAttachmentPresenter alloc], "initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:", 0, v13, v18, self, 0, [v7 isReadOnly] ^ 1, self);
            [(ICNoteEditorViewController *)self setQuickNoteiPhoneAttachmentPresenter:v20];
            CGFloat v24 = [v13 objectAtIndexedSubscript:v18];
            [(ICAttachmentPresenter *)v20 presentAttachmentWithSelectedSubAttachment:v24];
          }
        }

        goto LABEL_31;
      }
      id v9 = [(ICNoteEditorViewController *)self delegate];
      int v11 = [v9 noteEditor:self didTapAttachment:v7] ^ 1;
    }
    else
    {
      int v11 = 1;
    }

    goto LABEL_13;
  }
  [(ICNoteEditorViewController *)self showDrawingUpdateAlert];
  ICInternalSettingsIsAudioTranscriptionEnabled();
LABEL_32:
}

- (void)attachmentView:(id)a3 shouldShareAttachment:(id)a4
{
  id v6 = a3;
  id v18 = +[ICAttachmentActivityViewController makeWithAttachment:a4 quickLookItemDelegate:self completion:&__block_literal_global_1030];
  id v7 = [v18 popoverPresentationController];
  [v7 setSourceView:v6];

  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  long long v16 = [v18 popoverPresentationController];
  objc_msgSend(v16, "setSourceRect:", v9, v11, v13, v15);

  uint64_t v17 = [v18 popoverPresentationController];
  [v17 setCanOverlapSourceViewRect:1];

  [(ICNoteEditorViewController *)self presentViewController:v18 animated:1 completion:0];
}

- (BOOL)attachmentView:(id)a3 shouldRespondToPanGestureTouch:(id)a4 forAttachment:(id)a5
{
  id v7 = a4;
  if ([a5 attachmentType] == 9)
  {
    uint64_t v8 = [v7 type];
    BOOL v9 = [(ICNoteEditorViewController *)self isInkPickerShowing];
    BOOL v10 = v8 == 2 || v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6
{
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)notesQuickLookActivityItem:(id)a3 transitionViewForPreviewItem:(id)a4 previewController:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  double v7 = ICDynamicCast();

  double v8 = [(ICNoteEditorViewController *)self viewForAttachment:v7];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(ICNoteEditorViewController *)self textView];
  }
  double v11 = v10;

  return v11;
}

- (id)viewForAttachment:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    id v5 = [(ICNoteEditorViewController *)self textView];
    id v6 = [v5 icTextLayoutManager];
    double v7 = [v4 identifier];
    double v8 = [v6 existingAttachmentViewForIdentifier:v7];
    double v9 = ICDynamicCast();

    objc_opt_class();
    id v10 = ICDynamicCast();
    double v11 = [v10 drawingInlineView];
    double v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v9 quickLookTransitionView];
    }
    double v23 = v13;

    goto LABEL_16;
  }
  double v14 = [(ICNoteEditorViewController *)self textView];
  double v15 = [v14 layoutManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v17 = [(ICNoteEditorViewController *)self textView];
    double v9 = [v17 layoutManager];

    double v18 = [v4 identifier];
    id v10 = [v9 supplementalViewForIdentifier:v18 allowHiddenViews:1];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v10 drawingInlineView];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v23 = 0;
        goto LABEL_16;
      }
      uint64_t v19 = [v10 quickLookTransitionView];
    }
    double v23 = (void *)v19;
LABEL_16:

    goto LABEL_17;
  }
  double v20 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    double v21 = [v4 shortLoggingDescription];
    int v25 = 138412546;
    CGFloat v26 = v21;
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    id v22 = v28;
    _os_log_impl(&dword_20BE60000, v20, OS_LOG_TYPE_INFO, "Trying to find a transition view for %@, but the note editor's layout manager isn't an %@", (uint8_t *)&v25, 0x16u);
  }
  double v23 = 0;
LABEL_17:

  return v23;
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  return [(ICNoteEditorViewController *)self viewForAttachment:a4];
}

- (BOOL)attachmentPresenter:(id)a3 useFullPDFTransitionForAttachment:(id)a4
{
  return 1;
}

- (void)attachmentPresenterDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self quickNoteiPhoneAttachmentPresenter];

  if (v5 == v4)
  {
    [(ICNoteEditorViewController *)self setQuickNoteiPhoneAttachmentPresenter:0];
  }
}

- (void)showDrawingUpdateAlert
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  id v4 = [v3 textDragInteraction];
  char v5 = [v4 isEnabled];

  id v6 = (void *)MEMORY[0x263F5B310];
  double v7 = [(ICNoteEditorBaseViewController *)self note];
  unint64_t v8 = [v6 countOfUpdatableDrawingsInNote:v7];

  double v9 = [MEMORY[0x263F086E0] mainBundle];
  id v10 = v9;
  if (v8 > 1)
  {
    uint64_t v11 = [v9 localizedStringForKey:@"Update Drawings?" value:&stru_26C10E100 table:0];

    double v12 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = v12;
    double v14 = @"You need to update these drawings to edit them.\n\nOnly devices upgraded to the latest version of iOS can edit these drawings.";
  }
  else
  {
    uint64_t v11 = [v9 localizedStringForKey:@"Update Drawing?" value:&stru_26C10E100 table:0];

    double v12 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = v12;
    double v14 = @"You need to update this drawing to edit it.\n\nOnly devices upgraded to the latest version of iOS can edit this drawing.";
  }
  uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_26C10E100 table:0];

  double v31 = (void *)v15;
  double v32 = (void *)v11;
  double v16 = [MEMORY[0x263F82418] alertControllerWithTitle:v11 message:v15 preferredStyle:1];
  objc_initWeak(location, self);
  double v17 = (void *)MEMORY[0x263F82400];
  double v18 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v19 = [v18 localizedStringForKey:@"Learn More" value:&stru_26C10E100 table:0];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke;
  v39[3] = &unk_2640B96D8;
  objc_copyWeak(&v40, location);
  char v41 = v5;
  double v20 = [v17 actionWithTitle:v19 style:0 handler:v39];
  [v16 addAction:v20];

  double v21 = [MEMORY[0x263F086E0] mainBundle];
  if (v8 >= 2) {
    [v21 localizedStringForKey:@"Update Drawings" value:&stru_26C10E100 table:0];
  }
  else {
  id v22 = [v21 localizedStringForKey:@"Update Drawing" value:&stru_26C10E100 table:0];
  }

  double v23 = (void *)MEMORY[0x263F82400];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_2;
  v36[3] = &unk_2640B96D8;
  objc_copyWeak(&v37, location);
  char v38 = v5;
  CGFloat v24 = [v23 actionWithTitle:v22 style:0 handler:v36];
  [v16 addAction:v24];

  int v25 = (void *)MEMORY[0x263F82400];
  CGFloat v26 = [MEMORY[0x263F086E0] mainBundle];
  __int16 v27 = [v26 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_3;
  v33[3] = &unk_2640B96D8;
  objc_copyWeak(&v34, location);
  char v35 = v5;
  id v28 = [v25 actionWithTitle:v27 style:1 handler:v33];
  [v16 addAction:v28];

  uint64_t v29 = [(ICNoteEditorViewController *)self textView];
  double v30 = [v29 textDragInteraction];
  [v30 setEnabled:0];

  [(ICNoteEditorViewController *)self presentViewController:v16 animated:1 completion:0];
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F5B338];
  uint64_t v3 = *MEMORY[0x263F5B0C8];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v2 presentWithTopic:v3 presentingViewController:WeakRetained];

  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  id v9 = objc_loadWeakRetained(v4);
  double v7 = [v9 textView];
  unint64_t v8 = [v7 textDragInteraction];
  [v8 setEnabled:v6];
}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDrawingAttachmentsInNote];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v7 = objc_loadWeakRetained(v2);
  char v5 = [v7 textView];
  uint64_t v6 = [v5 textDragInteraction];
  [v6 setEnabled:v4];
}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained textView];
  uint64_t v3 = [v2 textDragInteraction];
  [v3 setEnabled:v1];
}

- (void)updateDrawingAttachmentsInNote
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_7(&dword_20BE60000, a3, (uint64_t)a3, "Manually updating all drawings in note %@", (uint8_t *)a2);
}

void __60__ICNoteEditorViewController_updateDrawingAttachmentsInNote__block_invoke(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  [v1 performSelector:sel_showInkPicker_ withObject:v1 afterDelay:0.25];
}

- (id)undoManager
{
  uint64_t v3 = [(ICNoteEditorViewController *)self textViewUndoManager];
  if (([v3 canRedo] & 1) != 0 || objc_msgSend(v3, "canUndo"))
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorViewController;
    id v4 = [(ICNoteEditorViewController *)&v7 undoManager];
  }
  char v5 = v4;

  return v5;
}

- (NSUndoManager)textViewUndoManager
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  uint64_t v3 = [v2 undoManager];

  return (NSUndoManager *)v3;
}

+ (UIMenu)formatKeyboardShortcutMenu
{
  v85[20] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F82890] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_tab_];
  [v2 setWantsPriorityOverSystemBehavior:1];
  uint64_t v3 = [MEMORY[0x263F82890] keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel_shiftTab_];
  [v3 setWantsPriorityOverSystemBehavior:1];
  uint64_t v67 = (void *)MEMORY[0x263EFF980];
  id v4 = (void *)MEMORY[0x263F82890];
  double v82 = [MEMORY[0x263F086E0] mainBundle];
  double v81 = [v82 localizedStringForKey:@"Title" value:&stru_26C10E100 table:0];
  uint64_t v80 = objc_msgSend(v4, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"t", 1179648, sel_setTitleStyle_, v81);
  v85[0] = v80;
  char v5 = (void *)MEMORY[0x263F82890];
  double v79 = [MEMORY[0x263F086E0] mainBundle];
  double v78 = [v79 localizedStringForKey:@"Heading" value:&stru_26C10E100 table:0];
  id v77 = objc_msgSend(v5, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"h", 1179648, sel_setHeadingStyle_, v78);
  v85[1] = v77;
  uint64_t v6 = (void *)MEMORY[0x263F82890];
  double v76 = [MEMORY[0x263F086E0] mainBundle];
  double v75 = [v76 localizedStringForKey:@"Subheading" value:&stru_26C10E100 table:0];
  id v74 = objc_msgSend(v6, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"j", 1179648, sel_setSubheadingStyle_, v75);
  v85[2] = v74;
  objc_super v7 = (void *)MEMORY[0x263F82890];
  objc_super v73 = [MEMORY[0x263F086E0] mainBundle];
  double v72 = [v73 localizedStringForKey:@"Body" value:&stru_26C10E100 table:0];
  double v71 = objc_msgSend(v7, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"b", 1179648, sel_setBodyStyle_, v72);
  v85[3] = v71;
  unint64_t v8 = (void *)MEMORY[0x263F82890];
  double v70 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v69 = [v70 localizedStringForKey:@"Monostyled" value:&stru_26C10E100 table:0];
  int v68 = objc_msgSend(v8, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"m", 1179648, sel_setFixedWidthStyle_, v69);
  v85[4] = v68;
  id v9 = (void *)MEMORY[0x263F82890];
  double v66 = [MEMORY[0x263F086E0] mainBundle];
  double v65 = [v66 localizedStringForKey:@"Bulleted list" value:&stru_26C10E100 table:0];
  double v64 = objc_msgSend(v9, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"7", 1179648, sel_setBulletedListStyle_, v65);
  v85[5] = v64;
  id v10 = (void *)MEMORY[0x263F82890];
  uint64_t v63 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v62 = [v63 localizedStringForKey:@"Dashed list" value:&stru_26C10E100 table:0];
  uint64_t v61 = objc_msgSend(v10, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"8", 1179648, sel_setDashedListStyle_, v62);
  v85[6] = v61;
  uint64_t v11 = (void *)MEMORY[0x263F82890];
  CGRect v60 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v59 = [v60 localizedStringForKey:@"Numbered list" value:&stru_26C10E100 table:0];
  CGRect v58 = objc_msgSend(v11, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"9", 1179648, sel_setNumberedListStyle_, v59);
  v85[7] = v58;
  double v12 = (void *)MEMORY[0x263F82890];
  CGRect v57 = [MEMORY[0x263F086E0] mainBundle];
  id v56 = [v57 localizedStringForKey:@"Checklist" value:&stru_26C10E100 table:0];
  id v55 = objc_msgSend(v12, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"l", 1179648, sel_toggleTodoStyle_, v56);
  v85[8] = v55;
  id v13 = (void *)MEMORY[0x263F82890];
  id v54 = [MEMORY[0x263F086E0] mainBundle];
  double v53 = [v54 localizedStringForKey:@"Mark as Checked" value:&stru_26C10E100 table:0];
  double v52 = objc_msgSend(v13, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"u", 1179648, sel_toggleTodoChecked_, v53);
  v85[9] = v52;
  double v14 = (void *)MEMORY[0x263F82890];
  uint64_t v51 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v50 = [v51 localizedStringForKey:@"Block Quote" value:&stru_26C10E100 table:0];
  uint64_t v49 = objc_msgSend(v14, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"'", 0x100000, sel_toggleBlockQuote_, v50);
  v85[10] = v49;
  uint64_t v15 = (void *)MEMORY[0x263F82890];
  uint64_t v48 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v47 = [v48 localizedStringForKey:@"Table" value:&stru_26C10E100 table:0];
  double v46 = objc_msgSend(v15, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"t", 1572864, sel_addTable_, v47);
  v85[11] = v46;
  double v16 = (void *)MEMORY[0x263F82890];
  double v45 = [MEMORY[0x263F086E0] mainBundle];
  double v44 = [v45 localizedStringForKey:@"Decrease Indentation" value:&stru_26C10E100 table:0];
  double v43 = objc_msgSend(v16, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"[", 0x100000, sel_indentLeft_, v44);
  v85[12] = v43;
  double v17 = (void *)MEMORY[0x263F82890];
  double v42 = [MEMORY[0x263F086E0] mainBundle];
  char v41 = [v42 localizedStringForKey:@"Increase Indentation" value:&stru_26C10E100 table:0];
  id v40 = objc_msgSend(v17, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"]", 0x100000, sel_indentRight_, v41);
  v85[13] = v40;
  v85[14] = v2;
  double v83 = v3;
  double v84 = v2;
  v85[15] = v3;
  double v18 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0x20000 action:sel_shiftReturn_];
  v85[16] = v18;
  uint64_t v19 = (void *)MEMORY[0x263F82890];
  uint64_t v20 = *MEMORY[0x263F83770];
  double v21 = [MEMORY[0x263F086E0] mainBundle];
  id v22 = [v21 localizedStringForKey:@"Move Item Up" value:&stru_26C10E100 table:0];
  double v23 = objc_msgSend(v19, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", v20, 1310720, sel_moveSelectedListItemUp_, v22);
  v85[17] = v23;
  CGFloat v24 = (void *)MEMORY[0x263F82890];
  uint64_t v25 = *MEMORY[0x263F83750];
  CGFloat v26 = [MEMORY[0x263F086E0] mainBundle];
  __int16 v27 = [v26 localizedStringForKey:@"Move Item Down" value:&stru_26C10E100 table:0];
  id v28 = objc_msgSend(v24, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", v25, 1310720, sel_moveSelectedListItemDown_, v27);
  v85[18] = v28;
  uint64_t v29 = [MEMORY[0x263F82890] keyCommandWithInput:@"'" modifierFlags:1572864 action:sel_toggleBlockQuote];
  v85[19] = v29;
  double v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:20];
  double v31 = [v67 arrayWithArray:v30];

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    double v32 = (void *)MEMORY[0x263F82890];
    double v33 = [MEMORY[0x263F086E0] mainBundle];
    id v34 = [v33 localizedStringForKey:@"Highlight" value:&stru_26C10E100 table:0];
    char v35 = objc_msgSend(v32, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"e", 1179648, sel_toggleEmphasis_, v34);

    if (v35) {
      [v31 insertObject:v35 atIndex:0];
    }
  }
  double v36 = (void *)MEMORY[0x263F82940];
  id v37 = (void *)[v31 copy];
  char v38 = [v36 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v37];

  return (UIMenu *)v38;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F828A0] isInHardwareKeyboardMode])
  {
    int v8 = [v7 _modifierFlags];
    id v9 = [v7 _modifiedInput];
    id v10 = v9;
    if ((v8 & 0x100000) != 0 && [v9 length] == 1)
    {
      int v11 = [v10 characterAtIndex:0];
      if (v11 == 93)
      {
        [(ICNoteEditorViewController *)self indentRight:0];
        goto LABEL_11;
      }
      if (v11 == 91)
      {
        [(ICNoteEditorViewController *)self indentLeft:0];
LABEL_11:

        goto LABEL_9;
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v12 pressesBegan:v6 withEvent:v7];
LABEL_9:
}

- (ICSelectorDelayer)applyAccessibilityInfoDelayer
{
  applyAccessibilityInfoDelayer = self->_applyAccessibilityInfoDelayer;
  if (!applyAccessibilityInfoDelayer)
  {
    id v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_applyAccessibilityInfo delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
    char v5 = self->_applyAccessibilityInfoDelayer;
    self->_applyAccessibilityInfoDelayer = v4;

    applyAccessibilityInfoDelayer = self->_applyAccessibilityInfoDelayer;
  }

  return applyAccessibilityInfoDelayer;
}

- (void)applyAccessibilityInfo
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICNoteEditorViewController *)self applyAccessibilityInfoDelayer];
  [v3 cancelPreviousFireRequests];

  if (![(ICNoteEditorViewController *)self isDrawingStroke])
  {
    id v28 = self;
    id v4 = [(ICNoteEditorViewController *)self textView];
    char v5 = [v4 inputAssistantItem];

    CGFloat v26 = v5;
    id v6 = [v5 leadingBarButtonGroups];
    id v7 = [v6 firstObject];

    int v8 = [v7 representativeItem];
    id v9 = [MEMORY[0x263F086E0] mainBundle];
    id v10 = [v9 localizedStringForKey:@"Edit" value:&stru_26C10E100 table:0];
    uint64_t v25 = v8;
    objc_msgSend(v8, "setIc_titleAndAccessibilityLabel:", v10);

    int v11 = [v7 barButtonItems];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v12) {
      goto LABEL_19;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v17 = (char *)[v16 action];
        if (v17 == sel_assistantCut)
        {
          double v18 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v19 = v18;
          uint64_t v20 = @"Cut";
        }
        else if (v17 == sel_assistantCopy)
        {
          double v18 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v19 = v18;
          uint64_t v20 = @"Copy";
        }
        else
        {
          if (v17 != sel_assistantPaste) {
            continue;
          }
          double v18 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v19 = v18;
          uint64_t v20 = @"Paste";
        }
        double v21 = [v18 localizedStringForKey:v20 value:&stru_26C10E100 table:0];
        [v16 setAccessibilityLabel:v21];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v13)
      {
LABEL_19:
        id v22 = [(ICNoteEditorViewController *)v28 backgroundView];
        double v23 = [(ICNoteEditorViewController *)v28 textView];
        [v22 reparentAccessibilityChildrenOfElement:v23];

        CGFloat v24 = [(ICNoteEditorViewController *)v28 backgroundView];
        [v24 setAxChildReparentingController:v28];

        return;
      }
    }
  }
  id v27 = [(ICNoteEditorViewController *)self applyAccessibilityInfoDelayer];
  [v27 requestFire];
}

- (void)updateDateLabelAccessibility
{
  uint64_t v3 = [(ICNoteEditorViewController *)self textView];
  id v4 = [v3 dateView];
  int v5 = [v4 isAccessibilityElement];

  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 accessibilityFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  uint64_t v15 = [(ICNoteEditorViewController *)self textView];
  double v16 = [v15 dateView];
  [v16 accessibilityFrame];
  v27.origin.CGFloat x = v17;
  v27.origin.double y = v18;
  v27.size.double width = v19;
  v27.size.double height = v20;
  v26.origin.CGFloat x = v8;
  v26.origin.double y = v10;
  v26.size.double width = v12;
  v26.size.double height = v14;
  BOOL v21 = CGRectContainsRect(v26, v27);

  if (v5 != v21)
  {
    id v22 = [(ICNoteEditorViewController *)self textView];
    double v23 = [v22 dateView];
    [v23 setIsAccessibilityElement:v21];

    UIAccessibilityNotifications v24 = *MEMORY[0x263F831C0];
    UIAccessibilityPostNotification(v24, 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorViewController;
  [(ICNoteEditorViewController *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ICNoteEditorViewController *)self applyAccessibilityInfo];
  [(ICNoteEditorViewController *)self updateDateLabelAccessibility];
  [(ICNoteEditorViewController *)self updateBarButtons];
}

- (void)icaxToggleTodoStyle
{
}

- (void)blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:(double)a3
{
  id v9 = [(ICNoteEditorViewController *)self icSplitViewController];
  uint64_t v4 = [v9 splitViewController];
  if (v4)
  {
    int v5 = (void *)v4;
    id v6 = [(ICNoteEditorViewController *)self icSplitViewController];
    double v7 = [v6 traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];

    if (v8 != 1)
    {
      _UIAccessibilityBlockPostingOfNotification();
      dispatchMainAfterDelay();
    }
  }
  else
  {
  }
}

uint64_t __97__ICNoteEditorViewController_blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration___block_invoke()
{
  return _UIAccessibilityUnblockPostingOfNotification();
}

- (BOOL)allowsAccessibilityChildReparenting
{
  objc_super v3 = [(ICNoteEditorViewController *)self passwordEntryViewController];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    int v5 = [(ICNoteEditorViewController *)self invitationViewController];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [(ICNoteEditorViewController *)self textView];
  [v9 _performScrollTest:v8 iterations:v6 delta:v5];
}

- (void)runTableHorizontalScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(ICNoteEditorViewController *)self textViewController];
  CGFloat v10 = [v9 childViewControllers];

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
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          uint64_t v15 = ICDynamicCast();
          double v16 = [v15 scrollView];
          [v16 _performScrollTest:v8 iterations:v6 delta:v5 scrollAxis:1];

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)applicationDidEnterBackground:(id)a3
{
  if ([(ICNoteEditorViewController *)self isEditing])
  {
    BOOL v4 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
    [v4 setAlpha:0.0];
  }
  objc_opt_class();
  uint64_t v5 = [(ICNoteEditorViewController *)self presentedViewController];
  uint64_t v6 = ICDynamicCast();

  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__ICNoteEditorViewController_applicationDidEnterBackground___block_invoke;
    v7[3] = &unk_2640B8140;
    void v7[4] = self;
    [(ICNoteEditorViewController *)self dismissViewControllerAnimated:0 completion:v7];
  }
}

uint64_t __60__ICNoteEditorViewController_applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupAfterAddImageAttachmentOperation];
}

- (void)sceneWillDeactivate:(id)a3
{
  BOOL v4 = [a3 object];
  uint64_t v5 = [(ICNoteEditorViewController *)self viewIfLoaded];
  uint64_t v6 = [v5 window];
  double v7 = [v6 windowScene];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    [(ICNoteEditorViewController *)self showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:1];
    if ([(ICNoteEditorViewController *)self ic_isViewVisible])
    {
      id v9 = [(ICNoteEditorBaseViewController *)self note];

      if (v9)
      {
        CGFloat v10 = [(ICNoteEditorBaseViewController *)self note];
        [(ICNoteEditorViewController *)self submitNoteViewEventForModernNote:v10];

        [(ICNoteEditorViewController *)self submitNoteEditEventIfNecessary];
      }
    }
  }
}

void __47__ICNoteEditorViewController_sceneDidActivate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "ic_isViewVisible"))
  {
    id v1 = [WeakRetained textView];
    uint64_t v2 = [v1 window];
    if (v2)
    {
      objc_super v3 = (void *)v2;
      BOOL v4 = [WeakRetained textStorage];
      uint64_t v5 = [v4 length];

      if (!v5) {
        goto LABEL_6;
      }
      id v1 = [WeakRetained textView];
      uint64_t v6 = [v1 layoutManager];
      double v7 = [WeakRetained textStorage];
      uint64_t v8 = [v7 length];

      objc_msgSend(v6, "ensureLayoutForCharacterRange:", 0, v8 != 0);
    }
  }
LABEL_6:
}

void __57__ICNoteEditorViewController_applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textViewInputAccessoryView];
  [v1 setAlpha:1.0];
}

- (void)mergeRelatedOperationsDidEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 userInfo];

  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5AA08]];
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13 || (BOOL v7 = [v13 unsignedIntegerValue] == 2, v8 = v13, v7))
  {
    id v9 = [(ICNoteEditorViewController *)self textView];
    char v10 = [v9 isEditing];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [(ICNoteEditorViewController *)self textView];
      objc_msgSend(v11, "ic_resetDataDetectorsResults");

      uint64_t v12 = [(ICNoteEditorViewController *)self textView];
      objc_msgSend(v12, "ic_startDataDetectors");
    }
    [(ICNoteEditorViewController *)self updateStyleSelectorStateIfNeededIgnoreTypingAttributes:1];
    uint64_t v8 = v13;
  }
}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return ![(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPad];
}

- (void)keyboardResizerAdjustInsetsWithKeyboardFrame:(CGRect)a3 scrollAboveHeight:(double)a4 duration:(double)a5
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(ICNoteEditorViewController *)self isEditingOnSystemPaperOnPad]) {
    return;
  }
  [(ICNoteEditorViewController *)self ic_safeAreaDistanceFromBottom];
  double v13 = v12;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.double height = height;
  BOOL IsNull = CGRectIsNull(v57);
  double v53 = a5;
  CGFloat v54 = x;
  CGFloat v55 = y;
  CGFloat rect = width;
  if (!IsNull)
  {
    uint64_t v15 = [(ICNoteEditorViewController *)self textView];
    double v16 = [v15 inputAccessoryView];

    if (!v16)
    {
      long long v17 = [(ICNoteEditorViewController *)self textViewInputAccessoryView];
      [v17 intrinsicContentSize];
      double height = height + v18;
    }
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.double height = height;
    double v19 = CGRectGetHeight(v58) - a4;
    if (v19 < v13) {
      double v19 = v13;
    }
    [(ICNoteEditorViewController *)self setTextViewScrollIndicatorBottomInsetOverride:v19];
    [(ICNoteEditorViewController *)self textViewMinimumBottomInset];
    -[ICNoteEditorViewController setTextViewMinimumBottomInset:](self, "setTextViewMinimumBottomInset:");
    long long v20 = [(ICNoteEditorViewController *)self textView];
    [v20 _contentScrollInset];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    CGRect v27 = [(ICNoteEditorViewController *)self textView];
    [v27 _contentScrollInset];
    if (v31 == v24 && v28 == v22 && v30 == v26)
    {
      double v32 = v29;

      if (v32 == a4) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    double v33 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v33, "_setContentScrollInset:", v22, v24, a4, v26);

    goto LABEL_15;
  }
  [(ICNoteEditorViewController *)self textViewMinimumBottomInset];
  -[ICNoteEditorViewController setTextViewMinimumBottomInset:](self, "setTextViewMinimumBottomInset:");
  [(ICNoteEditorViewController *)self setTextViewScrollIndicatorBottomInsetOverride:v13];
LABEL_15:
  [(ICNoteEditorViewController *)self textViewScrollIndicatorBottomInsetOverride];
  [(ICNoteEditorViewController *)self setTextViewScrollIndicatorBottomInsetOverride:v34 + 5.0];
  [(ICNoteEditorViewController *)self setTextViewScrollIndicatorBottomInsetOverrideToRestore:0.0];
  char v35 = [(ICNoteEditorViewController *)self textView];
  [v35 contentInset];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  [(ICNoteEditorViewController *)self textViewBottomInsetThatWeWantForEditing:!IsNull];
  double v43 = v42;
  [(ICNoteEditorViewController *)self textViewScrollIndicatorInsetsThatWeWant];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  uint64_t v50 = [(ICNoteEditorViewController *)self textView];
  objc_msgSend(v50, "setContentInset:", v37, v39, v43, v41);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    uint64_t v51 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v51, "setVerticalScrollIndicatorInsets:", v37, v45, v47, v49);
  }
  v59.origin.CGFloat x = v54;
  v59.origin.CGFloat y = v55;
  v59.size.CGFloat width = rect;
  v59.size.double height = height;
  if (!CGRectIsNull(v59))
  {
    double v52 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v53];
    [(ICNoteEditorViewController *)self setKeyboardAnimateInFinishTime:v52];
  }
  dispatchMainAfterDelay();
}

uint64_t __102__ICNoteEditorViewController_keyboardResizerAdjustInsetsWithKeyboardFrame_scrollAboveHeight_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBarButtons];
}

- (void)ensureValidInkForNewDrawingOrNote
{
  id v3 = [(ICNoteEditorViewController *)self currentValidToolForNewDrawingOrNote];
  [(ICNoteEditorViewController *)self updateInkPickerAndTextViewToTool:v3];
}

- (void)updateInkPickerAndTextViewToTool:(id)a3
{
  id v10 = a3;
  [(ICNoteEditorViewController *)self createInkPickerControllerIfNecessary];
  id v4 = v10;
  if (v10)
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self inkPaletteController];
    [v5 setSelectedTool:v10];

    if ([(ICNoteEditorViewController *)self isNewInk:v10]
      && [(ICNoteEditorViewController *)self noteHasAnyPencilKitDrawings])
    {
      uint64_t v6 = [(ICNoteEditorViewController *)self inkPaletteController];
      [v6 resetToPencilKitCompatibleInk];
    }
    BOOL v7 = [(ICNoteEditorViewController *)self inkPaletteController];
    uint64_t v8 = [v7 selectedTool];
    id v9 = [(ICNoteEditorViewController *)self textView];
    [v9 _setTool:v8];

    id v4 = v10;
  }
}

- (void)clearTextViewSelection
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  if (v6)
  {
    id v7 = [(ICNoteEditorViewController *)self textView];
    objc_msgSend(v7, "setSelectedRange:", v4, 0);
  }
}

- (void)setSearchRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_searchRegexFinder, a3);
  id v4 = [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsDelayer];
  [v4 requestFire];
}

- (void)showOrHideSearchPatternHighlightsIfNecessary
{
  id v3 = [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsDelayer];
  [v3 cancelPreviousFireRequests];

  if ([(ICNoteEditorViewController *)self isEditing]) {
    goto LABEL_5;
  }
  id v4 = [(ICNoteEditorViewController *)self textView];
  uint64_t v5 = [v4 findInteraction];
  if ([v5 isFindNavigatorVisible])
  {

LABEL_5:
    id v15 = 0;
    goto LABEL_6;
  }
  BOOL v6 = [(ICNoteEditorViewController *)self isInkPickerShowing];

  if (v6) {
    goto LABEL_5;
  }
  id v15 = [(ICNoteEditorViewController *)self searchRegexFinder];
LABEL_6:
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    id v9 = [(ICNoteEditorViewController *)self textView];
    double v13 = [v9 layoutManager];
    CGFloat v14 = ICDynamicCast();
    [v14 setHighlightPatternRegexFinder:v15];

    goto LABEL_11;
  }
  objc_opt_class();
  id v7 = [(ICNoteEditorViewController *)self textView];
  uint64_t v8 = [v7 textLayoutManager];
  id v9 = ICDynamicCast();

  id v10 = v15;
  if (v15
    || ([v9 highlightPatternRegexFinder],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        id v10 = 0,
        v11))
  {
    id v15 = v10;
    [v9 setHighlightPatternRegexFinder:v10];
    double v12 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
    [v12 setSearchHighlightRegexFinder:v15];

    double v13 = [(ICNoteEditorViewController *)self authorHighlightsUpdater];
    [v13 updateAnimated:0];
LABEL_11:
  }
}

- (ICSelectorDelayer)showOrHideSearchPatternHighlightsDelayer
{
  showOrHideSearchPatternHighlightsDelayer = self->_showOrHideSearchPatternHighlightsDelayer;
  if (!showOrHideSearchPatternHighlightsDelayer)
  {
    id v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_showOrHideSearchPatternHighlightsIfNecessary delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.25];
    uint64_t v5 = self->_showOrHideSearchPatternHighlightsDelayer;
    self->_showOrHideSearchPatternHighlightsDelayer = v4;

    showOrHideSearchPatternHighlightsDelayer = self->_showOrHideSearchPatternHighlightsDelayer;
  }

  return showOrHideSearchPatternHighlightsDelayer;
}

- (void)showInkPickerAndEndEditingIfNecessary
{
  if ([(ICNoteEditorViewController *)self inkPickerState] != 2) {
    [(ICNoteEditorViewController *)self showInkPicker:1 animated:1];
  }
  if ([(ICNoteEditorViewController *)self isEditing]) {
    [(ICNoteEditorViewController *)self setEditing:0];
  }

  [(ICNoteEditorViewController *)self updateInlineDrawingsPaletteVisibility];
}

- (void)updateInlineDrawingsPaletteVisibility
{
  id v3 = [(ICNoteEditorBaseViewController *)self note];
  id v4 = [v3 textStorage];
  NSUInteger v5 = objc_msgSend(v4, "ic_range");
  NSUInteger v7 = v6;

  v13.NSUInteger location = [(ICNoteEditorViewController *)self visibleRange];
  ++v13.length;
  v14.NSUInteger location = v5;
  v14.NSUInteger length = v7;
  NSRange v8 = NSIntersectionRange(v13, v14);
  id v9 = [(ICNoteEditorBaseViewController *)self note];
  id v10 = [v9 textStorage];
  uint64_t v11 = *MEMORY[0x263F814A0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __67__ICNoteEditorViewController_updateInlineDrawingsPaletteVisibility__block_invoke;
  v12[3] = &unk_2640B89D0;
  void v12[4] = self;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v8.location, v8.length, 0, v12);
}

void __67__ICNoteEditorViewController_updateInlineDrawingsPaletteVisibility__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v4 = [*(id *)(a1 + 32) inkPaletteController];
    objc_msgSend(v5, "updatePaletteVisibilityToVisible:", objc_msgSend(v4, "isInkPaletteShowing"));
  }
}

- (id)currentValidToolForNewDrawingOrNote
{
  id v3 = [(ICNoteEditorViewController *)self inkPaletteController];

  if (!v3) {
    goto LABEL_19;
  }
  if ([(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]
    && ICInternalSettingsIsSystemPaperEnabled())
  {
    id v4 = [(ICNoteEditorViewController *)self inkPaletteController];
    uint64_t v5 = [v4 colorCorrectedTool];
LABEL_18:
    id v3 = (void *)v5;

    goto LABEL_19;
  }
  NSUInteger v6 = [(ICNoteEditorViewController *)self inkPaletteController];
  id v3 = [v6 selectedTool];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSUInteger v7 = [(ICNoteEditorViewController *)self inkPaletteController];
    if ([v7 isHandwritingToolSelected])
    {
    }
    else
    {
      NSRange v8 = [(ICNoteEditorViewController *)self inkPaletteController];
      char v9 = [v8 isCanvasGenerationToolSelected];

      if ((v9 & 1) == 0)
      {

LABEL_12:
        id v3 = [(ICNoteEditorViewController *)self lastSavedInkingTool];
        goto LABEL_13;
      }
    }
  }
  if (!v3) {
    goto LABEL_12;
  }
LABEL_13:
  if ([(ICNoteEditorViewController *)self isNewInk:v3]
    && [(ICNoteEditorViewController *)self noteHasAnyPencilKitDrawings])
  {
    id v10 = [(ICNoteEditorViewController *)self inkPaletteController];
    [v10 resetToPencilKitCompatibleInk];

    uint64_t v11 = [(ICNoteEditorViewController *)self inkPaletteController];
    uint64_t v12 = [v11 selectedTool];

    id v3 = (void *)v12;
  }
  if (!v3)
  {
    id v13 = objc_alloc(MEMORY[0x263F14B50]);
    uint64_t v14 = *MEMORY[0x263F14CC0];
    id v4 = [(ICNoteEditorViewController *)self defaultInkColor];
    uint64_t v5 = [v13 initWithInkType:v14 color:v4];
    goto LABEL_18;
  }
LABEL_19:

  return v3;
}

- (PKTool)lastSavedInkingTool
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 dataForKey:@"currentInkData"];

  if (v3)
  {
    id v21 = 0;
    id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v21];
    id v5 = v21;
    if (v4)
    {
      if ([v4 _isHandwritingInk]) {
        id v6 = objc_alloc_init(MEMORY[0x263F14B28]);
      }
      else {
        id v6 = (id)[objc_alloc(MEMORY[0x263F14B50]) _initWithInk:v4];
      }
      id v15 = v6;
    }
    else
    {
      double v16 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ICNoteEditorViewController lastSavedInkingTool]();
      }

      id v15 = 0;
    }
  }
  else
  {
    NSUInteger v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v5 = [v7 dictionaryForKey:@"currentInkTool"];

    NSRange v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v4 = [v8 stringForKey:@"currentInkTool"];

    char v9 = [v5 objectForKeyedSubscript:@"inkType"];
    id v10 = [v5 objectForKeyedSubscript:@"color"];
    uint64_t v11 = [v5 objectForKeyedSubscript:@"width"];
    uint64_t v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      id v13 = objc_msgSend(MEMORY[0x263F825C8], "ic_colorFromString:", v10);
      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x263F14B50]);
        [v12 doubleValue];
        id v15 = (id)objc_msgSend(v14, "initWithInkType:color:width:", v9, v13);
      }
      else
      {
        double v19 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          double v23 = v10;
          _os_log_impl(&dword_20BE60000, v19, OS_LOG_TYPE_DEFAULT, "Could not create ink color from serialized color string: %@", buf, 0xCu);
        }

        id v15 = 0;
      }
    }
    else
    {
      long long v17 = [MEMORY[0x263F14B28] className];
      int v18 = [v4 isEqualToString:v17];

      if (v18) {
        id v15 = objc_alloc_init(MEMORY[0x263F14B28]);
      }
      else {
        id v15 = 0;
      }
    }
  }

  return (PKTool *)v15;
}

- (void)saveToolAsCurrentTool:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = (void *)MEMORY[0x263F08910];
      id v5 = [v3 ink];
      id v9 = 0;
      id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
      NSUInteger v7 = v9;

      if (v6)
      {
        NSRange v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v8 setObject:v6 forKey:@"currentInkData"];
      }
      else
      {
        NSRange v8 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[ICNoteEditorViewController saveToolAsCurrentTool:]();
        }
      }
    }
    else
    {
      NSUInteger v7 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICNoteEditorViewController saveToolAsCurrentTool:]();
      }
    }
  }
}

- (id)defaultInkColor
{
  id v3 = [(ICNoteEditorViewController *)self traitCollection];
  if (objc_msgSend(v3, "ic_isDark"))
  {
    BOOL v4 = [(ICNoteEditorViewController *)self shouldForceLightContent];

    if (!v4)
    {
      id v5 = [MEMORY[0x263F825C8] whiteColor];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v5 = [MEMORY[0x263F825C8] blackColor];
LABEL_6:

  return v5;
}

- (void)createInkPickerControllerIfNecessary
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Hey this should never happen!", v2, v3, v4, v5, v6);
}

- (void)showInkPicker:(id)a3
{
  id v10 = a3;
  if ([(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    [(ICNoteEditorViewController *)self doneEditing:v10];
  }
  else
  {
    uint64_t v4 = [(ICNoteEditorBaseViewController *)self note];

    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x263F5B520] sharedInstance];
      int v6 = [v5 isQuickNoteSessionActive];

      if (v6)
      {
        id v7 = [(ICNoteEditorViewController *)self addQuickNoteWithPencil:1];
      }
      else
      {
        NSRange v8 = [(ICNoteEditorViewController *)self viewControllerManager];
        id v9 = (id)[v8 showNewNoteWithApproach:2 sender:self animated:1];
      }
    }
    [(ICNoteEditorViewController *)self showStyleSelectorPopover:0 animated:1 sender:v10];
    [(ICNoteEditorViewController *)self setInkPickerState:1];
    [(ICNoteEditorViewController *)self showInkPickerAndEndEditingIfNecessary];
    [(ICNoteEditorViewController *)self clearTextViewSelection];
  }
}

- (void)showInkPicker:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
LABEL_4:
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:v4];
    id v7 = [(ICNoteEditorViewController *)self inkPaletteController];
    [v7 showInkPalette:v5 animated:v4];

    return;
  }
  if ([(ICNoteEditorViewController *)self _appearState] == 2)
  {
    [(ICNoteEditorViewController *)self createInkPickerControllerIfNecessary];
    goto LABEL_4;
  }

  [(ICNoteEditorViewController *)self setShowInkPickerAfterViewAppears:1];
}

- (BOOL)toggleInkPickerAnimated:(BOOL)a3
{
  BOOL v4 = [(ICNoteEditorViewController *)self inkPaletteController];
  uint64_t v5 = [v4 isInkPaletteShowing] ^ 1;

  [(ICNoteEditorViewController *)self showInkPicker:v5 animated:1];
  return v5;
}

- (void)hideInkPicker
{
  if ([(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    uint64_t v3 = [(ICNoteEditorViewController *)self inkPaletteController];
    [v3 showInkPalette:0 animated:1];

    [(ICNoteEditorViewController *)self updateInlineDrawingsPaletteVisibility];
  }
}

- (BOOL)shouldEnablePencilGestures
{
  uint64_t v3 = [(ICNoteEditorViewController *)self splitViewController];
  uint64_t v4 = [v3 displayMode];

  if (v4 == 3) {
    return 0;
  }
  int v6 = [(ICNoteEditorViewController *)self textView];
  id v7 = [v6 findInteraction];
  char v8 = [v7 isFindNavigatorVisible];

  return v8 ^ 1;
}

- (void)setupForFingerDrawing
{
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen]
    && ([MEMORY[0x263F82A20] prefersPencilOnlyDrawing] & 1) == 0)
  {
    id v3 = [(ICNoteEditorViewController *)self viewControllerManager];
    [v3 updateForFingerDrawingEnabled:1];
  }
}

- (void)cleanupAfterFingerDrawing
{
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen])
  {
    id v3 = [(ICNoteEditorViewController *)self viewControllerManager];
    [v3 updateForFingerDrawingEnabled:0];
  }
}

- (id)inkPaletteUndoManager:(id)a3
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 undoManager];

  return v4;
}

- (BOOL)isNewInk:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 ink];
    BOOL v5 = [v4 inkFormatVersion] > 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)noteHasAnyPencilKitDrawings
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v2 = [(ICNoteEditorBaseViewController *)self note];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__ICNoteEditorViewController_noteHasAnyPencilKitDrawings__block_invoke;
  v4[3] = &unk_2640B8328;
  v4[4] = &v5;
  [v2 enumerateAttachmentsInOrderUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __57__ICNoteEditorViewController_noteHasAnyPencilKitDrawings__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 isPencilKitDrawing];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)inkPalette:(id)a3 didPickTool:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICNoteEditorViewController *)self isNewInk:v7]
    && [(ICNoteEditorViewController *)self noteHasAnyPencilKitDrawings])
  {
    [(ICNoteEditorViewController *)self upgradePencilKitDrawingsForNewInksPromptingIfNecessary];
  }
  char v8 = [(ICNoteEditorViewController *)self textView];
  [v8 _setTool:v7];

  int v9 = [(ICNoteEditorViewController *)self isEditing];
  if (v9)
  {
    id v10 = [(ICNoteEditorViewController *)self textView];
    uint64_t v11 = [v10 ink];
    int v12 = [v11 _isHandwritingInk] ^ 1;
  }
  else
  {
    int v12 = 0;
  }
  id v13 = [(ICNoteEditorViewController *)self textView];
  id v14 = [v13 ink];
  if ((v9 | [v14 _isHandwritingInk] ^ 1))
  {
    int v15 = 0;
  }
  else
  {
    double v16 = [(ICNoteEditorViewController *)self paletteResponder];
    int v15 = [v16 isFirstResponder] ^ 1;
  }
  if ((v12 | v15) == 1 && [v6 isInkPaletteShowing])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ICNoteEditorViewController_inkPalette_didPickTool___block_invoke;
    block[3] = &unk_2640B8140;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  [(ICNoteEditorViewController *)self saveToolAsCurrentTool:v7];
}

void __53__ICNoteEditorViewController_inkPalette_didPickTool___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) paletteResponder];
  [v1 becomeFirstResponder];
}

- (void)upgradePencilKitDrawingsForNewInksPromptingIfNecessary
{
  id v3 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
  uint64_t v4 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v5 = [(ICNoteEditorBaseViewController *)self note];
  id v6 = [v5 managedObjectContext];
  id v7 = [(ICNoteEditorViewController *)self textView];
  char v8 = [(ICInlineDrawingUpgradeHelper *)v3 initWithNote:v4 managedObjectContext:v6 textView:v7];

  [(ICNoteEditorViewController *)self upgradeAllAttachmentsInNoteWithUpgradeHelper:v8 forSydney:1];
}

- (void)inkPalette:(id)a3 didChangeColor:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 _setSelectedInkColor:v5];
}

- (void)inkPaletteDidToggleRuler:(id)a3 isRulerActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ICNoteEditorViewController *)self textView];
  [v5 setRulerEnabled:v4];
}

- (id)inkPaletteButtonView:(id)a3
{
  id v4 = a3;
  if (![(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper]
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([(ICNoteEditorViewController *)self app_systemPaperInkPaletteButtonView:v4], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)inkPalette:(id)a3 shouldResignFirstResponder:(id)a4
{
  return 1;
}

- (void)inkPalette:(id)a3 willShowAnimated:(BOOL)a4
{
  id v4 = [(ICNoteEditorViewController *)self attributionSidebarController];
  [v4 hideSidebarAnimated:1];
}

- (void)inkPalette:(id)a3 didShowAnimated:(BOOL)a4
{
  [(ICNoteEditorViewController *)self updateBarButtonsAnimated:a4];
  [(ICNoteEditorViewController *)self setupForFingerDrawing];
  [(ICNoteEditorViewController *)self updateInlineDrawingsPaletteVisibility];
  [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
  id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
  [v5 updateHostedNotesAppearance];

  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
  if (objc_opt_respondsToSelector()) {
    [(ICNoteEditorViewController *)self ppt_inkPickerDidShow];
  }
  id v7 = [(ICNoteEditorViewController *)self navigationController];
  id v6 = [v7 toolbar];
  [v6 setAccessibilityElementsHidden:1];
}

- (void)inkPalette:(id)a3 willHideAnimated:(BOOL)a4
{
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = [v5 ink];
  char v7 = [v6 _isHandwritingInk];

  if ((v7 & 1) == 0)
  {
    id v8 = [(ICNoteEditorViewController *)self textView];
    [v8 setShouldAvoidBecomingFirstResponder:1];
  }
}

- (void)inkPalette:(id)a3 didHideAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ICNoteEditorViewController *)self textView];
  char v7 = [v6 ink];
  char v8 = [v7 _isHandwritingInk];

  if ((v8 & 1) == 0)
  {
    int v9 = [(ICNoteEditorViewController *)self textView];
    [v9 setShouldAvoidBecomingFirstResponder:0];
  }
  [(ICNoteEditorViewController *)self updateInlineDrawingsPaletteVisibility];
  [(ICNoteEditorViewController *)self updateBarButtonsAnimated:v4];
  id v10 = [(ICNoteEditorViewController *)self textView];
  [v10 setRulerEnabled:0];

  uint64_t v11 = (void *)MEMORY[0x263F5B340];
  int v12 = [(ICNoteEditorViewController *)self view];
  id v13 = [v12 window];
  id v14 = [v11 sharedToolPickerForWindow:v13];
  [v14 setRulerActive:0];

  [(ICNoteEditorViewController *)self cleanupAfterFingerDrawing];
  [(ICNoteEditorViewController *)self showOrHideSearchPatternHighlightsIfNecessary];
  int v15 = [(ICNoteEditorViewController *)self viewControllerManager];
  [v15 updateHostedNotesAppearance];

  id v17 = [(ICNoteEditorViewController *)self navigationController];
  double v16 = [v17 toolbar];
  [v16 setAccessibilityElementsHidden:0];
}

- (void)inkPaletteDidHideWithDoneButton:(id)a3
{
}

- (int64_t)icasPalettePositionFromPKPalettePosition:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return 0;
  }
  else {
    return qword_20C179610[a3];
  }
}

- (void)inkPalette:(id)a3 didChangePalettePositionStart:(int64_t)a4 end:(int64_t)a5
{
  if (a4 != a5)
  {
    char v8 = [(ICNoteEditorViewController *)self eventReporter];
    int v9 = [(ICNoteEditorBaseViewController *)self note];
    objc_msgSend(v8, "submitPaletteEngagementEventForNote:startPosition:endPosition:", v9, -[ICNoteEditorViewController icasPalettePositionFromPKPalettePosition:](self, "icasPalettePositionFromPKPalettePosition:", a4), -[ICNoteEditorViewController icasPalettePositionFromPKPalettePosition:](self, "icasPalettePositionFromPKPalettePosition:", a5));

    performAfterExistingTransaction();
  }
}

void __75__ICNoteEditorViewController_inkPalette_didChangePalettePositionStart_end___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewControllerManager];
  [v1 updateHostedNotesAppearance];
}

- (UIView)rulerHostingView
{
  rulerHostingView = self->_rulerHostingView;
  if (!rulerHostingView)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIView *)v4 setUserInteractionEnabled:0];
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [(ICNoteEditorViewController *)self view];
    [v5 addSubview:v4];

    id v6 = [(ICNoteEditorViewController *)self view];
    char v7 = (void *)MEMORY[0x263F08938];
    char v8 = [(ICNoteEditorViewController *)self view];
    int v9 = [v7 constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v8 attribute:15 multiplier:1.0 constant:0.0];
    [v6 addConstraint:v9];

    id v10 = [(ICNoteEditorViewController *)self view];
    uint64_t v11 = (void *)MEMORY[0x263F08938];
    int v12 = [(ICNoteEditorViewController *)self view];
    id v13 = [v11 constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v12 attribute:16 multiplier:1.0 constant:-60.0];
    [v10 addConstraint:v13];

    id v14 = [(ICNoteEditorViewController *)self view];
    int v15 = (void *)MEMORY[0x263F08938];
    double v16 = [(ICNoteEditorViewController *)self view];
    id v17 = [v15 constraintWithItem:v4 attribute:1 relatedBy:0 toItem:v16 attribute:1 multiplier:1.0 constant:0.0];
    [v14 addConstraint:v17];

    int v18 = [(ICNoteEditorViewController *)self view];
    double v19 = (void *)MEMORY[0x263F08938];
    long long v20 = [(ICNoteEditorViewController *)self view];
    id v21 = [v19 constraintWithItem:v4 attribute:2 relatedBy:0 toItem:v20 attribute:2 multiplier:1.0 constant:0.0];
    [v18 addConstraint:v21];

    double v22 = self->_rulerHostingView;
    self->_rulerHostingView = v4;

    rulerHostingView = self->_rulerHostingView;
  }

  return rulerHostingView;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v4 = [(ICNoteEditorViewController *)self textView];
  [v4 setEditable:1];
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  char v7 = [(ICNoteEditorViewController *)self textView];
  char v8 = [v7 ink];
  if ([v8 _isHandwritingInk])
  {
    int v9 = [(ICNoteEditorViewController *)self textView];
    if ([v9 canBecomeFirstResponder])
    {
      id v10 = [(ICNoteEditorViewController *)self textView];
      char v11 = objc_msgSend(v10, "pointInside:withEvent:", 0, x, y);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)textViewCanAddStroke:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self view];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];

  if (v6 && [v6 activationState])
  {
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = [(ICNoteEditorBaseViewController *)self note];
  if (v7)
  {
    char v8 = (void *)v7;
    int v9 = [(ICNoteEditorBaseViewController *)self note];
    char v10 = [v9 isEditable];

    if ((v10 & 1) == 0)
    {
      double v16 = [(ICNoteEditorBaseViewController *)self note];
      int v17 = [v16 isDeletedOrInTrash];

      if (v17) {
        [(ICNoteEditorViewController *)self showRecoverNoteAlert];
      }
      goto LABEL_12;
    }
  }
  char v11 = [(ICNoteEditorViewController *)self textView];
  [v11 hitTestPoint];
  int v12 = -[ICNoteEditorViewController inlineDrawingAttachmentForPoint:](self, "inlineDrawingAttachmentForPoint:");

  if (v12
    && ([v12 typeUTI],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:*MEMORY[0x263F5A988]],
        v13,
        v14))
  {
    [(ICNoteEditorViewController *)self showDrawingUpdateAlert];
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 1;
  }

LABEL_13:
  return v15;
}

- (void)setIsDrawingStroke:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isDrawingStroke = a3;
  id v4 = [(ICNoteEditorBaseViewController *)self note];
  [v4 setIsDrawingStroke:v3];
}

- (void)textViewWillBeginStroke:(id)a3 forTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(ICNoteEditorViewController *)self wasEditingBeforeDrawing]
    && ![(ICNoteEditorViewController *)self isInkPickerShowing])
  {
    [(ICNoteEditorViewController *)self showInkPicker:1 animated:1];
  }
  if (![(ICNoteEditorViewController *)self isDrawingStroke])
  {
    char v8 = [(ICNoteEditorBaseViewController *)self note];
    int v9 = [v8 documentMergeController];
    char v10 = [(ICNoteEditorViewController *)self textView];
    [v9 beginBlockingMergeForReason:5 textView:v10];
  }
  [(ICNoteEditorViewController *)self setCurrentStrokeStartTouch:v6];
  [(ICNoteEditorViewController *)self setIsDrawingStroke:1];
  uint64_t v11 = [v6 type];

  [(ICNoteEditorViewController *)self setIsDrawingStrokeWithPencil:v11 == 2];
  [(ICNoteEditorViewController *)self setDidDrawWithPencilWithoutPalette:0];
  [(ICNoteEditorViewController *)self updateUIEnabledStatePencilActive:[(ICNoteEditorViewController *)self isDrawingStrokeWithPencil]];
  [v7 setInputAccessoryView:0];

  [(ICNoteEditorViewController *)self setHasMadeEdits];
}

- (void)updateUIEnabledStatePencilActive:(BOOL)a3
{
  BOOL v4 = !a3;
  id v5 = [(ICNoteEditorViewController *)self navigationController];
  id v6 = [v5 toolbar];
  [v6 setUserInteractionEnabled:v4];

  id v8 = [(ICNoteEditorViewController *)self navigationController];
  id v7 = [v8 navigationBar];
  [v7 setUserInteractionEnabled:v4];
}

- (void)textViewDidEndStroke:(id)a3
{
  [(ICNoteEditorViewController *)self updateUIEnabledStatePencilActive:0];
  if ([(ICNoteEditorViewController *)self isDrawingStroke])
  {
    BOOL v4 = [(ICNoteEditorBaseViewController *)self note];
    id v5 = [v4 documentMergeController];
    id v6 = [(ICNoteEditorViewController *)self textView];
    [v5 endBlockingMergeForReason:5 textView:v6];
  }
  BOOL v7 = [(ICNoteEditorViewController *)self isDrawingStrokeWithPencil];
  [(ICNoteEditorViewController *)self setIsDrawingStroke:0];
  [(ICNoteEditorViewController *)self setIsDrawingStrokeWithPencil:0];
  id v8 = [MEMORY[0x263EFF910] date];
  [(ICNoteEditorViewController *)self setDateOfLastStrokeOrNewDrawing:v8];

  [(ICNoteEditorViewController *)self clearTextViewSelection];
  int v9 = [(ICNoteEditorViewController *)self currentStrokeStartTouch];
  char v10 = [(ICNoteEditorViewController *)self textView];
  [v9 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  -[ICNoteEditorViewController inlineDrawingAttachmentForPoint:](self, "inlineDrawingAttachmentForPoint:", v12, v14);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    BOOL v15 = [v24 identifier];

    if (v15)
    {
      double v16 = [v24 inlineDrawingModel];
      int v17 = [v16 handwritingRecognitionDrawing];
      int v18 = v17;
      if (v17) {
        id v19 = v17;
      }
      else {
        id v19 = (id)[v16 newDrawingFromMergeableData];
      }
      long long v20 = v19;

      if (v7) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = 2;
      }
      double v22 = [(ICNoteEditorViewController *)self eventReporter];
      double v23 = [v24 identifier];
      [v22 pushInlineDrawingDataForDrawing:v20 drawingID:v23 tool:v21];
    }
  }
  [(ICNoteEditorViewController *)self setCurrentStrokeStartTouch:0];
  if (v7)
  {
    if (![(ICNoteEditorViewController *)self isInkPickerShowing]) {
      [(ICNoteEditorViewController *)self setDidDrawWithPencilWithoutPalette:1];
    }
    [(ICNoteEditorViewController *)self updateBarButtonsAnimated:1];
  }
}

- (void)undoablySwitchToPPK:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICNoteEditorViewController *)self textView];
  id v6 = v5;
  if (v3)
  {
    [v5 setPaperEnabled:1];
  }
  else
  {
    [v5 setPaperEnabled:0];

    id v6 = [(ICNoteEditorViewController *)self textView];
    [v6 setStylusDrawingEnabled:1];
  }

  BOOL v7 = [(ICNoteEditorViewController *)self textView];
  [v7 setDrawingDelegate:self];

  id v9 = [(ICNoteEditorViewController *)self undoManager];
  id v8 = [v9 prepareWithInvocationTarget:self];
  [v8 undoablySwitchToPPK:!v3];
}

- (void)textView:(id)a3 upgradeDrawingAtIndex:(unint64_t)a4 itemProviders:(id)a5 insertionLocationInDrawing:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a5;
  if ([MEMORY[0x263F5B468] isEnabled])
  {
    double v11 = [(ICNoteEditorViewController *)self textView];
    double v12 = [v11 textStorage];
    double v13 = [v12 attribute:*MEMORY[0x263F814A0] atIndex:a4 effectiveRange:0];

    objc_opt_class();
    double v14 = ICCheckedDynamicCast();
    BOOL v15 = [v14 attachment];

    if (v15)
    {
      double v16 = [(ICNoteEditorBaseViewController *)self note];
      int v17 = [v16 managedObjectContext];

      if (v17)
      {
        int v18 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
        id v19 = [(ICNoteEditorBaseViewController *)self note];
        long long v20 = [(ICNoteEditorViewController *)self textView];
        os_log_t v21 = [(ICInlineDrawingUpgradeHelper *)v18 initWithNote:v19 managedObjectContext:v17 textView:v20];

        double v22 = [v14 attachment];
        double v23 = -[NSObject upgradeWithAttachment:itemProviders:itemsLocation:](v21, "upgradeWithAttachment:itemProviders:itemsLocation:", v22, v10, x, y);

        if (v23)
        {
          [(ICNoteEditorViewController *)self upgradeAllAttachmentsInNoteWithUpgradeHelper:v21];
        }
        else
        {
          id v24 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            double v25 = [v14 attachment];
            double v26 = [v25 loggingDescription];
            int v27 = 138412290;
            double v28 = v26;
            _os_log_impl(&dword_20BE60000, v24, OS_LOG_TYPE_DEFAULT, "Upgrading drawing failed for: %@", (uint8_t *)&v27, 0xCu);
          }
        }
      }
      else
      {
        os_log_t v21 = os_log_create("com.apple.notes", "SystemPaper");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_20BE60000, v21, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since note didn't have a MOC", (uint8_t *)&v27, 2u);
        }
      }
    }
    else
    {
      int v17 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_20BE60000, v17, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since inline drawing attachment wasn't found", (uint8_t *)&v27, 2u);
      }
    }
  }
  else
  {
    double v13 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_20BE60000, v13, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since Paper isn't enabled", (uint8_t *)&v27, 2u);
    }
  }
}

- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3
{
}

- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3 forSydney:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke;
  aBlock[3] = &unk_2640B82D8;
  aBlock[4] = self;
  id v7 = v6;
  id v36 = v7;
  id v8 = _Block_copy(aBlock);
  BOOL v9 = [(ICNoteEditorBaseViewController *)self isEditingOnSystemPaper];
  id v10 = (id *)MEMORY[0x263F5AEE0];
  if (!v4) {
    id v10 = (id *)MEMORY[0x263F5AED8];
  }
  id v11 = *v10;
  id v12 = (id)*MEMORY[0x263F5AED0];
  double v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v14 = [v13 BOOLForKey:v11];

  BOOL v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v16 = [v15 BOOLForKey:v12];

  if (v9 || (v14 & 1) != 0 || (v16 & 1) != 0)
  {
    dispatch_time_t v29 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_3;
    block[3] = &unk_2640B8B80;
    id v31 = v8;
    dispatch_after(v29, MEMORY[0x263EF83A0], block);
    id v24 = v31;
  }
  else
  {
    int v17 = (void *)MEMORY[0x263F82418];
    int v18 = [MEMORY[0x263F086E0] mainBundle];
    id v19 = [v18 localizedStringForKey:@"Drawings Will Be Updated" value:&stru_26C10E100 table:0];
    [MEMORY[0x263F086E0] mainBundle];
    id v20 = v11;
    v22 = os_log_t v21 = v8;
    double v23 = [v22 localizedStringForKey:@"Drawings will be updated as needed to allow using new drawing features.\n\nOnly devices upgraded to the latest version of iOS, iPadOS, or visionOS will be able to edit updated drawings.", &stru_26C10E100, 0 value table];
    id v24 = [v17 alertControllerWithTitle:v19 message:v23 preferredStyle:1];

    id v8 = v21;
    id v11 = v20;

    double v25 = (void *)MEMORY[0x263F82400];
    double v26 = [MEMORY[0x263F086E0] mainBundle];
    int v27 = [v26 localizedStringForKey:@"OK" value:&stru_26C10E100 table:0];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_2;
    v32[3] = &unk_2640B9700;
    id v34 = v8;
    id v33 = v12;
    double v28 = [v25 actionWithTitle:v27 style:0 handler:v32];
    [v24 addAction:v28];

    [(ICNoteEditorViewController *)self presentViewController:v24 animated:1 completion:0];
  }
}

uint64_t __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveInlineDrawings];
  [*(id *)(a1 + 32) undoablySwitchToPPK:1];
  [*(id *)(a1 + 40) upgradeAllAttachmentsInNote];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 becomeFirstResponder];
}

void __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:*(void *)(a1 + 32)];
}

uint64_t __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)inlineDrawingAttachmentForPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v28 = 0;
  dispatch_time_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__4;
  double v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v22 = 0;
  double v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__4;
  double v26 = __Block_byref_object_dispose__4;
  id v27 = 0;
  id v6 = [(ICNoteEditorViewController *)self textView];
  [v6 textContainerInset];
  double v8 = v7;

  BOOL v9 = [(ICNoteEditorBaseViewController *)self note];
  id v10 = [v9 textStorage];
  NSUInteger v11 = objc_msgSend(v10, "ic_range");
  NSUInteger v13 = v12;

  v35.NSUInteger location = [(ICNoteEditorViewController *)self visibleRange];
  ++v35.length;
  v36.NSUInteger location = v11;
  v36.NSUInteger length = v13;
  NSRange v14 = NSIntersectionRange(v35, v36);
  BOOL v15 = [(ICNoteEditorBaseViewController *)self note];
  char v16 = [v15 textStorage];
  uint64_t v17 = *MEMORY[0x263F814A0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__ICNoteEditorViewController_inlineDrawingAttachmentForPoint___block_invoke;
  v21[3] = &unk_2640B9728;
  v21[4] = self;
  void v21[5] = &v28;
  *(CGFloat *)&v21[7] = x;
  *(double *)&v21[8] = y - v8;
  v21[6] = &v22;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, v14.location, v14.length, 0, v21);

  id v18 = v23[5];
  if (!v18)
  {
    objc_storeStrong(v23 + 5, (id)v29[5]);
    id v18 = v23[5];
  }
  id v19 = v18;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);

  return v19;
}

void __62__ICNoteEditorViewController_inlineDrawingAttachmentForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v10 = [v38 attachment];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    NSUInteger v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    NSRange v14 = [*(id *)(a1 + 32) textView];
    BOOL v15 = v14;
    if (IsTextKit2Enabled)
    {
      objc_msgSend(v14, "ic_rectForRange:", a3, a4);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
    }
    else
    {
      uint64_t v24 = [v14 layoutManager];
      uint64_t v25 = objc_msgSend(v24, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      uint64_t v27 = v26;

      BOOL v15 = [*(id *)(a1 + 32) textView];
      uint64_t v28 = [v15 layoutManager];
      dispatch_time_t v29 = [*(id *)(a1 + 32) textView];
      uint64_t v30 = [v29 textContainer];
      objc_msgSend(v28, "boundingRectForGlyphRange:inTextContainer:", v25, v27, v30);
      CGFloat v17 = v31;
      CGFloat v19 = v32;
      CGFloat v21 = v33;
      CGFloat v23 = v34;
    }
    v40.origin.CGFloat x = v17;
    v40.origin.double y = v19;
    v40.size.CGFloat width = v21;
    v40.size.double height = v23;
    if (CGRectGetMinY(v40) <= *(double *)(a1 + 64))
    {
      v41.origin.CGFloat x = v17;
      v41.origin.double y = v19;
      v41.size.CGFloat width = v21;
      v41.size.double height = v23;
      if (CGRectGetMaxY(v41) >= *(double *)(a1 + 64))
      {
        uint64_t v35 = [v38 attachment];
        uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
        double v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;

        *a5 = 1;
      }
    }
  }
}

- (BOOL)textView:(id)a3 canAddDrawingAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICNoteEditorBaseViewController *)self note];
  if (v7)
  {
    double v8 = (void *)v7;
    id v9 = [(ICNoteEditorBaseViewController *)self note];
    int v10 = [v9 isEditable];

    if (!v10) {
      goto LABEL_4;
    }
  }
  uint64_t v11 = [(ICNoteEditorBaseViewController *)self note];
  NSUInteger v12 = [v11 textStorage];
  NSUInteger v13 = [v12 attribute:*MEMORY[0x263F394D8] atIndex:a4 effectiveRange:0];

  if (v13)
  {
LABEL_4:
    NSRange v14 = [(ICNoteEditorBaseViewController *)self note];
    int v15 = [v14 isDeletedOrInTrash];

    if (v15) {
      [(ICNoteEditorViewController *)self showRecoverNoteAlert];
    }
  }
  else
  {
    uint64_t v18 = [(ICNoteEditorBaseViewController *)self note];
    if (!v18
      || (CGFloat v19 = (void *)v18,
          [(ICNoteEditorBaseViewController *)self note],
          double v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 canAddAttachment],
          v20,
          v19,
          (v21 & 1) != 0))
    {
      BOOL v16 = 1;
      goto LABEL_7;
    }
    [(ICNoteEditorViewController *)self warnUserAttachmentLimitExceeded];
  }
  BOOL v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)textViewCanSelectDrawing:(id)a3
{
  BOOL v4 = [(ICNoteEditorBaseViewController *)self note];
  char v5 = [v4 isEditable];

  if ((v5 & 1) == 0)
  {
    id v6 = [(ICNoteEditorBaseViewController *)self note];
    int v7 = [v6 isDeletedOrInTrash];

    if (v7) {
      [(ICNoteEditorViewController *)self showRecoverNoteAlert];
    }
  }
  return v5;
}

- (void)textView:(id)a3 willAddDrawingAtIndex:(unint64_t)a4
{
  [(ICNoteEditorViewController *)self ensureValidInkForNewDrawingOrNote];
  [(ICNoteEditorViewController *)self addNewNoteIfNeeded];
  char v6 = [MEMORY[0x263F82A20] prefersPencilOnlyDrawing];
  int v7 = [(ICNoteEditorViewController *)self textView];
  double v8 = [v7 textStorage];
  unint64_t v9 = [v8 length];

  if ((v6 & 1) == 0 && a4 + 1 < v9)
  {
    [(ICNoteEditorViewController *)self setInkPickerState:1];
    [(ICNoteEditorViewController *)self showInkPickerAndEndEditingIfNecessary];
  }
  int v10 = [MEMORY[0x263EFF910] date];
  [(ICNoteEditorViewController *)self setDateOfLastStrokeOrNewDrawing:v10];

  [MEMORY[0x263F5B360] updateTouchPredictionPointsFromOverride];
  objc_opt_class();
  id v14 = [(ICNoteEditorViewController *)self textView];
  uint64_t v11 = ICDynamicCast();
  NSUInteger v12 = [v11 textContentStorage];
  NSUInteger v13 = [v12 textStorage];
  [v13 setAlwaysEnumerateTrailingParagraph:1];
}

- (void)textView:(id)a3 didRemoveDrawingAtIndex:(unint64_t)a4
{
  id v5 = [(ICNoteEditorViewController *)self textView];
  [(ICNoteEditorViewController *)self textViewDidChange:v5];
}

- (id)textView:(id)a3 newAttachmentForFileType:(id)a4
{
  id v5 = a4;
  char v6 = [(ICNoteEditorBaseViewController *)self note];
  int v7 = [v6 isEditable];

  if (v7)
  {
    if ([v5 isEqualToString:*MEMORY[0x263F14C60]])
    {
      double v8 = [(ICNoteEditorBaseViewController *)self note];
      unint64_t v9 = [v8 addInlineDrawingAttachmentWithAnalytics:1];
      int v10 = (Class *)0x263F5B368;
LABEL_6:

      BOOL v16 = (void *)[objc_alloc(*v10) initWithAttachment:v9];
      goto LABEL_8;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F14C68]])
    {
      uint64_t v11 = [(ICNoteEditorBaseViewController *)self note];
      NSUInteger v12 = [v11 account];
      [v12 ensureCriticalPaperDirectoriesExist];

      NSUInteger v13 = [(ICNoteEditorBaseViewController *)self note];
      id v14 = [MEMORY[0x263F08C38] UUID];
      int v15 = [v14 UUIDString];
      unint64_t v9 = [v13 addSystemPaperAttachmentWithIdentifier:v15];

      double v8 = [v9 managedObjectContext];
      objc_msgSend(v8, "ic_save");
      int v10 = (Class *)0x263F5B468;
      goto LABEL_6;
    }
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (void)showHandwritingDebug:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICNoteEditorViewController *)self handwritingDebugPresenter];

  if (!v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    int v7 = (void *)[objc_alloc(MEMORY[0x263F5B320]) initWithPresentingViewController:self presentationStyle:v6 delegate:self];
    [(ICNoteEditorViewController *)self setHandwritingDebugPresenter:v7];
  }
  double v8 = [(ICNoteEditorViewController *)self handwritingDebugPresenter];
  id v9 = v8;
  if (v3)
  {
    [v8 show];
  }
  else
  {
    [v8 hide];

    [(ICNoteEditorViewController *)self setHandwritingDebugPresenter:0];
  }
}

- (id)radarTitleForHandwritingDebug
{
  id v2 = NSString;
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  BOOL v4 = [v3 title];
  id v5 = [v2 localizedStringWithFormat:@"Handwriting recognition: %@", v4];

  return v5;
}

- (id)drawingsForHandwritingDebug
{
  id v2 = [(ICNoteEditorBaseViewController *)self note];
  BOOL v3 = [v2 allDrawings];

  return v3;
}

- (void)handwritingDebugShouldClose
{
}

- (void)performAddCollaboratorsActivity:(id)a3
{
}

- (id)titleForAddCollaboratorsActivity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  NSUInteger v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__ICNoteEditorViewController_titleForAddCollaboratorsActivity___block_invoke;
  v10[3] = &unk_2640B92A8;
  v10[4] = self;
  v10[5] = &v11;
  [v6 performBlockAndWait:v10];

  if (*((unsigned char *)v12 + 24))
  {
    int v7 = [MEMORY[0x263F086E0] mainBundle];
    double v8 = [v7 localizedStringForKey:@"View Participants" value:&stru_26C10E100 table:0];
  }
  else
  {
    double v8 = @"person.crop.circle.badge.plus";
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __63__ICNoteEditorViewController_titleForAddCollaboratorsActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) note];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isSharedViaICloud];
}

- (id)systemImageNameForAddCollaboratorsActivity:(id)a3
{
  BOOL v3 = [(ICNoteEditorBaseViewController *)self note];
  int v4 = [v3 isSharedViaICloud];

  if (v4) {
    return @"person.crop.circle.badge.checkmark";
  }
  else {
    return @"person.crop.circle.badge.plus";
  }
}

- (void)createImage:(id)a3
{
  v47[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!ICInternalSettingsShouldShowImageGenerationUI()) {
    goto LABEL_27;
  }
  BOOL v5 = [(ICNoteEditorViewController *)self canPerformCreateImageWithSelection];
  objc_opt_class();
  uint64_t v6 = ICDynamicCast();
  int v7 = [v6 attachment];

  double v8 = [(ICNoteEditorViewController *)self textView];
  id v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v5;
  }
  if (!v10)
  {
    CGFloat v23 = [v8 singleSelectedAttachment];
    int v7 = [v23 attachment];
    goto LABEL_13;
  }
  uint64_t v11 = [v8 TTTextStorage];
  unint64_t v12 = [v11 length];

  if (v12 <= 0x18)
  {
    uint64_t v13 = [(ICNoteEditorViewController *)self textView];
    char v14 = [v13 TTTextStorage];
    id v9 = objc_msgSend(v14, "ic_stringByTrimmingLeadingTrailingWhitespace");

    if (![v9 length])
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_opt_class();
    uint64_t v15 = *MEMORY[0x263F814A0];
    BOOL v16 = objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], objc_msgSend(v9, "length") - 1, 0);
    CGFloat v17 = ICDynamicCast();
    CGFloat v23 = [v17 fileType];

    if ([MEMORY[0x263F5AB78] typeUTIIsSystemPaper:v23])
    {
      uint64_t v18 = objc_msgSend(v9, "attributedSubstringFromRange:", 0, objc_msgSend(v9, "length") - 1);
      uint64_t v19 = objc_msgSend(v18, "ic_stringByTrimmingLeadingTrailingWhitespace");

      id v9 = (void *)v19;
    }
    if ([v9 length] == 1)
    {
      objc_opt_class();
      double v20 = [v9 attribute:v15 atIndex:0 effectiveRange:0];
      char v21 = ICDynamicCast();
      uint64_t v22 = [v21 attachment];

      int v7 = (void *)v22;
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  if ([v7 attachmentType] == 3)
  {
    char v24 = [v7 isPasswordProtected];
    uint64_t v25 = [v7 media];
    uint64_t v26 = v25;
    if (v24)
    {
      CFDataRef v27 = [v25 data];
      CGImageSourceRef v28 = CGImageSourceCreateWithData(v27, 0);
    }
    else
    {
      CFDataRef v27 = [v25 mediaURL];
      CGImageSourceRef v28 = CGImageSourceCreateWithURL(v27, 0);
    }
    double v39 = v28;

    if (v39)
    {
      uint64_t v40 = *MEMORY[0x263F0F5B8];
      v46[0] = *MEMORY[0x263F0F638];
      v46[1] = v40;
      v47[0] = &unk_26C139060;
      v47[1] = MEMORY[0x263EFFA88];
      v46[2] = *MEMORY[0x263F0F5A8];
      v47[2] = MEMORY[0x263EFFA88];
      CFDictionaryRef v41 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v39, 0, v41);
      if (ThumbnailAtIndex)
      {
        double v43 = ThumbnailAtIndex;
        double v44 = [(ICNoteEditorViewController *)self paperTextAttachmentManager];
        [v44 insertMagicGenerativePlaygroundWithImage:v43];

        CGImageRelease(v43);
      }
      CFRelease(v39);
    }
  }
  else if (v5)
  {
    dispatch_time_t v29 = [(ICNoteEditorViewController *)self textView];
    uint64_t v30 = [v29 selectedRange];
    uint64_t v32 = v31;

    double v33 = [(ICNoteEditorViewController *)self textView];
    double v34 = [v33 TTTextStorage];
    uint64_t v35 = [(id)*MEMORY[0x263F1DC20] identifier];
    uint64_t v36 = objc_msgSend(v34, "filteredAttributedStringForUTI:range:", v35, v30, v32);
    double v37 = [v36 string];

    id v38 = [(ICNoteEditorViewController *)self paperTextAttachmentManager];
    [v38 insertMagicGenerativePlaygroundWithText:v37];
  }
  else
  {
    double v45 = [(ICNoteEditorViewController *)self paperTextAttachmentManager];
    [v45 insertMagicGenerativePlaygroundWithAutomaticContent];
  }
LABEL_27:
}

- (BOOL)canPerformCreateImageWithSelection
{
  BOOL v3 = [(ICNoteEditorViewController *)self textView];
  uint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  int v7 = [(ICNoteEditorViewController *)self textView];
  double v8 = objc_msgSend(v7, "textAttachmentsInRange:", v4, v6);

  if ((unint64_t)[v8 count] <= 1)
  {
    BOOL v10 = [v8 firstObject];
    uint64_t v11 = [v10 attachment];

    BOOL v12 = v6 == 1 && [v11 attachmentType] == 3;
    if (!v11) {
      BOOL v12 = 1;
    }
    if (v6) {
      BOOL v9 = v12;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)paperTextAttachmentManager:(id)a3 beginTrackingUndoManager:(id)a4
{
}

- (void)paperTextAttachmentManager:(id)a3 endTrackingUndoManager:(id)a4
{
}

- (void)setMagicGenerativePlaygroundUndoManager:(id)a3
{
  uint64_t v5 = (NSUndoManager *)a3;
  p_magicGenerativePlaygroundUndoManager = &self->_magicGenerativePlaygroundUndoManager;
  magicGenerativePlaygroundUndoManager = self->_magicGenerativePlaygroundUndoManager;
  if (magicGenerativePlaygroundUndoManager != v5)
  {
    CGFloat v17 = v5;
    double v8 = (void *)MEMORY[0x263F08620];
    BOOL v9 = (void *)MEMORY[0x263F08638];
    BOOL v10 = (void *)MEMORY[0x263F08630];
    if (magicGenerativePlaygroundUndoManager)
    {
      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 removeObserver:self name:*v8 object:*p_magicGenerativePlaygroundUndoManager];

      BOOL v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 removeObserver:self name:*v9 object:*p_magicGenerativePlaygroundUndoManager];

      uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 removeObserver:self name:*v10 object:*p_magicGenerativePlaygroundUndoManager];
    }
    objc_storeStrong((id *)&self->_magicGenerativePlaygroundUndoManager, a3);
    if (v17)
    {
      char v14 = [MEMORY[0x263F08A00] defaultCenter];
      [v14 addObserver:self selector:sel_updateBarButtons name:*v8 object:v17];

      uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 addObserver:self selector:sel_updateBarButtons name:*v9 object:v17];

      BOOL v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 addObserver:self selector:sel_updateBarButtons name:*v10 object:v17];
    }
    [(ICNoteEditorViewController *)self updateBarButtons];
    uint64_t v5 = v17;
  }
}

- (void)mentionInsertedInNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ICNoteEditorViewController *)self eventReporter];
  [v13 submitMentionAddEventForNote:v12 mentionID:v11 participantID:v10 viaAutoComplete:v6];
}

- (void)inlineAttachmentDeleted:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 userInfo];

  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5A9F8]];
  ICDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if ([v9 isMentionAttachment])
  {
    int v7 = [(ICNoteEditorViewController *)self eventReporter];
    double v8 = [(ICNoteEditorBaseViewController *)self note];
    [v7 submitMentionDeleteEvent:v8];
  }
  else
  {
    if (![v9 isHashtagAttachment]) {
      goto LABEL_6;
    }
    int v7 = [(ICNoteEditorViewController *)self eventReporter];
    double v8 = [(ICNoteEditorBaseViewController *)self note];
    [v7 submitHashtagDeleteEvent:v8 approachEnum:4];
  }

LABEL_6:
  [v9 accessibilityAnnounceDeletionWithVoiceOver];
}

- (void)hashtagInsertedInNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ICNoteEditorViewController *)self eventReporter];
  [v10 submitHashtagAddEventForNote:v9 tokenContentIdentifier:v8 viaAutoComplete:v5];
}

- (id)noteEditorNavigationItemConfigurationTableAttachmentViewController:(id)a3
{
  objc_opt_class();
  id v4 = [(ICNoteEditorViewController *)self auxiliaryResponder];
  BOOL v5 = ICDynamicCast();

  BOOL v6 = [(ICNoteEditorViewController *)self getTableControllerFor:v5];

  return v6;
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addNoteFromBarButtonItem:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ICNoteEditorBaseViewController *)self note];
  if (!v11) {
    goto LABEL_3;
  }
  id v12 = (void *)v11;
  id v13 = [(ICNoteEditorBaseViewController *)self note];
  char v14 = [MEMORY[0x263F5ABB8] currentAttachment];
  uint64_t v15 = [v14 note];

  if (v13 == v15)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    BOOL v16 = (void *)MEMORY[0x263F82418];
    CGFloat v17 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"Stop Recording?" value:&stru_26C10E100 table:0];
    uint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
    double v20 = [v19 localizedStringForKey:@"Are you sure you want to create a new note? It will stop audio recording." value:&stru_26C10E100 table:0];
    char v21 = [v16 alertControllerWithTitle:v18 message:v20 preferredStyle:1];

    uint64_t v22 = (void *)MEMORY[0x263F82400];
    CGFloat v23 = [MEMORY[0x263F086E0] mainBundle];
    char v24 = [v23 localizedStringForKey:@"OK" value:&stru_26C10E100 table:0];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    void v30[2] = __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke;
    v30[3] = &unk_2640B9778;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    id v31 = v10;
    uint64_t v25 = [v22 actionWithTitle:v24 style:0 handler:v30];
    [v21 addAction:v25];

    uint64_t v26 = (void *)MEMORY[0x263F82400];
    CFDataRef v27 = [MEMORY[0x263F086E0] mainBundle];
    CGImageSourceRef v28 = [v27 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
    dispatch_time_t v29 = [v26 actionWithTitle:v28 style:1 handler:&__block_literal_global_1270];
    [v21 addAction:v29];

    [(ICNoteEditorViewController *)self presentViewController:v21 animated:1 completion:0];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_3:
    [(ICNoteEditorViewController *)self addNote:v9 event:v10 shouldInstrumentAsNewNoteAffordanceUsage:1];
  }
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F5ABB8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2;
  v5[3] = &unk_2640B9750;
  objc_copyWeak(&v7, a1 + 5);
  objc_copyWeak(&v8, a1 + 6);
  id v6 = a1[4];
  [v4 cancelCurrentAudioRecordingSessionWithCompletionHandler:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "AudioTranscription");
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained addNote:v7 event:*(void *)(a1 + 32) shouldInstrumentAsNewNoteAffordanceUsage:1];
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 showWritingToolsFromBarButtonItem:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __102__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_showWritingToolsFromBarButtonItem___block_invoke;
  v7[3] = &unk_2640B82D8;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __102__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_showWritingToolsFromBarButtonItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textView];
  [v2 showWritingTools:*(void *)(a1 + 40)];
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addChecklistFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addTableFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 changeStyleFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 closeAuxiliaryWindowFromBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNoteEditorBaseViewController *)self note];
  if (!v8) {
    goto LABEL_3;
  }
  id v9 = (void *)v8;
  id v10 = [(ICNoteEditorBaseViewController *)self note];
  uint64_t v11 = [MEMORY[0x263F5ABB8] currentAttachment];
  id v12 = [v11 note];

  if (v10 == v12)
  {
    objc_initWeak(&location, self);
    char v14 = (void *)MEMORY[0x263F82418];
    uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v16 = [v15 localizedStringForKey:@"Stop Recording?" value:&stru_26C10E100 table:0];
    CGFloat v17 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"Are you sure you want to leave this note? It will stop audio recording." value:&stru_26C10E100 table:0];
    uint64_t v19 = [v14 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

    double v20 = (void *)MEMORY[0x263F82400];
    char v21 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v22 = [v21 localizedStringForKey:@"OK" value:&stru_26C10E100 table:0];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __106__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_closeAuxiliaryWindowFromBarButtonItem___block_invoke;
    id v31 = &unk_2640B97A0;
    objc_copyWeak(&v32, &location);
    CGFloat v23 = [v20 actionWithTitle:v22 style:0 handler:&v28];
    objc_msgSend(v19, "addAction:", v23, v28, v29, v30, v31);

    char v24 = (void *)MEMORY[0x263F82400];
    uint64_t v25 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v26 = [v25 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
    CFDataRef v27 = [v24 actionWithTitle:v26 style:1 handler:&__block_literal_global_1275];
    [v19 addAction:v27];

    [(ICNoteEditorViewController *)self presentViewController:v19 animated:1 completion:0];
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
  else
  {
LABEL_3:
    id v13 = [(ICNoteEditorViewController *)self viewControllerManager];
    [v13 closeAuxiliaryWindow];
  }
}

void __106__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_closeAuxiliaryWindowFromBarButtonItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained viewControllerManager];
  [v1 closeAuxiliaryWindow];
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 deleteFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 doneEditingFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 inlineSketchFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 moveFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteShowAllNotesFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidCancelFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidSaveFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 shareFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleLockFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleSidebarFromBarButtonItem:(id)a4
{
  id v4 = [(ICNoteEditorViewController *)self viewControllerManager];
  [v4 toggleSidebar];
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 redoFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 undoFromBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 insertMediaWithSourceType:(unint64_t)a4 mediaBarButtonItem:(id)a5
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 didCompleteAnimationFromInlineSketchBarButtonItem:(id)a4
{
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 insertSidecarItemWithMenuItems:(id)a4 service:(int64_t)a5 mediaBarButtonItem:(id)a6
{
}

- (void)acceleratorOriginNeedsUpdate
{
  id v3 = [(ICNoteEditorViewController *)self textView];
  id v15 = [v3 selectedTextRange];

  id v4 = [(ICNoteEditorViewController *)self textView];
  id v5 = [v15 end];
  [v4 caretRectForPosition:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  char v14 = [(ICNoteEditorViewController *)self linkAcceleratorController];
  objc_msgSend(v14, "updateAcceleratorOriginWith:", v7, v9, v11, v13);
}

- (BOOL)languageHasSpaces
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  char v3 = [v2 languageHasSpaces];

  return v3;
}

- (int64_t)writingDirection
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  int64_t v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  id v2 = [(ICNoteEditorViewController *)self textView];
  uint64_t v3 = [v2 selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.id location = v6;
  return result;
}

- (void)splitViewModeChangeDidEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  NSUInteger v5 = [v4 object];

  ICDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if ([v7 displayMode] != 3 && objc_msgSend(v7, "displayMode") != 5)
  {
    NSUInteger v6 = [(ICNoteEditorViewController *)self linkAcceleratorController];
    [v6 presentLinkAcceleratorIfNecessaryWithCompletionHandler:&__block_literal_global_1278];
  }
}

- (id)contextMenuInteraction:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [MEMORY[0x263EFF980] array];
  NSUInteger v6 = (void *)MEMORY[0x263F823D0];
  id v7 = [MEMORY[0x263F086E0] mainBundle];
  double v8 = [v7 localizedStringForKey:@"Open Note" value:&stru_26C10E100 table:0];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke;
  v52[3] = &unk_2640B9618;
  id v9 = v4;
  id v53 = v9;
  CGFloat v54 = self;
  double v10 = objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, @"note.text", v52);

  [v5 addObject:v10];
  if (objc_opt_respondsToSelector())
  {
    double v11 = (void *)MEMORY[0x263F823D0];
    double v12 = [MEMORY[0x263F086E0] mainBundle];
    double v13 = [v12 localizedStringForKey:@"Copy Link" value:&stru_26C10E100 table:0];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_2;
    v50[3] = &unk_2640B9618;
    void v50[4] = self;
    id v51 = v9;
    char v14 = objc_msgSend(v11, "ic_actionWithTitle:imageName:handler:", v13, @"doc.on.doc", v50);

    [v5 addObject:v14];
  }
  if (objc_opt_respondsToSelector())
  {
    id v15 = [(ICNoteEditorBaseViewController *)self note];
    if ([v15 isSharedReadOnly])
    {
    }
    else
    {
      BOOL v16 = [(ICNoteEditorBaseViewController *)self isEditingOnSecureScreen];

      if (!v16)
      {
        CGFloat v17 = (void *)MEMORY[0x263F823D0];
        uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v19 = [v18 localizedStringForKey:@"Edit Link" value:&stru_26C10E100 table:0];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_3;
        v48[3] = &unk_2640B9618;
        void v48[4] = self;
        id v49 = v9;
        double v20 = objc_msgSend(v17, "ic_actionWithTitle:imageName:handler:", v19, @"pencil", v48);

        [v5 addObject:v20];
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    char v21 = [(ICNoteEditorBaseViewController *)self note];
    char v22 = [v21 isSharedReadOnly];

    if ((v22 & 1) == 0)
    {
      CGFloat v23 = (void *)MEMORY[0x263F823D0];
      char v24 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v25 = [v24 localizedStringForKey:@"Remove Link" value:&stru_26C10E100 table:0];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_4;
      void v46[3] = &unk_2640B9618;
      v46[4] = self;
      id v47 = v9;
      uint64_t v26 = objc_msgSend(v23, "ic_actionWithTitle:imageName:attributes:handler:", v25, @"trash", 2, v46);

      [v5 addObject:v26];
    }
  }
  CFDataRef v27 = [v9 tokenContentIdentifier];
  uint64_t v28 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier();

  uint64_t v29 = [MEMORY[0x263F5AB68] predicateForNotesMentionedInURL:v28];
  uint64_t v30 = [MEMORY[0x263F5ACA0] sharedContext];
  id v31 = v30;
  id v32 = 0;
  if (v29 && v30)
  {
    id v33 = (void *)MEMORY[0x263F5AC98];
    double v34 = [v30 managedObjectContext];
    uint64_t v35 = [v33 notesMatchingPredicate:v29 context:v34];

    uint64_t v36 = [v35 firstObject];
    if (v36)
    {
      double v37 = (void *)v36;
      id v38 = [(ICNoteEditorViewController *)self notePreviewView:v36];
      double v39 = (void *)MEMORY[0x263F82610];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_5;
      v44[3] = &unk_2640B97C8;
      id v45 = v38;
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_6;
      v42[3] = &unk_2640B97F0;
      id v43 = v5;
      id v40 = v38;
      id v32 = [v39 configurationWithIdentifier:0 previewProvider:v44 actionProvider:v42];
    }
    else
    {
      id v32 = 0;
    }
  }

  return v32;
}

void __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tokenContentIdentifier];
  NotesAppURLForTokenContentIdentifier();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [*(id *)(a1 + 40) view];
  +[ICExtensionSafeAPIShims openURL:v4 originatingView:v3 completionHandler:0];
}

void __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [v2 rangeForAttachment:*(void *)(a1 + 40)];
  uint64_t v5 = v4;

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v6 = [*(id *)(a1 + 32) textView];
    objc_msgSend(v6, "setSelectedRange:", v3, v5);

    id v7 = [*(id *)(a1 + 32) textView];
    [v7 copy:*(void *)(a1 + 32)];
  }
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) openLinkEditorForLink:*(void *)(a1 + 40)];
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [v2 rangeForAttachment:*(void *)(a1 + 40)];
  uint64_t v5 = v4;

  NSUInteger v6 = *(void **)(a1 + 32);

  return objc_msgSend(v6, "removeLinksFromRange:", v3, v5);
}

id __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_6(uint64_t a1)
{
  return [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:0 children:*(void *)(a1 + 32)];
}

- (id)notePreviewView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(ICNoteEditorViewController *)self notePreview:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)uniqueCollapsibleSectionAffordanceExposures
{
  return -1;
}

- (int64_t)uniqueCollapsibleSectionAffordanceUsages
{
  return -1;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (ICNAEventReporter)audioEventReporter
{
  if (!self->_audioEventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5];
    audioEventReporter = self->_audioEventReporter;
    self->_audioEventReporter = v6;

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_audioEventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_audioEventReporter];
  }
  id v9 = self->_audioEventReporter;

  return v9;
}

- (void)audioEventReporterLostSession:(id)a3
{
  audioEventReporter = self->_audioEventReporter;
  self->_audioEventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (ICNAFindResultExposureReporter)findResultReporter
{
  findResultReporter = self->_findResultReporter;
  if (!findResultReporter)
  {
    id v4 = objc_alloc(MEMORY[0x263F5A770]);
    id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
    uint64_t v6 = [v5 window];
    id v7 = (ICNAFindResultExposureReporter *)[v4 initWithWindow:v6];
    id v8 = self->_findResultReporter;
    self->_findResultReporter = v7;

    findResultReporter = self->_findResultReporter;
  }

  return findResultReporter;
}

- (void)setAuxiliaryResponder:(id)a3
{
}

- (NSUndoManager)magicGenerativePlaygroundUndoManager
{
  return self->_magicGenerativePlaygroundUndoManager;
}

- (void)setTextViewController:(id)a3
{
}

- (ICNoteEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (ICVisualAssetImportController)visualAssetImportController
{
  return self->_visualAssetImportController;
}

- (void)setStartEditingAfterViewAppears:(BOOL)a3
{
  self->_startEditingAfterViewAppears = a3;
}

- (void)setStyleSelectorInputViewPresenting:(BOOL)a3
{
  self->_styleSelectorInputViewPresenting = a3;
}

- (ICNoteEditorTextFindingController)textFindingController
{
  return self->_textFindingController;
}

- (ICAttributionSidebarController)attributionSidebarController
{
  return self->_attributionSidebarController;
}

- (void)setActivityStreamToolbar:(id)a3
{
}

- (void)setDoNotAdvanceInsertionPointAfterInsertingAttachment:(BOOL)a3
{
  self->_doNotAdvanceInsertionPointAfterInsertingAttachment = a3;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (void)setHostBundleIdentifier:(id)a3
{
}

- (NSManagedObjectID)noteViewEventSourceObjectID
{
  return self->_noteViewEventSourceObjectID;
}

- (void)setNoteViewEventSourceObjectID:(id)a3
{
}

- (BOOL)canShowLinkBar
{
  return self->_canShowLinkBar;
}

- (BOOL)isPaperLinkBarShowing
{
  return self->_paperLinkBarShowing;
}

- (BOOL)needsToPerformInitialPaperAnimations
{
  return self->_needsToPerformInitialPaperAnimations;
}

- (void)setNeedsToPerformInitialPaperAnimations:(BOOL)a3
{
  self->_needsToPerformInitialPaperAnimations = a3;
}

- (ICPaperTextAttachmentManager)paperTextAttachmentManager
{
  return self->_paperTextAttachmentManager;
}

- (void)setBluetoothKeyboardHintViewController:(id)a3
{
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  return self->_collaborationBarButtonItem;
}

- (BOOL)quickNoteiPhoneDidSaveOrCancel
{
  return self->_quickNoteiPhoneDidSaveOrCancel;
}

- (void)setQuickNoteiPhoneDidSaveOrCancel:(BOOL)a3
{
  self->_quickNoteiPhoneDidSaveOrCancel = a3;
}

- (ICAttachmentPresenter)quickNoteiPhoneAttachmentPresenter
{
  return self->_quickNoteiPhoneAttachmentPresenter;
}

- (void)setQuickNoteiPhoneAttachmentPresenter:(id)a3
{
}

- (ICNoteFormattingViewController)noteFormattingController
{
  return self->_noteFormattingController;
}

- (void)setNoteFormattingController:(id)a3
{
}

- (void)setStyleSelectorDummyInputView:(id)a3
{
}

- (BOOL)suspendSelectedRangeUpdates
{
  return self->_suspendSelectedRangeUpdates;
}

- (void)setSuspendSelectedRangeUpdates:(BOOL)a3
{
  self->_suspendSelectedRangeUpdates = a3;
}

- (BOOL)suspendTapGestureRecognizer
{
  return self->_suspendTapGestureRecognizer;
}

- (void)setSuspendTapGestureRecognizer:(BOOL)a3
{
  self->_suspendTapGestureRecognizer = a3;
}

- (void)setAudioBarViewController:(id)a3
{
}

- (ICNoteUserActivityState)noteUserActivityState
{
  return (ICNoteUserActivityState *)objc_getProperty(self, a2, 1320, 1);
}

- (NSArray)keyboardButtonItems
{
  return self->_keyboardButtonItems;
}

- (void)setKeyboardButtonItems:(id)a3
{
}

- (BOOL)isEditingNewNote
{
  return self->_isEditingNewNote;
}

- (BOOL)isSettingEditing
{
  return self->_isSettingEditing;
}

- (void)setIsSettingEditing:(BOOL)a3
{
  self->_isSettingEditing = a3;
}

- (BOOL)isTogglingLock
{
  return self->_togglingLock;
}

- (void)setTogglingLock:(BOOL)a3
{
  self->_togglingLocuint64_t k = a3;
}

- (ICTTMergeableStringSelection)originalEndOfNote
{
  return self->_originalEndOfNote;
}

- (BOOL)isAddingImageAttachment
{
  return self->_isAddingImageAttachment;
}

- (void)setIsAddingImageAttachment:(BOOL)a3
{
  self->_isAddingImageAttachment = a3;
}

- (void)setDidEndEditingForAddingImageAttachment:(BOOL)a3
{
  self->_didEndEditingForAddingImageAttachment = a3;
}

- (BOOL)isConvertToTag
{
  return self->_isConvertToTag;
}

- (void)setIsConvertToTag:(BOOL)a3
{
  self->_isConvertToTag = a3;
}

- (NSDate)keyboardAnimateInFinishTime
{
  return self->_keyboardAnimateInFinishTime;
}

- (void)setKeyboardAnimateInFinishTime:(id)a3
{
}

- (void)setInputAccessoryViewHeight:(double)a3
{
  self->_inputAccessoryViewdouble Height = a3;
}

- (LinkEditorViewController)linkEditorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkEditorViewController);

  return (LinkEditorViewController *)WeakRetained;
}

- (void)setLinkEditorViewController:(id)a3
{
}

- (void)setPasswordEntryViewController:(id)a3
{
}

- (void)setLockIconCoverViewController:(id)a3
{
}

- (void)setInvitationViewController:(id)a3
{
}

- (double)textViewMinimumBottomInset
{
  return self->_textViewMinimumBottomInset;
}

- (void)setTextViewMinimumBottomInset:(double)a3
{
  self->_textViewMinimumBottomInset = a3;
}

- (void)setTextViewScrollIndicatorBottomInsetOverride:(double)a3
{
  self->_textViewScrollIndicatorBottomInsetOverride = a3;
}

- (double)textViewScrollIndicatorBottomInsetOverrideToRestore
{
  return self->_textViewScrollIndicatorBottomInsetOverrideToRestore;
}

- (void)setTextViewScrollIndicatorBottomInsetOverrideToRestore:(double)a3
{
  self->_textViewScrollIndicatorBottomInsetOverrideToRestore = a3;
}

- (UIAlertController)limitExceededAlertController
{
  return self->_limitExceededAlertController;
}

- (void)setLimitExceededAlertController:(id)a3
{
}

- (_NSRange)lastSelectedRange
{
  p_lastSelectedRange = &self->_lastSelectedRange;
  NSUInteger location = self->_lastSelectedRange.location;
  NSUInteger length = p_lastSelectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSavedScrollStates:(id)a3
{
}

- (BOOL)shouldOverscrollScrollState
{
  return self->_shouldOverscrollScrollState;
}

- (void)setCurrentWritingDirection:(int64_t)a3
{
  self->_currentWritingDirection = a3;
}

- (ICSearchResultRegexMatchFinder)searchRegexFinder
{
  return self->_searchRegexFinder;
}

- (UITextRange)selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation
{
  return self->_selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation;
}

- (void)setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:(id)a3
{
}

- (void)setUpdateNoteUserActivityStateDelayer:(id)a3
{
}

- (void)setUserActivityUpdateQueue:(id)a3
{
}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (void)setIsSelecting:(BOOL)a3
{
  self->_isSelecting = a3;
}

- (NSDate)keyboardDidShowAnimationDate
{
  return self->_keyboardDidShowAnimationDate;
}

- (void)setKeyboardDidShowAnimationDate:(id)a3
{
}

- (BOOL)shouldBeginEditingAfterNoteUnlock
{
  return self->_shouldBeginEditingAfterNoteUnlock;
}

- (void)setShouldBeginEditingAfterNoteUnlock:(BOOL)a3
{
  self->_shouldBeginEditingAfterNoteUnlocuint64_t k = a3;
}

- (CGPoint)changePasswordContentOffset
{
  double x = self->_changePasswordContentOffset.x;
  double y = self->_changePasswordContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setChangePasswordContentOffset:(CGPoint)a3
{
  self->_changePasswordContentOffset = a3;
}

- (BOOL)isPerformingDeleteAnimation
{
  return self->_isPerformingDeleteAnimation;
}

- (void)setIsPerformingDeleteAnimation:(BOOL)a3
{
  self->_isPerformingDeleteAnimation = a3;
}

- (BOOL)isSettingSelection
{
  return self->_isSettingSelection;
}

- (void)setIsSettingSelection:(BOOL)a3
{
  self->_isSettingSelection = a3;
}

- (ICInlineCanvasTextAttachment)selectedCanvasAttachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedCanvasAttachment);

  return (ICInlineCanvasTextAttachment *)WeakRetained;
}

- (void)setSelectedCanvasAttachment:(id)a3
{
}

- (BOOL)isShowingIndentationItems
{
  return self->_showingIndentationItems;
}

- (void)setShowingIndentationItems:(BOOL)a3
{
  self->_showingIndentationItems = a3;
}

- (BOOL)isShowingChecklistItems
{
  return self->_showingChecklistItems;
}

- (void)setShowingChecklistItems:(BOOL)a3
{
  self->_showingChecklistItems = a3;
}

- (NSArray)extraItemsBeforeCustomCalloutOptions
{
  return self->_extraItemsBeforeCustomCalloutOptions;
}

- (void)setExtraItemsBeforeCustomCalloutOptions:(id)a3
{
}

- (NSArray)swipeGestureRecognizers
{
  return self->_swipeGestureRecognizers;
}

- (NSLayoutConstraint)activityStreamToolbarBottomConstraint
{
  return self->_activityStreamToolbarBottomConstraint;
}

- (void)setActivityStreamToolbarBottomConstraint:(id)a3
{
}

- (BOOL)isPreviewingAttachmentFromNote
{
  return self->_isPreviewingAttachmentFromNote;
}

- (void)setIsPreviewingAttachmentFromNote:(BOOL)a3
{
  self->_isPreviewingAttachmentFromNote = a3;
}

- (BOOL)shouldClearBackgroundColorAfterPreview
{
  return self->_shouldClearBackgroundColorAfterPreview;
}

- (void)setShouldClearBackgroundColorAfterPreview:(BOOL)a3
{
  self->_shouldClearBackgroundColorAfterPreview = a3;
}

- (BOOL)shouldClearCornerRadiusAfterPreview
{
  return self->_shouldClearCornerRadiusAfterPreview;
}

- (void)setShouldClearCornerRadiusAfterPreview:(BOOL)a3
{
  self->_shouldClearCornerRadiusAfterPreview = a3;
}

- (BOOL)hasKeyboardBeenVisibleBefore
{
  return self->_hasKeyboardBeenVisibleBefore;
}

- (void)setHasKeyboardBeenVisibleBefore:(BOOL)a3
{
  self->_hasKeyboardBeenVisibleBefore = a3;
}

- (BOOL)shouldInputAccessoryViewButtonsBeVisible
{
  return self->_shouldInputAccessoryViewButtonsBeVisible;
}

- (void)setShouldInputAccessoryViewButtonsBeVisible:(BOOL)a3
{
  self->_shouldInputAccessoryViewButtonsBeVisible = a3;
}

- (void)setApplyAccessibilityInfoDelayer:(id)a3
{
}

- (BOOL)previouslyHadMarkedText
{
  return self->_previouslyHadMarkedText;
}

- (void)setPreviouslyHadMarkedText:(BOOL)a3
{
  self->_previouslyHadMarkedText = a3;
}

- (BOOL)wasWindowlessDuringTransitionToSize
{
  return self->_wasWindowlessDuringTransitionToSize;
}

- (void)setWasWindowlessDuringTransitionToSize:(BOOL)a3
{
  self->_wasWindowlessDuringTransitionToSize = a3;
}

- (void)setRulerHostingView:(id)a3
{
}

- (void)setInkPaletteController:(id)a3
{
}

- (unint64_t)inkPickerState
{
  return self->_inkPickerState;
}

- (void)setInkPickerState:(unint64_t)a3
{
  self->_inkPickerState = a3;
}

- (void)setHandwritingDebugPresenter:(id)a3
{
}

- (void)setDateOfLastStrokeOrNewDrawing:(id)a3
{
}

- (void)setIsDrawingStrokeWithPencil:(BOOL)a3
{
  self->_isDrawingStrokeWithPencil = a3;
}

- (UITouch)currentStrokeStartTouch
{
  return self->_currentStrokeStartTouch;
}

- (void)setCurrentStrokeStartTouch:(id)a3
{
}

- (ICInkToolPickerResponder)paletteResponder
{
  return self->_paletteResponder;
}

- (void)setPaletteResponder:(id)a3
{
}

- (BOOL)wasEditingBeforeDrawing
{
  return self->_wasEditingBeforeDrawing;
}

- (void)setWasEditingBeforeDrawing:(BOOL)a3
{
  self->_wasEditingBeforeDrawing = a3;
}

- (BOOL)tableButtonsShowMore
{
  return self->_tableButtonsShowMore;
}

- (void)setTableButtonsShowMore:(BOOL)a3
{
  self->_tableButtonsShowMore = a3;
}

- (ICSelectorDelayer)noteOrFolderChangedCallbackSelectorDelayer
{
  return self->_noteOrFolderChangedCallbackSelectorDelayer;
}

- (void)setNoteOrFolderChangedCallbackSelectorDelayer:(id)a3
{
}

- (NSUUID)createdGalleryAttachmentUUID
{
  return self->_createdGalleryAttachmentUUID;
}

- (void)setCreatedGalleryAttachmentUUID:(id)a3
{
}

- (NSArray)indentKeyCommands
{
  return self->_indentKeyCommands;
}

- (void)setIndentKeyCommands:(id)a3
{
}

- (NSArray)indentRTLKeyCommands
{
  return self->_indentRTLKeyCommands;
}

- (void)setIndentRTLKeyCommands:(id)a3
{
}

- (BOOL)isLoadingStyleSelectorInputView
{
  return self->_isLoadingStyleSelectorInputView;
}

- (BOOL)shouldRemoveEmptyNoteWhenViewDisappeared
{
  return self->_shouldRemoveEmptyNoteWhenViewDisappeared;
}

- (void)setShouldRemoveEmptyNoteWhenViewDisappeared:(BOOL)a3
{
  self->_shouldRemoveEmptyNoteWhenViewDisappeared = a3;
}

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
}

- (void)setUpdateContentSizeCategoryWhenVisible:(BOOL)a3
{
  self->_updateContentSizeCategoryWhenVisible = a3;
}

- (BOOL)inStartEditingForWritingTools
{
  return self->_inStartEditingForWritingTools;
}

- (void)setInStartEditingForWritingTools:(BOOL)a3
{
  self->_inStartEditingForWritingTools = a3;
}

- (void)setShowOrHideSearchPatternHighlightsDelayer:(id)a3
{
}

- (BOOL)shouldFireNoteViewEventOnViewDisappear
{
  return self->_shouldFireNoteViewEventOnViewDisappear;
}

- (void)setShouldFireNoteViewEventOnViewDisappear:(BOOL)a3
{
  self->_shouldFireNoteViewEventOnViewDisappear = a3;
}

- (NSDate)noteLastModificationDate
{
  return self->_noteLastModificationDate;
}

- (void)setShowInsertUIAfterViewAppears:(BOOL)a3
{
  self->_showInsertUIAfterViewAppears = a3;
}

- (void)setAddToDoListAfterViewAppears:(BOOL)a3
{
  self->_addToDoListAfterViewAppears = a3;
}

- (void)setAddDocumentScanAfterViewAppears:(BOOL)a3
{
  self->_addDocumentScanAfterViewAppears = a3;
}

- (void)setShouldAllowAttributionSidebar:(BOOL)a3
{
  self->_shouldAllowAttributionSidebar = a3;
}

- (NSMutableSet)enabledSubviews
{
  return self->_enabledSubviews;
}

- (void)setEnabledSubviews:(id)a3
{
}

- (ICSystemPaperLinkBarViewController)paperLinkBarViewController
{
  return self->_paperLinkBarViewController;
}

- (void)setPaperLinkBarViewController:(id)a3
{
}

- (NSLayoutConstraint)paperLinkBarTopConstraint
{
  return self->_paperLinkBarTopConstraint;
}

- (void)setPaperLinkBarTopConstraint:(id)a3
{
}

- (BOOL)linksBarNeedsAnimationWhileEditorIsVisible
{
  return self->_linksBarNeedsAnimationWhileEditorIsVisible;
}

- (void)setLinksBarNeedsAnimationWhileEditorIsVisible:(BOOL)a3
{
  self->_linksBarNeedsAnimationWhileEditorIsVisible = a3;
}

- (void)setUnsupportedNoteTapGestureRecognizer:(id)a3
{
}

- (BOOL)preventSnappingToLastPaperDocument
{
  return self->_preventSnappingToLastPaperDocument;
}

- (void)setPreventSnappingToLastPaperDocument:(BOOL)a3
{
  self->_preventSnappingToLastPaperDocument = a3;
}

- (void)setAudioEventReporter:(id)a3
{
}

- (void)setFindResultReporter:(id)a3
{
}

- (UIBarButtonItem)icaxToggleTodoBarItem
{
  return self->_icaxToggleTodoBarItem;
}

- (UIBarButtonItem)icaxSelectStyleBarItem
{
  return self->_icaxSelectStyleBarItem;
}

- (UIBarButtonItem)icaxAddAttachmentBarItem
{
  return self->_icaxAddAttachmentBarItem;
}

- (UIBarButtonItem)icaxDrawBarButton
{
  return self->_icaxDrawBarButton;
}

- (UIBarButtonItem)icaxDrawBarButtonCompact
{
  return self->_icaxDrawBarButtonCompact;
}

- (UIBarButtonItem)icaxCameraBarButton
{
  return self->_icaxCameraBarButton;
}

- (UIBarButtonItem)icaxCameraBarButtonCompact
{
  return self->_icaxCameraBarButtonCompact;
}

- (UIBarButtonItem)icaxRecordAudioBarButton
{
  return self->_icaxRecordAudioBarButton;
}

- (UIBarButtonItem)icaxRecordAudioBarButtonCompact
{
  return self->_icaxRecordAudioBarButtonCompact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemConfiguration, 0);
  objc_storeStrong((id *)&self->_icaxRecordAudioBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxRecordAudioBarButton, 0);
  objc_storeStrong((id *)&self->_icaxCameraBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxCameraBarButton, 0);
  objc_storeStrong((id *)&self->_icaxDrawBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxDrawBarButton, 0);
  objc_storeStrong((id *)&self->_icaxAddAttachmentBarItem, 0);
  objc_storeStrong((id *)&self->_icaxSelectStyleBarItem, 0);
  objc_storeStrong((id *)&self->_icaxToggleTodoBarItem, 0);
  objc_storeStrong((id *)&self->_findResultReporter, 0);
  objc_storeStrong((id *)&self->_audioEventReporter, 0);
  objc_storeStrong((id *)&self->_activityItemsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_unsupportedNoteTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_unsupportedNoteView, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentChangeController, 0);
  objc_storeStrong((id *)&self->_noteAndFolderChangeController, 0);
  objc_storeStrong((id *)&self->_paperLinkBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_paperLinkBarViewController, 0);
  objc_storeStrong((id *)&self->_enabledSubviews, 0);
  objc_destroyWeak((id *)&self->_previousNote);
  objc_storeStrong((id *)&self->_noteLastModificationDate, 0);
  objc_storeStrong((id *)&self->_showOrHideSearchPatternHighlightsDelayer, 0);
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_indentRTLKeyCommands, 0);
  objc_storeStrong((id *)&self->_indentKeyCommands, 0);
  objc_storeStrong((id *)&self->_createdGalleryAttachmentUUID, 0);
  objc_storeStrong((id *)&self->_noteOrFolderChangedCallbackSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_paletteResponder, 0);
  objc_storeStrong((id *)&self->_currentStrokeStartTouch, 0);
  objc_storeStrong((id *)&self->_dateOfLastStrokeOrNewDrawing, 0);
  objc_storeStrong((id *)&self->_handwritingDebugPresenter, 0);
  objc_storeStrong((id *)&self->_inkPaletteController, 0);
  objc_storeStrong((id *)&self->_rulerHostingView, 0);
  objc_storeStrong((id *)&self->_applyAccessibilityInfoDelayer, 0);
  objc_storeStrong((id *)&self->_activityStreamToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_extraItemsBeforeCustomCalloutOptions, 0);
  objc_destroyWeak((id *)&self->_selectedCanvasAttachment);
  objc_storeStrong((id *)&self->_keyboardDidShowAnimationDate, 0);
  objc_storeStrong((id *)&self->_userActivityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_updateNoteUserActivityStateDelayer, 0);
  objc_storeStrong((id *)&self->_selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation, 0);
  objc_storeStrong((id *)&self->_searchRegexFinder, 0);
  objc_storeStrong((id *)&self->_archivedScrollStateToApply, 0);
  objc_storeStrong((id *)&self->_savedScrollStates, 0);
  objc_storeStrong((id *)&self->_limitExceededAlertController, 0);
  objc_storeStrong((id *)&self->_invitationViewController, 0);
  objc_storeStrong((id *)&self->_lockIconCoverViewController, 0);
  objc_storeStrong((id *)&self->_passwordEntryViewController, 0);
  objc_destroyWeak((id *)&self->_linkEditorViewController);
  objc_storeStrong((id *)&self->_calculateGraphingController, 0);
  objc_storeStrong((id *)&self->_calculateScrubberController, 0);
  objc_storeStrong((id *)&self->_calculateRecognitionController, 0);
  objc_storeStrong((id *)&self->_linkAcceleratorController, 0);
  objc_storeStrong((id *)&self->_keyboardAnimateInFinishTime, 0);
  objc_storeStrong((id *)&self->_originalEndOfNote, 0);
  objc_storeStrong((id *)&self->_keyboardButtonItems, 0);
  objc_storeStrong((id *)&self->_noteUserActivityState, 0);
  objc_storeStrong((id *)&self->_noteUserActivity, 0);
  objc_storeStrong((id *)&self->_audioBarViewController, 0);
  objc_storeStrong((id *)&self->_styleSelectorDummyInputView, 0);
  objc_storeStrong((id *)&self->_noteFormattingController, 0);
  objc_storeStrong((id *)&self->_styleSelectorController, 0);
  objc_storeStrong((id *)&self->_quickNoteiPhoneAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_collaborationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_bluetoothKeyboardHintViewController, 0);
  objc_storeStrong((id *)&self->_paperTextAttachmentManager, 0);
  objc_storeStrong((id *)&self->_noteViewEventSourceObjectID, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityStreamToolbar, 0);
  objc_storeStrong((id *)&self->_attributionSidebarController, 0);
  objc_storeStrong((id *)&self->_textFindingController, 0);
  objc_storeStrong((id *)&self->_textViewInputAccessoryView, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_collaborationButtonsController, 0);
  objc_storeStrong((id *)&self->_audioAttachmentEditorCoordinator, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_hashtagController, 0);
  objc_storeStrong((id *)&self->_visualAssetImportController, 0);
  objc_storeStrong((id *)&self->_attachmentInsertionController, 0);
  objc_storeStrong((id *)&self->_authorHighlightsUpdater, 0);
  objc_storeStrong((id *)&self->_authorHighlightsController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewController, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_magicGenerativePlaygroundUndoManager, 0);
  objc_destroyWeak((id *)&self->_auxiliaryStylingController);

  objc_destroyWeak((id *)&self->_auxiliaryResponder);
}

- (void)updateSelectionOnUndo:(id)a3
{
  uint64_t v4 = [a3 rangeValue];

  -[ICNoteEditorViewController setSelectedRange:](self, "setSelectedRange:", v4, 0);
}

- (void)viewDidAppear:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Could not create ink picker when view appeared", v2, v3, v4, v5, v6);
}

- (void)viewDidDisappear:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v5, v6, "Setting note editor note to nil in %@ %@", v7, v8, v9, v10, v11);
}

- (void)observeDrawingConverted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "could not find final attachment %@", v2, v3, v4, v5, v6);
}

- (void)managedObjectContextChangeController:performUpdatesForManagedObjectIDs:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Refreshing text styling because the user's hashtag library changed", v2, v3, v4, v5, v6);
}

- (void)attachmentInsertionController:didAddAttachment:atRange:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "ICNoteEditorController attempted to handle adding an attachment at an NSNotFound location.", v2, v3, v4, v5, v6);
}

- (void)attachmentInsertionController:didAddAttachment:atRange:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "ICNoteEditorController attempted to handle adding an attachment at an invalid range.", v2, v3, v4, v5, v6);
}

- (void)documentCameraPresentingViewController:(NSObject *)a3 didFinishWithInfoCollection:imageCache:warnUser:closeViewController:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint8_t v6 = [a1 note];
  uint64_t v7 = [a1 note];
  uint64_t v8 = [v7 identifier];
  int v9 = 134218498;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  double v12 = v8;
  __int16 v13 = 2048;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_20BE60000, a3, OS_LOG_TYPE_DEBUG, "Document camera attachment too big %p %@ %lu", (uint8_t *)&v9, 0x20u);
}

- (void)documentCameraPresentingViewController:(void *)a1 didFinishWithInfoCollection:imageCache:warnUser:closeViewController:.cold.2(void *a1)
{
  uint64_t v2 = [a1 note];
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v5, v6, "Can't add document camera attachment %p %@", v7, v8, v9, v10, v11);
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(*(id *)(a2 + 40), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Failed to create paper document from ICDocCamDocumentInfoCollection with error: %@ -- deleting attachment %@", v5, 0x16u);
}

- (void)setPaperLinkBarShowing:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Tried to set isVisible to YES when the link bar is disabled. Refusing to do so.", v2, v3, v4, v5, v6);
}

- (void)setPaperLinkBarShowing:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Preventing attempt to show link bar because canShowLinkBar is NO", v2, v3, v4, v5, v6);
}

- (void)setPaperLinkBarShowing:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Tried to call -setPaperLinkBarShowing: when the editor view controller wasn't editing in a system paper PIP context.", v2, v3, v4, v5, v6);
}

- (void)setPaperLinkBarShowing:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Not toggling visiblity for link bar since the device doesn't support system paper.", v2, v3, v4, v5, v6);
}

- (void)setPaperLinkBarShowing:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Not toggling visiblity for system paper link bar since SystemPaper isn't enabled.", v2, v3, v4, v5, v6);
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Cancelled current audio recording session after switching notes", v2, v3, v4, v5, v6);
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Error cancelling current audio recording session after switching notes {error: %@}", v2, v3, v4, v5, v6);
}

uint64_t __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[ICNoteEditorViewController insertSidecarItems:service:](v0);
}

- (void)insertSidecarItems:service:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Inserting photos from Sidecar…", v2, v3, v4, v5, v6);
}

- (void)insertSidecarItems:service:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Inserting scanned document from Sidecar…", v2, v3, v4, v5, v6);
}

- (void)insertSidecarItems:service:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Cannot insert sketch from Sidecar because the maximum number of attachments has been reached", v2, v3, v4, v5, v6);
}

- (void)insertSidecarItems:(os_log_t)log service:.cold.4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Cannot insert sketch from Sidecar because UTI is not supported", buf, 2u);
}

- (void)insertSidecarItems:service:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Inserting sketch from Sidecar…", v2, v3, v4, v5, v6);
}

void __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Cannot insert scanned document from Sidecar", v2, v3, v4, v5, v6);
}

- (void)addToTags:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 textView];
  v8.NSUInteger location = [v3 selectedRange];
  uint64_t v4 = NSStringFromRange(v8);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_20BE60000, a2, v5, "Adopting tag for inline attachment at %@", v6);
}

- (void)shouldStartEditingForTapGesture:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_7(&dword_20BE60000, a1, a4, "Blocked start editing with time interval: %g", (uint8_t *)&v4);
}

- (void)shouldStartEditingForTapGesture:(uint64_t)a3 .cold.2(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_7(&dword_20BE60000, a1, a4, "Blocked start editing with longer time interval: %g", (uint8_t *)&v4);
}

- (void)lastSavedInkingTool
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Could not decode ink, error: %@", v2, v3, v4, v5, v6);
}

- (void)saveToolAsCurrentTool:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Could not encode ink, error: %@", v2, v3, v4, v5, v6);
}

- (void)saveToolAsCurrentTool:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_20BE60000, v0, v1, "Could not save non-backed ink tool.", v2, v3, v4, v5, v6);
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20BE60000, v0, v1, "Cancelled current audio recording session after closing single-note window", v2, v3, v4, v5, v6);
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Error cancelling current audio recording session after closing single-note window {error: %@}", v2, v3, v4, v5, v6);
}

@end
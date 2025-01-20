@interface NotesDisplayController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (void)initialize;
- (BOOL)acceptNewSize:(unint64_t)a3;
- (BOOL)allowContextProvider:(id)a3;
- (BOOL)allowsAttachments;
- (BOOL)canInsertImagesInNoteContentLayer:(id)a3;
- (BOOL)canProvideNote;
- (BOOL)contentHasUnsavedChanges;
- (BOOL)delayingSetContent;
- (BOOL)didSetContentFromNote;
- (BOOL)isAppearing;
- (BOOL)isChangingTraitCollection;
- (BOOL)isEditingNewNote;
- (BOOL)isEndingNoteDisplay;
- (BOOL)isNoteManagedForNoteContentLayer:(id)a3;
- (BOOL)isPerformingDeleteAnimation;
- (BOOL)isPickingAttachment;
- (BOOL)isRespondingToEndEditing;
- (BOOL)isRespondingToStartEditing;
- (BOOL)isSplitViewExpandingOrCollapsing;
- (BOOL)isUpdatingNoteContent;
- (BOOL)isVisible;
- (BOOL)noteContainsValuableContent;
- (BOOL)noteContentLayer:(id)a3 acceptContentsFromItemProviders:(id)a4;
- (BOOL)noteContentLayer:(id)a3 acceptContentsFromPasteboard:(id)a4;
- (BOOL)noteContentLayer:(id)a3 acceptStringIncreasingContentLength:(id)a4;
- (BOOL)noteContentLayerShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)noteHasSizeLimit;
- (BOOL)noteIsManaged;
- (BOOL)noteMatchesDisplayedContent:(id)a3;
- (BOOL)noteShouldBeDiscarded;
- (BOOL)pendingArchivedEditingState;
- (BOOL)startEditingAfterViewAppears;
- (BOOL)transitioningToSize;
- (BOOL)wantsButtonsInToolbar;
- (BOOL)wantsToRemainFirstResponder;
- (CGPoint)contentLayerPointFromPoint:(CGPoint)a3 relativeToRect:(CGRect)a4;
- (CGPoint)inOccurenceActivityOrigin;
- (CGPoint)pendingArchivedContentOffset;
- (CGPoint)pointRelativeToRect:(CGRect)a3 fromContentLayerPoint:(CGPoint)a4;
- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6;
- (CGRect)rectForAttachmentPresentationOccurence:(id)a3 inView:(id *)a4;
- (ICViewControllerManager)viewControllerManager;
- (NSArray)actionButtonItemsForNavBar;
- (NSArray)actionButtonItemsForToolbar;
- (NSArray)allAttachmentPresentationOccurences;
- (NSArray)attachmentPresentations;
- (NSDate)displayedNoteVersionTimestamp;
- (NSManagedObjectID)displayedNoteVersionObjectID;
- (NSNumber)pendingArchivedNoteID;
- (NSString)originalPlainTextNoteContent;
- (NSTimer)autosaveTimer;
- (NSUserActivity)noteUserActivity;
- (NoteAttachmentPresentationOccurence)occurenceShowingActivity;
- (NoteContentLayer)contentLayer;
- (NoteObject)note;
- (NoteUserActivityState)noteUserActivityState;
- (NotesBackgroundView)backgroundView;
- (NotesDisplayController)initWithArchivedConfiguration:(id)a3;
- (NotesDisplayControllerDelegate)delegate;
- (UIBarButtonItem)closeAuxiliaryWindowButton;
- (UIBarButtonItem)createBarButtonItem;
- (UIBarButtonItem)createNavBarButtonItem;
- (UIBarButtonItem)deleteBarButtonItem;
- (UIBarButtonItem)deleteNavBarButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)shareBarButtonItem;
- (UIBarButtonItem)shareNavBarButtonItem;
- (UIImagePickerController)pickerController;
- (UIPresentationController)activityPresentationController;
- (UIPresentationController)deletePresentationController;
- (UIPrintFormatter)printFormatter;
- (UIScrollView)scrollView;
- (_NSRange)selectedRangeBeforeTextFinding;
- (id)addButtonItem;
- (id)archivedConfiguration;
- (id)attachmentContentIDs;
- (id)attachmentPresentationOccurencesForPreviewingWithManagedInterface:(BOOL)a3;
- (id)contextManager;
- (id)deleteButtonItem;
- (id)displayedActionButtonItemsWithTag:(int64_t)a3;
- (id)getCurrentContext;
- (id)newlyCreatedAttachmentPresentationWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5;
- (id)noteActivityItemsForSharing;
- (id)noteAttachmentObjectWithContentID:(id)a3;
- (id)noteAttachmentPresentationForContentID:(id)a3;
- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4;
- (id)noteContentLayer:(id)a3 createAttachmentPresentationWithData:(id)a4 mimeType:(id)a5 filename:(id)a6;
- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4;
- (id)noteContentLayer:(id)a3 updateAttachments:(id)a4;
- (id)noteHTMLEditorView;
- (id)noteIdentifierForNoteContentLayer:(id)a3;
- (id)notesQuickLookActivityItem:(id)a3 transitionImageForPreviewItem:(id)a4 previewController:(id)a5;
- (id)occurenceForPreviewItem:(id)a3 hintIndex:(int64_t)a4;
- (id)shareButtonItem;
- (id)textFindingActivity;
- (id)webView;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)estimatedSizeOfDisplayedContent;
- (void)_userFontSizeUpdated:(id)a3;
- (void)accessibilityLargeTextDidChange;
- (void)addButtonClicked:(id)a3;
- (void)animateDeleteTransitionWithCompletion:(id)a3;
- (void)applyAccessibilityInfo;
- (void)captureDisplayedNoteVersion;
- (void)cleanupAfterBarSourcedPopoverPresentation;
- (void)copyNoteHTMLToPasteboard;
- (void)dealloc;
- (void)deleteButtonClicked:(id)a3;
- (void)didChangeNoteProviderStatus;
- (void)didDismissActivityController;
- (void)didDismissDeleteAlertController;
- (void)didDismissPickerController;
- (void)didReceiveMemoryWarning;
- (void)dismissPickerControllerWithCompletionHandler:(id)a3;
- (void)displayNote:(id)a3;
- (void)donateEditingIntentIfNecessary;
- (void)doneButtonClicked:(id)a3;
- (void)getPickerPopoverSourceRectWithCompletion:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)insertAttachmentWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5;
- (void)insertImageInNoteContentLayer:(id)a3;
- (void)invalidateAutosaveTimer;
- (void)invalidateNoteUserActivity;
- (void)loadView;
- (void)noteContentLayer:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6;
- (void)noteContentLayer:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4;
- (void)noteContentLayer:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4;
- (void)noteContentLayer:(id)a3 openURL:(id)a4;
- (void)noteContentLayer:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5;
- (void)noteContentLayer:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5;
- (void)noteContentLayer:(id)a3 willHitTestWithEvent:(id)a4;
- (void)noteContentLayerContentDidChange:(id)a3 updatedTitle:(BOOL)a4 fromDrop:(BOOL)a5;
- (void)noteContentLayerContentWillChange:(id)a3;
- (void)performFindInNote:(id)a3;
- (void)performFindInNoteUIActivity:(id)a3;
- (void)performReplaceInNote:(id)a3;
- (void)prepareForBarSourcedPopoverPresentation;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)prepareForPresentation;
- (void)prepareForReuse;
- (void)prepareForSerializationWithLeftoverPresentations:(id *)a3 createdAttachments:(id *)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)refreshAttachmentPresentations;
- (void)registerTraitChanges;
- (void)reloadContentLayer;
- (void)rememberNoteContentForEditingIntent;
- (void)resetAutosaveTimer;
- (void)resetFontOnResume;
- (void)restoreState;
- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4;
- (void)saveNote;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)setActionButtonItemsForNavBar:(id)a3;
- (void)setActionButtonItemsForToolbar:(id)a3;
- (void)setActivityPresentationController:(id)a3;
- (void)setAllAttachmentPresentationOccurences:(id)a3;
- (void)setAttachmentPresentations:(id)a3;
- (void)setAutosaveTimer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCanProvideNote:(BOOL)a3;
- (void)setChangingTraitCollection:(BOOL)a3;
- (void)setCloseAuxiliaryWindowButton:(id)a3;
- (void)setContentFromNote;
- (void)setContentHasUnsavedChanges:(BOOL)a3;
- (void)setContentLayer:(id)a3;
- (void)setCreateBarButtonItem:(id)a3;
- (void)setCreateNavBarButtonItem:(id)a3;
- (void)setDelayingSetContent:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteBarButtonItem:(id)a3;
- (void)setDeleteNavBarButtonItem:(id)a3;
- (void)setDeletePresentationController:(id)a3;
- (void)setDidSetContentFromNote:(BOOL)a3;
- (void)setDisplayedNoteVersionObjectID:(id)a3;
- (void)setDisplayedNoteVersionTimestamp:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInOccurenceActivityOrigin:(CGPoint)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setIsEditingNewNote:(BOOL)a3;
- (void)setIsRespondingToEndEditing:(BOOL)a3;
- (void)setIsRespondingToStartEditing:(BOOL)a3;
- (void)setIsUpdatingNoteContent:(BOOL)a3;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setNote:(id)a3;
- (void)setNoteIsManaged:(BOOL)a3;
- (void)setNoteUserActivity:(id)a3;
- (void)setNoteUserActivityState:(id)a3;
- (void)setOccurenceShowingActivity:(id)a3;
- (void)setOriginalPlainTextNoteContent:(id)a3;
- (void)setPendingArchivedContentOffset:(CGPoint)a3;
- (void)setPendingArchivedEditingState:(BOOL)a3;
- (void)setPendingArchivedNoteID:(id)a3;
- (void)setPerformingDeleteAnimation:(BOOL)a3;
- (void)setPickerController:(id)a3;
- (void)setPickingAttachment:(BOOL)a3;
- (void)setSelectedRangeBeforeTextFinding:(_NSRange)a3;
- (void)setShareBarButtonItem:(id)a3;
- (void)setShareNavBarButtonItem:(id)a3;
- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3;
- (void)setStartEditingAfterViewAppears:(BOOL)a3;
- (void)setTransitioningToSize:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewControllerManager:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)shareButtonClicked:(id)a3;
- (void)showActionsForAttachmentPresentation:(id)a3 atPoint:(CGPoint)a4;
- (void)showAttachmentsUnsupportedAlertForNoteContentLayer:(id)a3;
- (void)significantTimeChange;
- (void)stopTextFinding;
- (void)turnOnContentLengthTrackingIfNeeded;
- (void)updateBarButtonItemsAnimated:(BOOL)a3;
- (void)updateBarsVisibilityAnimated:(BOOL)a3;
- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5;
- (void)updateContextProviderStatus;
- (void)updateDate;
- (void)updateForceLightContentIfNecessary;
- (void)updateNavigationBarLeftButtonItemsAnimated:(BOOL)a3;
- (void)updateNavigationBarRightButtonItemsAnimated:(BOOL)a3;
- (void)updateNote:(id)a3;
- (void)updateNoteFromInterface;
- (void)updateNoteProviderStatus;
- (void)updateNoteTitle;
- (void)updateNoteUserActivityState;
- (void)updateToolbarButtonItemsAnimated:(BOOL)a3;
- (void)updateUserActivityStatus;
- (void)updateViewAnnotation;
- (void)userActivityWasContinued:(id)a3;
- (void)userActivityWillSave:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)warnUserAboutNoteSizeLimitExceeded;
- (void)willMoveToParentViewController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NotesDisplayController

+ (void)initialize
{
  v8[0] = &off_10064B300;
  v8[1] = &off_10064B318;
  v9[0] = &off_10064B318;
  v9[1] = &off_10064B330;
  v8[2] = &off_10064B330;
  v8[3] = &off_10064B348;
  v9[2] = &off_10064B348;
  v9[3] = &off_10064B360;
  v8[4] = &off_10064B378;
  v8[5] = &off_10064B360;
  v9[4] = &off_10064B390;
  v9[5] = &off_10064B3A8;
  v8[6] = &off_10064B390;
  v8[7] = &off_10064B3A8;
  v9[6] = &off_10064B3C0;
  v9[7] = &off_10064B3D8;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:8];
  v3 = (void *)qword_1006AA300;
  qword_1006AA300 = v2;

  v6[0] = &off_10064B378;
  v6[1] = &off_10064B360;
  v7[0] = &off_10064B3D8;
  v7[1] = &off_10064B3F0;
  v6[2] = &off_10064B390;
  v6[3] = &off_10064B3A8;
  v7[2] = &off_10064B408;
  v7[3] = &off_10064B420;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)qword_1006AA308;
  qword_1006AA308 = v4;
}

- (void)registerTraitChanges
{
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v8 count:2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010EA44;
  v5[3] = &unk_100625EB8;
  objc_copyWeak(&v6, &location);
  id v4 = [(NotesDisplayController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NotesDisplayController)initWithArchivedConfiguration:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  v5 = [(NotesDisplayController *)&v12 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"IsEditing"];
    v5->_pendingArchivedEditingState = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"ContentOffset"];
    CGPoint v8 = CGPointFromString(v7);

    v5->_pendingArchivedContentOffset = v8;
    uint64_t v9 = [v4 objectForKeyedSubscript:@"NoteRecordId"];
    pendingArchivedNoteID = v5->_pendingArchivedNoteID;
    v5->_pendingArchivedNoteID = (NSNumber *)v9;

    [(NotesDisplayController *)v5 registerTraitChanges];
  }

  return v5;
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  self->_splitViewExpandingOrCollapsing = a3;
}

- (void)setViewControllerManager:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if ([(NotesDisplayController *)self canProvideNote])
  {
    id v4 = [(NotesDisplayController *)self contextManager];
    [v4 removeContextProvider:self];

    [(NotesDisplayController *)self invalidateNoteUserActivity];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(NotesDisplayController *)self attachmentPresentations];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) contentIDURL];
        +[NotesCIDURLProtocol unregisterDataProviderForCIDURL:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NoteContentLayer *)self->_contentLayer setDelegate:0];
  [(NoteContentLayer *)self->_contentLayer setAttachmentPresentationDelegate:0];
  [(UIPresentationController *)self->_activityPresentationController setDelegate:0];
  v11 = [(UIImagePickerController *)self->_pickerController popoverPresentationController];
  [v11 setDelegate:0];

  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v12 dealloc];
}

- (void)invalidateAutosaveTimer
{
  v3 = [(NotesDisplayController *)self autosaveTimer];
  [v3 invalidate];

  [(NotesDisplayController *)self setAutosaveTimer:0];
}

- (void)resetAutosaveTimer
{
  v3 = [(NotesDisplayController *)self autosaveTimer];
  unsigned __int8 v4 = [v3 isValid];

  if (v4)
  {
    id v6 = [(NotesDisplayController *)self autosaveTimer];
    v5 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
    [v6 setFireDate:v5];
  }
  else
  {
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"autosaveTimerFired:" selector:0 userInfo:0 repeats:2.0];
    -[NotesDisplayController setAutosaveTimer:](self, "setAutosaveTimer:");
  }
}

- (void)prepareForReuse
{
  if ([(NotesDisplayController *)self isEditing]) {
    [(NotesDisplayController *)self setEditing:0 animated:1];
  }
  [(NotesDisplayController *)self stopTextFinding];
  [(NotesDisplayController *)self setNote:0];
  v3 = [(NotesDisplayController *)self contentLayer];
  unsigned __int8 v4 = [v3 noteHTMLEditorView];
  [v4 stopEditing];

  v5 = [(NotesDisplayController *)self contentLayer];
  [v5 setTracksMaximumContentLength:0];

  id v6 = [(NotesDisplayController *)self contentLayer];
  [v6 setContent:&stru_10063F3D8 isPlainText:0 attachments:0];

  [(NotesDisplayController *)self setDisplayedNoteVersionTimestamp:0];
  [(NotesDisplayController *)self setDisplayedNoteVersionObjectID:0];
  [(NotesDisplayController *)self invalidateAutosaveTimer];

  [(NotesDisplayController *)self setContentHasUnsavedChanges:0];
}

- (void)significantTimeChange
{
  v3 = [(NotesDisplayController *)self autosaveTimer];

  if (v3)
  {
    [(NotesDisplayController *)self resetAutosaveTimer];
  }
}

- (void)updateDate
{
  if ([(NotesDisplayController *)self contentHasUnsavedChanges])
  {
    id v5 = +[NSDate date];
  }
  else
  {
    v3 = [(NotesDisplayController *)self note];
    id v5 = [v3 modificationDate];
  }
  unsigned __int8 v4 = [(NotesDisplayController *)self contentLayer];
  [v4 setTimestampDate:v5];
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  unsigned __int8 v4 = [(NotesDisplayController *)self deletePresentationController];

  if (v4)
  {
    id v5 = [(NotesDisplayController *)self deletePresentationController];
    id v6 = [v5 presentingViewController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10010F040;
    v7[3] = &unk_100625AF0;
    void v7[4] = self;
    [v6 dismissViewControllerAnimated:0 completion:v7];
  }
}

- (void)_userFontSizeUpdated:(id)a3
{
}

- (void)copyNoteHTMLToPasteboard
{
  id v2 = [(NotesDisplayController *)self contentLayer];
  [v2 copyNoteHTMLToPasteboard];
}

- (BOOL)noteMatchesDisplayedContent:(id)a3
{
  id v4 = a3;
  if ([(NotesDisplayController *)self contentHasUnsavedChanges])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    id v6 = [v4 objectID];
    id v7 = [(NotesDisplayController *)self displayedNoteVersionObjectID];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [v4 modificationDate];
      uint64_t v9 = [(NotesDisplayController *)self displayedNoteVersionTimestamp];
      unsigned __int8 v5 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)captureDisplayedNoteVersion
{
  v3 = [(NotesDisplayController *)self note];
  id v4 = [v3 objectID];
  [(NotesDisplayController *)self setDisplayedNoteVersionObjectID:v4];

  id v6 = [(NotesDisplayController *)self note];
  unsigned __int8 v5 = [v6 modificationDate];
  [(NotesDisplayController *)self setDisplayedNoteVersionTimestamp:v5];
}

- (void)setNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  obj = (NoteObject *)objc_claimAutoreleasedReturnValue();

  p_note = &self->_note;
  note = self->_note;
  if (note != obj && note != 0)
  {
    uint64_t v8 = [(NotesDisplayController *)self view];
    uint64_t v9 = [v8 window];

    if (v9)
    {
      v10 = [(NotesDisplayController *)self eventReporter];
      [v10 submitNoteViewEventForHTMLNote:*p_note];
    }
  }
  objc_storeStrong((id *)&self->_note, obj);
  v11 = [(NoteObject *)obj store];
  objc_super v12 = [v11 account];

  if (v12) {
    id v13 = [v12 preventMovingNotesToOtherAccounts];
  }
  else {
    id v13 = 0;
  }
  [(NotesDisplayController *)self setNoteIsManaged:v13];
  if (*p_note)
  {
    BOOL v14 = [(NotesDisplayController *)self allowsAttachments];
    long long v15 = [(NotesDisplayController *)self contentLayer];
    [v15 setAllowsAttachments:v14];
  }
  [(NotesDisplayController *)self invalidateNoteUserActivity];
  if (obj) {
    [(NotesDisplayController *)self updateUserActivityStatus];
  }
  if (note != obj)
  {
    if (*p_note)
    {
      long long v16 = [(NotesDisplayController *)self view];
      v17 = [v16 window];

      if (v17)
      {
        v18 = [(NotesDisplayController *)self eventReporter];
        [v18 startNoteViewEventDurationTrackingForHTMLNote:*p_note];
      }
    }
  }
  [(NotesDisplayController *)self stopTextFinding];
  [(NotesDisplayController *)self updateViewAnnotation];
}

- (void)updateNote:(id)a3
{
  [(NotesDisplayController *)self setNote:a3];
  [(NotesDisplayController *)self setContentHasUnsavedChanges:1];
  [(NotesDisplayController *)self updateNoteFromInterface];
  id v5 = [(NotesDisplayController *)self note];
  id v4 = +[NSDate ic_modificationDateForNoteBeingEdited];
  [v5 setModificationDate:v4];
}

- (void)displayNote:(id)a3
{
  id v10 = a3;
  id v4 = [(NotesDisplayController *)self note];
  if (v4 == v10)
  {
  }
  else
  {
    unsigned __int8 v5 = +[UIApplication shouldMakeUIForDefaultPNG];

    if ((v5 & 1) == 0)
    {
      if ([(NotesDisplayController *)self noteMatchesDisplayedContent:v10])
      {
        [(NotesDisplayController *)self setNote:v10];
      }
      else
      {
        [(NotesDisplayController *)self stopTextFinding];
        if ([(NotesDisplayController *)self isEditing]) {
          [(NotesDisplayController *)self setEditing:0 animated:0];
        }
        [(NotesDisplayController *)self setNote:v10];
        uint64_t v8 = [(NotesDisplayController *)self contentLayer];
        [v8 scrollToTopAnimated:0];

        uint64_t v9 = [(NotesDisplayController *)self contentLayer];

        if (v9) {
          [(NotesDisplayController *)self setContentFromNote];
        }
        else {
          [(NotesDisplayController *)self setDidSetContentFromNote:0];
        }
        [(NotesDisplayController *)self captureDisplayedNoteVersion];
        [(NotesDisplayController *)self updateDate];
        [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
        [(NotesDisplayController *)self updateNoteProviderStatus];
        [(NotesDisplayController *)self updateForceLightContentIfNecessary];
      }
      goto LABEL_16;
    }
  }
  id v6 = v10;
  if (v10) {
    goto LABEL_17;
  }
  id v7 = [(NotesDisplayController *)self contentLayer];

  if (v7)
  {
    [(NotesDisplayController *)self setContentFromNote];
    [(NotesDisplayController *)self updateDate];
  }
  else
  {
    [(NotesDisplayController *)self setDidSetContentFromNote:0];
  }
LABEL_16:
  id v6 = v10;
LABEL_17:
}

- (void)updateNoteTitle
{
  v3 = [(NotesDisplayController *)self contentLayer];
  id v5 = [v3 title];

  id v4 = [(NotesDisplayController *)self note];
  [v4 setTitle:v5];
}

- (void)updateNoteFromInterface
{
  if ([(NotesDisplayController *)self contentHasUnsavedChanges])
  {
    id v25 = 0;
    id v26 = 0;
    [(NotesDisplayController *)self prepareForSerializationWithLeftoverPresentations:&v26 createdAttachments:&v25];
    id v3 = v26;
    id v18 = v25;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v7);
          uint64_t v9 = [(NoteObject *)self->_note attachments];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10010F914;
          v20[3] = &unk_10062A3C8;
          v20[4] = v8;
          id v10 = +[NSPredicate predicateWithBlock:v20];
          v11 = [v9 filteredSetUsingPredicate:v10];
          objc_super v12 = [v11 anyObject];

          if (v12)
          {
            id v13 = [v12 managedObjectContext];
            [v13 deleteObject:v12];

            [(NoteObject *)self->_note removeAttachmentsObject:v12];
          }

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v5);
    }

    BOOL v14 = [(NotesDisplayController *)self contentLayer];
    long long v15 = [v14 contentAsPlainText:[self->_note isPlainText]];

    long long v16 = [(NotesDisplayController *)self note];
    [v16 setContent:v15];

    v17 = [(NotesDisplayController *)self note];
    [v17 addAttachments:v18];

    [(NotesDisplayController *)self updateNoteTitle];
    [(NotesDisplayController *)self updateNoteUserActivityState];
    [(NotesDisplayController *)self refreshAttachmentPresentations];
    [(NotesDisplayController *)self prepareForPresentation];
    [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
  }
}

- (void)saveNote
{
  if ([(NotesDisplayController *)self contentHasUnsavedChanges])
  {
    [(NotesDisplayController *)self updateNoteFromInterface];
    if ([(NotesDisplayController *)self noteCanBeSaved])
    {
      id v3 = [(NotesDisplayController *)self eventReporter];
      id v4 = [(NotesDisplayController *)self note];
      [v3 submitNoteEditEventForHTMLNote:v4];

      id v5 = [(NotesDisplayController *)self note];
      uint64_t v6 = +[NSDate date];
      [v5 setModificationDate:v6];

      id v7 = +[NotesApp sharedNotesApp];
      uint64_t v8 = [v7 noteContext];
      id v15 = 0;
      unsigned __int8 v9 = [v8 save:&v15];
      id v10 = v15;

      if ((v9 & 1) == 0)
      {
        v11 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1004DC7C0(v10, v11);
        }
      }
      objc_super v12 = +[NotesApp sharedNotesApp];
      id v13 = [(NotesDisplayController *)self note];
      BOOL v14 = [v13 store];
      [v12 refreshNotesIfNeededForCollection:v14];

      [(NotesDisplayController *)self captureDisplayedNoteVersion];
      [(NotesDisplayController *)self setContentHasUnsavedChanges:0];
      [(NotesDisplayController *)self invalidateAutosaveTimer];
    }
  }
}

- (BOOL)noteContainsValuableContent
{
  if ([(NotesDisplayController *)self isEditing])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(NotesDisplayController *)self note];
    id v5 = [v4 content];
    if (objc_msgSend(v5, "ic_containsNonWhitespaceCharacters"))
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v6 = [(NotesDisplayController *)self note];
      id v7 = [v6 attachments];
      BOOL v3 = [v7 count] != 0;
    }
  }
  uint64_t v8 = [(NotesDisplayController *)self note];
  unsigned __int8 v9 = v8 != 0;
  if (v8 && !v3)
  {
    id v10 = [(NotesDisplayController *)self contentLayer];
    unsigned __int8 v9 = [v10 contentContainsValuableContent];
  }
  return v9;
}

- (BOOL)noteShouldBeDiscarded
{
  BOOL v3 = [(NotesDisplayController *)self note];
  if (v3 && ![(NotesDisplayController *)self isUpdatingNoteContent]) {
    unsigned int v4 = ![(NotesDisplayController *)self noteContainsValuableContent];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)updateNoteProviderStatus
{
  BOOL v3 = [(NotesDisplayController *)self note];
  if (v3 && [(NotesDisplayController *)self isVisible])
  {
    if ([(NotesDisplayController *)self isEditing]) {
      BOOL v4 = [(NotesDisplayController *)self noteCanBeSaved];
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  if (v4 != [(NotesDisplayController *)self canProvideNote])
  {
    [(NotesDisplayController *)self setCanProvideNote:v4];
    [(NotesDisplayController *)self didChangeNoteProviderStatus];
  }
}

- (void)didChangeNoteProviderStatus
{
  [(NotesDisplayController *)self updateContextProviderStatus];

  [(NotesDisplayController *)self updateUserActivityStatus];
}

- (BOOL)noteHasSizeLimit
{
  id v2 = [(NotesDisplayController *)self note];
  BOOL v3 = [v2 store];
  BOOL v4 = [v3 account];
  BOOL v5 = [v4 accountType] == (id)1;

  return v5;
}

- (unint64_t)estimatedSizeOfDisplayedContent
{
  BOOL v3 = [(NotesDisplayController *)self contentLayer];
  BOOL v4 = [v3 title];
  BOOL v5 = [v4 dataUsingEncoding:4];

  uint64_t v6 = (char *)[v5 length];
  id v7 = [(NotesDisplayController *)self contentLayer];
  uint64_t v8 = [(NotesDisplayController *)self note];
  unsigned __int8 v9 = [v7 contentAsPlainText:[v8 isPlainText]];
  id v10 = [v9 dataUsingEncoding:4];

  v11 = &v6[(void)[v10 length]];
  objc_super v12 = [(NotesDisplayController *)self attachmentPresentations];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v16);
        id v21 = 0;
        [v17 getPresentationData:&v21 mimeType:0 error:0];
        id v18 = v21;
        v11 = &v11[&[v18 ic_lengthAsMIMEAttachment]];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
  v19 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_1004DC870((uint64_t)v11, v19);
  }

  return (unint64_t)v11;
}

- (BOOL)acceptNewSize:(unint64_t)a3
{
  BOOL v9 = 0;
  BOOL v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004DC8E8(a3, v5);
  }

  BOOL v6 = sub_1000EEC88(a3, &v9);
  if (v6)
  {
    if (v9)
    {
      id v7 = [(NotesDisplayController *)self contentLayer];
      [v7 setTracksMaximumContentLength:1];
    }
  }
  else
  {
    [(NotesDisplayController *)self warnUserAboutNoteSizeLimitExceeded];
  }
  return v6;
}

- (void)turnOnContentLengthTrackingIfNeeded
{
  if (![(NotesDisplayController *)self noteHasSizeLimit]) {
    return;
  }
  id v12 = [(NotesDisplayController *)self contentLayer];
  if ([v12 tracksMaximumContentLength])
  {

    return;
  }
  if (([(NotesDisplayController *)self isEditing] & 1) == 0)
  {
    BOOL v3 = [(NotesDisplayController *)self note];
    BOOL v4 = [v3 content];
    if ((unint64_t)[v4 length] < 0x493E0)
    {
      BOOL v5 = [(NotesDisplayController *)self note];
      BOOL v6 = [v5 attachments];
      id v7 = [v6 count];

      if (!v7) {
        return;
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  BOOL v13 = 0;
  BOOL v8 = sub_1000EEC88([(NotesDisplayController *)self estimatedSizeOfDisplayedContent], &v13);
  BOOL v9 = [(NotesDisplayController *)self contentLayer];
  id v10 = v9;
  uint64_t v11 = v13 || !v8;
  [v9 setTracksMaximumContentLength:v11];
}

- (void)warnUserAboutNoteSizeLimitExceeded
{
  BOOL v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"Maximum note size reached." value:&stru_10063F3D8 table:0];
  id v8 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:1];

  BOOL v5 = +[NSBundle mainBundle];
  BOOL v6 = [v5 localizedStringForKey:@"OK" value:&stru_10063F3D8 table:0];
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(NotesDisplayController *)self presentViewController:v8 animated:1 completion:0];
}

- (BOOL)allowsAttachments
{
  id v2 = [(NotesDisplayController *)self note];
  BOOL v3 = [v2 store];
  BOOL v4 = [v3 account];
  unsigned __int8 v5 = [v4 supportsAttachments];

  return v5;
}

- (void)setAllAttachmentPresentationOccurences:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (NSArray *)[v4 copy];
  allAttachmentPresentationOccurences = self->_allAttachmentPresentationOccurences;
  self->_allAttachmentPresentationOccurences = v5;

  [v4 ic_objectsPassingTest:&stru_10062A3E8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = (NSArray *)[v9 copy];
  nonManagedAttachmentPresentationOccurences = self->_nonManagedAttachmentPresentationOccurences;
  self->_nonManagedAttachmentPresentationOccurences = v7;
}

- (id)attachmentPresentationOccurencesForPreviewingWithManagedInterface:(BOOL)a3
{
  BOOL v3 = &OBJC_IVAR___NotesDisplayController__nonManagedAttachmentPresentationOccurences;
  if (a3) {
    BOOL v3 = &OBJC_IVAR___NotesDisplayController__allAttachmentPresentationOccurences;
  }
  id v4 = *(id *)&self->ICNAViewController_opaque[*v3];

  return v4;
}

- (id)attachmentContentIDs
{
  id v2 = [(NotesDisplayController *)self contentLayer];
  BOOL v3 = [v2 noteHTMLEditorView];
  id v4 = [v3 attachmentContentIDs];

  return v4;
}

- (void)prepareForPresentation
{
  BOOL v3 = [(NotesDisplayController *)self attachmentContentIDs];
  id v4 = [(NotesDisplayController *)self attachmentPresentations];
  id v6 = 0;
  +[NoteAttachmentPresentation prepareDocumentForPresentationWithAttachmentContentIDs:v3 withAttachmentPresentations:v4 occurences:&v6];
  id v5 = v6;

  [(NotesDisplayController *)self setAllAttachmentPresentationOccurences:v5];
}

- (void)prepareForSerializationWithLeftoverPresentations:(id *)a3 createdAttachments:(id *)a4
{
  id v5 = +[NotesApp sharedNotesApp];
  v37 = [v5 noteContext];

  id v6 = [(NotesDisplayController *)self attachmentPresentations];
  id v7 = +[NSMutableOrderedSet orderedSetWithArray:v6];

  v32 = +[NSMutableSet set];
  id v8 = [(NotesDisplayController *)self note];
  id v9 = [v8 attachments];
  id v10 = [v9 allObjects];
  uint64_t v11 = [v10 ic_dictionaryByHashingContentWithFunction:&stru_10062A408];
  id v12 = [v11 mutableCopy];

  BOOL v13 = [(NotesDisplayController *)self attachmentPresentations];
  id v14 = [v13 ic_dictionaryByHashingContentWithFunction:&stru_10062A428];
  id v15 = [v14 mutableCopy];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v31 = self;
  long long v16 = [(NotesDisplayController *)self attachmentContentIDs];
  id v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    id v35 = v12;
    v36 = v7;
    v33 = v16;
    id v34 = v15;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        long long v22 = [v12 objectForKeyedSubscript:v21];
        long long v23 = [v15 objectForKeyedSubscript:v21];
        if (v23)
        {
          [v7 removeObject:v23];
          if (!v22)
          {
            id v39 = 0;
            id v40 = 0;
            id v38 = 0;
            [v23 getPresentationData:&v40 mimeType:&v39 error:&v38];
            id v24 = v40;
            id v25 = v39;
            id v26 = v38;
            v27 = [v23 contentID];
            v28 = [v23 filename];
            long long v22 = +[ICLegacyContentUtilities createAttachmentWithContentID:v27 mimeType:v25 data:v24 filename:v28 inContext:v37];

            if (v22) {
              [v32 addObject:v22];
            }

            id v12 = v35;
            id v7 = v36;
            long long v16 = v33;
            id v15 = v34;
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v18);
  }

  if (a4) {
    *a4 = [v32 copy];
  }
  if (a3)
  {
    *a3 = [v7 array];
  }
  [(NotesDisplayController *)v31 setAllAttachmentPresentationOccurences:0];
}

- (id)newlyCreatedAttachmentPresentationWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    id v10 = a3;
    uint64_t v11 = +[ICLegacyContentUtilities generateContentID];
    if (v9)
    {
      id v12 = v9;
    }
    else
    {
      id v12 = +[ICLegacyContentUtilities suggestedFilenameForURL:0 mimeType:v8];
    }
    id v14 = v12;
    id v15 = +[NotesApp sharedNotesApp];
    long long v16 = [v15 noteContext];

    id v17 = +[ICLegacyContentUtilities createAttachmentWithContentID:v11 mimeType:v8 data:v10 filename:v14 inContext:v16];

    id v18 = [(NotesDisplayController *)self note];
    [v18 addAttachmentsObject:v17];

    uint64_t v19 = [(NotesDisplayController *)self note];
    v20 = [v19 managedObjectContext];
    [v20 ic_save];

    id v13 = [objc_alloc((Class)NoteAttachmentPresentation) initWithNoteAttachmentObject:v17];
    uint64_t v21 = [(NotesDisplayController *)self attachmentPresentations];
    long long v22 = [v21 arrayByAddingObject:v13];

    [(NotesDisplayController *)self setAttachmentPresentations:v22];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)insertAttachmentWithData:(id)a3 mimeType:(id)a4 preferredFilename:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(NotesDisplayController *)self noteHasSizeLimit])
  {
    if (!v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unsigned __int8 v10 = -[NotesDisplayController acceptNewSize:](self, "acceptNewSize:", (char *)objc_msgSend(v13, "ic_lengthAsMIMEAttachment")+ -[NotesDisplayController estimatedSizeOfDisplayedContent](self, "estimatedSizeOfDisplayedContent"));
  if (v13 && (v10 & 1) != 0)
  {
LABEL_6:
    uint64_t v11 = [(NotesDisplayController *)self newlyCreatedAttachmentPresentationWithData:v13 mimeType:v8 preferredFilename:v9];
    id v12 = [(NotesDisplayController *)self contentLayer];
    [v12 replaceSelectionWithAttachmentPresentation:v11];
  }
LABEL_7:
}

- (id)noteAttachmentPresentationForContentID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NotesDisplayController *)self attachmentPresentations];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 contentID];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = [(NotesDisplayController *)self noteAttachmentObjectWithContentID:v4];
  if (v5)
  {
    id v13 = [objc_alloc((Class)NoteAttachmentPresentation) initWithNoteAttachmentObject:v5];
LABEL_12:
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)noteAttachmentObjectWithContentID:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(NotesDisplayController *)self note];
  id v6 = [v5 attachments];

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v7)
  {

LABEL_13:
    long long v16 = [(NotesDisplayController *)self note];
    long long v17 = [v16 managedObjectContext];
    long long v18 = +[ICLegacyAttachmentUtilities attachmentWithContentID:v4 context:v17];

    objc_opt_class();
    id v9 = ICDynamicCast();

    goto LABEL_14;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v6);
      }
      unsigned __int8 v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      id v13 = [v12 contentID];
      unsigned int v14 = [v13 isEqualToString:v4];

      if (v14)
      {
        id v15 = v12;

        id v9 = v15;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v8);

  if (!v9) {
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  id v4 = [(NotesDisplayController *)self noteAttachmentPresentationForContentID:a4];
  id v5 = [v4 dataFileURL];

  return v5;
}

- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4
{
  return [(NotesDisplayController *)self noteAttachmentPresentationForContentID:a4];
}

- (void)setContentFromNote
{
  BOOL v3 = [(NotesDisplayController *)self contentLayer];
  id v4 = [v3 delegate];

  if (v4 == self)
  {
    id v5 = [(NotesDisplayController *)self contentLayer];
    [v5 setDelegate:0];

    id v6 = [(NotesDisplayController *)self contentLayer];
    [v6 setAttachmentPresentationDelegate:0];
  }
  id v7 = [(NotesDisplayController *)self note];
  id v8 = [v7 content];

  id v9 = [(NotesDisplayController *)self note];
  unsigned __int8 v10 = [v9 isPlainText];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001110F8;
  v15[3] = &unk_100625F50;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  unsigned __int8 v17 = v10;
  unsigned __int8 v12 = objc_retainBlock(v15);
  if ((unint64_t)[v11 length] <= 0x10000)
  {
    ((void (*)(void *))v12[2])(v12);
  }
  else
  {
    [(NotesDisplayController *)self setDelayingSetContent:1];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  if (v4 == self)
  {
    id v13 = [(NotesDisplayController *)self contentLayer];
    [v13 setDelegate:self];

    unsigned int v14 = [(NotesDisplayController *)self contentLayer];
    [v14 setAttachmentPresentationDelegate:self];
  }
  [(NotesDisplayController *)self setDidSetContentFromNote:1];
}

- (void)reloadContentLayer
{
  if ([(NotesDisplayController *)self isEditing])
  {
    [(NotesDisplayController *)self setEditing:0 animated:0];
    [(NotesDisplayController *)self prepareForSerializationWithLeftoverPresentations:0 createdAttachments:0];
    [(NotesDisplayController *)self prepareForPresentation];
    BOOL v3 = [(NotesDisplayController *)self contentLayer];
    id v4 = [v3 noteHTMLEditorView];
    [v4 setNeedsDisplay];

    id v5 = [(NotesDisplayController *)self contentLayer];
    [v5 setNeedsLayout];

    [(NotesDisplayController *)self setEditing:1 animated:0];
  }
  else
  {
    [(NotesDisplayController *)self prepareForSerializationWithLeftoverPresentations:0 createdAttachments:0];
    [(NotesDisplayController *)self prepareForPresentation];
    id v6 = [(NotesDisplayController *)self contentLayer];
    id v7 = [v6 noteHTMLEditorView];
    [v7 setNeedsDisplay];

    id v8 = [(NotesDisplayController *)self contentLayer];
    [v8 setNeedsLayout];
  }
}

- (void)refreshAttachmentPresentations
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v3 = [(NotesDisplayController *)self attachmentPresentations];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) contentIDURL];
        +[NotesCIDURLProtocol unregisterDataProviderForCIDURL:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  id v9 = [(NoteObject *)self->_note attachments];
  unsigned __int8 v10 = [v9 allObjects];
  id v11 = +[NoteAttachmentPresentation attachmentPresentationsForAttachments:v10];
  [(NotesDisplayController *)self setAttachmentPresentations:v11];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned __int8 v12 = [(NotesDisplayController *)self attachmentPresentations];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned __int8 v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        long long v18 = [v17 contentIDURL];
        +[NotesCIDURLProtocol registerDataProvider:v17 forCIDURL:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [(NotesDisplayController *)self setAllAttachmentPresentationOccurences:0];
}

- (BOOL)wantsToRemainFirstResponder
{
  unsigned int v3 = [(NotesDisplayController *)self isViewLoaded];
  if (v3)
  {
    LOBYTE(v3) = [(NotesDisplayController *)self isEditing];
  }
  return v3;
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)NotesBackgroundView) initWithFrame:0.0, 0.0, 320.0, 320.0];
  [(NotesDisplayController *)self setBackgroundView:v3];

  id v4 = [(NotesDisplayController *)self backgroundView];
  [v4 setAutoresizingMask:18];

  id v5 = [(NotesDisplayController *)self backgroundView];
  [(NotesDisplayController *)self setView:v5];

  uint64_t v6 = +[UIColor ICBackgroundColor];
  id v7 = [(NotesDisplayController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = [objc_alloc((Class)NoteContentLayer) initWithFrame:0.0, 0.0, 320.0, 320.0];
  [(NotesDisplayController *)self setContentLayer:v8];

  id v9 = [(NotesDisplayController *)self note];

  if (v9)
  {
    BOOL v10 = [(NotesDisplayController *)self allowsAttachments];
    id v11 = [(NotesDisplayController *)self contentLayer];
    [v11 setAllowsAttachments:v10];
  }
  unsigned __int8 v12 = [(NotesDisplayController *)self traitCollection];
  if (objc_msgSend(v12, "ic_hasCompactWidth"))
  {
    uint64_t v13 = 1;
  }
  else
  {
    id v14 = [(NotesDisplayController *)self viewControllerManager];
    if ([v14 isAuxiliary])
    {
      uint64_t v13 = 1;
    }
    else if (+[UIDevice ic_isVision])
    {
      uint64_t v15 = [(NotesDisplayController *)self viewControllerManager];
      uint64_t v13 = (uint64_t)[v15 isMainSplitViewDisplayModeSecondaryOnly];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  id v16 = [(NotesDisplayController *)self viewControllerManager];
  BOOL v17 = [v16 noteContainerViewMode] == 0;

  long long v18 = [(NotesDisplayController *)self viewControllerManager];
  if ([v18 noteContainerViewMode] == (id)1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v13;
  }

  long long v20 = [(NotesDisplayController *)self backgroundView];
  long long v21 = [(NotesDisplayController *)self contentLayer];
  [v20 setContentView:v21 useSafeAreaLayoutGuide:[UIDevice ic_isVision] standalone:v13 needsAdditionalBottomMargin:v17 needsAdditionalLeadingMargin:v19 force:0];

  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)[(NotesDisplayController *)self updateDate]; {
  id v22 = +[NSNotificationCenter defaultCenter];
  }
  [v22 addObserver:self selector:"_userFontSizeUpdated:" name:UIContentSizeCategoryDidChangeNotification object:0];
  [v22 addObserver:self selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v22 addObserver:self selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];
  [v22 addObserver:self selector:"applicationWillTerminate:" name:UIApplicationWillTerminateNotification object:0];
  [v22 addObserver:self selector:"sceneDidActivate:" name:UISceneDidActivateNotification object:0];
  [v22 addObserver:self selector:"sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:0];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v12 viewDidLoad];
  id v3 = [(NotesDisplayController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = [(NotesDisplayController *)self backgroundView];
  id v5 = [(NotesDisplayController *)self ic_safeAreaLayoutGuide];
  uint64_t v6 = [(NotesDisplayController *)self backgroundView];
  [v4 addConstraintsForSafeAreaLayoutGuide:v5 toContainer:v6];

  id v7 = [(NotesDisplayController *)self contentLayer];
  [v7 setDelegate:self];

  id v8 = [(NotesDisplayController *)self contentLayer];
  [v8 setAttachmentPresentationDelegate:self];

  if ([(NotesDisplayController *)self isEditing])
  {
    id v9 = [(NotesDisplayController *)self contentLayer];
    BOOL v10 = [v9 noteHTMLEditorView];
    [v10 startEditing];
  }
  id v11 = [(NotesDisplayController *)self webView];
  [v11 _setFindInteractionEnabled:1];
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v3 didReceiveMemoryWarning];
  [(NotesDisplayController *)self setDidSetContentFromNote:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v11 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    id v7 = [(NotesDisplayController *)self viewControllerManager];
    unsigned __int8 v8 = [v7 isAuxiliary];
    if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      id v4 = [(NotesDisplayController *)self ic_viewControllerManager];
      uint64_t v9 = (uint64_t)[v4 isAuxiliary];
    }
    BOOL v10 = [(NotesDisplayController *)self navigationItem];
    [v10 setHidesBackButton:v9];

    if ((v8 & 1) == 0) {
  }
    }
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v4 willMoveToParentViewController:a3];
  [(NotesDisplayController *)self setToolbarItems:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  [(NotesDisplayController *)self setIsAppearing:1];
  uint64_t v6 = [(NotesDisplayController *)self note];

  if (v6)
  {
    id v7 = [(NotesDisplayController *)self delegate];
    unsigned __int8 v8 = [(NotesDisplayController *)self note];
    [v7 noteDisplayController:self beginDisplayingNote:v8 animated:v4];
  }
  if (![(NotesDisplayController *)self didSetContentFromNote]) {
    [(NotesDisplayController *)self setContentFromNote];
  }
  [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
  [(NotesDisplayController *)self updateBarsVisibilityAnimated:v4];
  uint64_t v9 = [(NotesDisplayController *)self transitionCoordinator];

  if (v9)
  {
    BOOL v10 = [(NotesDisplayController *)self transitionCoordinator];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100111E2C;
    v20[3] = &unk_100625AC8;
    v20[4] = self;
    [v10 animateAlongsideTransition:v20 completion:0];
  }
  else
  {
    [(NotesDisplayController *)self updateForceLightContentIfNecessary];
  }
  objc_super v11 = [(NotesDisplayController *)self viewControllerManager];
  unsigned __int8 v12 = [v11 isAuxiliary];
  if (v12)
  {
    uint64_t v13 = 1;
  }
  else
  {
    objc_super v3 = [(NotesDisplayController *)self ic_viewControllerManager];
    uint64_t v13 = (uint64_t)[v3 isAuxiliary];
  }
  id v14 = [(NotesDisplayController *)self navigationItem];
  [v14 setHidesBackButton:v13];

  if ((v12 & 1) == 0) {
  objc_initWeak(&location, self);
  }
  uint64_t v15 = [(NotesDisplayController *)self view];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100111E34;
  v17[3] = &unk_1006286A8;
  objc_copyWeak(&v18, &location);
  [v15 ic_addCreateNoteInteractionWithFolderHandler:v17];

  v16.receiver = self;
  v16.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v16 viewWillAppear:v4];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v13 viewDidAppear:a3];
  BOOL v4 = [(NotesDisplayController *)self note];

  if (v4)
  {
    id v5 = [(NotesDisplayController *)self eventReporter];
    uint64_t v6 = [(NotesDisplayController *)self note];
    [v5 startNoteViewEventDurationTrackingForHTMLNote:v6];
  }
  id v7 = [(NotesDisplayController *)self navigationController];
  [v7 setNavigationBarHidden:0 animated:0];

  if (![(NotesDisplayController *)self delayingSetContent])
  {
    unsigned __int8 v8 = [(NotesDisplayController *)self contentLayer];
    [v8 flashScrollIndicators];
  }
  [(NotesDisplayController *)self setVisible:1];
  [(NotesDisplayController *)self updateNoteProviderStatus];
  uint64_t v9 = [(NotesDisplayController *)self contentLayer];
  [v9 setEditable:1];

  if ([(NotesDisplayController *)self startEditingAfterViewAppears])
  {
    BOOL v10 = [(NotesDisplayController *)self contentLayer];
    objc_super v11 = [v10 noteHTMLEditorView];
    [v11 startEditing];

    [(NotesDisplayController *)self setStartEditingAfterViewAppears:0];
  }
  [(NotesDisplayController *)self updateBarButtonItemsAnimated:1];
  unsigned __int8 v12 = +[ICAppDelegate sharedInstance];
  [v12 didFinishExtendedLaunch];

  [(NotesDisplayController *)self setIsAppearing:0];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)sceneWillDeactivate:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(NotesDisplayController *)self viewIfLoaded];
  uint64_t v6 = [v5 window];
  id v7 = [v6 windowScene];
  unsigned int v8 = [v4 isEqual:v7];

  if (v8)
  {
    if ([(NotesDisplayController *)self ic_isViewVisible])
    {
      uint64_t v9 = [(NotesDisplayController *)self note];

      if (v9)
      {
        id v11 = [(NotesDisplayController *)self eventReporter];
        BOOL v10 = [(NotesDisplayController *)self note];
        [v11 submitNoteViewEventForHTMLNote:v10];
      }
    }
  }
}

- (void)sceneDidActivate:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(NotesDisplayController *)self viewIfLoaded];
  uint64_t v6 = [v5 window];
  id v7 = [v6 windowScene];
  unsigned int v8 = [v4 isEqual:v7];

  if (v8)
  {
    if ([(NotesDisplayController *)self ic_isViewVisible])
    {
      uint64_t v9 = [(NotesDisplayController *)self note];

      if (v9)
      {
        id v11 = [(NotesDisplayController *)self eventReporter];
        BOOL v10 = [(NotesDisplayController *)self note];
        [v11 startNoteViewEventDurationTrackingForHTMLNote:v10];
      }
    }
  }
}

- (BOOL)isEndingNoteDisplay
{
  objc_super v3 = [(NotesDisplayController *)self navigationController];
  unsigned __int8 v4 = [v3 isMovingFromParentViewController];
  if (v4)
  {
    if ([(NotesDisplayController *)self transitioningToSize]) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = ![(NotesDisplayController *)self isAppearing];
    }
  }
  else
  {
    unsigned __int8 v6 = v4;
    id v7 = [(NotesDisplayController *)self navigationController];
    if (([v7 isBeingDismissed] & 1) != 0
      || ([(NotesDisplayController *)self isMovingFromParentViewController] & 1) != 0|| [(NotesDisplayController *)self isBeingDismissed])
    {
      if ([(NotesDisplayController *)self transitioningToSize])
      {
        LOBYTE(v5) = 0;
        if (v6) {
          goto LABEL_15;
        }
      }
      else
      {
        unsigned int v5 = ![(NotesDisplayController *)self isAppearing];
        if (v6) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
LABEL_15:

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NotesDisplayController *)self note];

  if (v5)
  {
    unsigned __int8 v6 = [(NotesDisplayController *)self eventReporter];
    id v7 = [(NotesDisplayController *)self note];
    [v6 submitNoteViewEventForHTMLNote:v7];
  }
  [(NotesDisplayController *)self saveNote];
  [(NotesDisplayController *)self setVisible:0];
  [(NotesDisplayController *)self updateNoteProviderStatus];
  v13.receiver = self;
  v13.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v13 viewWillDisappear:v3];
  if ([(NotesDisplayController *)self isEndingNoteDisplay])
  {
    unsigned int v8 = [(NotesDisplayController *)self delegate];
    uint64_t v9 = [(NotesDisplayController *)self note];
    [v8 noteDisplayController:self endDisplayingNote:v9 animated:v3];
  }
  BOOL v10 = [(NotesDisplayController *)self transitionCoordinator];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001124DC;
  v12[3] = &unk_100625AC8;
  v12[4] = self;
  [v10 animateAlongsideTransition:0 completion:v12];

  id v11 = [(NotesDisplayController *)self view];
  [v11 ic_removeLinkActionInteractions];

  [(NotesDisplayController *)self stopTextFinding];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NotesDisplayController *)self isEndingNoteDisplay]) {
    [(NotesDisplayController *)self prepareForReuse];
  }
  unsigned int v5 = [(NotesDisplayController *)self contentLayer];
  [v5 setEditable:0];

  v6.receiver = self;
  v6.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v6 viewDidDisappear:v3];
}

- (id)displayedActionButtonItemsWithTag:(int64_t)a3
{
  unsigned int v5 = [(NotesDisplayController *)self navigationItem];
  objc_super v6 = [v5 rightBarButtonItems];
  id v7 = +[NSMutableArray arrayWithArray:v6];

  unsigned int v8 = [(NotesDisplayController *)self toolbarItems];
  [v7 addObjectsFromArray:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "tag", (void)v17) == (id)a3)
        {
          id v15 = v14;
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (UIBarButtonItem)closeAuxiliaryWindowButton
{
  closeAuxiliaryWindowButton = self->_closeAuxiliaryWindowButton;
  if (!closeAuxiliaryWindowButton)
  {
    unsigned __int8 v4 = +[NSBundle mainBundle];
    unsigned int v5 = [v4 localizedStringForKey:@"Close" value:&stru_10063F3D8 table:0];

    id v6 = objc_alloc((Class)UIBarButtonItem);
    id v7 = [(NotesDisplayController *)self viewControllerManager];
    unsigned int v8 = (UIBarButtonItem *)[v6 initWithTitle:v5 style:0 target:v7 action:"closeAuxiliaryWindow"];
    id v9 = self->_closeAuxiliaryWindowButton;
    self->_closeAuxiliaryWindowButton = v8;

    closeAuxiliaryWindowButton = self->_closeAuxiliaryWindowButton;
  }

  return closeAuxiliaryWindowButton;
}

- (UIBarButtonItem)doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    unsigned __int8 v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonClicked:"];
    unsigned int v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }
  id v6 = doneButtonItem;

  return v6;
}

- (id)shareButtonItem
{
  return [(NotesDisplayController *)self displayedActionButtonItemsWithTag:1];
}

- (id)deleteButtonItem
{
  return [(NotesDisplayController *)self displayedActionButtonItemsWithTag:2];
}

- (id)addButtonItem
{
  return [(NotesDisplayController *)self displayedActionButtonItemsWithTag:3];
}

- (void)updateBarButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(NotesDisplayController *)self traitCollection];
  if ([v14 horizontalSizeClass])
  {
    unsigned int v5 = [(NotesDisplayController *)self traitCollection];
    id v6 = [v5 verticalSizeClass];

    if (!v6) {
      return;
    }
    [(NotesDisplayController *)self updateToolbarButtonItemsAnimated:v3];
    [(NotesDisplayController *)self updateNavigationBarLeftButtonItemsAnimated:v3];
    [(NotesDisplayController *)self updateNavigationBarRightButtonItemsAnimated:v3];
    id v7 = [(NotesDisplayController *)self addButtonItem];
    if ([(NotesDisplayController *)self noteCanBeSaved])
    {
      [v7 setEnabled:1];
    }
    else
    {
      unsigned int v8 = [(NotesDisplayController *)self note];
      if (v8) {
        uint64_t v9 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG];
      }
      else {
        uint64_t v9 = 1;
      }
      [v7 setEnabled:v9];
    }
    id v10 = [(NotesDisplayController *)self shareButtonItem];
    if ([(NotesDisplayController *)self noteCanBeSaved]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG];
    }
    [v10 setEnabled:v11];

    id v14 = [(NotesDisplayController *)self deleteButtonItem];
    uint64_t v12 = [(NotesDisplayController *)self note];
    if (v12) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = (uint64_t)+[UIApplication shouldMakeUIForDefaultPNG];
    }
    [v14 setEnabled:v13];
  }
}

- (NSArray)actionButtonItemsForToolbar
{
  actionButtonItemsForToolbar = self->_actionButtonItemsForToolbar;
  if (!actionButtonItemsForToolbar)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    unsigned int v5 = +[UIImage systemImageNamed:@"trash"];
    id v6 = [v4 initWithImage:v5 style:0 target:self action:"deleteButtonClicked:"];
    [(NotesDisplayController *)self setDeleteBarButtonItem:v6];

    id v7 = [(NotesDisplayController *)self deleteBarButtonItem];
    [v7 setTag:2];

    id v8 = objc_alloc((Class)UIBarButtonItem);
    uint64_t v9 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    id v10 = [v8 initWithImage:v9 style:0 target:self action:"shareButtonClicked:"];
    [(NotesDisplayController *)self setShareBarButtonItem:v10];

    uint64_t v11 = [(NotesDisplayController *)self shareBarButtonItem];
    [v11 setTag:1];

    id v12 = objc_alloc((Class)UIBarButtonItem);
    uint64_t v13 = +[UIImage systemImageNamed:@"square.and.pencil"];
    id v14 = [v12 initWithImage:v13 style:0 target:self action:"addButtonClicked:"];
    [(NotesDisplayController *)self setCreateBarButtonItem:v14];

    id v15 = [(NotesDisplayController *)self createBarButtonItem];
    [v15 setTag:3];

    objc_super v16 = [(NotesDisplayController *)self deleteBarButtonItem];
    id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0 v16];
    v25[1] = v17;
    long long v18 = [(NotesDisplayController *)self shareBarButtonItem];
    v25[2] = v18;
    id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v25[3] = v19;
    long long v20 = [(NotesDisplayController *)self createBarButtonItem];
    v25[4] = v20;
    long long v21 = +[NSArray arrayWithObjects:v25 count:5];
    id v22 = self->_actionButtonItemsForToolbar;
    self->_actionButtonItemsForToolbar = v21;

    [(NotesDisplayController *)self applyAccessibilityInfo];
    actionButtonItemsForToolbar = self->_actionButtonItemsForToolbar;
  }
  long long v23 = actionButtonItemsForToolbar;

  return v23;
}

- (NSArray)actionButtonItemsForNavBar
{
  actionButtonItemsForNavBar = self->_actionButtonItemsForNavBar;
  if (actionButtonItemsForNavBar)
  {
    BOOL v3 = actionButtonItemsForNavBar;
  }
  else
  {
    id v31 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    [v31 setWidth:-1.0];
    id v30 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    [v30 setWidth:10.0];
    id v29 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    [v29 setWidth:10.0];
    id v5 = objc_alloc((Class)UIBarButtonItem);
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Delete Note" value:&stru_10063F3D8 table:0];
    id v8 = +[UIImage systemImageNamed:@"trash"];
    id v9 = [v5 initWithTitle:v7 image:v8 target:self action:"deleteButtonClicked:" menu:0];
    [(NotesDisplayController *)self setDeleteNavBarButtonItem:v9];

    id v10 = [(NotesDisplayController *)self deleteNavBarButtonItem];
    [v10 setTag:2];

    id v11 = objc_alloc((Class)UIBarButtonItem);
    id v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"Share" value:&stru_10063F3D8 table:0];
    id v14 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    id v15 = [v11 initWithTitle:v13 image:v14 target:self action:"shareButtonClicked:" menu:0];
    [(NotesDisplayController *)self setShareNavBarButtonItem:v15];

    objc_super v16 = [(NotesDisplayController *)self shareNavBarButtonItem];
    [v16 setTag:1];

    id v17 = objc_alloc((Class)UIBarButtonItem);
    long long v18 = +[NSBundle mainBundle];
    id v19 = [v18 localizedStringForKey:@"New Note" value:&stru_10063F3D8 table:0];
    long long v20 = +[UIImage systemImageNamed:@"square.and.pencil"];
    id v21 = [v17 initWithTitle:v19 image:v20 target:self action:"addButtonClicked:" menu:0];
    [(NotesDisplayController *)self setCreateNavBarButtonItem:v21];

    id v22 = [(NotesDisplayController *)self createNavBarButtonItem];
    [v22 setTag:3];

    v32[0] = v31;
    long long v23 = [(NotesDisplayController *)self createNavBarButtonItem];
    v32[1] = v23;
    v32[2] = v30;
    long long v24 = [(NotesDisplayController *)self shareNavBarButtonItem];
    v32[3] = v24;
    v32[4] = v29;
    long long v25 = [(NotesDisplayController *)self deleteNavBarButtonItem];
    v32[5] = v25;
    long long v26 = +[NSArray arrayWithObjects:v32 count:6];
    v27 = self->_actionButtonItemsForNavBar;
    self->_actionButtonItemsForNavBar = v26;

    [(NotesDisplayController *)self applyAccessibilityInfo];
    BOOL v3 = self->_actionButtonItemsForNavBar;
  }

  return v3;
}

- (BOOL)wantsButtonsInToolbar
{
  id v2 = [(NotesDisplayController *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == (id)1;

  return v3;
}

- (void)updateToolbarButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NotesDisplayController *)self wantsButtonsInToolbar])
  {
    id v7 = [(NotesDisplayController *)self actionButtonItemsForToolbar];
  }
  else
  {
    id v7 = 0;
  }
  id v5 = [(NotesDisplayController *)self toolbarItems];
  if ([v7 isEqual:v5])
  {

    goto LABEL_10;
  }
  if (v7)
  {
  }
  else
  {
    id v6 = [(NotesDisplayController *)self toolbarItems];

    if (!v6) {
      goto LABEL_10;
    }
  }
  [(NotesDisplayController *)self setToolbarItems:v7 animated:v3];
LABEL_10:
}

- (void)updateNavigationBarLeftButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NotesDisplayController *)self viewControllerManager];
  if ([v5 isAuxiliary])
  {
  }
  else
  {
    id v6 = [(NotesDisplayController *)self ic_viewControllerManager];
    unsigned int v7 = [v6 isAuxiliary];

    if (!v7) {
      return;
    }
  }
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    id v9 = [(NotesDisplayController *)self navigationItem];
    id v8 = [(NotesDisplayController *)self closeAuxiliaryWindowButton];
    [v9 setLeftBarButtonItem:v8 animated:v3];
  }
}

- (void)updateNavigationBarRightButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = +[NSMutableArray array];
  if ([(NotesDisplayController *)self isEditing]
    && (+[UIDevice ic_isVision] & 1) == 0)
  {
    id v5 = [(NotesDisplayController *)self doneButtonItem];
    [v11 addObject:v5];
  }
  if (![(NotesDisplayController *)self wantsButtonsInToolbar])
  {
    id v6 = [(NotesDisplayController *)self actionButtonItemsForNavBar];
    [v11 addObjectsFromArray:v6];
  }
  unsigned int v7 = [(NotesDisplayController *)self navigationItem];
  id v8 = [v7 rightBarButtonItems];
  if (([v11 isEqual:v8] & 1) == 0)
  {
    if (v11)
    {
    }
    else
    {
      id v9 = [(NotesDisplayController *)self navigationItem];
      id v10 = [v9 rightBarButtonItems];

      if (!v10) {
        goto LABEL_12;
      }
    }
    unsigned int v7 = [(NotesDisplayController *)self navigationItem];
    id v8 = [v11 copy];
    [v7 setRightBarButtonItems:v8 animated:v3];
  }

LABEL_12:
}

- (void)updateBarsVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NotesDisplayController *)self toolbarItems];
  BOOL v6 = [v5 count] == 0;

  id v7 = [(NotesDisplayController *)self navigationController];
  [v7 setToolbarHidden:v6 animated:v3];
}

- (void)addButtonClicked:(id)a3
{
  if (![(NotesDisplayController *)self isEditing]
    || [(NotesDisplayController *)self noteContainsValuableContent])
  {
    id v5 = [(NotesDisplayController *)self viewControllerManager];
    id v4 = [v5 showNewNoteWithApproach:2 sender:self animated:1];
  }
}

- (void)doneButtonClicked:(id)a3
{
}

- (void)accessibilityLargeTextDidChange
{
}

- (void)resetFontOnResume
{
}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = [(NotesDisplayController *)self backgroundView];
  [v8 updateContentViewBezelsStandalone:v7 needsAdditionalBottomMargin:v6 needsAdditionalLeadingMargin:v5 force:0];
}

- (void)noteContentLayer:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6
{
}

- (id)noteContentLayer:(id)a3 createAttachmentPresentationWithData:(id)a4 mimeType:(id)a5 filename:(id)a6
{
  return [(NotesDisplayController *)self newlyCreatedAttachmentPresentationWithData:a4 mimeType:a5 preferredFilename:a6];
}

- (BOOL)canInsertImagesInNoteContentLayer:(id)a3
{
  unsigned __int8 v3 = [(NotesDisplayController *)self allowsAttachments];
  char v4 = v3 & +[UIImagePickerController isSourceTypeAvailable:0];
  BOOL v5 = +[UIImagePickerController availableMediaTypesForSourceType:0];
  BOOL v6 = [UTTypeImage identifier];
  char v7 = v4 & [v5 containsObject:v6];

  return v7;
}

- (void)insertImageInNoteContentLayer:(id)a3
{
  id v4 = objc_alloc_init((Class)UIImagePickerController);
  [v4 setDelegate:self];
  BOOL v5 = [UTTypeImage identifier];
  uint64_t v13 = v5;
  BOOL v6 = +[NSArray arrayWithObjects:&v13 count:1];
  [v4 setMediaTypes:v6];

  [v4 setAllowsEditing:0];
  id v7 = objc_alloc((Class)NSMutableDictionary);
  id v8 = [v4 _properties];
  id v9 = [v7 initWithDictionary:v8];

  [v9 setObject:kCFBooleanTrue forKey:_UIImagePickerControllerViewImageBeforeSelecting];
  [v4 _setProperties:v9];
  [v4 _setImagePickerSavingOptions:6];
  [(NotesDisplayController *)self setPickerController:v4];
  [(NotesDisplayController *)self setPickingAttachment:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100113808;
  v11[3] = &unk_10062A450;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(NotesDisplayController *)self getPickerPopoverSourceRectWithCompletion:v11];
}

- (void)getPickerPopoverSourceRectWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NotesDisplayController *)self contentLayer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100113A40;
  v7[3] = &unk_10062A4A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getRectForSelectionWithCompletion:v7];
}

- (void)dismissPickerControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(NotesDisplayController *)self isPickingAttachment])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100113CDC;
    v5[3] = &unk_100625B40;
    void v5[4] = self;
    id v6 = v4;
    [(NotesDisplayController *)self dismissViewControllerAnimated:1 completion:v5];
  }
}

- (void)didDismissPickerController
{
  if ([(NotesDisplayController *)self isPickingAttachment])
  {
    unsigned __int8 v3 = [(NotesDisplayController *)self contentLayer];
    id v4 = [v3 noteHTMLEditorView];
    [v4 startEditing];

    [(NotesDisplayController *)self setPickingAttachment:0];
    [(NotesDisplayController *)self setPickerController:0];
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v5 = _UIImagePickerControllerOriginalImageData;
  id v6 = a4;
  id v7 = [v6 objectForKey:v5];
  id v8 = [v6 objectForKey:UIImagePickerControllerPHAsset];

  id v9 = [v8 filename];
  id v10 = [v9 pathExtension];

  +[WebMIMETypeRegistry mimeTypeForExtension:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100113F10;
  v14[3] = &unk_100625A78;
  v14[4] = self;
  id v15 = v7;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v8;
  id v11 = v8;
  id v12 = v16;
  id v13 = v7;
  [(NotesDisplayController *)self dismissPickerControllerWithCompletionHandler:v14];
}

- (void)showActionsForAttachmentPresentation:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(NotesDisplayController *)self setEditing:0 animated:1];
  id v8 = [v7 dataFileURL];
  id v9 = +[UIPrintInfo printInfo];
  id v10 = [v7 filename];
  [v9 setJobName:v10];

  [v9 setOutputType:1];
  id v11 = [v7 sourceIsManaged];

  v24[0] = v8;
  v24[1] = v9;
  id v12 = +[NSArray arrayWithObjects:v24 count:2];
  id v13 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v12 applicationActivities:&__NSArray0__struct];
  v23[0] = UIActivityTypeOpenInIBooks;
  v23[1] = ICActivityTypeShareToNote;
  v23[2] = UIActivityTypeSharePlay;
  id v14 = +[NSArray arrayWithObjects:v23 count:3];
  [v13 setExcludedActivityTypes:v14];

  [v13 setIsContentManaged:v11];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10011427C;
  v22[3] = &unk_100627F08;
  v22[4] = self;
  [v13 setCompletionWithItemsHandler:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100114284;
  v21[3] = &unk_10062A4C8;
  v21[4] = self;
  [v13 setCompletionHandler:v21];
  if (+[UIDevice ic_isVision]) {
    uint64_t v15 = -2;
  }
  else {
    uint64_t v15 = 7;
  }
  [v13 setModalPresentationStyle:v15];
  [(NotesDisplayController *)self presentViewController:v13 animated:1 completion:0];
  id v16 = [v13 popoverPresentationController];
  [(NotesDisplayController *)self setActivityPresentationController:v16];
  id v17 = [(NotesDisplayController *)self view];
  [v17 safeAreaInsets];
  double v19 = v18;

  [v16 setSourceRect:CGRectMake(x, y + v19, 0.0, 0.0)];
  long long v20 = [(NotesDisplayController *)self webView];
  [v16 setSourceView:v20];

  [v16 setPermittedArrowDirections:15];
}

- (void)didDismissActivityController
{
}

- (CGRect)rectForAttachmentPresentationOccurence:(id)a3 inView:(id *)a4
{
  id v6 = [a3 element];
  id v7 = [(NotesDisplayController *)self contentLayer];
  [v7 rectForDOMNode:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (a4)
  {
    *a4 = [(NotesDisplayController *)self contentLayer];
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGPoint)pointRelativeToRect:(CGRect)a3 fromContentLayerPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v10 = CGPointZero.x;
    double v11 = CGPointZero.y;
  }
  else
  {
    double v10 = (x - v9) / width;
    double v11 = (y - v8) / height;
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)contentLayerPointFromPoint:(CGPoint)a3 relativeToRect:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)occurenceForPreviewItem:(id)a3 hintIndex:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 presentation];
    id v8 = [v7 sourceIsManaged];
  }
  else
  {
    id v8 = 0;
  }
  double v9 = [(NotesDisplayController *)self attachmentPresentationOccurencesForPreviewingWithManagedInterface:v8];
  if ((unint64_t)[v9 count] > a4)
  {
    double v10 = [v9 objectAtIndexedSubscript:a4];
    double v11 = [v6 previewItemURL];
    double v12 = [v10 previewItemURL];
    unsigned __int8 v13 = [v12 isEqual:v11];

    if (v13) {
      goto LABEL_8;
    }
  }
  double v10 = 0;
LABEL_8:

  return v10;
}

- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  double v11 = -[NotesDisplayController occurenceForPreviewItem:hintIndex:](self, "occurenceForPreviewItem:hintIndex:", v10, [v9 currentPreviewItemIndex]);

  if (v11)
  {
    double v12 = [v11 presentation];
    unsigned int v13 = [v12 sourceIsManaged];
    if (v9 && v13)
    {
      unsigned __int8 v14 = [v9 isContentManaged];

      if ((v14 & 1) == 0) {
        NSLog(@"Error: Managed preview item is displayed in a non-managed preview controller %@", v11);
      }
    }
    else
    {
    }
    [(NotesDisplayController *)self rectForAttachmentPresentationOccurence:v11 inView:a5];
    CGFloat x = v19;
    CGFloat y = v20;
    CGFloat width = v21;
    CGFloat height = v22;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (id)notesQuickLookActivityItem:(id)a3 transitionImageForPreviewItem:(id)a4 previewController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = -[NotesDisplayController occurenceForPreviewItem:hintIndex:](self, "occurenceForPreviewItem:hintIndex:", v8, [v7 currentPreviewItemIndex]);

  if (v9)
  {
    id v10 = [v9 presentation];
    unsigned int v11 = [v10 sourceIsManaged];
    if (v7 && v11)
    {
      unsigned __int8 v12 = [v7 isContentManaged];

      if ((v12 & 1) == 0) {
        NSLog(@"Error: Managed preview item is displayed in a non-managed preview controller %@", v9);
      }
    }
    else
    {
    }
    unsigned __int8 v14 = [v9 presentation];
    id v18 = 0;
    unsigned int v15 = [v14 getPresentationData:&v18 mimeType:0 error:0];
    id v16 = v18;

    unsigned int v13 = 0;
    if (v15)
    {
      unsigned int v13 = +[UIImage imageWithData:v16];
    }
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)noteActivityItemsForSharing
{
  double v21 = [(NotesDisplayController *)self printFormatter];
  unsigned __int8 v3 = [(NotesDisplayController *)self note];
  unsigned int v4 = [v3 isPlainText];

  double v22 = +[UIPrintInfo printInfo];
  if (v4) {
    [v22 setOutputType:2];
  }
  double v5 = [(NoteObject *)self->_note title];
  [v22 setJobName:v5];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc((Class)ICNoteLinkPresentationActivityItemSource);
  id v8 = [(NotesDisplayController *)self note];
  id v9 = [v7 initWithNote:v8];

  [v6 addObject:v9];
  objc_initWeak(&location, self);
  id v10 = objc_alloc((Class)ICAirDropNoteActivityItemSource);
  unsigned int v11 = [(NoteObject *)self->_note title];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100114A30;
  void v23[3] = &unk_10062A4F0;
  objc_copyWeak(&v24, &location);
  id v12 = [v10 initWithTitle:v11 airDropDocumentCreator:v23];

  if (v12) {
    [v6 addObject:v12];
  }
  id v13 = objc_alloc((Class)ICLegacyNoteStringActivityItemSource);
  unsigned __int8 v14 = [(NoteObject *)self->_note title];
  unsigned int v15 = [(NoteObject *)self->_note content];
  id v16 = [(NoteObject *)self->_note contentAsPlainText];
  id v17 = [v13 initWithTitle:v14 content:v15 plainText:v16];

  if (v17) {
    [v6 addObject:v17];
  }
  v26[0] = v22;
  v26[1] = v21;
  id v18 = +[NSArray arrayWithObjects:v26 count:2];
  [v6 addObjectsFromArray:v18];

  id v19 = [v6 copy];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

- (UIPrintFormatter)printFormatter
{
  unsigned __int8 v3 = [(NotesDisplayController *)self note];
  unsigned int v4 = [v3 isPlainText];

  if (v4)
  {
    id v5 = objc_alloc((Class)UISimpleTextPrintFormatter);
    id v6 = [(NotesDisplayController *)self contentLayer];
    id v7 = [v6 noteHTMLEditorView];
    id v8 = [v7 text];
    id v9 = [v5 initWithText:v8];

    id v10 = +[UIFont ic_preferredFontForBodyText];
    [v9 setFont:v10];

    [v9 setPerPageContentInsets:36.0, 36.0, 36.0, 36.0];
  }
  else
  {
    unsigned int v11 = [(NotesDisplayController *)self contentLayer];
    id v9 = [v11 viewPrintFormatter];
  }

  return (UIPrintFormatter *)v9;
}

- (void)shareButtonClicked:(id)a3
{
  if ([(NotesDisplayController *)self isEditing]) {
    [(NotesDisplayController *)self setEditing:0 animated:1];
  }
  [(NotesDisplayController *)self stopTextFinding];
  if (ICDebugModeEnabled())
  {
    id v4 = objc_alloc((Class)ICChangeDatesActivity);
    id v5 = [(NotesDisplayController *)self note];
    id v6 = [v4 initWithObject:v5 activityType:0];

    id v7 = [NotesActivityViewController alloc];
    id v8 = [(NotesDisplayController *)self noteActivityItemsForSharing];
    id v9 = [(NotesDisplayController *)self textFindingActivity];
    v22[0] = v9;
    v22[1] = v6;
    id v10 = +[NSArray arrayWithObjects:v22 count:2];
    unsigned int v11 = [(NotesActivityViewController *)v7 initWithActivityItems:v8 applicationActivities:v10];
  }
  else
  {
    id v12 = [NotesActivityViewController alloc];
    id v6 = [(NotesDisplayController *)self noteActivityItemsForSharing];
    id v8 = [(NotesDisplayController *)self textFindingActivity];
    double v21 = v8;
    id v9 = +[NSArray arrayWithObjects:&v21 count:1];
    unsigned int v11 = [(NotesActivityViewController *)v12 initWithActivityItems:v6 applicationActivities:v9];
  }

  v20[0] = UIActivityTypeOpenInIBooks;
  v20[1] = ICActivityTypeShareToNote;
  v20[2] = UIActivityTypeSharePlay;
  id v13 = +[NSArray arrayWithObjects:v20 count:3];
  [(NotesActivityViewController *)v11 setExcludedActivityTypes:v13];

  [(NotesActivityViewController *)v11 setDisplayController:self];
  unsigned __int8 v14 = [(NoteObject *)self->_note store];
  unsigned int v15 = [v14 account];
  -[NotesActivityViewController setIsContentManaged:](v11, "setIsContentManaged:", [v15 isManaged]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100114EF4;
  v19[3] = &unk_100627F08;
  v19[4] = self;
  [(NotesActivityViewController *)v11 setCompletionWithItemsHandler:v19];
  [(NotesDisplayController *)self prepareForBarSourcedPopoverPresentation];
  if (+[UIDevice ic_isVision]) {
    uint64_t v16 = -2;
  }
  else {
    uint64_t v16 = 7;
  }
  [(NotesActivityViewController *)v11 setModalPresentationStyle:v16];
  [(NotesDisplayController *)self presentViewController:v11 animated:1 completion:0];
  id v17 = [(NotesActivityViewController *)v11 popoverPresentationController];
  id v18 = [(NotesDisplayController *)self shareButtonItem];
  [v17 setBarButtonItem:v18];

  [v17 setPermittedArrowDirections:3];
}

- (id)textFindingActivity
{
  id v2 = [[ICHTMLFindInNoteUIActivity alloc] initWithDelegate:self];

  return v2;
}

- (void)performFindInNote:(id)a3
{
  id v4 = [(NotesDisplayController *)self webView];
  unsigned __int8 v3 = [v4 _findInteraction];
  [v3 presentFindNavigatorShowingReplace:0];
}

- (void)performReplaceInNote:(id)a3
{
  id v4 = [(NotesDisplayController *)self webView];
  unsigned __int8 v3 = [v4 _findInteraction];
  [v3 presentFindNavigatorShowingReplace:1];
}

- (void)performFindInNoteUIActivity:(id)a3
{
  id v6 = a3;
  id v4 = [(NotesDisplayController *)self webView];
  id v5 = [v4 _findInteraction];
  [v5 presentFindNavigatorShowingReplace:0];

  [v6 activityDidFinish:1];
}

- (void)stopTextFinding
{
  unsigned __int8 v3 = [(NotesDisplayController *)self webView];
  id v4 = [v3 _findInteraction];
  unsigned int v5 = [v4 isFindNavigatorVisible];

  if (v5)
  {
    id v7 = [(NotesDisplayController *)self webView];
    id v6 = [v7 _findInteraction];
    [v6 dismissFindNavigator];
  }
}

- (id)noteHTMLEditorView
{
  id v2 = [(NotesDisplayController *)self contentLayer];
  unsigned __int8 v3 = [v2 noteHTMLEditorView];

  return v3;
}

- (id)webView
{
  id v2 = [(NotesDisplayController *)self contentLayer];
  unsigned __int8 v3 = [v2 noteHTMLEditorView];
  id v4 = [v3 webView];

  return v4;
}

- (UIScrollView)scrollView
{
  id v2 = [(NotesDisplayController *)self contentLayer];
  unsigned __int8 v3 = [v2 noteHTMLEditorView];
  id v4 = [v3 webView];
  unsigned int v5 = [v4 scrollView];

  return (UIScrollView *)v5;
}

- (void)deleteButtonClicked:(id)a3
{
  id v4 = a3;
  if ([(NotesDisplayController *)self isEditing]) {
    [(NotesDisplayController *)self setEditing:0 animated:1];
  }
  if ([(NotesDisplayController *)self noteShouldBeDiscarded])
  {
    [(NotesDisplayController *)self setIsUpdatingNoteContent:1];
    unsigned int v5 = [(NotesDisplayController *)self delegate];
    id v6 = [(NotesDisplayController *)self note];
    [v5 noteDisplayController:self deleteNote:v6 actionOrigin:1];

    [(NotesDisplayController *)self setIsUpdatingNoteContent:0];
  }
  else
  {
    id v7 = [(NotesDisplayController *)self note];
    id v8 = [ICDeleteDecisionController alloc];
    id v17 = v7;
    id v9 = +[NSArray arrayWithObjects:&v17 count:1];
    id v10 = [(NotesDisplayController *)self view];
    unsigned int v11 = [v10 window];
    id v12 = [(NotesDisplayController *)self eventReporter];
    id v13 = [(ICDeleteDecisionController *)v8 initWithSourceObjects:v9 window:v11 sender:v4 eventReporter:v12];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001154E0;
    v15[3] = &unk_100628010;
    v15[4] = self;
    id v16 = v7;
    id v14 = v7;
    [(ICDeleteDecisionController *)v13 performDecisionWithCompletion:v15];
  }
}

- (void)didDismissDeleteAlertController
{
  [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
  [(NotesDisplayController *)self cleanupAfterBarSourcedPopoverPresentation];

  [(NotesDisplayController *)self setDeletePresentationController:0];
}

- (void)setPerformingDeleteAnimation:(BOOL)a3
{
  if (self->_performingDeleteAnimation != a3)
  {
    self->_performingDeleteAnimation = a3;
    [(NotesDisplayController *)self setUserInteractionEnabled:!a3];
  }
}

- (void)animateDeleteTransitionWithCompletion:(id)a3
{
  id v4 = a3;
  [(NotesDisplayController *)self setPerformingDeleteAnimation:1];
  unsigned int v5 = [(NotesDisplayController *)self view];
  id v6 = [v5 superview];

  id v7 = [(NotesDisplayController *)self contentLayer];
  id v8 = [v7 snapshotViewAfterScreenUpdates:0];

  [v6 addSubview:v8];
  id v9 = [(NotesDisplayController *)self backgroundView];
  [v9 setContentViewVisible:0];

  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001157E4;
  v18[3] = &unk_10062A518;
  BOOL v22 = IsReduceMotionEnabled;
  id v11 = v8;
  id v19 = v11;
  double v20 = self;
  id v12 = v4;
  id v21 = v12;
  id v13 = objc_retainBlock(v18);
  id v14 = v13;
  if (IsReduceMotionEnabled)
  {
    ((void (*)(void *))v13[2])(v13);
  }
  else
  {
    id v23 = v11;
    unsigned int v15 = +[NSArray arrayWithObjects:&v23 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001159C4;
    v16[3] = &unk_100626248;
    id v17 = v14;
    +[UIView performSystemAnimation:0 onViews:v15 options:0 animations:0 completion:v16];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && [(NotesDisplayController *)self isEditing]) {
    [(NotesDisplayController *)self setEditing:0 animated:0];
  }
  unsigned int v5 = [(NotesDisplayController *)self navigationController];
  id v6 = [v5 navigationBar];
  [v6 setUserInteractionEnabled:v3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(NotesDisplayController *)self navigationController];
  id v8 = [v7 navigationBar];
  id v9 = [v8 subviews];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v14 setUserInteractionEnabled:v3];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  unsigned int v15 = [(NotesDisplayController *)self navigationController];
  id v16 = [v15 toolbar];
  [v16 setUserInteractionEnabled:v3];
}

- (void)prepareForBarSourcedPopoverPresentation
{
}

- (void)cleanupAfterBarSourcedPopoverPresentation
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v9 = a3;
  id v4 = [(NotesDisplayController *)self activityPresentationController];

  if (v4 == v9)
  {
    [(NotesDisplayController *)self didDismissActivityController];
  }
  else
  {
    unsigned int v5 = [v9 presentedViewController];
    id v6 = [(NotesDisplayController *)self pickerController];

    if (v5 == v6)
    {
      [(NotesDisplayController *)self didDismissPickerController];
    }
    else
    {
      id v7 = [(NotesDisplayController *)self deletePresentationController];

      id v8 = v9;
      if (v7 != v9) {
        goto LABEL_8;
      }
      [(NotesDisplayController *)self didDismissDeleteAlertController];
    }
  }
  id v8 = v9;
LABEL_8:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(NotesDisplayController *)self isEditing] != a3)
  {
    if (v5)
    {
      id v7 = [(NotesDisplayController *)self delegate];
      unsigned __int8 v8 = [v7 canBeginEditingForNoteDisplayController:self];

      if ((v8 & 1) == 0)
      {
        id v16 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1004DC960(v16);
        }
        goto LABEL_19;
      }
      [(NotesDisplayController *)self turnOnContentLengthTrackingIfNeeded];
    }
    else
    {
      id v9 = [(NotesDisplayController *)self contentLayer];
      [v9 setTracksMaximumContentLength:0];
    }
    v17.receiver = self;
    v17.super_class = (Class)NotesDisplayController;
    [(NotesDisplayController *)&v17 setEditing:v5 animated:v4];
    if (v5)
    {
      [(NotesDisplayController *)self setIsRespondingToStartEditing:1];
      [(NotesDisplayController *)self rememberNoteContentForEditingIntent];
    }
    else
    {
      [(NotesDisplayController *)self setIsRespondingToEndEditing:1];
      id v10 = [(NotesDisplayController *)self contentLayer];
      id v11 = [v10 noteHTMLEditorView];
      [v11 stopEditing];

      [(NotesDisplayController *)self invalidateAutosaveTimer];
      [(NotesDisplayController *)self saveNote];
      [(NotesDisplayController *)self donateEditingIntentIfNecessary];
    }
    if ([(NotesDisplayController *)self isViewLoaded]
      && [(NotesDisplayController *)self isVisible])
    {
      if (v5)
      {
        uint64_t v12 = [(NotesDisplayController *)self contentLayer];
        id v13 = [v12 noteHTMLEditorView];
        [v13 startEditing];
      }
    }
    else if (v5)
    {
      [(NotesDisplayController *)self setStartEditingAfterViewAppears:1];
    }
    [(NotesDisplayController *)self updateBarButtonItemsAnimated:v4];
    [(NotesDisplayController *)self updateDate];
    [(NotesDisplayController *)self updateNoteUserActivityState];
    [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
    if ([(NotesDisplayController *)self isEditing])
    {
      id v14 = [(NotesDisplayController *)self delegate];
      unsigned int v15 = [(NotesDisplayController *)self note];
      [v14 noteDisplayController:self beginEditingNote:v15 animated:v4];

      id v16 = +[NSNotificationCenter defaultCenter];
      [v16 postNotificationName:ICNoteEditorViewControllerDidStartEditingNotification object:self];
LABEL_19:
    }
  }
}

- (void)rememberNoteContentForEditingIntent
{
  BOOL v3 = [(NotesDisplayController *)self note];
  BOOL v4 = [v3 contentAsPlainTextPreservingNewlines];
  [(NotesDisplayController *)self setOriginalPlainTextNoteContent:v4];

  id v5 = [(NotesDisplayController *)self originalPlainTextNoteContent];
  -[NotesDisplayController setIsEditingNewNote:](self, "setIsEditingNewNote:", [v5 length] == 0);
}

- (void)donateEditingIntentIfNecessary
{
  BOOL v3 = [(NotesDisplayController *)self note];
  BOOL v4 = [v3 contentAsPlainTextPreservingNewlines];
  id v5 = [v4 length];

  if (v5)
  {
    if ([(NotesDisplayController *)self isEditingNewNote])
    {
      id v6 = [(NotesDisplayController *)self note];
      id v7 = +[ICIntentsUtilities interactionForCreateNote:v6];
      +[ICIntentsUtilities donateInteraction:v7];
      goto LABEL_4;
    }
    unsigned __int8 v8 = [(NotesDisplayController *)self originalPlainTextNoteContent];

    if (v8)
    {
      id v9 = [(NotesDisplayController *)self note];
      id v6 = [v9 contentAsPlainTextPreservingNewlines];

      id v10 = [(NotesDisplayController *)self originalPlainTextNoteContent];
      unsigned int v11 = [v6 hasPrefix:v10];

      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v12 = [(NotesDisplayController *)self originalPlainTextNoteContent];
      id v7 = [v6 substringFromIndex:[v12 length]];

      if ([v7 hasPrefix:@"\n"])
      {
        uint64_t v13 = [v7 substringFromIndex:1];

        id v14 = [(NotesDisplayController *)self note];
        unsigned int v15 = +[ICIntentsUtilities interactionForAppendToNote:v14 withAppendedText:v13];
        +[ICIntentsUtilities donateInteraction:v15];

        id v7 = (void *)v13;
      }
LABEL_4:

LABEL_5:
    }
  }
  [(NotesDisplayController *)self setIsEditingNewNote:0];

  [(NotesDisplayController *)self setOriginalPlainTextNoteContent:0];
}

- (id)noteIdentifierForNoteContentLayer:(id)a3
{
  BOOL v3 = [(NotesDisplayController *)self note];
  BOOL v4 = [v3 identifier];

  return v4;
}

- (BOOL)isNoteManagedForNoteContentLayer:(id)a3
{
  return [(NotesDisplayController *)self noteIsManaged];
}

- (BOOL)noteContentLayerShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4
{
  if (+[UIApplication shouldMakeUIForDefaultPNG])return 0; {
  [(NotesDisplayController *)self stopTextFinding];
  }
  id v5 = [(NotesDisplayController *)self note];

  if (!v5) {
    return 0;
  }
  id v6 = [(NotesDisplayController *)self presentedViewController];

  if (v6) {
    return 0;
  }
  unsigned __int8 v8 = [(NotesDisplayController *)self delegate];
  unsigned __int8 v9 = [v8 canBeginEditingForNoteDisplayController:self];

  return v9;
}

- (void)noteContentLayerContentWillChange:(id)a3
{
}

- (void)noteContentLayerContentDidChange:(id)a3 updatedTitle:(BOOL)a4 fromDrop:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(NotesDisplayController *)self setIsUpdatingNoteContent:0];
  [(NotesDisplayController *)self resetAutosaveTimer];
  [(NotesDisplayController *)self setContentHasUnsavedChanges:1];
  id v12 = +[NSDate ic_modificationDateForNoteBeingEdited];
  unsigned __int8 v8 = [(NotesDisplayController *)self note];
  unsigned __int8 v9 = [v8 modificationDate];
  unsigned __int8 v10 = [v9 isEqual:v12];

  if ((v10 & 1) == 0)
  {
    unsigned int v11 = [(NotesDisplayController *)self note];
    [v11 setModificationDate:v12];
  }
  if (v6)
  {
    [(NotesDisplayController *)self updateNoteTitle];
    [(NotesDisplayController *)self updateNoteProviderStatus];
    [(NotesDisplayController *)self updateNoteUserActivityState];
  }
  [(NotesDisplayController *)self updateBarButtonItemsAnimated:0];
  if (v5) {
    [(NotesDisplayController *)self saveNote];
  }
}

- (BOOL)noteContentLayer:(id)a3 acceptStringIncreasingContentLength:(id)a4
{
  id v5 = a4;
  if ([(NotesDisplayController *)self noteHasSizeLimit])
  {
    BOOL v6 = [v5 dataUsingEncoding:4];
    id v7 = (char *)[v6 length];

    BOOL v8 = [(NotesDisplayController *)self acceptNewSize:&v7[[(NotesDisplayController *)self estimatedSizeOfDisplayedContent]]];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)noteContentLayer:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    if ([(NotesDisplayController *)self isRespondingToStartEditing])
    {
      [(NotesDisplayController *)self setIsRespondingToStartEditing:0];
      goto LABEL_10;
    }
  }
  else if ([(NotesDisplayController *)self isRespondingToEndEditing])
  {
LABEL_9:
    [(NotesDisplayController *)self setIsRespondingToEndEditing:0];
    goto LABEL_10;
  }
  if ([(NotesDisplayController *)self isEditing] != v6
    && ![(NotesDisplayController *)self isPickingAttachment]
    && ![(NotesDisplayController *)self isChangingTraitCollection])
  {
    [(NotesDisplayController *)self setEditing:v6 animated:v5];
    [(NotesDisplayController *)self setIsRespondingToStartEditing:0];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)noteContentLayer:(id)a3 willHitTestWithEvent:(id)a4
{
  id v19 = a4;
  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  if (+[ICDeviceSupport deviceSupportsPencil])
  {
    BOOL v6 = [(NotesDisplayController *)self presentedViewController];
    if (v6)
    {
LABEL_3:

      goto LABEL_10;
    }
    if (([v5 BOOLForKey:@"hasShownPencilUnsupportedAlertForHTMLNote"] & 1) == 0)
    {
      if ([v19 _hidEvent])
      {
        CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
        if (Children)
        {
          CFArrayRef v8 = Children;
          if (CFArrayGetCount(Children))
          {
            CFArrayGetValueAtIndex(v8, 0);
            [v19 _hidEvent];
            if (IOHIDEventGetType() == 11 && !IOHIDEventGetIntegerValue())
            {
              unsigned __int8 v9 = +[NSBundle mainBundle];
              BOOL v6 = [v9 localizedStringForKey:@"Drawing Not Supported" value:&stru_10063F3D8 table:0];

              unsigned __int8 v10 = +[NSBundle mainBundle];
              long long v18 = [v10 localizedStringForKey:@"Drawing using Apple Pencil is only supported on notes in your iCloud or On My iPad accounts." value:&stru_10063F3D8 table:0];

              unsigned int v11 = +[UIAlertController alertControllerWithTitle:v6 message:v18 preferredStyle:1];
              id v12 = +[NSBundle mainBundle];
              uint64_t v13 = [v12 localizedStringForKey:@"OK" value:&stru_10063F3D8 table:0];
              id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

              [v11 addAction:v14];
              unsigned int v15 = +[NSBundle mainBundle];
              id v16 = [v15 localizedStringForKey:@"Settings" value:&stru_10063F3D8 table:0];
              objc_super v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&stru_10062A538];

              [v11 addAction:v17];
              [v5 setBool:1 forKey:@"hasShownPencilUnsupportedAlertForHTMLNote"];
              [(NotesDisplayController *)self presentViewController:v11 animated:1 completion:0];

              goto LABEL_3;
            }
          }
        }
      }
    }
  }
LABEL_10:
}

- (BOOL)noteContentLayer:(id)a3 acceptContentsFromItemProviders:(id)a4
{
  if (![(NotesDisplayController *)self noteHasSizeLimit]) {
    return 1;
  }
  BOOL v5 = (char *)[(NotesDisplayController *)self estimatedSizeOfDisplayedContent]
     + 1000000;

  return [(NotesDisplayController *)self acceptNewSize:v5];
}

- (BOOL)noteContentLayer:(id)a3 acceptContentsFromPasteboard:(id)a4
{
  id v5 = a4;
  if ([(NotesDisplayController *)self noteHasSizeLimit])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v6 = [v5 ic_dataForPasteboardTypes:0, 0];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 += (uint64_t)[*(id *)(*((void *)&v14 + 1) + 8 * i) ic_lengthAsMIMEAttachment];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    BOOL v12 = [(NotesDisplayController *)self acceptNewSize:(char *)[(NotesDisplayController *)self estimatedSizeOfDisplayedContent]+ v9];
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)noteContentLayer:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(NotesDisplayController *)self attachmentPresentations];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = [v14 contentID];
        unsigned int v16 = [v15 isEqualToString:v8];

        if (v16)
        {
          -[NotesDisplayController showActionsForAttachmentPresentation:atPoint:](self, "showActionsForAttachmentPresentation:atPoint:", v14, x, y);
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)noteContentLayer:(id)a3 openURL:(id)a4
{
  id v4 = a4;
  id v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)noteContentLayer:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4
{
  id v5 = (void *)qword_1006AA300;
  BOOL v6 = +[NSNumber numberWithInteger:a4];
  id v9 = [v5 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v7 = [(NotesDisplayController *)self eventReporter];
    id v8 = [(NotesDisplayController *)self note];
    [v7 submitNoteEditorCallOutBarButtonSelectionEventForHTMLNote:v8 buttonTypeValue:[v9 integerValue]];
  }
}

- (void)noteContentLayer:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4
{
  id v5 = (void *)qword_1006AA308;
  BOOL v6 = +[NSNumber numberWithInteger:a4];
  id v9 = [v5 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v7 = [(NotesDisplayController *)self eventReporter];
    id v8 = [(NotesDisplayController *)self note];
    [v7 submitStyleFormatEventForHTMLNote:v8 styleTypeValue:[v9 integerValue]];
  }
}

- (id)noteContentLayer:(id)a3 updateAttachments:(id)a4
{
  id v4 = a4;
  id v62 = +[NSMutableDictionary dictionary];
  id v5 = +[NSMutableDictionary dictionary];
  BOOL v6 = +[NSMutableArray array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v76;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = +[NSURL URLWithString:*(void *)(*((void *)&v75 + 1) + 8 * i)];
        uint64_t v12 = [v11 resourceSpecifier];

        if (v12)
        {
          uint64_t v13 = [v5 allKeys];
          long long v14 = [v11 resourceSpecifier];
          unsigned int v15 = [v13 containsObject:v14];

          if (v15) {
            [v6 addObject:v11];
          }
          unsigned int v16 = [v11 resourceSpecifier];
          [v5 setObject:v11 forKeyedSubscript:v16];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
    }
    while (v8);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v17 = [(NotesDisplayController *)self note];
  long long v18 = [v17 attachments];

  id v19 = [v18 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v72;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
        id v24 = [v23 contentID];

        if (v24)
        {
          double v25 = [v23 contentID];
          double v26 = +[NSString ic_newURLForContentID:v25 percentEscaped:0];

          v27 = [v23 contentID];
          [v5 removeObjectForKey:v27];

          [v6 removeObject:v26];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v20);
  }

  v28 = [v5 allValues];
  id v29 = [v28 arrayByAddingObjectsFromArray:v6];

  id v30 = +[NSSet setWithArray:v29];
  if ([v30 count])
  {
    id v31 = [(NotesDisplayController *)self note];
    v57 = [v31 managedObjectContext];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v56 = v30;
    id v32 = v30;
    id v65 = [v32 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v65)
    {
      v55 = v29;
      char v33 = 0;
      uint64_t v34 = *(void *)v68;
      v60 = v6;
      v61 = v5;
      uint64_t v58 = *(void *)v68;
      id v59 = v32;
      do
      {
        for (k = 0; k != v65; k = (char *)k + 1)
        {
          if (*(void *)v68 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v67 + 1) + 8 * (void)k);
          v37 = [v36 scheme];
          unsigned int v38 = [v37 isEqualToString:@"cid"];

          if (v38)
          {
            id v39 = [v36 resourceSpecifier];
            id v40 = [(NotesDisplayController *)self noteAttachmentObjectWithContentID:v39];

            if (v40)
            {
              id v66 = 0;
              long long v41 = [v40 attachmentDataWithError:&v66];
              id v42 = v66;
              if (v42)
              {
                long long v43 = os_log_create("com.apple.notes", "UI");
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v80 = v36;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not load attachment data for attachment %@", buf, 0xCu);
                }
              }
              long long v44 = +[NotesApp sharedNotesApp];
              v45 = [v44 noteContext];

              v46 = +[ICLegacyContentUtilities generateContentID];
              v47 = [v40 mimeType];
              v48 = [v40 filename];
              v49 = +[ICLegacyContentUtilities createAttachmentWithContentID:v46 mimeType:v47 data:v41 filename:v48 inContext:v45];

              v50 = [(NotesDisplayController *)self note];
              [v50 addAttachmentsObject:v49];

              v51 = [v49 cidURL];
              v52 = [v51 absoluteString];
              v53 = [v36 absoluteString];
              [v62 setObject:v52 forKeyedSubscript:v53];

              char v33 = 1;
              BOOL v6 = v60;
              id v5 = v61;
              uint64_t v34 = v58;
              id v32 = v59;
            }
          }
        }
        id v65 = [v32 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v65);

      id v29 = v55;
      if (v33) {
        [v57 ic_save];
      }
    }
    else
    {
    }
    id v30 = v56;
  }

  return v62;
}

- (void)showAttachmentsUnsupportedAlertForNoteContentLayer:(id)a3
{
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Unsupported Attachment" value:&stru_10063F3D8 table:0];
  BOOL v6 = [(NotesDisplayController *)self note];
  id v7 = [v6 store];
  id v8 = [v7 account];
  uint64_t v9 = [v8 localizedAttachmentsNotSupportedReason];
  id v13 = +[UIAlertController alertControllerWithTitle:v5 message:v9 preferredStyle:1];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"OK" value:&stru_10063F3D8 table:0];
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];

  [v13 addAction:v12];
  [(NotesDisplayController *)self presentViewController:v13 animated:1 completion:0];
}

- (id)archivedConfiguration
{
  if ([(NotesDisplayController *)self noteContainsValuableContent])
  {
    BOOL v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = [(NotesDisplayController *)self note];
    if (v4)
    {
      id v5 = (void *)v4;
      BOOL v6 = [(NotesDisplayController *)self note];
      id v7 = [v6 integerId];

      if (v7)
      {
        id v8 = [(NotesDisplayController *)self note];
        uint64_t v9 = [v8 integerId];
        [v3 setObject:v9 forKey:@"NoteRecordId"];
      }
    }
    if ([(NotesDisplayController *)self isEditing])
    {
      id v10 = +[NSNumber numberWithBool:1];
      [v3 setObject:v10 forKey:@"IsEditing"];
    }
    id v11 = [(NotesDisplayController *)self contentLayer];

    if (v11)
    {
      uint64_t v12 = [(NotesDisplayController *)self contentLayer];
      [v12 contentOffset];
      double v14 = v13;
      double v16 = v15;

      if (v14 != CGPointZero.x || v16 != CGPointZero.y)
      {
        v21.double x = v14;
        v21.double y = v16;
        long long v18 = NSStringFromCGPoint(v21);
        [v3 setObject:v18 forKey:@"ContentOffset"];
      }
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)restoreState
{
  BOOL v3 = [(NotesDisplayController *)self pendingArchivedNoteID];

  if (v3)
  {
    uint64_t v4 = [(NotesDisplayController *)self note];
    id v5 = [v4 integerId];
    BOOL v6 = [(NotesDisplayController *)self pendingArchivedNoteID];
    unsigned int v7 = [v5 isEqual:v6];

    if (v7)
    {
      if ([(NotesDisplayController *)self pendingArchivedEditingState]) {
        [(NotesDisplayController *)self setEditing:1 animated:0];
      }
      id v8 = [(NotesDisplayController *)self contentLayer];
      [(NotesDisplayController *)self pendingArchivedContentOffset];
      [v8 setContentOffset:];
    }
    -[NotesDisplayController setPendingArchivedContentOffset:](self, "setPendingArchivedContentOffset:", CGPointZero.x, CGPointZero.y);
    [(NotesDisplayController *)self setPendingArchivedNoteID:0];
    [(NotesDisplayController *)self setPendingArchivedEditingState:0];
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)NotesDisplayController;
  id v7 = a4;
  -[NotesDisplayController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  id v8 = [(NotesDisplayController *)self contentLayer];
  [v8 setNeedsUpdateConstraints];

  [(NotesDisplayController *)self setTransitioningToSize:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100117888;
  v9[3] = &unk_100625AC8;
  v9[4] = self;
  [v7 animateAlongsideTransition:&stru_10062A558 completion:v9];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NotesDisplayController *)self setChangingTraitCollection:1];
  id v8 = [(NotesDisplayController *)self contentLayer];
  unsigned __int8 v9 = [v8 isFirstResponder];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100117A00;
  v11[3] = &unk_10062A580;
  v11[4] = self;
  unsigned __int8 v12 = v9;
  [v6 animateAlongsideTransition:0 completion:v11];
  v10.receiver = self;
  v10.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v10 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
}

- (id)contextManager
{
  id v2 = (void *)qword_1006AA310;
  if (qword_1006AA310) {
    goto LABEL_5;
  }
  BOOL v3 = UISystemRootDirectory();
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/AssistantServices.framework"];

  id v5 = +[NSBundle bundleWithPath:v4];
  if ([v5 load]) {
    qword_1006AA310 = (uint64_t)NSClassFromString(@"AFContextManager");
  }

  id v2 = (void *)qword_1006AA310;
  if (qword_1006AA310)
  {
LABEL_5:
    id v2 = [v2 defaultContextManager];
  }

  return v2;
}

- (void)updateContextProviderStatus
{
  unsigned int v3 = [(NotesDisplayController *)self canProvideNote];
  uint64_t v4 = [(NotesDisplayController *)self contextManager];
  id v5 = v4;
  if (v3) {
    [v4 addContextProvider:self];
  }
  else {
    [v4 removeContextProvider:self];
  }
}

- (BOOL)allowContextProvider:(id)a3
{
  return 1;
}

- (id)getCurrentContext
{
  [(NotesDisplayController *)self saveNote];
  unsigned int v3 = +[NSMutableArray arrayWithCapacity:1];
  Class v4 = NSClassFromString(@"SANoteObject");
  if (!v4)
  {
    id v5 = [(id)CPSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/SAObjects.framework/SAObjects"];
    if (dlopen((const char *)[v5 UTF8String], 1))
    {
      Class v4 = NSClassFromString(@"SANoteObject");
    }
    else
    {
      NSLog(@"Unable to load framework");
      Class v4 = 0;
    }
  }
  id v6 = [(objc_class *)v4 object];
  if (v6)
  {
    id v7 = [(NoteObject *)self->_note noteId];
    [v6 setIdentifier:v7];

    id v8 = [v6 dictionary];
    [v3 addObject:v8];
  }

  return v3;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  v4.receiver = self;
  v4.super_class = (Class)NotesDisplayController;
  [(NotesDisplayController *)&v4 setNeedsStatusBarAppearanceUpdate];
  unsigned int v3 = [(NotesDisplayController *)self navigationController];
  [v3 setNeedsStatusBarAppearanceUpdate];
}

- (int64_t)preferredStatusBarStyle
{
  if (+[UITraitCollection ic_alwaysShowLightContent])return 3; {
  else
  }
    return 0;
}

- (void)updateForceLightContentIfNecessary
{
  unsigned int v3 = +[UITraitCollection ic_alwaysShowLightContent];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v3];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(NotesDisplayController *)self parentViewController];
  [v6 setOverrideTraitCollection:v5 forChildViewController:self];

  id v7 = [(NotesDisplayController *)self navigationController];
  id v8 = [v7 navigationBar];
  [v8 setOverrideUserInterfaceStyle:v4];

  unsigned __int8 v9 = [(NotesDisplayController *)self view];
  [v9 setOverrideUserInterfaceStyle:v4];

  objc_super v10 = [(NotesDisplayController *)self webView];
  [v10 setOverrideUserInterfaceStyle:v4];

  id v11 = [(NotesDisplayController *)self view];
  unsigned __int8 v12 = [v11 backgroundColor];

  id v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  id v31 = sub_100118048;
  id v32 = &unk_10062A5C8;
  char v34 = v4;
  id v33 = v12;
  id v13 = v12;
  double v14 = +[UIColor colorWithDynamicProvider:&v29];
  id v15 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v15 configureWithTransparentBackground:v29, v30, v31, v32];
  [v15 setBackgroundColor:v14];
  double v16 = [(NotesDisplayController *)self navigationController];
  long long v17 = [v16 navigationBar];
  [v17 setStandardAppearance:v15];

  long long v18 = [(NotesDisplayController *)self navigationController];
  id v19 = [v18 navigationBar];
  [v19 setCompactAppearance:v15];

  id v20 = [(NotesDisplayController *)self navigationItem];
  [v20 setStandardAppearance:v15];

  CGPoint v21 = [(NotesDisplayController *)self navigationItem];
  [v21 setCompactAppearance:v15];

  BOOL v22 = [(NotesDisplayController *)self navigationController];
  id v23 = [v22 toolbar];
  id v24 = [v23 standardAppearance];

  [v24 configureWithTransparentBackground];
  [v24 setBackgroundColor:v14];
  double v25 = [(NotesDisplayController *)self navigationController];
  double v26 = [v25 toolbar];
  [v26 setStandardAppearance:v24];

  v27 = [(NotesDisplayController *)self navigationController];
  v28 = [v27 toolbar];
  [v28 setCompactAppearance:v24];

  [(NotesDisplayController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)updateUserActivityStatus
{
  if ([(NotesDisplayController *)self canProvideNote])
  {
    unsigned int v3 = [(NotesDisplayController *)self noteUserActivity];

    if (!v3)
    {
      id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Notes"];
      [v5 setDelegate:self];
      [v5 setEligibleForSearch:1];
      [(NotesDisplayController *)self setNoteUserActivity:v5];
      [(NotesDisplayController *)self updateNoteUserActivityState];
      uint64_t v4 = [(NotesDisplayController *)self noteUserActivity];
      [v4 becomeCurrent];
    }
  }
  else
  {
    [(NotesDisplayController *)self invalidateNoteUserActivity];
  }
}

- (void)updateNoteUserActivityState
{
  uint64_t v3 = [(NotesDisplayController *)self noteUserActivity];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(NotesDisplayController *)self note];

    if (v5)
    {
      id v6 = [NoteUserActivityState alloc];
      id v7 = [(NotesDisplayController *)self note];
      id v23 = [(NoteUserActivityState *)v6 initWithNote:v7];

      id v8 = [(NotesDisplayController *)self note];
      unsigned __int8 v9 = [v8 title];
      [(NoteUserActivityState *)v23 setTitle:v9];

      objc_super v10 = [(NotesDisplayController *)self note];
      id v11 = [v10 guid];
      [(NoteUserActivityState *)v23 setNoteID:v11];

      [(NoteUserActivityState *)v23 setEditing:[(NotesDisplayController *)self isEditing]];
      unsigned __int8 v12 = [(NotesDisplayController *)self note];
      id v13 = [v12 modificationDate];

      if ([(NotesDisplayController *)self isEditing])
      {
        uint64_t v14 = +[NSDate date];

        id v13 = (void *)v14;
      }
      [(NoteUserActivityState *)v23 setModificationDate:v13];
      id v15 = [(NotesDisplayController *)self note];
      double v16 = [v15 creationDate];
      [(NoteUserActivityState *)v23 setCreationDate:v16];

      long long v17 = [(NotesDisplayController *)self note];
      LODWORD(v16) = sub_100073EDC(v17);

      if (v16)
      {
        long long v18 = [(NotesDisplayController *)self note];
        -[NoteUserActivityState setContentPlainText:](v23, "setContentPlainText:", [v18 isPlainText]);
      }
      [(NotesDisplayController *)self setNoteUserActivityState:v23];
      id v19 = [(NotesDisplayController *)self note];
      uint64_t v20 = sub_100073FE8(v19);
      CGPoint v21 = [(NotesDisplayController *)self noteUserActivity];
      [v21 setEligibleForHandoff:v20];

      BOOL v22 = [(NotesDisplayController *)self noteUserActivity];
      [v22 setNeedsSave:1];
    }
  }
}

- (void)invalidateNoteUserActivity
{
  uint64_t v3 = [(NotesDisplayController *)self noteUserActivity];
  [v3 setDelegate:0];

  uint64_t v4 = [(NotesDisplayController *)self noteUserActivity];
  [v4 invalidate];

  [(NotesDisplayController *)self setNoteUserActivity:0];

  [(NotesDisplayController *)self setNoteUserActivityState:0];
}

- (void)userActivityWasContinued:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011853C;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)userActivityWillSave:(id)a3
{
  id obj = a3;
  objc_sync_enter(obj);
  uint64_t v4 = [(NotesDisplayController *)self noteUserActivityState];
  [v4 updateUserActivity:obj];

  objc_sync_exit(obj);
}

- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(NotesDisplayController *)self contentLayer];
  id v8 = [v7 noteHTMLEditorView];
  unsigned __int8 v9 = [v8 webView];
  objc_super v10 = [v9 scrollView];
  [v10 bounds];
  uint64_t v12 = (int)v11;

  self;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v17 contentLayer];
  uint64_t v14 = [v13 noteHTMLEditorView];
  id v15 = [v14 webView];
  double v16 = [v15 scrollView];
  [v16 _performScrollTest:v6 iterations:v4 delta:v12];
}

- (void)applyAccessibilityInfo
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v26 = [v3 localizedStringForKey:@"New note" value:&stru_10063F3D8 table:0];

  uint64_t v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Double tap to compose a new note." value:&stru_10063F3D8 table:0];

  id v6 = [(NotesDisplayController *)self createBarButtonItem];
  [v6 setAccessibilityLabel:v26];

  id v7 = [(NotesDisplayController *)self createNavBarButtonItem];
  [v7 setAccessibilityLabel:v26];

  id v8 = [(NotesDisplayController *)self createBarButtonItem];
  [v8 setAccessibilityHint:v5];

  unsigned __int8 v9 = [(NotesDisplayController *)self createNavBarButtonItem];
  [v9 setAccessibilityHint:v5];

  objc_super v10 = +[NSBundle mainBundle];
  double v11 = [v10 localizedStringForKey:@"Share note" value:&stru_10063F3D8 table:0];

  uint64_t v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Double tap to share the current note." value:&stru_10063F3D8 table:0];

  uint64_t v14 = [(NotesDisplayController *)self shareBarButtonItem];
  [v14 setAccessibilityLabel:v11];

  id v15 = [(NotesDisplayController *)self shareNavBarButtonItem];
  [v15 setAccessibilityLabel:v11];

  double v16 = [(NotesDisplayController *)self shareBarButtonItem];
  [v16 setAccessibilityHint:v13];

  id v17 = [(NotesDisplayController *)self shareNavBarButtonItem];
  [v17 setAccessibilityHint:v13];

  long long v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"Delete note" value:&stru_10063F3D8 table:0];

  uint64_t v20 = +[NSBundle mainBundle];
  CGPoint v21 = [v20 localizedStringForKey:@"Double tap to delete the current note." value:&stru_10063F3D8 table:0];

  BOOL v22 = [(NotesDisplayController *)self deleteBarButtonItem];
  [v22 setAccessibilityLabel:v19];

  id v23 = [(NotesDisplayController *)self deleteNavBarButtonItem];
  [v23 setAccessibilityLabel:v19];

  id v24 = [(NotesDisplayController *)self deleteBarButtonItem];
  [v24 setAccessibilityHint:v21];

  double v25 = [(NotesDisplayController *)self deleteNavBarButtonItem];
  [v25 setAccessibilityHint:v21];
}

- (void)updateViewAnnotation
{
  id v4 = [(NotesDisplayController *)self view];
  uint64_t v3 = [(NotesDisplayController *)self note];
  [v4 ic_annotateWithNote:v3];
}

- (BOOL)contentHasUnsavedChanges
{
  return self->_contentHasUnsavedChanges;
}

- (void)setContentHasUnsavedChanges:(BOOL)a3
{
  self->_contentHasUnsavedChanges = a3;
}

- (NotesDisplayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NotesDisplayControllerDelegate *)WeakRetained;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (NoteObject)note
{
  return self->_note;
}

- (NoteContentLayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (NSArray)attachmentPresentations
{
  return self->_attachmentPresentations;
}

- (void)setAttachmentPresentations:(id)a3
{
}

- (NSArray)allAttachmentPresentationOccurences
{
  return self->_allAttachmentPresentationOccurences;
}

- (UIImagePickerController)pickerController
{
  return self->_pickerController;
}

- (void)setPickerController:(id)a3
{
}

- (UIPresentationController)activityPresentationController
{
  return self->_activityPresentationController;
}

- (void)setActivityPresentationController:(id)a3
{
}

- (UIPresentationController)deletePresentationController
{
  return self->_deletePresentationController;
}

- (void)setDeletePresentationController:(id)a3
{
}

- (NoteAttachmentPresentationOccurence)occurenceShowingActivity
{
  return self->_occurenceShowingActivity;
}

- (void)setOccurenceShowingActivity:(id)a3
{
}

- (CGPoint)inOccurenceActivityOrigin
{
  double x = self->_inOccurenceActivityOrigin.x;
  double y = self->_inOccurenceActivityOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInOccurenceActivityOrigin:(CGPoint)a3
{
  self->_inOccurenceActivityOrigin = a3;
}

- (BOOL)isPickingAttachment
{
  return self->_pickingAttachment;
}

- (void)setPickingAttachment:(BOOL)a3
{
  self->_pickingAttachment = a3;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (void)setCloseAuxiliaryWindowButton:(id)a3
{
}

- (void)setActionButtonItemsForToolbar:(id)a3
{
}

- (void)setActionButtonItemsForNavBar:(id)a3
{
}

- (CGPoint)pendingArchivedContentOffset
{
  double x = self->_pendingArchivedContentOffset.x;
  double y = self->_pendingArchivedContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPendingArchivedContentOffset:(CGPoint)a3
{
  self->_pendingArchivedContentOffset = a3;
}

- (BOOL)pendingArchivedEditingState
{
  return self->_pendingArchivedEditingState;
}

- (void)setPendingArchivedEditingState:(BOOL)a3
{
  self->_pendingArchivedEditingState = a3;
}

- (NSNumber)pendingArchivedNoteID
{
  return self->_pendingArchivedNoteID;
}

- (void)setPendingArchivedNoteID:(id)a3
{
}

- (BOOL)canProvideNote
{
  return self->_canProvideNote;
}

- (void)setCanProvideNote:(BOOL)a3
{
  self->_canProvideNote = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSDate)displayedNoteVersionTimestamp
{
  return self->_displayedNoteVersionTimestamp;
}

- (void)setDisplayedNoteVersionTimestamp:(id)a3
{
}

- (NSManagedObjectID)displayedNoteVersionObjectID
{
  return self->_displayedNoteVersionObjectID;
}

- (void)setDisplayedNoteVersionObjectID:(id)a3
{
}

- (NSUserActivity)noteUserActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 176, 1);
}

- (void)setNoteUserActivity:(id)a3
{
}

- (NoteUserActivityState)noteUserActivityState
{
  return (NoteUserActivityState *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNoteUserActivityState:(id)a3
{
}

- (BOOL)isChangingTraitCollection
{
  return self->_changingTraitCollection;
}

- (void)setChangingTraitCollection:(BOOL)a3
{
  self->_changingTraitCollection = a3;
}

- (UIBarButtonItem)createNavBarButtonItem
{
  return self->_createNavBarButtonItem;
}

- (void)setCreateNavBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)shareNavBarButtonItem
{
  return self->_shareNavBarButtonItem;
}

- (void)setShareNavBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteNavBarButtonItem
{
  return self->_deleteNavBarButtonItem;
}

- (void)setDeleteNavBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)createBarButtonItem
{
  return self->_createBarButtonItem;
}

- (void)setCreateBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)shareBarButtonItem
{
  return self->_shareBarButtonItem;
}

- (void)setShareBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (void)setDeleteBarButtonItem:(id)a3
{
}

- (_NSRange)selectedRangeBeforeTextFinding
{
  p_selectedRangeBeforeTextFinding = &self->_selectedRangeBeforeTextFinding;
  NSUInteger location = self->_selectedRangeBeforeTextFinding.location;
  NSUInteger length = p_selectedRangeBeforeTextFinding->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectedRangeBeforeTextFinding:(_NSRange)a3
{
  self->_selectedRangeBeforeTextFinding = a3;
}

- (BOOL)isEditingNewNote
{
  return self->_isEditingNewNote;
}

- (void)setIsEditingNewNote:(BOOL)a3
{
  self->_isEditingNewNote = a3;
}

- (BOOL)startEditingAfterViewAppears
{
  return self->_startEditingAfterViewAppears;
}

- (void)setStartEditingAfterViewAppears:(BOOL)a3
{
  self->_startEditingAfterViewAppears = a3;
}

- (NSString)originalPlainTextNoteContent
{
  return self->_originalPlainTextNoteContent;
}

- (void)setOriginalPlainTextNoteContent:(id)a3
{
}

- (BOOL)noteIsManaged
{
  return self->_noteIsManaged;
}

- (void)setNoteIsManaged:(BOOL)a3
{
  self->_noteIsManaged = a3;
}

- (BOOL)transitioningToSize
{
  return self->_transitioningToSize;
}

- (void)setTransitioningToSize:(BOOL)a3
{
  self->_transitioningToSize = a3;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (BOOL)isUpdatingNoteContent
{
  return self->_isUpdatingNoteContent;
}

- (void)setIsUpdatingNoteContent:(BOOL)a3
{
  self->_isUpdatingNoteContent = a3;
}

- (BOOL)isRespondingToStartEditing
{
  return self->_isRespondingToStartEditing;
}

- (void)setIsRespondingToStartEditing:(BOOL)a3
{
  self->_isRespondingToStartEditing = a3;
}

- (BOOL)isRespondingToEndEditing
{
  return self->_isRespondingToEndEditing;
}

- (void)setIsRespondingToEndEditing:(BOOL)a3
{
  self->_isRespondingToEndEditing = a3;
}

- (BOOL)delayingSetContent
{
  return self->_delayingSetContent;
}

- (void)setDelayingSetContent:(BOOL)a3
{
  self->_delayingSetContent = a3;
}

- (BOOL)didSetContentFromNote
{
  return self->_didSetContentFromNote;
}

- (void)setDidSetContentFromNote:(BOOL)a3
{
  self->_didSetContentFromNote = a3;
}

- (NotesBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSTimer)autosaveTimer
{
  return self->_autosaveTimer;
}

- (void)setAutosaveTimer:(id)a3
{
}

- (BOOL)isPerformingDeleteAnimation
{
  return self->_performingDeleteAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_originalPlainTextNoteContent, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_createBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_createNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_noteUserActivityState, 0);
  objc_storeStrong((id *)&self->_noteUserActivity, 0);
  objc_storeStrong((id *)&self->_displayedNoteVersionObjectID, 0);
  objc_storeStrong((id *)&self->_displayedNoteVersionTimestamp, 0);
  objc_storeStrong((id *)&self->_pendingArchivedNoteID, 0);
  objc_storeStrong((id *)&self->_actionButtonItemsForNavBar, 0);
  objc_storeStrong((id *)&self->_actionButtonItemsForToolbar, 0);
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowButton, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_occurenceShowingActivity, 0);
  objc_storeStrong((id *)&self->_deletePresentationController, 0);
  objc_storeStrong((id *)&self->_activityPresentationController, 0);
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_allAttachmentPresentationOccurences, 0);
  objc_storeStrong((id *)&self->_attachmentPresentations, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_nonManagedAttachmentPresentationOccurences, 0);
}

@end
@interface ICNoteEditorViewController
- (BOOL)collaborationButtons_updateCollaborationStateIfNeeded;
- (BOOL)isDarkModeForActivityItemsConfiguration;
- (BOOL)noteEditorActionMenuCanScanDocuments:(id)a3;
- (id)app_systemPaperInkPaletteButtonView:(id)a3;
- (id)collaborationButtons_collaborationBarButtonItem;
- (id)noteEditorActionMenuShouldCreateNewNote:(id)a3;
- (id)notePreview:(id)a3;
- (id)realtimeCollaborationSelectionController;
- (void)app_createAndPresentCloudSharingControllerBySender:(id)a3;
- (void)app_shareButtonPressed:(id)a3;
- (void)app_showLearnMoreTags;
- (void)app_showMoveToFolder;
- (void)app_showRecoverNoteAlert;
- (void)collaborationButtons_acceptInviteWithShareURL:(id)a3 invitationViewController:(id)a4;
- (void)collaborationButtons_registerForSharedWithYouHighlightUpdates;
- (void)collaborationButtons_setupCollaborationController;
- (void)collaboration_setupActivityItemsConfigurationProvider;
- (void)groupActivityDidChange;
- (void)ic_addInsertNoteLinkInteraction;
- (void)link_addCreateNoteInteraction;
- (void)link_addInsertNoteLinkInteraction;
- (void)link_addReplaceSelectionInteraction;
- (void)link_addSetParagraphStyleInteraction;
- (void)link_removeLinkActionInteractions;
- (void)noteCursorVisibilityChanged:(id)a3;
- (void)noteEditorActionMenuShouldDeleteNote:(id)a3;
- (void)noteEditorActionMenuShouldFindInNote:(id)a3;
- (void)noteEditorActionMenuShouldScanDocuments:(id)a3;
- (void)noteEditorActionMenuShouldShowHandwritingDebug:(id)a3;
- (void)noteEditorActionMenuWillShow:(id)a3;
- (void)paperKitViewDidAppear:(id)a3;
- (void)paperKitViewWillDisappear:(id)a3;
- (void)ppt_didEditorBeginEditing;
- (void)ppt_didFinishExtendedLaunch;
- (void)ppt_didShowNoteEditor;
- (void)ppt_inkPickerDidShow;
- (void)ppt_noteEditorDidLayoutSubviews;
- (void)ppt_textViewDidChange;
- (void)ppt_willLoadNoteIntoEditor;
- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4;
- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4;
- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3;
- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3;
- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3;
- (void)setRealtimeCollaborationSelectionController:(id)a3;
- (void)updateFastSyncParticipantCursorsForNote:(id)a3;
- (void)updateViewAnnotation;
@end

@implementation ICNoteEditorViewController

- (void)ppt_willLoadNoteIntoEditor
{
  id v2 = +[ICAppDelegate sharedInstance];
  [v2 willLoadNoteIntoEditor];
}

- (void)updateViewAnnotation
{
  id v4 = [(ICNoteEditorViewController *)self view];
  v3 = [(ICNoteEditorViewController *)self note];
  [v4 ic_annotateWithNote:v3];
}

- (void)ppt_didShowNoteEditor
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isRunningTest];

  if (v3)
  {
    id v4 = +[ICAppDelegate sharedInstance];
    [v4 didShowNoteEditor];
  }
}

- (void)link_addReplaceSelectionInteraction
{
  objc_initWeak(&location, self);
  unsigned int v3 = [(ICNoteEditorViewController *)self view];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B3A34;
  v4[3] = &unk_1006286F8;
  objc_copyWeak(&v5, &location);
  [v3 ic_addReplaceSelectionInteractionWithTextHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)link_addSetParagraphStyleInteraction
{
  objc_initWeak(&location, self);
  unsigned int v3 = [(ICNoteEditorViewController *)self view];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B39CC;
  v4[3] = &unk_1006286D0;
  objc_copyWeak(&v5, &location);
  [v3 ic_addSetParagraphStyleInteractionWithStyleHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)link_addCreateNoteInteraction
{
  objc_initWeak(&location, self);
  unsigned int v3 = [(ICNoteEditorViewController *)self view];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B3938;
  v4[3] = &unk_1006286A8;
  objc_copyWeak(&v5, &location);
  [v3 ic_addCreateNoteInteractionWithFolderHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)ic_addInsertNoteLinkInteraction
{
  *(void *)(swift_allocObject() + 16) = self;
  objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction());
  sub_1000349B0();
  unsigned int v3 = self;
  id v4 = (void *)UIAppIntentInteraction.init<A>(intent:perform:)();
  id v5 = [(ICNoteEditorViewController *)v3 view];
  if (v5)
  {
    id v6 = v5;
    [v5 addInteraction:v4];
  }
  else
  {
    __break(1u);
  }
}

- (void)collaborationButtons_setupCollaborationController
{
  objc_initWeak(&location, self);
  unsigned int v3 = [ICCollaborationButtonsController alloc];
  id v4 = [(ICNoteEditorViewController *)self note];
  id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
  id v6 = [(ICCollaborationButtonsController *)v3 initWithCloudObject:v4 coordinator:v5];
  [(ICNoteEditorViewController *)self setCollaborationButtonsController:v6];

  objc_copyWeak(&v9, &location);
  v7 = [(ICNoteEditorViewController *)self collaborationButtonsController];
  [v7 setDidPressManageShareButton:&v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)collaborationButtons_updateCollaborationStateIfNeeded
{
  unsigned int v3 = [(ICNoteEditorViewController *)self note];
  if (v3)
  {
  }
  else
  {
    id v4 = [(ICNoteEditorViewController *)self collaborationButtonsController];
    id v5 = [v4 cloudObject];

    if (!v5) {
      return 0;
    }
  }
  uint64_t v6 = [(ICNoteEditorViewController *)self collaborationButtonsController];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [(ICNoteEditorViewController *)self note];
    id v9 = [(ICNoteEditorViewController *)self collaborationButtonsController];
    v10 = [v9 cloudObject];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11) {
      return 0;
    }
  }
  [(ICNoteEditorViewController *)self collaborationButtons_setupCollaborationController];
  return 1;
}

- (void)updateFastSyncParticipantCursorsForNote:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [v18 identifier];
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)v6;
  uint64_t v8 = [v18 identifier];
  id v9 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  v10 = [v9 currentNoteIdentifier];
  unsigned int v11 = [v8 isEqualToString:v10];

  if (!v11)
  {
LABEL_7:
    [(ICNoteEditorViewController *)self setRealtimeCollaborationSelectionController:0];
    goto LABEL_8;
  }
  v12 = [(ICNoteEditorViewController *)self realtimeCollaborationSelectionController];
  v13 = [v12 realtimeCollaborationController];
  v14 = [(ICNoteEditorViewController *)self realtimeCollaborationController];

  if (v13 != v14)
  {
    v15 = [ICRealtimeCollaborationSelectionController alloc];
    v16 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
    v17 = [(ICRealtimeCollaborationSelectionController *)v15 initWithEditorController:self realtimeCollaborationController:v16];
    [(ICNoteEditorViewController *)self setRealtimeCollaborationSelectionController:v17];
  }
LABEL_8:
}

- (void)setRealtimeCollaborationSelectionController:(id)a3
{
}

- (void)ppt_noteEditorDidLayoutSubviews
{
  id v4 = +[UIApplication sharedApplication];
  if ([v4 isRunningTest])
  {
    unsigned int v3 = [(ICNoteEditorViewController *)self _appearState];

    if (v3 != 1) {
      return;
    }
    id v4 = +[ICAppDelegate sharedInstance];
    [v4 noteEditorDidLayoutSubviews];
  }
}

- (void)ppt_didFinishExtendedLaunch
{
  id v2 = +[ICAppDelegate sharedInstance];
  [v2 didFinishExtendedLaunch];
}

- (void)link_addInsertNoteLinkInteraction
{
}

- (void)collaboration_setupActivityItemsConfigurationProvider
{
  unsigned int v3 = [[ICNoteEditorActivityItemsConfigurationProvider alloc] initWithDelegate:self];
  [(ICNoteEditorViewController *)self setActivityItemsConfigurationProvider:v3];
}

- (void)collaborationButtons_registerForSharedWithYouHighlightUpdates
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"sharedWithYouControllerDidUpdateHighlights:" name:ICSharedWithYouControllerDidUpdateHighlightsNotification object:0];
}

- (void)ppt_didEditorBeginEditing
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isRunningTest];

  if (v3)
  {
    id v4 = +[ICAppDelegate sharedInstance];
    [v4 didEditorBeginEditing];
  }
}

- (void)ppt_textViewDidChange
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isRunningTest];

  if (v3)
  {
    id v4 = +[ICAppDelegate sharedInstance];
    [v4 textViewDidChange];
  }
}

- (void)ppt_inkPickerDidShow
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isRunningTest];

  if (v3)
  {
    id v4 = +[ICAppDelegate sharedInstance];
    [v4 inkPickerDidShow];
  }
}

- (id)realtimeCollaborationSelectionController
{
  objc_opt_class();
  unsigned int v3 = objc_getAssociatedObject(self, off_1006997B8);
  id v4 = ICDynamicCast();

  return v4;
}

- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3
{
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [(ICNoteEditorViewController *)self note];
  uint64_t v6 = [v5 attachments];

  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v12 = [v11 paperBundleModel];

        if (v12)
        {
          v13 = [(ICNoteEditorViewController *)self textView];
          uint64_t v14 = [v13 textLayoutManager];
          if (v14)
          {
            v15 = (void *)v14;
            int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();

            if (IsTextKit2Enabled)
            {
              objc_opt_class();
              v17 = [(ICNoteEditorViewController *)self textView];
              id v18 = [v17 textLayoutManager];
              v19 = ICCheckedDynamicCast();

              [v4 updatePaperKitMessengerForAttachment:v11 textLayoutManager:v19];
LABEL_14:

              continue;
            }
          }
          else
          {
          }
          v19 = [(ICNoteEditorViewController *)self textView];
          uint64_t v20 = [v19 layoutManager];
          if (v20)
          {
            v21 = (void *)v20;
            char v22 = ICInternalSettingsIsTextKit2Enabled();

            if (v22) {
              continue;
            }
            objc_opt_class();
            v23 = [(ICNoteEditorViewController *)self textView];
            v24 = [v23 layoutManager];
            v19 = ICCheckedDynamicCast();

            [v4 updatePaperKitMessengerForAttachment:v11 layoutManager:v19];
          }
          goto LABEL_14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"paperKitViewDidAppear:" name:ICSystemPaperTextAttachmentDidAppearNotification object:0];

  v26 = +[NSNotificationCenter defaultCenter];
  [v26 addObserver:self selector:"paperKitViewWillDisappear:" name:ICSystemPaperTextAttachmentWillDisappearNotification object:0];

  v27 = +[NSNotificationCenter defaultCenter];
  [v27 addObserver:self selector:"noteCursorVisibilityChanged:" name:ICNoteShowsCollaboratorCursorsDidChangeNotification object:0];
}

- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3
{
  id v22 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:ICSystemPaperTextAttachmentDidAppearNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:ICSystemPaperTextAttachmentWillDisappearNotification object:0];

  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:ICNoteShowsCollaboratorCursorsDidChangeNotification object:0];

  [(ICNoteEditorViewController *)self _realtimeCollaborationSessionStateDidChange];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(ICNoteEditorViewController *)self note];
  id v8 = [v7 attachments];

  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = ICAttachmentUTTypeSystemPaper;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v15 = [v14 typeUTI];
        unsigned int v16 = [v15 isEqualToString:v12];

        if (v16)
        {
          if (ICInternalSettingsIsTextKit2Enabled())
          {
            objc_opt_class();
            v17 = [(ICNoteEditorViewController *)self textView];
            id v18 = [v17 textLayoutManager];
            v19 = ICCheckedDynamicCast();

            [v22 removePaperKitMessengerForAttachmentIfNecessary:v14 textLayoutManager:v19];
          }
          else
          {
            objc_opt_class();
            uint64_t v20 = [(ICNoteEditorViewController *)self textView];
            v21 = [v20 layoutManager];
            v19 = ICCheckedDynamicCast();

            [v22 removePaperKitMessengerForAttachmentIfNecessary:v14 layoutManager:v19];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self realtimeCollaborationSelectionController];
  [v5 realtimeCollaborationControllerDidChangeSelectionState:v4];
}

- (void)paperKitViewDidAppear:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  [v6 configurePaperKitAttachmentViewIfNecessary:v7];
}

- (void)paperKitViewWillDisappear:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  [v6 removePaperKitMessengerForViewIfNecessary:v7];
}

- (void)noteCursorVisibilityChanged:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v22 = v4;
  id v5 = [v4 object];
  long long v23 = ICDynamicCast();

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [(ICNoteEditorViewController *)self note];
  id v7 = [v6 attachments];

  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = ICAttachmentUTTypeSystemPaper;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v13 typeUTI];
        unsigned int v15 = [v14 isEqualToString:v11];

        if (v15)
        {
          if (ICInternalSettingsIsTextKit2Enabled())
          {
            objc_opt_class();
            unsigned int v16 = [(ICNoteEditorViewController *)self textView];
            v17 = [v16 textLayoutManager];
            id v18 = ICCheckedDynamicCast();

            if (v18)
            {
              v19 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
              objc_msgSend(v19, "setShowsCursors:forPaperKitAttachment:textLayoutManager:", objc_msgSend(v23, "showsCollaboratorCursors"), v13, v18);
              goto LABEL_12;
            }
          }
          else
          {
            objc_opt_class();
            uint64_t v20 = [(ICNoteEditorViewController *)self textView];
            v21 = [v20 layoutManager];
            id v18 = ICCheckedDynamicCast();

            if (v18)
            {
              v19 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
              objc_msgSend(v19, "setShowsCursors:forPaperKitAttachment:layoutManager:", objc_msgSend(v23, "showsCollaboratorCursors"), v13, v18);
LABEL_12:
            }
          }

          continue;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 layoutManager:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  unsigned int v8 = [v7 hasActiveSession];

  if (v8)
  {
    id v9 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
    [v9 updatePaperKitMessengerForAttachment:v10 layoutManager:v6];
  }
}

- (void)rcc_updatePaperKitMessengerForAttachment:(id)a3 textLayoutManager:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
  unsigned int v8 = [v7 hasActiveSession];

  if (v8)
  {
    id v9 = [(ICNoteEditorViewController *)self realtimeCollaborationController];
    [v9 updatePaperKitMessengerForAttachment:v10 textLayoutManager:v6];
  }
}

- (void)groupActivityDidChange
{
  id v3 = [(ICNoteEditorViewController *)self note];
  [(ICNoteEditorViewController *)self updateFastSyncParticipantCursorsForNote:v3];
}

- (void)app_showRecoverNoteAlert
{
  id v3 = [ICRecoverNoteAlertController alloc];
  id v4 = [(ICNoteEditorViewController *)self note];
  id v5 = [(ICRecoverNoteAlertController *)v3 initWithNote:v4];

  [(ICRecoverNoteAlertController *)v5 showFromViewController:self];
}

- (void)app_showMoveToFolder
{
  id v3 = [ICMoveNoteActivity alloc];
  id v4 = [(ICNoteEditorViewController *)self note];
  id v5 = [(ICMoveNoteActivity *)v3 initWithNote:v4 presentingViewController:self];

  [(ICMoveNoteActivity *)v5 performActivityWithCompletion:0];
}

- (id)app_systemPaperInkPaletteButtonView:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorViewController *)self viewControllerManager];
  id v6 = [v5 systemPaperViewController];

  id v7 = [v6 inkPaletteButtonViewWithInkPaletteController:v4];

  return v7;
}

- (void)app_showLearnMoreTags
{
}

- (void)app_shareButtonPressed:(id)a3
{
  id v4 = a3;
  id v9 = +[ICCollaborationUIController sharedInstance];
  id v5 = [(ICNoteEditorViewController *)self view];
  id v6 = [v5 window];
  id v7 = [(ICNoteEditorViewController *)self note];
  unsigned int v8 = [(ICNoteEditorViewController *)self eventReporter];
  [v9 presentSendNoteActivityViewControllerWithPresentingWindow:v6 presentingViewController:self sourceItem:v4 sourceView:0 note:&__NSArray0__struct sourceRect:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, v8 didPresentActivityHandler:0];
}

- (id)collaborationButtons_collaborationBarButtonItem
{
  id v3 = [(ICNoteEditorViewController *)self collaborationButtonsController];

  if (!v3) {
    [(ICNoteEditorViewController *)self collaborationButtons_setupCollaborationController];
  }
  id v4 = [(ICNoteEditorViewController *)self collaborationButtonsController];
  id v5 = [v4 buttonItem];
  [(ICNoteEditorViewController *)self setCollaborationBarButtonItem:v5];

  return [(ICNoteEditorViewController *)self collaborationBarButtonItem];
}

- (void)collaborationButtons_acceptInviteWithShareURL:(id)a3 invitationViewController:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B337C;
  block[3] = &unk_100625AF0;
  id v7 = a4;
  id v16 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  unsigned int v8 = dispatch_get_global_queue(2, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B3388;
  v11[3] = &unk_100625A00;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)app_createAndPresentCloudSharingControllerBySender:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(ICNoteEditorViewController *)self iCloudShareBarButtonItem];
  }
  id v7 = v6;
  unsigned int v8 = +[ICCollaborationUIController sharedInstance];
  id v9 = [(ICNoteEditorViewController *)self note];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B38A8;
  v10[3] = &unk_100625AF0;
  v10[4] = self;
  [v8 showCloudSharingControllerForNote:v9 presentingViewController:self popoverBarButtonItem:v7 presented:v10 dismissed:0];
}

- (BOOL)isDarkModeForActivityItemsConfiguration
{
  id v2 = [(ICNoteEditorViewController *)self traitCollection];
  unsigned __int8 v3 = [v2 ic_isDark];

  return v3;
}

- (void)link_removeLinkActionInteractions
{
  id v2 = [(ICNoteEditorViewController *)self view];
  [v2 ic_removeLinkActionInteractions];
}

- (id)notePreview:(id)a3
{
  id v3 = a3;
  id v4 = [[ICNotePreviewViewController alloc] initWithNote:v3];

  return v4;
}

- (BOOL)noteEditorActionMenuCanScanDocuments:(id)a3
{
  if (+[UIDevice ic_isVision])
  {
    id v4 = [(ICNoteEditorViewController *)self navigationItemConfiguration];
    id v5 = [v4 mediaBarButtonItem];
    id v6 = [v5 menu];
    BOOL v7 = v6 != 0;

    return v7;
  }
  else
  {
    return +[ICDeviceSupport isCameraAvailable];
  }
}

- (void)noteEditorActionMenuShouldScanDocuments:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BF808;
  v3[3] = &unk_100625AF0;
  v3[4] = self;
  [(ICNoteEditorViewController *)self ic_dismissPresentedViewControllerAnimated:1 completion:v3];
}

- (void)noteEditorActionMenuShouldDeleteNote:(id)a3
{
}

- (void)noteEditorActionMenuShouldFindInNote:(id)a3
{
}

- (void)noteEditorActionMenuShouldShowHandwritingDebug:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BF890;
  v3[3] = &unk_100625AF0;
  v3[4] = self;
  [(ICNoteEditorViewController *)self ic_dismissPresentedViewControllerAnimated:1 completion:v3];
}

- (void)noteEditorActionMenuWillShow:(id)a3
{
  id v4 = [(ICNoteEditorViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICNoteEditorViewController *)self delegate];
    [v6 noteEditorDidTapActionMenu:self];
  }

  [(ICNoteEditorViewController *)self hideInkPicker];
}

- (id)noteEditorActionMenuShouldCreateNewNote:(id)a3
{
  return [(ICNoteEditorViewController *)self createNewNote];
}

@end
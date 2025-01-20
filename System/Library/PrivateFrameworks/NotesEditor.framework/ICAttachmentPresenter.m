@interface ICAttachmentPresenter
+ (BOOL)shouldCommitPreviewViewController:(id)a3;
+ (id)previewViewControllerWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 editable:(BOOL)a7 isFromAttachmentBrowser:(BOOL)a8;
- (BOOL)displayShowInNote;
- (BOOL)isAttachmentBrowser;
- (BOOL)isAttachmentEditable;
- (BOOL)isAttachmentPresentedInProcess;
- (BOOL)isDismissing;
- (BOOL)prefersStatusBarHidden;
- (BOOL)previewController:(id)a3 canShareItem:(id)a4;
- (ICAttachment)displayedAttachment;
- (ICAttachment)selectedSubAttachment;
- (ICAttachmentPresenter)initWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 displayShowInNote:(BOOL)a7 editable:(BOOL)a8 presentingViewController:(id)a9;
- (ICAttachmentPresenterDelegate)delegate;
- (ICGalleryAttachmentEditorController)galleryAttachmentEditorController;
- (ICNAEventReporter)eventReporter;
- (ICQLPreviewController)qlPreviewController;
- (ICViewControllerManager)ic_viewControllerManager;
- (NSArray)attachments;
- (NSArray)quickLookFilteredAttachments;
- (NSDictionary)presentedAttachmentUIState;
- (NSURL)temporaryExportURLToRemove;
- (UIBarButtonItem)showInNoteButton;
- (UITextView)textView;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (id)attachment;
- (id)excludedActivityTypesForPreviewController:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (id)transitionViewForAttachment:(id)a3;
- (id)transitionViewForAttachment:(id)a3 atIndexPath:(id)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (unint64_t)quickLookFilteredStartingIndex;
- (unint64_t)startingIndex;
- (void)applyPresentedAttachmentUIStateIfNecessary:(id)a3;
- (void)attachmentWillBeDeletedNotification:(id)a3;
- (void)dealloc;
- (void)dismiss:(id)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)eventReporterLostSession:(id)a3;
- (void)galleryAttachmentEditorControllerDeleteAttachment;
- (void)galleryAttachmentEditorControllerDidDismiss;
- (void)hardLinksDidDelete:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)notifyDelegateDidDismiss;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAttachmentViewController:(id)a3;
- (void)presentAttachmentWithSelectedSubAttachment:(id)a3;
- (void)presentAudioRecording;
- (void)presentExportViewForAttachment:(id)a3;
- (void)presentGalleryAttachmentWithSelectedSubAttachment:(id)a3;
- (void)presentMovie;
- (void)presentQuickLook;
- (void)presentReadOnlyAlertIfNecessaryForAttachment:(id)a3;
- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4;
- (void)presentSynapseLink;
- (void)presentURL;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewControllerDidDismiss:(id)a3;
- (void)removeTempooraryExportURL;
- (void)scrollCollectionViewToIndexPath:(id)a3;
- (void)setAttachmentEditable:(BOOL)a3;
- (void)setAttachments:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayShowInNote:(BOOL)a3;
- (void)setEventReporter:(id)a3;
- (void)setGalleryAttachmentEditorController:(id)a3;
- (void)setIc_viewControllerManager:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setQlPreviewController:(id)a3;
- (void)setQuickLookFilteredAttachments:(id)a3;
- (void)setQuickLookFilteredStartingIndex:(unint64_t)a3;
- (void)setShowInNoteButton:(id)a3;
- (void)setStartingIndex:(unint64_t)a3;
- (void)setTemporaryExportURLToRemove:(id)a3;
- (void)showInNote:(id)a3;
- (void)updateEditedPreviewItem:(id)a3 atURL:(id)a4 shouldAttemptToWriteDataFromURL:(BOOL)a5 previewController:(id)a6;
- (void)updateEditedPreviewItemAtURL:(id)a3;
- (void)updateQuickLookFilteredAttachments;
@end

@implementation ICAttachmentPresenter

- (ICAttachmentPresenter)initWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 displayShowInNote:(BOOL)a7 editable:(BOOL)a8 presentingViewController:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  v19 = [(ICAttachmentPresenter *)self init];
  v20 = v19;
  if (v19)
  {
    [(ICAttachmentPresenter *)v19 setIc_viewControllerManager:v15];
    [(ICAttachmentPresenter *)v20 setAttachments:v16];
    [(ICAttachmentPresenter *)v20 setStartingIndex:a5];
    [(ICAttachmentPresenter *)v20 setDelegate:v17];
    [(ICAttachmentPresenter *)v20 setDisplayShowInNote:v10];
    [(ICAttachmentPresenter *)v20 setAttachmentEditable:v9];
    [(ICAttachmentPresenter *)v20 setPresentingViewController:v18];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v20 selector:sel_hardLinksDidDelete_ name:*MEMORY[0x263F5A960] object:0];
  }
  return v20;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(ICQLPreviewController *)self->_qlPreviewController ic_removeObserver:self forKeyPath:@"currentPreviewItemIndex" context:&compoundliteral_7];
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPresenter;
  [(ICAttachmentPresenter *)&v4 dealloc];
}

- (UIBarButtonItem)showInNoteButton
{
  showInNoteButton = self->_showInNoteButton;
  if (!showInNoteButton)
  {
    objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 localizedStringForKey:@"Show in Note" value:&stru_26C10E100 table:0];

    v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v5 style:0 target:self action:sel_showInNote_];
    v7 = self->_showInNoteButton;
    self->_showInNoteButton = v6;

    showInNoteButton = self->_showInNoteButton;
  }

  return showInNoteButton;
}

- (id)attachment
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(ICAttachmentPresenter *)self startingIndex];
  objc_super v4 = [(ICAttachmentPresenter *)self attachments];
  unint64_t v5 = [v4 count];

  if (v3 > v5)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = [(ICAttachmentPresenter *)self startingIndex];
      v8 = [(ICAttachmentPresenter *)self attachments];
      int v12 = 134218240;
      unint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = [v8 count];
      _os_log_impl(&dword_20BE60000, v6, OS_LOG_TYPE_INFO, "Trying to access attachment %ld out of %ld. Falling back to first attachment", (uint8_t *)&v12, 0x16u);
    }
    unint64_t v3 = 0;
  }
  BOOL v9 = [(ICAttachmentPresenter *)self attachments];
  BOOL v10 = [v9 objectAtIndexedSubscript:v3];

  return v10;
}

- (BOOL)isAttachmentBrowser
{
  unint64_t v3 = [(ICAttachmentPresenter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(ICAttachmentPresenter *)self delegate];
  char v6 = [v5 isAttachmentBrowser];

  return v6;
}

- (NSArray)quickLookFilteredAttachments
{
  quickLookFilteredAttachments = self->_quickLookFilteredAttachments;
  if (!quickLookFilteredAttachments)
  {
    [(ICAttachmentPresenter *)self updateQuickLookFilteredAttachments];
    quickLookFilteredAttachments = self->_quickLookFilteredAttachments;
  }

  return quickLookFilteredAttachments;
}

- (unint64_t)quickLookFilteredStartingIndex
{
  if (!self->_quickLookFilteredAttachments) {
    [(ICAttachmentPresenter *)self updateQuickLookFilteredAttachments];
  }
  return self->_quickLookFilteredStartingIndex;
}

- (void)updateQuickLookFilteredAttachments
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  unint64_t v18 = 0;
  unint64_t v18 = [(ICAttachmentPresenter *)self startingIndex];
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  char v4 = [(ICAttachmentPresenter *)self attachments];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__ICAttachmentPresenter_updateQuickLookFilteredAttachments__block_invoke;
  v11[3] = &unk_2640BB9E8;
  id v5 = v3;
  id v12 = v5;
  unint64_t v13 = self;
  __int16 v14 = &v15;
  [v4 enumerateObjectsUsingBlock:v11];

  unint64_t v6 = v16[3];
  if (v6 <= [v5 count])
  {
    uint64_t v8 = v16[3];
  }
  else
  {
    unint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "Something went wrong calculating the QuickLook filtered starting index. Falling back to first attachment", v10, 2u);
    }

    uint64_t v8 = 0;
    v16[3] = 0;
  }
  [(ICAttachmentPresenter *)self setQuickLookFilteredStartingIndex:v8];
  BOOL v9 = (void *)[v5 copy];
  [(ICAttachmentPresenter *)self setQuickLookFilteredAttachments:v9];

  _Block_object_dispose(&v15, 8);
}

void __59__ICAttachmentPresenter_updateQuickLookFilteredAttachments__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([v5 supportsQuickLook])
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else if ([*(id *)(a1 + 40) startingIndex] > a3)
  {
    --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (BOOL)isAttachmentPresentedInProcess
{
  unint64_t v3 = [(ICAttachmentPresenter *)self attachment];
  char v4 = [v3 synapseData];

  if (v4) {
    return 1;
  }
  unint64_t v6 = [(ICAttachmentPresenter *)self attachment];
  unsigned int v7 = [v6 attachmentType];

  if (v7 <= 0xD) {
    return (0x980u >> v7) & 1;
  }
  else {
    return 1;
  }
}

- (void)presentAttachmentWithSelectedSubAttachment:(id)a3
{
  id v15 = a3;
  char v4 = [(ICAttachmentPresenter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unint64_t v6 = [(ICAttachmentPresenter *)self delegate];
    [v6 attachmentPresenterWillPresent:self];
  }
  unsigned int v7 = [(ICAttachmentPresenter *)self attachment];
  uint64_t v8 = [v7 synapseData];

  int v9 = [v7 attachmentType];
  if (v8) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    int v11 = v9;
    if ((v9 & 0xFFFFFFFB) != 9)
    {
      if ((unsigned __int16)(v9 - 9) <= 0xFFFDu) {
        [(id)*MEMORY[0x263F83300] sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];
      }
      if (v8)
      {
        [(ICAttachmentPresenter *)self presentSynapseLink];
      }
      else
      {
        switch(v11)
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 6:
          case 9:
          case 10:
          case 12:
          case 13:
          case 14:
          case 15:
            [(ICAttachmentPresenter *)self presentPreview];
            break;
          case 4:
            if (!ICInternalSettingsIsAudioTranscriptionEnabled()) {
              goto LABEL_21;
            }
            [(ICAttachmentPresenter *)self presentAudioRecording];
            break;
          case 5:
LABEL_21:
            [(ICAttachmentPresenter *)self presentMovie];
            break;
          case 7:
          case 8:
            [(ICAttachmentPresenter *)self presentURL];
            break;
          case 11:
            [(ICAttachmentPresenter *)self presentGalleryAttachmentWithSelectedSubAttachment:v15];
            break;
          default:
            break;
        }
      }
      id v12 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v13 = *MEMORY[0x263F5A9C0];
      __int16 v14 = [(ICAttachmentPresenter *)self attachment];
      [v12 addObserver:self selector:sel_attachmentWillBeDeletedNotification_ name:v13 object:v14];
    }
  }
}

- (void)presentMovie
{
  unint64_t v3 = [MEMORY[0x263F5B240] sharedAudioController];
  [v3 stop];

  [(ICAttachmentPresenter *)self presentPreview];
}

- (void)presentAudioRecording
{
  id v11 = [(ICAttachmentPresenter *)self attachment];
  uint64_t v3 = [v11 audioModel];
  if (v3)
  {
    char v4 = (void *)v3;
    char v5 = [(ICAttachmentPresenter *)self attachment];
    unint64_t v6 = [v5 note];
    if ([v6 isDeletedOrInTrash])
    {
    }
    else
    {
      unsigned int v7 = [(ICAttachmentPresenter *)self attachment];
      char v8 = [v7 needsInitialFetchFromCloud];

      if (v8) {
        return;
      }
      int v9 = [(ICAttachmentPresenter *)self attachment];
      BOOL v10 = [v9 audioModel];
      id v11 = +[ICAudioRecordingViewController getHostingViewForAttachmentModel:v10 delegate:self];

      [(ICAttachmentPresenter *)self presentAttachmentViewController:v11];
    }
  }
}

- (void)presentURL
{
  v1 = [a1 attachment];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v3, v4, "Presenting URL from attachment %@", v5, v6, v7, v8, v9);
}

void __35__ICAttachmentPresenter_presentURL__block_invoke(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = os_log_create("com.apple.notes", "UI");
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __35__ICAttachmentPresenter_presentURL__block_invoke_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) attachment];
    uint64_t v7 = [v6 shortLoggingDescription];
    int v8 = 138412290;
    uint8_t v9 = v7;
    _os_log_impl(&dword_20BE60000, v5, OS_LOG_TYPE_DEFAULT, "Failed to present URL from attachment %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)presentSynapseLink
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, v0, OS_LOG_TYPE_DEBUG, "Presenting Synapse Link from attachment %@", v1, 0xCu);
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.notes", "UI");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!a2)
  {
    if (v7) {
      __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_2();
    }
    goto LABEL_8;
  }
  if (v7) {
    __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_1(a1, v6);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    int v8 = (void *)MEMORY[0x263F7C238];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_157;
    v11[3] = &unk_2640BAB38;
    id v12 = *(id *)(a1 + 32);
    [v8 activateWithDomainIdentifier:v9 noteIdentifier:v10 completion:v11];
    uint64_t v6 = v12;
LABEL_8:
  }
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_157(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_157_cold_1();
    }
  }
}

- (void)presentQuickLook
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICAttachmentPresenter *)self qlPreviewController];

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(ICQLPreviewController);
    [(ICAttachmentPresenter *)self setQlPreviewController:v4];

    id v5 = [(ICAttachmentPresenter *)self qlPreviewController];
    objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, @"currentPreviewItemIndex", &compoundliteral_7);
  }
  if ([(ICAttachmentPresenter *)self displayShowInNote])
  {
    uint64_t v6 = [(ICAttachmentPresenter *)self showInNoteButton];
    v15[0] = v6;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    int v8 = [(ICAttachmentPresenter *)self qlPreviewController];
    uint64_t v9 = [v8 navigationItem];
    [v9 setRightBarButtonItems:v7];
  }
  uint64_t v10 = [(ICAttachmentPresenter *)self qlPreviewController];
  [v10 setDataSource:self];

  id v11 = [(ICAttachmentPresenter *)self qlPreviewController];
  [v11 setDelegate:self];

  unint64_t v12 = [(ICAttachmentPresenter *)self quickLookFilteredStartingIndex];
  uint64_t v13 = [(ICAttachmentPresenter *)self qlPreviewController];
  [v13 setCurrentPreviewItemIndex:v12];

  __int16 v14 = [(ICAttachmentPresenter *)self qlPreviewController];
  [(ICAttachmentPresenter *)self presentAttachmentViewController:v14];
}

- (void)presentGalleryAttachmentWithSelectedSubAttachment:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [ICGalleryAttachmentEditorController alloc];
  id v5 = [(ICAttachmentPresenter *)self attachment];
  uint64_t v6 = [(ICGalleryAttachmentEditorController *)v4 initWithGalleryAttachment:v5 browserMode:[(ICAttachmentPresenter *)self isAttachmentBrowser] delegate:self];
  [(ICAttachmentPresenter *)self setGalleryAttachmentEditorController:v6];

  if (v19)
  {
    objc_opt_class();
    BOOL v7 = [(ICAttachmentPresenter *)self attachment];
    int v8 = [v7 attachmentModel];
    uint64_t v9 = ICDynamicCast();

    uint64_t v10 = [v19 identifier];
    uint64_t v11 = [v9 indexOfSubAttachmentWithIdentifier:v10];

    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(ICAttachmentPresenter *)self delegate];
  __int16 v14 = [(ICAttachmentPresenter *)self attachment];
  id v15 = [v13 attachmentPresenter:self transitionViewForAttachment:v14];

  uint64_t v16 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];
  uint64_t v17 = [(ICAttachmentPresenter *)self presentingViewController];
  char v18 = [v16 openEditorOnViewController:v17 pageIndex:v12 sourceView:v15];

  if ((v18 & 1) == 0) {
    [(ICAttachmentPresenter *)self setGalleryAttachmentEditorController:0];
  }
}

- (id)transitionViewForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentPresenter *)self delegate];
  uint64_t v6 = [v5 attachmentPresenter:self transitionViewForAttachment:v4];

  return v6;
}

- (id)transitionViewForAttachment:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ICAttachmentPresenter *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  uint64_t v10 = [(ICAttachmentPresenter *)self delegate];
  uint64_t v11 = v10;
  if (v9) {
    [v10 attachmentPresenter:self transitionViewForIndexPath:v7];
  }
  else {
  uint64_t v12 = [v10 attachmentPresenter:self transitionViewForAttachment:v6];
  }

  return v12;
}

- (void)scrollCollectionViewToIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = [(ICAttachmentPresenter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICAttachmentPresenter *)self delegate];
    [v6 scrollCollectionViewToIndexPath:v7];
  }
}

- (void)presentAttachmentViewController:(id)a3
{
  id v4 = a3;
  [(ICAttachmentPresenter *)self setPresentedViewController:v4];
  char v5 = [(ICAttachmentPresenter *)self presentingViewController];
  uint64_t v6 = [MEMORY[0x263F82E00] areAnimationsEnabled];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ICAttachmentPresenter_presentAttachmentViewController___block_invoke;
  v7[3] = &unk_2640B8140;
  v7[4] = self;
  [v5 presentViewController:v4 animated:v6 completion:v7];
}

void __57__ICAttachmentPresenter_presentAttachmentViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) qlPreviewController];
  unint64_t v3 = [v2 currentPreviewItemIndex];

  id v4 = [*(id *)(a1 + 32) quickLookFilteredAttachments];
  unint64_t v5 = [v4 count];

  uint64_t v6 = [*(id *)(a1 + 32) quickLookFilteredAttachments];
  id v7 = v6;
  if (v3 >= v5) {
    [v6 firstObject];
  }
  else {
  id v8 = [v6 objectAtIndexedSubscript:v3];
  }

  [*(id *)(a1 + 32) presentReadOnlyAlertIfNecessaryForAttachment:v8];
}

+ (id)previewViewControllerWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 editable:(BOOL)a7 isFromAttachmentBrowser:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v65[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = [v14 objectAtIndexedSubscript:a5];
  unsigned int v17 = [v16 attachmentType];
  if (v17 == 12) {
    goto LABEL_19;
  }
  unsigned int v18 = v17;
  if (!(_WORD)v17 && ![v16 hasFallbackPDF]) {
    goto LABEL_19;
  }
  BOOL v63 = v8;
  v64 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  v22 = [v13 window];
  v23 = [v22 windowScene];
  v24 = [v23 screen];
  char v25 = objc_msgSend(v24, "ic_isSecure");

  if (v18 > 0xF)
  {
    v26 = 0;
    id v13 = v21;
    id v14 = v20;
    id v15 = v19;
    uint64_t v16 = v64;
    goto LABEL_20;
  }
  id v13 = v21;
  if (((1 << v18) & 0xFC77) == 0)
  {
    id v14 = v20;
    uint64_t v16 = v64;
    if (((1 << v18) & 0x180) != 0)
    {
      id v15 = v19;
      if ((v25 & 1) == 0)
      {
        if (v18 != 7) {
          goto LABEL_39;
        }
        id v33 = (id)[objc_alloc(MEMORY[0x263F5B218]) initWithAttachment:v64];
        id v34 = objc_alloc((Class)get_MKURLParserClass());
        v35 = [v64 URL];
        v36 = (void *)[v34 initWithURL:v35];

        if ([v36 parseIncludingCustomParameters:1])
        {
          v37 = [v36 collectionStorage];
          if (v37)
          {

            uint64_t v16 = v64;
LABEL_38:

LABEL_39:
            id v33 = [v16 URL];
            v55 = [MEMORY[0x263F53C50] sharedConnection];
            if ([v55 effectiveBoolValueForSetting:*MEMORY[0x263F539C0]] == 2)
            {
            }
            else
            {
              int v56 = [getNSSNewsViewControllerClass() canOpenURL:v33];

              if (v56)
              {
                v57 = ICNewsViewController;
LABEL_53:
                v26 = (ICMapViewController *)[[v57 alloc] initWithURL:v33];
                uint64_t v16 = v64;
                [(ICMapViewController *)v26 setAttachment:v64];
                goto LABEL_54;
              }
            }
            v58 = [MEMORY[0x263F53C50] sharedConnection];
            if ([v58 effectiveBoolValueForSetting:*MEMORY[0x263F53A28]] != 2)
            {
              v59 = [v33 scheme];
              if ([v59 length])
              {
                v60 = [v33 scheme];
                if (![v60 caseInsensitiveCompare:@"http"])
                {

LABEL_52:
                  v57 = ICSafariViewController;
                  goto LABEL_53;
                }
                v61 = [v33 scheme];
                uint64_t v62 = [v61 caseInsensitiveCompare:@"https"];

                if (!v62) {
                  goto LABEL_52;
                }
                goto LABEL_50;
              }
            }
LABEL_50:
            v26 = 0;
            uint64_t v16 = v64;
            goto LABEL_54;
          }
        }
        uint64_t v16 = v64;
        if (!v33) {
          goto LABEL_38;
        }
        v45 = (void *)[objc_alloc(MEMORY[0x263F5B218]) initWithAttachment:v64];
        v26 = [[ICMapViewController alloc] initWithAnnotation:v45];
LABEL_37:

LABEL_54:
        goto LABEL_20;
      }
    }
    else
    {
      id v15 = v19;
      if (([v64 needsInitialFetchFromCloud] & 1) == 0)
      {
        v26 = [[ICImagePreviewController alloc] initWithAttachment:v64];
        id v33 = objc_alloc_init(MEMORY[0x263F82828]);
        [v33 setContentMode:1];
        v39 = [(ICMapViewController *)v26 view];
        [v39 addSubview:v33];

        objc_msgSend(v33, "ic_addAnchorsToFillSuperviewWithPadding:", -1.0);
        uint64_t v40 = [v64 image];
        v36 = (void *)v40;
        if (v18 == 11 && !v40)
        {
          objc_opt_class();
          v41 = [v64 attachmentModel];
          v42 = ICDynamicCast();

          if (v42 && [v42 subAttachmentCount])
          {
            v43 = (void *)MEMORY[0x263F5B318];
            v44 = [v42 firstSubAttachment];
            v36 = [v43 imageForSubAttachment:v44];
          }
          else
          {
            v36 = 0;
          }
          uint64_t v16 = v64;
        }
        if (v36)
        {
          [v33 setImage:v36];
        }
        else
        {
          v46 = [MEMORY[0x263F82B60] mainScreen];
          [v46 bounds];
          double v48 = v47;
          double v50 = v49;
          v51 = [MEMORY[0x263F82B60] mainScreen];
          [v51 scale];
          v53 = objc_msgSend(v64, "attachmentPreviewImageWithMinSize:scale:", v48, v50, v52);

          uint64_t v16 = v64;
          v54 = [v53 orientedImage];
          [v33 setImage:v54];
        }
        v45 = [(ICMapViewController *)v26 view];
        objc_msgSend(v45, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
        -[ICMapViewController setPreferredContentSize:](v26, "setPreferredContentSize:");
        goto LABEL_37;
      }
    }
LABEL_19:
    v26 = 0;
    goto LABEL_20;
  }
  id v14 = v20;
  uint64_t v16 = v64;
  if (v25)
  {
    v26 = 0;
    id v15 = v19;
    goto LABEL_20;
  }
  id v15 = v19;
  if ([v64 needsInitialFetchFromCloud]) {
    goto LABEL_19;
  }
  v26 = objc_alloc_init(ICQLPreviewController);
  v27 = [[ICAttachmentPresenter alloc] initWithViewControllerManager:v13 attachments:v14 startingAtIndex:a5 delegate:v19 displayShowInNote:0 editable:v9 presentingViewController:0];
  [(ICAttachmentPresenter *)v27 setQlPreviewController:v26];
  [(ICMapViewController *)v26 setDelegate:v27];
  [(ICMapViewController *)v26 setDataSource:v27];
  [(ICMapViewController *)v26 setCurrentPreviewItemIndex:[(ICAttachmentPresenter *)v27 quickLookFilteredStartingIndex]];
  if (v63)
  {
    v28 = [MEMORY[0x263F086E0] mainBundle];
    v29 = [v28 localizedStringForKey:@"Show in Note" value:&stru_26C10E100 table:0];

    v30 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v29 style:0 target:v27 action:sel_showInNote_];
    v65[0] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
    v32 = [(ICMapViewController *)v26 navigationItem];
    [v32 setRightBarButtonItems:v31];

    uint64_t v16 = v64;
  }
  objc_setAssociatedObject(v26, (const void *)ICAttachmentPreviewViewControllerKey, v27, (void *)0x301);

LABEL_20:

  return v26;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  unint64_t v3 = [v2 keyWindow];
  id v4 = [v3 rootViewController];

  LOBYTE(v2) = [v4 prefersStatusBarHidden];
  return (char)v2;
}

+ (BOOL)shouldCommitPreviewViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    unint64_t v5 = [v4 currentPreviewItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v7 = [v4 currentPreviewItem];
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();

      if ((v8 & 1) == 0) {
        goto LABEL_8;
      }
      BOOL v9 = [v4 currentPreviewItem];
      id v7 = [v9 attachment];
    }
    if (v7)
    {
      uint64_t v10 = [v7 parentAttachment];
      BOOL v11 = v10 == 0;

LABEL_9:
      goto LABEL_10;
    }
LABEL_8:
    BOOL v11 = 1;
    goto LABEL_9;
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)dismiss:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F82E00], "areAnimationsEnabled", a3);

  [(ICAttachmentPresenter *)self dismissAnimated:v4 completion:0];
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  id v7 = [(ICAttachmentPresenter *)self presentedViewController];

  if (v7)
  {
    if (![(ICAttachmentPresenter *)self isDismissing])
    {
      [(ICAttachmentPresenter *)self setIsDismissing:1];
      char v8 = [(ICAttachmentPresenter *)self presentedViewController];
      BOOL v9 = [v8 presentingViewController];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __52__ICAttachmentPresenter_dismissAnimated_completion___block_invoke;
      v11[3] = &unk_2640BA690;
      void v11[4] = self;
      uint64_t v12 = v6;
      [v9 dismissViewControllerAnimated:v4 completion:v11];

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];

    if (v10)
    {
      [(ICAttachmentPresenter *)self setGalleryAttachmentEditorController:0];
      [(ICAttachmentPresenter *)self notifyDelegateDidDismiss];
    }
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_8:
}

uint64_t __52__ICAttachmentPresenter_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDelegateDidDismiss];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 setIsDismissing:0];
}

- (void)notifyDelegateDidDismiss
{
  id v3 = [(ICAttachmentPresenter *)self ic_viewControllerManager];
  BOOL v4 = [v3 currentAttachmentPresenter];

  if (v4 == self)
  {
    unint64_t v5 = [(ICAttachmentPresenter *)self ic_viewControllerManager];
    [v5 setCurrentAttachmentPresenter:0];
  }
  uint64_t v6 = [(ICAttachmentPresenter *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(ICAttachmentPresenter *)self delegate];
    [v8 attachmentPresenterDidDismiss:self];
  }
}

- (void)showInNote:(id)a3
{
  BOOL v4 = [(ICAttachmentPresenter *)self qlPreviewController];

  if (v4)
  {
    unint64_t v5 = [(ICAttachmentPresenter *)self quickLookFilteredAttachments];
    uint64_t v6 = [(ICAttachmentPresenter *)self qlPreviewController];
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "currentPreviewItemIndex"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = [(ICAttachmentPresenter *)self attachment];
  }
  char v7 = [(ICAttachmentPresenter *)self ic_viewControllerManager];
  id v8 = [v10 objectID];
  [v7 selectAttachmentWithObjectID:v8 animated:1];

  BOOL v9 = [(ICAttachmentPresenter *)self eventReporter];
  [v9 submitAttachmentBrowserActionEventForType:3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICAttachmentPresenter *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/AttachmentPresentation/ICAttachmentPresenter.m"])
  {
    char v13 = [(ICAttachmentPresenter *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_7 && (v13 & 1) == 0)
    {
      [(ICAttachmentPresenter *)self previewControllerDidChangeCurrentItem];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAttachmentPresenter;
    [(ICAttachmentPresenter *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (void)presentReadOnlyAlertIfNecessaryForAttachment:(id)a3
{
  id v5 = a3;
  if ([v5 attachmentType] == 1 && objc_msgSend(v5, "hasFallbackPDF"))
  {
    BOOL v4 = [(ICAttachmentPresenter *)self qlPreviewController];
    [v4 showViewOnlyWarning];
  }
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v6 = [(ICAttachmentPresenter *)self quickLookFilteredAttachments];
  unint64_t v7 = [v6 count];

  id v8 = [(ICAttachmentPresenter *)self quickLookFilteredAttachments];
  BOOL v9 = v8;
  if (v7 <= a4) {
    [v8 firstObject];
  }
  else {
  id v10 = [v8 objectAtIndexedSubscript:a4];
  }

  id v11 = [[ICQLItem alloc] initWithAttachment:v10];
  if ([v10 attachmentType] == 6 || objc_msgSend(v10, "hasFallbackPDF"))
  {
    id v12 = [(ICAttachmentPresenter *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      objc_super v14 = [(ICAttachmentPresenter *)self delegate];
      -[ICQLItem setUseFullPDFTransition:](v11, "setUseFullPDFTransition:", [v14 attachmentPresenter:self useFullPDFTransitionForAttachment:v10]);
    }
  }

  return v11;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  BOOL v4 = [(ICAttachmentPresenter *)self quickLookFilteredAttachments];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(ICAttachmentPresenter *)self quickLookFilteredAttachments];
  }
  else {
  uint64_t v6 = [(ICAttachmentPresenter *)self attachments];
  }
  int64_t v7 = [v6 count];

  return v7;
}

- (void)previewControllerDidDismiss:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDelegateDidDismiss];
  uint64_t v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke_cold_1(v2);
  }

  id v3 = objc_msgSend(*(id *)(a1 + 32), "ic_viewControllerManager");
  BOOL v4 = [v3 noteEditorViewController];
  [v4 setIsPreviewingAttachmentFromNote:0];
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v6 = [v5 attachment];
  }
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = [(ICAttachmentPresenter *)self delegate];
    BOOL v9 = [v8 attachmentPresenter:self transitionViewForAttachment:v7];

    goto LABEL_10;
  }
LABEL_7:
  int64_t v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "Could not find attachment for transitioning preview item: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F6BD58];
  v6[0] = *MEMORY[0x263F5AE08];
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v5 = [a3 presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(ICAttachmentPresenter *)self attachment];

  if (v4 == v5)
  {
    [(ICAttachmentPresenter *)self dismiss:self];
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F5A9C0];
    int64_t v7 = [(ICAttachmentPresenter *)self attachment];
    [v8 removeObserver:self name:v6 object:v7];
  }
}

- (void)hardLinksDidDelete:(id)a3
{
}

void __44__ICAttachmentPresenter_hardLinksDidDelete___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) qlPreviewController];
  [v1 reloadData];
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5 = a4;
  if (![(ICAttachmentPresenter *)self isAttachmentEditable]) {
    goto LABEL_8;
  }
  objc_opt_class();
  uint64_t v6 = ICDynamicCast();
  if (v6
    || (objc_opt_class(),
        ICDynamicCast(),
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 attachment],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    id v8 = [v6 attachmentModel];
    int v9 = [v8 canMarkup];

    if (v9) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = 0;
    }
  }
  else
  {
LABEL_8:
    int64_t v10 = 0;
  }

  return v10;
}

- (void)updateEditedPreviewItemAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentPresenter *)self attachment];
  [(ICAttachmentPresenter *)self updateEditedPreviewItem:v5 atURL:v4 shouldAttemptToWriteDataFromURL:1 previewController:0];
}

- (void)updateEditedPreviewItem:(id)a3 atURL:(id)a4 shouldAttemptToWriteDataFromURL:(BOOL)a5 previewController:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_opt_class();
  id v12 = ICDynamicCast();
  if (v12
    || (objc_opt_class(),
        ICDynamicCast(),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 attachment],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12))
  {
    [v10 startAccessingSecurityScopedResource];
    objc_super v14 = [v12 managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke;
    v16[3] = &unk_2640BBA38;
    id v17 = v11;
    id v18 = v12;
    id v19 = v10;
    BOOL v20 = a5;
    id v15 = v12;
    [v14 performBlockAndWait:v16];
  }
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 40);
  if (![*(id *)(a1 + 40) shouldEmbedMarkupDataInMedia])
  {
    id v10 = [MEMORY[0x263F5AC78] markupModelDataFromDataAtURL:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setMarkupModelData:v10];

    id v7 = 0;
LABEL_16:
    objc_super v14 = v7;
    [*v3 attachmentDidChange];
    [*v3 setPreviewUpdateDate:0];
    id v15 = [*v3 managedObjectContext];
    id v17 = v7;
    [v15 save:&v17];
    id v7 = v17;

    if (v7)
    {
      uint64_t v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_1(a1 + 40, (uint64_t)v7, v16);
      }
    }
    os_log_t v9 = [MEMORY[0x263F5B230] sharedGenerator];
    [v9 generatePreviewIfNeededForAttachment:*v3];
    goto LABEL_21;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "ic_isReachable"))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [*(id *)(a1 + 40) media];
      uint64_t v5 = *(void *)(a1 + 48);
      id v18 = 0;
      char v6 = [v4 writeDataFromFileURL:v5 error:&v18];
      id v7 = v18;

      if ((v6 & 1) == 0)
      {
        id v8 = (void *)MEMORY[0x263F5AE60];
        os_log_t v9 = [*v3 shortLoggingDescription];
        [v8 handleFailedAssertWithCondition:"__objc_no", "-[ICAttachmentPresenter updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:]_block_invoke", 1, 1, @"Unable to update data for attachment: %@, %@", v9, v7 functionName simulateCrash showAlert format];
        goto LABEL_21;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 40), "setHasMarkupData:", objc_msgSend(MEMORY[0x263F5AC78], "hasPrivateImageMetadata:", v11));
    id v12 = [MEMORY[0x263F5AC78] cleanImageMetadataFromData:v11];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263F827E8] imageWithData:v12];
      if (v13) {
        [*v3 setCachedImage:v13];
      }
    }
    goto LABEL_16;
  }
  os_log_t v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_2(a1 + 40, v9);
  }

  id v7 = 0;
LABEL_21:

  [*(id *)(a1 + 48) stopAccessingSecurityScopedResource];
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  id v4 = objc_msgSend(MEMORY[0x263F5B520], "sharedInstance", a3, a4);
  char v5 = [v4 isSecureScreenShowing] ^ 1;

  return v5;
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
  [(ICAttachmentPresenter *)self setGalleryAttachmentEditorController:0];

  [(ICAttachmentPresenter *)self notifyDelegateDidDismiss];
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
  uint64_t v3 = [(ICAttachmentPresenter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(ICAttachmentPresenter *)self delegate];
    [v6 handleDeleteAttachmentFromPresenter:self];
  }
  else
  {
    char v5 = (void *)MEMORY[0x263F5AE60];
    [v5 handleFailedAssertWithCondition:"__objc_no", "-[ICAttachmentPresenter galleryAttachmentEditorControllerDeleteAttachment]", 1, 0, @"Delete attachment called on presenter, but not handled by delegate." functionName simulateCrash showAlert format];
  }
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    char v4 = (objc_class *)objc_opt_class();
    char v5 = NSStringFromClass(v4);
    id v6 = [(ICAttachmentPresenter *)self ic_viewControllerManager];
    id v7 = [v6 window];
    id v8 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 window:v7];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v8;

    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  id v11 = self->_eventReporter;

  return v11;
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

- (UITextView)textView
{
  return 0;
}

- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPresenter presentSharingViewForAttachment:fromSourceView:](v6);
  }

  os_log_t v9 = [(ICAttachmentPresenter *)self presentingViewController];
  id v10 = objc_msgSend(v9, "ic_topViewController");

  id v11 = (void *)MEMORY[0x263F5B308];
  v21[0] = v6;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v13 = objc_msgSend(v10, "ic_window");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke;
  v17[3] = &unk_2640B94C0;
  id v18 = v6;
  id v19 = v7;
  id v20 = v10;
  id v14 = v10;
  id v15 = v7;
  id v16 = v6;
  [v11 generatePDFsIfNecessaryForGalleryAttachments:v12 displayWindow:v13 presentingViewController:v14 completionHandler:v17];
}

void __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = +[ICAttachmentActivityViewController makeWithAttachment:*(void *)(a1 + 32) quickLookItemDelegate:0 completion:&__block_literal_global_29];
  uint64_t v3 = *(void *)(v1 + 8);
  char v4 = [v2 popoverPresentationController];
  [v4 setSourceView:v3];

  [*(id *)(v1 + 16) presentViewController:v2 animated:1 completion:&__block_literal_global_215];
  id v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke_cold_1(v1);
  }
}

- (void)presentExportViewForAttachment:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPresenter presentExportViewForAttachment:](v4);
  }

  id v6 = [(ICAttachmentPresenter *)self presentingViewController];
  id v7 = objc_msgSend(v6, "ic_topViewController");

  id v8 = (void *)MEMORY[0x263F5B308];
  v17[0] = v4;
  os_log_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v10 = objc_msgSend(v7, "ic_window");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke;
  v13[3] = &unk_2640B94C0;
  id v14 = v4;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v4;
  [v8 generatePDFsIfNecessaryForGalleryAttachments:v9 displayWindow:v10 presentingViewController:v11 completionHandler:v13];
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke(id *a1)
{
  v39[1] = *MEMORY[0x263EF8340];
  id v2 = a1 + 4;
  int v3 = [a1[4] isPasswordProtected];
  id v4 = *v2;
  if (v3)
  {
    id v5 = [v4 media];
    id v6 = [v5 decryptedData];

    if (!v6)
    {
      id v14 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_1((uint64_t)v2);
      }
      goto LABEL_25;
    }
    id v7 = [*v2 userTitle];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v15 = [*v2 title];
      id v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = [*v2 defaultTitle];
      }
      id v9 = v17;
    }
    id v18 = (void *)MEMORY[0x263F1D920];
    id v19 = [a1[4] typeUTI];
    uint64_t v20 = [v18 importedTypeWithIdentifier:v19];
    id v21 = (void *)v20;
    v22 = (void *)*MEMORY[0x263F1D9B8];
    if (v20) {
      v22 = (void *)v20;
    }
    id v23 = v22;

    v24 = [MEMORY[0x263F08850] defaultManager];
    char v25 = [v24 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];

    v26 = [v25 URLByAppendingPathComponent:@"AudioExport" isDirectory:1];

    v27 = [MEMORY[0x263F08C38] UUID];
    v28 = [v27 UUIDString];
    v29 = [v26 URLByAppendingPathComponent:v28 isDirectory:1];

    v30 = objc_msgSend(v9, "ic_sanitizedFilenameString");
    v31 = [v29 URLByAppendingPathComponent:v30 conformingToType:v23];

    uint64_t v32 = [v23 preferredFilenameExtension];
    id v33 = (void *)v32;
    if (v32) {
      id v34 = (__CFString *)v32;
    }
    else {
      id v34 = &stru_26C10E100;
    }
    v35 = [v31 URLByAppendingPathComponent:v34];

    id v38 = 0;
    [v6 writeToURL:v35 options:1 error:&v38];
    id v36 = v38;
    [a1[5] setTemporaryExportURLToRemove:v35];
    if (v36)
    {
      v37 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_3((uint64_t)v2, (uint64_t)v36, v37);
      }
    }
LABEL_23:
    id v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_2((uint64_t)v2);
    }
LABEL_25:
    id v11 = v14;
    goto LABEL_26;
  }
  uint64_t v10 = [v4 previewItemURL];
  if (!v10) {
    goto LABEL_23;
  }
  id v11 = (void *)v10;
  id v12 = objc_alloc(MEMORY[0x263F82698]);
  v39[0] = v11;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  id v14 = [v12 initForExportingURLs:v13 asCopy:1];

  [v14 setDelegate:a1[5]];
  [a1[6] presentViewController:v14 animated:1 completion:&__block_literal_global_225];
LABEL_26:
}

- (void)removeTempooraryExportURL
{
  int v3 = [(ICAttachmentPresenter *)self temporaryExportURLToRemove];

  if (v3)
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v4 = [(ICAttachmentPresenter *)self temporaryExportURLToRemove];
    [v5 removeItemAtURL:v4 error:0];
  }
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentedViewController:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (ICViewControllerManager)ic_viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ic_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (void)setIc_viewControllerManager:(id)a3
{
}

- (unint64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setStartingIndex:(unint64_t)a3
{
  self->_startingIndex = a3;
}

- (void)setQuickLookFilteredAttachments:(id)a3
{
}

- (void)setQuickLookFilteredStartingIndex:(unint64_t)a3
{
  self->_quickLookFilteredStartingIndex = a3;
}

- (ICAttachmentPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICAttachmentPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)displayShowInNote
{
  return self->_displayShowInNote;
}

- (void)setDisplayShowInNote:(BOOL)a3
{
  self->_displayShowInNote = a3;
}

- (BOOL)isAttachmentEditable
{
  return self->_attachmentEditable;
}

- (void)setAttachmentEditable:(BOOL)a3
{
  self->_attachmentEditable = a3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICQLPreviewController)qlPreviewController
{
  return (ICQLPreviewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQlPreviewController:(id)a3
{
}

- (void)setShowInNoteButton:(id)a3
{
}

- (ICGalleryAttachmentEditorController)galleryAttachmentEditorController
{
  return self->_galleryAttachmentEditorController;
}

- (void)setGalleryAttachmentEditorController:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void)setEventReporter:(id)a3
{
}

- (NSURL)temporaryExportURLToRemove
{
  return self->_temporaryExportURLToRemove;
}

- (void)setTemporaryExportURLToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryExportURLToRemove, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_galleryAttachmentEditorController, 0);
  objc_storeStrong((id *)&self->_showInNoteButton, 0);
  objc_storeStrong((id *)&self->_qlPreviewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quickLookFilteredAttachments, 0);
  objc_destroyWeak((id *)&self->_ic_viewControllerManager);
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

- (ICAttachment)displayedAttachment
{
  int v3 = [(ICAttachmentPresenter *)self presentedViewController];
  objc_opt_class();
  id v4 = ICDynamicCast();
  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 currentPreviewItem];
    id v6 = ICCheckedDynamicCast();

    id v7 = [v6 attachment];
  }
  else
  {
    id v8 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];

    if (v8)
    {
      id v9 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];
      id v7 = [v9 galleryAttachment];
    }
    else
    {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICAttachmentPresenter(AttachmentState) displayedAttachment]", 1, 0, @"Unknown type of attachment controller: %@", v3 functionName simulateCrash showAlert format];
      id v7 = 0;
    }
  }

  return (ICAttachment *)v7;
}

- (ICAttachment)selectedSubAttachment
{
  int v3 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];

  if (v3)
  {
    id v4 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];
    id v5 = [v4 extractedDocumentController];
    id v6 = [v5 selectedScanDataDelegate];
  }
  else
  {
    id v6 = 0;
  }

  return (ICAttachment *)v6;
}

- (NSDictionary)presentedAttachmentUIState
{
  int v3 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];

  if (v3)
  {
    id v4 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];
    id v5 = [v4 attachmentUIState];
  }
  else
  {
    id v4 = [(ICAttachmentPresenter *)self presentedViewController];
    id v6 = ICProtocolCast();
    id v5 = [v6 attachmentUIState];
  }

  return (NSDictionary *)v5;
}

- (void)applyPresentedAttachmentUIStateIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];

  if (v5)
  {
    id v6 = [(ICAttachmentPresenter *)self galleryAttachmentEditorController];
  }
  else
  {
    id v7 = [(ICAttachmentPresenter *)self presentedViewController];
    ICProtocolCast();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = v8;
  }
  id v9 = v6;
  [v6 applyAttachmentUIStateIfNecessary:v4];
}

void __35__ICAttachmentPresenter_presentURL__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) attachment];
  id v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v3, v4, "Presented URL from attachment %@", v5, v6, v7, v8, v9);
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Finished navigation to Synapse Link from attachment %@", (uint8_t *)&v3, 0xCu);
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_20BE60000, v0, v1, "Error navigating to Synapse Link from attachment %@. Error: %@");
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_157_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_20BE60000, v0, v1, "Error launching QuickNote with Synapse Link from attachment %@. Error: %@");
}

void __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "isPreviewingAttachmentFromNote = NO, preview did dismiss", v1, 2u);
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Unable to save after updating data for attachment: %@, %@", v5, 0x16u);
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v3 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Updated content URL is not reachable attachment: %@", v4, 0xCu);
}

- (void)presentSharingViewForAttachment:(void *)a1 fromSourceView:.cold.1(void *a1)
{
  os_log_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Presenting activity view controller… {attachment: %@}", v4, v5, v6, v7, v8);
}

void __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Presented activity view controller… {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)presentExportViewForAttachment:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Presenting save panel for attachment… {attachment: %@}", v4, v5, v6, v7, v8);
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Cannot present document view controller because decrypted data is unavailable {attachment: %@}", v4, v5, v6, v7, v8);
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_2(uint64_t a1)
{
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Cannot present document view controller because attachment doesn't have preview URL {attachment: %@}", v4, v5, v6, v7, v8);
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2_2(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_20BE60000, a3, OS_LOG_TYPE_DEBUG, "Cannot present document view controller {attachment: %@, error: %@}", v5, 0x16u);
}

@end
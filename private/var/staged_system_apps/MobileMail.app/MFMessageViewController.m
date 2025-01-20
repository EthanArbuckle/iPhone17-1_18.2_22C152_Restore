@interface MFMessageViewController
- (BOOL)automaticallyCollapseQuotedContent;
- (BOOL)canSaveAllAttachmentsInContext:(int64_t)a3;
- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3;
- (BOOL)configuredForSingleMessageDisplay;
- (BOOL)didCompleteFirstPaint;
- (BOOL)isShowingGroupedSenderMessageListForMessageContentView:(id)a3;
- (BOOL)isSourceManagedForURL:(id)a3;
- (BOOL)previewController:(id)a3 canEditItem:(id)a4;
- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4;
- (BOOL)showsBanners;
- (CGRect)documentInteractionControllerRectForPreview:(id)a3;
- (CNContactViewController)contactViewController;
- (ComposeCapable)scene;
- (EFFuture)predictedMailbox;
- (EMCachingContactStore)contactStore;
- (EMSecurityInformation)securityInformation;
- (MFContactCardInteractions)contactCardInteractions;
- (MFContactMessageInteraction)contactInteraction;
- (MFMailAccountsProvider)accountsProvider;
- (MFMailboxProvider)mailboxProvider;
- (MFMessageContentView)messageContentView;
- (MFMessageViewController)initWithScene:(id)a3 accountsController:(id)a4;
- (MFMessageViewControllerDelegate)delegate;
- (MFScreenshotService)screenshotService;
- (MFSuggestionController)suggestionController;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MessageContentRepresentationRequest)contentRequest;
- (MessageContentRequestRetryMiddleware)retryMiddleware;
- (QLPreviewController)previewController;
- (UIDocumentInteractionController)doc;
- (id)_attachmentShowcase;
- (id)_contactViewControllerForAddress:(id)a3 forAtomType:(unint64_t)a4;
- (id)_delegateDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4;
- (id)_makeFileCopyOfEditedQuickLookFileToLocalContainer:(id)a3 preferredFileName:(id)a4;
- (id)additionalActivitiesForDocumentInteractionController:(id)a3;
- (id)allMediaAttachmentFutures;
- (id)assetViewerManager;
- (id)contactStoreForAttachmentShowcase:(id)a3;
- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3;
- (id)conversationItemHeader:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)documentInteractionControllerMarkupDismissActions:(id)a3;
- (id)documentInteractionControllerTransitionImageForPreview:(id)a3 contentRect:(CGRect *)a4;
- (id)documentInteractionControllerViewForPreview:(id)a3;
- (id)excludedActivityTypesForDocumentInteractionController:(id)a3;
- (id)localizedTitleForSaveAllAttachmentsAction;
- (id)messageContentRepresentationRequestForScreenshotService:(id)a3;
- (id)messageSourceMailboxObjectIDForMessageContentView:(id)a3;
- (id)participantHeaderForContactStore:(id)a3;
- (id)popoverManagerForForConversationItemHeader:(id)a3;
- (id)presentingViewControllerForAttachmentShowcase:(id)a3;
- (id)presentingViewControllerForMessageContentView:(id)a3;
- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3;
- (id)viewControllerForPresentingSuggestions;
- (int64_t)_dataOwnerForCopy;
- (int64_t)_dataOwnerForPaste;
- (int64_t)numberOfMessagesInConversationForConversationItemHeaderBlock:(id)a3;
- (void)_appIntentRemovedFollowUp:(id)a3;
- (void)_appIntentUnsubscribed:(id)a3;
- (void)_getNumberOfImages:(unint64_t *)a3 videos:(unint64_t *)a4 undownloaded:(unint64_t *)a5;
- (void)_performMailAction:(int64_t)a3 withMarkedUpFileAttachments:(id)a4;
- (void)_presentBIMILearnMoreViewController;
- (void)_previewURL:(id)a3 withEditingEnabled:(BOOL)a4;
- (void)_sceneMovedtoForeground:(id)a3;
- (void)_setAttachmentOriginRect:(CGRect)a3 scale:(double)a4;
- (void)_setupHeaderViewForContactViewController:(id)a3;
- (void)_showSelectedContentRepresentation:(id)a3 exchangeEventUID:(int)a4 fromRect:(CGRect)a5 view:(id)a6;
- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5;
- (void)contactMessageInteraction:(id)a3 didUpdateHeaderView:(id)a4;
- (void)conversationItemHeader:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5;
- (void)conversationItemHeader:(id)a3 didSelectAddressAtom:(id)a4 forAtomType:(unint64_t)a5;
- (void)conversationItemHeader:(id)a3 didTapRevealActionsButton:(id)a4;
- (void)conversationItemHeader:(id)a3 presentViewController:(id)a4;
- (void)conversationItemHeaderDidTapBIMILearnMore:(id)a3;
- (void)conversationItemHeaderWasTapped:(id)a3;
- (void)dealloc;
- (void)didStartDownloadForContentItemWithProgress:(id)a3;
- (void)dismissMarkupViewController;
- (void)hideMenuForSelectedContentRepresentation;
- (void)loadView;
- (void)markupURL:(id)a3;
- (void)messageContentView:(id)a3 clearSuggestionsBannerAnimated:(BOOL)a4;
- (void)messageContentView:(id)a3 clickedLinkInMessage:(id)a4 scheme:(id)a5;
- (void)messageContentView:(id)a3 didChangeSelectedHTML:(id)a4;
- (void)messageContentView:(id)a3 didEndZoomingMessageWithOffset:(CGPoint)a4;
- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4;
- (void)messageContentView:(id)a3 didLoadSecurityInformation:(id)a4;
- (void)messageContentView:(id)a3 didTapRevealActionsButton:(id)a4;
- (void)messageContentView:(id)a3 didTapUndoSendButton:(id)a4;
- (void)messageContentView:(id)a3 expandQuoteAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5;
- (void)messageContentView:(id)a3 handleContentRepresentation:(id)a4;
- (void)messageContentView:(id)a3 loadingIndicatorDidChangeVisibility:(BOOL)a4;
- (void)messageContentView:(id)a3 openPossibleStoreURL:(id)a4;
- (void)messageContentView:(id)a3 scrollToRect:(CGRect)a4;
- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4;
- (void)messageContentView:(id)a3 webViewDidTerminateWithReason:(int64_t)a4;
- (void)messageContentViewContentLayerFinished:(id)a3;
- (void)messageContentViewDidDisplayContent:(id)a3 success:(BOOL)a4;
- (void)messageContentViewDidFinishFirstPaint:(id)a3;
- (void)messageContentViewWillBeginZoomingMessage:(id)a3;
- (void)messageViewControllerDidTapToExpand;
- (void)prepareForQuickReplyAnimationWithContext:(id)a3;
- (void)prepareForReuse;
- (void)presentMarkupViewController:(id)a3;
- (void)presentSuggestionViewController:(id)a3;
- (void)previewURL:(id)a3;
- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3;
- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4;
- (void)setAvatarGenerator:(id)a3;
- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3;
- (void)setContactCardInteractions:(id)a3;
- (void)setContactInteraction:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setContentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCompleteFirstPaint:(BOOL)a3;
- (void)setDoc:(id)a3;
- (void)setMessageContentView:(id)a3;
- (void)setPredictedMailbox:(id)a3;
- (void)setPreviewController:(id)a3;
- (void)setRetryMiddleware:(id)a3;
- (void)setScene:(id)a3;
- (void)setSecurityInformation:(id)a3;
- (void)setSuggestionController:(id)a3;
- (void)showMenuForSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5;
- (void)showSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5;
- (void)showSelectedExchangeEventUID:(int)a3 fromRect:(CGRect)a4 view:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation MFMessageViewController

- (MFMessageViewController)initWithScene:(id)a3 accountsController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageViewController;
  v8 = [(MFMessageViewController *)&v15 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    uint64_t v10 = [v7 mailboxProvider];
    mailboxProvider = v9->_mailboxProvider;
    v9->_mailboxProvider = (MFMailboxProvider *)v10;

    uint64_t v12 = [v7 accountsProvider];
    accountsProvider = v9->_accountsProvider;
    v9->_accountsProvider = (MFMailAccountsProvider *)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(MFMessageContentView *)self->_messageContentView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MFMessageViewController;
  [(MFMessageViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v13 = [(MFMessageViewController *)self scene];
  id v3 = [objc_alloc((Class)MFMessageContentView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setDelegate:self];
  [v3 setDataSource:self];
  v4 = [(MFMessageViewController *)self mailboxProvider];
  [v3 setMailboxProvider:v4];

  v5 = [v13 daemonInterface];
  [v3 setDaemonInterface:v5];

  id v6 = [v13 brandIndicatorProvider];
  [v3 setBrandIndicatorProvider:v6];

  id v7 = [(MFMessageViewController *)self avatarGenerator];
  [v3 setAvatarGenerator:v7];

  v8 = [(MFMessageViewController *)self contentRequest];

  if (v8)
  {
    v9 = [(MFMessageViewController *)self contentRequest];
    [v3 setContentRequest:v9];
  }
  [v3 setAutomaticallyCollapseQuotedContent:[self automaticallyCollapseQuotedContent]];
  [(MFMessageViewController *)self setMessageContentView:v3];
  [(MFMessageViewController *)self setView:v3];
  uint64_t v10 = [MFSuggestionController alloc];
  v11 = [v3 headerView];
  uint64_t v12 = [(MFSuggestionController *)v10 initWithDelegate:self headerView:v11];
  [(MFMessageViewController *)self setSuggestionController:v12];
}

- (void)viewDidAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MFMessageViewController;
  [(MFMessageViewController *)&v20 viewDidAppear:a3];
  v4 = [(MFMessageViewController *)self view];
  if ((*((unsigned char *)&self->_flags + 1) & 0x40) != 0)
  {
    id v6 = [(MFMessageViewController *)self delegate];
    v5 = [v6 messageViewControllerMessageListMailboxScope:self];
  }
  else
  {
    v5 = 0;
  }
  id v7 = [(MFMessageViewController *)self scene];
  v8 = [v7 daemonInterface];
  v9 = [v8 interactionLogger];
  uint64_t v10 = [v4 contentRequest];
  v11 = [v10 message];
  [v9 viewingStartedForMessage:v11 messageListScope:v5];

  if ([v4 hasVisibleContent])
  {
    uint64_t v12 = +[NSNotificationCenter defaultCenter];
    [v12 postNotificationName:MFMessageContentViewDidAppear object:v4];
  }
  id v13 = [[MFScreenshotService alloc] initWithDelegate:self];
  screenshotService = self->_screenshotService;
  self->_screenshotService = v13;

  objc_super v15 = self->_screenshotService;
  v16 = [v7 screenshotService];
  [v16 setDelegate:v15];

  if ((+[EMServerConfiguration isCacheRecent] & 1) == 0) {
    +[EMServerConfiguration refreshAsync];
  }
  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"_sceneMovedtoForeground:" name:UISceneWillEnterForegroundNotification object:v7];

  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"_appIntentUnsubscribed:" name:@"AppIntentUnsubscribed" object:0];

  v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"_appIntentRemovedFollowUp:" name:@"AppIntentRemovedFollowUp" object:0];
}

- (void)_appIntentUnsubscribed:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  v8 = self;
  v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&v6];
}

- (void)_appIntentRemovedFollowUp:(id)a3
{
  uint64_t v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)_sceneMovedtoForeground:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C0934;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  id v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (int64_t)_dataOwnerForPaste
{
  v2 = [(MFMessageViewController *)self messageContentView];
  if ([v2 sourceIsManaged]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)_dataOwnerForCopy
{
  v2 = [(MFMessageViewController *)self messageContentView];
  if ([v2 sourceIsManaged]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MFMessageViewController;
  [(MFMessageViewController *)&v16 viewDidDisappear:a3];
  id v4 = [(MFMessageViewController *)self messageContentView];
  [v4 clearSelectedHTML];
  [(MFMessageViewController *)self messageContentView:v4 didChangeSelectedHTML:0];
  uint64_t v5 = [v4 contentRequest];
  uint64_t v6 = [v5 message];

  id v7 = [(MFMessageViewController *)self scene];
  v8 = [v7 daemonInterface];
  v9 = [v8 interactionLogger];
  [v9 viewingEndedForMessage:v6];

  uint64_t v10 = [v7 screenshotService];
  v11 = [v10 delegate];
  unsigned int v12 = [v11 isEqual:self->_screenshotService];

  if (v12)
  {
    screenshotService = self->_screenshotService;
    self->_screenshotService = 0;

    v14 = [v7 screenshotService];
    [v14 setDelegate:0];
  }
  objc_super v15 = +[NSNotificationCenter defaultCenter];
  [v15 removeObserver:self];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v6 = 2;
    }
    else {
      int v6 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 8;
    }
    else {
      int v8 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 16;
    }
    else {
      int v9 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 32;
    }
    else {
      int v10 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 64;
    }
    else {
      int v11 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 128;
    }
    else {
      int v12 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 256;
    }
    else {
      int v13 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 512;
    }
    else {
      int v14 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 1024;
    }
    else {
      int v15 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 2048;
    }
    else {
      int v16 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 4096;
    }
    else {
      int v17 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x2000;
    }
    else {
      int v18 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x4000;
    }
    else {
      int v19 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x8000;
    }
    else {
      int v20 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 0x10000;
    }
    else {
      int v21 = 0;
    }
    self->_flags = ($EEC4610695C90B111D72768D07785D19)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v21);
    uint64_t v5 = obj;
  }
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3
{
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_automaticallyCollapseQuotedContent = a3;
  id v6 = [(MFMessageViewController *)self messageContentView];
  [v6 setAutomaticallyCollapseQuotedContent:v5 reloadIfNeeded:v4];
}

- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_configuredForSingleMessageDisplay = a3;
  BOOL v5 = [(MFMessageViewController *)self traitCollection];
  unsigned int v6 = [v5 mf_hasCompactDimension];

  int v7 = [(MFMessageViewController *)self messageContentView];
  if (v6) {
    [v7 setShowMessageFooter:!v3];
  }
  else {
    [v7 setShowMessageFooter:1];
  }

  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = [(MFMessageViewController *)self messageContentView];
    int v9 = [v8 headerView];
    int v10 = [v9 headerBlocks];

    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        int v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 setShowsHeaderDetails:0 animated:0];
          }
          int v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMessageViewController *)self messageContentView];
  [v4 prepareForQuickReplyAnimationWithContext:v5];
}

- (void)setContentRequest:(id)a3
{
  id v5 = (MessageContentRepresentationRequest *)a3;
  unsigned int v6 = v5;
  if (self->_contentRequest == v5 && [(MessageContentRepresentationRequest *)v5 state] != (id)3)
  {
    if (self->_contentRequest == v6) {
      int v10 = @"assigning the same contentRequest";
    }
    else {
      int v10 = @"message content representation request failed";
    }
    id v11 = v10;
    uint64_t v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 134218242;
      *(void *)&location[4] = self;
      __int16 v16 = 2114;
      long long v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p: Skipping setting the content request: %{public}@", location, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_contentRequest, a3);
    [(MFMessageViewController *)self setDidCompleteFirstPaint:0];
    int v7 = [(MFMessageViewController *)self messageContentView];
    [v7 setContentRequest:v6];

    [(MFMessageViewController *)self setRetryMiddleware:0];
    if (v6)
    {
      *(void *)location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, self);
      int v8 = [MessageContentRequestRetryMiddleware alloc];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001C14C8;
      v13[3] = &unk_100604FE8;
      objc_copyWeak(&v14, (id *)location);
      int v9 = [(MessageContentRequestRetryMiddleware *)v8 initWithMessageContentRequest:v6 handler:v13];
      [(MFMessageViewController *)self setRetryMiddleware:v9];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)location);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMessageViewController;
  [(MFMessageViewController *)&v5 traitCollectionDidChange:v4];
  [(MFMessageViewController *)self setConfiguredForSingleMessageDisplay:[(MFMessageViewController *)self configuredForSingleMessageDisplay]];
}

- (void)hideMenuForSelectedContentRepresentation
{
  id v2 = [(MFMessageViewController *)self doc];
  [v2 dismissMenuAnimated:1];
}

- (void)showMenuForSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  int v13 = [(MFMessageViewController *)self messageContentView];
  id v14 = [v13 scrollView];
  [v14 zoomScale];
  -[MFMessageViewController _setAttachmentOriginRect:scale:](self, "_setAttachmentOriginRect:scale:", x, y, width, height, v15);

  __int16 v16 = [(MFMessageViewController *)self _attachmentShowcase];
  long long v17 = [v16 documentInteractionControllerForContentRepresentation:v11];

  [v17 setDelegate:self];
  long long v18 = [(MFMessageViewController *)self messageContentView];
  [v17 setIsContentManaged:[v18 sourceIsManaged]];

  [(MFMessageViewController *)self setDoc:v17];
  int v19 = [v11 contentItem];
  int v20 = [v19 uniformTypeIdentifier];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1001C1A48;
  v34[4] = sub_1001C1A58;
  id v35 = (id)0xAAAAAAAAAAAAAAAALL;
  id v21 = v17;
  id v35 = v21;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_1001C1A60;
  v28 = &unk_10060C600;
  objc_copyWeak(&v32, &location);
  id v22 = v20;
  id v29 = v22;
  id v23 = v11;
  id v30 = v23;
  v31 = v34;
  [v21 _setCompletionWithItemsHandler:&v25];
  if ((objc_msgSend(v21, "presentOptionsMenuFromRect:inView:animated:", v12, 1, x, y, width, height, v25, v26, v27, v28) & 1) == 0)
  {
    v24 = MFLogGeneral();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_10045CE4C((uint64_t)v23, v24);
    }

    if (objc_msgSend(v22, "ef_conformsToRFC822UTType")) {
      -[MFMessageViewController showSelectedContentRepresentation:fromRect:view:](self, "showSelectedContentRepresentation:fromRect:view:", v23, v12, x, y, width, height);
    }
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
}

- (void)showSelectedExchangeEventUID:(int)a3 fromRect:(CGRect)a4 view:(id)a5
{
}

- (void)showSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5
{
}

- (void)_showSelectedContentRepresentation:(id)a3 exchangeEventUID:(int)a4 fromRect:(CGRect)a5 view:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v11 = *(void *)&a4;
  id v25 = a3;
  id v13 = a6;
  id v14 = [(MFMessageViewController *)self messageContentView];
  double v15 = [v14 scrollView];
  [v15 zoomScale];
  -[MFMessageViewController _setAttachmentOriginRect:scale:](self, "_setAttachmentOriginRect:scale:", x, y, width, height, v16);

  long long v17 = +[MFAttachmentShowcaseInformation showcaseInformation];
  [v17 setShouldAnimate:1];
  long long v18 = [(MFMessageViewController *)self messageContentView];
  [v17 setFromManagedAccount:[v18 sourceIsManaged]];

  [v17 setOriginRect:x, y, width, height];
  [v17 setOriginView:v13];
  int v19 = [(MFMessageViewController *)self contentRequest];
  int v20 = [v19 message];
  [v17 setMessage:v20];

  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    id v21 = [(MFMessageViewController *)self delegate];
    id v22 = [v21 messageSourceMailboxObjectIDForMessageViewController:self];
    [v17 setMailboxObjectID:v22];
  }
  id v23 = [(MFMessageViewController *)self _attachmentShowcase];
  if (v11)
  {
    [v23 presentExchangeEventUID:v11 showcaseInfo:v17 delegate:self completion:0];
  }
  else
  {
    v24 = [(MFMessageViewController *)self scene];
    [v23 presentContentRepresentation:v25 scene:v24 showcaseInfo:v17 delegate:self completion:&stru_10060C620];
  }
}

- (void)didStartDownloadForContentItemWithProgress:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    id v4 = [(MFMessageViewController *)self delegate];
    [v4 messageViewController:self didStartDownloadForContentItemWithProgress:v5];
  }
}

- (id)participantHeaderForContactStore:(id)a3
{
  id v4 = a3;
  participantHeader = self->_participantHeader;
  if (!participantHeader
    || ([(MFConversationItemHeaderBlock *)participantHeader contactStore],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != v4))
  {
    int v7 = [MFConversationItemHeaderBlock alloc];
    int v8 = [(MFMessageViewController *)self accountsProvider];
    int v9 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v7, "initWithFrame:contactStore:accountsProvider:", v4, v8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    int v10 = self->_participantHeader;
    self->_participantHeader = v9;

    [(MFConversationItemHeaderBlock *)self->_participantHeader setDelegate:self];
  }
  uint64_t v11 = self->_participantHeader;

  return v11;
}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  if (*(unsigned char *)&self->_flags)
  {
    id v6 = [(MFMessageViewController *)self delegate];
    [v6 messageViewController:self didFinishRenderingWithHeight:a4];
  }
}

- (void)messageContentViewDidFinishFirstPaint:(id)a3
{
  [(MFMessageViewController *)self setDidCompleteFirstPaint:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id v4 = [(MFMessageViewController *)self delegate];
    [v4 messageViewControllerDidFinishFirstPaint:self];
  }
}

- (void)messageContentViewDidDisplayContent:(id)a3 success:(BOOL)a4
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    BOOL v4 = a4;
    id v6 = [(MFMessageViewController *)self delegate];
    [v6 messageViewControllerDidDisplayContent:self success:v4];
  }
}

- (void)messageContentView:(id)a3 expandQuoteAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    double y = a5.y;
    double x = a5.x;
    double v7 = a4.y;
    double v8 = a4.x;
    id v10 = [(MFMessageViewController *)self delegate];
    [v10 messageViewController:self didTapShowMoreAtCollapsedOffset:v8 expandedOffset:v7 x:x y:y];
  }
}

- (void)messageContentView:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v6 = a4;
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    id v5 = [(MFMessageViewController *)self delegate];
    [v5 messageViewController:self didTapRevealActionsButton:v6];
  }
}

- (void)messageContentView:(id)a3 didTapUndoSendButton:(id)a4
{
  id v6 = a4;
  if (*((unsigned char *)&self->_flags + 1))
  {
    id v5 = [(MFMessageViewController *)self delegate];
    [v5 messageViewController:self didTapUndoSendButton:v6];
  }
}

- (void)messageContentViewWillBeginZoomingMessage:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    id v4 = [(MFMessageViewController *)self delegate];
    [v4 messageViewControllerContentViewWillBeginZooming:self];
  }
}

- (void)messageContentView:(id)a3 didEndZoomingMessageWithOffset:(CGPoint)a4
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    double y = a4.y;
    double x = a4.x;
    id v7 = [(MFMessageViewController *)self delegate];
    [v7 messageViewController:self contentViewDidEndZoomingMessageWithOffset:x, y];
  }
}

- (void)messageContentView:(id)a3 didChangeSelectedHTML:(id)a4
{
  id v7 = (__CFString *)a4;
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
  {
    id v5 = [(MFMessageViewController *)self delegate];
    if (v7) {
      CFStringRef v6 = v7;
    }
    else {
      CFStringRef v6 = &stru_100619928;
    }
    [v5 messageViewController:self didChangeSelectedHTML:v6];
  }
}

- (void)messageContentView:(id)a3 loadingIndicatorDidChangeVisibility:(BOOL)a4
{
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    BOOL v4 = a4;
    id v6 = [(MFMessageViewController *)self delegate];
    [v6 messageViewController:self loadingIndicatorDidChangeVisibility:v4];
  }
}

- (void)messageViewControllerDidTapToExpand
{
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    id v3 = [(MFMessageViewController *)self delegate];
    [v3 messageViewControllerDidTapToExpand:self];
  }
}

- (id)presentingViewControllerForMessageContentView:(id)a3
{
  BOOL v4 = [(MFMessageViewController *)self delegate];
  id v5 = [v4 presentingViewControllerForMessageViewController:self];

  return v5;
}

- (void)messageContentView:(id)a3 scrollToRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(MFMessageViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 messageViewController:self scrollToRect:x, y, width, height];
  }
}

- (void)messageContentView:(id)a3 didLoadSecurityInformation:(id)a4
{
  id v7 = a4;
  -[MFMessageViewController setSecurityInformation:](self, "setSecurityInformation:");
  id v5 = [(MFMessageViewController *)self contactInteraction];

  if (v5)
  {
    id v6 = [(MFMessageViewController *)self contactInteraction];
    [v6 updateWithSecurityInformation:v7];
  }
}

- (void)messageContentView:(id)a3 clickedLinkInMessage:(id)a4 scheme:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  double v8 = [(MFMessageViewController *)self scene];
  id v9 = [v8 daemonInterface];
  id v10 = [v9 interactionLogger];
  [v10 clickedLinkInMessage:v11 scheme:v7];
}

- (void)messageContentView:(id)a3 openPossibleStoreURL:(id)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1001C2A00;
  id v12 = &unk_10060C648;
  id v13 = self;
  id v5 = a4;
  id v14 = v5;
  id v6 = +[MFURLRoutingRequest requestWithURL:v5 builderBlock:&v9];
  id v7 = [(MFMessageViewController *)self scene];
  double v8 = [v7 urlRouter];
  [v8 routeRequest:v6];
}

- (void)messageContentViewContentLayerFinished:(id)a3
{
  id v3 = +[UIApplication sharedApplication];
  [v3 _messageContentLayerFinished];
}

- (void)messageContentView:(id)a3 handleContentRepresentation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MFMessageViewController *)self suggestionController];
  double v8 = [v7 createAnalysisOperation];
  [v8 handleContentRepresentation:v6 allowUnsubscribe:[v9 hideSenderSpecificBanners] ^ 1];
}

- (void)messageContentView:(id)a3 clearSuggestionsBannerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(MFMessageViewController *)self suggestionController];
  [v5 clearSuggestionsBannerAnimated:v4];
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  id v8 = a4;
  id v5 = [(MFMessageViewController *)self scene];
  id v6 = [v5 daemonInterface];
  id v7 = [v6 messageRepository];
  [v7 noteViewOfRemoteContentLinks:v8];
}

- (void)messageContentView:(id)a3 webViewDidTerminateWithReason:(int64_t)a4
{
  if (*((unsigned char *)&self->_flags + 2))
  {
    id v6 = [(MFMessageViewController *)self delegate];
    [v6 messageViewController:self webViewDidTerminateWithReason:a4];
  }
}

- (BOOL)isShowingGroupedSenderMessageListForMessageContentView:(id)a3
{
  BOOL v4 = [(MFMessageViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v5 = [v4 isShowingGroupedSenderMessageListForMessageViewController:self];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)viewControllerForPresentingSuggestions
{
  id v3 = [(MFMessageViewController *)self delegate];
  BOOL v4 = [v3 presentingViewControllerForMessageViewController:self];

  return v4;
}

- (void)presentSuggestionViewController:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMessageViewController *)self messageContentView];
  [v4 _showModalViewController:v5 presentationSource:0];
}

- (BOOL)showsBanners
{
  id v2 = [(MFMessageViewController *)self messageContentView];
  unsigned __int8 v3 = [v2 showsBanners];

  return v3;
}

- (id)presentingViewControllerForAttachmentShowcase:(id)a3
{
  BOOL v4 = [(MFMessageViewController *)self delegate];
  id v5 = [v4 presentingViewControllerForMessageViewController:self];

  return v5;
}

- (id)contactStoreForAttachmentShowcase:(id)a3
{
  unsigned __int8 v3 = [(MFMessageViewController *)self contactStore];

  return v3;
}

- (id)messageSourceMailboxObjectIDForMessageContentView:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    id v5 = [(MFMessageViewController *)self delegate];
    unsigned __int8 v3 = [v5 messageSourceMailboxObjectIDForMessageViewController:self];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)conversationItemHeaderWasTapped:(id)a3
{
}

- (void)conversationItemHeader:(id)a3 didSelectAddressAtom:(id)a4 forAtomType:(unint64_t)a5
{
  id v13 = a4;
  id v7 = [v13 fullAddress];
  id v8 = [(MFMessageViewController *)self _contactViewControllerForAddress:v7 forAtomType:a5];
  [(MFMessageViewController *)self setContactViewController:v8];

  id v9 = [(MFMessageViewController *)self contactViewController];
  if (v9)
  {
    $EEC4610695C90B111D72768D07785D19 flags = self->_flags;

    if ((*(_WORD *)&flags & 0x400) != 0)
    {
      id v11 = [(MFMessageViewController *)self delegate];
      id v12 = [(MFMessageViewController *)self contactViewController];
      [v11 messageViewControllerDidTapAddressAtom:v13 contactViewController:v12];
    }
  }
}

- (void)conversationItemHeader:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5
{
  id v11 = a4;
  id v6 = -[MFMessageViewController _contactViewControllerForAddress:forAtomType:](self, "_contactViewControllerForAddress:forAtomType:");
  [(MFMessageViewController *)self setContactViewController:v6];

  id v7 = [(MFMessageViewController *)self delegate];
  id v8 = [(MFMessageViewController *)self contactViewController];
  if (v8)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(MFMessageViewController *)self contactViewController];
      [v7 messageViewControllerDidChooseAddress:v11 contactViewController:v10];
    }
  }
}

- (id)conversationItemHeader:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  id v5 = [(MFMessageViewController *)self _delegateDisplayNameForEmailAddress:a4 abbreviated:a5];

  return v5;
}

- (id)popoverManagerForForConversationItemHeader:(id)a3
{
  unsigned __int8 v3 = [(MFMessageViewController *)self scene];
  BOOL v4 = [v3 popoverManager];

  return v4;
}

- (void)conversationItemHeader:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v6 = a4;
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    id v5 = [(MFMessageViewController *)self delegate];
    [v5 messageViewController:self didTapRevealActionsButton:v6];
  }
}

- (void)conversationItemHeaderDidTapBIMILearnMore:(id)a3
{
}

- (void)conversationItemHeader:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MFMessageViewController *)self setDelegate:v6];
  }
  [(MFMessageViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (CGRect)documentInteractionControllerRectForPreview:(id)a3
{
  double x = self->_attachmentRect.origin.x;
  CGFloat y = self->_attachmentRect.origin.y;
  double width = self->_attachmentRect.size.width;
  CGFloat height = self->_attachmentRect.size.height;
  id v7 = [a3 icons];
  id v8 = [v7 lastObject];

  if (v8)
  {
    [v8 size];
    double x = x + (width + -74.0 + v9) * 0.5;
  }

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)documentInteractionControllerViewForPreview:(id)a3
{
  unsigned __int8 v3 = [(MFMessageViewController *)self view];

  return v3;
}

- (id)documentInteractionControllerTransitionImageForPreview:(id)a3 contentRect:(CGRect *)a4
{
  id v6 = [a3 icons];
  id v7 = [v6 lastObject];
  if (v7)
  {
    CGFloat x = self->_attachmentRect.origin.x;
    CGFloat y = self->_attachmentRect.origin.y;
    double width = self->_attachmentRect.size.width;
    double height = self->_attachmentRect.size.height;
    double v12 = [(MFMessageViewController *)self messageContentView];
    double v13 = [v12 scrollView];
    [v13 zoomScale];
    long long v27 = v14;

    double v26 = 1.0;
    *(void *)&long long v15 = 1.0;
    long long v24 = v15;
    if (width != 0.0)
    {
      *((void *)&v16 + 1) = *((void *)&v27 + 1);
      *(double *)&long long v16 = 74.0 / (width / *(double *)&v27);
      long long v24 = v16;
    }
    if (height != 0.0) {
      double v26 = 96.0 / (height / *(double *)&v27);
    }
    [v7 size:v24];
    v17.f64[0] = v25;
    v17.f64[1] = v26;
    CGSize v19 = (CGSize)vmulq_n_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_n_f64(v17, v18)))), *(double *)&v27);
    a4->size = v19;
    *(float *)&double v18 = (v18 - v19.width) * 0.5;
    a4->origin.CGFloat x = roundf(*(float *)&v18);
    a4->origin.CGFloat y = *(double *)&v27 * 15.0;
    if (width == 0.0 || height == 0.0)
    {
      int v20 = MFLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.double width = width;
        v35.size.double height = height;
        id v22 = NSStringFromCGRect(v35);
        id v23 = NSStringFromCGRect(*a4);
        *(_DWORD *)buf = 138412802;
        id v29 = self;
        __int16 v30 = 2114;
        v31 = v22;
        __int16 v32 = 2114;
        v33 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@: Invalid _attachmentRect=%{public}@, resulting in contentRect=%{public}@", buf, 0x20u);
      }
    }
  }

  return v7;
}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  v9[0] = MFActivityTypeQuicklook;
  v9[1] = UIActivityTypeSaveToCameraRoll;
  v9[2] = UIActivityTypeMarkupAsPDF;
  BOOL v4 = +[NSArray arrayWithObjects:v9 count:3];
  id v5 = [(MFMessageViewController *)self messageContentView];
  unsigned __int8 v6 = [v5 mayShareToUnmanaged];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v4 arrayByAddingObject:UIActivityTypeCopyToPasteboard];

    BOOL v4 = (void *)v7;
  }

  return v4;
}

- (id)additionalActivitiesForDocumentInteractionController:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  unsigned __int8 v6 = [v4 URL];
  uint64_t v7 = [v6 pathExtension];
  id v8 = [v7 lowercaseString];

  if ([v8 length])
  {
    double v9 = [v8 ef_declaredUTTypeFromExtension];
  }
  else
  {
    double v9 = 0;
  }
  if ([v9 conformsToType:UTTypeMovie])
  {
    double v10 = [(MessageSaveToCameraRollActivity *)[MessageSaveVideoAttachmentActivity alloc] initWithAttachmentHandlingDelegate:self context:2];
    double v11 = [(MessageSaveToCameraRollActivity *)[MessageSaveAllAttachmentsActivity alloc] initWithAttachmentHandlingDelegate:self context:2];
    [v5 addObject:v10];
  }
  else
  {
    double v10 = [(MessageSaveToCameraRollActivity *)[MessageSaveImageAttachmentActivity alloc] initWithAttachmentHandlingDelegate:self context:1];
    [v5 addObject:v10];
    double v11 = [(MessageSaveToCameraRollActivity *)[MessageSaveAllAttachmentsActivity alloc] initWithAttachmentHandlingDelegate:self context:1];
  }
  [v5 addObject:v11];

  double v12 = [(MFMessageViewController *)self presentedViewController];
  off_100690B28();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (!(isKindOfClass & 1 | (v6 == 0)))
  {
    if ([(objc_class *)off_100690B28() canPreviewItem:v6])
    {
      id v14 = [objc_alloc((Class)MessageQuicklookImageAttachmentsActivity) initWithAttachmentHandlingDelegate:self context:1 url:v6];
      [v5 addObject:v14];
    }
    if (([v9 conformsToType:UTTypePDF] & 1) == 0)
    {
      id v15 = [objc_alloc(off_100690B30()) initWithURL:v6];
      long long v16 = [(objc_class *)off_100690B28() printPageRendererForItem:v15];
      if (v16)
      {
        id v17 = [objc_alloc((Class)MessagePrintQuicklookableAttachmentActivity) initWithPrintPageRenderer:v16];
        [v5 addObject:v17];
      }
    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    double v18 = [v9 identifier];
    unsigned int v19 = [v18 ef_conformsToMarkupUTType];

    if (v19)
    {
      id v20 = [objc_alloc((Class)MessageMarkupDocumentActivity) initWithAttachmentHandlingDelegate:self context:0];
      [v5 addObject:v20];
    }
  }

  return v5;
}

- (void)_getNumberOfImages:(unint64_t *)a3 videos:(unint64_t *)a4 undownloaded:(unint64_t *)a5
{
  id v5 = [(MFMessageViewController *)self messageContentView];
  unsigned __int8 v6 = [v5 contentItems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned int v14 = [v13 isAvailableLocally];
        id v15 = [v13 type];
        if ([v15 conformsToType:UTTypeMovie])
        {
          ++v8;
        }
        else
        {
          unsigned int v16 = [v15 conformsToType:UTTypeImage];
          v7 += v16;
          if (!v16) {
            goto LABEL_10;
          }
        }
        v9 += v14 ^ 1;
LABEL_10:
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = v8;
  }
  if (a5) {
    *a5 = v9;
  }
}

- (BOOL)canSaveAllAttachmentsInContext:(int64_t)a3
{
  id v5 = [(MFMessageViewController *)self messageContentView];
  if (![v5 mayShareToUnmanaged])
  {

    return 0;
  }
  char v6 = MFIsAuthorizedToAccessPhotoLibrary();

  if ((v6 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(MFMessageViewController *)self _getNumberOfImages:&v9 videos:&v8 undownloaded:0];
  if (a3 == 2)
  {
    if (v8) {
      --v8;
    }
  }
  else if (a3 == 1)
  {
    if (v9) {
      --v9;
    }
  }
  return v9 + v8 != 0;
}

- (id)allMediaAttachmentFutures
{
  unsigned __int8 v3 = [(MFMessageViewController *)self messageContentView];
  id v4 = [v3 contentItems];
  id v5 = [v4 ef_filter:&stru_10060C668];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C4110;
  v8[3] = &unk_10060C690;
  v8[4] = self;
  char v6 = [v5 ef_map:v8];

  return v6;
}

- (id)localizedTitleForSaveAllAttachmentsAction
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [(MFMessageViewController *)self _getNumberOfImages:&v11 videos:&v10 undownloaded:0];
  uint64_t v2 = v10 + v11;
  if ((unint64_t)(v10 + v11) < 2)
  {
    if (v10)
    {
      if (v11)
      {
        unint64_t v7 = &stru_100619928;
        goto LABEL_16;
      }
      unsigned __int8 v3 = +[NSBundle mainBundle];
      uint64_t v8 = [v3 localizedStringForKey:@"SAVE_VIDEO" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      unsigned __int8 v3 = +[NSBundle mainBundle];
      uint64_t v8 = [v3 localizedStringForKey:@"SAVE_IMAGE" value:&stru_100619928 table:@"Main"];
    }
    unint64_t v7 = (__CFString *)v8;
  }
  else
  {
    unsigned __int8 v3 = +[NSNumberFormatter ef_formatInteger:v10 + v11 withGrouping:1];
    if (v10)
    {
      if (v11)
      {
        id v4 = +[NSBundle mainBundle];
        id v5 = [v4 localizedStringForKey:@"SAVE_N_ATTACHMENTS%1$lu%2$@" value:&stru_100619928 table:@"Main"];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v2, v3);
      }
      else
      {
        id v4 = +[NSBundle mainBundle];
        id v5 = [v4 localizedStringForKey:@"SAVE_N_VIDEOS%1$lu%2$@" value:&stru_100619928 table:@"Main"];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v10, v3);
      uint64_t v6 = };
    }
    else
    {
      id v4 = +[NSBundle mainBundle];
      id v5 = [v4 localizedStringForKey:@"SAVE_N_IMAGES%1$lu%2$@" value:&stru_100619928 table:@"Main"];
      uint64_t v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v11, v3);
    }
    unint64_t v7 = (__CFString *)v6;
  }
LABEL_16:

  return v7;
}

- (id)assetViewerManager
{
  uint64_t v2 = [(MFMessageViewController *)self scene];
  unsigned __int8 v3 = [v2 assetViewerManager];

  return v3;
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 0;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(MFMessageViewController *)self messageContentView];
  uint64_t v6 = [v5 contentRequest];
  unint64_t v7 = [v6 message];

  unsigned int v8 = [v7 shouldShowReplyAll];
  uint64_t v9 = [(MFMessageViewController *)self contactStore];
  uint64_t v10 = [v7 senderDisplayNameUsingContactStore:v9];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  if (v10)
  {
    v28 = v4;
    Class v11 = (Class)off_100690B38();
    double v12 = +[NSBundle mainBundle];
    double v13 = [v12 localizedStringForKey:@"REPLY_TO_SENDER" value:&stru_100619928 table:@"Main"];
    unsigned int v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v10);
    id v15 = +[UIImage systemImageNamed:MFImageGlyphReply];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001C49C8;
    v33[3] = &unk_100608970;
    objc_copyWeak(&v34, location);
    unsigned int v16 = [(objc_class *)v11 actionWithTitle:v14 image:v15 handler:v33];

    id v4 = v28;
    [v28 addObject:v16];

    objc_destroyWeak(&v34);
  }
  if (v8)
  {
    Class v17 = (Class)off_100690B38();
    double v18 = +[NSBundle mainBundle];
    unsigned int v19 = [v18 localizedStringForKey:@"REPLY_ALL" value:&stru_100619928 table:@"Main"];
    id v20 = +[UIImage systemImageNamed:MFImageGlyphReplyAll];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001C4B94;
    v31[3] = &unk_100608970;
    objc_copyWeak(&v32, location);
    long long v21 = [(objc_class *)v17 actionWithTitle:v19 image:v20 handler:v31];

    [v4 addObject:v21];
    objc_destroyWeak(&v32);
  }
  Class v22 = (Class)off_100690B38();
  long long v23 = +[NSBundle mainBundle];
  long long v24 = [v23 localizedStringForKey:@"TITLE_NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
  float64_t v25 = +[UIImage systemImageNamed:MFImageGlyphCompose];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001C4D60;
  v29[3] = &unk_100608970;
  objc_copyWeak(&v30, location);
  double v26 = [(objc_class *)v22 actionWithTitle:v24 image:v25 handler:v29];

  [v4 addObject:v26];
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);

  return v4;
}

- (id)documentInteractionControllerMarkupDismissActions:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(MFMessageViewController *)self messageContentView];
  uint64_t v6 = [v5 contentRequest];
  unint64_t v7 = [v6 message];

  unsigned int v8 = [v7 shouldShowReplyAll];
  uint64_t v9 = [(MFMessageViewController *)self contactStore];
  uint64_t v10 = [v7 senderDisplayNameUsingContactStore:v9];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  if (v10)
  {
    float64_t v25 = v4;
    Class v11 = +[NSBundle mainBundle];
    double v12 = [v11 localizedStringForKey:@"REPLY_TO_SENDER" value:&stru_100619928 table:@"Main"];
    double v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);
    unsigned int v14 = +[UIImage systemImageNamed:MFImageGlyphReply];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001C5490;
    v30[3] = &unk_10060C708;
    objc_copyWeak(&v31, location);
    id v15 = +[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:v13 image:v14 handler:v30];

    id v4 = v25;
    [v25 addObject:v15];

    objc_destroyWeak(&v31);
  }
  if (v8)
  {
    unsigned int v16 = +[NSBundle mainBundle];
    Class v17 = [v16 localizedStringForKey:@"REPLY_ALL" value:&stru_100619928 table:@"Main"];
    double v18 = +[UIImage systemImageNamed:MFImageGlyphReplyAll];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001C565C;
    v28[3] = &unk_10060C708;
    objc_copyWeak(&v29, location);
    unsigned int v19 = +[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:v17 image:v18 handler:v28];

    [v4 addObject:v19];
    objc_destroyWeak(&v29);
  }
  id v20 = +[NSBundle mainBundle];
  long long v21 = [v20 localizedStringForKey:@"TITLE_NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
  Class v22 = +[UIImage systemImageNamed:MFImageGlyphCompose];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001C5828;
  v26[3] = &unk_10060C708;
  objc_copyWeak(&v27, location);
  long long v23 = +[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:v21 image:v22 handler:v26];

  [v4 addObject:v23];
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

  return v4;
}

- (id)_makeFileCopyOfEditedQuickLookFileToLocalContainer:(id)a3 preferredFileName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned int v8 = [v7 mf_copyFileAtURLToContainer:v5 securityScoped:1 preferredFileName:v6 error:&v13];
  id v9 = v13;

  if (!v8)
  {
    uint64_t v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      Class v11 = [v9 ef_publicDescription];
      sub_10045CF3C(v11, buf, v10);
    }
  }

  return v8;
}

- (void)_performMailAction:(int64_t)a3 withMarkedUpFileAttachments:(id)a4
{
  id v7 = a4;
  if (unint64_t)a3 < 7 && ((0x71u >> a3))
  {
    uint64_t v9 = qword_1005A8238[a3];
  }
  else
  {
    unsigned int v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MFMessageViewController.m" lineNumber:1014 description:@"Message action value %lu is undefined."];

    uint64_t v9 = 5;
  }
  uint64_t v10 = [(MFMessageViewController *)self messageContentView];
  Class v11 = [v10 contentRequest];
  double v12 = [v11 message];

  id v13 = +[MFComposeMailMessage legacyMessageWithMessage:v12 mailboxUid:0 skipAttachmentDownload:1];
  id v14 = objc_alloc((Class)_MFMailCompositionContext);
  id v15 = [v13 emailMessageRepresentation];
  id v16 = [v14 initWithComposeType:v9 originalMessage:v15 legacyMessage:v13];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001C5E70;
  v22[3] = &unk_10060C730;
  id v17 = v16;
  id v23 = v17;
  [v7 enumerateObjectsUsingBlock:v22];
  [v17 setOriginatingFromAttachmentMarkup:1];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1001C1A48;
  v20[4] = sub_1001C1A58;
  long long v21 = (MFMessageViewController *)0xAAAAAAAAAAAAAAAALL;
  long long v21 = self;
  double v18 = [(MFMessageViewController *)v21 scene];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C5E7C;
  v19[3] = &unk_10060C758;
  v19[4] = v20;
  [v18 showComposeWithContext:v17 animated:1 initialTitle:0 presentationSource:0 completionBlock:v19];

  _Block_object_dispose(v20, 8);
}

- (void)presentMarkupViewController:(id)a3
{
  id v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)dismissMarkupViewController
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001C6104;
  v3[3] = &unk_1006047A0;
  v3[4] = self;
  uint64_t v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:v3];
}

- (id)_attachmentShowcase
{
  attachmentShowcase = self->_attachmentShowcase;
  if (!attachmentShowcase)
  {
    id v4 = objc_alloc_init(MFAttachmentShowcase);
    uint64_t v5 = self->_attachmentShowcase;
    self->_attachmentShowcase = v4;

    [(MFAttachmentShowcase *)self->_attachmentShowcase setPresentingViewController:self];
    [(MFAttachmentShowcase *)self->_attachmentShowcase setDocumentInteractionControllerDelegate:self];
    attachmentShowcase = self->_attachmentShowcase;
  }

  return attachmentShowcase;
}

- (void)_setAttachmentOriginRect:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = [(MFMessageViewController *)self messageContentView];
  uint64_t v10 = [(MFMessageViewController *)self view];
  [v10 convertRect:v9 x:x y:y width:width height:height];
  self->_attachmentRect.origin.double x = v11;
  self->_attachmentRect.origin.double y = v12;
  self->_attachmentRect.size.double width = v13;
  self->_attachmentRect.size.double height = v14;
  id v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    id v16 = NSStringFromCGRect(v28);
    id v17 = NSStringFromCGRect(self->_attachmentRect);
    int v18 = 138413314;
    unsigned int v19 = self;
    __int16 v20 = 2114;
    long long v21 = v16;
    __int16 v22 = 2114;
    id v23 = v17;
    __int16 v24 = 2114;
    float64_t v25 = v9;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Attachment origin rect=%{public}@, resulting in _attachmentRect=%{public}@,\tfromView=%{public}@ \ttoView=%{public}@", (uint8_t *)&v18, 0x34u);
  }
}

- (void)_previewURL:(id)a3 withEditingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc(off_100690B30()) initWithURL:v6];
  if (v7)
  {
    id v8 = objc_alloc(off_100690B28());
    id v17 = v7;
    uint64_t v9 = +[NSArray arrayWithObjects:&v17 count:1];
    id v10 = [v8 initWithPreviewItems:v9];

    CGFloat v11 = [(MFMessageViewController *)self messageContentView];
    [v10 setIsContentManaged:[v11 sourceIsManaged]];

    if (v4) {
      [v10 setAppearanceActions:4];
    }
    [v10 setDelegate:self];
    [(MFMessageViewController *)self setPreviewController:v10];
    [v10 setModalPresentationStyle:5];
    id v15 = self;
    id v12 = v10;
    id v16 = v12;
    CGFloat v13 = +[EFScheduler mainThreadScheduler];
    [v13 performBlock:&v14];
  }
}

- (BOOL)isSourceManagedForURL:(id)a3
{
  id v3 = [(MFMessageViewController *)self messageContentView];
  unsigned __int8 v4 = [v3 sourceIsManaged];

  return v4;
}

- (void)previewURL:(id)a3
{
}

- (void)markupURL:(id)a3
{
}

- (id)_delegateDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    id v8 = [(MFMessageViewController *)self delegate];
    id v7 = [v8 messageViewController:self displayNameForEmailAddress:v6 abbreviated:v4];
  }
  else
  {
    id v7 = 0;
  }
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)_contactViewControllerForAddress:(id)a3 forAtomType:(unint64_t)a4
{
  id v67 = a3;
  id v69 = objc_alloc_init((Class)CNContactStore);
  id v6 = [v67 stringValue];
  id v7 = +[CNContactViewController descriptorForRequiredKeys];
  v79 = v7;
  id v8 = +[NSArray arrayWithObjects:&v79 count:1];
  uint64_t v9 = [v69 em_fetchContactForEmailAddress:v6 keysToFetch:v8 createIfNeeded:1];

  id v10 = [(MFMessageViewController *)self contentRequest];
  CGFloat v11 = [v10 resultIfAvailable];
  id v12 = [v11 requestedHeaders];
  CGFloat v13 = [v12 firstHeaderForKey:ECMessageHeaderKeyHMEAddress];
  v68 = +[ECTagValueList tagValueListFromString:v13 error:0];

  uint64_t v14 = [v67 emailAddressValue];
  id v15 = [v14 simpleAddress];
  id v16 = [v68 objectForKeyedSubscript:EMHeaderTagHMEAddress];
  unsigned int v66 = [v15 isEqualToString:v16];

  if (v66)
  {
    id v17 = +[EMHideMyEmail sharedInstance];
    int v18 = [v17 forwardingEmailForPrimaryAccount];

    unsigned int v19 = +[CNContactViewController descriptorForRequiredKeys];
    v78 = v19;
    __int16 v20 = +[NSArray arrayWithObjects:&v78 count:1];
    uint64_t v21 = [v69 em_fetchContactForEmailAddress:v18 keysToFetch:v20 createIfNeeded:1];

    uint64_t v22 = 0;
    uint64_t v9 = (void *)v21;
  }
  else
  {
    uint64_t v22 = [v68 objectForKeyedSubscript:EMHeaderTagHMESenderAddress];
    if (!v22)
    {
      id v23 = 0;
      if (v9) {
        goto LABEL_6;
      }
LABEL_12:
      id v31 = 0;
      goto LABEL_26;
    }
    int v18 = +[CNContactViewController descriptorForRequiredKeys];
    v77 = v18;
    unsigned int v19 = +[NSArray arrayWithObjects:&v77 count:1];
    [v69 em_fetchContactForEmailAddress:v22 keysToFetch:v19 createIfNeeded:1];
    v9 = __int16 v20 = v9;
  }

  id v23 = (void *)v22;
  if (!v9) {
    goto LABEL_12;
  }
LABEL_6:
  if ([v9 hasBeenPersisted]
    && +[MFContactsManager isAuthorizedToUseContacts])
  {
    __int16 v24 = +[CNContactViewController viewControllerForContact:v9];
    float64_t v25 = [v67 emailAddressValue];
    __int16 v26 = [v25 simpleAddress];
    id v27 = [v26 emailAddressValue];

    if (v27)
    {
      CGRect v28 = [v9 emailAddresses];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1001C734C;
      v74[3] = &unk_10060C360;
      id v75 = v27;
      id v29 = [v28 ef_firstObjectPassingTest:v74];

      id v30 = [v29 identifier];
    }
    else
    {
      id v30 = 0;
    }
    [v24 highlightPropertyWithKey:CNContactEmailAddressesKey identifier:v30];

    id v31 = v24;
  }
  else
  {
    id v31 = +[CNContactViewController viewControllerForUnknownContact:v9];
  }
  if (([MFContactsManager isAuthorizedToUseContacts] & 1) == 0) [v31 setActions:[v31 actions] & 0xFFFFFFFFFFFFFFDFLL]; {
  [v31 setContactStore:v69];
  }
  id v32 = [(MFMessageViewController *)self contentRequest];
  v65 = [v32 message];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v34 = [WeakRetained daemonInterface];
  CGRect v35 = [v34 blockedSenderManager];
  v36 = +[MFContactCardInteractions contactCardInteractionWithViewController:v31 blockedSenderManager:v35];
  [(MFMessageViewController *)self setContactCardInteractions:v36];

  v37 = [(MFMessageViewController *)self contactCardInteractions];
  [v37 configureInteractionsWithInteractionDelegate:self];

  [v31 _setDataOwnerForCopy:[self _dataOwnerForCopy]];
  [v31 _setDataOwnerForPaste:[self _dataOwnerForPaste]];
  if (a4 == 1)
  {
    id v41 = objc_alloc_init((Class)MFContactMessageInteraction);
    -[MFMessageViewController setContactInteraction:](self, "setContactInteraction:");
    v51 = [(MFMessageViewController *)self contactInteraction];
    [v51 setDelegate:self];

    v52 = [(MFMessageViewController *)self contactInteraction];
    v53 = [(MFMessageViewController *)self securityInformation];
    [v52 updateWithSecurityInformation:v53];

    [(MFMessageViewController *)self _setupHeaderViewForContactViewController:v31];
    v54 = [(MFMessageViewController *)self scene];
    v55 = [v54 brandIndicatorProvider];
    v56 = [(MFMessageViewController *)self contentRequest];
    v57 = [v56 message];
    v58 = [v57 brandIndicatorLocation];
    v59 = [v55 brandIndicatorFutureForLocation:v58];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1001C7410;
    v70[3] = &unk_10060C780;
    id v71 = v23;
    id v72 = v65;
    id v73 = v31;
    [v59 addSuccessBlock:v70];

    v42 = v71;
LABEL_22:

    goto LABEL_23;
  }
  if (a4 == 2)
  {
    v38 = [(MFMessageViewController *)self contentRequest];
    v39 = [v38 contentRepresentationFuture];
    v40 = [v39 result];
    id v41 = [v40 replyToList];

    v42 = [v65 senderAddress];
    v43 = [v65 senderAddress];
    v76 = v43;
    v44 = +[NSArray arrayWithObjects:&v76 count:1];
    LODWORD(v38) = +[MFAddressAtomStatusManager shouldDecorateAtomListForSender:v44 replyTo:v41];

    if (v38)
    {
      id v45 = objc_alloc((Class)MFSecureMIMEPersonHeaderView);
      v46 = +[UIColor mailSecureMIMERegularTextColor];
      id v47 = [v45 initWithFrame:v46 origin:CGRectZero.origin size:CGRectZero.size];

      v48 = _EFLocalizedString();
      [v47 setWarningLabelText:v48];

      v49 = _EFLocalizedString();
      v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v49, v42);

      [v47 setExplanationText:v50];
      [v31 setContactHeaderView:v47];
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v66)
  {
    id v60 = objc_alloc((Class)MFHideMyEmailHeaderView);
    v61 = [v67 emailAddressValue];
    v62 = [v61 simpleAddress];
    id v63 = [v60 initWithFrame:v62 origin:CGRectZero.origin size:CGRectZero.size];

    [v31 setContactHeaderView:v63];
  }

LABEL_26:
  [v31 setPreferredContentSize:CGSizeMake(0.0, 700.0)];

  return v31;
}

- (void)_setupHeaderViewForContactViewController:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MFMessageViewController *)self contactInteraction];
  uint64_t v5 = [v4 headerView];

  if (v5) {
    [v6 setContactHeaderView:v5];
  }
}

- (void)contactMessageInteraction:(id)a3 didUpdateHeaderView:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(MFMessageViewController *)self contactViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 contactHeaderView];

    if (v7 != v8) {
      [(MFMessageViewController *)self _setupHeaderViewForContactViewController:v6];
    }
  }
}

- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMessageViewController *)self delegate];
  unsigned __int8 v6 = [v5 canSearchForContactFromContactCardInteractions:v4];

  return v6;
}

- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MFMessageViewController *)self delegate];
  [v10 contactCardInteractions:v11 triggerSearchForDisplayName:v8 emailAddresses:v9];
}

- (void)prepareForReuse
{
  [(MFConversationItemHeaderBlock *)self->_participantHeader prepareForReuse];
  id v3 = [(MFMessageViewController *)self messageContentView];
  [v3 prepareForReuse];

  [(MFMessageViewController *)self setDelegate:0];
  id v4 = [(MFMessageViewController *)self parentViewController];

  if (v4)
  {
    [(MFMessageViewController *)self willMoveToParentViewController:0];
    [(MFMessageViewController *)self removeFromParentViewController];
  }
}

- (id)messageContentRepresentationRequestForScreenshotService:(id)a3
{
  id v3 = [(MFMessageViewController *)self contentRequest];

  return v3;
}

- (void)_presentBIMILearnMoreViewController
{
  id v3 = [(MFMessageViewController *)self contentRequest];
  id v4 = [v3 resultIfAvailable];
  uint64_t v5 = [v4 requestedHeaders];
  unsigned __int8 v6 = [v5 firstHeaderForKey:ECMessageHeaderKeyHMEAddress];
  id v7 = +[ECTagValueList tagValueListFromString:v6 error:0];

  id v31 = v7;
  v33 = [v7 objectForKeyedSubscript:EMHeaderTagHMESenderAddress];
  id v8 = [(MFMessageViewController *)self contentRequest];
  id v9 = [v8 message];

  if (v33)
  {
    id v10 = v33;
  }
  else
  {
    id v10 = [v9 senderAddress];
  }
  id v32 = v10;
  id v11 = [v10 emailAddressValue];
  id v12 = [v11 domain];

  if (!v12)
  {
    CGFloat v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v9 senderAddress];
      sub_10045CF94(v14, buf, v13);
    }
  }
  id v15 = [v9 mailProviderDisplayNameForBIMI];
  if ([v15 length])
  {
    id v16 = _EFLocalizedString();
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v15, v12);
  }
  else
  {
    id v16 = _EFLocalizedString();
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v12);
  id v17 = };

  id v18 = objc_alloc((Class)OBWelcomeController);
  unsigned int v19 = _EFLocalizedString();
  id v20 = [v18 initWithTitle:v19 detailText:v17 icon:0];

  [v20 setModalPresentationStyle:2];
  uint64_t v21 = +[OBHeaderAccessoryButton accessoryButton];
  uint64_t v22 = _EFLocalizedString();
  [v21 setTitle:v22 forState:0];

  id v23 = [v20 headerView];
  [v23 addAccessoryButton:v21];

  __int16 v24 = +[UIAction actionWithHandler:&stru_10060C7C0];
  [v21 addAction:v24 forControlEvents:0x2000];

  id v25 = objc_alloc((Class)UIBarButtonItem);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1001C80A0;
  v34[3] = &unk_100608F68;
  id v26 = v20;
  id v35 = v26;
  id v27 = +[UIAction actionWithHandler:v34];
  id v28 = [v25 initWithBarButtonSystemItem:0 primaryAction:v27];

  id v29 = [v26 navigationItem];
  [v29 setRightBarButtonItem:v28];

  id v30 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v26];
  [(MFMessageViewController *)self presentViewController:v30 animated:1 completion:0];
}

- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMessageViewController *)self delegate];
  unsigned __int8 v6 = [v5 conversationAttachmentURLsForConversationItemHeaderBlock:v4];

  return v6;
}

- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMessageViewController *)self delegate];
  unsigned __int8 v6 = [v5 richLinksInConversationForConversationItemHeaderBlock:v4];

  return v6;
}

- (int64_t)numberOfMessagesInConversationForConversationItemHeaderBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMessageViewController *)self delegate];
  id v6 = [v5 numberOfMessagesInConversationForConversationItemHeaderBlock:v4];

  return (int64_t)v6;
}

- (MFMessageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMessageViewControllerDelegate *)WeakRetained;
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (BOOL)automaticallyCollapseQuotedContent
{
  return self->_automaticallyCollapseQuotedContent;
}

- (BOOL)configuredForSingleMessageDisplay
{
  return self->_configuredForSingleMessageDisplay;
}

- (MFMessageContentView)messageContentView
{
  return self->_messageContentView;
}

- (void)setMessageContentView:(id)a3
{
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (BOOL)didCompleteFirstPaint
{
  return self->_didCompleteFirstPaint;
}

- (void)setDidCompleteFirstPaint:(BOOL)a3
{
  self->_didCompleteFirstPaint = a3;
}

- (QLPreviewController)previewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);

  return (QLPreviewController *)WeakRetained;
}

- (void)setPreviewController:(id)a3
{
}

- (UIDocumentInteractionController)doc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_doc);

  return (UIDocumentInteractionController *)WeakRetained;
}

- (void)setDoc:(id)a3
{
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
}

- (MFContactMessageInteraction)contactInteraction
{
  return self->_contactInteraction;
}

- (void)setContactInteraction:(id)a3
{
}

- (MFContactCardInteractions)contactCardInteractions
{
  return self->_contactCardInteractions;
}

- (void)setContactCardInteractions:(id)a3
{
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
}

- (MessageContentRequestRetryMiddleware)retryMiddleware
{
  return self->_retryMiddleware;
}

- (void)setRetryMiddleware:(id)a3
{
}

- (MFScreenshotService)screenshotService
{
  return self->_screenshotService;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (MFSuggestionController)suggestionController
{
  return self->_suggestionController;
}

- (void)setSuggestionController:(id)a3
{
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_screenshotService, 0);
  objc_storeStrong((id *)&self->_retryMiddleware, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_contactCardInteractions, 0);
  objc_storeStrong((id *)&self->_contactInteraction, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_destroyWeak((id *)&self->_doc);
  objc_destroyWeak((id *)&self->_previewController);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong((id *)&self->_messageContentView, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantHeader, 0);

  objc_storeStrong((id *)&self->_attachmentShowcase, 0);
}

@end
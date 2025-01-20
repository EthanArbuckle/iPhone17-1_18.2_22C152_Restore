@interface AddBookmarkUIActivity
- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)activityViewController;
- (void)activityDidFinish:(BOOL)a3;
- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation AddBookmarkUIActivity

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_59);
  int v4 = [v3 isShowingStartPageOverriddenByExtension];
  if (v3) {
    int v5 = ([v3 isBlank] | v4) ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

uint64_t __53__AddBookmarkUIActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_2);
  int v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v4;

  id v18 = [(_SFActivity *)self delegate];
  bookmarkNavController = self->_bookmarkNavController;
  if (!bookmarkNavController)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F3B080]);
    v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    v9 = (_SFSingleBookmarkNavigationController *)[v7 initWithCollection:v8];
    v10 = self->_bookmarkNavController;
    self->_bookmarkNavController = v9;

    v11 = [v18 addBookmarkActivityTabGroupProvider];
    [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavController setSyntheticBookmarkProvider:v11];

    bookmarkNavController = self->_bookmarkNavController;
  }
  int v12 = [(_SFSingleBookmarkNavigationController *)bookmarkNavController prepareForPresentationForAddingBookmark:1];
  v13 = self->_bookmarkNavController;
  if (v12)
  {
    v14 = [(TabDocument *)self->_tabDocument titleForNewBookmark];
    v15 = [(TabDocument *)self->_tabDocument cachedCanonicalURLOrURLForSharing];
    v16 = [v15 absoluteString];
    id v17 = (id)[(_SFSingleBookmarkNavigationController *)v13 addBookmarkWithTitle:v14 address:v16 parentBookmark:0];

    [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavController setBookmarkNavDelegate:self];
  }
  else
  {
    self->_bookmarkNavController = 0;

    [v18 addBookmarkActivityFailedToAcquireBookmarkLock:self];
  }
}

uint64_t __50__AddBookmarkUIActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)activityViewController
{
  return self->_bookmarkNavController;
}

- (void)activityDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AddBookmarkUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    int v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 didAddBookmarkWithMethod:3];
  }
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [(AddBookmarkUIActivity *)self activityDidFinish:v5];
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E4F98C08];
    v9 = [(TabDocument *)self->_tabDocument webView];
    v10 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke;
    v11[3] = &unk_1E6D7A118;
    id v12 = v7;
    [v8 saveLeadImageFromWebView:v9 toLeadImageCacheRegisteredWithMetadataManager:v10 completionHandler:v11];
  }
}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_8;
    v9[3] = &unk_1E6D77D90;
    id v10 = *(id *)(a1 + 32);
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else if (v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(v8, v7);
    }
  }
}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_8(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  -[WebBookmarkCollection updateBookmark:withLeadImageURL:](v2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  BOOL v3 = self;
  int v4 = [(_SFActivity *)self delegate];
  LOBYTE(v3) = [v4 addBookmarkActivityCanSaveBookmarkChanges:v3];

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_bookmarkNavController, 0);
}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  int v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Could not save lead image for bookmark from Bookmark action sheet action in with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
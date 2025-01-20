@interface AddToFavoritesUIActivity
- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)canPerformWithTabDocument:(id)a3;
- (BOOL)isForPerTabGroupFavorites;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)activityDidFinish:(BOOL)a3;
- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5;
- (void)prepareWithTabDocument:(id)a3;
- (void)setIsForPerTabGroupFavorites:(BOOL)a3;
@end

@implementation AddToFavoritesUIActivity

- (id)activityType
{
  if (self->_isForPerTabGroupFavorites) {
    return @"com.apple.mobilesafari.activity.addToPerTabGroupFavorites";
  }
  else {
    return @"com.apple.mobilesafari.activity.addToFavorites";
  }
}

- (id)activityTitle
{
  if (self->_isForPerTabGroupFavorites)
  {
    v3 = NSString;
    v4 = _WBSLocalizedString();
    v5 = [(_SFActivity *)self delegate];
    v6 = [v5 addBookmarkActivityTabGroupProvider];
    v7 = [v6 activeTabGroup];
    v8 = [v7 displayTitle];
    v9 = objc_msgSend(v3, "stringWithFormat:", v4, v8);
  }
  else
  {
    v9 = _WBSLocalizedString();
  }
  return v9;
}

- (id)_systemImageName
{
  if (self->_isForPerTabGroupFavorites) {
    return @"star.square.on.square";
  }
  else {
    return @"star";
  }
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v4 = a3;
  if (!self->_isForPerTabGroupFavorites) {
    goto LABEL_3;
  }
  v5 = [(_SFActivity *)self delegate];
  v6 = [v5 addBookmarkActivityTabGroupProvider];
  v7 = [v6 activeTabGroup];
  int v8 = [v7 supportsTabGroupFavorites];

  if (!v8)
  {
    char v10 = 0;
  }
  else
  {
LABEL_3:
    v9 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
    if ([v9 usesAllowedSitesOnly])
    {
      char v10 = 0;
    }
    else
    {
      v11 = +[FeatureManager sharedFeatureManager];
      char v10 = [v11 isBookmarksAvailable];
    }
  }

  return v10;
}

- (void)prepareWithTabDocument:(id)a3
{
  id v22 = a3;
  objc_storeStrong((id *)&self->_tabDocument, a3);
  v5 = [(_SFActivity *)self delegate];
  v6 = [v5 addBookmarkActivityTabGroupProvider];
  v7 = v6;
  bookmarkNavController = self->_bookmarkNavController;
  if (self->_isForPerTabGroupFavorites)
  {
    if (bookmarkNavController) {
      goto LABEL_7;
    }
    v9 = [v6 activeTabGroup];
    char v10 = [v7 syntheticBookmarkFolderForTabGroup:v9 withAttribution:0];

    v11 = (_SFSingleBookmarkNavigationController *)[objc_alloc(MEMORY[0x1E4F3B080]) initForAddingToSyntheticBookmarkFolder:v10];
  }
  else
  {
    if (bookmarkNavController) {
      goto LABEL_7;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F3B080]);
    char v10 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    v11 = (_SFSingleBookmarkNavigationController *)[v12 initForAddingToFavoritesInCollection:v10];
  }
  v13 = self->_bookmarkNavController;
  self->_bookmarkNavController = v11;

LABEL_7:
  [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavController setSyntheticBookmarkProvider:v7];
  int v14 = [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavController prepareForPresentationForAddingBookmark:1];
  v15 = self->_bookmarkNavController;
  if (v14)
  {
    v16 = [v22 titleForNewBookmark];
    v17 = [v22 cachedCanonicalURLOrURLForSharing];
    v18 = [v17 absoluteString];
    v19 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    v20 = [v19 favoritesFolder];
    id v21 = (id)[(_SFSingleBookmarkNavigationController *)v15 addBookmarkWithTitle:v16 address:v18 parentBookmark:v20];

    [(_SFSingleBookmarkNavigationController *)self->_bookmarkNavController setBookmarkNavDelegate:self];
  }
  else
  {
    self->_bookmarkNavController = 0;

    [v5 addBookmarkActivityFailedToAcquireBookmarkLock:self];
  }
}

- (id)activityViewController
{
  return self->_bookmarkNavController;
}

- (void)activityDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AddToFavoritesUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v4, "_sf_didAddFavoriteFromShareSheet");
  }
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [(AddToFavoritesUIActivity *)self activityDidFinish:v5];
  if (v5 && !self->_isForPerTabGroupFavorites)
  {
    int v8 = (void *)MEMORY[0x1E4F98C08];
    v9 = [(TabDocument *)self->_tabDocument webView];
    char v10 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke;
    v11[3] = &unk_1E6D7A118;
    id v12 = v7;
    [v8 saveLeadImageFromWebView:v9 toLeadImageCacheRegisteredWithMetadataManager:v10 completionHandler:v11];
  }
}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_23;
    v9[3] = &unk_1E6D77D90;
    id v10 = *(id *)(a1 + 32);
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else if (v6)
  {
    int v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(v8, v7);
    }
  }
}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_23(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  -[WebBookmarkCollection updateBookmark:withLeadImageURL:](v2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  BOOL v3 = self;
  id v4 = [(_SFActivity *)self delegate];
  LOBYTE(v3) = [v4 addBookmarkActivityCanSaveBookmarkChanges:v3];

  return (char)v3;
}

- (BOOL)isForPerTabGroupFavorites
{
  return self->_isForPerTabGroupFavorites;
}

- (void)setIsForPerTabGroupFavorites:(BOOL)a3
{
  self->_isForPerTabGroupFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_bookmarkNavController, 0);
}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Could not save lead image for bookmark from Favorites action sheet action in with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
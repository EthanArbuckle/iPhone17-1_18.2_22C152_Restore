@interface ActionPanel
+ (id)createActivityItemProviderCollectionForTabDocument:(id)a3;
- (ActionPanel)initWithTabDocument:(id)a3 activityDelegate:(id)a4 menuStyle:(int64_t)a5;
- (BOOL)addBookmarkActivityCanSaveBookmarkChanges:(id)a3;
- (BOOL)isContentObscuredByDigitalHealthForCustomizationController:(id)a3;
- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3;
- (BOOL)isReaderAvailableForCustomizationController:(id)a3;
- (BOOL)isShowingReaderForCustomizationController:(id)a3;
- (TabDocument)tabDocument;
- (id)addBookmarkActivityTabGroupProvider;
- (id)downloadsViewController;
- (id)excludedActivityTypes;
- (id)webViewForCustomizationController:(id)a3;
- (int64_t)provenanceForSafariActivity:(id)a3;
- (void)_executeActivity;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)_prepareMail:(id)a3 completion:(id)a4;
- (void)_preparePostToSocialNetwork:(id)a3;
- (void)_reload;
- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5;
- (void)addBookmarkActivityFailedToAcquireBookmarkLock:(id)a3;
- (void)setSharingURL:(id)a3;
- (void)updateReloadActivity;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActionPanel

- (ActionPanel)initWithTabDocument:(id)a3 activityDelegate:(id)a4 menuStyle:(int64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = customActivities(v9, a5, v10, 0);
  if (([v9 isBlank] & 1) != 0
    || [v9 isShowingStartPageOverriddenByExtension])
  {
    a5 = 1;
  }
  v12 = itemProviderCollection(v9, a5);
  v13 = [v9 cachedCanonicalURLOrURLForSharing];
  v14 = [v9 urlForSharing];
  v32.receiver = self;
  v32.super_class = (Class)ActionPanel;
  v15 = [(_SFActivityViewController *)&v32 initWithActivityItemProviderCollection:v12 applicationActivities:v11 sharingURL:v13 sourceURL:v14];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_tabDocument, a3);
    objc_storeStrong((id *)&v15->_activityDelegate, a4);
    v16 = [v9 sharingExtensionController];
    [(_SFActivityViewController *)v15 setSharingExtensionController:v16];

    v17 = [(_SFActivityViewController *)v15 customizationController];
    [v17 setDelegate:v15];

    v15->_menuStyle = a5;
    if (a5 == 1)
    {
      [(ActionPanel *)v15 setSharingStyle:2];
      [(ActionPanel *)v15 setHideHeaderView:1];
    }
    [(ActionPanel *)v15 _primeExtensionDiscovery];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v27 = v11;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v23 setParentViewController:v15];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 setParentActivityViewController:v15];
            [v23 setBrowserDocument:v9];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 setParentViewController:v15];
            v15->_containsDownloadsActivity = 1;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v15->_reloadActivity, v23);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v23 setDelegate:v15];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v20);
    }

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v15 selector:sel__reload name:*MEMORY[0x1E4F99758] object:0];

    v25 = v15;
    v11 = v27;
  }

  return v15;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ActionPanel;
  [(ActionPanel *)&v5 viewDidAppear:a3];
  if (self->_containsDownloadsActivity)
  {
    v4 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v4 didBeginViewingDownloads];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ActionPanel;
  [(ActionPanel *)&v5 viewWillDisappear:a3];
  if (self->_containsDownloadsActivity)
  {
    v4 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v4 didEndViewingDownloads];
  }
}

- (void)setSharingURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(_SFActivityViewController *)self sharingURL];
  if (([v4 isEqual:v5] & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(_SFActivityViewController *)self activityItemProviders];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = [v11 url];
          int v13 = [v12 isEqual:v5];

          if (v13) {
            [v11 setUrl:v4];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v14.receiver = self;
    v14.super_class = (Class)ActionPanel;
    [(_SFActivityViewController *)&v14 setSharingURL:v4];
  }
}

+ (id)createActivityItemProviderCollectionForTabDocument:(id)a3
{
  return itemProviderCollection(a3, 0);
}

- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ActionPanel;
  [(_SFActivityViewController *)&v10 activityDidComplete:v8 withReturnedItems:a4 success:v5];
  if (v5 && [v8 isEqualToString:*MEMORY[0x1E4F9F3C0]])
  {
    uint64_t v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didPrintPage];
  }
}

- (void)_executeActivity
{
  v3 = [(ActionPanel *)self activity];
  id v4 = [v3 activityType];
  if ([v4 isEqualToString:*MEMORY[0x1E4F9F340]])
  {
    BOOL v5 = [(_SFActivityViewController *)self delegate];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__ActionPanel__executeActivity__block_invoke;
    v7[3] = &unk_1E6D77C20;
    id v8 = v3;
    [v5 actionPanelAddTabDocumentToReadingList:self activityDidFinish:v7];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ActionPanel;
    [(_SFActivityViewController *)&v6 _executeActivity];
  }
}

uint64_t __31__ActionPanel__executeActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void (**)(void))&__block_literal_global;
  }
  uint64_t v9 = [v6 activityType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ActionPanel *)self _preparePostToSocialNetwork:v6];
    v8[2](v8);
  }
  else if ([v9 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    [(ActionPanel *)self _prepareMail:v6 completion:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ActionPanel;
    [(_SFActivityViewController *)&v10 _prepareActivity:v6 completion:v8];
  }
}

- (void)_preparePostToSocialNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 activityViewController];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v6 = (void *)getSLComposeViewControllerClass_softClass;
  uint64_t v13 = getSLComposeViewControllerClass_softClass;
  if (!getSLComposeViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getSLComposeViewControllerClass_block_invoke;
    v9[3] = &unk_1E6D77CE0;
    v9[4] = &v10;
    __getSLComposeViewControllerClass_block_invoke((uint64_t)v9);
    id v6 = (void *)v11[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(TabDocument *)self->_tabDocument titleForSharing];
    [v5 setInitialText:v8];
  }
}

- (void)_prepareMail:(id)a3 completion:(id)a4
{
  uint64_t v10 = (void (**)(void))a4;
  id v6 = [a3 activityViewController];
  if (objc_msgSend(v6, "_sf_isMFMailComposeViewController"))
  {
    id v7 = v6;
    [v7 setKeyboardVisible:1];
    id v8 = [(TabDocument *)self->_tabDocument titleForSharing];
    [v7 setSubject:v8];

    uint64_t v9 = [(_SFActivityViewController *)self delegate];
    [v9 actionPanel:self prepareForMailActivityWithMailController:v7 completionHandler:v10];
  }
  else
  {
    v10[2]();
  }
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 activityType];
  int v6 = [v5 isEqualToString:@"SafariActivityTypeWebExtension"];

  if (v6)
  {
    id v7 = [(TabDocument *)self->_tabDocument browserController];
    id v8 = [v4 activityViewController];
    [v7 presentModalViewController:v8 completion:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ActionPanel;
    [(_SFActivityViewController *)&v9 _performActivity:v4];
  }
}

- (void)_reload
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(_SFActivityViewController *)self printController];
  [v3 printInteractionControllerDidFinish];

  [(_SFActivityViewController *)self setPrintController:0];
  id v4 = itemProviderCollection(self->_tabDocument, self->_menuStyle);
  BOOL v5 = [(_SFActivityViewController *)self customizationController];
  uint64_t v19 = [v4 activityItemProvidersWithCustomizationController:v5];

  int v6 = [(ActionPanel *)self activityTypeOrder];
  tabDocument = self->_tabDocument;
  int64_t menuStyle = self->_menuStyle;
  activityDelegate = self->_activityDelegate;
  id v24 = v6;
  uint64_t v10 = customActivities(tabDocument, menuStyle, activityDelegate, &v24);
  id v11 = v24;

  [(ActionPanel *)self setActivityTypeOrder:v11];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v17 setParentViewController:self];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;
          [v18 setParentActivityViewController:self];
          [v18 setBrowserDocument:self->_tabDocument];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v17 setParentViewController:self];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }

  [(_SFActivityViewController *)self _updateActivityItems:v19 applicationActivities:v12];
}

- (id)excludedActivityTypes
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)ActionPanel;
  uint64_t v3 = [(_SFActivityViewController *)&v10 excludedActivityTypes];
  id v4 = (void *)v3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    BOOL v5 = (void *)v3;
  }
  id v6 = v5;

  if ([(TabDocument *)self->_tabDocument isPDFDocument])
  {
    v11[0] = *MEMORY[0x1E4F9F388];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v8 = objc_msgSend(v6, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v7);

    id v6 = (id)v8;
  }
  return v6;
}

- (id)downloadsViewController
{
  uint64_t v3 = [(_SFActivityViewController *)self delegate];
  id v4 = [v3 downloadsViewControllerForActionPanel:self];

  return v4;
}

- (void)updateReloadActivity
{
  if (self->_reloadActivity && ([(ActionPanel *)self isBeingDismissed] & 1) == 0)
  {
    reloadActivity = self->_reloadActivity;
    [(ActionPanel *)self _reloadActivity:reloadActivity];
  }
}

- (int64_t)provenanceForSafariActivity:(id)a3
{
  return 0;
}

- (id)webViewForCustomizationController:(id)a3
{
  return [(TabDocument *)self->_tabDocument webView];
}

- (BOOL)isContentObscuredByDigitalHealthForCustomizationController:(id)a3
{
  return [(TabDocument *)self->_tabDocument shouldObscureForDigitalHealth];
}

- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3
{
  return [(TabDocument *)self->_tabDocument hasQuickLookContent];
}

- (BOOL)isReaderAvailableForCustomizationController:(id)a3
{
  return [(TabDocument *)self->_tabDocument isReaderAvailable];
}

- (BOOL)isShowingReaderForCustomizationController:(id)a3
{
  return [(TabDocument *)self->_tabDocument isShowingReader];
}

- (BOOL)addBookmarkActivityCanSaveBookmarkChanges:(id)a3
{
  return [(AddBookmarkActivityDelegate *)self->_activityDelegate addBookmarkActivityCanSaveBookmarkChanges:a3];
}

- (void)addBookmarkActivityFailedToAcquireBookmarkLock:(id)a3
{
}

- (id)addBookmarkActivityTabGroupProvider
{
  return (id)[(AddBookmarkActivityDelegate *)self->_activityDelegate addBookmarkActivityTabGroupProvider];
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_reloadActivity, 0);
  objc_storeStrong((id *)&self->_activityDelegate, 0);
}

@end
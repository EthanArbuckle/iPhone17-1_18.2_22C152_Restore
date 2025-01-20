@interface SUUIFacebookPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIFacebookPageSection)initWithPageComponent:(id)a3;
- (id)_accountStore;
- (id)_facebookView;
- (id)cellForIndexPath:(id)a3;
- (int64_t)_facebookAccountsExist;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)_accountStoreDidChangeNotification:(id)a3;
- (void)_applyColorSchemeToFacebookView:(id)a3;
- (void)_changeStatusToUserLiked:(BOOL)a3;
- (void)_finishLookupWithStatus:(id)a3 error:(id)a4;
- (void)_reloadCollectionViewSection;
- (void)_reloadLikeStatus;
- (void)_resetState;
- (void)_toggleLikeAction:(id)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIFacebookPageSection

- (SUUIFacebookPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIFacebookPageSection;
  result = [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
  if (result) {
    result->_facebookAccountsExist = -1;
  }
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v4 = (void *)SUUIAccountsFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v4), 0);

  v5 = [(SUUIReviewsFacebookView *)self->_facebookView likeToggleButton];
  [v5 removeTarget:self action:0 forControlEvents:64];

  v6.receiver = self;
  v6.super_class = (Class)SUUIFacebookPageSection;
  [(SUUIStorePageSection *)&v6 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  if (a3 != 2) {
    [(SUUIFacebookPageSection *)self _applyColorSchemeToFacebookView:self->_facebookView];
  }
  return a3;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  objc_super v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUIFacebookPageSectionReuseIdentifier" forIndexPath:v4];

  v8 = [(SUUIFacebookPageSection *)self _facebookView];
  [v7 setContentChildView:v8];

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SUUIFacebookPageSection *)self _facebookView];
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sizeThatFits:", v6, *(double *)(MEMORY[0x263F001B0] + 8));
    uint64_t v10 = v9;
  }
  else
  {
    *(double *)&uint64_t v10 = 79.0;
  }

  double v11 = v6;
  double v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return [(SUUIFacebookPageSection *)self _facebookAccountsExist] != 0;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIFacebookPageSectionReuseIdentifier"];
  double v6 = self->_layoutContext;
  id v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  layoutContext = self->_layoutContext;
  self->_layoutContext = v7;

  [(SUUIFacebookPageSection *)self _applyColorSchemeToFacebookView:self->_facebookView];
  [(SUUIFacebookPageSection *)self _reloadLikeStatus];
  v9.receiver = self;
  v9.super_class = (Class)SUUIFacebookPageSection;
  [(SUUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)_toggleLikeAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUIFacebookLikeStatus *)self->_likeStatus isUserLiked];
  BOOL v6 = v5;
  [(SUUIFacebookPageSection *)self _changeStatusToUserLiked:!v5];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke;
  aBlock[3] = &unk_265403638;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = SUUISocialFramework();
  objc_super v9 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Slfacebooksess.isa, v8), "sharedSession");
  BOOL v10 = [(SUUIFacebookLikeStatus *)self->_likeStatus isUserLiked];
  likeStatus = self->_likeStatus;
  if (v10)
  {
    double v12 = [(SUUIFacebookLikeStatus *)likeStatus URL];
    [v9 likeURL:v12 completion:v7];
  }
  else
  {
    double v12 = [(SUUIFacebookLikeStatus *)likeStatus URL];
    [v9 unlikeURL:v12 completion:v7];
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke_2;
    v3[3] = &unk_265403610;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    char v5 = *(unsigned char *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v3);
    objc_destroyWeak(&v4);
  }
}

void __45__SUUIFacebookPageSection__toggleLikeAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeStatusToUserLiked:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SUUIFacebookPageSection__accountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__SUUIFacebookPageSection__accountStoreDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(char *)(v1 + 96);
  if (v2 != -1)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 96) = -1;
    uint64_t v4 = [*(id *)(result + 32) _facebookAccountsExist];
    CGSize result = *(void *)(v3 + 32);
    if (v4 == v2)
    {
      if (!*(unsigned char *)(result + 112))
      {
        [(id)result _resetState];
        BOOL v6 = *(void **)(v3 + 32);
        return [v6 _reloadLikeStatus];
      }
    }
    else
    {
      [(id)result _resetState];
      char v5 = *(void **)(v3 + 32);
      return [v5 _reloadCollectionViewSection];
    }
  }
  return result;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    uint64_t v4 = SUUIAccountsFramework();
    char v5 = (ACAccountStore *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Acaccountstore.isa, v4));
    BOOL v6 = self->_accountStore;
    self->_accountStore = v5;

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = (void *)SUUIAccountsFramework();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountStoreDidChangeNotification_, *(void *)SUUIWeakLinkedSymbolForString("ACAccountStoreDidChangeNotification", v8), 0);

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)_applyColorSchemeToFacebookView:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(SUUIStorePageSection *)self pageComponent];
    char v5 = [v4 viewElement];
    id v12 = [v5 style];

    if (v12)
    {
      BOOL v6 = objc_alloc_init(SUUIColorScheme);
      id v7 = [(SUUIViewElementLayoutContext *)self->_layoutContext tintColor];
      SUUIViewElementPlainColorWithStyle(v12, v7);
      uint64_t v8 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();

      [(SUUIColorScheme *)v6 setPrimaryTextColor:v8];
      [(SUUIColorScheme *)v6 setSecondaryTextColor:v8];
      facebookView = self->_facebookView;
      BOOL v10 = v6;
    }
    else
    {
      BOOL v6 = [(SUUIStorePageSection *)self context];
      double v11 = self->_facebookView;
      uint64_t v8 = [(SUUIColorScheme *)v6 colorScheme];
      facebookView = v11;
      BOOL v10 = v8;
    }
    [(SUUIReviewsFacebookView *)facebookView setColorScheme:v10];
  }
}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = (SUUIFacebookLikeStatus *)[(SUUIFacebookLikeStatus *)self->_likeStatus copy];
  [(SUUIFacebookLikeStatus *)v5 setUserLiked:v3];
  likeStatus = self->_likeStatus;
  self->_likeStatus = v5;
  id v7 = v5;

  [(SUUIReviewsFacebookView *)self->_facebookView setUserLiked:v3];
  [(SUUIFacebookPageSection *)self _reloadCollectionViewSection];
}

- (int64_t)_facebookAccountsExist
{
  int facebookAccountsExist = self->_facebookAccountsExist;
  if (facebookAccountsExist == 255)
  {
    uint64_t v4 = [(SUUIFacebookPageSection *)self _accountStore];
    char v5 = objc_opt_class();
    BOOL v6 = (void *)SUUIAccountsFramework();
    self->_int facebookAccountsExist = objc_msgSend(v5, "accountsWithAccountTypeIdentifierExist:", *(void *)SUUIWeakLinkedSymbolForString("ACAccountTypeIdentifierFacebook", v6)) != 0;

    LOBYTE(facebookAccountsExist) = self->_facebookAccountsExist;
  }
  return (char)facebookAccountsExist;
}

- (id)_facebookView
{
  facebookView = self->_facebookView;
  if (!facebookView)
  {
    if (self->_likeStatus)
    {
      uint64_t v4 = [(SUUIStorePageSection *)self context];
      char v5 = [SUUIReviewsFacebookView alloc];
      BOOL v6 = [v4 clientContext];
      id v7 = [(SUUIReviewsFacebookView *)v5 initWithClientContext:v6];
      uint64_t v8 = self->_facebookView;
      self->_facebookView = v7;

      objc_super v9 = [(SUUIReviewsFacebookView *)self->_facebookView likeToggleButton];
      [v9 addTarget:self action:sel__toggleLikeAction_ forControlEvents:64];

      BOOL v10 = self->_facebookView;
      double v11 = [(SUUIFacebookLikeStatus *)self->_likeStatus friendNames];
      [(SUUIReviewsFacebookView *)v10 setFriendNames:v11];

      [(SUUIReviewsFacebookView *)self->_facebookView setUserLiked:[(SUUIFacebookLikeStatus *)self->_likeStatus isUserLiked]];
      [(SUUIFacebookPageSection *)self _applyColorSchemeToFacebookView:self->_facebookView];

      facebookView = self->_facebookView;
    }
    else
    {
      facebookView = 0;
    }
  }
  return facebookView;
}

- (void)_finishLookupWithStatus:(id)a3 error:(id)a4
{
  id v14 = a3;
  self->_isLoadingLikeStatus = 0;
  p_likeStatus = &self->_likeStatus;
  objc_storeStrong((id *)&self->_likeStatus, a3);
  if (self->_likeStatus)
  {
    id v7 = [(SUUIStorePageSection *)self context];
    uint64_t v8 = [v7 collectionView];
    objc_super v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    BOOL v10 = [v8 cellForItemAtIndexPath:v9];

    facebookView = self->_facebookView;
    if (facebookView)
    {
      id v12 = [(SUUIFacebookLikeStatus *)*p_likeStatus friendNames];
      [(SUUIReviewsFacebookView *)facebookView setFriendNames:v12];

      [(SUUIReviewsFacebookView *)self->_facebookView setUserLiked:[(SUUIFacebookLikeStatus *)*p_likeStatus isUserLiked]];
    }
    else if (v10)
    {
      v13 = [(SUUIFacebookPageSection *)self _facebookView];
      [v10 setContentChildView:v13];
    }
    else
    {
      [(SUUIFacebookPageSection *)self _reloadCollectionViewSection];
    }
  }
  else if (self->_facebookAccountsExist == 1)
  {
    self->_int facebookAccountsExist = 0;
    [(SUUIFacebookPageSection *)self _reloadCollectionViewSection];
  }
}

- (void)_reloadCollectionViewSection
{
  uint64_t v3 = [MEMORY[0x263F82E00] areAnimationsEnabled];
  [MEMORY[0x263F82E00] setAnimationsEnabled:0];
  uint64_t v4 = [(SUUIStorePageSection *)self context];
  char v5 = [v4 collectionView];
  BOOL v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  [v5 reloadSections:v6];

  id v7 = (void *)MEMORY[0x263F82E00];
  [v7 setAnimationsEnabled:v3];
}

- (void)_reloadLikeStatus
{
  uint64_t v3 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v4 = [v3 viewElement];
  char v5 = [v4 URLString];

  if (v5)
  {
    BOOL v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
    objc_initWeak(&location, self);
    uint64_t v7 = SUUISocialFramework();
    uint64_t v8 = objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Slfacebooksess.isa, v7), "sharedSession");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke;
    v10[3] = &unk_265408140;
    id v9 = v6;
    id v11 = v9;
    objc_copyWeak(&v12, &location);
    [v8 fetchLikeStatusForURL:v9 flags:9 completion:v10];
    self->_isLoadingLikeStatus = 1;
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke_2;
  v9[3] = &unk_265401250;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __44__SUUIFacebookPageSection__reloadLikeStatus__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = [[SUUIFacebookLikeStatus alloc] initWithURL:*(void *)(a1 + 40) likeStatusDictionary:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishLookupWithStatus:v3 error:*(void *)(a1 + 48)];
}

- (void)_resetState
{
  uint64_t v3 = [(SUUIStorePageSection *)self context];
  uint64_t v4 = [v3 collectionView];
  id v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  id v9 = [v4 cellForItemAtIndexPath:v5];

  [v9 setContentChildView:0];
  id v6 = [(SUUIReviewsFacebookView *)self->_facebookView likeToggleButton];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  facebookView = self->_facebookView;
  self->_facebookView = 0;

  likeStatus = self->_likeStatus;
  self->_likeStatus = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeStatus, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_facebookView, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
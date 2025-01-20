@interface SearchUICommandRowModel
- (BOOL)commandSupported;
- (BOOL)toggled;
- (SearchUICommandRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (TLKRichText)subtitle;
- (TLKRichText)title;
- (unint64_t)subscriptionType;
- (void)checkIfCommandIsValidWithCompletionHandler:(id)a3;
- (void)getSubscriptionStatus:(id)a3;
- (void)safelyUpdateView:(id)a3;
- (void)toggleStateWithDetailedSectionView:(id)a3;
- (void)updateStateWithCommandCardSectionView:(id)a3;
@end

@implementation SearchUICommandRowModel

- (SearchUICommandRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SearchUICommandRowModel;
  v12 = [(SearchUICardSectionRowModel *)&v27 initWithResult:a3 cardSection:v11 isInline:1 queryId:a6 itemIdentifier:a7];
  if (v12)
  {
    v13 = [v11 title];
    uint64_t v14 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v13];
    title = v12->_title;
    v12->_title = (TLKRichText *)v14;

    v16 = [v11 toggledTitle];
    uint64_t v17 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v16];
    toggledTitle = v12->_toggledTitle;
    v12->_toggledTitle = (TLKRichText *)v17;

    v19 = [v11 subtitle];
    uint64_t v20 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v19];
    subtitle = v12->_subtitle;
    v12->_subtitle = (TLKRichText *)v20;

    v22 = [v11 command];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [v22 domainSubscriptionRequestItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [v23 canonicalIdentifier];
        sportsCanonicalID = v12->_sportsCanonicalID;
        v12->_sportsCanonicalID = (NSString *)v24;
      }
    }
  }
  return v12;
}

- (void)checkIfCommandIsValidWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(SearchUICommandRowModel *)self subscriptionType] == 1)
  {
    if ([(SearchUICommandRowModel *)self commandSupported])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __70__SearchUICommandRowModel_checkIfCommandIsValidWithCompletionHandler___block_invoke;
      v5[3] = &unk_1E6E72E90;
      id v6 = v4;
      +[SearchUISportsKitUtilities liveActivitiesEnabledWithCompletionBlock:v5];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, BOOL))v4 + 2))(v4, [(SearchUICommandRowModel *)self commandSupported]);
  }
}

uint64_t __70__SearchUICommandRowModel_checkIfCommandIsValidWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)subscriptionType
{
  return [(NSString *)self->_sportsCanonicalID length] != 0;
}

- (void)getSubscriptionStatus:(id)a3
{
  sportsCanonicalID = self->_sportsCanonicalID;
  if (sportsCanonicalID)
  {
    (*((void (**)(id, BOOL))a3 + 2))(a3, +[SearchUISportsKitUtilities checkForSessionWithCanonicalId:sportsCanonicalID]);
  }
  else
  {
    v5 = (void (**)(id, void))a3;
    id v6 = SearchUIGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SearchUICommandRowModel getSubscriptionStatus:](v6);
    }

    v5[2](v5, 0);
  }
}

- (BOOL)commandSupported
{
  return self->_sportsCanonicalID != 0;
}

- (TLKRichText)title
{
  if (self->_toggled) {
    v2 = &OBJC_IVAR___SearchUICommandRowModel__toggledTitle;
  }
  else {
    v2 = &OBJC_IVAR___SearchUICommandRowModel__title;
  }
  return (TLKRichText *)*(id *)((char *)&self->super.super.super.isa + *v2);
}

- (TLKRichText)subtitle
{
  return self->_subtitle;
}

- (BOOL)toggled
{
  return self->_toggled;
}

- (void)safelyUpdateView:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FAE198];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SearchUICommandRowModel_safelyUpdateView___block_invoke;
  v7[3] = &unk_1E6E72620;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 dispatchMainIfNecessary:v7];
}

void __44__SearchUICommandRowModel_safelyUpdateView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rowModel];
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 updateWithRowModel:v5];
  }
}

- (void)updateStateWithCommandCardSectionView:(id)a3
{
  id v4 = a3;
  if ([(SearchUICommandRowModel *)self commandSupported])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__SearchUICommandRowModel_updateStateWithCommandCardSectionView___block_invoke;
    v5[3] = &unk_1E6E72820;
    void v5[4] = self;
    id v6 = v4;
    [(SearchUICommandRowModel *)self getSubscriptionStatus:v5];
  }
}

uint64_t __65__SearchUICommandRowModel_updateStateWithCommandCardSectionView___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = a2;
  return [*(id *)(a1 + 32) safelyUpdateView:*(void *)(a1 + 40)];
}

- (void)toggleStateWithDetailedSectionView:(id)a3
{
  id v4 = a3;
  if ([(SearchUICommandRowModel *)self commandSupported])
  {
    uint64_t v5 = self->_sportsCanonicalID;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke;
    v7[3] = &unk_1E6E73948;
    id v6 = v5;
    id v8 = v6;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [(SearchUICommandRowModel *)self getSubscriptionStatus:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke(id *a1, int a2)
{
  if (a1[4])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2;
    aBlock[3] = &unk_1E6E73920;
    char v13 = a2;
    objc_copyWeak(&v12, a1 + 6);
    id v11 = a1[5];
    id v4 = _Block_copy(aBlock);
    uint64_t v5 = (void *)MEMORY[0x1E4FAE198];
    if (a2)
    {
      id v6 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_20;
      v9[3] = &unk_1E6E72C68;
      v9[4] = a1[4];
      v9[5] = v4;
      [v5 dispatchAsyncIfNecessary:v9];
    }
    else
    {
      id v6 = v8;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_21;
      v8[3] = &unk_1E6E72C68;
      v8[4] = a1[4];
      v8[5] = v4;
      [v5 dispatchAsyncIfNecessary:v8];
    }

    objc_destroyWeak(&v12);
  }
  else
  {
    v7 = SearchUIGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_cold_1(a2, v7);
    }
  }
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateStateWithCommandCardSectionView:*(void *)(a1 + 32)];
}

uint64_t __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_20(uint64_t a1)
{
  return +[SearchUISportsKitUtilities destroySessionWithCanonicalId:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
}

uint64_t __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_21(uint64_t a1)
{
  return +[SearchUISportsKitUtilities createSessionWithCanonicalId:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sportsCanonicalID, 0);
}

- (void)getSubscriptionStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: Unknown type, can't get status", v1, 2u);
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"subscribe";
  if (a1) {
    v2 = @"unsubscribe";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: Unknown %@ command type", (uint8_t *)&v3, 0xCu);
}

void __62__SearchUICommandRowModel_toggleStateWithDetailedSectionView___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = @"unsubscribe";
  if (!*(unsigned char *)(a1 + 48)) {
    int v3 = @"subscribe";
  }
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUICommandRowModel: SportsKit %@ command error : %@", (uint8_t *)&v4, 0x16u);
}

@end
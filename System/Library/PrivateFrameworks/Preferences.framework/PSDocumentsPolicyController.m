@interface PSDocumentsPolicyController
- (BOOL)isFirstSourceResults;
- (DOCDocumentSource)selectedDocumentSource;
- (DOCSourceSearchingContext)searchingContext;
- (NSString)bundleIdentifier;
- (PSSpecifier)groupSpecifier;
- (id)documentSource;
- (id)specifiers;
- (void)dealloc;
- (void)setBundleIdentifier:(id)a3;
- (void)setDocumentSource:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setIsFirstSourceResults:(BOOL)a3;
- (void)setSearchingContext:(id)a3;
- (void)setSelectedDocumentSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooterAnimated:(BOOL)a3;
- (void)updateRadioGroupWithSources:(id)a3 animated:(BOOL)a4;
@end

@implementation PSDocumentsPolicyController

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1E4F5F7A8];
  v4 = [(PSDocumentsPolicyController *)self searchingContext];
  [v3 endSearchingSources:v4];

  v5.receiver = self;
  v5.super_class = (Class)PSDocumentsPolicyController;
  [(PSListController *)&v5 dealloc];
}

- (id)specifiers
{
  p_specifiers = &self->super._specifiers;
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    objc_super v5 = [(PSDocumentsPolicyController *)self documentSource];
    [(PSDocumentsPolicyController *)self setSelectedDocumentSource:v5];
    v6 = [(PSSpecifier *)self->super.super._specifier propertyForKey:PSDocumentBundleIdentifierKey];
    [(PSDocumentsPolicyController *)self setBundleIdentifier:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = PS_LocalizedStringForDocumentsPolicy(@"STORE_DOCS_AND_DATA_ON");
    v9 = +[PSSpecifier groupSpecifierWithName:v8];
    [(PSDocumentsPolicyController *)self setGroupSpecifier:v9];

    v10 = [(PSDocumentsPolicyController *)self groupSpecifier];
    [v10 setIdentifier:@"DOCS_AND_DATA_GROUP"];

    v11 = [(PSDocumentsPolicyController *)self groupSpecifier];
    [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:@"isRadioGroup"];

    v12 = [(PSDocumentsPolicyController *)self groupSpecifier];
    [v7 addObject:v12];

    objc_storeStrong((id *)p_specifiers, v7);
    [(PSListController *)self reload];
    v13 = [(PSDocumentsPolicyController *)self searchingContext];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F5F7A8];
      v15 = [(PSDocumentsPolicyController *)self searchingContext];
      [v14 endSearchingSources:v15];
    }
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E4F5F7A8];
    v17 = [(PSDocumentsPolicyController *)self bundleIdentifier];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __41__PSDocumentsPolicyController_specifiers__block_invoke;
    v23 = &unk_1E5C5D7F0;
    objc_copyWeak(&v24, &location);
    v18 = [v16 startSearchingSourcesForBundleIdentifier:v17 updateBlock:&v20];
    -[PSDocumentsPolicyController setSearchingContext:](self, "setSearchingContext:", v18, v20, v21, v22, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    specifiers = *p_specifiers;
  }
  return specifiers;
}

void __41__PSDocumentsPolicyController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PSDocumentsPolicyController_specifiers__block_invoke_2;
  v5[3] = &unk_1E5C5D7C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __41__PSDocumentsPolicyController_specifiers__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained isFirstSourceResults];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setIsFirstSourceResults:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 updateRadioGroupWithSources:*(void *)(a1 + 32) animated:v4];
}

- (void)updateRadioGroupWithSources:(id)a3 animated:(BOOL)a4
{
  BOOL v29 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 allValues];
  id v6 = (void *)[v5 mutableCopy];

  [v6 sortUsingComparator:&__block_literal_global_3];
  [(PSListController *)self beginUpdates];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [(PSDocumentsPolicyController *)self specifiers];
  v8 = [v7 reverseObjectEnumerator];
  v9 = [v8 allObjects];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = [v14 propertyForKey:@"PSDocumentSourceKey"];
        int v16 = [v6 containsObject:v15];

        if (v16) {
          [(PSListController *)self removeSpecifier:v14 animated:v29];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  [(PSListController *)self endUpdates];
  [(PSListController *)self beginUpdates];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if (([v22 hidden] & 1) == 0)
        {
          v23 = [v22 displayName];
          id v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v24 setProperty:v22 forKey:@"PSDocumentSourceKey"];
          v25 = [v22 iconForSize:0];
          [v24 setProperty:v25 forKey:@"iconImage"];

          [(PSListController *)self addSpecifier:v24 animated:v29];
          v26 = [(PSDocumentsPolicyController *)self selectedDocumentSource];
          int v27 = [v22 isEqual:v26];

          if (v27)
          {
            v28 = [(PSListController *)self specifierForID:@"DOCS_AND_DATA_GROUP"];
            [v28 setProperty:v24 forKey:@"radioGroupCheckedSpecifier"];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }

  [(PSListController *)self endUpdates];
  [(PSDocumentsPolicyController *)self updateFooterAnimated:v29];
}

uint64_t __68__PSDocumentsPolicyController_updateRadioGroupWithSources_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 identifier];
  uint64_t v7 = *MEMORY[0x1E4F5F7B0];
  char v8 = [v6 isEqualToString:*MEMORY[0x1E4F5F7B0]];

  if (v8) {
    goto LABEL_4;
  }
  v9 = [v5 identifier];
  char v10 = [v9 isEqualToString:v7];

  if (v10)
  {
LABEL_6:
    uint64_t v14 = 1;
    goto LABEL_7;
  }
  uint64_t v11 = [v5 identifier];
  uint64_t v12 = *MEMORY[0x1E4F5F7B8];
  char v13 = [v11 isEqualToString:*MEMORY[0x1E4F5F7B8]];

  if ((v13 & 1) == 0)
  {
    v15 = [v4 identifier];
    char v16 = [v15 isEqualToString:v12];

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = [v4 displayName];
      uint64_t v19 = [v5 displayName];
      uint64_t v14 = [v18 localizedStandardCompare:v19];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v14 = -1;
LABEL_7:

  return v14;
}

- (void)updateFooterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PSDocumentsPolicyController *)self selectedDocumentSource];
  id v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F5F7B0]];

  if (v7)
  {
    char v8 = @"DOCUMENTS_AND_DATA_ICLOUD_FOOTER";
LABEL_5:
    PS_LocalizedStringForDocumentsPolicy(v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = [(PSDocumentsPolicyController *)self selectedDocumentSource];
  char v10 = [v9 identifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F5F7B8]];

  if (v11)
  {
    char v8 = @"DOCUMENTS_AND_DATA_LOCAL_FOOTER";
    goto LABEL_5;
  }
  uint64_t v12 = NSString;
  char v13 = PS_LocalizedStringForDocumentsPolicy(@"DOCUMENTS_AND_DATA_THIRD_PARTY_FOOTER");
  uint64_t v14 = [(PSDocumentsPolicyController *)self selectedDocumentSource];
  v15 = [v14 displayName];
  objc_msgSend(v12, "stringWithFormat:", v13, v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  char v16 = [(PSListController *)self specifierForID:@"DOCS_AND_DATA_GROUP"];
  [v16 setProperty:v17 forKey:@"footerText"];
  [(PSListController *)self reloadSpecifier:v16 animated:v3];
}

- (id)documentSource
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  char v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = (void *)MEMORY[0x1E4F5F7A8];
  id v5 = [(PSSpecifier *)self->super.super._specifier propertyForKey:PSDocumentBundleIdentifierKey];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PSDocumentsPolicyController_documentSource__block_invoke;
  v9[3] = &unk_1E5C5D838;
  int v11 = &v12;
  id v6 = v3;
  char v10 = v6;
  [v4 defaultSourceForBundleIdentifier:v5 completionBlock:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__PSDocumentsPolicyController_documentSource__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Error getting selected document source.", v8, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setDocumentSource:(id)a3
{
  id v4 = a3;
  [(PSDocumentsPolicyController *)self setSelectedDocumentSource:v4];
  id v5 = (void *)MEMORY[0x1E4F5F7A8];
  id v6 = [(PSDocumentsPolicyController *)self bundleIdentifier];
  [v5 setDefaultSource:v4 forBundleIdentifier:v6];

  [(PSDocumentsPolicyController *)self updateFooterAnimated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(PSListController *)self indexForIndexPath:v6];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = [(NSArray *)self->super._specifiers objectAtIndex:v8];
  }
  char v10 = [(PSListController *)self getGroupSpecifierForSpecifier:v9];
  int v11 = [v10 propertyForKey:@"isRadioGroup"];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    char v13 = [v9 propertyForKey:@"PSDocumentSourceKey"];
    [(PSDocumentsPolicyController *)self setDocumentSource:v13];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._parentController);
  [WeakRetained reloadSpecifier:self->super.super._specifier];

  v15.receiver = self;
  v15.super_class = (Class)PSDocumentsPolicyController;
  [(PSListController *)&v15 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (DOCDocumentSource)selectedDocumentSource
{
  return self->_selectedDocumentSource;
}

- (void)setSelectedDocumentSource:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (DOCSourceSearchingContext)searchingContext
{
  return self->_searchingContext;
}

- (void)setSearchingContext:(id)a3
{
}

- (BOOL)isFirstSourceResults
{
  return self->_isFirstSourceResults;
}

- (void)setIsFirstSourceResults:(BOOL)a3
{
  self->_isFirstSourceResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchingContext, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedDocumentSource, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
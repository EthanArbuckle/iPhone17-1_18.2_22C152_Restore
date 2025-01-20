@interface SearchUILinkPresentationCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (id)fallbackMetadataWithURL:(id)a3;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (LPLinkView)linkView;
- (UITapGestureRecognizer)linkPresentationTapped;
- (id)setupContentView;
- (void)_performCommand;
- (void)fetchMetadataFromMessagesWithURL:(id)a3 completionBlock:(id)a4;
- (void)setLinkPresentationTapped:(id)a3;
- (void)setLinkView:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUILinkPresentationCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (id)fallbackMetadataWithURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setOriginalURL:v3];
  v5 = SearchUIGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SearchUILinkPresentationCardSectionView fallbackMetadataWithURL:]((uint64_t)v3, v5);
  }

  return v4;
}

- (id)setupContentView
{
  id v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 _setOverrideBackgroundColor:v4];

  [v3 _setDisableAnimations:1];
  [v3 _setPreferredSizeClass:5];
  [v3 _setDisablePreviewGesture:0];
  [v3 _setDisableTapGesture:1];
  [v3 _setDisableHighlightGesture:1];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__performCommand];
  [(SearchUILinkPresentationCardSectionView *)self setLinkPresentationTapped:v5];

  [v3 addGestureRecognizer:self->_linkPresentationTapped];
  [(SearchUILinkPresentationCardSectionView *)self setLinkView:v3];
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (updateWithRowModel__onceToken_0 != -1) {
    dispatch_once(&updateWithRowModel__onceToken_0, &__block_literal_global_5);
  }
  v41.receiver = self;
  v41.super_class = (Class)SearchUILinkPresentationCardSectionView;
  [(SearchUICardSectionView *)&v41 updateWithRowModel:v4];
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [(SearchUICardSectionView *)self section];
  v7 = [v6 url];
  v8 = [v5 URLWithString:v7];

  v9 = [(SearchUILinkPresentationCardSectionView *)self linkView];
  [v9 setURL:v8];

  v10 = [(SearchUILinkPresentationCardSectionView *)self linkView];
  [v10 _setMetadata:0 isFinal:0];

  v11 = [(SearchUILinkPresentationCardSectionView *)self linkView];
  [v11 _setContactsForAttribution:0];

  v12 = [(SearchUILinkPresentationCardSectionView *)self linkView];
  [v12 _setHighlightedForAttribution:0];

  if (v8)
  {
    uint64_t v13 = [(id)updateWithRowModel__metadataCache objectForKey:v8];
    v30 = (void *)v13;
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = [(SearchUILinkPresentationCardSectionView *)self linkView];
      [v15 setMetadata:v14];
    }
    else
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2;
      v37[3] = &unk_1E6E72988;
      id v38 = v8;
      v39 = self;
      id v40 = v4;
      [(SearchUILinkPresentationCardSectionView *)self fetchMetadataFromMessagesWithURL:v38 completionBlock:v37];

      v15 = v38;
    }

    v16 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v17 = [(SearchUICardSectionView *)self section];
    v18 = [v17 peopleToBadge];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v24 = [v23 contactIdentifier];

          if (v24)
          {
            v25 = [v23 contactIdentifier];
            [v16 addObject:v25];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v20);
    }

    v26 = +[SearchUIContactCache sharedCache];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_20;
    v31[3] = &unk_1E6E729B0;
    v31[4] = self;
    id v32 = v4;
    [v26 fetchContactsForIdentifiers:v16 completionHandler:v31];

    v27 = [(SearchUICardSectionView *)self section];
    uint64_t v28 = [v27 isHighlighted];
    v29 = [(SearchUILinkPresentationCardSectionView *)self linkView];
    [v29 _setHighlightedForAttribution:v28];
  }
}

uint64_t __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke()
{
  updateWithRowModel__metadataCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = SearchUIGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  if (v5)
  {
    [(id)updateWithRowModel__metadataCache setObject:v5 forKey:a1[4]];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_16;
    v9[3] = &unk_1E6E72938;
    v8 = (void *)a1[6];
    v9[4] = a1[5];
    id v10 = v8;
    id v11 = v5;
    +[SearchUIUtilities dispatchMainIfNecessary:v9];
  }
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_16(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rowModel];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) linkView];
    [v5 setMetadata:v4];
  }
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_3;
  v6[3] = &unk_1E6E72938;
  uint64_t v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v6];
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rowModel];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) linkView];
    [v5 _setContactsForAttribution:v4];
  }
}

- (void)fetchMetadataFromMessagesWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  v9 = +[SearchUIUtilities bundleIdentifierForApp:10];
  id v10 = [(SearchUICardSectionView *)self section];
  id v11 = [v10 coreSpotlightIdentifier];

  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke;
    v13[3] = &unk_1E6E729D8;
    id v15 = v7;
    v13[4] = self;
    id v14 = v6;
    [v8 provideDataForBundle:v9 identifier:v11 type:@"com.apple.metadata-importer.linkMetadata" completionHandler:v13];
  }
  else
  {
    v12 = [(id)objc_opt_class() fallbackMetadataWithURL:v6];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v12, 0);
  }
}

void __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (IDSBAASignerErrorDomain_block_invoke_onceToken != -1) {
      dispatch_once(&IDSBAASignerErrorDomain_block_invoke_onceToken, &__block_literal_global_27);
    }
    id v17 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:IDSBAASignerErrorDomain_block_invoke_objectClasses fromData:v5 error:&v17];
    id v16 = v17;
    id v8 = [v7 objectForKeyedSubscript:@"attachmentPaths"];
    v9 = [v7 objectForKeyedSubscript:@"payloadData"];
    id v10 = [MEMORY[0x1E4F30AA8] linkWithDataRepresentation:v9 attachments:v8];
    id v11 = [v10 metadata];
    uint64_t v12 = *(void *)(a1 + 48);
    if (v11)
    {
      (*(void (**)(void, void *, id))(v12 + 16))(*(void *)(a1 + 48), v11, v6);
    }
    else
    {
      id v15 = [(id)objc_opt_class() fallbackMetadataWithURL:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v15, v6);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [(id)objc_opt_class() fallbackMetadataWithURL:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v6);
  }
}

void __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  id v3 = (void *)IDSBAASignerErrorDomain_block_invoke_objectClasses;
  IDSBAASignerErrorDomain_block_invoke_objectClasses = v2;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a5;
  id v9 = [(SearchUILinkPresentationCardSectionView *)self linkView];
  if (v9 == v8)
  {
    id v10 = [(SearchUICardSectionView *)self rowModel];
    uint64_t v11 = [v10 sectionType];

    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  CGFloat width = *MEMORY[0x1E4F4BED8];
  CGFloat height = *(double *)(MEMORY[0x1E4F4BED8] + 8);
LABEL_5:

  double v12 = width;
  double v13 = height;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)_performCommand
{
  id v3 = [(SearchUICardSectionView *)self feedbackDelegate];
  id v6 = +[SearchUIUtilities environmentForDelegate:v3];

  uint64_t v4 = [(SearchUICardSectionView *)self rowModel];
  uint64_t v5 = +[SearchUICommandHandler handlerForRowModel:v4 environment:v6];
  [v5 executeWithTriggerEvent:2];
}

- (UITapGestureRecognizer)linkPresentationTapped
{
  return self->_linkPresentationTapped;
}

- (void)setLinkPresentationTapped:(id)a3
{
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_linkPresentationTapped, 0);
}

+ (void)fallbackMetadataWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Using fallback metadata with url: %@", (uint8_t *)&v2, 0xCu);
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Error fetching SearchUILinkPresentation metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end
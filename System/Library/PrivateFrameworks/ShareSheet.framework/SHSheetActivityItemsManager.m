@interface SHSheetActivityItemsManager
+ (id)_placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4 shouldUpdateMappings:(BOOL)a5;
+ (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4;
- (BOOL)_supportsWebpagesForActivity:(id)a3;
- (BOOL)isContentManaged;
- (BOOL)linkMetadataValuesNeedsUpdate;
- (NSArray)activityItems;
- (NSArray)linkMetadataValues;
- (NSArray)suggestionAssetIdentifiers;
- (NSArray)urlRequests;
- (NSArray)urlSandboxExtensions;
- (SHSheetActivityItemsManager)initWithActivityItems:(id)a3 activityViewController:(id)a4 delegate:(id)a5 collaborationDelegate:(id)a6;
- (SHSheetActivityItemsManagerCollaborationDelegate)collaborationDelegate;
- (SHSheetActivityItemsManagerDelegate)delegate;
- (SHSheetActivityItemsResult)cacheResult;
- (UIActivityViewController)activityViewController;
- (id)_delegateLoadedURLs;
- (id)_requestInitialSocialTextForActivityItem:(id)a3 activity:(id)a4;
- (id)_requestItemsForActivityItem:(id)a3 activity:(id)a4;
- (id)_requestRecipientsHandlesForActivityItem:(id)a3 activity:(id)a4;
- (id)_requestSubjectForActivityItem:(id)a3 activity:(id)a4;
- (id)_requestThumbnailForActivityItem:(id)a3 activity:(id)a4;
- (id)_resolveActivityItemsForActivity:(id)a3;
- (id)_resolvePlaceholderActivityItems;
- (id)activityItemURLValuesForActivity:(id)a3;
- (id)activityItemValuesForActivity:(id)a3;
- (id)initialSocialTextForActivity:(id)a3;
- (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4;
- (id)recipientsForActivity:(id)a3;
- (id)recipientsHandlesForActivity:(id)a3;
- (id)securityScopedURLsForActivity:(id)a3;
- (id)subjectForActivity:(id)a3;
- (id)suggestedImageDataFromActivityItem:(id)a3;
- (int64_t)_requestAttachmentURLItemDataForActivityItem:(id)a3 activity:(id)a4;
- (void)_configureContentManagedForActivityItem:(id)a3 activityItemValue:(id)a4 outURLs:(id)a5 outScopedURLs:(id)a6;
- (void)_didLoadGroupActivityMetadata:(id)a3;
- (void)_loadGroupActivityMetadataIfNeeded;
- (void)_updateCacheResultForActivity:(id)a3;
- (void)_updateIsContentManagedForURLs;
- (void)_updateLinkMetadataValues;
- (void)_updateURLRequests;
- (void)enumerateBackgroundOperationsForActivity:(id)a3 enumerator:(id)a4;
- (void)invalidateCache;
- (void)loadItemProvidersForRequest:(id)a3 activity:(id)a4 completion:(id)a5;
- (void)setCacheResult:(id)a3;
- (void)setCollaborationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLinkMetadataValues:(id)a3;
- (void)setLinkMetadataValuesNeedsUpdate:(BOOL)a3;
- (void)setUrlRequests:(id)a3;
- (void)setUrlSandboxExtensions:(id)a3;
@end

@implementation SHSheetActivityItemsManager

- (SHSheetActivityItemsManager)initWithActivityItems:(id)a3 activityViewController:(id)a4 delegate:(id)a5 collaborationDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SHSheetActivityItemsManager;
  v14 = [(SHSheetActivityItemsManager *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    activityItems = v14->_activityItems;
    v14->_activityItems = (NSArray *)v15;

    objc_storeWeak((id *)&v14->_activityViewController, v11);
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeWeak((id *)&v14->_collaborationDelegate, v13);
    [(SHSheetActivityItemsManager *)v14 _updateURLRequests];
    [(SHSheetActivityItemsManager *)v14 _updateLinkMetadataValues];
    [(SHSheetActivityItemsManager *)v14 _loadGroupActivityMetadataIfNeeded];
  }

  return v14;
}

- (NSArray)linkMetadataValues
{
  if ([(SHSheetActivityItemsManager *)self linkMetadataValuesNeedsUpdate]) {
    [(SHSheetActivityItemsManager *)self _updateLinkMetadataValues];
  }
  v3 = (void *)[(NSArray *)self->_linkMetadataValues copy];
  return (NSArray *)v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  if (self->_isContentManaged != a3)
  {
    self->_isContentManaged = a3;
    [(SHSheetActivityItemsManager *)self _updateIsContentManagedForURLs];
  }
}

- (void)invalidateCache
{
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating current cache result.", v4, 2u);
  }

  [(SHSheetActivityItemsManager *)self setCacheResult:0];
}

- (void)_updateIsContentManagedForURLs
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(SHSheetActivityItemsManager *)self cacheResult];
  v4 = [v3 activityItemURLValues];

  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(SHSheetActivityItemsManager *)self isContentManaged];
    v6 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    objc_super v18 = v4;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Update URLs:%@ with contentManaged:%@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "ui_setIsContentManaged:", -[SHSheetActivityItemsManager isContentManaged](self, "isContentManaged", (void)v12));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)activityItemValuesForActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:v4];
  v5 = [(SHSheetActivityItemsManager *)self cacheResult];
  v6 = [v5 activityItemValues];

  if (v4)
  {
    id v7 = [(SHSheetActivityItemsManager *)self collaborationDelegate];

    if (v7)
    {
      uint64_t v8 = [(SHSheetActivityItemsManager *)self collaborationDelegate];
      uint64_t v9 = [v8 activityItemsManager:self collaborationActivityItemValuesForActivityItemValue:v6 activity:v4];

      if (v9)
      {
        uint64_t v10 = share_sheet_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          long long v14 = v9;
          _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Overidding activityItemValues with collaborative item values:%@", (uint8_t *)&v13, 0xCu);
        }

        id v11 = v9;
        v6 = v11;
      }
    }
  }

  return v6;
}

- (NSArray)suggestionAssetIdentifiers
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:0];
  v3 = [(SHSheetActivityItemsManager *)self cacheResult];
  id v4 = [v3 suggestionAssetIdentifiers];

  return (NSArray *)v4;
}

- (id)activityItemURLValuesForActivity:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 activityItemURLValues];

  return v5;
}

- (id)suggestedImageDataFromActivityItem:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 suggestedImageData];

  return v5;
}

- (id)securityScopedURLsForActivity:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 securityScopedURLs];

  return v5;
}

- (id)initialSocialTextForActivity:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 initialSocialText];

  return v5;
}

- (id)subjectForActivity:(id)a3
{
  id v4 = a3;
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:v4];
  v5 = [(SHSheetActivityItemsManager *)self collaborationDelegate];
  v6 = [v5 activityItemsManager:self subjectForActivity:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [(SHSheetActivityItemsManager *)self cacheResult];
    id v7 = [v8 subject];
  }
  return v7;
}

- (id)recipientsHandlesForActivity:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 recipientsHandles];

  return v5;
}

- (id)recipientsForActivity:(id)a3
{
  [(SHSheetActivityItemsManager *)self _updateCacheResultForActivity:a3];
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = [v4 recipients];

  return v5;
}

- (void)_updateCacheResultForActivity:(id)a3
{
  id v9 = a3;
  id v4 = [(SHSheetActivityItemsManager *)self cacheResult];
  v5 = v4;
  if (v9)
  {
    id v6 = [v4 activity];

    if (v6 == v9) {
      goto LABEL_7;
    }
    uint64_t v7 = -[SHSheetActivityItemsManager _resolveActivityItemsForActivity:](self, "_resolveActivityItemsForActivity:");
  }
  else
  {
    if ([v4 isPlaceholder]) {
      goto LABEL_7;
    }
    uint64_t v7 = [(SHSheetActivityItemsManager *)self _resolvePlaceholderActivityItems];
  }
  uint64_t v8 = (void *)v7;

  v5 = v8;
LABEL_7:
  [(SHSheetActivityItemsManager *)self setCacheResult:v5];
}

- (void)_configureContentManagedForActivityItem:(id)a3 activityItemValue:(id)a4 outURLs:(id)a5 outScopedURLs:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(SHSheetActivityItemsManager *)self isContentManaged];
  if (v14) {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CC28];
  }
  objc_setAssociatedObject(v11, &__UIIsContentManagedReferenceKey, v15, (void *)1);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (objc_opt_respondsToSelector())
  {
    v17 = [(SHSheetActivityItemsManager *)self activityViewController];
    objc_super v18 = [v10 activityViewControllerSuggestionFileURL:v17];

    __int16 v19 = share_sheet_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1A0AD8000, v19, OS_LOG_TYPE_DEFAULT, "enrich suggestions with suggestionFileURL:%@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    objc_super v18 = 0;
  }
  if (isKindOfClass & 1 | (v18 != 0))
  {
    if (isKindOfClass) {
      v20 = v11;
    }
    else {
      v20 = v18;
    }
    id v21 = v20;
    objc_msgSend(v21, "ui_setIsContentManaged:", v14);
    [v12 addObject:v21];
    v22 = +[UISUISecurityScopedResource scopedResourceWithURL:v21 allowedAccess:1];
    if (!v22)
    {
      v22 = +[UISUISecurityScopedResource scopedResourceWithURL:v21 allowedAccess:0];
    }
    [v13 addObject:v22];
  }
}

+ (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4
{
  return +[SHSheetActivityItemsManager _placeholderActivityItemValuesForActivityItem:a3 activityViewController:a4 shouldUpdateMappings:1];
}

+ (id)_placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4 shouldUpdateMappings:(BOOL)a5
{
  BOOL v5 = a5;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v7 activityViewControllerPlaceholderItems:v8];
    if (v5) {
      goto LABEL_11;
    }
LABEL_8:
    id v12 = v9;
    goto LABEL_23;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v7 activityViewControllerPlaceholderItem:v8];
    id v11 = (void *)v10;
    if (v10)
    {
      v28[0] = v10;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CBF0];
    }

    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v5) {
    goto LABEL_8;
  }
LABEL_11:
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = v9;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (v19)
        {
          v20 = [[_UIActivityPlaceholderItemProxy alloc] initWithPlaceholderItem:v19];
          if (v20)
          {
            [v13 addObject:v20];
            +[_UIActivityItemMapping _addActivityItem:v20 activityViewController:v8 originalActivityItem:v7];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  id v12 = (id)[v13 copy];
  id v9 = v22;
LABEL_23:

  return v12;
}

- (id)placeholderActivityItemValuesForActivityItem:(id)a3 activityViewController:(id)a4
{
  BOOL v5 = +[SHSheetActivityItemsManager _placeholderActivityItemValuesForActivityItem:a3 activityViewController:a4 shouldUpdateMappings:0];
  id v6 = [v5 firstObject];
  if ([v5 count] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 canLoadObjectOfClass:objc_opt_class()])
      {
        id v7 = [(SHSheetActivityItemsManager *)self _delegateLoadedURLs];
        if ([v7 count])
        {
          id v8 = v7;

          BOOL v5 = v8;
        }
      }
    }
  }

  return v5;
}

- (id)_delegateLoadedURLs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(SHSheetActivityItemsManager *)self delegate];
  id v4 = [v3 urlRequestsForActivityItemsManager:self];

  if ([v4 count])
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "URL", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = (void *)[v5 copy];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)_resolvePlaceholderActivityItems
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v53 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v52 = [MEMORY[0x1E4F1CA48] array];
  v44 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SHSheetActivityItemsManager *)self collaborationDelegate];
  BOOL v5 = [v4 collaborationPlaceholderActivityItemsForActivityItemsManager:self];

  v43 = v5;
  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(SHSheetActivityItemsManager *)self activityItems];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = (void *)v52;
  uint64_t v48 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v48)
  {
    v49 = 0;
    uint64_t v46 = *(void *)v59;
    v47 = 0;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v10 = [(SHSheetActivityItemsManager *)self activityViewController];
        id v11 = [(SHSheetActivityItemsManager *)self placeholderActivityItemValuesForActivityItem:v9 activityViewController:v10];

        if ([v11 count])
        {
          v50 = v11;
          uint64_t v51 = i;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v55 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v54 + 1) + 8 * j);
                if (v17)
                {
                  objc_super v18 = [[_UIActivityPlaceholderItemProxy alloc] initWithPlaceholderItem:v17];
                  if (v18)
                  {
                    [(SHSheetActivityItemsManager *)self _configureContentManagedForActivityItem:v9 activityItemValue:v18 outURLs:v3 outScopedURLs:v7];
                    [v53 addObject:v18];
                    [(SHSheetActivityItemsManager *)self activityViewController];
                    v20 = uint64_t v19 = v3;
                    +[_UIActivityItemMapping _addActivityItem:v18 activityViewController:v20 originalActivityItem:v9];

                    v3 = v19;
                    uint64_t v7 = (void *)v52;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v14);
          }

          id v11 = v50;
          uint64_t i = v51;
        }
        else if (v9)
        {
          [(SHSheetActivityItemsManager *)self _configureContentManagedForActivityItem:v9 activityItemValue:v9 outURLs:v3 outScopedURLs:v7];
          [v53 addObject:v9];
        }
        if (objc_opt_respondsToSelector())
        {
          id v21 = [(SHSheetActivityItemsManager *)self activityViewController];
          v22 = [v9 activityViewControllerSuggestionFaceRecognitionData:v21];

          long long v23 = share_sheet_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v22 length];
            *(_DWORD *)buf = 134217984;
            uint64_t v63 = v24;
            _os_log_impl(&dword_1A0AD8000, v23, OS_LOG_TYPE_DEFAULT, "enrich suggestions with face recognition data:%lu", buf, 0xCu);
          }

          v47 = v22;
        }
        if (objc_opt_respondsToSelector())
        {
          long long v25 = [(SHSheetActivityItemsManager *)self activityViewController];
          long long v26 = [v9 activityViewControllerSuggestionAssetLocalIdentifier:v25];

          if (v26)
          {
            [v44 addObject:v26];
            v27 = share_sheet_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v63 = (uint64_t)v26;
              _os_log_impl(&dword_1A0AD8000, v27, OS_LOG_TYPE_DEFAULT, "enrich suggestions with assetIdentifier:%@", buf, 0xCu);
            }
          }
        }
        if (![v49 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v28 = [(SHSheetActivityItemsManager *)self activityViewController];
          v29 = [v9 activityViewControllerShareRecipients:v28];

          if ([v29 count])
          {
            id v30 = v29;

            v31 = share_sheet_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v63 = (uint64_t)v30;
              _os_log_impl(&dword_1A0AD8000, v31, OS_LOG_TYPE_DEFAULT, "provided recipients:%@", buf, 0xCu);
            }

            v49 = v30;
          }
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v48);
  }
  else
  {
    v47 = 0;
    v49 = 0;
  }

  int v32 = IsAppleInternalBuild();
  v33 = share_sheet_log();
  BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (!v34) {
      goto LABEL_51;
    }
    v35 = [(SHSheetActivityItemsManager *)self activityItems];
    SFFilterStringsFromList();
    v37 = v36 = v3;
    v38 = SFFilterStringsFromList();
    *(_DWORD *)buf = 138478083;
    uint64_t v63 = (uint64_t)v37;
    __int16 v64 = 2113;
    v65 = v38;
    v39 = "Resolved placeholder activity item types:%{private}@ to:%{private}@";
  }
  else
  {
    if (!v34) {
      goto LABEL_51;
    }
    v35 = [(SHSheetActivityItemsManager *)self activityItems];
    SFGenerateTypeList();
    v37 = v36 = v3;
    v38 = SFGenerateTypeList();
    *(_DWORD *)buf = 138543618;
    uint64_t v63 = (uint64_t)v37;
    __int16 v64 = 2114;
    v65 = v38;
    v39 = "Resolved placeholder activity item types:%{public}@ to:%{public}@";
  }
  _os_log_impl(&dword_1A0AD8000, v33, OS_LOG_TYPE_DEFAULT, v39, buf, 0x16u);

  v3 = v36;
  uint64_t v7 = (void *)v52;
LABEL_51:

  v40 = [[SHSheetActivityItemsResult alloc] initWithActivity:0 activityItemValues:v53];
  if ([v3 count]) {
    [(SHSheetActivityItemsResult *)v40 setActivityItemURLValues:v3];
  }
  if ([v7 count])
  {
    v41 = [[UISUISecurityContext alloc] initWithSecurityScopedResources:v7];
    [(SHSheetActivityItemsResult *)v40 setSecurityScopedURLs:v41];
  }
  if ([v44 count]) {
    [(SHSheetActivityItemsResult *)v40 setSuggestionAssetIdentifiers:v44];
  }
  [(SHSheetActivityItemsResult *)v40 setSuggestedImageData:v47];
  [(SHSheetActivityItemsResult *)v40 setRecipients:v49];

  return v40;
}

- (id)_resolveActivityItemsForActivity:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v58 = [MEMORY[0x1E4F1CA48] array];
  long long v57 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = WebPrivacyLibraryCore();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = [(SHSheetActivityItemsManager *)self activityItems];
  uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v48)
  {
    v49 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v46 = *(void *)v64;
    *(void *)&long long v6 = 138412290;
    long long v44 = v6;
    id v47 = v4;
    do
    {
      uint64_t v10 = 0;
      id v11 = v8;
      id v12 = v9;
      do
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v10;
        uint64_t v13 = *(void **)(*((void *)&v63 + 1) + 8 * v10);
        *((void *)&v54 + 1) = -[SHSheetActivityItemsManager _requestThumbnailForActivityItem:activity:](self, "_requestThumbnailForActivityItem:activity:", v13, v4, v44);
        *(void *)&long long v54 = [(SHSheetActivityItemsManager *)self _requestAttachmentURLItemDataForActivityItem:v13 activity:v4];
        uint64_t v14 = [(SHSheetActivityItemsManager *)self _requestInitialSocialTextForActivityItem:v13 activity:v4];

        uint64_t v15 = [(SHSheetActivityItemsManager *)self _requestSubjectForActivityItem:v13 activity:v4];

        if (![v7 count])
        {
          uint64_t v16 = [(SHSheetActivityItemsManager *)self _requestRecipientsHandlesForActivityItem:v13 activity:v4];

          uint64_t v7 = (void *)v16;
        }
        uint64_t v52 = (void *)v14;
        v53 = v7;
        uint64_t v51 = (void *)v15;
        if (![v49 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v17 = [(SHSheetActivityItemsManager *)self activityViewController];
          objc_super v18 = [v13 activityViewControllerShareRecipients:v17];

          if ([v18 count])
          {
            id v19 = v18;

            v20 = share_sheet_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v44;
              id v68 = v19;
              _os_log_impl(&dword_1A0AD8000, v20, OS_LOG_TYPE_DEFAULT, "provided recipients:%@", buf, 0xCu);
            }

            v49 = v19;
          }
        }
        id v21 = [(SHSheetActivityItemsManager *)self _requestItemsForActivityItem:v13 activity:v4];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v55 = v21;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v71 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v60 != v24) {
                objc_enumerationMutation(v55);
              }
              long long v26 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v28 = v26;
              v29 = v28;
              if (isKindOfClass)
              {
                if (v5)
                {
                  uint64_t v30 = objc_msgSend(v28, "_wp_urlByRemovingTrackingInformation");

                  v29 = (void *)v30;
                }
                if (v54 == 0)
                {
                  v31 = v29;
                }
                else
                {
                  v31 = objc_alloc_init(UIActivityItemURLRep);
                  [(UIActivityItemURLRep *)v31 setURL:v29];
                  [(UIActivityItemURLRep *)v31 setThumbnail:*((void *)&v54 + 1)];
                  [(UIActivityItemURLRep *)v31 setAttachmentURLType:(void)v54];
                }

                v29 = v31;
              }
              if (v5)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  objc_msgSend(v29, "_wp_removeTrackingInformationFromURLRepresentation");
                }
              }
              int v32 = [(SHSheetActivityItemsManager *)self activityViewController];
              +[_UIActivityItemMapping _addActivityItem:v29 activityViewController:v32 originalActivityItem:v13];

              [(SHSheetActivityItemsManager *)self _configureContentManagedForActivityItem:v13 activityItemValue:v29 outURLs:v57 outScopedURLs:v56];
              [v58 addObject:v29];
            }
            uint64_t v23 = [v55 countByEnumeratingWithState:&v59 objects:v71 count:16];
          }
          while (v23);
        }

        uint64_t v8 = v51;
        uint64_t v10 = v50 + 1;
        id v11 = v51;
        uint64_t v9 = v52;
        uint64_t v7 = v53;
        id v12 = v52;
        id v4 = v47;
      }
      while (v50 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v48);
  }
  else
  {
    v49 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }

  int v33 = IsAppleInternalBuild();
  BOOL v34 = share_sheet_log();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    if (!v35) {
      goto LABEL_42;
    }
    v36 = [(SHSheetActivityItemsManager *)self activityItems];
    v37 = SFFilterStringsFromList();
    SFFilterStringsFromList();
    v39 = v38 = v8;
    *(_DWORD *)buf = 138478083;
    id v68 = v37;
    __int16 v69 = 2113;
    v70 = v39;
    v40 = "Resolved activity item types:%{private}@ to:%{private}@";
  }
  else
  {
    if (!v35) {
      goto LABEL_42;
    }
    v36 = [(SHSheetActivityItemsManager *)self activityItems];
    v37 = SFGenerateTypeList();
    SFGenerateTypeList();
    v39 = v38 = v8;
    *(_DWORD *)buf = 138543618;
    id v68 = v37;
    __int16 v69 = 2114;
    v70 = v39;
    v40 = "Resolved activity item types:%{public}@ to:%{public}@";
  }
  _os_log_impl(&dword_1A0AD8000, v34, OS_LOG_TYPE_DEFAULT, v40, buf, 0x16u);

  uint64_t v8 = v38;
LABEL_42:

  v41 = [[SHSheetActivityItemsResult alloc] initWithActivity:v4 activityItemValues:v58];
  if ([v57 count]) {
    [(SHSheetActivityItemsResult *)v41 setActivityItemURLValues:v57];
  }
  if ([v56 count])
  {
    v42 = [[UISUISecurityContext alloc] initWithSecurityScopedResources:v56];
    [(SHSheetActivityItemsResult *)v41 setSecurityScopedURLs:v42];
  }
  [(SHSheetActivityItemsResult *)v41 setInitialSocialText:v9];
  [(SHSheetActivityItemsResult *)v41 setSubject:v8];
  [(SHSheetActivityItemsResult *)v41 setRecipientsHandles:v7];
  [(SHSheetActivityItemsResult *)v41 setRecipients:v49];

  return v41;
}

- (void)_updateURLRequests
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke;
  v52[3] = &unk_1E5A23A68;
  id v37 = v3;
  id v53 = v37;
  id v36 = v4;
  id v54 = v36;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x1A6229A90](v52);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v6 = [(SHSheetActivityItemsManager *)self activityItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    uint64_t v34 = *MEMORY[0x1E4FB12C8];
    BOOL v35 = v42;
    uint64_t v40 = *(void *)v49;
    v38 = v6;
    v39 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v48 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ((void (**)(void, void *))v5)[2](v5, v11);
          goto LABEL_36;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
          if (v12 && SFIsStringURLSafelyConvertible()) {
            ((void (**)(void, void *))v5)[2](v5, v12);
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = [(SHSheetActivityItemsManager *)self activityViewController];
          uint64_t v14 = [v11 activityViewControllerPlaceholderItems:v13];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v45 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v5[2](v5, v20);
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
            }
            while (v17);
          }

          long long v6 = v38;
          self = v39;
          uint64_t v9 = v40;
        }
        else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          id v21 = [(SHSheetActivityItemsManager *)self activityViewController];
          uint64_t v22 = [v11 activityViewControllerPlaceholderItem:v21];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [(SHSheetActivityItemsManager *)self activityViewController];
            id v24 = [v11 activityViewController:v23 itemForActivityType:@"com.apple.UIKit.activity.CopyToPasteboard"];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v25 = v24;
            }
            else {
              id v25 = v22;
            }
            ((void (**)(void, id))v5)[2](v5, v25);
            goto LABEL_31;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v26 = [(SHSheetActivityItemsManager *)self activityViewController];
            id v24 = [v11 activityViewController:v26 itemForActivityType:@"com.apple.UIKit.activity.CopyToPasteboard"];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              ((void (**)(void, id))v5)[2](v5, v24);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
                if (v27 && SFIsStringURLSafelyConvertible()) {
                  ((void (**)(void, void *))v5)[2](v5, v27);
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v24 = v24;
                  uint64_t v28 = [v24 length];
                  v41[0] = MEMORY[0x1E4F143A8];
                  v41[1] = 3221225472;
                  v42[0] = __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke_2;
                  v42[1] = &unk_1E5A23A90;
                  v43 = v5;
                  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v34, 0, v28, 0, v41);
                }
              }
            }
LABEL_31:
          }
          uint64_t v9 = v40;
        }
LABEL_36:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v29 = [v6 countByEnumeratingWithState:&v48 objects:v56 count:16];
      uint64_t v8 = v29;
    }
    while (v29);
  }

  uint64_t v30 = [(SHSheetActivityItemsManager *)self delegate];
  v31 = [v30 urlRequestsForActivityItemsManager:self];

  if (![v37 count] && objc_msgSend(v31, "count")) {
    [v37 addObjectsFromArray:v31];
  }
  int v32 = objc_msgSend(v37, "copy", v34, v35);
  [(SHSheetActivityItemsManager *)self setUrlRequests:v32];

  int v33 = (void *)[v36 copy];
  [(SHSheetActivityItemsManager *)self setUrlSandboxExtensions:v33];
}

void __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (WebPrivacyLibraryCore())
  {
    uint64_t v3 = objc_msgSend(v7, "_wp_urlByRemovingTrackingInformation");

    id v4 = (id)v3;
  }
  else
  {
    id v4 = v7;
  }
  id v8 = v4;
  uint64_t v5 = [MEMORY[0x1E4F28E88] requestWithURL:v4];
  [v5 _setNonAppInitiated:1];
  [*(id *)(a1 + 32) addObject:v5];
  long long v6 = [v8 issueSandboxExtensionData];
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __49__SHSheetActivityItemsManager__updateURLRequests__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      *a5 = 1;
    }
  }
}

- (void)_updateLinkMetadataValues
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(SHSheetActivityItemsManager *)self activityItems];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __56__SHSheetActivityItemsManager__updateLinkMetadataValues__block_invoke;
  uint64_t v14 = &unk_1E5A23AB8;
  id v15 = self;
  id v6 = v4;
  id v16 = v6;
  id v7 = v3;
  id v17 = v7;
  uint64_t v18 = &v19;
  [v5 enumerateObjectsUsingBlock:&v11];

  if (*((unsigned char *)v20 + 24)
    || ([(SHSheetActivityItemsManager *)self urlRequests],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    objc_msgSend(v6, "removeObjectsAtIndexes:", v7, v11, v12, v13, v14, v15);
  }
  uint64_t v10 = (void *)[v6 copy];
  [(SHSheetActivityItemsManager *)self setLinkMetadataValues:v10];

  _Block_object_dispose(&v19, 8);
}

void __56__SHSheetActivityItemsManager__updateLinkMetadataValues__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) activityViewController];
  id v4 = +[_UIActivityItemMapping _loadMetadataForActivityItem:v5 activityViewController:v3];

  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

- (void)_loadGroupActivityMetadataIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  urlRequests = self->_urlRequests;
  if (urlRequests)
  {
    if (self->_linkMetadataValues)
    {
      if (![(NSArray *)urlRequests count])
      {
        if (![(NSArray *)self->_linkMetadataValues count]
          || ([(NSArray *)self->_linkMetadataValues objectAtIndexedSubscript:0],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v4 title],
              id v5 = objc_claimAutoreleasedReturnValue(),
              v5,
              v4,
              !v5))
        {
          id v6 = share_sheet_log();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "No metadata or URLs were found for the given activity items. Beginning attempted load of group activity metadata...", buf, 2u);
          }

          id v7 = [(SHSheetActivityItemsManager *)self activityItemValuesForActivity:0];
          id v8 = +[SHSheetActivityItemUtilities itemProvidersFromActivityItems:v7];
          uint64_t v9 = share_sheet_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "Found these item providers from the given activity items: %@", buf, 0xCu);
          }

          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke;
          v10[3] = &unk_1E5A23B08;
          objc_copyWeak(&v11, (id *)buf);
          +[SHSheetActivityItemUtilities loadMetadataFromGroupActivityItemProviders:v8 completion:v10];
          objc_destroyWeak(&v11);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
}

void __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke_98;
    v9[3] = &unk_1E5A23AE0;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    id v10 = v5;
    sh_dispatch_on_main_queue(v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Could not load group activity metadata: %@", buf, 0xCu);
    }
  }
}

void __65__SHSheetActivityItemsManager__loadGroupActivityMetadataIfNeeded__block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didLoadGroupActivityMetadata:*(void *)(a1 + 32)];
}

- (void)_didLoadGroupActivityMetadata:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Successfully loaded group activity metadata: %@", (uint8_t *)&v8, 0xCu);
  }

  linkMetadataValues = self->_linkMetadataValues;
  self->_linkMetadataValues = v4;

  id v7 = [(SHSheetActivityItemsManager *)self delegate];
  [v7 activityItemsManagerLinkMetadataValuesDidChange:self];
}

- (void)loadItemProvidersForRequest:(id)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 maxPreviews];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  uint64_t v12 = [(SHSheetActivityItemsManager *)self activityItemValuesForActivity:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__SHSheetActivityItemsManager_loadItemProvidersForRequest_activity_completion___block_invoke;
  v15[3] = &unk_1E5A23B30;
  id v13 = v8;
  uint64_t v18 = v20;
  uint64_t v19 = v11;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  [v9 _loadItemProvidersFromActivityItems:v12 completion:v15];

  _Block_object_dispose(v20, 8);
}

void __79__SHSheetActivityItemsManager_loadItemProvidersForRequest_activity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v32 = v3;
  id v4 = __ItemsFromUIActivityItems(v3);
  id v5 = [*(id *)(a1 + 32) activityType];
  [*(id *)(a1 + 32) thumbnailSize];
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc_init(UISDActivityItemData);
  int v33 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v35 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v4;
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    uint64_t v34 = a1;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        CFDataRef v12 = *(const __CFData **)(*((void *)&v39 + 1) + 8 * v11);
        id v13 = +[_UIActivityItemMapping _attachmentNameForActivityItem:v12 activityType:v5];
        if (v13) {
          [(UISDActivityItemData *)v10 addAttachmentName:v13 forItem:v12];
        }
        id v14 = +[_UIActivityItemMapping _subjectForActivityItem:v12 activityType:v5];
        if (v14) {
          [(UISDActivityItemData *)v10 addSubject:v14 forItem:v12];
        }
        uint64_t v15 = *(void *)(a1 + 56);
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v17 = *(void *)(v16 + 24);
        if (v15 < 1 || v15 > v17)
        {
          *(void *)(v16 + 24) = v17 + 1;
          uint64_t v18 = +[_UIActivityItemMapping _thumbnailImageDataForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageDataForActivityItem:thumbnailSize:activityType:", v12, v5, v7, v9);
          if (v18) {
            [(UISDActivityItemData *)v10 addPreviewImageData:v18 forItem:v12];
          }
          uint64_t v19 = +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v12, v5, v7, v9);
          if (v19) {
            [(UISDActivityItemData *)v10 addPreviewImage:v19 forItem:v12];
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v12 activityType:v5];
          if (v20
            || (uint64_t v28 = CGImageSourceCreateWithData(v12, 0)) != 0
            && (uint64_t v29 = v28,
                CGImageSourceGetType(v28),
                uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                CFRelease(v29),
                v20))
          {
            [(UISDActivityItemData *)v10 addDataType:v20 forItem:v12];
          }
        }
        if ([v5 isEqualToString:@"com.apple.UIKit.activity.AirDrop"])
        {
          CFDataRef v21 = +[SHSheetActivityItemUtilities urlForActivityItem:v12];
          if (v21)
          {
            char v22 = +[UIAirDropExtensionItemDataSource _airdropSupplementalSecurityContextForURL:v21];
            [v35 addObject:v22];
LABEL_31:
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_33;
          }
          CFDataRef v21 = v12;
          if ([(__CFData *)v21 isFileURL])
          {
            CFDataRef v21 = v21;
            uint64_t v23 = +[UISUISecurityScopedResource scopedResourceWithFileURL:v21 allowedAccess:2];
            if (v23
              || (+[UISUISecurityScopedResource scopedResourceWithFileURL:v21 allowedAccess:1], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              id v24 = [(__CFData *)v21 ui_bookmarkForExportWithError:0];
              [v23 setBookmarkExportDataEncodedAsString:v24];

              id v25 = [UISUISecurityContext alloc];
              *(void *)buf = v23;
              long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
              char v22 = [(UISUISecurityContext *)v25 initWithSecurityScopedResources:v26];
            }
            else
            {
              uint64_t v23 = share_sheet_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v21;
                _os_log_impl(&dword_1A0AD8000, v23, OS_LOG_TYPE_DEFAULT, "Security Scope can't be resolved for URL:%@", buf, 0xCu);
              }
              char v22 = 0;
            }

            [v35 addObject:v22];
            v27 = +[_UIActivityItemMapping _openURLAnnotationForActivityItem:v21 activityType:v5];
            if (v27) {
              [v33 setObject:v27 forKeyedSubscript:v21];
            }

            a1 = v34;
            goto LABEL_31;
          }
        }

LABEL_33:
        ++v11;
      }
      while (v38 != v11);
      uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v38 = v30;
    }
    while (v30);
  }

  v31 = (void *)[v35 copy];
  [(UISDActivityItemData *)v10 setSecurityContexts:v31];

  [(UISDActivityItemData *)v10 setOpenURLAnnotationsByURL:v33];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_requestThumbnailForActivityItem:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if [v7 _wantsThumbnailItemData] && (objc_opt_respondsToSelector())
  {
    double v8 = [(SHSheetActivityItemsManager *)self activityViewController];
    double v9 = [v7 activityType];
    id v10 = [v6 activityViewController:v8 thumbnailForActivityType:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (int64_t)_requestAttachmentURLItemDataForActivityItem:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if [v7 _wantsAttachmentURLItemData] && (objc_opt_respondsToSelector())
  {
    double v8 = [(SHSheetActivityItemsManager *)self activityViewController];
    double v9 = [v7 activityType];
    int64_t v10 = [v6 activityViewController:v8 attachmentULRTypeForActivityType:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_requestInitialSocialTextForActivityItem:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if [v7 _wantsInitialSocialText] && (objc_opt_respondsToSelector())
  {
    double v8 = [(SHSheetActivityItemsManager *)self activityViewController];
    double v9 = [v7 activityType];
    int64_t v10 = [v6 activityViewController:v8 initialSocialTextForActivityType:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)_requestSubjectForActivityItem:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = [a4 activityType];
  if (![v7 isEqualToString:@"com.apple.UIKit.activity.Mail"])
  {
    double v9 = 0;
    goto LABEL_5;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v7 = [(SHSheetActivityItemsManager *)self activityViewController];
    double v9 = [v6 activityViewControllerSubject:v7];
LABEL_5:

    goto LABEL_7;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

- (id)_requestRecipientsHandlesForActivityItem:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 activityType];
  if ([v8 isEqualToString:@"com.apple.UIKit.activity.Message"])
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9) {
      goto LABEL_3;
    }
LABEL_6:
    int64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [v7 activityType];
  if (([v11 isEqualToString:@"com.apple.UIKit.activity.Mail"] & 1) == 0)
  {

    int64_t v10 = 0;
    goto LABEL_8;
  }
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  char v8 = [(SHSheetActivityItemsManager *)self activityViewController];
  int64_t v10 = [v6 activityViewControllerRecipients:v8];
LABEL_8:

LABEL_9:
  return v10;
}

- (id)_requestItemsForActivityItem:(id)a3 activity:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F1CA48] array];
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(SHSheetActivityItemsManager *)self _supportsWebpagesForActivity:v7];
    int64_t v10 = [(SHSheetActivityItemsManager *)self activityViewController];
    uint64_t v11 = [v7 activityType];
    uint64_t v12 = [v6 activityViewController:v10 itemsForActivityType:v11 supportsWebpages:v9];

    char v8 = (void *)v12;
  }
  else if (objc_opt_respondsToSelector())
  {
    id v13 = [(SHSheetActivityItemsManager *)self activityViewController];
    id v14 = [v7 activityType];
    uint64_t v15 = [v6 activityViewController:v13 itemsForActivityType:v14];

    char v8 = (void *)v15;
  }
  else
  {
    id v16 = v6;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [(SHSheetActivityItemsManager *)self activityViewController];
      uint64_t v18 = [v7 activityType];
      uint64_t v19 = [v16 activityViewController:v17 itemForActivityType:v18];

      if (v19)
      {
        uint64_t v20 = [(SHSheetActivityItemsManager *)self activityViewController];
        +[_UIActivityItemMapping _addActivityItem:v19 activityViewController:v20 originalActivityItem:v16];
      }
      CFDataRef v21 = v16;
    }
    else
    {
      CFDataRef v21 = [(SHSheetActivityItemsManager *)self activityViewController];
      +[_UIActivityItemMapping _addActivityItem:v16 activityViewController:v21 originalActivityItem:0];
      uint64_t v19 = v16;
    }

    if (v19)
    {
      v24[0] = v19;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

      char v8 = (void *)v22;
    }
  }
  return v8;
}

- (BOOL)_supportsWebpagesForActivity:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:0 typeIdentifier:0];
    [v4 registerItemForTypeIdentifier:@"public.url" loadHandler:&__block_literal_global_52];
    [v4 registerItemForTypeIdentifier:@"com.apple.active-webpage" loadHandler:&__block_literal_global_127];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C80]);
    v19[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v5 setAttachments:v6];

    uint64_t v17 = @"extensionItems";
    id v7 = v3;
    char v8 = [v5 _matchingDictionaryRepresentation];
    id v16 = v8;
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    uint64_t v18 = v9;
    int64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    uint64_t v11 = [v7 applicationExtension];

    uint64_t v12 = [v11 attributes];
    id v13 = [v12 objectForKeyedSubscript:@"NSExtensionActivationRule"];

    char v14 = [MEMORY[0x1E4F28C70] evaluateActivationRule:v13 withExtensionItemsRepresentation:v10];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

void __60__SHSheetActivityItemsManager__supportsWebpagesForActivity___block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  NSTemporaryDirectory();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v3 fileURLWithPath:v6];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);
}

void __60__SHSheetActivityItemsManager__supportsWebpagesForActivity___block_invoke_2(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  NSTemporaryDirectory();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v3 fileURLWithPath:v6];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);
}

- (void)enumerateBackgroundOperationsForActivity:(id)a3 enumerator:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id, unsigned char *))a4;
  char v8 = [(SHSheetActivityItemsManager *)self collaborationDelegate];
  uint64_t v9 = [v8 activityItemsManagerIsCollaborative:self];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int64_t v10 = [(SHSheetActivityItemsManager *)self activityItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    uint64_t v29 = v10;
    uint64_t v28 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      uint64_t v30 = v12;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (id v16 = v15) != 0)
        {
          if (v9) {
            goto LABEL_9;
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if (v9)
            {
LABEL_17:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v15, "ui_isUnfulfilledPromiseURL")) {
                goto LABEL_26;
              }
              uint64_t v18 = [(SHSheetActivityItemsManager *)self collaborationDelegate];
              char v19 = [v18 activityItemsManager:self collaborationSupportsPromiseURLsForActivity:v6];

              if (v19) {
                goto LABEL_20;
              }
            }
            else
            {
LABEL_21:
              if ((objc_msgSend(v6, "_activitySupportsPromiseURLs", v28) & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
LABEL_26:
                id v16 = 0;
                goto LABEL_27;
              }
              if (!objc_msgSend(v15, "ui_isUnfulfilledPromiseURL"))
              {
LABEL_20:
                id v16 = 0;
                uint64_t v12 = v30;
                goto LABEL_27;
              }
            }
            uint64_t v20 = [(SHSheetActivityItemsManager *)self activityViewController];
            CFDataRef v21 = [v20 viewIfLoaded];
            [v21 window];
            uint64_t v22 = v9;
            uint64_t v23 = self;
            id v24 = v7;
            v26 = id v25 = v6;
            v27 = [v26 windowScene];

            id v6 = v25;
            id v7 = v24;
            self = v23;
            uint64_t v9 = v22;
            uint64_t v13 = v28;

            objc_msgSend(v15, "ui_downloadOperationForActivity:inScene:", v6, v27);
            id v16 = (id)objc_claimAutoreleasedReturnValue();

            int64_t v10 = v29;
            uint64_t v12 = v30;
            if (!v16) {
              goto LABEL_27;
            }
            goto LABEL_14;
          }
          uint64_t v17 = [(SHSheetActivityItemsManager *)self activityViewController];
          id v16 = [v15 activityViewControllerOperation:v17];

          uint64_t v12 = v30;
          if (v9)
          {
LABEL_9:
            if (!v16) {
              goto LABEL_17;
            }
            goto LABEL_14;
          }
        }
        if (!v16) {
          goto LABEL_21;
        }
LABEL_14:
        char v31 = 0;
        v7[2](v7, v15, v16, &v31);
        if (v31)
        {

          goto LABEL_29;
        }
LABEL_27:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }
LABEL_29:
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (UIActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (UIActivityViewController *)WeakRetained;
}

- (SHSheetActivityItemsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetActivityItemsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetActivityItemsManagerCollaborationDelegate)collaborationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationDelegate);
  return (SHSheetActivityItemsManagerCollaborationDelegate *)WeakRetained;
}

- (void)setCollaborationDelegate:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setLinkMetadataValues:(id)a3
{
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (void)setUrlRequests:(id)a3
{
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (void)setUrlSandboxExtensions:(id)a3
{
}

- (SHSheetActivityItemsResult)cacheResult
{
  return self->_cacheResult;
}

- (void)setCacheResult:(id)a3
{
}

- (BOOL)linkMetadataValuesNeedsUpdate
{
  return self->_linkMetadataValuesNeedsUpdate;
}

- (void)setLinkMetadataValuesNeedsUpdate:(BOOL)a3
{
  self->_linkMetadataValuesNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheResult, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_linkMetadataValues, 0);
  objc_destroyWeak((id *)&self->_collaborationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end
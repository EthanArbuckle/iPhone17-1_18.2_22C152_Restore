@interface SFCollaborationItemsProvider
- (BOOL)isURLProviderSupported;
- (BOOL)multipleCollaborationItems;
- (BOOL)supportsCollaboration;
- (BOOL)supportsMultipleCollaboration;
- (BOOL)supportsSendCopy;
- (NSArray)activityItems;
- (NSArray)collaborationItems;
- (NSArray)placeholderActivityItems;
- (NSURL)managedFileURL;
- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4;
- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4 managedFileURL:(id)a5 isURLProviderSupported:(BOOL)a6;
- (SFCollaborationItemsProviderDelegate)delegate;
- (_SFCollaborationItemsRequest)currentRequest;
- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4;
- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4 isCollaborative:(BOOL)a5;
- (id)collaborationItemForActivityItem:(id)a3;
- (id)collaborationItemsRequest:(id)a3 resolveActivityItem:(id)a4;
- (id)collaborationServiceForItemsRequest:(id)a3;
- (void)_didCompleteCollaborationItems:(id)a3;
- (void)_updateCollaborationItems;
- (void)setActivityItems:(id)a3;
- (void)setCollaborationItems:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)supportsCollaboration;
@end

@implementation SFCollaborationItemsProvider

- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4 managedFileURL:(id)a5 isURLProviderSupported:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCollaborationItemsProvider;
  v13 = [(SFCollaborationItemsProvider *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_supportsMultipleCollaboration = 0;
    objc_storeStrong((id *)&v13->_managedFileURL, a5);
    v14->_isURLProviderSupported = a6;
    uint64_t v15 = [v10 copy];
    activityItems = v14->_activityItems;
    v14->_activityItems = (NSArray *)v15;

    objc_storeWeak((id *)&v14->_delegate, v11);
    [(SFCollaborationItemsProvider *)v14 _updateCollaborationItems];
  }

  return v14;
}

- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4
{
  return [(SFCollaborationItemsProvider *)self initWithActivityItems:a3 delegate:a4 managedFileURL:0 isURLProviderSupported:0];
}

- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4
{
  return [(SFCollaborationItemsProvider *)self activityItemsForActivity:a3 collaborationResult:a4 isCollaborative:1];
}

- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4 isCollaborative:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 activityType];
    *(_DWORD *)buf = 138412290;
    v58 = v10;
    _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Updating activity items including collaboration items for activityType:%@", buf, 0xCu);
  }
  id v11 = [(SFCollaborationItemsProvider *)self activityItems];
  if (!v5)
  {
    uint64_t v15 = [(SFCollaborationItemsProvider *)self collaborationItems];
    v16 = [v15 firstObject];
    v17 = [v16 sendCopyItems];

    id v11 = v16;
    goto LABEL_38;
  }
  v46 = [MEMORY[0x1E4F1CA48] array];
  if (!v8)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v14 = [(SFCollaborationItemsProvider *)self activityItems];
    uint64_t v18 = [v14 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (!v18) {
      goto LABEL_37;
    }
    uint64_t v19 = v18;
    v44 = v11;
    id v45 = 0;
    uint64_t v20 = *(void *)v53;
    v21 = v46;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v14);
        }
        v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v24 = -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v23, v44, v45);
        v25 = v24;
        if (v24)
        {
          v26 = [v24 placeholderActivityItem];
          if (v26)
          {
            v27 = share_sheet_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              v58 = v23;
              __int16 v59 = 2113;
              v60 = v26;
              _os_log_impl(&dword_1A5389000, v27, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with placeholder:%{private}@", buf, 0x16u);
            }

            v21 = v46;
            v28 = v46;
            v29 = v26;
          }
          else
          {
            v28 = v21;
            v29 = v23;
          }
          [v28 addObject:v29];
        }
      }
      uint64_t v19 = [v14 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v19);
LABEL_36:
    id v11 = v44;
    id v8 = v45;
    goto LABEL_37;
  }
  id v12 = [v8 activityType];
  BOOL v13 = +[SFCollaborationUtilities isHeroCollaborationActivityType:v12];

  if (!v13)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v14 = [(SFCollaborationItemsProvider *)self activityItems];
    uint64_t v30 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (!v30) {
      goto LABEL_37;
    }
    uint64_t v31 = v30;
    v44 = v11;
    id v45 = v8;
    uint64_t v32 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v49 != v32) {
          objc_enumerationMutation(v14);
        }
        v34 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v35 = -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v34, v44, v45);
        v36 = v35;
        if (v35)
        {
          v37 = [v35 identifier];
          v38 = [v47 collaborationItemIdentifier];
          int v39 = [v37 isEqual:v38];

          if (v39)
          {
            v40 = share_sheet_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v47 sharingURL];
              *(_DWORD *)buf = 138478083;
              v58 = v34;
              __int16 v59 = 2112;
              v60 = v41;
              _os_log_impl(&dword_1A5389000, v40, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with sharingURL:%@", buf, 0x16u);
            }
            v42 = [v47 sharingURL];
            [v46 addObject:v42];
          }
          else
          {
            [v46 addObject:v34];
          }
        }
      }
      uint64_t v31 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v31);
    goto LABEL_36;
  }
  [MEMORY[0x1E4F1CA48] array];
  v46 = v14 = v46;
LABEL_37:

  uint64_t v15 = v46;
  v17 = (void *)[v46 copy];
LABEL_38:

  return v17;
}

- (id)collaborationItemForActivityItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(SFCollaborationItemsProvider *)self collaborationItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 activityItem];
        id v11 = v4;
        id v12 = v11;
        if (v10 == v11)
        {

LABEL_15:
          id v6 = v9;
          goto LABEL_16;
        }
        if ((v4 != 0) != (v10 == 0))
        {
          int v13 = [v10 isEqual:v11];

          if (v13) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v6;
}

- (NSArray)placeholderActivityItems
{
  v3 = [(SFCollaborationItemsProvider *)self activityItems];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(SFCollaborationItemsProvider *)self activityItems];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __56__SFCollaborationItemsProvider_placeholderActivityItems__block_invoke;
  id v12 = &unk_1E5BC06D8;
  int v13 = self;
  id v14 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:&v9];

  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return (NSArray *)v7;
}

void __56__SFCollaborationItemsProvider_placeholderActivityItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) collaborationItemForActivityItem:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 placeholderActivityItem];
    if (v8)
    {
      uint64_t v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138478083;
        id v11 = v5;
        __int16 v12 = 2113;
        int v13 = v8;
        _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with placeholder:%{private}@", (uint8_t *)&v10, 0x16u);
      }

      [*(id *)(a1 + 40) replaceObjectAtIndex:a3 withObject:v8];
    }
  }
}

- (void)setActivityItems:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_activityItems] & 1) == 0)
  {
    id v4 = (NSArray *)[v6 copy];
    activityItems = self->_activityItems;
    self->_activityItems = v4;

    [(SFCollaborationItemsProvider *)self _updateCollaborationItems];
  }
}

- (void)setCollaborationItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SFCollaborationItemsProvider *)self supportsMultipleCollaboration]
    && (unint64_t)[v4 count] >= 2)
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 type];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v4;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (!v7)
    {
LABEL_18:
      uint64_t v15 = (uint64_t)v4;
LABEL_19:

      id v4 = (id)v15;
      goto LABEL_20;
    }
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "type", (void)v19))
        {
          if (v9 > 0) {
            goto LABEL_18;
          }
          int v9 = 1;
        }
      }
      uint64_t v8 = [v4 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v8);

    if (v6 && v9 == 1)
    {
      __int16 v12 = share_sheet_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [v4 firstObject];
        *(_DWORD *)buf = 138477827;
        id v25 = v13;
        _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring file collaboration objects in favour of non-file collaboration object because collaboration is not supported for multiple items. Assumption is that the file objects are send copy items. Collaboration item: %{private}@", buf, 0xCu);
      }
      uint64_t v14 = [v4 firstObject];
      uint64_t v23 = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];

      id v4 = (id)v14;
      goto LABEL_19;
    }
  }
LABEL_20:
  if ((objc_msgSend(v4, "isEqualToArray:", self->_collaborationItems, (void)v19) & 1) == 0)
  {
    long long v16 = (NSArray *)[v4 copy];
    collaborationItems = self->_collaborationItems;
    self->_collaborationItems = v16;

    long long v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v25 = v4;
      _os_log_impl(&dword_1A5389000, v18, OS_LOG_TYPE_DEFAULT, "Did set collaborationItems:%{private}@", buf, 0xCu);
    }
  }
}

- (BOOL)multipleCollaborationItems
{
  return [(NSArray *)self->_collaborationItems count] > 1;
}

- (BOOL)supportsCollaboration
{
  v3 = [(SFCollaborationItemsProvider *)self collaborationItems];
  id v4 = [v3 firstObject];

  if (v4) {
    LODWORD(v5) = ![(SFCollaborationItemsProvider *)self multipleCollaborationItems];
  }
  else {
    LOBYTE(v5) = 0;
  }
  if (![v4 type])
  {
    id v6 = v4;
    if ([v6 defaultCollaboration] & 1) != 0 || (objc_msgSend(v6, "isiCloudDrive"))
    {
      if ([v6 isInSharedFolder])
      {
        id v5 = share_sheet_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[SFCollaborationItemsProvider supportsCollaboration]();
        }
      }
      else if ([v6 isThirdPartyFileProviderBacked])
      {
        id v5 = share_sheet_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[SFCollaborationItemsProvider supportsCollaboration]();
        }
      }
      else
      {
        if ([v6 isLocalStorage] & 1) != 0 || (objc_msgSend(v6, "isiCloudDrive")) {
          goto LABEL_16;
        }
        id v5 = share_sheet_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[SFCollaborationItemsProvider supportsCollaboration]();
        }
      }
    }
    else
    {
      id v5 = share_sheet_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[SFCollaborationItemsProvider supportsCollaboration].cold.4();
      }
    }

    LOBYTE(v5) = 0;
LABEL_16:
  }
  return (char)v5;
}

- (BOOL)supportsSendCopy
{
  v2 = [(SFCollaborationItemsProvider *)self collaborationItems];
  v3 = [v2 firstObject];

  id v4 = [v3 sendCopyItems];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)_updateCollaborationItems
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = [(SFCollaborationItemsProvider *)self currentRequest];

  if (v3)
  {
    id v4 = [(SFCollaborationItemsProvider *)self currentRequest];
    [v4 cancel];

    [(SFCollaborationItemsProvider *)self setCurrentRequest:0];
  }
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SFCollaborationItemsProvider *)self activityItems];
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "update collaboration items for activityItems:%{private}@", buf, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [(SFCollaborationItemsProvider *)self activityItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v10 = 138478083;
    long long v20 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v13, v20);
        if (v14)
        {
          uint64_t v15 = share_sheet_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            *(void *)&uint8_t buf[4] = v14;
            __int16 v30 = 2113;
            uint64_t v31 = v13;
            _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "did found cached collaboration item:%{private}@ for activityItem:%{private}@", buf, 0x16u);
          }

          [v7 addObject:v14];
        }
        else
        {
          [v21 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v9);
  }

  if ([v21 count])
  {
    long long v16 = share_sheet_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_1A5389000, v16, OS_LOG_TYPE_DEFAULT, "request collaboration items for activity items:%{private}@", buf, 0xCu);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    long long v17 = [_SFCollaborationItemsRequest alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke;
    v22[3] = &unk_1E5BC1230;
    id v23 = v7;
    objc_copyWeak(&v24, (id *)buf);
    long long v18 = [(_SFCollaborationItemsRequest *)v17 initWithActivityItems:v21 completionHandler:v22];
    [(_SFCollaborationItemsRequest *)v18 setDelegate:self];
    [(_SFCollaborationItemsRequest *)v18 setSupportsMultipleCollaboration:[(SFCollaborationItemsProvider *)self supportsMultipleCollaboration]];
    long long v19 = [(SFCollaborationItemsProvider *)self managedFileURL];
    [(_SFCollaborationItemsRequest *)v18 setManagedFileURL:v19];

    [(_SFCollaborationItemsRequest *)v18 setIsURLProviderSupported:[(SFCollaborationItemsProvider *)self isURLProviderSupported]];
    [(SFCollaborationItemsProvider *)self setCurrentRequest:v18];
    [(_SFCollaborationItemsRequest *)v18 perform];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(SFCollaborationItemsProvider *)self setCollaborationItems:v7];
  }
}

void __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke_2;
  v8[3] = &unk_1E5BC1208;
  id v9 = *(id *)(a1 + 32);
  id v7 = v5;
  id v10 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  sf_dispatch_on_main_queue(v8);
  objc_destroyWeak(&v11);
}

void __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didCompleteCollaborationItems:v3];
}

- (void)_didCompleteCollaborationItems:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "did found collaboration items:%{private}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(SFCollaborationItemsProvider *)self setCollaborationItems:v4];
  [(SFCollaborationItemsProvider *)self setCurrentRequest:0];
}

- (id)collaborationItemsRequest:(id)a3 resolveActivityItem:(id)a4
{
  id v5 = a4;
  int v6 = [(SFCollaborationItemsProvider *)self delegate];
  id v7 = [v6 collaborationItemsProvider:self resolveActivityItem:v5];

  return v7;
}

- (id)collaborationServiceForItemsRequest:(id)a3
{
  id v4 = [(SFCollaborationItemsProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(SFCollaborationItemsProvider *)self delegate];
    id v7 = [v6 collaborationServiceForItemsProvider:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (SFCollaborationItemsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFCollaborationItemsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (BOOL)isURLProviderSupported
{
  return self->_isURLProviderSupported;
}

- (NSArray)collaborationItems
{
  return self->_collaborationItems;
}

- (_SFCollaborationItemsRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (BOOL)supportsMultipleCollaboration
{
  return self->_supportsMultipleCollaboration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_activityItems, 0);
}

- (void)supportsCollaboration
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1A5389000, v0, v1, "File is not in iCloud Drive and default app does not support collaboration.", v2, v3, v4, v5, v6);
}

@end
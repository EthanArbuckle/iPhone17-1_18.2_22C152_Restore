@interface TUCollaborationHighlightProvider
- (NSMutableDictionary)collaborationIdentifierToBundleIDs;
- (NSMutableDictionary)collaborationIdentifierToPendingCollaborations;
- (SWHighlightCenter)highlightCenter;
- (TUCollaborationHighlightProvider)init;
- (TUCollaborationProviderDelegate)delegate;
- (id)addTemporaryCollaboration:(id)a3;
- (id)ckBundleIDForCollaborationIdentifier:(id)a3;
- (id)collaborationHighlightForIdentifier:(id)a3;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TUCollaborationHighlightProvider

- (TUCollaborationHighlightProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)TUCollaborationHighlightProvider;
  v2 = [(TUCollaborationHighlightProvider *)&v12 init];
  if (v2)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v3 = (void *)getSWHighlightCenterClass_softClass;
    uint64_t v17 = getSWHighlightCenterClass_softClass;
    if (!getSWHighlightCenterClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getSWHighlightCenterClass_block_invoke;
      v13[3] = &unk_1E58E5F90;
      v13[4] = &v14;
      __getSWHighlightCenterClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = v3;
    _Block_object_dispose(&v14, 8);
    v5 = (SWHighlightCenter *)objc_alloc_init(v4);
    highlightCenter = v2->_highlightCenter;
    v2->_highlightCenter = v5;

    [(SWHighlightCenter *)v2->_highlightCenter setDelegate:v2];
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    collaborationIdentifierToPendingCollaborations = v2->_collaborationIdentifierToPendingCollaborations;
    v2->_collaborationIdentifierToPendingCollaborations = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    collaborationIdentifierToBundleIDs = v2->_collaborationIdentifierToBundleIDs;
    v2->_collaborationIdentifierToBundleIDs = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (id)collaborationHighlightForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToPendingCollaborations];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = [(TUCollaborationHighlightProvider *)self highlightCenter];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(TUCollaborationHighlightProvider *)self highlightCenter];
      v6 = [v9 collaborationHighlightForIdentifier:v4 error:0];

      if (v6)
      {
        v10 = [(TUCollaborationHighlightProvider *)self highlightCenter];
        v11 = [v10 fetchAttributionsForHighlight:v6];

        getSWCollaborationHighlightClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;

          v6 = v12;
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)ckBundleIDForCollaborationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToBundleIDs];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = [(TUCollaborationHighlightProvider *)self collaborationHighlightForIdentifier:v4];
    char v8 = [v7 attributions];
    uint64_t v9 = [v8 firstObject];
    v10 = [v9 collaborationMetadata];
    v6 = [v10 ckAppBundleIDs];
  }

  return v6;
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 highlights];
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "collaborationsDidChange highlights: %@", buf, 0xCu);
  }
  v21 = v4;

  uint64_t v7 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToPendingCollaborations];
  char v8 = (void *)[v7 copy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [(TUCollaborationHighlightProvider *)self highlightCenter];
        uint64_t v16 = [v15 collaborationHighlightForIdentifier:v14 error:0];

        if (v16)
        {
          uint64_t v17 = TUDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v14;
            _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Collaboration populated for: %@", buf, 0xCu);
          }

          v18 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToPendingCollaborations];
          [v18 removeObjectForKey:v14];

          v19 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToBundleIDs];
          [v19 removeObjectForKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v20 = [(TUCollaborationHighlightProvider *)self delegate];
  [v20 collaborationsDidChange:self];
}

- (id)addTemporaryCollaboration:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"ci"];
  v6 = [(TUCollaborationHighlightProvider *)self collaborationHighlightForIdentifier:v5];
  uint64_t v7 = TUDefaultLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Not adding temporary collaboration, already populated", (uint8_t *)&v19, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v8)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Adding temporary collaboration", (uint8_t *)&v19, 2u);
  }

  v6 = (void *)[objc_alloc((Class)getSWCollaborationHighlightClass()) initWithDictionary:v4];
  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    v20 = v6;
    __int16 v21 = 2112;
    long long v22 = v5;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Collaboration highlight: %@  collaboration Identifier: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v5 && v6)
  {
    uint64_t v10 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToPendingCollaborations];
    [v10 setObject:v6 forKeyedSubscript:v5];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"ckAppBundleIDs"];

    if (v11)
    {
      uint64_t v12 = TUDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v4 objectForKeyedSubscript:@"ckAppBundleIDs"];
        int v19 = 138412290;
        v20 = v13;
        _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration bundleIDS: %@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v14 = [v4 objectForKeyedSubscript:@"ckAppBundleIDs"];
      v15 = (void *)[v14 copy];
      uint64_t v16 = [(TUCollaborationHighlightProvider *)self collaborationIdentifierToBundleIDs];
      [v16 setObject:v15 forKeyedSubscript:v5];
    }
    uint64_t v7 = [(TUCollaborationHighlightProvider *)self delegate];
    [v7 collaborationsDidChange:self];
    goto LABEL_15;
  }
LABEL_16:
  id v17 = v6;

  return v17;
}

- (TUCollaborationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (TUCollaborationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (NSMutableDictionary)collaborationIdentifierToPendingCollaborations
{
  return self->_collaborationIdentifierToPendingCollaborations;
}

- (NSMutableDictionary)collaborationIdentifierToBundleIDs
{
  return self->_collaborationIdentifierToBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationIdentifierToBundleIDs, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifierToPendingCollaborations, 0);
  objc_storeStrong((id *)&self->_highlightCenter, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end
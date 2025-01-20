@interface HighlightManager
- (void)_handleRemovalOfHighlights:(id)a3;
- (void)loadLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4;
- (void)setPresenter:(id)a3 forHighlightIdentifier:(id)a4;
@end

@implementation HighlightManager

- (void)loadLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SafariSandboxBrokerConnection);
  [(WBSUISafariSandboxBrokerConnection *)v7 getLinkMetadataForMessageWithGUID:v6 completionHandler:v5];
}

- (void)setPresenter:(id)a3 forHighlightIdentifier:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  highlightToPresentersMap = self->_highlightToPresentersMap;
  if (!highlightToPresentersMap)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = self->_highlightToPresentersMap;
    self->_highlightToPresentersMap = v8;

    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    highlightToBackForwardListItemsMap = self->_highlightToBackForwardListItemsMap;
    self->_highlightToBackForwardListItemsMap = v10;

    highlightToPresentersMap = self->_highlightToPresentersMap;
  }
  v12 = [(NSMutableDictionary *)highlightToPresentersMap objectForKeyedSubscript:v6];

  if (!v12)
  {
    v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_highlightToPresentersMap setObject:v13 forKeyedSubscript:v6];

    v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_highlightToBackForwardListItemsMap setObject:v14 forKeyedSubscript:v6];
  }
  v15 = [(NSMutableDictionary *)self->_highlightToPresentersMap objectForKeyedSubscript:v6];
  [v15 addObject:v18];

  v16 = [(NSMutableDictionary *)self->_highlightToBackForwardListItemsMap objectForKeyedSubscript:v6];
  v17 = [v18 currentBackForwardListItem];
  [v16 addObject:v17];
}

- (void)_handleRemovalOfHighlights:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v8 = [(NSMutableDictionary *)self->_highlightToPresentersMap objectForKeyedSubscript:v7];
        v9 = [v8 allObjects];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v27 + 1) + 8 * v13++) hideBannerForHighlightIdentifier:v7];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v11);
        }

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v14 = [(NSMutableDictionary *)self->_highlightToBackForwardListItemsMap objectForKeyedSubscript:v7];
        v15 = [v14 allObjects];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v19++), "safari_setHighlight:", 0);
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v17);
        }

        [(NSMutableDictionary *)self->_highlightToPresentersMap setObject:0 forKeyedSubscript:v7];
        [(NSMutableDictionary *)self->_highlightToBackForwardListItemsMap setObject:0 forKeyedSubscript:v7];
        v20 = [MEMORY[0x1E4F782B0] sharedTracker];
        [v20 unblockBannerForHighlight:v7];

        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightToBackForwardListItemsMap, 0);
  objc_storeStrong((id *)&self->_highlightToPresentersMap, 0);
}

@end
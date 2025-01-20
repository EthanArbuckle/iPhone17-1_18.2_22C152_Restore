@interface WBSProfileStartPageManagerStorage
- (NSArray)startPageSectionDescriptors;
- (NSString)profileIdentifier;
- (WBSProfileStartPageManagerStorage)initWithProfileIdentifier:(id)a3 tabGroupManager:(id)a4;
- (WBTabGroupManager)tabGroupManager;
- (id)startPageSectionsDataRepresentation;
- (void)dealloc;
- (void)setStartPageSectionDescriptors:(id)a3;
- (void)startPageSectionDescriptors;
- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5;
@end

@implementation WBSProfileStartPageManagerStorage

- (void)dealloc
{
  [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WBSProfileStartPageManagerStorage;
  [(WBSProfileStartPageManagerStorage *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
}

- (WBSProfileStartPageManagerStorage)initWithProfileIdentifier:(id)a3 tabGroupManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSProfileStartPageManagerStorage;
  v9 = [(WBSProfileStartPageManagerStorage *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profileIdentifier, a3);
    objc_storeStrong((id *)&v10->_tabGroupManager, a4);
    [v8 addTabGroupObserver:v10];
    v11 = v10;
  }

  return v10;
}

- (id)startPageSectionsDataRepresentation
{
  v2 = [(WBTabGroupManager *)self->_tabGroupManager profileWithIdentifier:self->_profileIdentifier];
  objc_super v3 = [v2 startPageSectionsDataRepresentation];

  return v3;
}

- (NSArray)startPageSectionDescriptors
{
  v2 = [(WBSProfileStartPageManagerStorage *)self startPageSectionsDataRepresentation];
  id v7 = 0;
  objc_super v3 = [MEMORY[0x1E4F983F8] decodeSectionsFromData:v2 expectedFormat:1 allowingFallbackFormats:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(WBSProfileStartPageManagerStorage *)v5 startPageSectionDescriptors];
    }
  }

  return (NSArray *)v3;
}

- (void)setStartPageSectionDescriptors:(id)a3
{
  id v4 = a3;
  v5 = [(WBSProfileStartPageManagerStorage *)self startPageSectionsDataRepresentation];
  id v15 = 0;
  v6 = [MEMORY[0x1E4F983F8] encodeSectionsAsSyncableData:v4 existingSyncableData:v5 error:&v15];

  id v7 = v15;
  if (v7)
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSProfileStartPageManagerStorage setStartPageSectionDescriptors:](v8, v7);
    }
  }
  tabGroupManager = self->_tabGroupManager;
  profileIdentifier = self->_profileIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__WBSProfileStartPageManagerStorage_setStartPageSectionDescriptors___block_invoke;
  v13[3] = &unk_1E5E43FE8;
  id v14 = v6;
  id v11 = v6;
  id v12 = (id)[(WBTabGroupManager *)tabGroupManager updateProfileWithIdentifier:profileIdentifier persist:1 usingBlock:v13 completionHandler:0];
}

uint64_t __68__WBSProfileStartPageManagerStorage_setStartPageSectionDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStartPageSectionsDataRepresentation:*(void *)(a1 + 32)];
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  if ([a4 isEqualToString:self->_profileIdentifier])
  {
    uint64_t v6 = *MEMORY[0x1E4F988A0];
    [(WBSProfileStartPageManagerStorage *)self willChangeValueForKey:*MEMORY[0x1E4F988A0]];
    [(WBSProfileStartPageManagerStorage *)self didChangeValueForKey:v6];
  }
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)startPageSectionDescriptors
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to decode section data: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)setStartPageSectionDescriptors:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to serialize section data: %{public}@", v7, v8, v9, v10, 2u);
}

@end
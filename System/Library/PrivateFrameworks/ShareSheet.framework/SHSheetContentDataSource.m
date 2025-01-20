@interface SHSheetContentDataSource
- (BOOL)containsSectionForIdentifier:(id)a3;
- (NSArray)actionProxies;
- (NSArray)peopleProxies;
- (NSArray)shareProxies;
- (NSDiffableDataSourceSnapshot)diffableSnapshot;
- (SHSheetContentDataSource)initWithState:(id)a3 excludeSectionTypes:(int64_t)a4;
- (SHSheetContentDataSourceState)state;
- (UIAirDropNode)airDropProxy;
- (_UIUserDefaultsActivity)shareUserDefaultsActivity;
- (id)_createDiffableSnapshotFromCurrentState;
- (id)actionProxyForIdentifier:(id)a3;
- (id)activityForIdentifier:(id)a3;
- (id)createChangeRequestFromCurrentState;
- (id)description;
- (id)identifierForActivity:(id)a3;
- (id)peopleProxyForIdentifier:(id)a3;
- (id)shareProxyForIdentifier:(id)a3;
- (int64_t)excludeSectionTypes;
- (unsigned)nearbyCountSlotID;
- (void)_createDiffableSnapshotFromCurrentState;
- (void)logCurrentState;
@end

@implementation SHSheetContentDataSource

- (SHSheetContentDataSource)initWithState:(id)a3 excludeSectionTypes:(int64_t)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SHSheetContentDataSource;
  v8 = [(SHSheetContentDataSource *)&v23 init];
  if (v8)
  {
    v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SHSheetContentDataSource initWithState:excludeSectionTypes:]();
    }

    objc_storeStrong((id *)&v8->_state, a3);
    v8->_excludeSectionTypes = a4;
    uint64_t v10 = [(SHSheetContentDataSource *)v8 _createDiffableSnapshotFromCurrentState];
    diffableSnapshot = v8->_diffableSnapshot;
    v8->_diffableSnapshot = (NSDiffableDataSourceSnapshot *)v10;

    uint64_t v12 = [v7 peopleProxies];
    peopleProxies = v8->_peopleProxies;
    v8->_peopleProxies = (NSArray *)v12;

    uint64_t v14 = [v7 shareProxies];
    shareProxies = v8->_shareProxies;
    v8->_shareProxies = (NSArray *)v14;

    uint64_t v16 = [v7 actionProxies];
    actionProxies = v8->_actionProxies;
    v8->_actionProxies = (NSArray *)v16;

    v8->_nearbyCountSlotID = [v7 nearbyCountSlotID];
    uint64_t v18 = [v7 airDropProxy];
    airDropProxy = v8->_airDropProxy;
    v8->_airDropProxy = (UIAirDropNode *)v18;

    v20 = [[_UIUserDefaultsActivity alloc] initWithUserDefaults:0 activityCategory:1];
    shareUserDefaultsActivity = v8->_shareUserDefaultsActivity;
    v8->_shareUserDefaultsActivity = v20;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SHSheetContentDataSource;
  v4 = [(SHSheetContentDataSource *)&v8 description];
  v5 = SHSheetContentSectionTypeDescription([(SHSheetContentDataSource *)self excludeSectionTypes]);
  v6 = [v3 stringWithFormat:@"<%@ excludeSectionTypes:%@>", v4, v5];

  return v6;
}

- (BOOL)containsSectionForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetContentDataSource *)self diffableSnapshot];
  v6 = [v5 sectionIdentifiers];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)peopleProxyForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetContentDataSource *)self state];
  v6 = [v5 peopleProxyByUUID];
  char v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)shareProxyForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetContentDataSource *)self state];
  v6 = [v5 shareProxyByUUID];
  char v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)actionProxyForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetContentDataSource *)self state];
  v6 = [v5 actionProxyByUUID];
  char v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)activityForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetContentDataSource *)self state];
  v6 = [v5 activitiesByUUID];
  char v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    objc_super v8 = [(SHSheetContentDataSource *)self shareProxyForIdentifier:v4];
    if ([v8 isUserDefaultsActivity])
    {
      char v7 = [(SHSheetContentDataSource *)self shareUserDefaultsActivity];
    }
    else
    {
      char v7 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SHSheetContentDataSource activityForIdentifier:]();
    }

    char v7 = 0;
  }

  return v7;
}

- (id)identifierForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v5 = [(SHSheetContentDataSource *)self state];
  v6 = [v5 activitiesByUUID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__SHSheetContentDataSource_identifierForActivity___block_invoke;
  v10[3] = &unk_1E5A217D0;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__SHSheetContentDataSource_identifierForActivity___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v8 = *(void **)(a1 + 32);
  id v9 = a3;
  uint64_t v10 = [v8 activityType];
  id v11 = [v9 activityType];

  LODWORD(v9) = [v10 isEqual:v11];
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)createChangeRequestFromCurrentState
{
  v2 = [(SHSheetContentDataSource *)self state];
  v3 = +[SHSheetContentDataSourceChangeRequest changeRequestFromState:v2];

  return v3;
}

- (id)_createDiffableSnapshotFromCurrentState
{
  v82[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SHSheetContentDataSource *)self state];
  id v4 = [v3 peopleIdentifiers];

  v5 = [(SHSheetContentDataSource *)self state];
  v61 = [v5 shareIdentifiers];

  v6 = [(SHSheetContentDataSource *)self state];
  v58 = [v6 heroActionIdentifiers];

  id v7 = [(SHSheetContentDataSource *)self state];
  id v8 = [v7 informationalActionIdentifiers];

  id v9 = [(SHSheetContentDataSource *)self state];
  uint64_t v10 = [v9 favoriteActionIdentifiers];

  id v11 = [(SHSheetContentDataSource *)self state];
  id v12 = [v11 systemActionIdentifiers];

  uint64_t v13 = [(SHSheetContentDataSource *)self state];
  uint64_t v14 = [v13 extensionActionIdentifiers];

  uint64_t v15 = [(SHSheetContentDataSource *)self state];
  v62 = [v15 customActionIdentifiersByCustomSectionIdentifier];

  uint64_t v16 = [(SHSheetContentDataSource *)self state];
  v60 = [v16 customSectionIdentifiers];

  v17 = [(SHSheetContentDataSource *)self state];
  v59 = [v17 actionProxies];

  char v18 = [(SHSheetContentDataSource *)self excludeSectionTypes];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  if ((v18 & 1) == 0)
  {
    v82[0] = @"SHSheetContentCustomViewSectionIdentifier";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
    v21 = v20 = v8;
    [v19 appendSectionsWithIdentifiers:v21];

    v22 = +[SHSheetContentDataSourceManager contentCustomViewUniqueIdentifier];
    v81 = v22;
    objc_super v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    [v19 appendItemsWithIdentifiers:v23 intoSectionWithIdentifier:@"SHSheetContentCustomViewSectionIdentifier"];

    id v8 = v20;
  }
  if ((v18 & 2) == 0 && [v4 count])
  {
    v80 = @"SHSheetContentPeopleSectionIdentifier";
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v25 = v24 = v10;
    [v19 appendSectionsWithIdentifiers:v25];

    v26 = [(SHSheetContentDataSource *)self state];
    v27 = [v26 peopleIdentifiers];
    [v19 appendItemsWithIdentifiers:v27 intoSectionWithIdentifier:@"SHSheetContentPeopleSectionIdentifier"];

    uint64_t v10 = v24;
  }
  if ((v18 & 4) == 0 && [v61 count])
  {
    v79 = @"SHSheetContentAppsSectionIdentifier";
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    [v19 appendSectionsWithIdentifiers:v28];

    [v19 appendItemsWithIdentifiers:v61 intoSectionWithIdentifier:@"SHSheetContentAppsSectionIdentifier"];
  }
  if ((v18 & 8) == 0 && [v59 count])
  {
    if ((v18 & 0x10) == 0 && [v58 count])
    {
      v78 = @"SHSheetContentHeroActionsSectionIdentifier";
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      [v19 appendSectionsWithIdentifiers:v29];

      [v19 appendItemsWithIdentifiers:v58 intoSectionWithIdentifier:@"SHSheetContentHeroActionsSectionIdentifier"];
    }
    v56 = v8;
    v57 = v4;
    v55 = v10;
    if ([v8 count])
    {
      v53 = v14;
      v54 = v12;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v30 = v8;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v68 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            v36 = objc_msgSend(v35, "UUIDString", v53, v54);
            v37 = [@"SHSheetContentInformationalActionsSectionIdentifier_" stringByAppendingString:v36];

            v76 = v37;
            v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
            [v19 appendSectionsWithIdentifiers:v38];

            v75 = v35;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
            [v19 appendItemsWithIdentifiers:v39 intoSectionWithIdentifier:v37];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v32);
      }

      id v8 = v56;
      id v4 = v57;
      id v12 = v54;
      uint64_t v10 = v55;
      uint64_t v14 = v53;
    }
    if (objc_msgSend(v10, "count", v53, v54))
    {
      v74 = @"SHSheetContentFavoriteActionsSectionIdentifier";
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      [v19 appendSectionsWithIdentifiers:v40];

      [v19 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:@"SHSheetContentFavoriteActionsSectionIdentifier"];
    }
    if ([v60 count])
    {
      v41 = [v60 array];
      [v19 appendSectionsWithIdentifiers:v41];

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v42 = v60;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v64 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v63 + 1) + 8 * j);
            v48 = [v62 objectForKeyedSubscript:v47];
            [v19 appendItemsWithIdentifiers:v48 intoSectionWithIdentifier:v47];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v63 objects:v73 count:16];
        }
        while (v44);
      }

      uint64_t v10 = v55;
      id v8 = v56;
      id v4 = v57;
    }
    if ([v12 count])
    {
      v72 = @"SHSheetContentSystemActionsSectionIdentifier";
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [v19 appendSectionsWithIdentifiers:v49];

      [v19 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:@"SHSheetContentSystemActionsSectionIdentifier"];
    }
    if ([v14 count])
    {
      v71 = @"SHSheetContentExtensionActionsSectionIdentifier";
      v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      [v19 appendSectionsWithIdentifiers:v50];

      [v19 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"SHSheetContentExtensionActionsSectionIdentifier"];
    }
  }
  v51 = share_sheet_log();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    -[SHSheetContentDataSource _createDiffableSnapshotFromCurrentState]();
  }

  return v19;
}

- (void)logCurrentState
{
  id v2 = [(SHSheetContentDataSource *)self state];
  [v2 logDiagnosticProperties];
}

- (NSDiffableDataSourceSnapshot)diffableSnapshot
{
  return self->_diffableSnapshot;
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (unsigned)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (UIAirDropNode)airDropProxy
{
  return self->_airDropProxy;
}

- (SHSheetContentDataSourceState)state
{
  return self->_state;
}

- (int64_t)excludeSectionTypes
{
  return self->_excludeSectionTypes;
}

- (_UIUserDefaultsActivity)shareUserDefaultsActivity
{
  return self->_shareUserDefaultsActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareUserDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_airDropProxy, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_diffableSnapshot, 0);
}

- (void)initWithState:excludeSectionTypes:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A0AD8000, v0, v1, "Initializing new data source for state:%@", v2, v3, v4, v5, v6);
}

- (void)activityForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A0AD8000, v0, v1, "skipping activity that is not a real UIActivity object:%@", v2, v3, v4, v5, v6);
}

- (void)_createDiffableSnapshotFromCurrentState
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A0AD8000, v0, v1, "Create new diffable data source snapshot:%@", v2, v3, v4, v5, v6);
}

@end
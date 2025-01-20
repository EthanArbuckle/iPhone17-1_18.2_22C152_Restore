@interface SHSheetContentDataSourceManager
+ (id)contentCustomViewUniqueIdentifier;
- (NSArray)applicationActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSMutableSet)suggestLessIdentifiers;
- (SHSheetContentDataSource)dataSource;
- (SHSheetContentDataSourceManager)initWithApplicationActivityTypes:(id)a3 heroActionActivityTypes:(id)a4;
- (SHSheetContentDataSourceManagerDelegate)delegate;
- (SHSheetContentDataSourceState)currentState;
- (id)_uniqueIdentifierForSectionIdentifier:(id)a3;
- (id)_updateCurrentStateWithChangeRequest:(id)a3;
- (void)setApplicationActivityTypes:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSuggestLessIdentifiers:(id)a3;
- (void)suggestLessPeopleProxyForIdentifier:(id)a3;
- (void)updateWithChangeRequest:(id)a3;
@end

@implementation SHSheetContentDataSourceManager

+ (id)contentCustomViewUniqueIdentifier
{
  if (contentCustomViewUniqueIdentifier_onceToken != -1) {
    dispatch_once(&contentCustomViewUniqueIdentifier_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)contentCustomViewUniqueIdentifier_contentCustomViewUniqueIdentifier;
  return v2;
}

uint64_t __68__SHSheetContentDataSourceManager_contentCustomViewUniqueIdentifier__block_invoke()
{
  contentCustomViewUniqueIdentifier_contentCustomViewUniqueIdentifier = [MEMORY[0x1E4F29128] UUID];
  return MEMORY[0x1F41817F8]();
}

- (SHSheetContentDataSourceManager)initWithApplicationActivityTypes:(id)a3 heroActionActivityTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHSheetContentDataSourceManager;
  v8 = [(SHSheetContentDataSourceManager *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    applicationActivityTypes = v8->_applicationActivityTypes;
    v8->_applicationActivityTypes = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    heroActionActivityTypes = v8->_heroActionActivityTypes;
    v8->_heroActionActivityTypes = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    suggestLessIdentifiers = v8->_suggestLessIdentifiers;
    v8->_suggestLessIdentifiers = (NSMutableSet *)v13;
  }
  return v8;
}

- (id)_uniqueIdentifierForSectionIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"CustomSection%@", a3];
}

- (id)_updateCurrentStateWithChangeRequest:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v95 = self;
  v96 = [(SHSheetContentDataSourceManager *)self currentState];
  v83 = objc_alloc_init(SHSheetContentDataSourceState);
  v85 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v91 = [MEMORY[0x1E4F1CA60] dictionary];
  v84 = [MEMORY[0x1E4F1CA48] array];
  v90 = [MEMORY[0x1E4F1CA48] array];
  v74 = [MEMORY[0x1E4F1CA48] array];
  v78 = [MEMORY[0x1E4F1CA48] array];
  v82 = [MEMORY[0x1E4F1CA48] array];
  v80 = [MEMORY[0x1E4F1CA60] dictionary];
  v79 = [MEMORY[0x1E4F1CA70] orderedSet];
  v76 = [MEMORY[0x1E4F1CA48] array];
  v75 = [MEMORY[0x1E4F1CA48] array];
  id v87 = [MEMORY[0x1E4F1CA48] array];
  char v6 = [v4 excludeSectionTypes];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v77 = v4;
  obuint64_t j = [v4 peopleProxies];
  uint64_t v7 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
  v88 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v110 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        if ([v11 isMagicHead]) {
          [(SHSheetContentDataSourceState *)v83 setAirDropProxy:v11];
        }
        v12 = [v11 identifier];
        uint64_t v13 = [(SHSheetContentDataSourceManager *)v95 suggestLessIdentifiers];
        char v14 = [v13 containsObject:v12];

        if ((v14 & 1) == 0)
        {
          v15 = [v96 peopleProxyByUUID];
          objc_super v16 = [v15 objectForKeyedSubscript:v12];

          if ((v6 & 2) != 0 || !v16) {
            goto LABEL_18;
          }
          id v17 = v11;
          id v18 = v16;
          if (v17 == v18)
          {

            v5 = v88;
          }
          else
          {
            v19 = v18;
            if (v17)
            {
              char v20 = [v17 isEqual:v18];

              v5 = v88;
              if (v20) {
                goto LABEL_18;
              }
            }
            else
            {

              v5 = v88;
            }
            [v87 addObject:v12];
          }
LABEL_18:
          [v85 setObject:v11 forKeyedSubscript:v12];
          [v84 addObject:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
    }
    while (v8);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obja = [v77 shareProxies];
  uint64_t v21 = [obja countByEnumeratingWithState:&v105 objects:v115 count:16];
  if (!v21) {
    goto LABEL_37;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v106;
  do
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v106 != v23) {
        objc_enumerationMutation(obja);
      }
      v25 = *(void **)(*((void *)&v105 + 1) + 8 * j);
      v26 = [v25 identifier];
      v27 = [v96 shareProxyByUUID];
      v28 = [v27 objectForKeyedSubscript:v26];

      if ((v6 & 4) == 0 && v28)
      {
        id v29 = v25;
        id v30 = v28;
        if (v29 == v30)
        {

          v5 = v88;
          goto LABEL_35;
        }
        v31 = v30;
        if (!v29)
        {

          v5 = v88;
LABEL_34:
          [v87 addObject:v26];
          goto LABEL_35;
        }
        char v32 = [v29 isEqual:v30];

        v5 = v88;
        if ((v32 & 1) == 0) {
          goto LABEL_34;
        }
      }
LABEL_35:
      [v5 setObject:v25 forKeyedSubscript:v26];
      [v90 addObject:v26];
    }
    uint64_t v22 = [obja countByEnumeratingWithState:&v105 objects:v115 count:16];
  }
  while (v22);
LABEL_37:

  v81 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v33 = v77;
  id v86 = [v77 actionProxies];
  id objb = (id)[v86 countByEnumeratingWithState:&v101 objects:v114 count:16];
  if (!objb) {
    goto LABEL_74;
  }
  uint64_t v89 = *(void *)v102;
  while (2)
  {
    uint64_t v34 = 0;
    while (2)
    {
      if (*(void *)v102 != v89) {
        objc_enumerationMutation(v86);
      }
      v35 = *(void **)(*((void *)&v101 + 1) + 8 * v34);
      v36 = [v35 identifier];
      v37 = [v96 actionProxyByUUID];
      v38 = [v37 objectForKeyedSubscript:v36];

      if ((v6 & 8) == 0 && v38)
      {
        id v39 = v35;
        id v40 = v38;
        if (v39 == v40)
        {
        }
        else
        {
          v41 = v40;
          if (v39)
          {
            char v42 = [v39 isEqual:v40];

            if (v42) {
              goto LABEL_51;
            }
          }
          else
          {
          }
          [v87 addObject:v36];
        }
      }
LABEL_51:
      [v91 setObject:v35 forKeyedSubscript:v36];
      v43 = [v33 activitiesByUUID];
      v44 = [v43 objectForKeyedSubscript:v36];

      if (v44)
      {
        v45 = [(SHSheetContentDataSourceManager *)v95 heroActionActivityTypes];
        v46 = [v44 activityType];
        int v47 = [v45 containsObject:v46];

        if (v47)
        {
          v48 = [v44 activityType];
          [v81 setObject:v36 forKeyedSubscript:v48];
          goto LABEL_67;
        }
      }
      if ([v35 isFavorite])
      {
        v49 = v82;
        goto LABEL_56;
      }
      v50 = [v44 activitySectionIdentifier];

      if (v50)
      {
        v51 = [v44 activitySectionIdentifier];
        v52 = [(SHSheetContentDataSourceManager *)v95 _uniqueIdentifierForSectionIdentifier:v51];

        v53 = [v80 objectForKeyedSubscript:v52];
        if (!v53)
        {
          v53 = [MEMORY[0x1E4F1CA48] array];
          [v80 setObject:v53 forKeyedSubscript:v52];
        }
        [v53 addObject:v36];
        [v79 addObject:v52];
      }
      else
      {
        int v54 = [v44 _isBuiltinDerived];
        int v55 = [v44 _showsInSystemActionGroup];
        if (v44)
        {
          int v56 = v55;
          v57 = [(SHSheetContentDataSourceManager *)v95 applicationActivityTypes];
          v58 = [v44 activityType];
          int v59 = [v57 containsObject:v58] & (v54 ^ 1) | v56;

          v33 = v77;
        }
        else
        {
          int v59 = 0;
        }
        v48 = [v44 _activityFooterText];
        if (v48 || ([v35 activityFooter], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          [v78 addObject:v36];
LABEL_67:
        }
        else
        {
          if (v59) {
            v49 = v76;
          }
          else {
            v49 = v75;
          }
LABEL_56:
          [v49 addObject:v36];
        }
      }

      if (objb != (id)++v34) {
        continue;
      }
      break;
    }
    uint64_t v60 = [v86 countByEnumeratingWithState:&v101 objects:v114 count:16];
    id objb = (id)v60;
    if (v60) {
      continue;
    }
    break;
  }
LABEL_74:

  v61 = v78;
  if ([v81 count])
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v62 = [(SHSheetContentDataSourceManager *)v95 heroActionActivityTypes];
    uint64_t v63 = [v62 countByEnumeratingWithState:&v97 objects:v113 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v98;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v98 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = [v81 objectForKeyedSubscript:*(void *)(*((void *)&v97 + 1) + 8 * k)];
          if (v67) {
            [v74 addObject:v67];
          }
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v97 objects:v113 count:16];
      }
      while (v64);
    }

    v33 = v77;
    v61 = v78;
  }
  v68 = [v33 peopleProxies];
  [(SHSheetContentDataSourceState *)v83 setPeopleProxies:v68];

  v69 = [v33 shareProxies];
  [(SHSheetContentDataSourceState *)v83 setShareProxies:v69];

  v70 = [v33 actionProxies];
  [(SHSheetContentDataSourceState *)v83 setActionProxies:v70];

  v71 = [v33 activitiesByUUID];
  [(SHSheetContentDataSourceState *)v83 setActivitiesByUUID:v71];

  -[SHSheetContentDataSourceState setNearbyCountSlotID:](v83, "setNearbyCountSlotID:", [v33 nearbyCountSlotID]);
  [(SHSheetContentDataSourceState *)v83 setPeopleProxyByUUID:v85];
  [(SHSheetContentDataSourceState *)v83 setShareProxyByUUID:v88];
  [(SHSheetContentDataSourceState *)v83 setActionProxyByUUID:v91];
  [(SHSheetContentDataSourceState *)v83 setPeopleIdentifiers:v84];
  [(SHSheetContentDataSourceState *)v83 setShareIdentifiers:v90];
  [(SHSheetContentDataSourceState *)v83 setHeroActionIdentifiers:v74];
  [(SHSheetContentDataSourceState *)v83 setInformationalActionIdentifiers:v61];
  [(SHSheetContentDataSourceState *)v83 setFavoriteActionIdentifiers:v82];
  [(SHSheetContentDataSourceState *)v83 setCustomActionIdentifiersByCustomSectionIdentifier:v80];
  [(SHSheetContentDataSourceState *)v83 setCustomSectionIdentifiers:v79];
  [(SHSheetContentDataSourceState *)v83 setSystemActionIdentifiers:v76];
  [(SHSheetContentDataSourceState *)v83 setExtensionActionIdentifiers:v75];
  v72 = share_sheet_log();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    [(SHSheetContentDataSourceManager *)v95 _updateCurrentStateWithChangeRequest:v72];
  }

  [(SHSheetContentDataSourceManager *)v95 setCurrentState:v83];
  return v87;
}

- (void)updateWithChangeRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SHSheetContentDataSourceManager updateWithChangeRequest:]();
  }

  uint64_t v6 = [v4 state];
  uint64_t v7 = [(SHSheetContentDataSourceManager *)self currentState];
  uint64_t v8 = [(SHSheetContentDataSourceManager *)self dataSource];
  v31 = (void *)v6;
  if (v6 && (void *)v6 == v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(SHSheetContentDataSourceManager *)self _updateCurrentStateWithChangeRequest:v4];
  }
  v10 = [SHSheetContentDataSource alloc];
  uint64_t v11 = [(SHSheetContentDataSourceManager *)self currentState];
  v12 = -[SHSheetContentDataSource initWithState:excludeSectionTypes:](v10, "initWithState:excludeSectionTypes:", v11, [v4 excludeSectionTypes]);

  uint64_t v13 = [(SHSheetContentDataSource *)v12 diffableSnapshot];
  char v14 = [v8 diffableSnapshot];
  unsigned int v29 = [v13 isEqual:v14] ^ 1;

  v15 = [(SHSheetContentDataSourceManager *)self currentState];
  int v16 = [v15 nearbyCountSlotID];
  int v17 = [v7 nearbyCountSlotID];

  if ([(SHSheetContentDataSource *)v12 containsSectionForIdentifier:@"SHSheetContentPeopleSectionIdentifier"])
  {
    char v18 = [v8 containsSectionForIdentifier:@"SHSheetContentPeopleSectionIdentifier"];
  }
  else
  {
    char v18 = 0;
  }
  BOOL v19 = v16 != v17;
  char v20 = objc_alloc_init(SHSheetContentDataSourceChangeDetails);
  id v30 = (void *)v9;
  [(SHSheetContentDataSourceChangeDetails *)v20 setModifiedIdentifiers:v9];
  [(SHSheetContentDataSourceChangeDetails *)v20 setAirDropBadgeChanged:v19];
  -[SHSheetContentDataSourceChangeDetails setForceReload:](v20, "setForceReload:", [v4 forceReload]);
  -[SHSheetContentDataSourceChangeDetails setAnimateDifferences:](v20, "setAnimateDifferences:", [v4 animated]);
  uint64_t v21 = [(SHSheetContentDataSource *)v12 diffableSnapshot];
  uint64_t v22 = [v21 numberOfSections];
  uint64_t v23 = [v8 diffableSnapshot];
  -[SHSheetContentDataSourceChangeDetails setSectionsChanged:](v20, "setSectionsChanged:", v22 != [v23 numberOfSections]);

  if (v18)
  {
    v24 = [(SHSheetContentDataSource *)v12 diffableSnapshot];
    uint64_t v25 = [v24 numberOfItemsInSection:@"SHSheetContentPeopleSectionIdentifier"];
    v26 = [v8 diffableSnapshot];
    -[SHSheetContentDataSourceChangeDetails setPeopleCountChanged:](v20, "setPeopleCountChanged:", v25 != [v26 numberOfItemsInSection:@"SHSheetContentPeopleSectionIdentifier"]);
  }
  else
  {
    [(SHSheetContentDataSourceChangeDetails *)v20 setPeopleCountChanged:0];
  }
  [(SHSheetContentDataSourceChangeDetails *)v20 setSnapshotChanged:v29];
  v27 = share_sheet_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v12;
    __int16 v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_1A0AD8000, v27, OS_LOG_TYPE_DEFAULT, "publishing new dataSource:%@ for changeDetail:%@", buf, 0x16u);
  }

  [(SHSheetContentDataSourceManager *)self setDataSource:v12];
  v28 = [(SHSheetContentDataSourceManager *)self delegate];
  [v28 dataSourceManager:self didPublishDataSourceWithChangeDetails:v20];
}

- (void)suggestLessPeopleProxyForIdentifier:(id)a3
{
  id v24 = a3;
  id v4 = [(SHSheetContentDataSourceManager *)self suggestLessIdentifiers];
  char v5 = [v4 containsObject:v24];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(SHSheetContentDataSourceManager *)self suggestLessIdentifiers];
    [v6 addObject:v24];

    uint64_t v7 = [(SHSheetContentDataSourceManager *)self dataSource];
    uint64_t v23 = [v7 peopleProxyForIdentifier:v24];

    uint64_t v8 = [(SHSheetContentDataSourceManager *)self dataSource];
    uint64_t v9 = [v8 peopleProxies];
    v10 = (void *)[v9 mutableCopy];

    uint64_t v21 = v10;
    [v10 removeObject:v23];
    uint64_t v22 = [(SHSheetContentDataSourceManager *)self dataSource];
    uint64_t v11 = [v22 shareProxies];
    v12 = [(SHSheetContentDataSourceManager *)self dataSource];
    uint64_t v13 = [v12 actionProxies];
    char v14 = [(SHSheetContentDataSourceManager *)self dataSource];
    uint64_t v15 = [v14 nearbyCountSlotID];
    int v16 = [(SHSheetContentDataSourceManager *)self dataSource];
    int v17 = [v16 state];
    char v18 = [v17 activitiesByUUID];
    BOOL v19 = +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:v10 shareProxies:v11 actionProxies:v13 nearbyCountSlotID:v15 activitiesByUUID:v18];

    char v20 = [(SHSheetContentDataSourceManager *)self dataSource];
    objc_msgSend(v19, "setExcludeSectionTypes:", objc_msgSend(v20, "excludeSectionTypes"));

    [v19 setAnimated:1];
    [(SHSheetContentDataSourceManager *)self updateWithChangeRequest:v19];
  }
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (SHSheetContentDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetContentDataSourceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetContentDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (SHSheetContentDataSourceState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (NSMutableSet)suggestLessIdentifiers
{
  return self->_suggestLessIdentifiers;
}

- (void)setSuggestLessIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
}

- (void)_updateCurrentStateWithChangeRequest:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 currentState];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_DEBUG, "Update existing state:%@ with state:%@", v6, 0x16u);
}

- (void)updateWithChangeRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A0AD8000, v0, v1, "update with change request:%@", v2, v3, v4, v5, v6);
}

@end
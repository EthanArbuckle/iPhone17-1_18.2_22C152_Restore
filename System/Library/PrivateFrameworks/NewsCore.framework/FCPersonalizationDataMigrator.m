@interface FCPersonalizationDataMigrator
- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4;
- (FCPersonalizationDataMigrator)initWithTreatmentProvider:(id)a3;
- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6;
- (id)treatmentProvider;
- (void)upgradeFromVersion2:(id)a3;
@end

@implementation FCPersonalizationDataMigrator

- (FCPersonalizationDataMigrator)initWithTreatmentProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationDataMigrator;
  v5 = [(FCPersonalizationDataMigrator *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id treatmentProvider = v5->_treatmentProvider;
    v5->_id treatmentProvider = v6;
  }
  return v5;
}

- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4
{
  return 1;
}

- (void)upgradeFromVersion2:(id)a3
{
  id v4 = a3;
  v5 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "upgrading personalization data store from v2 to v3", buf, 2u);
  }
  v6 = [v4 remoteRecord];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"data"];

    if (!v8)
    {
      objc_super v9 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "ignoring locally-cached PersonalizationProfile record since it lost its data when decoding", v16, 2u);
      }

      v7 = 0;
    }
  }
  v10 = [(FCPersonalizationDataMigrator *)self treatmentProvider];
  v11 = v10[2]();

  v12 = +[FCModifyPersonalizationOperation personalizationProfileFromRecord:v7];
  v13 = [v4 closedChangeGroups];
  +[FCModifyPersonalizationOperation applyChangeGroups:v13 toProfile:v12 treatment:v11 prune:0];

  v14 = [v4 openChangeGroupDeltas];
  +[FCModifyPersonalizationOperation applyDeltas:v14 toProfile:v12 treatment:v11 prune:1];

  [v4 setClosedChangeGroups:0];
  [v4 setOpenChangeGroupDeltas:0];
  v15 = [v12 aggregates];
  [v4 setAggregates:v15];
}

- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  v14 = v13;
  if (a6 == 1)
  {
    v14 = v13;
    if (![v12 isEqualToString:@"pb-data"]) {
      goto LABEL_14;
    }
    v26 = self;
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F82B18]) initWithData:v13];
    v16 = [v15 openChangeGroupDeltas];
    __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(v16);

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = [v15 closedChangeGroups];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) deltas];
          __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(v22);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v19);
    }

    self = v26;
    [(FCPersonalizationDataMigrator *)v26 upgradeFromVersion2:v15];
    v14 = [v15 data];
  }
  if (a6 == 2 && [v12 isEqualToString:@"pb-data"])
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F82B18]) initWithData:v13];
    [(FCPersonalizationDataMigrator *)self upgradeFromVersion2:v23];
    uint64_t v24 = [v23 data];

    v14 = (void *)v24;
  }
LABEL_14:

  return v14;
}

void __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 eventsCount];
        if (v7)
        {
          uint64_t v8 = v7;
          for (uint64_t j = 0; j != v8; ++j)
          {
            uint64_t v10 = [v6 events];
            int v11 = *(_DWORD *)(v10 + 4 * j) & 0x1F | (*(_DWORD *)(v10 + 4 * j) >> 5 << 6);
            *(_DWORD *)([v6 events] + 4 * j) = v11;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (id)treatmentProvider
{
  return self->_treatmentProvider;
}

- (void).cxx_destruct
{
}

@end
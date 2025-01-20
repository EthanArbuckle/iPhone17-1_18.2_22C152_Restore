@interface _MultiplatformDonationRecencyStore
- (_MultiplatformDonationRecencyStore)init;
- (id)bundlesFromMostRecentlyProvidingPlatforms;
- (void)updateDataWithRemoteBundleIdentifier:(id)a3 remoteDate:(id)a4 localBundleIdentifier:(id)a5 localDate:(id)a6;
@end

@implementation _MultiplatformDonationRecencyStore

- (_MultiplatformDonationRecencyStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)_MultiplatformDonationRecencyStore;
  v2 = [(_MultiplatformDonationRecencyStore *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    appDateInfo = v2->_appDateInfo;
    v2->_appDateInfo = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    infoByLocalID = v2->_infoByLocalID;
    v2->_infoByLocalID = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    infoByRemoteID = v2->_infoByRemoteID;
    v2->_infoByRemoteID = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)updateDataWithRemoteBundleIdentifier:(id)a3 remoteDate:(id)a4 localBundleIdentifier:(id)a5 localDate:(id)a6
{
  id v37 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v37)
  {
    v13 = 0;
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = 0;
    BOOL v23 = 0;
    BOOL v22 = v13 != 0;
    if (!v13) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_infoByRemoteID, "objectForKeyedSubscript:");
  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v14 = [(NSMutableDictionary *)self->_infoByLocalID objectForKeyedSubscript:v11];
  v21 = (void *)v14;
  BOOL v22 = v13 != 0;
  BOOL v23 = v14 != 0;
  if (v13 && v14 && v13 != (void *)v14)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Remote and local bundles ids should map to the same information.", v15, v16, v17, v18, v19, v20, v36);
    BOOL v22 = 1;
    BOOL v23 = 1;
  }
  else
  {
    v24 = (void *)v14;
    if (!v13) {
      goto LABEL_12;
    }
  }
LABEL_11:
  v24 = v13;
LABEL_12:
  v25 = v24;
  if (!v25)
  {
LABEL_13:
    v25 = objc_alloc_init(_MultiplatformDonationRecencyInfo);
    [(NSMutableArray *)self->_appDateInfo addObject:v25];
  }
  if (v11 && !v23)
  {
    [(_MultiplatformDonationRecencyInfo *)v25 setLocalBundleIdentifier:v11];
    [(NSMutableDictionary *)self->_infoByLocalID setObject:v25 forKey:v11];
  }
  id v26 = v37;
  if (v37) {
    char v27 = v22;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0)
  {
    [(_MultiplatformDonationRecencyInfo *)v25 setRemoteBundleIdentifier:v37];
    [(NSMutableDictionary *)self->_infoByRemoteID setObject:v25 forKey:v37];
    id v26 = v37;
  }
  if (v11 && v12)
  {
    v28 = [(_MultiplatformDonationRecencyInfo *)v25 localDonationCreationDate];
    v29 = v28;
    if (!v28
      || ([v28 laterDate:v12],
          v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = [v30 isEqual:v12],
          v30,
          v31))
    {
      [(_MultiplatformDonationRecencyInfo *)v25 setLocalDonationCreationDate:v12];
    }

    id v26 = v37;
  }
  if (v26 && v10)
  {
    v32 = [(_MultiplatformDonationRecencyInfo *)v25 remoteDonationCreationDate];
    v33 = v32;
    if (!v32
      || ([v32 laterDate:v10],
          v34 = objc_claimAutoreleasedReturnValue(),
          int v35 = [v34 isEqual:v10],
          v34,
          v35))
    {
      [(_MultiplatformDonationRecencyInfo *)v25 setRemoteDonationCreationDate:v10];
    }
  }
}

- (id)bundlesFromMostRecentlyProvidingPlatforms
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_appDateInfo, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_appDateInfo;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifierForMostRecentData", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoByRemoteID, 0);
  objc_storeStrong((id *)&self->_infoByLocalID, 0);
  objc_storeStrong((id *)&self->_appDateInfo, 0);
}

@end
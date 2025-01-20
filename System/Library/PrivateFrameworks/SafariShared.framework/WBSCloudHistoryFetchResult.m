@interface WBSCloudHistoryFetchResult
- (NSData)serverChangeTokenData;
- (NSDictionary)clientVersions;
- (NSSet)profiles;
- (WBSCloudHistoryFetchResult)init;
- (id)_dictionaryForRecordData:(id)a3;
- (id)description;
- (id)tombstonesForProfileWithServerIdentifier:(id)a3;
- (id)visitsForProfileWithServerIdentifier:(id)a3;
- (unint64_t)tombstoneCount;
- (unint64_t)visitCount;
- (void)_addCloudHistoryVisit:(id)a3 profileServerIdentifier:(id)a4;
- (void)_addTombstone:(id)a3 profileServerIdentifier:(id)a4;
- (void)_setServerChangeTokenData:(id)a3;
- (void)_updateClientVersion:(unint64_t)a3 seenAt:(id)a4;
- (void)appendRecord:(id)a3 usingConfiguration:(id)a4;
- (void)clearRecordsForProfileWithServerIdentifier:(id)a3;
@end

@implementation WBSCloudHistoryFetchResult

- (WBSCloudHistoryFetchResult)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSCloudHistoryFetchResult;
  v2 = [(WBSCloudHistoryFetchResult *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableVisitsPerProfile = v2->_mutableVisitsPerProfile;
    v2->_mutableVisitsPerProfile = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableTombstonesPerProfile = v2->_mutableTombstonesPerProfile;
    v2->_mutableTombstonesPerProfile = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableClientVersions = v2->_mutableClientVersions;
    v2->_mutableClientVersions = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (NSSet)profiles
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(NSMutableDictionary *)self->_mutableVisitsPerProfile allKeys];
  [v3 addObjectsFromArray:v4];

  v5 = [(NSMutableDictionary *)self->_mutableTombstonesPerProfile allKeys];
  [v3 addObjectsFromArray:v5];

  return (NSSet *)v3;
}

- (void)clearRecordsForProfileWithServerIdentifier:(id)a3
{
  mutableVisitsPerProfile = self->_mutableVisitsPerProfile;
  id v5 = a3;
  [(NSMutableDictionary *)mutableVisitsPerProfile removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_mutableTombstonesPerProfile removeObjectForKey:v5];
}

- (id)visitsForProfileWithServerIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_mutableVisitsPerProfile objectForKeyedSubscript:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)_addCloudHistoryVisit:(id)a3 profileServerIdentifier:(id)a4
{
  id v6 = a3;
  id v11 = v6;
  id v7 = a4;
  if (!v7) {
    id v7 = (id)*MEMORY[0x1E4F980C8];
  }
  v8 = [(NSMutableDictionary *)self->_mutableVisitsPerProfile objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    [v8 addObject:v6];
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v11 count:1];
    [(NSMutableDictionary *)self->_mutableVisitsPerProfile setObject:v10 forKeyedSubscript:v7];
  }
}

- (unint64_t)visitCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_mutableVisitsPerProfile allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSDictionary)clientVersions
{
  v2 = (void *)[(NSMutableDictionary *)self->_mutableClientVersions copy];
  return (NSDictionary *)v2;
}

- (void)_updateClientVersion:(unint64_t)a3 seenAt:(id)a4
{
  id v11 = a4;
  mutableClientVersions = self->_mutableClientVersions;
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NSMutableDictionary *)mutableClientVersions objectForKeyedSubscript:v7];

  if (!v8 || [v8 compare:v11] == -1)
  {
    long long v9 = self->_mutableClientVersions;
    long long v10 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];
  }
}

- (id)tombstonesForProfileWithServerIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_mutableTombstonesPerProfile objectForKeyedSubscript:a3];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (void)_addTombstone:(id)a3 profileServerIdentifier:(id)a4
{
  id v6 = a3;
  id v11 = v6;
  id v7 = a4;
  if (!v7) {
    id v7 = (id)*MEMORY[0x1E4F980C8];
  }
  v8 = [(NSMutableDictionary *)self->_mutableTombstonesPerProfile objectForKeyedSubscript:v7];
  long long v9 = v8;
  if (v8)
  {
    [v8 addObject:v6];
  }
  else
  {
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v11 count:1];
    [(NSMutableDictionary *)self->_mutableTombstonesPerProfile setObject:v10 forKeyedSubscript:v7];
  }
}

- (unint64_t)tombstoneCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_mutableTombstonesPerProfile allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_setServerChangeTokenData:(id)a3
{
  uint64_t v4 = (NSData *)[a3 copy];
  serverChangeTokenData = self->_serverChangeTokenData;
  self->_serverChangeTokenData = v4;
}

- (id)_dictionaryForRecordData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = v3;
    if (objc_msgSend(v3, "safari_dataAppearsToBeCompressed"))
    {
      unint64_t v5 = objc_msgSend(v4, "safari_dataByDecompressingData");
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = v5;

        uint64_t v4 = v7;
      }
    }
    id v13 = 0;
    v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v13];
    id v9 = v13;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      long long v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[WBSCloudHistoryFetchResult _dictionaryForRecordData:](v11, v9);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)appendRecord:(id)a3 usingConfiguration:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 modificationDate];
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  [v7 syncWindow];
  long long v11 = [v9 dateWithTimeIntervalSinceNow:-v10];
  long long v12 = [v11 earlierDate:v8];

  if (v12 != v8)
  {
    id v13 = [v6 recordType];
    uint64_t v14 = objc_msgSend(v6, "safari_numberForKey:", @"Version");
    uint64_t v15 = [v14 integerValue];

    v16 = objc_msgSend(v6, "safari_encryptedDataForKey:", @"EncryptedData");
    if (!v16)
    {
      v16 = objc_msgSend(v6, "safari_dataForKey:", @"Data");
    }
    v17 = [(WBSCloudHistoryFetchResult *)self _dictionaryForRecordData:v16];
    if (!v17)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:](v22);
      }
      goto LABEL_45;
    }
    v18 = objc_msgSend(v6, "safari_stringForKey:", @"ProfileUUID");
    if ([v13 isEqualToString:@"Visits"] && v15 >= 1 && v15 <= 2)
    {
      v41 = v13;
      v42 = v11;
      v19 = objc_msgSend(v17, "safari_numberForKey:", @"ClientVersion");
      uint64_t v20 = [v19 unsignedIntegerValue];
      v40 = v16;
      v43 = v17;
      if (v20)
      {
        v17 = objc_msgSend(v17, "safari_numberForKey:", @"ClientVersion");
        uint64_t v21 = [v17 unsignedIntegerValue];
      }
      else
      {
        uint64_t v21 = 1;
      }
      v30 = [v6 modificationDate];
      [(WBSCloudHistoryFetchResult *)self _updateClientVersion:v21 seenAt:v30];

      if (v20) {
      v23 = objc_msgSend(v43, "safari_arrayForKey:", @"Visits");
      }
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v31 = [v23 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (!v31) {
        goto LABEL_42;
      }
      uint64_t v32 = v31;
      v37 = v8;
      id v38 = v7;
      id v39 = v6;
      uint64_t v33 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v51 != v33) {
            objc_enumerationMutation(v23);
          }
          v35 = [[WBSCloudHistoryVisit alloc] initWithDictionary:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          if (v35)
          {
            [(WBSCloudHistoryFetchResult *)self _addCloudHistoryVisit:v35 profileServerIdentifier:v18];
          }
          else
          {
            v36 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:](&buf, v49, v36);
            }
          }
        }
        uint64_t v32 = [v23 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v32);
    }
    else
    {
      if (![v13 isEqualToString:@"Tombstones"] || v15 < 1 || v15 > 3) {
        goto LABEL_44;
      }
      v43 = v17;
      v23 = objc_msgSend(v17, "safari_arrayForKey:", @"Tombstones");
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (!v24)
      {
LABEL_43:

        v17 = v43;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
      uint64_t v25 = v24;
      v40 = v16;
      v41 = v13;
      v42 = v11;
      v37 = v8;
      id v38 = v7;
      id v39 = v6;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [[WBSHistoryTombstone alloc] initWithDictionary:*(void *)(*((void *)&v44 + 1) + 8 * j)];
          if (v28)
          {
            [(WBSCloudHistoryFetchResult *)self _addTombstone:v28 profileServerIdentifier:v18];
          }
          else
          {
            v29 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[WBSCloudHistoryFetchResult appendRecord:usingConfiguration:](&buf, v49, v29);
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v25);
    }
    id v7 = v38;
    id v6 = v39;
    v8 = v37;
LABEL_42:
    id v13 = v41;
    long long v11 = v42;
    v16 = v40;
    goto LABEL_43;
  }
LABEL_46:
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; cloudHistoryVisits = %@; historyTombstones = %@",
    v5,
    self,
    self->_mutableVisitsPerProfile,
  id v6 = self->_mutableTombstonesPerProfile);

  return v6;
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_mutableClientVersions, 0);
  objc_storeStrong((id *)&self->_mutableTombstonesPerProfile, 0);
  objc_storeStrong((id *)&self->_mutableVisitsPerProfile, 0);
}

- (void)_dictionaryForRecordData:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to deserialize dictionary: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)appendRecord:(os_log_t)log usingConfiguration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize data for Visit record.", v1, 2u);
}

- (void)appendRecord:(os_log_t)log usingConfiguration:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize WBSHistoryTombstone.", buf, 2u);
}

- (void)appendRecord:(os_log_t)log usingConfiguration:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize WBSCloudHistoryVisit.", buf, 2u);
}

@end
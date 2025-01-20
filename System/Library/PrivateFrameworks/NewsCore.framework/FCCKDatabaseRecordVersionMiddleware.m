@interface FCCKDatabaseRecordVersionMiddleware
- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6;
- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6;
- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5;
@end

@implementation FCCKDatabaseRecordVersionMiddleware

- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"readerMinimumRequiredVersion"];
  v7 = v5;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
    v7 = v5;
    if (v8 >= 2)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        v15 = &unk_1EF8D7830;
        _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Cannot handle version due minimumRequiredVersion {Record: %@, readingVersion: %@}", (uint8_t *)&v12, 0x16u);
      }
      v7 = 0;
    }
  }
  id v10 = v7;

  return v10;
}

- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"writerVersionHighWatermark"];
  v7 = v6;
  if (!v6 || [v6 integerValue] <= 0) {
    [v5 setObject:&unk_1EF8D7830 forKeyedSubscript:@"writerVersionHighWatermark"];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"readerMinimumRequiredVersion"];
  if (!v8) {
    [v5 setObject:&unk_1EF8D7830 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  }

  return v5;
}

- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v6 = a3;
  return v6;
}

- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v6 = a3;
  return v6;
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  v21 = v5;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 recordZoneIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        __int16 v14 = objc_msgSend(v7, "configurationsByRecordZoneID", v21);
        v15 = [v14 objectForKey:v13];

        if (v15)
        {
          uint64_t v16 = [v15 desiredKeys];
          v17 = (void *)[v16 mutableCopy];

          if (v17)
          {
            v26[0] = @"writerVersionHighWatermark";
            v26[1] = @"readerMinimumRequiredVersion";
            v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
            [v17 removeObjectsInArray:v18];
            [v17 addObjectsFromArray:v18];
            v19 = (void *)[v17 copy];
            [v15 setDesiredKeys:v19];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  return 0;
}

@end
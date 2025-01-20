@interface GKContactsCacheUpdateBatchEndCommand
- (void)addSyncedHandlesToIDSCache:(id)a3 withContext:(id)a4;
- (void)executeWithHandles:(id)a3 context:(id)a4;
@end

@implementation GKContactsCacheUpdateBatchEndCommand

- (void)executeWithHandles:(id)a3 context:(id)a4
{
}

- (void)addSyncedHandlesToIDSCache:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v22 = v6;
    v7 = +[GKCDIDSInfo _gkObjectsMatchingHandles:v5 withContext:v6];
    v8 = [v7 _gkMapDictionaryWithKeyPath:@"handle"];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v21 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v15 = [v8 objectForKeyedSubscript:v14, v21];
          if (!v15)
          {
            v16 = [GKCDIDSInfo alloc];
            v17 = +[GKCDIDSInfo entity];
            v18 = [(GKCDIDSInfo *)v16 initWithEntity:v17 insertIntoManagedObjectContext:v22];

            [(GKCDIDSInfo *)v18 _gkUpdateEntryWithHandle:v14 contactAssociationID:0 supportsFriendingViaPush:0 supportsMessageTransportV2:0 cohort:0xFFFFFFFFLL];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v5 = v21;
    id v6 = v22;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    v20 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1000D4D44(v20);
    }
  }
}

@end
@interface WFCloudKitSyncToken
+ (id)accountForContainerEnvironmentString:(id)a3 userRecordID:(id)a4;
+ (id)defaultDate;
+ (id)defaultIdentifier;
+ (id)ignoredPropertyNames;
- (CKServerChangeToken)serverChangeToken;
- (NSData)lastOrderingCloudKitRecordMetadata;
- (NSData)lastOrderingData;
- (NSData)serverChangeTokenData;
- (NSData)syncEngineMetadata;
- (NSData)syncFlagsCloudKitRecordMetadata;
- (NSDate)date;
- (NSOrderedSet)lastOrdering;
- (NSString)account;
- (NSString)identifier;
- (id)newTokenWithCopiedPayload;
- (void)setAccount:(id)a3;
- (void)setDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastOrdering:(id)a3;
- (void)setLastOrderingCloudKitRecordMetadata:(id)a3;
- (void)setLastOrderingData:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServerChangeTokenData:(id)a3;
- (void)setSyncEngineMetadata:(id)a3;
- (void)setSyncFlagsCloudKitRecordMetadata:(id)a3;
@end

@implementation WFCloudKitSyncToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncFlagsCloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_syncEngineMetadata, 0);
  objc_storeStrong((id *)&self->_lastOrderingCloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_lastOrderingData, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSyncFlagsCloudKitRecordMetadata:(id)a3
{
}

- (NSData)syncFlagsCloudKitRecordMetadata
{
  return self->_syncFlagsCloudKitRecordMetadata;
}

- (void)setSyncEngineMetadata:(id)a3
{
}

- (NSData)syncEngineMetadata
{
  return self->_syncEngineMetadata;
}

- (void)setLastOrderingCloudKitRecordMetadata:(id)a3
{
}

- (NSData)lastOrderingCloudKitRecordMetadata
{
  return self->_lastOrderingCloudKitRecordMetadata;
}

- (void)setLastOrderingData:(id)a3
{
}

- (NSData)lastOrderingData
{
  return self->_lastOrderingData;
}

- (void)setServerChangeTokenData:(id)a3
{
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setAccount:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)newTokenWithCopiedPayload
{
  v3 = objc_opt_new();
  v4 = [(WFCloudKitSyncToken *)self account];
  [v3 setAccount:v4];

  v5 = [(WFCloudKitSyncToken *)self serverChangeTokenData];
  [v3 setServerChangeTokenData:v5];

  v6 = [(WFCloudKitSyncToken *)self lastOrderingData];
  [v3 setLastOrderingData:v6];

  v7 = [(WFCloudKitSyncToken *)self lastOrderingCloudKitRecordMetadata];
  [v3 setLastOrderingCloudKitRecordMetadata:v7];

  v8 = [(WFCloudKitSyncToken *)self syncEngineMetadata];
  [v3 setSyncEngineMetadata:v8];

  v9 = [(WFCloudKitSyncToken *)self syncFlagsCloudKitRecordMetadata];
  [v3 setSyncFlagsCloudKitRecordMetadata:v9];

  return v3;
}

- (NSOrderedSet)lastOrdering
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCloudKitSyncToken *)self lastOrderingData];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC0];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [(WFCloudKitSyncToken *)self lastOrderingData];
    id v16 = 0;
    v10 = [v5 unarchivedObjectOfClasses:v8 fromData:v9 error:&v16];
    v11 = v16;

    if (v10)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v10];
    }
    else
    {
      v14 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFCloudKitSyncToken lastOrdering]";
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Error unarchving lastOrderingData: %{public}@", buf, 0x16u);
      }

      uint64_t v12 = objc_opt_new();
    }
    v13 = (void *)v12;
  }
  else
  {
    v11 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFCloudKitSyncToken lastOrdering]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s lastOrderingData is empty", buf, 0xCu);
    }
    v13 = 0;
  }

  return (NSOrderedSet *)v13;
}

- (void)setLastOrdering:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DB0];
    id v7 = [a3 array];
    v5 = objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:");
    if (v5)
    {
      [(WFCloudKitSyncToken *)self setLastOrderingData:v5];
    }
    else
    {
      v6 = objc_opt_new();
      [(WFCloudKitSyncToken *)self setLastOrderingData:v6];
    }
  }
  else
  {
    id v7 = (id)objc_opt_new();
    [(WFCloudKitSyncToken *)self setLastOrderingData:v7];
  }
}

- (CKServerChangeToken)serverChangeToken
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(WFCloudKitSyncToken *)self serverChangeTokenData];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = objc_opt_class();
    id v7 = [(WFCloudKitSyncToken *)self serverChangeTokenData];
    id v13 = 0;
    v8 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:&v13];
    v9 = v13;

    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFCloudKitSyncToken serverChangeToken]";
        __int16 v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchving serverChangeTokenData: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFCloudKitSyncToken serverChangeToken]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s serverChangeTokenData is empty", buf, 0xCu);
    }
    v8 = 0;
  }

  return (CKServerChangeToken *)v8;
}

- (void)setServerChangeToken:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = objc_opt_new();
    id v10 = (void *)v7;
    uint64_t v6 = self;
    goto LABEL_5;
  }
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = self;
    id v10 = (void *)v5;
    uint64_t v7 = v5;
LABEL_5:
    [(WFCloudKitSyncToken *)v6 setServerChangeTokenData:v7];
    v8 = v10;
    goto LABEL_7;
  }
  v9 = objc_opt_new();
  [(WFCloudKitSyncToken *)self setServerChangeTokenData:v9];

  v8 = 0;
LABEL_7:
}

+ (id)accountForContainerEnvironmentString:(id)a3 userRecordID:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 zoneID];
  v9 = [v8 zoneName];
  id v10 = [v6 recordName];

  v11 = [v5 stringWithFormat:@"%@:%@:%@", v7, v9, v10];

  return v11;
}

+ (id)ignoredPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"serverChangeToken", @"lastOrdering", 0);
}

+ (id)defaultIdentifier
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  return v3;
}

+ (id)defaultDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

@end
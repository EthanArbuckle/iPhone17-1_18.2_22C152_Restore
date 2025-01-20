@interface PDCloudStoreRecordsRequest
- (BOOL)canCoalesceWithRequest:(id)a3;
- (BOOL)detectConflicts;
- (BOOL)formReport;
- (BOOL)ignoreChangesMadeByThisDevice;
- (BOOL)ignoreExistingRecordHash;
- (BOOL)isModifyingShare;
- (BOOL)returnRecords;
- (BOOL)shouldSaveToken;
- (BOOL)storeChangesInDatabase;
- (BOOL)useLastChangeToken;
- (CKQuery)ckQuery;
- (NSDate)ignoreRecordsAfterDate;
- (NSDate)ignoreRecordsBeforeDate;
- (NSDictionary)recordIDsByDatabaseIdentifier;
- (NSDictionary)recordsToSaveByDatabaseIdentifier;
- (NSMutableSet)completionHandlers;
- (NSString)groupName;
- (NSString)groupNameSuffix;
- (NSString)recordName;
- (PDCloudStoreContainerDatabase)containerDatabase;
- (PDCloudStoreRecordsRequest)initWithRequestType:(unint64_t)a3 storeChanges:(BOOL)a4 returnRecords:(BOOL)a5 qualityOfService:(int64_t)a6 groupName:(id)a7 groupNameSuffix:(id)a8;
- (PDCloudStoreRecordsRequestModificationOperationConfiguration)recordModificationOperationConfiguration;
- (PKCloudStoreZone)cloudStoreZone;
- (id)batchHandler;
- (id)description;
- (int64_t)batchLimit;
- (int64_t)qualityOfService;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithResponse:(id)a3 error:(id)a4;
- (void)setBatchHandler:(id)a3;
- (void)setBatchLimit:(int64_t)a3;
- (void)setCkQuery:(id)a3;
- (void)setCloudStoreZone:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setContainerDatabase:(id)a3;
- (void)setDetectConflicts:(BOOL)a3;
- (void)setFormReport:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNameSuffix:(id)a3;
- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3;
- (void)setIgnoreExistingRecordHash:(BOOL)a3;
- (void)setIgnoreRecordsAfterDate:(id)a3;
- (void)setIgnoreRecordsBeforeDate:(id)a3;
- (void)setIsModifyingShare:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecordIDsByDatabaseIdentifier:(id)a3;
- (void)setRecordModificationOperationConfiguration:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRecordsToSaveByDatabaseIdentifier:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setReturnRecords:(BOOL)a3;
- (void)setShouldSaveToken:(BOOL)a3;
- (void)setStoreChangesInDatabase:(BOOL)a3;
- (void)setUseLastChangeToken:(BOOL)a3;
@end

@implementation PDCloudStoreRecordsRequest

- (PDCloudStoreRecordsRequest)initWithRequestType:(unint64_t)a3 storeChanges:(BOOL)a4 returnRecords:(BOOL)a5 qualityOfService:(int64_t)a6 groupName:(id)a7 groupNameSuffix:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PDCloudStoreRecordsRequest;
  v17 = [(PDCloudStoreRecordsRequest *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_storeChangesInDatabase = a4;
    v17->_returnRecords = a5;
    v17->_qualityOfService = a6;
    v17->_requestType = a3;
    objc_storeStrong((id *)&v17->_groupName, a7);
    objc_storeStrong((id *)&v18->_groupNameSuffix, a8);
    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v18->_completionHandlers;
    v18->_completionHandlers = v19;
  }
  return v18;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableSet *)completionHandlers addObject:v4];
  }
}

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableSet *)self->_completionHandlers copy];
  [(NSMutableSet *)self->_completionHandlers removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  id v4 = v3;
  unint64_t v5 = self->_requestType - 1;
  if (v5 > 7) {
    CFStringRef v6 = @"token";
  }
  else {
    CFStringRef v6 = *(&off_100749718 + v5);
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  if (self->_useLastChangeToken) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v4 appendFormat:@"use last token: '%@'; ", v7];
  if (self->_shouldSaveToken) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v4 appendFormat:@"should save token: '%@'; ", v8];
  if (self->_storeChangesInDatabase) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v4 appendFormat:@"store changes: '%@'; ", v9];
  if (self->_returnRecords) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [v4 appendFormat:@"return records: '%@'; ", v10];
  [v4 appendFormat:@"group name: '%@'; ", self->_groupName];
  [v4 appendFormat:@"group name suffix: '%@'; ", self->_groupNameSuffix];
  if (self->_ckQuery) {
    [v4 appendFormat:@"ckQuery: '%@'; ", self->_ckQuery];
  }
  cloudStoreZone = self->_cloudStoreZone;
  if (cloudStoreZone)
  {
    uint64_t v12 = [(PKCloudStoreZone *)cloudStoreZone zoneName];
    [v4 appendFormat:@"zoneName: '%@'; ", v12];
  }
  containerDatabase = self->_containerDatabase;
  if (containerDatabase)
  {
    long long v14 = [(PDCloudStoreContainerDatabase *)containerDatabase database];
    [v14 scope];
    long long v15 = CKDatabaseScopeString();
    [v4 appendFormat:@"containerDatabase: '%@'; ", v15];
  }
  if (self->_recordModificationOperationConfiguration) {
    objc_msgSend(v4, "appendFormat:", @"recordModificationOperationConfiguration: '%@'; ",
  }
      self->_recordModificationOperationConfiguration);
  if (self->_ignoreExistingRecordHash) {
    [v4 appendFormat:@"ignoreExistingRecordHash: '%@'; ", @"YES"];
  }
  if (self->_isModifyingShare) {
    [v4 appendFormat:@"isModifyingShare: '%@'; ", @"YES"];
  }
  long long v16 = [(PKCloudStoreZone *)self->_cloudStoreZone containerName];
  [v4 appendFormat:@"containerName: '%@'; ", v16];

  [v4 appendString:@">"];
  long long v17 = +[NSString stringWithString:v4];

  return v17;
}

- (BOOL)canCoalesceWithRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PDCloudStoreRecordsRequest *)self requestType];
    if (v5 == [v4 requestType])
    {
      unsigned int v6 = [(PDCloudStoreRecordsRequest *)self returnRecords];
      if (v6 == [v4 returnRecords])
      {
        unsigned int v7 = [(PDCloudStoreRecordsRequest *)self useLastChangeToken];
        if (v7 == [v4 useLastChangeToken])
        {
          unsigned int v8 = [(PDCloudStoreRecordsRequest *)self shouldSaveToken];
          if (v8 == [v4 shouldSaveToken])
          {
            CFStringRef v9 = [(PDCloudStoreRecordsRequest *)self containerDatabase];
            uint64_t v10 = [v4 containerDatabase];

            if (v9 == (void *)v10)
            {
              unsigned int v11 = [(PDCloudStoreRecordsRequest *)self detectConflicts];
              if (v11 == [v4 detectConflicts])
              {
                unsigned int v12 = [(PDCloudStoreRecordsRequest *)self isModifyingShare];
                if (v12 == [v4 isModifyingShare])
                {
                  switch([(PDCloudStoreRecordsRequest *)self requestType])
                  {
                    case 0uLL:
                    case 1uLL:
                      id v14 = v4;
                      long long v15 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
                      if (v15)
                      {
                      }
                      else
                      {
                        v37 = [v14 cloudStoreZone];

                        if (!v37)
                        {
                          LOBYTE(v10) = 1;
                          goto LABEL_10;
                        }
                      }
                      id v16 = v14;
                      goto LABEL_26;
                    case 2uLL:
                    case 3uLL:
                      id v16 = v4;
LABEL_26:
                      uint64_t v10 = (uint64_t)v16;
                      id v21 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
                      uint64_t v36 = [(id)v10 cloudStoreZone];
                      goto LABEL_27;
                    case 4uLL:
                    case 7uLL:
                      id v17 = v4;
                      v18 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
                      v19 = [v17 cloudStoreZone];

                      int v20 = PKEqualObjects();
                      if (!v20) {
                        break;
                      }
                      id v21 = v17;
                      objc_super v22 = [(PDCloudStoreRecordsRequest *)self ckQuery];
                      v23 = [v21 ckQuery];
                      id v24 = v22;
                      id v25 = v23;
                      v26 = [v24 recordType];
                      v27 = [v25 recordType];
                      if (PKEqualObjects())
                      {
                        v28 = [v24 predicate];
                        v29 = [v25 predicate];
                        if (PKEqualObjects())
                        {
                          v38 = [v24 sortDescriptors];
                          v30 = [v25 sortDescriptors];
                          LOBYTE(v10) = PKEqualObjects();
                        }
                        else
                        {
                          LOBYTE(v10) = 0;
                        }
                      }
                      else
                      {
                        LOBYTE(v10) = 0;
                      }

                      goto LABEL_28;
                    case 5uLL:
                      id v31 = v4;
                      v32 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
                      uint64_t v33 = [v31 cloudStoreZone];
                      goto LABEL_21;
                    case 6uLL:
                      id v31 = v4;
                      v32 = [(PDCloudStoreRecordsRequest *)self recordsToSaveByDatabaseIdentifier];
                      uint64_t v33 = [v31 recordsToSaveByDatabaseIdentifier];
LABEL_21:
                      v34 = (void *)v33;

                      int v35 = PKEqualObjects();
                      if (!v35) {
                        break;
                      }
                      uint64_t v10 = (uint64_t)v31;
                      id v21 = [(PDCloudStoreRecordsRequest *)self recordIDsByDatabaseIdentifier];
                      uint64_t v36 = [(id)v10 recordIDsByDatabaseIdentifier];
LABEL_27:
                      id v24 = (id)v36;

                      LOBYTE(v10) = PKEqualObjects();
LABEL_28:

                      goto LABEL_10;
                    case 8uLL:
                      uint64_t v10 = (uint64_t)v4;
                      id v21 = [(PDCloudStoreRecordsRequest *)self recordName];
                      uint64_t v36 = [(id)v10 recordName];
                      goto LABEL_27;
                    default:
                      goto LABEL_10;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v10) = 0;
LABEL_10:

  return v10 & 1;
}

- (BOOL)storeChangesInDatabase
{
  return self->_storeChangesInDatabase;
}

- (void)setStoreChangesInDatabase:(BOOL)a3
{
  self->_storeChangesInDatabase = a3;
}

- (BOOL)returnRecords
{
  return self->_returnRecords;
}

- (void)setReturnRecords:(BOOL)a3
{
  self->_returnRecords = a3;
}

- (BOOL)formReport
{
  return self->_formReport;
}

- (void)setFormReport:(BOOL)a3
{
  self->_formReport = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupNameSuffix
{
  return self->_groupNameSuffix;
}

- (void)setGroupNameSuffix:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (BOOL)useLastChangeToken
{
  return self->_useLastChangeToken;
}

- (void)setUseLastChangeToken:(BOOL)a3
{
  self->_useLastChangeToken = a3;
}

- (BOOL)shouldSaveToken
{
  return self->_shouldSaveToken;
}

- (void)setShouldSaveToken:(BOOL)a3
{
  self->_shouldSaveToken = a3;
}

- (BOOL)detectConflicts
{
  return self->_detectConflicts;
}

- (void)setDetectConflicts:(BOOL)a3
{
  self->_detectConflicts = a3;
}

- (BOOL)isModifyingShare
{
  return self->_isModifyingShare;
}

- (void)setIsModifyingShare:(BOOL)a3
{
  self->_isModifyingShare = a3;
}

- (BOOL)ignoreChangesMadeByThisDevice
{
  return self->_ignoreChangesMadeByThisDevice;
}

- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3
{
  self->_ignoreChangesMadeByThisDevice = a3;
}

- (PDCloudStoreContainerDatabase)containerDatabase
{
  return self->_containerDatabase;
}

- (void)setContainerDatabase:(id)a3
{
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
}

- (CKQuery)ckQuery
{
  return self->_ckQuery;
}

- (void)setCkQuery:(id)a3
{
}

- (int64_t)batchLimit
{
  return self->_batchLimit;
}

- (void)setBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (id)batchHandler
{
  return self->_batchHandler;
}

- (void)setBatchHandler:(id)a3
{
}

- (NSDictionary)recordsToSaveByDatabaseIdentifier
{
  return self->_recordsToSaveByDatabaseIdentifier;
}

- (void)setRecordsToSaveByDatabaseIdentifier:(id)a3
{
}

- (NSDictionary)recordIDsByDatabaseIdentifier
{
  return self->_recordIDsByDatabaseIdentifier;
}

- (void)setRecordIDsByDatabaseIdentifier:(id)a3
{
}

- (PDCloudStoreRecordsRequestModificationOperationConfiguration)recordModificationOperationConfiguration
{
  return self->_recordModificationOperationConfiguration;
}

- (void)setRecordModificationOperationConfiguration:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSDate)ignoreRecordsBeforeDate
{
  return self->_ignoreRecordsBeforeDate;
}

- (void)setIgnoreRecordsBeforeDate:(id)a3
{
}

- (NSDate)ignoreRecordsAfterDate
{
  return self->_ignoreRecordsAfterDate;
}

- (void)setIgnoreRecordsAfterDate:(id)a3
{
}

- (BOOL)ignoreExistingRecordHash
{
  return self->_ignoreExistingRecordHash;
}

- (void)setIgnoreExistingRecordHash:(BOOL)a3
{
  self->_ignoreExistingRecordHash = a3;
}

- (NSMutableSet)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_ignoreRecordsAfterDate, 0);
  objc_storeStrong((id *)&self->_ignoreRecordsBeforeDate, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_recordModificationOperationConfiguration, 0);
  objc_storeStrong((id *)&self->_recordIDsByDatabaseIdentifier, 0);
  objc_storeStrong((id *)&self->_recordsToSaveByDatabaseIdentifier, 0);
  objc_storeStrong(&self->_batchHandler, 0);
  objc_storeStrong((id *)&self->_ckQuery, 0);
  objc_storeStrong((id *)&self->_cloudStoreZone, 0);
  objc_storeStrong((id *)&self->_containerDatabase, 0);
  objc_storeStrong((id *)&self->_groupNameSuffix, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
@interface WFCloudKitWorkflow
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (id)encryptedNameProperty;
+ (id)nameProperty;
+ (id)recordIDWithZoneID:(id)a3 workflowID:(id)a4;
+ (int64_t)latestEncryptedSchemaVersion;
- (BOOL)isValidForSyncing;
- (CKRecordID)identifier;
- (NSData)recordSystemFieldsData;
- (NSData)serializedAccessResourcePerWorkflowStateData;
- (NSData)serializedQuarantineData;
- (NSData)serializedSmartPromptsPerWorkflowStateData;
- (NSDate)createdAt;
- (NSDate)modifiedAt;
- (NSString)associatedAppBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)lastSavedOnDeviceName;
- (NSString)name;
- (NSString)source;
- (NSString)workflowSubtitle;
- (WFCloudKitWorkflow)initWithRecord:(id)a3 identifier:(id)a4;
- (WFFileRepresentation)serializedDataFile;
- (WFWorkflowRecord)cachedRecord;
- (id)recordRepresentationWithError:(id *)a3;
- (int64_t)cachedSyncHash;
- (int64_t)encryptedSchemaVersion;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setCachedRecord:(id)a3;
- (void)setCachedSyncHash:(int64_t)a3;
- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5;
- (void)setEncryptedSchemaVersion:(int64_t)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setLastSavedOnDeviceName:(id)a3;
- (void)setName:(id)a3;
- (void)setRecordSystemFieldsData:(id)a3;
- (void)setSerializedAccessResourcePerWorkflowStateData:(id)a3;
- (void)setSerializedDataFile:(id)a3;
- (void)setSerializedQuarantineData:(id)a3;
- (void)setSerializedSmartPromptsPerWorkflowStateData:(id)a3;
- (void)setSource:(id)a3;
- (void)setWorkflowSubtitle:(id)a3;
@end

@implementation WFCloudKitWorkflow

+ (int64_t)latestEncryptedSchemaVersion
{
  return +[WFCloudKitSyncSession isWalrusEnabled];
}

+ (id)recordIDWithZoneID:(id)a3 workflowID:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithRecordName:v6 zoneID:v7];

  return v8;
}

+ (id)encryptedNameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled]) {
    +[WFCloudKitItemProperty objectPropertyWithName:@"name" ignoredByDefault:0 encrypted:1];
  }
  else {
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"name" constantValue:0 encrypted:1];
  }
  return v2;
}

+ (id)nameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled]) {
    +[WFCloudKitItemProperty objectPropertyWithName:@"name" constantValue:0];
  }
  else {
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"name"];
  }
  return v2;
}

+ (NSDictionary)properties
{
  v20[13] = *MEMORY[0x1E4F143B8];
  v19[0] = @"subtitle";
  v18 = +[WFCloudKitItemProperty objectPropertyWithName:@"workflowSubtitle"];
  v20[0] = v18;
  v19[1] = @"associatedAppBundleIdentifier";
  v17 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v20[1] = v17;
  v19[2] = @"source";
  v16 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v20[2] = v16;
  v19[3] = @"galleryIdentifier";
  v15 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v20[3] = v15;
  v19[4] = @"lastSavedOnDeviceName";
  v14 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v20[4] = v14;
  v19[5] = @"serializedData";
  v3 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
  v4 = +[WFCloudKitItemProperty assetPropertyWithName:@"serializedDataFile" fileType:v3];
  v20[5] = v4;
  v19[6] = @"quarantine";
  v5 = +[WFCloudKitItemProperty objectPropertyWithName:@"serializedQuarantineData"];
  v20[6] = v5;
  v19[7] = @"cachedSyncHash";
  id v6 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v20[7] = v6;
  v19[8] = @"accessResourcePermissionsData";
  id v7 = +[WFCloudKitItemProperty objectPropertyWithName:@"serializedAccessResourcePerWorkflowStateData"];
  v20[8] = v7;
  v19[9] = @"smartPromptsData";
  v8 = +[WFCloudKitItemProperty objectPropertyWithName:@"serializedSmartPromptsPerWorkflowStateData"];
  v20[9] = v8;
  v19[10] = @"name";
  v9 = [a1 nameProperty];
  v20[10] = v9;
  v19[11] = @"encryptedSchemaVersion";
  v10 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v20[11] = v10;
  v19[12] = @"encryptedName";
  v11 = [a1 encryptedNameProperty];
  v20[12] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:13];

  return (NSDictionary *)v12;
}

+ (NSString)recordType
{
  if ([MEMORY[0x1E4F1CB18] shouldSyncCoherence]) {
    return (NSString *)@"Shortcut_v2";
  }
  else {
    return (NSString *)@"Shortcut";
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecord, 0);
  objc_storeStrong((id *)&self->_serializedSmartPromptsPerWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_lastSavedOnDeviceName, 0);
  objc_storeStrong((id *)&self->_serializedAccessResourcePerWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_serializedQuarantineData, 0);
  objc_storeStrong((id *)&self->_serializedDataFile, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowSubtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCachedRecord:(id)a3
{
}

- (WFWorkflowRecord)cachedRecord
{
  return self->_cachedRecord;
}

- (void)setEncryptedSchemaVersion:(int64_t)a3
{
  self->_encryptedSchemaVersion = a3;
}

- (int64_t)encryptedSchemaVersion
{
  return self->_encryptedSchemaVersion;
}

- (void)setCachedSyncHash:(int64_t)a3
{
  self->_cachedSyncHash = a3;
}

- (int64_t)cachedSyncHash
{
  return self->_cachedSyncHash;
}

- (void)setSerializedSmartPromptsPerWorkflowStateData:(id)a3
{
}

- (NSData)serializedSmartPromptsPerWorkflowStateData
{
  return self->_serializedSmartPromptsPerWorkflowStateData;
}

- (void)setLastSavedOnDeviceName:(id)a3
{
}

- (NSString)lastSavedOnDeviceName
{
  return self->_lastSavedOnDeviceName;
}

- (void)setSerializedAccessResourcePerWorkflowStateData:(id)a3
{
}

- (NSData)serializedAccessResourcePerWorkflowStateData
{
  return self->_serializedAccessResourcePerWorkflowStateData;
}

- (void)setSerializedQuarantineData:(id)a3
{
}

- (NSData)serializedQuarantineData
{
  return self->_serializedQuarantineData;
}

- (void)setSerializedDataFile:(id)a3
{
}

- (WFFileRepresentation)serializedDataFile
{
  return self->_serializedDataFile;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setWorkflowSubtitle:(id)a3
{
}

- (NSString)workflowSubtitle
{
  return self->_workflowSubtitle;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)modifiedAt
{
  return self->_modifiedAt;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setRecordSystemFieldsData:(id)a3
{
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (BOOL)isValidForSyncing
{
  v3 = [(WFCloudKitWorkflow *)self name];
  if (v3)
  {
    v4 = [(WFCloudKitWorkflow *)self serializedDataFile];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)recordRepresentationWithError:(id *)a3
{
  p_cachedRecord = &self->_cachedRecord;
  cachedRecord = self->_cachedRecord;
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (cachedRecord == v7) {
    goto LABEL_16;
  }
  if (cachedRecord)
  {
    cachedRecord = cachedRecord;
    v8 = cachedRecord;
    goto LABEL_17;
  }
  cachedRecord = [(WFCloudKitWorkflow *)self serializedDataFile];
  if (!cachedRecord) {
    goto LABEL_16;
  }
  v9 = [(WFCloudKitWorkflow *)self name];

  if (!v9)
  {
LABEL_15:
    cachedRecord = 0;
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  v10 = [WFWorkflowFileDescriptor alloc];
  v11 = [(WFCloudKitWorkflow *)self serializedDataFile];
  v12 = [(WFCloudKitWorkflow *)self name];
  v13 = [(WFWorkflowFileDescriptor *)v10 initWithFile:v11 name:v12];

  v14 = [[WFWorkflowFile alloc] initWithDescriptor:v13 performMigration:0 error:a3];
  v15 = [(WFWorkflowFile *)v14 recordRepresentationWithError:a3];

  if (!v15)
  {

    goto LABEL_15;
  }
  v16 = [(WFCloudKitWorkflow *)self name];
  [v15 setName:v16];

  v17 = [(WFCloudKitWorkflow *)self createdAt];
  [v15 setCreationDate:v17];

  v18 = [(WFCloudKitWorkflow *)self modifiedAt];
  [v15 setModificationDate:v18];

  v19 = [(WFCloudKitWorkflow *)self workflowSubtitle];
  [v15 setWorkflowSubtitle:v19];

  v20 = [(WFCloudKitWorkflow *)self associatedAppBundleIdentifier];
  [v15 setAssociatedAppBundleIdentifier:v20];

  v21 = [(WFCloudKitWorkflow *)self source];
  [v15 setSource:v21];

  v22 = [(WFCloudKitWorkflow *)self galleryIdentifier];
  [v15 setGalleryIdentifier:v22];

  v23 = [(WFCloudKitWorkflow *)self serializedQuarantineData];

  if (v23)
  {
    v24 = [WFWorkflowQuarantine alloc];
    v25 = [(WFCloudKitWorkflow *)self serializedQuarantineData];
    v26 = [(WFWorkflowQuarantine *)v24 initWithSerializedData:v25];
    [v15 setQuarantine:v26];
  }
  v27 = [(WFCloudKitWorkflow *)self serializedAccessResourcePerWorkflowStateData];

  v28 = (void *)MEMORY[0x1E4F1CBF0];
  if (v27)
  {
    v29 = (void *)MEMORY[0x1E4F28F98];
    v30 = [(WFCloudKitWorkflow *)self serializedAccessResourcePerWorkflowStateData];
    uint64_t v31 = [v29 propertyListWithData:v30 options:0 format:0 error:0];
    v32 = (void *)v31;
    if (v31) {
      v33 = (void *)v31;
    }
    else {
      v33 = v28;
    }
    id v34 = v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v36 = objc_msgSend(v34, "if_compactMap:", &__block_literal_global_25510);

    v37 = [v35 setWithArray:v36];
    [v15 setAccessResourcePerWorkflowStates:v37];
  }
  else
  {
    v36 = objc_opt_new();
    [v15 setAccessResourcePerWorkflowStates:v36];
  }

  v39 = [(WFCloudKitWorkflow *)self serializedSmartPromptsPerWorkflowStateData];

  if (v39)
  {
    v40 = (void *)MEMORY[0x1E4F28F98];
    v41 = [(WFCloudKitWorkflow *)self serializedSmartPromptsPerWorkflowStateData];
    uint64_t v42 = [v40 propertyListWithData:v41 options:0 format:0 error:0];
    v43 = (void *)v42;
    if (v42) {
      v44 = (void *)v42;
    }
    else {
      v44 = v28;
    }
    id v45 = v44;

    v46 = (void *)MEMORY[0x1E4F1CAD0];
    v47 = objc_msgSend(v45, "if_compactMap:", &__block_literal_global_245);

    v48 = [v46 setWithArray:v47];
    [v15 setSmartPromptPerWorkflowStates:v48];
  }
  else
  {
    v47 = objc_opt_new();
    [v15 setSmartPromptPerWorkflowStates:v47];
  }

  v49 = [(WFCloudKitWorkflow *)self lastSavedOnDeviceName];
  [v15 setLastSavedOnDeviceName:v49];

  v50 = [(WFCloudKitWorkflow *)self recordSystemFieldsData];
  [v15 setCloudKitRecordMetadata:v50];

  objc_msgSend(v15, "setSyncHash:", -[WFCloudKitWorkflow cachedSyncHash](self, "cachedSyncHash"));
  objc_msgSend(v15, "setWantedEncryptedSchemaVersion:", -[WFCloudKitWorkflow encryptedSchemaVersion](self, "encryptedSchemaVersion"));
  [v15 setStorageIdentifier:0];
  objc_storeStrong((id *)p_cachedRecord, v15);

  v8 = v15;
  cachedRecord = self->_cachedRecord;
  self->_cachedRecord = v8;
LABEL_17:

  return v8;
}

WFSerializedSmartPromptPerWorkflowState *__52__WFCloudKitWorkflow_recordRepresentationWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFSerializedSmartPromptPerWorkflowState alloc] initWithDictionary:v2];

  return v3;
}

WFSerializedAccessResourcePerWorkflowState *__52__WFCloudKitWorkflow_recordRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFSerializedAccessResourcePerWorkflowState alloc] initWithDictionary:v2];

  return v3;
}

- (WFCloudKitWorkflow)initWithRecord:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(WFCloudKitWorkflow *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedRecord, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    uint64_t v11 = [v7 name];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v7 workflowSubtitle];
    workflowSubtitle = v10->_workflowSubtitle;
    v10->_workflowSubtitle = (NSString *)v13;

    uint64_t v15 = [v7 associatedAppBundleIdentifier];
    associatedAppBundleIdentifier = v10->_associatedAppBundleIdentifier;
    v10->_associatedAppBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v7 source];
    source = v10->_source;
    v10->_source = (NSString *)v17;

    uint64_t v19 = [v7 galleryIdentifier];
    galleryIdentifier = v10->_galleryIdentifier;
    v10->_galleryIdentifier = (NSString *)v19;

    v21 = [v7 fileRepresentation];
    v22 = [v8 recordName];
    [v21 setName:v22];

    uint64_t v23 = [v21 writeToDiskWithError:0];
    serializedDataFile = v10->_serializedDataFile;
    v10->_serializedDataFile = (WFFileRepresentation *)v23;

    v25 = [v7 quarantine];
    uint64_t v26 = [v25 serializedData];
    serializedQuarantineData = v10->_serializedQuarantineData;
    v10->_serializedQuarantineData = (NSData *)v26;

    v28 = (void *)MEMORY[0x1E4F28F98];
    v29 = [v7 accessResourcePerWorkflowStates];
    v30 = [v29 allObjects];
    uint64_t v31 = [v30 valueForKey:@"dictionaryRepresentation"];
    uint64_t v32 = [v28 dataWithPropertyList:v31 format:200 options:0 error:0];
    serializedAccessResourcePerWorkflowStateData = v10->_serializedAccessResourcePerWorkflowStateData;
    v10->_serializedAccessResourcePerWorkflowStateData = (NSData *)v32;

    id v34 = (void *)MEMORY[0x1E4F28F98];
    v35 = [v7 smartPromptPerWorkflowStates];
    v36 = [v35 allObjects];
    v37 = [v36 valueForKey:@"dictionaryRepresentation"];
    uint64_t v38 = [v34 dataWithPropertyList:v37 format:200 options:0 error:0];
    serializedSmartPromptsPerWorkflowStateData = v10->_serializedSmartPromptsPerWorkflowStateData;
    v10->_serializedSmartPromptsPerWorkflowStateData = (NSData *)v38;

    uint64_t v40 = [v7 creationDate];
    createdAt = v10->_createdAt;
    v10->_createdAt = (NSDate *)v40;

    uint64_t v42 = [v7 modificationDate];
    modifiedAt = v10->_modifiedAt;
    v10->_modifiedAt = (NSDate *)v42;

    uint64_t v44 = [v7 lastSavedOnDeviceName];
    lastSavedOnDeviceName = v10->_lastSavedOnDeviceName;
    v10->_lastSavedOnDeviceName = (NSString *)v44;

    v46 = [v7 quarantine];
    uint64_t v47 = [v46 serializedData];
    v48 = v10->_serializedQuarantineData;
    v10->_serializedQuarantineData = (NSData *)v47;

    v49 = [v7 cloudKitRecordMetadata];
    uint64_t v50 = [v49 copy];
    recordSystemFieldsData = v10->_recordSystemFieldsData;
    v10->_recordSystemFieldsData = (NSData *)v50;

    v10->_cachedSyncHash = [v7 syncHash];
    v10->_encryptedSchemaVersion = [v7 wantedEncryptedSchemaVersion];
    v52 = v10;
  }
  return v10;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  id v7 = (NSDate *)a3;
  id v8 = (NSDate *)a4;
  createdAt = self->_createdAt;
  self->_createdAt = v7;
  uint64_t v11 = v7;

  modifiedAt = self->_modifiedAt;
  self->_modifiedAt = v8;
}

@end
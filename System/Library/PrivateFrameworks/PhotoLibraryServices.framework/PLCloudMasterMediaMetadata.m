@interface PLCloudMasterMediaMetadata
+ (id)entityName;
- (id)payloadID;
- (id)payloadsForChangedKeys:(id)a3;
- (void)_addPayloadIfValidForAsset:(id)a3 changedKeys:(id)a4 toPayloads:(id)a5 modelProperties:(id)a6;
@end

@implementation PLCloudMasterMediaMetadata

+ (id)entityName
{
  return @"CloudMasterMediaMetadata";
}

- (id)payloadsForChangedKeys:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PLCloudMasterMediaMetadata *)self cloudMaster];

  if (v4)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v5 = self;
    v6 = [(PLCloudMasterMediaMetadata *)self cloudMaster];
    v7 = [v6 assets];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v13 = +[PLAssetJournalEntryPayload modelProperties];
          v14 = [v13 objectForKeyedSubscript:@"master"];
          v15 = [v14 subRelationshipProperties];
          v16 = [v15 objectForKeyedSubscript:@"mediaMetadata"];
          v17 = [v16 subRelationshipProperties];
          [(PLCloudMasterMediaMetadata *)v5 _addPayloadIfValidForAsset:v12 changedKeys:v31 toPayloads:v30 modelProperties:v17];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v18 = [(PLCloudMasterMediaMetadata *)self additionalAssetAttributes];

    if (v18)
    {
      v19 = [(PLCloudMasterMediaMetadata *)self additionalAssetAttributes];
      v20 = [v19 asset];

      v21 = +[PLAssetJournalEntryPayload modelProperties];
      v22 = [v21 objectForKeyedSubscript:@"additionalAttributes"];
      v23 = [v22 subRelationshipProperties];
      v24 = [v23 objectForKeyedSubscript:@"mediaMetadata"];
      v25 = [v24 subRelationshipProperties];
      [(PLCloudMasterMediaMetadata *)self _addPayloadIfValidForAsset:v20 changedKeys:v31 toPayloads:v30 modelProperties:v25];
    }
  }
  if ([v30 count]) {
    v26 = v30;
  }
  else {
    v26 = 0;
  }
  id v27 = v26;

  return v27;
}

- (void)_addPayloadIfValidForAsset:(id)a3 changedKeys:(id)a4 toPayloads:(id)a5 modelProperties:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 payloadID];
  if (v14)
  {
    if ([v10 isValidForJournalPersistence])
    {
      v15 = [[PLAssetJournalEntryPayload alloc] initWithCloudMasterMediaMetadata:self payloadID:v14 changedKeys:v11 modelProperties:v13];
      if (v15) {
        [v12 addObject:v15];
      }
LABEL_8:
    }
  }
  else if (v10)
  {
    PLMigrationGetLog();
    v15 = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
    {
      v16 = [v10 objectID];
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_19B3C7000, &v15->super.super, OS_LOG_TYPE_ERROR, "Skipping payload for CloudMasterMediaMetadata update with nil payloadID for existing object: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_8;
  }
}

- (id)payloadID
{
  v3 = [(PLCloudMasterMediaMetadata *)self cloudMaster];

  if (v3)
  {
    v4 = [(PLCloudMasterMediaMetadata *)self cloudMaster];
    v5 = [v4 cloudMasterGUID];
    v6 = +[PLJournalEntryPayloadIDFactory payloadIDWithString:v5];
LABEL_5:

    goto LABEL_6;
  }
  v7 = [(PLCloudMasterMediaMetadata *)self additionalAssetAttributes];

  if (v7)
  {
    v4 = [(PLCloudMasterMediaMetadata *)self additionalAssetAttributes];
    v5 = [v4 asset];
    uint64_t v8 = [v5 uuid];
    v6 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v8];

    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  return v6;
}

@end
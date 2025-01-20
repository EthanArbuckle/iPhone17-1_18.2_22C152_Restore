@interface PLEditedIPTCAttributes
+ (id)distinctValuesForKeyPath:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
+ (id)iptcKeyMap;
- (BOOL)supportsCloudUpload;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (void)clearEditedIPTCData;
- (void)setIPTCData:(id)a3;
- (void)willSave;
@end

@implementation PLEditedIPTCAttributes

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PLEditedIPTCAttributes *)self assetAttributes];
  v6 = [v5 asset];
  if ([v6 isValidForJournalPersistence]) {
    v7 = [[PLAssetJournalEntryPayload alloc] initWithEditedIPTCAttributes:self changedKeys:v4];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)payloadID
{
  v2 = [(PLEditedIPTCAttributes *)self assetAttributes];
  v3 = [v2 asset];
  id v4 = [v3 uuid];
  v5 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v4];

  return v5;
}

- (void)willSave
{
  v14.receiver = self;
  v14.super_class = (Class)PLEditedIPTCAttributes;
  [(PLManagedObject *)&v14 willSave];
  v3 = [(PLEditedIPTCAttributes *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PLEditedIPTCAttributes *)self assetAttributes];
    v5 = [v4 asset];
    char v6 = [v5 isDeleted];

    if ((v6 & 1) == 0)
    {
      v7 = [(PLEditedIPTCAttributes *)self assetAttributes];
      v8 = [v7 asset];
      v9 = [v8 changedValues];
      v10 = [v9 objectForKeyedSubscript:@"modificationDate"];

      if (!v10)
      {
        v11 = [(PLEditedIPTCAttributes *)self assetAttributes];
        v12 = [v11 asset];
        v13 = [MEMORY[0x1E4F1C9C8] date];
        [v12 setModificationDate:v13];
      }
    }
  }
}

- (void)clearEditedIPTCData
{
  v3 = +[PLEditedIPTCAttributes iptcKeyMap];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PLEditedIPTCAttributes_clearEditedIPTCData__block_invoke;
  v4[3] = &unk_1E58756D0;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  [(PLEditedIPTCAttributes *)self setData:0];
}

uint64_t __45__PLEditedIPTCAttributes_clearEditedIPTCData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:0 forKey:a3];
}

- (void)setIPTCData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v12];
  id v6 = v12;
  if (v6)
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Can't read iptc data, error: %@", buf, 0xCu);
    }
  }
  else
  {
    [(PLEditedIPTCAttributes *)self clearEditedIPTCData];
    v8 = +[PLEditedIPTCAttributes iptcKeyMap];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__PLEditedIPTCAttributes_setIPTCData___block_invoke;
    v9[3] = &unk_1E5875D30;
    id v10 = v8;
    v11 = self;
    v7 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    [(PLEditedIPTCAttributes *)self setData:v4];
  }
}

void __38__PLEditedIPTCAttributes_setIPTCData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v6)
  {
    [*(id *)(a1 + 40) setValue:v5 forKey:v6];
  }
  else
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Skipping iptc property %@, not supported", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)supportsCloudUpload
{
  v2 = [(PLEditedIPTCAttributes *)self assetAttributes];
  char v3 = [v2 supportsCloudUpload];

  return v3;
}

+ (id)distinctValuesForKeyPath:(id)a3 inManagedObjectContext:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x19F38D3B0]();
  int v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = +[PLEditedIPTCAttributes entityName];
  uint64_t v10 = [v8 fetchRequestWithEntityName:v9];

  v28[0] = v5;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v10 setPropertiesToFetch:v11];

  [v10 setReturnsDistinctResults:1];
  [v10 setResultType:2];
  id v26 = 0;
  id v12 = [v6 executeFetchRequest:v10 error:&v26];
  id v13 = v26;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKey:v5];
        if (v19) {
          [v7 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }

  return v7;
}

+ (id)entityName
{
  return @"EditedIPTCAttributes";
}

+ (id)iptcKeyMap
{
  if (iptcKeyMap_once != -1) {
    dispatch_once(&iptcKeyMap_once, &__block_literal_global_105913);
  }
  v2 = (void *)iptcKeyMap_iptcMap;
  return v2;
}

void __36__PLEditedIPTCAttributes_iptcKeyMap__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"caption", @"Caption/Abstract", @"byLine", @"Byline", @"copyrightNotice", @"CopyrightNotice", @"keywords", @"Keywords", @"urgency", @"Urgency", @"dateCreated", @"DateCreated", @"digitalCreationDate", @"DigitalCreationDate", @"digitalCreationTime", @"DigitalCreationTime", @"digitalSourceType",
    @"DigitalSourceType",
    @"expirationDate",
    @"ExpirationDate",
    @"expirationTime",
    @"ExpirationTime",
    @"referenceDate",
    @"ReferenceDate",
    @"releaseDate",
    @"ReleaseDate",
    @"releaseTime",
    @"ReleaseTime",
    @"timeCreated",
    @"TimeCreated",
    @"editStatus",
    @"EditStatus",
    @"contentLocationCode",
    @"ContentLocationCode",
    @"contentLocationName",
    @"ContentLocationName",
    @"countryPrimaryLocationCode",
    @"Country/PrimaryLocationCode",
    @"objectAttributeReference",
    @"ObjectAttributeReference",
    @"objectTypeReference",
    @"ObjectTypeReference",
    @"subjectReference",
    @"SubjectReference",
    @"subLocation",
    @"SubLocation",
    @"scene",
    @"Scene",
    @"creatorContactInfo",
    @"CreatorContactInfo",
    @"ciAdrCity",
    @"CiAdrCity",
    @"ciAdrCtry",
    @"CiAdrCtry",
    @"ciAdrExtadr",
    @"CiAdrExtadr",
    @"ciAdrPcode",
    @"CiAdrPcode",
    @"ciAdrRegion",
    @"CiAdrRegion",
  uint64_t v0 = @"ciEmailWork");
  v1 = (void *)iptcKeyMap_iptcMap;
  iptcKeyMap_iptcMap = v0;
}

@end
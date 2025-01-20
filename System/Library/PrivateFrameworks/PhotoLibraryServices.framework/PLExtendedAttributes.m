@interface PLExtendedAttributes
+ (id)distinctValuesForKeyPath:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
- (id)formattedCameraModel;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (void)correctOrientationIfRequired;
- (void)setGenerativeAIType:(id)a3;
- (void)willSave;
@end

@implementation PLExtendedAttributes

- (void)correctOrientationIfRequired
{
  v3 = [(PLExtendedAttributes *)self orientation];
  uint64_t v4 = [v3 shortValue];

  uint64_t v5 = +[PLManagedAsset correctedOrientation:v4];
  if (v5 != v4)
  {
    id v6 = [NSNumber numberWithShort:v5];
    [(PLExtendedAttributes *)self setOrientation:v6];
  }
}

- (void)willSave
{
  v13.receiver = self;
  v13.super_class = (Class)PLExtendedAttributes;
  [(PLManagedObject *)&v13 willSave];
  v3 = [(PLExtendedAttributes *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    uint64_t v4 = [(PLExtendedAttributes *)self asset];
    char v5 = [v4 isDeleted];

    if ((v5 & 1) == 0)
    {
      id v6 = [(PLExtendedAttributes *)self changedValues];
      v7 = [v6 objectForKeyedSubscript:@"orientation"];

      if (v7)
      {
        [(PLExtendedAttributes *)self correctOrientationIfRequired];
        v8 = [(PLExtendedAttributes *)self orientation];
        uint64_t v9 = [v8 shortValue];

        v10 = [(PLExtendedAttributes *)self asset];
        int v11 = [v10 originalOrientation];

        if (v11 != v9)
        {
          v12 = [(PLExtendedAttributes *)self asset];
          [v12 setOriginalOrientation:v9];
        }
      }
    }
  }
}

- (void)setGenerativeAIType:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PLExtendedAttributes_setGenerativeAIType___block_invoke;
  v3[3] = &unk_1E5870818;
  v3[4] = self;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"generativeAIType" valueDidChangeHandler:v3];
}

void __44__PLExtendedAttributes_setGenerativeAIType___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) asset];
  id v2 = [v1 additionalAttributes];

  [v2 updateAllowedForAnalysis];
}

- (id)formattedCameraModel
{
  v3 = (void *)MEMORY[0x1E4F8CC38];
  uint64_t v4 = [(PLExtendedAttributes *)self cameraModel];
  char v5 = [(PLExtendedAttributes *)self cameraMake];
  id v6 = [v3 formattedCameraModelFromCameraModel:v4 cameraMake:v5];

  return v6;
}

+ (id)distinctValuesForKeyPath:(id)a3 inManagedObjectContext:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x19F38D3B0]();
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = +[PLExtendedAttributes entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v28[0] = v5;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v10 setPropertiesToFetch:v11];

  [v10 setReturnsDistinctResults:1];
  [v10 setResultType:2];
  id v26 = 0;
  v12 = [v6 executeFetchRequest:v10 error:&v26];
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
  return @"ExtendedAttributes";
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(PLExtendedAttributes *)self asset];
  if ([v5 isValidForJournalPersistence]) {
    id v6 = [[PLAssetJournalEntryPayload alloc] initWithExtendedAttributes:self changedKeys:v4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)payloadID
{
  id v2 = [(PLExtendedAttributes *)self asset];
  v3 = [v2 uuid];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

@end
@interface VUISidebandSeriesMediaCollection
- (VUISidebandSeriesMediaCollection)initWithMediaLibrary:(id)a3 seriesManagedObject:(id)a4 requestedProperties:(id)a5;
- (VUITVSeriesManagedObject)seriesManagedObject;
- (id)HLSColorCapability;
- (id)canonicalID;
- (id)colorCapability;
- (id)isLocal;
- (id)seasonCount;
- (id)showIdentifier;
- (id)title;
- (void)setSeriesManagedObject:(id)a3;
@end

@implementation VUISidebandSeriesMediaCollection

- (VUISidebandSeriesMediaCollection)initWithMediaLibrary:(id)a3 seriesManagedObject:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"seriesManagedObject" format];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
LABEL_4:
  v11 = [VUISidebandMediaEntityIdentifier alloc];
  v12 = [v9 objectID];
  v13 = +[VUIMediaEntityType show];
  v14 = [(VUISidebandMediaEntityIdentifier *)v11 initWithManagedObjectID:v12 mediaEntityType:v13];

  v15 = VUISidebandSeriesMediaCollectionKind();
  v18.receiver = self;
  v18.super_class = (Class)VUISidebandSeriesMediaCollection;
  v16 = [(VUIMediaEntity *)&v18 initWithMediaLibrary:v8 identifier:v14 requestedProperties:v10 kind:v15];

  if (v16) {
    objc_storeStrong((id *)&v16->_seriesManagedObject, a4);
  }

  return v16;
}

- (id)canonicalID
{
  v2 = [(VUISidebandSeriesMediaCollection *)self seriesManagedObject];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  id v15 = 0;
  v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeriesMediaCollection_canonicalID__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeriesMediaCollection_canonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) canonicalID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)colorCapability
{
  return &unk_1F3F3E090;
}

- (id)HLSColorCapability
{
  return &unk_1F3F3E090;
}

- (id)isLocal
{
  uint64_t v2 = [(VUISidebandSeriesMediaCollection *)self seriesManagedObject];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  v14 = __Block_byref_object_dispose__37;
  id v15 = (id)MEMORY[0x1E4F1CC28];
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandSeriesMediaCollection_isLocal__block_invoke;
  v7[3] = &unk_1E6DF4130;
  id v4 = v2;
  id v8 = v4;
  id v9 = &v10;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandSeriesMediaCollection_isLocal__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "episodes", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) downloadState] == 2)
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
          id v8 = *(void **)(v7 + 40);
          *(void *)(v7 + 40) = MEMORY[0x1E4F1CC38];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)showIdentifier
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  uint64_t v14 = __Block_byref_object_dispose__37;
  id v15 = 0;
  uint64_t v2 = [(VUISidebandSeriesMediaCollection *)self seriesManagedObject];
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VUISidebandSeriesMediaCollection_showIdentifier__block_invoke;
  v7[3] = &unk_1E6DF4130;
  id v4 = v2;
  id v8 = v4;
  long long v9 = &v10;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __50__VUISidebandSeriesMediaCollection_showIdentifier__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) objectID];
  if (v7)
  {
    uint64_t v2 = [VUISidebandMediaEntityIdentifier alloc];
    uint64_t v3 = +[VUIMediaEntityType show];
    uint64_t v4 = [(VUISidebandMediaEntityIdentifier *)v2 initWithManagedObjectID:v7 mediaEntityType:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)title
{
  uint64_t v2 = [(VUISidebandSeriesMediaCollection *)self seriesManagedObject];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  uint64_t v14 = __Block_byref_object_dispose__37;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__VUISidebandSeriesMediaCollection_title__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  long long v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __41__VUISidebandSeriesMediaCollection_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)seasonCount
{
  uint64_t v2 = [(VUISidebandSeriesMediaCollection *)self seriesManagedObject];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__37;
  uint64_t v14 = __Block_byref_object_dispose__37;
  id v15 = &unk_1F3F3E0A8;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeriesMediaCollection_seasonCount__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  long long v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeriesMediaCollection_seasonCount__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [*(id *)(a1 + 32) seasons];
  uint64_t v3 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (VUITVSeriesManagedObject)seriesManagedObject
{
  return self->_seriesManagedObject;
}

- (void)setSeriesManagedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
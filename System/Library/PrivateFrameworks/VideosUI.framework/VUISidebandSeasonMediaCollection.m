@interface VUISidebandSeasonMediaCollection
- (VUISidebandSeasonMediaCollection)initWithMediaLibrary:(id)a3 seasonManagedObject:(id)a4 requestedProperties:(id)a5;
- (VUITVSeasonManagedObject)seasonManagedObject;
- (id)HLSColorCapability;
- (id)canonicalID;
- (id)colorCapability;
- (id)isLocal;
- (id)seasonNumber;
- (id)showIdentifier;
- (id)title;
- (void)setSeasonManagedObject:(id)a3;
@end

@implementation VUISidebandSeasonMediaCollection

- (VUISidebandSeasonMediaCollection)initWithMediaLibrary:(id)a3 seasonManagedObject:(id)a4 requestedProperties:(id)a5
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
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"seasonManagedObject" format];
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
  v13 = +[VUIMediaEntityType season];
  v14 = [(VUISidebandMediaEntityIdentifier *)v11 initWithManagedObjectID:v12 mediaEntityType:v13];

  v15 = VUISidebandSeasonMediaCollectionKind();
  v18.receiver = self;
  v18.super_class = (Class)VUISidebandSeasonMediaCollection;
  v16 = [(VUIMediaEntity *)&v18 initWithMediaLibrary:v8 identifier:v14 requestedProperties:v10 kind:v15];

  if (v16) {
    objc_storeStrong((id *)&v16->_seasonManagedObject, a4);
  }

  return v16;
}

- (id)canonicalID
{
  v2 = [(VUISidebandSeasonMediaCollection *)self seasonManagedObject];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VUISidebandSeasonMediaCollection_canonicalID__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  id v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __47__VUISidebandSeasonMediaCollection_canonicalID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) canonicalID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)colorCapability
{
  return &unk_1F3F3C8A8;
}

- (id)HLSColorCapability
{
  return &unk_1F3F3C8A8;
}

- (id)isLocal
{
  uint64_t v2 = [(VUISidebandSeasonMediaCollection *)self seasonManagedObject];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = (id)MEMORY[0x1E4F1CC28];
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VUISidebandSeasonMediaCollection_isLocal__block_invoke;
  v7[3] = &unk_1E6DF4130;
  id v4 = v2;
  id v8 = v4;
  id v9 = &v10;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __43__VUISidebandSeasonMediaCollection_isLocal__block_invoke(uint64_t a1)
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
  v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  uint64_t v2 = [(VUISidebandSeasonMediaCollection *)self seasonManagedObject];
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VUISidebandSeasonMediaCollection_showIdentifier__block_invoke;
  v7[3] = &unk_1E6DF4130;
  id v4 = v2;
  id v8 = v4;
  long long v9 = &v10;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __50__VUISidebandSeasonMediaCollection_showIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) series];
  id v8 = [v2 objectID];

  if (v8)
  {
    uint64_t v3 = [VUISidebandMediaEntityIdentifier alloc];
    id v4 = +[VUIMediaEntityType show];
    uint64_t v5 = [(VUISidebandMediaEntityIdentifier *)v3 initWithManagedObjectID:v8 mediaEntityType:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)seasonNumber
{
  uint64_t v2 = [(VUISidebandSeasonMediaCollection *)self seasonManagedObject];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VUISidebandSeasonMediaCollection_seasonNumber__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  long long v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __48__VUISidebandSeasonMediaCollection_seasonNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) seasonNumber];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)title
{
  uint64_t v2 = [(VUISidebandSeasonMediaCollection *)self seasonManagedObject];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  uint64_t v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__VUISidebandSeasonMediaCollection_title__block_invoke;
  v7[3] = &unk_1E6DF4B00;
  long long v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 performBlockAndWait:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __41__VUISidebandSeasonMediaCollection_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (VUITVSeasonManagedObject)seasonManagedObject
{
  return self->_seasonManagedObject;
}

- (void)setSeasonManagedObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
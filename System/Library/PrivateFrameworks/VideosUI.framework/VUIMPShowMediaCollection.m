@interface VUIMPShowMediaCollection
- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7;
- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5;
- (id)seasonCount;
@end

@implementation VUIMPShowMediaCollection

- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaItemCollection" format];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  if (!v9) {
    goto LABEL_7;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_8:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
LABEL_4:
  v11 = [v9 representativeItem];
  v12 = +[VUIMPMediaEntityIdentifier showIdentifierWithMediaItem:v11];
  if (v12)
  {
    v13 = VUIMPShowMediaCollectionKind();
    v17.receiver = self;
    v17.super_class = (Class)VUIMPShowMediaCollection;
    v14 = [(VUIMPMediaCollection *)&v17 initWithMediaLibrary:v8 mediaItemCollection:v9 identifier:v12 requestedProperties:v10 kind:v13];

    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VUIMPShowMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  id v10 = NSStringFromSelector(a2);
  [v8 raise:v9, @"The %@ initializer is not available.", v10 format];

  return 0;
}

- (id)seasonCount
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__VUIMPShowMediaCollection_seasonCount__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"seasonCount"];
  return v2;
}

id __39__VUIMPShowMediaCollection_seasonCount__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4 = [*(id *)(a1 + 32) mediaItemCollection];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = objc_msgSend(v4, "items", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:*(void *)(*((void *)&v16 + 1) + 8 * v9)];
          if (v10) {
            [v3 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v11 = [v3 count];
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 72);
    *(void *)(v13 + 72) = v12;

    v2 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
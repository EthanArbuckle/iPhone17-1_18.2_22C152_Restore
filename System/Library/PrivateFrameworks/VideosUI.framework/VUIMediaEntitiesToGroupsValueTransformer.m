@interface VUIMediaEntitiesToGroupsValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (BOOL)performDefaultSort;
- (NSString)identifierKeyPath;
- (NSString)sortIndexKeyPath;
- (VUIMediaEntitiesToGroupsValueTransformer)init;
- (VUIMediaEntitiesToGroupsValueTransformer)initWithIdentifierKeyPath:(id)a3;
- (id)groupsSortComparator;
- (id)transformedValue:(id)a3;
- (void)setGroupsSortComparator:(id)a3;
- (void)setIdentifierKeyPath:(id)a3;
- (void)setPerformDefaultSort:(BOOL)a3;
- (void)setSortIndexKeyPath:(id)a3;
@end

@implementation VUIMediaEntitiesToGroupsValueTransformer

- (VUIMediaEntitiesToGroupsValueTransformer)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntitiesToGroupsValueTransformer)initWithIdentifierKeyPath:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifierKeyPath" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntitiesToGroupsValueTransformer;
  v5 = [(VUIMediaEntitiesToGroupsValueTransformer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifierKeyPath = v5->_identifierKeyPath;
    v5->_identifierKeyPath = (NSString *)v6;
  }
  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22 = self;
  uint64_t v6 = [(VUIMediaEntitiesToGroupsValueTransformer *)self identifierKeyPath];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = [v11 valueForKeyPath:v6];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v12 conformsToProtocol:&unk_1F3F4EF20] & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v9 format:@"The group identifier for groups must be an NSObject which implements NSCopying"];
        }
        id v13 = v12;
        id v14 = [v5 objectForKey:v13];
        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v5 setObject:v14 forKey:v13];
        }
        [v14 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  v15 = [(VUIMediaEntitiesToGroupsValueTransformer *)v22 sortIndexKeyPath];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__27;
  v31 = __Block_byref_object_dispose__27;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke;
  v24[3] = &unk_1E6DFB388;
  id v16 = v15;
  id v25 = v16;
  v26 = &v27;
  [v5 enumerateKeysAndObjectsUsingBlock:v24];
  v17 = [(VUIMediaEntitiesToGroupsValueTransformer *)v22 groupsSortComparator];
  if (v17) {
    goto LABEL_14;
  }
  if ([(VUIMediaEntitiesToGroupsValueTransformer *)v22 performDefaultSort])
  {
    v19 = [(id)v28[5] firstObject];
    v20 = [v19 identifier];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = &__block_literal_global_128;
LABEL_20:

LABEL_14:
      id v18 = [(id)v28[5] sortedArrayUsingComparator:v17];

      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = &__block_literal_global_23_0;
      goto LABEL_20;
    }
  }
  id v18 = (id)v28[5];
LABEL_23:

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  uint64_t v6 = [[VUIMediaEntityGroup alloc] initWithIdentifier:v5];

  [(VUIMediaEntityGroup *)v6 setMediaEntities:v8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v8);
    [(VUIMediaEntityGroup *)v6 setSortIndexes:v7];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
}

uint64_t __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [MEMORY[0x1E4FB3D28] ascendingTitleSortComparator];
  uint64_t v8 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v5, v6);

  return v8;
}

uint64_t __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)identifierKeyPath
{
  return self->_identifierKeyPath;
}

- (void)setIdentifierKeyPath:(id)a3
{
}

- (NSString)sortIndexKeyPath
{
  return self->_sortIndexKeyPath;
}

- (void)setSortIndexKeyPath:(id)a3
{
}

- (id)groupsSortComparator
{
  return self->_groupsSortComparator;
}

- (void)setGroupsSortComparator:(id)a3
{
}

- (BOOL)performDefaultSort
{
  return self->_performDefaultSort;
}

- (void)setPerformDefaultSort:(BOOL)a3
{
  self->_performDefaultSort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupsSortComparator, 0);
  objc_storeStrong((id *)&self->_sortIndexKeyPath, 0);
  objc_storeStrong((id *)&self->_identifierKeyPath, 0);
}

@end
@interface VUIMediaCategory
+ (id)mediaCatgeoryForType:(unint64_t)a3;
- (NSDictionary)supportedChildMediaCollectionTypes;
- (NSSet)supportedMediaCollectionTypes;
- (VUIMediaCategory)init;
- (id)_initWithType:(unint64_t)a3;
- (id)description;
- (unint64_t)type;
- (void)setSupportedChildMediaCollectionTypes:(id)a3;
- (void)setSupportedMediaCollectionTypes:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation VUIMediaCategory

+ (id)mediaCatgeoryForType:(unint64_t)a3
{
  if (mediaCatgeoryForType____onceToken != -1) {
    dispatch_once(&mediaCatgeoryForType____onceToken, &__block_literal_global_56);
  }
  v4 = (void *)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType;
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = VUIMediaCategoryTypeLogString(a3);
    [v7 raise:v8, @"Unexpected mediaCategoryType parameter: %@", v9 format];
  }
  return v6;
}

void __41__VUIMediaCategory_mediaCatgeoryForType___block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType;
  mediaCatgeoryForType____mediaCategoriesByMediaCategoryType = (uint64_t)v0;

  id v2 = [[VUIMediaCategory alloc] _initWithType:0];
  [(id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType setObject:v2 forKey:&unk_1F3F3C950];
  id v3 = [[VUIMediaCategory alloc] _initWithType:2];
  [(id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType setObject:v3 forKey:&unk_1F3F3C968];
  id v4 = [[VUIMediaCategory alloc] _initWithType:1];
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3C968, &unk_1F3F3C980, 0);
  [v4 setSupportedMediaCollectionTypes:v5];
  uint64_t v8 = &unk_1F3F3C968;
  v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3C980, 0);
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v4 setSupportedChildMediaCollectionTypes:v7];
  [(id)mediaCatgeoryForType____mediaCategoriesByMediaCategoryType setObject:v4 forKey:&unk_1F3F3C980];
}

- (VUIMediaCategory)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (id)_initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VUIMediaCategory;
  uint64_t v4 = [(VUIMediaCategory *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    supportedMediaCollectionTypes = v5->_supportedMediaCollectionTypes;
    v5->_supportedMediaCollectionTypes = (NSSet *)v6;

    supportedChildMediaCollectionTypes = v5->_supportedChildMediaCollectionTypes;
    v5->_supportedChildMediaCollectionTypes = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23.receiver = self;
  v23.super_class = (Class)VUIMediaCategory;
  uint64_t v4 = [(VUIMediaCategory *)&v23 description];
  [v3 addObject:v4];

  v5 = NSString;
  uint64_t v6 = VUIMediaCategoryTypeLogString([(VUIMediaCategory *)self type]);
  v7 = [v5 stringWithFormat:@"%@=%@", @"type", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  v9 = [(VUIMediaCategory *)self supportedMediaCollectionTypes];
  objc_super v10 = [v9 allObjects];
  v11 = VUIMediaCollectionTypesLogString(v10);
  v12 = [v8 stringWithFormat:@"%@=%@", @"supportedMediaCollectionTypes", v11];
  [v3 addObject:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = [(VUIMediaCategory *)self supportedChildMediaCollectionTypes];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __31__VUIMediaCategory_description__block_invoke;
  v21[3] = &unk_1E6DF6D38;
  id v22 = v13;
  id v15 = v13;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];

  v16 = [NSString stringWithFormat:@"%@=%@", @"supportedChildMediaCollectionTypes", v15];
  [v3 addObject:v16];

  v17 = NSString;
  v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

void __31__VUIMediaCategory_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  VUIMediaCollectionTypeLogString([a2 unsignedIntegerValue]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 allObjects];

  v7 = VUIMediaCollectionTypesLogString(v6);

  [*(id *)(a1 + 32) setObject:v7 forKey:v8];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSSet)supportedMediaCollectionTypes
{
  return self->_supportedMediaCollectionTypes;
}

- (void)setSupportedMediaCollectionTypes:(id)a3
{
}

- (NSDictionary)supportedChildMediaCollectionTypes
{
  return self->_supportedChildMediaCollectionTypes;
}

- (void)setSupportedChildMediaCollectionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChildMediaCollectionTypes, 0);
  objc_storeStrong((id *)&self->_supportedMediaCollectionTypes, 0);
}

@end
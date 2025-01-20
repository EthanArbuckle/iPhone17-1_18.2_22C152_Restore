@interface ML3ExportItem
+ (unsigned)allExportPropertyKeysForEntityClass:(Class)a3 returnedCount:(unsigned int *)a4;
- (BOOL)hasValueForProperty:(unsigned int)a3;
- (BOOL)isValid;
- (Class)entityClass;
- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 library:(id)a5;
- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 propertyKeysToExport:(unsigned int *)a5 numKeys:(unsigned int)a6 library:(id)a7;
- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(id)a4 properties:(id)a5 library:(id)a6;
- (ML3MusicLibrary)library;
- (char)charValueForProperty:(unsigned int)a3;
- (id)_allExportPropertyNames;
- (id)_propertyNameForKey:(unsigned int)a3;
- (id)_propertyNamesFromKeys:(unsigned int *)a3 numKeys:(unsigned int)a4;
- (id)description;
- (id)exportData;
- (id)stringValueForProperty:(unsigned int)a3;
- (id)valueForProperty:(unsigned int)a3;
- (int)longValueForProperty:(unsigned int)a3;
- (int64_t)longlongValueForProperty:(unsigned int)a3;
- (int64_t)persistentId;
- (signed)shortValueForProperty:(unsigned int)a3;
- (unsigned)propertyKeysToExport:(unsigned int *)a3;
@end

@implementation ML3ExportItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (id)_allExportPropertyNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ML3ExportItem__allExportPropertyNames__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  if (_allExportPropertyNames___once != -1) {
    dispatch_once(&_allExportPropertyNames___once, block);
  }
  v3 = (void *)_allExportPropertyNames___allExportPropertyNames;
  v4 = NSStringFromClass(self->_entityClass);
  v5 = [v3 objectForKey:v4];

  return v5;
}

void __40__ML3ExportItem__allExportPropertyNames__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v3 = (void *)_allExportPropertyNames___allExportPropertyNames;
  _allExportPropertyNames___allExportPropertyNames = v2;

  unsigned int v16 = 0;
  v4 = +[ML3ExportItem allExportPropertyKeysForEntityClass:objc_opt_class() returnedCount:&v16];
  v5 = [*(id *)(a1 + 32) _propertyNamesFromKeys:v4 numKeys:v16];
  v6 = (void *)[v5 mutableCopy];

  v7 = (void *)_allExportPropertyNames___allExportPropertyNames;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 setObject:v6 forKey:v9];

  v10 = +[ML3ExportItem allExportPropertyKeysForEntityClass:objc_opt_class() returnedCount:&v16];
  v11 = [*(id *)(a1 + 32) _propertyNamesFromKeys:v10 numKeys:v16];
  v12 = (void *)[v11 mutableCopy];

  v13 = (void *)_allExportPropertyNames___allExportPropertyNames;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v13 setObject:v12 forKey:v15];
}

- (id)_propertyNamesFromKeys:(unsigned int *)a3 numKeys:(unsigned int)a4
{
  if (a3)
  {
    v6 = a3;
    uint64_t v7 = a4;
    v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
    if (a4)
    {
      do
      {
        unsigned int v9 = *v6++;
        v10 = [(ML3ExportItem *)self _propertyNameForKey:v9];
        if (v10) {
          [v8 addObject:v10];
        }

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    v8 = [(ML3ExportItem *)self _allExportPropertyNames];
  }

  return v8;
}

- (id)_propertyNameForKey:(unsigned int)a3
{
  if ((int)a3 <= 184549396)
  {
    switch(a3)
    {
      case 0xA00000Fu:
        v3 = @"album_pid";
        goto LABEL_26;
      case 0xA000010u:
        v3 = @"item_artist_pid";
        goto LABEL_26;
      case 0xA000011u:
        v3 = @"album_artist_pid";
        goto LABEL_26;
      case 0xA000012u:
        v3 = @"composer_pid";
        goto LABEL_26;
      case 0xA000013u:
        v3 = @"genre_id";
        goto LABEL_26;
      case 0xA000014u:
      case 0xA000015u:
      case 0xA000016u:
      case 0xA000017u:
      case 0xA000018u:
        goto LABEL_30;
      case 0xA000019u:
        v3 = @"album.user_rating";
        goto LABEL_26;
      default:
        switch(a3)
        {
          case 0xB000001u:
          case 0xB000002u:
            v3 = @"container_pid";
            goto LABEL_26;
          case 0xB000003u:
            v3 = @"distinguished_kind";
            goto LABEL_26;
          case 0xB000008u:
            v3 = @"name";
            goto LABEL_26;
          default:
            goto LABEL_30;
        }
    }
  }
  if ((int)a3 > 184549408)
  {
    switch(a3)
    {
      case 0xB000021u:
        v3 = @"play_order";
        goto LABEL_26;
      case 0xB000022u:
        v3 = @"is_reversed";
        goto LABEL_26;
      case 0xB000038u:
        v3 = 0;
        goto LABEL_27;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xB000015u:
        v3 = @"smart_is_folder";
        goto LABEL_26;
      case 0xB000018u:
        v3 = @"smart_is_genius";
        goto LABEL_26;
      case 0xB000020u:
        v3 = @"store_cloud_id";
LABEL_26:
        v4 = v3;
        goto LABEL_27;
    }
  }
LABEL_30:
  ML3TrackRulesGetPropertyNameForKey(HIBYTE(a3), *(uint64_t *)&a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v3;
}

- (id)exportData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_properties requiringSecureCoding:1 error:0];
}

- (unsigned)propertyKeysToExport:(unsigned int *)a3
{
  return +[ML3ExportItem allExportPropertyKeysForEntityClass:self->_entityClass returnedCount:a3];
}

- (BOOL)isValid
{
  return [(NSDictionary *)self->_properties count] != 0;
}

- (BOOL)hasValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)stringValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 stringValue];
  }
  v5 = v4;

  return v5;
}

- (int64_t)longlongValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int)longValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  int v4 = [v3 intValue];

  return v4;
}

- (signed)shortValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  signed __int16 v4 = [v3 shortValue];

  return v4;
}

- (char)charValueForProperty:(unsigned int)a3
{
  v3 = [(ML3ExportItem *)self valueForProperty:*(void *)&a3];
  char v4 = [v3 charValue];

  return v4;
}

- (id)valueForProperty:(unsigned int)a3
{
  properties = self->_properties;
  char v4 = [(ML3ExportItem *)self _propertyNameForKey:*(void *)&a3];
  v5 = [(NSDictionary *)properties valueForKey:v4];

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: pid=%lld>: %@", objc_opt_class(), self->_persistentId, self->_properties];
}

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(id)a4 properties:(id)a5 library:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ML3ExportItem;
  v14 = [(ML3ExportItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityClass, a4);
    v15->_persistentId = a3;
    objc_storeStrong((id *)&v15->_properties, a5);
    objc_storeStrong((id *)&v15->_library, a6);
  }

  return v15;
}

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 propertyKeysToExport:(unsigned int *)a5 numKeys:(unsigned int)a6 library:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a7;
  objc_storeStrong((id *)&self->_entityClass, a4);
  objc_storeStrong((id *)&self->_library, a7);
  v14 = [(ML3ExportItem *)self _propertyNamesFromKeys:a5 numKeys:v8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7520;
  v30 = __Block_byref_object_dispose__7521;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  v15 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:a3];
  unsigned int v16 = [(objc_class *)a4 queryWithLibrary:v13 predicate:v15];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __87__ML3ExportItem_initWithPersistentId_entityClass_propertyKeysToExport_numKeys_library___block_invoke;
  v23 = &unk_1E5FB4788;
  v25 = &v26;
  id v17 = v14;
  id v24 = v17;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:&v20];

  v18 = -[ML3ExportItem initWithPersistentId:entityClass:properties:library:](self, "initWithPersistentId:entityClass:properties:library:", a3, a4, v27[5], v13, v20, v21, v22, v23);
  _Block_object_dispose(&v26, 8);

  return v18;
}

unint64_t __87__ML3ExportItem_initWithPersistentId_entityClass_propertyKeysToExport_numKeys_library___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v6 = [NSNumber numberWithLongLong:a2];
  [v5 setObject:v6 forKey:@"ROWID"];

  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v9 = *(void *)(a3 + 8 * i);
      if (v9)
      {
        v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
        [v10 setObject:v9 forKey:v11];
      }
      unint64_t result = [*(id *)(a1 + 32) count];
    }
  }
  return result;
}

- (ML3ExportItem)initWithPersistentId:(int64_t)a3 entityClass:(Class)a4 library:(id)a5
{
  return [(ML3ExportItem *)self initWithPersistentId:a3 entityClass:a4 propertyKeysToExport:0 numKeys:0 library:a5];
}

+ (unsigned)allExportPropertyKeysForEntityClass:(Class)a3 returnedCount:(unsigned int *)a4
{
  *a4 = 0;
  if ((Class)objc_opt_class() == a3)
  {
    unint64_t result = (unsigned int *)&ML3ExportItemAllTrackPropertyKeys;
    unsigned int v7 = 136;
  }
  else
  {
    if ((Class)objc_opt_class() != a3) {
      return 0;
    }
    unint64_t result = (unsigned int *)&ML3ExportItemAllPlaylistPropertyKeys;
    unsigned int v7 = 7;
  }
  *a4 = v7;
  return result;
}

@end
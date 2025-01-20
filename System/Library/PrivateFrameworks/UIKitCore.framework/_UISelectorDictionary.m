@interface _UISelectorDictionary
- (BOOL)isEqual:(id)a3;
- (NSArray)allObjects;
- (_UISelectorDictionary)init;
- (_UISelectorDictionary)initWithMap:(id)a3;
- (_UISelectorDictionary)initWithMapping:(id)a3 objects:(id)a4;
- (_UISelectorSet)allSelectors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForSelector:(SEL)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateSelectorsAndObjectsUsingBlock:(id)a3;
- (void)removeObjectForSelector:(SEL)a3;
- (void)removeObjectsForSelectors:(id)a3;
- (void)setObject:(id)a3 forSelector:(SEL)a4;
@end

@implementation _UISelectorDictionary

- (_UISelectorDictionary)initWithMapping:(id)a3 objects:(id)a4
{
  v6 = (uint64_t (**)(id, void *))a3;
  id v7 = a4;
  v8 = [(_UISelectorDictionary *)self init];
  if (v8)
  {
    v16 = (id *)&v17;
    id v9 = v7;
    if (v9)
    {
      v10 = v9;
      do
      {
        map = v8->_map;
        v12 = (const void *)v6[2](v6, v10);
        NSMapInsert(map, v12, v10);
        v13 = v16++;
        id v14 = *v13;

        v10 = v14;
      }
      while (v14);
    }
  }

  return v8;
}

- (_UISelectorDictionary)init
{
  if (!_MergedGlobals_1034)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:256];
    v4 = (void *)_MergedGlobals_1034;
    _MergedGlobals_1034 = v3;

    [(id)_MergedGlobals_1034 setDescriptionFunction:selectorDescription];
  }
  if (!qword_1EB260498)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    v6 = (void *)qword_1EB260498;
    qword_1EB260498 = v5;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28E10]);
  v8 = (void *)[v7 initWithKeyPointerFunctions:_MergedGlobals_1034 valuePointerFunctions:qword_1EB260498 capacity:0];
  id v9 = [(_UISelectorDictionary *)self initWithMap:v8];

  return v9;
}

- (_UISelectorDictionary)initWithMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISelectorDictionary;
  v6 = [(_UISelectorDictionary *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_map, a3);
  }

  return v7;
}

- (id)objectForSelector:(SEL)a3
{
  return NSMapGet(self->_map, a3);
}

- (void)setObject:(id)a3 forSelector:(SEL)a4
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [_UISelectorDictionary alloc];
  v6 = (void *)[(NSMapTable *)self->_map copyWithZone:a3];
  id v7 = [(_UISelectorDictionary *)v5 initWithMap:v6];

  return v7;
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_map count];
}

- (_UISelectorSet)allSelectors
{
  uint64_t v3 = objc_alloc_init(_UISelectorSet);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37___UISelectorDictionary_allSelectors__block_invoke;
  v6[3] = &unk_1E52ED138;
  v4 = v3;
  id v7 = v4;
  [(_UISelectorDictionary *)self enumerateSelectorsAndObjectsUsingBlock:v6];

  return v4;
}

- (NSArray)allObjects
{
  return NSAllMapTableValues(self->_map);
}

- (void)removeObjectForSelector:(SEL)a3
{
}

- (void)addEntriesFromDictionary:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___UISelectorDictionary_addEntriesFromDictionary___block_invoke;
  v3[3] = &unk_1E52ED138;
  v3[4] = self;
  [a3 enumerateSelectorsAndObjectsUsingBlock:v3];
}

- (void)removeObjectsForSelectors:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51___UISelectorDictionary_removeObjectsForSelectors___block_invoke;
  v3[3] = &unk_1E52ED160;
  v3[4] = self;
  [a3 enumerateSelectorsUsingBlock:v3];
}

- (void)enumerateSelectorsAndObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  key = 0;
  value = 0;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_map);
  do
  {
    if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
      break;
    }
    char v5 = 0;
    v4[2](v4, key, value, &v5);
  }
  while (!v5);
  NSEndMapTableEnumeration(&enumerator);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSMapTable **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && NSCompareMapTables(self->_map, v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return [(NSMapTable *)self->_map hash];
}

- (id)description
{
  return (id)[(NSMapTable *)self->_map description];
}

- (void).cxx_destruct
{
}

@end
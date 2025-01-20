@interface _NTKDCollectionManifest
+ (id)emptyManifest;
- (BOOL)_containsUUID:(id)a3;
- (BOOL)addUUID:(id)a3 withFaceStyle:(int64_t)a4;
- (BOOL)removeUUID:(id)a3;
- (BOOL)updateOrderWithUUIDs:(id)a3;
- (_NTKDCollectionManifest)init;
- (_NTKDCollectionManifest)initWithContentsOfFile:(id)a3;
- (id)description;
- (id)orderedUUIDs;
- (int64_t)faceStyleForUUID:(id)a3;
- (void)_getUUID:(id *)a3 boxedStyle:(id *)a4 fromEntry:(id)a5;
- (void)removeAllUUIDs;
- (void)writeToFile:(id)a3 atomically:(BOOL)a4;
@end

@implementation _NTKDCollectionManifest

+ (id)emptyManifest
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (_NTKDCollectionManifest)init
{
  v8.receiver = self;
  v8.super_class = (Class)_NTKDCollectionManifest;
  id v2 = [(_NTKDCollectionManifest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    orderedUUIDs = v2->_orderedUUIDs;
    v2->_orderedUUIDs = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    boxedStylesByUUID = v2->_boxedStylesByUUID;
    v2->_boxedStylesByUUID = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = +[NSMutableString stringWithString:@"CollectionManifest["];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_orderedUUIDs;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        v10 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:v9];
        v11 = v10;
        if (v10)
        {
          [v10 integerValue];
          if ((v6 & 1) == 0) {
            goto LABEL_9;
          }
LABEL_8:
          [v3 appendString:@", "];
          goto LABEL_9;
        }
        if (v6) {
          goto LABEL_8;
        }
LABEL_9:
        v12 = [v9 UUIDString];
        v13 = NTKFaceStyleDescription();
        [v3 appendFormat:@"(%@:%@)", v12, v13];

        objc_super v8 = (char *)v8 + 1;
        char v6 = 1;
      }
      while (v5 != v8);
      id v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v5 = v14;
    }
    while (v14);
  }

  [v3 appendString:@"]"];

  return v3;
}

- (id)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (int64_t)faceStyleForUUID:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (BOOL)addUUID:(id)a3 withFaceStyle:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:v6];

  if (!v7)
  {
    boxedStylesByUUID = self->_boxedStylesByUUID;
    v9 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)boxedStylesByUUID setObject:v9 forKey:v6];
  }
  if (([(NSMutableArray *)self->_orderedUUIDs containsObject:v6] & 1) == 0) {
    [(NSMutableArray *)self->_orderedUUIDs addObject:v6];
  }

  return v7 == 0;
}

- (BOOL)removeUUID:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:v4];

  if (v5) {
    [(NSMutableDictionary *)self->_boxedStylesByUUID removeObjectForKey:v4];
  }
  [(NSMutableArray *)self->_orderedUUIDs removeObject:v4];

  return v5 != 0;
}

- (BOOL)updateOrderWithUUIDs:(id)a3
{
  uint64_t v3 = self;
  orderedUUIDs = self->_orderedUUIDs;
  id v5 = a3;
  id v6 = [(NSMutableArray *)orderedUUIDs copy];
  id v7 = [(NSMutableArray *)v3->_orderedUUIDs mutableCopy];
  [v7 removeObjectsInArray:v5];
  [(NSMutableArray *)v3->_orderedUUIDs removeAllObjects];
  [(NSMutableArray *)v3->_orderedUUIDs addObjectsFromArray:v5];

  [(NSMutableArray *)v3->_orderedUUIDs addObjectsFromArray:v7];
  LOBYTE(v3) = [v6 isEqualToArray:v3->_orderedUUIDs] ^ 1;

  return (char)v3;
}

- (void)removeAllUUIDs
{
  [(NSMutableArray *)self->_orderedUUIDs removeAllObjects];
  boxedStylesByUUID = self->_boxedStylesByUUID;

  [(NSMutableDictionary *)boxedStylesByUUID removeAllObjects];
}

- (_NTKDCollectionManifest)initWithContentsOfFile:(id)a3
{
  id v4 = a3;
  id v5 = [(_NTKDCollectionManifest *)self init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSArray) initWithContentsOfFile:v4];
    if (v6)
    {
      objc_opt_class();
      NTKValidateArray();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
          id v15 = 0;
          id v16 = 0;
          [(_NTKDCollectionManifest *)v5 _getUUID:&v16 boxedStyle:&v15 fromEntry:v11];
          id v12 = v16;
          id v13 = v15;
          [(NSMutableArray *)v5->_orderedUUIDs addObject:v12];
          if (v13) {
            [(NSMutableDictionary *)v5->_boxedStylesByUUID setObject:v13 forKey:v12];
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (void)writeToFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v15 = a4;
  id v14 = a3;
  id v5 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_orderedUUIDs;
  id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        uint64_t v11 = +[NSMutableDictionary dictionary];
        id v12 = [v10 UUIDString];
        [v11 setObject:v12 forKey:@"uuid"];

        id v13 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:v10];
        if (v13) {
          [v11 setObject:v13 forKey:@"style"];
        }
        [v5 addObject:v11];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [v5 writeToFile:v14 atomically:v15];
}

- (BOOL)_containsUUID:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_boxedStylesByUUID objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_getUUID:(id *)a3 boxedStyle:(id *)a4 fromEntry:(id)a5
{
  id v12 = a5;
  id v7 = [v12 objectForKey:@"uuid"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[NSException raise:NSInvalidUnarchiveOperationException, @"expected a string for key '%@' (instead found %@)", @"uuid", objc_opt_class() format];
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
  if (!v8) {
    +[NSException raise:NSInvalidUnarchiveOperationException, @"could not generate UUID from string: %@", v7 format];
  }
  uint64_t v9 = [v12 objectForKey:@"style"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      +[NSException raise:NSInvalidUnarchiveOperationException, @"expected a number for key '%@' (instead found %@)", @"style", objc_opt_class() format];
    }
  }
  id v10 = v8;
  *a3 = v10;
  id v11 = v9;
  *a4 = v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxedStylesByUUID, 0);

  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
}

@end
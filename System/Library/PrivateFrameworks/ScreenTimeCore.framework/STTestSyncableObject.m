@interface STTestSyncableObject
+ (NSString)serializableClassName;
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STTestSyncableObject

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"identifier"]) {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  v5.receiver = self;
  v5.super_class = (Class)STTestSyncableObject;
  [(STTestSyncableObject *)&v5 didChangeValueForKey:v4];
}

- (id)computeUniqueIdentifier
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() serializableClassName];
  objc_super v5 = [(STTestSyncableObject *)self identifier];
  v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(STTestSyncableObject *)self subobjects];
  objc_super v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(STTestSyncableObject *)self subobjects];
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v25[0] = @"identifier";
        v11 = [v10 identifier];
        v25[1] = @"active";
        v26[0] = v11;
        v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "active"));
        v26[1] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
        [v5 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  v20.receiver = self;
  v20.super_class = (Class)STTestSyncableObject;
  v14 = [(STUniquedManagedObject *)&v20 dictionaryRepresentation];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[STTestSyncableObject enabled](self, "enabled"));
  [v14 setObject:v15 forKeyedSubscript:@"enabled"];

  v16 = [(STTestSyncableObject *)self identifier];
  [v14 setObject:v16 forKeyedSubscript:@"identifier"];

  [v14 setObject:v5 forKeyedSubscript:@"subobjects"];
  v17 = (void *)[v14 copy];

  return v17;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"enabled"];
  long long v23 = self;
  -[STTestSyncableObject setEnabled:](self, "setEnabled:", [v5 BOOLValue]);

  [v4 objectForKeyedSubscript:@"subobjects"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v21 = v4;
    id v8 = 0;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      v10 = v8;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        v12 = [v11 objectForKeyedSubscript:@"identifier"];
        v13 = [v11 objectForKeyedSubscript:@"active"];
        uint64_t v14 = [v13 BOOLValue];

        v15 = +[STTestSyncableSubObject fetchRequest];
        v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v12];
        [v15 setPredicate:v16];

        id v25 = v10;
        v17 = [v15 execute:&v25];
        id v8 = v25;

        v18 = [v17 firstObject];
        v19 = v18;
        if (v18)
        {
          [v18 setActive:v14];
          [v19 setRoot:v23];
        }

        ++v9;
        v10 = v8;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);

    id v4 = v21;
  }

  return 1;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"identifier"];
  v10 = [a1 fetchRequest];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v9];
  [v10 setPredicate:v11];

  v12 = [v10 execute:a5];
  if (v12)
  {
    long long v26 = v10;
    long long v27 = v9;
    id v25 = v12;
    id v29 = [v12 firstObject];
    if (!v29)
    {
      v13 = [[STTestSyncableObject alloc] initWithContext:v30];
      uint64_t v14 = [v8 objectForKeyedSubscript:@"identifier"];
      id v29 = v13;
      [(STTestSyncableObject *)v13 setIdentifier:v14];
    }
    id v28 = v8;
    [v8 objectForKeyedSubscript:@"subobjects"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = [*(id *)(*((void *)&v32 + 1) + 8 * i) objectForKeyedSubscript:@"identifier"];
          objc_super v20 = +[STTestSyncableSubObject fetchRequest];
          id v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v19];
          [v20 setPredicate:v21];

          long long v22 = [v20 execute:a5];
          long long v23 = [v22 firstObject];
          if (!v23)
          {
            long long v23 = [[STTestSyncableSubObject alloc] initWithContext:v30];
            [(STTestSyncableSubObject *)v23 setIdentifier:v19];
            [(STTestSyncableSubObject *)v23 setRoot:v29];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    uint64_t v9 = v27;
    id v8 = v28;
    v12 = v25;
    v10 = v26;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"test";
}

@end
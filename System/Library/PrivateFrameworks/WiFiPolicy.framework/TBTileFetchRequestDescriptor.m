@interface TBTileFetchRequestDescriptor
- (Class)remoteRequestClass;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)tileItems;
- (PBCodable)remoteRequest;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3;
- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3 maxCacheAge:(id)a4;
- (id)_preferLocalCacheFetchRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setTileItems:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBTileFetchRequestDescriptor

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3
{
  return [(TBTileFetchRequestDescriptor *)self initWithTileItems:a3 maxCacheAge:0];
}

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3 maxCacheAge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TBTileFetchRequestDescriptor;
  v9 = [(TBTileFetchRequestDescriptor *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tileItems, a3);
    objc_storeStrong((id *)&v10->_maxCacheAge, a4);
    v10->_type = 3;
    id v11 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    v12 = +[TBTileMO entityName];
    v13 = (void *)[v11 initWithEntityName:v12];

    v14 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v13];
    localFetchDescriptor = v10->_localFetchDescriptor;
    v10->_localFetchDescriptor = v14;

    v16 = [(TBTileFetchRequestDescriptor *)v10 localFetchPredicate];
    [v13 setPredicate:v16];

    v17 = [TBLocalFetchRequestDescriptor alloc];
    v18 = [(TBTileFetchRequestDescriptor *)v10 _preferLocalCacheFetchRequest];
    uint64_t v19 = [(TBLocalFetchRequestDescriptor *)v17 initWithFetchRequest:v18];
    preferLocalFetchDescriptor = v10->_preferLocalFetchDescriptor;
    v10->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v19;
  }
  return v10;
}

- (NSPredicate)localFetchPredicate
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (!self->_localFetchPredicate)
  {
    v3 = [(TBTileFetchRequestDescriptor *)self tileItems];

    if (v3)
    {
      v4 = [(TBTileFetchRequestDescriptor *)self tileItems];
      v5 = [v4 tilePredicate];

      v6 = [(TBTileFetchRequestDescriptor *)self maxCacheAge];

      if (v6)
      {
        id v7 = (void *)MEMORY[0x1E4F28BA0];
        id v8 = (void *)MEMORY[0x1E4F28F60];
        v9 = [(TBTileFetchRequestDescriptor *)self maxCacheAge];
        v10 = [v8 predicateWithFormat:@"created >= %@", v9];
        v16[0] = v10;
        v16[1] = v5;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
        uint64_t v12 = [v7 andPredicateWithSubpredicates:v11];

        v5 = (NSPredicate *)v12;
      }
      localFetchPredicate = self->_localFetchPredicate;
      self->_localFetchPredicate = v5;
    }
  }
  v14 = self->_localFetchPredicate;

  return v14;
}

- (id)_preferLocalCacheFetchRequest
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[TBTileMO entityName];
  v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = [(TBTileFetchRequestDescriptor *)self tileItems];
  id v7 = [v6 tilePredicate];

  id v8 = [(TBTileFetchRequestDescriptor *)self maxCacheAge];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28BA0];
    v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = [(TBTileFetchRequestDescriptor *)self maxCacheAge];
    uint64_t v12 = [v10 predicateWithFormat:@"created > %@", v11];
    v16[0] = v12;
    v16[1] = v7;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v14 = [v9 andPredicateWithSubpredicates:v13];
    [v5 setPredicate:v14];
  }
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_1F2B952F0];

  return v5;
}

- (PBCodable)remoteRequest
{
  return 0;
}

- (Class)remoteRequestClass
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(TBTileFetchRequestDescriptor *)self tileItems];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTileItems:v7];

  objc_msgSend(v5, "setType:", -[TBTileFetchRequestDescriptor type](self, "type"));
  id v8 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  v9 = +[TBTileMO entityName];
  v10 = (void *)[v8 initWithEntityName:v9];

  id v11 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v10];
  [v5 setLocalFetchDescriptor:v11];

  uint64_t v12 = [TBLocalFetchRequestDescriptor alloc];
  v13 = [(TBTileFetchRequestDescriptor *)self _preferLocalCacheFetchRequest];
  v14 = [(TBLocalFetchRequestDescriptor *)v12 initWithFetchRequest:v13];
  [v5 setPreferLocalFetchDescriptor:v14];

  v15 = [(TBTileFetchRequestDescriptor *)self localFetchPredicate];
  v16 = (void *)[v15 copyWithZone:a3];
  [v10 setPredicate:v16];

  return v5;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (void)setLocalFetchDescriptor:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (void)setTileItems:(id)a3
{
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
}

- (void)setLocalFetchPredicate:(id)a3
{
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (void)setMaxCacheAge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_tileItems, 0);

  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
}

@end
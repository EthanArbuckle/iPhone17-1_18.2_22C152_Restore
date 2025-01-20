@interface TBLocationFetchRequestDescriptor
- (Class)remoteRequestClass;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)tileItems;
- (PBCodable)remoteRequest;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 maxCacheAge:(id)a5;
- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 maxCacheAge:(id)a6;
- (double)latitude;
- (double)longitude;
- (id)_localFetchRequest;
- (id)_preferLocalCacheFetchRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)primaryTileKey;
- (unint64_t)type;
- (void)setLatitude:(double)a3;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setPrimaryTileKey:(unint64_t)a3;
- (void)setTileItems:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBLocationFetchRequestDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [(TBLocationFetchRequestDescriptor *)self latitude];
  objc_msgSend(v5, "setLatitude:");
  [(TBLocationFetchRequestDescriptor *)self longitude];
  objc_msgSend(v5, "setLongitude:");
  objc_msgSend(v5, "setType:", -[TBLocationFetchRequestDescriptor type](self, "type"));
  v6 = [v5 maxCacheAge];

  if (v6)
  {
    v7 = [(TBLocationFetchRequestDescriptor *)self maxCacheAge];
    v8 = (void *)[v7 copyWithZone:a3];
    [v5 setMaxCacheAge:v8];
  }
  objc_msgSend(v5, "setPrimaryTileKey:", -[TBLocationFetchRequestDescriptor primaryTileKey](self, "primaryTileKey"));
  v9 = [(TBLocationFetchRequestDescriptor *)self tileItems];
  v10 = (void *)[v9 copyWithZone:a3];
  [v5 setTileItems:v10];

  v11 = [TBLocalFetchRequestDescriptor alloc];
  v12 = [(TBLocationFetchRequestDescriptor *)self _localFetchRequest];
  v13 = [(TBLocalFetchRequestDescriptor *)v11 initWithFetchRequest:v12];
  [v5 setLocalFetchDescriptor:v13];

  v14 = [TBLocalFetchRequestDescriptor alloc];
  v15 = [(TBLocationFetchRequestDescriptor *)self _preferLocalCacheFetchRequest];
  v16 = [(TBLocalFetchRequestDescriptor *)v14 initWithFetchRequest:v15];
  [v5 setPreferLocalFetchDescriptor:v16];

  return v5;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTileItems:(id)a3
{
}

- (void)setPrimaryTileKey:(unint64_t)a3
{
  self->_primaryTileKey = a3;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setLocalFetchDescriptor:(id)a3
{
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 maxCacheAge:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)TBLocationFetchRequestDescriptor;
  v12 = [(TBLocationFetchRequestDescriptor *)&v37 init];
  v12->_latitude = a3;
  v12->_longitude = a4;
  v12->_type = 2;
  objc_storeStrong((id *)&v12->_maxCacheAge, a6);
  v13 = [[TBGloriaTile alloc] initWithLat:+[TBGloriaTile defaultZoomLevel] lng:a3 zoom:a4];
  v14 = v13;
  if (v13)
  {
    v12->_primaryTileKey = [(TBGloriaTile *)v13 key];
    NSLog(&cfstr_SSearchRadiusF.isa, "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]", *(void *)&a5);
    v15 = [(TBGloriaTile *)v14 neighborTileKeysWithRadius:a5];
    v16 = [MEMORY[0x1E4F1CA80] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = +[TBTileItemDescriptor tileItemDescriptorWithKey:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v19);
    }

    objc_storeStrong((id *)&v12->_tileItems, v16);
    v23 = [TBLocalFetchRequestDescriptor alloc];
    v24 = [(TBLocationFetchRequestDescriptor *)v12 _localFetchRequest];
    uint64_t v25 = [(TBLocalFetchRequestDescriptor *)v23 initWithFetchRequest:v24];
    localFetchDescriptor = v12->_localFetchDescriptor;
    v12->_localFetchDescriptor = (TBLocalFetchRequestDescriptor *)v25;

    v27 = [TBLocalFetchRequestDescriptor alloc];
    v28 = [(TBLocationFetchRequestDescriptor *)v12 _preferLocalCacheFetchRequest];
    uint64_t v29 = [(TBLocalFetchRequestDescriptor *)v27 initWithFetchRequest:v28];
    preferLocalFetchDescriptor = v12->_preferLocalFetchDescriptor;
    v12->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v29;
  }
  else
  {
    NSLog(&cfstr_SFailedToCreat.isa, "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]");
    id v17 = 0;
    v16 = 0;
    v28 = v12;
    v12 = 0;
  }

  v31 = v12;
  return v31;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_localFetchRequest
{
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[TBTileMO entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = [(TBLocationFetchRequestDescriptor *)self localFetchPredicate];
  [v5 setPredicate:v6];

  return v5;
}

- (NSPredicate)localFetchPredicate
{
  v15[2] = *MEMORY[0x1E4F143B8];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    v4 = [(TBLocationFetchRequestDescriptor *)self tileItems];
    id v5 = [v4 tilePredicate];

    v6 = [(TBLocationFetchRequestDescriptor *)self maxCacheAge];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28BA0];
      v8 = (void *)MEMORY[0x1E4F28F60];
      v9 = [(TBLocationFetchRequestDescriptor *)self maxCacheAge];
      v10 = [v8 predicateWithFormat:@"created >= %@", v9];
      v15[0] = v10;
      v15[1] = v5;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      uint64_t v12 = [v7 andPredicateWithSubpredicates:v11];

      id v5 = (NSPredicate *)v12;
    }
    v13 = self->_localFetchPredicate;
    self->_localFetchPredicate = v5;

    localFetchPredicate = self->_localFetchPredicate;
  }

  return localFetchPredicate;
}

- (id)_preferLocalCacheFetchRequest
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[TBTileMO entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = [(TBLocationFetchRequestDescriptor *)self tileItems];
  v7 = [v6 tilePredicate];

  v8 = [(TBLocationFetchRequestDescriptor *)self maxCacheAge];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28BA0];
    v10 = (void *)MEMORY[0x1E4F28F60];
    id v11 = [(TBLocationFetchRequestDescriptor *)self maxCacheAge];
    uint64_t v12 = [v10 predicateWithFormat:@"created > %@", v11];
    v16[0] = v12;
    v16[1] = v7;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v14 = [v9 andPredicateWithSubpredicates:v13];
    [v5 setPredicate:v14];
  }
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_1F2B952D8];

  return v5;
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileItems, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);

  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
}

- (unint64_t)primaryTileKey
{
  return self->_primaryTileKey;
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 maxCacheAge:(id)a5
{
  id v8 = a5;
  +[TBDefaults tileSearchRadius];
  v10 = [(TBLocationFetchRequestDescriptor *)self initWithLatitude:v8 longitude:a3 radius:a4 maxCacheAge:v9];

  return v10;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4
{
  +[TBDefaults tileSearchRadius];

  return [(TBLocationFetchRequestDescriptor *)self initWithLatitude:0 longitude:a3 radius:a4 maxCacheAge:v7];
}

- (PBCodable)remoteRequest
{
  return 0;
}

- (Class)remoteRequestClass
{
  return 0;
}

- (void)setLocalFetchPredicate:(id)a3
{
}

- (void)setMaxCacheAge:(id)a3
{
}

@end
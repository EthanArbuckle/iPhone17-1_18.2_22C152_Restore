@interface TBNetworkFetchRequestDescriptor
- (Class)remoteRequestClass;
- (GEOWiFiQualityNetworkSearch)remoteRequest;
- (NSDate)maxCacheAge;
- (NSPredicate)localFetchPredicate;
- (NSSet)bssids;
- (TBLocalFetchRequestDescriptor)localFetchDescriptor;
- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor;
- (TBNetworkFetchRequestDescriptor)init;
- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3;
- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3 maxCacheAge:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setBssids:(id)a3;
- (void)setLocalFetchDescriptor:(id)a3;
- (void)setLocalFetchPredicate:(id)a3;
- (void)setMaxCacheAge:(id)a3;
- (void)setPreferLocalFetchDescriptor:(id)a3;
- (void)setRemoteRequest:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBNetworkFetchRequestDescriptor

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3 maxCacheAge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TBNetworkFetchRequestDescriptor;
  v9 = [(TBNetworkFetchRequestDescriptor *)&v20 init];
  objc_storeStrong((id *)&v9->_bssids, a3);
  bssids = v9->_bssids;
  if (bssids && [(NSSet *)bssids count])
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_maxCacheAge, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    v12 = +[TBAccessPointMO entityName];
    v13 = (void *)[v11 initWithEntityName:v12];

    v14 = [(TBNetworkFetchRequestDescriptor *)v9 localFetchPredicate];
    [v13 setPredicate:v14];

    v15 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v13];
    localFetchDescriptor = v9->_localFetchDescriptor;
    v9->_localFetchDescriptor = v15;

    v17 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v13];
    preferLocalFetchDescriptor = v9->_preferLocalFetchDescriptor;
    v9->_preferLocalFetchDescriptor = v17;
  }
  else
  {
    NSLog(&cfstr_SBssidsIsNilOr.isa, "-[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:]");
    v13 = 0;
    preferLocalFetchDescriptor = v9;
    v9 = 0;
  }

  return v9;
}

- (NSPredicate)localFetchPredicate
{
  v16[2] = *MEMORY[0x1E4F143B8];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    v4 = (void *)MEMORY[0x1E4F28F60];
    v5 = [(NSSet *)self->_bssids reformatBSSIDs];
    v6 = [v4 predicateWithFormat:@"bssid IN %@", v5];

    id v7 = [(TBNetworkFetchRequestDescriptor *)self maxCacheAge];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F28BA0];
      v9 = (void *)MEMORY[0x1E4F28F60];
      v10 = [(TBNetworkFetchRequestDescriptor *)self maxCacheAge];
      id v11 = [v9 predicateWithFormat:@"created > %@", v10];
      v16[0] = v11;
      v16[1] = v6;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      uint64_t v13 = [v8 andPredicateWithSubpredicates:v12];

      v6 = (NSPredicate *)v13;
    }
    v14 = self->_localFetchPredicate;
    self->_localFetchPredicate = v6;

    localFetchPredicate = self->_localFetchPredicate;
  }

  return localFetchPredicate;
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSSet)bssids
{
  return self->_bssids;
}

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3
{
  return [(TBNetworkFetchRequestDescriptor *)self initWithBSSIDs:a3 maxCacheAge:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssids, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);

  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
}

- (TBNetworkFetchRequestDescriptor)init
{
  v12.receiver = self;
  v12.super_class = (Class)TBNetworkFetchRequestDescriptor;
  v2 = [(TBNetworkFetchRequestDescriptor *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 1;
    id v4 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    v5 = +[TBAccessPointMO entityName];
    v6 = (void *)[v4 initWithEntityName:v5];

    id v7 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v6];
    localFetchDescriptor = v3->_localFetchDescriptor;
    v3->_localFetchDescriptor = v7;

    v9 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v6];
    preferLocalFetchDescriptor = v3->_preferLocalFetchDescriptor;
    v3->_preferLocalFetchDescriptor = v9;
  }
  return v3;
}

- (GEOWiFiQualityNetworkSearch)remoteRequest
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  remoteRequest = self->_remoteRequest;
  if (!remoteRequest)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F64C40]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(TBNetworkFetchRequestDescriptor *)self bssids];
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
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
          id v11 = objc_alloc_init(MEMORY[0x1E4F64C10]);
          objc_super v12 = [v10 reformatBSSID];
          [v11 setIdentifier:v12];

          id v13 = objc_alloc_init(MEMORY[0x1E4F64C30]);
          [v13 addBss:v11];
          [v4 addEss:v13];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    v14 = self->_remoteRequest;
    self->_remoteRequest = (GEOWiFiQualityNetworkSearch *)v4;

    remoteRequest = self->_remoteRequest;
  }

  return remoteRequest;
}

- (Class)remoteRequestClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(TBNetworkFetchRequestDescriptor *)self bssids];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBssids:v7];

  objc_msgSend(v5, "setType:", -[TBNetworkFetchRequestDescriptor type](self, "type"));
  uint64_t v8 = [(TBNetworkFetchRequestDescriptor *)self maxCacheAge];

  if (v8)
  {
    uint64_t v9 = [(TBNetworkFetchRequestDescriptor *)self maxCacheAge];
    v10 = (void *)[v9 copyWithZone:a3];
    [v5 setMaxCacheAge:v10];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  objc_super v12 = +[TBAccessPointMO entityName];
  id v13 = (void *)[v11 initWithEntityName:v12];

  v14 = [(TBNetworkFetchRequestDescriptor *)self localFetchPredicate];
  v15 = (void *)[v14 copyWithZone:a3];
  [v13 setPredicate:v15];

  long long v16 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v13];
  [v5 setLocalFetchDescriptor:v16];

  long long v17 = [[TBLocalFetchRequestDescriptor alloc] initWithFetchRequest:v13];
  [v5 setPreferLocalFetchDescriptor:v17];

  return v5;
}

- (void)setLocalFetchPredicate:(id)a3
{
}

- (void)setRemoteRequest:(id)a3
{
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setMaxCacheAge:(id)a3
{
}

- (void)setLocalFetchDescriptor:(id)a3
{
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
}

- (void)setBssids:(id)a3
{
}

@end
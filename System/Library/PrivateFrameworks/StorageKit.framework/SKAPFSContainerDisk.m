@interface SKAPFSContainerDisk
- (BOOL)isVirtualDiskType;
- (NSString)designatedPSUUID;
- (id)copyVolumesWithIncludeSnapshots:(BOOL)a3;
- (id)designatedPhysicalStore;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)physicalStores;
- (id)volumes;
- (id)volumesExcludingSnapshots;
- (void)setDesignatedPSUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSContainerDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7.receiver = v5;
  v7.super_class = (Class)SKAPFSContainerDisk;
  [(SKDisk *)&v7 updateWithDictionary:v4];
  v6 = [v4 objectForKey:@"designatedPSUUID"];
  [(SKAPFSContainerDisk *)v5 setDesignatedPSUUID:v6];

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSContainerDisk;
  v3 = [(SKDisk *)&v7 minimalDictionaryRepresentation];
  id v4 = [(SKAPFSContainerDisk *)v2 designatedPSUUID];

  if (v4)
  {
    v5 = [(SKAPFSContainerDisk *)v2 designatedPSUUID];
    [v3 setObject:v5 forKey:@"designatedPSUUID"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v5.receiver = v2;
  v5.super_class = (Class)SKAPFSContainerDisk;
  v3 = [(SKDisk *)&v5 dictionaryRepresentation];
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  if ([(SKDisk *)self isLiveFSAPFSDisk])
  {
    id v4 = @"liveFS";
  }
  else
  {
    objc_super v5 = NSString;
    uint64_t v6 = [(SKAPFSContainerDisk *)self apfsUUID];
    objc_super v7 = (void *)v6;
    v8 = @"--";
    if (v6) {
      v8 = (__CFString *)v6;
    }
    id v4 = [v5 stringWithFormat:@"APFS UUID: %@", v8];
  }

  return v4;
}

- (id)physicalStores
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = +[SKBaseManager sharedManager];
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = objc_msgSend(v3, "allDisks", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([v11 isOurContainerWithDisk:self]) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)copyVolumesWithIncludeSnapshots:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(SKDisk *)self children];
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)volumes
{
  id v2 = [(SKAPFSContainerDisk *)self copyVolumesWithIncludeSnapshots:1];

  return v2;
}

- (id)volumesExcludingSnapshots
{
  id v2 = [(SKAPFSContainerDisk *)self copyVolumesWithIncludeSnapshots:0];

  return v2;
}

- (id)designatedPhysicalStore
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(SKAPFSContainerDisk *)self physicalStores];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(SKDisk *)self isLiveFSAPFSDisk]) {
          goto LABEL_12;
        }
        uint64_t v9 = [(SKAPFSContainerDisk *)self designatedPSUUID];
        if (!v9) {
          goto LABEL_12;
        }
        uint64_t v10 = (void *)v9;
        uint64_t v11 = [(SKAPFSContainerDisk *)self designatedPSUUID];
        v12 = [v8 apfsUUID];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
LABEL_12:
          id v14 = v8;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v14 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  return v14;
}

- (BOOL)isVirtualDiskType
{
  return 1;
}

- (NSString)designatedPSUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDesignatedPSUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
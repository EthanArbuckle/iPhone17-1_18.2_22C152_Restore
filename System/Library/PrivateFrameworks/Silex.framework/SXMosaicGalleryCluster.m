@interface SXMosaicGalleryCluster
- (BOOL)clusterIsEqualToTileTypes:(id)a3;
- (BOOL)isClusterOfType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (SXMosaicGalleryCluster)initWithItems:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SXMosaicGalleryCluster

- (SXMosaicGalleryCluster)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXMosaicGalleryCluster;
  v6 = [(SXMosaicGalleryCluster *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (BOOL)isClusterOfType:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(SXMosaicGalleryCluster *)self items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) tileType] != a3)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(SXMosaicGalleryCluster *)self items];
    uint64_t v7 = [v5 items];

    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)clusterIsEqualToTileTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(SXMosaicGalleryCluster *)self items];
  uint64_t v6 = [v5 count];

  if ([v4 count] != v6)
  {
    BOOL v17 = 0;
    goto LABEL_16;
  }
  if (!v6)
  {
    LOBYTE(v10) = 1;
    LOBYTE(v9) = 1;
    goto LABEL_15;
  }
  uint64_t v7 = 0;
  uint64_t v8 = v6 - 1;
  LOBYTE(v9) = 1;
  LOBYTE(v10) = 1;
  while (1)
  {
    long long v11 = [(SXMosaicGalleryCluster *)self items];
    long long v12 = [v11 objectAtIndex:v7];

    if (v9)
    {
      long long v13 = [v4 objectAtIndex:v7];
      int v14 = [v13 intValue];

      BOOL v9 = [v12 tileType] == v14;
      if (!v10) {
        goto LABEL_6;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (!v10)
      {
LABEL_6:
        BOOL v10 = 0;
        goto LABEL_9;
      }
    }
    v15 = [v4 objectAtIndex:v8];
    int v16 = [v15 intValue];

    BOOL v10 = [v12 tileType] == v16;
LABEL_9:

    if (!v9 && !v10) {
      break;
    }
    ++v7;
    if (--v8 == -1) {
      goto LABEL_15;
    }
  }
  LOBYTE(v10) = 0;
  LOBYTE(v9) = 0;
LABEL_15:
  BOOL v17 = v9 || v10;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  v2 = [(SXMosaicGalleryCluster *)self items];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(SXMosaicGalleryCluster *)self items];
  id v4 = [v2 stringWithFormat:@"Cluster: %@", v3];

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end
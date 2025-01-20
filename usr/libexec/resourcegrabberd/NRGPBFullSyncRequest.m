@interface NRGPBFullSyncRequest
+ (Class)bundleIDsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSMutableArray)bundleIDs;
- (id)bundleIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)iconVariants;
- (int)iconVariantsAtIndex:(unint64_t)a3;
- (unint64_t)bundleIDsCount;
- (unint64_t)hash;
- (unint64_t)iconVariantsCount;
- (unsigned)requestTypeCode;
- (void)addBundleIDs:(id)a3;
- (void)addIconVariants:(int)a3;
- (void)clearBundleIDs;
- (void)clearIconVariants;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setIconVariants:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBFullSyncRequest

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NRGPBFullSyncRequest;
  [(NRGPBFullSyncRequest *)&v3 dealloc];
}

- (unint64_t)iconVariantsCount
{
  return self->_iconVariants.count;
}

- (int)iconVariants
{
  return self->_iconVariants.list;
}

- (void)clearIconVariants
{
}

- (void)addIconVariants:(int)a3
{
}

- (int)iconVariantsAtIndex:(unint64_t)a3
{
  p_iconVariants = &self->_iconVariants;
  unint64_t count = self->_iconVariants.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_iconVariants->list[a3];
}

- (void)setIconVariants:(int *)a3 count:(unint64_t)a4
{
}

- (void)clearBundleIDs
{
}

- (void)addBundleIDs:(id)a3
{
  id v4 = a3;
  bundleIDs = self->_bundleIDs;
  id v8 = v4;
  if (!bundleIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_bundleIDs;
    self->_bundleIDs = v6;

    id v4 = v8;
    bundleIDs = self->_bundleIDs;
  }
  [(NSMutableArray *)bundleIDs addObject:v4];
}

- (unint64_t)bundleIDsCount
{
  return (unint64_t)[(NSMutableArray *)self->_bundleIDs count];
}

- (id)bundleIDsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_bundleIDs objectAtIndex:a3];
}

+ (Class)bundleIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBFullSyncRequest;
  objc_super v3 = [(NRGPBFullSyncRequest *)&v7 description];
  id v4 = [(NRGPBFullSyncRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  id v4 = PBRepeatedInt32NSArray();
  [v3 setObject:v4 forKey:@"iconVariants"];

  bundleIDs = self->_bundleIDs;
  if (bundleIDs) {
    [v3 setObject:bundleIDs forKey:@"bundleIDs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000F5FC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_iconVariants.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_iconVariants.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_bundleIDs;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)requestTypeCode
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v11 = a3;
  if ([(NRGPBFullSyncRequest *)self iconVariantsCount])
  {
    [v11 clearIconVariants];
    unint64_t v4 = [(NRGPBFullSyncRequest *)self iconVariantsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        [v11 addIconVariants:-[NRGPBFullSyncRequest iconVariantsAtIndex:](self, "iconVariantsAtIndex:", i)];
    }
  }
  if ([(NRGPBFullSyncRequest *)self bundleIDsCount])
  {
    [v11 clearBundleIDs];
    unint64_t v7 = [(NRGPBFullSyncRequest *)self bundleIDsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        v10 = [(NRGPBFullSyncRequest *)self bundleIDsAtIndex:j];
        [v11 addBundleIDs:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  PBRepeatedInt32Copy();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_bundleIDs;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addBundleIDs:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && PBRepeatedInt32IsEqual())
  {
    bundleIDs = self->_bundleIDs;
    if ((unint64_t)bundleIDs | v4[4]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](bundleIDs, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  return (unint64_t)[(NSMutableArray *)self->_bundleIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  id v5 = (char *)[v4 iconVariantsCount];
  if (v5)
  {
    unsigned __int8 v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NRGPBFullSyncRequest addIconVariants:](self, "addIconVariants:", [v4 iconVariantsAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[4];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NRGPBFullSyncRequest addBundleIDs:](self, "addBundleIDs:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSMutableArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface APPBAdBatchRequest
+ (Class)cachedAdsType;
+ (Class)requestersType;
+ (Class)resourceCacheEntriesType;
+ (Class)tagsType;
+ (id)options;
- (APPBAdSpecification)specification;
- (APPBRequestProperties)requestProperties;
- (BOOL)hasRequestProperties;
- (BOOL)hasSpecification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cachedAds;
- (NSMutableArray)requesters;
- (NSMutableArray)resourceCacheEntries;
- (NSMutableArray)tags;
- (id)cachedAdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestersAtIndex:(unint64_t)a3;
- (id)resourceCacheEntriesAtIndex:(unint64_t)a3;
- (id)tagsAtIndex:(unint64_t)a3;
- (unint64_t)cachedAdsCount;
- (unint64_t)hash;
- (unint64_t)requestersCount;
- (unint64_t)resourceCacheEntriesCount;
- (unint64_t)tagsCount;
- (void)addCachedAds:(id)a3;
- (void)addRequesters:(id)a3;
- (void)addResourceCacheEntries:(id)a3;
- (void)addTags:(id)a3;
- (void)clearCachedAds;
- (void)clearRequesters;
- (void)clearResourceCacheEntries;
- (void)clearTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCachedAds:(id)a3;
- (void)setRequestProperties:(id)a3;
- (void)setRequesters:(id)a3;
- (void)setResourceCacheEntries:(id)a3;
- (void)setSpecification:(id)a3;
- (void)setTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdBatchRequest

+ (id)options
{
  if (qword_100289B10 != -1) {
    dispatch_once(&qword_100289B10, &stru_100236130);
  }
  v2 = (void *)qword_100289B08;

  return v2;
}

- (BOOL)hasRequestProperties
{
  return self->_requestProperties != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (void)clearResourceCacheEntries
{
}

- (void)addResourceCacheEntries:(id)a3
{
  id v4 = a3;
  resourceCacheEntries = self->_resourceCacheEntries;
  id v8 = v4;
  if (!resourceCacheEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_resourceCacheEntries;
    self->_resourceCacheEntries = v6;

    id v4 = v8;
    resourceCacheEntries = self->_resourceCacheEntries;
  }
  [(NSMutableArray *)resourceCacheEntries addObject:v4];
}

- (unint64_t)resourceCacheEntriesCount
{
  return (unint64_t)[(NSMutableArray *)self->_resourceCacheEntries count];
}

- (id)resourceCacheEntriesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_resourceCacheEntries objectAtIndex:a3];
}

+ (Class)resourceCacheEntriesType
{
  return (Class)objc_opt_class();
}

- (void)clearCachedAds
{
}

- (void)addCachedAds:(id)a3
{
  id v4 = a3;
  cachedAds = self->_cachedAds;
  id v8 = v4;
  if (!cachedAds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_cachedAds;
    self->_cachedAds = v6;

    id v4 = v8;
    cachedAds = self->_cachedAds;
  }
  [(NSMutableArray *)cachedAds addObject:v4];
}

- (unint64_t)cachedAdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_cachedAds count];
}

- (id)cachedAdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cachedAds objectAtIndex:a3];
}

+ (Class)cachedAdsType
{
  return (Class)objc_opt_class();
}

- (void)clearTags
{
}

- (void)addTags:(id)a3
{
  id v4 = a3;
  tags = self->_tags;
  id v8 = v4;
  if (!tags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tags;
    self->_tags = v6;

    id v4 = v8;
    tags = self->_tags;
  }
  [(NSMutableArray *)tags addObject:v4];
}

- (unint64_t)tagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_tags count];
}

- (id)tagsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tags objectAtIndex:a3];
}

+ (Class)tagsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequesters
{
}

- (void)addRequesters:(id)a3
{
  id v4 = a3;
  requesters = self->_requesters;
  id v8 = v4;
  if (!requesters)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requesters;
    self->_requesters = v6;

    id v4 = v8;
    requesters = self->_requesters;
  }
  [(NSMutableArray *)requesters addObject:v4];
}

- (unint64_t)requestersCount
{
  return (unint64_t)[(NSMutableArray *)self->_requesters count];
}

- (id)requestersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_requesters objectAtIndex:a3];
}

+ (Class)requestersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdBatchRequest;
  v3 = [(APPBAdBatchRequest *)&v7 description];
  id v4 = [(APPBAdBatchRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  requestProperties = self->_requestProperties;
  if (requestProperties)
  {
    v5 = [(APPBRequestProperties *)requestProperties dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"requestProperties"];
  }
  specification = self->_specification;
  if (specification)
  {
    objc_super v7 = [(APPBAdSpecification *)specification dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"specification"];
  }
  if ([(NSMutableArray *)self->_resourceCacheEntries count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_resourceCacheEntries, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v9 = self->_resourceCacheEntries;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"resourceCacheEntries"];
  }
  if ([(NSMutableArray *)self->_cachedAds count])
  {
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cachedAds, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = self->_cachedAds;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"cachedAds"];
  }
  tags = self->_tags;
  if (tags) {
    [v3 setObject:tags forKey:@"tags"];
  }
  if ([(NSMutableArray *)self->_requesters count])
  {
    id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_requesters, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = self->_requesters;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)k) dictionaryRepresentation:v31];
          [v23 addObject:v29];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"requesters"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdBatchRequestReadFrom((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_requestProperties) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_specification) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_resourceCacheEntries;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = self->_cachedAds;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = self->_tags;
  v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      id v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_requesters;
  v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_requestProperties) {
    [v20 setRequestProperties:];
  }
  if (self->_specification) {
    [v20 setSpecification:];
  }
  if ([(APPBAdBatchRequest *)self resourceCacheEntriesCount])
  {
    [v20 clearResourceCacheEntries];
    unint64_t v4 = [(APPBAdBatchRequest *)self resourceCacheEntriesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBAdBatchRequest *)self resourceCacheEntriesAtIndex:i];
        [v20 addResourceCacheEntries:v7];
      }
    }
  }
  if ([(APPBAdBatchRequest *)self cachedAdsCount])
  {
    [v20 clearCachedAds];
    unint64_t v8 = [(APPBAdBatchRequest *)self cachedAdsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(APPBAdBatchRequest *)self cachedAdsAtIndex:j];
        [v20 addCachedAds:v11];
      }
    }
  }
  if ([(APPBAdBatchRequest *)self tagsCount])
  {
    [v20 clearTags];
    unint64_t v12 = [(APPBAdBatchRequest *)self tagsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        id v15 = [(APPBAdBatchRequest *)self tagsAtIndex:k];
        [v20 addTags:v15];
      }
    }
  }
  if ([(APPBAdBatchRequest *)self requestersCount])
  {
    [v20 clearRequesters];
    unint64_t v16 = [(APPBAdBatchRequest *)self requestersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(APPBAdBatchRequest *)self requestersAtIndex:m];
        [v20 addRequesters:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBRequestProperties *)self->_requestProperties copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(APPBAdSpecification *)self->_specification copyWithZone:a3];
  unint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = self->_resourceCacheEntries;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addResourceCacheEntries:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v16 = self->_cachedAds;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)v20) copyWithZone:a3];
        [v5 addCachedAds:v21];

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v22 = self->_tags;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      long long v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v26) copyWithZone:a3];
        [v5 addTags:v27];

        long long v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_requesters;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      long long v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v32) copyWithZone:a3];
        [v5 addRequesters:v33];

        long long v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestProperties = self->_requestProperties, !((unint64_t)requestProperties | v4[2]))
     || -[APPBRequestProperties isEqual:](requestProperties, "isEqual:"))
    && ((specification = self->_specification, !((unint64_t)specification | v4[5]))
     || -[APPBAdSpecification isEqual:](specification, "isEqual:"))
    && ((resourceCacheEntries = self->_resourceCacheEntries, !((unint64_t)resourceCacheEntries | v4[4]))
     || -[NSMutableArray isEqual:](resourceCacheEntries, "isEqual:"))
    && ((cachedAds = self->_cachedAds, !((unint64_t)cachedAds | v4[1]))
     || -[NSMutableArray isEqual:](cachedAds, "isEqual:"))
    && ((tags = self->_tags, !((unint64_t)tags | v4[6]))
     || -[NSMutableArray isEqual:](tags, "isEqual:")))
  {
    requesters = self->_requesters;
    if ((unint64_t)requesters | v4[3]) {
      unsigned __int8 v11 = -[NSMutableArray isEqual:](requesters, "isEqual:");
    }
    else {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBRequestProperties *)self->_requestProperties hash];
  unint64_t v4 = [(APPBAdSpecification *)self->_specification hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_resourceCacheEntries hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_cachedAds hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_tags hash];
  return v6 ^ v7 ^ (unint64_t)[(NSMutableArray *)self->_requesters hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestProperties = self->_requestProperties;
  uint64_t v6 = *((void *)v4 + 2);
  if (requestProperties)
  {
    if (v6) {
      -[APPBRequestProperties mergeFrom:](requestProperties, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBAdBatchRequest setRequestProperties:](self, "setRequestProperties:");
  }
  specification = self->_specification;
  uint64_t v8 = *((void *)v4 + 5);
  if (specification)
  {
    if (v8) {
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[APPBAdBatchRequest setSpecification:](self, "setSpecification:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = *((id *)v4 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        [(APPBAdBatchRequest *)self addResourceCacheEntries:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v11);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = *((id *)v4 + 1);
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        [(APPBAdBatchRequest *)self addCachedAds:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
      }
      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v16);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = *((id *)v4 + 6);
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v21; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        [(APPBAdBatchRequest *)self addTags:*(void *)(*((void *)&v33 + 1) + 8 * (void)k)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v21);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 3);
  id v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v26; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[APPBAdBatchRequest addRequesters:](self, "addRequesters:", *(void *)(*((void *)&v29 + 1) + 8 * (void)m), (void)v29);
      }
      id v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v26);
  }
}

- (APPBRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setRequestProperties:(id)a3
{
}

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (NSMutableArray)resourceCacheEntries
{
  return self->_resourceCacheEntries;
}

- (void)setResourceCacheEntries:(id)a3
{
}

- (NSMutableArray)cachedAds
{
  return self->_cachedAds;
}

- (void)setCachedAds:(id)a3
{
}

- (NSMutableArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSMutableArray)requesters
{
  return self->_requesters;
}

- (void)setRequesters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_resourceCacheEntries, 0);
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);

  objc_storeStrong((id *)&self->_cachedAds, 0);
}

@end
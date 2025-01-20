@interface NTKProtoSharedCollections
+ (Class)collectionsType;
+ (id)protoBufferFromSharedCollections:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)collections;
- (id)collectionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sharedCollectionsDictionary;
- (unint64_t)collectionsCount;
- (unint64_t)hash;
- (void)addCollections:(id)a3;
- (void)clearCollections;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoSharedCollections

- (void)clearCollections
{
}

- (void)addCollections:(id)a3
{
  id v4 = a3;
  collections = self->_collections;
  id v8 = v4;
  if (!collections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_collections;
    self->_collections = v6;

    id v4 = v8;
    collections = self->_collections;
  }
  [(NSMutableArray *)collections addObject:v4];
}

- (unint64_t)collectionsCount
{
  return [(NSMutableArray *)self->_collections count];
}

- (id)collectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_collections objectAtIndex:a3];
}

+ (Class)collectionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoSharedCollections;
  id v4 = [(NTKProtoSharedCollections *)&v8 description];
  v5 = [(NTKProtoSharedCollections *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_collections count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_collections, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_collections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"collections"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoSharedCollectionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_collections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NTKProtoSharedCollections *)self collectionsCount])
  {
    [v8 clearCollections];
    unint64_t v4 = [(NTKProtoSharedCollections *)self collectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NTKProtoSharedCollections *)self collectionsAtIndex:i];
        [v8 addCollections:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_collections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addCollections:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    collections = self->_collections;
    if ((unint64_t)collections | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](collections, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_collections hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NTKProtoSharedCollections addCollections:](self, "addCollections:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)protoBufferFromSharedCollections:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NTKProtoSharedCollections);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__NTKProtoSharedCollections_NTKAdditons__protoBufferFromSharedCollections___block_invoke;
  v7[3] = &unk_1E62C3C50;
  uint64_t v5 = v4;
  uint64_t v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __75__NTKProtoSharedCollections_NTKAdditons__protoBufferFromSharedCollections___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 protoBufferIgnoringSharedCollections:1];
  [v3 addCollections:v4];
}

- (id)sharedCollectionsDictionary
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NTKProtoSharedCollections collectionsCount](self, "collectionsCount"));
  id v4 = [(NTKProtoSharedCollections *)self collections];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke;
  v12[3] = &unk_1E62CAFE0;
  id v5 = v3;
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke_5;
  v10[3] = &unk_1E62C3C50;
  id v6 = v5;
  id v11 = v6;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NTKPigmentCollection collectionFromProtoBuffer:v3 sharedCollections:0];
  id v5 = [v4 collectionName];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v4 collectionName];
    [v6 setObject:v4 forKeyedSubscript:v7];
  }
  else
  {
    id v8 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke_cold_1(v3, v8);
    }
  }
}

uint64_t __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 fulfillWithSharedCollections:*(void *)(a1 + 32)];
}

void __69__NTKProtoSharedCollections_NTKAdditons__sharedCollectionsDictionary__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 formattedText];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#color-sync Failure while decoding shared collections's collection. Data won't be included in it. Protobuffer: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end
@interface NTKProtoFacePigmentSet
+ (Class)collectionBySlotsType;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)collectionBySlots;
- (NSString)domain;
- (id)collectionBySlotsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)collectionBySlotsCount;
- (unint64_t)hash;
- (void)addCollectionBySlots:(id)a3;
- (void)clearCollectionBySlots;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionBySlots:(id)a3;
- (void)setDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoFacePigmentSet

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)clearCollectionBySlots
{
}

- (void)addCollectionBySlots:(id)a3
{
  id v4 = a3;
  collectionBySlots = self->_collectionBySlots;
  id v8 = v4;
  if (!collectionBySlots)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_collectionBySlots;
    self->_collectionBySlots = v6;

    id v4 = v8;
    collectionBySlots = self->_collectionBySlots;
  }
  [(NSMutableArray *)collectionBySlots addObject:v4];
}

- (unint64_t)collectionBySlotsCount
{
  return [(NSMutableArray *)self->_collectionBySlots count];
}

- (id)collectionBySlotsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_collectionBySlots objectAtIndex:a3];
}

+ (Class)collectionBySlotsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoFacePigmentSet;
  id v4 = [(NTKProtoFacePigmentSet *)&v8 description];
  v5 = [(NTKProtoFacePigmentSet *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if ([(NSMutableArray *)self->_collectionBySlots count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_collectionBySlots, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_collectionBySlots;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"collectionBySlots"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoFacePigmentSetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_collectionBySlots;
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
  if (self->_domain) {
    objc_msgSend(v8, "setDomain:");
  }
  if ([(NTKProtoFacePigmentSet *)self collectionBySlotsCount])
  {
    [v8 clearCollectionBySlots];
    unint64_t v4 = [(NTKProtoFacePigmentSet *)self collectionBySlotsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NTKProtoFacePigmentSet *)self collectionBySlotsAtIndex:i];
        [v8 addCollectionBySlots:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_collectionBySlots;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addCollectionBySlots:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:")))
  {
    collectionBySlots = self->_collectionBySlots;
    if ((unint64_t)collectionBySlots | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](collectionBySlots, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  return [(NSMutableArray *)self->_collectionBySlots hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTKProtoFacePigmentSet setDomain:](self, "setDomain:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTKProtoFacePigmentSet addCollectionBySlots:](self, "addCollectionBySlots:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSMutableArray)collectionBySlots
{
  return self->_collectionBySlots;
}

- (void)setCollectionBySlots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_collectionBySlots, 0);
}

@end
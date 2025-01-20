@interface TPPBPolicyIntroducersByCategory
+ (Class)introducersType;
+ (id)TPPBPolicyIntroducersByCategoryWithCategory:(id)a3 introducers:(id)a4;
- (BOOL)hasCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)introducers;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)introducersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)introducersCount;
- (void)addIntroducers:(id)a3;
- (void)clearIntroducers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setIntroducers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyIntroducersByCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introducers, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)setIntroducers:(id)a3
{
}

- (NSMutableArray)introducers
{
  return self->_introducers;
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[TPPBPolicyIntroducersByCategory setCategory:](self, "setCategory:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[TPPBPolicyIntroducersByCategory addIntroducers:](self, "addIntroducers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_category hash];
  return [(NSMutableArray *)self->_introducers hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((category = self->_category, !((unint64_t)category | v4[1]))
     || -[NSString isEqual:](category, "isEqual:")))
  {
    introducers = self->_introducers;
    if ((unint64_t)introducers | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](introducers, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_category copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_introducers;
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
        [v5 addIntroducers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_category) {
    objc_msgSend(v8, "setCategory:");
  }
  if ([(TPPBPolicyIntroducersByCategory *)self introducersCount])
  {
    [v8 clearIntroducers];
    unint64_t v4 = [(TPPBPolicyIntroducersByCategory *)self introducersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(TPPBPolicyIntroducersByCategory *)self introducersAtIndex:i];
        [v8 addIntroducers:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_introducers;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyIntroducersByCategoryReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  introducers = self->_introducers;
  if (introducers) {
    [v4 setObject:introducers forKey:@"introducers"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyIntroducersByCategory;
  id v4 = [(TPPBPolicyIntroducersByCategory *)&v8 description];
  unint64_t v5 = [(TPPBPolicyIntroducersByCategory *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)introducersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_introducers objectAtIndex:a3];
}

- (unint64_t)introducersCount
{
  return [(NSMutableArray *)self->_introducers count];
}

- (void)addIntroducers:(id)a3
{
  id v4 = a3;
  introducers = self->_introducers;
  id v8 = v4;
  if (!introducers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_introducers;
    self->_introducers = v6;

    id v4 = v8;
    introducers = self->_introducers;
  }
  [(NSMutableArray *)introducers addObject:v4];
}

- (void)clearIntroducers
{
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

+ (Class)introducersType
{
  return (Class)objc_opt_class();
}

+ (id)TPPBPolicyIntroducersByCategoryWithCategory:(id)a3 introducers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(TPPBPolicyIntroducersByCategory);
  [(TPPBPolicyIntroducersByCategory *)v7 setCategory:v6];

  id v8 = (void *)[v5 mutableCopy];
  [(TPPBPolicyIntroducersByCategory *)v7 setIntroducers:v8];

  return v7;
}

@end
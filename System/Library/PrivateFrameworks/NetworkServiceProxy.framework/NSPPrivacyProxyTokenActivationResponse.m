@interface NSPPrivacyProxyTokenActivationResponse
+ (Class)activatedTokenListType;
+ (Class)auxiliaryAuthArrayType;
- (BOOL)hasTokenExpiryTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)activatedTokenLists;
- (NSMutableArray)auxiliaryAuthArrays;
- (id)activatedTokenListAtIndex:(unint64_t)a3;
- (id)auxiliaryAuthArrayAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)activatedTokenListsCount;
- (unint64_t)auxiliaryAuthArraysCount;
- (unint64_t)hash;
- (unint64_t)tokenExpiryTimestamp;
- (void)addActivatedTokenList:(id)a3;
- (void)addAuxiliaryAuthArray:(id)a3;
- (void)clearActivatedTokenLists;
- (void)clearAuxiliaryAuthArrays;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivatedTokenLists:(id)a3;
- (void)setAuxiliaryAuthArrays:(id)a3;
- (void)setHasTokenExpiryTimestamp:(BOOL)a3;
- (void)setTokenExpiryTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenActivationResponse

- (void)setTokenExpiryTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tokenExpiryTimestamp = a3;
}

- (void)setHasTokenExpiryTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTokenExpiryTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearActivatedTokenLists
{
}

- (void)addActivatedTokenList:(id)a3
{
  id v4 = a3;
  activatedTokenLists = self->_activatedTokenLists;
  id v8 = v4;
  if (!activatedTokenLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_activatedTokenLists;
    self->_activatedTokenLists = v6;

    id v4 = v8;
    activatedTokenLists = self->_activatedTokenLists;
  }
  [(NSMutableArray *)activatedTokenLists addObject:v4];
}

- (unint64_t)activatedTokenListsCount
{
  return [(NSMutableArray *)self->_activatedTokenLists count];
}

- (id)activatedTokenListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activatedTokenLists objectAtIndex:a3];
}

+ (Class)activatedTokenListType
{
  return (Class)objc_opt_class();
}

- (void)clearAuxiliaryAuthArrays
{
}

- (void)addAuxiliaryAuthArray:(id)a3
{
  id v4 = a3;
  auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
  id v8 = v4;
  if (!auxiliaryAuthArrays)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_auxiliaryAuthArrays;
    self->_auxiliaryAuthArrays = v6;

    id v4 = v8;
    auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
  }
  [(NSMutableArray *)auxiliaryAuthArrays addObject:v4];
}

- (unint64_t)auxiliaryAuthArraysCount
{
  return [(NSMutableArray *)self->_auxiliaryAuthArrays count];
}

- (id)auxiliaryAuthArrayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_auxiliaryAuthArrays objectAtIndex:a3];
}

+ (Class)auxiliaryAuthArrayType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenActivationResponse;
  id v4 = [(NSPPrivacyProxyTokenActivationResponse *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenActivationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_tokenExpiryTimestamp];
    [v3 setObject:v4 forKey:@"tokenExpiryTimestamp"];
  }
  activatedTokenLists = self->_activatedTokenLists;
  if (activatedTokenLists) {
    [v3 setObject:activatedTokenLists forKey:@"activatedTokenList"];
  }
  if ([(NSMutableArray *)self->_auxiliaryAuthArrays count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_auxiliaryAuthArrays, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_auxiliaryAuthArrays;
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

    [v3 setObject:v6 forKey:@"auxiliaryAuthArray"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenActivationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_activatedTokenLists;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_auxiliaryAuthArrays;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_tokenExpiryTimestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v13 = v4;
  if ([(NSPPrivacyProxyTokenActivationResponse *)self activatedTokenListsCount])
  {
    [v13 clearActivatedTokenLists];
    unint64_t v5 = [(NSPPrivacyProxyTokenActivationResponse *)self activatedTokenListsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyTokenActivationResponse *)self activatedTokenListAtIndex:i];
        [v13 addActivatedTokenList:v8];
      }
    }
  }
  if ([(NSPPrivacyProxyTokenActivationResponse *)self auxiliaryAuthArraysCount])
  {
    [v13 clearAuxiliaryAuthArrays];
    unint64_t v9 = [(NSPPrivacyProxyTokenActivationResponse *)self auxiliaryAuthArraysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NSPPrivacyProxyTokenActivationResponse *)self auxiliaryAuthArrayAtIndex:j];
        [v13 addAuxiliaryAuthArray:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_tokenExpiryTimestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_activatedTokenLists;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addActivatedTokenList:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = self->_auxiliaryAuthArrays;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addAuxiliaryAuthArray:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_tokenExpiryTimestamp != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  activatedTokenLists = self->_activatedTokenLists;
  if ((unint64_t)activatedTokenLists | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](activatedTokenLists, "isEqual:"))
  {
    goto LABEL_11;
  }
  auxiliaryAuthArrays = self->_auxiliaryAuthArrays;
  if ((unint64_t)auxiliaryAuthArrays | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](auxiliaryAuthArrays, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_tokenExpiryTimestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_activatedTokenLists hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_auxiliaryAuthArrays hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_tokenExpiryTimestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NSPPrivacyProxyTokenActivationResponse *)self addActivatedTokenList:*(void *)(*((void *)&v20 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5[3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[NSPPrivacyProxyTokenActivationResponse addAuxiliaryAuthArray:](self, "addAuxiliaryAuthArray:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (unint64_t)tokenExpiryTimestamp
{
  return self->_tokenExpiryTimestamp;
}

- (NSMutableArray)activatedTokenLists
{
  return self->_activatedTokenLists;
}

- (void)setActivatedTokenLists:(id)a3
{
}

- (NSMutableArray)auxiliaryAuthArrays
{
  return self->_auxiliaryAuthArrays;
}

- (void)setAuxiliaryAuthArrays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryAuthArrays, 0);
  objc_storeStrong((id *)&self->_activatedTokenLists, 0);
}

@end
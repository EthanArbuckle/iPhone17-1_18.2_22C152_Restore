@interface NPKProtoSecureElementGetAppletsResponse
+ (Class)appletsBytesType;
+ (Class)cardAIDsType;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appletsBytes;
- (NSMutableArray)cardAIDs;
- (id)appletsBytesAtIndex:(unint64_t)a3;
- (id)cardAIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)activationStatesCount;
- (unint64_t)appletsBytesCount;
- (unint64_t)cardAIDsCount;
- (unint64_t)hash;
- (unint64_t)lifecycleStatesCount;
- (unsigned)activationStates;
- (unsigned)activationStatesAtIndex:(unint64_t)a3;
- (unsigned)lifecycleStates;
- (unsigned)lifecycleStatesAtIndex:(unint64_t)a3;
- (void)addActivationStates:(unsigned int)a3;
- (void)addAppletsBytes:(id)a3;
- (void)addCardAIDs:(id)a3;
- (void)addLifecycleStates:(unsigned int)a3;
- (void)clearActivationStates;
- (void)clearAppletsBytes;
- (void)clearCardAIDs;
- (void)clearLifecycleStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivationStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAppletsBytes:(id)a3;
- (void)setCardAIDs:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setLifecycleStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSecureElementGetAppletsResponse

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPKProtoSecureElementGetAppletsResponse;
  [(NPKProtoSecureElementGetAppletsResponse *)&v3 dealloc];
}

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearCardAIDs
{
}

- (void)addCardAIDs:(id)a3
{
  id v4 = a3;
  cardAIDs = self->_cardAIDs;
  id v8 = v4;
  if (!cardAIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cardAIDs;
    self->_cardAIDs = v6;

    id v4 = v8;
    cardAIDs = self->_cardAIDs;
  }
  [(NSMutableArray *)cardAIDs addObject:v4];
}

- (unint64_t)cardAIDsCount
{
  return [(NSMutableArray *)self->_cardAIDs count];
}

- (id)cardAIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cardAIDs objectAtIndex:a3];
}

+ (Class)cardAIDsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)lifecycleStatesCount
{
  return self->_lifecycleStates.count;
}

- (unsigned)lifecycleStates
{
  return self->_lifecycleStates.list;
}

- (void)clearLifecycleStates
{
}

- (void)addLifecycleStates:(unsigned int)a3
{
}

- (unsigned)lifecycleStatesAtIndex:(unint64_t)a3
{
  p_lifecycleStates = &self->_lifecycleStates;
  unint64_t count = self->_lifecycleStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_lifecycleStates->list[a3];
}

- (void)setLifecycleStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)activationStatesCount
{
  return self->_activationStates.count;
}

- (unsigned)activationStates
{
  return self->_activationStates.list;
}

- (void)clearActivationStates
{
}

- (void)addActivationStates:(unsigned int)a3
{
}

- (unsigned)activationStatesAtIndex:(unint64_t)a3
{
  p_activationStates = &self->_activationStates;
  unint64_t count = self->_activationStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_activationStates->list[a3];
}

- (void)setActivationStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearAppletsBytes
{
}

- (void)addAppletsBytes:(id)a3
{
  id v4 = a3;
  appletsBytes = self->_appletsBytes;
  id v8 = v4;
  if (!appletsBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_appletsBytes;
    self->_appletsBytes = v6;

    id v4 = v8;
    appletsBytes = self->_appletsBytes;
  }
  [(NSMutableArray *)appletsBytes addObject:v4];
}

- (unint64_t)appletsBytesCount
{
  return [(NSMutableArray *)self->_appletsBytes count];
}

- (id)appletsBytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appletsBytes objectAtIndex:a3];
}

+ (Class)appletsBytesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSecureElementGetAppletsResponse;
  id v4 = [(NPKProtoSecureElementGetAppletsResponse *)&v8 description];
  v5 = [(NPKProtoSecureElementGetAppletsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v4 forKey:@"pending"];
  }
  cardAIDs = self->_cardAIDs;
  if (cardAIDs) {
    [v3 setObject:cardAIDs forKey:@"cardAIDs"];
  }
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"lifecycleStates"];

  uint64_t v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"activationStates"];

  appletsBytes = self->_appletsBytes;
  if (appletsBytes) {
    [v3 setObject:appletsBytes forKey:@"appletsBytes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementGetAppletsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_cardAIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_lifecycleStates.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_lifecycleStates.count);
  }
  if (self->_activationStates.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_activationStates.count);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_appletsBytes;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteDataField();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[72] = self->_pending;
    v4[76] |= 1u;
  }
  id v19 = v4;
  if ([(NPKProtoSecureElementGetAppletsResponse *)self cardAIDsCount])
  {
    [v19 clearCardAIDs];
    unint64_t v5 = [(NPKProtoSecureElementGetAppletsResponse *)self cardAIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoSecureElementGetAppletsResponse *)self cardAIDsAtIndex:i];
        [v19 addCardAIDs:v8];
      }
    }
  }
  if ([(NPKProtoSecureElementGetAppletsResponse *)self lifecycleStatesCount])
  {
    [v19 clearLifecycleStates];
    unint64_t v9 = [(NPKProtoSecureElementGetAppletsResponse *)self lifecycleStatesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v19, "addLifecycleStates:", -[NPKProtoSecureElementGetAppletsResponse lifecycleStatesAtIndex:](self, "lifecycleStatesAtIndex:", j));
    }
  }
  if ([(NPKProtoSecureElementGetAppletsResponse *)self activationStatesCount])
  {
    [v19 clearActivationStates];
    unint64_t v12 = [(NPKProtoSecureElementGetAppletsResponse *)self activationStatesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        objc_msgSend(v19, "addActivationStates:", -[NPKProtoSecureElementGetAppletsResponse activationStatesAtIndex:](self, "activationStatesAtIndex:", k));
    }
  }
  if ([(NPKProtoSecureElementGetAppletsResponse *)self appletsBytesCount])
  {
    [v19 clearAppletsBytes];
    unint64_t v15 = [(NPKProtoSecureElementGetAppletsResponse *)self appletsBytesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
      {
        long long v18 = [(NPKProtoSecureElementGetAppletsResponse *)self appletsBytesAtIndex:m];
        [v19 addAppletsBytes:v18];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 72) = self->_pending;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_cardAIDs;
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
        unint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addCardAIDs:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v13 = self->_appletsBytes;
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
        [v6 addAppletsBytes:v18];

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
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 76))
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 76)) {
    goto LABEL_16;
  }
LABEL_10:
  cardAIDs = self->_cardAIDs;
  if ((unint64_t)cardAIDs | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](cardAIDs, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_16;
  }
  appletsBytes = self->_appletsBytes;
  if ((unint64_t)appletsBytes | *((void *)v4 + 7)) {
    char v7 = -[NSMutableArray isEqual:](appletsBytes, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_cardAIDs hash];
  uint64_t v5 = v3 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = v4 ^ v5 ^ PBRepeatedUInt32Hash();
  return v6 ^ [(NSMutableArray *)self->_appletsBytes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 76))
  {
    self->_pending = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = *((id *)v4 + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NPKProtoSecureElementGetAppletsResponse *)self addCardAIDs:*(void *)(*((void *)&v26 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v5 lifecycleStatesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
      -[NPKProtoSecureElementGetAppletsResponse addLifecycleStates:](self, "addLifecycleStates:", [v5 lifecycleStatesAtIndex:i]);
  }
  uint64_t v14 = [v5 activationStatesCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t j = 0; j != v15; ++j)
      -[NPKProtoSecureElementGetAppletsResponse addActivationStates:](self, "addActivationStates:", [v5 activationStatesAtIndex:j]);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v5[7];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[NPKProtoSecureElementGetAppletsResponse addAppletsBytes:](self, "addAppletsBytes:", *(void *)(*((void *)&v22 + 1) + 8 * v21++), (void)v22);
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSMutableArray)cardAIDs
{
  return self->_cardAIDs;
}

- (void)setCardAIDs:(id)a3
{
}

- (NSMutableArray)appletsBytes
{
  return self->_appletsBytes;
}

- (void)setAppletsBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAIDs, 0);
  objc_storeStrong((id *)&self->_appletsBytes, 0);
}

@end
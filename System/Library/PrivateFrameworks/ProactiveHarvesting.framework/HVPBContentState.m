@interface HVPBContentState
+ (Class)consumersType;
- (BOOL)hasLevelOfService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)consumers;
- (id)consumersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)levelOfService;
- (unint64_t)consumersCount;
- (unint64_t)hash;
- (void)addConsumers:(id)a3;
- (void)clearConsumers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConsumers:(id)a3;
- (void)setHasLevelOfService:(BOOL)a3;
- (void)setLevelOfService:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HVPBContentState

- (void).cxx_destruct
{
}

- (int)levelOfService
{
  return self->_levelOfService;
}

- (void)setConsumers:(id)a3
{
}

- (NSMutableArray)consumers
{
  return self->_consumers;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[HVPBContentState addConsumers:](self, "addConsumers:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_levelOfService = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_consumers hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_levelOfService;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  consumers = self->_consumers;
  if ((unint64_t)consumers | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](consumers, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_levelOfService == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = self->_consumers;
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
        [(id)v5 addConsumers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_levelOfService;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HVPBContentState *)self consumersCount])
  {
    [v8 clearConsumers];
    unint64_t v4 = [(HVPBContentState *)self consumersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HVPBContentState *)self consumersAtIndex:i];
        [v8 addConsumers:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 4) = self->_levelOfService;
    *((unsigned char *)v8 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_consumers;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HVPBContentStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  consumers = self->_consumers;
  if (consumers) {
    [v3 setObject:consumers forKey:@"consumers"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithInt:self->_levelOfService];
    [v4 setObject:v6 forKey:@"levelOfService"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HVPBContentState;
  id v4 = [(HVPBContentState *)&v8 description];
  unint64_t v5 = [(HVPBContentState *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLevelOfService
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLevelOfService:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLevelOfService:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_levelOfService = a3;
}

- (id)consumersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_consumers objectAtIndex:a3];
}

- (unint64_t)consumersCount
{
  return [(NSMutableArray *)self->_consumers count];
}

- (void)addConsumers:(id)a3
{
  id v4 = a3;
  consumers = self->_consumers;
  id v8 = v4;
  if (!consumers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_consumers;
    self->_consumers = v6;

    id v4 = v8;
    consumers = self->_consumers;
  }
  [(NSMutableArray *)consumers addObject:v4];
}

- (void)clearConsumers
{
}

+ (Class)consumersType
{
  return (Class)objc_opt_class();
}

@end
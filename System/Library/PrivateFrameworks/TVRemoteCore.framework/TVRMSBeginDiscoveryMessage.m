@interface TVRMSBeginDiscoveryMessage
- (BOOL)hasDiscoveryTypes;
- (BOOL)hasHasPairedNetworkNames;
- (BOOL)hasPairedNetworkNames;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pairedNetworkNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairedNetworkNamesAtIndex:(unint64_t)a3;
- (int)discoveryTypes;
- (unint64_t)hash;
- (unint64_t)pairedNetworkNamesCount;
- (void)addPairedNetworkNames:(id)a3;
- (void)clearPairedNetworkNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDiscoveryTypes:(int)a3;
- (void)setHasDiscoveryTypes:(BOOL)a3;
- (void)setHasHasPairedNetworkNames:(BOOL)a3;
- (void)setHasPairedNetworkNames:(BOOL)a3;
- (void)setPairedNetworkNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSBeginDiscoveryMessage

- (void)setDiscoveryTypes:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_discoveryTypes = a3;
}

- (void)setHasDiscoveryTypes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscoveryTypes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearPairedNetworkNames
{
}

- (void)addPairedNetworkNames:(id)a3
{
  id v4 = a3;
  pairedNetworkNames = self->_pairedNetworkNames;
  id v8 = v4;
  if (!pairedNetworkNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_pairedNetworkNames;
    self->_pairedNetworkNames = v6;

    id v4 = v8;
    pairedNetworkNames = self->_pairedNetworkNames;
  }
  [(NSMutableArray *)pairedNetworkNames addObject:v4];
}

- (unint64_t)pairedNetworkNamesCount
{
  return [(NSMutableArray *)self->_pairedNetworkNames count];
}

- (id)pairedNetworkNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pairedNetworkNames objectAtIndex:a3];
}

- (void)setHasPairedNetworkNames:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasPairedNetworkNames = a3;
}

- (void)setHasHasPairedNetworkNames:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasPairedNetworkNames
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSBeginDiscoveryMessage;
  id v4 = [(TVRMSBeginDiscoveryMessage *)&v8 description];
  v5 = [(TVRMSBeginDiscoveryMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_discoveryTypes];
    [v3 setObject:v4 forKey:@"discoveryTypes"];
  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames) {
    [v3 setObject:pairedNetworkNames forKey:@"pairedNetworkNames"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_hasPairedNetworkNames];
    [v3 setObject:v6 forKey:@"hasPairedNetworkNames"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSBeginDiscoveryMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_pairedNetworkNames;
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_discoveryTypes;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  uint64_t v9 = v4;
  if ([(TVRMSBeginDiscoveryMessage *)self pairedNetworkNamesCount])
  {
    [v9 clearPairedNetworkNames];
    unint64_t v5 = [(TVRMSBeginDiscoveryMessage *)self pairedNetworkNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(TVRMSBeginDiscoveryMessage *)self pairedNetworkNamesAtIndex:i];
        [v9 addPairedNetworkNames:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9[24] = self->_hasPairedNetworkNames;
    v9[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (unsigned char *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_discoveryTypes;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_pairedNetworkNames;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addPairedNetworkNames:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6[24] = self->_hasPairedNetworkNames;
    v6[28] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((v4[28] & 1) == 0 || self->_discoveryTypes != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (v4[28])
  {
    goto LABEL_14;
  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if ((unint64_t)pairedNetworkNames | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](pairedNetworkNames, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (v4[28] & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v4[28] & 2) == 0 || self->_hasPairedNetworkNames != v4[24]) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_discoveryTypes;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_pairedNetworkNames hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_hasPairedNetworkNames;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (BOOL *)v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_discoveryTypes = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TVRMSBeginDiscoveryMessage addPairedNetworkNames:](self, "addPairedNetworkNames:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((v5[28] & 2) != 0)
  {
    self->_hasPairedNetworkNames = v5[24];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)discoveryTypes
{
  return self->_discoveryTypes;
}

- (NSMutableArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void)setPairedNetworkNames:(id)a3
{
}

- (BOOL)hasPairedNetworkNames
{
  return self->_hasPairedNetworkNames;
}

- (void).cxx_destruct
{
}

@end
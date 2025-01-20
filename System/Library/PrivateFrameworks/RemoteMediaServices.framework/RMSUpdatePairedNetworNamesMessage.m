@interface RMSUpdatePairedNetworNamesMessage
+ (Class)pairedNetworkNamesType;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pairedNetworkNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairedNetworkNamesAtIndex:(unint64_t)a3;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (unint64_t)pairedNetworkNamesCount;
- (void)addPairedNetworkNames:(id)a3;
- (void)clearPairedNetworkNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setPairedNetworkNames:(id)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSUpdatePairedNetworNamesMessage

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
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

+ (Class)pairedNetworkNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSUpdatePairedNetworNamesMessage;
  id v4 = [(RMSUpdatePairedNetworNamesMessage *)&v8 description];
  v5 = [(RMSUpdatePairedNetworNamesMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v4 forKey:@"sessionIdentifier"];
  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames) {
    [v3 setObject:pairedNetworkNames forKey:@"pairedNetworkNames"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSUpdatePairedNetworNamesMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(RMSUpdatePairedNetworNamesMessage *)self pairedNetworkNamesCount])
  {
    [v9 clearPairedNetworkNames];
    unint64_t v5 = [(RMSUpdatePairedNetworNamesMessage *)self pairedNetworkNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(RMSUpdatePairedNetworNamesMessage *)self pairedNetworkNamesAtIndex:i];
        [v9 addPairedNetworkNames:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 20) |= 1u;
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

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  pairedNetworkNames = self->_pairedNetworkNames;
  if ((unint64_t)pairedNetworkNames | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](pairedNetworkNames, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sessionIdentifier;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_pairedNetworkNames hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_sessionIdentifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
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
        -[RMSUpdatePairedNetworNamesMessage addPairedNetworkNames:](self, "addPairedNetworkNames:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSMutableArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void)setPairedNetworkNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
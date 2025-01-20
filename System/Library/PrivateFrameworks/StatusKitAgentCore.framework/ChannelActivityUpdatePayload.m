@interface ChannelActivityUpdatePayload
+ (Class)participantPayloadType;
- (BOOL)hasPadding;
- (BOOL)hasUpdateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSMutableArray)participantPayloads;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantPayloadAtIndex:(unint64_t)a3;
- (id)updateTypeAsString:(int)a3;
- (int)StringAsUpdateType:(id)a3;
- (int)updateType;
- (unint64_t)hash;
- (unint64_t)participantPayloadsCount;
- (void)addParticipantPayload:(id)a3;
- (void)clearParticipantPayloads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUpdateType:(BOOL)a3;
- (void)setPadding:(id)a3;
- (void)setParticipantPayloads:(id)a3;
- (void)setUpdateType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityUpdatePayload

- (int)updateType
{
  if (*(unsigned char *)&self->_has) {
    return self->_updateType;
  }
  else {
    return 0;
  }
}

- (void)setUpdateType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_updateType = a3;
}

- (void)setHasUpdateType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUpdateType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)updateTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"PARTICIPANT_REMOVED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"PARTICIPANT_ADDED";
  }
  return v4;
}

- (int)StringAsUpdateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PARTICIPANT_ADDED"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PARTICIPANT_REMOVED"];
  }

  return v4;
}

- (void)clearParticipantPayloads
{
}

- (void)addParticipantPayload:(id)a3
{
  id v4 = a3;
  participantPayloads = self->_participantPayloads;
  id v8 = v4;
  if (!participantPayloads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_participantPayloads;
    self->_participantPayloads = v6;

    id v4 = v8;
    participantPayloads = self->_participantPayloads;
  }
  [(NSMutableArray *)participantPayloads addObject:v4];
}

- (unint64_t)participantPayloadsCount
{
  return [(NSMutableArray *)self->_participantPayloads count];
}

- (id)participantPayloadAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participantPayloads objectAtIndex:a3];
}

+ (Class)participantPayloadType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityUpdatePayload;
  id v4 = [(ChannelActivityUpdatePayload *)&v8 description];
  v5 = [(ChannelActivityUpdatePayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int updateType = self->_updateType;
    if (updateType)
    {
      if (updateType == 1)
      {
        v5 = @"PARTICIPANT_REMOVED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_updateType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"PARTICIPANT_ADDED";
    }
    [v3 setObject:v5 forKey:@"update_type"];
  }
  if ([(NSMutableArray *)self->_participantPayloads count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_participantPayloads, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_participantPayloads;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"participant_payload"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityUpdatePayloadReadFrom((uint64_t)self, (uint64_t)a3);
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
  v5 = self->_participantPayloads;
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

  if (self->_padding) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_updateType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v9 = v4;
  if ([(ChannelActivityUpdatePayload *)self participantPayloadsCount])
  {
    [v9 clearParticipantPayloads];
    unint64_t v5 = [(ChannelActivityUpdatePayload *)self participantPayloadsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ChannelActivityUpdatePayload *)self participantPayloadAtIndex:i];
        [v9 addParticipantPayload:v8];
      }
    }
  }
  if (self->_padding) {
    objc_msgSend(v9, "setPadding:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_updateType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_participantPayloads;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        [v6 addParticipantPayload:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSData *)self->_padding copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_updateType != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  participantPayloads = self->_participantPayloads;
  if ((unint64_t)participantPayloads | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](participantPayloads, "isEqual:"))
  {
    goto LABEL_11;
  }
  padding = self->_padding;
  if ((unint64_t)padding | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](padding, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_updateType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_participantPayloads hash] ^ v3;
  return v4 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_int updateType = *((_DWORD *)v4 + 6);
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
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ChannelActivityUpdatePayload addParticipantPayload:](self, "addParticipantPayload:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[1]) {
    -[ChannelActivityUpdatePayload setPadding:](self, "setPadding:");
  }
}

- (NSMutableArray)participantPayloads
{
  return self->_participantPayloads;
}

- (void)setParticipantPayloads:(id)a3
{
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantPayloads, 0);
  objc_storeStrong((id *)&self->_padding, 0);
}

@end
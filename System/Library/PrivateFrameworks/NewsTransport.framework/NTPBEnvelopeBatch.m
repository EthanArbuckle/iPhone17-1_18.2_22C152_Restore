@interface NTPBEnvelopeBatch
+ (Class)envelopeType;
- (BOOL)hasEnvelopeDroppedCountDueToSizeLimit;
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasPatchVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)envelopes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)envelopeAtIndex:(unint64_t)a3;
- (int)envelopeDroppedCountDueToSizeLimit;
- (int)majorVersion;
- (int)minorVersion;
- (int)patchVersion;
- (unint64_t)envelopesCount;
- (unint64_t)hash;
- (void)addEnvelope:(id)a3;
- (void)clearEnvelopes;
- (void)mergeFrom:(id)a3;
- (void)setEnvelopeDroppedCountDueToSizeLimit:(int)a3;
- (void)setEnvelopes:(id)a3;
- (void)setHasEnvelopeDroppedCountDueToSizeLimit:(BOOL)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasPatchVersion:(BOOL)a3;
- (void)setMajorVersion:(int)a3;
- (void)setMinorVersion:(int)a3;
- (void)setPatchVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEnvelopeBatch

- (void)clearEnvelopes
{
}

- (void)addEnvelope:(id)a3
{
  id v4 = a3;
  envelopes = self->_envelopes;
  id v8 = v4;
  if (!envelopes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_envelopes;
    self->_envelopes = v6;

    id v4 = v8;
    envelopes = self->_envelopes;
  }
  [(NSMutableArray *)envelopes addObject:v4];
}

- (unint64_t)envelopesCount
{
  return [(NSMutableArray *)self->_envelopes count];
}

- (id)envelopeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_envelopes objectAtIndex:a3];
}

+ (Class)envelopeType
{
  return (Class)objc_opt_class();
}

- (void)setMajorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMinorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPatchVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_patchVersion = a3;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPatchVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEnvelopeDroppedCountDueToSizeLimit:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_envelopeDroppedCountDueToSizeLimit = a3;
}

- (void)setHasEnvelopeDroppedCountDueToSizeLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnvelopeDroppedCountDueToSizeLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEnvelopeBatch;
  id v4 = [(NTPBEnvelopeBatch *)&v8 description];
  v5 = [(NTPBEnvelopeBatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_envelopes count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_envelopes, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_envelopes;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"envelope"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_majorVersion];
    [v3 setObject:v14 forKey:@"major_version"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  v15 = objc_msgSend(NSNumber, "numberWithInt:", self->_minorVersion, (void)v17);
  [v3 setObject:v15 forKey:@"minor_version"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_20:
  v16 = objc_msgSend(NSNumber, "numberWithInt:", self->_patchVersion, (void)v17);
  [v3 setObject:v16 forKey:@"patch_version"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    v12 = objc_msgSend(NSNumber, "numberWithInt:", self->_envelopeDroppedCountDueToSizeLimit, (void)v17);
    [v3 setObject:v12 forKey:@"envelope_dropped_count_due_to_size_limit"];
  }
LABEL_15:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEnvelopeBatchReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_envelopes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if (has) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_envelopes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addEnvelope:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_majorVersion;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(_DWORD *)(v5 + 32) = self->_patchVersion;
      *(unsigned char *)(v5 + 36) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 28) = self->_minorVersion;
  *(unsigned char *)(v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if (has)
  {
LABEL_12:
    *(_DWORD *)(v5 + 8) = self->_envelopeDroppedCountDueToSizeLimit;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  envelopes = self->_envelopes;
  if ((unint64_t)envelopes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](envelopes, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_majorVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_minorVersion != *((_DWORD *)v4 + 7)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_patchVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_envelopeDroppedCountDueToSizeLimit != *((_DWORD *)v4 + 2)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_envelopes hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_majorVersion;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_minorVersion;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_patchVersion;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_envelopeDroppedCountDueToSizeLimit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTPBEnvelopeBatch addEnvelope:](self, "addEnvelope:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 36);
  if ((v10 & 2) != 0)
  {
    self->_majorVersion = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v4 + 36);
    if ((v10 & 4) == 0)
    {
LABEL_10:
      if ((v10 & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      self->_patchVersion = *((_DWORD *)v4 + 8);
      *(unsigned char *)&self->_has |= 8u;
      if ((*((unsigned char *)v4 + 36) & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_10;
  }
  self->_minorVersion = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v10 = *((unsigned char *)v4 + 36);
  if ((v10 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if (v10)
  {
LABEL_12:
    self->_envelopeDroppedCountDueToSizeLimit = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_13:
}

- (NSMutableArray)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (int)envelopeDroppedCountDueToSizeLimit
{
  return self->_envelopeDroppedCountDueToSizeLimit;
}

- (void).cxx_destruct
{
}

@end
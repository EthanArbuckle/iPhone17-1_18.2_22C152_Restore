@interface KCellularServingCellRfBandHist
+ (Class)pcellBandDurationType;
- (BOOL)hasDurationMs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pcellBandDurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pcellBandDurationAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pcellBandDurationsCount;
- (unint64_t)timestamp;
- (unsigned)durationMs;
- (unsigned)subsId;
- (void)addPcellBandDuration:(id)a3;
- (void)clearPcellBandDurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPcellBandDurations:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularServingCellRfBandHist

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearPcellBandDurations
{
}

- (void)addPcellBandDuration:(id)a3
{
  id v4 = a3;
  pcellBandDurations = self->_pcellBandDurations;
  id v8 = v4;
  if (!pcellBandDurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pcellBandDurations;
    self->_pcellBandDurations = v6;

    id v4 = v8;
    pcellBandDurations = self->_pcellBandDurations;
  }
  [(NSMutableArray *)pcellBandDurations addObject:v4];
}

- (unint64_t)pcellBandDurationsCount
{
  return [(NSMutableArray *)self->_pcellBandDurations count];
}

- (id)pcellBandDurationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pcellBandDurations objectAtIndex:a3];
}

+ (Class)pcellBandDurationType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularServingCellRfBandHist;
  id v4 = [(KCellularServingCellRfBandHist *)&v8 description];
  v5 = [(KCellularServingCellRfBandHist *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_durationMs];
    [v3 setObject:v6 forKey:@"duration_ms"];
  }
  if ([(NSMutableArray *)self->_pcellBandDurations count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pcellBandDurations, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v8 = self->_pcellBandDurations;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"pcell_band_duration"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v14 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularServingCellRfBandHistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_pcellBandDurations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_durationMs;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  id v10 = v4;
  if ([(KCellularServingCellRfBandHist *)self pcellBandDurationsCount])
  {
    [v10 clearPcellBandDurations];
    unint64_t v6 = [(KCellularServingCellRfBandHist *)self pcellBandDurationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(KCellularServingCellRfBandHist *)self pcellBandDurationAtIndex:i];
        [v10 addPcellBandDuration:v9];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_subsId;
    *((unsigned char *)v10 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_durationMs;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_pcellBandDurations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addPcellBandDuration:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_subsId;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  pcellBandDurations = self->_pcellBandDurations;
  if ((unint64_t)pcellBandDurations | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](pcellBandDurations, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_durationMs;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_pcellBandDurations hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((v6 & 2) != 0)
  {
    self->_durationMs = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[KCellularServingCellRfBandHist addPcellBandDuration:](self, "addPcellBandDuration:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((v5[9] & 4) != 0)
  {
    self->_subsId = v5[8];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (NSMutableArray)pcellBandDurations
{
  return self->_pcellBandDurations;
}

- (void)setPcellBandDurations:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end
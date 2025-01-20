@interface POMMESSchemaPOMMESCacheMaintenanceEnded
- (BOOL)hasNumberOfEntriesUpdated;
- (BOOL)hasReason;
- (BOOL)hasTimeSinceMaintenanceStartedInSeconds;
- (BOOL)hasTotalCacheEntries;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (unsigned)numberOfEntriesUpdated;
- (unsigned)timeSinceMaintenanceStartedInSeconds;
- (unsigned)totalCacheEntries;
- (void)deleteNumberOfEntriesUpdated;
- (void)deleteReason;
- (void)deleteTimeSinceMaintenanceStartedInSeconds;
- (void)deleteTotalCacheEntries;
- (void)setHasNumberOfEntriesUpdated:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasTimeSinceMaintenanceStartedInSeconds:(BOOL)a3;
- (void)setHasTotalCacheEntries:(BOOL)a3;
- (void)setNumberOfEntriesUpdated:(unsigned int)a3;
- (void)setReason:(int)a3;
- (void)setTimeSinceMaintenanceStartedInSeconds:(unsigned int)a3;
- (void)setTotalCacheEntries:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheMaintenanceEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (unsigned)timeSinceMaintenanceStartedInSeconds
{
  return self->_timeSinceMaintenanceStartedInSeconds;
}

- (unsigned)totalCacheEntries
{
  return self->_totalCacheEntries;
}

- (unsigned)numberOfEntriesUpdated
{
  return self->_numberOfEntriesUpdated;
}

- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESCacheMaintenanceEnded;
  v5 = [(POMMESSchemaPOMMESCacheMaintenanceEnded *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfEntriesUpdated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setNumberOfEntriesUpdated:](v5, "setNumberOfEntriesUpdated:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"totalCacheEntries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setTotalCacheEntries:](v5, "setTotalCacheEntries:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"timeSinceMaintenanceStartedInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setTimeSinceMaintenanceStartedInSeconds:](v5, "setTimeSinceMaintenanceStartedInSeconds:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheMaintenanceEnded setReason:](v5, "setReason:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheMaintenanceEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheMaintenanceEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheMaintenanceEnded *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded numberOfEntriesUpdated](self, "numberOfEntriesUpdated"));
    [v3 setObject:v7 forKeyedSubscript:@"numberOfEntriesUpdated"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  int v8 = [(POMMESSchemaPOMMESCacheMaintenanceEnded *)self reason];
  v9 = @"POMMESCACHEMAINTENANCEENDEDREASON_UNKNOWN";
  if (v8 == 1) {
    v9 = @"POMMESCACHEMAINTENANCEENDEDREASON_COMPLETE";
  }
  if (v8 == 2) {
    v10 = @"POMMESCACHEMAINTENANCEENDEDREASON_DEFERRED";
  }
  else {
    v10 = v9;
  }
  [v3 setObject:v10 forKeyedSubscript:@"reason"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded timeSinceMaintenanceStartedInSeconds](self, "timeSinceMaintenanceStartedInSeconds"));
  [v3 setObject:v11 forKeyedSubscript:@"timeSinceMaintenanceStartedInSeconds"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceEnded totalCacheEntries](self, "totalCacheEntries"));
    [v3 setObject:v5 forKeyedSubscript:@"totalCacheEntries"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_numberOfEntriesUpdated;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_totalCacheEntries;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_timeSinceMaintenanceStartedInSeconds;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $53BC70F6AD4EDD6FDDA9DE2A40691B04 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numberOfEntriesUpdated = self->_numberOfEntriesUpdated;
    if (numberOfEntriesUpdated != [v4 numberOfEntriesUpdated]) {
      goto LABEL_18;
    }
    $53BC70F6AD4EDD6FDDA9DE2A40691B04 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int totalCacheEntries = self->_totalCacheEntries;
    if (totalCacheEntries != [v4 totalCacheEntries]) {
      goto LABEL_18;
    }
    $53BC70F6AD4EDD6FDDA9DE2A40691B04 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int timeSinceMaintenanceStartedInSeconds = self->_timeSinceMaintenanceStartedInSeconds;
    if (timeSinceMaintenanceStartedInSeconds == [v4 timeSinceMaintenanceStartedInSeconds])
    {
      $53BC70F6AD4EDD6FDDA9DE2A40691B04 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheMaintenanceEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int reason = a3;
}

- (void)deleteTimeSinceMaintenanceStartedInSeconds
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTimeSinceMaintenanceStartedInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeSinceMaintenanceStartedInSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceMaintenanceStartedInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int timeSinceMaintenanceStartedInSeconds = a3;
}

- (void)deleteTotalCacheEntries
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTotalCacheEntries:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalCacheEntries
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalCacheEntries:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int totalCacheEntries = a3;
}

- (void)deleteNumberOfEntriesUpdated
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumberOfEntriesUpdated:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfEntriesUpdated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfEntriesUpdated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numberOfEntriesUpdated = a3;
}

@end
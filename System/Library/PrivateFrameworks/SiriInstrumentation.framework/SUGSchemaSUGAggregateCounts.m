@interface SUGSchemaSUGAggregateCounts
- (BOOL)hasLast28DaysBucket;
- (BOOL)hasLastDayCount;
- (BOOL)hasLastWeekBucket;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SUGSchemaSUGAggregateCounts)initWithDictionary:(id)a3;
- (SUGSchemaSUGAggregateCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)last28DaysBucket;
- (unsigned)lastDayCount;
- (unsigned)lastWeekBucket;
- (void)deleteLast28DaysBucket;
- (void)deleteLastDayCount;
- (void)deleteLastWeekBucket;
- (void)setHasLast28DaysBucket:(BOOL)a3;
- (void)setHasLastDayCount:(BOOL)a3;
- (void)setHasLastWeekBucket:(BOOL)a3;
- (void)setLast28DaysBucket:(unsigned int)a3;
- (void)setLastDayCount:(unsigned int)a3;
- (void)setLastWeekBucket:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGAggregateCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)last28DaysBucket
{
  return self->_last28DaysBucket;
}

- (unsigned)lastWeekBucket
{
  return self->_lastWeekBucket;
}

- (unsigned)lastDayCount
{
  return self->_lastDayCount;
}

- (SUGSchemaSUGAggregateCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUGSchemaSUGAggregateCounts;
  v5 = [(SUGSchemaSUGAggregateCounts *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"lastDayCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGAggregateCounts setLastDayCount:](v5, "setLastDayCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"lastWeekBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGAggregateCounts setLastWeekBucket:](v5, "setLastWeekBucket:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"last28DaysBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGAggregateCounts setLast28DaysBucket:](v5, "setLast28DaysBucket:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SUGSchemaSUGAggregateCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGAggregateCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGAggregateCounts *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts last28DaysBucket](self, "last28DaysBucket"));
    [v3 setObject:v7 forKeyedSubscript:@"last28DaysBucket"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts lastDayCount](self, "lastDayCount"));
  [v3 setObject:v8 forKeyedSubscript:@"lastDayCount"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGAggregateCounts lastWeekBucket](self, "lastWeekBucket"));
    [v3 setObject:v5 forKeyedSubscript:@"lastWeekBucket"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_lastDayCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_lastWeekBucket;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_last28DaysBucket;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $1BEFDD17A1494AC702F10A4293EF4E2D has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int lastDayCount = self->_lastDayCount;
    if (lastDayCount != [v4 lastDayCount]) {
      goto LABEL_14;
    }
    $1BEFDD17A1494AC702F10A4293EF4E2D has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int lastWeekBucket = self->_lastWeekBucket;
    if (lastWeekBucket == [v4 lastWeekBucket])
    {
      $1BEFDD17A1494AC702F10A4293EF4E2D has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unsigned int last28DaysBucket = self->_last28DaysBucket;
    if (last28DaysBucket != [v4 last28DaysBucket]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGAggregateCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteLast28DaysBucket
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLast28DaysBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLast28DaysBucket
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLast28DaysBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int last28DaysBucket = a3;
}

- (void)deleteLastWeekBucket
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLastWeekBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastWeekBucket
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLastWeekBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int lastWeekBucket = a3;
}

- (void)deleteLastDayCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLastDayCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastDayCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastDayCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int lastDayCount = a3;
}

@end
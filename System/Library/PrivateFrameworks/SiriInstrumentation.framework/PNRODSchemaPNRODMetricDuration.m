@interface PNRODSchemaPNRODMetricDuration
- (BOOL)hasEndEventIndex;
- (BOOL)hasMetricValue;
- (BOOL)hasStartEventIndex;
- (BOOL)hasStartTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODMetricDuration)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODMetricDuration)initWithJSON:(id)a3;
- (double)metricValue;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)endEventIndex;
- (int64_t)startEventIndex;
- (int64_t)startTimestamp;
- (unint64_t)hash;
- (void)deleteEndEventIndex;
- (void)deleteMetricValue;
- (void)deleteStartEventIndex;
- (void)deleteStartTimestamp;
- (void)setEndEventIndex:(int64_t)a3;
- (void)setHasEndEventIndex:(BOOL)a3;
- (void)setHasMetricValue:(BOOL)a3;
- (void)setHasStartEventIndex:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setMetricValue:(double)a3;
- (void)setStartEventIndex:(int64_t)a3;
- (void)setStartTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODMetricDuration

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int64_t)endEventIndex
{
  return self->_endEventIndex;
}

- (int64_t)startEventIndex
{
  return self->_startEventIndex;
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (double)metricValue
{
  return self->_metricValue;
}

- (PNRODSchemaPNRODMetricDuration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNRODSchemaPNRODMetricDuration;
  v5 = [(PNRODSchemaPNRODMetricDuration *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"metricValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PNRODSchemaPNRODMetricDuration setMetricValue:](v5, "setMetricValue:");
    }
    v7 = [v4 objectForKeyedSubscript:@"startTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODMetricDuration setStartTimestamp:](v5, "setStartTimestamp:", [v7 longLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"startEventIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODMetricDuration setStartEventIndex:](v5, "setStartEventIndex:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"endEventIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODMetricDuration setEndEventIndex:](v5, "setEndEventIndex:", [v9 longLongValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODMetricDuration)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODMetricDuration *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODMetricDuration *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration endEventIndex](self, "endEventIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"endEventIndex"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = NSNumber;
  [(PNRODSchemaPNRODMetricDuration *)self metricValue];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"metricValue"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration startEventIndex](self, "startEventIndex"));
  [v3 setObject:v10 forKeyedSubscript:@"startEventIndex"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODMetricDuration startTimestamp](self, "startTimestamp"));
    [v3 setObject:v5 forKeyedSubscript:@"startTimestamp"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double metricValue = self->_metricValue;
    double v6 = -metricValue;
    if (metricValue >= 0.0) {
      double v6 = self->_metricValue;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_startTimestamp;
  if ((has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_startEventIndex;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_endEventIndex;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $652B1320B5DD2052B02D28CA035CC60D has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    double metricValue = self->_metricValue;
    [v4 metricValue];
    if (metricValue != v8) {
      goto LABEL_18;
    }
    $652B1320B5DD2052B02D28CA035CC60D has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v9)
  {
    int64_t startTimestamp = self->_startTimestamp;
    if (startTimestamp != [v4 startTimestamp]) {
      goto LABEL_18;
    }
    $652B1320B5DD2052B02D28CA035CC60D has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v11)
  {
    int64_t startEventIndex = self->_startEventIndex;
    if (startEventIndex == [v4 startEventIndex])
    {
      $652B1320B5DD2052B02D28CA035CC60D has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v15 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int64_t endEventIndex = self->_endEventIndex;
    if (endEventIndex != [v4 endEventIndex]) {
      goto LABEL_18;
    }
  }
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteInt64Field();
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
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt64Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODMetricDurationReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndEventIndex
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEndEventIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndEventIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndEventIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int64_t endEventIndex = a3;
}

- (void)deleteStartEventIndex
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasStartEventIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartEventIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartEventIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t startEventIndex = a3;
}

- (void)deleteStartTimestamp
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t startTimestamp = a3;
}

- (void)deleteMetricValue
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMetricValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMetricValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMetricValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double metricValue = a3;
}

@end
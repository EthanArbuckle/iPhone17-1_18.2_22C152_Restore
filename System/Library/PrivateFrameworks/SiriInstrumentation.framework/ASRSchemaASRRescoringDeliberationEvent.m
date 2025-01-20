@interface ASRSchemaASRRescoringDeliberationEvent
- (ASRSchemaASRRescoringDeliberationEvent)initWithDictionary:(id)a3;
- (ASRSchemaASRRescoringDeliberationEvent)initWithJSON:(id)a3;
- (BOOL)hasEventDuration;
- (BOOL)hasEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (float)eventDuration;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventType;
- (unint64_t)hash;
- (void)deleteEventDuration;
- (void)deleteEventType;
- (void)setEventDuration:(float)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventDuration:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRescoringDeliberationEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)eventDuration
{
  return self->_eventDuration;
}

- (int)eventType
{
  return self->_eventType;
}

- (ASRSchemaASRRescoringDeliberationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRRescoringDeliberationEvent;
  v5 = [(ASRSchemaASRRescoringDeliberationEvent *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRescoringDeliberationEvent setEventType:](v5, "setEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"eventDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[ASRSchemaASRRescoringDeliberationEvent setEventDuration:](v5, "setEventDuration:");
    }
    v8 = v5;
  }
  return v5;
}

- (ASRSchemaASRRescoringDeliberationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRescoringDeliberationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRescoringDeliberationEvent *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = NSNumber;
    [(ASRSchemaASRRescoringDeliberationEvent *)self eventDuration];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"eventDuration"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(ASRSchemaASRRescoringDeliberationEvent *)self eventType] - 1;
    if (v7 > 7) {
      v8 = @"ASRRESCORINGDELIBERATIONEVENTTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EC1B70[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"eventType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_eventType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float eventDuration = self->_eventDuration;
  double v4 = eventDuration;
  if (eventDuration < 0.0) {
    double v4 = -eventDuration;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $1DC6A29E1C09462833150E00614F7F3A has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int eventType = self->_eventType;
    if (eventType != [v4 eventType]) {
      goto LABEL_9;
    }
    $1DC6A29E1C09462833150E00614F7F3A has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (float eventDuration = self->_eventDuration, [v4 eventDuration], eventDuration == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRescoringDeliberationEventReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteEventDuration
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEventDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEventDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float eventDuration = a3;
}

- (void)deleteEventType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int eventType = a3;
}

@end
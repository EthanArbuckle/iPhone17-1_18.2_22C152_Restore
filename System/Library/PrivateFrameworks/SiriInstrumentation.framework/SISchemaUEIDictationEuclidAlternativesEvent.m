@interface SISchemaUEIDictationEuclidAlternativesEvent
- (BOOL)hasAlternativesIndexSelectedByUser;
- (BOOL)hasEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationEuclidAlternativesEvent)initWithDictionary:(id)a3;
- (SISchemaUEIDictationEuclidAlternativesEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventType;
- (int64_t)alternativesIndexSelectedByUser;
- (unint64_t)hash;
- (void)deleteAlternativesIndexSelectedByUser;
- (void)deleteEventType;
- (void)setAlternativesIndexSelectedByUser:(int64_t)a3;
- (void)setEventType:(int)a3;
- (void)setHasAlternativesIndexSelectedByUser:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationEuclidAlternativesEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int64_t)alternativesIndexSelectedByUser
{
  return self->_alternativesIndexSelectedByUser;
}

- (int)eventType
{
  return self->_eventType;
}

- (SISchemaUEIDictationEuclidAlternativesEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIDictationEuclidAlternativesEvent;
  v5 = [(SISchemaUEIDictationEuclidAlternativesEvent *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationEuclidAlternativesEvent setEventType:](v5, "setEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"alternativesIndexSelectedByUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationEuclidAlternativesEvent setAlternativesIndexSelectedByUser:](v5, "setAlternativesIndexSelectedByUser:", [v7 longLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationEuclidAlternativesEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationEuclidAlternativesEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationEuclidAlternativesEvent *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaUEIDictationEuclidAlternativesEvent alternativesIndexSelectedByUser](self, "alternativesIndexSelectedByUser"));
    [v3 setObject:v5 forKeyedSubscript:@"alternativesIndexSelectedByUser"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int v6 = [(SISchemaUEIDictationEuclidAlternativesEvent *)self eventType];
    uint64_t v7 = @"EUCLID_ALTERNATIVES_EVENT_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"EUCLID_ALTERNATIVES_EVENT_EUCLID_REQUESTED";
    }
    if (v6 == 2) {
      v8 = @"EUCLID_ALTERNATIVES_EVENT_EUCLID_SELECTED_FROM_QUICKTYPE_BAR";
    }
    else {
      v8 = v7;
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
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_alternativesIndexSelectedByUser;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $08D4CD2062B8A5EE88B0743BF27E6271 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int eventType = self->_eventType;
    if (eventType != [v4 eventType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $08D4CD2062B8A5EE88B0743BF27E6271 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int64_t alternativesIndexSelectedByUser = self->_alternativesIndexSelectedByUser;
    if (alternativesIndexSelectedByUser != [v4 alternativesIndexSelectedByUser]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
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
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationEuclidAlternativesEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlternativesIndexSelectedByUser
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAlternativesIndexSelectedByUser:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAlternativesIndexSelectedByUser
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAlternativesIndexSelectedByUser:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t alternativesIndexSelectedByUser = a3;
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
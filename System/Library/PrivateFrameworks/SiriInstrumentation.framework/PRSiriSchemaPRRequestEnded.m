@interface PRSiriSchemaPRRequestEnded
- (BOOL)hasEventName;
- (BOOL)hasTranscriptEventId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PRSiriSchemaPRRequestEnded)initWithDictionary:(id)a3;
- (PRSiriSchemaPRRequestEnded)initWithJSON:(id)a3;
- (SISchemaUUID)transcriptEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventName;
- (unint64_t)hash;
- (void)deleteEventName;
- (void)deleteTranscriptEventId;
- (void)setEventName:(int)a3;
- (void)setHasEventName:(BOOL)a3;
- (void)setHasTranscriptEventId:(BOOL)a3;
- (void)setTranscriptEventId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PRSiriSchemaPRRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PRSiriSchemaPRRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PRSiriSchemaPRRequestEnded *)self deleteTranscriptEventId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasTranscriptEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)eventName
{
  return self->_eventName;
}

- (void)setTranscriptEventId:(id)a3
{
}

- (SISchemaUUID)transcriptEventId
{
  return self->_transcriptEventId;
}

- (PRSiriSchemaPRRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSiriSchemaPRRequestEnded;
  v5 = [(PRSiriSchemaPRRequestEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"transcriptEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PRSiriSchemaPRRequestEnded *)v5 setTranscriptEventId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"eventName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRRequestEnded setEventName:](v5, "setEventName:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PRSiriSchemaPRRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PRSiriSchemaPRRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PRSiriSchemaPRRequestEnded *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(PRSiriSchemaPRRequestEnded *)self eventName] - 1;
    if (v4 > 6) {
      v5 = @"TRANSCRIPTEVENTTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF2C8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"eventName"];
  }
  if (self->_transcriptEventId)
  {
    v6 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"transcriptEventId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"transcriptEventId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_transcriptEventId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_eventName;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
  v6 = [v4 transcriptEventId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
    objc_super v11 = [v4 transcriptEventId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int eventName = self->_eventName;
    if (eventName != [v4 eventName]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];

  if (v4)
  {
    v5 = [(PRSiriSchemaPRRequestEnded *)self transcriptEventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteEventName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int eventName = a3;
}

- (void)deleteTranscriptEventId
{
}

- (BOOL)hasTranscriptEventId
{
  return self->_transcriptEventId != 0;
}

@end
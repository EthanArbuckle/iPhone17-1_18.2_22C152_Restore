@interface DUSchemaDUSearchSessionRecord
- (BOOL)hasSessionId;
- (BOOL)hasSessionStartTimestampMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DUSchemaDUSearchSessionRecord)initWithDictionary:(id)a3;
- (DUSchemaDUSearchSessionRecord)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)sessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)sessionStartTimestampMs;
- (void)deleteSessionId;
- (void)deleteSessionStartTimestampMs;
- (void)setHasSessionId:(BOOL)a3;
- (void)setHasSessionStartTimestampMs:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionStartTimestampMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DUSchemaDUSearchSessionRecord

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DUSchemaDUSearchSessionRecord;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DUSchemaDUSearchSessionRecord *)self deleteSessionId];
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

- (void)setHasSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)sessionStartTimestampMs
{
  return self->_sessionStartTimestampMs;
}

- (void)setSessionId:(id)a3
{
}

- (SISchemaUUID)sessionId
{
  return self->_sessionId;
}

- (DUSchemaDUSearchSessionRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DUSchemaDUSearchSessionRecord;
  v5 = [(DUSchemaDUSearchSessionRecord *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DUSchemaDUSearchSessionRecord *)v5 setSessionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sessionStartTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DUSchemaDUSearchSessionRecord setSessionStartTimestampMs:](v5, "setSessionStartTimestampMs:", [v8 unsignedLongLongValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (DUSchemaDUSearchSessionRecord)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DUSchemaDUSearchSessionRecord *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DUSchemaDUSearchSessionRecord *)self dictionaryRepresentation];
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
  if (self->_sessionId)
  {
    id v4 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"sessionId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"sessionId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DUSchemaDUSearchSessionRecord sessionStartTimestampMs](self, "sessionStartTimestampMs"));
    [v3 setObject:v7 forKeyedSubscript:@"sessionStartTimestampMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sessionId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_sessionStartTimestampMs;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
  v6 = [v4 sessionId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
    objc_super v11 = [v4 sessionId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t sessionStartTimestampMs = self->_sessionStartTimestampMs;
    if (sessionStartTimestampMs != [v4 sessionStartTimestampMs]) {
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
  unint64_t v4 = [(DUSchemaDUSearchSessionRecord *)self sessionId];

  if (v4)
  {
    v5 = [(DUSchemaDUSearchSessionRecord *)self sessionId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUSearchSessionRecordReadFrom(self, (uint64_t)a3);
}

- (void)deleteSessionStartTimestampMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSessionStartTimestampMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartTimestampMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSessionStartTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t sessionStartTimestampMs = a3;
}

- (void)deleteSessionId
{
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

@end
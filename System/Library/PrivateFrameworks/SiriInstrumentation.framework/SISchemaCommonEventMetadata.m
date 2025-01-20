@interface SISchemaCommonEventMetadata
- (BOOL)hasEmitTimestamp;
- (BOOL)hasEventId;
- (BOOL)hasTestFingerprint;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaCommonEventMetadata)initWithDictionary:(id)a3;
- (SISchemaCommonEventMetadata)initWithJSON:(id)a3;
- (SISchemaLogicalTimestamp)timestamp;
- (SISchemaUUID)eventId;
- (SISchemaUUID)testFingerprint;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)emitTimestamp;
- (unint64_t)hash;
- (void)deleteEmitTimestamp;
- (void)deleteEventId;
- (void)deleteTestFingerprint;
- (void)deleteTimestamp;
- (void)setEmitTimestamp:(int64_t)a3;
- (void)setEventId:(id)a3;
- (void)setHasEmitTimestamp:(BOOL)a3;
- (void)setHasEventId:(BOOL)a3;
- (void)setHasTestFingerprint:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestFingerprint:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCommonEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaCommonEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaCommonEventMetadata *)self timestamp];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaCommonEventMetadata *)self deleteTimestamp];
  }
  v9 = [(SISchemaCommonEventMetadata *)self testFingerprint];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaCommonEventMetadata *)self deleteTestFingerprint];
  }
  v12 = [(SISchemaCommonEventMetadata *)self eventId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaCommonEventMetadata *)self deleteEventId];
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
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_testFingerprint, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)setHasEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasTestFingerprint:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)emitTimestamp
{
  return self->_emitTimestamp;
}

- (void)setEventId:(id)a3
{
}

- (SISchemaUUID)eventId
{
  return self->_eventId;
}

- (void)setTestFingerprint:(id)a3
{
}

- (SISchemaUUID)testFingerprint
{
  return self->_testFingerprint;
}

- (void)setTimestamp:(id)a3
{
}

- (SISchemaLogicalTimestamp)timestamp
{
  return self->_timestamp;
}

- (SISchemaCommonEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaCommonEventMetadata;
  v5 = [(SISchemaCommonEventMetadata *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaLogicalTimestamp alloc] initWithDictionary:v6];
      [(SISchemaCommonEventMetadata *)v5 setTimestamp:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"testFingerprint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(SISchemaCommonEventMetadata *)v5 setTestFingerprint:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"eventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(SISchemaCommonEventMetadata *)v5 setEventId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"emitTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCommonEventMetadata setEmitTimestamp:](v5, "setEmitTimestamp:", [v12 longLongValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (SISchemaCommonEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCommonEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCommonEventMetadata *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaCommonEventMetadata emitTimestamp](self, "emitTimestamp"));
    [v3 setObject:v4 forKeyedSubscript:@"emitTimestamp"];
  }
  if (self->_eventId)
  {
    v5 = [(SISchemaCommonEventMetadata *)self eventId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"eventId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"eventId"];
    }
  }
  if (self->_testFingerprint)
  {
    int v8 = [(SISchemaCommonEventMetadata *)self testFingerprint];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"testFingerprint"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"testFingerprint"];
    }
  }
  if (self->_timestamp)
  {
    int v11 = [(SISchemaCommonEventMetadata *)self timestamp];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"timestamp"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"timestamp"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaLogicalTimestamp *)self->_timestamp hash];
  unint64_t v4 = [(SISchemaUUID *)self->_testFingerprint hash];
  unint64_t v5 = [(SISchemaUUID *)self->_eventId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_emitTimestamp;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(SISchemaCommonEventMetadata *)self timestamp];
  uint64_t v6 = [v4 timestamp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaCommonEventMetadata *)self timestamp];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaCommonEventMetadata *)self timestamp];
    v10 = [v4 timestamp];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaCommonEventMetadata *)self testFingerprint];
  uint64_t v6 = [v4 testFingerprint];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaCommonEventMetadata *)self testFingerprint];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(SISchemaCommonEventMetadata *)self testFingerprint];
    objc_super v15 = [v4 testFingerprint];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaCommonEventMetadata *)self eventId];
  uint64_t v6 = [v4 eventId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(SISchemaCommonEventMetadata *)self eventId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaCommonEventMetadata *)self eventId];
    v20 = [v4 eventId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[40] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int64_t emitTimestamp = self->_emitTimestamp, emitTimestamp == [v4 emitTimestamp]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(SISchemaCommonEventMetadata *)self timestamp];

  if (v4)
  {
    unint64_t v5 = [(SISchemaCommonEventMetadata *)self timestamp];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(SISchemaCommonEventMetadata *)self testFingerprint];

  if (v6)
  {
    uint64_t v7 = [(SISchemaCommonEventMetadata *)self testFingerprint];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(SISchemaCommonEventMetadata *)self eventId];

  if (v8)
  {
    v9 = [(SISchemaCommonEventMetadata *)self eventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCommonEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteEmitTimestamp
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEmitTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEmitTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEmitTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t emitTimestamp = a3;
}

- (void)deleteEventId
{
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)deleteTestFingerprint
{
}

- (BOOL)hasTestFingerprint
{
  return self->_testFingerprint != 0;
}

- (void)deleteTimestamp
{
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

@end
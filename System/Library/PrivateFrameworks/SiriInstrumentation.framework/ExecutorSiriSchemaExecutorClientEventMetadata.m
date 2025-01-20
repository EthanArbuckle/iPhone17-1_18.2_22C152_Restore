@interface ExecutorSiriSchemaExecutorClientEventMetadata
- (BOOL)hasExecutorId;
- (BOOL)hasIfRequestId;
- (BOOL)hasSpanId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ExecutorSiriSchemaExecutorClientEventMetadata)initWithDictionary:(id)a3;
- (ExecutorSiriSchemaExecutorClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)executorId;
- (SISchemaUUID)ifRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)spanId;
- (void)deleteExecutorId;
- (void)deleteIfRequestId;
- (void)deleteSpanId;
- (void)setExecutorId:(id)a3;
- (void)setHasExecutorId:(BOOL)a3;
- (void)setHasIfRequestId:(BOOL)a3;
- (void)setHasSpanId:(BOOL)a3;
- (void)setIfRequestId:(id)a3;
- (void)setSpanId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ExecutorSiriSchemaExecutorClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ExecutorSiriSchemaExecutorClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ExecutorSiriSchemaExecutorClientEventMetadata *)self deleteIfRequestId];
  }
  v9 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ExecutorSiriSchemaExecutorClientEventMetadata *)self deleteExecutorId];
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
  objc_storeStrong((id *)&self->_executorId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

- (void)setHasExecutorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)spanId
{
  return self->_spanId;
}

- (void)setExecutorId:(id)a3
{
}

- (SISchemaUUID)executorId
{
  return self->_executorId;
}

- (void)setIfRequestId:(id)a3
{
}

- (SISchemaUUID)ifRequestId
{
  return self->_ifRequestId;
}

- (ExecutorSiriSchemaExecutorClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ExecutorSiriSchemaExecutorClientEventMetadata;
  v5 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ExecutorSiriSchemaExecutorClientEventMetadata *)v5 setIfRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"executorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ExecutorSiriSchemaExecutorClientEventMetadata *)v5 setExecutorId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"spanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ExecutorSiriSchemaExecutorClientEventMetadata setSpanId:](v5, "setSpanId:", [v10 unsignedLongLongValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (ExecutorSiriSchemaExecutorClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_executorId)
  {
    id v4 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"executorId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"executorId"];
    }
  }
  if (self->_ifRequestId)
  {
    uint64_t v7 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ifRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ifRequestId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ExecutorSiriSchemaExecutorClientEventMetadata spanId](self, "spanId"));
    [v3 setObject:v10 forKeyedSubscript:@"spanId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifRequestId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_executorId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_spanId;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
  v6 = [v4 ifRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
    v10 = [v4 ifRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
  v6 = [v4 executorId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
    v15 = [v4 executorId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0 || (unint64_t spanId = self->_spanId, spanId == [v4 spanId]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];

  if (v4)
  {
    unint64_t v5 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self ifRequestId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];

  if (v6)
  {
    uint64_t v7 = [(ExecutorSiriSchemaExecutorClientEventMetadata *)self executorId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ExecutorSiriSchemaExecutorClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpanId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSpanId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpanId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSpanId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t spanId = a3;
}

- (void)deleteExecutorId
{
}

- (BOOL)hasExecutorId
{
  return self->_executorId != 0;
}

- (void)deleteIfRequestId
{
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

@end
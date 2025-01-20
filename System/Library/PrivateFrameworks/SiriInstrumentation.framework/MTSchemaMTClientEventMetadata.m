@interface MTSchemaMTClientEventMetadata
- (BOOL)hasMtId;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTClientEventMetadata)initWithDictionary:(id)a3;
- (MTSchemaMTClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)mtId;
- (SISchemaUUID)sessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteMtId;
- (void)deleteSessionId;
- (void)setHasMtId:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setMtId:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTSchemaMTClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTClientEventMetadata *)self mtId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTClientEventMetadata *)self deleteMtId];
  }
  v9 = [(MTSchemaMTClientEventMetadata *)self sessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTClientEventMetadata *)self deleteSessionId];
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
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_mtId, 0);
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_hasSessionId = a3;
}

- (void)setHasMtId:(BOOL)a3
{
  self->_hasMtId = a3;
}

- (void)setSessionId:(id)a3
{
}

- (SISchemaUUID)sessionId
{
  return self->_sessionId;
}

- (void)setMtId:(id)a3
{
}

- (SISchemaUUID)mtId
{
  return self->_mtId;
}

- (MTSchemaMTClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTClientEventMetadata;
  v5 = [(MTSchemaMTClientEventMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mtId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MTSchemaMTClientEventMetadata *)v5 setMtId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"sessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(MTSchemaMTClientEventMetadata *)v5 setSessionId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (MTSchemaMTClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_mtId)
  {
    id v4 = [(MTSchemaMTClientEventMetadata *)self mtId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"mtId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"mtId"];
    }
  }
  if (self->_sessionId)
  {
    uint64_t v7 = [(MTSchemaMTClientEventMetadata *)self sessionId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"sessionId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"sessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_mtId hash];
  return [(SISchemaUUID *)self->_sessionId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(MTSchemaMTClientEventMetadata *)self mtId];
  v6 = [v4 mtId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MTSchemaMTClientEventMetadata *)self mtId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(MTSchemaMTClientEventMetadata *)self mtId];
    v10 = [v4 mtId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(MTSchemaMTClientEventMetadata *)self sessionId];
  v6 = [v4 sessionId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(MTSchemaMTClientEventMetadata *)self sessionId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(MTSchemaMTClientEventMetadata *)self sessionId];
    v15 = [v4 sessionId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(MTSchemaMTClientEventMetadata *)self mtId];

  if (v4)
  {
    v5 = [(MTSchemaMTClientEventMetadata *)self mtId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(MTSchemaMTClientEventMetadata *)self sessionId];

  if (v6)
  {
    uint64_t v7 = [(MTSchemaMTClientEventMetadata *)self sessionId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSessionId
{
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)deleteMtId
{
}

- (BOOL)hasMtId
{
  return self->_mtId != 0;
}

@end
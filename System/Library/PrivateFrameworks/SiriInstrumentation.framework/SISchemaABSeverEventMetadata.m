@interface SISchemaABSeverEventMetadata
- (BOOL)hasSiriDeviceId;
- (BOOL)hasSpeechId;
- (BOOL)hasTimestampNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaABSeverEventMetadata)initWithDictionary:(id)a3;
- (SISchemaABSeverEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)siriDeviceId;
- (SISchemaUUID)speechId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)timestampNs;
- (unint64_t)hash;
- (void)deleteSiriDeviceId;
- (void)deleteSpeechId;
- (void)deleteTimestampNs;
- (void)setHasSiriDeviceId:(BOOL)a3;
- (void)setHasSpeechId:(BOOL)a3;
- (void)setHasTimestampNs:(BOOL)a3;
- (void)setSiriDeviceId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setTimestampNs:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaABSeverEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABSeverEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8])
  {
    [(SISchemaABSeverEventMetadata *)self deleteSiriDeviceId];
    [(SISchemaABSeverEventMetadata *)self deleteSpeechId];
  }
  v6 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaABSeverEventMetadata *)self deleteSiriDeviceId];
  }
  v9 = [(SISchemaABSeverEventMetadata *)self speechId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaABSeverEventMetadata *)self deleteSpeechId];
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
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_siriDeviceId, 0);
}

- (void)setHasSpeechId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSiriDeviceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)timestampNs
{
  return self->_timestampNs;
}

- (void)setSpeechId:(id)a3
{
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setSiriDeviceId:(id)a3
{
}

- (SISchemaUUID)siriDeviceId
{
  return self->_siriDeviceId;
}

- (SISchemaABSeverEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABSeverEventMetadata;
  v5 = [(SISchemaABSeverEventMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriDeviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaABSeverEventMetadata *)v5 setSiriDeviceId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(SISchemaABSeverEventMetadata *)v5 setSpeechId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"timestampNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaABSeverEventMetadata setTimestampNs:](v5, "setTimestampNs:", [v10 longLongValue]);
    }
    int v11 = v5;
  }
  return v5;
}

- (SISchemaABSeverEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaABSeverEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaABSeverEventMetadata *)self dictionaryRepresentation];
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
  if (self->_siriDeviceId)
  {
    id v4 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"siriDeviceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"siriDeviceId"];
    }
  }
  if (self->_speechId)
  {
    uint64_t v7 = [(SISchemaABSeverEventMetadata *)self speechId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"speechId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"speechId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaABSeverEventMetadata timestampNs](self, "timestampNs"));
    [v3 setObject:v10 forKeyedSubscript:@"timestampNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_siriDeviceId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_speechId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_timestampNs;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
  v6 = [v4 siriDeviceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
    v10 = [v4 siriDeviceId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaABSeverEventMetadata *)self speechId];
  v6 = [v4 speechId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaABSeverEventMetadata *)self speechId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaABSeverEventMetadata *)self speechId];
    v15 = [v4 speechId];
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
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int64_t timestampNs = self->_timestampNs, timestampNs == [v4 timestampNs]))
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
  unint64_t v4 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];

  if (v4)
  {
    uint64_t v5 = [(SISchemaABSeverEventMetadata *)self siriDeviceId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaABSeverEventMetadata *)self speechId];

  if (v6)
  {
    uint64_t v7 = [(SISchemaABSeverEventMetadata *)self speechId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABSeverEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimestampNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimestampNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestampNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t timestampNs = a3;
}

- (void)deleteSpeechId
{
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteSiriDeviceId
{
}

- (BOOL)hasSiriDeviceId
{
  return self->_siriDeviceId != 0;
}

@end
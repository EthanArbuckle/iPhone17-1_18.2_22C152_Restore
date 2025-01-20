@interface SISchemaServerEventMetadata
- (BOOL)hasServerPod;
- (BOOL)hasSiriDeviceID;
- (BOOL)hasTimestampNs;
- (BOOL)hasTurnID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)siriDeviceID;
- (NSData)turnID;
- (NSString)serverPod;
- (SISchemaServerEventMetadata)initWithDictionary:(id)a3;
- (SISchemaServerEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)timestampNs;
- (unint64_t)hash;
- (void)deleteServerPod;
- (void)deleteSiriDeviceID;
- (void)deleteTimestampNs;
- (void)deleteTurnID;
- (void)setHasServerPod:(BOOL)a3;
- (void)setHasSiriDeviceID:(BOOL)a3;
- (void)setHasTimestampNs:(BOOL)a3;
- (void)setHasTurnID:(BOOL)a3;
- (void)setServerPod:(id)a3;
- (void)setSiriDeviceID:(id)a3;
- (void)setTimestampNs:(int64_t)a3;
- (void)setTurnID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaServerEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SISchemaServerEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 8, v8.receiver, v8.super_class);

  if (v6) {
    [(SISchemaServerEventMetadata *)self deleteSiriDeviceID];
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
  objc_storeStrong((id *)&self->_serverPod, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
}

- (void)setHasServerPod:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTurnID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setServerPod:(id)a3
{
}

- (NSString)serverPod
{
  return self->_serverPod;
}

- (void)setSiriDeviceID:(id)a3
{
}

- (NSData)siriDeviceID
{
  return self->_siriDeviceID;
}

- (int64_t)timestampNs
{
  return self->_timestampNs;
}

- (void)setTurnID:(id)a3
{
}

- (NSData)turnID
{
  return self->_turnID;
}

- (SISchemaServerEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaServerEventMetadata;
  v5 = [(SISchemaServerEventMetadata *)&v15 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"turnID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SISchemaServerEventMetadata *)v5 setTurnID:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"timestampNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaServerEventMetadata setTimestampNs:](v5, "setTimestampNs:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"siriDeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
      [(SISchemaServerEventMetadata *)v5 setSiriDeviceID:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"serverPod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(SISchemaServerEventMetadata *)v5 setServerPod:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (SISchemaServerEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaServerEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaServerEventMetadata *)self dictionaryRepresentation];
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
  if (self->_serverPod)
  {
    id v4 = [(SISchemaServerEventMetadata *)self serverPod];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"serverPod"];
  }
  if (self->_siriDeviceID)
  {
    int v6 = [(SISchemaServerEventMetadata *)self siriDeviceID];
    uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"siriDeviceID"];
    }
    else
    {
      objc_super v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"siriDeviceID"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaServerEventMetadata timestampNs](self, "timestampNs"));
    [v3 setObject:v9 forKeyedSubscript:@"timestampNs"];
  }
  if (self->_turnID)
  {
    v10 = [(SISchemaServerEventMetadata *)self turnID];
    v11 = [v10 base64EncodedStringWithOptions:0];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"turnID"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"turnID"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_turnID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_timestampNs;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_siriDeviceID hash];
  return v5 ^ v6 ^ [(NSString *)self->_serverPod hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(SISchemaServerEventMetadata *)self turnID];
  uint64_t v6 = [v4 turnID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(SISchemaServerEventMetadata *)self turnID];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(SISchemaServerEventMetadata *)self turnID];
    v10 = [v4 turnID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t timestampNs = self->_timestampNs;
    if (timestampNs != [v4 timestampNs]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(SISchemaServerEventMetadata *)self siriDeviceID];
  uint64_t v6 = [v4 siriDeviceID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(SISchemaServerEventMetadata *)self siriDeviceID];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(SISchemaServerEventMetadata *)self siriDeviceID];
    v16 = [v4 siriDeviceID];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaServerEventMetadata *)self serverPod];
  uint64_t v6 = [v4 serverPod];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(SISchemaServerEventMetadata *)self serverPod];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(SISchemaServerEventMetadata *)self serverPod];
    v21 = [v4 serverPod];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SISchemaServerEventMetadata *)self turnID];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  uint64_t v5 = [(SISchemaServerEventMetadata *)self siriDeviceID];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  uint64_t v6 = [(SISchemaServerEventMetadata *)self serverPod];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaServerEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteServerPod
{
}

- (BOOL)hasServerPod
{
  return self->_serverPod != 0;
}

- (void)deleteSiriDeviceID
{
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
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

- (void)deleteTurnID
{
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

@end
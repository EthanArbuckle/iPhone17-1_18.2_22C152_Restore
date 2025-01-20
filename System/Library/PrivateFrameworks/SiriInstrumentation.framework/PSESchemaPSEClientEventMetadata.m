@interface PSESchemaPSEClientEventMetadata
- (BOOL)hasOriginalLastRequestId;
- (BOOL)hasPseId;
- (BOOL)hasSiriEngagementTaskSuccess;
- (BOOL)hasTaskId;
- (BOOL)hasTriggerOrigin;
- (BOOL)hasUiSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSEClientEventMetadata)initWithDictionary:(id)a3;
- (PSESchemaPSEClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)originalLastRequestId;
- (SISchemaUUID)pseId;
- (SISchemaUUID)taskId;
- (SISchemaUUID)uiSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)siriEngagementTaskSuccess;
- (int)triggerOrigin;
- (unint64_t)hash;
- (void)deleteOriginalLastRequestId;
- (void)deletePseId;
- (void)deleteSiriEngagementTaskSuccess;
- (void)deleteTaskId;
- (void)deleteTriggerOrigin;
- (void)deleteUiSessionId;
- (void)setHasOriginalLastRequestId:(BOOL)a3;
- (void)setHasPseId:(BOOL)a3;
- (void)setHasSiriEngagementTaskSuccess:(BOOL)a3;
- (void)setHasTaskId:(BOOL)a3;
- (void)setHasTriggerOrigin:(BOOL)a3;
- (void)setHasUiSessionId:(BOOL)a3;
- (void)setOriginalLastRequestId:(id)a3;
- (void)setPseId:(id)a3;
- (void)setSiriEngagementTaskSuccess:(int)a3;
- (void)setTaskId:(id)a3;
- (void)setTriggerOrigin:(int)a3;
- (void)setUiSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSESchemaPSEClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PSESchemaPSEClientEventMetadata *)self deleteUiSessionId];
  }
  v9 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PSESchemaPSEClientEventMetadata *)self deleteOriginalLastRequestId];
  }
  v12 = [(PSESchemaPSEClientEventMetadata *)self taskId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PSESchemaPSEClientEventMetadata *)self deleteTaskId];
  }
  v15 = [(PSESchemaPSEClientEventMetadata *)self pseId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PSESchemaPSEClientEventMetadata *)self deletePseId];
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
  objc_storeStrong((id *)&self->_pseId, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_originalLastRequestId, 0);
  objc_storeStrong((id *)&self->_uiSessionId, 0);
}

- (void)setHasPseId:(BOOL)a3
{
  self->_hasUiSessionId = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasOriginalLastRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasUiSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)triggerOrigin
{
  return self->_triggerOrigin;
}

- (void)setPseId:(id)a3
{
}

- (SISchemaUUID)pseId
{
  return self->_pseId;
}

- (void)setTaskId:(id)a3
{
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (int)siriEngagementTaskSuccess
{
  return self->_siriEngagementTaskSuccess;
}

- (void)setOriginalLastRequestId:(id)a3
{
}

- (SISchemaUUID)originalLastRequestId
{
  return self->_originalLastRequestId;
}

- (void)setUiSessionId:(id)a3
{
}

- (SISchemaUUID)uiSessionId
{
  return self->_uiSessionId;
}

- (PSESchemaPSEClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSESchemaPSEClientEventMetadata;
  v5 = [(PSESchemaPSEClientEventMetadata *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uiSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PSESchemaPSEClientEventMetadata *)v5 setUiSessionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"originalLastRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PSESchemaPSEClientEventMetadata *)v5 setOriginalLastRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"siriEngagementTaskSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEClientEventMetadata setSiriEngagementTaskSuccess:](v5, "setSiriEngagementTaskSuccess:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"taskId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(PSESchemaPSEClientEventMetadata *)v5 setTaskId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"pseId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(PSESchemaPSEClientEventMetadata *)v5 setPseId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"triggerOrigin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEClientEventMetadata setTriggerOrigin:](v5, "setTriggerOrigin:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (PSESchemaPSEClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_originalLastRequestId)
  {
    id v4 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"originalLastRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"originalLastRequestId"];
    }
  }
  if (self->_pseId)
  {
    uint64_t v7 = [(PSESchemaPSEClientEventMetadata *)self pseId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pseId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pseId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = [(PSESchemaPSEClientEventMetadata *)self siriEngagementTaskSuccess] - 1;
    if (v10 > 3) {
      int v11 = @"PSESIRIENGAGEMENTTASKSUCCESS_UNKNOWN";
    }
    else {
      int v11 = off_1E5EBA210[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"siriEngagementTaskSuccess"];
  }
  if (self->_taskId)
  {
    v12 = [(PSESchemaPSEClientEventMetadata *)self taskId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"taskId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"taskId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v15 = [(PSESchemaPSEClientEventMetadata *)self triggerOrigin] - 1;
    if (v15 > 2) {
      v16 = @"PSETRIGGERORIGIN_UNKNOWN";
    }
    else {
      v16 = off_1E5EBA230[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"triggerOrigin"];
  }
  if (self->_uiSessionId)
  {
    int v17 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
    objc_super v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"uiSessionId"];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"uiSessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_uiSessionId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_originalLastRequestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_siriEngagementTaskSuccess;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(SISchemaUUID *)self->_taskId hash];
  unint64_t v7 = [(SISchemaUUID *)self->_pseId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_triggerOrigin;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  uint64_t v5 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
  unint64_t v6 = [v4 uiSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
    unsigned int v10 = [v4 uiSessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
  unint64_t v6 = [v4 originalLastRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v12 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
    unsigned int v15 = [v4 originalLastRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[52] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int siriEngagementTaskSuccess = self->_siriEngagementTaskSuccess;
    if (siriEngagementTaskSuccess != [v4 siriEngagementTaskSuccess]) {
      goto LABEL_25;
    }
  }
  uint64_t v5 = [(PSESchemaPSEClientEventMetadata *)self taskId];
  unint64_t v6 = [v4 taskId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(PSESchemaPSEClientEventMetadata *)self taskId];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(PSESchemaPSEClientEventMetadata *)self taskId];
    v21 = [v4 taskId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PSESchemaPSEClientEventMetadata *)self pseId];
  unint64_t v6 = [v4 pseId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v23 = [(PSESchemaPSEClientEventMetadata *)self pseId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PSESchemaPSEClientEventMetadata *)self pseId];
    v26 = [v4 pseId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  int v30 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v30 == ((v4[52] >> 1) & 1))
  {
    if (!v30
      || (int triggerOrigin = self->_triggerOrigin, triggerOrigin == [v4 triggerOrigin]))
    {
      BOOL v28 = 1;
      goto LABEL_26;
    }
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];

  if (v4)
  {
    uint64_t v5 = [(PSESchemaPSEClientEventMetadata *)self uiSessionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];

  if (v6)
  {
    uint64_t v7 = [(PSESchemaPSEClientEventMetadata *)self originalLastRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v8 = [(PSESchemaPSEClientEventMetadata *)self taskId];

  if (v8)
  {
    v9 = [(PSESchemaPSEClientEventMetadata *)self taskId];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v10 = [(PSESchemaPSEClientEventMetadata *)self pseId];

  if (v10)
  {
    int v11 = [(PSESchemaPSEClientEventMetadata *)self pseId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTriggerOrigin
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTriggerOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerOrigin
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTriggerOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int triggerOrigin = a3;
}

- (void)deletePseId
{
}

- (BOOL)hasPseId
{
  return self->_pseId != 0;
}

- (void)deleteTaskId
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (void)deleteSiriEngagementTaskSuccess
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSiriEngagementTaskSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSiriEngagementTaskSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSiriEngagementTaskSuccess:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int siriEngagementTaskSuccess = a3;
}

- (void)deleteOriginalLastRequestId
{
}

- (BOOL)hasOriginalLastRequestId
{
  return self->_originalLastRequestId != 0;
}

- (void)deleteUiSessionId
{
}

- (BOOL)hasUiSessionId
{
  return self->_uiSessionId != 0;
}

@end
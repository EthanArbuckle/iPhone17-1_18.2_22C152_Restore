@interface SISchemaClientEventMetadata
- (BOOL)hasEventGeneratedRelativeToBootTimeTimestampNs;
- (BOOL)hasEventGeneratedTimestampRefId;
- (BOOL)hasSiriDeviceID;
- (BOOL)hasTurnID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)siriDeviceID;
- (NSData)turnID;
- (NSString)eventGeneratedTimestampRefId;
- (SISchemaClientEventMetadata)initWithDictionary:(id)a3;
- (SISchemaClientEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)eventGeneratedRelativeToBootTimeTimestampNs;
- (unint64_t)hash;
- (void)deleteEventGeneratedRelativeToBootTimeTimestampNs;
- (void)deleteEventGeneratedTimestampRefId;
- (void)deleteSiriDeviceID;
- (void)deleteTurnID;
- (void)setEventGeneratedRelativeToBootTimeTimestampNs:(int64_t)a3;
- (void)setEventGeneratedTimestampRefId:(id)a3;
- (void)setHasEventGeneratedRelativeToBootTimeTimestampNs:(BOOL)a3;
- (void)setHasEventGeneratedTimestampRefId:(BOOL)a3;
- (void)setHasSiriDeviceID:(BOOL)a3;
- (void)setHasTurnID:(BOOL)a3;
- (void)setSiriDeviceID:(id)a3;
- (void)setTurnID:(id)a3;
- (void)willProduceDictionaryRepresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientEventMetadata

- (void)willProduceDictionaryRepresentation:(id)a3
{
  id v8 = a3;
  v4 = [(SISchemaClientEventMetadata *)self turnID];
  v5 = v4;
  if (v4 && [v4 length] == 16)
  {
    v6 = objc_msgSend(v5, "si_asNSUUID");
    v7 = [v6 UUIDString];
    [v8 setObject:v7 forKeyedSubscript:@"turnID"];
  }
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 8, v8.receiver, v8.super_class);

  if (v6) {
    [(SISchemaClientEventMetadata *)self deleteSiriDeviceID];
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
  objc_storeStrong((id *)&self->_eventGeneratedTimestampRefId, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
}

- (void)setHasEventGeneratedTimestampRefId:(BOOL)a3
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

- (int64_t)eventGeneratedRelativeToBootTimeTimestampNs
{
  return self->_eventGeneratedRelativeToBootTimeTimestampNs;
}

- (void)setEventGeneratedTimestampRefId:(id)a3
{
}

- (NSString)eventGeneratedTimestampRefId
{
  return self->_eventGeneratedTimestampRefId;
}

- (void)setSiriDeviceID:(id)a3
{
}

- (NSData)siriDeviceID
{
  return self->_siriDeviceID;
}

- (void)setTurnID:(id)a3
{
}

- (NSData)turnID
{
  return self->_turnID;
}

- (SISchemaClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISchemaClientEventMetadata;
  v5 = [(SISchemaClientEventMetadata *)&v15 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"turnID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SISchemaClientEventMetadata *)v5 setTurnID:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"siriDeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      [(SISchemaClientEventMetadata *)v5 setSiriDeviceID:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"eventGeneratedTimestampRefId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SISchemaClientEventMetadata *)v5 setEventGeneratedTimestampRefId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"eventGeneratedRelativeToBootTimeTimestampNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaClientEventMetadata setEventGeneratedRelativeToBootTimeTimestampNs:](v5, "setEventGeneratedRelativeToBootTimeTimestampNs:", [v12 longLongValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (SISchemaClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaClientEventMetadata *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaClientEventMetadata eventGeneratedRelativeToBootTimeTimestampNs](self, "eventGeneratedRelativeToBootTimeTimestampNs"));
    [v3 setObject:v4 forKeyedSubscript:@"eventGeneratedRelativeToBootTimeTimestampNs"];
  }
  if (self->_eventGeneratedTimestampRefId)
  {
    v5 = [(SISchemaClientEventMetadata *)self eventGeneratedTimestampRefId];
    int v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"eventGeneratedTimestampRefId"];
  }
  if (self->_siriDeviceID)
  {
    uint64_t v7 = [(SISchemaClientEventMetadata *)self siriDeviceID];
    objc_super v8 = [v7 base64EncodedStringWithOptions:0];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"siriDeviceID"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"siriDeviceID"];
    }
  }
  if (self->_turnID)
  {
    v10 = [(SISchemaClientEventMetadata *)self turnID];
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
  [(SISchemaClientEventMetadata *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_turnID hash];
  uint64_t v4 = [(NSData *)self->_siriDeviceID hash];
  NSUInteger v5 = [(NSString *)self->_eventGeneratedTimestampRefId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_eventGeneratedRelativeToBootTimeTimestampNs;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  NSUInteger v5 = [(SISchemaClientEventMetadata *)self turnID];
  uint64_t v6 = [v4 turnID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaClientEventMetadata *)self turnID];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(SISchemaClientEventMetadata *)self turnID];
    v10 = [v4 turnID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaClientEventMetadata *)self siriDeviceID];
  uint64_t v6 = [v4 siriDeviceID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaClientEventMetadata *)self siriDeviceID];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SISchemaClientEventMetadata *)self siriDeviceID];
    objc_super v15 = [v4 siriDeviceID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaClientEventMetadata *)self eventGeneratedTimestampRefId];
  uint64_t v6 = [v4 eventGeneratedTimestampRefId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(SISchemaClientEventMetadata *)self eventGeneratedTimestampRefId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaClientEventMetadata *)self eventGeneratedTimestampRefId];
    v20 = [v4 eventGeneratedTimestampRefId];
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
      || (int64_t eventGeneratedRelativeToBootTimeTimestampNs = self->_eventGeneratedRelativeToBootTimeTimestampNs,
          eventGeneratedRelativeToBootTimeTimestampNs == [v4 eventGeneratedRelativeToBootTimeTimestampNs]))
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
  id v8 = a3;
  uint64_t v4 = [(SISchemaClientEventMetadata *)self turnID];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  NSUInteger v5 = [(SISchemaClientEventMetadata *)self siriDeviceID];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  uint64_t v6 = [(SISchemaClientEventMetadata *)self eventGeneratedTimestampRefId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteEventGeneratedRelativeToBootTimeTimestampNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventGeneratedRelativeToBootTimeTimestampNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventGeneratedRelativeToBootTimeTimestampNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventGeneratedRelativeToBootTimeTimestampNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t eventGeneratedRelativeToBootTimeTimestampNs = a3;
}

- (void)deleteEventGeneratedTimestampRefId
{
}

- (BOOL)hasEventGeneratedTimestampRefId
{
  return self->_eventGeneratedTimestampRefId != 0;
}

- (void)deleteSiriDeviceID
{
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (void)deleteTurnID
{
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

@end
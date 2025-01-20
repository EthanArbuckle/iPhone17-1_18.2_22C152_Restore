@interface STSchemaSTLLMQUQueryArgumentsTier1
- (BOOL)hasEventType;
- (BOOL)hasLinkId;
- (BOOL)hasLlmquAppEntityStatus;
- (BOOL)hasLlmquAppEntityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (STSchemaSTLLMQUQueryArgumentsTier1)initWithDictionary:(id)a3;
- (STSchemaSTLLMQUQueryArgumentsTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventType;
- (int)llmquAppEntityStatus;
- (int)llmquAppEntityType;
- (unint64_t)hash;
- (void)deleteEventType;
- (void)deleteLinkId;
- (void)deleteLlmquAppEntityStatus;
- (void)deleteLlmquAppEntityType;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasLlmquAppEntityStatus:(BOOL)a3;
- (void)setHasLlmquAppEntityType:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setLlmquAppEntityStatus:(int)a3;
- (void)setLlmquAppEntityType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTLLMQUQueryArgumentsTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSchemaSTLLMQUQueryArgumentsTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteEventType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityStatus];
  }
  if ([v4 isConditionSet:4])
  {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteEventType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityStatus];
  }
  if ([v4 isConditionSet:5])
  {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteEventType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityStatus];
  }
  if ([v4 isConditionSet:6])
  {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteEventType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityStatus];
  }
  if ([v4 isConditionSet:7])
  {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteEventType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityType];
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLlmquAppEntityStatus];
  }
  v6 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTLLMQUQueryArgumentsTier1 *)self deleteLinkId];
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

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)llmquAppEntityStatus
{
  return self->_llmquAppEntityStatus;
}

- (int)llmquAppEntityType
{
  return self->_llmquAppEntityType;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (STSchemaSTLLMQUQueryArgumentsTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTLLMQUQueryArgumentsTier1;
  v5 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(STSchemaSTLLMQUQueryArgumentsTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTLLMQUQueryArgumentsTier1 setEventType:](v5, "setEventType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"llmquAppEntityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTLLMQUQueryArgumentsTier1 setLlmquAppEntityType:](v5, "setLlmquAppEntityType:", [v9 intValue]);
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"llmquAppEntityStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTLLMQUQueryArgumentsTier1 setLlmquAppEntityStatus:](v5, "setLlmquAppEntityStatus:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (STSchemaSTLLMQUQueryArgumentsTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self dictionaryRepresentation];
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
    unsigned int v4 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self eventType] - 1;
    if (v4 > 3) {
      v5 = @"STLLMQUMODELEVENTTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EC0DB8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"eventType"];
  }
  if (self->_linkId)
  {
    v6 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v10 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self llmquAppEntityStatus] - 1;
    if (v10 > 0x18) {
      v11 = @"STLLMQUMODELAPPENTITYSTATUS_UNKNOWN";
    }
    else {
      v11 = off_1E5EC0DD8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"llmquAppEntityStatus"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v12 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self llmquAppEntityType] - 1;
    if (v12 > 0x10) {
      objc_super v13 = @"STLLMQUMODELAPPENTITYTYPE_UNKNOWN";
    }
    else {
      objc_super v13 = off_1E5EC0EA0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"llmquAppEntityType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_eventType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_llmquAppEntityType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_llmquAppEntityStatus;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
  uint64_t v6 = [v4 linkId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
  if (v8)
  {
    v9 = (void *)v8;
    unsigned int v10 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
    v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $0A488B5338DA1FEE3DF1BD45BDA78F02 has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int eventType = self->_eventType;
    if (eventType != [v4 eventType]) {
      goto LABEL_20;
    }
    $0A488B5338DA1FEE3DF1BD45BDA78F02 has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int llmquAppEntityType = self->_llmquAppEntityType;
    if (llmquAppEntityType == [v4 llmquAppEntityType])
    {
      $0A488B5338DA1FEE3DF1BD45BDA78F02 has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int llmquAppEntityStatus = self->_llmquAppEntityStatus;
    if (llmquAppEntityStatus != [v4 llmquAppEntityStatus]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(STSchemaSTLLMQUQueryArgumentsTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTLLMQUQueryArgumentsTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteLlmquAppEntityStatus
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLlmquAppEntityStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLlmquAppEntityStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLlmquAppEntityStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int llmquAppEntityStatus = a3;
}

- (void)deleteLlmquAppEntityType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLlmquAppEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLlmquAppEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLlmquAppEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int llmquAppEntityType = a3;
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

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end
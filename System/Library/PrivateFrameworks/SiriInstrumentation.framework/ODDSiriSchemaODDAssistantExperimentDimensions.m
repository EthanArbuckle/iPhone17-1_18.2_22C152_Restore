@interface ODDSiriSchemaODDAssistantExperimentDimensions
- (BOOL)hasAssistantDimensions;
- (BOOL)hasCodePathId;
- (BOOL)hasExperimentAllocationStatus;
- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger;
- (BOOL)hasIsTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstTriggerOrAfterFirstTrigger;
- (BOOL)isTriggered;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions;
- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithJSON:(id)a3;
- (SISchemaUUID)codePathId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)experimentAllocationStatus;
- (unint64_t)hash;
- (void)deleteAssistantDimensions;
- (void)deleteCodePathId;
- (void)deleteExperimentAllocationStatus;
- (void)deleteIsFirstTriggerOrAfterFirstTrigger;
- (void)deleteIsTriggered;
- (void)setAssistantDimensions:(id)a3;
- (void)setCodePathId:(id)a3;
- (void)setExperimentAllocationStatus:(int)a3;
- (void)setHasAssistantDimensions:(BOOL)a3;
- (void)setHasCodePathId:(BOOL)a3;
- (void)setHasExperimentAllocationStatus:(BOOL)a3;
- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3;
- (void)setHasIsTriggered:(BOOL)a3;
- (void)setIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantExperimentDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDimensions;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssistantExperimentDimensions *)self deleteAssistantDimensions];
  }
  v9 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssistantExperimentDimensions *)self deleteCodePathId];
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
  objc_storeStrong((id *)&self->_codePathId, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

- (void)setHasCodePathId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCodePathId:(id)a3
{
}

- (SISchemaUUID)codePathId
{
  return self->_codePathId;
}

- (BOOL)isFirstTriggerOrAfterFirstTrigger
{
  return self->_isFirstTriggerOrAfterFirstTrigger;
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (int)experimentAllocationStatus
{
  return self->_experimentAllocationStatus;
}

- (void)setAssistantDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDimensions;
  v5 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssistantExperimentDimensions *)v5 setAssistantDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"experimentAllocationStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantExperimentDimensions setExperimentAllocationStatus:](v5, "setExperimentAllocationStatus:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantExperimentDimensions setIsTriggered:](v5, "setIsTriggered:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isFirstTriggerOrAfterFirstTrigger"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantExperimentDimensions setIsFirstTriggerOrAfterFirstTrigger:](v5, "setIsFirstTriggerOrAfterFirstTrigger:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"codePathId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(ODDSiriSchemaODDAssistantExperimentDimensions *)v5 setCodePathId:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self dictionaryRepresentation];
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
  if (self->_assistantDimensions)
  {
    id v4 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assistantDimensions"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assistantDimensions"];
    }
  }
  if (self->_codePathId)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"codePathId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"codePathId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v11 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self experimentAllocationStatus]- 1;
    if (v11 > 2) {
      v12 = @"EXPTREATMENTALLOCATIONSTATUS_UNKNOWN";
    }
    else {
      v12 = off_1E5EBD4E0[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"experimentAllocationStatus"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAssistantExperimentDimensions isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
    [v3 setObject:v13 forKeyedSubscript:@"isFirstTriggerOrAfterFirstTrigger"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAssistantExperimentDimensions isTriggered](self, "isTriggered"));
    [v3 setObject:v14 forKeyedSubscript:@"isTriggered"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssistantDimensions *)self->_assistantDimensions hash];
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
    return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_codePathId hash];
  }
  uint64_t v4 = 2654435761 * self->_experimentAllocationStatus;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isTriggered;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isFirstTriggerOrAfterFirstTrigger;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_codePathId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
  uint64_t v6 = [v4 assistantDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
    v10 = [v4 assistantDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  $79B7638AD8FB2C9E0041D045F682F301 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&has)
  {
    int experimentAllocationStatus = self->_experimentAllocationStatus;
    if (experimentAllocationStatus != [v4 experimentAllocationStatus]) {
      goto LABEL_23;
    }
    $79B7638AD8FB2C9E0041D045F682F301 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v15)
  {
    int isTriggered = self->_isTriggered;
    if (isTriggered != [v4 isTriggered]) {
      goto LABEL_23;
    }
    $79B7638AD8FB2C9E0041D045F682F301 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_23;
  }
  if (v17)
  {
    int isFirstTriggerOrAfterFirstTrigger = self->_isFirstTriggerOrAfterFirstTrigger;
    if (isFirstTriggerOrAfterFirstTrigger != [v4 isFirstTriggerOrAfterFirstTrigger]) {
      goto LABEL_23;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
  uint64_t v6 = [v4 codePathId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v19 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
  if (!v19)
  {

LABEL_26:
    BOOL v24 = 1;
    goto LABEL_24;
  }
  v20 = (void *)v19;
  v21 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
  v22 = [v4 codePathId];
  char v23 = [v21 isEqual:v22];

  if (v23) {
    goto LABEL_26;
  }
LABEL_23:
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self assistantDimensions];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];

  int v8 = v10;
  if (v7)
  {
    v9 = [(ODDSiriSchemaODDAssistantExperimentDimensions *)self codePathId];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCodePathId
{
}

- (BOOL)hasCodePathId
{
  return self->_codePathId != 0;
}

- (void)deleteIsFirstTriggerOrAfterFirstTrigger
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isFirstTriggerOrAfterFirstTrigger = a3;
}

- (void)deleteIsTriggered
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsTriggered
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsTriggered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isTriggered = a3;
}

- (void)deleteExperimentAllocationStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExperimentAllocationStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExperimentAllocationStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExperimentAllocationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int experimentAllocationStatus = a3;
}

- (void)deleteAssistantDimensions
{
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

@end
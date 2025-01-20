@interface ODDSiriSchemaODDDictationExperimentDimensions
- (BOOL)hasCodePathId;
- (BOOL)hasDictationDimensions;
- (BOOL)hasExperimentAllocationStatus;
- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstTriggerOrAfterFirstTrigger;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationDimensions)dictationDimensions;
- (ODDSiriSchemaODDDictationExperimentDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationExperimentDimensions)initWithJSON:(id)a3;
- (SISchemaUUID)codePathId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)experimentAllocationStatus;
- (unint64_t)hash;
- (void)deleteCodePathId;
- (void)deleteDictationDimensions;
- (void)deleteExperimentAllocationStatus;
- (void)deleteIsFirstTriggerOrAfterFirstTrigger;
- (void)setCodePathId:(id)a3;
- (void)setDictationDimensions:(id)a3;
- (void)setExperimentAllocationStatus:(int)a3;
- (void)setHasCodePathId:(BOOL)a3;
- (void)setHasDictationDimensions:(BOOL)a3;
- (void)setHasExperimentAllocationStatus:(BOOL)a3;
- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3;
- (void)setIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationExperimentDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDDictationExperimentDimensions;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDDictationExperimentDimensions *)self deleteDictationDimensions];
  }
  v9 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDDictationExperimentDimensions *)self deleteCodePathId];
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
  objc_storeStrong((id *)&self->_dictationDimensions, 0);
}

- (void)setHasCodePathId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDictationDimensions:(BOOL)a3
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

- (int)experimentAllocationStatus
{
  return self->_experimentAllocationStatus;
}

- (void)setDictationDimensions:(id)a3
{
}

- (ODDSiriSchemaODDDictationDimensions)dictationDimensions
{
  return self->_dictationDimensions;
}

- (ODDSiriSchemaODDDictationExperimentDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODDSiriSchemaODDDictationExperimentDimensions;
  v5 = [(ODDSiriSchemaODDDictationExperimentDimensions *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dictationDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDDictationDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDDictationExperimentDimensions *)v5 setDictationDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"experimentAllocationStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationExperimentDimensions setExperimentAllocationStatus:](v5, "setExperimentAllocationStatus:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isFirstTriggerOrAfterFirstTrigger"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationExperimentDimensions setIsFirstTriggerOrAfterFirstTrigger:](v5, "setIsFirstTriggerOrAfterFirstTrigger:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"codePathId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDDictationExperimentDimensions *)v5 setCodePathId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationExperimentDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationExperimentDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictionaryRepresentation];
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
  if (self->_codePathId)
  {
    id v4 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"codePathId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"codePathId"];
    }
  }
  if (self->_dictationDimensions)
  {
    uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"dictationDimensions"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"dictationDimensions"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v11 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self experimentAllocationStatus]- 1;
    if (v11 > 2) {
      v12 = @"EXPTREATMENTALLOCATIONSTATUS_UNKNOWN";
    }
    else {
      v12 = off_1E5EC1790[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"experimentAllocationStatus"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDDictationExperimentDimensions isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
    [v3 setObject:v13 forKeyedSubscript:@"isFirstTriggerOrAfterFirstTrigger"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDDictationDimensions *)self->_dictationDimensions hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_experimentAllocationStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_codePathId hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isFirstTriggerOrAfterFirstTrigger;
  return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_codePathId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
  v6 = [v4 dictationDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
    v10 = [v4 dictationDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $B44144640A50E443591EAB02E2532841 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int experimentAllocationStatus = self->_experimentAllocationStatus;
    if (experimentAllocationStatus != [v4 experimentAllocationStatus]) {
      goto LABEL_19;
    }
    $B44144640A50E443591EAB02E2532841 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int isFirstTriggerOrAfterFirstTrigger = self->_isFirstTriggerOrAfterFirstTrigger;
    if (isFirstTriggerOrAfterFirstTrigger != [v4 isFirstTriggerOrAfterFirstTrigger]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
  v6 = [v4 codePathId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
  v20 = [v4 codePathId];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self dictationDimensions];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];

  int v8 = v10;
  if (v7)
  {
    v9 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self codePathId];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationExperimentDimensionsReadFrom(self, (uint64_t)a3);
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
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isFirstTriggerOrAfterFirstTrigger = a3;
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

- (void)deleteDictationDimensions
{
}

- (BOOL)hasDictationDimensions
{
  return self->_dictationDimensions != 0;
}

@end
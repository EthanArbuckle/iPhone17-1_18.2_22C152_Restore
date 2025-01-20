@interface INFERENCESchemaINFERENCESimpleTaskInfoGenerated
- (BOOL)hasIsExecuted;
- (BOOL)hasIsSuccess;
- (BOOL)hasIsSuccessfulDirectExecution;
- (BOOL)hasOriginalResolutionContextId;
- (BOOL)hasTaskSpecificInfo;
- (BOOL)hasTaskSuccessType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExecuted;
- (BOOL)isSuccess;
- (BOOL)isSuccessfulDirectExecution;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCETaskSpecificInfo)taskSpecificInfo;
- (NSData)jsonData;
- (SISchemaUUID)originalResolutionContextId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)taskSuccessType;
- (unint64_t)hash;
- (void)deleteIsExecuted;
- (void)deleteIsSuccess;
- (void)deleteIsSuccessfulDirectExecution;
- (void)deleteOriginalResolutionContextId;
- (void)deleteTaskSpecificInfo;
- (void)deleteTaskSuccessType;
- (void)setHasIsExecuted:(BOOL)a3;
- (void)setHasIsSuccess:(BOOL)a3;
- (void)setHasIsSuccessfulDirectExecution:(BOOL)a3;
- (void)setHasOriginalResolutionContextId:(BOOL)a3;
- (void)setHasTaskSpecificInfo:(BOOL)a3;
- (void)setHasTaskSuccessType:(BOOL)a3;
- (void)setIsExecuted:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setIsSuccessfulDirectExecution:(BOOL)a3;
- (void)setOriginalResolutionContextId:(id)a3;
- (void)setTaskSpecificInfo:(id)a3;
- (void)setTaskSuccessType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCESimpleTaskInfoGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCESimpleTaskInfoGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self deleteOriginalResolutionContextId];
  }
  v9 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self deleteTaskSpecificInfo];
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
  objc_storeStrong((id *)&self->_taskSpecificInfo, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

- (void)setHasTaskSpecificInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTaskSpecificInfo:(id)a3
{
}

- (INFERENCESchemaINFERENCETaskSpecificInfo)taskSpecificInfo
{
  return self->_taskSpecificInfo;
}

- (BOOL)isSuccessfulDirectExecution
{
  return self->_isSuccessfulDirectExecution;
}

- (BOOL)isExecuted
{
  return self->_isExecuted;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (int)taskSuccessType
{
  return self->_taskSuccessType;
}

- (void)setOriginalResolutionContextId:(id)a3
{
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCESimpleTaskInfoGenerated;
  v5 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalResolutionContextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)v5 setOriginalResolutionContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"taskSuccessType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setTaskSuccessType:](v5, "setTaskSuccessType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccess:](v5, "setIsSuccess:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsExecuted:](v5, "setIsExecuted:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"isSuccessfulDirectExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccessfulDirectExecution:](v5, "setIsSuccessfulDirectExecution:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"taskSpecificInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[INFERENCESchemaINFERENCETaskSpecificInfo alloc] initWithDictionary:v12];
      [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)v5 setTaskSpecificInfo:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isExecuted](self, "isExecuted"));
    [v3 setObject:v8 forKeyedSubscript:@"isExecuted"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isSuccess](self, "isSuccess"));
  [v3 setObject:v9 forKeyedSubscript:@"isSuccess"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isSuccessfulDirectExecution](self, "isSuccessfulDirectExecution"));
    [v3 setObject:v5 forKeyedSubscript:@"isSuccessfulDirectExecution"];
  }
LABEL_5:
  if (self->_originalResolutionContextId)
  {
    v6 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"originalResolutionContextId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"originalResolutionContextId"];
    }
  }
  if (self->_taskSpecificInfo)
  {
    int v11 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"taskSpecificInfo"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"taskSpecificInfo"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v14 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSuccessType] - 1;
    if (v14 > 3) {
      v15 = @"INFERENCETASKSUCCESSTYPE_UNKNOWN";
    }
    else {
      v15 = off_1E5EB0F98[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"taskSuccessType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalResolutionContextId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_taskSuccessType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isSuccess;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(INFERENCESchemaINFERENCETaskSpecificInfo *)self->_taskSpecificInfo hash];
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isExecuted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_isSuccessfulDirectExecution;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(INFERENCESchemaINFERENCETaskSpecificInfo *)self->_taskSpecificInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
  uint64_t v6 = [v4 originalResolutionContextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
    v10 = [v4 originalResolutionContextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $D0A8AFD3306F227765B6DFDF1C2507FA has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int taskSuccessType = self->_taskSuccessType;
    if (taskSuccessType != [v4 taskSuccessType]) {
      goto LABEL_27;
    }
    $D0A8AFD3306F227765B6DFDF1C2507FA has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    int isSuccess = self->_isSuccess;
    if (isSuccess != [v4 isSuccess]) {
      goto LABEL_27;
    }
    $D0A8AFD3306F227765B6DFDF1C2507FA has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v17)
  {
    int isExecuted = self->_isExecuted;
    if (isExecuted != [v4 isExecuted]) {
      goto LABEL_27;
    }
    $D0A8AFD3306F227765B6DFDF1C2507FA has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v19)
  {
    int isSuccessfulDirectExecution = self->_isSuccessfulDirectExecution;
    if (isSuccessfulDirectExecution != [v4 isSuccessfulDirectExecution]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
  uint64_t v6 = [v4 taskSpecificInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v21 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
  if (!v21)
  {

LABEL_30:
    BOOL v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  v23 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
  v24 = [v4 taskSpecificInfo];
  char v25 = [v23 isEqual:v24];

  if (v25) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v26 = 0;
LABEL_28:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];

  if (v4)
  {
    uint64_t v5 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self originalResolutionContextId];
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
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  uint64_t v7 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];

  int v8 = v10;
  if (v7)
  {
    v9 = [(INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)self taskSpecificInfo];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCESimpleTaskInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTaskSpecificInfo
{
}

- (BOOL)hasTaskSpecificInfo
{
  return self->_taskSpecificInfo != 0;
}

- (void)deleteIsSuccessfulDirectExecution
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsSuccessfulDirectExecution:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsSuccessfulDirectExecution
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsSuccessfulDirectExecution:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isSuccessfulDirectExecution = a3;
}

- (void)deleteIsExecuted
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsExecuted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExecuted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsExecuted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isExecuted = a3;
}

- (void)deleteIsSuccess
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isSuccess = a3;
}

- (void)deleteTaskSuccessType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTaskSuccessType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskSuccessType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskSuccessType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int taskSuccessType = a3;
}

- (void)deleteOriginalResolutionContextId
{
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

@end
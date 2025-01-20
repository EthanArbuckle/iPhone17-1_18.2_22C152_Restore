@interface DODMLASRSchemaDODMLASRConfusionPair
- (BOOL)hasAsrId;
- (BOOL)hasEditMethod;
- (BOOL)hasEditReason;
- (BOOL)hasErrorCode;
- (BOOL)hasRecognizedTextStartIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRConfusionPair)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRConfusionPair)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)asrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)editMethod;
- (int)editReason;
- (int)errorCode;
- (int)recognizedTextStartIndex;
- (unint64_t)hash;
- (void)deleteAsrId;
- (void)deleteEditMethod;
- (void)deleteEditReason;
- (void)deleteErrorCode;
- (void)deleteRecognizedTextStartIndex;
- (void)setAsrId:(id)a3;
- (void)setEditMethod:(int)a3;
- (void)setEditReason:(int)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasAsrId:(BOOL)a3;
- (void)setHasEditMethod:(BOOL)a3;
- (void)setHasEditReason:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasRecognizedTextStartIndex:(BOOL)a3;
- (void)setRecognizedTextStartIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRConfusionPair

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPair;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DODMLASRSchemaDODMLASRConfusionPair *)self deleteAsrId];
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

- (void)setHasAsrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)recognizedTextStartIndex
{
  return self->_recognizedTextStartIndex;
}

- (int)editReason
{
  return self->_editReason;
}

- (int)editMethod
{
  return self->_editMethod;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setAsrId:(id)a3
{
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (DODMLASRSchemaDODMLASRConfusionPair)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPair;
  v5 = [(DODMLASRSchemaDODMLASRConfusionPair *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DODMLASRSchemaDODMLASRConfusionPair *)v5 setAsrId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRConfusionPair setErrorCode:](v5, "setErrorCode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"editMethod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRConfusionPair setEditMethod:](v5, "setEditMethod:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"editReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRConfusionPair setEditReason:](v5, "setEditReason:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"recognizedTextStartIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRConfusionPair setRecognizedTextStartIndex:](v5, "setRecognizedTextStartIndex:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRConfusionPair)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRConfusionPair *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRConfusionPair *)self dictionaryRepresentation];
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
  if (self->_asrId)
  {
    id v4 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v8 = [(DODMLASRSchemaDODMLASRConfusionPair *)self editMethod];
    objc_super v9 = @"ASREDITMETHOD_UNKNOWN";
    if (v8 == 1) {
      objc_super v9 = @"ASREDITMETHOD_ALTERNATIVE_SELECTION";
    }
    if (v8 == 2) {
      v10 = @"ASREDITMETHOD_KEYBOARD_CORRECTION";
    }
    else {
      v10 = v9;
    }
    [v3 setObject:v10 forKeyedSubscript:@"editMethod"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unsigned int v11 = [(DODMLASRSchemaDODMLASRConfusionPair *)self editReason] - 1;
    if (v11 > 2) {
      v12 = @"ASREDITREASON_UNKNOWN";
    }
    else {
      v12 = off_1E5EAE388[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"editReason"];
    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = objc_msgSend(NSNumber, "numberWithInt:", -[DODMLASRSchemaDODMLASRConfusionPair errorCode](self, "errorCode"));
    [v3 setObject:v13 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_super v14 = objc_msgSend(NSNumber, "numberWithInt:", -[DODMLASRSchemaDODMLASRConfusionPair recognizedTextStartIndex](self, "recognizedTextStartIndex"));
    [v3 setObject:v14 forKeyedSubscript:@"recognizedTextStartIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_asrId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_editMethod;
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
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  uint64_t v6 = 2654435761 * self->_editReason;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_recognizedTextStartIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
  uint64_t v6 = [v4 asrId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
    unsigned int v11 = [v4 asrId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $691E37601F70C0C341DF7725D80A806D has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_24;
    }
    $691E37601F70C0C341DF7725D80A806D has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    int editMethod = self->_editMethod;
    if (editMethod != [v4 editMethod]) {
      goto LABEL_24;
    }
    $691E37601F70C0C341DF7725D80A806D has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int editReason = self->_editReason;
    if (editReason == [v4 editReason])
    {
      $691E37601F70C0C341DF7725D80A806D has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int recognizedTextStartIndex = self->_recognizedTextStartIndex;
    if (recognizedTextStartIndex != [v4 recognizedTextStartIndex]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];

  if (v4)
  {
    uint64_t v5 = [(DODMLASRSchemaDODMLASRConfusionPair *)self asrId];
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
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRConfusionPairReadFrom(self, (uint64_t)a3);
}

- (void)deleteRecognizedTextStartIndex
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasRecognizedTextStartIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRecognizedTextStartIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRecognizedTextStartIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int recognizedTextStartIndex = a3;
}

- (void)deleteEditReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEditReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEditReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEditReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int editReason = a3;
}

- (void)deleteEditMethod
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEditMethod:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEditMethod
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEditMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int editMethod = a3;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorCode = a3;
}

- (void)deleteAsrId
{
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

@end
@interface SRSchemaSRCheckErrorResponse
- (BOOL)hasPredictedErrorType;
- (BOOL)hasSelectedRecoveryStrategy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SRSchemaSRCheckErrorResponse)initWithDictionary:(id)a3;
- (SRSchemaSRCheckErrorResponse)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)predictedErrorType;
- (int)selectedRecoveryStrategy;
- (unint64_t)hash;
- (void)deletePredictedErrorType;
- (void)deleteSelectedRecoveryStrategy;
- (void)setHasPredictedErrorType:(BOOL)a3;
- (void)setHasSelectedRecoveryStrategy:(BOOL)a3;
- (void)setPredictedErrorType:(int)a3;
- (void)setSelectedRecoveryStrategy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SRSchemaSRCheckErrorResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)selectedRecoveryStrategy
{
  return self->_selectedRecoveryStrategy;
}

- (int)predictedErrorType
{
  return self->_predictedErrorType;
}

- (SRSchemaSRCheckErrorResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SRSchemaSRCheckErrorResponse;
  v5 = [(SRSchemaSRCheckErrorResponse *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"predictedErrorType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SRSchemaSRCheckErrorResponse setPredictedErrorType:](v5, "setPredictedErrorType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"selectedRecoveryStrategy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SRSchemaSRCheckErrorResponse setSelectedRecoveryStrategy:](v5, "setSelectedRecoveryStrategy:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SRSchemaSRCheckErrorResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SRSchemaSRCheckErrorResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SRSchemaSRCheckErrorResponse *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(SRSchemaSRCheckErrorResponse *)self predictedErrorType] - 1;
    if (v5 > 8) {
      v6 = @"SRPREDICTEDERRORTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBE198[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"predictedErrorType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(SRSchemaSRCheckErrorResponse *)self selectedRecoveryStrategy] - 1;
    if (v7 > 6) {
      v8 = @"SRSELECTEDRECOVERYSTRATEGY_UNKNOWN";
    }
    else {
      v8 = off_1E5EBE1E0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"selectedRecoveryStrategy"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_predictedErrorType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_selectedRecoveryStrategy;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $357DF32675B519D85D325608C0F1D2A9 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int predictedErrorType = self->_predictedErrorType;
    if (predictedErrorType != [v4 predictedErrorType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $357DF32675B519D85D325608C0F1D2A9 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int selectedRecoveryStrategy = self->_selectedRecoveryStrategy;
    if (selectedRecoveryStrategy != [v4 selectedRecoveryStrategy]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SRSchemaSRCheckErrorResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteSelectedRecoveryStrategy
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSelectedRecoveryStrategy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectedRecoveryStrategy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSelectedRecoveryStrategy:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int selectedRecoveryStrategy = a3;
}

- (void)deletePredictedErrorType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPredictedErrorType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredictedErrorType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPredictedErrorType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int predictedErrorType = a3;
}

@end
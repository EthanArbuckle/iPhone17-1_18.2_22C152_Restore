@interface CLPInstSchemaCLPCDMReplaySampleStarted
- (BOOL)hasOriginalRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasTrpId;
- (BOOL)hasUtteranceRepetitionsInCalendarWeek;
- (BOOL)hasWasHabitualUserDuringCalendarWeek;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasHabitualUserDuringCalendarWeek;
- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUUID)originalRequestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)utteranceRepetitionsInCalendarWeek;
- (void)deleteOriginalRequestId;
- (void)deleteResultCandidateId;
- (void)deleteTrpId;
- (void)deleteUtteranceRepetitionsInCalendarWeek;
- (void)deleteWasHabitualUserDuringCalendarWeek;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setHasUtteranceRepetitionsInCalendarWeek:(BOOL)a3;
- (void)setHasWasHabitualUserDuringCalendarWeek:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)setUtteranceRepetitionsInCalendarWeek:(unsigned int)a3;
- (void)setWasHabitualUserDuringCalendarWeek:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCDMReplaySampleStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CLPInstSchemaCLPCDMReplaySampleStarted *)self deleteOriginalRequestId];
  }
  v9 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CLPInstSchemaCLPCDMReplaySampleStarted *)self deleteTrpId];
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
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
}

- (void)setHasTrpId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (BOOL)wasHabitualUserDuringCalendarWeek
{
  return self->_wasHabitualUserDuringCalendarWeek;
}

- (unsigned)utteranceRepetitionsInCalendarWeek
{
  return self->_utteranceRepetitionsInCalendarWeek;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleStarted;
  v5 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CLPInstSchemaCLPCDMReplaySampleStarted *)v5 setOriginalRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(CLPInstSchemaCLPCDMReplaySampleStarted *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"utteranceRepetitionsInCalendarWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCDMReplaySampleStarted setUtteranceRepetitionsInCalendarWeek:](v5, "setUtteranceRepetitionsInCalendarWeek:", [v10 unsignedIntValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"wasHabitualUserDuringCalendarWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCDMReplaySampleStarted setWasHabitualUserDuringCalendarWeek:](v5, "setWasHabitualUserDuringCalendarWeek:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(CLPInstSchemaCLPCDMReplaySampleStarted *)v5 setTrpId:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCDMReplaySampleStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self dictionaryRepresentation];
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
  if (self->_originalRequestId)
  {
    id v4 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_resultCandidateId)
  {
    uint64_t v7 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self resultCandidateId];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_trpId)
  {
    v9 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"trpId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"trpId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPCDMReplaySampleStarted utteranceRepetitionsInCalendarWeek](self, "utteranceRepetitionsInCalendarWeek"));
    [v3 setObject:v13 forKeyedSubscript:@"utteranceRepetitionsInCalendarWeek"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPCDMReplaySampleStarted wasHabitualUserDuringCalendarWeek](self, "wasHabitualUserDuringCalendarWeek"));
    [v3 setObject:v14 forKeyedSubscript:@"wasHabitualUserDuringCalendarWeek"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalRequestId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_utteranceRepetitionsInCalendarWeek;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_trpId hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_wasHabitualUserDuringCalendarWeek;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_trpId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
  uint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
    v10 = [v4 originalRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self resultCandidateId];
  uint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v12 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self resultCandidateId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $F5B8DC446DBA91C7F9A364DF2A550771 has = self->_has;
  unsigned int v18 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int utteranceRepetitionsInCalendarWeek = self->_utteranceRepetitionsInCalendarWeek;
    if (utteranceRepetitionsInCalendarWeek != [v4 utteranceRepetitionsInCalendarWeek]) {
      goto LABEL_24;
    }
    $F5B8DC446DBA91C7F9A364DF2A550771 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int wasHabitualUserDuringCalendarWeek = self->_wasHabitualUserDuringCalendarWeek;
    if (wasHabitualUserDuringCalendarWeek != [v4 wasHabitualUserDuringCalendarWeek]) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
  uint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  v23 = (void *)v22;
  v24 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
  v25 = [v4 trpId];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  NSUInteger v4 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];

  if (v4)
  {
    uint64_t v5 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v8 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];

  v9 = v11;
  if (v8)
  {
    v10 = [(CLPInstSchemaCLPCDMReplaySampleStarted *)self trpId];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplaySampleStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteWasHabitualUserDuringCalendarWeek
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasHabitualUserDuringCalendarWeek
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWasHabitualUserDuringCalendarWeek:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int wasHabitualUserDuringCalendarWeek = a3;
}

- (void)deleteUtteranceRepetitionsInCalendarWeek
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUtteranceRepetitionsInCalendarWeek:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUtteranceRepetitionsInCalendarWeek
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUtteranceRepetitionsInCalendarWeek:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int utteranceRepetitionsInCalendarWeek = a3;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

@end
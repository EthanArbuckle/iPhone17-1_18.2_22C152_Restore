@interface TTMSchemaTTMTCUResult
- (BOOL)hasDecision;
- (BOOL)hasDecisionSource;
- (BOOL)hasTcuId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)tcuId;
- (TTMSchemaTTMTCUResult)initWithDictionary:(id)a3;
- (TTMSchemaTTMTCUResult)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)decision;
- (int)decisionSource;
- (unint64_t)hash;
- (void)deleteDecision;
- (void)deleteDecisionSource;
- (void)deleteTcuId;
- (void)setDecision:(int)a3;
- (void)setDecisionSource:(int)a3;
- (void)setHasDecision:(BOOL)a3;
- (void)setHasDecisionSource:(BOOL)a3;
- (void)setHasTcuId:(BOOL)a3;
- (void)setTcuId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMTCUResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TTMSchemaTTMTCUResult;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMTCUResult *)self tcuId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(TTMSchemaTTMTCUResult *)self deleteTcuId];
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

- (void)setHasTcuId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)decisionSource
{
  return self->_decisionSource;
}

- (int)decision
{
  return self->_decision;
}

- (void)setTcuId:(id)a3
{
}

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (TTMSchemaTTMTCUResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TTMSchemaTTMTCUResult;
  v5 = [(TTMSchemaTTMTCUResult *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tcuId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTMSchemaTTMTCUResult *)v5 setTcuId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"decision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMTCUResult setDecision:](v5, "setDecision:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"decisionSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMTCUResult setDecisionSource:](v5, "setDecisionSource:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (TTMSchemaTTMTCUResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMTCUResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMTCUResult *)self dictionaryRepresentation];
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
    unsigned int v5 = [(TTMSchemaTTMTCUResult *)self decision] - 1;
    if (v5 > 5) {
      v6 = @"TTMTCUMITIGATIONDECISION_UNKNOWN";
    }
    else {
      v6 = off_1E5EBB118[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"decision"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v7 = [(TTMSchemaTTMTCUResult *)self decisionSource];
    v8 = @"TTMDECISIONSOURCE_UNKNOWN";
    if (v7 == 1) {
      v8 = @"TTMDECISIONSOURCE_SIRI_DIRECTED_SPEECH_DETECTOR";
    }
    if (v7 == 2) {
      objc_super v9 = @"TTMDECISIONSOURCE_OVERRIDE";
    }
    else {
      objc_super v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"decisionSource"];
  }
  if (self->_tcuId)
  {
    v10 = [(TTMSchemaTTMTCUResult *)self tcuId];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"tcuId"];
    }
    else
    {
      objc_super v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"tcuId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_tcuId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_decision;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_decisionSource;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(TTMSchemaTTMTCUResult *)self tcuId];
  v6 = [v4 tcuId];
  int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(TTMSchemaTTMTCUResult *)self tcuId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(TTMSchemaTTMTCUResult *)self tcuId];
    v11 = [v4 tcuId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $67A494D4162D32F076AFCE9B36736057 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int decision = self->_decision;
    if (decision == [v4 decision])
    {
      $67A494D4162D32F076AFCE9B36736057 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int decisionSource = self->_decisionSource;
    if (decisionSource != [v4 decisionSource]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(TTMSchemaTTMTCUResult *)self tcuId];

  if (v4)
  {
    uint64_t v5 = [(TTMSchemaTTMTCUResult *)self tcuId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  int v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMTCUResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteDecisionSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDecisionSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDecisionSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDecisionSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int decisionSource = a3;
}

- (void)deleteDecision
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDecision:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int decision = a3;
}

- (void)deleteTcuId
{
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

@end
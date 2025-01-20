@interface TTMSchemaTTMNeuralCombinerRequestFailed
- (BOOL)hasReason;
- (BOOL)hasTcuId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)tcuId;
- (TTMSchemaTTMNeuralCombinerRequestFailed)initWithDictionary:(id)a3;
- (TTMSchemaTTMNeuralCombinerRequestFailed)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (void)deleteReason;
- (void)deleteTcuId;
- (void)setHasReason:(BOOL)a3;
- (void)setHasTcuId:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setTcuId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMNeuralCombinerRequestFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(TTMSchemaTTMNeuralCombinerRequestFailed *)self deleteTcuId];
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

- (int)reason
{
  return self->_reason;
}

- (void)setTcuId:(id)a3
{
}

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (TTMSchemaTTMNeuralCombinerRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestFailed;
  v5 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tcuId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTMSchemaTTMNeuralCombinerRequestFailed *)v5 setTcuId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMNeuralCombinerRequestFailed setReason:](v5, "setReason:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (TTMSchemaTTMNeuralCombinerRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self dictionaryRepresentation];
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
    unsigned int v4 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self reason] - 1;
    if (v4 > 2) {
      v5 = @"TTMNEURALCOMBINERFAILUREREASON_UNKNONW";
    }
    else {
      v5 = off_1E5EBB020[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"reason"];
  }
  if (self->_tcuId)
  {
    v6 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"tcuId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"tcuId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_tcuId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
  v6 = [v4 tcuId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
    objc_super v11 = [v4 tcuId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];

  if (v4)
  {
    v5 = [(TTMSchemaTTMNeuralCombinerRequestFailed *)self tcuId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMNeuralCombinerRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

- (void)deleteTcuId
{
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

@end
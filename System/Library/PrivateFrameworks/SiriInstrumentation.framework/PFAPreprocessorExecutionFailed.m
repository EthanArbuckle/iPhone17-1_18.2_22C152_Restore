@interface PFAPreprocessorExecutionFailed
- (BOOL)hasFailedAtStep;
- (BOOL)hasPreprocessorExecutionMetrics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAPreprocessorExecutionFailed)initWithDictionary:(id)a3;
- (PFAPreprocessorExecutionFailed)initWithJSON:(id)a3;
- (PFAPreprocessorExecutionMetrics)preprocessorExecutionMetrics;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)failedAtStep;
- (unint64_t)hash;
- (void)deleteFailedAtStep;
- (void)deletePreprocessorExecutionMetrics;
- (void)setFailedAtStep:(int)a3;
- (void)setHasFailedAtStep:(BOOL)a3;
- (void)setHasPreprocessorExecutionMetrics:(BOOL)a3;
- (void)setPreprocessorExecutionMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPreprocessorExecutionFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFAPreprocessorExecutionFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PFAPreprocessorExecutionFailed *)self deletePreprocessorExecutionMetrics];
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

- (void)setHasPreprocessorExecutionMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)failedAtStep
{
  return self->_failedAtStep;
}

- (void)setPreprocessorExecutionMetrics:(id)a3
{
}

- (PFAPreprocessorExecutionMetrics)preprocessorExecutionMetrics
{
  return self->_preprocessorExecutionMetrics;
}

- (PFAPreprocessorExecutionFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPreprocessorExecutionFailed;
  v5 = [(PFAPreprocessorExecutionFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"preprocessorExecutionMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PFAPreprocessorExecutionMetrics alloc] initWithDictionary:v6];
      [(PFAPreprocessorExecutionFailed *)v5 setPreprocessorExecutionMetrics:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"failedAtStep"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPreprocessorExecutionFailed setFailedAtStep:](v5, "setFailedAtStep:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PFAPreprocessorExecutionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPreprocessorExecutionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPreprocessorExecutionFailed *)self dictionaryRepresentation];
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
    unsigned int v4 = [(PFAPreprocessorExecutionFailed *)self failedAtStep] - 1;
    if (v4 > 3) {
      v5 = @"PREPROCESSOREXECUTIONSTEP_UNKNOWN";
    }
    else {
      v5 = off_1E5EBEF08[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"failedAtStep"];
  }
  if (self->_preprocessorExecutionMetrics)
  {
    v6 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"preprocessorExecutionMetrics"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"preprocessorExecutionMetrics"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PFAPreprocessorExecutionMetrics *)self->_preprocessorExecutionMetrics hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_failedAtStep;
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
  v5 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
  v6 = [v4 preprocessorExecutionMetrics];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
    objc_super v11 = [v4 preprocessorExecutionMetrics];
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
    int failedAtStep = self->_failedAtStep;
    if (failedAtStep != [v4 failedAtStep]) {
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
  uint64_t v4 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];

  if (v4)
  {
    v5 = [(PFAPreprocessorExecutionFailed *)self preprocessorExecutionMetrics];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorExecutionFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailedAtStep
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFailedAtStep:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFailedAtStep
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFailedAtStep:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int failedAtStep = a3;
}

- (void)deletePreprocessorExecutionMetrics
{
}

- (BOOL)hasPreprocessorExecutionMetrics
{
  return self->_preprocessorExecutionMetrics != 0;
}

@end
@interface CAARSchemaCAARModelExecuted
- (BOOL)hasAsset;
- (BOOL)hasIsShadowLog;
- (BOOL)hasModelOutput;
- (BOOL)hasTrialEnrollment;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShadowLog;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARModelExecuted)initWithDictionary:(id)a3;
- (CAARSchemaCAARModelExecuted)initWithJSON:(id)a3;
- (CAARSchemaCAARModelOutput)modelOutput;
- (CAARSchemaCAARTrialEnrollment)trialEnrollment;
- (NSData)jsonData;
- (SISchemaAsset)asset;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAsset;
- (void)deleteIsShadowLog;
- (void)deleteModelOutput;
- (void)deleteTrialEnrollment;
- (void)setAsset:(id)a3;
- (void)setHasAsset:(BOOL)a3;
- (void)setHasIsShadowLog:(BOOL)a3;
- (void)setHasModelOutput:(BOOL)a3;
- (void)setHasTrialEnrollment:(BOOL)a3;
- (void)setIsShadowLog:(BOOL)a3;
- (void)setModelOutput:(id)a3;
- (void)setTrialEnrollment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARModelExecuted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAARSchemaCAARModelExecuted;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARModelExecuted *)self asset];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAARSchemaCAARModelExecuted *)self deleteAsset];
  }
  v9 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAARSchemaCAARModelExecuted *)self deleteModelOutput];
  }
  v12 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAARSchemaCAARModelExecuted *)self deleteTrialEnrollment];
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
  objc_storeStrong((id *)&self->_trialEnrollment, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setHasTrialEnrollment:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasModelOutput:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAsset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTrialEnrollment:(id)a3
{
}

- (CAARSchemaCAARTrialEnrollment)trialEnrollment
{
  return self->_trialEnrollment;
}

- (void)setModelOutput:(id)a3
{
}

- (CAARSchemaCAARModelOutput)modelOutput
{
  return self->_modelOutput;
}

- (BOOL)isShadowLog
{
  return self->_isShadowLog;
}

- (void)setAsset:(id)a3
{
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (CAARSchemaCAARModelExecuted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAARSchemaCAARModelExecuted;
  v5 = [(CAARSchemaCAARModelExecuted *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaAsset alloc] initWithDictionary:v6];
      [(CAARSchemaCAARModelExecuted *)v5 setAsset:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"isShadowLog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARModelExecuted setIsShadowLog:](v5, "setIsShadowLog:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"modelOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[CAARSchemaCAARModelOutput alloc] initWithDictionary:v9];
      [(CAARSchemaCAARModelExecuted *)v5 setModelOutput:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"trialEnrollment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[CAARSchemaCAARTrialEnrollment alloc] initWithDictionary:v11];
      [(CAARSchemaCAARModelExecuted *)v5 setTrialEnrollment:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (CAARSchemaCAARModelExecuted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARModelExecuted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARModelExecuted *)self dictionaryRepresentation];
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
  if (self->_asset)
  {
    id v4 = [(CAARSchemaCAARModelExecuted *)self asset];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asset"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asset"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARModelExecuted isShadowLog](self, "isShadowLog"));
    [v3 setObject:v7 forKeyedSubscript:@"isShadowLog"];
  }
  if (self->_modelOutput)
  {
    int v8 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"modelOutput"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"modelOutput"];
    }
  }
  if (self->_trialEnrollment)
  {
    int v11 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"trialEnrollment"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"trialEnrollment"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaAsset *)self->_asset hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isShadowLog;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(CAARSchemaCAARModelOutput *)self->_modelOutput hash];
  return v5 ^ v6 ^ [(CAARSchemaCAARTrialEnrollment *)self->_trialEnrollment hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(CAARSchemaCAARModelExecuted *)self asset];
  unint64_t v6 = [v4 asset];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(CAARSchemaCAARModelExecuted *)self asset];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(CAARSchemaCAARModelExecuted *)self asset];
    v10 = [v4 asset];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isShadowLog = self->_isShadowLog;
    if (isShadowLog != [v4 isShadowLog]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
  unint64_t v6 = [v4 modelOutput];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
  if (v13)
  {
    int v14 = (void *)v13;
    objc_super v15 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
    objc_super v16 = [v4 modelOutput];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
  unint64_t v6 = [v4 trialEnrollment];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
    v21 = [v4 trialEnrollment];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(CAARSchemaCAARModelExecuted *)self asset];

  if (v4)
  {
    unint64_t v5 = [(CAARSchemaCAARModelExecuted *)self asset];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v6 = [(CAARSchemaCAARModelExecuted *)self modelOutput];

  if (v6)
  {
    uint64_t v7 = [(CAARSchemaCAARModelExecuted *)self modelOutput];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];

  v9 = v11;
  if (v8)
  {
    v10 = [(CAARSchemaCAARModelExecuted *)self trialEnrollment];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARModelExecutedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialEnrollment
{
}

- (BOOL)hasTrialEnrollment
{
  return self->_trialEnrollment != 0;
}

- (void)deleteModelOutput
{
}

- (BOOL)hasModelOutput
{
  return self->_modelOutput != 0;
}

- (void)deleteIsShadowLog
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsShadowLog:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsShadowLog
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsShadowLog:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isShadowLog = a3;
}

- (void)deleteAsset
{
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

@end
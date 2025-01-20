@interface STSchemaSTAnswerSynthesisResult
- (BOOL)hasDataMetrics;
- (BOOL)hasIsContentSearchFallback;
- (BOOL)hasModelNumber;
- (BOOL)hasPerfMetrics;
- (BOOL)isContentSearchFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)modelNumber;
- (STSchemaSTAnswerSynthesisDataMetrics)dataMetrics;
- (STSchemaSTAnswerSynthesisPerfMetrics)perfMetrics;
- (STSchemaSTAnswerSynthesisResult)initWithDictionary:(id)a3;
- (STSchemaSTAnswerSynthesisResult)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDataMetrics;
- (void)deleteIsContentSearchFallback;
- (void)deleteModelNumber;
- (void)deletePerfMetrics;
- (void)setDataMetrics:(id)a3;
- (void)setHasDataMetrics:(BOOL)a3;
- (void)setHasIsContentSearchFallback:(BOOL)a3;
- (void)setHasModelNumber:(BOOL)a3;
- (void)setHasPerfMetrics:(BOOL)a3;
- (void)setIsContentSearchFallback:(BOOL)a3;
- (void)setModelNumber:(id)a3;
- (void)setPerfMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTAnswerSynthesisResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTAnswerSynthesisResult;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTAnswerSynthesisResult *)self deletePerfMetrics];
  }
  v9 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(STSchemaSTAnswerSynthesisResult *)self deleteDataMetrics];
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
  objc_storeStrong((id *)&self->_dataMetrics, 0);
  objc_storeStrong((id *)&self->_perfMetrics, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

- (void)setHasDataMetrics:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasPerfMetrics:(BOOL)a3
{
  *(&self->_isContentSearchFallback + 3) = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  *(&self->_isContentSearchFallback + 2) = a3;
}

- (BOOL)isContentSearchFallback
{
  return self->_isContentSearchFallback;
}

- (void)setDataMetrics:(id)a3
{
}

- (STSchemaSTAnswerSynthesisDataMetrics)dataMetrics
{
  return self->_dataMetrics;
}

- (void)setPerfMetrics:(id)a3
{
}

- (STSchemaSTAnswerSynthesisPerfMetrics)perfMetrics
{
  return self->_perfMetrics;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (STSchemaSTAnswerSynthesisResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSchemaSTAnswerSynthesisResult;
  v5 = [(STSchemaSTAnswerSynthesisResult *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(STSchemaSTAnswerSynthesisResult *)v5 setModelNumber:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"perfMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[STSchemaSTAnswerSynthesisPerfMetrics alloc] initWithDictionary:v8];
      [(STSchemaSTAnswerSynthesisResult *)v5 setPerfMetrics:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dataMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[STSchemaSTAnswerSynthesisDataMetrics alloc] initWithDictionary:v10];
      [(STSchemaSTAnswerSynthesisResult *)v5 setDataMetrics:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"isContentSearchFallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisResult setIsContentSearchFallback:](v5, "setIsContentSearchFallback:", [v12 BOOLValue]);
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (STSchemaSTAnswerSynthesisResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTAnswerSynthesisResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTAnswerSynthesisResult *)self dictionaryRepresentation];
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
  if (self->_dataMetrics)
  {
    id v4 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"dataMetrics"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"dataMetrics"];
    }
  }
  if (*(&self->_isContentSearchFallback + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaSTAnswerSynthesisResult isContentSearchFallback](self, "isContentSearchFallback"));
    [v3 setObject:v7 forKeyedSubscript:@"isContentSearchFallback"];
  }
  if (self->_modelNumber)
  {
    int v8 = [(STSchemaSTAnswerSynthesisResult *)self modelNumber];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"modelNumber"];
  }
  if (self->_perfMetrics)
  {
    v10 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"perfMetrics"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"perfMetrics"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelNumber hash];
  unint64_t v4 = [(STSchemaSTAnswerSynthesisPerfMetrics *)self->_perfMetrics hash];
  unint64_t v5 = [(STSchemaSTAnswerSynthesisDataMetrics *)self->_dataMetrics hash];
  if (*(&self->_isContentSearchFallback + 1)) {
    uint64_t v6 = 2654435761 * self->_isContentSearchFallback;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(STSchemaSTAnswerSynthesisResult *)self modelNumber];
  uint64_t v6 = [v4 modelNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(STSchemaSTAnswerSynthesisResult *)self modelNumber];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(STSchemaSTAnswerSynthesisResult *)self modelNumber];
    v10 = [v4 modelNumber];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
  uint64_t v6 = [v4 perfMetrics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
    objc_super v15 = [v4 perfMetrics];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
  uint64_t v6 = [v4 dataMetrics];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
    v20 = [v4 dataMetrics];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (*(&self->_isContentSearchFallback + 1) == (v4[33] & 1))
  {
    if (!*(&self->_isContentSearchFallback + 1)
      || (int isContentSearchFallback = self->_isContentSearchFallback,
          isContentSearchFallback == [v4 isContentSearchFallback]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(STSchemaSTAnswerSynthesisResult *)self modelNumber];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];

  if (v5)
  {
    uint64_t v6 = [(STSchemaSTAnswerSynthesisResult *)self perfMetrics];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];

  if (v7)
  {
    int v8 = [(STSchemaSTAnswerSynthesisResult *)self dataMetrics];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isContentSearchFallback + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTAnswerSynthesisResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsContentSearchFallback
{
  *(&self->_isContentSearchFallback + 1) &= ~1u;
}

- (void)setHasIsContentSearchFallback:(BOOL)a3
{
  *(&self->_isContentSearchFallback + 1) = *(&self->_isContentSearchFallback + 1) & 0xFE | a3;
}

- (BOOL)hasIsContentSearchFallback
{
  return *(&self->_isContentSearchFallback + 1);
}

- (void)setIsContentSearchFallback:(BOOL)a3
{
  *(&self->_isContentSearchFallback + 1) |= 1u;
  self->_int isContentSearchFallback = a3;
}

- (void)deleteDataMetrics
{
}

- (BOOL)hasDataMetrics
{
  return self->_dataMetrics != 0;
}

- (void)deletePerfMetrics
{
}

- (BOOL)hasPerfMetrics
{
  return self->_perfMetrics != 0;
}

- (void)deleteModelNumber
{
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

@end
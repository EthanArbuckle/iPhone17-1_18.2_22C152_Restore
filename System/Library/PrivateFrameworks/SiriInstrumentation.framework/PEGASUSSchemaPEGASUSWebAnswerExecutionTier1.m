@interface PEGASUSSchemaPEGASUSWebAnswerExecutionTier1
- (BOOL)hasAnswerId;
- (BOOL)hasEntityUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)answerId;
- (NSString)entityUrl;
- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAnswerId;
- (void)deleteEntityUrl;
- (void)setAnswerId:(id)a3;
- (void)setEntityUrl:(id)a3;
- (void)setHasAnswerId:(BOOL)a3;
- (void)setHasEntityUrl:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSWebAnswerExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteAnswerId];
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteEntityUrl];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteAnswerId];
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteEntityUrl];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteAnswerId];
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteEntityUrl];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteAnswerId];
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteEntityUrl];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteAnswerId];
    [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self deleteEntityUrl];
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
  objc_storeStrong((id *)&self->_entityUrl, 0);
  objc_storeStrong((id *)&self->_answerId, 0);
}

- (void)setHasEntityUrl:(BOOL)a3
{
  self->_hasEntityUrl = a3;
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void)setEntityUrl:(id)a3
{
}

- (NSString)entityUrl
{
  return self->_entityUrl;
}

- (void)setAnswerId:(id)a3
{
}

- (NSString)answerId
{
  return self->_answerId;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerExecutionTier1;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"answerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)v5 setAnswerId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"entityUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)v5 setEntityUrl:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self dictionaryRepresentation];
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
  if (self->_answerId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self answerId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"answerId"];
  }
  if (self->_entityUrl)
  {
    v6 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self entityUrl];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"entityUrl"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_answerId hash];
  return [(NSString *)self->_entityUrl hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self answerId];
  v6 = [v4 answerId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self answerId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self answerId];
    v10 = [v4 answerId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self entityUrl];
  v6 = [v4 entityUrl];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self entityUrl];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self entityUrl];
    v15 = [v4 entityUrl];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self answerId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self entityUrl];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntityUrl
{
}

- (BOOL)hasEntityUrl
{
  return self->_entityUrl != 0;
}

- (void)deleteAnswerId
{
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

@end
@interface FLOWSchemaFLOWWebAnswerExecutionTier1
- (BOOL)hasAnswerId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)answerId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAnswerId;
- (void)setAnswerId:(id)a3;
- (void)setHasAnswerId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWWebAnswerExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FLOWSchemaFLOWWebAnswerExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:4]) {
    [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:5]) {
    [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:6]) {
    [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:7]) {
    [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self deleteAnswerId];
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

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void)setAnswerId:(id)a3
{
}

- (NSString)answerId
{
  return self->_answerId;
}

- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWWebAnswerExecutionTier1;
  v5 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"answerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)v5 setAnswerId:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWWebAnswerExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self dictionaryRepresentation];
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
    id v4 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self answerId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"answerId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_answerId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self answerId];
    v6 = [v4 answerId];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self answerId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self answerId];
      v11 = [v4 answerId];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(FLOWSchemaFLOWWebAnswerExecutionTier1 *)self answerId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWWebAnswerExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnswerId
{
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

@end
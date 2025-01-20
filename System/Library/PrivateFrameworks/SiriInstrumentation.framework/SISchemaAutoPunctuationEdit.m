@interface SISchemaAutoPunctuationEdit
- (BOOL)hasCorrectedPunctuation;
- (BOOL)hasRecognizedPunctuation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)correctedPunctuation;
- (NSString)recognizedPunctuation;
- (SISchemaAutoPunctuationEdit)initWithDictionary:(id)a3;
- (SISchemaAutoPunctuationEdit)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCorrectedPunctuation;
- (void)deleteRecognizedPunctuation;
- (void)setCorrectedPunctuation:(id)a3;
- (void)setHasCorrectedPunctuation:(BOOL)a3;
- (void)setHasRecognizedPunctuation:(BOOL)a3;
- (void)setRecognizedPunctuation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAutoPunctuationEdit

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedPunctuation, 0);
  objc_storeStrong((id *)&self->_recognizedPunctuation, 0);
}

- (void)setHasCorrectedPunctuation:(BOOL)a3
{
  self->_hasCorrectedPunctuation = a3;
}

- (void)setHasRecognizedPunctuation:(BOOL)a3
{
  self->_hasRecognizedPunctuation = a3;
}

- (void)setCorrectedPunctuation:(id)a3
{
}

- (NSString)correctedPunctuation
{
  return self->_correctedPunctuation;
}

- (void)setRecognizedPunctuation:(id)a3
{
}

- (NSString)recognizedPunctuation
{
  return self->_recognizedPunctuation;
}

- (SISchemaAutoPunctuationEdit)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaAutoPunctuationEdit;
  v5 = [(SISchemaAutoPunctuationEdit *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognizedPunctuation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaAutoPunctuationEdit *)v5 setRecognizedPunctuation:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"correctedPunctuation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaAutoPunctuationEdit *)v5 setCorrectedPunctuation:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaAutoPunctuationEdit)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAutoPunctuationEdit *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAutoPunctuationEdit *)self dictionaryRepresentation];
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
  if (self->_correctedPunctuation)
  {
    id v4 = [(SISchemaAutoPunctuationEdit *)self correctedPunctuation];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctedPunctuation"];
  }
  if (self->_recognizedPunctuation)
  {
    v6 = [(SISchemaAutoPunctuationEdit *)self recognizedPunctuation];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"recognizedPunctuation"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recognizedPunctuation hash];
  return [(NSString *)self->_correctedPunctuation hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaAutoPunctuationEdit *)self recognizedPunctuation];
  v6 = [v4 recognizedPunctuation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaAutoPunctuationEdit *)self recognizedPunctuation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaAutoPunctuationEdit *)self recognizedPunctuation];
    v10 = [v4 recognizedPunctuation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaAutoPunctuationEdit *)self correctedPunctuation];
  v6 = [v4 correctedPunctuation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaAutoPunctuationEdit *)self correctedPunctuation];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaAutoPunctuationEdit *)self correctedPunctuation];
    v15 = [v4 correctedPunctuation];
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
  id v4 = [(SISchemaAutoPunctuationEdit *)self recognizedPunctuation];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaAutoPunctuationEdit *)self correctedPunctuation];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAutoPunctuationEditReadFrom(self, (uint64_t)a3);
}

- (void)deleteCorrectedPunctuation
{
}

- (BOOL)hasCorrectedPunctuation
{
  return self->_correctedPunctuation != 0;
}

- (void)deleteRecognizedPunctuation
{
}

- (BOOL)hasRecognizedPunctuation
{
  return self->_recognizedPunctuation != 0;
}

@end
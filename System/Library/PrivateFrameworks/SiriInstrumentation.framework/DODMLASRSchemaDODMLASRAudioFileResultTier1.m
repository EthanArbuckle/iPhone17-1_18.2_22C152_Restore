@interface DODMLASRSchemaDODMLASRAudioFileResultTier1
- (ASRSchemaASRRecognitionResultTier1)recognitionResult;
- (BOOL)hasRecognitionResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRAudioFileResultTier1)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRAudioFileResultTier1)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteRecognitionResult;
- (void)setHasRecognitionResult:(BOOL)a3;
- (void)setRecognitionResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRAudioFileResultTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRAudioFileResultTier1;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self deleteRecognitionResult];
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

- (void)setHasRecognitionResult:(BOOL)a3
{
  self->_hasRecognitionResult = a3;
}

- (void)setRecognitionResult:(id)a3
{
}

- (ASRSchemaASRRecognitionResultTier1)recognitionResult
{
  return self->_recognitionResult;
}

- (DODMLASRSchemaDODMLASRAudioFileResultTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DODMLASRSchemaDODMLASRAudioFileResultTier1;
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognitionResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ASRSchemaASRRecognitionResultTier1 alloc] initWithDictionary:v6];
      [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)v5 setRecognitionResult:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRAudioFileResultTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self dictionaryRepresentation];
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
  if (self->_recognitionResult)
  {
    id v4 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"recognitionResult"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"recognitionResult"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(ASRSchemaASRRecognitionResultTier1 *)self->_recognitionResult hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
    v6 = [v4 recognitionResult];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
      v11 = [v4 recognitionResult];
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
  id v6 = a3;
  id v4 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];

  if (v4)
  {
    v5 = [(DODMLASRSchemaDODMLASRAudioFileResultTier1 *)self recognitionResult];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRAudioFileResultTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteRecognitionResult
{
}

- (BOOL)hasRecognitionResult
{
  return self->_recognitionResult != 0;
}

@end
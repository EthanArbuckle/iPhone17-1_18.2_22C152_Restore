@interface PLUSSchemaPLUSSuggestionGenerated
- (BOOL)hasGeneratedSuggestion;
- (BOOL)hasSuggestionChangeDataCaptureMetadata;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSChangeDataCaptureMetadata)suggestionChangeDataCaptureMetadata;
- (PLUSSchemaPLUSSuggestion)generatedSuggestion;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (PLUSSchemaPLUSSuggestionGenerated)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionGenerated)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteGeneratedSuggestion;
- (void)deleteSuggestionChangeDataCaptureMetadata;
- (void)deleteSuggestionDomainMetadata;
- (void)setGeneratedSuggestion:(id)a3;
- (void)setHasGeneratedSuggestion:(BOOL)a3;
- (void)setHasSuggestionChangeDataCaptureMetadata:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setSuggestionChangeDataCaptureMetadata:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSSuggestionGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggestionGenerated *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggestionGenerated *)self deleteGeneratedSuggestion];
  }
  v12 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSSuggestionGenerated *)self deleteSuggestionChangeDataCaptureMetadata];
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
  objc_storeStrong((id *)&self->_suggestionChangeDataCaptureMetadata, 0);
  objc_storeStrong((id *)&self->_generatedSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasSuggestionChangeDataCaptureMetadata:(BOOL)a3
{
  self->_hasSuggestionChangeDataCaptureMetadata = a3;
}

- (void)setHasGeneratedSuggestion:(BOOL)a3
{
  self->_hasGeneratedSuggestion = a3;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  self->_hasSuggestionDomainMetadata = a3;
}

- (void)setSuggestionChangeDataCaptureMetadata:(id)a3
{
}

- (PLUSSchemaPLUSChangeDataCaptureMetadata)suggestionChangeDataCaptureMetadata
{
  return self->_suggestionChangeDataCaptureMetadata;
}

- (void)setGeneratedSuggestion:(id)a3
{
}

- (PLUSSchemaPLUSSuggestion)generatedSuggestion
{
  return self->_generatedSuggestion;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (PLUSSchemaPLUSSuggestionGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSSuggestionGenerated;
  v5 = [(PLUSSchemaPLUSSuggestionGenerated *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestionGenerated *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"generatedSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSSuggestion alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggestionGenerated *)v5 setGeneratedSuggestion:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"suggestionChangeDataCaptureMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PLUSSchemaPLUSChangeDataCaptureMetadata alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSSuggestionGenerated *)v5 setSuggestionChangeDataCaptureMetadata:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionGenerated *)self dictionaryRepresentation];
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
  if (self->_generatedSuggestion)
  {
    id v4 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"generatedSuggestion"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"generatedSuggestion"];
    }
  }
  if (self->_suggestionChangeDataCaptureMetadata)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"suggestionChangeDataCaptureMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"suggestionChangeDataCaptureMetadata"];
    }
  }
  if (self->_suggestionDomainMetadata)
  {
    v10 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionDomainMetadata *)self->_suggestionDomainMetadata hash];
  unint64_t v4 = [(PLUSSchemaPLUSSuggestion *)self->_generatedSuggestion hash] ^ v3;
  return v4 ^ [(PLUSSchemaPLUSChangeDataCaptureMetadata *)self->_suggestionChangeDataCaptureMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
  v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
  v6 = [v4 generatedSuggestion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
    v15 = [v4 generatedSuggestion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
  v6 = [v4 suggestionChangeDataCaptureMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
    v20 = [v4 suggestionChangeDataCaptureMetadata];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionGenerated *)self generatedSuggestion];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];

  if (v8)
  {
    v9 = [(PLUSSchemaPLUSSuggestionGenerated *)self suggestionChangeDataCaptureMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSuggestionChangeDataCaptureMetadata
{
}

- (BOOL)hasSuggestionChangeDataCaptureMetadata
{
  return self->_suggestionChangeDataCaptureMetadata != 0;
}

- (void)deleteGeneratedSuggestion
{
}

- (BOOL)hasGeneratedSuggestion
{
  return self->_generatedSuggestion != 0;
}

- (void)deleteSuggestionDomainMetadata
{
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

@end
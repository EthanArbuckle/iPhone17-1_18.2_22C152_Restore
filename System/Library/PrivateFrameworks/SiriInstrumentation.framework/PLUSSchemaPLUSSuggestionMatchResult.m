@interface PLUSSchemaPLUSSuggestionMatchResult
- (BOOL)hasGeneratedSuggestion;
- (BOOL)hasSuggestionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggestion)generatedSuggestion;
- (PLUSSchemaPLUSSuggestionMatchResult)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionMatchResult)initWithJSON:(id)a3;
- (SISchemaUUID)suggestionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteGeneratedSuggestion;
- (void)deleteSuggestionId;
- (void)setGeneratedSuggestion:(id)a3;
- (void)setHasGeneratedSuggestion:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionMatchResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSSuggestionMatchResult;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggestionMatchResult *)self deleteSuggestionId];
  }
  v9 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggestionMatchResult *)self deleteGeneratedSuggestion];
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
  objc_storeStrong((id *)&self->_generatedSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

- (void)setHasGeneratedSuggestion:(BOOL)a3
{
  self->_hasGeneratedSuggestion = a3;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setGeneratedSuggestion:(id)a3
{
}

- (PLUSSchemaPLUSSuggestion)generatedSuggestion
{
  return self->_generatedSuggestion;
}

- (void)setSuggestionId:(id)a3
{
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (PLUSSchemaPLUSSuggestionMatchResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestionMatchResult;
  v5 = [(PLUSSchemaPLUSSuggestionMatchResult *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestionMatchResult *)v5 setSuggestionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"generatedSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSSuggestion alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggestionMatchResult *)v5 setGeneratedSuggestion:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionMatchResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionMatchResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionMatchResult *)self dictionaryRepresentation];
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
    id v4 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
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
  if (self->_suggestionId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"suggestionId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"suggestionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_suggestionId hash];
  return [(PLUSSchemaPLUSSuggestion *)self->_generatedSuggestion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
  v6 = [v4 suggestionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
    v10 = [v4 suggestionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
  v6 = [v4 generatedSuggestion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
    v15 = [v4 generatedSuggestion];
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
  id v8 = a3;
  id v4 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggestionMatchResult *)self suggestionId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionMatchResult *)self generatedSuggestion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionMatchResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteGeneratedSuggestion
{
}

- (BOOL)hasGeneratedSuggestion
{
  return self->_generatedSuggestion != 0;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end
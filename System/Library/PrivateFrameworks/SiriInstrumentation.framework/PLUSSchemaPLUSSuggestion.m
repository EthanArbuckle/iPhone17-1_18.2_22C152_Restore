@interface PLUSSchemaPLUSSuggestion
- (BOOL)hasSuggestionMetadata;
- (BOOL)hasSuggestionValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggestion)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestion)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionMetadata)suggestionMetadata;
- (PLUSSchemaPLUSSuggestionValue)suggestionValue;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSuggestionMetadata;
- (void)deleteSuggestionValue;
- (void)setHasSuggestionMetadata:(BOOL)a3;
- (void)setHasSuggestionValue:(BOOL)a3;
- (void)setSuggestionMetadata:(id)a3;
- (void)setSuggestionValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestion

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSSuggestion;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggestion *)self deleteSuggestionMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggestion *)self deleteSuggestionValue];
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
  objc_storeStrong((id *)&self->_suggestionValue, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
}

- (void)setHasSuggestionValue:(BOOL)a3
{
  self->_hasSuggestionValue = a3;
}

- (void)setHasSuggestionMetadata:(BOOL)a3
{
  self->_hasSuggestionMetadata = a3;
}

- (void)setSuggestionValue:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionValue)suggestionValue
{
  return self->_suggestionValue;
}

- (void)setSuggestionMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionMetadata)suggestionMetadata
{
  return self->_suggestionMetadata;
}

- (PLUSSchemaPLUSSuggestion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestion;
  v5 = [(PLUSSchemaPLUSSuggestion *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestion *)v5 setSuggestionMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"suggestionValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSSuggestionValue alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggestion *)v5 setSuggestionValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestion *)self dictionaryRepresentation];
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
  if (self->_suggestionMetadata)
  {
    id v4 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"suggestionMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"suggestionMetadata"];
    }
  }
  if (self->_suggestionValue)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"suggestionValue"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"suggestionValue"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionMetadata *)self->_suggestionMetadata hash];
  return [(PLUSSchemaPLUSSuggestionValue *)self->_suggestionValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
  v6 = [v4 suggestionMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
    v10 = [v4 suggestionMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
  v6 = [v4 suggestionValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
    v15 = [v4 suggestionValue];
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
  id v4 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggestion *)self suggestionMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestion *)self suggestionValue];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)deleteSuggestionValue
{
}

- (BOOL)hasSuggestionValue
{
  return self->_suggestionValue != 0;
}

- (void)deleteSuggestionMetadata
{
}

- (BOOL)hasSuggestionMetadata
{
  return self->_suggestionMetadata != 0;
}

@end
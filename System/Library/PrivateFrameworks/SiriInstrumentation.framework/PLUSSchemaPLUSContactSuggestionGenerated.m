@interface PLUSSchemaPLUSContactSuggestionGenerated
- (BOOL)hasGeneratedSuggestion;
- (BOOL)hasIsSuggestionUpdated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestionUpdated;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestion)generatedSuggestion;
- (PLUSSchemaPLUSContactSuggestionGenerated)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestionGenerated)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteGeneratedSuggestion;
- (void)deleteIsSuggestionUpdated;
- (void)setGeneratedSuggestion:(id)a3;
- (void)setHasGeneratedSuggestion:(BOOL)a3;
- (void)setHasIsSuggestionUpdated:(BOOL)a3;
- (void)setIsSuggestionUpdated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestionGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggestionGenerated;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSContactSuggestionGenerated *)self deleteGeneratedSuggestion];
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

- (void)setHasGeneratedSuggestion:(BOOL)a3
{
  *(&self->_isSuggestionUpdated + 2) = a3;
}

- (BOOL)isSuggestionUpdated
{
  return self->_isSuggestionUpdated;
}

- (void)setGeneratedSuggestion:(id)a3
{
}

- (PLUSSchemaPLUSContactSuggestion)generatedSuggestion
{
  return self->_generatedSuggestion;
}

- (PLUSSchemaPLUSContactSuggestionGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSContactSuggestionGenerated;
  v5 = [(PLUSSchemaPLUSContactSuggestionGenerated *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"generatedSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSContactSuggestion alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggestionGenerated *)v5 setGeneratedSuggestion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isSuggestionUpdated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionGenerated setIsSuggestionUpdated:](v5, "setIsSuggestionUpdated:", [v8 BOOLValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestionGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestionGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self dictionaryRepresentation];
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
    id v4 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
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
  if (*(&self->_isSuggestionUpdated + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSContactSuggestionGenerated isSuggestionUpdated](self, "isSuggestionUpdated"));
    [v3 setObject:v7 forKeyedSubscript:@"isSuggestionUpdated"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSContactSuggestion *)self->_generatedSuggestion hash];
  if (*(&self->_isSuggestionUpdated + 1)) {
    uint64_t v4 = 2654435761 * self->_isSuggestionUpdated;
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
  v5 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
  v6 = [v4 generatedSuggestion];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
    objc_super v11 = [v4 generatedSuggestion];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_isSuggestionUpdated + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_isSuggestionUpdated + 1))
  {
    int isSuggestionUpdated = self->_isSuggestionUpdated;
    if (isSuggestionUpdated != [v4 isSuggestionUpdated]) {
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
  uint64_t v4 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSContactSuggestionGenerated *)self generatedSuggestion];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isSuggestionUpdated + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSuggestionUpdated
{
  *(&self->_isSuggestionUpdated + 1) &= ~1u;
}

- (void)setHasIsSuggestionUpdated:(BOOL)a3
{
  *(&self->_isSuggestionUpdated + 1) = *(&self->_isSuggestionUpdated + 1) & 0xFE | a3;
}

- (BOOL)hasIsSuggestionUpdated
{
  return *(&self->_isSuggestionUpdated + 1);
}

- (void)setIsSuggestionUpdated:(BOOL)a3
{
  *(&self->_isSuggestionUpdated + 1) |= 1u;
  self->_int isSuggestionUpdated = a3;
}

- (void)deleteGeneratedSuggestion
{
}

- (BOOL)hasGeneratedSuggestion
{
  return self->_generatedSuggestion != 0;
}

@end
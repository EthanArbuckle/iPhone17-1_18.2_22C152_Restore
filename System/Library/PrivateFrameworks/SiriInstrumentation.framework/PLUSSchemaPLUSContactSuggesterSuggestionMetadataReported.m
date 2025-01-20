@interface PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported
- (BOOL)hasIsDuplicateSuggestion;
- (BOOL)hasIsSuggestionPresentInModelOutput;
- (BOOL)hasSuggestionId;
- (BOOL)isDuplicateSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestionPresentInModelOutput;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithJSON:(id)a3;
- (SISchemaUUID)suggestionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsDuplicateSuggestion;
- (void)deleteIsSuggestionPresentInModelOutput;
- (void)deleteSuggestionId;
- (void)setHasIsDuplicateSuggestion:(BOOL)a3;
- (void)setHasIsSuggestionPresentInModelOutput:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setIsDuplicateSuggestion:(BOOL)a3;
- (void)setIsSuggestionPresentInModelOutput:(BOOL)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self deleteSuggestionId];
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

- (void)setHasSuggestionId:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 2) = a3;
}

- (BOOL)isSuggestionPresentInModelOutput
{
  return self->_isSuggestionPresentInModelOutput;
}

- (BOOL)isDuplicateSuggestion
{
  return self->_isDuplicateSuggestion;
}

- (void)setSuggestionId:(id)a3
{
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported;
  v5 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)v5 setSuggestionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isDuplicateSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsDuplicateSuggestion:](v5, "setIsDuplicateSuggestion:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isSuggestionPresentInModelOutput"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsSuggestionPresentInModelOutput:](v5, "setIsSuggestionPresentInModelOutput:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isSuggestionPresentInModelOutput + 1);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported isDuplicateSuggestion](self, "isDuplicateSuggestion"));
    [v3 setObject:v5 forKeyedSubscript:@"isDuplicateSuggestion"];

    char v4 = *(&self->_isSuggestionPresentInModelOutput + 1);
  }
  if ((v4 & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported isSuggestionPresentInModelOutput](self, "isSuggestionPresentInModelOutput"));
    [v3 setObject:v6 forKeyedSubscript:@"isSuggestionPresentInModelOutput"];
  }
  if (self->_suggestionId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"suggestionId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"suggestionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_suggestionId hash];
  if (*(&self->_isSuggestionPresentInModelOutput + 1))
  {
    uint64_t v4 = 2654435761 * self->_isDuplicateSuggestion;
    if ((*(&self->_isSuggestionPresentInModelOutput + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(&self->_isSuggestionPresentInModelOutput + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isSuggestionPresentInModelOutput;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
  v6 = [v4 suggestionId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
    v11 = [v4 suggestionId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1);
  unsigned int v14 = v4[18];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (v13)
  {
    int isDuplicateSuggestion = self->_isDuplicateSuggestion;
    if (isDuplicateSuggestion == [v4 isDuplicateSuggestion])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1);
      unsigned int v14 = v4[18];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int isSuggestionPresentInModelOutput = self->_isSuggestionPresentInModelOutput;
    if (isSuggestionPresentInModelOutput != [v4 isSuggestionPresentInModelOutput]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)self suggestionId];
    PBDataWriterWriteSubmessage();
  }
  char v6 = *(&self->_isSuggestionPresentInModelOutput + 1);
  if (v6)
  {
    PBDataWriterWriteBOOLField();
    char v6 = *(&self->_isSuggestionPresentInModelOutput + 1);
  }
  uint64_t v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggesterSuggestionMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSuggestionPresentInModelOutput
{
  *(&self->_isSuggestionPresentInModelOutput + 1) &= ~2u;
}

- (void)setHasIsSuggestionPresentInModelOutput:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSuggestionPresentInModelOutput + 1) = *(&self->_isSuggestionPresentInModelOutput + 1) & 0xFD | v3;
}

- (BOOL)hasIsSuggestionPresentInModelOutput
{
  return (*((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1) >> 1) & 1;
}

- (void)setIsSuggestionPresentInModelOutput:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) |= 2u;
  self->_int isSuggestionPresentInModelOutput = a3;
}

- (void)deleteIsDuplicateSuggestion
{
  *(&self->_isSuggestionPresentInModelOutput + 1) &= ~1u;
}

- (void)setHasIsDuplicateSuggestion:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) = *(&self->_isSuggestionPresentInModelOutput + 1) & 0xFE | a3;
}

- (BOOL)hasIsDuplicateSuggestion
{
  return *(&self->_isSuggestionPresentInModelOutput + 1);
}

- (void)setIsDuplicateSuggestion:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) |= 1u;
  self->_int isDuplicateSuggestion = a3;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end
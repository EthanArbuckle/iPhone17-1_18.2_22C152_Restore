@interface PLUSSchemaPLUSContactSuggestionAccuracySignalReported
- (BOOL)hasAccuracySignal;
- (BOOL)hasOriginalPlusId;
- (BOOL)hasSuggestionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionAccuracySignal)accuracySignal;
- (SISchemaUUID)originalPlusId;
- (SISchemaUUID)suggestionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAccuracySignal;
- (void)deleteOriginalPlusId;
- (void)deleteSuggestionId;
- (void)setAccuracySignal:(id)a3;
- (void)setHasAccuracySignal:(BOOL)a3;
- (void)setHasOriginalPlusId:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setOriginalPlusId:(id)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestionAccuracySignalReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSContactSuggestionAccuracySignalReported;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self deleteOriginalPlusId];
  }
  v9 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self deleteSuggestionId];
  }
  v12 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self deleteAccuracySignal];
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
  objc_storeStrong((id *)&self->_accuracySignal, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

- (void)setHasAccuracySignal:(BOOL)a3
{
  self->_hasAccuracySignal = a3;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  self->_hasOriginalPlusId = a3;
}

- (void)setAccuracySignal:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionAccuracySignal)accuracySignal
{
  return self->_accuracySignal;
}

- (void)setSuggestionId:(id)a3
{
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (void)setOriginalPlusId:(id)a3
{
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSContactSuggestionAccuracySignalReported;
  v5 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalPlusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)v5 setOriginalPlusId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)v5 setSuggestionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"accuracySignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PLUSSchemaPLUSSuggestionAccuracySignal alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)v5 setAccuracySignal:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self dictionaryRepresentation];
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
  if (self->_accuracySignal)
  {
    id v4 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accuracySignal"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accuracySignal"];
    }
  }
  if (self->_originalPlusId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originalPlusId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originalPlusId"];
    }
  }
  if (self->_suggestionId)
  {
    v10 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"suggestionId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"suggestionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalPlusId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_suggestionId hash] ^ v3;
  return v4 ^ [(PLUSSchemaPLUSSuggestionAccuracySignal *)self->_accuracySignal hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
  v6 = [v4 originalPlusId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
    v10 = [v4 originalPlusId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
  v6 = [v4 suggestionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
    v15 = [v4 suggestionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
  v6 = [v4 accuracySignal];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
    v20 = [v4 accuracySignal];
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
  id v4 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self originalPlusId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self suggestionId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];

  if (v8)
  {
    v9 = [(PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)self accuracySignal];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionAccuracySignalReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAccuracySignal
{
}

- (BOOL)hasAccuracySignal
{
  return self->_accuracySignal != 0;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteOriginalPlusId
{
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

@end
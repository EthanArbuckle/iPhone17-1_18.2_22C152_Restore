@interface PLUSSchemaPLUSSuggesterSuggestionRedundancyReported
- (BOOL)hasOriginalRequestId;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)hasSuggestionLinkId;
- (BOOL)hasSuggestionRedundancyState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (SISchemaUUID)originalRequestId;
- (SISchemaUUID)suggestionLinkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)suggestionRedundancyState;
- (unint64_t)hash;
- (void)deleteOriginalRequestId;
- (void)deleteSuggestionDomainMetadata;
- (void)deleteSuggestionLinkId;
- (void)deleteSuggestionRedundancyState;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setHasSuggestionLinkId:(BOOL)a3;
- (void)setHasSuggestionRedundancyState:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)setSuggestionLinkId:(id)a3;
- (void)setSuggestionRedundancyState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterSuggestionRedundancyReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionRedundancyReported;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self deleteSuggestionLinkId];
  }
  v12 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self deleteOriginalRequestId];
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
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionLinkId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSuggestionLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)suggestionRedundancyState
{
  return self->_suggestionRedundancyState;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setSuggestionLinkId:(id)a3
{
}

- (SISchemaUUID)suggestionLinkId
{
  return self->_suggestionLinkId;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionRedundancyReported;
  v5 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"suggestionLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)v5 setSuggestionLinkId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)v5 setOriginalRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"suggestionRedundancyState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionRedundancyState:](v5, "setSuggestionRedundancyState:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self dictionaryRepresentation];
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
  if (self->_originalRequestId)
  {
    id v4 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_suggestionDomainMetadata)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
  }
  if (self->_suggestionLinkId)
  {
    v10 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"suggestionLinkId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"suggestionLinkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v13 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionRedundancyState];
    int v14 = @"PLUSSUGGESTIONREDUNDANCYSTATE_UNKNOWN";
    if (v13 == 1) {
      int v14 = @"PLUSSUGGESTIONREDUNDANCYSTATE_NOT_REDUNDANT";
    }
    if (v13 == 2) {
      objc_super v15 = @"PLUSSUGGESTIONREDUNDANCYSTATE_REDUNDANT";
    }
    else {
      objc_super v15 = v14;
    }
    [v3 setObject:v15 forKeyedSubscript:@"suggestionRedundancyState"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionDomainMetadata *)self->_suggestionDomainMetadata hash];
  unint64_t v4 = [(SISchemaUUID *)self->_suggestionLinkId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_originalRequestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_suggestionRedundancyState;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
  uint64_t v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
  uint64_t v6 = [v4 suggestionLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
  if (v12)
  {
    int v13 = (void *)v12;
    int v14 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
    objc_super v15 = [v4 suggestionLinkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
  uint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
    v20 = [v4 originalRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int suggestionRedundancyState = self->_suggestionRedundancyState,
          suggestionRedundancyState == [v4 suggestionRedundancyState]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];

  if (v4)
  {
    unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self suggestionLinkId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];

  if (v8)
  {
    v9 = [(PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterSuggestionRedundancyReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSuggestionRedundancyState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSuggestionRedundancyState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuggestionRedundancyState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuggestionRedundancyState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int suggestionRedundancyState = a3;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteSuggestionLinkId
{
}

- (BOOL)hasSuggestionLinkId
{
  return self->_suggestionLinkId != 0;
}

- (void)deleteSuggestionDomainMetadata
{
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

@end
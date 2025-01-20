@interface PLUSSchemaPLUSSuggestionOutcomeReported
- (BOOL)hasDomainOutcome;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)hasSuggestionLinkId;
- (BOOL)hasSuggestionOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (PLUSSchemaPLUSSuggestionDomainOutcome)domainOutcome;
- (PLUSSchemaPLUSSuggestionOutcomeReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionOutcomeReported)initWithJSON:(id)a3;
- (SISchemaUUID)originalRequestId;
- (SISchemaUUID)suggestionLinkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)suggestionOutcome;
- (unint64_t)hash;
- (void)deleteDomainOutcome;
- (void)deleteOriginalRequestId;
- (void)deleteSuggestionDomainMetadata;
- (void)deleteSuggestionLinkId;
- (void)deleteSuggestionOutcome;
- (void)setDomainOutcome:(id)a3;
- (void)setHasDomainOutcome:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setHasSuggestionLinkId:(BOOL)a3;
- (void)setHasSuggestionOutcome:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)setSuggestionLinkId:(id)a3;
- (void)setSuggestionOutcome:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionOutcomeReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLUSSchemaPLUSSuggestionOutcomeReported;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggestionOutcomeReported *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggestionOutcomeReported *)self deleteSuggestionLinkId];
  }
  v12 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSSuggestionOutcomeReported *)self deleteOriginalRequestId];
  }
  v15 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PLUSSchemaPLUSSuggestionOutcomeReported *)self deleteDomainOutcome];
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
  objc_storeStrong((id *)&self->_domainOutcome, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionLinkId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasDomainOutcome:(BOOL)a3
{
  self->_hasSuggestionDomainMetadata = a3;
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

- (void)setDomainOutcome:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionDomainOutcome)domainOutcome
{
  return self->_domainOutcome;
}

- (int)suggestionOutcome
{
  return self->_suggestionOutcome;
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

- (PLUSSchemaPLUSSuggestionOutcomeReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLUSSchemaPLUSSuggestionOutcomeReported;
  v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestionOutcomeReported *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"suggestionLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggestionOutcomeReported *)v5 setSuggestionLinkId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSSuggestionOutcomeReported *)v5 setOriginalRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"suggestionOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggestionOutcomeReported setSuggestionOutcome:](v5, "setSuggestionOutcome:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"domainOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[PLUSSchemaPLUSSuggestionDomainOutcome alloc] initWithDictionary:v13];
      [(PLUSSchemaPLUSSuggestionOutcomeReported *)v5 setDomainOutcome:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionOutcomeReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self dictionaryRepresentation];
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
  if (self->_domainOutcome)
  {
    id v4 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"domainOutcome"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"domainOutcome"];
    }
  }
  if (self->_originalRequestId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_suggestionDomainMetadata)
  {
    v10 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
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
  if (self->_suggestionLinkId)
  {
    v13 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"suggestionLinkId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"suggestionLinkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v16 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionOutcome] - 1;
    if (v16 > 0xE) {
      objc_super v17 = @"PLUSSUGGESTIONOUTCOME_UNKNOWN";
    }
    else {
      objc_super v17 = off_1E5EBBBB0[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"suggestionOutcome"];
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
    uint64_t v6 = 2654435761 * self->_suggestionOutcome;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(PLUSSchemaPLUSSuggestionDomainOutcome *)self->_domainOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
  uint64_t v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
  uint64_t v6 = [v4 suggestionLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
    v15 = [v4 suggestionLinkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
  uint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v17 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
    v20 = [v4 originalRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int suggestionOutcome = self->_suggestionOutcome;
    if (suggestionOutcome != [v4 suggestionOutcome]) {
      goto LABEL_25;
    }
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
  uint64_t v6 = [v4 domainOutcome];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v23 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    v25 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
    v26 = [v4 domainOutcome];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];

  if (v4)
  {
    unint64_t v5 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self suggestionLinkId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];

  if (v8)
  {
    v9 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v10 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];

  int v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(PLUSSchemaPLUSSuggestionOutcomeReported *)self domainOutcome];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionOutcomeReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomainOutcome
{
}

- (BOOL)hasDomainOutcome
{
  return self->_domainOutcome != 0;
}

- (void)deleteSuggestionOutcome
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSuggestionOutcome:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuggestionOutcome
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuggestionOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int suggestionOutcome = a3;
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
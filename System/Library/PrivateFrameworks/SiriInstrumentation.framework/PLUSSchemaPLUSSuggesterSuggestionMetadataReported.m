@interface PLUSSchemaPLUSSuggesterSuggestionMetadataReported
- (BOOL)hasDomainSuggestionMetadata;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)hasSuggestionLinkId;
- (BOOL)hasSuggestionNoveltyState;
- (BOOL)hasSuggestionSurfaced;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)domainSuggestionMetadata;
- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (SISchemaUUID)originalRequestId;
- (SISchemaUUID)suggestionLinkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)suggestionNoveltyState;
- (int)suggestionSurfaced;
- (unint64_t)hash;
- (void)deleteDomainSuggestionMetadata;
- (void)deleteOriginalRequestId;
- (void)deleteSuggestionDomainMetadata;
- (void)deleteSuggestionLinkId;
- (void)deleteSuggestionNoveltyState;
- (void)deleteSuggestionSurfaced;
- (void)setDomainSuggestionMetadata:(id)a3;
- (void)setHasDomainSuggestionMetadata:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setHasSuggestionLinkId:(BOOL)a3;
- (void)setHasSuggestionNoveltyState:(BOOL)a3;
- (void)setHasSuggestionSurfaced:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)setSuggestionLinkId:(id)a3;
- (void)setSuggestionNoveltyState:(int)a3;
- (void)setSuggestionSurfaced:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterSuggestionMetadataReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionMetadataReported;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self deleteSuggestionLinkId];
  }
  v12 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self deleteOriginalRequestId];
  }
  v15 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self deleteDomainSuggestionMetadata];
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
  objc_storeStrong((id *)&self->_domainSuggestionMetadata, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionLinkId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasDomainSuggestionMetadata:(BOOL)a3
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

- (void)setDomainSuggestionMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)domainSuggestionMetadata
{
  return self->_domainSuggestionMetadata;
}

- (int)suggestionNoveltyState
{
  return self->_suggestionNoveltyState;
}

- (int)suggestionSurfaced
{
  return self->_suggestionSurfaced;
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

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionMetadataReported;
  v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"suggestionLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)v5 setSuggestionLinkId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)v5 setOriginalRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"suggestionSurfaced"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionSurfaced:](v5, "setSuggestionSurfaced:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"suggestionNoveltyState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionNoveltyState:](v5, "setSuggestionNoveltyState:", [v13 intValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"domainSuggestionMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata alloc] initWithDictionary:v14];
      [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)v5 setDomainSuggestionMetadata:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self dictionaryRepresentation];
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
  if (self->_domainSuggestionMetadata)
  {
    id v4 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"domainSuggestionMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"domainSuggestionMetadata"];
    }
  }
  if (self->_originalRequestId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
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
    v10 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
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
    v13 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v17 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionNoveltyState]
        - 1;
    if (v17 > 2) {
      objc_super v18 = @"PLUSSUGGESTIONNOVELTYSTATE_UNKNOWN";
    }
    else {
      objc_super v18 = off_1E5EBBB50[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"suggestionNoveltyState"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v19 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionSurfaced] - 1;
    if (v19 > 2) {
      v20 = @"PLUSSUGGESTIONSURFACEDSTATE_UNKNOWN";
    }
    else {
      v20 = off_1E5EBBB68[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"suggestionSurfaced"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionDomainMetadata *)self->_suggestionDomainMetadata hash];
  unint64_t v4 = [(SISchemaUUID *)self->_suggestionLinkId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_originalRequestId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_suggestionSurfaced;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self->_domainSuggestionMetadata hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_suggestionNoveltyState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self->_domainSuggestionMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
  uint64_t v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
  uint64_t v6 = [v4 suggestionLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
    v15 = [v4 suggestionLinkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
  uint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_28;
  }
  uint64_t v17 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    unsigned int v19 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
    v20 = [v4 originalRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  $FDA1A23D58EF779EFC94E85FC5072212 has = self->_has;
  unsigned int v23 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int suggestionSurfaced = self->_suggestionSurfaced;
    if (suggestionSurfaced != [v4 suggestionSurfaced]) {
      goto LABEL_29;
    }
    $FDA1A23D58EF779EFC94E85FC5072212 has = self->_has;
    unsigned int v23 = v4[48];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_29;
  }
  if (v25)
  {
    int suggestionNoveltyState = self->_suggestionNoveltyState;
    if (suggestionNoveltyState != [v4 suggestionNoveltyState]) {
      goto LABEL_29;
    }
  }
  unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
  uint64_t v6 = [v4 domainSuggestionMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v27 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
  if (!v27)
  {

LABEL_32:
    BOOL v32 = 1;
    goto LABEL_30;
  }
  v28 = (void *)v27;
  v29 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
  v30 = [v4 domainSuggestionMetadata];
  char v31 = [v29 isEqual:v30];

  if (v31) {
    goto LABEL_32;
  }
LABEL_29:
  BOOL v32 = 0;
LABEL_30:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];

  if (v4)
  {
    unint64_t v5 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self suggestionLinkId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];

  if (v8)
  {
    v9 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];

  uint64_t v12 = v14;
  if (v11)
  {
    v13 = [(PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)self domainSuggestionMetadata];
    PBDataWriterWriteSubmessage();

    uint64_t v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterSuggestionMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomainSuggestionMetadata
{
}

- (BOOL)hasDomainSuggestionMetadata
{
  return self->_domainSuggestionMetadata != 0;
}

- (void)deleteSuggestionNoveltyState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSuggestionNoveltyState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuggestionNoveltyState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSuggestionNoveltyState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int suggestionNoveltyState = a3;
}

- (void)deleteSuggestionSurfaced
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSuggestionSurfaced:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuggestionSurfaced
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuggestionSurfaced:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int suggestionSurfaced = a3;
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
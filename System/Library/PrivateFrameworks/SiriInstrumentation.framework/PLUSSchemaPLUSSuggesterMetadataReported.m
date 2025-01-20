@interface PLUSSchemaPLUSSuggesterMetadataReported
- (BOOL)hasDomainConfiguredState;
- (BOOL)hasIsSuggesterEnabled;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggesterEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSDomainConfiguredState)domainConfiguredState;
- (PLUSSchemaPLUSSuggesterMetadataReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterMetadataReported)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (SISchemaUUID)originalRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDomainConfiguredState;
- (void)deleteIsSuggesterEnabled;
- (void)deleteOriginalRequestId;
- (void)deleteSuggestionDomainMetadata;
- (void)setDomainConfiguredState:(id)a3;
- (void)setHasDomainConfiguredState:(BOOL)a3;
- (void)setHasIsSuggesterEnabled:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setIsSuggesterEnabled:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterMetadataReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSSuggesterMetadataReported;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggesterMetadataReported *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggesterMetadataReported *)self deleteOriginalRequestId];
  }
  v12 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSSuggesterMetadataReported *)self deleteDomainConfiguredState];
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
  objc_storeStrong((id *)&self->_domainConfiguredState, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasDomainConfiguredState:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDomainConfiguredState:(id)a3
{
}

- (PLUSSchemaPLUSDomainConfiguredState)domainConfiguredState
{
  return self->_domainConfiguredState;
}

- (BOOL)isSuggesterEnabled
{
  return self->_isSuggesterEnabled;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (PLUSSchemaPLUSSuggesterMetadataReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterMetadataReported;
  v5 = [(PLUSSchemaPLUSSuggesterMetadataReported *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggesterMetadataReported *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggesterMetadataReported *)v5 setOriginalRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isSuggesterEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterMetadataReported setIsSuggesterEnabled:](v5, "setIsSuggesterEnabled:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"domainConfiguredState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[PLUSSchemaPLUSDomainConfiguredState alloc] initWithDictionary:v11];
      [(PLUSSchemaPLUSSuggesterMetadataReported *)v5 setDomainConfiguredState:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterMetadataReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterMetadataReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self dictionaryRepresentation];
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
  if (self->_domainConfiguredState)
  {
    id v4 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"domainConfiguredState"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"domainConfiguredState"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSSuggesterMetadataReported isSuggesterEnabled](self, "isSuggesterEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isSuggesterEnabled"];
  }
  if (self->_originalRequestId)
  {
    int v8 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_suggestionDomainMetadata)
  {
    int v11 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionDomainMetadata *)self->_suggestionDomainMetadata hash];
  unint64_t v4 = [(SISchemaUUID *)self->_originalRequestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isSuggesterEnabled;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(PLUSSchemaPLUSDomainConfiguredState *)self->_domainConfiguredState hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
  v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
  v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
    objc_super v15 = [v4 originalRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isSuggesterEnabled = self->_isSuggesterEnabled;
    if (isSuggesterEnabled != [v4 isSuggesterEnabled]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
  v6 = [v4 domainConfiguredState];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
    v21 = [v4 domainConfiguredState];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  int v8 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];

  v9 = v11;
  if (v8)
  {
    v10 = [(PLUSSchemaPLUSSuggesterMetadataReported *)self domainConfiguredState];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomainConfiguredState
{
}

- (BOOL)hasDomainConfiguredState
{
  return self->_domainConfiguredState != 0;
}

- (void)deleteIsSuggesterEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSuggesterEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSuggesterEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSuggesterEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSuggesterEnabled = a3;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteSuggestionDomainMetadata
{
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

@end
@interface INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated
- (BOOL)hasAnonymizedSelectedEntityIdentifier;
- (BOOL)hasConfirmationResolution;
- (BOOL)hasDisambiguationResolution;
- (BOOL)hasOriginalResolutionContextId;
- (BOOL)hasQueryId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)anonymizedSelectedEntityIdentifier;
- (SISchemaUUID)originalResolutionContextId;
- (SISchemaUUID)queryId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)confirmationResolution;
- (int)disambiguationResolution;
- (unint64_t)hash;
- (unint64_t)whichResolutiontype;
- (void)deleteAnonymizedSelectedEntityIdentifier;
- (void)deleteConfirmationResolution;
- (void)deleteDisambiguationResolution;
- (void)deleteOriginalResolutionContextId;
- (void)deleteQueryId;
- (void)setAnonymizedSelectedEntityIdentifier:(id)a3;
- (void)setConfirmationResolution:(int)a3;
- (void)setDisambiguationResolution:(int)a3;
- (void)setHasAnonymizedSelectedEntityIdentifier:(BOOL)a3;
- (void)setHasConfirmationResolution:(BOOL)a3;
- (void)setHasDisambiguationResolution:(BOOL)a3;
- (void)setHasOriginalResolutionContextId:(BOOL)a3;
- (void)setHasQueryId:(BOOL)a3;
- (void)setOriginalResolutionContextId:(id)a3;
- (void)setQueryId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self deleteOriginalResolutionContextId];
  }
  v9 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self deleteQueryId];
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
  objc_storeStrong((id *)&self->_anonymizedSelectedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

- (void)setHasAnonymizedSelectedEntityIdentifier:(BOOL)a3
{
  self->_hasAnonymizedSelectedEntityIdentifier = a3;
}

- (void)setHasConfirmationResolution:(BOOL)a3
{
  self->_hasConfirmationResolution = a3;
}

- (BOOL)hasConfirmationResolution
{
  return self->_hasConfirmationResolution;
}

- (void)setHasDisambiguationResolution:(BOOL)a3
{
  self->_hasDisambiguationResolution = a3;
}

- (BOOL)hasDisambiguationResolution
{
  return self->_hasDisambiguationResolution;
}

- (void)setHasQueryId:(BOOL)a3
{
  self->_hasQueryId = a3;
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  self->_hasOriginalResolutionContextId = a3;
}

- (void)setAnonymizedSelectedEntityIdentifier:(id)a3
{
}

- (NSString)anonymizedSelectedEntityIdentifier
{
  return self->_anonymizedSelectedEntityIdentifier;
}

- (void)setQueryId:(id)a3
{
}

- (SISchemaUUID)queryId
{
  return self->_queryId;
}

- (void)setOriginalResolutionContextId:(id)a3
{
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (unint64_t)whichResolutiontype
{
  return self->_whichResolutiontype;
}

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated;
  v5 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalResolutionContextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)v5 setOriginalResolutionContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"queryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)v5 setQueryId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"disambiguationResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setDisambiguationResolution:](v5, "setDisambiguationResolution:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"confirmationResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated setConfirmationResolution:](v5, "setConfirmationResolution:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"anonymizedSelectedEntityIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)v5 setAnonymizedSelectedEntityIdentifier:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self dictionaryRepresentation];
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
  if (self->_anonymizedSelectedEntityIdentifier)
  {
    id v4 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self anonymizedSelectedEntityIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedSelectedEntityIdentifier"];
  }
  unint64_t whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 4)
  {
    unsigned int v7 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self confirmationResolution]- 1;
    if (v7 > 3) {
      int v8 = @"INFERENCECONFIRMATIONRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EB0EE0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"confirmationResolution"];
    unint64_t whichResolutiontype = self->_whichResolutiontype;
  }
  if (whichResolutiontype == 3)
  {
    unsigned int v9 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self disambiguationResolution]- 1;
    if (v9 > 2) {
      v10 = @"INFERENCEDISAMBIGUATIONRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v10 = off_1E5EB0F00[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"disambiguationResolution"];
  }
  if (self->_originalResolutionContextId)
  {
    int v11 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"originalResolutionContextId"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"originalResolutionContextId"];
    }
  }
  if (self->_queryId)
  {
    v14 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"queryId"];
    }
    else
    {
      objc_super v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"queryId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalResolutionContextId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_queryId hash];
  unint64_t whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 4)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 2654435761 * self->_confirmationResolution;
  }
  else if (whichResolutiontype == 3)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 2654435761 * self->_disambiguationResolution;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v7 ^ v6 ^ [(NSString *)self->_anonymizedSelectedEntityIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype != [v4 whichResolutiontype]) {
    goto LABEL_20;
  }
  uint64_t v6 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
  uint64_t v7 = [v4 originalResolutionContextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
    int v11 = [v4 originalResolutionContextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v6 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
  uint64_t v7 = [v4 queryId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
    objc_super v16 = [v4 queryId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int disambiguationResolution = self->_disambiguationResolution;
  if (disambiguationResolution != [v4 disambiguationResolution]) {
    goto LABEL_20;
  }
  int confirmationResolution = self->_confirmationResolution;
  if (confirmationResolution != [v4 confirmationResolution]) {
    goto LABEL_20;
  }
  uint64_t v6 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self anonymizedSelectedEntityIdentifier];
  uint64_t v7 = [v4 anonymizedSelectedEntityIdentifier];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v20 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self anonymizedSelectedEntityIdentifier];
    if (!v20)
    {

LABEL_23:
      BOOL v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    v22 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self anonymizedSelectedEntityIdentifier];
    v23 = [v4 anonymizedSelectedEntityIdentifier];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v25 = 0;
LABEL_21:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];

  if (v4)
  {
    v5 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self originalResolutionContextId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];

  if (v6)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self queryId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t whichResolutiontype = self->_whichResolutiontype;
  if (whichResolutiontype == 3)
  {
    PBDataWriterWriteInt32Field();
    unint64_t whichResolutiontype = self->_whichResolutiontype;
  }
  if (whichResolutiontype == 4) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v9 = [(INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)self anonymizedSelectedEntityIdentifier];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnonymizedSelectedEntityIdentifier
{
}

- (BOOL)hasAnonymizedSelectedEntityIdentifier
{
  return self->_anonymizedSelectedEntityIdentifier != 0;
}

- (void)deleteConfirmationResolution
{
  if (self->_whichResolutiontype == 4)
  {
    self->_unint64_t whichResolutiontype = 0;
    self->_int confirmationResolution = 0;
  }
}

- (int)confirmationResolution
{
  if (self->_whichResolutiontype == 4) {
    return self->_confirmationResolution;
  }
  else {
    return 0;
  }
}

- (void)setConfirmationResolution:(int)a3
{
  self->_int disambiguationResolution = 0;
  self->_unint64_t whichResolutiontype = 4;
  self->_int confirmationResolution = a3;
}

- (void)deleteDisambiguationResolution
{
  if (self->_whichResolutiontype == 3)
  {
    self->_unint64_t whichResolutiontype = 0;
    self->_int disambiguationResolution = 0;
  }
}

- (int)disambiguationResolution
{
  if (self->_whichResolutiontype == 3) {
    return self->_disambiguationResolution;
  }
  else {
    return 0;
  }
}

- (void)setDisambiguationResolution:(int)a3
{
  self->_int confirmationResolution = 0;
  self->_unint64_t whichResolutiontype = 3;
  self->_int disambiguationResolution = a3;
}

- (void)deleteQueryId
{
}

- (BOOL)hasQueryId
{
  return self->_queryId != 0;
}

- (void)deleteOriginalResolutionContextId
{
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

@end
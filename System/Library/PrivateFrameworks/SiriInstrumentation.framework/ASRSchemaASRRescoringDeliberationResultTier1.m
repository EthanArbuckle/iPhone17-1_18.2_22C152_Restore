@interface ASRSchemaASRRescoringDeliberationResultTier1
- (ASRSchemaASRRescoringDeliberationResultTier1)initWithDictionary:(id)a3;
- (ASRSchemaASRRescoringDeliberationResultTier1)initWithJSON:(id)a3;
- (BOOL)hasLinkId;
- (BOOL)hasModifiedTranscript;
- (BOOL)hasOriginalTranscript;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)modifiedTranscript;
- (NSString)originalTranscript;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLinkId;
- (void)deleteModifiedTranscript;
- (void)deleteOriginalTranscript;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasModifiedTranscript:(BOOL)a3;
- (void)setHasOriginalTranscript:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setModifiedTranscript:(id)a3;
- (void)setOriginalTranscript:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRescoringDeliberationResultTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRRescoringDeliberationResultTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteOriginalTranscript];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteModifiedTranscript];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteOriginalTranscript];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteModifiedTranscript];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteOriginalTranscript];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteModifiedTranscript];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteOriginalTranscript];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteModifiedTranscript];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteOriginalTranscript];
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteModifiedTranscript];
  }
  v6 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRRescoringDeliberationResultTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_modifiedTranscript, 0);
  objc_storeStrong((id *)&self->_originalTranscript, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasModifiedTranscript:(BOOL)a3
{
  self->_hasModifiedTranscript = a3;
}

- (void)setHasOriginalTranscript:(BOOL)a3
{
  self->_hasOriginalTranscript = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setModifiedTranscript:(id)a3
{
}

- (NSString)modifiedTranscript
{
  return self->_modifiedTranscript;
}

- (void)setOriginalTranscript:(id)a3
{
}

- (NSString)originalTranscript
{
  return self->_originalTranscript;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (ASRSchemaASRRescoringDeliberationResultTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRRescoringDeliberationResultTier1;
  v5 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRRescoringDeliberationResultTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"originalTranscript"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRRescoringDeliberationResultTier1 *)v5 setOriginalTranscript:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"modifiedTranscript"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ASRSchemaASRRescoringDeliberationResultTier1 *)v5 setModifiedTranscript:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ASRSchemaASRRescoringDeliberationResultTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self dictionaryRepresentation];
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
  if (self->_linkId)
  {
    id v4 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_modifiedTranscript)
  {
    uint64_t v7 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self modifiedTranscript];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modifiedTranscript"];
  }
  if (self->_originalTranscript)
  {
    v9 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self originalTranscript];
    objc_super v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"originalTranscript"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_originalTranscript hash] ^ v3;
  return v4 ^ [(NSString *)self->_modifiedTranscript hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
    objc_super v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self originalTranscript];
  v6 = [v4 originalTranscript];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self originalTranscript];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self originalTranscript];
    v15 = [v4 originalTranscript];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self modifiedTranscript];
  v6 = [v4 modifiedTranscript];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self modifiedTranscript];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self modifiedTranscript];
    v20 = [v4 modifiedTranscript];
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
  id v9 = a3;
  id v4 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];

  if (v4)
  {
    v5 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self originalTranscript];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ASRSchemaASRRescoringDeliberationResultTier1 *)self modifiedTranscript];

  int v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    int v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRescoringDeliberationResultTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteModifiedTranscript
{
}

- (BOOL)hasModifiedTranscript
{
  return self->_modifiedTranscript != 0;
}

- (void)deleteOriginalTranscript
{
}

- (BOOL)hasOriginalTranscript
{
  return self->_originalTranscript != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end
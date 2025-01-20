@interface PGSchemaPGModelInferenceEnded
- (BOOL)hasLinkId;
- (BOOL)hasModelIdentifier;
- (BOOL)hasTranscriptEventId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)modelIdentifier;
- (PGSchemaPGModelInferenceEnded)initWithDictionary:(id)a3;
- (PGSchemaPGModelInferenceEnded)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (SISchemaUUID)transcriptEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLinkId;
- (void)deleteModelIdentifier;
- (void)deleteTranscriptEventId;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasModelIdentifier:(BOOL)a3;
- (void)setHasTranscriptEventId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setTranscriptEventId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PGSchemaPGModelInferenceEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGSchemaPGModelInferenceEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PGSchemaPGModelInferenceEnded *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PGSchemaPGModelInferenceEnded *)self deleteLinkId];
  }
  v9 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PGSchemaPGModelInferenceEnded *)self deleteTranscriptEventId];
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
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_transcriptEventId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasModelIdentifier:(BOOL)a3
{
  self->_hasModelIdentifier = a3;
}

- (void)setHasTranscriptEventId:(BOOL)a3
{
  self->_hasTranscriptEventId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setTranscriptEventId:(id)a3
{
}

- (SISchemaUUID)transcriptEventId
{
  return self->_transcriptEventId;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PGSchemaPGModelInferenceEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGSchemaPGModelInferenceEnded;
  v5 = [(PGSchemaPGModelInferenceEnded *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PGSchemaPGModelInferenceEnded *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"transcriptEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PGSchemaPGModelInferenceEnded *)v5 setTranscriptEventId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"modelIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(PGSchemaPGModelInferenceEnded *)v5 setModelIdentifier:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PGSchemaPGModelInferenceEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PGSchemaPGModelInferenceEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PGSchemaPGModelInferenceEnded *)self dictionaryRepresentation];
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
    id v4 = [(PGSchemaPGModelInferenceEnded *)self linkId];
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
  if (self->_modelIdentifier)
  {
    uint64_t v7 = [(PGSchemaPGModelInferenceEnded *)self modelIdentifier];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelIdentifier"];
  }
  if (self->_transcriptEventId)
  {
    v9 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"transcriptEventId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"transcriptEventId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_transcriptEventId hash] ^ v3;
  return v4 ^ [(NSString *)self->_modelIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PGSchemaPGModelInferenceEnded *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PGSchemaPGModelInferenceEnded *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PGSchemaPGModelInferenceEnded *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
  v6 = [v4 transcriptEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    objc_super v14 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
    v15 = [v4 transcriptEventId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PGSchemaPGModelInferenceEnded *)self modelIdentifier];
  v6 = [v4 modelIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PGSchemaPGModelInferenceEnded *)self modelIdentifier];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PGSchemaPGModelInferenceEnded *)self modelIdentifier];
    v20 = [v4 modelIdentifier];
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
  id v4 = [(PGSchemaPGModelInferenceEnded *)self linkId];

  if (v4)
  {
    v5 = [(PGSchemaPGModelInferenceEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];

  if (v6)
  {
    uint64_t v7 = [(PGSchemaPGModelInferenceEnded *)self transcriptEventId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PGSchemaPGModelInferenceEnded *)self modelIdentifier];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGModelInferenceEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelIdentifier
{
}

- (BOOL)hasModelIdentifier
{
  return self->_modelIdentifier != 0;
}

- (void)deleteTranscriptEventId
{
}

- (BOOL)hasTranscriptEventId
{
  return self->_transcriptEventId != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end
@interface PEGASUSSchemaPEGASUSWebAnswerCitationTier1
- (BOOL)hasCitedText;
- (BOOL)hasEnrichedUrl;
- (BOOL)hasReadableAttribution;
- (BOOL)hasSourceDomain;
- (BOOL)hasThumbnail;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)citedText;
- (NSString)enrichedUrl;
- (NSString)readableAttribution;
- (NSString)sourceDomain;
- (NSString)url;
- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)thumbnail;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCitedText;
- (void)deleteEnrichedUrl;
- (void)deleteReadableAttribution;
- (void)deleteSourceDomain;
- (void)deleteThumbnail;
- (void)deleteUrl;
- (void)setCitedText:(id)a3;
- (void)setEnrichedUrl:(id)a3;
- (void)setHasCitedText:(BOOL)a3;
- (void)setHasEnrichedUrl:(BOOL)a3;
- (void)setHasReadableAttribution:(BOOL)a3;
- (void)setHasSourceDomain:(BOOL)a3;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setHasUrl:(BOOL)a3;
- (void)setReadableAttribution:(id)a3;
- (void)setSourceDomain:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSWebAnswerCitationTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteSourceDomain];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteReadableAttribution];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteCitedText];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteEnrichedUrl];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteSourceDomain];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteReadableAttribution];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteCitedText];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteEnrichedUrl];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteSourceDomain];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteReadableAttribution];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteCitedText];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteEnrichedUrl];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteSourceDomain];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteReadableAttribution];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteCitedText];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteEnrichedUrl];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteSourceDomain];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteReadableAttribution];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteCitedText];
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteEnrichedUrl];
  }
  v6 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self deleteThumbnail];
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
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_enrichedUrl, 0);
  objc_storeStrong((id *)&self->_citedText, 0);
  objc_storeStrong((id *)&self->_readableAttribution, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void)setHasEnrichedUrl:(BOOL)a3
{
  self->_hasEnrichedUrl = a3;
}

- (void)setHasCitedText:(BOOL)a3
{
  self->_hasCitedText = a3;
}

- (void)setHasReadableAttribution:(BOOL)a3
{
  self->_hasReadableAttribution = a3;
}

- (void)setHasSourceDomain:(BOOL)a3
{
  self->_hasSourceDomain = a3;
}

- (void)setHasUrl:(BOOL)a3
{
  self->_hasUrl = a3;
}

- (void)setThumbnail:(id)a3
{
}

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)thumbnail
{
  return self->_thumbnail;
}

- (void)setEnrichedUrl:(id)a3
{
}

- (NSString)enrichedUrl
{
  return self->_enrichedUrl;
}

- (void)setCitedText:(id)a3
{
}

- (NSString)citedText
{
  return self->_citedText;
}

- (void)setReadableAttribution:(id)a3
{
}

- (NSString)readableAttribution
{
  return self->_readableAttribution;
}

- (void)setSourceDomain:(id)a3
{
}

- (NSString)sourceDomain
{
  return self->_sourceDomain;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationTier1;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setUrl:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"sourceDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setSourceDomain:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"readableAttribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setReadableAttribution:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"citedText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setCitedText:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"enrichedUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setEnrichedUrl:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 alloc] initWithDictionary:v16];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)v5 setThumbnail:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self dictionaryRepresentation];
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
  if (self->_citedText)
  {
    id v4 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self citedText];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"citedText"];
  }
  if (self->_enrichedUrl)
  {
    v6 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self enrichedUrl];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"enrichedUrl"];
  }
  if (self->_readableAttribution)
  {
    int v8 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self readableAttribution];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"readableAttribution"];
  }
  if (self->_sourceDomain)
  {
    objc_super v10 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self sourceDomain];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"sourceDomain"];
  }
  if (self->_thumbnail)
  {
    v12 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_url)
  {
    v15 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self url];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"url"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_url hash];
  NSUInteger v4 = [(NSString *)self->_sourceDomain hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_readableAttribution hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_citedText hash];
  NSUInteger v7 = [(NSString *)self->_enrichedUrl hash];
  return v6 ^ v7 ^ [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self url];
  NSUInteger v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self url];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self url];
    objc_super v10 = [v4 url];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self sourceDomain];
  NSUInteger v6 = [v4 sourceDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self sourceDomain];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self sourceDomain];
    v15 = [v4 sourceDomain];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self readableAttribution];
  NSUInteger v6 = [v4 readableAttribution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self readableAttribution];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self readableAttribution];
    objc_super v20 = [v4 readableAttribution];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self citedText];
  NSUInteger v6 = [v4 citedText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self citedText];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self citedText];
    v25 = [v4 citedText];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self enrichedUrl];
  NSUInteger v6 = [v4 enrichedUrl];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self enrichedUrl];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self enrichedUrl];
    v30 = [v4 enrichedUrl];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
  NSUInteger v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
    v35 = [v4 thumbnail];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self url];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self sourceDomain];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self readableAttribution];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self citedText];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self enrichedUrl];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];

  if (v9)
  {
    objc_super v10 = [(PEGASUSSchemaPEGASUSWebAnswerCitationTier1 *)self thumbnail];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerCitationTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteThumbnail
{
}

- (BOOL)hasThumbnail
{
  return self->_thumbnail != 0;
}

- (void)deleteEnrichedUrl
{
}

- (BOOL)hasEnrichedUrl
{
  return self->_enrichedUrl != 0;
}

- (void)deleteCitedText
{
}

- (BOOL)hasCitedText
{
  return self->_citedText != 0;
}

- (void)deleteReadableAttribution
{
}

- (BOOL)hasReadableAttribution
{
  return self->_readableAttribution != 0;
}

- (void)deleteSourceDomain
{
}

- (BOOL)hasSourceDomain
{
  return self->_sourceDomain != 0;
}

- (void)deleteUrl
{
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

@end
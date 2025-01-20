@interface STSchemaSTSpotlightResult
- (BOOL)hasBundleId;
- (BOOL)hasDocumentAttributes;
- (BOOL)hasEmbeddingSimilarity;
- (BOOL)hasFreshness;
- (BOOL)hasKeywordMatchScore;
- (BOOL)hasLikelihood;
- (BOOL)hasPommesAdjustedL1Score;
- (BOOL)hasPommesCalibratedL1Score;
- (BOOL)hasPommesL1Score;
- (BOOL)hasQuTokenParseInfo;
- (BOOL)hasQueryAttributes;
- (BOOL)hasRetrievalType;
- (BOOL)hasTopicality;
- (BOOL)hasTopicalityAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (STSchemaDocumentAttributes)documentAttributes;
- (STSchemaQUTokenParseInfo)quTokenParseInfo;
- (STSchemaQueryAttributes)queryAttributes;
- (STSchemaSTSpotlightResult)initWithDictionary:(id)a3;
- (STSchemaSTSpotlightResult)initWithJSON:(id)a3;
- (STSchemaTopicalityAttributes)topicalityAttributes;
- (float)embeddingSimilarity;
- (float)freshness;
- (float)keywordMatchScore;
- (float)likelihood;
- (float)pommesAdjustedL1Score;
- (float)pommesCalibratedL1Score;
- (float)pommesL1Score;
- (float)topicality;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)retrievalType;
- (unint64_t)hash;
- (void)deleteBundleId;
- (void)deleteDocumentAttributes;
- (void)deleteEmbeddingSimilarity;
- (void)deleteFreshness;
- (void)deleteKeywordMatchScore;
- (void)deleteLikelihood;
- (void)deletePommesAdjustedL1Score;
- (void)deletePommesCalibratedL1Score;
- (void)deletePommesL1Score;
- (void)deleteQuTokenParseInfo;
- (void)deleteQueryAttributes;
- (void)deleteRetrievalType;
- (void)deleteTopicality;
- (void)deleteTopicalityAttributes;
- (void)setBundleId:(id)a3;
- (void)setDocumentAttributes:(id)a3;
- (void)setEmbeddingSimilarity:(float)a3;
- (void)setFreshness:(float)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasDocumentAttributes:(BOOL)a3;
- (void)setHasEmbeddingSimilarity:(BOOL)a3;
- (void)setHasFreshness:(BOOL)a3;
- (void)setHasKeywordMatchScore:(BOOL)a3;
- (void)setHasLikelihood:(BOOL)a3;
- (void)setHasPommesAdjustedL1Score:(BOOL)a3;
- (void)setHasPommesCalibratedL1Score:(BOOL)a3;
- (void)setHasPommesL1Score:(BOOL)a3;
- (void)setHasQuTokenParseInfo:(BOOL)a3;
- (void)setHasQueryAttributes:(BOOL)a3;
- (void)setHasRetrievalType:(BOOL)a3;
- (void)setHasTopicality:(BOOL)a3;
- (void)setHasTopicalityAttributes:(BOOL)a3;
- (void)setKeywordMatchScore:(float)a3;
- (void)setLikelihood:(float)a3;
- (void)setPommesAdjustedL1Score:(float)a3;
- (void)setPommesCalibratedL1Score:(float)a3;
- (void)setPommesL1Score:(float)a3;
- (void)setQuTokenParseInfo:(id)a3;
- (void)setQueryAttributes:(id)a3;
- (void)setRetrievalType:(int)a3;
- (void)setTopicality:(float)a3;
- (void)setTopicalityAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTSpotlightResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STSchemaSTSpotlightResult;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(STSchemaSTSpotlightResult *)self deleteBundleId];
  }
  v6 = [(STSchemaSTSpotlightResult *)self queryAttributes];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTSpotlightResult *)self deleteQueryAttributes];
  }
  v9 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(STSchemaSTSpotlightResult *)self deleteQuTokenParseInfo];
  }
  v12 = [(STSchemaSTSpotlightResult *)self documentAttributes];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(STSchemaSTSpotlightResult *)self deleteDocumentAttributes];
  }
  v15 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(STSchemaSTSpotlightResult *)self deleteTopicalityAttributes];
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
  objc_storeStrong((id *)&self->_topicalityAttributes, 0);
  objc_storeStrong((id *)&self->_documentAttributes, 0);
  objc_storeStrong((id *)&self->_quTokenParseInfo, 0);
  objc_storeStrong((id *)&self->_queryAttributes, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasTopicalityAttributes:(BOOL)a3
{
  self->_hasQuTokenParseInfo = a3;
}

- (void)setHasDocumentAttributes:(BOOL)a3
{
  self->_hasQueryAttributes = a3;
}

- (void)setHasQuTokenParseInfo:(BOOL)a3
{
  self->_hasBundleId = a3;
}

- (void)setHasQueryAttributes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setTopicalityAttributes:(id)a3
{
}

- (STSchemaTopicalityAttributes)topicalityAttributes
{
  return self->_topicalityAttributes;
}

- (void)setDocumentAttributes:(id)a3
{
}

- (STSchemaDocumentAttributes)documentAttributes
{
  return self->_documentAttributes;
}

- (void)setQuTokenParseInfo:(id)a3
{
}

- (STSchemaQUTokenParseInfo)quTokenParseInfo
{
  return self->_quTokenParseInfo;
}

- (void)setQueryAttributes:(id)a3
{
}

- (STSchemaQueryAttributes)queryAttributes
{
  return self->_queryAttributes;
}

- (float)freshness
{
  return self->_freshness;
}

- (float)keywordMatchScore
{
  return self->_keywordMatchScore;
}

- (float)embeddingSimilarity
{
  return self->_embeddingSimilarity;
}

- (float)pommesCalibratedL1Score
{
  return self->_pommesCalibratedL1Score;
}

- (float)pommesAdjustedL1Score
{
  return self->_pommesAdjustedL1Score;
}

- (float)pommesL1Score
{
  return self->_pommesL1Score;
}

- (float)topicality
{
  return self->_topicality;
}

- (float)likelihood
{
  return self->_likelihood;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int)retrievalType
{
  return self->_retrievalType;
}

- (STSchemaSTSpotlightResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STSchemaSTSpotlightResult;
  v5 = [(STSchemaSTSpotlightResult *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"retrievalType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTSpotlightResult setRetrievalType:](v5, "setRetrievalType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = (void *)[v7 copy];
      [(STSchemaSTSpotlightResult *)v5 setBundleId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"likelihood"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[STSchemaSTSpotlightResult setLikelihood:](v5, "setLikelihood:");
    }
    v10 = [v4 objectForKeyedSubscript:@"topicality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[STSchemaSTSpotlightResult setTopicality:](v5, "setTopicality:");
    }
    int v11 = [v4 objectForKeyedSubscript:@"pommesL1Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[STSchemaSTSpotlightResult setPommesL1Score:](v5, "setPommesL1Score:");
    }
    v12 = [v4 objectForKeyedSubscript:@"pommesAdjustedL1Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[STSchemaSTSpotlightResult setPommesAdjustedL1Score:](v5, "setPommesAdjustedL1Score:");
    }
    v13 = [v4 objectForKeyedSubscript:@"pommesCalibratedL1Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[STSchemaSTSpotlightResult setPommesCalibratedL1Score:](v5, "setPommesCalibratedL1Score:");
    }
    v27 = v13;
    v31 = v9;
    int v14 = [v4 objectForKeyedSubscript:@"embeddingSimilarity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[STSchemaSTSpotlightResult setEmbeddingSimilarity:](v5, "setEmbeddingSimilarity:");
    }
    v33 = v6;
    v15 = [v4 objectForKeyedSubscript:@"keywordMatchScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[STSchemaSTSpotlightResult setKeywordMatchScore:](v5, "setKeywordMatchScore:");
    }
    v28 = v12;
    v32 = v7;
    v16 = [v4 objectForKeyedSubscript:@"freshness"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[STSchemaSTSpotlightResult setFreshness:](v5, "setFreshness:");
    }
    v30 = v10;
    int v17 = [v4 objectForKeyedSubscript:@"queryAttributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[STSchemaQueryAttributes alloc] initWithDictionary:v17];
      [(STSchemaSTSpotlightResult *)v5 setQueryAttributes:v18];
    }
    v29 = v11;
    objc_super v19 = [v4 objectForKeyedSubscript:@"quTokenParseInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[STSchemaQUTokenParseInfo alloc] initWithDictionary:v19];
      [(STSchemaSTSpotlightResult *)v5 setQuTokenParseInfo:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"documentAttributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[STSchemaDocumentAttributes alloc] initWithDictionary:v21];
      [(STSchemaSTSpotlightResult *)v5 setDocumentAttributes:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"topicalityAttributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[STSchemaTopicalityAttributes alloc] initWithDictionary:v23];
      [(STSchemaSTSpotlightResult *)v5 setTopicalityAttributes:v24];
    }
    v25 = v5;
  }
  return v5;
}

- (STSchemaSTSpotlightResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTSpotlightResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTSpotlightResult *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(STSchemaSTSpotlightResult *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_documentAttributes)
  {
    v6 = [(STSchemaSTSpotlightResult *)self documentAttributes];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"documentAttributes"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"documentAttributes"];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    int v14 = NSNumber;
    [(STSchemaSTSpotlightResult *)self embeddingSimilarity];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"embeddingSimilarity"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_10:
      if ((has & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_10;
  }
  v16 = NSNumber;
  [(STSchemaSTSpotlightResult *)self freshness];
  int v17 = objc_msgSend(v16, "numberWithFloat:");
  [v3 setObject:v17 forKeyedSubscript:@"freshness"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v18 = NSNumber;
  [(STSchemaSTSpotlightResult *)self keywordMatchScore];
  objc_super v19 = objc_msgSend(v18, "numberWithFloat:");
  [v3 setObject:v19 forKeyedSubscript:@"keywordMatchScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  v20 = NSNumber;
  [(STSchemaSTSpotlightResult *)self likelihood];
  v21 = objc_msgSend(v20, "numberWithFloat:");
  [v3 setObject:v21 forKeyedSubscript:@"likelihood"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  v22 = NSNumber;
  [(STSchemaSTSpotlightResult *)self pommesAdjustedL1Score];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"pommesAdjustedL1Score"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_24:
  v24 = NSNumber;
  [(STSchemaSTSpotlightResult *)self pommesCalibratedL1Score];
  v25 = objc_msgSend(v24, "numberWithFloat:");
  [v3 setObject:v25 forKeyedSubscript:@"pommesCalibratedL1Score"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_15:
    v10 = NSNumber;
    [(STSchemaSTSpotlightResult *)self pommesL1Score];
    int v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"pommesL1Score"];
  }
LABEL_16:
  if (self->_quTokenParseInfo)
  {
    v12 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"quTokenParseInfo"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"quTokenParseInfo"];
    }
  }
  if (self->_queryAttributes)
  {
    v27 = [(STSchemaSTSpotlightResult *)self queryAttributes];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"queryAttributes"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"queryAttributes"];
    }
  }
  __int16 v30 = (__int16)self->_has;
  if (v30)
  {
    int v31 = [(STSchemaSTSpotlightResult *)self retrievalType];
    v32 = @"STSPOTLIGHTSEARCHRETRIEVALTYPE_UNKNOWN";
    if (v31 == 1) {
      v32 = @"STSPOTLIGHTSEARCHRETRIEVALTYPE_META";
    }
    if (v31 == 2) {
      v33 = @"STSPOTLIGHTSEARCHRETRIEVALTYPE_SEMANTIC";
    }
    else {
      v33 = v32;
    }
    [v3 setObject:v33 forKeyedSubscript:@"retrievalType"];
    __int16 v30 = (__int16)self->_has;
  }
  if ((v30 & 4) != 0)
  {
    objc_super v34 = NSNumber;
    [(STSchemaSTSpotlightResult *)self topicality];
    v35 = objc_msgSend(v34, "numberWithFloat:");
    [v3 setObject:v35 forKeyedSubscript:@"topicality"];
  }
  if (self->_topicalityAttributes)
  {
    v36 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"topicalityAttributes"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"topicalityAttributes"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    uint64_t v50 = 2654435761 * self->_retrievalType;
  }
  else {
    uint64_t v50 = 0;
  }
  NSUInteger v49 = [(NSString *)self->_bundleId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    float likelihood = self->_likelihood;
    double v6 = likelihood;
    if (likelihood < 0.0) {
      double v6 = -likelihood;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0)
  {
    float topicality = self->_topicality;
    double v11 = topicality;
    if (topicality < 0.0) {
      double v11 = -topicality;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 8) != 0)
  {
    float pommesL1Score = self->_pommesL1Score;
    double v16 = pommesL1Score;
    if (pommesL1Score < 0.0) {
      double v16 = -pommesL1Score;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float pommesAdjustedL1Score = self->_pommesAdjustedL1Score;
    double v21 = pommesAdjustedL1Score;
    if (pommesAdjustedL1Score < 0.0) {
      double v21 = -pommesAdjustedL1Score;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float pommesCalibratedL1Score = self->_pommesCalibratedL1Score;
    double v26 = pommesCalibratedL1Score;
    if (pommesCalibratedL1Score < 0.0) {
      double v26 = -pommesCalibratedL1Score;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x40) != 0)
  {
    float embeddingSimilarity = self->_embeddingSimilarity;
    double v31 = embeddingSimilarity;
    if (embeddingSimilarity < 0.0) {
      double v31 = -embeddingSimilarity;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x80) != 0)
  {
    float keywordMatchScore = self->_keywordMatchScore;
    double v36 = keywordMatchScore;
    if (keywordMatchScore < 0.0) {
      double v36 = -keywordMatchScore;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 0x100) != 0)
  {
    float freshness = self->_freshness;
    double v41 = freshness;
    if (freshness < 0.0) {
      double v41 = -freshness;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  NSUInteger v44 = v49 ^ v50;
  unint64_t v45 = v44 ^ v4 ^ v9 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ [(STSchemaQueryAttributes *)self->_queryAttributes hash];
  unint64_t v46 = [(STSchemaQUTokenParseInfo *)self->_quTokenParseInfo hash];
  unint64_t v47 = v46 ^ [(STSchemaDocumentAttributes *)self->_documentAttributes hash];
  return v45 ^ v47 ^ [(STSchemaTopicalityAttributes *)self->_topicalityAttributes hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  if ((*(_WORD *)&self->_has & 1) != (v4[44] & 1)) {
    goto LABEL_61;
  }
  if (*(_WORD *)&self->_has)
  {
    int retrievalType = self->_retrievalType;
    if (retrievalType != [v4 retrievalType]) {
      goto LABEL_61;
    }
  }
  double v6 = [(STSchemaSTSpotlightResult *)self bundleId];
  long double v7 = [v4 bundleId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_60;
  }
  uint64_t v8 = [(STSchemaSTSpotlightResult *)self bundleId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    v10 = [(STSchemaSTSpotlightResult *)self bundleId];
    double v11 = [v4 bundleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
  int v14 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v15 = (unsigned __int16)v4[44];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_61;
  }
  if (v14)
  {
    float likelihood = self->_likelihood;
    [v4 likelihood];
    if (likelihood != v17) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v15 >> 2) & 1)) {
    goto LABEL_61;
  }
  if (v18)
  {
    float topicality = self->_topicality;
    [v4 topicality];
    if (topicality != v20) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v15 >> 3) & 1)) {
    goto LABEL_61;
  }
  if (v21)
  {
    float pommesL1Score = self->_pommesL1Score;
    [v4 pommesL1Score];
    if (pommesL1Score != v23) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v24 = (*(unsigned int *)&has >> 4) & 1;
  if (v24 != ((v15 >> 4) & 1)) {
    goto LABEL_61;
  }
  if (v24)
  {
    float pommesAdjustedL1Score = self->_pommesAdjustedL1Score;
    [v4 pommesAdjustedL1Score];
    if (pommesAdjustedL1Score != v26) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v27 = (*(unsigned int *)&has >> 5) & 1;
  if (v27 != ((v15 >> 5) & 1)) {
    goto LABEL_61;
  }
  if (v27)
  {
    float pommesCalibratedL1Score = self->_pommesCalibratedL1Score;
    [v4 pommesCalibratedL1Score];
    if (pommesCalibratedL1Score != v29) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v30 = (*(unsigned int *)&has >> 6) & 1;
  if (v30 != ((v15 >> 6) & 1)) {
    goto LABEL_61;
  }
  if (v30)
  {
    float embeddingSimilarity = self->_embeddingSimilarity;
    [v4 embeddingSimilarity];
    if (embeddingSimilarity != v32) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v33 = (*(unsigned int *)&has >> 7) & 1;
  if (v33 != ((v15 >> 7) & 1)) {
    goto LABEL_61;
  }
  if (v33)
  {
    float keywordMatchScore = self->_keywordMatchScore;
    [v4 keywordMatchScore];
    if (keywordMatchScore != v35) {
      goto LABEL_61;
    }
    $4D6836ECE036A3C5AF1413793DE43FD9 has = self->_has;
    unsigned int v15 = (unsigned __int16)v4[44];
  }
  int v36 = (*(unsigned int *)&has >> 8) & 1;
  if (v36 != ((v15 >> 8) & 1)) {
    goto LABEL_61;
  }
  if (v36)
  {
    float freshness = self->_freshness;
    [v4 freshness];
    if (freshness != v38) {
      goto LABEL_61;
    }
  }
  double v6 = [(STSchemaSTSpotlightResult *)self queryAttributes];
  long double v7 = [v4 queryAttributes];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_60;
  }
  uint64_t v39 = [(STSchemaSTSpotlightResult *)self queryAttributes];
  if (v39)
  {
    v40 = (void *)v39;
    double v41 = [(STSchemaSTSpotlightResult *)self queryAttributes];
    long double v42 = [v4 queryAttributes];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  double v6 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
  long double v7 = [v4 quTokenParseInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_60;
  }
  uint64_t v44 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
  if (v44)
  {
    unint64_t v45 = (void *)v44;
    unint64_t v46 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
    unint64_t v47 = [v4 quTokenParseInfo];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  double v6 = [(STSchemaSTSpotlightResult *)self documentAttributes];
  long double v7 = [v4 documentAttributes];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_60;
  }
  uint64_t v49 = [(STSchemaSTSpotlightResult *)self documentAttributes];
  if (v49)
  {
    uint64_t v50 = (void *)v49;
    v51 = [(STSchemaSTSpotlightResult *)self documentAttributes];
    v52 = [v4 documentAttributes];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  double v6 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
  long double v7 = [v4 topicalityAttributes];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_60:

    goto LABEL_61;
  }
  uint64_t v54 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
  if (!v54)
  {

LABEL_64:
    BOOL v59 = 1;
    goto LABEL_62;
  }
  v55 = (void *)v54;
  v56 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
  v57 = [v4 topicalityAttributes];
  char v58 = [v56 isEqual:v57];

  if (v58) {
    goto LABEL_64;
  }
LABEL_61:
  BOOL v59 = 0;
LABEL_62:

  return v59;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(STSchemaSTSpotlightResult *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_13:
  }
    PBDataWriterWriteFloatField();
LABEL_14:
  double v6 = [(STSchemaSTSpotlightResult *)self queryAttributes];

  if (v6)
  {
    long double v7 = [(STSchemaSTSpotlightResult *)self queryAttributes];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];

  if (v8)
  {
    unint64_t v9 = [(STSchemaSTSpotlightResult *)self quTokenParseInfo];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(STSchemaSTSpotlightResult *)self documentAttributes];

  if (v10)
  {
    double v11 = [(STSchemaSTSpotlightResult *)self documentAttributes];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];

  double v13 = v15;
  if (v12)
  {
    int v14 = [(STSchemaSTSpotlightResult *)self topicalityAttributes];
    PBDataWriterWriteSubmessage();

    double v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTSpotlightResultReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTopicalityAttributes
{
}

- (BOOL)hasTopicalityAttributes
{
  return self->_topicalityAttributes != 0;
}

- (void)deleteDocumentAttributes
{
}

- (BOOL)hasDocumentAttributes
{
  return self->_documentAttributes != 0;
}

- (void)deleteQuTokenParseInfo
{
}

- (BOOL)hasQuTokenParseInfo
{
  return self->_quTokenParseInfo != 0;
}

- (void)deleteQueryAttributes
{
}

- (BOOL)hasQueryAttributes
{
  return self->_queryAttributes != 0;
}

- (void)deleteFreshness
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasFreshness:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFreshness
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFreshness:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float freshness = a3;
}

- (void)deleteKeywordMatchScore
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasKeywordMatchScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasKeywordMatchScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setKeywordMatchScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float keywordMatchScore = a3;
}

- (void)deleteEmbeddingSimilarity
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasEmbeddingSimilarity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEmbeddingSimilarity
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setEmbeddingSimilarity:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_float embeddingSimilarity = a3;
}

- (void)deletePommesCalibratedL1Score
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasPommesCalibratedL1Score:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPommesCalibratedL1Score
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPommesCalibratedL1Score:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float pommesCalibratedL1Score = a3;
}

- (void)deletePommesAdjustedL1Score
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasPommesAdjustedL1Score:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPommesAdjustedL1Score
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPommesAdjustedL1Score:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_float pommesAdjustedL1Score = a3;
}

- (void)deletePommesL1Score
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasPommesL1Score:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPommesL1Score
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPommesL1Score:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float pommesL1Score = a3;
}

- (void)deleteTopicality
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasTopicality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTopicality
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTopicality:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float topicality = a3;
}

- (void)deleteLikelihood
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasLikelihood:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLikelihood
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLikelihood:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float likelihood = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteRetrievalType
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasRetrievalType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRetrievalType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRetrievalType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int retrievalType = a3;
}

@end
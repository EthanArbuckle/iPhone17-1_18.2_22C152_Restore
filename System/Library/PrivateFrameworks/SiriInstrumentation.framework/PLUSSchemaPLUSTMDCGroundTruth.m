@interface PLUSSchemaPLUSTMDCGroundTruth
- (BOOL)hasAsrPostItnLinkId;
- (BOOL)hasAsrRawRecognitionLinkId;
- (BOOL)hasCorrectedPronunciation;
- (BOOL)hasGroundTruthId;
- (BOOL)hasIsCorrectionEligible;
- (BOOL)hasIsTTSMispronounced;
- (BOOL)hasIsTmdcPluginEnabled;
- (BOOL)hasPhonemesToPhonemesDistance;
- (BOOL)hasSelfLogSource;
- (BOOL)hasSiriCurrentPronunciation;
- (BOOL)hasTtsCurrentPhonemes;
- (BOOL)hasTtsSuggestedPhonemes;
- (BOOL)isCorrectionEligible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTTSMispronounced;
- (BOOL)isTmdcPluginEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)ttsCurrentPhonemes;
- (NSString)ttsSuggestedPhonemes;
- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)correctedPronunciation;
- (PLUSSchemaPLUSTMDCGroundTruth)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSTMDCGroundTruth)initWithJSON:(id)a3;
- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)siriCurrentPronunciation;
- (SISchemaUUID)asrPostItnLinkId;
- (SISchemaUUID)asrRawRecognitionLinkId;
- (SISchemaUUID)groundTruthId;
- (double)phonemesToPhonemesDistance;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)selfLogSource;
- (unint64_t)hash;
- (void)deleteAsrPostItnLinkId;
- (void)deleteAsrRawRecognitionLinkId;
- (void)deleteCorrectedPronunciation;
- (void)deleteGroundTruthId;
- (void)deleteIsCorrectionEligible;
- (void)deleteIsTTSMispronounced;
- (void)deleteIsTmdcPluginEnabled;
- (void)deletePhonemesToPhonemesDistance;
- (void)deleteSelfLogSource;
- (void)deleteSiriCurrentPronunciation;
- (void)deleteTtsCurrentPhonemes;
- (void)deleteTtsSuggestedPhonemes;
- (void)setAsrPostItnLinkId:(id)a3;
- (void)setAsrRawRecognitionLinkId:(id)a3;
- (void)setCorrectedPronunciation:(id)a3;
- (void)setGroundTruthId:(id)a3;
- (void)setHasAsrPostItnLinkId:(BOOL)a3;
- (void)setHasAsrRawRecognitionLinkId:(BOOL)a3;
- (void)setHasCorrectedPronunciation:(BOOL)a3;
- (void)setHasGroundTruthId:(BOOL)a3;
- (void)setHasIsCorrectionEligible:(BOOL)a3;
- (void)setHasIsTTSMispronounced:(BOOL)a3;
- (void)setHasIsTmdcPluginEnabled:(BOOL)a3;
- (void)setHasPhonemesToPhonemesDistance:(BOOL)a3;
- (void)setHasSelfLogSource:(BOOL)a3;
- (void)setHasSiriCurrentPronunciation:(BOOL)a3;
- (void)setHasTtsCurrentPhonemes:(BOOL)a3;
- (void)setHasTtsSuggestedPhonemes:(BOOL)a3;
- (void)setIsCorrectionEligible:(BOOL)a3;
- (void)setIsTTSMispronounced:(BOOL)a3;
- (void)setIsTmdcPluginEnabled:(BOOL)a3;
- (void)setPhonemesToPhonemesDistance:(double)a3;
- (void)setSelfLogSource:(int)a3;
- (void)setSiriCurrentPronunciation:(id)a3;
- (void)setTtsCurrentPhonemes:(id)a3;
- (void)setTtsSuggestedPhonemes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSTMDCGroundTruth

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruth;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsCurrentPhonemes];
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsSuggestedPhonemes];
  }
  if ([v4 isConditionSet:4])
  {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsCurrentPhonemes];
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsSuggestedPhonemes];
  }
  if ([v4 isConditionSet:5])
  {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsCurrentPhonemes];
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsSuggestedPhonemes];
  }
  if ([v4 isConditionSet:6])
  {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsCurrentPhonemes];
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsSuggestedPhonemes];
  }
  if ([v4 isConditionSet:7])
  {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsCurrentPhonemes];
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteTtsSuggestedPhonemes];
  }
  v6 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteGroundTruthId];
  }
  v9 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteAsrRawRecognitionLinkId];
  }
  v12 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteAsrPostItnLinkId];
  }
  v15 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteSiriCurrentPronunciation];
  }
  v18 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PLUSSchemaPLUSTMDCGroundTruth *)self deleteCorrectedPronunciation];
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
  objc_storeStrong((id *)&self->_correctedPronunciation, 0);
  objc_storeStrong((id *)&self->_siriCurrentPronunciation, 0);
  objc_storeStrong((id *)&self->_ttsSuggestedPhonemes, 0);
  objc_storeStrong((id *)&self->_ttsCurrentPhonemes, 0);
  objc_storeStrong((id *)&self->_asrPostItnLinkId, 0);
  objc_storeStrong((id *)&self->_asrRawRecognitionLinkId, 0);
  objc_storeStrong((id *)&self->_groundTruthId, 0);
}

- (void)setHasCorrectedPronunciation:(BOOL)a3
{
  self->_hasAsrRawRecognitionLinkId = a3;
}

- (void)setHasSiriCurrentPronunciation:(BOOL)a3
{
  self->_hasGroundTruthId = a3;
}

- (void)setHasTtsSuggestedPhonemes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasTtsCurrentPhonemes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAsrPostItnLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasAsrRawRecognitionLinkId:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasGroundTruthId:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 2) = a3;
}

- (BOOL)isCorrectionEligible
{
  return self->_isCorrectionEligible;
}

- (BOOL)isTmdcPluginEnabled
{
  return self->_isTmdcPluginEnabled;
}

- (int)selfLogSource
{
  return self->_selfLogSource;
}

- (void)setCorrectedPronunciation:(id)a3
{
}

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)correctedPronunciation
{
  return self->_correctedPronunciation;
}

- (void)setSiriCurrentPronunciation:(id)a3
{
}

- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)siriCurrentPronunciation
{
  return self->_siriCurrentPronunciation;
}

- (void)setTtsSuggestedPhonemes:(id)a3
{
}

- (NSString)ttsSuggestedPhonemes
{
  return self->_ttsSuggestedPhonemes;
}

- (BOOL)isTTSMispronounced
{
  return self->_isTTSMispronounced;
}

- (double)phonemesToPhonemesDistance
{
  return self->_phonemesToPhonemesDistance;
}

- (void)setTtsCurrentPhonemes:(id)a3
{
}

- (NSString)ttsCurrentPhonemes
{
  return self->_ttsCurrentPhonemes;
}

- (void)setAsrPostItnLinkId:(id)a3
{
}

- (SISchemaUUID)asrPostItnLinkId
{
  return self->_asrPostItnLinkId;
}

- (void)setAsrRawRecognitionLinkId:(id)a3
{
}

- (SISchemaUUID)asrRawRecognitionLinkId
{
  return self->_asrRawRecognitionLinkId;
}

- (void)setGroundTruthId:(id)a3
{
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (PLUSSchemaPLUSTMDCGroundTruth)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLUSSchemaPLUSTMDCGroundTruth;
  v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"groundTruthId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setGroundTruthId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"asrRawRecognitionLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setAsrRawRecognitionLinkId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"asrPostItnLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setAsrPostItnLinkId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"ttsCurrentPhonemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setTtsCurrentPhonemes:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"phonemesToPhonemesDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[PLUSSchemaPLUSTMDCGroundTruth setPhonemesToPhonemesDistance:](v5, "setPhonemesToPhonemesDistance:");
    }
    v30 = v14;
    v31 = v12;
    v15 = [v4 objectForKeyedSubscript:@"isTTSMispronounced"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSTMDCGroundTruth setIsTTSMispronounced:](v5, "setIsTTSMispronounced:", [v15 BOOLValue]);
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"ttsSuggestedPhonemes", v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = (void *)[v16 copy];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setTtsSuggestedPhonemes:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"siriCurrentPronunciation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 alloc] initWithDictionary:v18];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setSiriCurrentPronunciation:v19];
    }
    v32 = (void *)v10;
    int v20 = [v4 objectForKeyedSubscript:@"correctedPronunciation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 alloc] initWithDictionary:v20];
      [(PLUSSchemaPLUSTMDCGroundTruth *)v5 setCorrectedPronunciation:v21];
    }
    objc_super v22 = (void *)v8;
    v23 = [v4 objectForKeyedSubscript:@"selfLogSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSTMDCGroundTruth setSelfLogSource:](v5, "setSelfLogSource:", [v23 intValue]);
    }
    v24 = (void *)v6;
    v25 = [v4 objectForKeyedSubscript:@"isTmdcPluginEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSTMDCGroundTruth setIsTmdcPluginEnabled:](v5, "setIsTmdcPluginEnabled:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isCorrectionEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSTMDCGroundTruth setIsCorrectionEligible:](v5, "setIsCorrectionEligible:", [v26 BOOLValue]);
    }
    v27 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSTMDCGroundTruth)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSTMDCGroundTruth *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSTMDCGroundTruth *)self dictionaryRepresentation];
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
  if (self->_asrPostItnLinkId)
  {
    id v4 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrPostItnLinkId"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrPostItnLinkId"];
    }
  }
  if (self->_asrRawRecognitionLinkId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"asrRawRecognitionLinkId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"asrRawRecognitionLinkId"];
    }
  }
  if (self->_correctedPronunciation)
  {
    uint64_t v10 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"correctedPronunciation"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"correctedPronunciation"];
    }
  }
  if (self->_groundTruthId)
  {
    v13 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"groundTruthId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"groundTruthId"];
    }
  }
  char v16 = *(&self->_isCorrectionEligible + 1);
  if ((v16 & 0x10) != 0)
  {
    objc_super v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isCorrectionEligible](self, "isCorrectionEligible"));
    [v3 setObject:v22 forKeyedSubscript:@"isCorrectionEligible"];

    char v16 = *(&self->_isCorrectionEligible + 1);
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_37;
    }
  }
  else if ((*(&self->_isCorrectionEligible + 1) & 2) == 0)
  {
    goto LABEL_23;
  }
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isTTSMispronounced](self, "isTTSMispronounced"));
  [v3 setObject:v23 forKeyedSubscript:@"isTTSMispronounced"];

  char v16 = *(&self->_isCorrectionEligible + 1);
  if ((v16 & 8) == 0)
  {
LABEL_24:
    if ((v16 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_38:
    v25 = NSNumber;
    [(PLUSSchemaPLUSTMDCGroundTruth *)self phonemesToPhonemesDistance];
    v26 = objc_msgSend(v25, "numberWithDouble:");
    [v3 setObject:v26 forKeyedSubscript:@"phonemesToPhonemesDistance"];

    if ((*(&self->_isCorrectionEligible + 1) & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
LABEL_37:
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSTMDCGroundTruth isTmdcPluginEnabled](self, "isTmdcPluginEnabled"));
  [v3 setObject:v24 forKeyedSubscript:@"isTmdcPluginEnabled"];

  char v16 = *(&self->_isCorrectionEligible + 1);
  if (v16) {
    goto LABEL_38;
  }
LABEL_25:
  if ((v16 & 4) == 0) {
    goto LABEL_32;
  }
LABEL_26:
  int v17 = [(PLUSSchemaPLUSTMDCGroundTruth *)self selfLogSource];
  v18 = @"PLUSTMDCSELFLOGSOURCE_UNKNOWN";
  if (v17 == 1) {
    v18 = @"PLUSTMDCSELFLOGSOURCE_CLIENT";
  }
  if (v17 == 2) {
    v19 = @"PLUSTMDCSELFLOGSOURCE_INTERNAL";
  }
  else {
    v19 = v18;
  }
  [v3 setObject:v19 forKeyedSubscript:@"selfLogSource"];
LABEL_32:
  if (self->_siriCurrentPronunciation)
  {
    int v20 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"siriCurrentPronunciation"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"siriCurrentPronunciation"];
    }
  }
  if (self->_ttsCurrentPhonemes)
  {
    v28 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsCurrentPhonemes];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"ttsCurrentPhonemes"];
  }
  if (self->_ttsSuggestedPhonemes)
  {
    v30 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsSuggestedPhonemes];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"ttsSuggestedPhonemes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v20 = [(SISchemaUUID *)self->_groundTruthId hash];
  unint64_t v3 = [(SISchemaUUID *)self->_asrRawRecognitionLinkId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_asrPostItnLinkId hash];
  NSUInteger v5 = [(NSString *)self->_ttsCurrentPhonemes hash];
  char v6 = *(&self->_isCorrectionEligible + 1);
  if (v6)
  {
    double phonemesToPhonemesDistance = self->_phonemesToPhonemesDistance;
    double v9 = -phonemesToPhonemesDistance;
    if (phonemesToPhonemesDistance >= 0.0) {
      double v9 = self->_phonemesToPhonemesDistance;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((v6 & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_isTTSMispronounced;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_ttsSuggestedPhonemes hash];
  unint64_t v14 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self->_siriCurrentPronunciation hash];
  unint64_t v15 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self->_correctedPronunciation hash];
  if ((*(&self->_isCorrectionEligible + 1) & 4) == 0)
  {
    uint64_t v16 = 0;
    if ((*(&self->_isCorrectionEligible + 1) & 8) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v17 = 0;
    if ((*(&self->_isCorrectionEligible + 1) & 0x10) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v18 = 0;
    return v3 ^ v20 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  uint64_t v16 = 2654435761 * self->_selfLogSource;
  if ((*(&self->_isCorrectionEligible + 1) & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v17 = 2654435761 * self->_isTmdcPluginEnabled;
  if ((*(&self->_isCorrectionEligible + 1) & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v18 = 2654435761 * self->_isCorrectionEligible;
  return v3 ^ v20 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
  char v6 = [v4 groundTruthId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v7 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    double v9 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
    long double v10 = [v4 groundTruthId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
  char v6 = [v4 asrRawRecognitionLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v12 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
    unint64_t v15 = [v4 asrRawRecognitionLinkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
  char v6 = [v4 asrPostItnLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v17 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
    unint64_t v20 = [v4 asrPostItnLinkId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsCurrentPhonemes];
  char v6 = [v4 ttsCurrentPhonemes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v22 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsCurrentPhonemes];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsCurrentPhonemes];
    v25 = [v4 ttsCurrentPhonemes];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned int v27 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
  unsigned int v28 = v4[86];
  if ((v27 & 1) != (v28 & 1)) {
    goto LABEL_44;
  }
  if (v27)
  {
    double phonemesToPhonemesDistance = self->_phonemesToPhonemesDistance;
    [v4 phonemesToPhonemesDistance];
    if (phonemesToPhonemesDistance != v30) {
      goto LABEL_44;
    }
    unsigned int v27 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
    unsigned int v28 = v4[86];
  }
  int v31 = (v27 >> 1) & 1;
  if (v31 != ((v28 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v31)
  {
    int isTTSMispronounced = self->_isTTSMispronounced;
    if (isTTSMispronounced != [v4 isTTSMispronounced]) {
      goto LABEL_44;
    }
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsSuggestedPhonemes];
  char v6 = [v4 ttsSuggestedPhonemes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v33 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsSuggestedPhonemes];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsSuggestedPhonemes];
    v36 = [v4 ttsSuggestedPhonemes];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
  char v6 = [v4 siriCurrentPronunciation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v38 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
    v41 = [v4 siriCurrentPronunciation];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
  char v6 = [v4 correctedPronunciation];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v43 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
    v46 = [v4 correctedPronunciation];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned int v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
  int v51 = (v50 >> 2) & 1;
  unsigned int v52 = v4[86];
  if (v51 == ((v52 >> 2) & 1))
  {
    if (v51)
    {
      selfLogSource = self->_selfLogSource;
      if (selfLogSource != [v4 selfLogSource]) {
        goto LABEL_44;
      }
      unsigned int v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
      unsigned int v52 = v4[86];
    }
    int v54 = (v50 >> 3) & 1;
    if (v54 == ((v52 >> 3) & 1))
    {
      if (v54)
      {
        int isTmdcPluginEnabled = self->_isTmdcPluginEnabled;
        if (isTmdcPluginEnabled != [v4 isTmdcPluginEnabled]) {
          goto LABEL_44;
        }
        unsigned int v50 = *((unsigned __int8 *)&self->_isCorrectionEligible + 1);
        unsigned int v52 = v4[86];
      }
      int v56 = (v50 >> 4) & 1;
      if (v56 == ((v52 >> 4) & 1))
      {
        if (!v56
          || (int isCorrectionEligible = self->_isCorrectionEligible,
              isCorrectionEligible == [v4 isCorrectionEligible]))
        {
          BOOL v48 = 1;
          goto LABEL_45;
        }
      }
    }
  }
LABEL_44:
  BOOL v48 = 0;
LABEL_45:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  unint64_t v4 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];

  if (v4)
  {
    NSUInteger v5 = [(PLUSSchemaPLUSTMDCGroundTruth *)self groundTruthId];
    PBDataWriterWriteSubmessage();
  }
  char v6 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrRawRecognitionLinkId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];

  if (v8)
  {
    double v9 = [(PLUSSchemaPLUSTMDCGroundTruth *)self asrPostItnLinkId];
    PBDataWriterWriteSubmessage();
  }
  long double v10 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsCurrentPhonemes];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  char v11 = *(&self->_isCorrectionEligible + 1);
  if (v11)
  {
    PBDataWriterWriteDoubleField();
    char v11 = *(&self->_isCorrectionEligible + 1);
  }
  if ((v11 & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(PLUSSchemaPLUSTMDCGroundTruth *)self ttsSuggestedPhonemes];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v13 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];

  if (v13)
  {
    unint64_t v14 = [(PLUSSchemaPLUSTMDCGroundTruth *)self siriCurrentPronunciation];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v15 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];

  if (v15)
  {
    int v16 = [(PLUSSchemaPLUSTMDCGroundTruth *)self correctedPronunciation];
    PBDataWriterWriteSubmessage();
  }
  char v17 = *(&self->_isCorrectionEligible + 1);
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v17 = *(&self->_isCorrectionEligible + 1);
  }
  uint64_t v18 = v19;
  if ((v17 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = v19;
    char v17 = *(&self->_isCorrectionEligible + 1);
  }
  if ((v17 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsCorrectionEligible
{
  *(&self->_isCorrectionEligible + 1) &= ~0x10u;
}

- (void)setHasIsCorrectionEligible:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xEF | v3;
}

- (BOOL)hasIsCorrectionEligible
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 4) & 1;
}

- (void)setIsCorrectionEligible:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 0x10u;
  self->_int isCorrectionEligible = a3;
}

- (void)deleteIsTmdcPluginEnabled
{
  *(&self->_isCorrectionEligible + 1) &= ~8u;
}

- (void)setHasIsTmdcPluginEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xF7 | v3;
}

- (BOOL)hasIsTmdcPluginEnabled
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 3) & 1;
}

- (void)setIsTmdcPluginEnabled:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 8u;
  self->_int isTmdcPluginEnabled = a3;
}

- (void)deleteSelfLogSource
{
  *(&self->_isCorrectionEligible + 1) &= ~4u;
}

- (void)setHasSelfLogSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFB | v3;
}

- (BOOL)hasSelfLogSource
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 2) & 1;
}

- (void)setSelfLogSource:(int)a3
{
  *(&self->_isCorrectionEligible + 1) |= 4u;
  self->_selfLogSource = a3;
}

- (void)deleteCorrectedPronunciation
{
}

- (BOOL)hasCorrectedPronunciation
{
  return self->_correctedPronunciation != 0;
}

- (void)deleteSiriCurrentPronunciation
{
}

- (BOOL)hasSiriCurrentPronunciation
{
  return self->_siriCurrentPronunciation != 0;
}

- (void)deleteTtsSuggestedPhonemes
{
}

- (BOOL)hasTtsSuggestedPhonemes
{
  return self->_ttsSuggestedPhonemes != 0;
}

- (void)deleteIsTTSMispronounced
{
  *(&self->_isCorrectionEligible + 1) &= ~2u;
}

- (void)setHasIsTTSMispronounced:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFD | v3;
}

- (BOOL)hasIsTTSMispronounced
{
  return (*((unsigned __int8 *)&self->_isCorrectionEligible + 1) >> 1) & 1;
}

- (void)setIsTTSMispronounced:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) |= 2u;
  self->_int isTTSMispronounced = a3;
}

- (void)deletePhonemesToPhonemesDistance
{
  *(&self->_isCorrectionEligible + 1) &= ~1u;
}

- (void)setHasPhonemesToPhonemesDistance:(BOOL)a3
{
  *(&self->_isCorrectionEligible + 1) = *(&self->_isCorrectionEligible + 1) & 0xFE | a3;
}

- (BOOL)hasPhonemesToPhonemesDistance
{
  return *(&self->_isCorrectionEligible + 1);
}

- (void)setPhonemesToPhonemesDistance:(double)a3
{
  *(&self->_isCorrectionEligible + 1) |= 1u;
  self->_double phonemesToPhonemesDistance = a3;
}

- (void)deleteTtsCurrentPhonemes
{
}

- (BOOL)hasTtsCurrentPhonemes
{
  return self->_ttsCurrentPhonemes != 0;
}

- (void)deleteAsrPostItnLinkId
{
}

- (BOOL)hasAsrPostItnLinkId
{
  return self->_asrPostItnLinkId != 0;
}

- (void)deleteAsrRawRecognitionLinkId
{
}

- (BOOL)hasAsrRawRecognitionLinkId
{
  return self->_asrRawRecognitionLinkId != 0;
}

- (void)deleteGroundTruthId
{
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

@end
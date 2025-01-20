@interface INFERENCESchemaINFERENCEContactFeatureSet
- (BOOL)hasAllHandlesMatched;
- (BOOL)hasAllPrimaryNameTokensAreInQuery;
- (BOOL)hasAllQueryMatched;
- (BOOL)hasFreqAnyGroup0MinTo2Min;
- (BOOL)hasFreqAnyGroup10MinTo1Hr;
- (BOOL)hasFreqAnyGroup1DayTo7Day;
- (BOOL)hasFreqAnyGroup1HrTo6Hr;
- (BOOL)hasFreqAnyGroup28DayToInf;
- (BOOL)hasFreqAnyGroup2MinTo10Min;
- (BOOL)hasFreqAnyGroup6HrTo1Day;
- (BOOL)hasFreqAnyGroup7DayTo28Day;
- (BOOL)hasFreqSameGroup0MinTo2Min;
- (BOOL)hasFreqSameGroup10MinTo1Hr;
- (BOOL)hasFreqSameGroup1DayTo7Day;
- (BOOL)hasFreqSameGroup1HrTo6Hr;
- (BOOL)hasFreqSameGroup28DayToInf;
- (BOOL)hasFreqSameGroup2MinTo10Min;
- (BOOL)hasFreqSameGroup6HrTo1Day;
- (BOOL)hasFreqSameGroup7DayTo28Day;
- (BOOL)hasHasSuggestedProperties;
- (BOOL)hasIsFamilyNameMatch;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsGivenNameMatch;
- (BOOL)hasIsHighQualityRequestMatch;
- (BOOL)hasIsHypocorism;
- (BOOL)hasIsMeCardRelation;
- (BOOL)hasIsMiddleNameMatch;
- (BOOL)hasIsNamePrefixMatch;
- (BOOL)hasIsNameSuffixMatch;
- (BOOL)hasIsNicknameMatch;
- (BOOL)hasIsOrganizationNameMatch;
- (BOOL)hasIsPartialNameMatch;
- (BOOL)hasIsRecent;
- (BOOL)hasIsRecentInSameDomain;
- (BOOL)hasIsRecentInSiriRequest;
- (BOOL)hasIsRecentlyCorrected;
- (BOOL)hasIsRelationAlias;
- (BOOL)hasIsSuggested;
- (BOOL)hasIsWeakOrganizationMatch;
- (BOOL)hasNumPrimaryTokens;
- (BOOL)hasRecencyRank;
- (BOOL)hasRecencyRankInSameDomain;
- (BOOL)hasRecencyRankInSiriRequest;
- (BOOL)hasSpeechAlternativeRanksFamilyNameRank;
- (BOOL)hasSpeechAlternativeRanksGivenNameRank;
- (BOOL)hasSpeechAlternativeRanksMiddleNameRank;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactFeatureSet)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactFeatureSet)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)allHandlesMatched;
- (float)allPrimaryNameTokensAreInQuery;
- (float)allQueryMatched;
- (float)freqAnyGroup0MinTo2Min;
- (float)freqAnyGroup10MinTo1Hr;
- (float)freqAnyGroup1DayTo7Day;
- (float)freqAnyGroup1HrTo6Hr;
- (float)freqAnyGroup28DayToInf;
- (float)freqAnyGroup2MinTo10Min;
- (float)freqAnyGroup6HrTo1Day;
- (float)freqAnyGroup7DayTo28Day;
- (float)freqSameGroup0MinTo2Min;
- (float)freqSameGroup10MinTo1Hr;
- (float)freqSameGroup1DayTo7Day;
- (float)freqSameGroup1HrTo6Hr;
- (float)freqSameGroup28DayToInf;
- (float)freqSameGroup2MinTo10Min;
- (float)freqSameGroup6HrTo1Day;
- (float)freqSameGroup7DayTo28Day;
- (float)hasSuggestedProperties;
- (float)isFamilyNameMatch;
- (float)isFavorite;
- (float)isGivenNameMatch;
- (float)isHighQualityRequestMatch;
- (float)isHypocorism;
- (float)isMeCardRelation;
- (float)isMiddleNameMatch;
- (float)isNamePrefixMatch;
- (float)isNameSuffixMatch;
- (float)isNicknameMatch;
- (float)isOrganizationNameMatch;
- (float)isPartialNameMatch;
- (float)isRecent;
- (float)isRecentInSameDomain;
- (float)isRecentInSiriRequest;
- (float)isRecentlyCorrected;
- (float)isRelationAlias;
- (float)isSuggested;
- (float)isWeakOrganizationMatch;
- (float)numPrimaryTokens;
- (float)recencyRank;
- (float)recencyRankInSameDomain;
- (float)recencyRankInSiriRequest;
- (float)speechAlternativeRanksFamilyNameRank;
- (float)speechAlternativeRanksGivenNameRank;
- (float)speechAlternativeRanksMiddleNameRank;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAllHandlesMatched;
- (void)deleteAllPrimaryNameTokensAreInQuery;
- (void)deleteAllQueryMatched;
- (void)deleteFreqAnyGroup0MinTo2Min;
- (void)deleteFreqAnyGroup10MinTo1Hr;
- (void)deleteFreqAnyGroup1DayTo7Day;
- (void)deleteFreqAnyGroup1HrTo6Hr;
- (void)deleteFreqAnyGroup28DayToInf;
- (void)deleteFreqAnyGroup2MinTo10Min;
- (void)deleteFreqAnyGroup6HrTo1Day;
- (void)deleteFreqAnyGroup7DayTo28Day;
- (void)deleteFreqSameGroup0MinTo2Min;
- (void)deleteFreqSameGroup10MinTo1Hr;
- (void)deleteFreqSameGroup1DayTo7Day;
- (void)deleteFreqSameGroup1HrTo6Hr;
- (void)deleteFreqSameGroup28DayToInf;
- (void)deleteFreqSameGroup2MinTo10Min;
- (void)deleteFreqSameGroup6HrTo1Day;
- (void)deleteFreqSameGroup7DayTo28Day;
- (void)deleteHasSuggestedProperties;
- (void)deleteIsFamilyNameMatch;
- (void)deleteIsFavorite;
- (void)deleteIsGivenNameMatch;
- (void)deleteIsHighQualityRequestMatch;
- (void)deleteIsHypocorism;
- (void)deleteIsMeCardRelation;
- (void)deleteIsMiddleNameMatch;
- (void)deleteIsNamePrefixMatch;
- (void)deleteIsNameSuffixMatch;
- (void)deleteIsNicknameMatch;
- (void)deleteIsOrganizationNameMatch;
- (void)deleteIsPartialNameMatch;
- (void)deleteIsRecent;
- (void)deleteIsRecentInSameDomain;
- (void)deleteIsRecentInSiriRequest;
- (void)deleteIsRecentlyCorrected;
- (void)deleteIsRelationAlias;
- (void)deleteIsSuggested;
- (void)deleteIsWeakOrganizationMatch;
- (void)deleteNumPrimaryTokens;
- (void)deleteRecencyRank;
- (void)deleteRecencyRankInSameDomain;
- (void)deleteRecencyRankInSiriRequest;
- (void)deleteSpeechAlternativeRanksFamilyNameRank;
- (void)deleteSpeechAlternativeRanksGivenNameRank;
- (void)deleteSpeechAlternativeRanksMiddleNameRank;
- (void)setAllHandlesMatched:(float)a3;
- (void)setAllPrimaryNameTokensAreInQuery:(float)a3;
- (void)setAllQueryMatched:(float)a3;
- (void)setFreqAnyGroup0MinTo2Min:(float)a3;
- (void)setFreqAnyGroup10MinTo1Hr:(float)a3;
- (void)setFreqAnyGroup1DayTo7Day:(float)a3;
- (void)setFreqAnyGroup1HrTo6Hr:(float)a3;
- (void)setFreqAnyGroup28DayToInf:(float)a3;
- (void)setFreqAnyGroup2MinTo10Min:(float)a3;
- (void)setFreqAnyGroup6HrTo1Day:(float)a3;
- (void)setFreqAnyGroup7DayTo28Day:(float)a3;
- (void)setFreqSameGroup0MinTo2Min:(float)a3;
- (void)setFreqSameGroup10MinTo1Hr:(float)a3;
- (void)setFreqSameGroup1DayTo7Day:(float)a3;
- (void)setFreqSameGroup1HrTo6Hr:(float)a3;
- (void)setFreqSameGroup28DayToInf:(float)a3;
- (void)setFreqSameGroup2MinTo10Min:(float)a3;
- (void)setFreqSameGroup6HrTo1Day:(float)a3;
- (void)setFreqSameGroup7DayTo28Day:(float)a3;
- (void)setHasAllHandlesMatched:(BOOL)a3;
- (void)setHasAllPrimaryNameTokensAreInQuery:(BOOL)a3;
- (void)setHasAllQueryMatched:(BOOL)a3;
- (void)setHasFreqAnyGroup0MinTo2Min:(BOOL)a3;
- (void)setHasFreqAnyGroup10MinTo1Hr:(BOOL)a3;
- (void)setHasFreqAnyGroup1DayTo7Day:(BOOL)a3;
- (void)setHasFreqAnyGroup1HrTo6Hr:(BOOL)a3;
- (void)setHasFreqAnyGroup28DayToInf:(BOOL)a3;
- (void)setHasFreqAnyGroup2MinTo10Min:(BOOL)a3;
- (void)setHasFreqAnyGroup6HrTo1Day:(BOOL)a3;
- (void)setHasFreqAnyGroup7DayTo28Day:(BOOL)a3;
- (void)setHasFreqSameGroup0MinTo2Min:(BOOL)a3;
- (void)setHasFreqSameGroup10MinTo1Hr:(BOOL)a3;
- (void)setHasFreqSameGroup1DayTo7Day:(BOOL)a3;
- (void)setHasFreqSameGroup1HrTo6Hr:(BOOL)a3;
- (void)setHasFreqSameGroup28DayToInf:(BOOL)a3;
- (void)setHasFreqSameGroup2MinTo10Min:(BOOL)a3;
- (void)setHasFreqSameGroup6HrTo1Day:(BOOL)a3;
- (void)setHasFreqSameGroup7DayTo28Day:(BOOL)a3;
- (void)setHasHasSuggestedProperties:(BOOL)a3;
- (void)setHasIsFamilyNameMatch:(BOOL)a3;
- (void)setHasIsFavorite:(BOOL)a3;
- (void)setHasIsGivenNameMatch:(BOOL)a3;
- (void)setHasIsHighQualityRequestMatch:(BOOL)a3;
- (void)setHasIsHypocorism:(BOOL)a3;
- (void)setHasIsMeCardRelation:(BOOL)a3;
- (void)setHasIsMiddleNameMatch:(BOOL)a3;
- (void)setHasIsNamePrefixMatch:(BOOL)a3;
- (void)setHasIsNameSuffixMatch:(BOOL)a3;
- (void)setHasIsNicknameMatch:(BOOL)a3;
- (void)setHasIsOrganizationNameMatch:(BOOL)a3;
- (void)setHasIsPartialNameMatch:(BOOL)a3;
- (void)setHasIsRecent:(BOOL)a3;
- (void)setHasIsRecentInSameDomain:(BOOL)a3;
- (void)setHasIsRecentInSiriRequest:(BOOL)a3;
- (void)setHasIsRecentlyCorrected:(BOOL)a3;
- (void)setHasIsRelationAlias:(BOOL)a3;
- (void)setHasIsSuggested:(BOOL)a3;
- (void)setHasIsWeakOrganizationMatch:(BOOL)a3;
- (void)setHasNumPrimaryTokens:(BOOL)a3;
- (void)setHasRecencyRank:(BOOL)a3;
- (void)setHasRecencyRankInSameDomain:(BOOL)a3;
- (void)setHasRecencyRankInSiriRequest:(BOOL)a3;
- (void)setHasSpeechAlternativeRanksFamilyNameRank:(BOOL)a3;
- (void)setHasSpeechAlternativeRanksGivenNameRank:(BOOL)a3;
- (void)setHasSpeechAlternativeRanksMiddleNameRank:(BOOL)a3;
- (void)setHasSuggestedProperties:(float)a3;
- (void)setIsFamilyNameMatch:(float)a3;
- (void)setIsFavorite:(float)a3;
- (void)setIsGivenNameMatch:(float)a3;
- (void)setIsHighQualityRequestMatch:(float)a3;
- (void)setIsHypocorism:(float)a3;
- (void)setIsMeCardRelation:(float)a3;
- (void)setIsMiddleNameMatch:(float)a3;
- (void)setIsNamePrefixMatch:(float)a3;
- (void)setIsNameSuffixMatch:(float)a3;
- (void)setIsNicknameMatch:(float)a3;
- (void)setIsOrganizationNameMatch:(float)a3;
- (void)setIsPartialNameMatch:(float)a3;
- (void)setIsRecent:(float)a3;
- (void)setIsRecentInSameDomain:(float)a3;
- (void)setIsRecentInSiriRequest:(float)a3;
- (void)setIsRecentlyCorrected:(float)a3;
- (void)setIsRelationAlias:(float)a3;
- (void)setIsSuggested:(float)a3;
- (void)setIsWeakOrganizationMatch:(float)a3;
- (void)setNumPrimaryTokens:(float)a3;
- (void)setRecencyRank:(float)a3;
- (void)setRecencyRankInSameDomain:(float)a3;
- (void)setRecencyRankInSiriRequest:(float)a3;
- (void)setSpeechAlternativeRanksFamilyNameRank:(float)a3;
- (void)setSpeechAlternativeRanksGivenNameRank:(float)a3;
- (void)setSpeechAlternativeRanksMiddleNameRank:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactFeatureSet

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)isRelationAlias
{
  return self->_isRelationAlias;
}

- (float)allHandlesMatched
{
  return self->_allHandlesMatched;
}

- (float)isNameSuffixMatch
{
  return self->_isNameSuffixMatch;
}

- (float)isNamePrefixMatch
{
  return self->_isNamePrefixMatch;
}

- (float)isNicknameMatch
{
  return self->_isNicknameMatch;
}

- (float)isOrganizationNameMatch
{
  return self->_isOrganizationNameMatch;
}

- (float)isFamilyNameMatch
{
  return self->_isFamilyNameMatch;
}

- (float)isMiddleNameMatch
{
  return self->_isMiddleNameMatch;
}

- (float)isGivenNameMatch
{
  return self->_isGivenNameMatch;
}

- (float)allPrimaryNameTokensAreInQuery
{
  return self->_allPrimaryNameTokensAreInQuery;
}

- (float)allQueryMatched
{
  return self->_allQueryMatched;
}

- (float)numPrimaryTokens
{
  return self->_numPrimaryTokens;
}

- (float)isPartialNameMatch
{
  return self->_isPartialNameMatch;
}

- (float)hasSuggestedProperties
{
  return self->_hasSuggestedProperties;
}

- (float)isHypocorism
{
  return self->_isHypocorism;
}

- (float)isSuggested
{
  return self->_isSuggested;
}

- (float)freqSameGroup28DayToInf
{
  return self->_freqSameGroup28DayToInf;
}

- (float)freqSameGroup7DayTo28Day
{
  return self->_freqSameGroup7DayTo28Day;
}

- (float)freqSameGroup1DayTo7Day
{
  return self->_freqSameGroup1DayTo7Day;
}

- (float)freqSameGroup6HrTo1Day
{
  return self->_freqSameGroup6HrTo1Day;
}

- (float)freqSameGroup1HrTo6Hr
{
  return self->_freqSameGroup1HrTo6Hr;
}

- (float)freqSameGroup10MinTo1Hr
{
  return self->_freqSameGroup10MinTo1Hr;
}

- (float)freqSameGroup2MinTo10Min
{
  return self->_freqSameGroup2MinTo10Min;
}

- (float)freqSameGroup0MinTo2Min
{
  return self->_freqSameGroup0MinTo2Min;
}

- (float)freqAnyGroup28DayToInf
{
  return self->_freqAnyGroup28DayToInf;
}

- (float)freqAnyGroup7DayTo28Day
{
  return self->_freqAnyGroup7DayTo28Day;
}

- (float)freqAnyGroup1DayTo7Day
{
  return self->_freqAnyGroup1DayTo7Day;
}

- (float)freqAnyGroup6HrTo1Day
{
  return self->_freqAnyGroup6HrTo1Day;
}

- (float)freqAnyGroup1HrTo6Hr
{
  return self->_freqAnyGroup1HrTo6Hr;
}

- (float)freqAnyGroup10MinTo1Hr
{
  return self->_freqAnyGroup10MinTo1Hr;
}

- (float)freqAnyGroup2MinTo10Min
{
  return self->_freqAnyGroup2MinTo10Min;
}

- (float)freqAnyGroup0MinTo2Min
{
  return self->_freqAnyGroup0MinTo2Min;
}

- (float)speechAlternativeRanksFamilyNameRank
{
  return self->_speechAlternativeRanksFamilyNameRank;
}

- (float)speechAlternativeRanksMiddleNameRank
{
  return self->_speechAlternativeRanksMiddleNameRank;
}

- (float)speechAlternativeRanksGivenNameRank
{
  return self->_speechAlternativeRanksGivenNameRank;
}

- (float)isWeakOrganizationMatch
{
  return self->_isWeakOrganizationMatch;
}

- (float)isMeCardRelation
{
  return self->_isMeCardRelation;
}

- (float)isFavorite
{
  return self->_isFavorite;
}

- (float)isHighQualityRequestMatch
{
  return self->_isHighQualityRequestMatch;
}

- (float)recencyRankInSiriRequest
{
  return self->_recencyRankInSiriRequest;
}

- (float)recencyRankInSameDomain
{
  return self->_recencyRankInSameDomain;
}

- (float)recencyRank
{
  return self->_recencyRank;
}

- (float)isRecentlyCorrected
{
  return self->_isRecentlyCorrected;
}

- (float)isRecentInSiriRequest
{
  return self->_isRecentInSiriRequest;
}

- (float)isRecentInSameDomain
{
  return self->_isRecentInSameDomain;
}

- (float)isRecent
{
  return self->_isRecent;
}

- (INFERENCESchemaINFERENCEContactFeatureSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)INFERENCESchemaINFERENCEContactFeatureSet;
  v5 = [(INFERENCESchemaINFERENCEContactFeatureSet *)&v100 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isRecent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecent:](v5, "setIsRecent:");
    }
    v7 = [v4 objectForKeyedSubscript:@"isRecentInSameDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSameDomain:](v5, "setIsRecentInSameDomain:");
    }
    v8 = [v4 objectForKeyedSubscript:@"isRecentInSiriRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentInSiriRequest:](v5, "setIsRecentInSiriRequest:");
    }
    v9 = [v4 objectForKeyedSubscript:@"isRecentlyCorrected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRecentlyCorrected:](v5, "setIsRecentlyCorrected:");
    }
    v10 = [v4 objectForKeyedSubscript:@"recencyRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRank:](v5, "setRecencyRank:");
    }
    v11 = [v4 objectForKeyedSubscript:@"recencyRankInSameDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSameDomain:](v5, "setRecencyRankInSameDomain:");
    }
    v80 = v6;
    v12 = [v4 objectForKeyedSubscript:@"recencyRankInSiriRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setRecencyRankInSiriRequest:](v5, "setRecencyRankInSiriRequest:");
    }
    v74 = v12;
    v13 = [v4 objectForKeyedSubscript:@"isHighQualityRequestMatch"];
    objc_opt_class();
    v99 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsHighQualityRequestMatch:](v5, "setIsHighQualityRequestMatch:");
    }
    v14 = v10;
    v79 = v7;
    v15 = [v4 objectForKeyedSubscript:@"isFavorite"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsFavorite:](v5, "setIsFavorite:");
    }
    v16 = v9;
    v17 = [v4 objectForKeyedSubscript:@"isMeCardRelation"];
    objc_opt_class();
    v98 = v17;
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsMeCardRelation:](v5, "setIsMeCardRelation:");
    }
    v18 = v8;
    v19 = [v4 objectForKeyedSubscript:@"isWeakOrganizationMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsWeakOrganizationMatch:](v5, "setIsWeakOrganizationMatch:");
    }
    v20 = [v4 objectForKeyedSubscript:@"speechAlternativeRanksGivenNameRank"];
    objc_opt_class();
    v97 = v20;
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksGivenNameRank:](v5, "setSpeechAlternativeRanksGivenNameRank:");
    }
    v21 = [v4 objectForKeyedSubscript:@"speechAlternativeRanksMiddleNameRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksMiddleNameRank:](v5, "setSpeechAlternativeRanksMiddleNameRank:");
    }
    v71 = v21;
    v22 = [v4 objectForKeyedSubscript:@"speechAlternativeRanksFamilyNameRank"];
    objc_opt_class();
    v96 = v22;
    v78 = v18;
    if (objc_opt_isKindOfClass())
    {
      [v22 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setSpeechAlternativeRanksFamilyNameRank:](v5, "setSpeechAlternativeRanksFamilyNameRank:");
    }
    v23 = [v4 objectForKeyedSubscript:@"freqAnyGroup0MinTo2Min"];
    objc_opt_class();
    v95 = v23;
    v77 = v16;
    if (objc_opt_isKindOfClass())
    {
      [v23 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup0MinTo2Min:](v5, "setFreqAnyGroup0MinTo2Min:");
    }
    v24 = [v4 objectForKeyedSubscript:@"freqAnyGroup2MinTo10Min"];
    objc_opt_class();
    v94 = v24;
    v76 = v14;
    if (objc_opt_isKindOfClass())
    {
      [v24 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup2MinTo10Min:](v5, "setFreqAnyGroup2MinTo10Min:");
    }
    v25 = [v4 objectForKeyedSubscript:@"freqAnyGroup10MinTo1Hr"];
    objc_opt_class();
    v93 = v25;
    v75 = v11;
    if (objc_opt_isKindOfClass())
    {
      [v25 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup10MinTo1Hr:](v5, "setFreqAnyGroup10MinTo1Hr:");
    }
    v26 = [v4 objectForKeyedSubscript:@"freqAnyGroup1HrTo6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v26 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1HrTo6Hr:](v5, "setFreqAnyGroup1HrTo6Hr:");
    }
    v70 = v26;
    v27 = [v4 objectForKeyedSubscript:@"freqAnyGroup6HrTo1Day"];
    objc_opt_class();
    v92 = v27;
    if (objc_opt_isKindOfClass())
    {
      [v27 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup6HrTo1Day:](v5, "setFreqAnyGroup6HrTo1Day:");
    }
    v28 = [v4 objectForKeyedSubscript:@"freqAnyGroup1DayTo7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v28 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup1DayTo7Day:](v5, "setFreqAnyGroup1DayTo7Day:");
    }
    v29 = [v4 objectForKeyedSubscript:@"freqAnyGroup7DayTo28Day"];
    objc_opt_class();
    v91 = v29;
    if (objc_opt_isKindOfClass())
    {
      [v29 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup7DayTo28Day:](v5, "setFreqAnyGroup7DayTo28Day:");
    }
    v30 = [v4 objectForKeyedSubscript:@"freqAnyGroup28DayToInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqAnyGroup28DayToInf:](v5, "setFreqAnyGroup28DayToInf:");
    }
    v31 = [v4 objectForKeyedSubscript:@"freqSameGroup0MinTo2Min"];
    objc_opt_class();
    v90 = v31;
    if (objc_opt_isKindOfClass())
    {
      [v31 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup0MinTo2Min:](v5, "setFreqSameGroup0MinTo2Min:");
    }
    v32 = v28;
    v33 = [v4 objectForKeyedSubscript:@"freqSameGroup2MinTo10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v33 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup2MinTo10Min:](v5, "setFreqSameGroup2MinTo10Min:");
    }
    v34 = v19;
    v35 = [v4 objectForKeyedSubscript:@"freqSameGroup10MinTo1Hr"];
    objc_opt_class();
    v89 = v35;
    if (objc_opt_isKindOfClass())
    {
      [v35 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup10MinTo1Hr:](v5, "setFreqSameGroup10MinTo1Hr:");
    }
    v36 = v15;
    v37 = [v4 objectForKeyedSubscript:@"freqSameGroup1HrTo6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v37 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1HrTo6Hr:](v5, "setFreqSameGroup1HrTo6Hr:");
    }
    v38 = [v4 objectForKeyedSubscript:@"freqSameGroup6HrTo1Day"];
    objc_opt_class();
    v88 = v38;
    if (objc_opt_isKindOfClass())
    {
      [v38 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup6HrTo1Day:](v5, "setFreqSameGroup6HrTo1Day:");
    }
    v39 = [v4 objectForKeyedSubscript:@"freqSameGroup1DayTo7Day"];
    objc_opt_class();
    v87 = v39;
    v73 = v36;
    if (objc_opt_isKindOfClass())
    {
      [v39 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup1DayTo7Day:](v5, "setFreqSameGroup1DayTo7Day:");
    }
    v40 = [v4 objectForKeyedSubscript:@"freqSameGroup7DayTo28Day"];
    objc_opt_class();
    v86 = v40;
    v72 = v34;
    if (objc_opt_isKindOfClass())
    {
      [v40 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup7DayTo28Day:](v5, "setFreqSameGroup7DayTo28Day:");
    }
    v41 = [v4 objectForKeyedSubscript:@"freqSameGroup28DayToInf"];
    objc_opt_class();
    v85 = v41;
    v69 = v32;
    if (objc_opt_isKindOfClass())
    {
      [v41 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setFreqSameGroup28DayToInf:](v5, "setFreqSameGroup28DayToInf:");
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"isSuggested"];
    objc_opt_class();
    v84 = (void *)v42;
    v43 = v30;
    if (objc_opt_isKindOfClass())
    {
      [v84 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsSuggested:](v5, "setIsSuggested:");
    }
    v44 = [v4 objectForKeyedSubscript:@"isHypocorism"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v44 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsHypocorism:](v5, "setIsHypocorism:");
    }
    v45 = [v4 objectForKeyedSubscript:@"hasSuggestedProperties"];
    objc_opt_class();
    v83 = v45;
    if (objc_opt_isKindOfClass())
    {
      [v45 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setHasSuggestedProperties:](v5, "setHasSuggestedProperties:");
    }
    v46 = [v4 objectForKeyedSubscript:@"isPartialNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v46 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsPartialNameMatch:](v5, "setIsPartialNameMatch:");
    }
    v47 = [v4 objectForKeyedSubscript:@"numPrimaryTokens"];
    objc_opt_class();
    v82 = v47;
    if (objc_opt_isKindOfClass())
    {
      [v47 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setNumPrimaryTokens:](v5, "setNumPrimaryTokens:");
    }
    v48 = [v4 objectForKeyedSubscript:@"allQueryMatched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v48 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllQueryMatched:](v5, "setAllQueryMatched:");
    }
    v49 = [v4 objectForKeyedSubscript:@"allPrimaryNameTokensAreInQuery"];
    objc_opt_class();
    v81 = v49;
    if (objc_opt_isKindOfClass())
    {
      [v49 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllPrimaryNameTokensAreInQuery:](v5, "setAllPrimaryNameTokensAreInQuery:");
    }
    v50 = [v4 objectForKeyedSubscript:@"isGivenNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v50 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsGivenNameMatch:](v5, "setIsGivenNameMatch:");
    }
    v65 = v44;
    v51 = [v4 objectForKeyedSubscript:@"isMiddleNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v51 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsMiddleNameMatch:](v5, "setIsMiddleNameMatch:");
    }
    v64 = v46;
    v52 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isFamilyNameMatch", v51);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v52 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsFamilyNameMatch:](v5, "setIsFamilyNameMatch:");
    }
    v63 = v48;
    v53 = [v4 objectForKeyedSubscript:@"isOrganizationNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v53 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsOrganizationNameMatch:](v5, "setIsOrganizationNameMatch:");
    }
    v62 = v50;
    v54 = [v4 objectForKeyedSubscript:@"isNicknameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v54 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNicknameMatch:](v5, "setIsNicknameMatch:");
    }
    v68 = v43;
    v55 = [v4 objectForKeyedSubscript:@"isNamePrefixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v55 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNamePrefixMatch:](v5, "setIsNamePrefixMatch:");
    }
    v67 = v33;
    v56 = [v4 objectForKeyedSubscript:@"isNameSuffixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v56 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsNameSuffixMatch:](v5, "setIsNameSuffixMatch:");
    }
    v66 = v37;
    v57 = [v4 objectForKeyedSubscript:@"allHandlesMatched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v57 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setAllHandlesMatched:](v5, "setAllHandlesMatched:");
    }
    v58 = [v4 objectForKeyedSubscript:@"isRelationAlias"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v58 floatValue];
      -[INFERENCESchemaINFERENCEContactFeatureSet setIsRelationAlias:](v5, "setIsRelationAlias:");
    }
    v59 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactFeatureSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactFeatureSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactFeatureSet *)self dictionaryRepresentation];
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
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x100000000000) != 0)
  {
    v9 = NSNumber;
    [(INFERENCESchemaINFERENCEContactFeatureSet *)self allHandlesMatched];
    v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"allHandlesMatched"];

    unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((v4 & 0x1000000000) == 0)
    {
LABEL_3:
      if ((v4 & 0x800000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((v4 & 0x1000000000) == 0)
  {
    goto LABEL_3;
  }
  v11 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self allPrimaryNameTokensAreInQuery];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"allPrimaryNameTokensAreInQuery"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x800000000) == 0)
  {
LABEL_4:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  v13 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self allQueryMatched];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  [v3 setObject:v14 forKeyedSubscript:@"allQueryMatched"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_5:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  v15 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup0MinTo2Min];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"freqAnyGroup0MinTo2Min"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_6:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  v17 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup10MinTo1Hr];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  [v3 setObject:v18 forKeyedSubscript:@"freqAnyGroup10MinTo1Hr"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_7:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  v19 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup1DayTo7Day];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  [v3 setObject:v20 forKeyedSubscript:@"freqAnyGroup1DayTo7Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_8:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  v21 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup1HrTo6Hr];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  [v3 setObject:v22 forKeyedSubscript:@"freqAnyGroup1HrTo6Hr"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_9:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  v23 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup28DayToInf];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  [v3 setObject:v24 forKeyedSubscript:@"freqAnyGroup28DayToInf"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_10:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  v25 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup2MinTo10Min];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  [v3 setObject:v26 forKeyedSubscript:@"freqAnyGroup2MinTo10Min"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_11:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  v27 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup6HrTo1Day];
  v28 = objc_msgSend(v27, "numberWithFloat:");
  [v3 setObject:v28 forKeyedSubscript:@"freqAnyGroup6HrTo1Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_12:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  v29 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqAnyGroup7DayTo28Day];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  [v3 setObject:v30 forKeyedSubscript:@"freqAnyGroup7DayTo28Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_13:
    if ((v4 & 0x1000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  v31 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup0MinTo2Min];
  v32 = objc_msgSend(v31, "numberWithFloat:");
  [v3 setObject:v32 forKeyedSubscript:@"freqSameGroup0MinTo2Min"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_14:
    if ((v4 & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  v33 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup10MinTo1Hr];
  v34 = objc_msgSend(v33, "numberWithFloat:");
  [v3 setObject:v34 forKeyedSubscript:@"freqSameGroup10MinTo1Hr"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  v35 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup1DayTo7Day];
  v36 = objc_msgSend(v35, "numberWithFloat:");
  [v3 setObject:v36 forKeyedSubscript:@"freqSameGroup1DayTo7Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_16:
    if ((v4 & 0x20000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  v37 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup1HrTo6Hr];
  v38 = objc_msgSend(v37, "numberWithFloat:");
  [v3 setObject:v38 forKeyedSubscript:@"freqSameGroup1HrTo6Hr"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_17:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  v39 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup28DayToInf];
  v40 = objc_msgSend(v39, "numberWithFloat:");
  [v3 setObject:v40 forKeyedSubscript:@"freqSameGroup28DayToInf"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_18:
    if ((v4 & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  v41 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup2MinTo10Min];
  uint64_t v42 = objc_msgSend(v41, "numberWithFloat:");
  [v3 setObject:v42 forKeyedSubscript:@"freqSameGroup2MinTo10Min"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_19:
    if ((v4 & 0x10000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  v43 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup6HrTo1Day];
  v44 = objc_msgSend(v43, "numberWithFloat:");
  [v3 setObject:v44 forKeyedSubscript:@"freqSameGroup6HrTo1Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  v45 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self freqSameGroup7DayTo28Day];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v3 setObject:v46 forKeyedSubscript:@"freqSameGroup7DayTo28Day"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_21:
    if ((v4 & 0x8000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  v47 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self hasSuggestedProperties];
  v48 = objc_msgSend(v47, "numberWithFloat:");
  [v3 setObject:v48 forKeyedSubscript:@"hasSuggestedProperties"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x8000000000) == 0)
  {
LABEL_22:
    if ((v4 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  v49 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isFamilyNameMatch];
  v50 = objc_msgSend(v49, "numberWithFloat:");
  [v3 setObject:v50 forKeyedSubscript:@"isFamilyNameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_23:
    if ((v4 & 0x2000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  v51 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isFavorite];
  v52 = objc_msgSend(v51, "numberWithFloat:");
  [v3 setObject:v52 forKeyedSubscript:@"isFavorite"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x2000000000) == 0)
  {
LABEL_24:
    if ((v4 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  v53 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isGivenNameMatch];
  v54 = objc_msgSend(v53, "numberWithFloat:");
  [v3 setObject:v54 forKeyedSubscript:@"isGivenNameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_25:
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  v55 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isHighQualityRequestMatch];
  v56 = objc_msgSend(v55, "numberWithFloat:");
  [v3 setObject:v56 forKeyedSubscript:@"isHighQualityRequestMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_26:
    if ((v4 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  v57 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isHypocorism];
  v58 = objc_msgSend(v57, "numberWithFloat:");
  [v3 setObject:v58 forKeyedSubscript:@"isHypocorism"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_27:
    if ((v4 & 0x4000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  v59 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isMeCardRelation];
  v60 = objc_msgSend(v59, "numberWithFloat:");
  [v3 setObject:v60 forKeyedSubscript:@"isMeCardRelation"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x4000000000) == 0)
  {
LABEL_28:
    if ((v4 & 0x40000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  v61 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isMiddleNameMatch];
  v62 = objc_msgSend(v61, "numberWithFloat:");
  [v3 setObject:v62 forKeyedSubscript:@"isMiddleNameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((v4 & 0x80000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  v63 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isNamePrefixMatch];
  v64 = objc_msgSend(v63, "numberWithFloat:");
  [v3 setObject:v64 forKeyedSubscript:@"isNamePrefixMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x80000000000) == 0)
  {
LABEL_30:
    if ((v4 & 0x20000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  v65 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isNameSuffixMatch];
  v66 = objc_msgSend(v65, "numberWithFloat:");
  [v3 setObject:v66 forKeyedSubscript:@"isNameSuffixMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x20000000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x10000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  v67 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isNicknameMatch];
  v68 = objc_msgSend(v67, "numberWithFloat:");
  [v3 setObject:v68 forKeyedSubscript:@"isNicknameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x10000000000) == 0)
  {
LABEL_32:
    if ((v4 & 0x200000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  v69 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isOrganizationNameMatch];
  v70 = objc_msgSend(v69, "numberWithFloat:");
  [v3 setObject:v70 forKeyedSubscript:@"isOrganizationNameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_33:
    if ((v4 & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  v71 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isPartialNameMatch];
  v72 = objc_msgSend(v71, "numberWithFloat:");
  [v3 setObject:v72 forKeyedSubscript:@"isPartialNameMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 1) == 0)
  {
LABEL_34:
    if ((v4 & 2) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  v73 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isRecent];
  v74 = objc_msgSend(v73, "numberWithFloat:");
  [v3 setObject:v74 forKeyedSubscript:@"isRecent"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 2) == 0)
  {
LABEL_35:
    if ((v4 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  v75 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isRecentInSameDomain];
  v76 = objc_msgSend(v75, "numberWithFloat:");
  [v3 setObject:v76 forKeyedSubscript:@"isRecentInSameDomain"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_36:
    if ((v4 & 8) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  v77 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isRecentInSiriRequest];
  v78 = objc_msgSend(v77, "numberWithFloat:");
  [v3 setObject:v78 forKeyedSubscript:@"isRecentInSiriRequest"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_37:
    if ((v4 & 0x200000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  v79 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isRecentlyCorrected];
  v80 = objc_msgSend(v79, "numberWithFloat:");
  [v3 setObject:v80 forKeyedSubscript:@"isRecentlyCorrected"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x200000000000) == 0)
  {
LABEL_38:
    if ((v4 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  v81 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isRelationAlias];
  v82 = objc_msgSend(v81, "numberWithFloat:");
  [v3 setObject:v82 forKeyedSubscript:@"isRelationAlias"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_39:
    if ((v4 & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  v83 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isSuggested];
  v84 = objc_msgSend(v83, "numberWithFloat:");
  [v3 setObject:v84 forKeyedSubscript:@"isSuggested"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_40:
    if ((v4 & 0x400000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  v85 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self isWeakOrganizationMatch];
  v86 = objc_msgSend(v85, "numberWithFloat:");
  [v3 setObject:v86 forKeyedSubscript:@"isWeakOrganizationMatch"];

  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_41:
    if ((v4 & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  v87 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self numPrimaryTokens];
  v88 = objc_msgSend(v87, "numberWithFloat:");
  [v3 setObject:v88 forKeyedSubscript:@"numPrimaryTokens"];

  LODWORD(v4) = self->_has;
  if ((v4 & 0x10) == 0)
  {
LABEL_42:
    if ((v4 & 0x20) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  v89 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self recencyRank];
  v90 = objc_msgSend(v89, "numberWithFloat:");
  [v3 setObject:v90 forKeyedSubscript:@"recencyRank"];

  LODWORD(v4) = self->_has;
  if ((v4 & 0x20) == 0)
  {
LABEL_43:
    if ((v4 & 0x40) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  v91 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self recencyRankInSameDomain];
  v92 = objc_msgSend(v91, "numberWithFloat:");
  [v3 setObject:v92 forKeyedSubscript:@"recencyRankInSameDomain"];

  LODWORD(v4) = self->_has;
  if ((v4 & 0x40) == 0)
  {
LABEL_44:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  v93 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self recencyRankInSiriRequest];
  v94 = objc_msgSend(v93, "numberWithFloat:");
  [v3 setObject:v94 forKeyedSubscript:@"recencyRankInSiriRequest"];

  LODWORD(v4) = self->_has;
  if ((v4 & 0x2000) == 0)
  {
LABEL_45:
    if ((v4 & 0x800) == 0) {
      goto LABEL_46;
    }
LABEL_93:
    v97 = NSNumber;
    [(INFERENCESchemaINFERENCEContactFeatureSet *)self speechAlternativeRanksGivenNameRank];
    v98 = objc_msgSend(v97, "numberWithFloat:");
    [v3 setObject:v98 forKeyedSubscript:@"speechAlternativeRanksGivenNameRank"];

    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_92:
  v95 = NSNumber;
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self speechAlternativeRanksFamilyNameRank];
  v96 = objc_msgSend(v95, "numberWithFloat:");
  [v3 setObject:v96 forKeyedSubscript:@"speechAlternativeRanksFamilyNameRank"];

  LODWORD(v4) = self->_has;
  if ((v4 & 0x800) != 0) {
    goto LABEL_93;
  }
LABEL_46:
  if ((v4 & 0x1000) != 0)
  {
LABEL_47:
    v5 = NSNumber;
    [(INFERENCESchemaINFERENCEContactFeatureSet *)self speechAlternativeRanksMiddleNameRank];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"speechAlternativeRanksMiddleNameRank"];
  }
LABEL_48:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v7 = v3;

  return v7;
}

- (unint64_t)hash
{
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if (*(unsigned char *)&v3)
  {
    float isRecent = self->_isRecent;
    double v7 = isRecent;
    if (isRecent < 0.0) {
      double v7 = -isRecent;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((v4 & 2) != 0)
  {
    float isRecentInSameDomain = self->_isRecentInSameDomain;
    double v12 = isRecentInSameDomain;
    if (isRecentInSameDomain < 0.0) {
      double v12 = -isRecentInSameDomain;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((v4 & 4) != 0)
  {
    float isRecentInSiriRequest = self->_isRecentInSiriRequest;
    double v17 = isRecentInSiriRequest;
    if (isRecentInSiriRequest < 0.0) {
      double v17 = -isRecentInSiriRequest;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((v4 & 8) != 0)
  {
    float isRecentlyCorrected = self->_isRecentlyCorrected;
    double v22 = isRecentlyCorrected;
    if (isRecentlyCorrected < 0.0) {
      double v22 = -isRecentlyCorrected;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((v4 & 0x10) != 0)
  {
    float recencyRank = self->_recencyRank;
    double v27 = recencyRank;
    if (recencyRank < 0.0) {
      double v27 = -recencyRank;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((v4 & 0x20) != 0)
  {
    float recencyRankInSameDomain = self->_recencyRankInSameDomain;
    double v32 = recencyRankInSameDomain;
    if (recencyRankInSameDomain < 0.0) {
      double v32 = -recencyRankInSameDomain;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((v4 & 0x40) != 0)
  {
    float recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
    double v37 = recencyRankInSiriRequest;
    if (recencyRankInSiriRequest < 0.0) {
      double v37 = -recencyRankInSiriRequest;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  if ((v4 & 0x80) != 0)
  {
    float isHighQualityRequestMatch = self->_isHighQualityRequestMatch;
    double v42 = isHighQualityRequestMatch;
    if (isHighQualityRequestMatch < 0.0) {
      double v42 = -isHighQualityRequestMatch;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  unint64_t v273 = v40;
  if ((v4 & 0x100) != 0)
  {
    float isFavorite = self->_isFavorite;
    double v47 = isFavorite;
    if (isFavorite < 0.0) {
      double v47 = -isFavorite;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v272 = v45;
  if ((v4 & 0x200) != 0)
  {
    float isMeCardRelation = self->_isMeCardRelation;
    double v52 = isMeCardRelation;
    if (isMeCardRelation < 0.0) {
      double v52 = -isMeCardRelation;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  unint64_t v271 = v50;
  if ((v4 & 0x400) != 0)
  {
    float isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
    double v57 = isWeakOrganizationMatch;
    if (isWeakOrganizationMatch < 0.0) {
      double v57 = -isWeakOrganizationMatch;
    }
    long double v58 = floor(v57 + 0.5);
    double v59 = (v57 - v58) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0) {
        v55 += (unint64_t)v59;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    unint64_t v55 = 0;
  }
  unint64_t v270 = v55;
  if ((v4 & 0x800) != 0)
  {
    float speechAlternativeRanksGivenNameRank = self->_speechAlternativeRanksGivenNameRank;
    double v62 = speechAlternativeRanksGivenNameRank;
    if (speechAlternativeRanksGivenNameRank < 0.0) {
      double v62 = -speechAlternativeRanksGivenNameRank;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v60 += (unint64_t)v64;
      }
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v269 = v60;
  if ((v4 & 0x1000) != 0)
  {
    float speechAlternativeRanksMiddleNameRank = self->_speechAlternativeRanksMiddleNameRank;
    double v67 = speechAlternativeRanksMiddleNameRank;
    if (speechAlternativeRanksMiddleNameRank < 0.0) {
      double v67 = -speechAlternativeRanksMiddleNameRank;
    }
    long double v68 = floor(v67 + 0.5);
    double v69 = (v67 - v68) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0) {
        v65 += (unint64_t)v69;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    unint64_t v65 = 0;
  }
  unint64_t v268 = v65;
  if ((v4 & 0x2000) != 0)
  {
    float speechAlternativeRanksFamilyNameRank = self->_speechAlternativeRanksFamilyNameRank;
    double v72 = speechAlternativeRanksFamilyNameRank;
    if (speechAlternativeRanksFamilyNameRank < 0.0) {
      double v72 = -speechAlternativeRanksFamilyNameRank;
    }
    long double v73 = floor(v72 + 0.5);
    double v74 = (v72 - v73) * 1.84467441e19;
    unint64_t v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0) {
        v70 += (unint64_t)v74;
      }
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    unint64_t v70 = 0;
  }
  unint64_t v267 = v70;
  if ((v4 & 0x4000) != 0)
  {
    float freqAnyGroup0MinTo2Min = self->_freqAnyGroup0MinTo2Min;
    double v77 = freqAnyGroup0MinTo2Min;
    if (freqAnyGroup0MinTo2Min < 0.0) {
      double v77 = -freqAnyGroup0MinTo2Min;
    }
    long double v78 = floor(v77 + 0.5);
    double v79 = (v77 - v78) * 1.84467441e19;
    unint64_t v75 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
    if (v79 >= 0.0)
    {
      if (v79 > 0.0) {
        v75 += (unint64_t)v79;
      }
    }
    else
    {
      v75 -= (unint64_t)fabs(v79);
    }
  }
  else
  {
    unint64_t v75 = 0;
  }
  unint64_t v266 = v75;
  if ((v4 & 0x8000) != 0)
  {
    float freqAnyGroup2MinTo10Min = self->_freqAnyGroup2MinTo10Min;
    double v82 = freqAnyGroup2MinTo10Min;
    if (freqAnyGroup2MinTo10Min < 0.0) {
      double v82 = -freqAnyGroup2MinTo10Min;
    }
    long double v83 = floor(v82 + 0.5);
    double v84 = (v82 - v83) * 1.84467441e19;
    unint64_t v80 = 2654435761u * (unint64_t)fmod(v83, 1.84467441e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0) {
        v80 += (unint64_t)v84;
      }
    }
    else
    {
      v80 -= (unint64_t)fabs(v84);
    }
  }
  else
  {
    unint64_t v80 = 0;
  }
  unint64_t v265 = v80;
  if ((v4 & 0x10000) != 0)
  {
    float freqAnyGroup10MinTo1Hr = self->_freqAnyGroup10MinTo1Hr;
    double v87 = freqAnyGroup10MinTo1Hr;
    if (freqAnyGroup10MinTo1Hr < 0.0) {
      double v87 = -freqAnyGroup10MinTo1Hr;
    }
    long double v88 = floor(v87 + 0.5);
    double v89 = (v87 - v88) * 1.84467441e19;
    unint64_t v85 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
    if (v89 >= 0.0)
    {
      if (v89 > 0.0) {
        v85 += (unint64_t)v89;
      }
    }
    else
    {
      v85 -= (unint64_t)fabs(v89);
    }
  }
  else
  {
    unint64_t v85 = 0;
  }
  unint64_t v264 = v85;
  if ((v4 & 0x20000) != 0)
  {
    float freqAnyGroup1HrTo6Hr = self->_freqAnyGroup1HrTo6Hr;
    double v92 = freqAnyGroup1HrTo6Hr;
    if (freqAnyGroup1HrTo6Hr < 0.0) {
      double v92 = -freqAnyGroup1HrTo6Hr;
    }
    long double v93 = floor(v92 + 0.5);
    double v94 = (v92 - v93) * 1.84467441e19;
    unint64_t v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    if (v94 >= 0.0)
    {
      if (v94 > 0.0) {
        v90 += (unint64_t)v94;
      }
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    unint64_t v90 = 0;
  }
  unint64_t v263 = v90;
  if ((v4 & 0x40000) != 0)
  {
    float freqAnyGroup6HrTo1Day = self->_freqAnyGroup6HrTo1Day;
    double v97 = freqAnyGroup6HrTo1Day;
    if (freqAnyGroup6HrTo1Day < 0.0) {
      double v97 = -freqAnyGroup6HrTo1Day;
    }
    long double v98 = floor(v97 + 0.5);
    double v99 = (v97 - v98) * 1.84467441e19;
    unint64_t v95 = 2654435761u * (unint64_t)fmod(v98, 1.84467441e19);
    if (v99 >= 0.0)
    {
      if (v99 > 0.0) {
        v95 += (unint64_t)v99;
      }
    }
    else
    {
      v95 -= (unint64_t)fabs(v99);
    }
  }
  else
  {
    unint64_t v95 = 0;
  }
  unint64_t v262 = v95;
  if ((v4 & 0x80000) != 0)
  {
    float freqAnyGroup1DayTo7Day = self->_freqAnyGroup1DayTo7Day;
    double v102 = freqAnyGroup1DayTo7Day;
    if (freqAnyGroup1DayTo7Day < 0.0) {
      double v102 = -freqAnyGroup1DayTo7Day;
    }
    long double v103 = floor(v102 + 0.5);
    double v104 = (v102 - v103) * 1.84467441e19;
    unint64_t v100 = 2654435761u * (unint64_t)fmod(v103, 1.84467441e19);
    if (v104 >= 0.0)
    {
      if (v104 > 0.0) {
        v100 += (unint64_t)v104;
      }
    }
    else
    {
      v100 -= (unint64_t)fabs(v104);
    }
  }
  else
  {
    unint64_t v100 = 0;
  }
  unint64_t v261 = v100;
  if ((v4 & 0x100000) != 0)
  {
    float freqAnyGroup7DayTo28Day = self->_freqAnyGroup7DayTo28Day;
    double v107 = freqAnyGroup7DayTo28Day;
    if (freqAnyGroup7DayTo28Day < 0.0) {
      double v107 = -freqAnyGroup7DayTo28Day;
    }
    long double v108 = floor(v107 + 0.5);
    double v109 = (v107 - v108) * 1.84467441e19;
    unint64_t v105 = 2654435761u * (unint64_t)fmod(v108, 1.84467441e19);
    if (v109 >= 0.0)
    {
      if (v109 > 0.0) {
        v105 += (unint64_t)v109;
      }
    }
    else
    {
      v105 -= (unint64_t)fabs(v109);
    }
  }
  else
  {
    unint64_t v105 = 0;
  }
  unint64_t v260 = v105;
  if ((v4 & 0x200000) != 0)
  {
    float freqAnyGroup28DayToInf = self->_freqAnyGroup28DayToInf;
    double v112 = freqAnyGroup28DayToInf;
    if (freqAnyGroup28DayToInf < 0.0) {
      double v112 = -freqAnyGroup28DayToInf;
    }
    long double v113 = floor(v112 + 0.5);
    double v114 = (v112 - v113) * 1.84467441e19;
    unint64_t v110 = 2654435761u * (unint64_t)fmod(v113, 1.84467441e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0) {
        v110 += (unint64_t)v114;
      }
    }
    else
    {
      v110 -= (unint64_t)fabs(v114);
    }
  }
  else
  {
    unint64_t v110 = 0;
  }
  unint64_t v259 = v110;
  if ((v4 & 0x400000) != 0)
  {
    float freqSameGroup0MinTo2Min = self->_freqSameGroup0MinTo2Min;
    double v117 = freqSameGroup0MinTo2Min;
    if (freqSameGroup0MinTo2Min < 0.0) {
      double v117 = -freqSameGroup0MinTo2Min;
    }
    long double v118 = floor(v117 + 0.5);
    double v119 = (v117 - v118) * 1.84467441e19;
    unint64_t v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0) {
        v115 += (unint64_t)v119;
      }
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    unint64_t v115 = 0;
  }
  unint64_t v258 = v115;
  if ((v4 & 0x800000) != 0)
  {
    float freqSameGroup2MinTo10Min = self->_freqSameGroup2MinTo10Min;
    double v122 = freqSameGroup2MinTo10Min;
    if (freqSameGroup2MinTo10Min < 0.0) {
      double v122 = -freqSameGroup2MinTo10Min;
    }
    long double v123 = floor(v122 + 0.5);
    double v124 = (v122 - v123) * 1.84467441e19;
    unint64_t v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0) {
        v120 += (unint64_t)v124;
      }
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    unint64_t v120 = 0;
  }
  unint64_t v257 = v120;
  if ((v4 & 0x1000000) != 0)
  {
    float freqSameGroup10MinTo1Hr = self->_freqSameGroup10MinTo1Hr;
    double v127 = freqSameGroup10MinTo1Hr;
    if (freqSameGroup10MinTo1Hr < 0.0) {
      double v127 = -freqSameGroup10MinTo1Hr;
    }
    long double v128 = floor(v127 + 0.5);
    double v129 = (v127 - v128) * 1.84467441e19;
    unint64_t v125 = 2654435761u * (unint64_t)fmod(v128, 1.84467441e19);
    if (v129 >= 0.0)
    {
      if (v129 > 0.0) {
        v125 += (unint64_t)v129;
      }
    }
    else
    {
      v125 -= (unint64_t)fabs(v129);
    }
  }
  else
  {
    unint64_t v125 = 0;
  }
  unint64_t v256 = v125;
  if ((v4 & 0x2000000) != 0)
  {
    float freqSameGroup1HrTo6Hr = self->_freqSameGroup1HrTo6Hr;
    double v132 = freqSameGroup1HrTo6Hr;
    if (freqSameGroup1HrTo6Hr < 0.0) {
      double v132 = -freqSameGroup1HrTo6Hr;
    }
    long double v133 = floor(v132 + 0.5);
    double v134 = (v132 - v133) * 1.84467441e19;
    unint64_t v130 = 2654435761u * (unint64_t)fmod(v133, 1.84467441e19);
    if (v134 >= 0.0)
    {
      if (v134 > 0.0) {
        v130 += (unint64_t)v134;
      }
    }
    else
    {
      v130 -= (unint64_t)fabs(v134);
    }
  }
  else
  {
    unint64_t v130 = 0;
  }
  unint64_t v255 = v130;
  if ((v4 & 0x4000000) != 0)
  {
    float freqSameGroup6HrTo1Day = self->_freqSameGroup6HrTo1Day;
    double v137 = freqSameGroup6HrTo1Day;
    if (freqSameGroup6HrTo1Day < 0.0) {
      double v137 = -freqSameGroup6HrTo1Day;
    }
    long double v138 = floor(v137 + 0.5);
    double v139 = (v137 - v138) * 1.84467441e19;
    unint64_t v135 = 2654435761u * (unint64_t)fmod(v138, 1.84467441e19);
    if (v139 >= 0.0)
    {
      if (v139 > 0.0) {
        v135 += (unint64_t)v139;
      }
    }
    else
    {
      v135 -= (unint64_t)fabs(v139);
    }
  }
  else
  {
    unint64_t v135 = 0;
  }
  unint64_t v254 = v135;
  if ((v4 & 0x8000000) != 0)
  {
    float freqSameGroup1DayTo7Day = self->_freqSameGroup1DayTo7Day;
    double v142 = freqSameGroup1DayTo7Day;
    if (freqSameGroup1DayTo7Day < 0.0) {
      double v142 = -freqSameGroup1DayTo7Day;
    }
    long double v143 = floor(v142 + 0.5);
    double v144 = (v142 - v143) * 1.84467441e19;
    unint64_t v140 = 2654435761u * (unint64_t)fmod(v143, 1.84467441e19);
    if (v144 >= 0.0)
    {
      if (v144 > 0.0) {
        v140 += (unint64_t)v144;
      }
    }
    else
    {
      v140 -= (unint64_t)fabs(v144);
    }
  }
  else
  {
    unint64_t v140 = 0;
  }
  unint64_t v253 = v140;
  if ((v4 & 0x10000000) != 0)
  {
    float freqSameGroup7DayTo28Day = self->_freqSameGroup7DayTo28Day;
    double v147 = freqSameGroup7DayTo28Day;
    if (freqSameGroup7DayTo28Day < 0.0) {
      double v147 = -freqSameGroup7DayTo28Day;
    }
    long double v148 = floor(v147 + 0.5);
    double v149 = (v147 - v148) * 1.84467441e19;
    unint64_t v145 = 2654435761u * (unint64_t)fmod(v148, 1.84467441e19);
    if (v149 >= 0.0)
    {
      if (v149 > 0.0) {
        v145 += (unint64_t)v149;
      }
    }
    else
    {
      v145 -= (unint64_t)fabs(v149);
    }
  }
  else
  {
    unint64_t v145 = 0;
  }
  unint64_t v252 = v145;
  if ((v4 & 0x20000000) != 0)
  {
    float freqSameGroup28DayToInf = self->_freqSameGroup28DayToInf;
    double v152 = freqSameGroup28DayToInf;
    if (freqSameGroup28DayToInf < 0.0) {
      double v152 = -freqSameGroup28DayToInf;
    }
    long double v153 = floor(v152 + 0.5);
    double v154 = (v152 - v153) * 1.84467441e19;
    unint64_t v150 = 2654435761u * (unint64_t)fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      if (v154 > 0.0) {
        v150 += (unint64_t)v154;
      }
    }
    else
    {
      v150 -= (unint64_t)fabs(v154);
    }
  }
  else
  {
    unint64_t v150 = 0;
  }
  unint64_t v251 = v150;
  if ((v4 & 0x40000000) != 0)
  {
    float isSuggested = self->_isSuggested;
    double v157 = isSuggested;
    if (isSuggested < 0.0) {
      double v157 = -isSuggested;
    }
    long double v158 = floor(v157 + 0.5);
    double v159 = (v157 - v158) * 1.84467441e19;
    unint64_t v155 = 2654435761u * (unint64_t)fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      if (v159 > 0.0) {
        v155 += (unint64_t)v159;
      }
    }
    else
    {
      v155 -= (unint64_t)fabs(v159);
    }
  }
  else
  {
    unint64_t v155 = 0;
  }
  unint64_t v250 = v155;
  if ((v4 & 0x80000000) != 0)
  {
    float isHypocorism = self->_isHypocorism;
    double v162 = isHypocorism;
    if (isHypocorism < 0.0) {
      double v162 = -isHypocorism;
    }
    long double v163 = floor(v162 + 0.5);
    double v164 = (v162 - v163) * 1.84467441e19;
    unint64_t v160 = 2654435761u * (unint64_t)fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      if (v164 > 0.0) {
        v160 += (unint64_t)v164;
      }
    }
    else
    {
      v160 -= (unint64_t)fabs(v164);
    }
  }
  else
  {
    unint64_t v160 = 0;
  }
  unint64_t v249 = v160;
  if ((v4 & 0x100000000) != 0)
  {
    float hasSuggestedProperties = self->_hasSuggestedProperties;
    double v167 = hasSuggestedProperties;
    if (hasSuggestedProperties < 0.0) {
      double v167 = -hasSuggestedProperties;
    }
    long double v168 = floor(v167 + 0.5);
    double v169 = (v167 - v168) * 1.84467441e19;
    unint64_t v165 = 2654435761u * (unint64_t)fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      if (v169 > 0.0) {
        v165 += (unint64_t)v169;
      }
    }
    else
    {
      v165 -= (unint64_t)fabs(v169);
    }
  }
  else
  {
    unint64_t v165 = 0;
  }
  unint64_t v248 = v165;
  if ((v4 & 0x200000000) != 0)
  {
    float isPartialNameMatch = self->_isPartialNameMatch;
    double v172 = isPartialNameMatch;
    if (isPartialNameMatch < 0.0) {
      double v172 = -isPartialNameMatch;
    }
    long double v173 = floor(v172 + 0.5);
    double v174 = (v172 - v173) * 1.84467441e19;
    unint64_t v170 = 2654435761u * (unint64_t)fmod(v173, 1.84467441e19);
    if (v174 >= 0.0)
    {
      if (v174 > 0.0) {
        v170 += (unint64_t)v174;
      }
    }
    else
    {
      v170 -= (unint64_t)fabs(v174);
    }
  }
  else
  {
    unint64_t v170 = 0;
  }
  unint64_t v247 = v170;
  if ((v4 & 0x400000000) != 0)
  {
    float numPrimaryTokens = self->_numPrimaryTokens;
    double v177 = numPrimaryTokens;
    if (numPrimaryTokens < 0.0) {
      double v177 = -numPrimaryTokens;
    }
    long double v178 = floor(v177 + 0.5);
    double v179 = (v177 - v178) * 1.84467441e19;
    unint64_t v175 = 2654435761u * (unint64_t)fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      if (v179 > 0.0) {
        v175 += (unint64_t)v179;
      }
    }
    else
    {
      v175 -= (unint64_t)fabs(v179);
    }
  }
  else
  {
    unint64_t v175 = 0;
  }
  unint64_t v246 = v175;
  if ((v4 & 0x800000000) != 0)
  {
    float allQueryMatched = self->_allQueryMatched;
    double v182 = allQueryMatched;
    if (allQueryMatched < 0.0) {
      double v182 = -allQueryMatched;
    }
    long double v183 = floor(v182 + 0.5);
    double v184 = (v182 - v183) * 1.84467441e19;
    unint64_t v180 = 2654435761u * (unint64_t)fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      if (v184 > 0.0) {
        v180 += (unint64_t)v184;
      }
    }
    else
    {
      v180 -= (unint64_t)fabs(v184);
    }
  }
  else
  {
    unint64_t v180 = 0;
  }
  unint64_t v245 = v180;
  if ((v4 & 0x1000000000) != 0)
  {
    float allPrimaryNameTokensAreInQuery = self->_allPrimaryNameTokensAreInQuery;
    double v187 = allPrimaryNameTokensAreInQuery;
    if (allPrimaryNameTokensAreInQuery < 0.0) {
      double v187 = -allPrimaryNameTokensAreInQuery;
    }
    long double v188 = floor(v187 + 0.5);
    double v189 = (v187 - v188) * 1.84467441e19;
    unint64_t v185 = 2654435761u * (unint64_t)fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      if (v189 > 0.0) {
        v185 += (unint64_t)v189;
      }
    }
    else
    {
      v185 -= (unint64_t)fabs(v189);
    }
  }
  else
  {
    unint64_t v185 = 0;
  }
  unint64_t v244 = v185;
  if ((v4 & 0x2000000000) != 0)
  {
    float isGivenNameMatch = self->_isGivenNameMatch;
    double v192 = isGivenNameMatch;
    if (isGivenNameMatch < 0.0) {
      double v192 = -isGivenNameMatch;
    }
    long double v193 = floor(v192 + 0.5);
    double v194 = (v192 - v193) * 1.84467441e19;
    unint64_t v190 = 2654435761u * (unint64_t)fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      if (v194 > 0.0) {
        v190 += (unint64_t)v194;
      }
    }
    else
    {
      v190 -= (unint64_t)fabs(v194);
    }
  }
  else
  {
    unint64_t v190 = 0;
  }
  unint64_t v243 = v190;
  if ((v4 & 0x4000000000) != 0)
  {
    float isMiddleNameMatch = self->_isMiddleNameMatch;
    double v197 = isMiddleNameMatch;
    if (isMiddleNameMatch < 0.0) {
      double v197 = -isMiddleNameMatch;
    }
    long double v198 = floor(v197 + 0.5);
    double v199 = (v197 - v198) * 1.84467441e19;
    unint64_t v195 = 2654435761u * (unint64_t)fmod(v198, 1.84467441e19);
    if (v199 >= 0.0)
    {
      if (v199 > 0.0) {
        v195 += (unint64_t)v199;
      }
    }
    else
    {
      v195 -= (unint64_t)fabs(v199);
    }
  }
  else
  {
    unint64_t v195 = 0;
  }
  unint64_t v242 = v195;
  if ((v4 & 0x8000000000) != 0)
  {
    float isFamilyNameMatch = self->_isFamilyNameMatch;
    double v202 = isFamilyNameMatch;
    if (isFamilyNameMatch < 0.0) {
      double v202 = -isFamilyNameMatch;
    }
    long double v203 = floor(v202 + 0.5);
    double v204 = (v202 - v203) * 1.84467441e19;
    unint64_t v200 = 2654435761u * (unint64_t)fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      if (v204 > 0.0) {
        v200 += (unint64_t)v204;
      }
    }
    else
    {
      v200 -= (unint64_t)fabs(v204);
    }
  }
  else
  {
    unint64_t v200 = 0;
  }
  unint64_t v241 = v200;
  if ((v4 & 0x10000000000) != 0)
  {
    float isOrganizationNameMatch = self->_isOrganizationNameMatch;
    double v207 = isOrganizationNameMatch;
    if (isOrganizationNameMatch < 0.0) {
      double v207 = -isOrganizationNameMatch;
    }
    long double v208 = floor(v207 + 0.5);
    double v209 = (v207 - v208) * 1.84467441e19;
    unint64_t v205 = 2654435761u * (unint64_t)fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      if (v209 > 0.0) {
        v205 += (unint64_t)v209;
      }
    }
    else
    {
      v205 -= (unint64_t)fabs(v209);
    }
  }
  else
  {
    unint64_t v205 = 0;
  }
  unint64_t v240 = v205;
  unint64_t v276 = v20;
  if ((v4 & 0x20000000000) != 0)
  {
    float isNicknameMatch = self->_isNicknameMatch;
    double v212 = isNicknameMatch;
    if (isNicknameMatch < 0.0) {
      double v212 = -isNicknameMatch;
    }
    long double v213 = floor(v212 + 0.5);
    double v214 = (v212 - v213) * 1.84467441e19;
    unint64_t v210 = 2654435761u * (unint64_t)fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      if (v214 > 0.0) {
        v210 += (unint64_t)v214;
      }
    }
    else
    {
      v210 -= (unint64_t)fabs(v214);
    }
  }
  else
  {
    unint64_t v210 = 0;
  }
  unint64_t v239 = v210;
  unint64_t v275 = v5;
  if ((v4 & 0x40000000000) != 0)
  {
    float isNamePrefixMatch = self->_isNamePrefixMatch;
    double v217 = isNamePrefixMatch;
    if (isNamePrefixMatch < 0.0) {
      double v217 = -isNamePrefixMatch;
    }
    long double v218 = floor(v217 + 0.5);
    double v219 = (v217 - v218) * 1.84467441e19;
    unint64_t v215 = 2654435761u * (unint64_t)fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      if (v219 > 0.0) {
        v215 += (unint64_t)v219;
      }
    }
    else
    {
      v215 -= (unint64_t)fabs(v219);
    }
  }
  else
  {
    unint64_t v215 = 0;
  }
  unint64_t v274 = v35;
  if ((v4 & 0x80000000000) != 0)
  {
    float isNameSuffixMatch = self->_isNameSuffixMatch;
    double v224 = isNameSuffixMatch;
    if (isNameSuffixMatch < 0.0) {
      double v224 = -isNameSuffixMatch;
    }
    long double v225 = floor(v224 + 0.5);
    double v226 = (v224 - v225) * 1.84467441e19;
    unint64_t v222 = 2654435761u * (unint64_t)fmod(v225, 1.84467441e19);
    unint64_t v220 = v30;
    unint64_t v221 = v25;
    if (v226 >= 0.0)
    {
      if (v226 > 0.0) {
        v222 += (unint64_t)v226;
      }
    }
    else
    {
      v222 -= (unint64_t)fabs(v226);
    }
  }
  else
  {
    unint64_t v220 = v30;
    unint64_t v221 = v25;
    unint64_t v222 = 0;
  }
  unint64_t v227 = v10;
  if ((v4 & 0x100000000000) != 0)
  {
    float allHandlesMatched = self->_allHandlesMatched;
    double v230 = allHandlesMatched;
    if (allHandlesMatched < 0.0) {
      double v230 = -allHandlesMatched;
    }
    long double v231 = floor(v230 + 0.5);
    double v232 = (v230 - v231) * 1.84467441e19;
    unint64_t v228 = 2654435761u * (unint64_t)fmod(v231, 1.84467441e19);
    if (v232 >= 0.0)
    {
      if (v232 > 0.0) {
        v228 += (unint64_t)v232;
      }
    }
    else
    {
      v228 -= (unint64_t)fabs(v232);
    }
  }
  else
  {
    unint64_t v228 = 0;
  }
  if ((v4 & 0x200000000000) != 0)
  {
    float isRelationAlias = self->_isRelationAlias;
    double v235 = isRelationAlias;
    if (isRelationAlias < 0.0) {
      double v235 = -isRelationAlias;
    }
    long double v236 = floor(v235 + 0.5);
    double v237 = (v235 - v236) * 1.84467441e19;
    unint64_t v233 = 2654435761u * (unint64_t)fmod(v236, 1.84467441e19);
    if (v237 >= 0.0)
    {
      if (v237 > 0.0) {
        v233 += (unint64_t)v237;
      }
    }
    else
    {
      v233 -= (unint64_t)fabs(v237);
    }
  }
  else
  {
    unint64_t v233 = 0;
  }
  return v227 ^ v275 ^ v15 ^ v276 ^ v221 ^ v220 ^ v274 ^ v273 ^ v272 ^ v271 ^ v270 ^ v269 ^ v268 ^ v267 ^ v266 ^ v265 ^ v264 ^ v263 ^ v262 ^ v261 ^ v260 ^ v259 ^ v258 ^ v257 ^ v256 ^ v255 ^ v254 ^ v253 ^ v252 ^ v251 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v215 ^ v222 ^ v228 ^ v233;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_187;
  }
  $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  uint64_t v6 = v4[48];
  if ((*(_DWORD *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_187;
  }
  if (*(unsigned char *)&v5)
  {
    float isRecent = self->_isRecent;
    [v4 isRecent];
    if (isRecent != v10) {
      goto LABEL_187;
    }
    $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
    LODWORD(v6) = v4[48];
  }
  else
  {
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v6 | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
  }
  unsigned int v11 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v11 == ((v6 >> 1) & 1))
  {
    if (v11)
    {
      float isRecentInSameDomain = self->_isRecentInSameDomain;
      [v4 isRecentInSameDomain];
      if (isRecentInSameDomain != v13) {
        goto LABEL_187;
      }
      $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
      unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
      unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
      LODWORD(v6) = v4[48];
    }
    unsigned int v14 = (*(_DWORD *)&v5 >> 2) & 1;
    if (v14 == ((v6 >> 2) & 1))
    {
      if (v14)
      {
        float isRecentInSiriRequest = self->_isRecentInSiriRequest;
        [v4 isRecentInSiriRequest];
        if (isRecentInSiriRequest != v16) {
          goto LABEL_187;
        }
        $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
        unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
        unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
        LODWORD(v6) = v4[48];
      }
      unsigned int v17 = (*(_DWORD *)&v5 >> 3) & 1;
      if (v17 == ((v6 >> 3) & 1))
      {
        if (v17)
        {
          float isRecentlyCorrected = self->_isRecentlyCorrected;
          [v4 isRecentlyCorrected];
          if (isRecentlyCorrected != v19) {
            goto LABEL_187;
          }
          $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
          unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
          unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
          LODWORD(v6) = v4[48];
        }
        unsigned int v20 = (*(_DWORD *)&v5 >> 4) & 1;
        if (v20 == ((v6 >> 4) & 1))
        {
          if (v20)
          {
            float recencyRank = self->_recencyRank;
            [v4 recencyRank];
            if (recencyRank != v22) {
              goto LABEL_187;
            }
            $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
            unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
            unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
            LODWORD(v6) = v4[48];
          }
          unsigned int v23 = (*(_DWORD *)&v5 >> 5) & 1;
          if (v23 == ((v6 >> 5) & 1))
          {
            if (v23)
            {
              float recencyRankInSameDomain = self->_recencyRankInSameDomain;
              [v4 recencyRankInSameDomain];
              if (recencyRankInSameDomain != v25) {
                goto LABEL_187;
              }
              $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
              unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
              unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
              LODWORD(v6) = v4[48];
            }
            unsigned int v26 = (*(_DWORD *)&v5 >> 6) & 1;
            if (v26 == ((v6 >> 6) & 1))
            {
              if (v26)
              {
                float recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
                [v4 recencyRankInSiriRequest];
                if (recencyRankInSiriRequest != v28) {
                  goto LABEL_187;
                }
                $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                LODWORD(v6) = v4[48];
              }
              unsigned int v29 = (*(_DWORD *)&v5 >> 7) & 1;
              if (v29 == ((v6 >> 7) & 1))
              {
                if (v29)
                {
                  float isHighQualityRequestMatch = self->_isHighQualityRequestMatch;
                  [v4 isHighQualityRequestMatch];
                  if (isHighQualityRequestMatch != v31) {
                    goto LABEL_187;
                  }
                  $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                  unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                  unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                  LODWORD(v6) = v4[48];
                }
                unsigned int v32 = (*(_DWORD *)&v5 >> 8) & 1;
                if (v32 == ((v6 >> 8) & 1))
                {
                  if (v32)
                  {
                    float isFavorite = self->_isFavorite;
                    [v4 isFavorite];
                    if (isFavorite != v34) {
                      goto LABEL_187;
                    }
                    $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                    unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                    LODWORD(v6) = v4[48];
                  }
                  unsigned int v35 = (*(_DWORD *)&v5 >> 9) & 1;
                  if (v35 == ((v6 >> 9) & 1))
                  {
                    if (v35)
                    {
                      float isMeCardRelation = self->_isMeCardRelation;
                      [v4 isMeCardRelation];
                      if (isMeCardRelation != v37) {
                        goto LABEL_187;
                      }
                      $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                      unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                      unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                      LODWORD(v6) = v4[48];
                    }
                    unsigned int v38 = (*(_DWORD *)&v5 >> 10) & 1;
                    if (v38 == ((v6 >> 10) & 1))
                    {
                      if (v38)
                      {
                        float isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
                        [v4 isWeakOrganizationMatch];
                        if (isWeakOrganizationMatch != v40) {
                          goto LABEL_187;
                        }
                        $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                        unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                        unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                        LODWORD(v6) = v4[48];
                      }
                      unsigned int v41 = (*(_DWORD *)&v5 >> 11) & 1;
                      if (v41 == ((v6 >> 11) & 1))
                      {
                        if (v41)
                        {
                          float speechAlternativeRanksGivenNameRank = self->_speechAlternativeRanksGivenNameRank;
                          [v4 speechAlternativeRanksGivenNameRank];
                          if (speechAlternativeRanksGivenNameRank != v43) {
                            goto LABEL_187;
                          }
                          $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                          unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                          unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                          LODWORD(v6) = v4[48];
                        }
                        unsigned int v44 = (*(_DWORD *)&v5 >> 12) & 1;
                        if (v44 == ((v6 >> 12) & 1))
                        {
                          if (v44)
                          {
                            float speechAlternativeRanksMiddleNameRank = self->_speechAlternativeRanksMiddleNameRank;
                            [v4 speechAlternativeRanksMiddleNameRank];
                            if (speechAlternativeRanksMiddleNameRank != v46) {
                              goto LABEL_187;
                            }
                            $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                            unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                            unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                            LODWORD(v6) = v4[48];
                          }
                          unsigned int v47 = (*(_DWORD *)&v5 >> 13) & 1;
                          if (v47 == ((v6 >> 13) & 1))
                          {
                            if (v47)
                            {
                              float speechAlternativeRanksFamilyNameRank = self->_speechAlternativeRanksFamilyNameRank;
                              [v4 speechAlternativeRanksFamilyNameRank];
                              if (speechAlternativeRanksFamilyNameRank != v49) {
                                goto LABEL_187;
                              }
                              $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                              unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                              unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                              LODWORD(v6) = v4[48];
                            }
                            unsigned int v50 = (*(_DWORD *)&v5 >> 14) & 1;
                            if (v50 == ((v6 >> 14) & 1))
                            {
                              if (v50)
                              {
                                float freqAnyGroup0MinTo2Min = self->_freqAnyGroup0MinTo2Min;
                                [v4 freqAnyGroup0MinTo2Min];
                                if (freqAnyGroup0MinTo2Min != v52) {
                                  goto LABEL_187;
                                }
                                $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                LODWORD(v6) = v4[48];
                              }
                              unsigned int v53 = (*(_DWORD *)&v5 >> 15) & 1;
                              if (v53 == ((v6 >> 15) & 1))
                              {
                                if (v53)
                                {
                                  float freqAnyGroup2MinTo10Min = self->_freqAnyGroup2MinTo10Min;
                                  [v4 freqAnyGroup2MinTo10Min];
                                  if (freqAnyGroup2MinTo10Min != v55) {
                                    goto LABEL_187;
                                  }
                                  $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                  unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                  unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                  LODWORD(v6) = v4[48];
                                }
                                unsigned int v56 = HIWORD(*(_DWORD *)&v5) & 1;
                                if (v56 == (WORD1(v6) & 1))
                                {
                                  if (v56)
                                  {
                                    float freqAnyGroup10MinTo1Hr = self->_freqAnyGroup10MinTo1Hr;
                                    [v4 freqAnyGroup10MinTo1Hr];
                                    if (freqAnyGroup10MinTo1Hr != v58) {
                                      goto LABEL_187;
                                    }
                                    $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                    unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                    LODWORD(v6) = v4[48];
                                  }
                                  unsigned int v59 = (*(_DWORD *)&v5 >> 17) & 1;
                                  if (v59 == ((v6 >> 17) & 1))
                                  {
                                    if (v59)
                                    {
                                      float freqAnyGroup1HrTo6Hr = self->_freqAnyGroup1HrTo6Hr;
                                      [v4 freqAnyGroup1HrTo6Hr];
                                      if (freqAnyGroup1HrTo6Hr != v61) {
                                        goto LABEL_187;
                                      }
                                      $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                      unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                      unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                      LODWORD(v6) = v4[48];
                                    }
                                    unsigned int v62 = (*(_DWORD *)&v5 >> 18) & 1;
                                    if (v62 == ((v6 >> 18) & 1))
                                    {
                                      if (v62)
                                      {
                                        float freqAnyGroup6HrTo1Day = self->_freqAnyGroup6HrTo1Day;
                                        [v4 freqAnyGroup6HrTo1Day];
                                        if (freqAnyGroup6HrTo1Day != v64) {
                                          goto LABEL_187;
                                        }
                                        $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                        unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                        unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                        LODWORD(v6) = v4[48];
                                      }
                                      unsigned int v65 = (*(_DWORD *)&v5 >> 19) & 1;
                                      if (v65 == ((v6 >> 19) & 1))
                                      {
                                        if (v65)
                                        {
                                          float freqAnyGroup1DayTo7Day = self->_freqAnyGroup1DayTo7Day;
                                          [v4 freqAnyGroup1DayTo7Day];
                                          if (freqAnyGroup1DayTo7Day != v67) {
                                            goto LABEL_187;
                                          }
                                          $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                          unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                          unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                          LODWORD(v6) = v4[48];
                                        }
                                        unsigned int v68 = (*(_DWORD *)&v5 >> 20) & 1;
                                        if (v68 == ((v6 >> 20) & 1))
                                        {
                                          if (v68)
                                          {
                                            float freqAnyGroup7DayTo28Day = self->_freqAnyGroup7DayTo28Day;
                                            [v4 freqAnyGroup7DayTo28Day];
                                            if (freqAnyGroup7DayTo28Day != v70) {
                                              goto LABEL_187;
                                            }
                                            $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                            unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                     + 2) << 32);
                                            unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                            LODWORD(v6) = v4[48];
                                          }
                                          unsigned int v71 = (*(_DWORD *)&v5 >> 21) & 1;
                                          if (v71 == ((v6 >> 21) & 1))
                                          {
                                            if (v71)
                                            {
                                              float freqAnyGroup28DayToInf = self->_freqAnyGroup28DayToInf;
                                              [v4 freqAnyGroup28DayToInf];
                                              if (freqAnyGroup28DayToInf != v73) {
                                                goto LABEL_187;
                                              }
                                              $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                              unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                       + 2) << 32);
                                              unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                              LODWORD(v6) = v4[48];
                                            }
                                            unsigned int v74 = (*(_DWORD *)&v5 >> 22) & 1;
                                            if (v74 == ((v6 >> 22) & 1))
                                            {
                                              if (v74)
                                              {
                                                float freqSameGroup0MinTo2Min = self->_freqSameGroup0MinTo2Min;
                                                [v4 freqSameGroup0MinTo2Min];
                                                if (freqSameGroup0MinTo2Min != v76) {
                                                  goto LABEL_187;
                                                }
                                                $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                         + 2) << 32);
                                                unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                LODWORD(v6) = v4[48];
                                              }
                                              unsigned int v77 = (*(_DWORD *)&v5 >> 23) & 1;
                                              if (v77 == ((v6 >> 23) & 1))
                                              {
                                                if (v77)
                                                {
                                                  float freqSameGroup2MinTo10Min = self->_freqSameGroup2MinTo10Min;
                                                  [v4 freqSameGroup2MinTo10Min];
                                                  if (freqSameGroup2MinTo10Min != v79) {
                                                    goto LABEL_187;
                                                  }
                                                  $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                  unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                           + 2) << 32);
                                                  unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                  LODWORD(v6) = v4[48];
                                                }
                                                unsigned int v80 = HIBYTE(*(_DWORD *)&v5) & 1;
                                                if (v80 == (BYTE3(v6) & 1))
                                                {
                                                  if (v80)
                                                  {
                                                    float freqSameGroup10MinTo1Hr = self->_freqSameGroup10MinTo1Hr;
                                                    [v4 freqSameGroup10MinTo1Hr];
                                                    if (freqSameGroup10MinTo1Hr != v82) {
                                                      goto LABEL_187;
                                                    }
                                                    $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                             + 2) << 32);
                                                    unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                    LODWORD(v6) = v4[48];
                                                  }
                                                  unsigned int v83 = (*(_DWORD *)&v5 >> 25) & 1;
                                                  if (v83 == ((v6 >> 25) & 1))
                                                  {
                                                    if (v83)
                                                    {
                                                      float freqSameGroup1HrTo6Hr = self->_freqSameGroup1HrTo6Hr;
                                                      [v4 freqSameGroup1HrTo6Hr];
                                                      if (freqSameGroup1HrTo6Hr != v85) {
                                                        goto LABEL_187;
                                                      }
                                                      $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                      unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                               + 2) << 32);
                                                      unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                      LODWORD(v6) = v4[48];
                                                    }
                                                    unsigned int v86 = (*(_DWORD *)&v5 >> 26) & 1;
                                                    if (v86 == ((v6 >> 26) & 1))
                                                    {
                                                      if (v86)
                                                      {
                                                        float freqSameGroup6HrTo1Day = self->_freqSameGroup6HrTo1Day;
                                                        [v4 freqSameGroup6HrTo1Day];
                                                        if (freqSameGroup6HrTo1Day != v88) {
                                                          goto LABEL_187;
                                                        }
                                                        $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                        unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has
                                                                                                 + 2) << 32);
                                                        unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                        LODWORD(v6) = v4[48];
                                                      }
                                                      unsigned int v89 = (*(_DWORD *)&v5 >> 27) & 1;
                                                      if (v89 == ((v6 >> 27) & 1))
                                                      {
                                                        if (v89)
                                                        {
                                                          float freqSameGroup1DayTo7Day = self->_freqSameGroup1DayTo7Day;
                                                          [v4 freqSameGroup1DayTo7Day];
                                                          if (freqSameGroup1DayTo7Day != v91) {
                                                            goto LABEL_187;
                                                          }
                                                          $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                          unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                          unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4 + 98) << 32);
                                                          LODWORD(v6) = v4[48];
                                                        }
                                                        unsigned int v92 = (*(_DWORD *)&v5 >> 28) & 1;
                                                        if (v92 == ((v6 >> 28) & 1))
                                                        {
                                                          if (v92)
                                                          {
                                                            float freqSameGroup7DayTo28Day = self->_freqSameGroup7DayTo28Day;
                                                            [v4 freqSameGroup7DayTo28Day];
                                                            if (freqSameGroup7DayTo28Day != v94) {
                                                              goto LABEL_187;
                                                            }
                                                            $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                            unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                            unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                             + 98) << 32);
                                                            LODWORD(v6) = v4[48];
                                                          }
                                                          unsigned int v95 = (*(_DWORD *)&v5 >> 29) & 1;
                                                          if (v95 == ((v6 >> 29) & 1))
                                                          {
                                                            if (v95)
                                                            {
                                                              float freqSameGroup28DayToInf = self->_freqSameGroup28DayToInf;
                                                              [v4 freqSameGroup28DayToInf];
                                                              if (freqSameGroup28DayToInf != v97) {
                                                                goto LABEL_187;
                                                              }
                                                              $84752DCADCC9A46F675661ABABD0E080 v5 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
                                                              unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                              unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                               + 98) << 32);
                                                              LODWORD(v6) = v4[48];
                                                            }
                                                            unsigned int v98 = (*(_DWORD *)&v5 >> 30) & 1;
                                                            if (v98 == ((v6 >> 30) & 1))
                                                            {
                                                              if (v98)
                                                              {
                                                                float isSuggested = self->_isSuggested;
                                                                [v4 isSuggested];
                                                                if (isSuggested != v100) {
                                                                  goto LABEL_187;
                                                                }
                                                                unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
                                                                unint64_t v8 = v4[48] | ((unint64_t)*((unsigned __int16 *)v4
                                                                                                 + 98) << 32);
                                                              }
                                                              if (((v8 ^ v7) & 0x80000000) == 0)
                                                              {
                                                                if ((v7 & 0x80000000) != 0)
                                                                {
                                                                  float isHypocorism = self->_isHypocorism;
                                                                  [v4 isHypocorism];
                                                                  if (isHypocorism != v126) {
                                                                    goto LABEL_187;
                                                                  }
                                                                  unsigned int v101 = *((unsigned __int16 *)v4 + 98);
                                                                  LODWORD(v102) = v101 >> 1;
                                                                  LODWORD(v103) = v101 >> 2;
                                                                  LODWORD(v104) = v101 >> 3;
                                                                  uint64_t v105 = v101 >> 4;
                                                                  uint64_t v106 = v101 >> 5;
                                                                  LODWORD(v107) = v101 >> 6;
                                                                  LODWORD(v108) = v101 >> 7;
                                                                  unsigned int v109 = v101 >> 8;
                                                                  LODWORD(v110) = v101 >> 9;
                                                                  LODWORD(v111) = v101 >> 10;
                                                                  unsigned int v127 = *((unsigned __int16 *)&self->_has + 2);
                                                                  LODWORD(v112) = v127 >> 1;
                                                                  LODWORD(v113) = v127 >> 2;
                                                                  LODWORD(v184) = v101 >> 11;
                                                                  LODWORD(v185) = v101 >> 12;
                                                                  LODWORD(v114) = v127 >> 3;
                                                                  LODWORD(v186) = v101 >> 13;
                                                                  LODWORD(v115) = v127 >> 4;
                                                                  LODWORD(v116) = v127 >> 5;
                                                                  uint64_t v117 = v127 >> 6;
                                                                  uint64_t v118 = v127 >> 7;
                                                                  uint64_t v119 = v127 >> 8;
                                                                  uint64_t v120 = v127 >> 9;
                                                                  LODWORD(v121) = v127 >> 10;
                                                                  LODWORD(v122) = v127 >> 11;
                                                                  LODWORD(v123) = v127 >> 12;
                                                                  LOWORD(v8) = *((_WORD *)&self->_has + 2);
                                                                  LODWORD(v124) = v127 >> 13;
                                                                }
                                                                else
                                                                {
                                                                  LOBYTE(v101) = BYTE4(v8);
                                                                  uint64_t v102 = (v8 >> 33) & 0x7FFF;
                                                                  uint64_t v103 = (v8 >> 34) & 0x3FFF;
                                                                  uint64_t v104 = (v8 >> 35) & 0x1FFF;
                                                                  uint64_t v105 = (v8 >> 36) & 0xFFF;
                                                                  uint64_t v106 = (v8 >> 37) & 0x7FF;
                                                                  uint64_t v107 = (v8 >> 38) & 0x3FF;
                                                                  uint64_t v108 = (v8 >> 39) & 0x1FF;
                                                                  LOBYTE(v109) = BYTE5(v8);
                                                                  uint64_t v110 = (v8 >> 41) & 0x7F;
                                                                  uint64_t v111 = (v8 >> 42) & 0x3F;
                                                                  uint64_t v184 = (v8 >> 43) & 0x1F;
                                                                  uint64_t v185 = (v8 >> 44) & 0xF;
                                                                  uint64_t v186 = (v8 >> 45) & 7;
                                                                  LOBYTE(v8) = BYTE4(v7);
                                                                  uint64_t v112 = (v7 >> 33) & 0x7FFF;
                                                                  uint64_t v113 = (v7 >> 34) & 0x3FFF;
                                                                  uint64_t v114 = (v7 >> 35) & 0x1FFF;
                                                                  uint64_t v115 = (v7 >> 36) & 0xFFF;
                                                                  uint64_t v116 = (v7 >> 37) & 0x7FF;
                                                                  uint64_t v117 = (v7 >> 38) & 0x3FF;
                                                                  uint64_t v118 = (v7 >> 39) & 0x1FF;
                                                                  uint64_t v119 = BYTE5(v7);
                                                                  uint64_t v120 = (v7 >> 41) & 0x7F;
                                                                  uint64_t v121 = (v7 >> 42) & 0x3F;
                                                                  uint64_t v122 = (v7 >> 43) & 0x1F;
                                                                  uint64_t v123 = (v7 >> 44) & 0xF;
                                                                  uint64_t v124 = (v7 >> 45) & 7;
                                                                }
                                                                int v128 = v8 & 1;
                                                                if (v128 == (v101 & 1))
                                                                {
                                                                  if (v128)
                                                                  {
                                                                    float hasSuggestedProperties = self->_hasSuggestedProperties;
                                                                    objc_msgSend(v4, "hasSuggestedProperties", v120, v119, v106, v118, v105, v117);
                                                                    if (hasSuggestedProperties != v130) {
                                                                      goto LABEL_187;
                                                                    }
                                                                    unsigned int v131 = *((unsigned __int16 *)v4 + 98);
                                                                    LODWORD(v102) = v131 >> 1;
                                                                    LODWORD(v103) = v131 >> 2;
                                                                    LODWORD(v104) = v131 >> 3;
                                                                    uint64_t v105 = v131 >> 4;
                                                                    uint64_t v106 = v131 >> 5;
                                                                    LODWORD(v107) = v131 >> 6;
                                                                    LODWORD(v108) = v131 >> 7;
                                                                    unsigned int v109 = v131 >> 8;
                                                                    LODWORD(v110) = v131 >> 9;
                                                                    LODWORD(v111) = v131 >> 10;
                                                                    unsigned int v132 = *((unsigned __int16 *)&self->_has + 2);
                                                                    LODWORD(v112) = v132 >> 1;
                                                                    LODWORD(v184) = v131 >> 11;
                                                                    LODWORD(v185) = v131 >> 12;
                                                                    LODWORD(v113) = v132 >> 2;
                                                                    LODWORD(v186) = v131 >> 13;
                                                                    LODWORD(v114) = v132 >> 3;
                                                                    LODWORD(v115) = v132 >> 4;
                                                                    LODWORD(v116) = v132 >> 5;
                                                                    uint64_t v117 = v132 >> 6;
                                                                    uint64_t v118 = v132 >> 7;
                                                                    uint64_t v119 = v132 >> 8;
                                                                    uint64_t v120 = v132 >> 9;
                                                                    LODWORD(v121) = v132 >> 10;
                                                                    LODWORD(v122) = v132 >> 11;
                                                                    LODWORD(v123) = v132 >> 12;
                                                                    LODWORD(v124) = v132 >> 13;
                                                                  }
                                                                  if ((v112 & 1) == (v102 & 1))
                                                                  {
                                                                    if (v112)
                                                                    {
                                                                      float isPartialNameMatch = self->_isPartialNameMatch;
                                                                      objc_msgSend(v4, "isPartialNameMatch", v120, v119, v106, v118, v105, v117);
                                                                      if (isPartialNameMatch != v134) {
                                                                        goto LABEL_187;
                                                                      }
                                                                      unsigned int v135 = *((unsigned __int16 *)v4 + 98);
                                                                      LODWORD(v103) = v135 >> 2;
                                                                      LODWORD(v104) = v135 >> 3;
                                                                      uint64_t v105 = v135 >> 4;
                                                                      uint64_t v106 = v135 >> 5;
                                                                      LODWORD(v107) = v135 >> 6;
                                                                      LODWORD(v108) = v135 >> 7;
                                                                      unsigned int v109 = v135 >> 8;
                                                                      LODWORD(v110) = v135 >> 9;
                                                                      LODWORD(v111) = v135 >> 10;
                                                                      unsigned int v136 = *((unsigned __int16 *)&self->_has + 2);
                                                                      LODWORD(v113) = v136 >> 2;
                                                                      LODWORD(v114) = v136 >> 3;
                                                                      LODWORD(v184) = v135 >> 11;
                                                                      LODWORD(v185) = v135 >> 12;
                                                                      LODWORD(v186) = v135 >> 13;
                                                                      LODWORD(v115) = v136 >> 4;
                                                                      LODWORD(v116) = v136 >> 5;
                                                                      uint64_t v117 = v136 >> 6;
                                                                      uint64_t v118 = v136 >> 7;
                                                                      uint64_t v119 = v136 >> 8;
                                                                      uint64_t v120 = v136 >> 9;
                                                                      LODWORD(v121) = v136 >> 10;
                                                                      LODWORD(v122) = v136 >> 11;
                                                                      LODWORD(v123) = v136 >> 12;
                                                                      LODWORD(v124) = v136 >> 13;
                                                                    }
                                                                    if ((v113 & 1) == (v103 & 1))
                                                                    {
                                                                      if (v113)
                                                                      {
                                                                        float numPrimaryTokens = self->_numPrimaryTokens;
                                                                        objc_msgSend(v4, "numPrimaryTokens", v120, v119, v106, v118, v105, v117);
                                                                        if (numPrimaryTokens != v138) {
                                                                          goto LABEL_187;
                                                                        }
                                                                        unsigned int v139 = *((unsigned __int16 *)v4 + 98);
                                                                        LODWORD(v104) = v139 >> 3;
                                                                        uint64_t v105 = v139 >> 4;
                                                                        uint64_t v106 = v139 >> 5;
                                                                        LODWORD(v107) = v139 >> 6;
                                                                        LODWORD(v108) = v139 >> 7;
                                                                        unsigned int v109 = v139 >> 8;
                                                                        LODWORD(v110) = v139 >> 9;
                                                                        LODWORD(v111) = v139 >> 10;
                                                                        unsigned int v140 = *((unsigned __int16 *)&self->_has + 2);
                                                                        LODWORD(v114) = v140 >> 3;
                                                                        LODWORD(v115) = v140 >> 4;
                                                                        LODWORD(v116) = v140 >> 5;
                                                                        LODWORD(v184) = v139 >> 11;
                                                                        LODWORD(v185) = v139 >> 12;
                                                                        LODWORD(v186) = v139 >> 13;
                                                                        uint64_t v117 = v140 >> 6;
                                                                        uint64_t v118 = v140 >> 7;
                                                                        uint64_t v119 = v140 >> 8;
                                                                        uint64_t v120 = v140 >> 9;
                                                                        LODWORD(v121) = v140 >> 10;
                                                                        LODWORD(v122) = v140 >> 11;
                                                                        LODWORD(v123) = v140 >> 12;
                                                                        LODWORD(v124) = v140 >> 13;
                                                                      }
                                                                      if ((v114 & 1) == (v104 & 1))
                                                                      {
                                                                        if (v114)
                                                                        {
                                                                          float allQueryMatched = self->_allQueryMatched;
                                                                          objc_msgSend(v4, "allQueryMatched", v120, v119, v106, v118, v105, v117);
                                                                          if (allQueryMatched != v142) {
                                                                            goto LABEL_187;
                                                                          }
                                                                          unsigned int v143 = *((unsigned __int16 *)v4 + 98);
                                                                          LODWORD(v105) = v143 >> 4;
                                                                          uint64_t v106 = v143 >> 5;
                                                                          LODWORD(v107) = v143 >> 6;
                                                                          LODWORD(v108) = v143 >> 7;
                                                                          unsigned int v109 = v143 >> 8;
                                                                          LODWORD(v110) = v143 >> 9;
                                                                          LODWORD(v111) = v143 >> 10;
                                                                          unsigned int v144 = *((unsigned __int16 *)&self->_has + 2);
                                                                          LODWORD(v115) = v144 >> 4;
                                                                          LODWORD(v116) = v144 >> 5;
                                                                          LODWORD(v117) = v144 >> 6;
                                                                          uint64_t v118 = v144 >> 7;
                                                                          LODWORD(v184) = v143 >> 11;
                                                                          LODWORD(v185) = v143 >> 12;
                                                                          LODWORD(v186) = v143 >> 13;
                                                                          uint64_t v119 = v144 >> 8;
                                                                          uint64_t v120 = v144 >> 9;
                                                                          LODWORD(v121) = v144 >> 10;
                                                                          LODWORD(v122) = v144 >> 11;
                                                                          LODWORD(v123) = v144 >> 12;
                                                                          LODWORD(v124) = v144 >> 13;
                                                                        }
                                                                        if ((v115 & 1) == (v105 & 1))
                                                                        {
                                                                          if (v115)
                                                                          {
                                                                            float allPrimaryNameTokensAreInQuery = self->_allPrimaryNameTokensAreInQuery;
                                                                            objc_msgSend(v4, "allPrimaryNameTokensAreInQuery", v120, v119, v106, v118);
                                                                            if (allPrimaryNameTokensAreInQuery != v146) {
                                                                              goto LABEL_187;
                                                                            }
                                                                            unsigned int v147 = *((unsigned __int16 *)v4 + 98);
                                                                            LODWORD(v106) = v147 >> 5;
                                                                            LODWORD(v107) = v147 >> 6;
                                                                            LODWORD(v108) = v147 >> 7;
                                                                            unsigned int v109 = v147 >> 8;
                                                                            LODWORD(v110) = v147 >> 9;
                                                                            LODWORD(v111) = v147 >> 10;
                                                                            unsigned int v148 = *((unsigned __int16 *)&self->_has + 2);
                                                                            LODWORD(v116) = v148 >> 5;
                                                                            LODWORD(v117) = v148 >> 6;
                                                                            LODWORD(v118) = v148 >> 7;
                                                                            uint64_t v119 = v148 >> 8;
                                                                            uint64_t v120 = v148 >> 9;
                                                                            LODWORD(v184) = v147 >> 11;
                                                                            LODWORD(v185) = v147 >> 12;
                                                                            LODWORD(v186) = v147 >> 13;
                                                                            LODWORD(v121) = v148 >> 10;
                                                                            LODWORD(v122) = v148 >> 11;
                                                                            LODWORD(v123) = v148 >> 12;
                                                                            LODWORD(v124) = v148 >> 13;
                                                                          }
                                                                          if ((v116 & 1) == (v106 & 1))
                                                                          {
                                                                            if (v116)
                                                                            {
                                                                              float isGivenNameMatch = self->_isGivenNameMatch;
                                                                              objc_msgSend(v4, "isGivenNameMatch", v120, v119);
                                                                              if (isGivenNameMatch != v150) {
                                                                                goto LABEL_187;
                                                                              }
                                                                              unsigned int v151 = *((unsigned __int16 *)v4 + 98);
                                                                              LODWORD(v107) = v151 >> 6;
                                                                              LODWORD(v108) = v151 >> 7;
                                                                              unsigned int v109 = v151 >> 8;
                                                                              LODWORD(v110) = v151 >> 9;
                                                                              LODWORD(v111) = v151 >> 10;
                                                                              unsigned int v152 = *((unsigned __int16 *)&self->_has
                                                                                     + 2);
                                                                              LODWORD(v117) = v152 >> 6;
                                                                              LODWORD(v118) = v152 >> 7;
                                                                              uint64_t v119 = v152 >> 8;
                                                                              uint64_t v120 = v152 >> 9;
                                                                              LODWORD(v121) = v152 >> 10;
                                                                              LODWORD(v122) = v152 >> 11;
                                                                              LODWORD(v184) = v151 >> 11;
                                                                              LODWORD(v185) = v151 >> 12;
                                                                              LODWORD(v186) = v151 >> 13;
                                                                              LODWORD(v123) = v152 >> 12;
                                                                              LODWORD(v124) = v152 >> 13;
                                                                            }
                                                                            if ((v117 & 1) == (v107 & 1))
                                                                            {
                                                                              if (v117)
                                                                              {
                                                                                float isMiddleNameMatch = self->_isMiddleNameMatch;
                                                                                objc_msgSend(v4, "isMiddleNameMatch", v120, v119);
                                                                                if (isMiddleNameMatch != v154) {
                                                                                  goto LABEL_187;
                                                                                }
                                                                                unsigned int v155 = *((unsigned __int16 *)v4 + 98);
                                                                                LODWORD(v108) = v155 >> 7;
                                                                                unsigned int v109 = v155 >> 8;
                                                                                LODWORD(v110) = v155 >> 9;
                                                                                LODWORD(v111) = v155 >> 10;
                                                                                unsigned int v156 = *((unsigned __int16 *)&self->_has
                                                                                       + 2);
                                                                                LODWORD(v118) = v156 >> 7;
                                                                                uint64_t v119 = v156 >> 8;
                                                                                uint64_t v120 = v156 >> 9;
                                                                                LODWORD(v121) = v156 >> 10;
                                                                                LODWORD(v122) = v156 >> 11;
                                                                                LODWORD(v123) = v156 >> 12;
                                                                                LODWORD(v124) = v156 >> 13;
                                                                                LODWORD(v184) = v155 >> 11;
                                                                                LODWORD(v185) = v155 >> 12;
                                                                                LODWORD(v186) = v155 >> 13;
                                                                              }
                                                                              if ((v118 & 1) == (v108 & 1))
                                                                              {
                                                                                if (v118)
                                                                                {
                                                                                  float isFamilyNameMatch = self->_isFamilyNameMatch;
                                                                                  objc_msgSend(v4, "isFamilyNameMatch", v120, v119);
                                                                                  if (isFamilyNameMatch != v158) {
                                                                                    goto LABEL_187;
                                                                                  }
                                                                                  unsigned int v159 = *((unsigned __int16 *)v4 + 98);
                                                                                  unsigned int v109 = v159 >> 8;
                                                                                  LODWORD(v110) = v159 >> 9;
                                                                                  LODWORD(v111) = v159 >> 10;
                                                                                  unsigned int v160 = *((unsigned __int16 *)&self->_has
                                                                                         + 2);
                                                                                  LODWORD(v119) = v160 >> 8;
                                                                                  uint64_t v120 = v160 >> 9;
                                                                                  LODWORD(v121) = v160 >> 10;
                                                                                  LODWORD(v122) = v160 >> 11;
                                                                                  LODWORD(v123) = v160 >> 12;
                                                                                  LODWORD(v124) = v160 >> 13;
                                                                                  LODWORD(v184) = v159 >> 11;
                                                                                  LODWORD(v185) = v159 >> 12;
                                                                                  LODWORD(v186) = v159 >> 13;
                                                                                }
                                                                                if ((v119 & 1) == (v109 & 1))
                                                                                {
                                                                                  if (v119)
                                                                                  {
                                                                                    float isOrganizationNameMatch = self->_isOrganizationNameMatch;
                                                                                    objc_msgSend(v4, "isOrganizationNameMatch", v120);
                                                                                    if (isOrganizationNameMatch != v162) {
                                                                                      goto LABEL_187;
                                                                                    }
                                                                                    unsigned int v163 = *((unsigned __int16 *)v4 + 98);
                                                                                    LODWORD(v110) = v163 >> 9;
                                                                                    LODWORD(v111) = v163 >> 10;
                                                                                    unsigned int v164 = *((unsigned __int16 *)&self->_has
                                                                                           + 2);
                                                                                    LODWORD(v120) = v164 >> 9;
                                                                                    LODWORD(v121) = v164 >> 10;
                                                                                    LODWORD(v122) = v164 >> 11;
                                                                                    LODWORD(v123) = v164 >> 12;
                                                                                    LODWORD(v124) = v164 >> 13;
                                                                                    LODWORD(v184) = v163 >> 11;
                                                                                    LODWORD(v185) = v163 >> 12;
                                                                                    LODWORD(v186) = v163 >> 13;
                                                                                  }
                                                                                  if ((v120 & 1) == (v110 & 1))
                                                                                  {
                                                                                    if (v120)
                                                                                    {
                                                                                      float isNicknameMatch = self->_isNicknameMatch;
                                                                                      [v4 isNicknameMatch];
                                                                                      if (isNicknameMatch != v166) {
                                                                                        goto LABEL_187;
                                                                                      }
                                                                                      unsigned int v167 = *((unsigned __int16 *)v4
                                                                                             + 98);
                                                                                      LODWORD(v111) = v167 >> 10;
                                                                                      unsigned int v168 = *((unsigned __int16 *)&self->_has
                                                                                             + 2);
                                                                                      LODWORD(v121) = v168 >> 10;
                                                                                      LODWORD(v122) = v168 >> 11;
                                                                                      LODWORD(v123) = v168 >> 12;
                                                                                      LODWORD(v124) = v168 >> 13;
                                                                                      LODWORD(v184) = v167 >> 11;
                                                                                      LODWORD(v185) = v167 >> 12;
                                                                                      LODWORD(v186) = v167 >> 13;
                                                                                    }
                                                                                    if ((v121 & 1) == (v111 & 1))
                                                                                    {
                                                                                      if (v121)
                                                                                      {
                                                                                        float isNamePrefixMatch = self->_isNamePrefixMatch;
                                                                                        [v4 isNamePrefixMatch];
                                                                                        if (isNamePrefixMatch != v170) {
                                                                                          goto LABEL_187;
                                                                                        }
                                                                                        unsigned int v171 = *((unsigned __int16 *)v4
                                                                                               + 98);
                                                                                        unsigned int v172 = *((unsigned __int16 *)&self->_has
                                                                                               + 2);
                                                                                        LODWORD(v122) = v172 >> 11;
                                                                                        LODWORD(v123) = v172 >> 12;
                                                                                        LODWORD(v124) = v172 >> 13;
                                                                                        LODWORD(v184) = v171 >> 11;
                                                                                        LODWORD(v185) = v171 >> 12;
                                                                                        LODWORD(v186) = v171 >> 13;
                                                                                      }
                                                                                      if ((v122 & 1) == (v184 & 1))
                                                                                      {
                                                                                        if (v122)
                                                                                        {
                                                                                          float isNameSuffixMatch = self->_isNameSuffixMatch;
                                                                                          [v4 isNameSuffixMatch];
                                                                                          if (isNameSuffixMatch != v174) {
                                                                                            goto LABEL_187;
                                                                                          }
                                                                                          unsigned int v175 = *((unsigned __int16 *)&self->_has
                                                                                                 + 2);
                                                                                          unsigned int v176 = *((unsigned __int16 *)v4
                                                                                                 + 98);
                                                                                          LODWORD(v123) = v175 >> 12;
                                                                                          LODWORD(v124) = v175 >> 13;
                                                                                          LODWORD(v185) = v176 >> 12;
                                                                                          LODWORD(v186) = v176 >> 13;
                                                                                        }
                                                                                        if ((v123 & 1) == (v185 & 1))
                                                                                        {
                                                                                          if (v123)
                                                                                          {
                                                                                            float allHandlesMatched = self->_allHandlesMatched;
                                                                                            [v4 allHandlesMatched];
                                                                                            if (allHandlesMatched != v178) {
                                                                                              goto LABEL_187;
                                                                                            }
                                                                                            LODWORD(v124) = *((unsigned __int16 *)&self->_has + 2) >> 13;
                                                                                            LODWORD(v186) = *((unsigned __int16 *)v4 + 98) >> 13;
                                                                                          }
                                                                                          int v179 = v124 & 1;
                                                                                          if (v179 == (v186 & 1))
                                                                                          {
                                                                                            if (!v179
                                                                                              || (float isRelationAlias = self->_isRelationAlias,
                                                                                                  [v4 isRelationAlias], isRelationAlias == v181))
                                                                                            {
                                                                                              BOOL v182 = 1;
                                                                                              goto LABEL_188;
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_187:
  BOOL v182 = 0;
LABEL_188:

  return v182;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $84752DCADCC9A46F675661ABABD0E080 v4 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v5 = *(void *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if (*(unsigned char *)&v4)
  {
    PBDataWriterWriteFloatField();
    $84752DCADCC9A46F675661ABABD0E080 v6 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
    unint64_t v5 = *(void *)&v6 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteFloatField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_95:
  PBDataWriterWriteFloatField();
  if (((*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0x200000000000) != 0) {
LABEL_47:
  }
    PBDataWriterWriteFloatField();
LABEL_48:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactFeatureSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteIsRelationAlias
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsRelationAlias:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsRelationAlias:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsRelationAlias
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setIsRelationAlias:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000000) >> 32;
  self->_float isRelationAlias = a3;
}

- (void)deleteAllHandlesMatched
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setAllHandlesMatched:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasAllHandlesMatched:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasAllHandlesMatched
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setAllHandlesMatched:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000000) >> 32;
  self->_float allHandlesMatched = a3;
}

- (void)deleteIsNameSuffixMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsNameSuffixMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsNameSuffixMatch:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsNameSuffixMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setIsNameSuffixMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x80000000000) >> 32;
  self->_float isNameSuffixMatch = a3;
}

- (void)deleteIsNamePrefixMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsNamePrefixMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsNamePrefixMatch:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsNamePrefixMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setIsNamePrefixMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x40000000000) >> 32;
  self->_float isNamePrefixMatch = a3;
}

- (void)deleteIsNicknameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsNicknameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsNicknameMatch:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsNicknameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setIsNicknameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x20000000000) >> 32;
  self->_float isNicknameMatch = a3;
}

- (void)deleteIsOrganizationNameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsOrganizationNameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsOrganizationNameMatch:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsOrganizationNameMatch
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setIsOrganizationNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x10000000000) >> 32;
  self->_float isOrganizationNameMatch = a3;
}

- (void)deleteIsFamilyNameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsFamilyNameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsFamilyNameMatch:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsFamilyNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setIsFamilyNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x8000000000) >> 32;
  self->_float isFamilyNameMatch = a3;
}

- (void)deleteIsMiddleNameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsMiddleNameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsMiddleNameMatch:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsMiddleNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsMiddleNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x4000000000) >> 32;
  self->_float isMiddleNameMatch = a3;
}

- (void)deleteIsGivenNameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsGivenNameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsGivenNameMatch:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsGivenNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIsGivenNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x2000000000) >> 32;
  self->_float isGivenNameMatch = a3;
}

- (void)deleteAllPrimaryNameTokensAreInQuery
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setAllPrimaryNameTokensAreInQuery:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasAllPrimaryNameTokensAreInQuery:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasAllPrimaryNameTokensAreInQuery
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAllPrimaryNameTokensAreInQuery:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x1000000000) >> 32;
  self->_float allPrimaryNameTokensAreInQuery = a3;
}

- (void)deleteAllQueryMatched
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setAllQueryMatched:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasAllQueryMatched:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasAllQueryMatched
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAllQueryMatched:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x800000000) >> 32;
  self->_float allQueryMatched = a3;
}

- (void)deleteNumPrimaryTokens
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setNumPrimaryTokens:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNumPrimaryTokens:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNumPrimaryTokens
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setNumPrimaryTokens:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000) >> 32;
  self->_float numPrimaryTokens = a3;
}

- (void)deleteIsPartialNameMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsPartialNameMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsPartialNameMatch:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsPartialNameMatch
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsPartialNameMatch:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000) >> 32;
  self->_float isPartialNameMatch = a3;
}

- (void)deleteHasSuggestedProperties
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setHasSuggestedProperties:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasHasSuggestedProperties:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasHasSuggestedProperties
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setHasSuggestedProperties:(float)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000) >> 32;
  self->_float hasSuggestedProperties = a3;
}

- (void)deleteIsHypocorism
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsHypocorism:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0x7FFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsHypocorism:(BOOL)a3
{
  unsigned int v3 = 0x80000000;
  if (!a3) {
    unsigned int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0x7FFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0x7FFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsHypocorism
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setIsHypocorism:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_float isHypocorism = a3;
}

- (void)deleteIsSuggested
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsSuggested:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xBFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsSuggested:(BOOL)a3
{
  int v3 = 0x40000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xBFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xBFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsSuggested
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setIsSuggested:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_float isSuggested = a3;
}

- (void)deleteFreqSameGroup28DayToInf
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup28DayToInf:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xDFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup28DayToInf:(BOOL)a3
{
  int v3 = 0x20000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xDFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xDFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup28DayToInf
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setFreqSameGroup28DayToInf:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_float freqSameGroup28DayToInf = a3;
}

- (void)deleteFreqSameGroup7DayTo28Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup7DayTo28Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xEFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup7DayTo28Day:(BOOL)a3
{
  int v3 = 0x10000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xEFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xEFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup7DayTo28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setFreqSameGroup7DayTo28Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_float freqSameGroup7DayTo28Day = a3;
}

- (void)deleteFreqSameGroup1DayTo7Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup1DayTo7Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xF7FFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup1DayTo7Day:(BOOL)a3
{
  int v3 = 0x8000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xF7FFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xF7FFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup1DayTo7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setFreqSameGroup1DayTo7Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_float freqSameGroup1DayTo7Day = a3;
}

- (void)deleteFreqSameGroup6HrTo1Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup6HrTo1Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFBFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup6HrTo1Day:(BOOL)a3
{
  int v3 = 0x4000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFBFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFBFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup6HrTo1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setFreqSameGroup6HrTo1Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_float freqSameGroup6HrTo1Day = a3;
}

- (void)deleteFreqSameGroup1HrTo6Hr
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup1HrTo6Hr:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFDFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup1HrTo6Hr:(BOOL)a3
{
  int v3 = 0x2000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFDFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFDFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup1HrTo6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setFreqSameGroup1HrTo6Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_float freqSameGroup1HrTo6Hr = a3;
}

- (void)deleteFreqSameGroup10MinTo1Hr
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup10MinTo1Hr:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFEFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup10MinTo1Hr:(BOOL)a3
{
  int v3 = 0x1000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFEFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFEFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup10MinTo1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setFreqSameGroup10MinTo1Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_float freqSameGroup10MinTo1Hr = a3;
}

- (void)deleteFreqSameGroup2MinTo10Min
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup2MinTo10Min:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFF7FFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup2MinTo10Min:(BOOL)a3
{
  int v3 = 0x800000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFF7FFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFF7FFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup2MinTo10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setFreqSameGroup2MinTo10Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_float freqSameGroup2MinTo10Min = a3;
}

- (void)deleteFreqSameGroup0MinTo2Min
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqSameGroup0MinTo2Min:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFBFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqSameGroup0MinTo2Min:(BOOL)a3
{
  int v3 = 0x400000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFBFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFBFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqSameGroup0MinTo2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setFreqSameGroup0MinTo2Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_float freqSameGroup0MinTo2Min = a3;
}

- (void)deleteFreqAnyGroup28DayToInf
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup28DayToInf:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup28DayToInf:(BOOL)a3
{
  int v3 = 0x200000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFDFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFDFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup28DayToInf
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setFreqAnyGroup28DayToInf:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_float freqAnyGroup28DayToInf = a3;
}

- (void)deleteFreqAnyGroup7DayTo28Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup7DayTo28Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup7DayTo28Day:(BOOL)a3
{
  int v3 = 0x100000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFEFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFEFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup7DayTo28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setFreqAnyGroup7DayTo28Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_float freqAnyGroup7DayTo28Day = a3;
}

- (void)deleteFreqAnyGroup1DayTo7Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup1DayTo7Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup1DayTo7Day:(BOOL)a3
{
  int v3 = 0x80000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFF7FFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFF7FFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup1DayTo7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setFreqAnyGroup1DayTo7Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_float freqAnyGroup1DayTo7Day = a3;
}

- (void)deleteFreqAnyGroup6HrTo1Day
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup6HrTo1Day:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup6HrTo1Day:(BOOL)a3
{
  int v3 = 0x40000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFBFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFBFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup6HrTo1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setFreqAnyGroup6HrTo1Day:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_float freqAnyGroup6HrTo1Day = a3;
}

- (void)deleteFreqAnyGroup1HrTo6Hr
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup1HrTo6Hr:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup1HrTo6Hr:(BOOL)a3
{
  int v3 = 0x20000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFDFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFDFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup1HrTo6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setFreqAnyGroup1HrTo6Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_float freqAnyGroup1HrTo6Hr = a3;
}

- (void)deleteFreqAnyGroup10MinTo1Hr
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup10MinTo1Hr:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup10MinTo1Hr:(BOOL)a3
{
  int v3 = 0x10000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFEFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFEFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup10MinTo1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setFreqAnyGroup10MinTo1Hr:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_float freqAnyGroup10MinTo1Hr = a3;
}

- (void)deleteFreqAnyGroup2MinTo10Min
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup2MinTo10Min:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFF7FFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup2MinTo10Min:(BOOL)a3
{
  int v3 = 0x8000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFF7FFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFF7FFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup2MinTo10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setFreqAnyGroup2MinTo10Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_float freqAnyGroup2MinTo10Min = a3;
}

- (void)deleteFreqAnyGroup0MinTo2Min
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setFreqAnyGroup0MinTo2Min:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFBFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasFreqAnyGroup0MinTo2Min:(BOOL)a3
{
  int v3 = 0x4000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFBFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFBFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasFreqAnyGroup0MinTo2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setFreqAnyGroup0MinTo2Min:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_float freqAnyGroup0MinTo2Min = a3;
}

- (void)deleteSpeechAlternativeRanksFamilyNameRank
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setSpeechAlternativeRanksFamilyNameRank:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFDFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasSpeechAlternativeRanksFamilyNameRank:(BOOL)a3
{
  int v3 = 0x2000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFDFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFDFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasSpeechAlternativeRanksFamilyNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setSpeechAlternativeRanksFamilyNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_float speechAlternativeRanksFamilyNameRank = a3;
}

- (void)deleteSpeechAlternativeRanksMiddleNameRank
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setSpeechAlternativeRanksMiddleNameRank:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFEFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasSpeechAlternativeRanksMiddleNameRank:(BOOL)a3
{
  int v3 = 4096;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFEFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFEFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasSpeechAlternativeRanksMiddleNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setSpeechAlternativeRanksMiddleNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_float speechAlternativeRanksMiddleNameRank = a3;
}

- (void)deleteSpeechAlternativeRanksGivenNameRank
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setSpeechAlternativeRanksGivenNameRank:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFF7FF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasSpeechAlternativeRanksGivenNameRank:(BOOL)a3
{
  int v3 = 2048;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFF7FF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFF7FF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasSpeechAlternativeRanksGivenNameRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setSpeechAlternativeRanksGivenNameRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_float speechAlternativeRanksGivenNameRank = a3;
}

- (void)deleteIsWeakOrganizationMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsWeakOrganizationMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFBFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsWeakOrganizationMatch:(BOOL)a3
{
  int v3 = 1024;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFBFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFBFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsWeakOrganizationMatch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setIsWeakOrganizationMatch:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_float isWeakOrganizationMatch = a3;
}

- (void)deleteIsMeCardRelation
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsMeCardRelation:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFDFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsMeCardRelation:(BOOL)a3
{
  int v3 = 512;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFDFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFDFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsMeCardRelation
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setIsMeCardRelation:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_float isMeCardRelation = a3;
}

- (void)deleteIsFavorite
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsFavorite:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFEFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsFavorite:(BOOL)a3
{
  int v3 = 256;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFEFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFEFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsFavorite
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setIsFavorite:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_float isFavorite = a3;
}

- (void)deleteIsHighQualityRequestMatch
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsHighQualityRequestMatch:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFF7F;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsHighQualityRequestMatch:(BOOL)a3
{
  int v3 = 128;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFF7F | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFF7F | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsHighQualityRequestMatch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setIsHighQualityRequestMatch:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_float isHighQualityRequestMatch = a3;
}

- (void)deleteRecencyRankInSiriRequest
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setRecencyRankInSiriRequest:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFBF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasRecencyRankInSiriRequest:(BOOL)a3
{
  int v3 = 64;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFBF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFBF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasRecencyRankInSiriRequest
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setRecencyRankInSiriRequest:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_float recencyRankInSiriRequest = a3;
}

- (void)deleteRecencyRankInSameDomain
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setRecencyRankInSameDomain:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFDF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasRecencyRankInSameDomain:(BOOL)a3
{
  int v3 = 32;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFDF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFDF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasRecencyRankInSameDomain
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setRecencyRankInSameDomain:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_float recencyRankInSameDomain = a3;
}

- (void)deleteRecencyRank
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setRecencyRank:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFEF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasRecencyRank:(BOOL)a3
{
  int v3 = 16;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFEF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFEF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasRecencyRank
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setRecencyRank:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_float recencyRank = a3;
}

- (void)deleteIsRecentlyCorrected
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsRecentlyCorrected:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFF7;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsRecentlyCorrected:(BOOL)a3
{
  int v3 = 8;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFF7 | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsRecentlyCorrected
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setIsRecentlyCorrected:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_float isRecentlyCorrected = a3;
}

- (void)deleteIsRecentInSiriRequest
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsRecentInSiriRequest:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFB;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsRecentInSiriRequest:(BOOL)a3
{
  int v3 = 4;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFFB | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFB | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsRecentInSiriRequest
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setIsRecentInSiriRequest:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_float isRecentInSiriRequest = a3;
}

- (void)deleteIsRecentInSameDomain
{
  [(INFERENCESchemaINFERENCEContactFeatureSet *)self setIsRecentInSameDomain:0.0];
  $84752DCADCC9A46F675661ABABD0E080 v3 = ($84752DCADCC9A46F675661ABABD0E080)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFD;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsRecentInSameDomain:(BOOL)a3
{
  int v3 = 2;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFFD | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFD | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsRecentInSameDomain
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setIsRecentInSameDomain:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_float isRecentInSameDomain = a3;
}

- (void)deleteIsRecent
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasIsRecent:(BOOL)a3
{
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
}

- (BOOL)hasIsRecent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsRecent:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_float isRecent = a3;
}

@end
@interface INFERENCESchemaINFERENCEContactSignalSet
- (BOOL)areAllPrimaryContactTokensInQuery;
- (BOOL)areAllQueryTokensInContact;
- (BOOL)areQueryDiacriticsRemoved;
- (BOOL)hasAreAllPrimaryContactTokensInQuery;
- (BOOL)hasAreAllQueryTokensInContact;
- (BOOL)hasAreQueryDiacriticsRemoved;
- (BOOL)hasFractionOfCommunalDevicesMatchingCandidate;
- (BOOL)hasHandleWithAllowedType;
- (BOOL)hasHandleWithPreferredType;
- (BOOL)hasHasHandleWithAllowedType;
- (BOOL)hasHasHandleWithPreferredType;
- (BOOL)hasHasSuggestedProperties;
- (BOOL)hasHistoryStats;
- (BOOL)hasHistoryStatsInSameDomain;
- (BOOL)hasHistoryStatsInSiriRequests;
- (BOOL)hasIsAsrE3Signal;
- (BOOL)hasIsCommunalRequest;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsFromNLXSearch;
- (BOOL)hasIsFromSRRSearch;
- (BOOL)hasIsFromStandardSearch;
- (BOOL)hasIsHypocorism;
- (BOOL)hasIsMeCard;
- (BOOL)hasIsMeCardRelation;
- (BOOL)hasIsMeCardRelationExactMatch;
- (BOOL)hasIsOnlyCandidate;
- (BOOL)hasIsPartialNameMatch;
- (BOOL)hasIsPlusSignal;
- (BOOL)hasIsQueryNameDerivedFromRelationshipLabel;
- (BOOL)hasIsQueryNormalized;
- (BOOL)hasIsQueryRelationshipLabelDerivedFromName;
- (BOOL)hasIsQueryStrippedOfPunctuation;
- (BOOL)hasIsQueryStrippedOfSymbols;
- (BOOL)hasIsQueryStrippedOfTitles;
- (BOOL)hasIsQueryStrippedOfWhitespace;
- (BOOL)hasIsRecent;
- (BOOL)hasIsRecentInSameDomain;
- (BOOL)hasIsRecentInSiriRequest;
- (BOOL)hasIsRecentlyCorrected;
- (BOOL)hasIsRelationAlias;
- (BOOL)hasIsSuggestedContact;
- (BOOL)hasIsThirdPartyMatch;
- (BOOL)hasIsTransliterated;
- (BOOL)hasNlxScore;
- (BOOL)hasRecencyRank;
- (BOOL)hasRecencyRankInSameDomain;
- (BOOL)hasRecencyRankInSiriRequest;
- (BOOL)hasRequestMatchSignalSet;
- (BOOL)hasSpeechAlternativeRanks;
- (BOOL)hasSrrScore;
- (BOOL)hasSuggestedProperties;
- (BOOL)hasThirdPartyAppBundleId;
- (BOOL)isAsrE3Signal;
- (BOOL)isCommunalRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isFromNLXSearch;
- (BOOL)isFromSRRSearch;
- (BOOL)isFromStandardSearch;
- (BOOL)isHypocorism;
- (BOOL)isMeCard;
- (BOOL)isMeCardRelation;
- (BOOL)isMeCardRelationExactMatch;
- (BOOL)isOnlyCandidate;
- (BOOL)isPartialNameMatch;
- (BOOL)isPlusSignal;
- (BOOL)isQueryNameDerivedFromRelationshipLabel;
- (BOOL)isQueryNormalized;
- (BOOL)isQueryRelationshipLabelDerivedFromName;
- (BOOL)isQueryStrippedOfPunctuation;
- (BOOL)isQueryStrippedOfSymbols;
- (BOOL)isQueryStrippedOfTitles;
- (BOOL)isQueryStrippedOfWhitespace;
- (BOOL)isRecent;
- (BOOL)isRecentInSameDomain;
- (BOOL)isRecentInSiriRequest;
- (BOOL)isRecentlyCorrected;
- (BOOL)isRelationAlias;
- (BOOL)isSuggestedContact;
- (BOOL)isThirdPartyMatch;
- (BOOL)isTransliterated;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactSignalSet)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactSignalSet)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats;
- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSameDomain;
- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSiriRequests;
- (INFERENCESchemaINFERENCERequestMatchSignalSet)requestMatchSignalSet;
- (INFERENCESchemaINFERENCESpeechAlternativeRanks)speechAlternativeRanks;
- (NSArray)handlesWithPrivacySignalSets;
- (NSData)jsonData;
- (NSString)thirdPartyAppBundleId;
- (float)fractionOfCommunalDevicesMatchingCandidate;
- (float)nlxScore;
- (float)srrScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)handlesWithPrivacySignalSetsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)recencyRank;
- (int)recencyRankInSameDomain;
- (int)recencyRankInSiriRequest;
- (unint64_t)handlesWithPrivacySignalSetsCount;
- (unint64_t)hash;
- (void)addHandlesWithPrivacySignalSets:(id)a3;
- (void)clearHandlesWithPrivacySignalSets;
- (void)deleteAreAllPrimaryContactTokensInQuery;
- (void)deleteAreAllQueryTokensInContact;
- (void)deleteAreQueryDiacriticsRemoved;
- (void)deleteFractionOfCommunalDevicesMatchingCandidate;
- (void)deleteHasHandleWithAllowedType;
- (void)deleteHasHandleWithPreferredType;
- (void)deleteHasSuggestedProperties;
- (void)deleteHistoryStats;
- (void)deleteHistoryStatsInSameDomain;
- (void)deleteHistoryStatsInSiriRequests;
- (void)deleteIsAsrE3Signal;
- (void)deleteIsCommunalRequest;
- (void)deleteIsFavorite;
- (void)deleteIsFromNLXSearch;
- (void)deleteIsFromSRRSearch;
- (void)deleteIsFromStandardSearch;
- (void)deleteIsHypocorism;
- (void)deleteIsMeCard;
- (void)deleteIsMeCardRelation;
- (void)deleteIsMeCardRelationExactMatch;
- (void)deleteIsOnlyCandidate;
- (void)deleteIsPartialNameMatch;
- (void)deleteIsPlusSignal;
- (void)deleteIsQueryNameDerivedFromRelationshipLabel;
- (void)deleteIsQueryNormalized;
- (void)deleteIsQueryRelationshipLabelDerivedFromName;
- (void)deleteIsQueryStrippedOfPunctuation;
- (void)deleteIsQueryStrippedOfSymbols;
- (void)deleteIsQueryStrippedOfTitles;
- (void)deleteIsQueryStrippedOfWhitespace;
- (void)deleteIsRecent;
- (void)deleteIsRecentInSameDomain;
- (void)deleteIsRecentInSiriRequest;
- (void)deleteIsRecentlyCorrected;
- (void)deleteIsRelationAlias;
- (void)deleteIsSuggestedContact;
- (void)deleteIsThirdPartyMatch;
- (void)deleteIsTransliterated;
- (void)deleteNlxScore;
- (void)deleteRecencyRank;
- (void)deleteRecencyRankInSameDomain;
- (void)deleteRecencyRankInSiriRequest;
- (void)deleteRequestMatchSignalSet;
- (void)deleteSpeechAlternativeRanks;
- (void)deleteSrrScore;
- (void)deleteThirdPartyAppBundleId;
- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3;
- (void)setAreAllQueryTokensInContact:(BOOL)a3;
- (void)setAreQueryDiacriticsRemoved:(BOOL)a3;
- (void)setFractionOfCommunalDevicesMatchingCandidate:(float)a3;
- (void)setHandlesWithPrivacySignalSets:(id)a3;
- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3;
- (void)setHasAreAllQueryTokensInContact:(BOOL)a3;
- (void)setHasAreQueryDiacriticsRemoved:(BOOL)a3;
- (void)setHasFractionOfCommunalDevicesMatchingCandidate:(BOOL)a3;
- (void)setHasHandleWithAllowedType:(BOOL)a3;
- (void)setHasHandleWithPreferredType:(BOOL)a3;
- (void)setHasHasHandleWithAllowedType:(BOOL)a3;
- (void)setHasHasHandleWithPreferredType:(BOOL)a3;
- (void)setHasHasSuggestedProperties:(BOOL)a3;
- (void)setHasHistoryStats:(BOOL)a3;
- (void)setHasHistoryStatsInSameDomain:(BOOL)a3;
- (void)setHasHistoryStatsInSiriRequests:(BOOL)a3;
- (void)setHasIsAsrE3Signal:(BOOL)a3;
- (void)setHasIsCommunalRequest:(BOOL)a3;
- (void)setHasIsFavorite:(BOOL)a3;
- (void)setHasIsFromNLXSearch:(BOOL)a3;
- (void)setHasIsFromSRRSearch:(BOOL)a3;
- (void)setHasIsFromStandardSearch:(BOOL)a3;
- (void)setHasIsHypocorism:(BOOL)a3;
- (void)setHasIsMeCard:(BOOL)a3;
- (void)setHasIsMeCardRelation:(BOOL)a3;
- (void)setHasIsMeCardRelationExactMatch:(BOOL)a3;
- (void)setHasIsOnlyCandidate:(BOOL)a3;
- (void)setHasIsPartialNameMatch:(BOOL)a3;
- (void)setHasIsPlusSignal:(BOOL)a3;
- (void)setHasIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3;
- (void)setHasIsQueryNormalized:(BOOL)a3;
- (void)setHasIsQueryRelationshipLabelDerivedFromName:(BOOL)a3;
- (void)setHasIsQueryStrippedOfPunctuation:(BOOL)a3;
- (void)setHasIsQueryStrippedOfSymbols:(BOOL)a3;
- (void)setHasIsQueryStrippedOfTitles:(BOOL)a3;
- (void)setHasIsQueryStrippedOfWhitespace:(BOOL)a3;
- (void)setHasIsRecent:(BOOL)a3;
- (void)setHasIsRecentInSameDomain:(BOOL)a3;
- (void)setHasIsRecentInSiriRequest:(BOOL)a3;
- (void)setHasIsRecentlyCorrected:(BOOL)a3;
- (void)setHasIsRelationAlias:(BOOL)a3;
- (void)setHasIsSuggestedContact:(BOOL)a3;
- (void)setHasIsThirdPartyMatch:(BOOL)a3;
- (void)setHasIsTransliterated:(BOOL)a3;
- (void)setHasNlxScore:(BOOL)a3;
- (void)setHasRecencyRank:(BOOL)a3;
- (void)setHasRecencyRankInSameDomain:(BOOL)a3;
- (void)setHasRecencyRankInSiriRequest:(BOOL)a3;
- (void)setHasRequestMatchSignalSet:(BOOL)a3;
- (void)setHasSpeechAlternativeRanks:(BOOL)a3;
- (void)setHasSrrScore:(BOOL)a3;
- (void)setHasSuggestedProperties:(BOOL)a3;
- (void)setHasThirdPartyAppBundleId:(BOOL)a3;
- (void)setHistoryStats:(id)a3;
- (void)setHistoryStatsInSameDomain:(id)a3;
- (void)setHistoryStatsInSiriRequests:(id)a3;
- (void)setIsAsrE3Signal:(BOOL)a3;
- (void)setIsCommunalRequest:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsFromNLXSearch:(BOOL)a3;
- (void)setIsFromSRRSearch:(BOOL)a3;
- (void)setIsFromStandardSearch:(BOOL)a3;
- (void)setIsHypocorism:(BOOL)a3;
- (void)setIsMeCard:(BOOL)a3;
- (void)setIsMeCardRelation:(BOOL)a3;
- (void)setIsMeCardRelationExactMatch:(BOOL)a3;
- (void)setIsOnlyCandidate:(BOOL)a3;
- (void)setIsPartialNameMatch:(BOOL)a3;
- (void)setIsPlusSignal:(BOOL)a3;
- (void)setIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3;
- (void)setIsQueryNormalized:(BOOL)a3;
- (void)setIsQueryRelationshipLabelDerivedFromName:(BOOL)a3;
- (void)setIsQueryStrippedOfPunctuation:(BOOL)a3;
- (void)setIsQueryStrippedOfSymbols:(BOOL)a3;
- (void)setIsQueryStrippedOfTitles:(BOOL)a3;
- (void)setIsQueryStrippedOfWhitespace:(BOOL)a3;
- (void)setIsRecent:(BOOL)a3;
- (void)setIsRecentInSameDomain:(BOOL)a3;
- (void)setIsRecentInSiriRequest:(BOOL)a3;
- (void)setIsRecentlyCorrected:(BOOL)a3;
- (void)setIsRelationAlias:(BOOL)a3;
- (void)setIsSuggestedContact:(BOOL)a3;
- (void)setIsThirdPartyMatch:(BOOL)a3;
- (void)setIsTransliterated:(BOOL)a3;
- (void)setNlxScore:(float)a3;
- (void)setRecencyRank:(int)a3;
- (void)setRecencyRankInSameDomain:(int)a3;
- (void)setRecencyRankInSiriRequest:(int)a3;
- (void)setRequestMatchSignalSet:(id)a3;
- (void)setSpeechAlternativeRanks:(id)a3;
- (void)setSrrScore:(float)a3;
- (void)setThirdPartyAppBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactSignalSet

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCEContactSignalSet;
  v5 = [(SISchemaInstrumentationMessage *)&v24 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEContactSignalSet *)self deleteSpeechAlternativeRanks];
  }
  v9 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEContactSignalSet *)self deleteHistoryStats];
  }
  v12 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCEContactSignalSet *)self deleteHistoryStatsInSameDomain];
  }
  v15 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(INFERENCESchemaINFERENCEContactSignalSet *)self deleteHistoryStatsInSiriRequests];
  }
  v18 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(INFERENCESchemaINFERENCEContactSignalSet *)self deleteRequestMatchSignalSet];
  }
  v21 = [(INFERENCESchemaINFERENCEContactSignalSet *)self handlesWithPrivacySignalSets];
  v22 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v21 underConditions:v4];
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setHandlesWithPrivacySignalSets:v22];

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
  objc_storeStrong((id *)&self->_thirdPartyAppBundleId, 0);
  objc_storeStrong((id *)&self->_handlesWithPrivacySignalSets, 0);
  objc_storeStrong((id *)&self->_requestMatchSignalSet, 0);
  objc_storeStrong((id *)&self->_historyStatsInSiriRequests, 0);
  objc_storeStrong((id *)&self->_historyStatsInSameDomain, 0);
  objc_storeStrong((id *)&self->_historyStats, 0);
  objc_storeStrong((id *)&self->_speechAlternativeRanks, 0);
}

- (void)setHasThirdPartyAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 7) = a3;
}

- (void)setHasRequestMatchSignalSet:(BOOL)a3
{
  *((unsigned char *)&self->_has + 6) = a3;
}

- (void)setHasHistoryStatsInSiriRequests:(BOOL)a3
{
  *((unsigned char *)&self->_has + 5) = a3;
}

- (void)setHasHistoryStatsInSameDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 4) = a3;
}

- (void)setHasHistoryStats:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSpeechAlternativeRanks:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)isAsrE3Signal
{
  return self->_isAsrE3Signal;
}

- (BOOL)isQueryStrippedOfSymbols
{
  return self->_isQueryStrippedOfSymbols;
}

- (BOOL)isQueryStrippedOfWhitespace
{
  return self->_isQueryStrippedOfWhitespace;
}

- (BOOL)isQueryStrippedOfPunctuation
{
  return self->_isQueryStrippedOfPunctuation;
}

- (BOOL)isQueryNormalized
{
  return self->_isQueryNormalized;
}

- (void)setThirdPartyAppBundleId:(id)a3
{
}

- (NSString)thirdPartyAppBundleId
{
  return self->_thirdPartyAppBundleId;
}

- (BOOL)isOnlyCandidate
{
  return self->_isOnlyCandidate;
}

- (BOOL)isPlusSignal
{
  return self->_isPlusSignal;
}

- (float)fractionOfCommunalDevicesMatchingCandidate
{
  return self->_fractionOfCommunalDevicesMatchingCandidate;
}

- (BOOL)isCommunalRequest
{
  return self->_isCommunalRequest;
}

- (BOOL)hasHandleWithAllowedType
{
  return self->_hasHandleWithAllowedType;
}

- (BOOL)hasHandleWithPreferredType
{
  return self->_hasHandleWithPreferredType;
}

- (void)setHandlesWithPrivacySignalSets:(id)a3
{
}

- (NSArray)handlesWithPrivacySignalSets
{
  return self->_handlesWithPrivacySignalSets;
}

- (void)setRequestMatchSignalSet:(id)a3
{
}

- (INFERENCESchemaINFERENCERequestMatchSignalSet)requestMatchSignalSet
{
  return self->_requestMatchSignalSet;
}

- (BOOL)isTransliterated
{
  return self->_isTransliterated;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isThirdPartyMatch
{
  return self->_isThirdPartyMatch;
}

- (BOOL)isQueryRelationshipLabelDerivedFromName
{
  return self->_isQueryRelationshipLabelDerivedFromName;
}

- (BOOL)isQueryNameDerivedFromRelationshipLabel
{
  return self->_isQueryNameDerivedFromRelationshipLabel;
}

- (BOOL)areQueryDiacriticsRemoved
{
  return self->_areQueryDiacriticsRemoved;
}

- (BOOL)isRelationAlias
{
  return self->_isRelationAlias;
}

- (BOOL)isMeCardRelationExactMatch
{
  return self->_isMeCardRelationExactMatch;
}

- (BOOL)isMeCardRelation
{
  return self->_isMeCardRelation;
}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (void)setHistoryStatsInSiriRequests:(id)a3
{
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSiriRequests
{
  return self->_historyStatsInSiriRequests;
}

- (void)setHistoryStatsInSameDomain:(id)a3
{
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSameDomain
{
  return self->_historyStatsInSameDomain;
}

- (void)setHistoryStats:(id)a3
{
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats
{
  return self->_historyStats;
}

- (int)recencyRankInSiriRequest
{
  return self->_recencyRankInSiriRequest;
}

- (int)recencyRankInSameDomain
{
  return self->_recencyRankInSameDomain;
}

- (int)recencyRank
{
  return self->_recencyRank;
}

- (BOOL)isRecentlyCorrected
{
  return self->_isRecentlyCorrected;
}

- (BOOL)isRecentInSiriRequest
{
  return self->_isRecentInSiriRequest;
}

- (BOOL)isRecentInSameDomain
{
  return self->_isRecentInSameDomain;
}

- (BOOL)isRecent
{
  return self->_isRecent;
}

- (float)srrScore
{
  return self->_srrScore;
}

- (float)nlxScore
{
  return self->_nlxScore;
}

- (BOOL)isFromSRRSearch
{
  return self->_isFromSRRSearch;
}

- (BOOL)isFromNLXSearch
{
  return self->_isFromNLXSearch;
}

- (BOOL)isFromStandardSearch
{
  return self->_isFromStandardSearch;
}

- (BOOL)isPartialNameMatch
{
  return self->_isPartialNameMatch;
}

- (BOOL)hasSuggestedProperties
{
  return self->_hasSuggestedProperties;
}

- (BOOL)isHypocorism
{
  return self->_isHypocorism;
}

- (BOOL)areAllPrimaryContactTokensInQuery
{
  return self->_areAllPrimaryContactTokensInQuery;
}

- (BOOL)areAllQueryTokensInContact
{
  return self->_areAllQueryTokensInContact;
}

- (BOOL)isSuggestedContact
{
  return self->_isSuggestedContact;
}

- (BOOL)isQueryStrippedOfTitles
{
  return self->_isQueryStrippedOfTitles;
}

- (void)setSpeechAlternativeRanks:(id)a3
{
}

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)speechAlternativeRanks
{
  return self->_speechAlternativeRanks;
}

- (INFERENCESchemaINFERENCEContactSignalSet)initWithDictionary:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)INFERENCESchemaINFERENCEContactSignalSet;
  v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)&v112 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"speechAlternativeRanks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCESpeechAlternativeRanks alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setSpeechAlternativeRanks:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"isQueryStrippedOfTitles"];
    objc_opt_class();
    v107 = v8;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfTitles:](v5, "setIsQueryStrippedOfTitles:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isSuggestedContact"];
    objc_opt_class();
    v106 = v9;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsSuggestedContact:](v5, "setIsSuggestedContact:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"areAllQueryTokensInContact"];
    objc_opt_class();
    v105 = v10;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setAreAllQueryTokensInContact:](v5, "setAreAllQueryTokensInContact:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"areAllPrimaryContactTokensInQuery"];
    objc_opt_class();
    v104 = v11;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setAreAllPrimaryContactTokensInQuery:](v5, "setAreAllPrimaryContactTokensInQuery:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isHypocorism"];
    objc_opt_class();
    v103 = v12;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsHypocorism:](v5, "setIsHypocorism:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"hasSuggestedProperties"];
    objc_opt_class();
    v102 = v13;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setHasSuggestedProperties:](v5, "setHasSuggestedProperties:", [v13 BOOLValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"isPartialNameMatch"];
    objc_opt_class();
    v101 = v14;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsPartialNameMatch:](v5, "setIsPartialNameMatch:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isFromStandardSearch"];
    objc_opt_class();
    v100 = v15;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromStandardSearch:](v5, "setIsFromStandardSearch:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"isFromNLXSearch"];
    objc_opt_class();
    v99 = v16;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromNLXSearch:](v5, "setIsFromNLXSearch:", [v16 BOOLValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"isFromSRRSearch"];
    objc_opt_class();
    v98 = v17;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromSRRSearch:](v5, "setIsFromSRRSearch:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"nlxScore"];
    objc_opt_class();
    v97 = v18;
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[INFERENCESchemaINFERENCEContactSignalSet setNlxScore:](v5, "setNlxScore:");
    }
    v19 = [v4 objectForKeyedSubscript:@"srrScore"];
    objc_opt_class();
    v96 = v19;
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[INFERENCESchemaINFERENCEContactSignalSet setSrrScore:](v5, "setSrrScore:");
    }
    int v20 = [v4 objectForKeyedSubscript:@"isRecent"];
    objc_opt_class();
    v95 = v20;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecent:](v5, "setIsRecent:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"isRecentInSameDomain"];
    objc_opt_class();
    v94 = v21;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSameDomain:](v5, "setIsRecentInSameDomain:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isRecentInSiriRequest"];
    objc_opt_class();
    v93 = v22;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSiriRequest:](v5, "setIsRecentInSiriRequest:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isRecentlyCorrected"];
    objc_opt_class();
    v92 = v23;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentlyCorrected:](v5, "setIsRecentlyCorrected:", [v23 BOOLValue]);
    }
    objc_super v24 = [v4 objectForKeyedSubscript:@"recencyRank"];
    objc_opt_class();
    v91 = v24;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRank:](v5, "setRecencyRank:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"recencyRankInSameDomain"];
    objc_opt_class();
    v90 = v25;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSameDomain:](v5, "setRecencyRankInSameDomain:", [v25 intValue]);
    }
    v74 = (void *)v6;
    v26 = [v4 objectForKeyedSubscript:@"recencyRankInSiriRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSiriRequest:](v5, "setRecencyRankInSiriRequest:", [v26 intValue]);
    }
    v73 = v26;
    uint64_t v27 = [v4 objectForKeyedSubscript:@"historyStats"];
    objc_opt_class();
    v89 = (void *)v27;
    if (objc_opt_isKindOfClass())
    {
      v28 = [[INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc] initWithDictionary:v27];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setHistoryStats:v28];
    }
    uint64_t v29 = [v4 objectForKeyedSubscript:@"historyStatsInSameDomain"];
    objc_opt_class();
    v88 = (void *)v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = [[INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc] initWithDictionary:v29];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setHistoryStatsInSameDomain:v30];
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"historyStatsInSiriRequests"];
    objc_opt_class();
    v87 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      v32 = [[INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc] initWithDictionary:v31];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setHistoryStatsInSiriRequests:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"isMeCard"];
    objc_opt_class();
    v86 = v33;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCard:](v5, "setIsMeCard:", [v33 BOOLValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"isMeCardRelation"];
    objc_opt_class();
    v85 = v34;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelation:](v5, "setIsMeCardRelation:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"isMeCardRelationExactMatch"];
    objc_opt_class();
    v84 = v35;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelationExactMatch:](v5, "setIsMeCardRelationExactMatch:", [v35 BOOLValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"isRelationAlias"];
    objc_opt_class();
    v83 = v36;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRelationAlias:](v5, "setIsRelationAlias:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"areQueryDiacriticsRemoved"];
    objc_opt_class();
    v82 = v37;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setAreQueryDiacriticsRemoved:](v5, "setAreQueryDiacriticsRemoved:", [v37 BOOLValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"isQueryNameDerivedFromRelationshipLabel"];
    objc_opt_class();
    v81 = v38;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNameDerivedFromRelationshipLabel:](v5, "setIsQueryNameDerivedFromRelationshipLabel:", [v38 BOOLValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"isQueryRelationshipLabelDerivedFromName"];
    objc_opt_class();
    v80 = v39;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryRelationshipLabelDerivedFromName:](v5, "setIsQueryRelationshipLabelDerivedFromName:", [v39 BOOLValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"isThirdPartyMatch"];
    objc_opt_class();
    v79 = v40;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsThirdPartyMatch:](v5, "setIsThirdPartyMatch:", [v40 BOOLValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"isFavorite"];
    objc_opt_class();
    v78 = v41;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFavorite:](v5, "setIsFavorite:", [v41 BOOLValue]);
    }
    v42 = [v4 objectForKeyedSubscript:@"isTransliterated"];
    objc_opt_class();
    v77 = v42;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsTransliterated:](v5, "setIsTransliterated:", [v42 BOOLValue]);
    }
    uint64_t v43 = [v4 objectForKeyedSubscript:@"requestMatchSignalSet"];
    objc_opt_class();
    v76 = (void *)v43;
    if (objc_opt_isKindOfClass())
    {
      v44 = [[INFERENCESchemaINFERENCERequestMatchSignalSet alloc] initWithDictionary:v43];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setRequestMatchSignalSet:v44];
    }
    v45 = [v4 objectForKeyedSubscript:@"handlesWithPrivacySignalSets"];
    objc_opt_class();
    v75 = v45;
    if (objc_opt_isKindOfClass())
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v108 objects:v113 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v109 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v108 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v52 = [[INFERENCESchemaINFERENCEContactHandleSignalSet alloc] initWithDictionary:v51];
              [(INFERENCESchemaINFERENCEContactSignalSet *)v5 addHandlesWithPrivacySignalSets:v52];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v108 objects:v113 count:16];
        }
        while (v48);
      }
    }
    v53 = [v4 objectForKeyedSubscript:@"hasHandleWithPreferredType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithPreferredType:](v5, "setHasHandleWithPreferredType:", [v53 BOOLValue]);
    }
    v54 = [v4 objectForKeyedSubscript:@"hasHandleWithAllowedType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithAllowedType:](v5, "setHasHandleWithAllowedType:", [v54 BOOLValue]);
    }
    v55 = [v4 objectForKeyedSubscript:@"isCommunalRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsCommunalRequest:](v5, "setIsCommunalRequest:", [v55 BOOLValue]);
    }
    v56 = [v4 objectForKeyedSubscript:@"fractionOfCommunalDevicesMatchingCandidate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v56 floatValue];
      -[INFERENCESchemaINFERENCEContactSignalSet setFractionOfCommunalDevicesMatchingCandidate:](v5, "setFractionOfCommunalDevicesMatchingCandidate:");
    }
    v72 = v53;
    v57 = [v4 objectForKeyedSubscript:@"isPlusSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsPlusSignal:](v5, "setIsPlusSignal:", [v57 BOOLValue]);
    }
    v70 = v55;
    v71 = v54;
    v58 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isOnlyCandidate", v57);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsOnlyCandidate:](v5, "setIsOnlyCandidate:", [v58 BOOLValue]);
    }
    v59 = [v4 objectForKeyedSubscript:@"thirdPartyAppBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v60 = (void *)[v59 copy];
      [(INFERENCESchemaINFERENCEContactSignalSet *)v5 setThirdPartyAppBundleId:v60];
    }
    v69 = v56;
    v61 = [v4 objectForKeyedSubscript:@"isQueryNormalized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNormalized:](v5, "setIsQueryNormalized:", [v61 BOOLValue]);
    }
    v62 = [v4 objectForKeyedSubscript:@"isQueryStrippedOfPunctuation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfPunctuation:](v5, "setIsQueryStrippedOfPunctuation:", [v62 BOOLValue]);
    }
    v63 = [v4 objectForKeyedSubscript:@"isQueryStrippedOfWhitespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfWhitespace:](v5, "setIsQueryStrippedOfWhitespace:", [v63 BOOLValue]);
    }
    v64 = [v4 objectForKeyedSubscript:@"isQueryStrippedOfSymbols"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfSymbols:](v5, "setIsQueryStrippedOfSymbols:", [v64 BOOLValue]);
    }
    v65 = [v4 objectForKeyedSubscript:@"isAsrE3Signal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactSignalSet setIsAsrE3Signal:](v5, "setIsAsrE3Signal:", [v65 BOOLValue]);
    }
    v66 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactSignalSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactSignalSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactSignalSet *)self dictionaryRepresentation];
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
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v5 = v4 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v4 & 8) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areAllPrimaryContactTokensInQuery](self, "areAllPrimaryContactTokensInQuery"));
    [v3 setObject:v21 forKeyedSubscript:@"areAllPrimaryContactTokensInQuery"];

    uint64_t v22 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    unint64_t v5 = v22 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v22 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areAllQueryTokensInContact](self, "areAllQueryTokensInContact"));
  [v3 setObject:v23 forKeyedSubscript:@"areAllQueryTokensInContact"];

  unint64_t v5 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  objc_super v24 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areQueryDiacriticsRemoved](self, "areQueryDiacriticsRemoved"));
  [v3 setObject:v24 forKeyedSubscript:@"areQueryDiacriticsRemoved"];

  if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x100000000) != 0)
  {
LABEL_5:
    uint64_t v6 = NSNumber;
    [(INFERENCESchemaINFERENCEContactSignalSet *)self fractionOfCommunalDevicesMatchingCandidate];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"fractionOfCommunalDevicesMatchingCandidate"];
  }
LABEL_6:
  if ([(NSArray *)self->_handlesWithPrivacySignalSets count])
  {
    int v8 = [MEMORY[0x1E4F1CA48] array];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v9 = self->_handlesWithPrivacySignalSets;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v82 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = [*(id *)(*((void *)&v81 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v81 objects:v85 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"handlesWithPrivacySignalSets"];
  }
  v16 = &self->_isAsrE3Signal + 1;
  int v17 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v17 & 0x40000000) != 0)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasHandleWithAllowedType](self, "hasHandleWithAllowedType"));
    [v3 setObject:v25 forKeyedSubscript:@"hasHandleWithAllowedType"];

    LOBYTE(v17) = *(_DWORD *)v16;
    if ((*(_DWORD *)v16 & 0x20000000) == 0)
    {
LABEL_20:
      if ((v17 & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v17 & 0x20000000) == 0)
  {
    goto LABEL_20;
  }
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasHandleWithPreferredType](self, "hasHandleWithPreferredType"));
  [v3 setObject:v26 forKeyedSubscript:@"hasHandleWithPreferredType"];

  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x20) != 0)
  {
LABEL_21:
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasSuggestedProperties](self, "hasSuggestedProperties"));
    [v3 setObject:v18 forKeyedSubscript:@"hasSuggestedProperties"];
  }
LABEL_22:
  if (self->_historyStats)
  {
    v19 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"historyStats"];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"historyStats"];
    }
  }
  if (self->_historyStatsInSameDomain)
  {
    v28 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
    uint64_t v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"historyStatsInSameDomain"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"historyStatsInSameDomain"];
    }
  }
  if (self->_historyStatsInSiriRequests)
  {
    uint64_t v31 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
    v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"historyStatsInSiriRequests"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"historyStatsInSiriRequests"];
    }
  }
  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x8000000000) != 0)
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isAsrE3Signal](self, "isAsrE3Signal"));
    [v3 setObject:v38 forKeyedSubscript:@"isAsrE3Signal"];

    uint64_t v39 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    unint64_t v34 = v39 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v39 & 0x80000000) == 0)
    {
LABEL_46:
      if ((v34 & 0x8000000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000000) == 0)
  {
    goto LABEL_46;
  }
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isCommunalRequest](self, "isCommunalRequest"));
  [v3 setObject:v40 forKeyedSubscript:@"isCommunalRequest"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x8000000) == 0)
  {
LABEL_47:
    if ((v34 & 0x100) == 0) {
      goto LABEL_48;
    }
    goto LABEL_83;
  }
LABEL_82:
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFavorite](self, "isFavorite"));
  [v3 setObject:v41 forKeyedSubscript:@"isFavorite"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x100) == 0)
  {
LABEL_48:
    if ((v34 & 0x200) == 0) {
      goto LABEL_49;
    }
    goto LABEL_84;
  }
LABEL_83:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromNLXSearch](self, "isFromNLXSearch"));
  [v3 setObject:v42 forKeyedSubscript:@"isFromNLXSearch"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x200) == 0)
  {
LABEL_49:
    if ((v34 & 0x80) == 0) {
      goto LABEL_50;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v43 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromSRRSearch](self, "isFromSRRSearch"));
  [v3 setObject:v43 forKeyedSubscript:@"isFromSRRSearch"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80) == 0)
  {
LABEL_50:
    if ((v34 & 0x10) == 0) {
      goto LABEL_51;
    }
    goto LABEL_86;
  }
LABEL_85:
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromStandardSearch](self, "isFromStandardSearch"));
  [v3 setObject:v44 forKeyedSubscript:@"isFromStandardSearch"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x10) == 0)
  {
LABEL_51:
    if ((v34 & 0x80000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_87;
  }
LABEL_86:
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isHypocorism](self, "isHypocorism"));
  [v3 setObject:v45 forKeyedSubscript:@"isHypocorism"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000) == 0)
  {
LABEL_52:
    if ((v34 & 0x100000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_88;
  }
LABEL_87:
  id v46 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCard](self, "isMeCard"));
  [v3 setObject:v46 forKeyedSubscript:@"isMeCard"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x100000) == 0)
  {
LABEL_53:
    if ((v34 & 0x200000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCardRelation](self, "isMeCardRelation"));
  [v3 setObject:v47 forKeyedSubscript:@"isMeCardRelation"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x200000) == 0)
  {
LABEL_54:
    if ((v34 & 0x400000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v48 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCardRelationExactMatch](self, "isMeCardRelationExactMatch"));
  [v3 setObject:v48 forKeyedSubscript:@"isMeCardRelationExactMatch"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x400000000) == 0)
  {
LABEL_55:
    if ((v34 & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v49 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isOnlyCandidate](self, "isOnlyCandidate"));
  [v3 setObject:v49 forKeyedSubscript:@"isOnlyCandidate"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40) == 0)
  {
LABEL_56:
    if ((v34 & 0x200000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_92;
  }
LABEL_91:
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isPartialNameMatch](self, "isPartialNameMatch"));
  [v3 setObject:v50 forKeyedSubscript:@"isPartialNameMatch"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v34 & 0x1000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v51 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isPlusSignal](self, "isPlusSignal"));
  [v3 setObject:v51 forKeyedSubscript:@"isPlusSignal"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x1000000) == 0)
  {
LABEL_58:
    if ((v34 & 0x800000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_94;
  }
LABEL_93:
  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryNameDerivedFromRelationshipLabel](self, "isQueryNameDerivedFromRelationshipLabel"));
  [v3 setObject:v52 forKeyedSubscript:@"isQueryNameDerivedFromRelationshipLabel"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x800000000) == 0)
  {
LABEL_59:
    if ((v34 & 0x2000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_95;
  }
LABEL_94:
  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryNormalized](self, "isQueryNormalized"));
  [v3 setObject:v53 forKeyedSubscript:@"isQueryNormalized"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x2000000) == 0)
  {
LABEL_60:
    if ((v34 & 0x1000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_96;
  }
LABEL_95:
  v54 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryRelationshipLabelDerivedFromName](self, "isQueryRelationshipLabelDerivedFromName"));
  [v3 setObject:v54 forKeyedSubscript:@"isQueryRelationshipLabelDerivedFromName"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x1000000000) == 0)
  {
LABEL_61:
    if ((v34 & 0x4000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_97;
  }
LABEL_96:
  v55 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfPunctuation](self, "isQueryStrippedOfPunctuation"));
  [v3 setObject:v55 forKeyedSubscript:@"isQueryStrippedOfPunctuation"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x4000000000) == 0)
  {
LABEL_62:
    if ((v34 & 1) == 0) {
      goto LABEL_63;
    }
    goto LABEL_98;
  }
LABEL_97:
  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfSymbols](self, "isQueryStrippedOfSymbols"));
  [v3 setObject:v56 forKeyedSubscript:@"isQueryStrippedOfSymbols"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 1) == 0)
  {
LABEL_63:
    if ((v34 & 0x2000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_99;
  }
LABEL_98:
  v57 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfTitles](self, "isQueryStrippedOfTitles"));
  [v3 setObject:v57 forKeyedSubscript:@"isQueryStrippedOfTitles"];

  unint64_t v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x2000000000) == 0)
  {
LABEL_64:
    if ((v34 & 0x1000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_100;
  }
LABEL_99:
  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfWhitespace](self, "isQueryStrippedOfWhitespace"));
  [v3 setObject:v58 forKeyedSubscript:@"isQueryStrippedOfWhitespace"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x1000) == 0)
  {
LABEL_65:
    if ((v34 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_101;
  }
LABEL_100:
  v59 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecent](self, "isRecent"));
  [v3 setObject:v59 forKeyedSubscript:@"isRecent"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x2000) == 0)
  {
LABEL_66:
    if ((v34 & 0x4000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_102;
  }
LABEL_101:
  v60 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentInSameDomain](self, "isRecentInSameDomain"));
  [v3 setObject:v60 forKeyedSubscript:@"isRecentInSameDomain"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x4000) == 0)
  {
LABEL_67:
    if ((v34 & 0x8000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_103;
  }
LABEL_102:
  v61 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentInSiriRequest](self, "isRecentInSiriRequest"));
  [v3 setObject:v61 forKeyedSubscript:@"isRecentInSiriRequest"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x8000) == 0)
  {
LABEL_68:
    if ((v34 & 0x400000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_104;
  }
LABEL_103:
  v62 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentlyCorrected](self, "isRecentlyCorrected"));
  [v3 setObject:v62 forKeyedSubscript:@"isRecentlyCorrected"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x400000) == 0)
  {
LABEL_69:
    if ((v34 & 2) == 0) {
      goto LABEL_70;
    }
    goto LABEL_105;
  }
LABEL_104:
  v63 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRelationAlias](self, "isRelationAlias"));
  [v3 setObject:v63 forKeyedSubscript:@"isRelationAlias"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 2) == 0)
  {
LABEL_70:
    if ((v34 & 0x4000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_106;
  }
LABEL_105:
  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isSuggestedContact](self, "isSuggestedContact"));
  [v3 setObject:v64 forKeyedSubscript:@"isSuggestedContact"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x4000000) == 0)
  {
LABEL_71:
    if ((v34 & 0x10000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_107;
  }
LABEL_106:
  v65 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isThirdPartyMatch](self, "isThirdPartyMatch"));
  [v3 setObject:v65 forKeyedSubscript:@"isThirdPartyMatch"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x10000000) == 0)
  {
LABEL_72:
    if ((v34 & 0x400) == 0) {
      goto LABEL_73;
    }
    goto LABEL_108;
  }
LABEL_107:
  v66 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isTransliterated](self, "isTransliterated"));
  [v3 setObject:v66 forKeyedSubscript:@"isTransliterated"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x400) == 0)
  {
LABEL_73:
    if ((v34 & 0x10000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_109;
  }
LABEL_108:
  v67 = NSNumber;
  [(INFERENCESchemaINFERENCEContactSignalSet *)self nlxScore];
  v68 = objc_msgSend(v67, "numberWithFloat:");
  [v3 setObject:v68 forKeyedSubscript:@"nlxScore"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x10000) == 0)
  {
LABEL_74:
    if ((v34 & 0x20000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_110;
  }
LABEL_109:
  v69 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRank](self, "recencyRank"));
  [v3 setObject:v69 forKeyedSubscript:@"recencyRank"];

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x20000) == 0)
  {
LABEL_75:
    if ((v34 & 0x40000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_110:
  v70 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRankInSameDomain](self, "recencyRankInSameDomain"));
  [v3 setObject:v70 forKeyedSubscript:@"recencyRankInSameDomain"];

  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40000) != 0)
  {
LABEL_76:
    v35 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRankInSiriRequest](self, "recencyRankInSiriRequest"));
    [v3 setObject:v35 forKeyedSubscript:@"recencyRankInSiriRequest"];
  }
LABEL_77:
  if (self->_requestMatchSignalSet)
  {
    v36 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"requestMatchSignalSet"];
    }
    else
    {
      v71 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v71 forKeyedSubscript:@"requestMatchSignalSet"];
    }
  }
  if (self->_speechAlternativeRanks)
  {
    v72 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
    v73 = [v72 dictionaryRepresentation];
    if (v73)
    {
      [v3 setObject:v73 forKeyedSubscript:@"speechAlternativeRanks"];
    }
    else
    {
      v74 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v74 forKeyedSubscript:@"speechAlternativeRanks"];
    }
  }
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x800) != 0)
  {
    v75 = NSNumber;
    [(INFERENCESchemaINFERENCEContactSignalSet *)self srrScore];
    v76 = objc_msgSend(v75, "numberWithFloat:");
    [v3 setObject:v76 forKeyedSubscript:@"srrScore"];
  }
  if (self->_thirdPartyAppBundleId)
  {
    v77 = [(INFERENCESchemaINFERENCEContactSignalSet *)self thirdPartyAppBundleId];
    v78 = (void *)[v77 copy];
    [v3 setObject:v78 forKeyedSubscript:@"thirdPartyAppBundleId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v79 = v3;

  return v79;
}

- (unint64_t)hash
{
  unint64_t v68 = [(INFERENCESchemaINFERENCESpeechAlternativeRanks *)self->_speechAlternativeRanks hash];
  int v3 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if (v3)
  {
    uint64_t v67 = 2654435761 * self->_isQueryStrippedOfTitles;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      uint64_t v66 = 2654435761 * self->_isSuggestedContact;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v67 = 0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v66 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    uint64_t v65 = 2654435761 * self->_areAllQueryTokensInContact;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v65 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    uint64_t v64 = 2654435761 * self->_areAllPrimaryContactTokensInQuery;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v64 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v63 = 2654435761 * self->_isHypocorism;
    if ((v3 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v63 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v62 = 2654435761 * self->_hasSuggestedProperties;
    if ((v3 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v62 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v61 = 2654435761 * self->_isPartialNameMatch;
    if ((v3 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v61 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v60 = 2654435761 * self->_isFromStandardSearch;
    if ((v3 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v60 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    uint64_t v59 = 2654435761 * self->_isFromNLXSearch;
    if ((v3 & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_25:
    uint64_t v58 = 0;
    if ((v3 & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_26:
    unint64_t v8 = 0;
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v59 = 0;
  if ((v3 & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_11:
  uint64_t v58 = 2654435761 * self->_isFromSRRSearch;
  if ((v3 & 0x400) == 0) {
    goto LABEL_26;
  }
LABEL_12:
  float nlxScore = self->_nlxScore;
  double v5 = nlxScore;
  if (nlxScore < 0.0) {
    double v5 = -nlxScore;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_29:
  if ((v3 & 0x800) != 0)
  {
    float srrScore = self->_srrScore;
    double v11 = srrScore;
    if (srrScore < 0.0) {
      double v11 = -srrScore;
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
  if ((v3 & 0x1000) != 0)
  {
    uint64_t v56 = 2654435761 * self->_isRecent;
    if ((v3 & 0x2000) != 0)
    {
LABEL_39:
      uint64_t v55 = 2654435761 * self->_isRecentInSameDomain;
      if ((v3 & 0x4000) != 0) {
        goto LABEL_40;
      }
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v56 = 0;
    if ((v3 & 0x2000) != 0) {
      goto LABEL_39;
    }
  }
  uint64_t v55 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_40:
    uint64_t v54 = 2654435761 * self->_isRecentInSiriRequest;
    if ((v3 & 0x8000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v54 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_41:
    uint64_t v53 = 2654435761 * self->_isRecentlyCorrected;
    if ((v3 & 0x10000) != 0) {
      goto LABEL_42;
    }
LABEL_48:
    uint64_t v52 = 0;
    if ((v3 & 0x20000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_49;
  }
LABEL_47:
  uint64_t v53 = 0;
  if ((v3 & 0x10000) == 0) {
    goto LABEL_48;
  }
LABEL_42:
  uint64_t v52 = 2654435761 * self->_recencyRank;
  if ((v3 & 0x20000) != 0)
  {
LABEL_43:
    uint64_t v51 = 2654435761 * self->_recencyRankInSameDomain;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v51 = 0;
LABEL_50:
  unint64_t v57 = v9;
  if ((v3 & 0x40000) != 0) {
    uint64_t v50 = 2654435761 * self->_recencyRankInSiriRequest;
  }
  else {
    uint64_t v50 = 0;
  }
  unint64_t v49 = [(INFERENCESchemaINFERENCEPrivatizedHistoryStats *)self->_historyStats hash];
  unint64_t v48 = [(INFERENCESchemaINFERENCEPrivatizedHistoryStats *)self->_historyStatsInSameDomain hash];
  unint64_t v47 = [(INFERENCESchemaINFERENCEPrivatizedHistoryStats *)self->_historyStatsInSiriRequests hash];
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x80000) != 0)
  {
    uint64_t v46 = 2654435761 * self->_isMeCard;
    if ((v14 & 0x100000) != 0)
    {
LABEL_55:
      uint64_t v45 = 2654435761 * self->_isMeCardRelation;
      if ((v14 & 0x200000) != 0) {
        goto LABEL_56;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v46 = 0;
    if ((v14 & 0x100000) != 0) {
      goto LABEL_55;
    }
  }
  uint64_t v45 = 0;
  if ((v14 & 0x200000) != 0)
  {
LABEL_56:
    uint64_t v44 = 2654435761 * self->_isMeCardRelationExactMatch;
    if ((v14 & 0x400000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v44 = 0;
  if ((v14 & 0x400000) != 0)
  {
LABEL_57:
    uint64_t v43 = 2654435761 * self->_isRelationAlias;
    if ((v14 & 0x800000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v43 = 0;
  if ((v14 & 0x800000) != 0)
  {
LABEL_58:
    uint64_t v42 = 2654435761 * self->_areQueryDiacriticsRemoved;
    if ((v14 & 0x1000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v42 = 0;
  if ((v14 & 0x1000000) != 0)
  {
LABEL_59:
    uint64_t v41 = 2654435761 * self->_isQueryNameDerivedFromRelationshipLabel;
    if ((v14 & 0x2000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v41 = 0;
  if ((v14 & 0x2000000) != 0)
  {
LABEL_60:
    uint64_t v40 = 2654435761 * self->_isQueryRelationshipLabelDerivedFromName;
    if ((v14 & 0x4000000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v40 = 0;
  if ((v14 & 0x4000000) != 0)
  {
LABEL_61:
    uint64_t v39 = 2654435761 * self->_isThirdPartyMatch;
    if ((v14 & 0x8000000) != 0) {
      goto LABEL_62;
    }
LABEL_72:
    uint64_t v38 = 0;
    if ((v14 & 0x10000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_73;
  }
LABEL_71:
  uint64_t v39 = 0;
  if ((v14 & 0x8000000) == 0) {
    goto LABEL_72;
  }
LABEL_62:
  uint64_t v38 = 2654435761 * self->_isFavorite;
  if ((v14 & 0x10000000) != 0)
  {
LABEL_63:
    uint64_t v37 = 2654435761 * self->_isTransliterated;
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v37 = 0;
LABEL_74:
  unint64_t v36 = [(INFERENCESchemaINFERENCERequestMatchSignalSet *)self->_requestMatchSignalSet hash];
  uint64_t v35 = [(NSArray *)self->_handlesWithPrivacySignalSets hash];
  uint64_t v15 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v16 = v15 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v15 & 0x20000000) != 0)
  {
    uint64_t v17 = 2654435761 * self->_hasHandleWithPreferredType;
    if ((v15 & 0x40000000) != 0)
    {
LABEL_76:
      uint64_t v18 = 2654435761 * self->_hasHandleWithAllowedType;
      if ((v15 & 0x80000000) != 0) {
        goto LABEL_77;
      }
LABEL_84:
      uint64_t v19 = 0;
      if ((v16 & 0x100000000) != 0) {
        goto LABEL_78;
      }
LABEL_85:
      unint64_t v24 = 0;
      goto LABEL_88;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((v15 & 0x40000000) != 0) {
      goto LABEL_76;
    }
  }
  uint64_t v18 = 0;
  if ((v15 & 0x80000000) == 0) {
    goto LABEL_84;
  }
LABEL_77:
  uint64_t v19 = 2654435761 * self->_isCommunalRequest;
  if ((v16 & 0x100000000) == 0) {
    goto LABEL_85;
  }
LABEL_78:
  float fractionOfCommunalDevicesMatchingCandidate = self->_fractionOfCommunalDevicesMatchingCandidate;
  double v21 = fractionOfCommunalDevicesMatchingCandidate;
  if (fractionOfCommunalDevicesMatchingCandidate < 0.0) {
    double v21 = -fractionOfCommunalDevicesMatchingCandidate;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_88:
  if ((v16 & 0x200000000) != 0)
  {
    uint64_t v25 = 2654435761 * self->_isPlusSignal;
    if ((v16 & 0x400000000) != 0) {
      goto LABEL_90;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((v16 & 0x400000000) != 0)
    {
LABEL_90:
      uint64_t v26 = 2654435761 * self->_isOnlyCandidate;
      goto LABEL_93;
    }
  }
  uint64_t v26 = 0;
LABEL_93:
  NSUInteger v27 = [(NSString *)self->_thirdPartyAppBundleId hash];
  unint64_t v28 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v28 & 0x800000000) != 0)
  {
    uint64_t v29 = 2654435761 * self->_isQueryNormalized;
    if ((v28 & 0x1000000000) != 0)
    {
LABEL_95:
      uint64_t v30 = 2654435761 * self->_isQueryStrippedOfPunctuation;
      if ((v28 & 0x2000000000) != 0) {
        goto LABEL_96;
      }
      goto LABEL_101;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((v28 & 0x1000000000) != 0) {
      goto LABEL_95;
    }
  }
  uint64_t v30 = 0;
  if ((v28 & 0x2000000000) != 0)
  {
LABEL_96:
    uint64_t v31 = 2654435761 * self->_isQueryStrippedOfWhitespace;
    if ((v28 & 0x4000000000) != 0) {
      goto LABEL_97;
    }
LABEL_102:
    uint64_t v32 = 0;
    if ((v28 & 0x8000000000) != 0) {
      goto LABEL_98;
    }
LABEL_103:
    uint64_t v33 = 0;
    return v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v8 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v17 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
  }
LABEL_101:
  uint64_t v31 = 0;
  if ((v28 & 0x4000000000) == 0) {
    goto LABEL_102;
  }
LABEL_97:
  uint64_t v32 = 2654435761 * self->_isQueryStrippedOfSymbols;
  if ((v28 & 0x8000000000) == 0) {
    goto LABEL_103;
  }
LABEL_98:
  uint64_t v33 = 2654435761 * self->_isAsrE3Signal;
  return v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v8 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v17 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_176;
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
  long double v6 = [v4 speechAlternativeRanks];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
    uint64_t v10 = [v4 speechAlternativeRanks];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  unsigned int v13 = *(_DWORD *)(v4 + 141);
  if ((v12 & 1) != (v13 & 1)) {
    goto LABEL_176;
  }
  if (v12)
  {
    int isQueryStrippedOfTitles = self->_isQueryStrippedOfTitles;
    if (isQueryStrippedOfTitles != [v4 isQueryStrippedOfTitles]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v15 = (v12 >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_176;
  }
  if (v15)
  {
    int isSuggestedContact = self->_isSuggestedContact;
    if (isSuggestedContact != [v4 isSuggestedContact]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v17 = (v12 >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_176;
  }
  if (v17)
  {
    int areAllQueryTokensInContact = self->_areAllQueryTokensInContact;
    if (areAllQueryTokensInContact != [v4 areAllQueryTokensInContact]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v19 = (v12 >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_176;
  }
  if (v19)
  {
    int areAllPrimaryContactTokensInQuery = self->_areAllPrimaryContactTokensInQuery;
    if (areAllPrimaryContactTokensInQuery != [v4 areAllPrimaryContactTokensInQuery]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v21 = (v12 >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1)) {
    goto LABEL_176;
  }
  if (v21)
  {
    int isHypocorism = self->_isHypocorism;
    if (isHypocorism != [v4 isHypocorism]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v23 = (v12 >> 5) & 1;
  if (v23 != ((v13 >> 5) & 1)) {
    goto LABEL_176;
  }
  if (v23)
  {
    int hasSuggestedProperties = self->_hasSuggestedProperties;
    if (hasSuggestedProperties != [v4 hasSuggestedProperties]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v25 = (v12 >> 6) & 1;
  if (v25 != ((v13 >> 6) & 1)) {
    goto LABEL_176;
  }
  if (v25)
  {
    int isPartialNameMatch = self->_isPartialNameMatch;
    if (isPartialNameMatch != [v4 isPartialNameMatch]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v27 = (v12 >> 7) & 1;
  if (v27 != ((v13 >> 7) & 1)) {
    goto LABEL_176;
  }
  if (v27)
  {
    int isFromStandardSearch = self->_isFromStandardSearch;
    if (isFromStandardSearch != [v4 isFromStandardSearch]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v29 = (v12 >> 8) & 1;
  if (v29 != ((v13 >> 8) & 1)) {
    goto LABEL_176;
  }
  if (v29)
  {
    int isFromNLXSearch = self->_isFromNLXSearch;
    if (isFromNLXSearch != [v4 isFromNLXSearch]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v31 = (v12 >> 9) & 1;
  if (v31 != ((v13 >> 9) & 1)) {
    goto LABEL_176;
  }
  if (v31)
  {
    int isFromSRRSearch = self->_isFromSRRSearch;
    if (isFromSRRSearch != [v4 isFromSRRSearch]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v33 = (v12 >> 10) & 1;
  if (v33 != ((v13 >> 10) & 1)) {
    goto LABEL_176;
  }
  if (v33)
  {
    float nlxScore = self->_nlxScore;
    [v4 nlxScore];
    if (nlxScore != v35) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v36 = (v12 >> 11) & 1;
  if (v36 != ((v13 >> 11) & 1)) {
    goto LABEL_176;
  }
  if (v36)
  {
    float srrScore = self->_srrScore;
    [v4 srrScore];
    if (srrScore != v38) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v39 = (v12 >> 12) & 1;
  if (v39 != ((v13 >> 12) & 1)) {
    goto LABEL_176;
  }
  if (v39)
  {
    int isRecent = self->_isRecent;
    if (isRecent != [v4 isRecent]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v41 = (v12 >> 13) & 1;
  if (v41 != ((v13 >> 13) & 1)) {
    goto LABEL_176;
  }
  if (v41)
  {
    int isRecentInSameDomain = self->_isRecentInSameDomain;
    if (isRecentInSameDomain != [v4 isRecentInSameDomain]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v43 = (v12 >> 14) & 1;
  if (v43 != ((v13 >> 14) & 1)) {
    goto LABEL_176;
  }
  if (v43)
  {
    int isRecentInSiriRequest = self->_isRecentInSiriRequest;
    if (isRecentInSiriRequest != [v4 isRecentInSiriRequest]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v45 = (v12 >> 15) & 1;
  if (v45 != ((v13 >> 15) & 1)) {
    goto LABEL_176;
  }
  if (v45)
  {
    int isRecentlyCorrected = self->_isRecentlyCorrected;
    if (isRecentlyCorrected != [v4 isRecentlyCorrected]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v47 = HIWORD(v12) & 1;
  if (v47 != (HIWORD(v13) & 1)) {
    goto LABEL_176;
  }
  if (v47)
  {
    int recencyRank = self->_recencyRank;
    if (recencyRank != [v4 recencyRank]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v49 = (v12 >> 17) & 1;
  if (v49 != ((v13 >> 17) & 1)) {
    goto LABEL_176;
  }
  if (v49)
  {
    int recencyRankInSameDomain = self->_recencyRankInSameDomain;
    if (recencyRankInSameDomain != [v4 recencyRankInSameDomain]) {
      goto LABEL_176;
    }
    unsigned int v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v13 = *(_DWORD *)(v4 + 141);
  }
  int v51 = (v12 >> 18) & 1;
  if (v51 != ((v13 >> 18) & 1)) {
    goto LABEL_176;
  }
  if (v51)
  {
    int recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
    if (recencyRankInSiriRequest != [v4 recencyRankInSiriRequest]) {
      goto LABEL_176;
    }
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
  long double v6 = [v4 historyStats];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v53 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    uint64_t v55 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
    uint64_t v56 = [v4 historyStats];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
  long double v6 = [v4 historyStatsInSameDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v58 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
  if (v58)
  {
    uint64_t v59 = (void *)v58;
    uint64_t v60 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
    uint64_t v61 = [v4 historyStatsInSameDomain];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
  long double v6 = [v4 historyStatsInSiriRequests];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v63 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    uint64_t v65 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
    uint64_t v66 = [v4 historyStatsInSiriRequests];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  int v69 = (v68 >> 19) & 1;
  unsigned int v70 = *(_DWORD *)(v4 + 141);
  if (v69 != ((v70 >> 19) & 1)) {
    goto LABEL_176;
  }
  if (v69)
  {
    int isMeCard = self->_isMeCard;
    if (isMeCard != [v4 isMeCard]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v72 = (v68 >> 20) & 1;
  if (v72 != ((v70 >> 20) & 1)) {
    goto LABEL_176;
  }
  if (v72)
  {
    int isMeCardRelation = self->_isMeCardRelation;
    if (isMeCardRelation != [v4 isMeCardRelation]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v74 = (v68 >> 21) & 1;
  if (v74 != ((v70 >> 21) & 1)) {
    goto LABEL_176;
  }
  if (v74)
  {
    int isMeCardRelationExactMatch = self->_isMeCardRelationExactMatch;
    if (isMeCardRelationExactMatch != [v4 isMeCardRelationExactMatch]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v76 = (v68 >> 22) & 1;
  if (v76 != ((v70 >> 22) & 1)) {
    goto LABEL_176;
  }
  if (v76)
  {
    int isRelationAlias = self->_isRelationAlias;
    if (isRelationAlias != [v4 isRelationAlias]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v78 = (v68 >> 23) & 1;
  if (v78 != ((v70 >> 23) & 1)) {
    goto LABEL_176;
  }
  if (v78)
  {
    int areQueryDiacriticsRemoved = self->_areQueryDiacriticsRemoved;
    if (areQueryDiacriticsRemoved != [v4 areQueryDiacriticsRemoved]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v80 = HIBYTE(v68) & 1;
  if (v80 != (HIBYTE(v70) & 1)) {
    goto LABEL_176;
  }
  if (v80)
  {
    int isQueryNameDerivedFromRelationshipLabel = self->_isQueryNameDerivedFromRelationshipLabel;
    if (isQueryNameDerivedFromRelationshipLabel != [v4 isQueryNameDerivedFromRelationshipLabel])goto LABEL_176; {
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    }
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v82 = (v68 >> 25) & 1;
  if (v82 != ((v70 >> 25) & 1)) {
    goto LABEL_176;
  }
  if (v82)
  {
    int isQueryRelationshipLabelDerivedFromName = self->_isQueryRelationshipLabelDerivedFromName;
    if (isQueryRelationshipLabelDerivedFromName != [v4 isQueryRelationshipLabelDerivedFromName])goto LABEL_176; {
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    }
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v84 = (v68 >> 26) & 1;
  if (v84 != ((v70 >> 26) & 1)) {
    goto LABEL_176;
  }
  if (v84)
  {
    int isThirdPartyMatch = self->_isThirdPartyMatch;
    if (isThirdPartyMatch != [v4 isThirdPartyMatch]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v86 = (v68 >> 27) & 1;
  if (v86 != ((v70 >> 27) & 1)) {
    goto LABEL_176;
  }
  if (v86)
  {
    int isFavorite = self->_isFavorite;
    if (isFavorite != [v4 isFavorite]) {
      goto LABEL_176;
    }
    unsigned int v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    unsigned int v70 = *(_DWORD *)(v4 + 141);
  }
  int v88 = (v68 >> 28) & 1;
  if (v88 != ((v70 >> 28) & 1)) {
    goto LABEL_176;
  }
  if (v88)
  {
    int isTransliterated = self->_isTransliterated;
    if (isTransliterated != [v4 isTransliterated]) {
      goto LABEL_176;
    }
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
  long double v6 = [v4 requestMatchSignalSet];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v90 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
    v93 = [v4 requestMatchSignalSet];
    int v94 = [v92 isEqual:v93];

    if (!v94) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self handlesWithPrivacySignalSets];
  long double v6 = [v4 handlesWithPrivacySignalSets];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_175;
  }
  uint64_t v95 = [(INFERENCESchemaINFERENCEContactSignalSet *)self handlesWithPrivacySignalSets];
  if (v95)
  {
    v96 = (void *)v95;
    v97 = [(INFERENCESchemaINFERENCEContactSignalSet *)self handlesWithPrivacySignalSets];
    v98 = [v4 handlesWithPrivacySignalSets];
    int v99 = [v97 isEqual:v98];

    if (!v99) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  uint64_t v100 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unsigned int v101 = (v100 >> 29) & 1;
  uint64_t v102 = *(unsigned int *)(v4 + 141);
  if (v101 != ((v102 >> 29) & 1)) {
    goto LABEL_176;
  }
  if (v101)
  {
    int hasHandleWithPreferredType = self->_hasHandleWithPreferredType;
    if (hasHandleWithPreferredType != [v4 hasHandleWithPreferredType]) {
      goto LABEL_176;
    }
    unint64_t v103 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    uint64_t v102 = *(unsigned int *)(v4 + 141);
    unint64_t v104 = v102 | ((unint64_t)v4[145] << 32);
    LODWORD(v100) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  }
  else
  {
    unint64_t v103 = v100 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    unint64_t v104 = v102 | ((unint64_t)v4[145] << 32);
  }
  unsigned int v106 = (v100 >> 30) & 1;
  if (v106 != ((v102 >> 30) & 1)) {
    goto LABEL_176;
  }
  if (v106)
  {
    int hasHandleWithAllowedType = self->_hasHandleWithAllowedType;
    if (hasHandleWithAllowedType != [v4 hasHandleWithAllowedType]) {
      goto LABEL_176;
    }
    unint64_t v103 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    unint64_t v104 = *(unsigned int *)(v4 + 141) | ((unint64_t)v4[145] << 32);
  }
  if (((v104 ^ v103) & 0x80000000) != 0) {
    goto LABEL_176;
  }
  if ((v103 & 0x80000000) != 0)
  {
    int isCommunalRequest = self->_isCommunalRequest;
    if (isCommunalRequest != [v4 isCommunalRequest]) {
      goto LABEL_176;
    }
    unsigned int v108 = v4[145];
    LODWORD(v109) = v108 >> 1;
    unsigned int v111 = *((unsigned __int8 *)&self->_has + 1);
    LODWORD(v112) = v111 >> 1;
    LODWORD(v110) = v108 >> 2;
    LODWORD(v113) = v111 >> 2;
  }
  else
  {
    LOBYTE(v108) = BYTE4(v104);
    uint64_t v109 = (v104 >> 33) & 0x7F;
    uint64_t v110 = (v104 >> 34) & 0x3F;
    LOBYTE(v111) = BYTE4(v103);
    uint64_t v112 = (v103 >> 33) & 0x7F;
    uint64_t v113 = (v103 >> 34) & 0x3F;
  }
  int v115 = v111 & 1;
  if (v115 != (v108 & 1)) {
    goto LABEL_176;
  }
  if (v115)
  {
    float fractionOfCommunalDevicesMatchingCandidate = self->_fractionOfCommunalDevicesMatchingCandidate;
    [v4 fractionOfCommunalDevicesMatchingCandidate];
    if (fractionOfCommunalDevicesMatchingCandidate != v117) {
      goto LABEL_176;
    }
    unsigned int v118 = *((unsigned __int8 *)&self->_has + 1);
    LODWORD(v113) = v4[145];
    LODWORD(v109) = v113 >> 1;
    LODWORD(v112) = v118 >> 1;
    unsigned int v119 = v118 >> 2;
    LODWORD(v110) = v113 >> 2;
    LOBYTE(v113) = v119;
  }
  int v120 = v112 & 1;
  if (v120 != (v109 & 1)) {
    goto LABEL_176;
  }
  if (v120)
  {
    int isPlusSignal = self->_isPlusSignal;
    if (isPlusSignal != [v4 isPlusSignal]) {
      goto LABEL_176;
    }
    LODWORD(v110) = v4[145] >> 2;
    LODWORD(v113) = *((unsigned __int8 *)&self->_has + 1) >> 2;
  }
  int v122 = v113 & 1;
  if (v122 != (v110 & 1)) {
    goto LABEL_176;
  }
  if (v122)
  {
    int isOnlyCandidate = self->_isOnlyCandidate;
    if (isOnlyCandidate != [v4 isOnlyCandidate]) {
      goto LABEL_176;
    }
  }
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self thirdPartyAppBundleId];
  long double v6 = [v4 thirdPartyAppBundleId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_175:

    goto LABEL_176;
  }
  uint64_t v124 = [(INFERENCESchemaINFERENCEContactSignalSet *)self thirdPartyAppBundleId];
  if (v124)
  {
    v125 = (void *)v124;
    v126 = [(INFERENCESchemaINFERENCEContactSignalSet *)self thirdPartyAppBundleId];
    v127 = [v4 thirdPartyAppBundleId];
    int v128 = [v126 isEqual:v127];

    if (!v128) {
      goto LABEL_176;
    }
  }
  else
  {
  }
  uint64_t v131 = *((unsigned __int8 *)&self->_has + 1);
  unsigned int v132 = (v131 >> 3) & 1;
  uint64_t v133 = v4[145];
  if (v132 == ((v133 >> 3) & 1))
  {
    if (v132)
    {
      int isQueryNormalized = self->_isQueryNormalized;
      if (isQueryNormalized != [v4 isQueryNormalized]) {
        goto LABEL_176;
      }
      unint64_t v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
      unsigned int v141 = v4[145];
      LODWORD(v136) = v141 >> 4;
      LODWORD(v137) = v141 >> 5;
      LODWORD(v138) = v141 >> 6;
      LODWORD(v139) = v141 >> 7;
    }
    else
    {
      unint64_t v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | (unint64_t)(v131 << 32);
      unint64_t v135 = *(unsigned int *)(v4 + 141) | (unint64_t)(v133 << 32);
      unint64_t v136 = v135 >> 36;
      unint64_t v137 = v135 >> 37;
      unint64_t v138 = v135 >> 38;
      unint64_t v139 = v135 >> 39;
    }
    uint64_t v142 = (v134 >> 36) & 1;
    if (v142 == (v136 & 1))
    {
      if (v142)
      {
        int isQueryStrippedOfPunctuation = self->_isQueryStrippedOfPunctuation;
        if (isQueryStrippedOfPunctuation != [v4 isQueryStrippedOfPunctuation]) {
          goto LABEL_176;
        }
        unint64_t v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
        unsigned int v144 = v4[145];
        LODWORD(v137) = v144 >> 5;
        LODWORD(v138) = v144 >> 6;
        LODWORD(v139) = v144 >> 7;
      }
      uint64_t v145 = (v134 >> 37) & 1;
      if (v145 == (v137 & 1))
      {
        if (v145)
        {
          int isQueryStrippedOfWhitespace = self->_isQueryStrippedOfWhitespace;
          if (isQueryStrippedOfWhitespace != [v4 isQueryStrippedOfWhitespace]) {
            goto LABEL_176;
          }
          unint64_t v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
          unsigned int v147 = v4[145];
          LODWORD(v138) = v147 >> 6;
          LODWORD(v139) = v147 >> 7;
        }
        uint64_t v148 = (v134 >> 38) & 1;
        if (v148 == (v138 & 1))
        {
          if (v148)
          {
            int isQueryStrippedOfSymbols = self->_isQueryStrippedOfSymbols;
            if (isQueryStrippedOfSymbols != [v4 isQueryStrippedOfSymbols]) {
              goto LABEL_176;
            }
            unint64_t v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
            LODWORD(v139) = v4[145] >> 7;
          }
          if (v139 == ((v134 >> 39) & 1))
          {
            if ((v134 & 0x8000000000) == 0
              || (int isAsrE3Signal = self->_isAsrE3Signal, isAsrE3Signal == [v4 isAsrE3Signal]))
            {
              BOOL v129 = 1;
              goto LABEL_177;
            }
          }
        }
      }
    }
  }
LABEL_176:
  BOOL v129 = 0;
LABEL_177:

  return v129;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];

  if (v5)
  {
    long double v6 = [(INFERENCESchemaINFERENCEContactSignalSet *)self speechAlternativeRanks];
    PBDataWriterWriteSubmessage();
  }
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if (v7)
  {
    PBDataWriterWriteBOOLField();
    int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_66;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_14:
    if ((v7 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteFloatField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x800) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteFloatField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x2000) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x4000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x8000) == 0)
  {
LABEL_19:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x10000) == 0)
  {
LABEL_20:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  int v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x20000) == 0)
  {
LABEL_21:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40000) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  unint64_t v8 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];

  if (v8)
  {
    unint64_t v9 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStats];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v10 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];

  if (v10)
  {
    int v11 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSameDomain];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v12 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];

  if (v12)
  {
    unsigned int v13 = [(INFERENCESchemaINFERENCEContactSignalSet *)self historyStatsInSiriRequests];
    PBDataWriterWriteSubmessage();
  }
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    if ((v14 & 0x100000) == 0)
    {
LABEL_31:
      if ((v14 & 0x200000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_85;
    }
  }
  else if ((v14 & 0x100000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x200000) == 0)
  {
LABEL_32:
    if ((v14 & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x400000) == 0)
  {
LABEL_33:
    if ((v14 & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x800000) == 0)
  {
LABEL_34:
    if ((v14 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v14 & 0x2000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v14 & 0x4000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x4000000) == 0)
  {
LABEL_37:
    if ((v14 & 0x8000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  int v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v14 & 0x10000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x10000000) != 0) {
LABEL_39:
  }
    PBDataWriterWriteBOOLField();
LABEL_40:
  int v15 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];

  if (v15)
  {
    unint64_t v16 = [(INFERENCESchemaINFERENCEContactSignalSet *)self requestMatchSignalSet];
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v17 = self->_handlesWithPrivacySignalSets;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  uint64_t v22 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v23 = v22 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v22 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v26 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    unint64_t v23 = v26 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v26 & 0x40000000) == 0)
    {
LABEL_51:
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_52;
      }
      goto LABEL_95;
    }
  }
  else if ((v22 & 0x40000000) == 0)
  {
    goto LABEL_51;
  }
  PBDataWriterWriteBOOLField();
  unint64_t v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000000) == 0)
  {
LABEL_52:
    if ((v23 & 0x100000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  unint64_t v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v23 & 0x100000000) == 0)
  {
LABEL_53:
    if ((v23 & 0x200000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteFloatField();
  unint64_t v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v23 & 0x200000000) == 0)
  {
LABEL_54:
    if ((v23 & 0x400000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x400000000) != 0) {
LABEL_55:
  }
    PBDataWriterWriteBOOLField();
LABEL_56:
  unint64_t v24 = [(INFERENCESchemaINFERENCEContactSignalSet *)self thirdPartyAppBundleId];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  unint64_t v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v25 & 0x1000000000) == 0)
    {
LABEL_60:
      if ((v25 & 0x2000000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_101;
    }
  }
  else if ((v25 & 0x1000000000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteBOOLField();
  unint64_t v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x2000000000) == 0)
  {
LABEL_61:
    if ((v25 & 0x4000000000) == 0) {
      goto LABEL_62;
    }
LABEL_102:
    PBDataWriterWriteBOOLField();
    if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x8000000000) == 0) {
      goto LABEL_63;
    }
LABEL_103:
    PBDataWriterWriteBOOLField();
    goto LABEL_63;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  unint64_t v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x4000000000) != 0) {
    goto LABEL_102;
  }
LABEL_62:
  if ((v25 & 0x8000000000) != 0) {
    goto LABEL_103;
  }
LABEL_63:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactSignalSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteIsAsrE3Signal
{
  *((unsigned char *)&self->_has + 1) &= ~0x80u;
}

- (void)setHasIsAsrE3Signal:(BOOL)a3
{
  unint64_t v3 = 0xFFFFFF8000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *((unsigned char *)&self->_has + 1) = (v3 & 0xFFFFFF80FFFFFFFFLL | ((unint64_t)(*((unsigned char *)&self->_has + 1) & 0x7F) << 32)) >> 32;
}

- (BOOL)hasIsAsrE3Signal
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsAsrE3Signal:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x8000000000) >> 32;
  self->_int isAsrE3Signal = a3;
}

- (void)deleteIsQueryStrippedOfSymbols
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryStrippedOfSymbols:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryStrippedOfSymbols:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryStrippedOfSymbols
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsQueryStrippedOfSymbols:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x4000000000) >> 32;
  self->_int isQueryStrippedOfSymbols = a3;
}

- (void)deleteIsQueryStrippedOfWhitespace
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryStrippedOfWhitespace:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryStrippedOfWhitespace:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryStrippedOfWhitespace
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsQueryStrippedOfWhitespace:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x2000000000) >> 32;
  self->_int isQueryStrippedOfWhitespace = a3;
}

- (void)deleteIsQueryStrippedOfPunctuation
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryStrippedOfPunctuation:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryStrippedOfPunctuation:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryStrippedOfPunctuation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsQueryStrippedOfPunctuation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x1000000000) >> 32;
  self->_int isQueryStrippedOfPunctuation = a3;
}

- (void)deleteIsQueryNormalized
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryNormalized:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryNormalized:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryNormalized
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsQueryNormalized:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x800000000) >> 32;
  self->_int isQueryNormalized = a3;
}

- (void)deleteThirdPartyAppBundleId
{
}

- (BOOL)hasThirdPartyAppBundleId
{
  return self->_thirdPartyAppBundleId != 0;
}

- (void)deleteIsOnlyCandidate
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsOnlyCandidate:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsOnlyCandidate:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsOnlyCandidate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsOnlyCandidate:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x400000000) >> 32;
  self->_int isOnlyCandidate = a3;
}

- (void)deleteIsPlusSignal
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsPlusSignal:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsPlusSignal:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsPlusSignal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsPlusSignal:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x200000000) >> 32;
  self->_int isPlusSignal = a3;
}

- (void)deleteFractionOfCommunalDevicesMatchingCandidate
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setFractionOfCommunalDevicesMatchingCandidate:0.0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasFractionOfCommunalDevicesMatchingCandidate:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasFractionOfCommunalDevicesMatchingCandidate
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setFractionOfCommunalDevicesMatchingCandidate:(float)a3
{
  *((unsigned char *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x100000000) >> 32;
  self->_float fractionOfCommunalDevicesMatchingCandidate = a3;
}

- (void)deleteIsCommunalRequest
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsCommunalRequest:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0x7FFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsCommunalRequest:(BOOL)a3
{
  unsigned int v3 = 0x80000000;
  if (!a3) {
    unsigned int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x7FFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsCommunalRequest
{
  return *(_DWORD *)(&self->_isAsrE3Signal + 1) >> 31;
}

- (void)setIsCommunalRequest:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80000000;
  self->_int isCommunalRequest = a3;
}

- (void)deleteHasHandleWithAllowedType
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setHasHandleWithAllowedType:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xBFFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasHasHandleWithAllowedType:(BOOL)a3
{
  int v3 = 0x40000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xBFFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasHasHandleWithAllowedType
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 30) & 1;
}

- (void)setHasHandleWithAllowedType:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40000000u;
  self->_int hasHandleWithAllowedType = a3;
}

- (void)deleteHasHandleWithPreferredType
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setHasHandleWithPreferredType:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xDFFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasHasHandleWithPreferredType:(BOOL)a3
{
  int v3 = 0x20000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xDFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xDFFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasHasHandleWithPreferredType
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 29) & 1;
}

- (void)setHasHandleWithPreferredType:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20000000u;
  self->_int hasHandleWithPreferredType = a3;
}

- (id)handlesWithPrivacySignalSetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_handlesWithPrivacySignalSets objectAtIndexedSubscript:a3];
}

- (unint64_t)handlesWithPrivacySignalSetsCount
{
  return [(NSArray *)self->_handlesWithPrivacySignalSets count];
}

- (void)addHandlesWithPrivacySignalSets:(id)a3
{
  id v4 = a3;
  handlesWithPrivacySignalSets = self->_handlesWithPrivacySignalSets;
  id v8 = v4;
  if (!handlesWithPrivacySignalSets)
  {
    long double v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = self->_handlesWithPrivacySignalSets;
    self->_handlesWithPrivacySignalSets = v6;

    id v4 = v8;
    handlesWithPrivacySignalSets = self->_handlesWithPrivacySignalSets;
  }
  [(NSArray *)handlesWithPrivacySignalSets addObject:v4];
}

- (void)clearHandlesWithPrivacySignalSets
{
}

- (void)deleteRequestMatchSignalSet
{
}

- (BOOL)hasRequestMatchSignalSet
{
  return self->_requestMatchSignalSet != 0;
}

- (void)deleteIsTransliterated
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsTransliterated:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xEFFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsTransliterated:(BOOL)a3
{
  int v3 = 0x10000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xEFFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsTransliterated
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 28) & 1;
}

- (void)setIsTransliterated:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10000000u;
  self->_int isTransliterated = a3;
}

- (void)deleteIsFavorite
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsFavorite:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xF7FFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsFavorite:(BOOL)a3
{
  int v3 = 0x8000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xF7FFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xF7FFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsFavorite
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 27) & 1;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x8000000u;
  self->_int isFavorite = a3;
}

- (void)deleteIsThirdPartyMatch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsThirdPartyMatch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFBFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsThirdPartyMatch:(BOOL)a3
{
  int v3 = 0x4000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFBFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsThirdPartyMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 26) & 1;
}

- (void)setIsThirdPartyMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x4000000u;
  self->_int isThirdPartyMatch = a3;
}

- (void)deleteIsQueryRelationshipLabelDerivedFromName
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryRelationshipLabelDerivedFromName:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFDFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryRelationshipLabelDerivedFromName:(BOOL)a3
{
  int v3 = 0x2000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFDFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFDFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryRelationshipLabelDerivedFromName
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 25) & 1;
}

- (void)setIsQueryRelationshipLabelDerivedFromName:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x2000000u;
  self->_int isQueryRelationshipLabelDerivedFromName = a3;
}

- (void)deleteIsQueryNameDerivedFromRelationshipLabel
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsQueryNameDerivedFromRelationshipLabel:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFEFFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3
{
  int v3 = 0x1000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFEFFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsQueryNameDerivedFromRelationshipLabel
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 24) & 1;
}

- (void)setIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x1000000u;
  self->_int isQueryNameDerivedFromRelationshipLabel = a3;
}

- (void)deleteAreQueryDiacriticsRemoved
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setAreQueryDiacriticsRemoved:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFF7FFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasAreQueryDiacriticsRemoved:(BOOL)a3
{
  int v3 = 0x800000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFF7FFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasAreQueryDiacriticsRemoved
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 23) & 1;
}

- (void)setAreQueryDiacriticsRemoved:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x800000u;
  self->_int areQueryDiacriticsRemoved = a3;
}

- (void)deleteIsRelationAlias
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsRelationAlias:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFBFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsRelationAlias:(BOOL)a3
{
  int v3 = 0x400000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFBFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsRelationAlias
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 22) & 1;
}

- (void)setIsRelationAlias:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x400000u;
  self->_int isRelationAlias = a3;
}

- (void)deleteIsMeCardRelationExactMatch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsMeCardRelationExactMatch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFDFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsMeCardRelationExactMatch:(BOOL)a3
{
  int v3 = 0x200000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFDFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFDFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsMeCardRelationExactMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 21) & 1;
}

- (void)setIsMeCardRelationExactMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x200000u;
  self->_int isMeCardRelationExactMatch = a3;
}

- (void)deleteIsMeCardRelation
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsMeCardRelation:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFEFFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsMeCardRelation:(BOOL)a3
{
  int v3 = 0x100000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFEFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFEFFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsMeCardRelation
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 20) & 1;
}

- (void)setIsMeCardRelation:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x100000u;
  self->_int isMeCardRelation = a3;
}

- (void)deleteIsMeCard
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsMeCard:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFF7FFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsMeCard:(BOOL)a3
{
  int v3 = 0x80000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFF7FFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFF7FFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsMeCard
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 19) & 1;
}

- (void)setIsMeCard:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80000u;
  self->_int isMeCard = a3;
}

- (void)deleteHistoryStatsInSiriRequests
{
}

- (BOOL)hasHistoryStatsInSiriRequests
{
  return self->_historyStatsInSiriRequests != 0;
}

- (void)deleteHistoryStatsInSameDomain
{
}

- (BOOL)hasHistoryStatsInSameDomain
{
  return self->_historyStatsInSameDomain != 0;
}

- (void)deleteHistoryStats
{
}

- (BOOL)hasHistoryStats
{
  return self->_historyStats != 0;
}

- (void)deleteRecencyRankInSiriRequest
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setRecencyRankInSiriRequest:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFBFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasRecencyRankInSiriRequest:(BOOL)a3
{
  int v3 = 0x40000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFBFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFBFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasRecencyRankInSiriRequest
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 18) & 1;
}

- (void)setRecencyRankInSiriRequest:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40000u;
  self->_int recencyRankInSiriRequest = a3;
}

- (void)deleteRecencyRankInSameDomain
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setRecencyRankInSameDomain:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFDFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasRecencyRankInSameDomain:(BOOL)a3
{
  int v3 = 0x20000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFDFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFDFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasRecencyRankInSameDomain
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 17) & 1;
}

- (void)setRecencyRankInSameDomain:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20000u;
  self->_int recencyRankInSameDomain = a3;
}

- (void)deleteRecencyRank
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setRecencyRank:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFEFFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasRecencyRank:(BOOL)a3
{
  int v3 = 0x10000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFEFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFEFFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasRecencyRank
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 16) & 1;
}

- (void)setRecencyRank:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10000u;
  self->_int recencyRank = a3;
}

- (void)deleteIsRecentlyCorrected
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsRecentlyCorrected:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFF7FFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsRecentlyCorrected:(BOOL)a3
{
  int v3 = 0x8000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFF7FFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFF7FFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsRecentlyCorrected
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 15) & 1;
}

- (void)setIsRecentlyCorrected:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x8000u;
  self->_int isRecentlyCorrected = a3;
}

- (void)deleteIsRecentInSiriRequest
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsRecentInSiriRequest:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFBFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsRecentInSiriRequest:(BOOL)a3
{
  int v3 = 0x4000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFBFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsRecentInSiriRequest
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 14) & 1;
}

- (void)setIsRecentInSiriRequest:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x4000u;
  self->_int isRecentInSiriRequest = a3;
}

- (void)deleteIsRecentInSameDomain
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsRecentInSameDomain:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFDFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsRecentInSameDomain:(BOOL)a3
{
  int v3 = 0x2000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFDFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFDFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsRecentInSameDomain
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 13) & 1;
}

- (void)setIsRecentInSameDomain:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x2000u;
  self->_int isRecentInSameDomain = a3;
}

- (void)deleteIsRecent
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsRecent:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFEFFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsRecent:(BOOL)a3
{
  int v3 = 4096;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFEFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFEFFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsRecent
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 12) & 1;
}

- (void)setIsRecent:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x1000u;
  self->_int isRecent = a3;
}

- (void)deleteSrrScore
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setSrrScore:0.0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFF7FF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasSrrScore:(BOOL)a3
{
  int v3 = 2048;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFF7FF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFF7FF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasSrrScore
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 11) & 1;
}

- (void)setSrrScore:(float)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x800u;
  self->_float srrScore = a3;
}

- (void)deleteNlxScore
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setNlxScore:0.0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFBFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasNlxScore:(BOOL)a3
{
  int v3 = 1024;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFBFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasNlxScore
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 10) & 1;
}

- (void)setNlxScore:(float)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x400u;
  self->_float nlxScore = a3;
}

- (void)deleteIsFromSRRSearch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsFromSRRSearch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFDFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsFromSRRSearch:(BOOL)a3
{
  int v3 = 512;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFDFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsFromSRRSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 9) & 1;
}

- (void)setIsFromSRRSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x200u;
  self->_int isFromSRRSearch = a3;
}

- (void)deleteIsFromNLXSearch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsFromNLXSearch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFEFF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsFromNLXSearch:(BOOL)a3
{
  int v3 = 256;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFEFF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsFromNLXSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 8) & 1;
}

- (void)setIsFromNLXSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x100u;
  self->_int isFromNLXSearch = a3;
}

- (void)deleteIsFromStandardSearch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsFromStandardSearch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFF7F;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsFromStandardSearch:(BOOL)a3
{
  int v3 = 128;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFF7F | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFF7F | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsFromStandardSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 7) & 1;
}

- (void)setIsFromStandardSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80u;
  self->_int isFromStandardSearch = a3;
}

- (void)deleteIsPartialNameMatch
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsPartialNameMatch:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFBF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsPartialNameMatch:(BOOL)a3
{
  int v3 = 64;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFBF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsPartialNameMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 6) & 1;
}

- (void)setIsPartialNameMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40u;
  self->_int isPartialNameMatch = a3;
}

- (void)deleteHasSuggestedProperties
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setHasSuggestedProperties:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFDF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasHasSuggestedProperties:(BOOL)a3
{
  int v3 = 32;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFDF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasHasSuggestedProperties
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 5) & 1;
}

- (void)setHasSuggestedProperties:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20u;
  self->_int hasSuggestedProperties = a3;
}

- (void)deleteIsHypocorism
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsHypocorism:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFEF;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsHypocorism:(BOOL)a3
{
  int v3 = 16;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFEF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFEF | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsHypocorism
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 4) & 1;
}

- (void)setIsHypocorism:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10u;
  self->_int isHypocorism = a3;
}

- (void)deleteAreAllPrimaryContactTokensInQuery
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setAreAllPrimaryContactTokensInQuery:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFF7;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  int v3 = 8;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFF7 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFF7 | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasAreAllPrimaryContactTokensInQuery
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 3) & 1;
}

- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 8u;
  self->_int areAllPrimaryContactTokensInQuery = a3;
}

- (void)deleteAreAllQueryTokensInContact
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setAreAllQueryTokensInContact:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFFB;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasAreAllQueryTokensInContact:(BOOL)a3
{
  int v3 = 4;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFB | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFB | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasAreAllQueryTokensInContact
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 2) & 1;
}

- (void)setAreAllQueryTokensInContact:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 4u;
  self->_int areAllQueryTokensInContact = a3;
}

- (void)deleteIsSuggestedContact
{
  [(INFERENCESchemaINFERENCEContactSignalSet *)self setIsSuggestedContact:0];
  uint64_t v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFFD;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasIsSuggestedContact:(BOOL)a3
{
  int v3 = 2;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFD | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFD | v3;
  *((unsigned char *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasIsSuggestedContact
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 1) & 1;
}

- (void)setIsSuggestedContact:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 2u;
  self->_int isSuggestedContact = a3;
}

- (void)deleteIsQueryStrippedOfTitles
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) &= ~1u;
}

- (void)setHasIsQueryStrippedOfTitles:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFE | a3;
}

- (BOOL)hasIsQueryStrippedOfTitles
{
  return *(_DWORD *)(&self->_isAsrE3Signal + 1) & 1;
}

- (void)setIsQueryStrippedOfTitles:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 1u;
  self->_int isQueryStrippedOfTitles = a3;
}

- (void)deleteSpeechAlternativeRanks
{
}

- (BOOL)hasSpeechAlternativeRanks
{
  return self->_speechAlternativeRanks != 0;
}

@end
@interface CAARSchemaCAARActionFeatureSet
- (BOOL)appNameMentioned;
- (BOOL)entityTypeMentioned;
- (BOOL)hasActionCandidateId;
- (BOOL)hasActionIdentifier;
- (BOOL)hasActionLevelDisambiguationHistory;
- (BOOL)hasAppHistoryFeatures;
- (BOOL)hasAppLevelDisambiguationHistory;
- (BOOL)hasAppNameMentioned;
- (BOOL)hasDomainProtectionLevel;
- (BOOL)hasEntitySaliencyMaxScore;
- (BOOL)hasEntityTypeMentioned;
- (BOOL)hasIsAmbiguousFirstRunPreviouslyShown;
- (BOOL)hasIsAppInForeground;
- (BOOL)hasIsAutoShortcutEnabled;
- (BOOL)hasIsAutoshortcut;
- (BOOL)hasIsAutoshortcutAppOnScreen;
- (BOOL)hasIsColdOpenAllowlist;
- (BOOL)hasIsDefaultLinkAction;
- (BOOL)hasIsHighConfidence;
- (BOOL)hasIsInterpretableAsUniversalCommand;
- (BOOL)hasIsLinkAction;
- (BOOL)hasIsLinkActionOnScreen;
- (BOOL)hasIsRepeatedFlowHandlerId;
- (BOOL)hasIsTopRankedParse;
- (BOOL)hasIsTopRankedPlugin;
- (BOOL)hasIsVocabNameMatch;
- (BOOL)hasNlParseProbability;
- (BOOL)hasNumSalientEntities;
- (BOOL)hasProactiveFeatures;
- (BOOL)isAmbiguousFirstRunPreviouslyShown;
- (BOOL)isAppInForeground;
- (BOOL)isAutoShortcutEnabled;
- (BOOL)isAutoshortcut;
- (BOOL)isAutoshortcutAppOnScreen;
- (BOOL)isColdOpenAllowlist;
- (BOOL)isDefaultLinkAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighConfidence;
- (BOOL)isInterpretableAsUniversalCommand;
- (BOOL)isLinkAction;
- (BOOL)isLinkActionOnScreen;
- (BOOL)isRepeatedFlowHandlerId;
- (BOOL)isTopRankedParse;
- (BOOL)isTopRankedPlugin;
- (BOOL)isVocabNameMatch;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARActionFeatureSet)initWithDictionary:(id)a3;
- (CAARSchemaCAARActionFeatureSet)initWithJSON:(id)a3;
- (CAARSchemaCAARActionLevelDisambiguationHistory)actionLevelDisambiguationHistory;
- (CAARSchemaCAARAppHistoryFeatures)appHistoryFeatures;
- (CAARSchemaCAARAppLevelDisambiguationHistory)appLevelDisambiguationHistory;
- (CAARSchemaCAARProactiveFeatures)proactiveFeatures;
- (NSData)jsonData;
- (NSString)actionIdentifier;
- (SISchemaUUID)actionCandidateId;
- (float)nlParseProbability;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)domainProtectionLevel;
- (unint64_t)hash;
- (unsigned)entitySaliencyMaxScore;
- (unsigned)numSalientEntities;
- (void)deleteActionCandidateId;
- (void)deleteActionIdentifier;
- (void)deleteActionLevelDisambiguationHistory;
- (void)deleteAppHistoryFeatures;
- (void)deleteAppLevelDisambiguationHistory;
- (void)deleteAppNameMentioned;
- (void)deleteDomainProtectionLevel;
- (void)deleteEntitySaliencyMaxScore;
- (void)deleteEntityTypeMentioned;
- (void)deleteIsAmbiguousFirstRunPreviouslyShown;
- (void)deleteIsAppInForeground;
- (void)deleteIsAutoShortcutEnabled;
- (void)deleteIsAutoshortcut;
- (void)deleteIsAutoshortcutAppOnScreen;
- (void)deleteIsColdOpenAllowlist;
- (void)deleteIsDefaultLinkAction;
- (void)deleteIsHighConfidence;
- (void)deleteIsInterpretableAsUniversalCommand;
- (void)deleteIsLinkAction;
- (void)deleteIsLinkActionOnScreen;
- (void)deleteIsRepeatedFlowHandlerId;
- (void)deleteIsTopRankedParse;
- (void)deleteIsTopRankedPlugin;
- (void)deleteIsVocabNameMatch;
- (void)deleteNlParseProbability;
- (void)deleteNumSalientEntities;
- (void)deleteProactiveFeatures;
- (void)setActionCandidateId:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setActionLevelDisambiguationHistory:(id)a3;
- (void)setAppHistoryFeatures:(id)a3;
- (void)setAppLevelDisambiguationHistory:(id)a3;
- (void)setAppNameMentioned:(BOOL)a3;
- (void)setDomainProtectionLevel:(int)a3;
- (void)setEntitySaliencyMaxScore:(unsigned int)a3;
- (void)setEntityTypeMentioned:(BOOL)a3;
- (void)setHasActionCandidateId:(BOOL)a3;
- (void)setHasActionIdentifier:(BOOL)a3;
- (void)setHasActionLevelDisambiguationHistory:(BOOL)a3;
- (void)setHasAppHistoryFeatures:(BOOL)a3;
- (void)setHasAppLevelDisambiguationHistory:(BOOL)a3;
- (void)setHasAppNameMentioned:(BOOL)a3;
- (void)setHasDomainProtectionLevel:(BOOL)a3;
- (void)setHasEntitySaliencyMaxScore:(BOOL)a3;
- (void)setHasEntityTypeMentioned:(BOOL)a3;
- (void)setHasIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3;
- (void)setHasIsAppInForeground:(BOOL)a3;
- (void)setHasIsAutoShortcutEnabled:(BOOL)a3;
- (void)setHasIsAutoshortcut:(BOOL)a3;
- (void)setHasIsAutoshortcutAppOnScreen:(BOOL)a3;
- (void)setHasIsColdOpenAllowlist:(BOOL)a3;
- (void)setHasIsDefaultLinkAction:(BOOL)a3;
- (void)setHasIsHighConfidence:(BOOL)a3;
- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3;
- (void)setHasIsLinkAction:(BOOL)a3;
- (void)setHasIsLinkActionOnScreen:(BOOL)a3;
- (void)setHasIsRepeatedFlowHandlerId:(BOOL)a3;
- (void)setHasIsTopRankedParse:(BOOL)a3;
- (void)setHasIsTopRankedPlugin:(BOOL)a3;
- (void)setHasIsVocabNameMatch:(BOOL)a3;
- (void)setHasNlParseProbability:(BOOL)a3;
- (void)setHasNumSalientEntities:(BOOL)a3;
- (void)setHasProactiveFeatures:(BOOL)a3;
- (void)setIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3;
- (void)setIsAppInForeground:(BOOL)a3;
- (void)setIsAutoShortcutEnabled:(BOOL)a3;
- (void)setIsAutoshortcut:(BOOL)a3;
- (void)setIsAutoshortcutAppOnScreen:(BOOL)a3;
- (void)setIsColdOpenAllowlist:(BOOL)a3;
- (void)setIsDefaultLinkAction:(BOOL)a3;
- (void)setIsHighConfidence:(BOOL)a3;
- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3;
- (void)setIsLinkAction:(BOOL)a3;
- (void)setIsLinkActionOnScreen:(BOOL)a3;
- (void)setIsRepeatedFlowHandlerId:(BOOL)a3;
- (void)setIsTopRankedParse:(BOOL)a3;
- (void)setIsTopRankedPlugin:(BOOL)a3;
- (void)setIsVocabNameMatch:(BOOL)a3;
- (void)setNlParseProbability:(float)a3;
- (void)setNumSalientEntities:(unsigned int)a3;
- (void)setProactiveFeatures:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARActionFeatureSet

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAARSchemaCAARActionFeatureSet;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAARSchemaCAARActionFeatureSet *)self deleteActionCandidateId];
  }
  v9 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAARSchemaCAARActionFeatureSet *)self deleteAppHistoryFeatures];
  }
  v12 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAARSchemaCAARActionFeatureSet *)self deleteAppLevelDisambiguationHistory];
  }
  v15 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAARSchemaCAARActionFeatureSet *)self deleteActionLevelDisambiguationHistory];
  }
  v18 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CAARSchemaCAARActionFeatureSet *)self deleteProactiveFeatures];
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
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_proactiveFeatures, 0);
  objc_storeStrong((id *)&self->_actionLevelDisambiguationHistory, 0);
  objc_storeStrong((id *)&self->_appLevelDisambiguationHistory, 0);
  objc_storeStrong((id *)&self->_appHistoryFeatures, 0);
  objc_storeStrong((id *)&self->_actionCandidateId, 0);
}

- (void)setHasActionIdentifier:(BOOL)a3
{
  self->_hasProactiveFeatures = a3;
}

- (void)setHasProactiveFeatures:(BOOL)a3
{
  self->_hasActionLevelDisambiguationHistory = a3;
}

- (void)setHasActionLevelDisambiguationHistory:(BOOL)a3
{
  self->_hasAppLevelDisambiguationHistory = a3;
}

- (void)setHasAppLevelDisambiguationHistory:(BOOL)a3
{
  self->_hasAppHistoryFeatures = a3;
}

- (void)setHasAppHistoryFeatures:(BOOL)a3
{
  self->_hasActionCandidateId = a3;
}

- (void)setHasActionCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (int)domainProtectionLevel
{
  return self->_domainProtectionLevel;
}

- (BOOL)isInterpretableAsUniversalCommand
{
  return self->_isInterpretableAsUniversalCommand;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (BOOL)isAmbiguousFirstRunPreviouslyShown
{
  return self->_isAmbiguousFirstRunPreviouslyShown;
}

- (BOOL)isAutoShortcutEnabled
{
  return self->_isAutoShortcutEnabled;
}

- (void)setProactiveFeatures:(id)a3
{
}

- (CAARSchemaCAARProactiveFeatures)proactiveFeatures
{
  return self->_proactiveFeatures;
}

- (void)setActionLevelDisambiguationHistory:(id)a3
{
}

- (CAARSchemaCAARActionLevelDisambiguationHistory)actionLevelDisambiguationHistory
{
  return self->_actionLevelDisambiguationHistory;
}

- (void)setAppLevelDisambiguationHistory:(id)a3
{
}

- (CAARSchemaCAARAppLevelDisambiguationHistory)appLevelDisambiguationHistory
{
  return self->_appLevelDisambiguationHistory;
}

- (void)setAppHistoryFeatures:(id)a3
{
}

- (CAARSchemaCAARAppHistoryFeatures)appHistoryFeatures
{
  return self->_appHistoryFeatures;
}

- (BOOL)isRepeatedFlowHandlerId
{
  return self->_isRepeatedFlowHandlerId;
}

- (BOOL)isTopRankedParse
{
  return self->_isTopRankedParse;
}

- (float)nlParseProbability
{
  return self->_nlParseProbability;
}

- (unsigned)numSalientEntities
{
  return self->_numSalientEntities;
}

- (unsigned)entitySaliencyMaxScore
{
  return self->_entitySaliencyMaxScore;
}

- (BOOL)isAutoshortcutAppOnScreen
{
  return self->_isAutoshortcutAppOnScreen;
}

- (BOOL)isAutoshortcut
{
  return self->_isAutoshortcut;
}

- (BOOL)isLinkAction
{
  return self->_isLinkAction;
}

- (BOOL)isVocabNameMatch
{
  return self->_isVocabNameMatch;
}

- (BOOL)isDefaultLinkAction
{
  return self->_isDefaultLinkAction;
}

- (BOOL)isLinkActionOnScreen
{
  return self->_isLinkActionOnScreen;
}

- (BOOL)isColdOpenAllowlist
{
  return self->_isColdOpenAllowlist;
}

- (BOOL)entityTypeMentioned
{
  return self->_entityTypeMentioned;
}

- (BOOL)isTopRankedPlugin
{
  return self->_isTopRankedPlugin;
}

- (BOOL)appNameMentioned
{
  return self->_appNameMentioned;
}

- (BOOL)isAppInForeground
{
  return self->_isAppInForeground;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setActionCandidateId:(id)a3
{
}

- (SISchemaUUID)actionCandidateId
{
  return self->_actionCandidateId;
}

- (CAARSchemaCAARActionFeatureSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CAARSchemaCAARActionFeatureSet;
  v5 = [(CAARSchemaCAARActionFeatureSet *)&v61 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"actionCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CAARSchemaCAARActionFeatureSet *)v5 setActionCandidateId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"isHighConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsHighConfidence:](v5, "setIsHighConfidence:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isAppInForeground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsAppInForeground:](v5, "setIsAppInForeground:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appNameMentioned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setAppNameMentioned:](v5, "setAppNameMentioned:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"isTopRankedPlugin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsTopRankedPlugin:](v5, "setIsTopRankedPlugin:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"entityTypeMentioned"];
    objc_opt_class();
    v60 = v12;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setEntityTypeMentioned:](v5, "setEntityTypeMentioned:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isColdOpenAllowlist"];
    objc_opt_class();
    v59 = v13;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsColdOpenAllowlist:](v5, "setIsColdOpenAllowlist:", [v13 BOOLValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"isLinkActionOnScreen"];
    objc_opt_class();
    v58 = v14;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsLinkActionOnScreen:](v5, "setIsLinkActionOnScreen:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isDefaultLinkAction"];
    objc_opt_class();
    v57 = v15;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsDefaultLinkAction:](v5, "setIsDefaultLinkAction:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"isVocabNameMatch"];
    objc_opt_class();
    v56 = v16;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsVocabNameMatch:](v5, "setIsVocabNameMatch:", [v16 BOOLValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"isLinkAction"];
    objc_opt_class();
    v55 = v17;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsLinkAction:](v5, "setIsLinkAction:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"isAutoshortcut"];
    objc_opt_class();
    v54 = v18;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsAutoshortcut:](v5, "setIsAutoshortcut:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"isAutoshortcutAppOnScreen"];
    objc_opt_class();
    v53 = v19;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsAutoshortcutAppOnScreen:](v5, "setIsAutoshortcutAppOnScreen:", [v19 BOOLValue]);
    }
    int v20 = [v4 objectForKeyedSubscript:@"entitySaliencyMaxScore"];
    objc_opt_class();
    v52 = v20;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setEntitySaliencyMaxScore:](v5, "setEntitySaliencyMaxScore:", [v20 unsignedIntValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"numSalientEntities"];
    objc_opt_class();
    v51 = v21;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setNumSalientEntities:](v5, "setNumSalientEntities:", [v21 unsignedIntValue]);
    }
    objc_super v22 = [v4 objectForKeyedSubscript:@"nlParseProbability"];
    objc_opt_class();
    v50 = v22;
    if (objc_opt_isKindOfClass())
    {
      [v22 floatValue];
      -[CAARSchemaCAARActionFeatureSet setNlParseProbability:](v5, "setNlParseProbability:");
    }
    v23 = [v4 objectForKeyedSubscript:@"isTopRankedParse"];
    objc_opt_class();
    v49 = v23;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsTopRankedParse:](v5, "setIsTopRankedParse:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"isRepeatedFlowHandlerId"];
    objc_opt_class();
    v48 = v24;
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsRepeatedFlowHandlerId:](v5, "setIsRepeatedFlowHandlerId:", [v24 BOOLValue]);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"appHistoryFeatures"];
    objc_opt_class();
    v47 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      v26 = [[CAARSchemaCAARAppHistoryFeatures alloc] initWithDictionary:v25];
      [(CAARSchemaCAARActionFeatureSet *)v5 setAppHistoryFeatures:v26];
    }
    v45 = v8;
    uint64_t v27 = [v4 objectForKeyedSubscript:@"appLevelDisambiguationHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[CAARSchemaCAARAppLevelDisambiguationHistory alloc] initWithDictionary:v27];
      [(CAARSchemaCAARActionFeatureSet *)v5 setAppLevelDisambiguationHistory:v28];
    }
    v41 = (void *)v27;
    v44 = v9;
    v29 = [v4 objectForKeyedSubscript:@"actionLevelDisambiguationHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[CAARSchemaCAARActionLevelDisambiguationHistory alloc] initWithDictionary:v29];
      [(CAARSchemaCAARActionFeatureSet *)v5 setActionLevelDisambiguationHistory:v30];
    }
    v43 = v10;
    v31 = [v4 objectForKeyedSubscript:@"proactiveFeatures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[CAARSchemaCAARProactiveFeatures alloc] initWithDictionary:v31];
      [(CAARSchemaCAARActionFeatureSet *)v5 setProactiveFeatures:v32];
    }
    v42 = v11;
    v33 = [v4 objectForKeyedSubscript:@"isAutoShortcutEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsAutoShortcutEnabled:](v5, "setIsAutoShortcutEnabled:", [v33 BOOLValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"isAmbiguousFirstRunPreviouslyShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsAmbiguousFirstRunPreviouslyShown:](v5, "setIsAmbiguousFirstRunPreviouslyShown:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"actionIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[v35 copy];
      [(CAARSchemaCAARActionFeatureSet *)v5 setActionIdentifier:v36];
    }
    v46 = (void *)v6;
    v37 = [v4 objectForKeyedSubscript:@"isInterpretableAsUniversalCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setIsInterpretableAsUniversalCommand:](v5, "setIsInterpretableAsUniversalCommand:", [v37 BOOLValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"domainProtectionLevel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAARSchemaCAARActionFeatureSet setDomainProtectionLevel:](v5, "setDomainProtectionLevel:", [v38 intValue]);
    }
    v39 = v5;
  }
  return v5;
}

- (CAARSchemaCAARActionFeatureSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARActionFeatureSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARActionFeatureSet *)self dictionaryRepresentation];
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
  if (self->_actionCandidateId)
  {
    id v4 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionCandidateId"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionCandidateId"];
    }
  }
  if (self->_actionIdentifier)
  {
    uint64_t v7 = [(CAARSchemaCAARActionFeatureSet *)self actionIdentifier];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"actionIdentifier"];
  }
  if (self->_actionLevelDisambiguationHistory)
  {
    v9 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"actionLevelDisambiguationHistory"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"actionLevelDisambiguationHistory"];
    }
  }
  if (self->_appHistoryFeatures)
  {
    v12 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"appHistoryFeatures"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"appHistoryFeatures"];
    }
  }
  if (self->_appLevelDisambiguationHistory)
  {
    v15 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"appLevelDisambiguationHistory"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"appLevelDisambiguationHistory"];
    }
  }
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  int v19 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(unsigned char *)&has & 4) != 0)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet appNameMentioned](self, "appNameMentioned"));
    [v3 setObject:v23 forKeyedSubscript:@"appNameMentioned"];

    int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((v19 & 0x100000) == 0)
    {
LABEL_25:
      if ((v19 & 0x1000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_58;
    }
  }
  else if ((v19 & 0x100000) == 0)
  {
    goto LABEL_25;
  }
  unsigned int v24 = [(CAARSchemaCAARActionFeatureSet *)self domainProtectionLevel] - 1;
  if (v24 > 2) {
    uint64_t v25 = @"CAARDOMAINPROTECTIONLEVEL_UNKNOWN";
  }
  else {
    uint64_t v25 = off_1E5EACAA8[v24];
  }
  [v3 setObject:v25 forKeyedSubscript:@"domainProtectionLevel"];
  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_26:
    if ((v19 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionFeatureSet entitySaliencyMaxScore](self, "entitySaliencyMaxScore"));
  [v3 setObject:v28 forKeyedSubscript:@"entitySaliencyMaxScore"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_27:
    if ((v19 & 0x40000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet entityTypeMentioned](self, "entityTypeMentioned"));
  [v3 setObject:v29 forKeyedSubscript:@"entityTypeMentioned"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x40000) == 0)
  {
LABEL_28:
    if ((v19 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAmbiguousFirstRunPreviouslyShown](self, "isAmbiguousFirstRunPreviouslyShown"));
  [v3 setObject:v30 forKeyedSubscript:@"isAmbiguousFirstRunPreviouslyShown"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_29:
    if ((v19 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAppInForeground](self, "isAppInForeground"));
  [v3 setObject:v31 forKeyedSubscript:@"isAppInForeground"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x20000) == 0)
  {
LABEL_30:
    if ((v19 & 0x400) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoShortcutEnabled](self, "isAutoShortcutEnabled"));
  [v3 setObject:v32 forKeyedSubscript:@"isAutoShortcutEnabled"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_31:
    if ((v19 & 0x800) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoshortcut](self, "isAutoshortcut"));
  [v3 setObject:v33 forKeyedSubscript:@"isAutoshortcut"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_32:
    if ((v19 & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isAutoshortcutAppOnScreen](self, "isAutoshortcutAppOnScreen"));
  [v3 setObject:v34 forKeyedSubscript:@"isAutoshortcutAppOnScreen"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_33:
    if ((v19 & 0x80) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isColdOpenAllowlist](self, "isColdOpenAllowlist"));
  [v3 setObject:v35 forKeyedSubscript:@"isColdOpenAllowlist"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_34:
    if ((v19 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isDefaultLinkAction](self, "isDefaultLinkAction"));
  [v3 setObject:v36 forKeyedSubscript:@"isDefaultLinkAction"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_35:
    if ((v19 & 0x80000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isHighConfidence](self, "isHighConfidence"));
  [v3 setObject:v37 forKeyedSubscript:@"isHighConfidence"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x80000) == 0)
  {
LABEL_36:
    if ((v19 & 0x200) == 0) {
      goto LABEL_37;
    }
    goto LABEL_69;
  }
LABEL_68:
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isInterpretableAsUniversalCommand](self, "isInterpretableAsUniversalCommand"));
  [v3 setObject:v38 forKeyedSubscript:@"isInterpretableAsUniversalCommand"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_37:
    if ((v19 & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_69:
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isLinkAction](self, "isLinkAction"));
  [v3 setObject:v39 forKeyedSubscript:@"isLinkAction"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_38:
    if ((v19 & 0x10000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_71;
  }
LABEL_70:
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isLinkActionOnScreen](self, "isLinkActionOnScreen"));
  [v3 setObject:v40 forKeyedSubscript:@"isLinkActionOnScreen"];

  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x10000) == 0)
  {
LABEL_39:
    if ((v19 & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_72;
  }
LABEL_71:
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isRepeatedFlowHandlerId](self, "isRepeatedFlowHandlerId"));
  [v3 setObject:v41 forKeyedSubscript:@"isRepeatedFlowHandlerId"];

  LOWORD(v19) = self->_has;
  if ((v19 & 0x8000) == 0)
  {
LABEL_40:
    if ((v19 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_73;
  }
LABEL_72:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isTopRankedParse](self, "isTopRankedParse"));
  [v3 setObject:v42 forKeyedSubscript:@"isTopRankedParse"];

  LOWORD(v19) = self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_41:
    if ((v19 & 0x100) == 0) {
      goto LABEL_42;
    }
    goto LABEL_74;
  }
LABEL_73:
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isTopRankedPlugin](self, "isTopRankedPlugin"));
  [v3 setObject:v43 forKeyedSubscript:@"isTopRankedPlugin"];

  LOWORD(v19) = self->_has;
  if ((v19 & 0x100) == 0)
  {
LABEL_42:
    if ((v19 & 0x4000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_75;
  }
LABEL_74:
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[CAARSchemaCAARActionFeatureSet isVocabNameMatch](self, "isVocabNameMatch"));
  [v3 setObject:v44 forKeyedSubscript:@"isVocabNameMatch"];

  LOWORD(v19) = self->_has;
  if ((v19 & 0x4000) == 0)
  {
LABEL_43:
    if ((v19 & 0x2000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_75:
  v45 = NSNumber;
  [(CAARSchemaCAARActionFeatureSet *)self nlParseProbability];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v3 setObject:v46 forKeyedSubscript:@"nlParseProbability"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_44:
    int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAARSchemaCAARActionFeatureSet numSalientEntities](self, "numSalientEntities"));
    [v3 setObject:v20 forKeyedSubscript:@"numSalientEntities"];
  }
LABEL_45:
  if (self->_proactiveFeatures)
  {
    v21 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
    objc_super v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"proactiveFeatures"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"proactiveFeatures"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v39 = [(SISchemaUUID *)self->_actionCandidateId hash];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  int v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    uint64_t v38 = 2654435761 * self->_isHighConfidence;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761 * self->_isAppInForeground;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v37 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_appNameMentioned;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v35 = 2654435761 * self->_isTopRankedPlugin;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v34 = 2654435761 * self->_entityTypeMentioned;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v34 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v33 = 2654435761 * self->_isColdOpenAllowlist;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v33 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v32 = 2654435761 * self->_isLinkActionOnScreen;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v32 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v31 = 2654435761 * self->_isDefaultLinkAction;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v30 = 2654435761 * self->_isVocabNameMatch;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v30 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v29 = 2654435761 * self->_isLinkAction;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v29 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v28 = 2654435761 * self->_isAutoshortcut;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v27 = 2654435761 * self->_isAutoshortcutAppOnScreen;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v26 = 2654435761 * self->_entitySaliencyMaxScore;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_15;
    }
LABEL_33:
    uint64_t v25 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_16;
    }
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_37;
  }
LABEL_32:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_33;
  }
LABEL_15:
  uint64_t v25 = 2654435761 * self->_numSalientEntities;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_34;
  }
LABEL_16:
  float nlParseProbability = self->_nlParseProbability;
  double v6 = nlParseProbability;
  if (nlParseProbability < 0.0) {
    double v6 = -nlParseProbability;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_37:
  if ((v4 & 0x8000) != 0)
  {
    uint64_t v24 = 2654435761 * self->_isTopRankedParse;
    if ((v4 & 0x10000) != 0) {
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((v4 & 0x10000) != 0)
    {
LABEL_39:
      unint64_t v10 = [(CAARSchemaCAARAppHistoryFeatures *)self->_appHistoryFeatures hash];
      goto LABEL_42;
    }
  }
  unint64_t v10 = [(CAARSchemaCAARAppHistoryFeatures *)self->_appHistoryFeatures hash];
LABEL_42:
  unint64_t v11 = v10;
  unint64_t v12 = [(CAARSchemaCAARAppLevelDisambiguationHistory *)self->_appLevelDisambiguationHistory hash];
  unint64_t v13 = [(CAARSchemaCAARActionLevelDisambiguationHistory *)self->_actionLevelDisambiguationHistory hash];
  unint64_t v14 = [(CAARSchemaCAARProactiveFeatures *)self->_proactiveFeatures hash];
  int v15 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v15 & 0x20000) != 0)
  {
    uint64_t v16 = 2654435761 * self->_isAutoShortcutEnabled;
    if ((v15 & 0x40000) != 0) {
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((v15 & 0x40000) != 0)
    {
LABEL_44:
      uint64_t v17 = 2654435761 * self->_isAmbiguousFirstRunPreviouslyShown;
      goto LABEL_47;
    }
  }
  uint64_t v17 = 0;
LABEL_47:
  NSUInteger v18 = [(NSString *)self->_actionIdentifier hash];
  int v19 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v19 & 0x80000) != 0)
  {
    uint64_t v20 = 2654435761 * self->_isInterpretableAsUniversalCommand;
    if ((v19 & 0x100000) != 0) {
      goto LABEL_49;
    }
LABEL_51:
    uint64_t v21 = 0;
    return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21;
  }
  uint64_t v20 = 0;
  if ((v19 & 0x100000) == 0) {
    goto LABEL_51;
  }
LABEL_49:
  uint64_t v21 = 2654435761 * self->_domainProtectionLevel;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_107;
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
  double v6 = [v4 actionCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_106;
  }
  uint64_t v7 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
    unint64_t v10 = [v4 actionCandidateId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v13 = *(_WORD *)&self->_has & 1;
  unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  if (v13 != (v4[52] & 1)) {
    goto LABEL_107;
  }
  if (v13)
  {
    int isHighConfidence = self->_isHighConfidence;
    if (isHighConfidence != [v4 isHighConfidence]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v16 = (v12 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_107;
  }
  if (v16)
  {
    int isAppInForeground = self->_isAppInForeground;
    if (isAppInForeground != [v4 isAppInForeground]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v18 = (v12 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_107;
  }
  if (v18)
  {
    int appNameMentioned = self->_appNameMentioned;
    if (appNameMentioned != [v4 appNameMentioned]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v20 = (v12 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_107;
  }
  if (v20)
  {
    int isTopRankedPlugin = self->_isTopRankedPlugin;
    if (isTopRankedPlugin != [v4 isTopRankedPlugin]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v22 = (v12 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_107;
  }
  if (v22)
  {
    int entityTypeMentioned = self->_entityTypeMentioned;
    if (entityTypeMentioned != [v4 entityTypeMentioned]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v24 = (v12 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_107;
  }
  if (v24)
  {
    int isColdOpenAllowlist = self->_isColdOpenAllowlist;
    if (isColdOpenAllowlist != [v4 isColdOpenAllowlist]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v26 = (v12 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_107;
  }
  if (v26)
  {
    int isLinkActionOnScreen = self->_isLinkActionOnScreen;
    if (isLinkActionOnScreen != [v4 isLinkActionOnScreen]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v28 = (v12 >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1)) {
    goto LABEL_107;
  }
  if (v28)
  {
    int isDefaultLinkAction = self->_isDefaultLinkAction;
    if (isDefaultLinkAction != [v4 isDefaultLinkAction]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v30 = (v12 >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1)) {
    goto LABEL_107;
  }
  if (v30)
  {
    int isVocabNameMatch = self->_isVocabNameMatch;
    if (isVocabNameMatch != [v4 isVocabNameMatch]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v32 = (v12 >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1)) {
    goto LABEL_107;
  }
  if (v32)
  {
    int isLinkAction = self->_isLinkAction;
    if (isLinkAction != [v4 isLinkAction]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v34 = (v12 >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1)) {
    goto LABEL_107;
  }
  if (v34)
  {
    int isAutoshortcut = self->_isAutoshortcut;
    if (isAutoshortcut != [v4 isAutoshortcut]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v36 = (v12 >> 11) & 1;
  if (v36 != ((v14 >> 11) & 1)) {
    goto LABEL_107;
  }
  if (v36)
  {
    int isAutoshortcutAppOnScreen = self->_isAutoshortcutAppOnScreen;
    if (isAutoshortcutAppOnScreen != [v4 isAutoshortcutAppOnScreen]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v38 = (v12 >> 12) & 1;
  if (v38 != ((v14 >> 12) & 1)) {
    goto LABEL_107;
  }
  if (v38)
  {
    unsigned int entitySaliencyMaxScore = self->_entitySaliencyMaxScore;
    if (entitySaliencyMaxScore != [v4 entitySaliencyMaxScore]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v40 = (v12 >> 13) & 1;
  if (v40 != ((v14 >> 13) & 1)) {
    goto LABEL_107;
  }
  if (v40)
  {
    unsigned int numSalientEntities = self->_numSalientEntities;
    if (numSalientEntities != [v4 numSalientEntities]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v42 = (v12 >> 14) & 1;
  if (v42 != ((v14 >> 14) & 1)) {
    goto LABEL_107;
  }
  if (v42)
  {
    float nlParseProbability = self->_nlParseProbability;
    [v4 nlParseProbability];
    if (nlParseProbability != v44) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v45 = (v12 >> 15) & 1;
  if (v45 != ((v14 >> 15) & 1)) {
    goto LABEL_107;
  }
  if (v45)
  {
    int isTopRankedParse = self->_isTopRankedParse;
    if (isTopRankedParse != [v4 isTopRankedParse]) {
      goto LABEL_107;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  int v47 = HIWORD(v12) & 1;
  if (v47 != (HIWORD(v14) & 1)) {
    goto LABEL_107;
  }
  if (v47)
  {
    int isRepeatedFlowHandlerId = self->_isRepeatedFlowHandlerId;
    if (isRepeatedFlowHandlerId != [v4 isRepeatedFlowHandlerId]) {
      goto LABEL_107;
    }
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
  double v6 = [v4 appHistoryFeatures];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_106;
  }
  uint64_t v49 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
    v52 = [v4 appHistoryFeatures];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
  double v6 = [v4 appLevelDisambiguationHistory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_106;
  }
  uint64_t v54 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
    v57 = [v4 appLevelDisambiguationHistory];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
  double v6 = [v4 actionLevelDisambiguationHistory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_106;
  }
  uint64_t v59 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
  if (v59)
  {
    v60 = (void *)v59;
    objc_super v61 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
    v62 = [v4 actionLevelDisambiguationHistory];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
  double v6 = [v4 proactiveFeatures];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_106;
  }
  uint64_t v64 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
    v67 = [v4 proactiveFeatures];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  unsigned int v69 = *((unsigned __int8 *)&self->_has + 2);
  int v70 = (v69 >> 1) & 1;
  unsigned int v71 = *((unsigned __int8 *)v4 + 106);
  if (v70 != ((v71 >> 1) & 1)) {
    goto LABEL_107;
  }
  if (v70)
  {
    int isAutoShortcutEnabled = self->_isAutoShortcutEnabled;
    if (isAutoShortcutEnabled != [v4 isAutoShortcutEnabled]) {
      goto LABEL_107;
    }
    unsigned int v72 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v73 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
  }
  else
  {
    unsigned int v72 = *(_WORD *)&self->_has | (v69 << 16);
    unsigned int v73 = v4[52] | (v71 << 16);
  }
  int v75 = (v72 >> 18) & 1;
  if (v75 != ((v73 >> 18) & 1)) {
    goto LABEL_107;
  }
  if (v75)
  {
    int isAmbiguousFirstRunPreviouslyShown = self->_isAmbiguousFirstRunPreviouslyShown;
    if (isAmbiguousFirstRunPreviouslyShown != [v4 isAmbiguousFirstRunPreviouslyShown]) {
      goto LABEL_107;
    }
  }
  v5 = [(CAARSchemaCAARActionFeatureSet *)self actionIdentifier];
  double v6 = [v4 actionIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_106:

    goto LABEL_107;
  }
  uint64_t v77 = [(CAARSchemaCAARActionFeatureSet *)self actionIdentifier];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [(CAARSchemaCAARActionFeatureSet *)self actionIdentifier];
    v80 = [v4 actionIdentifier];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  unsigned int v84 = *((unsigned __int8 *)&self->_has + 2);
  int v85 = (v84 >> 3) & 1;
  unsigned int v86 = *((unsigned __int8 *)v4 + 106);
  if (v85 == ((v86 >> 3) & 1))
  {
    if (v85)
    {
      int isInterpretableAsUniversalCommand = self->_isInterpretableAsUniversalCommand;
      if (isInterpretableAsUniversalCommand != [v4 isInterpretableAsUniversalCommand]) {
        goto LABEL_107;
      }
      unsigned int v87 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      unsigned int v88 = v4[52] | (*((unsigned __int8 *)v4 + 106) << 16);
    }
    else
    {
      unsigned int v87 = *(_WORD *)&self->_has | (v84 << 16);
      unsigned int v88 = v4[52] | (v86 << 16);
    }
    int v90 = (v87 >> 20) & 1;
    if (v90 == ((v88 >> 20) & 1))
    {
      if (!v90
        || (int domainProtectionLevel = self->_domainProtectionLevel,
            domainProtectionLevel == [v4 domainProtectionLevel]))
      {
        BOOL v82 = 1;
        goto LABEL_108;
      }
    }
  }
LABEL_107:
  BOOL v82 = 0;
LABEL_108:

  return v82;
}

- (void)writeTo:(id)a3
{
  id v21 = a3;
  int v4 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];

  if (v4)
  {
    v5 = [(CAARSchemaCAARActionFeatureSet *)self actionCandidateId];
    PBDataWriterWriteSubmessage();
  }
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  int v7 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteBOOLField();
    $97FEBA335C550383B08A947438191CF5 v20 = self->_has;
    int v7 = *(_DWORD *)&v20 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v20 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_14:
    if ((v7 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  int v7 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_19:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  double v8 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];

  if (v8)
  {
    unint64_t v9 = [(CAARSchemaCAARActionFeatureSet *)self appHistoryFeatures];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];

  if (v10)
  {
    int v11 = [(CAARSchemaCAARActionFeatureSet *)self appLevelDisambiguationHistory];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v12 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];

  if (v12)
  {
    int v13 = [(CAARSchemaCAARActionFeatureSet *)self actionLevelDisambiguationHistory];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v14 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];

  if (v14)
  {
    int v15 = [(CAARSchemaCAARActionFeatureSet *)self proactiveFeatures];
    PBDataWriterWriteSubmessage();
  }
  int v16 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v16 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v16 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v16 & 0x40000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v17 = [(CAARSchemaCAARActionFeatureSet *)self actionIdentifier];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  int v18 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v19 = v21;
  if ((v18 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v19 = v21;
    int v18 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v18 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v19 = v21;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARActionFeatureSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteDomainProtectionLevel
{
  [(CAARSchemaCAARActionFeatureSet *)self setDomainProtectionLevel:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasDomainProtectionLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasDomainProtectionLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setDomainProtectionLevel:(int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x100000u) >> 16;
  self->_int domainProtectionLevel = a3;
}

- (void)deleteIsInterpretableAsUniversalCommand
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsInterpretableAsUniversalCommand:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsInterpretableAsUniversalCommand:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasIsInterpretableAsUniversalCommand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsInterpretableAsUniversalCommand:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_int isInterpretableAsUniversalCommand = a3;
}

- (void)deleteActionIdentifier
{
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (void)deleteIsAmbiguousFirstRunPreviouslyShown
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsAmbiguousFirstRunPreviouslyShown:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasIsAmbiguousFirstRunPreviouslyShown
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsAmbiguousFirstRunPreviouslyShown:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_int isAmbiguousFirstRunPreviouslyShown = a3;
}

- (void)deleteIsAutoShortcutEnabled
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsAutoShortcutEnabled:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsAutoShortcutEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasIsAutoShortcutEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsAutoShortcutEnabled:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_int isAutoShortcutEnabled = a3;
}

- (void)deleteProactiveFeatures
{
}

- (BOOL)hasProactiveFeatures
{
  return self->_proactiveFeatures != 0;
}

- (void)deleteActionLevelDisambiguationHistory
{
}

- (BOOL)hasActionLevelDisambiguationHistory
{
  return self->_actionLevelDisambiguationHistory != 0;
}

- (void)deleteAppLevelDisambiguationHistory
{
}

- (BOOL)hasAppLevelDisambiguationHistory
{
  return self->_appLevelDisambiguationHistory != 0;
}

- (void)deleteAppHistoryFeatures
{
}

- (BOOL)hasAppHistoryFeatures
{
  return self->_appHistoryFeatures != 0;
}

- (void)deleteIsRepeatedFlowHandlerId
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsRepeatedFlowHandlerId:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsRepeatedFlowHandlerId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasIsRepeatedFlowHandlerId
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsRepeatedFlowHandlerId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_int isRepeatedFlowHandlerId = a3;
}

- (void)deleteIsTopRankedParse
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsTopRankedParse:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsTopRankedParse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsTopRankedParse
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setIsTopRankedParse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_int isTopRankedParse = a3;
}

- (void)deleteNlParseProbability
{
  [(CAARSchemaCAARActionFeatureSet *)self setNlParseProbability:0.0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNlParseProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNlParseProbability
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setNlParseProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_float nlParseProbability = a3;
}

- (void)deleteNumSalientEntities
{
  [(CAARSchemaCAARActionFeatureSet *)self setNumSalientEntities:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumSalientEntities:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumSalientEntities
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumSalientEntities:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unsigned int numSalientEntities = a3;
}

- (void)deleteEntitySaliencyMaxScore
{
  [(CAARSchemaCAARActionFeatureSet *)self setEntitySaliencyMaxScore:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasEntitySaliencyMaxScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasEntitySaliencyMaxScore
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setEntitySaliencyMaxScore:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int entitySaliencyMaxScore = a3;
}

- (void)deleteIsAutoshortcutAppOnScreen
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsAutoshortcutAppOnScreen:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsAutoshortcutAppOnScreen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsAutoshortcutAppOnScreen
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsAutoshortcutAppOnScreen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int isAutoshortcutAppOnScreen = a3;
}

- (void)deleteIsAutoshortcut
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsAutoshortcut:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsAutoshortcut:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsAutoshortcut
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsAutoshortcut:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int isAutoshortcut = a3;
}

- (void)deleteIsLinkAction
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsLinkAction:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsLinkAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsLinkAction
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsLinkAction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int isLinkAction = a3;
}

- (void)deleteIsVocabNameMatch
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsVocabNameMatch:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsVocabNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsVocabNameMatch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsVocabNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int isVocabNameMatch = a3;
}

- (void)deleteIsDefaultLinkAction
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsDefaultLinkAction:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsDefaultLinkAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsDefaultLinkAction
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsDefaultLinkAction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isDefaultLinkAction = a3;
}

- (void)deleteIsLinkActionOnScreen
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsLinkActionOnScreen:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsLinkActionOnScreen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsLinkActionOnScreen
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsLinkActionOnScreen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isLinkActionOnScreen = a3;
}

- (void)deleteIsColdOpenAllowlist
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsColdOpenAllowlist:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsColdOpenAllowlist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsColdOpenAllowlist
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsColdOpenAllowlist:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int isColdOpenAllowlist = a3;
}

- (void)deleteEntityTypeMentioned
{
  [(CAARSchemaCAARActionFeatureSet *)self setEntityTypeMentioned:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasEntityTypeMentioned:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasEntityTypeMentioned
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEntityTypeMentioned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int entityTypeMentioned = a3;
}

- (void)deleteIsTopRankedPlugin
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsTopRankedPlugin:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsTopRankedPlugin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsTopRankedPlugin
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsTopRankedPlugin:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int isTopRankedPlugin = a3;
}

- (void)deleteAppNameMentioned
{
  [(CAARSchemaCAARActionFeatureSet *)self setAppNameMentioned:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasAppNameMentioned:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasAppNameMentioned
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppNameMentioned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int appNameMentioned = a3;
}

- (void)deleteIsAppInForeground
{
  [(CAARSchemaCAARActionFeatureSet *)self setIsAppInForeground:0];
  $97FEBA335C550383B08A947438191CF5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsAppInForeground:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsAppInForeground
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsAppInForeground:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int isAppInForeground = a3;
}

- (void)deleteIsHighConfidence
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasIsHighConfidence:(BOOL)a3
{
  *(_WORD *)&self->_$97FEBA335C550383B08A947438191CF5 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIsHighConfidence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setIsHighConfidence:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int isHighConfidence = a3;
}

- (void)deleteActionCandidateId
{
}

- (BOOL)hasActionCandidateId
{
  return self->_actionCandidateId != 0;
}

@end
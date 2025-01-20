@interface CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent
- (BOOL)contentUrlInContext;
- (BOOL)contentUrlInRule;
- (BOOL)contentUrlOverlap;
- (BOOL)hasPersonAndAppMatched;
- (BOOL)hasPersonMatched;
- (BOOL)hasSessionId;
- (BOOL)hasTopicContainingRuleCount;
- (BOOL)hasTopicInContext;
- (BOOL)hasTopicInRule;
- (BOOL)hasTopicOverlap;
- (BOOL)hasTopicRulesCardinality;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWeekendInRule;
- (BOOL)isWeekendOverlap;
- (BOOL)lOIInContext;
- (BOOL)lOIInRule;
- (BOOL)lOIOverlap;
- (BOOL)personAndAppMatched;
- (BOOL)personMatched;
- (BOOL)readFrom:(id)a3;
- (BOOL)sourceBundleIdInContext;
- (BOOL)sourceBundleIdInRule;
- (BOOL)sourceBundleIdOverlap;
- (BOOL)targetBundleIDInConsequent;
- (BOOL)targetBundleIdInContext;
- (BOOL)targetBundleIdInRule;
- (BOOL)targetBundleIdOverlap;
- (BOOL)timeOfDaySlotInRule;
- (BOOL)timeOfDaySlotOverlap;
- (BOOL)topicInContext;
- (BOOL)topicInRule;
- (BOOL)topicOverlap;
- (BOOL)utiTypeInContext;
- (BOOL)utiTypeInRule;
- (BOOL)utiTypeOverlap;
- (NSString)confidence;
- (NSString)sessionId;
- (NSString)support;
- (NSString)uniqueShareEventIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)highConfidenceRuleCount;
- (unsigned)locationOfInterestContainingRuleCount;
- (unsigned)locationOfInterestRulesCardinality;
- (unsigned)lowConfidenceRuleCount;
- (unsigned)mediumConfidenceRuleCount;
- (unsigned)photoContactContainingRuleCount;
- (unsigned)photoContactInContext;
- (unsigned)photoContactInRule;
- (unsigned)photoContactOverlap;
- (unsigned)photoContactRulesCardinality;
- (unsigned)photoSceneContainingRuleCount;
- (unsigned)photoSceneInContext;
- (unsigned)photoSceneInRule;
- (unsigned)photoSceneOverlap;
- (unsigned)photoSceneRulesCardinality;
- (unsigned)sourceBundleIdContainingRuleCount;
- (unsigned)sourceBundleIdRulesCardinality;
- (unsigned)targetBundleIdContainingRuleCount;
- (unsigned)targetBundleIdRulesCardinality;
- (unsigned)topicContainingRuleCount;
- (unsigned)topicRulesCardinality;
- (unsigned)totalMessagesRecieved;
- (unsigned)totalMessagesSent;
- (unsigned)totalShares;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(id)a3;
- (void)setContentUrlInContext:(BOOL)a3;
- (void)setContentUrlInRule:(BOOL)a3;
- (void)setContentUrlOverlap:(BOOL)a3;
- (void)setHasPersonAndAppMatched:(BOOL)a3;
- (void)setHasPersonMatched:(BOOL)a3;
- (void)setHasTopicContainingRuleCount:(BOOL)a3;
- (void)setHasTopicInContext:(BOOL)a3;
- (void)setHasTopicInRule:(BOOL)a3;
- (void)setHasTopicOverlap:(BOOL)a3;
- (void)setHasTopicRulesCardinality:(BOOL)a3;
- (void)setHighConfidenceRuleCount:(unsigned int)a3;
- (void)setIsWeekendInRule:(BOOL)a3;
- (void)setIsWeekendOverlap:(BOOL)a3;
- (void)setLOIInContext:(BOOL)a3;
- (void)setLOIInRule:(BOOL)a3;
- (void)setLOIOverlap:(BOOL)a3;
- (void)setLocationOfInterestContainingRuleCount:(unsigned int)a3;
- (void)setLocationOfInterestRulesCardinality:(unsigned int)a3;
- (void)setLowConfidenceRuleCount:(unsigned int)a3;
- (void)setMediumConfidenceRuleCount:(unsigned int)a3;
- (void)setPersonAndAppMatched:(BOOL)a3;
- (void)setPersonMatched:(BOOL)a3;
- (void)setPhotoContactContainingRuleCount:(unsigned int)a3;
- (void)setPhotoContactInContext:(unsigned int)a3;
- (void)setPhotoContactInRule:(unsigned int)a3;
- (void)setPhotoContactOverlap:(unsigned int)a3;
- (void)setPhotoContactRulesCardinality:(unsigned int)a3;
- (void)setPhotoSceneContainingRuleCount:(unsigned int)a3;
- (void)setPhotoSceneInContext:(unsigned int)a3;
- (void)setPhotoSceneInRule:(unsigned int)a3;
- (void)setPhotoSceneOverlap:(unsigned int)a3;
- (void)setPhotoSceneRulesCardinality:(unsigned int)a3;
- (void)setSessionId:(id)a3;
- (void)setSourceBundleIdContainingRuleCount:(unsigned int)a3;
- (void)setSourceBundleIdInContext:(BOOL)a3;
- (void)setSourceBundleIdInRule:(BOOL)a3;
- (void)setSourceBundleIdOverlap:(BOOL)a3;
- (void)setSourceBundleIdRulesCardinality:(unsigned int)a3;
- (void)setSupport:(id)a3;
- (void)setTargetBundleIDInConsequent:(BOOL)a3;
- (void)setTargetBundleIdContainingRuleCount:(unsigned int)a3;
- (void)setTargetBundleIdInContext:(BOOL)a3;
- (void)setTargetBundleIdInRule:(BOOL)a3;
- (void)setTargetBundleIdOverlap:(BOOL)a3;
- (void)setTargetBundleIdRulesCardinality:(unsigned int)a3;
- (void)setTimeOfDaySlotInRule:(BOOL)a3;
- (void)setTimeOfDaySlotOverlap:(BOOL)a3;
- (void)setTopicContainingRuleCount:(unsigned int)a3;
- (void)setTopicInContext:(BOOL)a3;
- (void)setTopicInRule:(BOOL)a3;
- (void)setTopicOverlap:(BOOL)a3;
- (void)setTopicRulesCardinality:(unsigned int)a3;
- (void)setTotalMessagesRecieved:(unsigned int)a3;
- (void)setTotalMessagesSent:(unsigned int)a3;
- (void)setTotalShares:(unsigned int)a3;
- (void)setUniqueShareEventIdentifier:(id)a3;
- (void)setUtiTypeInContext:(BOOL)a3;
- (void)setUtiTypeInRule:(BOOL)a3;
- (void)setUtiTypeOverlap:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent

- (void)setPersonAndAppMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_personAndAppMatched = a3;
}

- (void)setHasPersonAndAppMatched:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPersonAndAppMatched
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPersonMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_personMatched = a3;
}

- (void)setHasPersonMatched:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPersonMatched
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)setTopicRulesCardinality:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_topicRulesCardinality = a3;
}

- (void)setHasTopicRulesCardinality:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopicRulesCardinality
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTopicContainingRuleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_topicContainingRuleCount = a3;
}

- (void)setHasTopicContainingRuleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTopicContainingRuleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTopicOverlap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_topicOverlap = a3;
}

- (void)setHasTopicOverlap:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTopicOverlap
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTopicInContext:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_topicInContext = a3;
}

- (void)setHasTopicInContext:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTopicInContext
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTopicInRule:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_topicInRule = a3;
}

- (void)setHasTopicInRule:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTopicInRule
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent;
  v4 = [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)&v8 description];
  v5 = [(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithBool:self->_contentUrlInContext];
  [v3 setObject:v4 forKey:@"contentUrlInContext"];

  v5 = [NSNumber numberWithUnsignedInt:self->_highConfidenceRuleCount];
  [v3 setObject:v5 forKey:@"highConfidenceRuleCount"];

  v6 = [NSNumber numberWithUnsignedInt:self->_locationOfInterestContainingRuleCount];
  [v3 setObject:v6 forKey:@"locationOfInterestContainingRuleCount"];

  v7 = [NSNumber numberWithUnsignedInt:self->_locationOfInterestRulesCardinality];
  [v3 setObject:v7 forKey:@"locationOfInterestRulesCardinality"];

  objc_super v8 = [NSNumber numberWithBool:self->_lOIInContext];
  [v3 setObject:v8 forKey:@"LOIInContext"];

  v9 = [NSNumber numberWithUnsignedInt:self->_lowConfidenceRuleCount];
  [v3 setObject:v9 forKey:@"lowConfidenceRuleCount"];

  v10 = [NSNumber numberWithUnsignedInt:self->_mediumConfidenceRuleCount];
  [v3 setObject:v10 forKey:@"mediumConfidenceRuleCount"];

  v11 = [NSNumber numberWithUnsignedInt:self->_photoContactContainingRuleCount];
  [v3 setObject:v11 forKey:@"photoContactContainingRuleCount"];

  v12 = [NSNumber numberWithUnsignedInt:self->_photoContactInContext];
  [v3 setObject:v12 forKey:@"photoContactInContext"];

  v13 = [NSNumber numberWithUnsignedInt:self->_photoContactRulesCardinality];
  [v3 setObject:v13 forKey:@"photoContactRulesCardinality"];

  v14 = [NSNumber numberWithUnsignedInt:self->_photoSceneContainingRuleCount];
  [v3 setObject:v14 forKey:@"photoSceneContainingRuleCount"];

  v15 = [NSNumber numberWithUnsignedInt:self->_photoSceneInContext];
  [v3 setObject:v15 forKey:@"photoSceneInContext"];

  v16 = [NSNumber numberWithUnsignedInt:self->_photoSceneRulesCardinality];
  [v3 setObject:v16 forKey:@"photoSceneRulesCardinality"];

  v17 = [NSNumber numberWithUnsignedInt:self->_sourceBundleIdContainingRuleCount];
  [v3 setObject:v17 forKey:@"sourceBundleIdContainingRuleCount"];

  v18 = [NSNumber numberWithBool:self->_sourceBundleIdInContext];
  [v3 setObject:v18 forKey:@"sourceBundleIdInContext"];

  v19 = [NSNumber numberWithUnsignedInt:self->_sourceBundleIdRulesCardinality];
  [v3 setObject:v19 forKey:@"sourceBundleIdRulesCardinality"];

  v20 = [NSNumber numberWithUnsignedInt:self->_targetBundleIdContainingRuleCount];
  [v3 setObject:v20 forKey:@"targetBundleIdContainingRuleCount"];

  v21 = [NSNumber numberWithBool:self->_targetBundleIdInContext];
  [v3 setObject:v21 forKey:@"targetBundleIdInContext"];

  v22 = [NSNumber numberWithUnsignedInt:self->_targetBundleIdRulesCardinality];
  [v3 setObject:v22 forKey:@"targetBundleIdRulesCardinality"];

  v23 = [NSNumber numberWithUnsignedInt:self->_totalMessagesRecieved];
  [v3 setObject:v23 forKey:@"totalMessagesRecieved"];

  v24 = [NSNumber numberWithUnsignedInt:self->_totalMessagesSent];
  [v3 setObject:v24 forKey:@"totalMessagesSent"];

  v25 = [NSNumber numberWithUnsignedInt:self->_totalShares];
  [v3 setObject:v25 forKey:@"totalShares"];

  uniqueShareEventIdentifier = self->_uniqueShareEventIdentifier;
  if (uniqueShareEventIdentifier) {
    [v3 setObject:uniqueShareEventIdentifier forKey:@"uniqueShareEventIdentifier"];
  }
  v27 = [NSNumber numberWithBool:self->_utiTypeInContext];
  [v3 setObject:v27 forKey:@"utiTypeInContext"];

  confidence = self->_confidence;
  if (confidence) {
    [v3 setObject:confidence forKey:@"confidence"];
  }
  v29 = [NSNumber numberWithBool:self->_contentUrlInRule];
  [v3 setObject:v29 forKey:@"contentUrlInRule"];

  v30 = [NSNumber numberWithBool:self->_contentUrlOverlap];
  [v3 setObject:v30 forKey:@"contentUrlOverlap"];

  v31 = [NSNumber numberWithBool:self->_isWeekendInRule];
  [v3 setObject:v31 forKey:@"isWeekendInRule"];

  v32 = [NSNumber numberWithBool:self->_isWeekendOverlap];
  [v3 setObject:v32 forKey:@"isWeekendOverlap"];

  v33 = [NSNumber numberWithBool:self->_lOIInRule];
  [v3 setObject:v33 forKey:@"LOIInRule"];

  v34 = [NSNumber numberWithBool:self->_lOIOverlap];
  [v3 setObject:v34 forKey:@"LOIOverlap"];

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v36 = [NSNumber numberWithBool:self->_personAndAppMatched];
    [v3 setObject:v36 forKey:@"personAndAppMatched"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v37 = [NSNumber numberWithBool:self->_personMatched];
    [v3 setObject:v37 forKey:@"personMatched"];
  }
  v38 = [NSNumber numberWithUnsignedInt:self->_photoContactInRule];
  [v3 setObject:v38 forKey:@"photoContactInRule"];

  v39 = [NSNumber numberWithUnsignedInt:self->_photoContactOverlap];
  [v3 setObject:v39 forKey:@"photoContactOverlap"];

  v40 = [NSNumber numberWithUnsignedInt:self->_photoSceneInRule];
  [v3 setObject:v40 forKey:@"photoSceneInRule"];

  v41 = [NSNumber numberWithUnsignedInt:self->_photoSceneOverlap];
  [v3 setObject:v41 forKey:@"photoSceneOverlap"];

  v42 = [NSNumber numberWithBool:self->_sourceBundleIdInRule];
  [v3 setObject:v42 forKey:@"sourceBundleIdInRule"];

  v43 = [NSNumber numberWithBool:self->_sourceBundleIdOverlap];
  [v3 setObject:v43 forKey:@"sourceBundleIdOverlap"];

  support = self->_support;
  if (support) {
    [v3 setObject:support forKey:@"support"];
  }
  v45 = [NSNumber numberWithBool:self->_targetBundleIDInConsequent];
  [v3 setObject:v45 forKey:@"targetBundleIDInConsequent"];

  v46 = [NSNumber numberWithBool:self->_targetBundleIdInRule];
  [v3 setObject:v46 forKey:@"targetBundleIdInRule"];

  v47 = [NSNumber numberWithBool:self->_targetBundleIdOverlap];
  [v3 setObject:v47 forKey:@"targetBundleIdOverlap"];

  v48 = [NSNumber numberWithBool:self->_timeOfDaySlotInRule];
  [v3 setObject:v48 forKey:@"timeOfDaySlotInRule"];

  v49 = [NSNumber numberWithBool:self->_timeOfDaySlotOverlap];
  [v3 setObject:v49 forKey:@"timeOfDaySlotOverlap"];

  v50 = [NSNumber numberWithBool:self->_utiTypeInRule];
  [v3 setObject:v50 forKey:@"utiTypeInRule"];

  v51 = [NSNumber numberWithBool:self->_utiTypeOverlap];
  [v3 setObject:v51 forKey:@"utiTypeOverlap"];

  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"session_id"];
  }
  char v53 = (char)self->_has;
  if ((v53 & 2) != 0)
  {
    v56 = [NSNumber numberWithUnsignedInt:self->_topicRulesCardinality];
    [v3 setObject:v56 forKey:@"topicRulesCardinality"];

    char v53 = (char)self->_has;
    if ((v53 & 1) == 0)
    {
LABEL_15:
      if ((v53 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  v57 = [NSNumber numberWithUnsignedInt:self->_topicContainingRuleCount];
  [v3 setObject:v57 forKey:@"topicContainingRuleCount"];

  char v53 = (char)self->_has;
  if ((v53 & 0x40) == 0)
  {
LABEL_16:
    if ((v53 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  v58 = [NSNumber numberWithBool:self->_topicOverlap];
  [v3 setObject:v58 forKey:@"topicOverlap"];

  char v53 = (char)self->_has;
  if ((v53 & 0x10) == 0)
  {
LABEL_17:
    if ((v53 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  v59 = [NSNumber numberWithBool:self->_topicInContext];
  [v3 setObject:v59 forKey:@"topicInContext"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    v54 = [NSNumber numberWithBool:self->_topicInRule];
    [v3 setObject:v54 forKey:@"topicInRule"];
  }
LABEL_19:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CoreBehaviorAnalysisPETCoreBehaviorAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (!self->_uniqueShareEventIdentifier) {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (!self->_confidence) {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (!self->_support) {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
  }
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    char v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_14:
      if ((v5 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  v6 = v7;
  char v5 = (char)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  v6 = v7;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
LABEL_17:
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  v7[144] = self->_contentUrlInContext;
  *((_DWORD *)v7 + 4) = self->_highConfidenceRuleCount;
  *((_DWORD *)v7 + 5) = self->_locationOfInterestContainingRuleCount;
  *((_DWORD *)v7 + 6) = self->_locationOfInterestRulesCardinality;
  v7[149] = self->_lOIInContext;
  *((_DWORD *)v7 + 7) = self->_lowConfidenceRuleCount;
  *((_DWORD *)v7 + 8) = self->_mediumConfidenceRuleCount;
  *((_DWORD *)v7 + 9) = self->_photoContactContainingRuleCount;
  *((_DWORD *)v7 + 10) = self->_photoContactInContext;
  *((_DWORD *)v7 + 13) = self->_photoContactRulesCardinality;
  *((_DWORD *)v7 + 14) = self->_photoSceneContainingRuleCount;
  *((_DWORD *)v7 + 15) = self->_photoSceneInContext;
  *((_DWORD *)v7 + 18) = self->_photoSceneRulesCardinality;
  *((_DWORD *)v7 + 22) = self->_sourceBundleIdContainingRuleCount;
  v7[154] = self->_sourceBundleIdInContext;
  *((_DWORD *)v7 + 23) = self->_sourceBundleIdRulesCardinality;
  *((_DWORD *)v7 + 26) = self->_targetBundleIdContainingRuleCount;
  v7[158] = self->_targetBundleIdInContext;
  *((_DWORD *)v7 + 27) = self->_targetBundleIdRulesCardinality;
  *((_DWORD *)v7 + 30) = self->_totalMessagesRecieved;
  *((_DWORD *)v7 + 31) = self->_totalMessagesSent;
  *((_DWORD *)v7 + 32) = self->_totalShares;
  [v7 setUniqueShareEventIdentifier:self->_uniqueShareEventIdentifier];
  v7[166] = self->_utiTypeInContext;
  [v7 setConfidence:self->_confidence];
  v7[145] = self->_contentUrlInRule;
  v7[146] = self->_contentUrlOverlap;
  v7[147] = self->_isWeekendInRule;
  v7[148] = self->_isWeekendOverlap;
  v7[150] = self->_lOIInRule;
  v7[151] = self->_lOIOverlap;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7[152] = self->_personAndAppMatched;
    v7[172] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7[153] = self->_personMatched;
    v7[172] |= 8u;
  }
  *((_DWORD *)v7 + 11) = self->_photoContactInRule;
  *((_DWORD *)v7 + 12) = self->_photoContactOverlap;
  *((_DWORD *)v7 + 16) = self->_photoSceneInRule;
  *((_DWORD *)v7 + 17) = self->_photoSceneOverlap;
  v7[155] = self->_sourceBundleIdInRule;
  v7[156] = self->_sourceBundleIdOverlap;
  [v7 setSupport:self->_support];
  char v5 = v7;
  v7[157] = self->_targetBundleIDInConsequent;
  v7[159] = self->_targetBundleIdInRule;
  v7[160] = self->_targetBundleIdOverlap;
  v7[161] = self->_timeOfDaySlotInRule;
  v7[162] = self->_timeOfDaySlotOverlap;
  v7[167] = self->_utiTypeInRule;
  v7[168] = self->_utiTypeOverlap;
  if (self->_sessionId)
  {
    objc_msgSend(v7, "setSessionId:");
    char v5 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v5[29] = self->_topicRulesCardinality;
    *((unsigned char *)v5 + 172) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v5[28] = self->_topicContainingRuleCount;
  *((unsigned char *)v5 + 172) |= 1u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v5 + 165) = self->_topicOverlap;
  *((unsigned char *)v5 + 172) |= 0x40u;
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  *((unsigned char *)v5 + 163) = self->_topicInContext;
  *((unsigned char *)v5 + 172) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *((unsigned char *)v5 + 164) = self->_topicInRule;
    *((unsigned char *)v5 + 172) |= 0x20u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 144) = self->_contentUrlInContext;
  *(_DWORD *)(v5 + 16) = self->_highConfidenceRuleCount;
  *(_DWORD *)(v5 + 20) = self->_locationOfInterestContainingRuleCount;
  *(_DWORD *)(v5 + 24) = self->_locationOfInterestRulesCardinality;
  *(unsigned char *)(v5 + 149) = self->_lOIInContext;
  *(_DWORD *)(v5 + 28) = self->_lowConfidenceRuleCount;
  *(_DWORD *)(v5 + 32) = self->_mediumConfidenceRuleCount;
  *(_DWORD *)(v5 + 36) = self->_photoContactContainingRuleCount;
  *(_DWORD *)(v5 + 40) = self->_photoContactInContext;
  *(_DWORD *)(v5 + 52) = self->_photoContactRulesCardinality;
  *(_DWORD *)(v5 + 56) = self->_photoSceneContainingRuleCount;
  *(_DWORD *)(v5 + 60) = self->_photoSceneInContext;
  *(_DWORD *)(v5 + 72) = self->_photoSceneRulesCardinality;
  *(_DWORD *)(v5 + 88) = self->_sourceBundleIdContainingRuleCount;
  *(unsigned char *)(v5 + 154) = self->_sourceBundleIdInContext;
  *(_DWORD *)(v5 + 92) = self->_sourceBundleIdRulesCardinality;
  *(_DWORD *)(v5 + 104) = self->_targetBundleIdContainingRuleCount;
  *(unsigned char *)(v5 + 158) = self->_targetBundleIdInContext;
  *(_DWORD *)(v5 + 108) = self->_targetBundleIdRulesCardinality;
  *(_DWORD *)(v5 + 120) = self->_totalMessagesRecieved;
  *(_DWORD *)(v5 + 124) = self->_totalMessagesSent;
  *(_DWORD *)(v5 + 128) = self->_totalShares;
  uint64_t v6 = [(NSString *)self->_uniqueShareEventIdentifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v6;

  *(unsigned char *)(v5 + 166) = self->_utiTypeInContext;
  uint64_t v8 = [(NSString *)self->_confidence copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  *(unsigned char *)(v5 + 145) = self->_contentUrlInRule;
  *(unsigned char *)(v5 + 146) = self->_contentUrlOverlap;
  *(unsigned char *)(v5 + 147) = self->_isWeekendInRule;
  *(unsigned char *)(v5 + 148) = self->_isWeekendOverlap;
  *(unsigned char *)(v5 + 150) = self->_lOIInRule;
  *(unsigned char *)(v5 + 151) = self->_lOIOverlap;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_personAndAppMatched;
    *(unsigned char *)(v5 + 172) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 153) = self->_personMatched;
    *(unsigned char *)(v5 + 172) |= 8u;
  }
  *(_DWORD *)(v5 + 44) = self->_photoContactInRule;
  *(_DWORD *)(v5 + 48) = self->_photoContactOverlap;
  *(_DWORD *)(v5 + 64) = self->_photoSceneInRule;
  *(_DWORD *)(v5 + 68) = self->_photoSceneOverlap;
  *(unsigned char *)(v5 + 155) = self->_sourceBundleIdInRule;
  *(unsigned char *)(v5 + 156) = self->_sourceBundleIdOverlap;
  uint64_t v11 = [(NSString *)self->_support copyWithZone:a3];
  v12 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v11;

  *(unsigned char *)(v5 + 157) = self->_targetBundleIDInConsequent;
  *(unsigned char *)(v5 + 159) = self->_targetBundleIdInRule;
  *(unsigned char *)(v5 + 160) = self->_targetBundleIdOverlap;
  *(unsigned char *)(v5 + 161) = self->_timeOfDaySlotInRule;
  *(unsigned char *)(v5 + 162) = self->_timeOfDaySlotOverlap;
  *(unsigned char *)(v5 + 167) = self->_utiTypeInRule;
  *(unsigned char *)(v5 + 168) = self->_utiTypeOverlap;
  uint64_t v13 = [(NSString *)self->_sessionId copyWithZone:a3];
  v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_topicRulesCardinality;
    *(unsigned char *)(v5 + 172) |= 2u;
    char v15 = (char)self->_has;
    if ((v15 & 1) == 0)
    {
LABEL_7:
      if ((v15 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 112) = self->_topicContainingRuleCount;
  *(unsigned char *)(v5 + 172) |= 1u;
  char v15 = (char)self->_has;
  if ((v15 & 0x40) == 0)
  {
LABEL_8:
    if ((v15 & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    *(unsigned char *)(v5 + 163) = self->_topicInContext;
    *(unsigned char *)(v5 + 172) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_10;
  }
LABEL_14:
  *(unsigned char *)(v5 + 165) = self->_topicOverlap;
  *(unsigned char *)(v5 + 172) |= 0x40u;
  char v15 = (char)self->_has;
  if ((v15 & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v15 & 0x20) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 164) = self->_topicInRule;
    *(unsigned char *)(v5 + 172) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_157;
  }
  if (self->_contentUrlInContext)
  {
    if (!*((unsigned char *)v4 + 144)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
    goto LABEL_157;
  }
  if (self->_highConfidenceRuleCount != *((_DWORD *)v4 + 4)
    || self->_locationOfInterestContainingRuleCount != *((_DWORD *)v4 + 5)
    || self->_locationOfInterestRulesCardinality != *((_DWORD *)v4 + 6))
  {
    goto LABEL_157;
  }
  if (self->_lOIInContext)
  {
    if (!*((unsigned char *)v4 + 149)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 149))
  {
    goto LABEL_157;
  }
  if (self->_lowConfidenceRuleCount != *((_DWORD *)v4 + 7)
    || self->_mediumConfidenceRuleCount != *((_DWORD *)v4 + 8)
    || self->_photoContactContainingRuleCount != *((_DWORD *)v4 + 9)
    || self->_photoContactInContext != *((_DWORD *)v4 + 10)
    || self->_photoContactRulesCardinality != *((_DWORD *)v4 + 13)
    || self->_photoSceneContainingRuleCount != *((_DWORD *)v4 + 14)
    || self->_photoSceneInContext != *((_DWORD *)v4 + 15)
    || self->_photoSceneRulesCardinality != *((_DWORD *)v4 + 18)
    || self->_sourceBundleIdContainingRuleCount != *((_DWORD *)v4 + 22))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdInContext)
  {
    if (!*((unsigned char *)v4 + 154)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 154))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdRulesCardinality != *((_DWORD *)v4 + 23)
    || self->_targetBundleIdContainingRuleCount != *((_DWORD *)v4 + 26))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdInContext)
  {
    if (!*((unsigned char *)v4 + 158)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 158))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdRulesCardinality != *((_DWORD *)v4 + 27)) {
    goto LABEL_157;
  }
  if (self->_totalMessagesRecieved != *((_DWORD *)v4 + 30)) {
    goto LABEL_157;
  }
  if (self->_totalMessagesSent != *((_DWORD *)v4 + 31)) {
    goto LABEL_157;
  }
  if (self->_totalShares != *((_DWORD *)v4 + 32)) {
    goto LABEL_157;
  }
  uniqueShareEventIdentifier = self->_uniqueShareEventIdentifier;
  if ((unint64_t)uniqueShareEventIdentifier | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](uniqueShareEventIdentifier, "isEqual:")) {
      goto LABEL_157;
    }
  }
  if (self->_utiTypeInContext)
  {
    if (!*((unsigned char *)v4 + 166)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 166))
  {
    goto LABEL_157;
  }
  confidence = self->_confidence;
  if ((unint64_t)confidence | *((void *)v4 + 1) && !-[NSString isEqual:](confidence, "isEqual:")) {
    goto LABEL_157;
  }
  if (self->_contentUrlInRule)
  {
    if (!*((unsigned char *)v4 + 145)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 145))
  {
    goto LABEL_157;
  }
  if (self->_contentUrlOverlap)
  {
    if (!*((unsigned char *)v4 + 146)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 146))
  {
    goto LABEL_157;
  }
  if (self->_isWeekendInRule)
  {
    if (!*((unsigned char *)v4 + 147)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 147))
  {
    goto LABEL_157;
  }
  if (self->_isWeekendOverlap)
  {
    if (!*((unsigned char *)v4 + 148)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_157;
  }
  if (self->_lOIInRule)
  {
    if (!*((unsigned char *)v4 + 150)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 150))
  {
    goto LABEL_157;
  }
  if (self->_lOIOverlap)
  {
    if (!*((unsigned char *)v4 + 151)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 151))
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 4) == 0) {
      goto LABEL_157;
    }
    if (self->_personAndAppMatched)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_157;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 4) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 8) == 0) {
      goto LABEL_157;
    }
    if (self->_personMatched)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_157;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 8) != 0)
  {
    goto LABEL_157;
  }
  if (self->_photoContactInRule != *((_DWORD *)v4 + 11)
    || self->_photoContactOverlap != *((_DWORD *)v4 + 12)
    || self->_photoSceneInRule != *((_DWORD *)v4 + 16)
    || self->_photoSceneOverlap != *((_DWORD *)v4 + 17))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdInRule)
  {
    if (!*((unsigned char *)v4 + 155)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 155))
  {
    goto LABEL_157;
  }
  if (self->_sourceBundleIdOverlap)
  {
    if (!*((unsigned char *)v4 + 156)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 156))
  {
    goto LABEL_157;
  }
  support = self->_support;
  if ((unint64_t)support | *((void *)v4 + 12) && !-[NSString isEqual:](support, "isEqual:")) {
    goto LABEL_157;
  }
  if (self->_targetBundleIDInConsequent)
  {
    if (!*((unsigned char *)v4 + 157)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 157))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdInRule)
  {
    if (!*((unsigned char *)v4 + 159)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 159))
  {
    goto LABEL_157;
  }
  if (self->_targetBundleIdOverlap)
  {
    if (!*((unsigned char *)v4 + 160)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_157;
  }
  if (self->_timeOfDaySlotInRule)
  {
    if (!*((unsigned char *)v4 + 161)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 161))
  {
    goto LABEL_157;
  }
  if (self->_timeOfDaySlotOverlap)
  {
    if (!*((unsigned char *)v4 + 162)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 162))
  {
    goto LABEL_157;
  }
  if (self->_utiTypeInRule)
  {
    if (!*((unsigned char *)v4 + 167)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 167))
  {
    goto LABEL_157;
  }
  if (self->_utiTypeOverlap)
  {
    if (!*((unsigned char *)v4 + 168)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 168))
  {
    goto LABEL_157;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 10) && !-[NSString isEqual:](sessionId, "isEqual:")) {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 2) == 0 || self->_topicRulesCardinality != *((_DWORD *)v4 + 29)) {
      goto LABEL_157;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 2) != 0)
  {
    goto LABEL_157;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 172) & 1) == 0 || self->_topicContainingRuleCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_157;
    }
  }
  else if (*((unsigned char *)v4 + 172))
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x40) == 0) {
      goto LABEL_157;
    }
    if (self->_topicOverlap)
    {
      if (!*((unsigned char *)v4 + 165)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 165))
    {
      goto LABEL_157;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x40) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x10) == 0) {
      goto LABEL_157;
    }
    if (self->_topicInContext)
    {
      if (!*((unsigned char *)v4 + 163)) {
        goto LABEL_157;
      }
    }
    else if (*((unsigned char *)v4 + 163))
    {
      goto LABEL_157;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x10) != 0)
  {
    goto LABEL_157;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x20) != 0)
    {
      if (self->_topicInRule)
      {
        if (!*((unsigned char *)v4 + 164)) {
          goto LABEL_157;
        }
      }
      else if (*((unsigned char *)v4 + 164))
      {
        goto LABEL_157;
      }
      BOOL v9 = 1;
      goto LABEL_158;
    }
LABEL_157:
    BOOL v9 = 0;
    goto LABEL_158;
  }
  BOOL v9 = (*((unsigned char *)v4 + 172) & 0x20) == 0;
LABEL_158:

  return v9;
}

- (unint64_t)hash
{
  BOOL contentUrlInContext = self->_contentUrlInContext;
  unsigned int highConfidenceRuleCount = self->_highConfidenceRuleCount;
  unsigned int locationOfInterestContainingRuleCount = self->_locationOfInterestContainingRuleCount;
  unsigned int locationOfInterestRulesCardinality = self->_locationOfInterestRulesCardinality;
  BOOL lOIInContext = self->_lOIInContext;
  unsigned int lowConfidenceRuleCount = self->_lowConfidenceRuleCount;
  unsigned int mediumConfidenceRuleCount = self->_mediumConfidenceRuleCount;
  unsigned int photoContactContainingRuleCount = self->_photoContactContainingRuleCount;
  unsigned int photoContactInContext = self->_photoContactInContext;
  unsigned int photoContactRulesCardinality = self->_photoContactRulesCardinality;
  unsigned int photoSceneContainingRuleCount = self->_photoSceneContainingRuleCount;
  unsigned int photoSceneInContext = self->_photoSceneInContext;
  unsigned int photoSceneRulesCardinality = self->_photoSceneRulesCardinality;
  unsigned int sourceBundleIdContainingRuleCount = self->_sourceBundleIdContainingRuleCount;
  BOOL sourceBundleIdInContext = self->_sourceBundleIdInContext;
  unsigned int sourceBundleIdRulesCardinality = self->_sourceBundleIdRulesCardinality;
  unsigned int targetBundleIdContainingRuleCount = self->_targetBundleIdContainingRuleCount;
  BOOL targetBundleIdInContext = self->_targetBundleIdInContext;
  unsigned int targetBundleIdRulesCardinality = self->_targetBundleIdRulesCardinality;
  unsigned int totalMessagesRecieved = self->_totalMessagesRecieved;
  unsigned int totalMessagesSent = self->_totalMessagesSent;
  unsigned int totalShares = self->_totalShares;
  NSUInteger v3 = [(NSString *)self->_uniqueShareEventIdentifier hash];
  BOOL utiTypeInContext = self->_utiTypeInContext;
  NSUInteger v36 = v3;
  NSUInteger v34 = [(NSString *)self->_confidence hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v33 = 2654435761 * self->_personAndAppMatched;
  }
  else {
    uint64_t v33 = 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v32 = 2654435761 * self->_personMatched;
  }
  else {
    uint64_t v32 = 0;
  }
  BOOL contentUrlInRule = self->_contentUrlInRule;
  BOOL contentUrlOverlap = self->_contentUrlOverlap;
  BOOL isWeekendInRule = self->_isWeekendInRule;
  BOOL isWeekendOverlap = self->_isWeekendOverlap;
  BOOL lOIInRule = self->_lOIInRule;
  BOOL lOIOverlap = self->_lOIOverlap;
  unsigned int photoContactInRule = self->_photoContactInRule;
  unsigned int photoContactOverlap = self->_photoContactOverlap;
  unsigned int photoSceneInRule = self->_photoSceneInRule;
  unsigned int photoSceneOverlap = self->_photoSceneOverlap;
  BOOL sourceBundleIdInRule = self->_sourceBundleIdInRule;
  BOOL sourceBundleIdOverlap = self->_sourceBundleIdOverlap;
  NSUInteger v4 = [(NSString *)self->_support hash];
  BOOL targetBundleIDInConsequent = self->_targetBundleIDInConsequent;
  BOOL targetBundleIdInRule = self->_targetBundleIdInRule;
  BOOL targetBundleIdOverlap = self->_targetBundleIdOverlap;
  BOOL timeOfDaySlotInRule = self->_timeOfDaySlotInRule;
  BOOL timeOfDaySlotOverlap = self->_timeOfDaySlotOverlap;
  BOOL utiTypeInRule = self->_utiTypeInRule;
  BOOL utiTypeOverlap = self->_utiTypeOverlap;
  NSUInteger v11 = [(NSString *)self->_sessionId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v12 = 2654435761 * self->_topicRulesCardinality;
    if (*(unsigned char *)&self->_has)
    {
LABEL_9:
      uint64_t v13 = 2654435761 * self->_topicContainingRuleCount;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v14 = 2654435761 * self->_topicOverlap;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v16 = 0;
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v15 = 2654435761 * self->_topicInContext;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v16 = 2654435761 * self->_topicInRule;
LABEL_18:
  uint64_t v17 = (2654435761 * highConfidenceRuleCount) ^ (2654435761 * contentUrlInContext) ^ (2654435761
                                                                                         * locationOfInterestContainingRuleCount) ^ (2654435761 * locationOfInterestRulesCardinality) ^ (2654435761 * lOIInContext) ^ (2654435761 * lowConfidenceRuleCount) ^ (2654435761 * mediumConfidenceRuleCount) ^ (2654435761 * photoContactContainingRuleCount) ^ (2654435761 * photoContactInContext) ^ (2654435761 * photoContactRulesCardinality) ^ (2654435761 * photoSceneContainingRuleCount) ^ (2654435761 * photoSceneInContext) ^ (2654435761 * photoSceneRulesCardinality) ^ (2654435761 * sourceBundleIdContainingRuleCount) ^ (2654435761 * sourceBundleIdInContext) ^ (2654435761 * sourceBundleIdRulesCardinality) ^ (2654435761 * targetBundleIdContainingRuleCount) ^ (2654435761 * targetBundleIdInContext) ^ (2654435761 * targetBundleIdRulesCardinality) ^ (2654435761 * totalMessagesRecieved) ^ (2654435761 * totalMessagesSent) ^ (2654435761 * totalShares) ^ v36 ^ (2654435761 * utiTypeInContext) ^ v34 ^ (2654435761 * contentUrlInRule) ^ (2654435761 * contentUrlOverlap) ^ (2654435761 * isWeekendInRule) ^ (2654435761 * isWeekendOverlap) ^ (2654435761 * lOIInRule) ^ (2654435761 * lOIOverlap) ^ v33 ^ v32 ^ (2654435761 * photoContactInRule) ^ (2654435761 * photoContactOverlap) ^ (2654435761 * photoSceneInRule) ^ (2654435761 * photoSceneOverlap) ^ (2654435761 * sourceBundleIdInRule) ^ (2654435761 * sourceBundleIdOverlap) ^ v4 ^ (2654435761 * targetBundleIDInConsequent) ^ (2654435761 * targetBundleIdInRule) ^ (2654435761 * targetBundleIdOverlap) ^ (2654435761 * timeOfDaySlotInRule) ^ (2654435761 * timeOfDaySlotOverlap) ^ (2654435761 * utiTypeInRule);
  return v17 ^ (2654435761 * utiTypeOverlap) ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_BOOL contentUrlInContext = *((unsigned char *)v4 + 144);
  self->_unsigned int highConfidenceRuleCount = *((_DWORD *)v4 + 4);
  self->_unsigned int locationOfInterestContainingRuleCount = *((_DWORD *)v4 + 5);
  self->_unsigned int locationOfInterestRulesCardinality = *((_DWORD *)v4 + 6);
  self->_BOOL lOIInContext = *((unsigned char *)v4 + 149);
  self->_unsigned int lowConfidenceRuleCount = *((_DWORD *)v4 + 7);
  self->_unsigned int mediumConfidenceRuleCount = *((_DWORD *)v4 + 8);
  self->_unsigned int photoContactContainingRuleCount = *((_DWORD *)v4 + 9);
  self->_unsigned int photoContactInContext = *((_DWORD *)v4 + 10);
  self->_unsigned int photoContactRulesCardinality = *((_DWORD *)v4 + 13);
  self->_unsigned int photoSceneContainingRuleCount = *((_DWORD *)v4 + 14);
  self->_unsigned int photoSceneInContext = *((_DWORD *)v4 + 15);
  self->_unsigned int photoSceneRulesCardinality = *((_DWORD *)v4 + 18);
  self->_unsigned int sourceBundleIdContainingRuleCount = *((_DWORD *)v4 + 22);
  self->_BOOL sourceBundleIdInContext = *((unsigned char *)v4 + 154);
  self->_unsigned int sourceBundleIdRulesCardinality = *((_DWORD *)v4 + 23);
  self->_unsigned int targetBundleIdContainingRuleCount = *((_DWORD *)v4 + 26);
  self->_BOOL targetBundleIdInContext = *((unsigned char *)v4 + 158);
  self->_unsigned int targetBundleIdRulesCardinality = *((_DWORD *)v4 + 27);
  self->_unsigned int totalMessagesRecieved = *((_DWORD *)v4 + 30);
  self->_unsigned int totalMessagesSent = *((_DWORD *)v4 + 31);
  self->_unsigned int totalShares = *((_DWORD *)v4 + 32);
  id v7 = v4;
  if (*((void *)v4 + 17))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUniqueShareEventIdentifier:](self, "setUniqueShareEventIdentifier:");
    id v4 = v7;
  }
  self->_BOOL utiTypeInContext = *((unsigned char *)v4 + 166);
  if (*((void *)v4 + 1))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setConfidence:](self, "setConfidence:");
    id v4 = v7;
  }
  self->_BOOL contentUrlInRule = *((unsigned char *)v4 + 145);
  self->_BOOL contentUrlOverlap = *((unsigned char *)v4 + 146);
  self->_BOOL isWeekendInRule = *((unsigned char *)v4 + 147);
  self->_BOOL isWeekendOverlap = *((unsigned char *)v4 + 148);
  self->_BOOL lOIInRule = *((unsigned char *)v4 + 150);
  self->_BOOL lOIOverlap = *((unsigned char *)v4 + 151);
  char v5 = *((unsigned char *)v4 + 172);
  if ((v5 & 4) != 0)
  {
    self->_personAndAppMatched = *((unsigned char *)v4 + 152);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 172);
  }
  if ((v5 & 8) != 0)
  {
    self->_personMatched = *((unsigned char *)v4 + 153);
    *(unsigned char *)&self->_has |= 8u;
  }
  self->_unsigned int photoContactInRule = *((_DWORD *)v4 + 11);
  self->_unsigned int photoContactOverlap = *((_DWORD *)v4 + 12);
  self->_unsigned int photoSceneInRule = *((_DWORD *)v4 + 16);
  self->_unsigned int photoSceneOverlap = *((_DWORD *)v4 + 17);
  self->_BOOL sourceBundleIdInRule = *((unsigned char *)v4 + 155);
  self->_BOOL sourceBundleIdOverlap = *((unsigned char *)v4 + 156);
  if (*((void *)v4 + 12))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSupport:](self, "setSupport:");
    id v4 = v7;
  }
  self->_BOOL targetBundleIDInConsequent = *((unsigned char *)v4 + 157);
  self->_BOOL targetBundleIdInRule = *((unsigned char *)v4 + 159);
  self->_BOOL targetBundleIdOverlap = *((unsigned char *)v4 + 160);
  self->_BOOL timeOfDaySlotInRule = *((unsigned char *)v4 + 161);
  self->_BOOL timeOfDaySlotOverlap = *((unsigned char *)v4 + 162);
  self->_BOOL utiTypeInRule = *((unsigned char *)v4 + 167);
  self->_BOOL utiTypeOverlap = *((unsigned char *)v4 + 168);
  if (*((void *)v4 + 10))
  {
    -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSessionId:](self, "setSessionId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 172);
  if ((v6 & 2) != 0)
  {
    self->_topicRulesCardinality = *((_DWORD *)v4 + 29);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 172);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_topicContainingRuleCount = *((_DWORD *)v4 + 28);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 172);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_topicOverlap = *((unsigned char *)v4 + 165);
  *(unsigned char *)&self->_has |= 0x40u;
  char v6 = *((unsigned char *)v4 + 172);
  if ((v6 & 0x10) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  self->_topicInContext = *((unsigned char *)v4 + 163);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 172) & 0x20) != 0)
  {
LABEL_18:
    self->_topicInRule = *((unsigned char *)v4 + 164);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_19:
}

- (BOOL)contentUrlInContext
{
  return self->_contentUrlInContext;
}

- (void)setContentUrlInContext:(BOOL)a3
{
  self->_BOOL contentUrlInContext = a3;
}

- (unsigned)highConfidenceRuleCount
{
  return self->_highConfidenceRuleCount;
}

- (void)setHighConfidenceRuleCount:(unsigned int)a3
{
  self->_unsigned int highConfidenceRuleCount = a3;
}

- (unsigned)locationOfInterestContainingRuleCount
{
  return self->_locationOfInterestContainingRuleCount;
}

- (void)setLocationOfInterestContainingRuleCount:(unsigned int)a3
{
  self->_unsigned int locationOfInterestContainingRuleCount = a3;
}

- (unsigned)locationOfInterestRulesCardinality
{
  return self->_locationOfInterestRulesCardinality;
}

- (void)setLocationOfInterestRulesCardinality:(unsigned int)a3
{
  self->_unsigned int locationOfInterestRulesCardinality = a3;
}

- (BOOL)lOIInContext
{
  return self->_lOIInContext;
}

- (void)setLOIInContext:(BOOL)a3
{
  self->_BOOL lOIInContext = a3;
}

- (unsigned)lowConfidenceRuleCount
{
  return self->_lowConfidenceRuleCount;
}

- (void)setLowConfidenceRuleCount:(unsigned int)a3
{
  self->_unsigned int lowConfidenceRuleCount = a3;
}

- (unsigned)mediumConfidenceRuleCount
{
  return self->_mediumConfidenceRuleCount;
}

- (void)setMediumConfidenceRuleCount:(unsigned int)a3
{
  self->_unsigned int mediumConfidenceRuleCount = a3;
}

- (unsigned)photoContactContainingRuleCount
{
  return self->_photoContactContainingRuleCount;
}

- (void)setPhotoContactContainingRuleCount:(unsigned int)a3
{
  self->_unsigned int photoContactContainingRuleCount = a3;
}

- (unsigned)photoContactInContext
{
  return self->_photoContactInContext;
}

- (void)setPhotoContactInContext:(unsigned int)a3
{
  self->_unsigned int photoContactInContext = a3;
}

- (unsigned)photoContactRulesCardinality
{
  return self->_photoContactRulesCardinality;
}

- (void)setPhotoContactRulesCardinality:(unsigned int)a3
{
  self->_unsigned int photoContactRulesCardinality = a3;
}

- (unsigned)photoSceneContainingRuleCount
{
  return self->_photoSceneContainingRuleCount;
}

- (void)setPhotoSceneContainingRuleCount:(unsigned int)a3
{
  self->_unsigned int photoSceneContainingRuleCount = a3;
}

- (unsigned)photoSceneInContext
{
  return self->_photoSceneInContext;
}

- (void)setPhotoSceneInContext:(unsigned int)a3
{
  self->_unsigned int photoSceneInContext = a3;
}

- (unsigned)photoSceneRulesCardinality
{
  return self->_photoSceneRulesCardinality;
}

- (void)setPhotoSceneRulesCardinality:(unsigned int)a3
{
  self->_unsigned int photoSceneRulesCardinality = a3;
}

- (unsigned)sourceBundleIdContainingRuleCount
{
  return self->_sourceBundleIdContainingRuleCount;
}

- (void)setSourceBundleIdContainingRuleCount:(unsigned int)a3
{
  self->_unsigned int sourceBundleIdContainingRuleCount = a3;
}

- (BOOL)sourceBundleIdInContext
{
  return self->_sourceBundleIdInContext;
}

- (void)setSourceBundleIdInContext:(BOOL)a3
{
  self->_BOOL sourceBundleIdInContext = a3;
}

- (unsigned)sourceBundleIdRulesCardinality
{
  return self->_sourceBundleIdRulesCardinality;
}

- (void)setSourceBundleIdRulesCardinality:(unsigned int)a3
{
  self->_unsigned int sourceBundleIdRulesCardinality = a3;
}

- (unsigned)targetBundleIdContainingRuleCount
{
  return self->_targetBundleIdContainingRuleCount;
}

- (void)setTargetBundleIdContainingRuleCount:(unsigned int)a3
{
  self->_unsigned int targetBundleIdContainingRuleCount = a3;
}

- (BOOL)targetBundleIdInContext
{
  return self->_targetBundleIdInContext;
}

- (void)setTargetBundleIdInContext:(BOOL)a3
{
  self->_BOOL targetBundleIdInContext = a3;
}

- (unsigned)targetBundleIdRulesCardinality
{
  return self->_targetBundleIdRulesCardinality;
}

- (void)setTargetBundleIdRulesCardinality:(unsigned int)a3
{
  self->_unsigned int targetBundleIdRulesCardinality = a3;
}

- (unsigned)totalMessagesRecieved
{
  return self->_totalMessagesRecieved;
}

- (void)setTotalMessagesRecieved:(unsigned int)a3
{
  self->_unsigned int totalMessagesRecieved = a3;
}

- (unsigned)totalMessagesSent
{
  return self->_totalMessagesSent;
}

- (void)setTotalMessagesSent:(unsigned int)a3
{
  self->_unsigned int totalMessagesSent = a3;
}

- (unsigned)totalShares
{
  return self->_totalShares;
}

- (void)setTotalShares:(unsigned int)a3
{
  self->_unsigned int totalShares = a3;
}

- (NSString)uniqueShareEventIdentifier
{
  return self->_uniqueShareEventIdentifier;
}

- (void)setUniqueShareEventIdentifier:(id)a3
{
}

- (BOOL)utiTypeInContext
{
  return self->_utiTypeInContext;
}

- (void)setUtiTypeInContext:(BOOL)a3
{
  self->_BOOL utiTypeInContext = a3;
}

- (NSString)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(id)a3
{
}

- (BOOL)contentUrlInRule
{
  return self->_contentUrlInRule;
}

- (void)setContentUrlInRule:(BOOL)a3
{
  self->_BOOL contentUrlInRule = a3;
}

- (BOOL)contentUrlOverlap
{
  return self->_contentUrlOverlap;
}

- (void)setContentUrlOverlap:(BOOL)a3
{
  self->_BOOL contentUrlOverlap = a3;
}

- (BOOL)isWeekendInRule
{
  return self->_isWeekendInRule;
}

- (void)setIsWeekendInRule:(BOOL)a3
{
  self->_BOOL isWeekendInRule = a3;
}

- (BOOL)isWeekendOverlap
{
  return self->_isWeekendOverlap;
}

- (void)setIsWeekendOverlap:(BOOL)a3
{
  self->_BOOL isWeekendOverlap = a3;
}

- (BOOL)lOIInRule
{
  return self->_lOIInRule;
}

- (void)setLOIInRule:(BOOL)a3
{
  self->_BOOL lOIInRule = a3;
}

- (BOOL)lOIOverlap
{
  return self->_lOIOverlap;
}

- (void)setLOIOverlap:(BOOL)a3
{
  self->_BOOL lOIOverlap = a3;
}

- (BOOL)personAndAppMatched
{
  return self->_personAndAppMatched;
}

- (BOOL)personMatched
{
  return self->_personMatched;
}

- (unsigned)photoContactInRule
{
  return self->_photoContactInRule;
}

- (void)setPhotoContactInRule:(unsigned int)a3
{
  self->_unsigned int photoContactInRule = a3;
}

- (unsigned)photoContactOverlap
{
  return self->_photoContactOverlap;
}

- (void)setPhotoContactOverlap:(unsigned int)a3
{
  self->_unsigned int photoContactOverlap = a3;
}

- (unsigned)photoSceneInRule
{
  return self->_photoSceneInRule;
}

- (void)setPhotoSceneInRule:(unsigned int)a3
{
  self->_unsigned int photoSceneInRule = a3;
}

- (unsigned)photoSceneOverlap
{
  return self->_photoSceneOverlap;
}

- (void)setPhotoSceneOverlap:(unsigned int)a3
{
  self->_unsigned int photoSceneOverlap = a3;
}

- (BOOL)sourceBundleIdInRule
{
  return self->_sourceBundleIdInRule;
}

- (void)setSourceBundleIdInRule:(BOOL)a3
{
  self->_BOOL sourceBundleIdInRule = a3;
}

- (BOOL)sourceBundleIdOverlap
{
  return self->_sourceBundleIdOverlap;
}

- (void)setSourceBundleIdOverlap:(BOOL)a3
{
  self->_BOOL sourceBundleIdOverlap = a3;
}

- (NSString)support
{
  return self->_support;
}

- (void)setSupport:(id)a3
{
}

- (BOOL)targetBundleIDInConsequent
{
  return self->_targetBundleIDInConsequent;
}

- (void)setTargetBundleIDInConsequent:(BOOL)a3
{
  self->_BOOL targetBundleIDInConsequent = a3;
}

- (BOOL)targetBundleIdInRule
{
  return self->_targetBundleIdInRule;
}

- (void)setTargetBundleIdInRule:(BOOL)a3
{
  self->_BOOL targetBundleIdInRule = a3;
}

- (BOOL)targetBundleIdOverlap
{
  return self->_targetBundleIdOverlap;
}

- (void)setTargetBundleIdOverlap:(BOOL)a3
{
  self->_BOOL targetBundleIdOverlap = a3;
}

- (BOOL)timeOfDaySlotInRule
{
  return self->_timeOfDaySlotInRule;
}

- (void)setTimeOfDaySlotInRule:(BOOL)a3
{
  self->_BOOL timeOfDaySlotInRule = a3;
}

- (BOOL)timeOfDaySlotOverlap
{
  return self->_timeOfDaySlotOverlap;
}

- (void)setTimeOfDaySlotOverlap:(BOOL)a3
{
  self->_BOOL timeOfDaySlotOverlap = a3;
}

- (BOOL)utiTypeInRule
{
  return self->_utiTypeInRule;
}

- (void)setUtiTypeInRule:(BOOL)a3
{
  self->_BOOL utiTypeInRule = a3;
}

- (BOOL)utiTypeOverlap
{
  return self->_utiTypeOverlap;
}

- (void)setUtiTypeOverlap:(BOOL)a3
{
  self->_BOOL utiTypeOverlap = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (unsigned)topicRulesCardinality
{
  return self->_topicRulesCardinality;
}

- (unsigned)topicContainingRuleCount
{
  return self->_topicContainingRuleCount;
}

- (BOOL)topicOverlap
{
  return self->_topicOverlap;
}

- (BOOL)topicInContext
{
  return self->_topicInContext;
}

- (BOOL)topicInRule
{
  return self->_topicInRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueShareEventIdentifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_confidence, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 659, "nil != self->_uniqueShareEventIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 668, "nil != self->_confidence");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent writeTo:]", "CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent.m", 735, "nil != self->_support");
}

@end
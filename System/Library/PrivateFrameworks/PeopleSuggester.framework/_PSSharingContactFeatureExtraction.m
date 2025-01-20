@interface _PSSharingContactFeatureExtraction
- (BMBehaviorRetriever)behaviorRetriever;
- (BOOL)constantFeaturesReady;
- (CAPContactFillerUserEvent)userEvent;
- (NSDictionary)metadata;
- (NSMutableDictionary)constantFeatures;
- (_CDInteractionStore)interactionStore;
- (_PSContactFillerNormalizationConstants)normConstants;
- (_PSSharingContactFeatureExtraction)initWithMetadata:(id)a3 interactionStore:(id)a4;
- (void)extractConstantFeaturesInto:(id)a3;
- (void)extractFeaturesInto:(id)a3 withPredictionContext:(id)a4 forContactId:(id)a5 forInteraction:(id)a6 behaviorRulesConsideringInTheContext:(id)a7 ruleRankingMLModelScores:(id)a8 interactionModelScores:(id)a9;
- (void)setConstantFeatures:(id)a3;
- (void)setConstantFeaturesReady:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setNormConstants:(id)a3;
- (void)setUserEvent:(id)a3;
- (void)transferConstantFeatures:(id)a3 to:(id)a4;
@end

@implementation _PSSharingContactFeatureExtraction

- (_PSSharingContactFeatureExtraction)initWithMetadata:(id)a3 interactionStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PSSharingContactFeatureExtraction;
  v9 = [(_PSSharingContactFeatureExtraction *)&v16 init];
  if (v9)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v10 = (void *)getBMBehaviorRetrieverClass_softClass;
    uint64_t v21 = getBMBehaviorRetrieverClass_softClass;
    if (!getBMBehaviorRetrieverClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getBMBehaviorRetrieverClass_block_invoke;
      v17[3] = &unk_1E5ADE858;
      v17[4] = &v18;
      __getBMBehaviorRetrieverClass_block_invoke((uint64_t)v17);
      v10 = (void *)v19[3];
    }
    v11 = v10;
    _Block_object_dispose(&v18, 8);
    v12 = (BMBehaviorRetriever *)objc_alloc_init(v11);
    behaviorRetriever = v9->_behaviorRetriever;
    v9->_behaviorRetriever = v12;

    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v9->_interactionStore, a4);
    v9->_constantFeaturesReady = 0;
    constantFeatures = v9->_constantFeatures;
    v9->_constantFeatures = 0;
  }
  return v9;
}

- (void)extractConstantFeaturesInto:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_PSContactFillerNormalizationConstants);
  [(_PSSharingContactFeatureExtraction *)self setNormConstants:v5];

  v6 = [(_PSSharingContactFeatureExtraction *)self interactionStore];
  id v7 = [(_PSSharingContactFeatureExtraction *)self normConstants];
  +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:v6 normConstants:v7];

  id v8 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.6(self);
  }

  v9 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.5(self);
  }

  v10 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:].cold.4(self);
  }

  v11 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:](self);
  }

  v12 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:](self);
  }

  v13 = objc_alloc_init(CAPContactFillerUserEvent);
  v14 = [(_PSSharingContactFeatureExtraction *)self normConstants];
  v15 = [(_PSSharingContactFeatureExtraction *)self behaviorRetriever];
  +[_PSContactFillerDataCollectionUtilities extractUserFeaturesIntoPETMessage:v13 normConstants:v14 behaviorRetriever:v15];

  objc_super v16 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[_PSSharingContactFeatureExtraction extractConstantFeaturesInto:]();
  }

  v17 = [(NSDictionary *)self->_metadata valueForKey:@"highConfidenceRuleCount"];

  if (v17)
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent highConfidenceRuleCount](v13, "highConfidenceRuleCount"));
    [v4 setObject:v18 forKeyedSubscript:@"highConfidenceRuleCount"];
  }
  v19 = [(NSDictionary *)self->_metadata valueForKey:@"lowConfidenceRuleCount"];

  if (v19)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent lowConfidenceRuleCount](v13, "lowConfidenceRuleCount"));
    [v4 setObject:v20 forKeyedSubscript:@"lowConfidenceRuleCount"];
  }
  uint64_t v21 = [(NSDictionary *)self->_metadata valueForKey:@"mediumConfidenceRuleCount"];

  if (v21)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent mediumConfidenceRuleCount](v13, "mediumConfidenceRuleCount"));
    [v4 setObject:v22 forKeyedSubscript:@"mediumConfidenceRuleCount"];
  }
  v23 = [(NSDictionary *)self->_metadata valueForKey:@"shareInteractionsSent"];

  if (v23)
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent shareInteractionsSent](v13, "shareInteractionsSent"));
    [v4 setObject:v24 forKeyedSubscript:@"shareInteractionsSent"];
  }
  v25 = [(NSDictionary *)self->_metadata valueForKey:@"textInteractionsReceived"];

  if (v25)
  {
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent textInteractionsReceived](v13, "textInteractionsReceived"));
    [v4 setObject:v26 forKeyedSubscript:@"textInteractionsReceived"];
  }
  v27 = [(NSDictionary *)self->_metadata valueForKey:@"textInteractionsSent"];

  if (v27)
  {
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerUserEvent textInteractionsSent](v13, "textInteractionsSent"));
    [v4 setObject:v28 forKeyedSubscript:@"textInteractionsSent"];
  }
  [(_PSSharingContactFeatureExtraction *)self setConstantFeaturesReady:1];
}

- (void)transferConstantFeatures:(id)a3 to:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = [v5 objectForKeyedSubscript:v11];
        [v6 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)extractFeaturesInto:(id)a3 withPredictionContext:(id)a4 forContactId:(id)a5 forInteraction:(id)a6 behaviorRulesConsideringInTheContext:(id)a7 ruleRankingMLModelScores:(id)a8 interactionModelScores:(id)a9
{
  id v132 = a3;
  id v130 = a4;
  id v131 = a5;
  id v129 = a6;
  id v126 = a7;
  id v127 = a8;
  id v128 = a9;
  if (![(_PSSharingContactFeatureExtraction *)self constantFeaturesReady])
  {
    long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_PSSharingContactFeatureExtraction *)self setConstantFeatures:v15];

    long long v16 = [(_PSSharingContactFeatureExtraction *)self constantFeatures];
    [(_PSSharingContactFeatureExtraction *)self extractConstantFeaturesInto:v16];
  }
  v17 = [(_PSSharingContactFeatureExtraction *)self constantFeatures];
  [(_PSSharingContactFeatureExtraction *)self transferConstantFeatures:v17 to:v132];

  int64_t v18 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  v19 = objc_alloc_init(CAPContactFillerContactEvent);
  uint64_t v20 = objc_opt_new();
  uint64_t v21 = [v130 suggestionDate];
  v22 = [(_PSSharingContactFeatureExtraction *)self interactionStore];
  v23 = +[_PSContactFillerDataCollectionUtilities initContactPropertyCache:v20 timeOfShareInteraction:v21 interactionStore:v22];

  v24 = [(_PSSharingContactFeatureExtraction *)self normConstants];
  v25 = [(_PSSharingContactFeatureExtraction *)self interactionStore];
  v26 = [v130 suggestionDate];
  +[_PSContactFillerDataCollectionUtilities extractFrequencyRecencyFeaturesIntoPETMessage:v19 recipientID:v131 interaction:v129 normConstants:v24 numberOfDaysToLookBack:v18 interactionStore:v25 timeOfShareInteraction:v26 contactPropertyCache:v20 interactionCache:v23];

  v27 = +[_PSContactFillerDataCollectionUtilities filterRulesBasedOnInteractionGivenRuleList:v126 interaction:v129];
  -[CAPContactFillerContactEvent setNumberOfBehavioralRulesAdvocating:](v19, "setNumberOfBehavioralRulesAdvocating:", +[_PSContactFillerDataCollectionUtilities contactFillerBucketedValue:](_PSContactFillerDataCollectionUtilities, "contactFillerBucketedValue:", [v27 count]));
  if ([v126 count]) {
    +[_PSContactFillerDataCollectionUtilities extractFeaturesFromBehaviorRulesIntoPETMessage:v19 behaviorRules:v27 MLModelScores:v127];
  }
  if (v128)
  {
    v28 = [v128 objectForKeyedSubscript:v131];
    [v28 doubleValue];
    -[CAPContactFillerContactEvent setInteractionModelScore:](v19, "setInteractionModelScore:");
  }
  v29 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRuleConfidence"];

  if (v29)
  {
    v30 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRuleConfidence];
    v31 = objc_msgSend(v30, "numberWithDouble:");
    [v132 setObject:v31 forKeyedSubscript:@"averageBehavioralRuleConfidence"];
  }
  v32 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRuleConviction"];

  if (v32)
  {
    v33 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRuleConviction];
    v34 = objc_msgSend(v33, "numberWithDouble:");
    [v132 setObject:v34 forKeyedSubscript:@"averageBehavioralRuleConviction"];
  }
  v35 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRuleLift"];

  if (v35)
  {
    v36 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRuleLift];
    v37 = objc_msgSend(v36, "numberWithDouble:");
    [v132 setObject:v37 forKeyedSubscript:@"averageBehavioralRuleLift"];
  }
  v38 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRuleMLScore"];

  if (v38)
  {
    v39 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRuleMLScore];
    v40 = objc_msgSend(v39, "numberWithDouble:");
    [v132 setObject:v40 forKeyedSubscript:@"averageBehavioralRuleMLScore"];
  }
  v41 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRulePowerFactor"];

  if (v41)
  {
    v42 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRulePowerFactor];
    v43 = objc_msgSend(v42, "numberWithDouble:");
    [v132 setObject:v43 forKeyedSubscript:@"averageBehavioralRulePowerFactor"];
  }
  v44 = [(NSDictionary *)self->_metadata valueForKey:@"averageBehavioralRuleSupport"];

  if (v44)
  {
    v45 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 averageBehavioralRuleSupport];
    v46 = objc_msgSend(v45, "numberWithDouble:");
    [v132 setObject:v46 forKeyedSubscript:@"averageBehavioralRuleSupport"];
  }
  v47 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRuleConfidence"];

  if (v47)
  {
    v48 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRuleConfidence];
    v49 = objc_msgSend(v48, "numberWithDouble:");
    [v132 setObject:v49 forKeyedSubscript:@"maximumBehavioralRuleConfidence"];
  }
  v50 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRuleConviction"];

  if (v50)
  {
    v51 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRuleConviction];
    v52 = objc_msgSend(v51, "numberWithDouble:");
    [v132 setObject:v52 forKeyedSubscript:@"maximumBehavioralRuleConviction"];
  }
  v53 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRuleLift"];

  if (v53)
  {
    v54 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRuleLift];
    v55 = objc_msgSend(v54, "numberWithDouble:");
    [v132 setObject:v55 forKeyedSubscript:@"maximumBehavioralRuleLift"];
  }
  v56 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRuleMLScore"];

  if (v56)
  {
    v57 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRuleMLScore];
    v58 = objc_msgSend(v57, "numberWithDouble:");
    [v132 setObject:v58 forKeyedSubscript:@"maximumBehavioralRuleMLScore"];
  }
  v59 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRulePowerFactor"];

  if (v59)
  {
    v60 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRulePowerFactor];
    v61 = objc_msgSend(v60, "numberWithDouble:");
    [v132 setObject:v61 forKeyedSubscript:@"maximumBehavioralRulePowerFactor"];
  }
  v62 = [(NSDictionary *)self->_metadata valueForKey:@"maximumBehavioralRuleSupport"];

  if (v62)
  {
    v63 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 maximumBehavioralRuleSupport];
    v64 = objc_msgSend(v63, "numberWithDouble:");
    [v132 setObject:v64 forKeyedSubscript:@"maximumBehavioralRuleSupport"];
  }
  v65 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRuleConfidence"];

  if (v65)
  {
    v66 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRuleConfidence];
    v67 = objc_msgSend(v66, "numberWithDouble:");
    [v132 setObject:v67 forKeyedSubscript:@"minimumBehavioralRuleConfidence"];
  }
  v68 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRuleConviction"];

  if (v68)
  {
    v69 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRuleConviction];
    v70 = objc_msgSend(v69, "numberWithDouble:");
    [v132 setObject:v70 forKeyedSubscript:@"minimumBehavioralRuleConviction"];
  }
  v71 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRuleLift"];

  if (v71)
  {
    v72 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRuleLift];
    v73 = objc_msgSend(v72, "numberWithDouble:");
    [v132 setObject:v73 forKeyedSubscript:@"minimumBehavioralRuleLift"];
  }
  v74 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRuleMLScore"];

  if (v74)
  {
    v75 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRuleMLScore];
    v76 = objc_msgSend(v75, "numberWithDouble:");
    [v132 setObject:v76 forKeyedSubscript:@"minimumBehavioralRuleMLScore"];
  }
  v77 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRulePowerFactor"];

  if (v77)
  {
    v78 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRulePowerFactor];
    v79 = objc_msgSend(v78, "numberWithDouble:");
    [v132 setObject:v79 forKeyedSubscript:@"minimumBehavioralRulePowerFactor"];
  }
  v80 = [(NSDictionary *)self->_metadata valueForKey:@"minimumBehavioralRuleSupport"];

  if (v80)
  {
    v81 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 minimumBehavioralRuleSupport];
    v82 = objc_msgSend(v81, "numberWithDouble:");
    [v132 setObject:v82 forKeyedSubscript:@"minimumBehavioralRuleSupport"];
  }
  v83 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRuleConfidence"];

  if (v83)
  {
    v84 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRuleConfidence];
    v85 = objc_msgSend(v84, "numberWithDouble:");
    [v132 setObject:v85 forKeyedSubscript:@"stdevBehavioralRuleConfidence"];
  }
  v86 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRuleConviction"];

  if (v86)
  {
    v87 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRuleConviction];
    v88 = objc_msgSend(v87, "numberWithDouble:");
    [v132 setObject:v88 forKeyedSubscript:@"stdevBehavioralRuleConviction"];
  }
  v89 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRuleLift"];

  if (v89)
  {
    v90 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRuleLift];
    v91 = objc_msgSend(v90, "numberWithDouble:");
    [v132 setObject:v91 forKeyedSubscript:@"stdevBehavioralRuleLift"];
  }
  v92 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRuleMLScore"];

  if (v92)
  {
    v93 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRuleMLScore];
    v94 = objc_msgSend(v93, "numberWithDouble:");
    [v132 setObject:v94 forKeyedSubscript:@"stdevBehavioralRuleMLScore"];
  }
  v95 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRulePowerFactor"];

  if (v95)
  {
    v96 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRulePowerFactor];
    v97 = objc_msgSend(v96, "numberWithDouble:");
    [v132 setObject:v97 forKeyedSubscript:@"stdevBehavioralRulePowerFactor"];
  }
  v98 = [(NSDictionary *)self->_metadata valueForKey:@"stdevBehavioralRuleSupport"];

  if (v98)
  {
    v99 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 stdevBehavioralRuleSupport];
    v100 = objc_msgSend(v99, "numberWithDouble:");
    [v132 setObject:v100 forKeyedSubscript:@"stdevBehavioralRuleSupport"];
  }
  v101 = [(NSDictionary *)self->_metadata valueForKey:@"interactionModelScore"];

  if (v101)
  {
    v102 = NSNumber;
    [(CAPContactFillerContactEvent *)v19 interactionModelScore];
    v103 = objc_msgSend(v102, "numberWithDouble:");
    [v132 setObject:v103 forKeyedSubscript:@"interactionModelScore"];
  }
  v104 = [(NSDictionary *)self->_metadata valueForKey:@"normalizedIncomingCallFrequency"];

  if (v104)
  {
    v105 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedIncomingCallFrequency](v19, "normalizedIncomingCallFrequency"));
    [v132 setObject:v105 forKeyedSubscript:@"normalizedIncomingCallFrequency"];
  }
  v106 = [(NSDictionary *)self->_metadata valueForKey:@"normalizedIncomingTextFrequency"];

  if (v106)
  {
    v107 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedIncomingTextFrequency](v19, "normalizedIncomingTextFrequency"));
    [v132 setObject:v107 forKeyedSubscript:@"normalizedIncomingTextFrequency"];
  }
  v108 = [(NSDictionary *)self->_metadata valueForKey:@"normalizedOutgoingCallFrequency"];

  if (v108)
  {
    v109 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedOutgoingCallFrequency](v19, "normalizedOutgoingCallFrequency"));
    [v132 setObject:v109 forKeyedSubscript:@"normalizedOutgoingCallFrequency"];
  }
  v110 = [(NSDictionary *)self->_metadata valueForKey:@"normalizedOutgoingTextFrequency"];

  if (v110)
  {
    v111 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedOutgoingTextFrequency](v19, "normalizedOutgoingTextFrequency"));
    [v132 setObject:v111 forKeyedSubscript:@"normalizedOutgoingTextFrequency"];
  }
  v112 = [(NSDictionary *)self->_metadata valueForKey:@"normalizedShareFrequency"];

  if (v112)
  {
    v113 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent normalizedShareFrequency](v19, "normalizedShareFrequency"));
    [v132 setObject:v113 forKeyedSubscript:@"normalizedShareFrequency"];
  }
  v114 = [(NSDictionary *)self->_metadata valueForKey:@"numberOfBehavioralRulesAdvocating"];

  if (v114)
  {
    v115 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent numberOfBehavioralRulesAdvocating](v19, "numberOfBehavioralRulesAdvocating"));
    [v132 setObject:v115 forKeyedSubscript:@"numberOfBehavioralRulesAdvocating"];
  }
  v116 = [(NSDictionary *)self->_metadata valueForKey:@"timeSinceLastContactViaIncomingCall"];

  if (v116)
  {
    v117 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaIncomingCall](v19, "timeSinceLastContactViaIncomingCall"));
    [v132 setObject:v117 forKeyedSubscript:@"timeSinceLastContactViaIncomingCall"];
  }
  v118 = [(NSDictionary *)self->_metadata valueForKey:@"timeSinceLastContactViaIncomingText"];

  if (v118)
  {
    v119 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaIncomingText](v19, "timeSinceLastContactViaIncomingText"));
    [v132 setObject:v119 forKeyedSubscript:@"timeSinceLastContactViaIncomingText"];
  }
  v120 = [(NSDictionary *)self->_metadata valueForKey:@"timeSinceLastContactViaOutgoingCall"];

  if (v120)
  {
    v121 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaOutgoingCall](v19, "timeSinceLastContactViaOutgoingCall"));
    [v132 setObject:v121 forKeyedSubscript:@"timeSinceLastContactViaOutgoingCall"];
  }
  v122 = [(NSDictionary *)self->_metadata valueForKey:@"timeSinceLastContactViaOutgoingText"];

  if (v122)
  {
    v123 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaOutgoingText](v19, "timeSinceLastContactViaOutgoingText"));
    [v132 setObject:v123 forKeyedSubscript:@"timeSinceLastContactViaOutgoingText"];
  }
  v124 = [(NSDictionary *)self->_metadata valueForKey:@"timeSinceLastContactViaShare"];

  if (v124)
  {
    v125 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAPContactFillerContactEvent timeSinceLastContactViaShare](v19, "timeSinceLastContactViaShare"));
    [v132 setObject:v125 forKeyedSubscript:@"timeSinceLastContactViaShare"];
  }
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (CAPContactFillerUserEvent)userEvent
{
  return self->_userEvent;
}

- (void)setUserEvent:(id)a3
{
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (BOOL)constantFeaturesReady
{
  return self->_constantFeaturesReady;
}

- (void)setConstantFeaturesReady:(BOOL)a3
{
  self->_constantFeaturesReady = a3;
}

- (_PSContactFillerNormalizationConstants)normConstants
{
  return self->_normConstants;
}

- (void)setNormConstants:(id)a3
{
}

- (NSMutableDictionary)constantFeatures
{
  return self->_constantFeatures;
}

- (void)setConstantFeatures:(id)a3
{
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_constantFeatures, 0);
  objc_storeStrong((id *)&self->_normConstants, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_userEvent, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)extractConstantFeaturesInto:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "userEvent: %@", v1, 0xCu);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 normConstants];
  uint64_t v2 = [v1 shareTotal];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 normConstants];
  uint64_t v2 = [v1 outgoingTextTotal];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 normConstants];
  uint64_t v2 = [v1 outgoingCallTotal];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.5(void *a1)
{
  v1 = [a1 normConstants];
  uint64_t v2 = [v1 incomingTextTotal];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);
}

- (void)extractConstantFeaturesInto:(void *)a1 .cold.6(void *a1)
{
  v1 = [a1 normConstants];
  uint64_t v2 = [v1 incomingCallTotal];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "userEvent-normConstants: %@", v5, v6, v7, v8, v9);
}

@end
@interface _PSCNAutocompleteFeedbackTracker
+ (id)defaultActionWithInteraction:(id)a3 trialID:(id)a4 isImplicit:(BOOL)a5;
+ (id)defaultImpressionWithFeedback:(id)a3 bundleID:(id)a4 trialID:(id)a5 isImplicit:(BOOL)a6;
+ (id)defaultSubmodelImpressionWithFeedback:(id)a3 submodel:(id)a4 bundleID:(id)a5 trialID:(id)a6 isImplicit:(BOOL)a7;
- (NSDate)stopTime;
- (_PSCNAutocompleteFeedbackTracker)initWithInteractionIterator:(id)a3 maxSecondsBetweenImpressionAndAction:(int64_t)a4 shouldInferEnterAndExit:(BOOL)a5 impressionLogger:(id)a6 submodelImpressionLogger:(id)a7 actionLogger:(id)a8 defaultForIsImplicit:(BOOL)a9;
- (void)annotateAction:(id)a3 withStatistics:(id)a4;
- (void)annotateImpression:(id)a3 withStatistics:(id)a4;
- (void)finish;
- (void)finishWithInferredEnterAndExit;
- (void)logActionFromAccumulator:(id)a3;
- (void)logImpressionsFromAccumulator:(id)a3;
- (void)processFeedback:(id)a3;
- (void)processFeedbackWithInferredEnterAndExit:(id)a3;
@end

@implementation _PSCNAutocompleteFeedbackTracker

+ (id)defaultImpressionWithFeedback:(id)a3 bundleID:(id)a4 trialID:(id)a5 isImplicit:(BOOL)a6
{
  BOOL v6 = a6;
  v20[13] = *MEMORY[0x1E4F143B8];
  v19[0] = @"avgRankTapped";
  v19[1] = @"avgRankUsed";
  v20[0] = &unk_1EF6767C8;
  v20[1] = &unk_1EF6767C8;
  if (a4) {
    v9 = (__CFString *)a4;
  }
  else {
    v9 = @"Unknown";
  }
  v20[2] = v9;
  v19[2] = @"bundleID";
  v19[3] = @"countSuggested";
  v10 = NSNumber;
  v11 = (__CFString *)a5;
  id v12 = a4;
  v13 = [a3 suggestions];
  v14 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v20[3] = v14;
  v20[4] = &unk_1EF675AE0;
  v19[4] = @"countTapped";
  v19[5] = @"countUsed";
  v20[5] = &unk_1EF675AE0;
  v20[6] = &unk_1EF675AE0;
  v19[6] = @"highestRankTapped";
  v19[7] = @"highestRankUsed";
  v20[7] = &unk_1EF675AE0;
  v19[8] = @"isImplicit";
  v15 = [NSNumber numberWithBool:v6];
  v19[9] = @"ledToAction";
  v19[10] = @"lowestRankTapped";
  v20[8] = v15;
  v20[9] = &unk_1EF675AE0;
  v20[10] = &unk_1EF675AE0;
  v20[11] = &unk_1EF675AE0;
  v19[11] = @"lowestRankUsed";
  v19[12] = @"trialID";
  if (v11) {
    v16 = v11;
  }
  else {
    v16 = @"Unknown";
  }
  v20[12] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:13];

  return v17;
}

+ (id)defaultSubmodelImpressionWithFeedback:(id)a3 submodel:(id)a4 bundleID:(id)a5 trialID:(id)a6 isImplicit:(BOOL)a7
{
  BOOL v7 = a7;
  v35[14] = *MEMORY[0x1E4F143B8];
  v23 = @"avgRankTapped";
  v24 = @"avgRankUsed";
  v35[0] = &unk_1EF6767C8;
  v35[1] = &unk_1EF6767C8;
  if (a5) {
    v11 = (__CFString *)a5;
  }
  else {
    v11 = @"Unknown";
  }
  v35[2] = v11;
  id v12 = NSNumber;
  v13 = (__CFString *)a6;
  id v14 = a5;
  v15 = (__CFString *)a4;
  v16 = objc_msgSend(a3, "suggestions", v23, v24, @"bundleID", @"countSuggested");
  v17 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v35[3] = v17;
  v35[4] = &unk_1EF675AE0;
  v25 = @"countTapped";
  v26 = @"countUsed";
  v35[5] = &unk_1EF675AE0;
  v35[6] = &unk_1EF675AE0;
  v27 = @"highestRankTapped";
  v28 = @"highestRankUsed";
  v35[7] = &unk_1EF675AE0;
  v29 = @"isImplicit";
  v18 = [NSNumber numberWithBool:v7];
  v30 = @"ledToAction";
  v31 = @"lowestRankTapped";
  v35[8] = v18;
  v35[9] = &unk_1EF675AE0;
  v35[10] = &unk_1EF675AE0;
  v35[11] = &unk_1EF675AE0;
  v32 = @"lowestRankUsed";
  v33 = @"submodelID";
  if (v15) {
    v19 = v15;
  }
  else {
    v19 = @"Unknown";
  }
  v34 = @"trialID";
  if (v13) {
    v20 = v13;
  }
  else {
    v20 = @"Unknown";
  }
  v35[12] = v19;
  v35[13] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v23 count:14];

  return v21;
}

+ (id)defaultActionWithInteraction:(id)a3 trialID:(id)a4 isImplicit:(BOOL)a5
{
  BOOL v5 = a5;
  v20[11] = *MEMORY[0x1E4F143B8];
  v19[0] = @"actionName";
  BOOL v7 = (__CFString *)a4;
  id v8 = a3;
  [v8 mechanism];
  uint64_t v9 = mechanismToString();
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"Unknown";
  }
  v20[0] = v11;
  v19[1] = @"bundleID";
  id v12 = [v8 bundleId];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = @"Unknown";
  }
  v20[1] = v13;
  v20[2] = &unk_1EF675AE0;
  v19[2] = @"countErasedHandles";
  v19[3] = @"countTappedSuggestions";
  v20[3] = &unk_1EF675AE0;
  v20[4] = &unk_1EF675AE0;
  v19[4] = @"countTimesVendedSuggestions";
  v19[5] = @"countTypedHandles";
  v20[5] = &unk_1EF675AE0;
  v20[6] = &unk_1EF675AE0;
  v19[6] = @"countUsedSuggestions";
  v19[7] = @"countVendedSuggestions";
  v20[7] = &unk_1EF675AE0;
  v19[8] = @"isImplicit";
  uint64_t v14 = [NSNumber numberWithBool:v5];
  v15 = (void *)v14;
  if (v7) {
    v16 = v7;
  }
  else {
    v16 = @"Unknown";
  }
  v20[8] = v14;
  v20[9] = v16;
  v19[9] = @"trialID";
  v19[10] = @"usedSuggestions";
  v20[10] = MEMORY[0x1E4F1CC28];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:11];

  return v17;
}

- (_PSCNAutocompleteFeedbackTracker)initWithInteractionIterator:(id)a3 maxSecondsBetweenImpressionAndAction:(int64_t)a4 shouldInferEnterAndExit:(BOOL)a5 impressionLogger:(id)a6 submodelImpressionLogger:(id)a7 actionLogger:(id)a8 defaultForIsImplicit:(BOOL)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_PSCNAutocompleteFeedbackTracker;
  v20 = [(_PSCNAutocompleteFeedbackTracker *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_interactionIterator, a3);
    v21->_maxSecondsBetweenImpressionAndAction = a4;
    v21->_shouldInferEnterAndExit = a5;
    uint64_t v22 = MEMORY[0x1A6243AD0](v17);
    id impressionLogger = v21->_impressionLogger;
    v21->_id impressionLogger = (id)v22;

    uint64_t v24 = MEMORY[0x1A6243AD0](v18);
    id submodelImpressionLogger = v21->_submodelImpressionLogger;
    v21->_id submodelImpressionLogger = (id)v24;

    uint64_t v26 = MEMORY[0x1A6243AD0](v19);
    id actionLogger = v21->_actionLogger;
    v21->_id actionLogger = (id)v26;

    v21->_defaultForIsImplicit = a9;
    uint64_t v28 = objc_opt_new();
    dateFormatter = v21->_dateFormatter;
    v21->_dateFormatter = (NSDateFormatter *)v28;

    [(NSDateFormatter *)v21->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
  }

  return v21;
}

- (void)annotateImpression:(id)a3 withStatistics:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  BOOL v6 = NSNumber;
  uint64_t v7 = [v5 countTapped];
  double v8 = 0.0;
  double v9 = 0.0;
  if (v7 >= 1)
  {
    double v10 = (double)objc_msgSend(v5, "totalRankTapped", 0.0);
    double v9 = v10 / (double)[v5 countTapped];
  }
  v11 = [v6 numberWithDouble:v9];
  [v22 setObject:v11 forKeyedSubscript:@"avgRankTapped"];

  id v12 = NSNumber;
  if ([v5 countUsed] >= 1)
  {
    double v13 = (double)[v5 totalRankUsed];
    double v8 = v13 / (double)[v5 countUsed];
  }
  uint64_t v14 = [v12 numberWithDouble:v8];
  [v22 setObject:v14 forKeyedSubscript:@"avgRankUsed"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "countTapped"));
  [v22 setObject:v15 forKeyedSubscript:@"countTapped"];

  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "countUsed"));
  [v22 setObject:v16 forKeyedSubscript:@"countUsed"];

  id v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "countUsed") > 0);
  [v22 setObject:v17 forKeyedSubscript:@"ledToAction"];

  id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "highestRankTapped"));
  [v22 setObject:v18 forKeyedSubscript:@"highestRankTapped"];

  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "highestRankUsed"));
  [v22 setObject:v19 forKeyedSubscript:@"highestRankUsed"];

  v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "lowestRankTapped"));
  [v22 setObject:v20 forKeyedSubscript:@"lowestRankTapped"];

  v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "lowestRankUsed"));
  [v22 setObject:v21 forKeyedSubscript:@"lowestRankUsed"];
}

- (void)logImpressionsFromAccumulator:(id)a3
{
  id v4 = a3;
  id v5 = [v4 vendedSuggestionEvents];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v4 vendedSuggestionEvents];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v26 = v4;
      do
      {
        uint64_t v28 = objc_opt_class();
        v33 = [v4 vendedSuggestionEvents];
        v32 = [v33 objectAtIndexedSubscript:v9];
        v27 = [v32 vendedSuggestions];
        objc_super v31 = [v4 vendedSuggestionEvents];
        v30 = [v31 objectAtIndexedSubscript:v9];
        double v10 = [v30 bundleIdentifier];
        v11 = [v4 vendedSuggestionEvents];
        id v12 = [v11 objectAtIndexedSubscript:v9];
        double v13 = [v12 vendedSuggestions];
        uint64_t v14 = [v13 suggestions];
        v15 = [v14 firstObject];
        id v16 = [v15 trialID];
        id v17 = [v28 defaultImpressionWithFeedback:v27 bundleID:v10 trialID:v16 isImplicit:self->_defaultForIsImplicit];
        v29 = (void *)[v17 mutableCopy];

        id v4 = v26;
        id v18 = [v26 metricsForImpressions];
        id v19 = [v18 objectAtIndexedSubscript:v9];
        [(_PSCNAutocompleteFeedbackTracker *)self annotateImpression:v29 withStatistics:v19];

        (*((void (**)(void))self->_impressionLogger + 2))();
        v20 = [v26 metricsForSubmodelImpressions];
        v21 = [v20 objectAtIndexedSubscript:v9];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __66___PSCNAutocompleteFeedbackTracker_logImpressionsFromAccumulator___block_invoke;
        v34[3] = &unk_1E5AE1288;
        v34[4] = self;
        id v22 = v26;
        id v35 = v22;
        unint64_t v36 = v9;
        [v21 enumerateKeysAndObjectsUsingBlock:v34];

        ++v9;
        v23 = [v22 vendedSuggestionEvents];
        unint64_t v24 = [v23 count];
      }
      while (v9 < v24);
    }
  }
  else
  {
    v25 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[_PSCNAutocompleteFeedbackTracker logImpressionsFromAccumulator:](v25);
    }
  }
}

- (void)annotateAction:(id)a3 withStatistics:(id)a4
{
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "countTappedSuggestions"));
  [v7 setObject:v8 forKeyedSubscript:@"countTappedSuggestions"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "countTimesVendedSuggestions"));
  [v7 setObject:v9 forKeyedSubscript:@"countTimesVendedSuggestions"];

  double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "countUsedSuggestions"));
  [v7 setObject:v10 forKeyedSubscript:@"countUsedSuggestions"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "countVendedSuggestions"));
  [v7 setObject:v11 forKeyedSubscript:@"countVendedSuggestions"];

  id v12 = NSNumber;
  uint64_t v13 = [v6 countUsedSuggestions];

  id v14 = [v12 numberWithInt:v13 > 0];
  [v7 setObject:v14 forKeyedSubscript:@"usedSuggestions"];
}

- (void)logActionFromAccumulator:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v4 interaction];
  id v7 = [v4 vendedSuggestionEvents];
  uint64_t v8 = [v7 lastObject];
  unint64_t v9 = [v8 vendedSuggestions];
  double v10 = [v9 suggestions];
  v11 = [v10 firstObject];
  id v12 = [v11 trialID];
  uint64_t v13 = [v5 defaultActionWithInteraction:v6 trialID:v12 isImplicit:self->_defaultForIsImplicit];
  id v15 = (id)[v13 mutableCopy];

  id v14 = [v4 metricsForAction];

  [(_PSCNAutocompleteFeedbackTracker *)self annotateAction:v15 withStatistics:v14];
  (*((void (**)(void))self->_actionLogger + 2))();
}

- (void)processFeedback:(id)a3
{
  if (self->_shouldInferEnterAndExit) {
    [(_PSCNAutocompleteFeedbackTracker *)self processFeedbackWithInferredEnterAndExit:a3];
  }
  else {
    [(_PSCNAutocompleteFeedbackTracker *)self processFeedbackWithoutInferredEnterAndExit:a3];
  }
}

- (void)processFeedbackWithInferredEnterAndExit:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_stopTime)
  {
    id v6 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:](v6);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (![v4 feedbackType] || objc_msgSend(v5, "feedbackType") == 1)
  {
    id v6 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:](v6);
    }
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_followingInteractionPrevious, self->_followingInteraction);
  interactionIterator = self->_interactionIterator;
  uint64_t v8 = [v5 reportTime];
  unint64_t v9 = [(_PSCNAutocompleteFeedbackInteractionIterator *)interactionIterator fastForwardToDate:v8];
  followingInteraction = self->_followingInteraction;
  self->_followingInteraction = v9;

  if (self->_accumulator)
  {
    if (self->_followingInteraction == self->_followingInteractionPrevious || !self->_inActionWindow)
    {
      if ([v5 feedbackType] == 2 && !self->_inActionWindow)
      {
        uint64_t v13 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Ended - received next vended suggestions event.", (uint8_t *)&v38, 2u);
        }

        [(_PSCNAutocompleteFeedbackTracker *)self logImpressionsFromAccumulator:self->_accumulator];
        accumulator = self->_accumulator;
        self->_accumulator = 0;
      }
    }
    else
    {
      v11 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Ended - moved past previous interaction (action).", (uint8_t *)&v38, 2u);
      }

      [(_PSCNAutocompleteFeedbackSessionAccumulator *)self->_accumulator updateWithInteraction:self->_followingInteractionPrevious];
      [(_PSCNAutocompleteFeedbackTracker *)self logImpressionsFromAccumulator:self->_accumulator];
      [(_PSCNAutocompleteFeedbackTracker *)self logActionFromAccumulator:self->_accumulator];
      id v12 = self->_accumulator;
      self->_accumulator = 0;

      self->_inActionWindow = 0;
    }
  }
  id v15 = self->_followingInteraction;
  id v16 = +[_PSLogging feedbackChannel];
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      dateFormatter = self->_dateFormatter;
      id v19 = [v5 reportTime];
      v20 = [(NSDateFormatter *)dateFormatter stringFromDate:v19];
      v21 = [v5 userIdentifier];
      id v22 = [v5 bundleIdentifier];
      v23 = [v5 sourceBundleIdentifier];
      if ([v5 isImplicit]) {
        unint64_t v24 = @"YES";
      }
      else {
        unint64_t v24 = @"NO";
      }
      uint64_t v25 = [v5 feedbackType];
      int v38 = 138413570;
      int64_t v39 = (int64_t)v20;
      __int16 v40 = 2112;
      v41 = v21;
      __int16 v42 = 2112;
      v43 = v22;
      __int16 v44 = 2112;
      v45 = v23;
      __int16 v46 = 2112;
      v47 = v24;
      __int16 v48 = 2048;
      uint64_t v49 = v25;
      _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Processing event reported on %@ for user %@, for %@, reported by %@, implicit=%@, of type %lu.", (uint8_t *)&v38, 0x3Eu);
    }
    if (!self->_accumulator && [v5 feedbackType] == 2)
    {
      uint64_t v26 = [(_CDInteraction *)self->_followingInteraction startDate];
      v27 = [v5 reportTime];
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;
      double maxSecondsBetweenImpressionAndAction = (double)self->_maxSecondsBetweenImpressionAndAction;

      objc_super v31 = +[_PSLogging feedbackChannel];
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v29 <= maxSecondsBetweenImpressionAndAction)
      {
        if (v32)
        {
          int64_t v35 = self->_maxSecondsBetweenImpressionAndAction;
          int v38 = 134217984;
          int64_t v39 = v35;
          _os_log_impl(&dword_1A314B000, v31, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Started - within %ld seconds of next interaction (action).", (uint8_t *)&v38, 0xCu);
        }

        self->_inActionWindow = 1;
      }
      else
      {
        if (v32)
        {
          LOWORD(v38) = 0;
          _os_log_impl(&dword_1A314B000, v31, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Started - received vended suggestions event too far away from interaction (action).", (uint8_t *)&v38, 2u);
        }
      }
      unint64_t v36 = (_PSCNAutocompleteFeedbackSessionAccumulator *)objc_opt_new();
      v37 = self->_accumulator;
      self->_accumulator = v36;
    }
    [(_PSCNAutocompleteFeedbackSessionAccumulator *)self->_accumulator updateWithFeedback:v5];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:]((uint64_t)self, v5);
    }

    v33 = [v5 reportTime];
    stopTime = self->_stopTime;
    self->_stopTime = v33;
  }
LABEL_9:
}

- (void)finish
{
  if (self->_shouldInferEnterAndExit) {
    [(_PSCNAutocompleteFeedbackTracker *)self finishWithInferredEnterAndExit];
  }
  else {
    [(_PSCNAutocompleteFeedbackTracker *)self finishWithoutInferredEnterAndExit];
  }
}

- (void)finishWithInferredEnterAndExit
{
  v1 = *(void **)(a1 + 64);
  v2 = [*(id *)(a1 + 80) startDate];
  v3 = [v1 stringFromDate:v2];
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v4, v5, "_PSCNAutocompleteFeedbackTracker: Finished iterating through feedback events. Setting stop time to %@.", v6, v7, v8, v9, 2u);
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTime, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_followingInteraction, 0);
  objc_storeStrong((id *)&self->_followingInteractionPrevious, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong(&self->_actionLogger, 0);
  objc_storeStrong(&self->_submodelImpressionLogger, 0);
  objc_storeStrong(&self->_impressionLogger, 0);

  objc_storeStrong((id *)&self->_interactionIterator, 0);
}

- (void)logImpressionsFromAccumulator:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackTracker: Error when attempting to log impressions for session. Skipping.", v1, 2u);
}

- (void)processFeedbackWithInferredEnterAndExit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSAutocompleteFeedbackTracker: Feedback event is enter or exit event. Skipping as we are running in inferred enter / exit mode.", v1, 2u);
}

- (void)processFeedbackWithInferredEnterAndExit:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 64);
  v3 = [a2 reportTime];
  uint64_t v4 = [v2 stringFromDate:v3];
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v5, v6, "_PSCNAutocompleteFeedbackTracker: Interaction (action) iterator exhausted. Setting stop time to %@.", v7, v8, v9, v10, 2u);
}

- (void)processFeedbackWithInferredEnterAndExit:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSCNAutocompleteFeedbackTracker: Stop time already set; out of recorded interactions (actions). Deferring processin"
    "g of feedback event.",
    v1,
    2u);
}

@end
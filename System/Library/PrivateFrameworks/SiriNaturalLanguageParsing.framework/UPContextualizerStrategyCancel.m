@interface UPContextualizerStrategyCancel
- (UPContextualizerStrategyCancel)initWithPrebuiltIntentThreshold:(double)a3;
- (double)prebuiltIntentThreshold;
- (id)resultUsingContextualizerInput:(id)a3;
@end

@implementation UPContextualizerStrategyCancel

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 coreResult];
  double prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v12[0] = @"cancel";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  BOOL v7 = +[UPContextualizerUtilities hasTopCandidate:v4 excedingProbability:v6 matchingOneOfIntents:prebuiltIntentThreshold];

  if (v7)
  {
    v8 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C8DA9000, v8, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyCancel: Detected high-probability cancel intent in core result", v11, 2u);
    }

    v9 = +[UPResult createResultFromExistingResult:v4 truncatedTo:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UPContextualizerStrategyCancel)initWithPrebuiltIntentThreshold:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UPContextualizerStrategyCancel;
  result = [(UPContextualizerStrategyCancel *)&v5 init];
  if (result) {
    result->_double prebuiltIntentThreshold = a3;
  }
  return result;
}

@end
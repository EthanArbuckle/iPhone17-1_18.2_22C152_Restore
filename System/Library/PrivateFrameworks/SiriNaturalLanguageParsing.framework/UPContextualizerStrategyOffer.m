@interface UPContextualizerStrategyOffer
- (UPContextualizerStrategyOffer)initWithPrebuiltIntentThreshold:(double)a3;
- (double)prebuiltIntentThreshold;
- (id)resultUsingContextualizerInput:(id)a3;
@end

@implementation UPContextualizerStrategyOffer

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dialogAct];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[UPContextualizerStrategyOffer resultUsingContextualizerInput:]", "UPContextualizerStrategyOffer.m", 39, "[contextualizerInput.dialogAct isKindOfClass:[UPDialogActOffer class]]");
  }

  v6 = [v4 coreResult];
  double prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v14[0] = @"no";
  v14[1] = @"yes";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  BOOL v9 = +[UPContextualizerUtilities hasTopCandidate:v6 excedingProbability:v8 matchingOneOfIntents:prebuiltIntentThreshold];

  if (v9)
  {
    v10 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOffer: Detected high-probability yes/no intent in core result", v13, 2u);
    }

    v11 = +[UPResult createResultFromExistingResult:v6 truncatedTo:1];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UPContextualizerStrategyOffer)initWithPrebuiltIntentThreshold:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UPContextualizerStrategyOffer;
  result = [(UPContextualizerStrategyOffer *)&v5 init];
  if (result) {
    result->_double prebuiltIntentThreshold = a3;
  }
  return result;
}

@end
@interface UIStatesFeedbackGeneratorConfiguration
@end

@implementation UIStatesFeedbackGeneratorConfiguration

void __59___UIStatesFeedbackGeneratorConfiguration_feedbackKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = NSString;
  id v5 = a2;
  v6 = NSStringFromSelector(sel_stateChangeConfigurations);
  v7 = NSStringFromSelector(sel_thresholdFeedback);
  v8 = [v4 stringWithFormat:@"%@.%@.%@", v6, v5, v7];
  [v3 addObject:v8];

  v9 = *(void **)(a1 + 32);
  v10 = NSString;
  NSStringFromSelector(sel_stateChangeConfigurations);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = NSStringFromSelector(sel_approachFeedback);
  v12 = [v10 stringWithFormat:@"%@.%@.%@", v13, v5, v11];

  [v9 addObject:v12];
}

void __73___UIStatesFeedbackGeneratorConfiguration_hidFeedbackPatternNameKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSString;
  id v4 = a2;
  NSStringFromSelector(sel_stateChangeConfigurations);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = NSStringFromSelector(sel_hidThresholdFeedbackPatternName);
  v6 = [v3 stringWithFormat:@"%@.%@.%@", v7, v4, v5];

  [v2 addObject:v6];
}

void __81___UIStatesFeedbackGeneratorConfiguration__alternateFeedback_forDevice_senderID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v12 = v6;
  v8 = [v6 thresholdFeedback];
  LODWORD(v7) = [v7 isEqual:v8];

  if (v7)
  {
    uint64_t v9 = [v12 hidThresholdFeedbackPatternName];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

@end
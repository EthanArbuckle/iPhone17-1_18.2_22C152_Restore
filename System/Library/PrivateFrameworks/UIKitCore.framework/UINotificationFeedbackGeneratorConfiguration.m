@interface UINotificationFeedbackGeneratorConfiguration
@end

@implementation UINotificationFeedbackGeneratorConfiguration

void __69___UINotificationFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 includePrivateEvents];
  if (qword_1EB25CBE8 != -1) {
    dispatch_once(&qword_1EB25CBE8, &__block_literal_global_87);
  }
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 32;
  }
  _UICreateNotificationFeedbacksForTypes(*(void **)&_MergedGlobals_3_9[v4]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setFeedbacks:v5];
}

void __78___UINotificationFeedbackGeneratorConfiguration_privateConfigurationForTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  _UICreateNotificationFeedbacksForTypes(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setFeedbacks:v4];
}

@end
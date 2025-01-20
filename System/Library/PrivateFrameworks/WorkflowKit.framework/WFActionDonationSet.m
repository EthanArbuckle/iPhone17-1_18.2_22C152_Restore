@interface WFActionDonationSet
- (NSMutableArray)appSuggestedActions;
- (NSMutableArray)predictedActions;
- (NSMutableArray)recentActions;
- (WFActionDonationSet)init;
@end

@implementation WFActionDonationSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestedActions, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_predictedActions, 0);
}

- (NSMutableArray)appSuggestedActions
{
  return self->_appSuggestedActions;
}

- (NSMutableArray)recentActions
{
  return self->_recentActions;
}

- (NSMutableArray)predictedActions
{
  return self->_predictedActions;
}

- (WFActionDonationSet)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFActionDonationSet;
  v2 = [(WFActionDonationSet *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    predictedActions = v2->_predictedActions;
    v2->_predictedActions = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    recentActions = v2->_recentActions;
    v2->_recentActions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    appSuggestedActions = v2->_appSuggestedActions;
    v2->_appSuggestedActions = (NSMutableArray *)v7;

    v9 = v2;
  }

  return v2;
}

@end
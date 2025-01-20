@interface AppStoreReviewManager
- (_TtC10MobileMail21AppStoreReviewManager)init;
- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4;
- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4 externalRequirementsProvider:(id)a5;
- (void)attemptToShowPromptIn:(id)a3 reason:(int64_t)a4;
- (void)didForeground;
- (void)notifyCriterionMet:(int64_t)a3;
@end

@implementation AppStoreReviewManager

- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4 externalRequirementsProvider:(id)a5
{
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_10025A6D8((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (_TtC10MobileMail21AppStoreReviewManager)initWithEligibilityTracker:(id)a3 requirementStorage:(id)a4
{
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_10025A94C((uint64_t)a3, (uint64_t)a4);
}

- (void)attemptToShowPromptIn:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_10025AA64(a3, a4);
}

- (void)notifyCriterionMet:(int64_t)a3
{
  v3 = self;
  sub_10025EE40(a3);
}

- (void)didForeground
{
  v2 = self;
  sub_1002602E0();
}

- (_TtC10MobileMail21AppStoreReviewManager)init
{
  return (_TtC10MobileMail21AppStoreReviewManager *)sub_10026037C();
}

- (void).cxx_destruct
{
}

@end
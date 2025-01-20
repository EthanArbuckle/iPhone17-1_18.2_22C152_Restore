@interface STDistributionEligibility
+ (BOOL)evaluateEligibilityForAppDistribution;
+ (void)evaluateEligibilityForAppDistribution;
@end

@implementation STDistributionEligibility

+ (BOOL)evaluateEligibilityForAppDistribution
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    int domain_answer = os_eligibility_get_domain_answer();
    if (domain_answer | os_eligibility_get_domain_answer())
    {
      v4 = +[STUILog contentPrivacy];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[STDistributionEligibility evaluateEligibilityForAppDistribution](v4);
      }

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

+ (void)evaluateEligibilityForAppDistribution
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225B06000, log, OS_LOG_TYPE_FAULT, "Failure checking distribution eligibility", v1, 2u);
}

@end
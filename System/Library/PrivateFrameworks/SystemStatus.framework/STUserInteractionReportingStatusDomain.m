@interface STUserInteractionReportingStatusDomain
- (void)reportUserInteraction:(id)a3;
@end

@implementation STUserInteractionReportingStatusDomain

- (void)reportUserInteraction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(STStatusDomain *)self isInvalidated])
  {
    v5 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      unint64_t v6 = [(id)objc_opt_class() statusDomainName];
      v7 = STSystemStatusDescriptionForDomain(v6);
      int v8 = 138543362;
      v9 = v7;
      _os_log_fault_impl(&dword_1D9514000, v5, OS_LOG_TYPE_FAULT, "%{public}@ domain attempted to report user interaction after being invalidated", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = [(STStatusDomain *)self serverHandle];
    -[NSObject reportUserInteraction:forClient:domain:](v5, "reportUserInteraction:forClient:domain:", v4, self, [(id)objc_opt_class() statusDomainName]);
  }
}

@end
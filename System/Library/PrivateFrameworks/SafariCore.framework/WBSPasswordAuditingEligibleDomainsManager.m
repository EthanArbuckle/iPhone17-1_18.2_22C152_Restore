@interface WBSPasswordAuditingEligibleDomainsManager
- (NSSet)domainsIneligibleForPasswordAuditing;
- (WBSPasswordAuditingEligibleDomainsManager)init;
- (WBSPasswordAuditingEligibleDomainsManager)initWithDomainsIneligibleForPasswordAuditing:(id)a3;
- (void)setDomainsIneligibleForPasswordAuditing:(id)a3;
@end

@implementation WBSPasswordAuditingEligibleDomainsManager

- (WBSPasswordAuditingEligibleDomainsManager)init
{
  return 0;
}

- (WBSPasswordAuditingEligibleDomainsManager)initWithDomainsIneligibleForPasswordAuditing:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordAuditingEligibleDomainsManager;
  v5 = [(WBSPasswordAuditingEligibleDomainsManager *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domainsIneligibleForPasswordAuditing = v5->_domainsIneligibleForPasswordAuditing;
    v5->_domainsIneligibleForPasswordAuditing = (NSSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSSet)domainsIneligibleForPasswordAuditing
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDomainsIneligibleForPasswordAuditing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
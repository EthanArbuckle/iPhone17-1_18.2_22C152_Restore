@interface CPLSyndicationOSLogDomain
@end

@implementation CPLSyndicationOSLogDomain

void ____CPLSyndicationOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  os_log_t v1 = os_log_create(v0, "client.assetsd.manager.syndication");
  v2 = (void *)__CPLSyndicationOSLogDomain_result;
  __CPLSyndicationOSLogDomain_result = (uint64_t)v1;
}

@end
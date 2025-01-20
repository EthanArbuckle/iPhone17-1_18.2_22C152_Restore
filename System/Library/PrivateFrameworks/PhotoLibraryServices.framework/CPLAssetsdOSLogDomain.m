@interface CPLAssetsdOSLogDomain
@end

@implementation CPLAssetsdOSLogDomain

void ____CPLAssetsdOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  os_log_t v1 = os_log_create(v0, "client.assetsd");
  v2 = (void *)__CPLAssetsdOSLogDomain_result;
  __CPLAssetsdOSLogDomain_result = (uint64_t)v1;
}

@end
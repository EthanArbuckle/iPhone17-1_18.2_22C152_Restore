@interface CPLSystemLibraryOSLogDomain
@end

@implementation CPLSystemLibraryOSLogDomain

void ____CPLSystemLibraryOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  os_log_t v1 = os_log_create(v0, "client.assetsd.manager.systemlibrary");
  v2 = (void *)__CPLSystemLibraryOSLogDomain_result;
  __CPLSystemLibraryOSLogDomain_result = (uint64_t)v1;
}

@end
@interface CPLCloudPhotoServicesOSLogDomain
@end

@implementation CPLCloudPhotoServicesOSLogDomain

void ____CPLCloudPhotoServicesOSLogDomain_block_invoke()
{
  v0 = (const char *)_CPLOSLogSubsystem();
  os_log_t v1 = os_log_create(v0, "cloudphotoservices");
  v2 = (void *)__CPLCloudPhotoServicesOSLogDomain_result;
  __CPLCloudPhotoServicesOSLogDomain_result = (uint64_t)v1;
}

@end
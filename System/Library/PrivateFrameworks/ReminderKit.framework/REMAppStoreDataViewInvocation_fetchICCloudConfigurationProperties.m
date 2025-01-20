@interface REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties)init;
- (unint64_t)hash;
@end

@implementation REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties;
  return [(REMStoreInvocationValueStorage *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties;
  return [(REMStoreInvocationValueStorage *)&v3 hash];
}

@end
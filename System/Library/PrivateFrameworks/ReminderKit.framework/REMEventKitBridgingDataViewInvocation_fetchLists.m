@interface REMEventKitBridgingDataViewInvocation_fetchLists
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMEventKitBridgingDataViewInvocation_fetchLists)init;
@end

@implementation REMEventKitBridgingDataViewInvocation_fetchLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMEventKitBridgingDataViewInvocation_fetchLists)init
{
  v3.receiver = self;
  v3.super_class = (Class)REMEventKitBridgingDataViewInvocation_fetchLists;
  return [(REMStoreInvocationValueStorage *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (v3 != 0) & isKindOfClass;
}

@end
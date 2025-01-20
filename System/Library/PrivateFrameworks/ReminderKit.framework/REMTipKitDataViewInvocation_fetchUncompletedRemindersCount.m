@interface REMTipKitDataViewInvocation_fetchUncompletedRemindersCount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMTipKitDataViewInvocation_fetchUncompletedRemindersCount)init;
- (unint64_t)hash;
@end

@implementation REMTipKitDataViewInvocation_fetchUncompletedRemindersCount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTipKitDataViewInvocation_fetchUncompletedRemindersCount)init
{
  v3.receiver = self;
  v3.super_class = (Class)REMTipKitDataViewInvocation_fetchUncompletedRemindersCount;
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
  v3.super_class = (Class)REMTipKitDataViewInvocation_fetchUncompletedRemindersCount;
  return [(REMStoreInvocationValueStorage *)&v3 hash];
}

@end
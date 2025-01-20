@interface REMCDAuxiliaryChangeInfo
+ (BOOL)isAbstract;
+ (BOOL)shouldSyncToCloud;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (BOOL)isConnectedToAccountObject:(id)a3;
@end

@implementation REMCDAuxiliaryChangeInfo

- (BOOL)isConnectedToAccountObject:(id)a3
{
  return 1;
}

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v8 = +[REMLogStore utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10074900C(v8);
    }
  }
  return @"REMCDAuxiliaryChangeInfo";
}

+ (BOOL)shouldSyncToCloud
{
  return 0;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAuxiliaryChangeInfo"];
}

@end
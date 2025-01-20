@interface REMCDAuxiliaryReminderChangeInfo
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDAuxiliaryReminderChangeInfo

+ (BOOL)isAbstract
{
  return 0;
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
      sub_10074EF58(v8);
    }
  }
  return @"REMCDAuxiliaryReminderChangeInfo";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAuxiliaryReminderChangeInfo"];
}

@end
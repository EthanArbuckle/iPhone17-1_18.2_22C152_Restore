@interface REMCDSharedToMeReminderPlaceholder
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (void)debug_lowLevelRemoveFromParent;
@end

@implementation REMCDSharedToMeReminderPlaceholder

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_10074F098(v5);
  }

  v6 = [(REMCDSharedToMeReminderPlaceholder *)self reminder];
  unsigned __int8 v7 = [v6 isConnectedToAccountObject:v4];

  return v7;
}

- (void)debug_lowLevelRemoveFromParent
{
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMSharedToMeReminderPlaceholder cdEntityName];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDSharedToMeReminderPlaceholder"];
}

@end
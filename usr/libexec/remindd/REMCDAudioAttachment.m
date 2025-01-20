@interface REMCDAudioAttachment
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDAudioAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  v2 = +[REMLogStore utility];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100751D6C(v2);
  }

  return @"REMCDAudioAttachment";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAudioAttachment"];
}

@end
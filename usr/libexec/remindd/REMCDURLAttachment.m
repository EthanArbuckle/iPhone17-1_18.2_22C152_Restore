@interface REMCDURLAttachment
+ (BOOL)isAbstract;
+ (id)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCDURLAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMURLAttachment cdEntityName];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDURLAttachment"];
}

@end
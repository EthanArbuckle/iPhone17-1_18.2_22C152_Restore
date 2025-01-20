@interface KTCoreDataSTSetting
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTSetting

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"STSetting"];
}

@end
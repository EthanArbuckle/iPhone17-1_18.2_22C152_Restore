@interface ClassicAppletInstance
+ (id)fetchRequest;
@end

@implementation ClassicAppletInstance

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ClassicAppletInstance"];
}

@end
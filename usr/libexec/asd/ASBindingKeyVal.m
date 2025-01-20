@interface ASBindingKeyVal
+ (id)fetchRequest;
@end

@implementation ASBindingKeyVal

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_R100605578"];
}

@end
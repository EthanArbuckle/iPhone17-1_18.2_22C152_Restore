@interface DBKey
+ (id)fetchRequest;
@end

@implementation DBKey

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DBKey"];
}

@end
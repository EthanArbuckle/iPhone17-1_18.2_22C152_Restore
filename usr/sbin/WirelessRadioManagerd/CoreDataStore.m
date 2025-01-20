@interface CoreDataStore
+ (id)fetchRequest;
@end

@implementation CoreDataStore

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CoreDataStore"];
}

@end
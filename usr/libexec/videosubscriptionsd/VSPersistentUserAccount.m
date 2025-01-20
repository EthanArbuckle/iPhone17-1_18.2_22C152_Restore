@interface VSPersistentUserAccount
+ (id)fetchRequest;
@end

@implementation VSPersistentUserAccount

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"VSPersistentUserAccount"];
}

@end
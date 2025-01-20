@interface TSEvent
+ (id)fetchRequest;
@end

@implementation TSEvent

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"TSEvent"];
}

@end
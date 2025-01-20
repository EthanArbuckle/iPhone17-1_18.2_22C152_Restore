@interface KTFailureEvent
+ (id)fetchRequest;
@end

@implementation KTFailureEvent

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTFailureEvent"];
}

@end
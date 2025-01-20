@interface Invitation
+ (id)fetchRequest;
@end

@implementation Invitation

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"Invitation"];
}

@end
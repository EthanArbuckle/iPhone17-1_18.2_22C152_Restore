@interface OutOfServiceArea
+ (id)fetchRequest;
@end

@implementation OutOfServiceArea

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"OutOfServiceArea"];
}

@end
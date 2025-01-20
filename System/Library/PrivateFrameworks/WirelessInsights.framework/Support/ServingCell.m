@interface ServingCell
+ (id)fetchRequest;
@end

@implementation ServingCell

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ServingCell"];
}

@end
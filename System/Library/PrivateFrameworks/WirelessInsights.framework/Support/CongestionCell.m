@interface CongestionCell
+ (id)fetchRequest;
@end

@implementation CongestionCell

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CongestionCell"];
}

@end
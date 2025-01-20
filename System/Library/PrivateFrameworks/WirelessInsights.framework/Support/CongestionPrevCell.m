@interface CongestionPrevCell
+ (id)fetchRequest;
@end

@implementation CongestionPrevCell

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CongestionPrevCell"];
}

@end
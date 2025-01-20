@interface CongestionArea
+ (id)fetchRequest;
@end

@implementation CongestionArea

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CongestionArea"];
}

@end
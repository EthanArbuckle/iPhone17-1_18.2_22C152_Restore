@interface CongestionOccurrence
+ (id)fetchRequest;
@end

@implementation CongestionOccurrence

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CongestionOccurrence"];
}

@end
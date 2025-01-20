@interface TSPrediction
+ (id)fetchRequest;
@end

@implementation TSPrediction

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"TSPrediction"];
}

@end
@interface GameSummary
+ (id)fetchRequest;
@end

@implementation GameSummary

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GameSummary"];
}

@end
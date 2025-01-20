@interface GamesPlayedSummaryList
+ (id)fetchRequest;
@end

@implementation GamesPlayedSummaryList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GamesPlayedSummaryList"];
}

@end
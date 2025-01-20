@interface RankingInfo
+ (id)fetchRequest;
@end

@implementation RankingInfo

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RankingInfo"];
}

@end
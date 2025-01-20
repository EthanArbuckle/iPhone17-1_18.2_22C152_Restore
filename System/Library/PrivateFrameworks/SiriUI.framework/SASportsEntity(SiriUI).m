@interface SASportsEntity(SiriUI)
- (uint64_t)siriui_containsAthletes;
- (uint64_t)siriui_containsTeams;
@end

@implementation SASportsEntity(SiriUI)

- (uint64_t)siriui_containsTeams
{
  return 0;
}

- (uint64_t)siriui_containsAthletes
{
  return 0;
}

@end
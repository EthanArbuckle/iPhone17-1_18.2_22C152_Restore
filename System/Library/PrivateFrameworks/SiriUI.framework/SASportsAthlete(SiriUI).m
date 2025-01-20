@interface SASportsAthlete(SiriUI)
- (uint64_t)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:;
@end

@implementation SASportsAthlete(SiriUI)

- (uint64_t)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:
{
  if (a5) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a5, result);
  }
  return result;
}

@end
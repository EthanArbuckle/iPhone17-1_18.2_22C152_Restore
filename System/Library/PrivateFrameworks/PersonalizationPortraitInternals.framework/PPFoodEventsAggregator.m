@interface PPFoodEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (id)tripCandidatesFromEventsPool;
@end

@implementation PPFoodEventsAggregator

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfFoodEvent:", a4);
}

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 2);
}

@end
@interface PPBusEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (id)tripCandidatesFromEventsPool;
@end

@implementation PPBusEventsAggregator

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfBusEvent:", a4);
}

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 4);
}

@end
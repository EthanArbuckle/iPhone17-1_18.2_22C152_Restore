@interface PPCarRentalPickupEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (id)tripCandidatesFromEventsPool;
@end

@implementation PPCarRentalPickupEventsAggregator

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfCarRentalPickupEvent:", a4);
}

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 6);
}

@end
@interface PPCarRentalDropoffEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (id)tripCandidatesFromEventsPool;
@end

@implementation PPCarRentalDropoffEventsAggregator

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfCarRentalDropoffEvent:", a4);
}

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 7);
}

@end
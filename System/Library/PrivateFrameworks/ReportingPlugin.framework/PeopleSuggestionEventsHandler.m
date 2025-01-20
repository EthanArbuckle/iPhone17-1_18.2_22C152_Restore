@interface PeopleSuggestionEventsHandler
- (id)correlateWithCurrentEvent:(id)a3;
- (void)receiveCurrentEvent:(id)a3;
- (void)receivePriorEvent:(id)a3;
@end

@implementation PeopleSuggestionEventsHandler

- (void)receivePriorEvent:(id)a3
{
}

- (void)receiveCurrentEvent:(id)a3
{
}

- (id)correlateWithCurrentEvent:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = [(BPSCorrelateHandler *)v4 context];
  id v6 = sub_25B3CE264();
  swift_unknownObjectRelease();

  swift_release();

  return v6;
}

@end
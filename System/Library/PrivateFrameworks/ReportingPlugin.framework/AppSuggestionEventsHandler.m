@interface AppSuggestionEventsHandler
- (id)correlateWithCurrentEvent:(id)a3;
- (void)receiveCurrentEvent:(id)a3;
- (void)receivePriorEvent:(id)a3;
@end

@implementation AppSuggestionEventsHandler

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
  id v6 = sub_25B3CDFE8();
  swift_unknownObjectRelease();

  swift_release();

  return v6;
}

@end
@interface MRDTimingEvents
- (MRDTimingEvent)condensedEvent;
- (NSArray)orderedEvents;
- (NSError)firstError;
- (NSNumber)totalDuration;
- (_TtC12mediaremoted15MRDTimingEvents)init;
@end

@implementation MRDTimingEvents

- (NSArray)orderedEvents
{
  result = (NSArray *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSNumber)totalDuration
{
  v2 = self;
  sub_100250D88();
  v3.super.super.isa = Double._bridgeToObjectiveC()().super.super.isa;

  return (NSNumber *)v3.super.super.isa;
}

- (NSError)firstError
{
  v2 = self;
  uint64_t v3 = sub_1002519E8();

  if (v3)
  {
    v4 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSError *)v4;
}

- (MRDTimingEvent)condensedEvent
{
  v2 = self;
  uint64_t v3 = (void *)sub_100251D28();

  return (MRDTimingEvent *)v3;
}

- (_TtC12mediaremoted15MRDTimingEvents)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MRDTimingEvents();
  return [(MRDTimingEvents *)&v3 init];
}

@end
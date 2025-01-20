@interface MRDTimingEvent
- (BOOL)end;
- (BOOL)endWithError:(id)a3;
- (BOOL)start;
- (MRDTimingEvent)init;
- (NSError)error;
- (NSNumber)duration;
- (void)setError:(id)a3;
@end

@implementation MRDTimingEvent

- (NSError)error
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MRDTimingEvent_error);
  swift_beginAccess();
  if (*v2)
  {
    swift_errorRetain();
    v3 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSError *)v3;
}

- (void)setError:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDTimingEvent_error);
  swift_beginAccess();
  id *v4 = a3;
  id v5 = a3;
  swift_errorRelease();
}

- (NSNumber)duration
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB0);
  v3 = self;
  v2();
  if (v4) {
    v5.super.super.isa = 0;
  }
  else {
    v5.super.super.isa = Double._bridgeToObjectiveC()().super.super.isa;
  }

  return (NSNumber *)v5.super.super.isa;
}

- (BOOL)start
{
  v2 = self;
  BOOL v3 = sub_100250538();

  return v3;
}

- (BOOL)endWithError:(id)a3
{
  char v4 = self;
  id v5 = a3;
  LOBYTE(a3) = sub_100250720(a3);

  return a3 & 1;
}

- (BOOL)end
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xC8);
  BOOL v3 = self;
  LOBYTE(v2) = v2(0);

  return v2 & 1;
}

- (MRDTimingEvent)init
{
  BOOL v3 = (char *)self + OBJC_IVAR___MRDTimingEvent_startDate;
  uint64_t v4 = type metadata accessor for Date();
  id v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((char *)self + OBJC_IVAR___MRDTimingEvent_endDate, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDTimingEvent_error) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TimingEvent();
  return [(MRDTimingEvent *)&v7 init];
}

- (void).cxx_destruct
{
  sub_100009A08((uint64_t)self + OBJC_IVAR___MRDTimingEvent_startDate, &qword_100479F98);
  sub_100009A08((uint64_t)self + OBJC_IVAR___MRDTimingEvent_endDate, &qword_100479F98);

  swift_errorRelease();
}

@end
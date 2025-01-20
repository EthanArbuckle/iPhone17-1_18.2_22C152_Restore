@interface HolidaysDBPollingOperation
- (BOOL)isReady;
- (_TtC13SiriInference26HolidaysDBPollingOperation)init;
- (void)main;
@end

@implementation HolidaysDBPollingOperation

- (BOOL)isReady
{
  v2 = self;
  BOOL v3 = HolidaysDBPollingOperation.isReady.getter();

  return v3;
}

- (void)main
{
  v2 = self;
  HolidaysDBPollingOperation.main()();
}

- (_TtC13SiriInference26HolidaysDBPollingOperation)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SiriInference26HolidaysDBPollingOperation_runDate;
  sub_1C68E9B78();
  OUTLINED_FUNCTION_1_0();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end
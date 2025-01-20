@interface ScrubOldRecords
- (_TtC13SiriInference15ScrubOldRecords)init;
- (void)main;
@end

@implementation ScrubOldRecords

- (_TtC13SiriInference15ScrubOldRecords)init
{
  return (_TtC13SiriInference15ScrubOldRecords *)ScrubOldRecords.init()();
}

- (void)main
{
  v2 = self;
  sub_1C68278A8();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SiriInference15ScrubOldRecords_cutoffDate;
  sub_1C68E9B78();
  OUTLINED_FUNCTION_1_0();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end
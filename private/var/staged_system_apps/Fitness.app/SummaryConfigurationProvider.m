@interface SummaryConfigurationProvider
- (_TtC10FitnessApp28SummaryConfigurationProvider)init;
@end

@implementation SummaryConfigurationProvider

- (_TtC10FitnessApp28SummaryConfigurationProvider)init
{
  return (_TtC10FitnessApp28SummaryConfigurationProvider *)sub_10001AA48();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp28SummaryConfigurationProvider__currentCardConfiguration;
  uint64_t v3 = sub_1000AFA94(&qword_10094C530);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end
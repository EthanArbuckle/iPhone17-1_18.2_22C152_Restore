@interface SummaryUserProfileProvider
- (_TtC10FitnessApp26SummaryUserProfileProvider)init;
- (void)dealloc;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation SummaryUserProfileProvider

- (void)dealloc
{
  v2 = self;
  sub_1001FB25C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_activityDataProvider));
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_seymourAvailabilityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_trendsAvailabilityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_wheelchairCache));
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC10FitnessApp26SummaryUserProfileProvider)init
{
  result = (_TtC10FitnessApp26SummaryUserProfileProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1001FB844();
}

@end
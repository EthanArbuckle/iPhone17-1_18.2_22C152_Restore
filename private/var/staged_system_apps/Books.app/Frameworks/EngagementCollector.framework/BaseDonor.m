@interface BaseDonor
- (BOOL)isObservedBy:(id)a3;
- (NSArray)eventConfigurations;
- (NSString)type;
- (_TtC19EngagementCollector9BaseDonor)init;
- (_TtC19EngagementCollector9BaseDonor)initWithType:(id)a3;
- (void)addDonorObserver:(id)a3;
- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5;
- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4;
- (void)removeDonorObserver:(id)a3;
- (void)setEventConfigurations:(id)a3;
- (void)setType:(id)a3;
@end

@implementation BaseDonor

- (NSString)type
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_380A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setType:(id)a3
{
  uint64_t v4 = sub_380C0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)eventConfigurations
{
  swift_beginAccess();
  type metadata accessor for BasePropertyConfiguration();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setEventConfigurations:(id)a3
{
  type metadata accessor for BasePropertyConfiguration();
  uint64_t v4 = sub_38170();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC19EngagementCollector9BaseDonor)initWithType:(id)a3
{
  uint64_t v3 = sub_380C0();
  return (_TtC19EngagementCollector9BaseDonor *)BaseDonor.init(type:)(v3, v4);
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  v7 = _Block_copy(a5);
  id v8 = a3;
  v9 = self;
  _Block_release(v7);
  sub_38570();
  __break(1u);
}

- (void)propertyDidChange:(id)a3 propertyConfiguration:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  sub_2A0EC((uint64_t)a3, v7);

  swift_unknownObjectRelease();
}

- (_TtC19EngagementCollector9BaseDonor)init
{
  result = (_TtC19EngagementCollector9BaseDonor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
}

- (void)addDonorObserver:(id)a3
{
}

- (void)removeDonorObserver:(id)a3
{
}

- (BOOL)isObservedBy:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = BaseDonor.isObserved(by:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

@end
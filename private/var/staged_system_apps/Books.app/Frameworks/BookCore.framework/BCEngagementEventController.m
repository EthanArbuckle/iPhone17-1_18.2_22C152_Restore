@interface BCEngagementEventController
- (BCEngagementEventController)init;
- (BCEngagementEventDataProvider)dataProvider;
- (void)setDataProvider:(id)a3;
- (void)submitEvent:(id)a3 :(id)a4;
@end

@implementation BCEngagementEventController

- (BCEngagementEventDataProvider)dataProvider
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (BCEngagementEventDataProvider *)v2;
}

- (void)setDataProvider:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BCEngagementEventController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCEngagementEventController_dataProvider) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EngagementEventController();
  return [(BCEngagementEventController *)&v3 init];
}

- (void)submitEvent:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1F2190();
  unint64_t v8 = v7;
  if (a4) {
    a4 = (id)sub_1F20F0();
  }
  v9 = self;
  sub_1C8BE8(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end
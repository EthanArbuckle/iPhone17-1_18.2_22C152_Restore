@interface WidgetPersonalizationService
- (_TtC10NewsToday228WidgetPersonalizationService)init;
- (double)decayedPublisherDiversificationPenalty;
- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5;
- (id)limitItemsByMinimumItemQuality:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5;
- (void)prepareForUseWithCompletionHandler:(id)a3;
@end

@implementation WidgetPersonalizationService

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  sub_10001B38C(&qword_1001379F0);
  unint64_t v6 = sub_1000EA470();
  v7 = self;
  id v8 = sub_10004BE50(v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  sub_10001B38C(&qword_1001379F0);
  sub_1000EA470();
  v4 = self;
  sub_1000E9170();

  swift_bridgeObjectRelease();
  v5.super.isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  sub_10001B38C(&qword_1001379F0);
  sub_1000EA470();
  unint64_t v6 = self;
  sub_1000E9160();

  swift_bridgeObjectRelease();
  v7.super.isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  NSArray v5 = self;
  sub_1000E9180();

  swift_release();
}

- (double)decayedPublisherDiversificationPenalty
{
  v2 = self;
  double v3 = sub_1000E91B0();

  return v3;
}

- (id)rankTagIDsDescending:(id)a3
{
  if (a3) {
    v4 = (void *)sub_1000EA470();
  }
  else {
    v4 = 0;
  }
  NSArray v5 = self;
  v10.value._rawValue = v4;
  unint64_t v6 = sub_1000E91A0(v10);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = sub_1000EA460().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (id)scoresForTagIDs:(id)a3
{
  if (a3) {
    v4 = (void *)sub_1000EA470();
  }
  else {
    v4 = 0;
  }
  NSArray v5 = self;
  v10.value._rawValue = v4;
  unint64_t v6 = sub_1000E91C0(v10);

  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_100022374(0, &qword_10013A3A0);
    v7.super.isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (_TtC10NewsToday228WidgetPersonalizationService)init
{
  result = (_TtC10NewsToday228WidgetPersonalizationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10NewsToday228WidgetPersonalizationService_scoringService));
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10NewsToday228WidgetPersonalizationService_cacheAccessQueue);
}

@end
@interface TodayBannerEventTracker
- (_TtC10NewsToday223TodayBannerEventTracker)init;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
@end

@implementation TodayBannerEventTracker

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8C30();
  swift_unknownObjectRetain();
  v10 = self;
  sub_100050088((int)v10, a4);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  uint64_t v8 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E8C50();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8C30();
  if (a4)
  {
    sub_1000E8B20();
    uint64_t v15 = sub_1000E8B60();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1000E8B60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  }
  swift_unknownObjectRetain();
  v17 = self;
  sub_1000505B4((uint64_t)v17, (uint64_t)v10, a5);
  swift_unknownObjectRelease();

  sub_100028B6C((uint64_t)v10, (uint64_t *)&unk_1001370F0);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  uint64_t v4 = sub_1000E8C50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8C30();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  uint64_t v5 = sub_1000E8C50();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8C30();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  uint64_t v5 = sub_10001B38C(&qword_100138580);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1000EA590();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100138590;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001385A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100051818((uint64_t)v7, (uint64_t)&unk_1001385B0, (uint64_t)v12);
  swift_release();
}

- (_TtC10NewsToday223TodayBannerEventTracker)init
{
  result = (_TtC10NewsToday223TodayBannerEventTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
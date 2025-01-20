@interface TrendsDataProvider
- (_TtC10FitnessApp18TrendsDataProvider)init;
- (void)didReceiveNotificationWithNote:(id)a3;
- (void)wheelchairUseChangedWithNote:(id)a3;
@end

@implementation TrendsDataProvider

- (void)didReceiveNotificationWithNote:(id)a3
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Calendar();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000AFA94(&qword_100955F38);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    uint64_t v21 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v15, 1, 1, v21);
    v22 = self;
LABEL_7:
    sub_10003102C();
    goto LABEL_8;
  }
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = type metadata accessor for Notification();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  uint64_t v17 = qword_10094A5F8;
  v18 = self;
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1000876DC(v9, (uint64_t)qword_100997640);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v19, v9);
  v20 = (char *)v18 + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_lastCalculatedDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v20, v5);
  LOBYTE(v20) = Calendar.isDateInToday(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((v20 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:

  sub_10008DB18((uint64_t)v15, &qword_100955F38);
}

- (void)wheelchairUseChangedWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002E0BE8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC10FitnessApp18TrendsDataProvider)init
{
  result = (_TtC10FitnessApp18TrendsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  sub_1000D8EAC((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsCompilation365, (uint64_t)v5);
  sub_1000D829C(v5);
  sub_1000D8EAC((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_statisticsCompilation90, (uint64_t)v6);
  sub_1000D829C(v6);
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp18TrendsDataProvider_lastCalculatedDate;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
}

@end
@interface InsightsCalendarView.Representation.Coordinator
- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4;
- (_TtCVV7Journal20InsightsCalendarViewP33_DB82E41FEC15FAA6F37A37FAA16D9E2114Representation11Coordinator)init;
- (id)calendarView:(id)a3 decorationForDateComponents:(id)a4;
- (void)dateSelection:(id)a3 didSelectDate:(id)a4;
@end

@implementation InsightsCalendarView.Representation.Coordinator

- (id)calendarView:(id)a3 decorationForDateComponents:(id)a4
{
  uint64_t v6 = type metadata accessor for DateComponents();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_10012BCFC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)dateSelection:(id)a3 didSelectDate:(id)a4
{
  uint64_t v7 = sub_100010218((uint64_t *)&unk_1007FF070);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for DateComponents();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for DateComponents();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_10012C030((uint64_t)v9);

  sub_10001457C((uint64_t)v9, (uint64_t *)&unk_1007FF070);
}

- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4
{
  uint64_t v7 = type metadata accessor for Calendar();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for InsightsCalendarView.Representation(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100010218((uint64_t *)&unk_1007FF070);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for DateComponents();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for DateComponents();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  v19 = (char *)self
      + OBJC_IVAR____TtCVV7Journal20InsightsCalendarViewP33_DB82E41FEC15FAA6F37A37FAA16D9E2114Representation11Coordinator_parent;
  swift_beginAccess();
  sub_10012B95C((uint64_t)v19, (uint64_t)v13, type metadata accessor for InsightsCalendarView.Representation);
  id v20 = a3;
  v21 = self;
  sub_100666410((uint64_t)v10);
  sub_10012B9C4((uint64_t)v13, type metadata accessor for InsightsCalendarView.Representation);
  BOOL v22 = sub_100638BFC((uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  sub_10001457C((uint64_t)v16, (uint64_t *)&unk_1007FF070);
  return !v22;
}

- (_TtCVV7Journal20InsightsCalendarViewP33_DB82E41FEC15FAA6F37A37FAA16D9E2114Representation11Coordinator)init
{
  result = (_TtCVV7Journal20InsightsCalendarViewP33_DB82E41FEC15FAA6F37A37FAA16D9E2114Representation11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface TrackableWidgetState
- (NSDate)fetchDate;
- (NSString)contentID;
- (NSString)entryID;
- (id)extentsOfSections:(id)a3;
- (id)fetchInfoForVisibleResults;
- (id)sectionForItem:(id)a3;
- (id)todayResults;
- (id)visibleItems;
- (id)visibleItemsOfType:(unint64_t)a3;
- (id)visibleSections;
- (uint64_t)absoluteItemCountForCurrentDisplayMode;
- (unint64_t)absoluteOrderOfItem:(id)a3;
- (unint64_t)absoluteOrderOfItemInSection:(id)a3;
- (unint64_t)absoluteOrderOfSection:(id)a3;
- (unint64_t)activeDisplayMode;
- (unint64_t)appearanceType;
- (unint64_t)stackKind;
- (unint64_t)stackLocation;
@end

@implementation TrackableWidgetState

- (NSString)entryID
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1000EA280();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)contentID
{
  if (*(void *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID + 8])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (unint64_t)appearanceType
{
  return *(void *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_appearanceType];
}

- (unint64_t)stackKind
{
  return *(void *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackKind];
}

- (unint64_t)stackLocation
{
  return *(void *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackLocation];
}

- (unint64_t)absoluteOrderOfItem:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  v4 = NTTodayResults.allItems.getter();
  swift_unknownObjectRetain();
  unint64_t v5 = sub_1000BF9F0((unint64_t)v4, (uint64_t)a3);
  char v7 = v6;
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v7) {
    goto LABEL_4;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    sub_1000EA950();
    __break(1u);
LABEL_4:
    unint64_t v5 = -1;
  }
  swift_unknownObjectRelease();
  swift_release();
  return v5;
}

- (unint64_t)absoluteOrderOfItemInSection:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  unint64_t v4 = sub_1000B658C(a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

- (unint64_t)absoluteOrderOfSection:(id)a3
{
  id v3 = a3;
  swift_retain();
  unint64_t v4 = sub_1000B6868(v3);

  swift_release();
  return v4;
}

- (id)visibleSections
{
  swift_retain();
  sub_1000B69E0();
  swift_release();
  sub_100022374(0, (unint64_t *)&qword_1001371D0);
  v2.super.isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (id)sectionForItem:(id)a3
{
  unint64_t v4 = *(void **)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results];
  swift_unknownObjectRetain();
  swift_retain();
  id v5 = [v4 sections];
  id v6 = [v5 array];

  uint64_t v7 = sub_1000EA470();
  v8 = sub_100084B00(v7);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  v9 = sub_1000BF86C((unint64_t)v8, (uint64_t)a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();

  return v9;
}

- (id)visibleItems
{
  swift_retain();
  sub_1000B5D18();
  swift_release();
  sub_10001B38C(&qword_100137270);
  v2.super.isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (id)visibleItemsOfType:(unint64_t)a3
{
  swift_retain();
  sub_1000BB234((id)a3);
  swift_release();
  sub_10001B38C(&qword_100137270);
  v4.super.isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)extentsOfSections:(id)a3
{
  sub_100022374(0, (unint64_t *)&qword_1001371D0);
  sub_1000EA470();
  swift_retain();
  sub_1000B6CB4();
  sub_100022374(0, &qword_10013A3A0);
  sub_1000BF3CC();
  sub_1000EA4A0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3.super.isa = sub_1000EA1B0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)fetchInfoForVisibleResults
{
  return *(id *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_fetchInfo];
}

- (uint64_t)absoluteItemCountForCurrentDisplayMode
{
  swift_retain();
  unint64_t v0 = (unint64_t)NTTodayResults.allItems.getter();
  if (!(v0 >> 62))
  {
    uint64_t v1 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
LABEL_3:
    swift_release();
    return v1;
  }
  uint64_t v1 = sub_1000EA980();
  swift_bridgeObjectRelease();
  if ((v1 & 0x8000000000000000) == 0) {
    goto LABEL_3;
  }
  uint64_t result = sub_1000EA950();
  __break(1u);
  return result;
}

- (id)todayResults
{
  return *(id *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results];
}

- (unint64_t)activeDisplayMode
{
  uint64_t v3 = sub_1000E9F60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_layoutContext];
  uint64_t v8 = type metadata accessor for LayoutContext();
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 24)], v3);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v9 == enum case for InternalWidgetFamily.systemSmall(_:)) {
    return 3;
  }
  if (v9 == enum case for InternalWidgetFamily.systemMedium(_:)) {
    return 4;
  }
  if (v9 == enum case for InternalWidgetFamily.systemLarge(_:)) {
    return 5;
  }
  if (v9 == enum case for InternalWidgetFamily.newsLargeTall(_:)) {
    return 6;
  }
  if (v9 == enum case for InternalWidgetFamily.accessoryRectangular(_:)) {
    return 7;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (NSDate)fetchDate
{
  v2.super.isa = sub_1000E8BD0().super.isa;

  return (NSDate *)v2.super.isa;
}

@end
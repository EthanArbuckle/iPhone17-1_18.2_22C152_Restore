@interface MeasureShareActivityItem
- (_TtC7Measure24MeasureShareActivityItem)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation MeasureShareActivityItem

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  sub_1000131D4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare), *(void *)&self->entriesToShare[OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare + 16]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();

  return v4;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  sub_1000131D4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare), *(void *)&self->entriesToShare[OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare + 16]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 mainBundle];
  v12._countAndFlagsBits = 0xD00000000000002DLL;
  v17._object = (void *)0x800000010041EDD0;
  v12._object = (void *)0x800000010041EDA0;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v17._countAndFlagsBits = 0xD00000000000001BLL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v17);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5 = objc_allocWithZone((Class)LPLinkMetadata);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 init];
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 setTitle:v9];

  return v8;
}

- (_TtC7Measure24MeasureShareActivityItem)init
{
  result = (_TtC7Measure24MeasureShareActivityItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
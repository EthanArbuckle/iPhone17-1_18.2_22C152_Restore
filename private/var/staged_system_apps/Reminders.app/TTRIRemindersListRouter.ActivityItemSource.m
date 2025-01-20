@interface TTRIRemindersListRouter.ActivityItemSource
- (_TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource)init;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation TTRIRemindersListRouter.ActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C6740(v8);

  sub_100038D28(v8, v8[3]);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100038CD8((uint64_t)v8);

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000C6958((uint64_t)a4, (uint64_t)v16);

  uint64_t v9 = v17;
  if (v17)
  {
    v10 = sub_100038D28(v16, v17);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    sub_100038CD8((uint64_t)v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000C7DB4();

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  uint64_t v8 = type metadata accessor for TTRIRemindersListRouterShareSheetItem(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C7D50((uint64_t)self+ OBJC_IVAR____TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource_item, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000C7494((uint64_t)v10);
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_10003B754(&qword_10078AB58);
    id v13 = a3;
    id v14 = a4;
    v15 = self;
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void **)&v10[*(int *)(v12 + 64)];
    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v10, v16);
  }

  return v11;
}

- (_TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource)init
{
  result = (_TtCC9Reminders23TTRIRemindersListRouterP33_6FFDCD23D13881F9EFBB4406934282BE18ActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
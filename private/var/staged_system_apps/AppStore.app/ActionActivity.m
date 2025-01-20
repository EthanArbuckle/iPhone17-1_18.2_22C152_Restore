@interface ActionActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC8AppStoreP33_CE8C5E96DC0A3EE47110102615F0D69114ActionActivity)init;
- (id)_systemImageName;
- (void)performActivity;
@end

@implementation ActionActivity

- (NSString)activityType
{
  v2 = self;
  ShareSheetAction.Activity.activityType.getter();
  NSString v3 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  v2 = self;
  ShareSheetAction.Activity.action.getter();
  Action.title.getter();
  swift_release();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  v2 = self;
  id v3 = sub_1005D1EC4();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  v2 = self;
  ShareSheetAction.Activity.action.getter();
  uint64_t v3 = Action.artwork.getter();
  swift_release();
  if (v3)
  {
    if (dispatch thunk of Artwork.isSystemImage.getter())
    {
      dispatch thunk of Artwork.systemImageName.getter();
      uint64_t v5 = v4;
      swift_release();

      if (v5)
      {
        NSString v6 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    else
    {

      swift_release();
    }
  }
  else
  {
  }
  NSString v6 = 0;
LABEL_8:

  return v6;
}

- (void)performActivity
{
  v2 = self;
  sub_1005D2054();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC8AppStoreP33_CE8C5E96DC0A3EE47110102615F0D69114ActionActivity)init
{
  result = (_TtC8AppStoreP33_CE8C5E96DC0A3EE47110102615F0D69114ActionActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8AppStoreP33_CE8C5E96DC0A3EE47110102615F0D69114ActionActivity_activity;
  uint64_t v3 = type metadata accessor for ShareSheetAction.Activity();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
@interface CRLSendACopyActivity_i
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4;
- (NSString)activityTitle;
- (NSString)activityType;
- (SFCollaborationItem)collaborationItem;
- (UIImage)activityImage;
- (UIViewController)activityViewController;
- (_TtC8Freeform22CRLSendACopyActivity_i)init;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCollaborationItem:(id)a3;
@end

@implementation CRLSendACopyActivity_i

- (NSString)activityType
{
  uint64_t v2 = qword_10166EE80;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_10171A4A0;

  return v4;
}

- (NSString)activityTitle
{
  sub_1006FE430();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  NSString v3 = self;
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v3 systemImageNamed:v5];

  return (UIImage *)v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_activityItems) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (UIViewController)activityViewController
{
  uint64_t v2 = self;
  id v3 = sub_1006FDA6C();

  return (UIViewController *)v3;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (SFCollaborationItem)collaborationItem
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();

  return (SFCollaborationItem *)v2;
}

- (void)setCollaborationItem:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_collaborationItem) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  return 0;
}

- (_TtC8Freeform22CRLSendACopyActivity_i)init
{
  result = (_TtC8Freeform22CRLSendACopyActivity_i *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100510028((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_boardIdentifier);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end
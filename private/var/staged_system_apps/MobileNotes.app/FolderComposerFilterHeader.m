@interface FolderComposerFilterHeader
- (_TtC11MobileNotes26FolderComposerFilterHeader)initWithCoder:(id)a3;
- (_TtC11MobileNotes26FolderComposerFilterHeader)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FolderComposerFilterHeader

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIListContentConfiguration();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UICellConfigurationState();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = self;
  static UIListContentConfiguration.prominentInsetGroupedHeader()();
  swift_bridgeObjectRetain();
  UIListContentConfiguration.text.setter();
  v15[3] = v4;
  v15[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  v13 = sub_10015E0F0(v15);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(v13, v7, v4);
  UICollectionViewCell.contentConfiguration.setter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC11MobileNotes26FolderComposerFilterHeader)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterHeader_text);
  *uint64_t v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FolderComposerFilterHeader initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes26FolderComposerFilterHeader)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes26FolderComposerFilterHeader_text);
  *uint64_t v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(FolderComposerFilterHeader *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
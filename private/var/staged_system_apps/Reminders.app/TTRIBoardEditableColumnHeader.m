@interface TTRIBoardEditableColumnHeader
+ (Class)containerViewClass;
- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TTRIBoardEditableColumnHeader

+ (Class)containerViewClass
{
  type metadata accessor for TTRNoAnimationContainerStackView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders29TTRIBoardEditableColumnHeader *)sub_10064DD24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithCoder:(id)a3
{
  return (_TtC9Reminders29TTRIBoardEditableColumnHeader *)sub_10064E184(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10064E308();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10064E4FC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)invalidateIntrinsicContentSize
{
  v2 = self;
  sub_10064E7BC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10064E964();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000499D4((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_delegate]);
  sub_1000499D4((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_dragInteractionHandler]);

  sub_10003B6F8((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_nameModule], (uint64_t *)&unk_1007AD520);
  v3 = *(void **)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader____lazy_storage___reorderControl];
}

@end
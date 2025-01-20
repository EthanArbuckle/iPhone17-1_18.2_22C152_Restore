@interface TTRITemplatesListCell
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSString)accessibilityLabel;
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC9Reminders21TTRITemplatesListCell)initWithCoder:(id)a3;
- (_TtC9Reminders21TTRITemplatesListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setAccessibilityCustomActions:(id)isa;
@end

@implementation TTRITemplatesListCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_10003B754(&qword_1007A03B0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UICellConfigurationState();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.receiver = self;
  v17.super_class = ObjectType;
  v11 = self;
  v12 = [(TTRITemplatesListCell *)&v17 _bridgedConfigurationState];
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v13 = (uint64_t)v11 + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_viewModel;
  swift_beginAccess();
  sub_100307460(v13, (uint64_t)v6);
  sub_100450D44((uint64_t)v6);

  v14.super.super.isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return (UICellConfigurationState *)v14.super.super.isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100450F74((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100452B68();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  unint64_t v3 = sub_100453034();

  if (v3)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRITemplatesListCell *)&v8 setAccessibilityCustomActions:isa];
}

- (_TtC9Reminders21TTRITemplatesListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders21TTRITemplatesListCell *)sub_1004533D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders21TTRITemplatesListCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders21TTRITemplatesListCell *)sub_10045351C(a3);
}

- (void).cxx_destruct
{
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_viewModel, &qword_1007A03B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_badgeContainerView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_separatorConstraint));
  sub_1000499C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_infoButtonMenuProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell____lazy_storage___infoButton));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell____lazy_storage___placeholderImageForBadge);
}

@end
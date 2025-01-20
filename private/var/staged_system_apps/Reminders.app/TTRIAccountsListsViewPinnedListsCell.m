@interface TTRIAccountsListsViewPinnedListsCell
+ (Class)containerViewClass;
+ (Class)layerClass;
- (NSArray)preferredFocusEnvironments;
- (UIColor)separatorColor;
- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithCoder:(id)a3;
- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutMarginsDidChange;
- (void)prepareForReuse;
@end

@implementation TTRIAccountsListsViewPinnedListsCell

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIAccountsListsViewPinnedListsCell *)&v3 layoutMarginsDidChange];
  sub_10001BBF0();
}

- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *)sub_10000CA8C(a3, (uint64_t)a4, v6);
}

+ (Class)layerClass
{
  type metadata accessor for CellLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)containerViewClass
{
  type metadata accessor for TTRIPinnedListsView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_dynamicDateGlyphCache] = 0;
  id v5 = a3;

  result = (_TtC9Reminders36TTRIAccountsListsViewPinnedListsCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(TTRIAccountsListsViewPinnedListsCell *)&v2 prepareForReuse];
}

- (UIColor)separatorColor
{
  id v2 = [self clearColor];

  return (UIColor *)v2;
}

- (NSArray)preferredFocusEnvironments
{
  id v2 = self;
  sub_1002F5894();

  sub_10003B754((uint64_t *)&unk_10079A080);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIAccountsListsViewPinnedListsCell_delegate]);

  swift_release();
}

@end
@interface TTRIAccountListsViewGroupCell
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)treeCellViewToggleExpandState;
@end

@implementation TTRIAccountListsViewGroupCell

- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders29TTRIAccountListsViewGroupCell *)sub_1000B42BC(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders29TTRIAccountListsViewGroupCell)initWithCoder:(id)a3
{
  v4 = &self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_ttriAccessibilityGroupListCount];
  *(void *)v4 = 0;
  v4[8] = 1;
  *(void *)&self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_groupObjectID] = 0;
  *(void *)&self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_collapseTapGestureRecognizer] = 0;
  id v5 = a3;

  result = (_TtC9Reminders29TTRIAccountListsViewGroupCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  uint64_t v6 = (char *)v8.receiver;
  [(TTRIAccountsListsBaseCell *)&v8 setEditing:v5 animated:v4];
  v7 = *(void **)&v6[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_collapseTapGestureRecognizer];
  if (v7) {
    [v7 setEnabled:v5 ^ 1];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_1000B4768(a3, a4);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1000B4D00(self, (uint64_t)a2, (void (*)(void))sub_1000B4A2C);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1000B4D00(self, (uint64_t)a2, (void (*)(void))sub_1000B4C14);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1000B4D00(self, (uint64_t)a2, (void (*)(void))sub_1000B4D80);
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  v3 = sub_1000B4F00();

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

- (void)treeCellViewToggleExpandState
{
  uint64_t ObjectType = swift_getObjectType();
  NSArray v4 = &self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewDelegate];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t v6 = swift_getObjectType();
    v9[3] = ObjectType;
    v9[4] = &off_10074F378;
    v9[0] = self;
    v7 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 8);
    objc_super v8 = self;
    v7(v9, v6, v5);
    swift_unknownObjectRelease();
    sub_100038CD8((uint64_t)v9);
  }
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountListsViewGroupCell_collapseTapGestureRecognizer];
}

@end
@interface TTRIAccountsListsSectionHeaderView
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityHint;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithCoder:(id)a3;
- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (void)handleLongPressGesture:(id)a3;
- (void)migrateButtonAction:(id)a3;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)toggleExpandState;
@end

@implementation TTRIAccountsListsSectionHeaderView

- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC9Reminders34TTRIAccountsListsSectionHeaderView *)sub_10001EC20(v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_outerStackView) effectiveLayoutSizeFittingSize:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9Reminders34TTRIAccountsListsSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FF2E4();
}

- (void)toggleExpandState
{
  id v3 = (char *)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewDelegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8[3] = type metadata accessor for TTRIAccountsListsSectionHeaderView();
    v8[4] = &off_100743140;
    v8[0] = self;
    v6 = *(void (**)(void *, uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(v8, ObjectType, v4);
    swift_unknownObjectRelease();
    sub_100038CD8((uint64_t)v8);
  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002FDD00(v4);
}

- (void)migrateButtonAction:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1002FE0D8((uint64_t)v5);

  sub_100038CD8((uint64_t)v5);
}

- (NSString)accessibilityIdentifier
{
  if (*(void *)&self->identifier[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_identifier]) {
    goto LABEL_4;
  }
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_4:
    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }

  NSString v6 = 0;
LABEL_5:

  return (NSString *)v6;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_hasDisclosureControl);
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    sub_10003B754((uint64_t *)&unk_100791C60);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_10066C6F0;
    *(void *)(v9 + 32) = v6;
    *(void *)(v9 + 40) = v8;
  }

  v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v10.super.isa;
}

- (NSString)accessibilityValue
{
  v2 = self;
  sub_1002FEB68();
  TTRAccesibility.General.Label.Separator.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  sub_10003B754(&qword_10078E670);
  sub_1000B542C();
  BidirectionalCollection<>.joined(separator:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSString)accessibilityHint
{
  v2 = self;
  sub_1002FE5A8();
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

- (void)setAccessibilityHint:(id)a3
{
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = sub_1002FE74C();

  return v3 & 1;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_1002FE8DC();

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

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIAccountsListsSectionHeaderView();
  [(TTRIAccountsListsSectionHeaderView *)&v7 setAccessibilityCustomActions:isa];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_accountID));
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewModel, (uint64_t *)&unk_1007A3EE0);
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_treeCellViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_outerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_innerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_migrateButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_migratingSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsSectionHeaderView_disclosureView));

  swift_bridgeObjectRelease();
}

@end
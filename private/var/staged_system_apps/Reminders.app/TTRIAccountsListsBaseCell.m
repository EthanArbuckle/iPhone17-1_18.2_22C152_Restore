@interface TTRIAccountsListsBaseCell
+ (Class)containerViewClass;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)ttriAccessibilityIsSpeakThisElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithCoder:(id)a3;
- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation TTRIAccountsListsBaseCell

+ (Class)containerViewClass
{
  sub_1000368FC(0, &qword_1007A3F10);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = self;
  UITableViewCell.setSeparatorInsetType(_:)();
}

- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders25TTRIAccountsListsBaseCell *)sub_1000360D0(a3, (uint64_t)a4, v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  id v6 = v9.receiver;
  [(TTRIAccountsListsBaseCell *)&v9 setEditing:v5 animated:v4];
  if ((*((unsigned char *)v6 + OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_unitTest_forceLargeTextLayout) & 1) != 0
    || (id v7 = objc_msgSend(v6, "traitCollection", v9.receiver, v9.super_class),
        id v8 = [v7 preferredContentSizeCategory],
        v7,
        LOBYTE(v7) = UIContentSizeCategory.isAccessibilityCategory.getter(),
        v8,
        (v7 & 1) != 0))
  {
    [v6 layoutIfNeeded];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] == 1)
  {
    self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] = 0;
    id v6 = self;
    sub_1000375E4();
  }
  else
  {
    id v7 = self;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  -[TTRIAccountsListsBaseCell sizeThatFits:](&v14, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  v2 = v3.receiver;
  [(TTRIAccountsListsBaseCell *)&v3 layoutSubviews];
  if (v2[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] == 1)
  {
    v2[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_needsUpdateGridSubviewRows] = 0;
    sub_1000375E4();
  }
}

- (_TtC9Reminders25TTRIAccountsListsBaseCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10051F41C();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_10051E874((uint64_t)v6, (uint64_t)v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  id v2 = v10.receiver;
  unint64_t v3 = [(TTRIAccountsListsBaseCell *)&v10 accessibilityTraits];
  unsigned int v4 = [v2 isSelected];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;

  unint64_t v6 = v3 & ~v5;
  if ((v5 & v3) == 0) {
    unint64_t v6 = v3;
  }
  if ((v5 & v3) == v5) {
    UIAccessibilityTraits v7 = 0;
  }
  else {
    UIAccessibilityTraits v7 = v5;
  }
  unint64_t v8 = v7 | v3;
  if (v4) {
    return v8;
  }
  else {
    return v6;
  }
}

- (NSString)accessibilityLabel
{
  id v2 = self;
  sub_10051EAEC();
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

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
  [(TTRIAccountsListsBaseCell *)&v7 setAccessibilityLabel:v5];
}

- (NSArray)accessibilityUserInputLabels
{
  id v2 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_titleLabel];
  uint64_t v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    NSString v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    double v9 = (uint64_t *)TTRAccesibility.General.Label.Untitled.unsafeMutableAddressor();
    uint64_t v6 = *v9;
    uint64_t v8 = v9[1];
    swift_bridgeObjectRetain();
  }
  sub_10003B754((uint64_t *)&unk_100791C60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10066C6F0;
  *(void *)(v10 + 32) = v6;
  *(void *)(v10 + 40) = v8;

  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v11.super.isa;
}

- (BOOL)accessibilityActivate
{
  id v2 = self;
  if ([(TTRIAccountsListsBaseCell *)v2 isEditing])
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1000864FC(v2);

      swift_unknownObjectRelease();
    }
    else
    {
    }
    return 1;
  }
  else
  {
    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for TTRIAccountsListsBaseCell();
    BOOL v3 = [(TTRIAccountsListsBaseCell *)&v5 accessibilityActivate];
  }
  return v3;
}

- (BOOL)ttriAccessibilityIsSpeakThisElement
{
  return [(TTRIAccountsListsBaseCell *)self isHidden] ^ 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000383A0((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewModel]);
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_treeCellViewDelegate]);
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell_delegate]);

  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders25TTRIAccountsListsBaseCell____lazy_storage___fillerView];
}

@end
@interface TTRIRemindersListEditableSectionCell
+ (Class)containerViewClass;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithCoder:(id)a3;
- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)containerViewDidLoad;
- (void)prepareForReuse;
- (void)setAccessibilityCustomActions:(id)isa;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidden:(BOOL)a3;
@end

@implementation TTRIRemindersListEditableSectionCell

+ (Class)containerViewClass
{
  sub_1000368FC(0, &qword_1007A10D8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TTRIRemindersListEditableSectionCell *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = [(TTRIRemindersListEditableSectionCell *)&v10 isHidden];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(TTRIRemindersListEditableSectionCell *)&v9 setHidden:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(TTRIRemindersListEditableSectionCell *)&v8 isHidden]) {
    [(TTRIRemindersListEditableSectionCell *)v6 setNeedsLayout];
  }
}

- (void)containerViewDidLoad
{
  v2 = self;
  sub_1004C9D24();
}

- (void)prepareForReuse
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_10003B754((uint64_t *)&unk_10079CA20);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  unsigned int v7 = self;
  [(TTRIRemindersListEditableSectionCell *)&v9 prepareForReuse];
  uint64_t v8 = type metadata accessor for TTRRemindersListEditableSectionNameViewModel();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_1004C9128((uint64_t)v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = self;
  unsigned int v9 = [(TTRIRemindersListEditableSectionCell *)v8 isEditing];
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(TTRIRemindersListEditableSectionCell *)&v10 setEditing:v5 animated:v4];
  if (v9 != v5) {
    sub_1004C9380();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v15.receiver = self;
  v15.super_class = ObjectType;
  unsigned int v7 = self;
  -[TTRIRemindersListEditableSectionCell sizeThatFits:](&v15, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  v14.receiver = v7;
  v14.super_class = ObjectType;
  LODWORD(ObjectType) = [(TTRIRemindersListEditableSectionCell *)&v14 isHidden];

  if (ObjectType) {
    double v12 = 1.0;
  }
  else {
    double v12 = v11;
  }
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders36TTRIRemindersListEditableSectionCell *)sub_1004CB3C4(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders36TTRIRemindersListEditableSectionCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders36TTRIRemindersListEditableSectionCell *)sub_1004CB5CC(a3);
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_delegate]);
  sub_10003B6F8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_viewModel], (uint64_t *)&unk_10079CA20);
  sub_10003B6F8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_treeCellViewModel], (uint64_t *)&unk_1007A3EE0);
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_treeCellViewDelegate]);
  sub_10003B6F8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_nameModule], (uint64_t *)&unk_1007AD520);

  BOOL v3 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_unsupportedTextDropHandler];
}

- (BOOL)isAccessibilityElement
{
  v2 = *(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders36TTRIRemindersListEditableSectionCell_nameTextView];
  if (v2) {
    LOBYTE(v2) = [v2 isEditing] ^ 1;
  }
  else {
    __break(1u);
  }
  return (char)v2;
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  unsigned __int8 v3 = sub_1004CBFA0();

  return v3 & 1;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1004CC15C();
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

- (NSString)accessibilityValue
{
  return (NSString *)sub_1004CC280(self, (uint64_t)a2, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Attributes.Expanded.unsafeMutableAddressor, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Attributes.Collapsed.unsafeMutableAddressor);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1004CC280(self, (uint64_t)a2, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Hint.HeadingCollapse.unsafeMutableAddressor, (uint64_t (*)(uint64_t))&TTRAccesibility.AccountsList.Hint.HeadingExpand.unsafeMutableAddressor);
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = sub_1004CC468();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_1004CC68C();

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
    unsigned int v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIRemindersListEditableSectionCell *)&v8 setAccessibilityCustomActions:isa];
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  unint64_t v3 = [(TTRIRemindersListEditableSectionCell *)&v6 accessibilityTraits];
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;

  return v4 | v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TTRIRemindersListEditableSectionCell *)&v4 setAccessibilityTraits:a3];
}

@end
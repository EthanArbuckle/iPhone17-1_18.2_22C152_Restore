@interface TTRIAccountsListsViewListCell
- (BOOL)accessibilityActivate;
- (CGRect)frame;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityDropPointDescriptors;
- (NSAttributedString)accessibilityAttributedValue;
- (NSString)accessibilityHint;
- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)setAccessibilityDropPointDescriptors:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)toggleSmartListVisibility:(id)a3;
@end

@implementation TTRIAccountsListsViewListCell

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100030CF0(x, y, width, height);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRIAccountsListsViewListCell(0);
  [(TTRIAccountsListsViewListCell *)&v6 frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders29TTRIAccountsListsViewListCell *)sub_100035D10(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders29TTRIAccountsListsViewListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10063A394();
}

- (void)toggleSmartListVisibility:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1006379C8();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (BOOL)accessibilityActivate
{
  double v2 = self;
  if ([(TTRIAccountsListsViewListCell *)v2 isEditing]
    && (id v3 = *(void **)&v2->super.NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_checkmarkButton],
        ([v3 isHidden] & 1) == 0))
  {
    [v3 sendActionsForControlEvents:64];

    return 1;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for TTRIAccountsListsViewListCell(0);
    BOOL v4 = [(TTRIAccountsListsBaseCell *)&v6 accessibilityActivate];
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  double v2 = self;
  UIAccessibilityTraits v3 = sub_100637E68();

  return v3;
}

- (NSString)accessibilityHint
{
  double v2 = self;
  sub_100637F90();
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

- (NSAttributedString)accessibilityAttributedValue
{
  double v2 = self;
  id v3 = sub_100638188();

  return (NSAttributedString *)v3;
}

- (NSArray)accessibilityCustomActions
{
  return (NSArray *)sub_100638D08(self, (uint64_t)a2, (uint64_t (*)(void))sub_1006386C4, (unint64_t *)&unk_10078E660);
}

- (void)setAccessibilityCustomActions:(id)a3
{
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)sub_100638D08(self, (uint64_t)a2, sub_100638DA4, &qword_1007ACDC8);
}

- (void)setAccessibilityDropPointDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_listsViewListCellDelegate);

  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders29TTRIAccountsListsViewListCell_listItem, (uint64_t *)&unk_100788E00);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
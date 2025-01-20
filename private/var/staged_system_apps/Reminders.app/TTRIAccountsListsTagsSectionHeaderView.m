@interface TTRIAccountsListsTagsSectionHeaderView
- (BOOL)isAccessibilityElement;
- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithCoder:(id)a3;
- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (int64_t)accessibilityContainerType;
@end

@implementation TTRIAccountsListsTagsSectionHeaderView

- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithReuseIdentifier:(id)a3
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
  return (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView *)sub_10034F8C8(v3, v4);
}

- (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView_menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView____lazy_storage___menuButton) = 0;
  id v4 = a3;

  result = (_TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders38TTRIAccountsListsTagsSectionHeaderView____lazy_storage___menuButton);
}

@end
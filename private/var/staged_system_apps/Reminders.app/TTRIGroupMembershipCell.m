@interface TTRIGroupMembershipCell
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityElements;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (_TtC9Reminders23TTRIGroupMembershipCell)initWithCoder:(id)a3;
- (_TtC9Reminders23TTRIGroupMembershipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIGroupMembershipCell

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
  id v3 = [(TTRIGroupMembershipCell *)v2 textLabel];
  if (v3 && (v4 = v3, id v5 = [v3 text], v4, v5))
  {
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

- (NSString)accessibilityHint
{
  v2 = self;
  sub_1003AAAEC();
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

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = sub_1003AAE48();

  return v3 & 1;
}

- (_TtC9Reminders23TTRIGroupMembershipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->ttriAccessibilityDelegate[OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate] = 0;
    swift_unknownObjectWeakInit();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->ttriAccessibilityDelegate[OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate] = 0;
    swift_unknownObjectWeakInit();
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIGroupMembershipCell();
  v7 = [(TTRIGroupMembershipCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC9Reminders23TTRIGroupMembershipCell)initWithCoder:(id)a3
{
  *(void *)&self->ttriAccessibilityDelegate[OBJC_IVAR____TtC9Reminders23TTRIGroupMembershipCell_ttriAccessibilityDelegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRIGroupMembershipCell();
  return [(TTRIGroupMembershipCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end
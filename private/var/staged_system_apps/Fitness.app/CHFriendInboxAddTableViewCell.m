@interface CHFriendInboxAddTableViewCell
- (CHFriendInboxAddTableViewCell)initWithCoder:(id)a3;
- (CHFriendInboxAddTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation CHFriendInboxAddTableViewCell

- (CHFriendInboxAddTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHFriendInboxAddTableViewCell *)sub_10051FA78(a3, (uint64_t)a4, v6);
}

- (CHFriendInboxAddTableViewCell)initWithCoder:(id)a3
{
  result = (CHFriendInboxAddTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end
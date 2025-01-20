@interface CHShowLegacyDevicesTableViewCell
- (CHShowLegacyDevicesTableViewCell)initWithCoder:(id)a3;
- (CHShowLegacyDevicesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation CHShowLegacyDevicesTableViewCell

- (CHShowLegacyDevicesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHShowLegacyDevicesTableViewCell *)sub_1003DC7C4(a3, (uint64_t)a4, v6);
}

- (CHShowLegacyDevicesTableViewCell)initWithCoder:(id)a3
{
  result = (CHShowLegacyDevicesTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end
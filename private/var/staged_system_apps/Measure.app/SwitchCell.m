@interface SwitchCell
- (id)initWithCoder:(uint64_t)a3;
- (id)initWithStyle:(uint64_t)a3 reuseIdentifier:(NSString)a4;
@end

@implementation SwitchCell

- (id)initWithStyle:(uint64_t)a3 reuseIdentifier:(NSString)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  v10.receiver = a1;
  v10.super_class = ObjectType;
  id v8 = [super initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (id)initWithCoder:(uint64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return [super initWithCoder:a3];
}

@end
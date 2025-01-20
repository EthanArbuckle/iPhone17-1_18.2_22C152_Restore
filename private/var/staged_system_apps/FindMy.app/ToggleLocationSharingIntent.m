@interface ToggleLocationSharingIntent
- (ToggleLocationSharingIntent)init;
- (ToggleLocationSharingIntent)initWithCoder:(id)a3;
- (ToggleLocationSharingIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ToggleLocationSharingIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ToggleLocationSharingIntent

- (ToggleLocationSharingIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ToggleLocationSharingIntent();
  return [(ToggleLocationSharingIntent *)&v3 init];
}

- (ToggleLocationSharingIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToggleLocationSharingIntent();
  return [(ToggleLocationSharingIntent *)&v5 initWithCoder:a3];
}

- (ToggleLocationSharingIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ToggleLocationSharingIntent();
  v9 = [(ToggleLocationSharingIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (ToggleLocationSharingIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ToggleLocationSharingIntent();
  v10 = [(ToggleLocationSharingIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end
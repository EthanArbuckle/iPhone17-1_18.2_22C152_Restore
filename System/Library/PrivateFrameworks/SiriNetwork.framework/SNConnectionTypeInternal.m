@interface SNConnectionTypeInternal
- (BOOL)canUseWiFiDirectly;
- (BOOL)isEdge;
- (BOOL)isWWAN;
- (SNConnectionTypeInternal)init;
- (id)connectionTypeStringRawValue;
- (id)init:(int64_t)a3;
- (int64_t)connectionTypeRawValue;
- (int64_t)diagnosticConnectionType;
- (unint64_t)aggregatorConnectionType;
@end

@implementation SNConnectionTypeInternal

- (id)init:(int64_t)a3
{
  return ConnectionTypeWrapper.init(_:)(a3);
}

- (int64_t)connectionTypeRawValue
{
  return ConnectionTypeWrapper.connectionTypeRawValue()();
}

- (id)connectionTypeStringRawValue
{
  uint64_t countAndFlagsBits = ConnectionTypeWrapper.connectionTypeStringRawValue()()._countAndFlagsBits;
  v3 = (void *)MEMORY[0x2611B2220](countAndFlagsBits);
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)isWWAN
{
  return ConnectionTypeWrapper.isWWAN()();
}

- (BOOL)isEdge
{
  return ConnectionTypeWrapper.isEdge()();
}

- (BOOL)canUseWiFiDirectly
{
  return ConnectionTypeWrapper.canUseWiFiDirectly()();
}

- (int64_t)diagnosticConnectionType
{
  return ConnectionTypeWrapper.diagnosticConnectionType()();
}

- (unint64_t)aggregatorConnectionType
{
  return ConnectionTypeWrapper.aggregatorConnectionType()();
}

- (SNConnectionTypeInternal)init
{
}

@end
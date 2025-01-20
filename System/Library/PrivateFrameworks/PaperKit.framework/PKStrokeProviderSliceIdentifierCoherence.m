@interface PKStrokeProviderSliceIdentifierCoherence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKStrokeProviderSliceIdentifierCoherence)init;
- (PKStrokeProviderSliceIdentifierCoherence)initWithCoder:(id)a3;
- (PKStrokeProviderSliceIdentifierCoherence)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKStrokeProviderSliceIdentifierCoherence

- (BOOL)isEqual:(id)a3
{
  return @objc PKStrokeProviderSliceIdentifierCoherence.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKStrokeProviderSliceIdentifierCoherence.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = PKStrokeProviderSliceIdentifierCoherence.hash.getter();

  return v3;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PKStrokeProviderSliceIdentifierCoherence.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x21054D080](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PKStrokeProviderSliceIdentifierCoherence.encode(with:)((NSCoder)v4);
}

- (PKStrokeProviderSliceIdentifierCoherence)initWithCoder:(id)a3
{
  return (PKStrokeProviderSliceIdentifierCoherence *)PKStrokeProviderSliceIdentifierCoherence.init(coder:)(a3);
}

- (PKStrokeProviderSliceIdentifierCoherence)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  uint64_t v5 = type metadata accessor for UUID();
  MEMORY[0x270FA5388](v5 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  result = (PKStrokeProviderSliceIdentifierCoherence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PKStrokeProviderSliceIdentifierCoherence)init
{
  result = (PKStrokeProviderSliceIdentifierCoherence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___PKStrokeProviderSliceIdentifierCoherence_transformTimestamp;
  uint64_t v4 = type metadata accessor for FinalizedTimestamp();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR___PKStrokeProviderSliceIdentifierCoherence_strokeDataUUID, &demangling cache variable for type metadata for UUID?);
}

@end
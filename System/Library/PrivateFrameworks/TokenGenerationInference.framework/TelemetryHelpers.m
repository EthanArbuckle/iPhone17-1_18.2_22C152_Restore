@interface TelemetryHelpers
+ (void)emitFileResidentInfoWithAssetIdentifier:(id)a3 residentPages:(int64_t)a4 totalPages:(int64_t)a5;
- (_TtC24TokenGenerationInference16TelemetryHelpers)init;
@end

@implementation TelemetryHelpers

+ (void)emitFileResidentInfoWithAssetIdentifier:(id)a3 residentPages:(int64_t)a4 totalPages:(int64_t)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GenerativeFunctionsInstrumentationEvent?);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  type metadata accessor for EventReporter();
  swift_allocObject();
  EventReporter.init()();
  uint64_t v16 = v11;
  uint64_t v17 = v13;
  int64_t v18 = a4;
  int64_t v19 = a5;
  EventReporter.send(eventBuiltWithPresetsAnd:)();
  swift_release();
  uint64_t v14 = type metadata accessor for GenerativeFunctionsInstrumentationEvent();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 0, 1, v14);
  outlined destroy of GenerativeFunctionsInstrumentationEvent?((uint64_t)v10);
  swift_bridgeObjectRelease();
}

- (_TtC24TokenGenerationInference16TelemetryHelpers)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TelemetryHelpers *)&v3 init];
}

@end
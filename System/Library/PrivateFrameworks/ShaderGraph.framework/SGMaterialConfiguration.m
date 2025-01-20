@interface SGMaterialConfiguration
- (BOOL)isEqual:(id)a3;
- (NSArray)customGeometryProperties;
- (SGMaterialConfiguration)init;
- (void)setCustomGeometryProperties:(id)a3;
@end

@implementation SGMaterialConfiguration

- (SGMaterialConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGMaterialConfiguration_customGeometryProperties) = (Class)MEMORY[0x263F8EE78];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SGMaterialConfiguration();
  return [(SGMaterialConfiguration *)&v3 init];
}

- (NSArray)customGeometryProperties
{
  swift_beginAccess();
  type metadata accessor for SGGeometryPropertyDefinition();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setCustomGeometryProperties:(id)a3
{
  type metadata accessor for SGGeometryPropertyDefinition();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SGMaterialConfiguration_customGeometryProperties);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SGMaterialConfiguration.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end
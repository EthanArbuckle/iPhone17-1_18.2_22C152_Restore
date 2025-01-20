@interface SGGeometryPropertyDefinition
+ (id)geometryPropertyWithName:(id)a3 mappingTo:(id)a4;
- (NSString)description;
- (NSString)name;
- (SGGeometryPropertyDefinition)init;
@end

@implementation SGGeometryPropertyDefinition

- (NSString)name
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGGeometryPropertyDefinition_name);
  uint64_t v3 = *(void *)&self->name[OBJC_IVAR___SGGeometryPropertyDefinition_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x261183E60](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

+ (id)geometryPropertyWithName:(id)a3 mappingTo:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
    if (v4)
    {
LABEL_3:
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v4 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  swift_getObjCClassMetadata();
  v10 = (void *)static SGGeometryPropertyDefinition.create(name:mappingTo:)(v5, v7, v8, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (SGGeometryPropertyDefinition)init
{
  result = (SGGeometryPropertyDefinition *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)description
{
  uint64_t v2 = self;
  unint64_t v3 = SGGeometryPropertyDefinition.description.getter();
  uint64_t v5 = v4;

  uint64_t v6 = (void *)MEMORY[0x261183E60](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
@interface SGREMaterial
- (BOOL)hasBackgroundBlur;
- (BOOL)hasConnectedLightSpillNodes;
- (BOOL)hasGeometryModifierOffset;
- (BOOL)hasGeometryModifierUniforms;
- (BOOL)hasPremultipliedAlpha;
- (BOOL)hasSurfaceShaderUniforms;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchUnlitColor;
- (NSArray)uniforms;
- (NSArray)warnings;
- (NSDictionary)textures;
- (NSString)geometryModifierFunctionName;
- (NSString)name;
- (NSString)surfaceShaderFunctionName;
- (SGREMaterial)init;
- (SGTypeDescription)customUniformsType;
- (int64_t)hash;
- (unint64_t)blending;
- (unint64_t)lightingModel;
- (void)setTextures:(id)a3;
@end

@implementation SGREMaterial

- (NSString)name
{
  v2 = (uint64_t *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_graph) + OBJC_IVAR___SGGraph_name);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x261183E60](v3, v4);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)surfaceShaderFunctionName
{
  return (NSString *)@objc SGREMaterial.surfaceShaderFunctionName.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGREMaterial_surfaceShaderFunctionName);
}

- (NSString)geometryModifierFunctionName
{
  return (NSString *)@objc SGREMaterial.surfaceShaderFunctionName.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGREMaterial_geometryModifierFunctionName);
}

- (NSArray)uniforms
{
  return (NSArray *)@objc SGREMaterial.uniforms.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGREMaterial_uniforms, 0, (void (*)(uint64_t))type metadata accessor for SGInput);
}

- (NSDictionary)textures
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setTextures:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SGREMaterial_textures);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (unint64_t)lightingModel
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_lightingModel);
}

- (unint64_t)blending
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_blending);
}

- (BOOL)hasPremultipliedAlpha
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasPremultipliedAlpha);
}

- (BOOL)matchUnlitColor
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_matchUnlitColor);
}

- (NSArray)warnings
{
  return (NSArray *)@objc SGREMaterial.uniforms.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGREMaterial_warnings, v2, (void (*)(uint64_t))type metadata accessor for SGWarning);
}

- (BOOL)hasSurfaceShaderUniforms
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasSurfaceShaderUniforms);
}

- (BOOL)hasGeometryModifierUniforms
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasGeometryModifierUniforms);
}

- (BOOL)hasConnectedLightSpillNodes
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasConnectedLightSpillNodes);
}

- (BOOL)hasBackgroundBlur
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasBackgroundBlur);
}

- (BOOL)hasGeometryModifierOffset
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGREMaterial_hasGeometryModifierOffset);
}

- (SGTypeDescription)customUniformsType
{
  return (SGTypeDescription *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                 + OBJC_IVAR___SGREMaterial_customUniformsType)
                                                                      + OBJC_IVAR___SGPropertyDescription_type));
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SGREMaterial_operationalHash);
}

- (SGREMaterial)init
{
  result = (SGREMaterial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___SGREMaterial_edgeDigest;
  uint64_t v4 = type metadata accessor for SHA512Digest();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
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
  char v6 = SGREMaterial.isEqual(_:)((uint64_t)v8);

  outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

@end
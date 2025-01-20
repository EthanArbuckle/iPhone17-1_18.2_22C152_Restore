@interface VFXEntityObject
- (BOOL)_setValue:(id)a3 forKeyPath:(id)a4;
- (BOOL)isEnabled;
- (BOOL)isLocal;
- (CGImage)clientCGImage;
- (MTLBuffer)particleDataBuffer;
- (MTLBuffer)particleHeaderBuffer;
- (MTLTexture)clientTexture;
- (NSArray)bindings;
- (NSArray)intersectionFunctions;
- (NSArray)presentationBindings;
- (NSString)description;
- (NSString)tag;
- (NSString)textureAbsolutePath;
- (_TtC3VFX15VFXEntityObject)init;
- (__n128)orientation;
- (__n128)position;
- (__n128)scale;
- (__n128)transform;
- (float)opacity;
- (id)_valueForKeyPath:(id)a3 world:(id)a4;
- (id)copyWithZone:(void *)a3;
- (id)init:(int64_t)a3 privateEntityManager:(id)a4;
- (id)init:(int64_t)a3 sharedEntityManager:(id)a4;
- (int64_t)objectID;
- (int64_t)particleDataBufferOffset;
- (int64_t)particleHeaderBufferOffset;
- (void)addTo:(id)a3;
- (void)dealloc;
- (void)killParticles;
- (void)removeFromScene;
- (void)restart;
- (void)setBeamed;
- (void)setClientCGImage:(CGImage *)a3;
- (void)setClientTexture:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setOpacity:(float)a3;
- (void)setOrientation:(void *)a1;
- (void)setPosition:(_TtC3VFX15VFXEntityObject *)self;
- (void)setScale:(_TtC3VFX15VFXEntityObject *)self;
- (void)setTag:(id)a3;
- (void)setTransform:(simd_float4)a3;
- (void)updateBridgedReferencesWithBridgeable:(id)a3 objectByIdentifier:(id)a4;
@end

@implementation VFXEntityObject

- (int64_t)objectID
{
  uint64_t v3 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject_entity);
  uint64_t v2 = *(unsigned int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject_entity + 4);
  if (v2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3 == 0xFFFFFFFFLL;
  }
  int64_t v5 = v3 | (v2 << 32);
  if (v4) {
    return 0;
  }
  else {
    return v5;
  }
}

- (id)init:(int64_t)a3 sharedEntityManager:(id)a4
{
  return (id)sub_1B69612A4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t *))VFXEntityObject.init(_:sharedEntityManager:));
}

- (id)init:(int64_t)a3 privateEntityManager:(id)a4
{
  return (id)sub_1B69612A4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t *))VFXEntityObject.init(_:privateEntityManager:));
}

- (NSString)description
{
  sub_1B681F698();
  uint64_t v2 = (void *)sub_1B6E31768();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)dealloc
{
  uint64_t v2 = self;
  VFXEntityObject.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  swift_release();
}

- (NSString)tag
{
  uint64_t v2 = self;
  sub_1B6962410();
  uint64_t v4 = v3;

  if (v4)
  {
    int64_t v5 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTag:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B6E31798();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1B69625F0(v4, v6);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1B69629C0(v6);

  sub_1B62C14BC(v6, v6[3]);
  uint64_t v4 = (void *)sub_1B6E33498();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v6);
  return v4;
}

- (void)updateBridgedReferencesWithBridgeable:(id)a3 objectByIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1B6E32718();
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1B6E314C8();

  sub_1B6962B80(v9, v8);
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)&v10);
}

- (_TtC3VFX15VFXEntityObject)init
{
  result = (_TtC3VFX15VFXEntityObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)removeFromScene
{
  if (swift_weakLoadStrong())
  {
    uint64_t v4 = self;
    swift_release();
    uint64_t v3 = v4;
    if ((*((unsigned char *)&v4->super.isa + OBJC_IVAR____TtC3VFX15VFXEntityObject__isTombstoned) & 1) == 0)
    {
      sub_1B6960754(1);
      uint64_t v3 = v4;
    }
  }
}

- (void)addTo:(id)a3
{
  uint64_t v4 = *(void *)((char *)a3 + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v5 = a3;
  id v6 = self;
  sub_1B6961E18(v4);
}

- (NSArray)presentationBindings
{
  return (NSArray *)sub_1B69F60B0(self, (uint64_t)a2, (void (*)(void))VFXEntityObject.presentationBindings.getter, (unint64_t *)&qword_1E9DD3A90);
}

- (MTLTexture)clientTexture
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)VFXEntityObject.clientTexture.getter();

  return (MTLTexture *)v3;
}

- (void)setClientTexture:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  VFXEntityObject.clientTexture.setter((uint64_t)a3);
}

- (CGImage)clientCGImage
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)VFXEntityObject.clientCGImage.getter();

  return (CGImage *)v3;
}

- (void)setClientCGImage:(CGImage *)a3
{
  id v5 = a3;
  id v6 = self;
  VFXEntityObject.clientCGImage.setter(a3);
}

- (NSArray)bindings
{
  return (NSArray *)sub_1B69F60B0(self, (uint64_t)a2, (void (*)(void))VFXEntityObject.bindings.getter, (unint64_t *)&qword_1E9DD3A90);
}

- (NSArray)intersectionFunctions
{
  return (NSArray *)sub_1B69F60B0(self, (uint64_t)a2, (void (*)(void))VFXEntityObject.intersectionFunctions.getter, (unint64_t *)&unk_1EB9804C0);
}

- (MTLBuffer)particleHeaderBuffer
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_1B69F6AA8((uint64_t (*)(void, void, uint64_t))sub_1B6C0894C);

  return (MTLBuffer *)v3;
}

- (int64_t)particleHeaderBufferOffset
{
  uint64_t v2 = self;
  int64_t v3 = sub_1B69F6D44((uint64_t (*)(void, void, uint64_t))sub_1B6C08704);

  return v3;
}

- (MTLBuffer)particleDataBuffer
{
  uint64_t v2 = self;
  int64_t v3 = (void *)sub_1B69F6AA8((uint64_t (*)(void, void, uint64_t))sub_1B6C089C8);

  return (MTLBuffer *)v3;
}

- (int64_t)particleDataBufferOffset
{
  uint64_t v2 = self;
  int64_t v3 = sub_1B69F6D44((uint64_t (*)(void, void, uint64_t))sub_1B6C0877C);

  return v3;
}

- (__n128)transform
{
  id v1 = a1;
  *(double *)&long long v2 = VFXEntityObject.transform.getter();
  long long v4 = v2;

  return (__n128)v4;
}

- (void)setTransform:(simd_float4)a3
{
  v6.columns[3] = a5;
  v6.columns[1] = a3;
  v6.columns[2] = a4;
  v6.columns[0] = a2;
  id v5 = a1;
  VFXEntityObject.transform.setter(v6);
}

- (void)setBeamed
{
  long long v2 = self;
  VFXEntityObject.setBeamed()();
}

- (float)opacity
{
  long long v2 = self;
  float v3 = VFXEntityObject.opacity.getter();

  return v3;
}

- (void)setOpacity:(float)a3
{
  float v3 = self;
  VFXEntityObject.opacity.setter();
}

- (__n128)position
{
  id v1 = a1;
  *(double *)&long long v2 = VFXEntityObject.position.getter();
  long long v4 = v2;

  return (__n128)v4;
}

- (void)setPosition:(_TtC3VFX15VFXEntityObject *)self
{
  long long v2 = self;
  VFXEntityObject.position.setter();
}

- (__n128)orientation
{
  id v1 = a1;
  *(double *)&long long v2 = VFXEntityObject.orientation.getter();
  long long v4 = v2;

  return (__n128)v4;
}

- (void)setOrientation:(void *)a1
{
  id v1 = a1;
  VFXEntityObject.orientation.setter();
}

- (__n128)scale
{
  id v1 = a1;
  *(double *)&long long v2 = VFXEntityObject.scale.getter();
  long long v4 = v2;

  return (__n128)v4;
}

- (void)setScale:(_TtC3VFX15VFXEntityObject *)self
{
  __n128 v4 = v2;
  float v3 = self;
  VFXEntityObject.scale.setter(v4);
}

- (BOOL)isEnabled
{
  __n128 v2 = self;
  char v3 = VFXEntityObject.isEnabled.getter();

  return v3 & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  __n128 v4 = self;
  VFXEntityObject.isEnabled.setter(a3);
}

- (NSString)textureAbsolutePath
{
  __n128 v2 = self;
  VFXEntityObject.textureAbsolutePath.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isLocal
{
  __n128 v2 = self;
  char v3 = VFXEntityObject.isLocal.getter();

  return v3 & 1;
}

- (void)killParticles
{
  __n128 v2 = self;
  VFXEntityObject.killParticles()();
}

- (void)restart
{
  __n128 v2 = self;
  VFXEntityObject.restart()();
}

- (BOOL)_setValue:(id)a3 forKeyPath:(id)a4
{
  sub_1B6E31798();
  swift_unknownObjectRetain();
  simd_float4x4 v6 = self;
  char v7 = VFXEntityObject._setValue(_:forKeyPath:)((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (id)_valueForKeyPath:(id)a3 world:(id)a4
{
  uint64_t v6 = sub_1B6E31798();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  v11 = (void *)VFXEntityObject._valueForKeyPath(_:world:)(v6, v8, v9);

  swift_bridgeObjectRelease();

  return v11;
}

@end
@interface VFXScene
+ (NSArray)builtinEffectIdentifiers;
+ (NSBundle)vfxAssetsFrameworkBundle;
+ (id)cloneAndSetupReplicationWithModelWorld:(id)a3;
+ (id)vfxLibraryURLFor:(id)a3;
+ (void)appendWithTrigger:(id)a3 touchEvent:(id)a4 view:(id)a5 inWorld:(id)a6;
+ (void)registerWithTriggerManager:(id)a3 inWorld:(id)a4;
+ (void)setBuiltinEffectIdentifiers:(id)a3;
+ (void)stopReplicationWithModel:(id)a3 runtime:(id)a4;
- (BOOL)additiveWritesToAlpha;
- (BOOL)allowsCameraControl;
- (BOOL)beginImgUIFrameWithViewportSize:(CGSize)a3 backingScaleFactor:(double)a4;
- (BOOL)endImgUIFrame;
- (BOOL)endImgUIFrameWithCommandBuffer:(id)a3 encoder:(id)a4 renderPassDescriptor:(id)a5;
- (BOOL)imGUIEnabled;
- (BOOL)isEnabled:(id)a3;
- (BOOL)isFrozen;
- (BOOL)isPlaying;
- (BOOL)loadWithUrl:(id)a3 loadingForAuthoring:(BOOL)a4 infoOut:(id)a5 presentationScene:(id)a6 error:(id *)a7;
- (BOOL)paused;
- (BOOL)showStatistics;
- (BOOL)useGammaBlending;
- (NSArray)bindings;
- (NSArray)effects;
- (NSArray)metalBinaryArchiveURLs;
- (NSObject)assetManager;
- (NSURL)recordedMetalBinaryArchiveURL;
- (VFXMTLResourceManager)resourceManager;
- (_TtC3VFX8VFXScene)init;
- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 error:(id *)a4;
- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 options:(id)a4 error:(id *)a5;
- (_TtC3VFX8VFXScene)initWithIdentifier:(id)a3 error:(id *)a4;
- (_TtC3VFX8VFXScene)initWithOptions:(id)a3;
- (__n128)evaluateForceFieldsAtPosition:(float32x4_t)a3 velocity:(float)a4 mass:(double)a5 charge:(float)a6 time:(float)a7 dt:(uint64_t)a8 categoryMask:(int)a9;
- (char)internalPixelFormatDepth;
- (float)deltaTime;
- (float)speedFactor;
- (float)time;
- (float)timeScale;
- (id)addEffectFrom:(id)a3 error:(id *)a4;
- (id)addEffectFromTemplate:(id)a3;
- (id)addEffectWithEffectID:(int)a3;
- (id)bindingOf:(id)a3 named:(id)a4;
- (id)buildAccelerationStructureDescriptorsWithEntity:(int64_t)a3;
- (id)destinationReplicationDelegate;
- (id)fetchEntityObjectWithTag:(id)a3;
- (id)firstBindingWithName:(id)a3;
- (id)initForEngineNamed:(id)a3;
- (id)makeDefaultCamera;
- (id)parameterOf:(id)a3 named:(id)a4;
- (id)recycleBuffersGetCompletion;
- (id)sourceReplicationDelegate;
- (id)textureForEntity:(int64_t)a3 isFallback:(BOOL *)a4 isDynamic:(BOOL *)a5;
- (id)valueAtPath:(id)a3;
- (int64_t)addLightWithType:(int64_t)a3;
- (int64_t)createSkyboxWithParameters:(id)a3;
- (int64_t)drawCallCount;
- (int64_t)entityWithTag:(id)a3;
- (int64_t)newObject;
- (int64_t)version;
- (unint64_t)internalPixelFormat;
- (void)addEntityObject:(id)a3;
- (void)beginTransaction:(void *)a3;
- (void)clearCaches;
- (void)dealloc;
- (void)destroyObject:(int64_t)a3;
- (void)encodeAuthoringWithEncoder:(id)a3 colorFormat:(unint64_t)a4 depthStencilFormat:(unint64_t)a5 sampleCount:(int64_t)a6;
- (void)endTransaction;
- (void)enterBackground;
- (void)enterForeground;
- (void)enumerateDrawCall:(id)a3;
- (void)initializeAssetManagerWithBundleURL:(id)a3;
- (void)invalidateCachedScriptParams;
- (void)opaqueEntityManager;
- (void)performTransaction:(id)a3;
- (void)prepare;
- (void)remapEntityReferences:(id)a3;
- (void)removeAllEffects;
- (void)removeEffect:(id)a3;
- (void)removeEntityObject:(id)a3;
- (void)removeLightWithId:(int64_t)a3;
- (void)removeSkyboxes;
- (void)resolveObjectReferencesWithRemapTableWithWorld:(id)a3 objectsByIdentifier:(id)a4;
- (void)restart;
- (void)selectObject:(int64_t)a3 selected:(BOOL)a4;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setAllowsCameraControl:(BOOL)a3;
- (void)setAssetManager:(id)a3;
- (void)setDebugUIOptions:(unint64_t)a3;
- (void)setDestinationReplicationDelegate:(id)a3;
- (void)setDirectionalLightUniformOverridesOn:(int64_t)a3 world:(void *)a4 proj:(void *)a5;
- (void)setEffects:(id)a3;
- (void)setEnabled:(id)a3 enabled:(BOOL)a4;
- (void)setImGUIEnabled:(BOOL)a3;
- (void)setInternalPixelFormat:(unint64_t)a3;
- (void)setInternalPixelFormatDepth:(char)a3;
- (void)setIsFrozen:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setLightParametersOn:(int64_t)a3 parameters:(id)a4;
- (void)setMetalBinaryArchiveURLs:(id)a3;
- (void)setParameterOf:(id)a3 named:(id)a4 :(id)a5;
- (void)setPaused:(BOOL)a3;
- (void)setRecordedMetalBinaryArchiveURL:(id)a3;
- (void)setShadowParametersOn:(int64_t)a3 castsShadows:(BOOL)a4 tiles:(void *)a5 count:(int64_t)a6 depthBias:(float)a7;
- (void)setSourceReplicationDelegate:(id)a3;
- (void)setSpeedFactor:(float)a3;
- (void)setTime:(float)a3;
- (void)setTimeScale:(float)a3;
- (void)setUseGammaBlending:(BOOL)a3;
- (void)setValue:(id)a3 atPath:(id)a4;
- (void)setWorld:(__CFXWorld *)a3;
- (void)startRuntimeThread;
- (void)stopRuntimeThread;
- (void)triggerRenderWith:(id)a3 renderer:(unint64_t)a4;
- (void)updateAtTime:(double)a3 deltaTime:(double)a4 frameIndex:(int64_t)a5;
- (void)updateForceField:(void *)a3 of:(int64_t)a4;
- (void)updateVFX2RenderOutputWithPointOfView:(id)a3 commandBuffer:(id)a4;
- (void)updateWithDeltaTime:(double)a3;
- (void)updateWorldTransform:(simd_float4x4 *)a3 of:;
- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5;
- (void)withPointerToValueAtPath:(id)a3 block:(id)a4;
@end

@implementation VFXScene

- (int64_t)addLightWithType:(int64_t)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B69E26CC(v4, a3, v5);
  int64_t v7 = v6;

  return v7;
}

- (void)removeLightWithId:(int64_t)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v5 = self;
  sub_1B69D6180(v4, a3, v5);
}

- (void)setLightParametersOn:(int64_t)a3 parameters:(id)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v7 = a4;
  v8 = self;
  id v9 = v7;
  v10 = v8;
  sub_1B69D6318(v6, a3, v9, v10);
}

- (void)setShadowParametersOn:(int64_t)a3 castsShadows:(BOOL)a4 tiles:(void *)a5 count:(int64_t)a6 depthBias:(float)a7
{
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v13 = self;
  sub_1B69D653C(v12, a3, v13, a4, a6, (uint64_t)a5, a7);
}

- (void)setDirectionalLightUniformOverridesOn:(int64_t)a3 world:(void *)a4 proj:(void *)a5
{
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v9 = self;
  sub_1B69D6758(v8, a3, (uint64_t)a4, (uint64_t)a5, v9);
}

- (int64_t)createSkyboxWithParameters:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v5 = a3;
  uint64_t v6 = self;
  sub_1B69E28BC(v4, v5, v6);
  int64_t v8 = v7;

  return v8;
}

- (void)removeSkyboxes
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v3 = self;
  sub_1B69D693C(v2, v3);
}

+ (NSBundle)vfxAssetsFrameworkBundle
{
  if (qword_1E9DCBF90 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9DCDCB0;

  return (NSBundle *)v2;
}

+ (NSArray)builtinEffectIdentifiers
{
  if (qword_1E9DCBF98 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (void)setBuiltinEffectIdentifiers:(id)a3
{
  uint64_t v3 = sub_1B6E31C28();
  if (qword_1E9DCBF98 != -1) {
    swift_once();
  }
  qword_1E9DCDCB8 = v3;

  swift_bridgeObjectRelease();
}

- (_TtC3VFX8VFXScene)initWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1B6E31798();
  return (_TtC3VFX8VFXScene *)VFXScene.init(identifier:)(v4, v5);
}

+ (id)vfxLibraryURLFor:(id)a3
{
  sub_1B63BE100();
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B6E31798();
  static VFXScene.vfxLibraryURL(for:)(v7, v8, (uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1B6E30F48();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
  {
    v11 = (void *)sub_1B6E30E78();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  }

  return v11;
}

+ (void)registerWithTriggerManager:(id)a3 inWorld:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1B6786AD0(v5, v6);
}

+ (void)appendWithTrigger:(id)a3 touchEvent:(id)a4 view:(id)a5 inWorld:(id)a6
{
  uint64_t v9 = sub_1B6E31798();
  uint64_t v11 = v10;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  sub_1B6786C40(v9, v11, v12, v13, v14);

  swift_bridgeObjectRelease();
}

- (NSArray)effects
{
  type metadata accessor for VFXEffect();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setEffects:(id)a3
{
  type metadata accessor for VFXEffect();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_effects) = (Class)sub_1B6E31C28();

  swift_bridgeObjectRelease();
}

- (int64_t)version
{
  uint64_t v2 = self;
  int64_t v3 = sub_1B688088C();

  return v3;
}

- (_TtC3VFX8VFXScene)initWithOptions:(id)a3
{
  return (_TtC3VFX8VFXScene *)VFXScene.init(options:)(a3);
}

- (_TtC3VFX8VFXScene)init
{
  return (_TtC3VFX8VFXScene *)VFXScene.init()();
}

- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1B6E30F48();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  return (_TtC3VFX8VFXScene *)VFXScene.init(contentsOf:options:)((unint64_t)v9, a4);
}

- (_TtC3VFX8VFXScene)initWithContentsOf:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1B6E30F48();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  return (_TtC3VFX8VFXScene *)VFXScene.init(contentsOf:)((unint64_t)v7);
}

- (id)initForEngineNamed:(id)a3
{
}

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_hasSharedEntityManager) == 1)
  {
    int64_t v3 = self;
  }
  else
  {
    uint64_t v4 = self;
    swift_retain();
    sub_1B69DEDF8();
    swift_release();
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VFXScene(0);
  [(VFXScene *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  int64_t v3 = (char *)self + OBJC_IVAR____TtC3VFX8VFXScene_recordedMetalBinaryArchiveURL;

  sub_1B663ABE8((uint64_t)v3);
}

- (NSArray)metalBinaryArchiveURLs
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_metalBinaryArchiveURLs))
  {
    sub_1B6E30F48();
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1B6E31C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setMetalBinaryArchiveURLs:(id)a3
{
  if (a3)
  {
    sub_1B6E30F48();
    uint64_t v4 = (objc_class *)sub_1B6E31C28();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_metalBinaryArchiveURLs) = v4;

  swift_bridgeObjectRelease();
}

- (NSURL)recordedMetalBinaryArchiveURL
{
  return (NSURL *)sub_1B6882D4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC3VFX8VFXScene_recordedMetalBinaryArchiveURL);
}

- (void)setRecordedMetalBinaryArchiveURL:(id)a3
{
}

- (unint64_t)internalPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormat);
}

- (void)setInternalPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormat) = (Class)a3;
}

- (char)internalPixelFormatDepth
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormatDepth);
}

- (void)setInternalPixelFormatDepth:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_internalPixelFormatDepth) = a3;
}

- (BOOL)useGammaBlending
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_useGammaBlending);
}

- (void)setUseGammaBlending:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_useGammaBlending) = a3;
}

- (void)enterBackground
{
  uint64_t v2 = self;
  sub_1B6A9883C();
}

- (void)enterForeground
{
  uint64_t v2 = self;
  sub_1B6A98950();
}

- (BOOL)isPlaying
{
  uint64_t v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  if (v2[96] == 1) {
    return (v2[99] ^ 1) & 1;
  }
  else {
    return 0;
  }
}

- (void)setIsPlaying:(BOOL)a3
{
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                      + 96] = a3;
}

- (BOOL)isFrozen
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                             + 97];
}

- (void)setIsFrozen:(BOOL)a3
{
  int64_t v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  v3[97] = a3;
  if (a3) {
    v3[98] = 0;
  }
}

- (float)timeScale
{
  return *(float *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                              + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
                  + 208);
}

- (void)setTimeScale:(float)a3
{
  *(float *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                       + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
           + 208) = a3;
}

- (BOOL)allowsCameraControl
{
  return 0;
}

- (void)setAllowsCameraControl:(BOOL)a3
{
  uint64_t v3 = qword_1EB9852D0;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v5 = sub_1B6E32148();
  uint64_t v6 = 1;
  sub_1B6B33B70(v5, 0xD000000000000057, 0x80000001B6F3A600, &v6);

  swift_release();
}

- (BOOL)showStatistics
{
  return 0;
}

- (BOOL)additiveWritesToAlpha
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v2) {
    return *(unsigned char *)(v2 + 321);
  }
  else {
    return 0;
  }
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B6883DD0(a3);
}

- (id)bindingOf:(id)a3 named:(id)a4
{
  uint64_t v5 = sub_1B6E31798();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  uint64_t v12 = sub_1B6C0A538(v5, v7, 0x200000000, 1);
  if ((v13 & 1) != 0 || v12 == 0xFFFFFFFFLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v14 = 0;
  }
  else
  {
    id v14 = (void *)sub_1B6B64914(v12, v5, v7, v8, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v14;
}

- (id)firstBindingWithName:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1B6B5AD30(v4, v6, 0x200000000);

  swift_bridgeObjectRelease();

  return v8;
}

- (NSArray)bindings
{
  uint64_t v2 = self;
  sub_1B6B5B228(0x200000000, 0, 0);

  sub_1B688A8CC();
  uint64_t v3 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)updateWithDeltaTime:(double)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v5 = self;
  sub_1B69D6BB8(v4, v5, a3);
}

- (void)restart
{
  uint64_t v2 = self;
  sub_1B688422C();
}

- (void)prepare
{
}

- (void)clearCaches
{
}

- (void)performTransaction:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1B6884470((void (*)(void))sub_1B688A8C4, v5);

  swift_release();
}

- (id)parameterOf:(id)a3 named:(id)a4
{
  uint64_t v5 = sub_1B6E31798();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = self;
  sub_1B69DDA0C(v11, v11, v5, v7, 0x200000000, v8, v10, (uint64_t)v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v23;
  if (v23)
  {
    id v14 = sub_1B62C14BC(v22, v23);
    uint64_t v15 = *(void *)(v13 - 8);
    double v16 = MEMORY[0x1F4188790](v14, v14);
    v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v15 + 16))(v18, v16);
    v19 = (void *)sub_1B6E33498();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
    _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v22);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setParameterOf:(id)a3 named:(id)a4 :(id)a5
{
  uint64_t v6 = sub_1B6E31798();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1B6E31798();
  uint64_t v11 = v10;
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  sub_1B6E32718();
  swift_unknownObjectRelease();
  v13[2] = *(Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v13[3] = v6;
  v13[4] = v8;
  int v14 = 0;
  char v15 = 2;
  uint64_t v16 = v9;
  uint64_t v17 = v11;
  v18 = v19;
  sub_1B63BA2B0((void (*)(void))sub_1B6887984, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v19);
}

- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_1B6E31798();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B6E31798();
  uint64_t v12 = v11;
  _Block_copy(v6);
  uint64_t v13 = self;
  sub_1B68879BC(v7, v9, v10, v12, (uint64_t)v13, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setValue:(id)a3 atPath:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  sub_1B6E32718();
  swift_unknownObjectRelease();
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;

  v11[2] = v7;
  v11[3] = v12;
  v11[4] = v8;
  v11[5] = v10;
  sub_1B63BA2B0((void (*)(void))sub_1B688AAD8, (uint64_t)v11);

  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v12);
}

- (id)valueAtPath:(id)a3
{
  uint64_t v4 = (void *)sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  sub_1B69DDD00(v7, v8, v4, v6, &v18);

  swift_bridgeObjectRelease();
  uint64_t v9 = v19;
  if (v19)
  {
    uint64_t v10 = sub_1B62C14BC(&v18, v19);
    uint64_t v11 = *(void *)(v9 - 8);
    double v12 = MEMORY[0x1F4188790](v10, v10);
    int v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v11 + 16))(v14, v12);
    char v15 = (void *)sub_1B6E33498();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)&v18);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)withPointerToValueAtPath:(id)a3 block:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = qword_1EB9852D0;
  uint64_t v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  swift_retain();
  int v7 = sub_1B6E32148();
  if (qword_1EB9854F8 != -1) {
    swift_once();
  }
  uint64_t v9 = 0;
  swift_retain();
  sub_1B6B33E34(v7, &v9, 0xD00000000000003DLL, 0x80000001B6F3A660);
  swift_release();
  swift_release();
  _Block_release(v5);
}

- (void)setEnabled:(id)a3 enabled:(BOOL)a4
{
  uint64_t v6 = sub_1B6E31798();
  uint64_t v8 = v7;
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = self;
  sub_1B69D750C(v9, v9, v6, v8, 0x200000000, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)isEnabled:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_retain();
  uint64_t v8 = self;
  LOBYTE(v4) = sub_1B69E39D8(v7, v7, v4, v6, 0x200000000);

  swift_bridgeObjectRelease();
  swift_release();
  return v4 & 1;
}

- (id)addEffectFrom:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1B6E30F48();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  uint64_t v10 = self;
  sub_1B639E0C0((uint64_t)v9);
  double v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v12;
}

- (id)addEffectWithEffectID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v8 = 0;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v5 = self;
  sub_1B69D7818(v4, &v8, v5, v3);

  id v6 = v8;

  return v6;
}

- (id)addEffectFromTemplate:(id)a3
{
  id v11 = 0;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v5 = a3;
  id v6 = self;
  id v7 = v5;
  id v8 = v6;
  sub_1B69D79C8(v4, v7, v8, &v11);

  id v9 = v11;

  return v9;
}

- (void)removeEffect:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v5 = self;
  id v6 = a3;
  id v7 = v5;
  sub_1B69D7BEC(v4, v7, v6);
}

- (void)removeAllEffects
{
}

- (id)makeDefaultCamera
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v3 = **(void **)(v2 + OBJC_IVAR____TtC3VFX13EntityManager_commandQueues);
  uint64_t v4 = self;
  char v13 = 1;
  unint64_t v5 = sub_1B6D7CF58(0x100000000uLL, v3);
  LODWORD(v3) = v5;
  unint64_t v6 = HIDWORD(v5);
  id v7 = (objc_class *)type metadata accessor for VFXCoreCamera();
  id v8 = (char *)objc_allocWithZone(v7);
  id v9 = &v8[OBJC_IVAR____TtC3VFX13VFXCoreCamera_instance];
  *(_DWORD *)id v9 = v3;
  *((_DWORD *)v9 + 1) = v6;
  *((void *)v9 + 1) = v2;
  v12.receiver = v8;
  v12.super_class = v7;
  uint64_t v10 = [(VFXScene *)&v12 init];

  return v10;
}

- (NSObject)assetManager
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)VFXScene.assetManager.getter();

  return v3;
}

- (void)setAssetManager:(id)a3
{
  id v7 = a3;
  unint64_t v5 = self;
  sub_1B6887BDC(a3, v6);
}

- (void)initializeAssetManagerWithBundleURL:(id)a3
{
  uint64_t v4 = sub_1B6E30F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  id v9 = self;
  VFXScene.initializeAssetManagerWithBundleURL(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (int64_t)entityWithTag:(id)a3
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
  uint64_t v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  Swift::Int64 v9 = VFXScene.entity(withTag:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)textureForEntity:(int64_t)a3 isFallback:(BOOL *)a4 isDynamic:(BOOL *)a5
{
  Swift::String_optional v8 = self;
  Swift::Int64 v9 = (void *)sub_1B6887414(a3, a4, a5);

  return v9;
}

- (BOOL)loadWithUrl:(id)a3 loadingForAuthoring:(BOOL)a4 infoOut:(id)a5 presentationScene:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  uint64_t v11 = sub_1B6E30F48();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  char v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  id v16 = a5;
  id v17 = a6;
  long long v18 = self;
  sub_1B6A00588((unint64_t)v15, v9, a5);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);

  return 1;
}

- (void)addEntityObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  VFXScene.addEntityObject(_:)(v4);
}

- (void)removeEntityObject:(id)a3
{
  uint64_t v3 = self;
  id v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC3VFX8VFXScene_entityObjects);
  unint64_t v5 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityObjects);
  id v6 = a3;
  uint64_t v11 = v3;
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_1B69EF148((uint64_t)v6, v5);
  swift_bridgeObjectRelease();
  if (v3)
  {
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1B69EFD50((uint64_t)v6, v7);
    char v10 = v9;
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {

    }
    objc_msgSend(v6, sel_removeFromScene);
  }
}

- (id)fetchEntityObjectWithTag:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  unint64_t v7 = self;
  uint64_t v8 = sub_1B69F1734(v4, v6);
  if (v8)
  {
    char v9 = v8;

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v10 = *(uint64_t *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
    uint64_t v11 = v7;
    swift_bridgeObjectRetain();
    sub_1B69D8FBC(v10, v11, v4, v6, (id *)&v13);

    swift_bridgeObjectRelease();
    char v9 = v13;
  }

  return v9;
}

- (void)resolveObjectReferencesWithRemapTableWithWorld:(id)a3 objectsByIdentifier:(id)a4
{
  uint64_t v6 = sub_1B6E314C8();
  unint64_t v7 = (VFXWorld *)a3;
  uint64_t v8 = self;
  VFXScene.resolveObjectReferencesWithRemapTable(world:objectsByIdentifier:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)updateVFX2RenderOutputWithPointOfView:(id)a3 commandBuffer:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  unint64_t v7 = self;
  VFXScene.updateVFX2RenderOutput(pointOfView:commandBuffer:)((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)remapEntityReferences:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  VFXScene.remapEntityReferences(_:)((uint64_t)v4);
}

- (void)beginTransaction:(void *)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  id v6 = self;
  sub_1B63BADF0();
  uint64_t v5 = *(void *)(v4 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v5) {
    *(void *)(v5 + 144) = a3;
  }
}

- (void)endTransaction
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_renderer);
  if (v2) {
    *(void *)(v2 + 144) = 0;
  }
  uint64_t v3 = self;
  sub_1B69E090C();
}

- (VFXMTLResourceManager)resourceManager
{
  uint64_t v2 = self;
  id v10 = sub_1B69F31A0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  return (VFXMTLResourceManager *)v10;
}

- (void)opaqueEntityManager
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
}

- (float)deltaTime
{
  return *(float *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                  + OBJC_IVAR____TtC3VFX13EntityManager_clock
                  + 64);
}

- (id)recycleBuffersGetCompletion
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v3 = self;
  uint64_t v4 = sub_1B69E4CC8(v2, v3);
  uint64_t v6 = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v6;

  aBlock[4] = sub_1B6A02B44;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B639AA00;
  aBlock[3] = &unk_1F0FB8408;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();

  return v8;
}

- (void)updateAtTime:(double)a3 deltaTime:(double)a4 frameIndex:(int64_t)a5
{
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v9 = self;
  sub_1B69D91EC(v8, v9, a5, a3, a4);
}

- (void)enumerateDrawCall:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  v8[2] = v4;
  id v6 = *(id *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_transientDrawCall);
  swift_retain();
  uint64_t v7 = self;
  sub_1B69D93F8(v5, v5, v6, (void (*)(uint64_t))sub_1B6A027C4, (uint64_t)v8);

  _Block_release(v4);
}

- (int64_t)drawCallCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v3 = qword_1E9DCC548;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  v9[0] = xmmword_1E9DD39D0;
  v9[1] = unk_1E9DD39E0;
  uint64_t v10 = qword_1E9DD39F0;
  sub_1B62C9DA8(v2, (uint64_t)v9, 0x200000000, v7);
  sub_1B6A00E34((uint64_t)v7, (uint64_t)v8, (unint64_t *)&qword_1EB97DC50, (uint64_t)&type metadata for QueryResult);
  if (v8[0])
  {
    int64_t v5 = v8[10];
    sub_1B632F170(v7);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)triggerRenderWith:(id)a3 renderer:(unint64_t)a4
{
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  *(void *)(v7 + 16) = v6;
  if (*(void *)(v8 + OBJC_IVAR____TtC3VFX13EntityManager_runtimeThread))
  {
    uint64_t v9 = self;
    swift_retain();
    sub_1B6A908D4((uint64_t)sub_1B688A8C4, v7, a4);

    swift_release();
  }

  swift_release();
}

- (float)speedFactor
{
  return *(float *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                              + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
                  + 208);
}

- (void)setSpeedFactor:(float)a3
{
  *(float *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                       + OBJC_IVAR____TtC3VFX13EntityManager_scheduler)
           + 208) = a3;
}

- (float)time
{
  return *(double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_clock
                   + 48);
}

- (void)setTime:(float)a3
{
  *(double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_clock
            + 48) = a3;
}

- (BOOL)paused
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_clock
                                                                                             + 97];
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
     + OBJC_IVAR____TtC3VFX13EntityManager_clock;
  v3[97] = a3;
  if (a3) {
    v3[98] = 0;
  }
}

- (BOOL)beginImgUIFrameWithViewportSize:(CGSize)a3 backingScaleFactor:(double)a4
{
  return 0;
}

- (BOOL)endImgUIFrameWithCommandBuffer:(id)a3 encoder:(id)a4 renderPassDescriptor:(id)a5
{
  return 0;
}

- (BOOL)endImgUIFrame
{
  return 0;
}

- (BOOL)imGUIEnabled
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_imGUIEnabled];
}

- (void)setImGUIEnabled:(BOOL)a3
{
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager))[OBJC_IVAR____TtC3VFX13EntityManager_imGUIEnabled] = a3;
}

- (void)encodeAuthoringWithEncoder:(id)a3 colorFormat:(unint64_t)a4 depthStencilFormat:(unint64_t)a5 sampleCount:(int64_t)a6
{
  sub_1B6389BE4(a4, 0, 0, 0, 0, 0, 0, 0, v10, a5, 0, 1, a6);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_1B632CE70(v8, a3, v10);
  swift_unknownObjectRelease();
}

- (int64_t)newObject
{
  int64_t result = sub_1B6D7D90C(0x100000000uLL, **(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)+ OBJC_IVAR____TtC3VFX13EntityManager_commandQueues));
  if (result == 0xFFFFFFFFLL) {
    return 0;
  }
  return result;
}

- (void)destroyObject:(int64_t)a3
{
  uint64_t v4 = self;
  VFXScene.destroyObject(_:)(a3);
}

- (void)updateWorldTransform:(simd_float4x4 *)a3 of:
{
  id v4 = a1;
  VFXScene.updateWorldTransform(_:of:)(a3, (Swift::Int64)v4);
}

- (void)selectObject:(int64_t)a3 selected:(BOOL)a4
{
  id v6 = self;
  sub_1B69F4200(a3, a4);
}

- (void)invalidateCachedScriptParams
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
  uint64_t v3 = self;
  sub_1B69D961C(v2, v3);
}

- (void)setWorld:(__CFXWorld *)a3
{
  *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_world) = a3;
}

- (void)updateForceField:(void *)a3 of:(int64_t)a4
{
  id v6 = self;
  VFXScene.updateForceField(_:of:)((uint64_t)a3, a4);
}

- (__n128)evaluateForceFieldsAtPosition:(float32x4_t)a3 velocity:(float)a4 mass:(double)a5 charge:(float)a6 time:(float)a7 dt:(uint64_t)a8 categoryMask:(int)a9
{
  uint64_t v13 = *(void *)&a1[OBJC_IVAR____TtC3VFX8VFXScene_entityManager];
  uint64_t v14 = a1;
  *(float *)&double v15 = a4;
  sub_1B67AAB08(v13, a9, a2, a3, v15, a6, a7);
  long long v20 = v16;

  return (__n128)v20;
}

+ (void)stopReplicationWithModel:(id)a3 runtime:(id)a4
{
  *(void *)(*(void *)((char *)a3 + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream) = 0;
  id v5 = a3;
  id v6 = (char *)a4;
  swift_release();
  *(void *)(*(void *)&v6[OBJC_IVAR____TtC3VFX8VFXScene_entityManager]
            + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream) = 0;

  swift_release();
}

+ (id)cloneAndSetupReplicationWithModelWorld:(id)a3
{
  id v3 = a3;
  id v4 = _s3VFX8VFXSceneC24cloneAndSetupReplication10modelWorldAA26VFXBidirectionalRemapTableCSo8VFXWorldC_tFZ_0(v3);

  return v4;
}

- (id)sourceReplicationDelegate
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream);
  if (v2) {
    id v3 = (void *)MEMORY[0x1BA9B8670](v2 + 48, a2);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setSourceReplicationDelegate:(id)a3
{
}

- (id)destinationReplicationDelegate
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                 + OBJC_IVAR____TtC3VFX13EntityManager_replicationStream);
  if (v2) {
    id v3 = (void *)MEMORY[0x1BA9B8670](v2 + 64, a2);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setDestinationReplicationDelegate:(id)a3
{
}

- (void)setDebugUIOptions:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX8VFXScene_debugUIOptions) = (Class)a3;
}

- (void)startRuntimeThread
{
  uint64_t v2 = self;
  VFXScene.startRuntimeThread()();
}

- (void)stopRuntimeThread
{
  uint64_t v2 = self;
  sub_1B69DEDF8();
}

- (id)buildAccelerationStructureDescriptorsWithEntity:(int64_t)a3
{
  id v4 = self;
  sub_1B6BCD134(a3);

  sub_1B6BCD924();
  id v5 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return v5;
}

@end
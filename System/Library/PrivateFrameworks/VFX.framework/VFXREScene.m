@interface VFXREScene
- (BOOL)needsCollisionPlanes;
- (BOOL)shouldUseDrawCallHandler;
- (VFXREScene)init;
- (VFXREScene)initWithCommandQueue:(id)a3 model:(id)a4 options:(id)a5;
- (VFXREScene)initWithContentsOf:(id)a3 commandQueue:(id)a4 options:(id)a5 error:(id *)a6;
- (VFXREScene)initWithDevice:(id)a3 contentsOf:(id)a4 error:(id *)a5;
- (VFXREScene)initWithDevice:(id)a3 model:(id)a4;
- (VFXREScene)initWithDevice:(id)a3 model:(id)a4 options:(id)a5;
- (_TtC3VFX8VFXScene)scene;
- (_TtC3VFX9VFXEffect)effect;
- (__n128)worldBoundingBox;
- (float)deltaTime;
- (float)sceneScale;
- (id)REMeshAssetBindings;
- (id)createREMeshDataBinding;
- (id)generateMaterialsAndReturnError:(id *)a3;
- (id)getREMeshAssetPath:(id)a3;
- (id)neededModelsAndReturnError:(id *)a3;
- (id)recycleBuffersGetCompletion;
- (id)reloadBlock;
- (id)transientDrawCall;
- (int)peerPid;
- (int64_t)drawCallCount;
- (int64_t)fetchClientTextureIDWithNamed:(id)a3;
- (int64_t)uuid;
- (uint64_t)addCollisionPlaneWithCenter:(void *)a1 extents:(double)a2 transform:(float32x4_t)a3;
- (uint64_t)addCollisionPlaneWithExtents:(float32x4_t)a3 transform:(float32x4_t)a4;
- (unsigned)peerTaskIdentity;
- (void)clear;
- (void)collideOutsidePlaneWithId:(int64_t)a3;
- (void)copyBindingValueWithObjectName:(id)a3 bindingName:(id)a4 action:(int64_t)a5 storageGetterBlock:(id)a6;
- (void)opaqueECS;
- (void)removeCollisionPlaneWithId:(int64_t)a3;
- (void)setCameraEntityTransformProjection:(VFXREScene *)self :(SEL)a2 :::::;
- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4;
- (void)setEffect:(id)a3;
- (void)setFrameConfigurationWithImmersiveEnvironmentCurves:(VFXREScene *)self;
- (void)setPeerPid:(int)a3;
- (void)setPeerTaskIdentity:(unsigned int)a3;
- (void)setREMeshDataBinding:(id)a3 positionData:(id)a4 normalData:(id)a5 colorData:(id)a6;
- (void)setReloadBlock:(id)a3;
- (void)setRootEntityTransform:(VFXREScene *)self :(SEL)a2 :;
- (void)setRootTransform:(VFXREScene *)self :(SEL)a2 :;
- (void)setScene:(id)a3;
- (void)setSceneScale:(float)a3;
- (void)setSceneTransform:(VFXREScene *)self :(SEL)a2 :;
- (void)setTransientDrawCall:(id)a3;
- (void)setUuid:(int64_t)a3;
- (void)tick;
- (void)tickWithCommandBuffer:(id)a3;
- (void)tickWithDeltaTime:(double)a3;
- (void)tickWithDeltaTime:(double)a3 commandBuffer:(id)a4;
- (void)updateCollisionPlaneWithId:(float32x4_t)a3 center:(uint64_t)a4 extents:(unint64_t)a5 transform:;
- (void)updateCollisionPlaneWithId:(float32x4_t)a3 extents:(float32x4_t)a4 transform:(float32x4_t)a5;
- (void)updateMemoryOwnership;
@end

@implementation VFXREScene

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___VFXREScene_scene));
}

- (void)setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene) = (Class)a3;
  id v3 = a3;
}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___VFXREScene_effect));
}

- (void)setEffect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_effect);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_effect) = (Class)a3;
  id v3 = a3;
}

- (id)transientDrawCall
{
  v2 = (void *)swift_unknownObjectRetain();

  return v2;
}

- (void)setTransientDrawCall:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_transientDrawCall) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (int64_t)uuid
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_uuid);
}

- (void)setUuid:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_uuid) = (Class)a3;
}

- (float)sceneScale
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale);
}

- (void)setSceneScale:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale) = a3;
}

- (id)reloadBlock
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock))
  {
    uint64_t v2 = *(void *)&self->scene[OBJC_IVAR___VFXREScene_reloadBlock];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1B639AA00;
    v5[3] = &unk_1F0FB8480;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setReloadBlock:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1B6A7BDD4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___VFXREScene_reloadBlock);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1B62C6A50(v8);
}

- (void)opaqueECS
{
  return *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                  + OBJC_IVAR____TtC3VFX8VFXScene_entityManager);
}

- (float)deltaTime
{
  return *(float *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                              + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                  + OBJC_IVAR____TtC3VFX13EntityManager_clock
                  + 64);
}

- (int)peerPid
{
  return *(_DWORD *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                               + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_peerPid);
}

- (void)setPeerPid:(int)a3
{
  *(_DWORD *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                        + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_peerPid) = a3;
}

- (unsigned)peerTaskIdentity
{
  return *(_DWORD *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                               + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
                   + OBJC_IVAR____TtC3VFX13EntityManager_peerTaskIdentity);
}

- (void)setPeerTaskIdentity:(unsigned int)a3
{
  *(_DWORD *)(*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_scene)
                        + OBJC_IVAR____TtC3VFX8VFXScene_entityManager)
            + OBJC_IVAR____TtC3VFX13EntityManager_peerTaskIdentity) = a3;
}

- (int64_t)drawCallCount
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = self;
  uint64_t v5 = swift_retain();
  int64_t v6 = sub_1B69DE104(v5, v4, ObjectType);

  swift_release();
  return v6;
}

- (void)updateMemoryOwnership
{
  uint64_t v2 = self;
  swift_retain();
  sub_1B69E157C();
  swift_release();
  id v3 = v2;
  uint64_t v4 = swift_retain();
  sub_1B69DA31C(v4, v3);

  swift_release();
}

- (__n128)worldBoundingBox
{
  id v1 = a1;
  uint64_t v2 = swift_retain();
  sub_1B69E5DF8(v2, v1);
  unint64_t v7 = v3;
  unsigned __int32 v6 = v4;

  swift_release();
  result.n128_u64[0] = v7;
  result.n128_u32[2] = v6;
  return result;
}

- (VFXREScene)initWithContentsOf:(id)a3 commandQueue:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v8 = sub_1B6E30F48();
  MEMORY[0x1F4188790](v8 - 8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(contentsOf:commandQueue:options:)((uint64_t)v11, a4, a5);
}

- (VFXREScene)initWithCommandQueue:(id)a3 model:(id)a4 options:(id)a5
{
  swift_unknownObjectRetain();
  uint64_t v8 = (VFXREScene *)sub_1B6A7A8C4(a3, (char *)a4, a5);
  swift_unknownObjectRelease();
  return v8;
}

- (VFXREScene)initWithDevice:(id)a3 contentsOf:(id)a4 error:(id *)a5
{
  uint64_t v5 = sub_1B6E30F48();
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B6E30EE8();
  uint64_t v9 = swift_unknownObjectRetain();
  return (VFXREScene *)VFXREScene.init(device:contentsOf:)(v9, (uint64_t)v8);
}

- (VFXREScene)initWithDevice:(id)a3 model:(id)a4 options:(id)a5
{
  return (VFXREScene *)VFXREScene.init(device:model:options:)((uint64_t)a3, (char *)a4, a5);
}

- (VFXREScene)initWithDevice:(id)a3 model:(id)a4
{
  return (VFXREScene *)VFXREScene.init(device:model:)((uint64_t)a3, (char *)a4);
}

- (BOOL)shouldUseDrawCallHandler
{
  return 1;
}

- (id)generateMaterialsAndReturnError:(id *)a3
{
  sub_1B67F6310(MEMORY[0x1E4FBC860]);
  unint64_t v3 = (void *)sub_1B6E314B8();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)neededModelsAndReturnError:(id *)a3
{
  unint64_t v3 = (void *)sub_1B6E31C18();

  return v3;
}

- (void)clear
{
  uint64_t v2 = self;
  sub_1B6A77194();
}

- (void)copyBindingValueWithObjectName:(id)a3 bindingName:(id)a4 action:(int64_t)a5 storageGetterBlock:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1B6E31798();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1B6E31798();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v17 = swift_retain();
  sub_1B69DA568(v17, v16, v9, v11, v12, v14, a5, (uint64_t (*)(uint64_t))sub_1B6A027C4, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)tick
{
  uint64_t v2 = self;
  uint64_t v3 = swift_retain();
  sub_1B69DA81C(v3, v2);

  swift_release();
}

- (void)tickWithCommandBuffer:(id)a3
{
  unsigned __int32 v4 = self;
  swift_unknownObjectRetain_n();
  uint64_t v5 = v4;
  uint64_t v6 = swift_retain();
  sub_1B69DAA28(v6, v5, (uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)tickWithDeltaTime:(double)a3
{
  unsigned __int32 v4 = self;
  uint64_t v5 = swift_retain();
  sub_1B69DAC0C(v5, v4, a3);

  swift_release();
}

- (void)tickWithDeltaTime:(double)a3 commandBuffer:(id)a4
{
  uint64_t v6 = self;
  swift_unknownObjectRetain_n();
  uint64_t v7 = v6;
  uint64_t v8 = swift_retain();
  sub_1B69DAE2C(v8, v7, (uint64_t)a4, a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)recycleBuffersGetCompletion
{
  uint64_t v2 = self;
  uint64_t v3 = swift_retain();
  unsigned __int32 v4 = sub_1B69E5050(v3, v2);
  uint64_t v6 = v5;
  swift_release();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v6;

  aBlock[4] = sub_1B6A7BE08;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B639AA00;
  aBlock[3] = &unk_1F0FBA180;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();

  return v8;
}

- (void)setRootEntityTransform:(VFXREScene *)self :(SEL)a2 :
{
  simd_float4 v8 = v4;
  float32x4_t v6 = v2;
  float32x4_t v7 = v3;
  uint64_t v5 = self;
  sub_1B6A78384(v6, v7, v8);
}

- (void)setRootTransform:(VFXREScene *)self :(SEL)a2 :
{
  float32x4_t v21 = v3;
  *(double *)v5.i64 = sub_1B6A7ABFC(*(float *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneScale), v2);
  float32x4_t v18 = v5;
  sub_1B6A7AC04();
  double v7 = sub_1B6A7AC10(v21, v6, v18);
  *(double *)v11.i64 = sub_1B6A7ACD0(*(float32x4_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_sceneFromWorld), *(float32x4_t *)&self->effect[OBJC_IVAR___VFXREScene_sceneFromWorld], *(float32x4_t *)&self->rootEntity[OBJC_IVAR___VFXREScene_sceneFromWorld], *(float32x4_t *)&self->cameraEntity[OBJC_IVAR___VFXREScene_sceneFromWorld + 7], v7, v8, v9, v10);
  float32x4_t v20 = v12;
  float32x4_t v22 = v11;
  __n128 v17 = v14;
  float32x4_t v19 = v13;
  uint64_t v15 = self;
  uint64_t v16 = swift_retain();
  sub_1B69DB2DC(v16, v15, v22, v20, v19, v17);

  swift_release();
}

- (void)setSceneTransform:(VFXREScene *)self :(SEL)a2 :
{
  simd_float4 v8 = v4;
  float32x4_t v6 = v2;
  float32x4_t v7 = v3;
  float32x4_t v5 = self;
  sub_1B6A78838(v6, v7, v8);
}

- (void)setCameraEntityTransformProjection:(VFXREScene *)self :(SEL)a2 :::::
{
  if ((self->scene[OBJC_IVAR___VFXREScene_cameraEntity] & 1) == 0)
  {
    unint64_t v9 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_cameraEntity);
    __n128 v18 = v8;
    __n128 v16 = v6;
    __n128 v17 = v7;
    __n128 v14 = v4;
    __n128 v15 = v5;
    __n128 v12 = v2;
    __n128 v13 = v3;
    __n128 v10 = self;
    uint64_t v11 = swift_retain();
    sub_1B69DBA18(v11, v10, v9, v12, v13, v14, v15, v16, v17, v18);

    swift_release();
  }
}

- (void)setFrameConfigurationWithImmersiveEnvironmentCurves:(VFXREScene *)self
{
  __n128 v5 = v2;
  __n128 v3 = self;
  uint64_t v4 = swift_retain();
  sub_1B69DBC00(v4, v3, v5);

  swift_release();
}

- (int64_t)fetchClientTextureIDWithNamed:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  __n128 v7 = self;
  int64_t v8 = sub_1B6A78E2C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4
{
  swift_unknownObjectRetain();
  __n128 v7 = self;
  sub_1B6A78F6C(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (id)REMeshAssetBindings
{
  __n128 v2 = self;
  sub_1B6A790C0();

  sub_1B6A7BD5C();
  __n128 v3 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)getREMeshAssetPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B6A79708(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    int64_t v8 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)createREMeshDataBinding
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VFXREBindingMeshData()), sel_init);

  return v2;
}

- (void)setREMeshDataBinding:(id)a3 positionData:(id)a4 normalData:(id)a5 colorData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __n128 v14 = self;
  sub_1B6A79874(v10, a4, a5, a6);
}

- (uint64_t)addCollisionPlaneWithCenter:(void *)a1 extents:(double)a2 transform:(float32x4_t)a3
{
  sub_1B6A7AD24();
  float32x4_t v13 = v5;
  float32x4_t v14 = v4;
  __n128 v11 = v7;
  float32x4_t v12 = v6;
  id v8 = a1;
  uint64_t v9 = sub_1B6A79BEC(a3, v14, v13, v12, v11);

  return v9;
}

- (uint64_t)addCollisionPlaneWithExtents:(float32x4_t)a3 transform:(float32x4_t)a4
{
  id v6 = a1;
  uint64_t v7 = sub_1B6A79BEC(a2, a3, a4, a5, a6);

  return v7;
}

- (void)updateCollisionPlaneWithId:(float32x4_t)a3 center:(uint64_t)a4 extents:(unint64_t)a5 transform:
{
  sub_1B6A7AD24();
  float32x4_t v15 = v7;
  float32x4_t v13 = v9;
  float32x4_t v14 = v8;
  __n128 v12 = v10;
  id v11 = a1;
  sub_1B6A79DD4(a5, a3, v15, v14, v13, v12);
}

- (void)updateCollisionPlaneWithId:(float32x4_t)a3 extents:(float32x4_t)a4 transform:(float32x4_t)a5
{
  id v9 = a1;
  sub_1B6A79DD4(a8, a2, a3, a4, a5, a6);
}

- (void)removeCollisionPlaneWithId:(int64_t)a3
{
  float32x4_t v4 = self;
  sub_1B6A7A1B4(a3);
}

- (BOOL)needsCollisionPlanes
{
  id v2 = self;
  BOOL v3 = sub_1B6A7A308();

  return v3;
}

- (void)collideOutsidePlaneWithId:(int64_t)a3
{
  float32x4_t v4 = self;
  sub_1B6A7A3B8(a3);
}

- (VFXREScene)init
{
  __n128 result = (VFXREScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B62C6A50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREScene_reloadBlock));
  swift_bridgeObjectRelease();

  swift_release();
}

@end
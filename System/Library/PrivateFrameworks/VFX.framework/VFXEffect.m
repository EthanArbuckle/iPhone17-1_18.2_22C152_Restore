@interface VFXEffect
- (BOOL)allowRemoteEdition;
- (BOOL)isEnabled;
- (BOOL)isEnabled:(id)a3;
- (BOOL)isTombstoned;
- (NSArray)bindings;
- (NSArray)cameras;
- (_TtC3VFX8VFXScene)scene;
- (_TtC3VFX9VFXEffect)init;
- (_TtP3VFX17VFXEffectDelegate_)delegate;
- (id)allCameraNamed:(id)a3;
- (id)bindingOf:(id)a3 named:(id)a4;
- (id)bindingWith:(int64_t)a3 named:(id)a4;
- (id)firstBindingWithName:(id)a3;
- (id)parameterOf:(id)a3 named:(id)a4;
- (int64_t)fetchClientTextureIDWithNamed:(id)a3;
- (int64_t)identifier;
- (int64_t)lookupObjectIDByName:(id)a3;
- (int64_t)rootObjectID;
- (int64_t)version;
- (void)dump;
- (void)parameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 with:(id)a6;
- (void)parameterOf:(int64_t)a3 named:(id)a4 with:(id)a5;
- (void)setAllowRemoteEdition:(BOOL)a3;
- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(id)a3 enabled:(BOOL)a4;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsTombstoned:(BOOL)a3;
- (void)setParameterOf:(id)a3 named:(id)a4 :(id)a5;
- (void)setParameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 size:(int64_t)a6 with:(id)a7;
- (void)setParameterOf:(int64_t)a3 named:(id)a4 with:(id)a5;
- (void)setScene:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5;
@end

@implementation VFXEffect

- (_TtC3VFX9VFXEffect)init
{
  return (_TtC3VFX9VFXEffect *)sub_1B639CF1C();
}

- (int64_t)identifier
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_effectID + 4)) {
    return 0;
  }
  else {
    return *(int *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_effectID);
  }
}

- (int64_t)rootObjectID
{
  if (self->effectID[OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity]) {
    return 0;
  }
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity) == (Class)0xFFFFFFFFLL) {
    return 0;
  }
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_rootEntity);
}

- (_TtC3VFX8VFXScene)scene
{
  v2 = (void *)MEMORY[0x1BA9B8670]((char *)self + OBJC_IVAR____TtC3VFX9VFXEffect_scene, a2);

  return (_TtC3VFX8VFXScene *)v2;
}

- (void)setScene:(id)a3
{
}

- (_TtP3VFX17VFXEffectDelegate_)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP3VFX17VFXEffectDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_version);
}

- (void)setVersion:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect_version) = (Class)a3;
}

- (BOOL)allowRemoteEdition
{
  return 0;
}

- (void)setAllowRemoteEdition:(BOOL)a3
{
  uint64_t v3 = qword_1EB9852D0;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  swift_retain();
  int v5 = sub_1B6E32148();
  if (qword_1EB9854F8 != -1) {
    swift_once();
  }
  uint64_t v6 = 0;
  swift_retain();
  sub_1B6B33E34(v5, &v6, 0xD000000000000034, 0x80000001B6F4AB30);

  swift_release();

  swift_release();
}

- (id)bindingOf:(id)a3 named:(id)a4
{
  uint64_t v5 = sub_1B6E31798();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  v11 = self;
  uint64_t v12 = sub_1B639D66C();
  v13 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = (void *)sub_1B69E6148(v12, v13, v5, v7, v8, v10);
  swift_release();

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();

  return v14;
}

- (id)bindingWith:(int64_t)a3 named:(id)a4
{
  uint64_t v6 = sub_1B6E31798();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  uint64_t v10 = sub_1B639D66C();
  v11 = v9;
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)sub_1B69E6494(v10, v11, a3, v6, v8);
  swift_release();

  swift_bridgeObjectRelease_n();

  return v12;
}

- (id)firstBindingWithName:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1B6B5D9C8(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (NSArray)bindings
{
  v2 = self;
  sub_1B6B5DB20();

  sub_1B688A8CC();
  uint64_t v3 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (id)parameterOf:(id)a3 named:(id)a4
{
  uint64_t v5 = sub_1B6E31798();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  v11 = self;
  sub_1B6B5E034(v5, v7, v8, v10, (uint64_t)v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = v21;
  if (v21)
  {
    v13 = sub_1B62C14BC(v20, v21);
    uint64_t v14 = *(void *)(v12 - 8);
    double v15 = MEMORY[0x1F4188790](v13, v13);
    v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v14 + 16))(v17, v15);
    v18 = (void *)sub_1B6E33498();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
    _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v20);
  }
  else
  {
    v18 = 0;
  }

  return v18;
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
  sub_1B6B5E290(v6, v8, v9, v11, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s3VFX14_BinaryDecoderC16SingleValueStoreVwxx_0((uint64_t)v13);
}

- (int64_t)lookupObjectIDByName:(id)a3
{
  sub_1B6E31798();
  uint64_t v4 = self;
  int64_t v5 = sub_1B6B5E654();
  char v7 = v6;

  swift_bridgeObjectRelease();
  if (v7) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)parameterOf:(int64_t)a3 named:(id)a4 with:(id)a5
{
  char v7 = _Block_copy(a5);
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  v13[2] = v7;
  uint64_t v11 = self;
  uint64_t v12 = sub_1B639D66C();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B69DC250(v12, v12, a3, v8, v10, 23, (void (*)(uint64_t, uint64_t))sub_1B6B65B5C, (uint64_t)v13);
  swift_release();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)parameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 with:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_1B6E31798();
  uint64_t v12 = v11;
  v15[2] = v9;
  v13 = self;
  uint64_t v14 = sub_1B639D66C();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B69DC250(v14, v14, a3, v10, v12, a5, (void (*)(uint64_t, uint64_t))sub_1B637B5F4, (uint64_t)v15);
  swift_release();
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)setParameterOf:(int64_t)a3 named:(id)a4 with:(id)a5
{
  char v7 = _Block_copy(a5);
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  uint64_t v14 = v7;
  uint64_t v11 = self;
  uint64_t v12 = sub_1B639D66C();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B69DC480(v12, v12, a3, v8, v10, 23, 0, (void (*)(uint64_t, uint64_t))sub_1B6B65B5C, (uint64_t)v13);
  swift_release();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)setParameterOf:(int64_t)a3 named:(id)a4 type:(int64_t)a5 size:(int64_t)a6 with:(id)a7
{
  uint64_t v11 = _Block_copy(a7);
  uint64_t v12 = sub_1B6E31798();
  uint64_t v14 = v13;
  v18 = v11;
  double v15 = self;
  uint64_t v16 = sub_1B639D66C();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B69DC480(v16, v16, a3, v12, v14, a5, a6, (void (*)(uint64_t, uint64_t))sub_1B6B65B5C, (uint64_t)v17);
  swift_release();
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

- (void)withPointerToParameterOf:(id)a3 named:(id)a4 block:(id)a5
{
  char v6 = _Block_copy(a5);
  sub_1B6E31798();
  uint64_t v7 = sub_1B6E31798();
  uint64_t v9 = v8;
  v17 = v6;
  uint64_t v10 = self;
  uint64_t v11 = sub_1B6B5E654();
  if (v12)
  {
    _Block_release(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v11;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_1B6A027C4;
    *(void *)(v14 + 24) = &v16;
    uint64_t v15 = sub_1B639D66C();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1B69DC480(v15, v15, v13, v7, v9, 23, 0, (void (*)(uint64_t, uint64_t))sub_1B6B65B60, v14);
    swift_release();
    swift_release();
    _Block_release(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)setEnabled:(id)a3 enabled:(BOOL)a4
{
  uint64_t v6 = sub_1B6E31798();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1B6B5F028(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)isEnabled:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  LOBYTE(v4) = sub_1B6B5F14C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (int64_t)fetchClientTextureIDWithNamed:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  int64_t v8 = sub_1B6B5F25C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setClientTextureWithId:(int64_t)a3 texture:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  uint64_t v8 = sub_1B639D66C();
  swift_unknownObjectRetain();
  uint64_t v9 = v7;
  sub_1B69DC6D0(v8, v9, a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_release();
}

- (BOOL)isEnabled
{
  v2 = self;
  uint64_t v3 = sub_1B639D66C();
  uint64_t v4 = v2;
  char v5 = sub_1B69E3FC0(v3, v4);
  swift_release();

  return v5 & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  uint64_t v5 = sub_1B639D66C();
  uint64_t v6 = v4;
  sub_1B69DC8FC(v5, v6, a3);

  swift_release();
}

- (BOOL)isTombstoned
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned);
}

- (void)setIsTombstoned:(BOOL)a3
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned) != a3)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC3VFX9VFXEffect__tombstoned) = a3;
    uint64_t v3 = self;
    uint64_t v4 = sub_1B639D66C();
    uint64_t v5 = v3;
    sub_1B69DCD2C(v4, v5);

    swift_release();
  }
}

- (NSArray)cameras
{
  v2 = self;
  uint64_t v3 = sub_1B639D66C();
  uint64_t v4 = v2;
  sub_1B69E6724(v3, v4);
  swift_release();

  type metadata accessor for VFXCoreCamera();
  uint64_t v5 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (id)allCameraNamed:(id)a3
{
  uint64_t v4 = sub_1B6E31798();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = sub_1B639D66C();
  uint64_t v9 = v7;
  swift_bridgeObjectRetain();
  sub_1B69E6900(v8, v9, v4, v6);
  swift_release();

  swift_bridgeObjectRelease_n();
  type metadata accessor for VFXCoreCamera();
  uint64_t v10 = (void *)sub_1B6E31C18();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)dump
{
  v2 = self;
  sub_1B6B6107C();
}

- (void).cxx_destruct
{
  sub_1B63956DC((uint64_t)self + OBJC_IVAR____TtC3VFX9VFXEffect_url, (uint64_t)&qword_1EB9857F0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1B6397CE8);

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end
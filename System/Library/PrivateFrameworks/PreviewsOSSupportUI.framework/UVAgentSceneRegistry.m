@interface UVAgentSceneRegistry
+ (void)deliverScene:(id)a3 forIdentifier:(id)a4;
- (_TtC19PreviewsOSSupportUI20UVAgentSceneRegistry)init;
@end

@implementation UVAgentSceneRegistry

+ (void)deliverScene:(id)a3 forIdentifier:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D38);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23B5523D0();
  uint64_t v10 = v9;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v12 = sub_23B5524C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_23B5524A0();
  id v13 = a3;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_23B552490();
  v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = ObjCClassMetadata;
  v15[5] = v13;
  v15[6] = v8;
  v15[7] = v10;
  sub_23B54EDE8((uint64_t)v7, (uint64_t)&unk_268A6A258, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC19PreviewsOSSupportUI20UVAgentSceneRegistry)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes) = (Class)MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(UVAgentSceneRegistry *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
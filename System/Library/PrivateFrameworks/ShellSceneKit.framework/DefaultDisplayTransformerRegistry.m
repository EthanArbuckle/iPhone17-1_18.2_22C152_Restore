@interface DefaultDisplayTransformerRegistry
- (_TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry)init;
- (id)addTransformer:(id)a3 withIdentifier:(id)a4;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation DefaultDisplayTransformerRegistry

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  sub_25C47AA88();
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = sub_25C4603A4((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7;
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C460128(v4);

  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  sub_25C461080();
  v6 = (void *)sub_25C47AC58();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState;
  v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_hashTableWithOptions_, 512);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350BB0);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 16) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v8;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return [(DefaultDisplayTransformerRegistry *)&v10 init];
}

- (void).cxx_destruct
{
}

@end
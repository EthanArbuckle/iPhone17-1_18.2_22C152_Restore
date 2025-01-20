@interface IntentDispatcher
- (_TtC12SeymourMedia16IntentDispatcher)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentDispatcher

- (_TtC12SeymourMedia16IntentDispatcher)init
{
  sub_2261A1CAC();
  v3 = self;
  v4 = (void *)sub_226299EE0();
  _s11SeymourCore12DependenciesC0A5MediaE8standard5queueACSo012OS_dispatch_F0C_tFZ_0(v4);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD5D228);
  sub_2262974B0();
  swift_release();
  sub_2261C1C38(&v7, (uint64_t)v3 + OBJC_IVAR____TtC12SeymourMedia16IntentDispatcher_sessionClient);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for IntentDispatcher();
  return [(IntentDispatcher *)&v6 init];
}

- (void).cxx_destruct
{
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  IntentDispatcher.handler(for:)(v4, (uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    long long v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_22629A410();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
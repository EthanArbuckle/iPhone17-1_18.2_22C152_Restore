@interface ServerBoundContextUpdateContainer
+ (BOOL)supportsSecureCoding;
- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)init;
- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithCoder:(id)a3;
- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithSerializedBackingStore:(id)a3;
- (id)serializedBackingStore;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ServerBoundContextUpdateContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)ServerBoundContextUpdateContainer.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14SiriKitRuntime33ServerBoundContextUpdateContainer_contextUpdate);
  id v5 = a3;
  v6 = self;
  id v7 = (id)MEMORY[0x1BA9E2DD0](0xD00000000000001ALL, 0x80000001BA060330);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)initWithSerializedBackingStore:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)ServerBoundContextUpdateContainer.init(serializedBackingStore:)((uint64_t)&v4);
}

- (id)serializedBackingStore
{
  v2 = self;
  ServerBoundContextUpdateContainer.serializedBackingStore()(v5);

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);

  return v3;
}

- (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer)init
{
  result = (_TtC14SiriKitRuntime33ServerBoundContextUpdateContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime33ServerBoundContextUpdateContainer_contextUpdate));
}

@end
@interface ServerPromptData
+ (BOOL)supportsSecureCoding;
- (_TtC14SiriKitRuntime16ServerPromptData)init;
- (_TtC14SiriKitRuntime16ServerPromptData)initWithCoder:(id)a3;
- (_TtC14SiriKitRuntime16ServerPromptData)initWithSerializedBackingStore:(id)a3;
- (id)serializedBackingStore;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ServerPromptData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14SiriKitRuntime16ServerPromptData)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime16ServerPromptData *)ServerPromptData.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ServerPromptData.encode(with:)((NSCoder)v4);
}

- (_TtC14SiriKitRuntime16ServerPromptData)initWithSerializedBackingStore:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC14SiriKitRuntime16ServerPromptData *)ServerPromptData.init(serializedBackingStore:)((uint64_t)&v4);
}

- (id)serializedBackingStore
{
  v2 = self;
  ServerPromptData.serializedBackingStore()(v5);

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);

  return v3;
}

- (_TtC14SiriKitRuntime16ServerPromptData)init
{
  result = (_TtC14SiriKitRuntime16ServerPromptData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
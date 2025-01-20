@interface SpatialSceneDebugRepresentationWrapper
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper)init;
- (int64_t)fallback_debugHierarchyVisibility;
@end

@implementation SpatialSceneDebugRepresentationWrapper

- (_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper)init
{
  result = (_TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation));
}

- (int64_t)fallback_debugHierarchyVisibility
{
  return 1;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  if (specialized static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyPropertyDescriptions()())
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return v2.super.isa;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyValueForProperty(withName:on:outOptions:)(v6, v8, (uint64_t)v11, v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_0(v12, v12[3]);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

  return v9;
}

@end
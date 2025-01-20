@interface _UISceneHostGeometrySceneExtension
+ (id)hostComponents;
- (_UISceneHostGeometrySceneExtension)init;
@end

@implementation _UISceneHostGeometrySceneExtension

+ (id)hostComponents
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AE0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_186B83A90;
  *(void *)(v2 + 32) = type metadata accessor for _UISceneHostGeometryHostComponent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AD8);
  v3 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return v3;
}

- (_UISceneHostGeometrySceneExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostGeometrySceneExtension;
  return [(_UISceneHostGeometrySceneExtension *)&v3 init];
}

@end
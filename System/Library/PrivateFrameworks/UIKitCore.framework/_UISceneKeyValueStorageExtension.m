@interface _UISceneKeyValueStorageExtension
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
- (_UISceneKeyValueStorageExtension)init;
@end

@implementation _UISceneKeyValueStorageExtension

+ (id)clientSettingsExtensions
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AE0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_186B83A90;
  objc_msgSend(self, sel_extensionForProtocol_, &unk_1ED7005D0);
  *(void *)(v0 + 32) = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AD8);
  v1 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return v1;
}

+ (id)hostComponents
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AE0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_186B83A90;
  *(void *)(v0 + 32) = type metadata accessor for _UISceneKeyValueStorageComponent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB256AD8);
  v1 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return v1;
}

- (_UISceneKeyValueStorageExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISceneKeyValueStorageExtension;
  return [(_UISceneKeyValueStorageExtension *)&v3 init];
}

@end
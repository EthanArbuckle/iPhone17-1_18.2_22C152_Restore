@interface SecureCaptureSceneExtension
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
- (_TtC16SecureCaptureKit27SecureCaptureSceneExtension)init;
@end

@implementation SecureCaptureSceneExtension

+ (id)clientSettingsExtensions
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A582780);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25BF06C10;
  *(void *)(v2 + 32) = type metadata accessor for SecureCaptureSessionPathSettingsExtension();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A582778);
  v3 = (void *)sub_25BF05588();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)hostComponents
{
  if (sub_25BEF717C())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A582778);
    uint64_t v2 = (void *)sub_25BF05588();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (_TtC16SecureCaptureKit27SecureCaptureSceneExtension)init
{
  return (_TtC16SecureCaptureKit27SecureCaptureSceneExtension *)sub_25BEF6914(self, (uint64_t)a2, type metadata accessor for SecureCaptureSceneExtension);
}

@end
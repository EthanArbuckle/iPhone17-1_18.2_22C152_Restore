@interface PXTTRRadarObject
- (PXTTRRadarObject)init;
- (id)copyWithZone:(void *)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
@end

@implementation PXTTRRadarObject

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AA99DF10(a3);
  swift_unknownObjectRelease();
}

- (PXTTRRadarObject)init
{
  return (PXTTRRadarObject *)TTRRadarObject.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9B6805C((uint64_t)self + OBJC_IVAR___PXTTRRadarObject_preflightScreenshotURL, (uint64_t)&qword_1E981B730, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1A9B96D80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  TTRRadarObject.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1AB23C58C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

@end
@interface SwiftVideoProcessor
- (BOOL)copySourceOnlyDebugging;
- (BOOL)debugMode;
- (BOOL)inTestingMode;
- (SwiftVideoProcessor)init;
- (id)validationCallback;
- (void)processSurfaceWithSourceSurface:(__IOSurface *)a3 timestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6;
- (void)setCopySourceOnlyDebugging:(BOOL)a3;
- (void)setDebugMode:(BOOL)a3;
- (void)setInTestingMode:(BOOL)a3;
- (void)setValidationCallback:(id)a3;
@end

@implementation SwiftVideoProcessor

- (id)validationCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_259DA70A4;
    aBlock[3] = &block_descriptor_19;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setValidationCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_259DAE000;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_259DAD2B8((uint64_t)v7, v6);
  sub_259DAD3BC((uint64_t)v7);
}

- (BOOL)inTestingMode
{
  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_inTestingMode;
  swift_beginAccess();
  return *v2;
}

- (void)setInTestingMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_inTestingMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)debugMode
{
  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_debugMode;
  swift_beginAccess();
  return *v2;
}

- (void)setDebugMode:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_debugMode;
  swift_beginAccess();
  BOOL *v5 = a3;
  uint64_t v6 = (char *)self + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  v6[5] = a3;
}

- (BOOL)copySourceOnlyDebugging
{
  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  swift_beginAccess();
  return *v2;
}

- (void)setCopySourceOnlyDebugging:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  swift_beginAccess();
  BOOL *v5 = a3;
  uint64_t v6 = (char *)self + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  v6[7] = a3;
}

- (SwiftVideoProcessor)init
{
  return (SwiftVideoProcessor *)VideoProcessor.init()();
}

- (void)processSurfaceWithSourceSurface:(__IOSurface *)a3 timestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6
{
  v10 = a3;
  v11 = a5;
  id v12 = a6;
  v13 = self;
  VideoProcessor.processSurface(sourceSurface:timestamp:destinationSurface:options:)(v10, a4, v11, (NSDictionary)v12);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SwiftVideoProcessor_validationCallback);

  sub_259DAD3BC(v3);
}

@end
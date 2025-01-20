@interface UIDeduplicatorCompat
- (UIDeduplicatorCompat)init;
- (UIDeduplicatorCompat)initWithPlatform:(int64_t)a3 error:(id *)a4;
- (UIDeduplicatorCompat)initWithShape:(int64_t)a3 error:(id *)a4;
- (id)addElementsForScreenWithTargetScreenshot:(id)a3 candidateElements:(id)a4 screenGroupID:(id)a5 error:(id *)a6;
- (id)identifyElementsWithScreenshot:(id)a3 rectArray:(id)a4 error:(id *)a5;
- (id)identifyScreenshotWithId:(id)a3 image:(CGImage *)a4 error:(id *)a5;
- (void)setDebugTo:(BOOL)a3;
@end

@implementation UIDeduplicatorCompat

- (id)identifyElementsWithScreenshot:(id)a3 rectArray:(id)a4 error:(id *)a5
{
  type metadata accessor for CGRect(0);
  uint64_t v7 = sub_260655938();
  id v8 = a3;
  v9 = self;
  sub_260612664((uint64_t)v8, v7);
  swift_bridgeObjectRelease();

  type metadata accessor for DedupeElement();
  v10 = (void *)sub_260655928();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)addElementsForScreenWithTargetScreenshot:(id)a3 candidateElements:(id)a4 screenGroupID:(id)a5 error:(id *)a6
{
  type metadata accessor for DedupeElement();
  unint64_t v9 = sub_260655938();
  if (a5) {
    sub_2606557B8();
  }
  v10 = (char *)a3;
  v11 = self;
  v12 = sub_2606159E4(v10, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (UIDeduplicatorCompat)initWithShape:(int64_t)a3 error:(id *)a4
{
  return (UIDeduplicatorCompat *)sub_260614134((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))UIDeduplicator.init(shape:));
}

- (UIDeduplicatorCompat)initWithPlatform:(int64_t)a3 error:(id *)a4
{
  return (UIDeduplicatorCompat *)sub_260614134((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))UIDeduplicator.init(platform:));
}

- (void)setDebugTo:(BOOL)a3
{
  v4 = self;
  sub_2606141B4(a3);
}

- (id)identifyScreenshotWithId:(id)a3 image:(CGImage *)a4 error:(id *)a5
{
  uint64_t v7 = sub_2606557B8();
  uint64_t v9 = v8;
  v10 = a4;
  v11 = self;
  v12 = (void *)sub_2606144BC(v7, v9, v10);
  swift_bridgeObjectRelease();

  return v12;
}

- (UIDeduplicatorCompat)init
{
  result = (UIDeduplicatorCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___UIDeduplicatorCompat_log;
  uint64_t v3 = sub_260655518();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_release();
}

@end
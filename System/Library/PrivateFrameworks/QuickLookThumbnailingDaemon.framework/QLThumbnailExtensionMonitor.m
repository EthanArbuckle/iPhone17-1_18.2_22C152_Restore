@interface QLThumbnailExtensionMonitor
+ (QLThumbnailExtensionMonitor)shared;
+ (void)setShared:(id)a3;
- (BOOL)canGenerateThumbnailWith:(id)a3 at:(CGSize)a4;
- (QLThumbnailExtensionMonitor)init;
- (id)bestExtensionFor:(id)a3 matching:(int64_t)a4;
- (id)bestExtensionFor:(id)a3 shouldUseRestrictedExtension:(BOOL)a4 matching:(int64_t)a5;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
@end

@implementation QLThumbnailExtensionMonitor

+ (QLThumbnailExtensionMonitor)shared
{
  if (qword_1EBE9E680 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (QLThumbnailExtensionMonitor *)(id)qword_1EBE9E3F0;
}

- (id)bestExtensionFor:(id)a3 matching:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1DDC6A7E4(v6, a4);

  return v8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1EBE9E680;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1EBE9E3F0;
  qword_1EBE9E3F0 = (uint64_t)v4;
}

- (QLThumbnailExtensionMonitor)init
{
  return (QLThumbnailExtensionMonitor *)ThumbnailExtensionMonitor.init()();
}

- (BOOL)canGenerateThumbnailWith:(id)a3 at:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v8 = sub_1DDCB4A40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  v13 = self;
  sub_1DDCB49D0();

  double v14 = COERCE_DOUBLE(sub_1DDCA47C0((uint64_t)v11));
  LOBYTE(v12) = v15;

  if (v12) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = width == 0.0 && height == 0.0 || width >= v14 && height >= v14;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)bestExtensionFor:(id)a3 shouldUseRestrictedExtension:(BOOL)a4 matching:(int64_t)a5
{
  uint64_t v9 = sub_1DDCB4A40();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  double v14 = self;
  sub_1DDCB49D0();

  char v15 = (void *)sub_1DDCA4AC0((uint64_t)v12, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE9E578);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DDCA2014(0, &qword_1EBE9E4E0);
  sub_1DDCB4EB0();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1DDCA4D34(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
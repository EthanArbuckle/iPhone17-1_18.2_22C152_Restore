@interface PXWallpaperTipsHelper_Swift
+ (PXWallpaperTipsHelper_Swift)shared;
+ (void)dismissTip:(id)a3;
+ (void)presentFailedSettlingEffectTip:(id)a3;
+ (void)presentTrySettlingEffectTip:(id)a3;
+ (void)removeAllPresentationDelegates;
+ (void)startObservingTips;
- (PXWallpaperTipsHelper_Swift)init;
@end

@implementation PXWallpaperTipsHelper_Swift

+ (PXWallpaperTipsHelper_Swift)shared
{
  if (qword_1E989CE30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E989CE38;
  return (PXWallpaperTipsHelper_Swift *)v2;
}

+ (void)removeAllPresentationDelegates
{
  v2 = sub_1AA568020();
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRelease();
    uint64_t *v2 = MEMORY[0x1E4FBC868];
  }
}

+ (void)dismissTip:(id)a3
{
  v3 = (void (**)(void))_Block_copy(a3);
  sub_1AA274E64(v3);
  _Block_release(v3);
}

+ (void)presentTrySettlingEffectTip:(id)a3
{
}

+ (void)presentFailedSettlingEffectTip:(id)a3
{
}

- (PXWallpaperTipsHelper_Swift)init
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_trySettlingEffectTip);
  void *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_failedSettlingEffectTip);
  void *v3 = 0;
  v3[1] = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXWallpaperTipsHelper();
  return [(PXTipsHelper_Swift *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)startObservingTips
{
  sub_1A9CD7A64();
  MEMORY[0x1F4188790](v0 - 8, v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E989CE30 != -1) {
    swift_once();
  }
  if ((*(unsigned char *)(qword_1E989CE38 + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) & 1) == 0)
  {
    *(unsigned char *)(qword_1E989CE38 + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) = 1;
    uint64_t v4 = sub_1AB23AD7C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
    sub_1AB23AD0C();
    uint64_t v5 = sub_1AB23ACFC();
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = MEMORY[0x1E4FBCFD8];
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = v7;
    sub_1A9BF49C0((uint64_t)v3, (uint64_t)&unk_1E982E1A8, v6);
    swift_release();
  }
}

@end
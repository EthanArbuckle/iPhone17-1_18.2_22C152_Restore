@interface BCFrontmostApplicationTracker
- (BCFrontmostApplicationTracker)init;
- (id)onFrontmostChanged;
- (void)appKitDidBecomeActive:(id)a3;
- (void)appKitWillResignActive:(id)a3;
- (void)dealloc;
- (void)screenDidLock:(id)a3;
- (void)screenDidUnlock:(id)a3;
- (void)screenSaverDidStart:(id)a3;
- (void)screenSaverDidStop:(id)a3;
- (void)setOnFrontmostChanged:(id)a3;
- (void)uiKitDidBecomeActive:(id)a3;
- (void)uiKitDidEnterBackground:(id)a3;
- (void)uiKitWillEnterForeground:(id)a3;
- (void)uiKitWillResignActive:(id)a3;
- (void)workspaceDidWake:(id)a3;
- (void)workspaceWillSleep:(id)a3;
@end

@implementation BCFrontmostApplicationTracker

- (id)onFrontmostChanged
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD3AC;
    aBlock[3] = &unk_2CDA50;
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

- (void)setOnFrontmostChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1DFB10;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A1B64(v7);
}

- (void)dealloc
{
  v2 = self;
  FrontmostApplicationTracker.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCFrontmostApplicationTracker_onFrontmostChanged);

  sub_1A1B64(v3);
}

- (BCFrontmostApplicationTracker)init
{
  result = (BCFrontmostApplicationTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)uiKitWillEnterForeground:(id)a3
{
}

- (void)uiKitDidEnterBackground:(id)a3
{
}

- (void)uiKitWillResignActive:(id)a3
{
}

- (void)uiKitDidBecomeActive:(id)a3
{
}

- (void)appKitDidBecomeActive:(id)a3
{
}

- (void)appKitWillResignActive:(id)a3
{
}

- (void)screenDidLock:(id)a3
{
}

- (void)screenDidUnlock:(id)a3
{
}

- (void)screenSaverDidStart:(id)a3
{
}

- (void)screenSaverDidStop:(id)a3
{
}

- (void)workspaceWillSleep:(id)a3
{
}

- (void)workspaceDidWake:(id)a3
{
}

@end
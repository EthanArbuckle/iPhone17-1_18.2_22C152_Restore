@interface BKAppLifecycleObserver
- (BKAppLifecycleObserver)init;
- (BKAppLifecycleObserver)initWithCoordinator:(id)a3;
- (BKAppLifecycleObserver)initWithCoordinator:(id)a3 uiApplication:(id)a4 appKitBundle:(Class)a5;
- (id)onDidBecomeActive;
- (id)onDidBecomeFrontmost;
- (id)onDidEnterBackground;
- (id)onWillEnterForeground;
- (id)onWillResignActive;
- (id)onWillResignFrontmost;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)setOnDidBecomeActive:(id)a3;
- (void)setOnDidBecomeFrontmost:(id)a3;
- (void)setOnDidEnterBackground:(id)a3;
- (void)setOnWillEnterForeground:(id)a3;
- (void)setOnWillResignActive:(id)a3;
- (void)setOnWillResignFrontmost:(id)a3;
@end

@implementation BKAppLifecycleObserver

- (void)setOnDidBecomeActive:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051630;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (void)setOnWillEnterForeground:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051630;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (void)setOnDidBecomeFrontmost:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051630;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (void)setOnDidEnterBackground:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051630;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (void)setOnWillResignFrontmost:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10005163C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (void)setOnWillResignActive:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051630;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (BKAppLifecycleObserver)initWithCoordinator:(id)a3 uiApplication:(id)a4 appKitBundle:(Class)a5
{
  if (a5) {
    swift_getObjCClassMetadata();
  }
  swift_unknownObjectRetain();
  return (BKAppLifecycleObserver *)sub_10002BA34((uint64_t)a3, a4);
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (BKAppLifecycleObserver)initWithCoordinator:(id)a3
{
  return (BKAppLifecycleObserver *)AppLifecycleObserver.init(coordinator:)((uint64_t)a3);
}

- (id)onWillEnterForeground
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground, (uint64_t)&unk_100A6A140);
}

- (id)onDidEnterBackground
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground, (uint64_t)&unk_100A6A0F0);
}

- (id)onWillResignActive
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive, (uint64_t)&unk_100A6A0A0);
}

- (id)onDidBecomeActive
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive, (uint64_t)&unk_100A6A050);
}

- (id)onDidBecomeFrontmost
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost, (uint64_t)&unk_100A6A000);
}

- (id)onWillResignFrontmost
{
  return sub_1006C7A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost, (uint64_t)&unk_100A69FB0);
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AppLifecycleObserver();
  [(BKAppLifecycleObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillEnterForeground));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidEnterBackground));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillResignActive));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeActive));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onDidBecomeFrontmost));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppLifecycleObserver_onWillResignFrontmost);

  sub_10003E138(v3);
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (void)applicationWillResignActive:(id)a3
{
}

- (BKAppLifecycleObserver)init
{
  result = (BKAppLifecycleObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
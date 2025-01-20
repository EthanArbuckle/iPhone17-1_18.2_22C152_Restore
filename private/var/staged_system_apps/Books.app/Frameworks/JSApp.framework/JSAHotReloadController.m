@interface JSAHotReloadController
+ (JSAHotReloadController)sharedController;
- (BOOL)isHotReloading;
- (JSAHotReloadController)init;
- (void)startWithCompletion:(id)a3;
- (void)stopWithCompletion:(id)a3;
- (void)subscribe:(id)a3;
- (void)unsubscribe:(id)a3;
@end

@implementation JSAHotReloadController

+ (JSAHotReloadController)sharedController
{
  if (qword_CC420 != -1) {
    swift_once();
  }
  v2 = (void *)qword_CC428;

  return (JSAHotReloadController *)v2;
}

- (BOOL)isHotReloading
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_hotReloadCount);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_2D594(v3, &v7);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v7;

  return (char)v3;
}

- (JSAHotReloadController)init
{
  return (JSAHotReloadController *)HotReloadController.init()();
}

- (void)startWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    BOOL v7 = sub_33464;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_2D9F4((uint64_t)v7, v6);
  sub_31BA8((uint64_t)v7);
}

- (void)stopWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    BOOL v7 = sub_31BF0;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_2DDD4((uint64_t)v7, v6);
  sub_31BA8((uint64_t)v7);
}

- (void)subscribe:(id)a3
{
}

- (void)unsubscribe:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAHotReloadController_subscriberQueue);
}

@end
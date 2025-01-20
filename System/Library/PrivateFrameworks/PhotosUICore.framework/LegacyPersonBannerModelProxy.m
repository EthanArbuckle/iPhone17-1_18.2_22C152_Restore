@interface LegacyPersonBannerModelProxy
- (BOOL)canPresentPopovers;
- (BOOL)canPushViewController;
- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4;
- (UIViewController)presentingViewController;
- (_TtC12PhotosUICore28LegacyPersonBannerModelProxy)init;
- (id)presentAlertWithConfigurationHandler:(id)a3;
- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation LegacyPersonBannerModelProxy

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v14 = sub_1AA66645C;
  }
  else
  {
    v14 = 0;
  }
  v8 = (char *)self + OBJC_IVAR____TtC12PhotosUICore28LegacyPersonBannerModelProxy_model;
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v9 = *((void *)v8 + 1);
  uint64_t ObjectType = swift_getObjectType();
  v11 = *(void (**)(id, uint64_t, uint64_t))(v9 + 16);
  id v12 = a3;
  v15 = self;
  v11(a3, ObjectType, v9);
  uint64_t v13 = swift_unknownObjectRelease();
  if (v7)
  {
    ((void (*)(uint64_t))v14)(v13);
    sub_1A9BB8934((uint64_t)v14);
  }
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  v7 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = (uint64_t (*)(uint64_t))sub_1AA24EFF8;
  }
  id v8 = a3;
  uint64_t v9 = self;
  sub_1AA6661B0(v8, v7);
  sub_1A9BB8934((uint64_t)v7);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)0;
}

- (BOOL)canPushViewController
{
  return 0;
}

- (BOOL)canPresentPopovers
{
  return 0;
}

- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL result = sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL result = sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  _Block_copy(a3);
  id result = (id)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
}

- (_TtC12PhotosUICore28LegacyPersonBannerModelProxy)init
{
  id result = (_TtC12PhotosUICore28LegacyPersonBannerModelProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
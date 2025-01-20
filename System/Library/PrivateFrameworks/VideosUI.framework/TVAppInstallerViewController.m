@interface TVAppInstallerViewController
- (_TtC8VideosUI28TVAppInstallerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI28TVAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6;
@end

@implementation TVAppInstallerViewController

- (_TtC8VideosUI28TVAppInstallerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32DCB94();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1E32DE85C();

  return v6;
}

- (_TtC8VideosUI28TVAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E32DE970();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController_appInfo);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController_appInstallerHelper));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController____lazy_storage___titleLabel);
}

- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_1E32DEB04((uint64_t)v11, (uint64_t)a4, (uint64_t)v12, (uint64_t)v13, (void (**)(void, void))v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
}

@end
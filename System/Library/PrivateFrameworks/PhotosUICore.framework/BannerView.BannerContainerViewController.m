@interface BannerView.BannerContainerViewController
- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithCoder:(id)a3;
- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation BannerView.BannerContainerViewController

- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithCoder:(id)a3
{
  result = (_TtCV12PhotosUICore10BannerView29BannerContainerViewController *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AA2166B4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AA2168A8();
}

- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5
{
  v8 = (void (**)(void *, id, void))_Block_copy(a5);
  if (a4) {
    sub_1AB23A76C();
  }
  id v9 = a3;
  v10 = self;
  id v11 = PXPresentationEnvironmentForSender(v10);
  v8[2](v8, v11, 0);
  swift_unknownObjectRelease();
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCV12PhotosUICore10BannerView29BannerContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtCV12PhotosUICore10BannerView29BannerContainerViewController_representable);
  swift_release();
  swift_release();
}

@end
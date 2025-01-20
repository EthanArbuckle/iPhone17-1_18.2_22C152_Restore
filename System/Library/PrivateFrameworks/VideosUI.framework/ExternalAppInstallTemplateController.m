@interface ExternalAppInstallTemplateController
- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidAppear:(BOOL)a3;
@end

@implementation ExternalAppInstallTemplateController

- (void)vui_viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3808474(a3);
}

- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI36ExternalAppInstallTemplateController *)sub_1E3808630(v5, v7, a4);
}

- (_TtC8VideosUI36ExternalAppInstallTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI36ExternalAppInstallTemplateController *)sub_1E380871C(a3);
}

- (void).cxx_destruct
{
  sub_1E2BEA314((uint64_t)self + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_appInfo, &qword_1EADFA080);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_appInstallerVC));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI36ExternalAppInstallTemplateController_installerHelper);
}

@end
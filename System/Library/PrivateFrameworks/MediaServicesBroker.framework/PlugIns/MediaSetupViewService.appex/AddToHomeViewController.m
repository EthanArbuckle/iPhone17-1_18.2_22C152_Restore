@interface AddToHomeViewController
- (void)selectAddToHomes;
@end

@implementation AddToHomeViewController

- (void)selectAddToHomes
{
  v2 = *(void **)(*(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController]
                + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  if (v2)
  {
    memset(v6, 0, sizeof(v6));
    char v3 = self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService23AddToHomeViewController_trigger];
    v4 = self;
    id v5 = v2;
    sub_10000617C(v3, v6);
  }
}

@end
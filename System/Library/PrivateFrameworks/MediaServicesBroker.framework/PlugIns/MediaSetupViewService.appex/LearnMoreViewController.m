@interface LearnMoreViewController
- (void)selectLearnMore;
@end

@implementation LearnMoreViewController

- (void)selectLearnMore
{
  v2 = *(void **)(*(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController]
                + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  if (v2)
  {
    memset(v5, 0, sizeof(v5));
    v3 = self;
    id v4 = v2;
    sub_10000617C(5, v5);
  }
}

@end
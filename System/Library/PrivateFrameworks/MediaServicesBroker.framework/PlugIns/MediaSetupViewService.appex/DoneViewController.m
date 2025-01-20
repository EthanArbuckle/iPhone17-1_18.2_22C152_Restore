@interface DoneViewController
- (void)requestDismiss;
@end

@implementation DoneViewController

- (void)requestDismiss
{
  v2 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController];
  v3 = self;
  id v4 = v2;
  sub_100013D0C(0);
}

@end
@interface FRExplicitContentRestrictionAlertPresenter
- (FRExplicitContentRestrictionAlertPresenter)init;
- (void)presentExplicitContentRestrictionAlertWithPresentingViewController:(id)a3;
@end

@implementation FRExplicitContentRestrictionAlertPresenter

- (FRExplicitContentRestrictionAlertPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRExplicitContentRestrictionAlertPresenter;
  return [(FRExplicitContentRestrictionAlertPresenter *)&v3 init];
}

- (void)presentExplicitContentRestrictionAlertWithPresentingViewController:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F108;
  block[3] = &unk_1000C5680;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end
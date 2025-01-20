@interface TUIOBUpdateDevicesViewModel
- (TUIOBUpdateDevicesViewModel)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4;
- (UIViewController)contentViewController;
- (int64_t)contentViewLayout;
- (void)setContentViewController:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
@end

@implementation TUIOBUpdateDevicesViewModel

- (TUIOBUpdateDevicesViewModel)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIOBUpdateDevicesViewModel;
  v8 = [(TUIUpdateDevicesModel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(TUIUpdateDevicesModel *)v8 setDevicesWithIssuesIdentifiers:v7];
    v9->_contentViewLayout = 2;
    v10 = [[TUIDevicesWithIssuesViewController alloc] initWithAccountManager:v6 devicesWithIssuesIdentifiers:v7];
    contentViewController = v9->_contentViewController;
    v9->_contentViewController = &v10->super.super.super;
  }
  return v9;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
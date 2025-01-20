@interface TUIOBWelcomeScreenViewModel
- (TUIOBWelcomeScreenViewModel)init;
- (UIViewController)contentViewController;
- (int64_t)contentViewLayout;
- (void)setContentViewController:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
@end

@implementation TUIOBWelcomeScreenViewModel

- (TUIOBWelcomeScreenViewModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIOBWelcomeScreenViewModel;
  result = [(TUIWelcomeSplashScreenModel *)&v3 init];
  if (result) {
    result->_contentViewLayout = 2;
  }
  return result;
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
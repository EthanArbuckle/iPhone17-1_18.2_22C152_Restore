@interface TUIOBMissingAppleIDViewModel
- (TUIOBMissingAppleIDViewModel)initWithFlow:(unint64_t)a3;
- (UIViewController)contentViewController;
- (int64_t)contentViewLayout;
- (void)setContentViewController:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
@end

@implementation TUIOBMissingAppleIDViewModel

- (TUIOBMissingAppleIDViewModel)initWithFlow:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIOBMissingAppleIDViewModel;
  result = [(TUIMissingAppleIDModel *)&v4 initWithFlow:a3];
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
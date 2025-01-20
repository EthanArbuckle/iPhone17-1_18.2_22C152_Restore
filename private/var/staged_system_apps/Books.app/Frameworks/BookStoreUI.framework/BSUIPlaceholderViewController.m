@interface BSUIPlaceholderViewController
- (CGSize)expectedContentSize;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
@end

@implementation BSUIPlaceholderViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIPlaceholderViewController;
  [(BSUIPlaceholderViewController *)&v4 viewDidLoad];
  v3 = +[UIContentUnavailableConfiguration loadingConfiguration];
  [(BSUIPlaceholderViewController *)self setContentUnavailableConfiguration:v3];

  [(BSUIPlaceholderViewController *)self bc_setNavBarVisible:1];
}

- (CGSize)expectedContentSize
{
  v3 = [(BSUIPlaceholderViewController *)self view];
  [v3 frame];
  double v5 = v4;

  v6 = [(BSUIPlaceholderViewController *)self view];
  [v6 sizeThatFits:v5 3.40282347e38];
  double v8 = v7;

  double v9 = v8 + 32.0;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

@end
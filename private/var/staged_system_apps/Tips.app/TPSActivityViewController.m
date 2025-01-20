@interface TPSActivityViewController
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation TPSActivityViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom]) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

@end
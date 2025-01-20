@interface ViewController
- (void)caDisplayLinkCallback;
- (void)showDebugController;
@end

@implementation ViewController

- (void)showDebugController
{
  uint64_t v2 = qword_1004C29D8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (void *)xmmword_1004F7FD0;
  if ((void)xmmword_1004F7FD0)
  {
    id v5 = objc_allocWithZone((Class)UINavigationController);
    id v6 = v4;
    id v7 = [v5 initWithRootViewController:v6];
    [v7 setModalPresentationStyle:-2];
    [(ViewController *)v3 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    __break(1u);
  }
}

- (void)caDisplayLinkCallback
{
  uint64_t v2 = self;
  sub_100209704();
}

@end
@interface ChromeControl
- (_TtC12NewsArticles13ChromeControl)init;
- (void)prefersChromeHidden:(BOOL)a3 fromViewController:(id)a4;
@end

@implementation ChromeControl

- (void)prefersChromeHidden:(BOOL)a3 fromViewController:(id)a4
{
  v6 = (UIViewController *)a4;
  v7 = self;
  ChromeControl.prefersChromeHidden(_:from:)(a3, v6);
}

- (_TtC12NewsArticles13ChromeControl)init
{
  result = (_TtC12NewsArticles13ChromeControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface PrintableHTMLContentController
- (_TtC7Journal30PrintableHTMLContentController)init;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PrintableHTMLContentController

- (_TtC7Journal30PrintableHTMLContentController)init
{
  return (_TtC7Journal30PrintableHTMLContentController *)sub_10022AFFC();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022C2BC(v6);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal30PrintableHTMLContentController_continuation;

  sub_10022C548((uint64_t)v3);
}

@end
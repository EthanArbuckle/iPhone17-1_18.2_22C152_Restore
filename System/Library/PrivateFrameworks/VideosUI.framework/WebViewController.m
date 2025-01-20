@interface WebViewController
- (_TtC8VideosUI17WebViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI17WebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)backTapped;
- (void)doneTapped;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation WebViewController

- (_TtC8VideosUI17WebViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E33070F0();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3307184();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3307750();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  OUTLINED_FUNCTION_81();
  sub_1E33078C0();
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  OUTLINED_FUNCTION_81();
  sub_1E330796C();
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1E33078C0();
}

- (_TtC8VideosUI17WebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3307A74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17WebViewController_activityIndicator));

  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI17WebViewController_url;
  uint64_t v4 = sub_1E38760D8();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)doneTapped
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3307C38();
}

- (void)backTapped
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3307C94();
}

@end
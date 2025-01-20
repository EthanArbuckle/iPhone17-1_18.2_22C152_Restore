@interface ICWKWebViewDebuggingViewController
- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4;
- (WKWebView)webView;
- (void)dismiss:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation ICWKWebViewDebuggingViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ICWKWebViewDebuggingViewController;
  [(ICWKWebViewDebuggingViewController *)&v10 viewDidLoad];
  v3 = [(ICWKWebViewDebuggingViewController *)self webView];
  [v3 setNavigationDelegate:self];

  v4 = [(ICWKWebViewDebuggingViewController *)self webView];
  [v4 _setInputDelegate:self];

  v5 = [(ICWKWebViewDebuggingViewController *)self webView];
  [v5 _setEditable:1];

  v6 = [(ICWKWebViewDebuggingViewController *)self webView];
  v7 = +[NoteHTMLEditorView baseHTMLString];
  id v8 = [v6 loadHTMLString:v7 baseURL:0];

  v9 = [(ICWKWebViewDebuggingViewController *)self navigationItem];
  [v9 setTitle:@"WKWebView"];
}

- (void)dismiss:(id)a3
{
  id v4 = [(ICWKWebViewDebuggingViewController *)self navigationController];
  v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v4 = [(ICWKWebViewDebuggingViewController *)self webView];
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_10009DE60;
  id v8 = &unk_100627C88;
  v9 = @"var editor = document.getElementById('editor')\neditor.setAttribute('contentEditable', true);\neditor.focus();\n";
  [v4 evaluateJavaScript:];
}

- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4
{
  return 1;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
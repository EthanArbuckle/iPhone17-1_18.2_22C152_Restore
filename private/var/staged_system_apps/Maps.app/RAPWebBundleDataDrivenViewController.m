@interface RAPWebBundleDataDrivenViewController
- (RAPWebBundleDataDrivenViewController)initWithEntryPoint:(id)a3 report:(id)a4 title:(id)a5 data:(id)a6 replyHandler:(id)a7;
- (void)_dismiss;
- (void)_submit;
- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5;
- (void)dismissModal;
- (void)setupViews;
- (void)viewDidLoad;
@end

@implementation RAPWebBundleDataDrivenViewController

- (RAPWebBundleDataDrivenViewController)initWithEntryPoint:(id)a3 report:(id)a4 title:(id)a5 data:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RAPWebBundleDataDrivenViewController;
  v16 = [(RAPWebBundleBaseViewController *)&v21 initWithReport:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_data, a6);
    objc_storeStrong((id *)&v17->_title, a5);
    id v18 = objc_retainBlock(v15);
    id replyHandler = v17->_replyHandler;
    v17->_id replyHandler = v18;

    [(RAPWebBundleBaseViewController *)v17 setEntryPointString:v12];
  }

  return v17;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleDataDrivenViewController;
  [(RAPWebBundleBaseViewController *)&v3 viewDidLoad];
  [(RAPWebBundleBaseViewController *)self loadWebView];
}

- (void)dismissModal
{
  if (sub_1000BBB44(self) == 5)
  {
    id v4 = [(RAPWebBundleDataDrivenViewController *)self navigationController];
    id v3 = [v4 popViewControllerAnimated:1];
  }
  else
  {
    id v4 = [(RAPWebBundleDataDrivenViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_dismiss
{
  id replyHandler = (void (**)(id, void *, void))self->_replyHandler;
  id v4 = +[NSNull null];
  replyHandler[2](replyHandler, v4, 0);

  [(RAPWebBundleDataDrivenViewController *)self dismissModal];
}

- (void)_submit
{
  objc_initWeak(&location, self);
  id v3 = [(RAPWebBundleBaseViewController *)self webView];
  id v4 = +[WKContentWorld pageWorld];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008BF7F4;
  v5[3] = &unk_1012FF668;
  objc_copyWeak(&v6, &location);
  [v3 callAsyncJavaScript:@"return rapGetModalData()" arguments:0 inFrame:0 inContentWorld:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setupViews
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismiss"];
  id v4 = [(RAPWebBundleDataDrivenViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"[RAP Web UI] Data Driven Done" value:@"localized string not found" table:0];
  id v8 = [v5 initWithTitle:v7 style:2 target:self action:"_submit"];
  v9 = [(RAPWebBundleDataDrivenViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  title = self->_title;
  v11 = [(RAPWebBundleDataDrivenViewController *)self navigationItem];
  [v11 setTitle:title];

  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleDataDrivenViewController;
  [(RAPWebBundleBaseViewController *)&v12 setupViews];
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, id, void))a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPWebBundleDataDrivenViewController;
  [(RAPWebBundleBaseViewController *)&v17 didReceiveMessageFromUserContentController:a3 message:v8 replyHandler:v9];
  v10 = [v8 objectForKeyedSubscript:@"name"];
  unsigned int v11 = [v10 isEqualToString:@"context"];

  if (v11)
  {
    objc_super v12 = [v8 objectForKeyedSubscript:@"supportedLocales"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = +[NSArray array];

      objc_super v12 = (void *)v13;
    }
    id v14 = [[RAPWebBundleBaseContext alloc] initWithType:&stru_101324E70 locales:v12];
    id v15 = [(RAPWebBundleBaseContext *)v14 context];
    id v16 = [v15 mutableCopy];

    [v16 setObject:self->_data forKeyedSubscript:@"modalData"];
    v9[2](v9, v16, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong(&self->_data, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
@interface MapsDebugFileExportController
- (MapsDebugFileExportController)initWithFileAtURL:(id)a3 presentingViewController:(id)a4;
- (void)startWithCompletion:(id)a3;
@end

@implementation MapsDebugFileExportController

- (MapsDebugFileExportController)initWithFileAtURL:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapsDebugFileExportController;
  v8 = [(MapsDebugFileExportController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_presentingViewController, a4);
    id v10 = objc_alloc((Class)UIActivityViewController);
    id v18 = v6;
    v11 = +[NSArray arrayWithObjects:&v18 count:1];
    v12 = (UIActivityViewController *)[v10 initWithActivityItems:v11 applicationActivities:0];
    viewController = v9->_viewController;
    v9->_viewController = v12;

    v17[0] = UIActivityTypePostToFacebook;
    v17[1] = UIActivityTypePostToWeibo;
    v17[2] = UIActivityTypePostToFlickr;
    v17[3] = UIActivityTypePostToVimeo;
    v17[4] = UIActivityTypePostToTencentWeibo;
    v14 = +[NSArray arrayWithObjects:v17 count:5];
    [(UIActivityViewController *)v9->_viewController setExcludedActivityTypes:v14];
  }
  return v9;
}

- (void)startWithCompletion:(id)a3
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100C07464;
  v18[3] = &unk_1012F3C30;
  id v19 = a3;
  viewController = self->_viewController;
  id v5 = v19;
  [(UIActivityViewController *)viewController setCompletionWithItemsHandler:v18];
  id v6 = [(UIViewController *)self->_presentingViewController view];
  id v7 = [(UIActivityViewController *)self->_viewController popoverPresentationController];
  [v7 setSourceView:v6];

  v8 = [(UIViewController *)self->_presentingViewController view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(UIActivityViewController *)self->_viewController popoverPresentationController];
  [v17 setSourceRect:v10, v12, v14, v16];

  [(UIViewController *)self->_presentingViewController presentViewController:self->_viewController animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
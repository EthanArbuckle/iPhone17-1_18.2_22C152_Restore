@interface ICExportArchiveController
- (CGRect)sourceRect;
- (ICArchiveExporter)archiveExporter;
- (ICLongRunningTaskController)taskController;
- (UIBarButtonItem)barButtonItem;
- (UIView)sourceView;
- (UIViewController)viewController;
- (id)initForPresentingInViewController:(id)a3;
- (void)exportObjects:(id)a3 completion:(id)a4;
- (void)setArchiveExporter:(id)a3;
- (void)setBarButtonItem:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setTaskController:(id)a3;
- (void)setViewController:(id)a3;
- (void)showResultForArchiveURL:(id)a3 andError:(id)a4;
@end

@implementation ICExportArchiveController

- (id)initForPresentingInViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICExportArchiveController;
  v6 = [(ICExportArchiveController *)&v12 init];
  if (v6)
  {
    v7 = objc_alloc_init(ICArchiveExporter);
    archiveExporter = v6->_archiveExporter;
    v6->_archiveExporter = v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
    v9 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
    taskController = v6->_taskController;
    v6->_taskController = v9;

    [(ICLongRunningTaskController *)v6->_taskController setShouldShowCancelButton:1];
    [(ICLongRunningTaskController *)v6->_taskController setAllowSingleUnitProgress:1];
    [(ICLongRunningTaskController *)v6->_taskController setProgressStringBlock:&stru_1006297F0];
    [(ICLongRunningTaskController *)v6->_taskController setShouldShowCircularProgress:1];
    [(ICLongRunningTaskController *)v6->_taskController setViewControllerToPresentFrom:v5];
  }

  return v6;
}

- (void)exportObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000E5364;
  v21[4] = sub_1000E5374;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000E5364;
  v19[4] = sub_1000E5374;
  id v20 = 0;
  v8 = [(ICExportArchiveController *)self taskController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E537C;
  v15[3] = &unk_100629818;
  v17 = v21;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  v18 = v19;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E5420;
  v11[3] = &unk_100629840;
  v11[4] = self;
  v13 = v21;
  v14 = v19;
  id v10 = v7;
  id v12 = v10;
  [v8 startTask:v15 completionBlock:v11];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

- (void)showResultForArchiveURL:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc((Class)UIActivityViewController);
    id v33 = v6;
    id v9 = +[NSArray arrayWithObjects:&v33 count:1];
    id v10 = [v8 initWithActivityItems:v9 applicationActivities:0];

    v32[0] = UIActivityTypeOpenInIBooks;
    v32[1] = ICActivityTypeShareToNote;
    v32[2] = UIActivityTypeSharePlay;
    v11 = +[NSArray arrayWithObjects:v32 count:3];
    [v10 setExcludedActivityTypes:v11];

    id v12 = [(ICExportArchiveController *)self barButtonItem];
    v13 = [v10 popoverPresentationController];
    [v13 setBarButtonItem:v12];

    v14 = [(ICExportArchiveController *)self sourceView];
    v15 = [v10 popoverPresentationController];
    [v15 setSourceView:v14];

    [(ICExportArchiveController *)self sourceRect];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [v10 popoverPresentationController];
    [v24 setSourceRect:v17, v19, v21, v23];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000E5788;
    v30[3] = &unk_100629868;
    v30[4] = self;
    id v31 = v6;
    [v10 setCompletionWithItemsHandler:v30];
    v25 = [(ICExportArchiveController *)self viewController];
    [v25 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"Error Creating Archive" value:&stru_10063F3D8 table:0];
    v28 = [v7 localizedDescription];
    v29 = [(ICExportArchiveController *)self viewController];
    +[UIAlertController ic_showAlertWithTitle:v27 message:v28 viewController:v29];
  }
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (ICArchiveExporter)archiveExporter
{
  return self->_archiveExporter;
}

- (void)setArchiveExporter:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (ICLongRunningTaskController)taskController
{
  return self->_taskController;
}

- (void)setTaskController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_archiveExporter, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);

  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end
@interface ICExportArchiveActivity
- (ICExportArchiveActivity)initWithObjects:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6;
- (NSArray)objects;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
@end

@implementation ICExportArchiveActivity

- (ICExportArchiveActivity)initWithObjects:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICExportArchiveActivity;
  v15 = [(ICExportArchiveActivity *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objects, a3);
    objc_storeWeak((id *)&v16->_presentingViewController, v12);
    objc_storeStrong((id *)&v16->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v16->_presentingSourceView, a6);
  }

  return v16;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Export Archive" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"square.and.arrow.up.on.square"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.exportArchive";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICExportArchiveActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [ICExportArchiveController alloc];
    v7 = [(ICExportArchiveActivity *)self presentingViewController];
    id v8 = [(ICExportArchiveController *)v6 initForPresentingInViewController:v7];

    v9 = [(ICExportArchiveActivity *)self presentingBarButtonItem];
    if (v9)
    {
      [v8 setBarButtonItem:v9];
    }
    else
    {
      objc_opt_class();
      id v11 = [(ICExportArchiveActivity *)self presentationSourceItem];
      id v12 = ICDynamicCast();
      [v8 setBarButtonItem:v12];
    }
    id v13 = [(ICExportArchiveActivity *)self presentingSourceView];
    [v8 setSourceView:v13];

    id v14 = [(ICExportArchiveActivity *)self presentingSourceView];
    [v14 bounds];
    [v8 setSourceRect:];

    v15 = [(ICExportArchiveActivity *)self objects];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A5EF8;
    v16[3] = &unk_100627F30;
    v16[4] = self;
    id v17 = v4;
    [v8 exportObjects:v15 completion:v16];
  }
  else
  {
    [(ICExportArchiveActivity *)self activityDidFinish:0];
    if (v4)
    {
      v10 = [(ICExportArchiveActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
    }
  }
}

- (NSArray)objects
{
  return self->_objects;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end
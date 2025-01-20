@interface ICChangeNoteDatesActivity
- (ICChangeNoteDatesActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5;
- (ICNote)note;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICChangeNoteDatesActivity

- (ICChangeNoteDatesActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICChangeNoteDatesActivity;
  v12 = [(ICChangeNoteDatesActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_presentingBarButtonItem, a5);
  }

  return v13;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"calendar.badge.clock"];
}

- (id)activityTitle
{
  return @"Change Dates";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.changeDates";
}

- (id)activityViewController
{
  v3 = +[UIAlertController alertControllerWithTitle:@"Change Dates" message:@"Change Modification Date or Creation Date" preferredStyle:0];
  id v4 = objc_alloc_init((Class)UIView);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = objc_alloc_init((Class)UIDatePicker);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setDatePickerMode:2];
  [v5 setPreferredDatePickerStyle:3];
  [v4 addSubview:v5];
  [v5 ic_addAnchorsToFillSuperview];
  id v6 = objc_alloc_init((Class)UIViewController);
  [v6 setView:v4];
  [v3 setContentViewController:v6];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006A890;
  v16[3] = &unk_100626A98;
  v16[4] = self;
  id v7 = v5;
  id v17 = v7;
  v8 = +[UIAlertAction actionWithTitle:@"Set Modification Date" style:0 handler:v16];
  [v3 addAction:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006A94C;
  v14[3] = &unk_100626A98;
  v14[4] = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = +[UIAlertAction actionWithTitle:@"Set Creation Date" style:0 handler:v14];
  [v3 addAction:v10];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006AA08;
  v13[3] = &unk_100626AC0;
  v13[4] = self;
  id v11 = +[UIAlertAction actionWithTitle:@"Set Both Distant Past" style:2 handler:v13];
  [v3 addAction:v11];

  return v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICChangeNoteDatesActivity *)self presentingViewController];

  if (v5)
  {
    id v6 = [(ICChangeNoteDatesActivity *)self activityViewController];
    id v7 = [(ICChangeNoteDatesActivity *)self presentingViewController];
    v8 = [v7 view];
    id v9 = [v6 popoverPresentationController];
    [v9 setSourceView:v8];

    id v10 = [(ICChangeNoteDatesActivity *)self presentationSourceItem];
    id v11 = [v6 popoverPresentationController];
    [v11 setSourceItem:v10];

    v12 = [(ICChangeNoteDatesActivity *)self presentingViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006AC48;
    v14[3] = &unk_100625B40;
    v14[4] = self;
    id v15 = v4;
    [v12 ic_replacePresentedViewControllerWithViewController:v6 animated:1 completion:v14];
  }
  else
  {
    [(ICChangeNoteDatesActivity *)self activityDidFinish:0];
    if (v4)
    {
      v13 = [(ICChangeNoteDatesActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v13);
    }
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_note, 0);
}

@end
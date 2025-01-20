@interface NTKELoadingWatchFaceViewController
- (NTKELoadingWatchFaceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidLoad;
@end

@implementation NTKELoadingWatchFaceViewController

- (NTKELoadingWatchFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKELoadingWatchFaceViewController;
  v4 = [(NTKELoadingWatchFaceViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(NTKELoadingWatchFaceViewController *)v4 ntke_cancelExtensionBarButton];
    v7 = [(NTKELoadingWatchFaceViewController *)v5 navigationItem];
    [v7 setLeftBarButtonItem:v6];
  }
  return v5;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)NTKELoadingWatchFaceViewController;
  [(NTKELoadingWatchFaceViewController *)&v16 viewDidLoad];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v4 = (void (*)(void))off_100011590;
  v21 = off_100011590;
  if (!off_100011590)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100002E90;
    v17[3] = &unk_10000C348;
    v17[4] = &v18;
    sub_100002E90((uint64_t)v17);
    v4 = (void (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v4)
  {
    sub_1000080B4();
    __break(1u);
  }
  v5 = v4();
  [v3 setTintColor:v5];

  [v3 startAnimating];
  v6 = [(NTKELoadingWatchFaceViewController *)self view];
  [v6 addSubview:v3];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [v3 centerXAnchor];
  v8 = [(NTKELoadingWatchFaceViewController *)self view];
  objc_super v9 = [v8 centerXAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v22[0] = v10;
  v11 = [v3 centerYAnchor];
  v12 = [(NTKELoadingWatchFaceViewController *)self view];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v22[1] = v14;
  v15 = +[NSArray arrayWithObjects:v22 count:2];

  +[NSLayoutConstraint activateConstraints:v15];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

@end
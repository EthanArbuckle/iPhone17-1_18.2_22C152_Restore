@interface MapsIncidentsViewController
- (BOOL)_isValidURLForWebView:(id)a3;
- (CGSize)_calculatePreferredContentSize;
- (void)_updatePreferredContentSize;
- (void)openUrlForAdvisoryNotice:(id)a3;
- (void)setTransitIncidents:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MapsIncidentsViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MapsIncidentsViewController;
  [(MapsIncidentsViewController *)&v11 viewDidLoad];
  v3 = [(MapsIncidentsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"MapsIncidentsView"];

  v4 = +[UIColor clearColor];
  v5 = [(MapsIncidentsViewController *)self tableView];
  [v5 setBackgroundColor:v4];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v9 = [(MapsIncidentsViewController *)self tableView];
  [v9 setLayoutMargins:UIEdgeInsetsZero.top, left, bottom, right];

  v10 = [(MapsIncidentsViewController *)self tableView];
  [v10 setPreservesSuperviewLayoutMargins:1];

  [(MapsIncidentsViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsIncidentsViewController;
  [(MapsIncidentsViewController *)&v4 viewWillAppear:a3];
  [(MapsIncidentsViewController *)self _updatePreferredContentSize];
}

- (void)setTransitIncidents:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsIncidentsViewController;
  [(MapsIncidentsViewController *)&v4 setTransitIncidents:a3];
  [(MapsIncidentsViewController *)self _updatePreferredContentSize];
}

- (void)_updatePreferredContentSize
{
  if ([(MapsIncidentsViewController *)self isViewLoaded])
  {
    if (sub_1000BBB44(self) == 5)
    {
      [(MapsIncidentsViewController *)self _calculatePreferredContentSize];
      double v4 = v3;
      double v6 = v5;
      [(MapsIncidentsViewController *)self preferredContentSize];
      if (v4 != v8 || v6 != v7)
      {
        -[MapsIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
      }
    }
  }
}

- (CGSize)_calculatePreferredContentSize
{
  double v3 = [(MapsIncidentsViewController *)self tableView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(MapsIncidentsViewController *)self tableView];
  [v8 contentSize];
  double v10 = v9;
  double v11 = 282.0;

  v12 = [(MapsIncidentsViewController *)self tableView];
  [v12 setFrame:v5, v7, 282.0, v10];

  double height = CGSizeZero.height;
  v14 = [(MapsIncidentsViewController *)self tableView];
  [v14 contentSize];
  double v16 = v15;
  double v18 = v17;

  if (v16 != CGSizeZero.width || v18 != height)
  {
    uint64_t v20 = 10;
    while (1)
    {
      v21 = [(MapsIncidentsViewController *)self tableView];
      [v21 contentSize];
      double v11 = v22;
      double v10 = v23;

      v24 = [(MapsIncidentsViewController *)self tableView];
      [v24 setFrame:v5, v7, v11, v10];

      v25 = [(MapsIncidentsViewController *)self tableView];
      [v25 layoutIfNeeded];

      v26 = [(MapsIncidentsViewController *)self tableView];
      [v26 contentSize];
      double v28 = v27;
      double v30 = v29;

      if (v28 == v11 && v30 == v10) {
        break;
      }
      if (!--v20)
      {
        v31 = sub_100576C64();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not calculate the size of the incidents popover within the max number of iterations.", v34, 2u);
        }

        break;
      }
    }
  }
  double v32 = v11;
  double v33 = v10;
  result.double height = v33;
  result.width = v32;
  return result;
}

- (BOOL)_isValidURLForWebView:(id)a3
{
  double v3 = [a3 scheme];
  double v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:@"http"]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"https"];
  }

  return v5;
}

- (void)openUrlForAdvisoryNotice:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100103D1C;
  double v15 = sub_100104718;
  id v16 = [objc_alloc((Class)NSURL) initWithString:v4];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100103D1C;
  v9[4] = sub_100104718;
  double v10 = self;
  unsigned __int8 v5 = (void *)UIApp;
  uint64_t v6 = v12[5];
  UIApplicationOpenExternalURLOptionsKey v17 = UIApplicationOpenURLOptionUniversalLinksOnly;
  double v18 = &__kCFBooleanTrue;
  double v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100575FC8;
  v8[3] = &unk_1012EF598;
  v8[4] = v9;
  v8[5] = &v11;
  [v5 _openURL:v6 originatingView:0 options:v7 completionHandler:v8];

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
}

@end
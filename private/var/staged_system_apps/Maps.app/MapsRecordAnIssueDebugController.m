@interface MapsRecordAnIssueDebugController
+ (id)navigationDestinationTitle;
- (BOOL)tapToRadarEnabled;
- (void)beginRecordingAndCreatePanView;
- (void)prepareContent;
- (void)setTapToRadarEnabled:(BOOL)a3;
@end

@implementation MapsRecordAnIssueDebugController

+ (id)navigationDestinationTitle
{
  return @"Record an Issue";
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D0BC4;
  v4[3] = &unk_1012E7EF8;
  objc_copyWeak(&v5, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Record" content:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)beginRecordingAndCreatePanView
{
  id v3 = [(MapsRecordAnIssueDebugController *)self view];
  v4 = [v3 window];

  id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  v6 = +[UIColor grayColor];
  [v5 setColor:v6];

  [v4 frame];
  double v8 = v7 * 0.5;
  [v4 frame];
  [v5 setCenter:v8, v9 * 0.5];
  [v4 addSubview:v5];
  [v5 startAnimating];
  v10 = +[MapsEventRecorder initializeDefaultRecorderWithTapToRadar:[(MapsRecordAnIssueDebugController *)self tapToRadarEnabled] window:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003D12D0;
  v13[3] = &unk_1012E66E0;
  v13[4] = self;
  id v14 = v4;
  id v15 = v5;
  id v11 = v5;
  id v12 = v4;
  [v10 beginRecordingWithCompletion:v13];
}

- (BOOL)tapToRadarEnabled
{
  return self->_tapToRadarEnabled;
}

- (void)setTapToRadarEnabled:(BOOL)a3
{
  self->_tapToRadarEnabled = a3;
}

@end
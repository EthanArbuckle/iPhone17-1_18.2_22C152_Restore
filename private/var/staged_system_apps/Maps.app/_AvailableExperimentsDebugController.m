@interface _AvailableExperimentsDebugController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _AvailableExperimentsDebugController

+ (id)navigationDestinationTitle
{
  return @"Available Experiments";
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_AvailableExperimentsDebugController;
  [(MapsDebugValuesViewController *)&v8 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = +[GEOExperimentConfiguration sharedConfiguration];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005C33C0;
  v5[3] = &unk_1012E6E78;
  objc_copyWeak(&v6, &location);
  [v4 _debug_fetchAllAvailableExperiments:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)prepareContent
{
  v3 = self->_availableExperiments;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005C3590;
  v6[3] = &unk_1012EE018;
  v7 = v3;
  v4 = v3;
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v6];
}

- (void).cxx_destruct
{
}

@end
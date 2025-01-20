@interface ExperimentsDebugController
+ (id)navigationDestinationTitle;
- (void)dealloc;
- (void)prepareContent;
@end

@implementation ExperimentsDebugController

+ (id)navigationDestinationTitle
{
  return @"A/B Experiments";
}

- (void)dealloc
{
  v3 = +[GEOExperimentConfiguration sharedConfiguration];
  [v3 removeExperimentObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ExperimentsDebugController;
  [(MapsDebugValuesViewController *)&v4 dealloc];
}

- (void)prepareContent
{
  v3 = +[GEOExperimentConfiguration sharedConfiguration];
  [v3 addExperimentObserver:self queue:&_dispatch_main_q];

  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1012F1210];
  +[GEOExperimentConfiguration sharedConfiguration];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005C2D60;
  v10[3] = &unk_1012EE018;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v11;
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v10];
  id v7 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1012F1290];
  v8 = +[GEOExperimentConfiguration sharedConfiguration];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005C3080;
  v9[3] = &unk_1012F1318;
  v9[4] = self;
  [v8 _debug_forEachExperimentType:v9];
}

@end
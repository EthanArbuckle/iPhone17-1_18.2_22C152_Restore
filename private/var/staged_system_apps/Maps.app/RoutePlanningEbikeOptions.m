@interface RoutePlanningEbikeOptions
- (void)_prepareForCycling;
- (void)_prepareForDrive;
- (void)_prepareForTransit;
- (void)_prepareForWalking;
@end

@implementation RoutePlanningEbikeOptions

- (void)_prepareForDrive
{
}

- (void)_prepareForTransit
{
}

- (void)_prepareForWalking
{
}

- (void)_prepareForCycling
{
  objc_initWeak(&location, self);
  if (!self->super._countryObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10083C460;
    v10[3] = &unk_1012E6730;
    objc_copyWeak(&v11, &location);
    v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v10];
    countryObserver = self->super._countryObserver;
    self->super._countryObserver = v6;

    objc_destroyWeak(&v11);
  }
  if (sub_10050B708())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10083C4A0;
    v8[3] = &unk_1012E7EF8;
    objc_copyWeak(&v9, &location);
    [(PreferenceValuesDataSource *)self addSectionWithTitle:0 content:v8];
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

@end
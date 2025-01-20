@interface MapsCountryCodeDebugController
+ (id)_knownCountryCodes;
+ (id)_namesOfCountriesWithKnownCodes;
+ (id)navigationDestinationTitle;
- (MapsCountryCodeDebugController)init;
- (id)_countryCode;
- (void)_countryChanged:(id)a3;
- (void)_setCountryCode:(id)a3;
- (void)prepareContent;
@end

@implementation MapsCountryCodeDebugController

- (MapsCountryCodeDebugController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsCountryCodeDebugController;
  v2 = [(MapsDebugValuesViewController *)&v8 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_countryChanged:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    v4 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v5 = [v4 countryCode];
    actualCountry = v2->_actualCountry;
    v2->_actualCountry = (NSString *)v5;
  }
  return v2;
}

- (void)_countryChanged:(id)a3
{
  id v6 = [a3 userInfo];
  v4 = [v6 objectForKeyedSubscript:GEODeviceCountryCodeKey];
  actualCountry = self->_actualCountry;
  self->_actualCountry = v4;

  [(MapsDebugValuesViewController *)self rebuildSections];
}

+ (id)navigationDestinationTitle
{
  return @"Country Code";
}

+ (id)_knownCountryCodes
{
  return &off_1013AE718;
}

+ (id)_namesOfCountriesWithKnownCodes
{
  return &off_1013AE730;
}

- (id)_countryCode
{
  if (GEOConfigGetBOOL())
  {
    v2 = GEOConfigGetString();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setCountryCode:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (+[NSLocale ISOCountryCodes],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 containsObject:v4],
        v5,
        (v6 & 1) == 0))
  {
    v7 = +[NSString stringWithFormat:@"\"%@\" Is not a valid ISO Country Code", v4];
    objc_super v8 = +[UIAlertController alertControllerWithTitle:@"Oops" message:v7 preferredStyle:1];
    v9 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
    [v8 addAction:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B59DA4;
    v11[3] = &unk_1012E5D08;
    v11[4] = self;
    [(MapsCountryCodeDebugController *)self presentViewController:v8 animated:1 completion:v11];
  }
  else
  {
    GEOConfigSetBOOL();
    if (v4) {
      GEOConfigSetString();
    }
    else {
      _GEOConfigRemoveValue();
    }
    v10 = +[GEOCountryConfiguration sharedConfiguration];
    [v10 updateProvidersForCurrentCountry];

    [(MapsDebugValuesViewController *)self reloadData];
  }
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v3 = [(id)objc_opt_class() _knownCountryCodes];
  id v4 = [(id)objc_opt_class() _namesOfCountriesWithKnownCodes];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1001043A0;
  v28[4] = sub_100104A40;
  id v29 = 0;
  uint64_t v5 = +[NSMutableArray array];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100B5A180;
  v23[3] = &unk_101319230;
  v27 = v28;
  v23[4] = self;
  id v6 = v3;
  id v24 = v6;
  id v7 = v4;
  id v25 = v7;
  id v8 = v5;
  id v26 = v8;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B5A374;
  v21[3] = &unk_1012EE2E8;
  objc_copyWeak(&v22, &location);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100B5A3C0;
  v19[3] = &unk_1012EE310;
  objc_copyWeak(&v20, &location);
  id v9 = +[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:0 withContent:v23 get:v21 set:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B5A41C;
  v18[3] = &unk_101319258;
  v18[4] = v28;
  id v10 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B5A430;
  v16[3] = &unk_1012EE018;
  id v11 = v8;
  id v17 = v11;
  id v12 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B5A530;
  v14[3] = &unk_1012E7EF8;
  objc_copyWeak(&v15, &location);
  id v13 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  _Block_object_dispose(v28, 8);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end
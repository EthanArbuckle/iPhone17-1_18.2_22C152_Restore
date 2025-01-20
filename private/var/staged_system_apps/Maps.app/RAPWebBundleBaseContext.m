@interface RAPWebBundleBaseContext
- (NSDictionary)context;
- (RAPWebBundleBaseContext)initWithType:(id)a3 locales:(id)a4;
- (id)_currentUserInterfaceIdiomString;
- (id)description;
- (void)_setLocaleWithLocales:(id)a3;
@end

@implementation RAPWebBundleBaseContext

- (RAPWebBundleBaseContext)initWithType:(id)a3 locales:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPWebBundleBaseContext;
  v9 = [(RAPWebBundleBaseContext *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    [(RAPWebBundleBaseContext *)v10 _setLocaleWithLocales:v8];
    v11 = +[UserInformationManager sharedInstance];
    uint64_t v12 = [v11 userEmail];
    email = v10->_email;
    v10->_email = (NSString *)v12;
  }
  return v10;
}

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKeyedSubscript:@"locale"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKeyedSubscript:@"type"];
  }
  id v7 = +[GEOCountryConfiguration sharedConfiguration];
  id v8 = [v7 countryCode];

  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"countryCode"];
  }
  v9 = +[NSLocale autoupdatingCurrentLocale];
  v10 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v9];

  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 rangeOfString:@"a"] != (id)0x7FFFFFFFFFFFFFFFLL);
  [v4 setObject:v11 forKeyedSubscript:@"useHour12"];

  uint64_t v12 = +[NSNumber numberWithBool:UIAccessibilityIsOnOffSwitchLabelsEnabled()];
  [v4 setObject:v12 forKeyedSubscript:@"useAccessibilityLabels"];

  v13 = [(RAPWebBundleBaseContext *)self _currentUserInterfaceIdiomString];
  [v4 setObject:v13 forKeyedSubscript:@"uiIdiom"];

  [v4 setObject:self->_email forKeyedSubscript:@"email"];
  v14 = GEOConfigGetString();
  [v4 setObject:v14 forKeyedSubscript:@"abBranchId"];

  objc_super v15 = GEOConfigGetString();
  [v4 setObject:v15 forKeyedSubscript:@"abManifestVersion"];

  v16 = +[RAPWebBundleDownloadManager sharedInstance];
  uint64_t v21 = 0;
  v17 = [v16 loadWebBundleManifestWithError:&v21];

  v18 = [v17 version];
  [v4 setObject:v18 forKeyedSubscript:@"version"];

  id v19 = [v4 copy];

  return (NSDictionary *)v19;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  type = self->_type;
  v6 = [(RAPWebBundleBaseContext *)self context];
  id v7 = +[NSString stringWithFormat:@"<%@:%p type:%@, context: %@>", v4, self, type, v6];

  return v7;
}

- (void)_setLocaleWithLocales:(id)a3
{
  id v4 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009FC0F0;
  v14[3] = &unk_101313DE0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v15 = v5;
  [v4 enumerateObjectsUsingBlock:v14];

  v6 = +[NSLocale autoupdatingCurrentLocale];
  id v7 = [v6 collatorIdentifier];

  v22 = v7;
  id v8 = +[NSArray arrayWithObjects:&v22 count:1];
  v9 = +[NSBundle preferredLocalizationsFromArray:v5 forPreferences:v8];
  v10 = [v9 firstObject];
  locale = self->_locale;
  self->_locale = v10;

  uint64_t v12 = sub_1000B8184();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self->_locale;
    *(_DWORD *)buf = 138412802;
    v17 = v13;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "selectedLocale: %@, preferredLocale: %@, verifiedLocales: %@", buf, 0x20u);
  }
}

- (id)_currentUserInterfaceIdiomString
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if (v3 > 6) {
    return @"unspecified";
  }
  else {
    return off_101313E00[v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end
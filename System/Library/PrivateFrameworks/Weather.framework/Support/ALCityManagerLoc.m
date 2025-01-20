@interface ALCityManagerLoc
+ (id)sharedManager;
- (ALCityManagerLoc)init;
- (void)setLocaleForCityNames:(id)a3;
@end

@implementation ALCityManagerLoc

+ (id)sharedManager
{
  v2 = (void *)qword_1000118D0;
  if (!qword_1000118D0)
  {
    v3 = objc_alloc_init(ALCityManagerLoc);
    v4 = (void *)qword_1000118D0;
    qword_1000118D0 = (uint64_t)v3;

    v2 = (void *)qword_1000118D0;
  }
  return v2;
}

- (ALCityManagerLoc)init
{
  v6.receiver = self;
  v6.super_class = (Class)ALCityManagerLoc;
  v2 = [(ALCityManagerLoc *)&v6 init];
  if (v2)
  {
    v3 = +[NSLocale currentLocale];
    v4 = [v3 objectForKey:NSLocaleIdentifier];
    [(ALCityManagerLoc *)v2 setLocaleForCityNames:v4];
  }
  return v2;
}

- (void)setLocaleForCityNames:(id)a3
{
  id v4 = a3;
  v5 = +[NSLocale componentsFromLocaleIdentifier:v4];
  objc_super v6 = +[NSBundle bundleWithIdentifier:@"com.apple.AppSupport"];
  v7 = [v6 pathForResource:@"Localizable_Places" ofType:@"db" inDirectory:0 forLocalization:v4];
  if (![v7 length])
  {
    v8 = [v5 objectForKeyedSubscript:NSLocaleCountryCode];

    v9 = [v6 pathForResource:@"Localizable_Places" ofType:@"db" inDirectory:0 forLocalization:v8];

    if ([v9 length])
    {
      v7 = v9;
      id v4 = v8;
    }
    else
    {
      id v4 = [v5 objectForKeyedSubscript:NSLocaleLanguageCode];

      v7 = [v6 pathForResource:@"Localizable_Places" ofType:@"db" inDirectory:0 forLocalization:v4];

      if (![v7 length])
      {
        id v10 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en"];
        uint64_t v11 = [v10 displayNameForKey:NSLocaleIdentifier value:v4];

        uint64_t v12 = [v6 pathForResource:@"Localizable_Places" ofType:@"db" inDirectory:0 forLocalization:v11];

        v7 = (void *)v12;
        id v4 = (id)v11;
      }
    }
  }
  if ([v7 length])
  {
    v13 = (const char *)[v7 UTF8String];
    v14 = (sqlite3 **)&self->ALCityManager_opaque[OBJC_IVAR___ALCityManager__localizedDb];
    int v15 = sqlite3_open_v2(v13, v14, 1, 0);
    if (!v15)
    {
      sqlite3_create_function(*v14, "CDLIKE", 1, 1, self, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100007440, 0, 0);
      goto LABEL_14;
    }
    int v16 = v15;
    v17 = sub_100002174(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100007568(v16, v17);
    }
  }
  else
  {
    v17 = sub_100002174(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100007524(v17);
    }
  }

LABEL_14:
}

@end
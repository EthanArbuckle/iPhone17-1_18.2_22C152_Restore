@interface WelcomeScreenConfiguration
+ (id)_allPossibleBulletTypesForCountryCode:(id)a3;
+ (id)_createBulletsFromBulletTypes:(id)a3;
+ (id)_supportedBulletTypesFrom:(id)a3;
+ (id)configurationForCountryCode:(id)a3;
- (NSArray)bullets;
- (NSString)title;
- (void)setBullets:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WelcomeScreenConfiguration

+ (id)configurationForCountryCode:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _allPossibleBulletTypesForCountryCode:v3];

  v5 = [(id)objc_opt_class() _supportedBulletTypesFrom:v4];
  v6 = [(id)objc_opt_class() _createBulletsFromBulletTypes:v5];
  v7 = objc_alloc_init(WelcomeScreenConfiguration);
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"[Welcome Screen] What’s new" value:@"localized string not found" table:0];
  [(WelcomeScreenConfiguration *)v7 setTitle:v9];

  [(WelcomeScreenConfiguration *)v7 setBullets:v6];

  return v7;
}

+ (id)_allPossibleBulletTypesForCountryCode:(id)a3
{
  id v3 = [a3 lowercaseString];
  if (([@"us" isEqualToString:v3] & 1) != 0
    || ([@"gb" isEqualToString:v3] & 1) != 0
    || ([@"ie" isEqualToString:v3] & 1) != 0)
  {
    v4 = &off_1013AE178;
  }
  else if ([@"cn" isEqualToString:v3])
  {
    v4 = &off_1013AE190;
  }
  else if ([@"jp" isEqualToString:v3])
  {
    v4 = &off_1013AE1A8;
  }
  else
  {
    v4 = &off_1013AE1C0;
  }

  return v4;
}

+ (id)_supportedBulletTypesFrom:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = +[MKSystemController sharedInstance];
  unsigned int v6 = [v5 userInterfaceIdiom];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) integerValue:v19];
        if (v12 == (id)2)
        {
          v16 = +[GEOPlatform sharedPlatform];
          unsigned int v17 = [v16 supportsAdvancedMap];

          v14 = &off_1013A9190;
          if (!v17) {
            continue;
          }
LABEL_15:
          [v4 addObject:v14];
          continue;
        }
        if (v12 == (id)1)
        {
          if (!v6)
          {
            char IsEnabled_TransitPay = MapsFeature_IsEnabled_TransitPay();
            v14 = &off_1013A9178;
            if (IsEnabled_TransitPay) {
              goto LABEL_15;
            }
          }
        }
        else if (!v12)
        {
          char IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
          v14 = &off_1013A9160;
          if (IsEnabled_DrivingMultiWaypointRoutes) {
            goto LABEL_15;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v4;
}

+ (id)_createBulletsFromBulletTypes:(id)a3
{
  return [a3 _maps_compactMap:&stru_1012FF6A8];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bullets, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
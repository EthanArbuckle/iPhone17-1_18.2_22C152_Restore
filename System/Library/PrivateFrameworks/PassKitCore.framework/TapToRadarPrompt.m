@interface TapToRadarPrompt
+ (id)_predicateForReason:(id)a3;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertOrUpdateWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5;
+ (id)tapToRadarPromptWithReason:(id)a3 inDatabase:(id)a4;
- (TapToRadarPrompt)initWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5;
- (id)tapToRadarPrompt;
- (void)updateWithLastPromptDate:(id)a3;
@end

@implementation TapToRadarPrompt

+ (id)databaseTable
{
  return @"tap_to_radar_prompt";
}

+ (id)tapToRadarPromptWithReason:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForReason:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0;
  if (v8 && v9)
  {
    v12 = [a1 _predicateForReason:v8];
    id v11 = [a1 anyInDatabase:v10 predicate:v12];

    v13 = PKLogFacilityTypeGetObject();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        int v16 = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating tap to radar prompt \"%@\" with last prompt date %@", (uint8_t *)&v16, 0x16u);
      }

      [v11 updateWithLastPromptDate:v9];
    }
    else
    {
      if (v14)
      {
        int v16 = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Inserting new tap to radar prompt \"%@\" with last prompt date %@", (uint8_t *)&v16, 0x16u);
      }

      id v11 = [objc_alloc((Class)a1) initWithReason:v8 lastPromptDate:v9 inDatabase:v10];
    }
  }

  return v11;
}

- (TapToRadarPrompt)initWithReason:(id)a3 lastPromptDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObjectOrNull:v10 forKey:@"reason"];

  v12 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v12 forKey:@"last_prompt_date"];

  [v11 setInteger:1 forKey:@"prompt_count"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  BOOL v14 = v13;
  return v14;
}

- (void)updateWithLastPromptDate:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)_SQLValueForDate();

  [v10 setObjectOrNull:v5 forKey:@"last_prompt_date"];
  id v6 = [(SQLiteEntity *)self valueForProperty:@"prompt_count"];
  if (!v6
    || (+[NSDecimalNumber notANumber],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = PKEqualObjects(),
        v7,
        v8))
  {

    id v6 = &off_10078B6A0;
  }
  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v6 integerValue] + 1);
  [v10 setObjectOrNull:v9 forKey:@"prompt_count"];

  [(SQLiteEntity *)self setValuesWithDictionary:v10];
}

- (id)tapToRadarPrompt
{
  id v3 = objc_alloc_init((Class)PKTapToRadarPrompt);
  id v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F4DC8;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  int v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForReason:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"reason" equalToValue:a3];
}

+ (id)_propertySetters
{
  v4[0] = @"reason";
  v4[1] = @"last_prompt_date";
  v5[0] = &stru_100747E58;
  v5[1] = &stru_100747E78;
  v4[2] = @"prompt_count";
  v5[2] = &stru_100747E98;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end
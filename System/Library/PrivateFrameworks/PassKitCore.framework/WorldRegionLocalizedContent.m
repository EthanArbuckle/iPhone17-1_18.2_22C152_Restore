@interface WorldRegionLocalizedContent
+ (id)_predicateForLocaleIdentifier:(id)a3;
+ (id)_predicateForWorldRegionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)localizedNameForWorldRegionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteLocalizedContentForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertName:(id)a3 localeIdentifier:(id)a4 forWorldRegionPID:(int64_t)a5 inDatabase:(id)a6;
@end

@implementation WorldRegionLocalizedContent

+ (id)databaseTable
{
  return @"world_region_localized_content";
}

+ (void)insertName:(id)a3 localeIdentifier:(id)a4 forWorldRegionPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [a1 _predicateForWorldRegionPID:a5];
  v25[0] = v13;
  v14 = [a1 _predicateForLocaleIdentifier:v11];
  v25[1] = v14;
  v15 = +[NSArray arrayWithObjects:v25 count:2];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  v17 = [a1 anyInDatabase:v12 predicate:v16];
  if (!v17)
  {
    v19 = +[NSMutableDictionary dictionary];
    v20 = +[NSNumber numberWithLongLong:a5];
    [v19 setObjectOrNull:v20 forKey:@"world_region_pid"];

    [v19 setObjectOrNull:v10 forKey:@"name"];
    [v19 setObjectOrNull:v11 forKey:@"locale_identifier"];
    if (v10) {
      v21 = &off_10078B7D8;
    }
    else {
      v21 = &off_10078B7F0;
    }
    [v19 setObjectOrNull:v21 forKey:@"status"];

    goto LABEL_10;
  }
  v23[0] = @"name";
  if (v10)
  {
    v18 = &off_10078B7D8;
    v19 = v10;
  }
  else
  {
    v19 = +[NSNull null];
    v18 = &off_10078B7F0;
  }
  v23[1] = @"status";
  v24[0] = v19;
  v24[1] = v18;
  v22 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v17 setValuesWithDictionary:v22];

  if (!v10) {
LABEL_10:
  }
}

+ (id)localizedNameForWorldRegionPID:(int64_t)a3 localeIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForWorldRegionPID:a3];
  v17[0] = v10;
  id v11 = [a1 _predicateForLocaleIdentifier:v9];

  v17[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:2];
  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 anyInDatabase:v8 predicate:v13];

  v15 = [v14 valueForProperty:@"name"];

  return v15;
}

+ (void)deleteLocalizedContentForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForWorldRegionPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)_predicateForWorldRegionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForLocaleIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"locale_identifier" equalToValue:a3];
}

@end
@interface ApplyFooterContentLink
+ (id)_linksWithQuery:(id)a3;
+ (id)_predicateForFooterContentPID:(int64_t)a3;
+ (id)_propertySettersForFooterContentLink;
+ (id)_propertyValuesForFooterContentLink:(id)a3;
+ (id)databaseTable;
+ (id)linksForFooterContentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllFooterContentLinksWithFooterContentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertFooterContentLinks:(id)a3 withFooterContentPID:(int64_t)a4 inDatabase:(id)a5;
- (ApplyFooterContentLink)initWithFooterContentLink:(id)a3 footerContentPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation ApplyFooterContentLink

+ (id)databaseTable
{
  return @"footer_content_link";
}

+ (void)insertFooterContentLinks:(id)a3 withFooterContentPID:(int64_t)a4 inDatabase:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003941A0;
  v8[3] = &unk_100737418;
  id v11 = a1;
  int64_t v12 = a4;
  id v9 = a3;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  sub_10000817C((uint64_t)v6, v8);
}

- (ApplyFooterContentLink)initWithFooterContentLink:(id)a3 footerContentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _propertyValuesForFooterContentLink:v9];

  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"footer_content_pid"];

  int64_t v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (void)deleteAllFooterContentLinksWithFooterContentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForFooterContentPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)_predicateForFooterContentPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"footer_content_pid" equalToValue:v3];

  return v4;
}

+ (id)linksForFooterContentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForFooterContentPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _linksWithQuery:v8];

  return v9;
}

+ (id)_linksWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForFooterContentLink];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100394628;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)_propertyValuesForFooterContentLink:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 linkText];
  [v4 setObjectOrNull:v5 forKey:@"link_text"];

  id v6 = [v3 linkURL];
  id v7 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v7 forKey:@"link_url"];

  id v8 = [v3 termsIdentifier];
  [v4 setObjectOrNull:v8 forKey:@"terms_identifier"];

  id v9 = [v3 analyticsIdentifier];

  [v4 setObjectOrNull:v9 forKey:@"analytics_identifier"];
  return v4;
}

+ (id)_propertySettersForFooterContentLink
{
  v4[0] = @"link_text";
  v4[1] = @"link_url";
  v5[0] = &stru_10074D238;
  v5[1] = &stru_10074D258;
  v4[2] = @"terms_identifier";
  v4[3] = @"analytics_identifier";
  v5[2] = &stru_10074D278;
  v5[3] = &stru_10074D298;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end
@interface ApplyFooterContent
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4;
+ (id)_propertySettersForFooterContent;
+ (id)_propertyValuesForFooterContent:(id)a3 type:(unint64_t)a4;
+ (id)databaseTable;
+ (id)footerContentForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteFooterContentWithInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteFooterContentWithType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
- (ApplyFooterContent)initWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6;
- (BOOL)deleteFromDatabase;
- (id)footerContent;
@end

@implementation ApplyFooterContent

+ (id)databaseTable
{
  return @"footer_content";
}

+ (id)insertOrUpdateWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [a1 deleteFooterContentWithType:a4 installmentCriteriaPID:a5 inDatabase:v11];
  if (v10)
  {
    id v12 = [objc_alloc((Class)a1) initWithFooterContent:v10 type:a4 installmentCriteriaPID:a5 inDatabase:v11];
    +[ApplyFooterContentLink deleteAllFooterContentLinksWithFooterContentPID:inDatabase:](ApplyFooterContentLink, "deleteAllFooterContentLinksWithFooterContentPID:inDatabase:", [v12 persistentID], v11);
    v13 = [v10 links];
    +[ApplyFooterContentLink insertFooterContentLinks:withFooterContentPID:inDatabase:](ApplyFooterContentLink, "insertFooterContentLinks:withFooterContentPID:inDatabase:", v13, [v12 persistentID], v11);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (ApplyFooterContent)initWithFooterContent:(id)a3 type:(unint64_t)a4 installmentCriteriaPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(id)objc_opt_class() _propertyValuesForFooterContent:v11 type:a4];

  v13 = +[NSNumber numberWithLongLong:a5];
  [v12 setObjectOrNull:v13 forKey:@"installment_criteria_pid"];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v10];
  return v14;
}

+ (id)footerContentForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForType:a3 installmentCriteriaPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  id v11 = [v10 footerContent];

  return v11;
}

+ (void)deleteFooterContentWithInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentCriteriaPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)deleteFooterContentWithType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForType:a3 installmentCriteriaPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[ApplyFooterContentLink deleteAllFooterContentLinksWithFooterContentPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)ApplyFooterContent;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"installment_criteria_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3 installmentCriteriaPID:(int64_t)a4
{
  v5 = [a1 _predicateForInstallmentCriteriaPID:a4];
  v11[0] = v5;
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:a3];
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v6];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

- (id)footerContent
{
  id v3 = objc_alloc_init((Class)PKApplyFooterContent);
  v4 = [(id)objc_opt_class() _propertySettersForFooterContent];
  v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019B3C0;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  v9 = [(SQLiteEntity *)self database];
  id v10 = +[ApplyFooterContentLink linksForFooterContentPID:v8 inDatabase:v9];

  [v6 setLinks:v10];
  id v11 = v6;

  return v11;
}

+ (id)_propertyValuesForFooterContent:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [v5 footerText];

  [v6 setObjectOrNull:v7 forKey:@"footer_text"];
  int64_t v8 = +[NSNumber numberWithUnsignedInteger:a4];
  [v6 setObjectOrNull:v8 forKey:@"type"];

  return v6;
}

+ (id)_propertySettersForFooterContent
{
  CFStringRef v4 = @"footer_text";
  id v5 = &stru_10073BF38;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end
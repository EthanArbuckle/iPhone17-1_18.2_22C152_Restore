@interface CommutePlanReminder
+ (id)_predicateForCommutePlanReminder:(id)a3 passIdentifier:(id)a4;
+ (id)_predicateForCommutePlanReminder:(id)a3 passPID:(int64_t)a4;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)commutePlanReminderInDatabase:(id)a3 forCommutePlanIdentifier:(id)a4 passIdentifier:(id)a5;
+ (id)commutePlanReminderInDatabase:(id)a3 forQuery:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4;
- (CommutePlanReminder)initWithCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
- (id)commutePlanReminder;
- (void)updateWithCommutePlanReminder:(id)a3;
@end

@implementation CommutePlanReminder

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = commute_plan_reminder.pass_pid"];
  }
}

+ (id)commutePlanReminderInDatabase:(id)a3 forCommutePlanIdentifier:(id)a4 passIdentifier:(id)a5
{
  id v8 = a3;
  CFStringRef v9 = [a1 _predicateForCommutePlanReminder:a4 passIdentifier:a5];
  v10 = [a1 queryWithDatabase:v8 predicate:v9];

  v11 = [a1 commutePlanReminderInDatabase:v8 forQuery:v10];

  return v11;
}

+ (id)commutePlanReminderInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100020B6C;
  v20 = sub_1000210A8;
  id v21 = 0;
  CFStringRef v22 = @"time_interval";
  id v8 = +[NSArray arrayWithObjects:&v22 count:1];
  +[CommutePlanReminder _propertySetters];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003194BC;
  v12[3] = &unk_100734F50;
  v14 = &v16;
  id v15 = a1;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v9;
  [v7 enumeratePersistentIDsAndProperties:v8 usingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100020B6C;
  v33 = sub_1000210A8;
  id v34 = 0;
  v14 = objc_msgSend(a1, "_predicateForCommutePlanReminder:passPID:", v11, objc_msgSend(v12, "persistentID"));
  id v15 = [a1 queryWithDatabase:v13 predicate:v14];

  CFStringRef v35 = @"pid";
  uint64_t v16 = +[NSArray arrayWithObjects:&v35 count:1];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100319820;
  v26 = &unk_1007388A8;
  v28 = &v29;
  id v17 = v13;
  id v27 = v17;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:&v23];

  uint64_t v18 = (void *)v30[5];
  if (v18)
  {
    objc_msgSend(v18, "updateWithCommutePlanReminder:", v10, v23, v24, v25, v26);
    id v19 = (id)v30[5];
  }
  else
  {
    id v20 = objc_alloc((Class)a1);
    id v19 = objc_msgSend(v20, "initWithCommutePlanReminder:forCommutePlanIdentifier:pass:database:", v10, v11, v12, v17, v23, v24, v25, v26);
  }
  id v21 = v19;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (CommutePlanReminder)initWithCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = [v11 persistentID];

    uint64_t v16 = +[NSNumber numberWithLongLong:v15];
    [v14 setObject:v16 forKey:@"pass_pid"];

    [v14 setObjectOrNull:v12 forKey:@"commute_plan_identifier"];
    [v13 timeInterval];
    double v18 = v17;

    [v14 setDouble:@"time_interval" forKey:v18];
    id v19 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];

    self = v19;
    id v20 = self;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)databaseTable
{
  return @"commute_plan_reminder";
}

+ (id)_predicateForCommutePlanReminder:(id)a3 passIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      +[SQLiteComparisonPredicate predicateWithProperty:@"commute_plan_identifier" equalToValue:v6];
    }
    else {
    id v9 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"commute_plan_identifier"];
    }
    id v10 = [a1 _predicateForPassWithUniqueIdentifier:v7];
    v13[0] = v9;
    v13[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v13 count:2];
    id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  }
  else
  {
    id v8 = +[SQLiteBooleanPredicate falsePredicate];
  }

  return v8;
}

+ (id)_predicateForCommutePlanReminder:(id)a3 passPID:(int64_t)a4
{
  if (a3) {
    +[SQLiteComparisonPredicate predicateWithProperty:@"commute_plan_identifier" equalToValue:a3];
  }
  else {
  id v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"commute_plan_identifier"];
  }
  id v6 = +[NSNumber numberWithLongLong:a4];
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v6];

  v11[0] = v5;
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

- (id)commutePlanReminder
{
  id v3 = objc_alloc_init((Class)PKPaymentCommutePlanReminder);
  v4 = +[CommutePlanReminder _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100319D5C;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)updateWithCommutePlanReminder:(id)a3
{
  id v4 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  [v4 timeInterval];
  double v6 = v5;

  [v7 setDouble:@"time_interval" forKey:v6];
  [(SQLiteEntity *)self setValuesWithDictionary:v7];
}

+ (id)_propertySetters
{
  CFStringRef v4 = @"time_interval";
  double v5 = &stru_100748DE8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end
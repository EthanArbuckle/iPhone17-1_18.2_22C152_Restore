@interface BalanceReminder
+ (id)_predicateForBalanceIdentifier:(id)a3;
+ (id)_predicateForBalanceReminder:(id)a3 passIdentifier:(id)a4;
+ (id)_predicateForBalanceReminder:(id)a3 passPID:(int64_t)a4;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)balanceReminderInDatabase:(id)a3 forBalanceIdentifier:(id)a4 passIdentifier:(id)a5;
+ (id)balanceReminderInDatabase:(id)a3 forQuery:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassIdentifier:(id)a4;
- (BalanceReminder)initWithBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6;
- (id)balanceReminder;
- (void)updateWithBalanceReminder:(id)a3;
@end

@implementation BalanceReminder

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = balance_reminder.pass_pid"];
  }
}

+ (id)balanceReminderInDatabase:(id)a3 forBalanceIdentifier:(id)a4 passIdentifier:(id)a5
{
  id v8 = a3;
  CFStringRef v9 = [a1 _predicateForBalanceReminder:a4 passIdentifier:a5];
  v10 = [a1 queryWithDatabase:v8 predicate:v9];

  v11 = [a1 balanceReminderInDatabase:v8 forQuery:v10];

  return v11;
}

+ (id)balanceReminderInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10002089C;
  v20 = sub_100020F40;
  id v21 = 0;
  v22[0] = @"threshold";
  v22[1] = @"enabled";
  id v8 = +[NSArray arrayWithObjects:v22 count:2];
  +[BalanceReminder _propertySetters];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011BFB0;
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

+ (id)insertOrUpdateBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10002089C;
  v33 = sub_100020F40;
  id v34 = 0;
  v14 = objc_msgSend(a1, "_predicateForBalanceReminder:passPID:", v11, objc_msgSend(v12, "persistentID"));
  id v15 = [a1 queryWithDatabase:v13 predicate:v14];

  CFStringRef v35 = @"pid";
  uint64_t v16 = +[NSArray arrayWithObjects:&v35 count:1];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_10011C314;
  v26 = &unk_1007388A8;
  v28 = &v29;
  id v17 = v13;
  id v27 = v17;
  [v15 enumeratePersistentIDsAndProperties:v16 usingBlock:&v23];

  uint64_t v18 = (void *)v30[5];
  if (v18)
  {
    objc_msgSend(v18, "updateWithBalanceReminder:", v10, v23, v24, v25, v26);
    id v19 = (id)v30[5];
  }
  else
  {
    id v20 = objc_alloc((Class)a1);
    id v19 = objc_msgSend(v20, "initWithBalanceReminder:forBalanceIdentifier:pass:database:", v10, v11, v12, v17, v23, v24, v25, v26);
  }
  id v21 = v19;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (BalanceReminder)initWithBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 pass:(id)a5 database:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = +[NSNull null];
    id v16 = [v11 persistentID];

    id v17 = +[NSNumber numberWithLongLong:v16];
    [v14 setObject:v17 forKeyedSubscript:@"pass_pid"];

    if (v12) {
      id v18 = v12;
    }
    else {
      id v18 = v15;
    }
    [v14 setObject:v18 forKeyedSubscript:@"balance_identifier"];

    id v19 = [v13 threshold];
    id v20 = [v19 stringValue];
    [v14 setObject:v20 forKeyedSubscript:@"threshold"];

    id v21 = [v13 isEnabled];
    v22 = +[NSNumber numberWithBool:v21];
    [v14 setObject:v22 forKeyedSubscript:@"enabled"];

    v23 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];
    self = v23;

    uint64_t v24 = self;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)databaseTable
{
  return @"balance_reminder";
}

+ (id)_predicateForBalanceReminder:(id)a3 passIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(id)objc_opt_class() _predicateForBalanceIdentifier:v6];
    id v9 = [a1 _predicateForPassWithUniqueIdentifier:v7];
    v13[0] = v8;
    v13[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v13 count:2];
    id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  }
  else
  {
    id v11 = +[SQLiteBooleanPredicate falsePredicate];
  }

  return v11;
}

+ (id)_predicateForBalanceReminder:(id)a3 passPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _predicateForBalanceIdentifier:v5];

  id v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v7];

  v12[0] = v6;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForBalanceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKPaymentBalanceStoredValueDefaultIdentifier;
  unsigned int v5 = [v3 isEqualToString:PKPaymentBalanceStoredValueDefaultIdentifier];
  if (!v3 || v5)
  {
    id v7 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"balance_identifier"];
    id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"balance_identifier" equalToValue:v4];
    v11[0] = v7;
    v11[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v11 count:2];
    id v6 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v9];
  }
  else
  {
    id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"balance_identifier" equalToValue:v3];
  }

  return v6;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

- (id)balanceReminder
{
  id v3 = objc_alloc_init((Class)PKPaymentBalanceReminder);
  uint64_t v4 = +[BalanceReminder _propertySetters];
  unsigned int v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10011C9C8;
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

- (void)updateWithBalanceReminder:(id)a3
{
  id v4 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v4, "isEnabled"), @"enabled");
  unsigned int v5 = [v4 threshold];

  [v6 setObjectOrNull:v5 forKey:@"threshold"];
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
}

+ (id)_propertySetters
{
  v4[0] = @"threshold";
  v4[1] = @"enabled";
  v5[0] = &stru_1007388E8;
  v5[1] = &stru_100738908;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end
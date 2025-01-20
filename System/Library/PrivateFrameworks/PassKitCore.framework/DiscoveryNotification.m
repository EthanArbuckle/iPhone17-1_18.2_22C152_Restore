@interface DiscoveryNotification
+ (id)_predicateForNotificationIdentifier:(id)a3;
+ (id)_predicateForNotificationsThatAreActive:(unint64_t)a3;
+ (id)_predicateForNotificationsThatAreDelivered:(unint64_t)a3;
+ (id)_predicateForNotificationsThatAreNotExpiredForDate:(id)a3;
+ (id)_predicateForNotificationsThatAreScheduled:(unint64_t)a3;
+ (id)_predicateForNotificationsWithRelevantDate:(id)a3;
+ (id)_predicateForNotificationsWithScheduledDeliveryDateBeforeDate:(id)a3;
+ (id)_propertySettersForNotification;
+ (id)databaseTable;
+ (id)insertOrUpdateNotification:(id)a3 inDatabase:(id)a4;
+ (id)nextRelevantNotificationForDate:(id)a3 inDatabase:(id)a4;
+ (id)notificationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)notificationsInDatabase:(id)a3;
+ (id)notificationsRequiringInsertionForDate:(id)a3 inDatabase:(id)a4;
+ (id)notificationsThatAreNotExpiredForDate:(id)a3 active:(unint64_t)a4 delivered:(unint64_t)a5 inDatabase:(id)a6;
+ (id)notificationsToScheduleForDate:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllNotificationInDatabase:(id)a3;
+ (void)deleteNotificationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteNotificationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (DiscoveryNotification)initWithNotification:(id)a3 inDatabase:(id)a4;
- (id)notification;
- (void)updateWithNotification:(id)a3;
@end

@implementation DiscoveryNotification

+ (id)databaseTable
{
  return @"discovery_notification";
}

+ (id)notificationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForNotificationIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateNotification:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  id v9 = [a1 notificationWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithNotification:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithNotification:v6 inDatabase:v7];
  }

  return v9;
}

- (DiscoveryNotification)initWithNotification:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 identifier];
  [v8 setObjectOrNull:v9 forKey:@"identifier"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "version"), @"version");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "status"), @"status");
  v10 = [v7 ruleIdentifier];
  [v8 setObjectOrNull:v10 forKey:@"rule_identifier"];

  v11 = [v7 osVersionRange];
  v12 = (void *)_SQLValueForOSVersionRequirementRange();
  [v8 setObjectOrNull:v12 forKey:@"os_version_requirement_range"];

  v13 = [v7 hardwareVersionRange];
  v14 = (void *)_SQLValueForHardwareVersionRange();
  [v8 setObjectOrNull:v14 forKey:@"hardware_version_range"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "actionType"), @"action_type");
  v15 = [v7 titleKey];
  [v8 setObjectOrNull:v15 forKey:@"title_key"];

  v16 = [v7 messageKey];
  [v8 setObjectOrNull:v16 forKey:@"message_key"];

  v17 = [v7 actionTitleKey];
  [v8 setObjectOrNull:v17 forKey:@"action_title_key"];

  v18 = [v7 actionInfo];
  v19 = _SQLValueForNotificationActionInfo(v18);
  [v8 setObjectOrNull:v19 forKey:@"action_info"];

  v20 = [v7 scheduledDeliveryDate];
  v21 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v21 forKey:@"scheduled_delivery_date"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isDelivered"), @"delivered");
  v22 = [v7 relevantDateRange];
  v23 = [v22 startDate];
  v24 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v24 forKey:@"relevant_date_range_start_date"];

  v25 = [v7 relevantDateRange];

  v26 = [v25 endDate];
  v27 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v27 forKey:@"relevant_date_range_end_date"];

  v28 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v28;
}

- (void)updateWithNotification:(id)a3
{
  id v4 = a3;
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "version"), @"version");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "status"), @"status");
  v5 = [v4 ruleIdentifier];
  [v23 setObjectOrNull:v5 forKey:@"rule_identifier"];

  id v6 = [v4 osVersionRange];
  id v7 = (void *)_SQLValueForOSVersionRequirementRange();
  [v23 setObjectOrNull:v7 forKey:@"os_version_requirement_range"];

  id v8 = [v4 hardwareVersionRange];
  id v9 = (void *)_SQLValueForHardwareVersionRange();
  [v23 setObjectOrNull:v9 forKey:@"hardware_version_range"];

  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "actionType"), @"action_type");
  v10 = [v4 titleKey];
  [v23 setObjectOrNull:v10 forKey:@"title_key"];

  v11 = [v4 messageKey];
  [v23 setObjectOrNull:v11 forKey:@"message_key"];

  v12 = [v4 actionTitleKey];
  [v23 setObjectOrNull:v12 forKey:@"action_title_key"];

  v13 = [v4 actionInfo];
  v14 = _SQLValueForNotificationActionInfo(v13);
  [v23 setObjectOrNull:v14 forKey:@"action_info"];

  v15 = [v4 scheduledDeliveryDate];
  v16 = (void *)_SQLValueForDate();
  [v23 setObjectOrNull:v16 forKey:@"scheduled_delivery_date"];

  objc_msgSend(v23, "setBool:forKey:", objc_msgSend(v4, "isDelivered"), @"delivered");
  v17 = [v4 relevantDateRange];
  v18 = [v17 startDate];
  v19 = (void *)_SQLValueForDate();
  [v23 setObjectOrNull:v19 forKey:@"relevant_date_range_start_date"];

  v20 = [v4 relevantDateRange];

  v21 = [v20 endDate];
  v22 = (void *)_SQLValueForDate();
  [v23 setObjectOrNull:v22 forKey:@"relevant_date_range_end_date"];

  [(SQLiteEntity *)self setValuesWithDictionary:v23];
}

+ (id)notificationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100425744;
  v14 = &unk_100730E38;
  id v15 = v4;
  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v7 = v16;
  id v8 = v4;
  [v6 enumeratePersistentIDsUsingBlock:&v11];
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

+ (id)notificationsThatAreNotExpiredForDate:(id)a3 active:(unint64_t)a4 delivered:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = [a1 _predicateForNotificationsThatAreNotExpiredForDate:a3];
  v25[0] = v11;
  uint64_t v12 = [a1 _predicateForNotificationsThatAreActive:a4];
  v25[1] = v12;
  v13 = [a1 _predicateForNotificationsThatAreDelivered:a5];
  v25[2] = v13;
  v14 = +[NSArray arrayWithObjects:v25 count:3];
  id v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  id v16 = [a1 queryWithDatabase:v10 predicate:v15];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10042598C;
  v22[3] = &unk_100730E38;
  id v23 = v10;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v24 = v17;
  id v18 = v10;
  [v16 enumeratePersistentIDsUsingBlock:v22];
  v19 = v24;
  id v20 = v17;

  return v20;
}

+ (id)notificationsToScheduleForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForNotificationsThatAreNotExpiredForDate:a3];
  v22[0] = v7;
  id v8 = [a1 _predicateForNotificationsThatAreActive:1];
  v22[1] = v8;
  id v9 = [a1 _predicateForNotificationsThatAreDelivered:2];
  v22[2] = v9;
  id v10 = [a1 _predicateForNotificationsThatAreScheduled:2];
  v22[3] = v10;
  v11 = +[NSArray arrayWithObjects:v22 count:4];
  uint64_t v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  v13 = [a1 queryWithDatabase:v6 predicate:v12];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100425BF0;
  v19[3] = &unk_100730E38;
  id v20 = v6;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v21 = v14;
  id v15 = v6;
  [v13 enumeratePersistentIDsUsingBlock:v19];
  id v16 = v21;
  id v17 = v14;

  return v17;
}

+ (id)notificationsRequiringInsertionForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForNotificationsThatAreActive:1];
  v22[0] = v8;
  id v9 = [a1 _predicateForNotificationsThatAreDelivered:2];
  v22[1] = v9;
  id v10 = [a1 _predicateForNotificationsWithScheduledDeliveryDateBeforeDate:v7];

  v22[2] = v10;
  v11 = +[NSArray arrayWithObjects:v22 count:3];
  uint64_t v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  v13 = [a1 queryWithDatabase:v6 predicate:v12];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100425E3C;
  v19[3] = &unk_100730E38;
  id v20 = v6;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v21 = v14;
  id v15 = v6;
  [v13 enumeratePersistentIDsUsingBlock:v19];
  id v16 = v21;
  id v17 = v14;

  return v17;
}

+ (id)nextRelevantNotificationForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _predicateForNotificationsThatAreNotExpiredForDate:v6];
  v30[0] = v8;
  id v9 = [a1 _predicateForNotificationsThatAreActive:1];
  v30[1] = v9;
  id v10 = [a1 _predicateForNotificationsThatAreDelivered:2];
  v30[2] = v10;
  v11 = +[NSArray arrayWithObjects:v30 count:3];
  uint64_t v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  CFStringRef v29 = @"scheduled_delivery_date";
  v13 = +[NSArray arrayWithObjects:&v29 count:1];
  CFStringRef v28 = @"ASC";
  id v14 = +[NSArray arrayWithObjects:&v28 count:1];
  id v15 = [a1 queryWithDatabase:v7 predicate:v12 orderingProperties:v13 orderingDirections:v14 limit:1];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100020DAC;
  v26 = sub_1000211C8;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10042615C;
  v19[3] = &unk_100749300;
  id v16 = v7;
  id v20 = v16;
  id v21 = &v22;
  [v15 enumeratePersistentIDsUsingBlock:v19];
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (void)deleteNotificationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 notificationWithIdentifier:a3 inDatabase:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteNotificationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllNotificationInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

- (id)notification
{
  id v3 = objc_alloc_init((Class)PKDiscoveryNotification);
  id v4 = +[DiscoveryNotification _propertySettersForNotification];
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [v4 allKeys];
  id v7 = [v5 initWithArray:v6];

  [v7 addObject:@"relevant_date_range_start_date"];
  [v7 addObject:@"relevant_date_range_end_date"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100426488;
  v13[3] = &unk_10072EDD0;
  id v14 = v4;
  id v8 = v3;
  id v15 = v8;
  id v9 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v7 withApplier:v13];
  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForNotificationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForNotificationsThatAreActive:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" notEqualToValue:&off_10078B940];
    }
    else if (a3 == 1)
    {
      id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B940];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v3;
}

+ (id)_predicateForNotificationsWithScheduledDeliveryDateBeforeDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"scheduled_delivery_date" lessThanValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForNotificationsThatAreDelivered:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = +[SQLiteBooleanPredicate truePredicate];
      goto LABEL_9;
    case 2uLL:
      id v3 = &off_10078B970;
      goto LABEL_7;
    case 1uLL:
      id v3 = &off_10078B958;
LABEL_7:
      id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"delivered" equalToValue:v3];
      goto LABEL_9;
  }
  id v4 = 0;
LABEL_9:
  return v4;
}

+ (id)_predicateForNotificationsThatAreScheduled:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      id v3 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"scheduled_delivery_date"];
    }
    else if (a3 == 1)
    {
      id v3 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"scheduled_delivery_date"];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v3;
}

+ (id)_predicateForNotificationsWithRelevantDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v16 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"relevant_date_range_start_date"];
    id v4 = (void *)_SQLValueForDate();
    id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"relevant_date_range_start_date" lessThanOrEqualToValue:v4];

    v19[0] = v16;
    v19[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v19 count:2];
    id v7 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

    id v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"relevant_date_range_end_date"];
    id v9 = (void *)_SQLValueForDate();
    id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"relevant_date_range_end_date" greaterThanOrEqualToValue:v9];

    v18[0] = v8;
    v18[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v18 count:2];
    uint64_t v12 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v11];

    v17[0] = v7;
    v17[1] = v12;
    v13 = +[NSArray arrayWithObjects:v17 count:2];
    id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  }
  else
  {
    id v14 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v14;
}

+ (id)_predicateForNotificationsThatAreNotExpiredForDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"relevant_date_range_end_date"];
    id v5 = (void *)_SQLValueForDate();
    id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"relevant_date_range_end_date" greaterThanOrEqualToValue:v5];

    v10[0] = v4;
    v10[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v10 count:2];
    id v8 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];
  }
  else
  {
    id v8 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v8;
}

+ (id)_propertySettersForNotification
{
  v4[0] = @"identifier";
  v4[1] = @"version";
  v5[0] = &stru_100750660;
  v5[1] = &stru_100750680;
  v4[2] = @"status";
  v4[3] = @"rule_identifier";
  v5[2] = &stru_1007506A0;
  v5[3] = &stru_1007506C0;
  v4[4] = @"os_version_requirement_range";
  v4[5] = @"hardware_version_range";
  v5[4] = &stru_1007506E0;
  v5[5] = &stru_100750700;
  v4[6] = @"action_type";
  v4[7] = @"title_key";
  v5[6] = &stru_100750720;
  v5[7] = &stru_100750740;
  v4[8] = @"message_key";
  v4[9] = @"action_title_key";
  v5[8] = &stru_100750760;
  v5[9] = &stru_100750780;
  v4[10] = @"action_info";
  v4[11] = @"scheduled_delivery_date";
  v5[10] = &stru_1007507A0;
  v5[11] = &stru_1007507C0;
  v4[12] = @"delivered";
  v5[12] = &stru_1007507E0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

@end
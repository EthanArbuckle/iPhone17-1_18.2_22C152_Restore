@interface DiscoveryEngagementMessage
+ (DiscoveryEngagementMessage)engagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_engagementMessagesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForActiveEngagementMessagesWithPassQualifier:(int64_t)a3;
+ (id)_predicateForCheckingRelevantDate:(id)a3;
+ (id)_predicateForEngagementMessageIdentifier:(id)a3;
+ (id)_predicateForEngagementMessagesWithPassQualifier:(int64_t)a3;
+ (id)_propertySettersForEngagementMessage;
+ (id)databaseTable;
+ (id)engagementMessagesForPassQualifier:(int64_t)a3 active:(unint64_t)a4 relevantDate:(id)a5 inDatabase:(id)a6;
+ (id)insertOrUpdateEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5;
+ (id)updateEngagementMessage:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllEngagementMessagesInDatabase:(id)a3;
+ (void)deleteEngagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEngagementMessagesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (DiscoveryEngagementMessage)initWithEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5;
- (id)_dictWithPropertiesForEngagementMessage:(id)a3;
- (id)engagementMessage;
- (int64_t)messageOrder;
- (void)setMessageOrder;
- (void)setMessageOrder:(int64_t)a3;
- (void)updateWithEngagementMessage:(id)a3;
@end

@implementation DiscoveryEngagementMessage

+ (id)databaseTable
{
  return @"papaya";
}

+ (id)engagementMessagesForPassQualifier:(int64_t)a3 active:(unint64_t)a4 relevantDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  switch(a4)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      uint64_t v12 = [a1 _predicateForActiveEngagementMessagesWithPassQualifier:a3];
      goto LABEL_6;
    case 0uLL:
LABEL_4:
      uint64_t v12 = [a1 _predicateForEngagementMessagesWithPassQualifier:a3];
LABEL_6:
      v13 = (void *)v12;
      goto LABEL_8;
  }
  v13 = 0;
LABEL_8:
  v19[0] = v13;
  v14 = [a1 _predicateForCheckingRelevantDate:v10];
  v19[1] = v14;
  v15 = +[NSArray arrayWithObjects:v19 count:2];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  v17 = [a1 _engagementMessagesInDatabase:v11 matchingPredicate:v16];

  return v17;
}

+ (DiscoveryEngagementMessage)engagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEngagementMessageIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 setMessageOrder];
  return (DiscoveryEngagementMessage *)v8;
}

+ (id)_engagementMessagesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  CFStringRef v20 = @"m";
  id v7 = a4;
  v8 = +[NSArray arrayWithObjects:&v20 count:1];
  v9 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v19 = @"pid";
  id v11 = +[NSArray arrayWithObjects:&v19 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033128;
  v16[3] = &unk_10072ED00;
  id v17 = v6;
  id v18 = v10;
  id v12 = v10;
  id v13 = v6;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];

  id v14 = [v12 copy];
  return v14;
}

+ (id)insertOrUpdateEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 identifier];
  id v11 = [a1 engagementMessageWithIdentifier:v10 inDatabase:v8];

  if (v11)
  {
    [v11 setMessageOrder:a4];
    [v11 updateWithEngagementMessage:v9];
  }
  else
  {
    id v11 = [objc_alloc((Class)a1) initWithEngagementMessage:v9 messageOrder:a4 inDatabase:v8];
  }

  return v11;
}

- (DiscoveryEngagementMessage)initWithEngagementMessage:(id)a3 messageOrder:(unint64_t)a4 inDatabase:(id)a5
{
  self->_messageOrder = a4;
  id v7 = a5;
  id v8 = [(DiscoveryEngagementMessage *)self _dictWithPropertiesForEngagementMessage:a3];
  id v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v7];

  return v9;
}

- (id)engagementMessage
{
  id v3 = objc_alloc_init((Class)PKDiscoveryEngagementMessage);
  id v4 = objc_alloc_init((Class)PKDiscoveryEngagementMessageAction);
  [v3 setAction:v4];
  v5 = +[DiscoveryEngagementMessage _propertySettersForEngagementMessage];
  id v6 = objc_alloc((Class)NSMutableArray);
  id v7 = [v5 allKeys];
  id v8 = [v6 initWithArray:v7];

  [v8 addObject:@"n"];
  [v8 addObject:@"o"];
  id v9 = [v8 copy];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100033458;
  v15[3] = &unk_10072EDD0;
  id v16 = v5;
  id v10 = v3;
  id v17 = v10;
  id v11 = v5;
  [(SQLiteEntity *)self getValuesForProperties:v9 withApplier:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

+ (id)updateEngagementMessage:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [a1 engagementMessageWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithEngagementMessage:v6];
  }

  return v9;
}

- (void)updateWithEngagementMessage:(id)a3
{
  id v4 = [(DiscoveryEngagementMessage *)self _dictWithPropertiesForEngagementMessage:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (void)deleteEngagementMessageWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEngagementMessageIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteEngagementMessagesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllEngagementMessagesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)DiscoveryEngagementMessage;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

+ (id)_predicateForEngagementMessageIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForEngagementMessagesWithPassQualifier:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    if (a3 == 3)
    {
      id v4 = +[SQLiteBooleanPredicate truePredicate];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    objc_super v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:v3];
  }
  return v4;
}

+ (id)_predicateForActiveEngagementMessagesWithPassQualifier:(int64_t)a3
{
  objc_super v3 = [a1 _predicateForEngagementMessagesWithPassQualifier:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:&off_10078A8F0];
  v8[0] = v4;
  v8[1] = v3;
  v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (id)_predicateForCheckingRelevantDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v16 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"n"];
    id v4 = (void *)_SQLValueForDate();
    v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"n" lessThanOrEqualToValue:v4];

    v19[0] = v16;
    v19[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v19 count:2];
    id v7 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

    id v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"o"];
    id v9 = (void *)_SQLValueForDate();
    id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"o" greaterThanOrEqualToValue:v9];

    v18[0] = v8;
    v18[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v18 count:2];
    id v12 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v11];

    v17[0] = v7;
    v17[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v17 count:2];
    id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  }
  else
  {
    id v14 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v14;
}

+ (id)_propertySettersForEngagementMessage
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_10072EE10;
  v5[1] = &stru_10072EE30;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10072EE50;
  v5[3] = &stru_10072EE70;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10072EE90;
  v5[5] = &stru_10072EEB0;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_10072EED0;
  v5[7] = &stru_10072EEF0;
  v4[8] = @"j";
  v4[9] = @"k";
  v5[8] = &stru_10072EF10;
  v5[9] = &stru_10072EF30;
  v4[10] = @"l";
  v4[11] = @"c";
  v5[10] = &stru_10072EF50;
  v5[11] = &stru_10072EF70;
  v4[12] = @"p";
  v4[13] = @"q";
  v5[12] = &stru_10072EF90;
  v5[13] = &stru_10072EFB0;
  v4[14] = @"r";
  v4[15] = @"s";
  v5[14] = &stru_10072EFD0;
  v5[15] = &stru_10072EFF0;
  v4[16] = @"t";
  v5[16] = &stru_10072F010;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:17];
  return v2;
}

- (id)_dictWithPropertiesForEngagementMessage:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 identifier];
  [v5 setObjectOrNull:v6 forKey:@"a"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "version"), @"b");
  id v7 = [v4 ruleIdentifier];
  [v5 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v4 osVersionRange];
  id v9 = (void *)_SQLValueForOSVersionRequirementRange();
  [v5 setObjectOrNull:v9 forKey:@"e"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "passQualifier"), @"f");
  id v10 = [v4 titleKey];
  [v5 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v4 messageKey];
  [v5 setObjectOrNull:v11 forKey:@"h"];

  id v12 = [v4 action];
  id v13 = [v12 titleKey];
  [v5 setObjectOrNull:v13 forKey:@"i"];

  id v14 = [v4 action];
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v14, "type"), @"j");

  v15 = [v4 iconURLs];
  id v16 = _SQLValueForActionIconURLs(v15);
  [v5 setObjectOrNull:v16 forKey:@"k"];

  id v17 = [v4 action];
  id v18 = [v17 actionInfo];
  CFStringRef v19 = _SQLValueForActionInfo(v18);
  [v5 setObjectOrNull:v19 forKey:@"l"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "status"), @"c");
  [v5 setInteger:self->_messageOrder forKey:@"m"];
  CFStringRef v20 = [v4 relevantDateRange];
  v21 = [v20 startDate];
  v22 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v22 forKey:@"n"];

  v23 = [v4 relevantDateRange];
  v24 = [v23 endDate];
  v25 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v25 forKey:@"o"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "viewCount"), @"p");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "canReportIdentifierToAggd"), @"q");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "maxViewCount"), @"r");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "type"), @"s");
  v26 = [v4 hardwareVersionRange];

  v27 = (void *)_SQLValueForHardwareVersionRange();
  [v5 setObjectOrNull:v27 forKey:@"t"];

  return v5;
}

- (void)setMessageOrder
{
  CFStringRef v9 = @"m";
  id v10 = &stru_10072F050;
  id v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v4 = [v3 allKeys];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000348FC;
  v6[3] = &unk_10072EDD0;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v4 withApplier:v6];
}

- (int64_t)messageOrder
{
  return self->_messageOrder;
}

- (void)setMessageOrder:(int64_t)a3
{
  self->_messageOrder = a3;
}

@end
@interface FeatureApplication
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForApplicationState:(unint64_t)a3;
+ (id)_predicateForApplicationType:(int64_t)a3;
+ (id)_predicateForFeatureApplicationIdentifier:(id)a3;
+ (id)_propertySettersForFeatureApplication;
+ (id)databaseTable;
+ (id)featureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)featureApplicationsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)featureApplicationsInDatabase:(id)a3;
+ (id)insertOrUpdateFeatureApplication:(id)a3 inDatabase:(id)a4;
+ (unint64_t)newAccountUserInvitationsCountInDatabase:(id)a3;
+ (void)deleteAllFeatureApplicationsInDatabase:(id)a3;
+ (void)deleteAllFeatureApplicationsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteFeatureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (FeatureApplication)initWithFeatureApplication:(id)a3 inDatabase:(id)a4;
- (id)featureApplication;
- (unint64_t)state;
- (void)updateWithFeatureApplication:(id)a3;
@end

@implementation FeatureApplication

+ (id)featureApplicationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForAccountIdentifier:0];
  v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v19 = @"pid";
  v8 = +[NSArray arrayWithObjects:&v19 count:1];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1004C84EC;
  v16 = &unk_10072ED00;
  id v17 = v4;
  id v18 = v7;
  id v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)featureApplicationsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v21 = @"pid";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1004C86E8;
  id v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (unint64_t)newAccountUserInvitationsCountInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForAccountIdentifier:0];
  id v6 = objc_msgSend(a1, "_predicateForApplicationType:", 2, v5);
  v13[1] = v6;
  id v7 = [a1 _predicateForApplicationState:1];
  v13[2] = v7;
  v8 = +[NSArray arrayWithObjects:v13 count:3];

  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  id v10 = [a1 queryWithDatabase:v4 predicate:v9];

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

+ (id)featureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForFeatureApplicationIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateFeatureApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 applicationIdentifier];
  id v9 = [a1 featureApplicationWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithFeatureApplication:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithFeatureApplication:v6 inDatabase:v7];
  }

  return v9;
}

- (FeatureApplication)initWithFeatureApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v6 applicationIdentifier];
  [v8 setObjectOrNull:v9 forKey:@"a"];

  id v10 = [v6 applicationBaseURL];
  id v11 = (void *)_SQLValueForURL();
  [v8 setObjectOrNull:v11 forKey:@"b"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "feature"), @"c");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "applicationState"), @"d");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "applicationStateReason"), @"e");
  id v12 = [v6 applicationTermsIdentifier];
  [v8 setObjectOrNull:v12 forKey:@"f"];

  id v13 = [v6 lastUpdated];
  uint64_t v14 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v14 forKey:@"h"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v6, "applicationStateDirty"), @"g");
  v15 = [v6 businessChatIdentifier];
  [v8 setObjectOrNull:v15 forKey:@"k"];

  uint64_t v16 = [v6 coreIDVServiceProviderName];
  [v8 setObjectOrNull:v16 forKey:@"l"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "applicationType"), @"m");
  id v17 = [v6 accountIdentifier];
  [v8 setObjectOrNull:v17 forKey:@"o"];

  id v18 = [v6 referenceIdentifier];
  [v8 setObjectOrNull:v18 forKey:@"p"];

  id v19 = [v6 preliminaryAssessmentIdentifier];
  [v8 setObjectOrNull:v19 forKey:@"q"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "featureProduct"), @"feature_product");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v6, "updateUserInfoSubType"), @"r");
  id v20 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v7];
  id v21 = [(SQLiteEntity *)v20 persistentID];
  v22 = [v6 applicationOfferDetails];
  if (v22) {
    id v23 = +[FeatureApplicationOfferDetails insertFeatureApplicationOfferDetails:v22 forApplicationPID:v21 inDatabase:v7];
  }
  v24 = [v6 declineDetails];
  if (v24) {
    +[FeatureApplicationDeclineDetails updateFeatureApplicationDeclineDetails:v24 forApplicationPID:v21 inDatabase:v7];
  }
  v25 = [v6 invitationDetails];
  if (v25)
  {
    v26 = +[NSNumber numberWithUnsignedLongLong:v21];
    +[FeatureApplicationInvitationDetails updateFeatureApplicationInvitationDetails:v25 forApplicationPID:v26 inDatabase:v7];
  }
  return v20;
}

- (void)updateWithFeatureApplication:(id)a3
{
  id v22 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v22 applicationIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = [v22 applicationBaseURL];
  id v7 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v7 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "feature"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "applicationState"), @"d");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "applicationStateReason"), @"e");
  id v8 = [v22 applicationTermsIdentifier];
  [v4 setObjectOrNull:v8 forKey:@"f"];

  id v9 = [v22 lastUpdated];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"h"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v22, "applicationStateDirty"), @"g");
  id v11 = [v22 businessChatIdentifier];
  [v4 setObjectOrNull:v11 forKey:@"k"];

  id v12 = [v22 coreIDVServiceProviderName];
  [v4 setObjectOrNull:v12 forKey:@"l"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "applicationType"), @"m");
  id v13 = [v22 accountIdentifier];
  [v4 setObjectOrNull:v13 forKey:@"o"];

  uint64_t v14 = [v22 referenceIdentifier];
  [v4 setObjectOrNull:v14 forKey:@"p"];

  v15 = [v22 preliminaryAssessmentIdentifier];
  [v4 setObjectOrNull:v15 forKey:@"q"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "featureProduct"), @"feature_product");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v22, "updateUserInfoSubType"), @"r");
  int64_t v16 = [(SQLiteEntity *)self persistentID];
  id v17 = [(SQLiteEntity *)self database];
  id v18 = [v22 applicationOfferDetails];
  if (v18) {
    +[FeatureApplicationOfferDetails updateFeatureApplicationOfferDetails:v18 forApplicationPID:v16 inDatabase:v17];
  }
  else {
    +[FeatureApplicationOfferDetails deleteFeatureApplicationOfferDetailsForApplicationPID:v16 inDatabase:v17];
  }
  id v19 = [v22 declineDetails];
  if (v19) {
    +[FeatureApplicationDeclineDetails updateFeatureApplicationDeclineDetails:v19 forApplicationPID:v16 inDatabase:v17];
  }
  else {
    +[FeatureApplicationDeclineDetails deleteFeatureApplicationDeclineDetailsForApplicationPID:v16 inDatabase:v17];
  }
  id v20 = [v22 invitationDetails];
  id v21 = +[NSNumber numberWithLongLong:v16];
  if (v20) {
    +[FeatureApplicationInvitationDetails updateFeatureApplicationInvitationDetails:v20 forApplicationPID:v21 inDatabase:v17];
  }
  else {
    +[FeatureApplicationInvitationDetails deleteFeatureApplicationInvitationDetailsForApplicationPID:v21 inDatabase:v17];
  }

  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

- (id)featureApplication
{
  id v3 = objc_alloc_init((Class)PKFeatureApplication);
  id v4 = +[FeatureApplication _propertySettersForFeatureApplication];
  v5 = [v4 allKeys];
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_1004C92DC;
  id v19 = &unk_10072EDD0;
  id v20 = v4;
  id v6 = v3;
  id v21 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v16];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[FeatureApplicationOfferDetails featureApplicationOfferDetailsForApplicationPID:v8 inDatabase:v9];
  [v6 setApplicationOfferDetails:v10];

  id v11 = +[FeatureApplicationDeclineDetails featureApplicationDeclineDetailsForApplicationPID:v8 inDatabase:v9];
  [v6 setDeclineDetails:v11];

  id v12 = +[NSNumber numberWithLongLong:v8];
  id v13 = +[FeatureApplicationInvitationDetails featureApplicationInvitationDetailsForApplicationPID:v12 inDatabase:v9];
  [v6 setInvitationDetails:v13];

  id v14 = v6;
  return v14;
}

- (unint64_t)state
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)databaseTable
{
  return @"durian";
}

+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:a3];
  int64_t v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"o"];
  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 queryWithDatabase:v6 predicate:v10];

  [v11 deleteAllEntities];
}

+ (void)deleteFeatureApplicationsNotIncludingIdentifiers:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:a3];
  id v11 = [a1 _predicateForAccountIdentifier:v9];

  v15[0] = v10;
  v15[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v15 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 queryWithDatabase:v8 predicate:v13];

  [v14 deleteAllEntities];
}

+ (void)deleteAllFeatureApplicationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForAccountIdentifier:0];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (void)deleteAllFeatureApplicationsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteFeatureApplicationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 featureApplicationWithIdentifier:a3 inDatabase:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)v2 database];
  +[FeatureApplicationOfferDetails deleteFeatureApplicationOfferDetailsForApplicationPID:v3 inDatabase:v4];
  +[FeatureApplicationDeclineDetails deleteFeatureApplicationDeclineDetailsForApplicationPID:v3 inDatabase:v4];
  id v5 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[FeatureApplicationInvitationDetails deleteFeatureApplicationInvitationDetailsForApplicationPID:v5 inDatabase:v4];

  v7.receiver = v2;
  v7.super_class = (Class)FeatureApplication;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  if (a3) {
    +[SQLiteComparisonPredicate predicateWithProperty:@"o" equalToValue:a3];
  }
  else {
  int64_t v3 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"o"];
  }
  return v3;
}

+ (id)_predicateForApplicationType:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"m" equalToValue:v3];

  return v4;
}

+ (id)_predicateForApplicationState:(unint64_t)a3
{
  int64_t v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v3];

  return v4;
}

+ (id)_predicateForFeatureApplicationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertySettersForFeatureApplication
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_1007569C8;
  v5[1] = &stru_1007569E8;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100756A08;
  v5[3] = &stru_100756A28;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_100756A48;
  v5[5] = &stru_100756A68;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_100756A88;
  v5[7] = &stru_100756AA8;
  v4[8] = @"k";
  v4[9] = @"l";
  v5[8] = &stru_100756AC8;
  v5[9] = &stru_100756AE8;
  v4[10] = @"m";
  v4[11] = @"o";
  v5[10] = &stru_100756B08;
  v5[11] = &stru_100756B28;
  v4[12] = @"p";
  v4[13] = @"q";
  v5[12] = &stru_100756B48;
  v5[13] = &stru_100756B68;
  v4[14] = @"feature_product";
  v4[15] = @"r";
  v5[14] = &stru_100756B88;
  v5[15] = &stru_100756BA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

@end
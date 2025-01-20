@interface SharingMessage
+ (BOOL)hasSharingMessage:(id)a3 transportIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForCreatedAtNewerThanDate:(id)a3;
+ (id)_predicateForCreatedAtOlderThanDate:(id)a3;
+ (id)_predicateForMessageIdentifier:(id)a3;
+ (id)_predicateForNonNullPayload;
+ (id)_predicateForPayloadHash:(id)a3;
+ (id)_predicateForTransportIdentifier:(id)a3;
+ (id)_predicateForValidTransportIdentifier;
+ (id)_propertyValuesForSharingMessage:(id)a3 storePayload:(BOOL)a4;
+ (id)_sharingMessageForProperties:(id)a3 values:(const void *)a4;
+ (id)_sharingMessagesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)allOutstandingSharingMessagesInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)properties;
+ (id)sharingMessageForMessageIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)sharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)sharingMessagesForTransportIdentifier:(id)a3 newerThanDate:(id)a4 inDatabase:(id)a5;
+ (id)transportIdentifierForSharingMessage:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessageForIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteSharingMessagesOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateSharingMessages:(id)a3 storePayloads:(BOOL)a4 transportIdentifier:(id)a5 inDatabase:(id)a6;
- (SharingMessage)initWithSharingMessage:(id)a3 storePayload:(BOOL)a4 forTransportIdentifier:(id)a5 inDatabase:(id)a6;
- (id)sharingMessage;
- (void)updateWithSharingMessage:(id)a3 storePayload:(BOOL)a4;
@end

@implementation SharingMessage

+ (id)databaseTable
{
  return @"romanesco";
}

- (SharingMessage)initWithSharingMessage:(id)a3 storePayload:(BOOL)a4 forTransportIdentifier:(id)a5 inDatabase:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(id)objc_opt_class() _propertyValuesForSharingMessage:v12 storePayload:v7];

  [v13 setObjectOrNull:v11 forKey:@"a"];
  v14 = [(SQLiteEntity *)self initWithPropertyValues:v13 inDatabase:v10];

  return v14;
}

- (void)updateWithSharingMessage:(id)a3 storePayload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _propertyValuesForSharingMessage:v6 storePayload:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v7];
}

+ (void)insertOrUpdateSharingMessages:(id)a3 storePayloads:(BOOL)a4 transportIdentifier:(id)a5 inDatabase:(id)a6
{
  BOOL v23 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v24 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v24)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        v14 = [a1 _predicateForTransportIdentifier:v9];
        v30[0] = v14;
        v25 = (void *)v13;
        v15 = [a1 _predicateForMessageIdentifier:v13];
        v30[1] = v15;
        +[NSArray arrayWithObjects:v30 count:2];
        v17 = id v16 = v9;
        v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
        v19 = [a1 anyInDatabase:v10 predicate:v18];

        if (v19) {
          [(SharingMessage *)v19 updateWithSharingMessage:v12 storePayload:v23];
        }
        else {
          v19 = [[SharingMessage alloc] initWithSharingMessage:v12 storePayload:v23 forTransportIdentifier:v16 inDatabase:v10];
        }
        id v9 = v16;
      }
      id v24 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v24);
  }
}

+ (BOOL)hasSharingMessage:(id)a3 transportIdentifier:(id)a4 inDatabase:(id)a5
{
  id v22 = a5;
  id v8 = a3;
  uint64_t v21 = [a1 _predicateForTransportIdentifier:a4];
  v24[0] = v21;
  v20 = [v8 identifier];
  id v9 = [a1 _predicateForMessageIdentifier:v20];
  v23[0] = v9;
  id v10 = [v8 payload];

  id v11 = [v10 SHA256Hash];
  id v12 = [v11 hexEncoding];
  uint64_t v13 = [a1 _predicateForPayloadHash:v12];
  v23[1] = v13;
  v14 = +[NSArray arrayWithObjects:v23 count:2];
  v15 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v14];
  v24[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v24 count:2];
  v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

  v18 = [a1 anyInDatabase:v22 predicate:v17];

  return v18 != 0;
}

+ (id)transportIdentifierForSharingMessage:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  id v8 = [a1 _predicateForMessageIdentifier:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  id v10 = [v9 valueForProperty:@"a"];

  return v10;
}

+ (id)sharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForTransportIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _sharingMessagesWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)sharingMessagesForTransportIdentifier:(id)a3 newerThanDate:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForTransportIdentifier:a3];
  v17[0] = v10;
  id v11 = [a1 _predicateForCreatedAtNewerThanDate:v9];

  v17[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:2];
  uint64_t v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 queryWithDatabase:v8 predicate:v13];
  v15 = [a1 _sharingMessagesWithQuery:v14 inDatabase:v8];

  return v15;
}

+ (id)sharingMessageForMessageIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForMessageIdentifier:a3];
  uint64_t v13 = v7;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  id v10 = [a1 anyInDatabase:v6 predicate:v9];

  id v11 = [v10 sharingMessage];

  return v11;
}

+ (void)deleteSharingMessageForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForMessageIdentifier:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteSharingMessagesForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForTransportIdentifier:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteSharingMessagesOlderThan:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCreatedAtOlderThanDate:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)allOutstandingSharingMessagesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForNonNullPayload];
  v18[0] = v5;
  id v6 = [a1 _predicateForValidTransportIdentifier];
  v18[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v18 count:2];
  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  id v9 = [a1 queryWithDatabase:v4 predicate:v8];

  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = [a1 properties];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B6654;
  v15[3] = &unk_100731410;
  id v17 = a1;
  id v12 = v10;
  id v16 = v12;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  if ([v12 count]) {
    id v13 = [v12 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)_sharingMessagesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [a1 properties];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1001B684C;
  v14 = &unk_100731410;
  id v16 = a1;
  id v8 = v6;
  id v15 = v8;
  [v5 enumeratePersistentIDsAndProperties:v7 usingBlock:&v11];

  if (objc_msgSend(v8, "count", v11, v12, v13, v14)) {
    id v9 = [v8 copy];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)sharingMessage
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10002096C;
  id v11 = sub_100020FA8;
  id v12 = 0;
  v3 = [(id)objc_opt_class() properties];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B69C8;
  v6[3] = &unk_100734FA0;
  v6[4] = self;
  v6[5] = &v7;
  [(SQLiteEntity *)self getValuesForProperties:v3 withApplier:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)_predicateForTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForMessageIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForValidTransportIdentifier
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" notEqualToValue:@"Empty"];
}

+ (id)_predicateForNonNullPayload
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"c"];
}

+ (id)_predicateForCreatedAtOlderThanDate:(id)a3
{
  v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" lessThanValue:v3];

  return v4;
}

+ (id)_predicateForCreatedAtNewerThanDate:(id)a3
{
  v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" greaterThanValue:v3];

  return v4;
}

+ (id)_predicateForPayloadHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:a3];
}

+ (id)_sharingMessageForProperties:(id)a3 values:(const void *)a4
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  void v24[2] = sub_1001B6DC4;
  v24[3] = &unk_10073CE00;
  id v5 = a3;
  id v25 = v5;
  long long v26 = a4;
  id v6 = objc_retainBlock(v24);
  uint64_t v7 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"b");
  id v8 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"c");
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"f");
    id v12 = (void *)v11;
    if (v11)
    {
      id v13 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"g");
      v14 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"h");
      id v15 = (void *)_URLForSQLValue();

      id v16 = ((void (*)(void *, const __CFString *))v6[2])(v6, @"i");
      id v17 = (void *)_URLForSQLValue();

      id v18 = [objc_alloc((Class)PKSharingMessageDisplayInformation) initWithTitle:v12 subtitle:v13 imageURL:v15 openGraphURL:v17];
    }
    else
    {
      id v18 = 0;
    }
    id v23 = 0;
    id v10 = +[PKSharingMessage specializedMessageFromPayload:v8 displayInformation:v18 outError:&v23];
    id v19 = v23;
    if (v10) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 0;
    }
    if (v20)
    {
      [v10 setIdentifier:v7];
    }
    else
    {
      uint64_t v21 = v19;

      id v10 = 0;
    }
  }
  return v10;
}

+ (id)_propertyValuesForSharingMessage:(id)a3 storePayload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v7 = [v5 identifier];
  [v6 setObjectOrNull:v7 forKey:@"b"];

  if (v4)
  {
    id v8 = [v5 payload];
    [v6 setObjectOrNull:v8 forKey:@"c"];
  }
  else
  {
    id v8 = +[NSNull null];
    [v6 setObject:v8 forKeyedSubscript:@"c"];
  }

  BOOL v9 = [v5 payload];
  id v10 = [v9 SHA256Hash];
  uint64_t v11 = [v10 hexEncoding];
  [v6 setObjectOrNull:v11 forKey:@"d"];

  id v12 = +[NSDate now];
  id v13 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v13 forKey:@"e"];

  v14 = [v5 displayInformation];
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 title];
    [v6 setObjectOrNull:v16 forKey:@"f"];

    id v17 = [v15 subtitle];
    [v6 setObjectOrNull:v17 forKey:@"g"];

    id v18 = [v15 imageURL];
    id v19 = (void *)_SQLValueForURL();
    [v6 setObjectOrNull:v19 forKey:@"h"];

    BOOL v20 = [v15 openGraphURL];
    uint64_t v21 = (void *)_SQLValueForURL();
    [v6 setObjectOrNull:v21 forKey:@"i"];
  }
  return v6;
}

+ (id)properties
{
  v4[0] = @"pid";
  v4[1] = @"a";
  v4[2] = @"b";
  v4[3] = @"c";
  v4[4] = @"d";
  v4[5] = @"e";
  v4[6] = @"f";
  v4[7] = @"g";
  v4[8] = @"h";
  v4[9] = @"i";
  v2 = +[NSArray arrayWithObjects:v4 count:10];
  return v2;
}

@end
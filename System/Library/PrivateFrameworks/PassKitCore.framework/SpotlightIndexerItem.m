@interface SpotlightIndexerItem
+ (BOOL)hasFutureActionableItemsInDatabase:(id)a3;
+ (BOOL)updateWithIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 inDatabase:(id)a6;
+ (SpotlightIndexerItem)itemWithUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForActionableItems;
+ (id)_predicateForActionableItemsInTheFuture;
+ (id)_predicateForDomainIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForNoErrorsOrNoRecentErrors;
+ (id)_predicateForRecentErrors;
+ (id)_predicateForStatus:(unint64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForIndexerItem;
+ (id)allIndexedItemsOfType:(unint64_t)a3 inDatabase:(id)a4;
+ (id)batchOfActionableItemsInDatabase:(id)a3 withCount:(unint64_t)a4;
+ (id)databaseTable;
+ (id)itemCountsOfType:(unint64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateWithIdentifier:(id)a3 domainIdentifier:(id)a4 searchableItemData:(id)a5 type:(unint64_t)a6 status:(unint64_t)a7 error:(id)a8 inDatabase:(id)a9;
+ (void)updateItemsWithDomainIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 error:(id)a6 inDatabase:(id)a7;
- (NSData)searchableItemData;
- (NSDate)lastModifiedDate;
- (NSString)domainIdentifier;
- (NSString)errorDomain;
- (NSString)uniqueIdentifier;
- (SpotlightIndexerItem)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)status;
- (unint64_t)tryCount;
- (unint64_t)type;
- (void)setDomainIdentifier:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSearchableItemData:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTryCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SpotlightIndexerItem

+ (id)databaseTable
{
  return @"index_item";
}

- (SpotlightIndexerItem)initWithPersistentID:(int64_t)a3 inDatabase:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SpotlightIndexerItem;
  v4 = [(SQLiteEntity *)&v12 initWithPersistentID:a3 inDatabase:a4];
  if (v4)
  {
    v5 = [(id)objc_opt_class() _propertySettersForIndexerItem];
    v6 = [v5 allKeys];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10039D274;
    v9[3] = &unk_10072EDD0;
    v10 = v4;
    id v11 = v5;
    id v7 = v5;
    [(SQLiteEntity *)v10 getValuesForProperties:v6 withApplier:v9];
  }
  return v4;
}

+ (BOOL)updateWithIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _predicateForIdentifier:a3];
  v18[0] = v11;
  objc_super v12 = [a1 _predicateForType:a4];
  v18[1] = v12;
  v13 = +[NSArray arrayWithObjects:v18 count:2];
  v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  v15 = [a1 anyInDatabase:v10 predicate:v14];

  if (v15)
  {
    v16 = +[NSNumber numberWithUnsignedInteger:a5];
    [v15 setValue:v16 forProperty:@"status"];
  }
  return v15 != 0;
}

+ (void)insertOrUpdateWithIdentifier:(id)a3 domainIdentifier:(id)a4 searchableItemData:(id)a5 type:(unint64_t)a6 status:(unint64_t)a7 error:(id)a8 inDatabase:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10039D584;
  v24[3] = &unk_10074D670;
  id v25 = v15;
  id v26 = a9;
  unint64_t v31 = a6;
  unint64_t v32 = a7;
  id v27 = v16;
  id v28 = v18;
  id v29 = v17;
  id v30 = a1;
  id v19 = v17;
  id v20 = v18;
  id v21 = v16;
  id v22 = v26;
  id v23 = v15;
  sub_10000817C((uint64_t)v22, v24);
}

+ (void)updateItemsWithDomainIdentifier:(id)a3 type:(unint64_t)a4 status:(unint64_t)a5 error:(id)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v25 = [a1 _predicateForDomainIdentifier:v12];
  id v15 = objc_msgSend(a1, "queryWithDatabase:predicate:", v14);
  id v16 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v33 = @"identifier";
  id v17 = +[NSArray arrayWithObjects:&v33 count:1];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10039DAB4;
  v30[3] = &unk_100731258;
  id v18 = v16;
  id v31 = v18;
  v24 = v15;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:v30];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      id v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [a1 insertOrUpdateWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * (void)v23) domainIdentifier:v12 searchableItemData:0 type:a4 status:a5 error:v13 inDatabase:v14];
        id v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v21);
  }
}

+ (SpotlightIndexerItem)itemWithUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return (SpotlightIndexerItem *)v8;
}

+ (id)batchOfActionableItemsInDatabase:(id)a3 withCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForActionableItems];
  CFStringRef v25 = @"last_error_domain";
  v8 = +[NSArray arrayWithObjects:&v25 count:1];
  CFStringRef v24 = @"ASC";
  v9 = +[NSArray arrayWithObjects:&v24 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:a4];

  id v11 = [a1 _propertySettersForIndexerItem];
  id v12 = objc_alloc_init((Class)NSMutableSet);
  id v13 = [v11 allKeys];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10039DD94;
  v19[3] = &unk_10072DE00;
  id v20 = v6;
  id v21 = v11;
  id v22 = v12;
  id v23 = a1;
  id v14 = v12;
  id v15 = v11;
  id v16 = v6;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:v19];

  id v17 = [v14 copy];
  return v17;
}

+ (id)allIndexedItemsOfType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForStatus:2];
  v29[0] = v7;
  v8 = [a1 _predicateForType:a3];
  v29[1] = v8;
  v9 = +[NSArray arrayWithObjects:v29 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  CFStringRef v28 = @"last_error_domain";
  id v11 = +[NSArray arrayWithObjects:&v28 count:1];
  CFStringRef v27 = @"ASC";
  id v12 = +[NSArray arrayWithObjects:&v27 count:1];
  id v13 = [a1 queryWithDatabase:v6 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:0];

  id v14 = [a1 _propertySettersForIndexerItem];
  id v15 = objc_alloc_init((Class)NSMutableSet);
  id v16 = [v14 allKeys];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10039E0A0;
  v22[3] = &unk_10072DE00;
  id v23 = v6;
  id v24 = v14;
  id v25 = v15;
  id v26 = a1;
  id v17 = v15;
  id v18 = v14;
  id v19 = v6;
  [v13 enumeratePersistentIDsAndProperties:v16 usingBlock:v22];

  id v20 = [v17 copy];
  return v20;
}

+ (BOOL)hasFutureActionableItemsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForRecentErrors];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:1];

  LOBYTE(v4) = (uint64_t)[v6 countOfEntities] > 0;
  return (char)v4;
}

+ (id)itemCountsOfType:(unint64_t)a3 inDatabase:(id)a4
{
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10039E2AC;
  id v11 = &unk_100737418;
  id v14 = a1;
  unint64_t v15 = a3;
  id v12 = a4;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = v13;
  id v5 = v12;
  sub_10000817C((uint64_t)v5, &v8);
  id v6 = objc_msgSend(v4, "copy", v8, v9, v10, v11);

  return v6;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForDomainIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"domain_identifier" equalToValue:a3];
}

+ (id)_predicateForStatus:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:v3];

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForNoErrorsOrNoRecentErrors
{
  v2 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"last_error_domain"];
  v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"action_try_count" lessThanValue:&off_10078B898];
  id v4 = sub_10039E7A4();
  id v5 = (void *)_SQLValueForDate();
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"last_modified_date" lessThanOrEqualToValue:v5];

  v14[0] = v3;
  v14[1] = v6;
  id v7 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"last_error_domain"];
  v14[2] = v7;
  v8 = +[NSArray arrayWithObjects:v14 count:3];
  uint64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v13[0] = v9;
  v13[1] = v2;
  id v10 = +[NSArray arrayWithObjects:v13 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v10];

  return v11;
}

+ (id)_predicateForRecentErrors
{
  v2 = +[SQLiteComparisonPredicate predicateWithProperty:@"action_try_count" lessThanValue:&off_10078B898];
  v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"action_try_count" greaterThanValue:&off_10078B8B0];
  id v4 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"action_try_count"];
  v14[0] = v4;
  id v5 = sub_10039E7A4();
  id v6 = (void *)_SQLValueForDate();
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"last_modified_date" greaterThanOrEqualToValue:v6];
  v14[1] = v7;
  v8 = +[NSArray arrayWithObjects:v14 count:2];
  uint64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v13[0] = v2;
  v13[1] = v3;
  void v13[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v13 count:3];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (id)_predicateForActionableItems
{
  v3 = [a1 _predicateForStatus:0];
  v12[0] = v3;
  id v4 = [a1 _predicateForStatus:3];
  v12[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v12 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v5];

  id v7 = [a1 _predicateForNoErrorsOrNoRecentErrors];
  v11[0] = v6;
  v11[1] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForActionableItemsInTheFuture
{
  v3 = [a1 _predicateForStatus:0];
  v12[0] = v3;
  id v4 = [a1 _predicateForStatus:3];
  v12[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v12 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v5];

  id v7 = [a1 _predicateForNoErrorsOrNoRecentErrors];
  v11[0] = v6;
  v11[1] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_propertySettersForIndexerItem
{
  v4[0] = @"identifier";
  v4[1] = @"domain_identifier";
  v5[0] = &stru_10074D6D8;
  v5[1] = &stru_10074D6F8;
  v4[2] = @"status";
  v4[3] = @"type";
  v5[2] = &stru_10074D718;
  v5[3] = &stru_10074D738;
  v4[4] = @"action_try_count";
  v4[5] = @"last_error_code";
  v5[4] = &stru_10074D758;
  v5[5] = &stru_10074D778;
  v4[6] = @"last_error_domain";
  v4[7] = @"last_modified_date";
  v5[6] = &stru_10074D798;
  v5[7] = &stru_10074D7B8;
  v4[8] = @"searchable_item";
  v5[8] = &stru_10074D7D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:self->_uniqueIdentifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_domainIdentifier forKeyedSubscript:@"domain_identifier"];
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_status];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  id v5 = +[NSNumber numberWithUnsignedInteger:self->_type];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  id v6 = +[NSNumber numberWithUnsignedInteger:self->_tryCount];
  [v3 setObject:v6 forKeyedSubscript:@"action_try_count"];

  id v7 = +[NSNumber numberWithInteger:self->_errorCode];
  [v3 setObject:v7 forKeyedSubscript:@"last_error_code"];

  [v3 setObject:self->_errorDomain forKeyedSubscript:@"last_error_domain"];
  [v3 setObject:self->_lastModifiedDate forKeyedSubscript:@"last_modified_date"];
  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)tryCount
{
  return self->_tryCount;
}

- (void)setTryCount:(unint64_t)a3
{
  self->_tryCount = a3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (NSData)searchableItemData
{
  return self->_searchableItemData;
}

- (void)setSearchableItemData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItemData, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
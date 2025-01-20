@interface DiscoveryItem
+ (BOOL)activeItemRequiringBadgeExistsForRelevantDate:(id)a3 inDatabase:(id)a4;
+ (DiscoveryItem)itemWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_predicateDismissedItems;
+ (id)_predicateForActiveOrActionedAndRelevantItems:(id)a3;
+ (id)_predicateForActiveOrActionedItems;
+ (id)_predicateForActiveOrActionedRelevantItemsRequiringBadge:(id)a3;
+ (id)_predicateForCheckingRelevantDate:(id)a3;
+ (id)_predicateForEntitledToForceLargeCard;
+ (id)_predicateForItemIdentifier:(id)a3;
+ (id)_predicateForItemsWaitinForTrigger;
+ (id)_predicateForNonTerminalItems;
+ (id)_predicateForShouldBadge;
+ (id)_predicateForViewCount:(int64_t)a3;
+ (id)_propertySettersForAccount;
+ (id)activeItemIdentifiersWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)activeItemsRequiringBadgingForRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)activeItemsWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)discoveryItemsMatchingQuery:(id)a3 inDatabase:(id)a4;
+ (id)dismissedDiscoveryItemsInDatabase:(id)a3;
+ (id)insertOrUpdateItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5;
+ (id)itemsInDatabase:(id)a3;
+ (id)itemsWaitingForTriggerInDatabase:(id)a3;
+ (id)itemsWithRelevantDate:(id)a3 inDatabase:(id)a4;
+ (id)nonTerminalItemIdentifiersInDatabase:(id)a3;
+ (id)orderedQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)updateItem:(id)a3 inDatabse:(id)a4;
+ (void)deleteAllItemsInDatabase:(id)a3;
+ (void)deleteItemWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteItemsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (DiscoveryItem)initWithItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5;
- (id)item;
- (unint64_t)itemOrder;
- (void)setItemOrder;
- (void)setItemOrder:(unint64_t)a3;
- (void)updateWithItem:(id)a3;
@end

@implementation DiscoveryItem

+ (id)dismissedDiscoveryItemsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateDismissedItems];
  v6 = [a1 orderedQueryWithPredicate:v5 inDatabase:v4];

  v7 = [a1 discoveryItemsMatchingQuery:v6 inDatabase:v4];

  return v7;
}

+ (id)activeItemsWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForActiveOrActionedAndRelevantItems:a3];
  v8 = [a1 orderedQueryWithPredicate:v7 inDatabase:v6];

  v9 = [a1 discoveryItemsMatchingQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)_predicateForActiveOrActionedAndRelevantItems:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForActiveOrActionedItems];
  v10[0] = v5;
  id v6 = [a1 _predicateForCheckingRelevantDate:v4];

  v10[1] = v6;
  v7 = +[NSArray arrayWithObjects:v10 count:2];
  v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForActiveOrActionedItems
{
  v2 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B0A0];
  v7[0] = v2;
  v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B0B8];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];

  return v5;
}

+ (id)discoveryItemsMatchingQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v19 = @"pid";
  v8 = +[NSArray arrayWithObjects:&v19 count:1];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10021B180;
  v16 = &unk_10072ED00;
  id v17 = v5;
  id v18 = v7;
  id v9 = v7;
  id v10 = v5;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)orderedQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  v13[0] = @"priority";
  v13[1] = @"item_order";
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:v13 count:2];
  v12[0] = @"DESC";
  v12[1] = @"ASC";
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  return v10;
}

+ (id)databaseTable
{
  return @"discovery_item";
}

+ (id)_predicateForCheckingRelevantDate:(id)a3
{
  return +[SQLiteBooleanPredicate truePredicate];
}

+ (id)_predicateDismissedItems
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B0D0];
}

+ (id)itemsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 orderedQueryWithPredicate:v5 inDatabase:v4];

  id v7 = [a1 discoveryItemsMatchingQuery:v6 inDatabase:v4];

  return v7;
}

+ (id)itemsWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCheckingRelevantDate:a3];
  v8 = [a1 orderedQueryWithPredicate:v7 inDatabase:v6];

  id v9 = [a1 discoveryItemsMatchingQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)activeItemsRequiringBadgingForRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForActiveOrActionedRelevantItemsRequiringBadge:a3];
  v8 = [a1 orderedQueryWithPredicate:v7 inDatabase:v6];

  id v9 = [a1 discoveryItemsMatchingQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)itemsWaitingForTriggerInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForItemsWaitinForTrigger];
  id v6 = [a1 orderedQueryWithPredicate:v5 inDatabase:v4];

  id v7 = [a1 discoveryItemsMatchingQuery:v6 inDatabase:v4];

  return v7;
}

+ (BOOL)activeItemRequiringBadgeExistsForRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForActiveOrActionedRelevantItemsRequiringBadge:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8 != 0;
}

+ (id)activeItemIdentifiersWithRelevantDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForActiveOrActionedAndRelevantItems:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v21 = @"pid";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10021B3F4;
  id v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)nonTerminalItemIdentifiersInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForNonTerminalItems];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  v17[0] = @"pid";
  v17[1] = @"identifier";
  v8 = +[NSArray arrayWithObjects:v17 count:2];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10021B5DC;
  v15 = &unk_100731258;
  id v16 = v7;
  id v9 = v7;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v12];

  id v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);
  return v10;
}

+ (DiscoveryItem)itemWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForItemIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return (DiscoveryItem *)v8;
}

+ (id)insertOrUpdateItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 identifier];
  id v11 = [a1 itemWithIdentifier:v10 inDatabase:v8];

  if (v11)
  {
    [v11 setItemOrder:a4];
    [v11 updateWithItem:v9];
  }
  else
  {
    id v11 = [objc_alloc((Class)a1) initWithItem:v9 itemOrder:a4 inDatabase:v8];
  }

  return v11;
}

- (DiscoveryItem)initWithItem:(id)a3 itemOrder:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSMutableDictionary dictionary];
  self->_itemOrder = a4;
  id v11 = [v9 identifier];
  [v10 setObjectOrNull:v11 forKey:@"identifier"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "version"), @"version");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"status");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"type");
  id v12 = [v9 ruleIdentifier];
  [v10 setObjectOrNull:v12 forKey:@"rule_identifier"];

  uint64_t v13 = [v9 triggerRuleIdentifier];
  [v10 setObjectOrNull:v13 forKey:@"trigger_rule_identifier"];

  uint64_t v14 = [v9 layoutBundleURL];
  v15 = (void *)_SQLValueForURL();
  [v10 setObjectOrNull:v15 forKey:@"layout_url"];

  id v16 = [v9 supportedLocalizations];
  id v17 = _SQLValueForSupportedLocalizations(v16);
  [v10 setObjectOrNull:v17 forKey:@"supported_localizations"];

  id v18 = [v9 osVersionRange];
  id v19 = (void *)_SQLValueForOSVersionRequirementRange();
  [v10 setObjectOrNull:v19 forKey:@"os_version_requirement_range"];

  id v20 = [v9 hardwareVersionRange];
  CFStringRef v21 = (void *)_SQLValueForHardwareVersionRange();
  [v10 setObjectOrNull:v21 forKey:@"hardware_version_range"];

  v22 = [v9 relevantDateRange];
  v23 = [v22 startDate];
  v24 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v24 forKey:@"relevant_date_range_start_date"];

  v25 = [v9 relevantDateRange];
  v26 = [v25 endDate];
  v27 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v27 forKey:@"relevant_date_range_end_date"];

  [v10 setInteger:self->_itemOrder forKey:@"item_order"];
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "viewCount"), @"view_count");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "maxViewCount"), @"max_view_count");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "maxViewCountLargeCard"), @"max_view_count_large_card");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "shouldBadge"), @"should_badge");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "priority"), @"priority");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "entitledToForceLargeCard"), @"entitled_to_force_large_card");
  v28 = [v9 clientData];

  [v10 setObjectOrNull:v28 forKey:@"clientData"];
  v29 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v29;
}

+ (id)updateItem:(id)a3 inDatabse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [a1 itemWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithItem:v6];
  }

  return v9;
}

- (void)updateWithItem:(id)a3
{
  id v4 = a3;
  id v23 = +[NSMutableDictionary dictionary];
  id v5 = [v4 identifier];
  [v23 setObjectOrNull:v5 forKey:@"identifier"];

  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "version"), @"version");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "status"), @"status");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "type"), @"type");
  id v6 = [v4 ruleIdentifier];
  [v23 setObjectOrNull:v6 forKey:@"rule_identifier"];

  id v7 = [v4 triggerRuleIdentifier];
  [v23 setObjectOrNull:v7 forKey:@"trigger_rule_identifier"];

  id v8 = [v4 layoutBundleURL];
  id v9 = (void *)_SQLValueForURL();
  [v23 setObjectOrNull:v9 forKey:@"layout_url"];

  id v10 = [v4 supportedLocalizations];
  id v11 = _SQLValueForSupportedLocalizations(v10);
  [v23 setObjectOrNull:v11 forKey:@"supported_localizations"];

  id v12 = [v4 osVersionRange];
  uint64_t v13 = (void *)_SQLValueForOSVersionRequirementRange();
  [v23 setObjectOrNull:v13 forKey:@"os_version_requirement_range"];

  uint64_t v14 = [v4 hardwareVersionRange];
  v15 = (void *)_SQLValueForHardwareVersionRange();
  [v23 setObjectOrNull:v15 forKey:@"hardware_version_range"];

  id v16 = [v4 relevantDateRange];
  id v17 = [v16 startDate];
  id v18 = (void *)_SQLValueForDate();
  [v23 setObjectOrNull:v18 forKey:@"relevant_date_range_start_date"];

  id v19 = [v4 relevantDateRange];
  id v20 = [v19 endDate];
  CFStringRef v21 = (void *)_SQLValueForDate();
  [v23 setObjectOrNull:v21 forKey:@"relevant_date_range_end_date"];

  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "viewCount"), @"view_count");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "maxViewCount"), @"max_view_count");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "maxViewCountLargeCard"), @"max_view_count_large_card");
  objc_msgSend(v23, "setBool:forKey:", objc_msgSend(v4, "shouldBadge"), @"should_badge");
  objc_msgSend(v23, "setInteger:forKey:", objc_msgSend(v4, "priority"), @"priority");
  objc_msgSend(v23, "setBool:forKey:", objc_msgSend(v4, "entitledToForceLargeCard"), @"entitled_to_force_large_card");
  v22 = [v4 clientData];

  [v23 setObjectOrNull:v22 forKey:@"clientData"];
  [(SQLiteEntity *)self setValuesWithDictionary:v23];
}

- (id)item
{
  id v3 = objc_alloc_init((Class)PKDiscoveryItem);
  id v4 = +[DiscoveryItem _propertySettersForAccount];
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [v4 allKeys];
  id v7 = [v5 initWithArray:v6];

  [v7 addObject:@"relevant_date_range_start_date"];
  [v7 addObject:@"relevant_date_range_end_date"];
  id v8 = [v7 copy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10021C0C8;
  v14[3] = &unk_10072EDD0;
  id v15 = v4;
  id v9 = v3;
  id v16 = v9;
  id v10 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v8 withApplier:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

+ (void)deleteItemWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 itemWithIdentifier:a3 inDatabase:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteItemsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllItemsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (id)_predicateForItemIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForActiveOrActionedRelevantItemsRequiringBadge:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForActiveOrActionedItems];
  v12[0] = v5;
  id v6 = [a1 _predicateForCheckingRelevantDate:v4];

  v12[1] = v6;
  id v7 = [a1 _predicateForShouldBadge];
  void v12[2] = v7;
  id v8 = [a1 _predicateForViewCount:0];
  v12[3] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:4];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForItemsWaitinForTrigger
{
  v2 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B0E8];
  id v6 = v2;
  id v3 = +[NSArray arrayWithObjects:&v6 count:1];
  id v4 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v3];

  return v4;
}

+ (id)_predicateForNonTerminalItems
{
  v2 = [a1 _predicateForActiveOrActionedItems];
  id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"status", &off_10078B100, v2 equalToValue];
  v8[1] = v3;
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:&off_10078B0E8];
  v8[2] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:3];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v5];

  return v6;
}

+ (id)_predicateForShouldBadge
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"should_badge" equalToValue:&off_10078B118];
}

+ (id)_predicateForEntitledToForceLargeCard
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"entitled_to_force_large_card" equalToValue:&off_10078B118];
}

+ (id)_predicateForViewCount:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"view_count" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccount
{
  v4[0] = @"identifier";
  v4[1] = @"version";
  v5[0] = &stru_100740DE0;
  v5[1] = &stru_100740E00;
  v4[2] = @"type";
  v4[3] = @"status";
  v5[2] = &stru_100740E20;
  v5[3] = &stru_100740E40;
  v4[4] = @"rule_identifier";
  v4[5] = @"trigger_rule_identifier";
  v5[4] = &stru_100740E60;
  v5[5] = &stru_100740E80;
  v4[6] = @"layout_url";
  v4[7] = @"supported_localizations";
  v5[6] = &stru_100740EA0;
  v5[7] = &stru_100740EC0;
  v4[8] = @"os_version_requirement_range";
  v4[9] = @"hardware_version_range";
  v5[8] = &stru_100740EE0;
  v5[9] = &stru_100740F00;
  v4[10] = @"view_count";
  v4[11] = @"max_view_count";
  v5[10] = &stru_100740F20;
  v5[11] = &stru_100740F40;
  v4[12] = @"max_view_count_large_card";
  v4[13] = @"should_badge";
  v5[12] = &stru_100740F60;
  v5[13] = &stru_100740F80;
  v4[14] = @"priority";
  v4[15] = @"entitled_to_force_large_card";
  v5[14] = &stru_100740FA0;
  v5[15] = &stru_100740FC0;
  v4[16] = @"clientData";
  v5[16] = &stru_100740FE0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:17];
  return v2;
}

- (void)setItemOrder
{
  CFStringRef v9 = @"item_order";
  id v10 = &stru_100741020;
  id v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v4 = [v3 allKeys];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10021D034;
  v6[3] = &unk_10072EDD0;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v4 withApplier:v6];
}

- (unint64_t)itemOrder
{
  return self->_itemOrder;
}

- (void)setItemOrder:(unint64_t)a3
{
  self->_itemOrder = a3;
}

@end
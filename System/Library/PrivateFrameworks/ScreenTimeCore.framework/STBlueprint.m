@interface STBlueprint
+ (BOOL)_isStateChangeValid:(int64_t)a3 forState:(int64_t)a4;
+ (BOOL)_updateConfiguration:(id)a3 withDeclaration:(id)a4 context:(id)a5 error:(id *)a6;
+ (BOOL)deleteManagedUserBlueprintForUser:(id)a3 error:(id *)a4;
+ (BOOL)deleteUsageLimitWithIdentifier:(id)a3 user:(id)a4 managedObjectContext:(id)a5 error:(id *)a6;
+ (BOOL)disableManagedUserBlueprintForUser:(id)a3 error:(id *)a4;
+ (BOOL)disableRestrictionsBlueprintForUser:(id)a3 error:(id *)a4;
+ (BOOL)removeFixedDurationOnDemandDowntimeForUserID:(id)a3 context:(id)a4 error:(id *)a5;
+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 error:(id *)a5;
+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 overwriteExistingList:(BOOL)a5 error:(id *)a6;
+ (BOOL)saveDefaultAlwaysAllowListIfNecessaryForUser:(id)a3 error:(id *)a4;
+ (BOOL)saveDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9;
+ (BOOL)saveManagedUserBlueprintForUser:(id)a3 error:(id *)a4;
+ (BOOL)saveRestrictionsBlueprintWithValuesForPresetRestrictions:(id)a3 forUser:(id)a4 error:(id *)a5;
+ (BOOL)saveUsageLimitWithIdentifier:(id)a3 user:(id)a4 bundleIdentifiers:(id)a5 webDomains:(id)a6 categoryIdentifiers:(id)a7 dailyBudgetLimit:(double)a8 budgetLimitByWeekday:(id)a9 enabled:(BOOL)a10 behaviorType:(unint64_t)a11 error:(id *)a12;
+ (BOOL)shouldUseGracePeriodForDowntimeOverride:(id)a3 configuration:(id)a4;
+ (NSArray)defaultAlwaysAllowBundleIDs;
+ (NSDateComponents)defaultEndTime;
+ (NSDateComponents)defaultStartTime;
+ (NSString)serializableClassName;
+ (id)_buildConfigurationsByDeclarationIdentifierFromBlueprint:(id)a3 error:(id *)a4;
+ (id)_buildDeclarationsFromConfigurationsByDeclarationIdentifier:(id)a3 predicate:(id)a4 identifier:(id)a5;
+ (id)_buildPredicateForDisablingBlueprint:(id)a3;
+ (id)_buildPredicateForUnspecializedBlueprint:(id)a3 usingDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_cemPredicateWithDowntimeOverride:(id)a3 shouldUseGracePeriod:(BOOL)a4 dateFormater:(id)a5 calendar:(id)a6;
+ (id)_configurationForDowntime:(id)a3 context:(id)a4;
+ (id)_createDowntimeForUser:(id)a3 organization:(id)a4 context:(id)a5;
+ (id)_declarationForDowntime:(id)a3 user:(id)a4 configuration:(id)a5 behaviorType:(unint64_t)a6 context:(id)a7 error:(id *)a8;
+ (id)_declarationModeForBehaviorType:(unint64_t)a3;
+ (id)_downtimeForUser:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_fetchOrCreateDowntimeForUserID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3;
+ (id)_getDisplayNameAndAddCategories:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t *)a5;
+ (id)_organizationIdentifierForUser:(id)a3 context:(id)a4;
+ (id)_predicateForAlwaysAllowedAppsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_predicateForDowntimeBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_predicateForManagedUserBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_predicateForRestrictionsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_predicateForUsageLimitBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_predicateForUsageLimitOverrideBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5;
+ (id)_updatedDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9;
+ (id)_updatedScheduleFromSchedule:(id)a3 withStartTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 context:(id)a7;
+ (id)_userDSIDStringForUser:(id)a3 context:(id)a4;
+ (id)_userForUserID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6;
+ (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 forUserID:(id)a5 context:(id)a6 error:(id *)a7;
+ (id)applyScheduleStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6;
+ (id)blueprintIdentifierForUser:(id)a3;
+ (id)blueprintTypeForDeclarationType:(id)a3;
+ (id)createBlueprintWithType:(id)a3 user:(id)a4;
+ (id)createManagedUserBlueprintForUser:(id)a3 error:(id *)a4;
+ (id)customScheduleTimeRangeWithLocale:(id)a3 startTimeComponents:(id)a4 endTimeComponents:(id)a5;
+ (id)displayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5;
+ (id)downtimeConfigurationForUserID:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchRequest;
+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 fromOrganization:(id)a4 includeTombstones:(BOOL)a5;
+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 fromOrganization:(id)a5 includeTombstones:(BOOL)a6;
+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6 includeTombstones:(BOOL)a7;
+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 fromOrganization:(id)a4;
+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4;
+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 fromOrganization:(id)a5;
+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6;
+ (id)fetchRequestMatchingExpiredBlueprints;
+ (id)fetchRequestMatchingOrphanedBlueprints;
+ (id)fetchRequestMatchingUnexpiredOneMoreMinuteBlueprints;
+ (id)fetchResultsRequestsForChangesToBlueprints;
+ (id)fetchResultsRequestsForChangesToBlueprintsForUserWithDSID:(id)a3;
+ (id)keyPathsForValuesAffectingDowntimeScheduleText;
+ (id)keyPathsForValuesAffectingLimitDisplayName;
+ (id)keyPathsForValuesAffectingLimitScheduleText;
+ (id)scheduleTextWithLocale:(id)a3 weekdayScheduleComparator:(id)a4 scheduleTimeGetter:(id)a5;
+ (id)simpleScheduleTimeRangeWithStartTimeComponents:(id)a3 endTimeComponents:(id)a4;
+ (void)_addCommonPredicatesForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6;
+ (void)_addExpirationPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5;
+ (void)_addMinimumInstallationDatePredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5;
+ (void)_addSchedulePredicatesForBlueprintScheudle:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6;
+ (void)_addUserPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4;
+ (void)_addWebDomains:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t)a5 totalCount:(unint64_t)a6 completionHandler:(id)a7;
+ (void)_createDisplayNameWithItemNames:(id)a3 itemCount:(unint64_t)a4 completionHandler:(id)a5;
+ (void)fetchDisplayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5 completionHandler:(id)a6;
- (BOOL)_validateBlueprintConfiguration:(id)a3;
- (BOOL)_validateBlueprintIdentifier:(id)a3;
- (BOOL)_validateNumberOfBlueprints:(id)a3;
- (BOOL)_validateType:(id)a3;
- (BOOL)_validateUsersOnBlueprint:(id)a3;
- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5;
- (BOOL)removeFixedDurationOnDemandDowntimeWithError:(id *)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)downtimeScheduleText;
- (NSString)limitDisplayName;
- (NSString)limitScheduleText;
- (STDowntimeConfiguration)downtimeConfiguration;
- (id)_applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6;
- (id)_applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 atDate:(id)a5 inCalendar:(id)a6 error:(id *)a7;
- (id)_applyScheduleStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6;
- (id)_downtimeConfigurationAtDate:(id)a3 inCalendar:(id)a4;
- (id)_webFilterBlacklistStringsForURL:(id)a3;
- (id)activeOverride;
- (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 error:(id *)a4;
- (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 error:(id *)a5;
- (id)applyScheduleStateChange:(int64_t)a3 error:(id *)a4;
- (id)computeUniqueIdentifier;
- (id)declarationsWithError:(id *)a3;
- (id)dictionaryRepresentation;
- (void)_reportCoreAnalyticsEventForDowntimeOverride:(id)a3 currentDate:(id)a4;
- (void)_updateActiveOverrideAfterScheduleChange;
- (void)awakeFromInsert;
- (void)didChangeValueForKey:(id)a3;
- (void)disableDowntimeForDay:(unint64_t)a3;
- (void)migrateToVersion2CategoriesIfNeeded;
- (void)setDowntimeEnabled:(BOOL)a3;
- (void)setStartTime:(id)a3 endTime:(id)a4;
- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5;
- (void)setUsageLimitEnabled:(BOOL)a3;
- (void)tombstone;
@end

@implementation STBlueprint

- (void)tombstone
{
  [(STBlueprint *)self setEnabled:0];
  [(STBlueprint *)self setLimitEnabled:0];
  [(STBlueprint *)self setIsTombstoned:1];
  if (_os_feature_enabled_impl())
  {
    [(STBlueprint *)self setIsDirty:1];
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:604800.0];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(STBlueprint *)self setExpiration:v3];
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)STBlueprint;
  [(STUniquedManagedObject *)&v4 awakeFromInsert];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(STBlueprint *)self setPrimitiveValue:v3 forKey:@"modificationDate"];
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STBlueprint;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (id)fetchRequestMatchingExpiredBlueprints
{
  v2 = [a1 fetchRequest];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  objc_super v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 startOfDayForDate:v3];
  v7 = [v4 predicateWithFormat:@"(%K < %@) OR ((%K < %@) AND (NOT %K BEGINSWITH %@))", @"expiration", v6, @"expiration", v3, @"identifier", @"one_more_minute"];
  [v2 setPredicate:v7];

  return v2;
}

+ (id)fetchRequestMatchingOrphanedBlueprints
{
  v2 = [a1 fetchRequest];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count == 0", @"users");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestMatchingUnexpiredOneMoreMinuteBlueprints
{
  v2 = [a1 fetchRequest];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  objc_super v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = [v4 startOfDayForDate:v5];
  v7 = [v3 predicateWithFormat:@"(%K BEGINSWITH %@) AND (%K >= %@)", @"identifier", @"one_more_minute", @"expiration", v6];
  [v2 setPredicate:v7];

  return v2;
}

+ (id)_fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3
{
  id v4 = a3;
  v5 = [a1 fetchRequest];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K == %@ AND %K == NO", @"users.dsid", v4, @"isTombstoned"];

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 fetchRequest];
  v9 = &unk_1F349EC08;
  if (v7) {
    v9 = v7;
  }
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == NO", v9, @"users.dsid", @"type", v6, @"isTombstoned"];

  [v8 setPredicate:v10];
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 fromOrganization:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 fetchRequest];
  v9 = &unk_1F349EC08;
  if (v7) {
    v9 = v7;
  }
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == NO", v9, @"users.dsid", @"organization", v6, @"isTombstoned"];

  [v8 setPredicate:v10];
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 fromOrganization:(id)a4 includeTombstones:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 fetchRequest];
  if (v5) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@", v9, @"users", @"organization", v8, v13];
  }
  else {
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == NO", v9, @"users", @"organization", v8, @"isTombstoned"];
  }

  [v10 setPredicate:v11];
  return v10;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 fromOrganization:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 fetchRequest];
  v12 = &unk_1F349EC08;
  if (v10) {
    v12 = v10;
  }
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@ AND %K == NO", v12, @"users.dsid", @"type", v9, @"organization", v8, @"isTombstoned"];

  [v11 setPredicate:v13];
  return v11;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [a1 fetchRequest];
  v15 = &unk_1F349EC08;
  if (v13) {
    v15 = v13;
  }
  v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@ AND %K == NO", v15, @"users.dsid", @"type", v12, @"identifier", v11, @"organization", v10, @"isTombstoned"];

  [v14 setPredicate:v16];
  return v14;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 fromOrganization:(id)a5 includeTombstones:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a1 fetchRequest];
  if (v6) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@", v12, @"users", @"type", v11, @"organization", v10, v16];
  }
  else {
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@ AND %K == NO", v12, @"users", @"type", v11, @"organization", v10, @"isTombstoned"];
  }

  [v13 setPredicate:v14];
  return v13;
}

+ (id)fetchRequestMatchingBlueprintsForUser:(id)a3 ofType:(id)a4 withIdentifier:(id)a5 fromOrganization:(id)a6 includeTombstones:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [a1 fetchRequest];
  if (v7) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@", v15, @"users", @"type", v14, @"identifier", v13, @"organization", v12, v19];
  }
  else {
  v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K AND %K == %@ AND %K == %@ AND %K == %@ AND %K == NO", v15, @"users", @"type", v14, @"identifier", v13, @"organization", v12, @"isTombstoned"];
  }

  [v16 setPredicate:v17];
  return v16;
}

+ (id)fetchResultsRequestsForChangesToBlueprints
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v13 = [a1 fetchRequest];
  v2 = +[STFetchResultsRequest requestWithFetchRequest:v13];
  v14[0] = v2;
  id v3 = +[STBlueprintSchedule fetchRequest];
  id v4 = +[STFetchResultsRequest requestWithFetchRequest:v3];
  v14[1] = v4;
  BOOL v5 = +[STBlueprintUsageLimit fetchRequest];
  BOOL v6 = +[STFetchResultsRequest requestWithFetchRequest:v5];
  v14[2] = v6;
  BOOL v7 = +[STBlueprintConfiguration fetchRequest];
  id v8 = +[STFetchResultsRequest requestWithFetchRequest:v7];
  v14[3] = v8;
  id v9 = +[STCoreOrganizationSettings fetchRequest];
  id v10 = +[STFetchResultsRequest requestWithFetchRequest:v9];
  v14[4] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];

  return v11;
}

+ (id)fetchResultsRequestsForChangesToBlueprintsForUserWithDSID:(id)a3
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28F60];
  if (a3) {
    id v5 = a3;
  }
  else {
    id v5 = &unk_1F349EC08;
  }
  id v6 = a3;
  v21 = [v4 predicateWithFormat:@"%@ IN %K", v5, @"blueprint.users.dsid"];
  v20 = +[STBlueprintSchedule fetchRequest];
  [v20 setPredicate:v21];
  uint64_t v19 = +[STBlueprintUsageLimit fetchRequest];
  [v19 setPredicate:v21];
  BOOL v7 = +[STBlueprintConfiguration fetchRequest];
  [v7 setPredicate:v21];
  id v8 = +[STCoreOrganizationSettings fetchRequest];
  id v9 = +[STCoreDowntimeOverride fetchRequest];
  id v10 = [a1 _fetchRequestMatchingBlueprintsForUserWithDSID:v6];

  id v11 = +[STFetchResultsRequest requestWithFetchRequest:v10];
  v22[0] = v11;
  id v12 = +[STFetchResultsRequest requestWithFetchRequest:v20];
  v22[1] = v12;
  id v13 = +[STFetchResultsRequest requestWithFetchRequest:v19];
  v22[2] = v13;
  id v14 = +[STFetchResultsRequest requestWithFetchRequest:v7];
  v22[3] = v14;
  id v15 = +[STFetchResultsRequest requestWithFetchRequest:v8];
  v22[4] = v15;
  uint64_t v16 = +[STFetchResultsRequest requestWithFetchRequest:v9];
  v22[5] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6];

  return v18;
}

+ (id)createBlueprintWithType:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 managedObjectContext];
  id v9 = [[STBlueprint alloc] initWithContext:v8];
  id v10 = objc_opt_new();
  [(STBlueprint *)v9 setCreationDate:v10];

  [(STBlueprint *)v9 setType:v7];
  id v11 = [a1 blueprintIdentifierForUser:v6];
  [(STBlueprint *)v9 setIdentifier:v11];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = [v6 objectID];
  id v14 = [v8 objectWithID:v13];
  id v15 = [v12 setWithObject:v14];
  [(STBlueprint *)v9 setUsers:v15];

  uint64_t v16 = [v6 managingOrganization];

  [(STBlueprint *)v9 setOrganization:v16];
  return v9;
}

+ (id)blueprintIdentifierForUser:(id)a3
{
  id v3 = a3;
  id v4 = [v3 organizationIdentifier];
  if ([v4 isEqualToString:@"family"])
  {
    id v5 = NSString;
    id v6 = [v3 dsid];
    id v7 = [v5 stringWithFormat:@"%@.%@", @"digital_health_restrictions", v6];
  }
  else
  {
    id v7 = @"digital_health_restrictions";
  }

  return v7;
}

- (id)declarationsWithError:(id *)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar", a3);
  id v5 = objc_opt_new();
  id v6 = [v4 timeZone];
  [v5 setTimeZone:v6];

  id v7 = [(STBlueprint *)self type];
  if ([v7 isEqualToString:@"downtime"])
  {
    uint64_t v8 = +[STBlueprint _predicateForDowntimeBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  else if ([v7 isEqualToString:@"usage-limit"])
  {
    uint64_t v8 = +[STBlueprint _predicateForUsageLimitBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  else if ([v7 isEqualToString:@"usage-limit-override"])
  {
    uint64_t v8 = +[STBlueprint _predicateForUsageLimitOverrideBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  else if ([v7 isEqualToString:@"always-allowed-apps"])
  {
    uint64_t v8 = +[STBlueprint _predicateForAlwaysAllowedAppsBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  else if ([v7 isEqualToString:@"restrictions"])
  {
    uint64_t v8 = +[STBlueprint _predicateForRestrictionsBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  else
  {
    if (![v7 isEqualToString:@"managed-user"])
    {
      id v9 = +[STLog blueprint];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[STBlueprint declarationsWithError:]();
      }
      goto LABEL_18;
    }
    uint64_t v8 = +[STBlueprint _predicateForManagedUserBlueprint:self withDateFormatter:v5 calendar:v4];
  }
  id v9 = v8;
  if (v8)
  {
    id v15 = 0;
    id v10 = +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:self error:&v15];
    id v11 = v15;
    if (v10)
    {
      id v12 = [(STBlueprint *)self identifier];
      id v13 = +[STBlueprint _buildDeclarationsFromConfigurationsByDeclarationIdentifier:v10 predicate:v9 identifier:v12];
    }
    else
    {
      id v13 = 0;
    }

    goto LABEL_21;
  }
  id v9 = +[STLog blueprint];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[STBlueprint declarationsWithError:](self);
  }
LABEL_18:
  id v11 = 0;
  id v13 = 0;
LABEL_21:

  return v13;
}

+ (id)_predicateForDowntimeBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"downtime"];

  if (v12)
  {
    id v13 = objc_opt_new();
    id v14 = objc_opt_new();
    [a1 _addCommonPredicatesForBlueprint:v8 toAllPredicates:v13 usingDateFormatter:v9 calendar:v10];
    id v15 = [v8 activeOverride];
    if (!v15)
    {
LABEL_18:
      v24 = [MEMORY[0x1E4F59F88] buildWithPredicates:v13];
      if ([v14 count])
      {
        if ([v13 count]) {
          [v14 addObject:v24];
        }
        id v25 = [MEMORY[0x1E4F59F90] buildWithPredicates:v14];
      }
      else
      {
        id v25 = v24;
      }
      v20 = v25;

      goto LABEL_24;
    }
    uint64_t v16 = [v8 configurations];
    v17 = [v16 anyObject];

    id v18 = +[STBlueprint _cemPredicateWithDowntimeOverride:shouldUseGracePeriod:dateFormater:calendar:](STBlueprint, "_cemPredicateWithDowntimeOverride:shouldUseGracePeriod:dateFormater:calendar:", v15, +[STBlueprint shouldUseGracePeriodForDowntimeOverride:v15 configuration:v17], v9, v10);
    if (v18)
    {
      uint64_t v19 = [v15 state];
      if (v19)
      {
        if (v19 == 1) {
          [v14 addObject:v18];
        }
        goto LABEL_17;
      }
      v22 = [v8 schedule];
      int v23 = [v22 enabled];

      if (v23) {
        [MEMORY[0x1E4F59FC8] buildWithPredicate:v18];
      }
      else {
      v21 = [MEMORY[0x1E4F59FC0] build];
      }
      [v13 addObject:v21];
    }
    else
    {
      v21 = +[STLog blueprint];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138543362;
        v28 = v15;
        _os_log_impl(&dword_1DA519000, v21, OS_LOG_TYPE_DEFAULT, "Did not create CEM predicate for downtime override: %{public}@", (uint8_t *)&v27, 0xCu);
      }
    }

LABEL_17:
    goto LABEL_18;
  }
  id v13 = +[STLog blueprint];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[STBlueprint _predicateForDowntimeBlueprint:withDateFormatter:calendar:](v8);
  }
  v20 = 0;
LABEL_24:

  return v20;
}

+ (id)_predicateForUsageLimitBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"usage-limit"];

  if (v12)
  {
    id v13 = [a1 _buildPredicateForDisablingBlueprint:v8];
    id v14 = v13;
    if (v13)
    {
      id v14 = v13;
      id v15 = v14;
    }
    else if ([v8 limitEnabled])
    {
      v17 = objc_opt_new();
      [a1 _addCommonPredicatesForBlueprint:v8 toAllPredicates:v17 usingDateFormatter:v9 calendar:v10];
      id v18 = [v8 usageLimit];
      uint64_t v19 = v18;
      if (v18)
      {
        v81 = v17;
        id v82 = v9;
        v83 = v8;
        v20 = [v18 budgetLimitScheduleRepresentation];
        v21 = [v19 applicationIdentifiers];
        v22 = [v19 categoryIdentifiers];
        int v23 = [v19 categoryIdentifiersVersion2];
        v84 = v19;
        v24 = [v19 websiteIdentifiers];
        v79 = v21;
        v80 = v20;
        v77 = v23;
        v78 = v22;
        v76 = v24;
        if ([v21 count]
          || [v22 count]
          || [v23 count]
          || [v24 count])
        {
          uint64_t v74 = [MEMORY[0x1E4F59FB0] buildWithApps:v21 withWebSites:v24 withCategories:v22 withCategoriesVersion2:v23];
          id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v26 = [v20 customScheduleItems];
          int v27 = objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          obuint64_t j = [v20 customScheduleItems];
          uint64_t v28 = [obj countByEnumeratingWithState:&v92 objects:v103 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v93;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v93 != v30) {
                  objc_enumerationMutation(obj);
                }
                v32 = *(void **)(*((void *)&v92 + 1) + 8 * i);
                v33 = (void *)MEMORY[0x1E4F59FB8];
                v34 = NSNumber;
                [v32 budgetLimit];
                v35 = objc_msgSend(v34, "numberWithDouble:");
                v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "day"));
                v102 = v36;
                v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
                v38 = [v33 buildWithSeconds:v35 withDays:v37];

                [v27 addObject:v38];
              }
              uint64_t v29 = [obj countByEnumeratingWithState:&v92 objects:v103 count:16];
            }
            while (v29);
          }

          v39 = (void *)MEMORY[0x1E4F59FA8];
          v40 = [v10 calendarIdentifier];
          v41 = NSNumber;
          v42 = [v84 notificationTimeInterval];
          v43 = objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v42, "integerValue"));
          v101 = v43;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
          v45 = (void *)v74;
          v46 = [v39 buildWithCalendarIdentifier:v40 withMonitors:v74 withNotificationTimes:v44 withTimeBudget:v27];
        }
        else
        {
          uint64_t v53 = *MEMORY[0x1E4F59F00];
          v99[0] = @"app";
          v99[1] = @"webdomain";
          uint64_t v54 = *MEMORY[0x1E4F59F10];
          v100[0] = v53;
          v100[1] = v54;
          v99[2] = @"category";
          v100[2] = *MEMORY[0x1E4F59F08];
          v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
          id v55 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v56 = [v20 customScheduleItems];
          v57 = objc_msgSend(v55, "initWithCapacity:", objc_msgSend(v56, "count"));

          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id obja = [v20 customScheduleItems];
          uint64_t v58 = [obja countByEnumeratingWithState:&v88 objects:v98 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v89;
            do
            {
              for (uint64_t j = 0; j != v59; ++j)
              {
                if (*(void *)v89 != v60) {
                  objc_enumerationMutation(obja);
                }
                v62 = *(void **)(*((void *)&v88 + 1) + 8 * j);
                v63 = (void *)MEMORY[0x1E4F59FA0];
                v64 = NSNumber;
                [v62 budgetLimit];
                v65 = objc_msgSend(v64, "numberWithDouble:");
                v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v62, "day"));
                v97 = v66;
                v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
                v68 = [v63 buildWithSeconds:v65 withDays:v67];

                [v57 addObject:v68];
              }
              uint64_t v59 = [obja countByEnumeratingWithState:&v88 objects:v98 count:16];
            }
            while (v59);
          }

          v40 = [v84 itemIdentifiers];
          v69 = (void *)MEMORY[0x1E4F59F98];
          v42 = [v10 calendarIdentifier];
          v43 = [v84 usageItemType];
          v45 = v75;
          v44 = [v75 objectForKeyedSubscript:v43];
          v70 = NSNumber;
          id objb = [v84 notificationTimeInterval];
          v73 = objc_msgSend(v70, "numberWithInteger:", objc_msgSend(objb, "integerValue"));
          v96 = v73;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
          v72 = v69;
          int v27 = v57;
          v46 = [v72 buildWithCalendarIdentifier:v42 withMonitor:v44 withIdentifiers:v40 withIdentifiersVersion2:v40 withNotificationTimes:v71 withTimeBudget:v57];
        }
        id v8 = v83;
        v17 = v81;
        id v14 = 0;
        if ([v83 invertUsageLimit])
        {
          v47 = [MEMORY[0x1E4F59FC8] buildWithPredicate:v46];
          [v81 addObject:v47];
        }
        else
        {
          [v81 addObject:v46];
        }
        id v9 = v82;
        uint64_t v19 = v84;
      }
      id v15 = [MEMORY[0x1E4F59F88] buildWithPredicates:v17];
    }
    else
    {
      v48 = +[STLog blueprint];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = [v8 identifier];
        *(_DWORD *)buf = 138543362;
        v106 = v49;
        _os_log_impl(&dword_1DA519000, v48, OS_LOG_TYPE_DEFAULT, "Usage limit is disabled: %{public}@)", buf, 0xCu);
      }
      v50 = (void *)MEMORY[0x1E4F59F88];
      v51 = [MEMORY[0x1E4F59FC0] build];
      v104 = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
      id v15 = [v50 buildWithPredicates:v52];
    }
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint _predicateForUsageLimitBlueprint:withDateFormatter:calendar:](v8);
    }
    id v15 = 0;
  }

  return v15;
}

+ (id)_predicateForUsageLimitOverrideBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"usage-limit-override"];

  if (v12)
  {
    id v13 = [a1 _buildPredicateForUnspecializedBlueprint:v8 usingDateFormatter:v9 calendar:v10];
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint _predicateForUsageLimitOverrideBlueprint:withDateFormatter:calendar:](v8);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)_predicateForAlwaysAllowedAppsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"always-allowed-apps"];

  if (v12)
  {
    id v13 = [a1 _buildPredicateForUnspecializedBlueprint:v8 usingDateFormatter:v9 calendar:v10];
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint _predicateForAlwaysAllowedAppsBlueprint:withDateFormatter:calendar:](v8);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)_predicateForRestrictionsBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"restrictions"];

  if (v12)
  {
    id v13 = [a1 _buildPredicateForUnspecializedBlueprint:v8 usingDateFormatter:v9 calendar:v10];
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint _predicateForRestrictionsBlueprint:withDateFormatter:calendar:](v8);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)_predicateForManagedUserBlueprint:(id)a3 withDateFormatter:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  char v12 = [v11 isEqualToString:@"managed-user"];

  if (v12)
  {
    id v13 = [a1 _buildPredicateForUnspecializedBlueprint:v8 usingDateFormatter:v9 calendar:v10];
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint _predicateForManagedUserBlueprint:withDateFormatter:calendar:](v8);
    }

    id v13 = 0;
  }

  return v13;
}

+ (id)_buildPredicateForDisablingBlueprint:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 enabled])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = +[STLog blueprint];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 identifier];
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Blueprint is disabled: %{public}@)", buf, 0xCu);
    }
    id v7 = (void *)MEMORY[0x1E4F59F88];
    id v8 = [MEMORY[0x1E4F59FC0] build];
    id v11 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    id v4 = [v7 buildWithPredicates:v9];
  }
  return v4;
}

+ (void)_addExpirationPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v14 expiration];

  if (v9)
  {
    [v8 setFormatOptions:1907];
    id v10 = (void *)MEMORY[0x1E4F59FD0];
    id v11 = [v14 expiration];
    char v12 = [v8 stringFromDate:v11];
    id v13 = [v10 buildRequiredOnlyWithDateTime:v12];

    [v7 addObject:v13];
  }
}

+ (void)_addMinimumInstallationDatePredicateForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [a3 minimumInstallationDate];
  if (v8)
  {
    [v7 setFormatOptions:1907];
    id v9 = (void *)MEMORY[0x1E4F59FD0];
    id v10 = [v7 stringFromDate:v8];
    id v11 = [v9 buildRequiredOnlyWithDateTime:v10];

    char v12 = [MEMORY[0x1E4F59FC8] buildWithPredicate:v11];
    [v13 addObject:v12];
  }
}

+ (void)_addUserPredicateForBlueprint:(id)a3 toAllPredicates:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 users];
  unint64_t v8 = [v7 count];

  if (v8 > 1) {
    goto LABEL_2;
  }
  if (v8 == 1)
  {
    v20 = [v5 users];
    v21 = [v20 anyObject];
    v22 = [v21 localSettings];

    if (!v22)
    {
LABEL_2:
      int v23 = v6;
      id v9 = objc_opt_new();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v10 = [v5 users];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = (void *)MEMORY[0x1E4F59FE0];
            uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dsid];
            v17 = [v16 stringValue];
            id v18 = [v15 buildWithDSID:v17];
            [v9 addObject:v18];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v12);
      }

      uint64_t v19 = [MEMORY[0x1E4F59F90] buildWithPredicates:v9];
      id v6 = v23;
      [v23 addObject:v19];
    }
  }
}

+ (void)_addSchedulePredicatesForBlueprintScheudle:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v67 = a6;
  if ([v9 enabled])
  {
    uint64_t v53 = v10;
    v62 = v9;
    uint64_t v12 = [v9 scheduleRepresentation];
    [v11 setFormatOptions:544];
    uint64_t v66 = [v67 maximumRangeOfUnit:512];
    uint64_t v14 = v13;
    id v15 = objc_opt_new();
    uint64_t v16 = [v67 startOfDayForDate:v15];

    v51 = (void *)v16;
    id v55 = [v11 stringFromDate:v16];
    v63 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v52 = v12;
    obuint64_t j = [v12 customScheduleItems];
    uint64_t v65 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (!v65) {
      goto LABEL_19;
    }
    uint64_t v54 = v14 - 1;
    uint64_t v64 = *(void *)v70;
    id v61 = v11;
    while (1)
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v70 != v64) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v19 = [v18 day];
        uint64_t v20 = v19 + v66;
        v21 = [v18 startTime];
        v22 = [v67 dateFromComponents:v21];

        int v23 = [v18 endTime];
        long long v24 = [v67 dateFromComponents:v23];

        v68 = [v11 stringFromDate:v22];
        long long v25 = [v11 stringFromDate:v24];
        uint64_t v26 = [v22 compare:v24];
        if (v26 == 1)
        {
          uint64_t v58 = v22;
          if (v19 == v54) {
            uint64_t v35 = v66;
          }
          else {
            uint64_t v35 = v20 + 1;
          }
          v34 = [NSNumber numberWithUnsignedInteger:v35];
          v36 = (void *)MEMORY[0x1E4F59FD8];
          v37 = [v67 calendarIdentifier];
          v38 = [NSNumber numberWithUnsignedInteger:v20];
          uint64_t v60 = v25;
          v39 = NSNumber;
          v40 = [v62 notificationTimeInterval];
          v41 = objc_msgSend(v39, "numberWithInteger:", objc_msgSend(v40, "integerValue"));
          v73 = v41;
          v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          v43 = [v36 buildWithCalendarIdentifier:v37 withStartDay:v38 withStartTime:v68 withEndDay:v34 withEndTime:v55 withNotificationTimes:v42];

          long long v25 = v60;
          [v63 addObject:v43];
          if (([v60 isEqualToString:v55] & 1) == 0)
          {
            v44 = (void *)MEMORY[0x1E4F59FD8];
            v45 = [v67 calendarIdentifier];
            v46 = [v44 buildWithCalendarIdentifier:v45 withStartDay:v34 withStartTime:v55 withEndDay:v34 withEndTime:v60 withNotificationTimes:MEMORY[0x1E4F1CBF0]];

            [v63 addObject:v46];
          }

          v22 = v58;
        }
        else
        {
          if (v26 != -1) {
            goto LABEL_17;
          }
          uint64_t v59 = (void *)MEMORY[0x1E4F59FD8];
          v57 = [v67 calendarIdentifier];
          long long v27 = [NSNumber numberWithUnsignedInteger:v20];
          uint64_t v28 = [NSNumber numberWithUnsignedInteger:v20];
          uint64_t v29 = NSNumber;
          [v62 notificationTimeInterval];
          v31 = uint64_t v30 = v25;
          v32 = objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v31, "integerValue"));
          uint64_t v74 = v32;
          v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          v34 = [v59 buildWithCalendarIdentifier:v57 withStartDay:v27 withStartTime:v68 withEndDay:v28 withEndTime:v30 withNotificationTimes:v33];

          long long v25 = v30;
          [v63 addObject:v34];
        }

        id v11 = v61;
LABEL_17:
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (!v65)
      {
LABEL_19:

        v47 = [MEMORY[0x1E4F59F90] buildWithPredicates:v63];
        id v10 = v53;
        [v53 addObject:v47];

        id v9 = v62;
        v48 = v52;
        goto LABEL_22;
      }
    }
  }
  v48 = +[STLog blueprint];
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = [v9 blueprint];
    v50 = [v49 identifier];
    *(_DWORD *)buf = 138543362;
    v77 = v50;
    _os_log_impl(&dword_1DA519000, v48, OS_LOG_TYPE_DEFAULT, "Schedule is not enabled for blueprint: %{public}@", buf, 0xCu);
  }
LABEL_22:
}

+ (void)_addCommonPredicatesForBlueprint:(id)a3 toAllPredicates:(id)a4 usingDateFormatter:(id)a5 calendar:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [a1 _addExpirationPredicateForBlueprint:v15 toAllPredicates:v10 usingDateFormatter:v11];
  [a1 _addMinimumInstallationDatePredicateForBlueprint:v15 toAllPredicates:v10 usingDateFormatter:v11];
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [a1 _addUserPredicateForBlueprint:v15 toAllPredicates:v10];
  }
  uint64_t v13 = [v15 schedule];

  if (v13)
  {
    uint64_t v14 = [v15 schedule];
    [a1 _addSchedulePredicatesForBlueprintScheudle:v14 toAllPredicates:v10 usingDateFormatter:v11 calendar:v12];
  }
}

+ (id)_buildPredicateForUnspecializedBlueprint:(id)a3 usingDateFormatter:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 _buildPredicateForDisablingBlueprint:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    [a1 _addCommonPredicatesForBlueprint:v8 toAllPredicates:v14 usingDateFormatter:v9 calendar:v10];
    id v13 = [MEMORY[0x1E4F59F88] buildWithPredicates:v14];
  }
  return v13;
}

+ (id)_buildConfigurationsByDeclarationIdentifierFromBlueprint:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [v4 configurations];
  id v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = [v4 configurations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    id v25 = v4;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
      uint64_t v14 = [v13 payloadPlist];

      if (!v14) {
        break;
      }
      id v15 = (void *)MEMORY[0x1E4F59F38];
      uint64_t v16 = [v13 payloadPlist];
      id v27 = 0;
      v17 = [v15 declarationForData:v16 error:&v27];
      id v18 = v27;

      if (!v17)
      {
        int v23 = +[STLog persistence];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:]();
        }

        if (a4) {
          *a4 = v18;
        }

        id v4 = v25;
LABEL_21:

        uint64_t v20 = 0;
        goto LABEL_22;
      }
      uint64_t v19 = [v17 declarationIdentifier];
      [v7 setObject:v17 forKeyedSubscript:v19];

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        id v4 = v25;
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    v21 = +[STLog persistence];
    id v4 = v25;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:]();
    }

    if (a4)
    {
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:14 userInfo:0];

      if (v22)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:14 userInfo:0];
      }
    }
    goto LABEL_21;
  }
LABEL_10:

  uint64_t v20 = (void *)[v7 copy];
LABEL_22:

  return v20;
}

+ (id)_buildDeclarationsFromConfigurationsByDeclarationIdentifier:(id)a3 predicate:(id)a4 identifier:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = (void *)MEMORY[0x1E4F59F20];
  uint64_t v12 = [v7 allKeys];
  id v13 = [v11 buildWithIdentifier:v9 withStandardConfigurations:v12 withPredicate:v8];

  uint64_t v14 = [v13 serialize];
  [v10 addObject:v14];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = objc_msgSend(v7, "allValues", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) serialize];
        [v10 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  v21 = (void *)[v10 copy];
  return v21;
}

+ (BOOL)shouldUseGracePeriodForDowntimeOverride:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  if ([a3 state] == 1)
  {
    if (v5)
    {
      id v6 = [v5 payloadPlist];

      if (v6)
      {
        id v7 = (void *)MEMORY[0x1E4F59F40];
        id v8 = [v5 payloadPlist];
        id v17 = 0;
        id v9 = [v7 declarationForData:v8 error:&v17];
        uint64_t v10 = v17;

        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [v9 payloadMode];
            int v12 = [v11 isEqualToString:*MEMORY[0x1E4F59ED8]];

            if (v12)
            {
              id v13 = +[STLog blueprint];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v16 = 0;
                _os_log_impl(&dword_1DA519000, v13, OS_LOG_TYPE_DEFAULT, "Block at downtime is enabled. Using grace period.", v16, 2u);
              }
            }
            goto LABEL_22;
          }
          uint64_t v14 = +[STLog blueprint];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:].cold.4();
          }
        }
        else
        {
          uint64_t v14 = +[STLog blueprint];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:]((uint64_t)v10, v14);
          }
        }
      }
      else
      {
        uint64_t v10 = +[STLog blueprint];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:](v10);
        }
      }
    }
    else
    {
      uint64_t v10 = +[STLog blueprint];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint shouldUseGracePeriodForDowntimeOverride:configuration:](v10);
      }
    }
    LOBYTE(v12) = 0;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

+ (id)_cemPredicateWithDowntimeOverride:(id)a3 shouldUseGracePeriod:(BOOL)a4 dateFormater:(id)a5 calendar:(id)a6
{
  BOOL v8 = a4;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v8 && (_os_feature_enabled_impl() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v19 = [v18 stringForKey:@"OnDemandDowntimeDelay"];

      if (v19) {
        double v20 = (double)[v18 integerForKey:@"OnDemandDowntimeDelay"];
      }
      else {
        double v20 = 300.0;
      }
    }
    else
    {
      double v20 = 300.0;
    }
    [v10 setFormatOptions:544];
    v21 = [v9 creationDate];
    v22 = STLocalDateFromUTCErasedDate(v21, v11);
    long long v23 = [v22 dateByAddingTimeInterval:v20];

    long long v24 = [v9 endDate];
    long long v25 = STLocalDateFromUTCErasedDate(v24, v11);

    if ([v23 compare:v25] == -1)
    {
      uint64_t v27 = [v11 component:512 fromDate:v23];
      uint64_t v28 = [v11 component:512 fromDate:v25];
      v37 = [v10 stringFromDate:v23];
      uint64_t v29 = [v10 stringFromDate:v25];
      uint64_t v35 = (void *)MEMORY[0x1E4F59FD8];
      v36 = (void *)v29;
      v34 = [v11 calendarIdentifier];
      uint64_t v33 = [NSNumber numberWithInteger:v27];
      long long v30 = [NSNumber numberWithInteger:v28];
      long long v31 = [NSNumber numberWithDouble:v20];
      v39[0] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      uint64_t v16 = [v35 buildWithCalendarIdentifier:v34 withStartDay:v33 withStartTime:v37 withEndDay:v30 withEndTime:v36 withNotificationTimes:v32];
    }
    else
    {
      long long v26 = +[STLog blueprint];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v26, OS_LOG_TYPE_DEFAULT, "Downtime override duration is less than grace period - not synthesizing CEM predicate", buf, 2u);
      }

      uint64_t v16 = 0;
    }
  }
  else
  {
    [v10 setFormatOptions:1907];
    int v12 = [v9 endDate];
    id v13 = STLocalDateFromUTCErasedDate(v12, v11);

    uint64_t v14 = (void *)MEMORY[0x1E4F59FD0];
    id v15 = [v10 stringFromDate:v13];
    uint64_t v16 = [v14 buildWithDateTime:v15];
  }
  return v16;
}

- (void)migrateToVersion2CategoriesIfNeeded
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to serialize declaration while migrating to version 2 categories: %{public}@", v2, v3, v4, v5, v6);
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"identifier"])
  {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  else if ([v4 isEqualToString:@"isDirty"] {
         && [(STBlueprint *)self isDirty])
  }
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    [(STBlueprint *)self setModificationDate:v5];

    uint8_t v6 = [STVersionVector alloc];
    id v7 = [(STBlueprint *)self versionVector];
    BOOL v8 = [(STVersionVector *)v6 initWithDataRepresentation:v7];

    id v9 = STGetDeviceUUID();
    [(STVersionVector *)v8 incrementNodeWithIdentifier:v9];

    id v10 = [(STVersionVector *)v8 dataRepresentation];
    [(STBlueprint *)self setVersionVector:v10];
  }
  v11.receiver = self;
  v11.super_class = (Class)STBlueprint;
  [(STBlueprint *)&v11 didChangeValueForKey:v4];
}

- (id)computeUniqueIdentifier
{
  uint64_t v3 = NSString;
  id v4 = [(id)objc_opt_class() serializableClassName];
  uint64_t v5 = [(STBlueprint *)self identifier];
  uint8_t v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[STLog screentime];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "STBlueprint: enter updateWithDictionaryRepresentation", buf, 2u);
  }

  uint8_t v6 = [STVersionVector alloc];
  id v7 = [(STBlueprint *)self versionVector];
  BOOL v8 = [(STVersionVector *)v6 initWithDataRepresentation:v7];

  uint64_t v9 = [(STVersionVector *)v8 nodes];
  uint64_t v10 = [(id)v9 count];

  objc_super v11 = [v4 objectForKeyedSubscript:@"versionVector"];
  int v12 = [[STVersionVector alloc] initWithDataRepresentation:v11];
  id v13 = [v4 objectForKeyedSubscript:@"fromCloud"];
  LOBYTE(v9) = [v13 BOOLValue];
  uint64_t v14 = +[STLog screentime];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  v144 = v13;
  if (v9)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: dictionaryRepresentation is fromCloud. Version vectors will be ignored.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: dictionaryRepresentation is NOT fromCloud. Compare version vectors.", buf, 2u);
  }

  if (!v8)
  {
    uint64_t v14 = +[STLog screentime];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - there is no versionvector", buf, 2u);
    }
    goto LABEL_159;
  }
  long long v30 = +[STLog versionVector];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    long long v31 = [(STBlueprint *)self uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    unint64_t v161 = (unint64_t)v31;
    __int16 v162 = 2112;
    v163 = v8;
    __int16 v164 = 2112;
    v165 = v12;
    _os_log_impl(&dword_1DA519000, v30, OS_LOG_TYPE_DEFAULT, "COMPARE BLUEPRINTS (%@): %@ vs %@", buf, 0x20u);
  }
  uint64_t v32 = [(STVersionVector *)v8 evaluateCausality:v12];
  uint64_t v33 = v32;
  switch(v32)
  {
    case 1:
      v34 = +[STLog versionVector];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        break;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = "Local newer";
LABEL_25:
      _os_log_impl(&dword_1DA519000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
      goto LABEL_26;
    case 3:
      v34 = +[STLog versionVector];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = "Local equal";
      goto LABEL_25;
    case 2:
      v34 = +[STLog versionVector];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = "Concurrent";
      goto LABEL_25;
    case 0:
      v34 = +[STLog versionVector];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = "Local older";
      goto LABEL_25;
  }
  [(STVersionVector *)v8 join:v12];
  v36 = [(STVersionVector *)v8 dataRepresentation];
  [(STBlueprint *)self setVersionVector:v36];

  if (v33 == 1)
  {
    v37 = +[STLog screentime];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA519000, v37, OS_LOG_TYPE_DEFAULT, "Received blueprint representation is out of date. Skipping update.", buf, 2u);
    }

    v38 = +[STLog screentime];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self);
    }

    uint64_t v14 = +[STLog screentime];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[STBlueprint updateWithDictionaryRepresentation:].cold.6();
    }
    goto LABEL_159;
  }
  if (v33 != 3)
  {
    if (v33 == 2)
    {
      v57 = +[STLog screentime];
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v57, OS_LOG_TYPE_DEFAULT, "Blueprint version clocks concurrent. Most recent modification wins", buf, 2u);
      }

      uint64_t v58 = +[STLog screentime];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self);
      }

      uint64_t v59 = +[STLog screentime];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
        -[STBlueprint updateWithDictionaryRepresentation:].cold.6();
      }

      uint64_t v14 = [(STBlueprint *)self modificationDate];
      uint64_t v60 = [v4 objectForKeyedSubscript:@"modificationDate"];
      id v61 = +[STLog screentime];
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      if (v14 && v60)
      {
        if (v62)
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v161 = (unint64_t)v14;
          __int16 v162 = 2112;
          v163 = v60;
          _os_log_impl(&dword_1DA519000, v61, OS_LOG_TYPE_DEFAULT, "Local modification date = %@, Incoming modification date = %@", buf, 0x16u);
        }

        uint64_t v63 = [v14 compare:v60];
        id v61 = +[STLog screentime];
        BOOL v64 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
        if (v63 != -1)
        {
          if (v64)
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v161 = (unint64_t)v14;
            __int16 v162 = 2112;
            v163 = v60;
            uint64_t v65 = "Local blueprint is more recently modified. We will ignore the received blueprint. Local = %@, Incoming = %@";
            uint64_t v66 = v61;
            uint32_t v67 = 22;
LABEL_157:
            _os_log_impl(&dword_1DA519000, v66, OS_LOG_TYPE_DEFAULT, v65, buf, v67);
            goto LABEL_158;
          }
          goto LABEL_158;
        }
        if (v64)
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v161 = (unint64_t)v14;
          __int16 v162 = 2112;
          v163 = v60;
          v131 = "Received blueprint is more recently modified. We will overwrite the local blueprint. Local = %@, Incoming = %@";
          v132 = v61;
          uint32_t v133 = 22;
LABEL_166:
          _os_log_impl(&dword_1DA519000, v132, OS_LOG_TYPE_DEFAULT, v131, buf, v133);
        }
      }
      else
      {
        if (v14)
        {
          if (v62)
          {
            *(_WORD *)buf = 0;
            uint64_t v65 = "Only the local blueprint has a modification date. We will ignore the received blueprint.";
            uint64_t v66 = v61;
            uint32_t v67 = 2;
            goto LABEL_157;
          }
LABEL_158:

LABEL_159:
          BOOL v125 = 0;
          goto LABEL_160;
        }
        if (v62)
        {
          *(_WORD *)buf = 0;
          v131 = "Only the inboud blueprint has a modification date. We will overwrite the local blueprint.";
          v132 = v61;
          uint32_t v133 = 2;
          goto LABEL_166;
        }
      }

LABEL_6:
    }
LABEL_7:
    v146 = self;
    v141 = v8;
    v142 = v12;
    v140 = v11;
    v143 = v4;
    [v4 objectForKeyedSubscript:@"configurations"];
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v154 objects:v159 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v155;
      do
      {
        uint64_t v20 = 0;
        v21 = v18;
        do
        {
          if (*(void *)v155 != v19) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v154 + 1) + 8 * v20);
          long long v23 = [v22 objectForKeyedSubscript:@"identifier"];
          long long v24 = +[STBlueprintConfiguration fetchRequest];
          long long v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ && %K == %@", @"blueprint", v146, @"identifier", v23];
          [v24 setPredicate:v25];

          id v153 = v21;
          long long v26 = [v24 execute:&v153];
          id v27 = v153;

          uint64_t v28 = [v26 firstObject];
          uint64_t v29 = v28;
          if (v28) {
            [v28 updateWithDictionaryRepresentation:v22];
          }

          ++v20;
          v21 = v27;
        }
        while (v17 != v20);
        uint64_t v18 = v27;
        uint64_t v17 = [obj countByEnumeratingWithState:&v154 objects:v159 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }

    id v4 = v143;
    v39 = [v143 objectForKeyedSubscript:@"type"];
    [(STBlueprint *)v146 setType:v39];

    v40 = [v143 objectForKeyedSubscript:@"enabled"];
    uint64_t v41 = [v40 BOOLValue];

    [(STBlueprint *)v146 setEnabled:v41];
    v42 = [(STBlueprint *)v146 type];
    int v43 = [v42 isEqualToString:@"downtime"];

    int v12 = v142;
    if (v43)
    {
      v44 = +[STLog screentime];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v44, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - downtime blueprint", buf, 2u);
      }

      v45 = [v143 objectForKeyedSubscript:@"schedule"];
      v46 = +[STLog screentime];
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v45)
      {
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA519000, v46, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has scheduleDictionary", buf, 2u);
        }

        v48 = [(STBlueprint *)v146 schedule];

        if (!v48)
        {
          v49 = [STBlueprintSchedule alloc];
          v50 = [(STBlueprint *)v146 managedObjectContext];
          v51 = [(STBlueprintSchedule *)v49 initWithContext:v50];
          [(STBlueprint *)v146 setSchedule:v51];
        }
        v52 = [(STBlueprint *)v146 schedule];
        [v52 updateWithDictionaryRepresentation:v45];

        uint64_t v53 = [v45 objectForKeyedSubscript:@"enabled"];
        if (!v53)
        {
          uint64_t v54 = [(STBlueprint *)v146 schedule];
          [v54 setEnabled:v41];

          id v55 = +[STLog blueprint];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v161 = v41;
            _os_log_impl(&dword_1DA519000, v55, OS_LOG_TYPE_DEFAULT, "Deserializing legacy downtime, treating blueprint enabled (%ld) as schedule enabled", buf, 0xCu);
          }
        }
        unint64_t v56 = 0x1E6BC6000;
      }
      else
      {
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA519000, v46, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have a scheduleDictionary", buf, 2u);
        }

        v68 = [(STBlueprint *)v146 schedule];

        unint64_t v56 = 0x1E6BC6000uLL;
        if (v68)
        {
          long long v69 = +[STLog screentime];
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            long long v70 = [(STBlueprint *)v146 schedule];
            *(_DWORD *)buf = 136446466;
            unint64_t v161 = (unint64_t)"-[STBlueprint updateWithDictionaryRepresentation:]";
            __int16 v162 = 2112;
            v163 = v70;
            _os_log_impl(&dword_1DA519000, v69, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting schedule (%@)", buf, 0x16u);
          }
          long long v71 = [(STBlueprint *)v146 managedObjectContext];
          long long v72 = [(STBlueprint *)v146 schedule];
          [v71 deleteObject:v72];
        }
        [(STBlueprint *)v146 setSchedule:0];
      }
      v73 = [v143 objectForKeyedSubscript:@"override"];
      uint64_t v74 = [*(id *)(v56 + 2760) screentime];
      BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
      if (v73)
      {
        if (v75)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA519000, v74, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has overideDictionary", buf, 2u);
        }

        v76 = [(STBlueprint *)v146 override];

        if (!v76)
        {
          v77 = [STCoreDowntimeOverride alloc];
          uint64_t v78 = [(STBlueprint *)v146 managedObjectContext];
          v79 = [(STCoreDowntimeOverride *)v77 initWithContext:v78];
          [(STBlueprint *)v146 setOverride:v79];
        }
        uint64_t v74 = [(STBlueprint *)v146 override];
        [v74 updateWithDictionaryRepresentation:v73];
      }
      else if (v75)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v74, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have an overideDictionary", buf, 2u);
      }
    }
    uint64_t v80 = [v143 objectForKeyedSubscript:@"usageLimit"];
    v81 = +[STLog screentime];
    BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    if (v80)
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v81, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - has usageLimitDictionary", buf, 2u);
      }

      v83 = [(STBlueprint *)v146 usageLimit];

      if (!v83)
      {
        v84 = [STBlueprintUsageLimit alloc];
        v85 = [(STBlueprint *)v146 managedObjectContext];
        v86 = [(STBlueprintUsageLimit *)v84 initWithContext:v85];
        [(STBlueprint *)v146 setUsageLimit:v86];
      }
      v87 = [(STBlueprint *)v146 usageLimit];
      [v87 updateWithDictionaryRepresentation:v80];
    }
    else
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA519000, v81, OS_LOG_TYPE_DEFAULT, "STBlueprint: updateWithDictionaryRepresentation - does not have a usageLimitDictionary", buf, 2u);
      }

      long long v88 = [(STBlueprint *)v146 usageLimit];

      if (v88)
      {
        long long v89 = +[STLog screentime];
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          long long v90 = [(STBlueprint *)v146 usageLimit];
          *(_DWORD *)buf = 136446466;
          unint64_t v161 = (unint64_t)"-[STBlueprint updateWithDictionaryRepresentation:]";
          __int16 v162 = 2112;
          v163 = v90;
          _os_log_impl(&dword_1DA519000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting usageLimit (%@)", buf, 0x16u);
        }
        long long v91 = [(STBlueprint *)v146 managedObjectContext];
        long long v92 = [(STBlueprint *)v146 usageLimit];
        [v91 deleteObject:v92];
      }
      [(STBlueprint *)v146 setUsageLimit:0];
    }
    long long v93 = [v143 objectForKeyedSubscript:@"limitEnabled"];
    long long v94 = v93;
    if (v93) {
      uint64_t v95 = [v93 BOOLValue];
    }
    else {
      uint64_t v95 = 1;
    }
    [(STBlueprint *)v146 setLimitEnabled:v95];
    if (_os_feature_enabled_impl())
    {
      v96 = [v143 objectForKeyedSubscript:@"isTombstoned"];
      v97 = v96;
      if (v96) {
        uint64_t v98 = [v96 BOOLValue];
      }
      else {
        uint64_t v98 = 0;
      }
      [(STBlueprint *)v146 setIsTombstoned:v98];
    }
    v99 = [v143 objectForKeyedSubscript:@"creationDate"];
    [(STBlueprint *)v146 setCreationDate:v99];

    v100 = [v143 objectForKeyedSubscript:@"expiration"];
    [(STBlueprint *)v146 setExpiration:v100];

    v101 = [v143 objectForKeyedSubscript:@"minimumInstallationDate"];
    [(STBlueprint *)v146 setMinimumInstallationDate:v101];

    v102 = [v143 objectForKeyedSubscript:@"invertUsageLimit"];
    -[STBlueprint setInvertUsageLimit:](v146, "setInvertUsageLimit:", [v102 BOOLValue]);

    v103 = [v143 objectForKeyedSubscript:@"modificationDate"];
    if (v103) {
      [(STBlueprint *)v146 setModificationDate:v103];
    }
    v104 = [v143 objectForKeyedSubscript:@"users"];
    v105 = +[STCoreUser fetchRequest];
    id v152 = v18;
    uint64_t v106 = [v105 execute:&v152];
    uint64_t v14 = v152;

    uint64_t v107 = (void *)v106;
    v139 = (void *)v80;
    if (!v106)
    {
      v108 = +[STLog persistence];
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
        -[STBlueprint updateWithDictionaryRepresentation:]();
      }
      BOOL v125 = 0;
      goto LABEL_141;
    }
    v136 = v103;
    v137 = v94;
    v108 = objc_opt_new();
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v135 = v107;
    id v109 = v107;
    uint64_t v110 = [v109 countByEnumeratingWithState:&v148 objects:v158 count:16];
    if (v110)
    {
      uint64_t v111 = v110;
      uint64_t v112 = *(void *)v149;
      do
      {
        for (uint64_t i = 0; i != v111; ++i)
        {
          if (*(void *)v149 != v112) {
            objc_enumerationMutation(v109);
          }
          v114 = *(void **)(*((void *)&v148 + 1) + 8 * i);
          v115 = [v114 dsid];
          int v116 = [v104 containsObject:v115];

          if (v116) {
            [v108 addObject:v114];
          }
        }
        uint64_t v111 = [v109 countByEnumeratingWithState:&v148 objects:v158 count:16];
      }
      while (v111);
    }

    uint64_t v117 = [v143 objectForKeyedSubscript:@"organization.class"];
    v118 = +[STCoreOrganization internalClassForSerializableClassName:v117];
    v138 = (void *)v117;
    if (!v118)
    {
      v120 = +[STLog persistence];
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
        -[STBlueprint updateWithDictionaryRepresentation:]();
      }
      BOOL v125 = 0;
      v126 = v14;
      id v4 = v143;
      v103 = v136;
      long long v94 = v137;
      uint64_t v107 = v135;
      goto LABEL_140;
    }
    v119 = [(objc_class *)v118 fetchRequest];
    v147 = v14;
    v120 = [v119 execute:&v147];
    v134 = v147;

    if (v120)
    {
      if ((unint64_t)[v120 count] >= 2)
      {
        v121 = +[STLog persistence];
        if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT)) {
          -[STBlueprint updateWithDictionaryRepresentation:].cold.5();
        }
      }
      v122 = [v120 firstObject];
      [(STBlueprint *)v146 setOrganization:v122];

      v123 = [(STBlueprint *)v146 organization];

      if (v123)
      {
        v124 = [MEMORY[0x1E4F1CAD0] setWithArray:v108];
        [(STBlueprint *)v146 setUsers:v124];
        BOOL v125 = 1;
LABEL_138:
        id v4 = v143;
        v103 = v136;
        long long v94 = v137;
        v126 = v134;
        uint64_t v107 = v135;
        goto LABEL_139;
      }
      v124 = +[STLog persistence];
      if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT)) {
        -[STBlueprint updateWithDictionaryRepresentation:].cold.4();
      }
    }
    else
    {
      v124 = +[STLog persistence];
      if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
      {
        v126 = v134;
        -[STBlueprint updateWithDictionaryRepresentation:]();
        BOOL v125 = 0;
        id v4 = v143;
        v103 = v136;
        long long v94 = v137;
        uint64_t v107 = v135;
LABEL_139:

LABEL_140:
        uint64_t v14 = v126;
        int v12 = v142;
LABEL_141:

        objc_super v11 = v140;
        BOOL v8 = v141;
LABEL_160:

        goto LABEL_161;
      }
    }
    BOOL v125 = 0;
    goto LABEL_138;
  }
  v127 = +[STLog screentime];
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v127, OS_LOG_TYPE_DEFAULT, "Blueprint version clocks equal.", buf, 2u);
  }

  v128 = +[STLog screentime];
  if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG)) {
    -[STBlueprint updateWithDictionaryRepresentation:].cold.7(self);
  }

  v129 = +[STLog screentime];
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG)) {
    -[STBlueprint updateWithDictionaryRepresentation:].cold.6();
  }

  if (!v10) {
    goto LABEL_7;
  }
  BOOL v125 = 1;
LABEL_161:

  return v125;
}

- (id)dictionaryRepresentation
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(STBlueprint *)self users];
  id v4 = [v3 valueForKeyPath:@"dsid"];
  uint64_t v5 = [v4 allObjects];

  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v7 = [(STBlueprint *)self configurations];
  BOOL v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = [(STBlueprint *)self configurations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v11);
  }

  v41.receiver = self;
  v41.super_class = (Class)STBlueprint;
  BOOL v15 = [(STUniquedManagedObject *)&v41 dictionaryRepresentation];
  uint64_t v16 = [(STBlueprint *)self type];
  int v17 = [v16 isEqualToString:@"downtime"];

  uint64_t v18 = NSNumber;
  if (v17)
  {
    uint64_t v19 = [(STBlueprint *)self schedule];
    uint64_t v20 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "enabled"));
    [v15 setObject:v20 forKeyedSubscript:@"enabled"];

    v21 = [(STBlueprint *)self override];
    v22 = [v21 dictionaryRepresentation];
    [v15 setObject:v22 forKeyedSubscript:@"override"];
  }
  else
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[STBlueprint enabled](self, "enabled"));
    [v15 setObject:v21 forKeyedSubscript:@"enabled"];
  }

  long long v23 = objc_msgSend(NSNumber, "numberWithBool:", -[STBlueprint limitEnabled](self, "limitEnabled"));
  [v15 setObject:v23 forKeyedSubscript:@"limitEnabled"];

  long long v24 = [(STBlueprint *)self creationDate];
  [v15 setObject:v24 forKeyedSubscript:@"creationDate"];

  long long v25 = [(STBlueprint *)self expiration];
  [v15 setObject:v25 forKeyedSubscript:@"expiration"];

  long long v26 = [(STBlueprint *)self minimumInstallationDate];
  [v15 setObject:v26 forKeyedSubscript:@"minimumInstallationDate"];

  id v27 = [(STBlueprint *)self identifier];
  [v15 setObject:v27 forKeyedSubscript:@"identifier"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[STBlueprint invertUsageLimit](self, "invertUsageLimit"));
  [v15 setObject:v28 forKeyedSubscript:@"invertUsageLimit"];

  uint64_t v29 = [(STBlueprint *)self type];
  [v15 setObject:v29 forKeyedSubscript:@"type"];

  long long v30 = [(STBlueprint *)self organization];
  long long v31 = [(id)objc_opt_class() serializableClassName];
  [v15 setObject:v31 forKeyedSubscript:@"organization.class"];

  uint64_t v32 = [(STBlueprint *)self schedule];
  uint64_t v33 = [v32 dictionaryRepresentation];
  [v15 setObject:v33 forKeyedSubscript:@"schedule"];

  [v15 setObject:v8 forKeyedSubscript:@"configurations"];
  v34 = [(STBlueprint *)self usageLimit];
  uint64_t v35 = [v34 dictionaryRepresentation];
  [v15 setObject:v35 forKeyedSubscript:@"usageLimit"];

  [v15 setObject:v5 forKeyedSubscript:@"users"];
  v36 = [(STBlueprint *)self versionVector];
  [v15 setObject:v36 forKeyedSubscript:@"versionVector"];

  v37 = [(STBlueprint *)self modificationDate];
  [v15 setObject:v37 forKeyedSubscript:@"modificationDate"];

  if (_os_feature_enabled_impl())
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[STBlueprint isTombstoned](self, "isTombstoned"));
    [v15 setObject:v38 forKeyedSubscript:@"isTombstoned"];
  }
  v39 = (void *)[v15 copy];

  return v39;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"identifier"];
  uint64_t v11 = [a1 fetchRequest];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v10];
  [v11 setPredicate:v12];

  id v13 = [v11 execute:a5];
  uint64_t v14 = v13;
  if (!v13)
  {
    id v47 = 0;
    goto LABEL_37;
  }
  long long v42 = v11;
  long long v43 = v10;
  id v47 = [v13 firstObject];
  if (!v47)
  {
    BOOL v15 = [[STBlueprint alloc] initWithContext:v9];
    uint64_t v16 = [v8 objectForKeyedSubscript:@"identifier"];
    id v47 = v15;
    [(STBlueprint *)v15 setIdentifier:v16];
  }
  v40 = v14;
  objc_super v41 = a5;
  v46 = objc_opt_new();
  id v44 = v8;
  [v8 objectForKeyedSubscript:@"configurations"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v56;
    do
    {
      uint64_t v21 = 0;
      v22 = v19;
      do
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * v21);
        id v54 = v22;
        long long v24 = +[STBlueprintConfiguration fetchOrCreateWithDictionaryRepresentation:v23 inContext:v9 error:&v54];
        id v19 = v54;

        if (v19)
        {
          long long v25 = +[STLog persistence];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v60 = (const char *)v19;
            _os_log_error_impl(&dword_1DA519000, v25, OS_LOG_TYPE_ERROR, "Could not create blueprint configuration: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          [v24 setBlueprint:v47];
          [v46 addObject:v24];
        }

        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }
  [v47 setConfigurations:v46];
  long long v26 = +[STBlueprintConfiguration fetchRequest];
  id v27 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"blueprint");
  [v26 setPredicate:v27];

  id v53 = v19;
  uint64_t v28 = [v26 execute:&v53];
  id v29 = v53;

  long long v45 = v28;
  if (v28)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      id v38 = v29;
      v39 = v26;
      uint64_t v33 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v36 = +[STLog screentime];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v60 = "+[STBlueprint fetchOrCreateWithDictionaryRepresentation:inContext:error:]";
            __int16 v61 = 2112;
            uint64_t v62 = v35;
            _os_log_impl(&dword_1DA519000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s: deleting orphanConfiguration (%@)", buf, 0x16u);
          }

          [v9 deleteObject:v35];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v32);
      uint64_t v10 = v43;
      id v8 = v44;
      a5 = v41;
      uint64_t v11 = v42;
      long long v26 = v39;
      uint64_t v14 = v40;
      id v29 = v38;
      goto LABEL_33;
    }
  }
  else
  {
    long long v30 = +[STLog persistence];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint fetchOrCreateWithDictionaryRepresentation:inContext:error:]();
    }
  }
  uint64_t v11 = v42;
  uint64_t v10 = v43;
  uint64_t v14 = v40;
  id v8 = v44;
LABEL_33:

  if (a5 && v29) {
    *a5 = v29;
  }

LABEL_37:
  return v47;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"bp";
}

+ (id)scheduleTextWithLocale:(id)a3 weekdayScheduleComparator:(id)a4 scheduleTimeGetter:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = v10;
  if (v7) {
    [v10 setLocale:v7];
  }
  long long v58 = [v11 shortWeekdaySymbols];
  uint64_t v60 = v7;
  uint64_t v12 = v9;
  uint64_t v13 = [v11 maximumRangeOfUnit:512];
  uint64_t v15 = v14;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v14];
  long long v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v15];
  uint64_t v17 = [v11 firstWeekday];
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = v17;
  uint64_t v18 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__STBlueprint_scheduleTextWithLocale_weekdayScheduleComparator_scheduleTimeGetter___block_invoke;
  aBlock[3] = &unk_1E6BC7248;
  uint64_t v76 = v17;
  id v45 = v8;
  id v73 = v45;
  BOOL v75 = v79;
  id v46 = v12;
  id v74 = v46;
  id v19 = v16;
  id v67 = v19;
  uint64_t v77 = v13;
  uint64_t v78 = v15 + v13 - 1;
  id v48 = v58;
  id v68 = v48;
  id v47 = v11;
  id v69 = v47;
  id v49 = v18;
  id v70 = v49;
  id v51 = v60;
  id v71 = v51;
  id v55 = v56;
  id v72 = v55;
  long long v52 = _Block_copy(aBlock);
  if (v17 == v15 + v13 - 1) {
    uint64_t v20 = v13;
  }
  else {
    uint64_t v20 = v17 + 1;
  }
  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v13, v15);
  objc_msgSend(v21, "enumerateIndexesInRange:options:usingBlock:", v20, v15 + v13 - v20, 0, v52);
  objc_msgSend(v21, "enumerateIndexesInRange:options:usingBlock:", v13, v20 - v13, 0, v52);
  long long v50 = v21;
  v22 = +[STScreenTimeCoreBundle bundle];
  if (v60)
  {
    id v61 = v51;
  }
  else
  {
    id v61 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  long long v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v19;
  uint64_t v23 = [obj countByEnumeratingWithState:&v62 objects:v80 count:16];
  char v24 = 0;
  if (v23)
  {
    uint64_t v54 = *(void *)v63;
    do
    {
      uint64_t v59 = v23;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v63 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        id v27 = [v55 objectForKeyedSubscript:v26];
        unint64_t v28 = [v27 count];
        if (v28 < 3)
        {
          id v29 = [v22 localizedStringForKey:@"CustomScheduleTwoWeekdayRangeSeparator" value:&stru_1F3487700 table:0];
          v37 = [v27 componentsJoinedByString:v29];
        }
        else
        {
          id v29 = [v22 localizedStringForKey:@"CustomScheduleThreeOrMoreWeekdayRangeCommaSeparator" value:&stru_1F3487700 table:0];
          unint64_t v30 = v28 - 1;
          uint64_t v31 = objc_msgSend(v27, "subarrayWithRange:", 0, v28 - 1);
          uint64_t v32 = [v31 componentsJoinedByString:v29];

          uint64_t v33 = [v22 localizedStringForKey:@"CustomScheduleThreeOrMoreWeekdayRangeAndSeparator" value:&stru_1F3487700 table:0];
          id v34 = [NSString alloc];
          uint64_t v35 = [v27 objectAtIndexedSubscript:v30];
          v36 = objc_msgSend(v34, "initWithFormat:locale:", v33, v61, v35);

          v37 = [v32 stringByAppendingString:v36];

          char v24 = 1;
        }

        id v38 = [v22 localizedStringForKey:@"CustomDailyScheduleFormat" value:&stru_1F3487700 table:0];
        v39 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v38, v61, v37, v26, v45, v46, v47, v48, v49);
        [v57 addObject:v39];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v62 objects:v80 count:16];
    }
    while (v23);
  }

  if ([v57 count])
  {
    v40 = @"CustomScheduleDetailTextCommaSeparator";
    if (v24) {
      v40 = @"CustomScheduleDetailTextSemicolonSeparator";
    }
    objc_super v41 = v40;
    long long v42 = [v22 localizedStringForKey:v41 value:&stru_1F3487700 table:0];
    long long v43 = [v57 componentsJoinedByString:v42];
  }
  else
  {
    long long v43 = 0;
  }

  _Block_object_dispose(v79, 8);
  return v43;
}

uint64_t __83__STBlueprint_scheduleTextWithLocale_weekdayScheduleComparator_scheduleTimeGetter___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 104) == a2
    || (uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))(), (result & 1) == 0))
  {
    uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    if (v5)
    {
      uint64_t v15 = v5;
      [*(id *)(a1 + 32) addObject:v5];
      if (*(void *)(a1 + 112) == a2) {
        uint64_t v6 = *(void *)(a1 + 120);
      }
      else {
        uint64_t v6 = a2 - 1;
      }
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      if (v7 == v6)
      {
        id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6 - 1];
      }
      else
      {
        id v9 = [*(id *)(a1 + 48) nextDateAfterDate:*(void *)(a1 + 56) matchingUnit:512 value:v7 options:1024];
        uint64_t v10 = [*(id *)(a1 + 48) nextDateAfterDate:v9 matchingUnit:512 value:v6 options:1024];
        uint64_t v11 = objc_opt_new();
        uint64_t v12 = v11;
        if (*(void *)(a1 + 64)) {
          objc_msgSend(v11, "setLocale:");
        }
        [v12 setDateTemplate:@"ccc"];
        id v8 = [v12 stringFromDate:v9 toDate:v10];
      }
      uint64_t v13 = [*(id *)(a1 + 72) objectForKeyedSubscript:v15];
      if (v13)
      {
        uint64_t v14 = v13;
        [v13 addObject:v8];
      }
      else
      {
        uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
        [*(id *)(a1 + 72) setObject:v14 forKeyedSubscript:v15];
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = a2;
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)blueprintTypeForDeclarationType:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F59F68] registeredIdentifier];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = @"always-allowed-apps";
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F59F70] registeredIdentifier];
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      uint64_t v6 = @"downtime";
    }
    else
    {
      id v9 = [MEMORY[0x1E4F59F48] registeredIdentifier];
      char v10 = [v3 isEqualToString:v9];

      if (v10) {
        goto LABEL_21;
      }
      uint64_t v11 = [MEMORY[0x1E4F5A000] registeredIdentifier];
      char v12 = [v3 isEqualToString:v11];

      if (v12) {
        goto LABEL_21;
      }
      uint64_t v13 = [MEMORY[0x1E4F5A038] registeredIdentifier];
      char v14 = [v3 isEqualToString:v13];

      if (v14) {
        goto LABEL_21;
      }
      uint64_t v15 = [MEMORY[0x1E4F59FE8] registeredIdentifier];
      char v16 = [v3 isEqualToString:v15];

      if (v16) {
        goto LABEL_21;
      }
      uint64_t v17 = [MEMORY[0x1E4F5A008] registeredIdentifier];
      char v18 = [v3 isEqualToString:v17];

      if (v18) {
        goto LABEL_21;
      }
      id v19 = [MEMORY[0x1E4F59F50] registeredIdentifier];
      char v20 = [v3 isEqualToString:v19];

      if (v20) {
        goto LABEL_21;
      }
      uint64_t v21 = [MEMORY[0x1E4F59F30] registeredIdentifier];
      char v22 = [v3 isEqualToString:v21];

      if (v22) {
        goto LABEL_21;
      }
      uint64_t v23 = [MEMORY[0x1E4F5A030] registeredIdentifier];
      char v24 = [v3 isEqualToString:v23];

      if (v24) {
        goto LABEL_21;
      }
      long long v25 = [MEMORY[0x1E4F5A028] registeredIdentifier];
      char v26 = [v3 isEqualToString:v25];

      if (v26) {
        goto LABEL_21;
      }
      id v27 = [MEMORY[0x1E4F59FF0] registeredIdentifier];
      char v28 = [v3 isEqualToString:v27];

      if (v28) {
        goto LABEL_21;
      }
      id v29 = [MEMORY[0x1E4F5A020] registeredIdentifier];
      char v30 = [v3 isEqualToString:v29];

      if (v30) {
        goto LABEL_21;
      }
      uint64_t v31 = [MEMORY[0x1E4F59F60] registeredIdentifier];
      char v32 = [v3 isEqualToString:v31];

      if (v32) {
        goto LABEL_21;
      }
      uint64_t v33 = [MEMORY[0x1E4F59F18] registeredIdentifier];
      char v34 = [v3 isEqualToString:v33];

      if (v34) {
        goto LABEL_21;
      }
      uint64_t v35 = [MEMORY[0x1E4F59F58] registeredIdentifier];
      char v36 = [v3 isEqualToString:v35];

      if (v36) {
        goto LABEL_21;
      }
      v37 = [MEMORY[0x1E4F5A018] registeredIdentifier];
      char v38 = [v3 isEqualToString:v37];

      if ((v38 & 1) != 0
        || ([MEMORY[0x1E4F5A040] registeredIdentifier],
            v39 = objc_claimAutoreleasedReturnValue(),
            char v40 = [v3 isEqualToString:v39],
            v39,
            (v40 & 1) != 0))
      {
LABEL_21:
        uint64_t v6 = @"restrictions";
      }
      else
      {
        long long v42 = [MEMORY[0x1E4F59F28] registeredIdentifier];
        char v43 = [v3 isEqualToString:v42];

        uint64_t v6 = @"restrictions";
        if ((v43 & 1) == 0)
        {
          id v44 = [MEMORY[0x1E4F5A050] registeredIdentifier];
          int v45 = [v3 isEqualToString:v44];

          if (!v45) {
            uint64_t v6 = 0;
          }
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprint;
  if (-[STBlueprint validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    char v5 = objc_opt_new();
    [(STBlueprint *)self _validateUsersOnBlueprint:v5];
    [(STBlueprint *)self _validateType:v5];
    [(STBlueprint *)self _validateBlueprintConfiguration:v5];
    [(STBlueprint *)self _validateNumberOfBlueprints:v5];
    [(STBlueprint *)self _validateBlueprintIdentifier:v5];
    if ([v5 count])
    {
      uint64_t v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STBlueprint validateForUpdate:](self);
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprint;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    char v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprint validateForUpdate:]((uint64_t *)a3, v5);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprint;
  if (!-[STBlueprint validateForInsert:](&v10, sel_validateForInsert_)) {
    return 0;
  }
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  char v5 = objc_opt_new();
  [(STBlueprint *)self _validateUsersOnBlueprint:v5];
  [(STBlueprint *)self _validateType:v5];
  [(STBlueprint *)self _validateBlueprintConfiguration:v5];
  [(STBlueprint *)self _validateNumberOfBlueprints:v5];
  [(STBlueprint *)self _validateBlueprintIdentifier:v5];
  if ([v5 count])
  {
    uint64_t v6 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STBlueprint validateForInsert:](self);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)STBlueprint;
  BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprint;
  if (!-[STBlueprint validateForDelete:](&v10, sel_validateForDelete_)) {
    return 0;
  }
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  char v5 = objc_opt_new();
  [(STBlueprint *)self _validateNumberOfBlueprints:v5];
  if ([v5 count])
  {
    uint64_t v6 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STBlueprint validateForDelete:](self);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)STBlueprint;
  BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];

  return v7;
}

- (BOOL)_validateUsersOnBlueprint:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(STBlueprint *)self users];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"There must be one user assigned to blueprint";
    char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_super v9 = [v7 errorWithDomain:@"STErrorDomain" code:531 userInfo:v8];
    [v4 addObject:v9];
  }
  objc_super v10 = [(STBlueprint *)self users];
  unint64_t v11 = [v10 count];

  if (v11 >= 2)
  {
    char v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    char v18 = @"There must be one and only one user assigned to Blueprint.";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    char v14 = [v12 errorWithDomain:@"STErrorDomain" code:532 userInfo:v13];
    [v4 addObject:v14];
  }
  BOOL v15 = [v4 count] == 0;

  return v15;
}

- (BOOL)_validateNumberOfBlueprints:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(STBlueprint *)self users];
  uint64_t v6 = [v5 anyObject];
  BOOL v7 = [v6 dsid];
  char v8 = [(STBlueprint *)self type];
  objc_super v9 = [(STBlueprint *)self organization];
  objc_super v10 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v7 ofType:v8 fromOrganization:v9];

  id v28 = 0;
  unint64_t v11 = [v10 execute:&v28];
  id v12 = v28;
  if (v11)
  {
    uint64_t v13 = [(STBlueprint *)self type];
    if (v13 == @"downtime") {
      goto LABEL_10;
    }
    char v14 = v13;
    BOOL v15 = [(STBlueprint *)self type];
    if (v15 != @"restrictions")
    {
      char v16 = v15;
      uint64_t v17 = [(STBlueprint *)self type];
      if (v17 != @"managed-user")
      {
        char v18 = v17;
        uint64_t v19 = [(STBlueprint *)self type];

        if (v19 != @"always-allowed-apps")
        {
LABEL_14:
          BOOL v20 = [v4 count] == 0;
          goto LABEL_15;
        }
LABEL_10:
        if (![v11 count])
        {
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v31 = *MEMORY[0x1E4F28568];
          v32[0] = @"There are no blueprints for the given type";
          char v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
          uint64_t v23 = [v21 errorWithDomain:@"STErrorDomain" code:537 userInfo:v22];
          [v4 addObject:v23];
        }
        if ((unint64_t)[v11 count] >= 2)
        {
          char v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          char v30 = @"There are multiple blueprints for a given type";
          long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          char v26 = [v24 errorWithDomain:@"STErrorDomain" code:538 userInfo:v25];
          [v4 addObject:v26];
        }
        goto LABEL_14;
      }
    }
    goto LABEL_10;
  }
  [v4 addObject:v12];
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

- (BOOL)_validateType:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(STBlueprint *)self type];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Every blueprint must have a valid type";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    char v8 = [v6 errorWithDomain:@"STErrorDomain" code:539 userInfo:v7];
    [v4 addObject:v8];
  }
  objc_super v9 = [(STBlueprint *)self type];
  if ([v9 isEqualToString:@"downtime"]) {
    goto LABEL_12;
  }
  objc_super v10 = [(STBlueprint *)self type];
  if (([v10 isEqualToString:@"restrictions"] & 1) == 0)
  {
    unint64_t v11 = [(STBlueprint *)self type];
    if (![v11 isEqualToString:@"usage-limit"])
    {
      id v12 = [(STBlueprint *)self type];
      if (([v12 isEqualToString:@"managed-user"] & 1) == 0)
      {
        uint64_t v13 = [(STBlueprint *)self type];
        if (([v13 isEqualToString:@"always-allowed-apps"] & 1) == 0)
        {
          char v16 = [(STBlueprint *)self type];
          char v17 = [v16 isEqualToString:@"usage-limit-override"];

          if (v17) {
            goto LABEL_13;
          }
          char v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v19 = *MEMORY[0x1E4F28568];
          BOOL v20 = @"Blueprint type is not recognized";
          objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          objc_super v10 = [v18 errorWithDomain:@"STErrorDomain" code:540 userInfo:v9];
          [v4 addObject:v10];
          goto LABEL_11;
        }
      }
    }
  }
LABEL_11:

LABEL_12:
LABEL_13:
  BOOL v14 = [v4 count] == 0;

  return v14;
}

- (BOOL)_validateBlueprintIdentifier:(id)a3
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(STBlueprint *)self type];
  if (v5 != @"always-allowed-apps")
  {
    uint64_t v6 = v5;
    BOOL v7 = [(STBlueprint *)self type];
    if (v7 != @"restrictions")
    {
      char v8 = v7;
      objc_super v9 = [(STBlueprint *)self type];
      if (v9 != @"downtime")
      {
        objc_super v10 = v9;
        unint64_t v11 = [(STBlueprint *)self type];

        if (v11 != @"managed-user") {
          goto LABEL_11;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  id v12 = [(STBlueprint *)self type];
  uint64_t v13 = [(STBlueprint *)self users];
  BOOL v14 = [v13 anyObject];
  BOOL v15 = [v14 dsid];
  char v16 = [(STBlueprint *)self organization];
  char v17 = createBlueprintIdentifierForType(v12, 0, v15, v16);

  char v18 = [(STBlueprint *)self identifier];

  if (v17 != v18)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v74[0] = @"Invalid identifier";
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
    uint64_t v21 = [v19 errorWithDomain:@"STErrorDomain" code:541 userInfo:v20];
    [v4 addObject:v21];
  }
LABEL_11:
  char v22 = [(STBlueprint *)self organization];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v24 = [(STBlueprint *)self type];
    if (v24 != @"always-allowed-apps")
    {
      long long v25 = v24;
      char v26 = [(STBlueprint *)self type];
      if (v26 == @"restrictions")
      {
      }
      else
      {
        id v27 = v26;
        id v28 = [(STBlueprint *)self type];

        if (v28 != @"downtime") {
          goto LABEL_19;
        }
      }
    }
    uint64_t v29 = [(STBlueprint *)self identifier];
    char v30 = [(STBlueprint *)self users];
    uint64_t v31 = [v30 anyObject];
    char v32 = [v31 dsid];
    uint64_t v33 = [v32 stringValue];
    char v34 = [v29 containsString:v33];

    if ((v34 & 1) == 0)
    {
      uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      id v72 = @"Blueprint identifier doesn't have DSID or is assigned to a different family member.";
      char v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      v37 = [v35 errorWithDomain:@"STErrorDomain" code:541 userInfo:v36];
      [v4 addObject:v37];
    }
  }
LABEL_19:
  char v38 = [(STBlueprint *)self type];

  if (v38 == @"managed-user")
  {
    v39 = [(STBlueprint *)self identifier];
    char v40 = [(STBlueprint *)self users];
    objc_super v41 = [v40 anyObject];
    long long v42 = [v41 dsid];
    char v43 = [v42 stringValue];
    char v44 = [v39 containsString:v43];

    if ((v44 & 1) == 0)
    {
      int v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      id v70 = @"Managed User blueprint identifier doesn't have DSID or is assigned to a different family member.";
      id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v47 = [v45 errorWithDomain:@"STErrorDomain" code:541 userInfo:v46];
      [v4 addObject:v47];
    }
  }
  id v48 = [(STBlueprint *)self type];
  if (v48 == @"always-allowed-apps"
    || (id v49 = v48,
        [(STBlueprint *)self type],
        long long v50 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v50,
        v49,
        v50 == @"downtime"))
  {
    id v51 = [(STBlueprint *)self organization];
    objc_opt_class();
    char v52 = objc_opt_isKindOfClass();

    id v53 = [(STBlueprint *)self identifier];
    uint64_t v54 = v53;
    if (v52)
    {
      char v55 = [v53 containsString:@"family"];

      if ((v55 & 1) == 0)
      {
        long long v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v68 = @"Missing organization identifier in Blueprint identifier";
        long long v57 = (void *)MEMORY[0x1E4F1C9E8];
        long long v58 = &v68;
        uint64_t v59 = &v67;
LABEL_29:
        id v61 = [v57 dictionaryWithObjects:v58 forKeys:v59 count:1];
        long long v62 = [v56 errorWithDomain:@"STErrorDomain" code:542 userInfo:v61];
        [v4 addObject:v62];
      }
    }
    else
    {
      char v60 = [v53 containsString:@"personal"];

      if ((v60 & 1) == 0)
      {
        long long v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        uint64_t v66 = @"Missing organization identifier in Blueprint identifier";
        long long v57 = (void *)MEMORY[0x1E4F1C9E8];
        long long v58 = &v66;
        uint64_t v59 = &v65;
        goto LABEL_29;
      }
    }
  }
  BOOL v63 = [v4 count] == 0;

  return v63;
}

- (BOOL)_validateBlueprintConfiguration:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(STBlueprint *)self type];

  if (v5 == @"restrictions"
    || ([(STBlueprint *)self configurations],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Blueprints other than Content & Privacy should have a configuration set.";
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    unint64_t v11 = [v9 errorWithDomain:@"STErrorDomain" code:543 userInfo:v10];
    [v4 addObject:v11];

    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 error:(id *)a5
{
  return +[STBlueprint saveAlwaysAllowListForUser:a3 withBundleIDs:a4 overwriteExistingList:1 error:a5];
}

+ (BOOL)saveDefaultAlwaysAllowListIfNecessaryForUser:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[STLog persistence];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to save the default Always Allow list, if necessary.", v10, 2u);
  }

  uint64_t v7 = +[STBlueprint defaultAlwaysAllowBundleIDs];
  BOOL v8 = +[STBlueprint saveAlwaysAllowListForUser:v5 withBundleIDs:v7 overwriteExistingList:0 error:a4];

  return v8;
}

+ (BOOL)saveAlwaysAllowListForUser:(id)a3 withBundleIDs:(id)a4 overwriteExistingList:(BOOL)a5 error:(id *)a6
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = [v9 managingOrganization];
  if (v11)
  {
    uint64_t v54 = a6;
    id v12 = [v9 dsid];
    uint64_t v13 = [v9 alwaysAllowActivationIdentifier];
    BOOL v14 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v12 ofType:@"always-allowed-apps" withIdentifier:v13 fromOrganization:v11];

    BOOL v15 = v14;
    id v57 = 0;
    char v16 = [v14 execute:&v57];
    id v17 = v57;
    if (!v16)
    {
      char v24 = +[STLog persistence];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
      }

      if (a6)
      {
        id v17 = v17;
        BOOL v23 = 0;
        *a6 = v17;
      }
      else
      {
        BOOL v23 = 0;
      }
      goto LABEL_45;
    }
    if ((unint64_t)[v16 count] >= 2)
    {
      char v18 = +[STLog persistence];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.6();
      }
    }
    id v53 = v10;
    uint64_t v19 = [v9 managedObjectContext];
    uint64_t v20 = [v16 firstObject];
    char v52 = (void *)v19;
    if (v20)
    {
      uint64_t v21 = (STBlueprint *)v20;
      if (!a5)
      {
        int v45 = +[STLog persistence];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.5(v45);
        }
        BOOL v23 = 1;
        goto LABEL_44;
      }
      id v51 = v15;
    }
    else
    {
      id v51 = v15;
      uint64_t v21 = [[STBlueprint alloc] initWithContext:v19];
      [(STBlueprint *)v21 setType:@"always-allowed-apps"];
      long long v25 = [v9 alwaysAllowActivationIdentifier];
      [(STBlueprint *)v21 setIdentifier:v25];

      [(STBlueprint *)v21 setOrganization:v11];
      char v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, 0);
      [(STBlueprint *)v21 setUsers:v26];
    }
    [(STBlueprint *)v21 setIsDirty:1];
    id v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
    v58[0] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];

    uint64_t v29 = (void *)MEMORY[0x1E4F28F60];
    char v30 = [v9 alwaysAllowConfigurationIdentifier];
    uint64_t v31 = [v29 predicateWithFormat:@"%K == %@", @"identifier", v30];

    char v32 = [(STBlueprint *)v21 configurations];
    id v49 = (void *)v31;
    uint64_t v33 = [v32 filteredSetUsingPredicate:v31];
    long long v50 = v28;
    char v34 = [v33 sortedArrayUsingDescriptors:v28];
    uint64_t v35 = [v34 firstObject];

    if (!v35)
    {
      uint64_t v35 = [[STBlueprintConfiguration alloc] initWithContext:v52];
      char v36 = [v9 alwaysAllowConfigurationIdentifier];
      [(STBlueprintConfiguration *)v35 setIdentifier:v36];

      [(STBlueprintConfiguration *)v35 setBlueprint:v21];
    }
    v37 = (void *)MEMORY[0x1E4F59F68];
    char v38 = [v9 alwaysAllowConfigurationIdentifier];
    v39 = [v37 buildWithIdentifier:v38 withMode:*MEMORY[0x1E4F59EC8] withApps:v53];

    [v39 updateServerHash];
    id v56 = v17;
    char v40 = [v39 serializeAsDataWithError:&v56];
    id v41 = v56;

    if (v40)
    {
      [(STBlueprintConfiguration *)v35 setPayloadPlist:v40];
      long long v42 = [v39 declarationType];
      [(STBlueprintConfiguration *)v35 setType:v42];

      if ((_os_feature_enabled_impl() & 1) != 0 || ![v52 hasChanges])
      {
        BOOL v23 = 1;
LABEL_43:

        id v17 = v41;
        int v45 = v50;
        BOOL v15 = v51;
LABEL_44:

        id v10 = v53;
LABEL_45:

        goto LABEL_46;
      }
      id v55 = v41;
      char v43 = [v52 save:&v55];
      id v44 = v55;

      if (v43)
      {
        BOOL v23 = 1;
LABEL_42:
        id v41 = v44;
        goto LABEL_43;
      }
      id v47 = +[STLog persistence];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:].cold.4();
      }

      if (!v54)
      {
        BOOL v23 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      id v46 = +[STLog persistence];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
      }

      if (!v54)
      {
        BOOL v23 = 0;
        goto LABEL_43;
      }
      id v44 = v41;
    }
    id v41 = v44;
    BOOL v23 = 0;
    *uint64_t v54 = v41;
    goto LABEL_43;
  }
  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
  char v22 = +[STLog persistence];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
  }

  if (a6)
  {
    id v17 = v17;
    BOOL v23 = 0;
    *a6 = v17;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_46:

  return v23;
}

+ (NSArray)defaultAlwaysAllowBundleIDs
{
  return (NSArray *)&unk_1F349ECF8;
}

- (void)setDowntimeEnabled:(BOOL)a3
{
  [(STBlueprint *)self setEnabled:a3];
  [(STBlueprint *)self setIsDirty:1];
}

- (id)_downtimeConfigurationAtDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(STBlueprint *)self schedule];
  id v9 = [(STBlueprint *)self activeOverride];
  id v10 = STUTCErasedDateFromDate(v7, v6);

  unint64_t v11 = (void *)[v6 copy];
  id v12 = STUTCTimeZone();
  [v11 setTimeZone:v12];

  uint64_t v13 = [[STDowntimeConfiguration alloc] initWithCurrentState:0 currentDate:v10 nextState:0 nextStateChangeDate:0 calendar:v11];
  unsigned int v14 = [v8 enabled];
  if (([(STBlueprint *)self enabled] & 1) != 0
    || (v14 & 1) != 0
    || v9 && ([v9 isActiveAtDate:v10] & 1) != 0)
  {
    if ([v9 isActiveAtDate:v10])
    {
      uint64_t v15 = [v9 state];
      uint64_t v16 = 2;
      if (!v14) {
        uint64_t v16 = 0;
      }
      uint64_t v17 = v14;
      uint64_t v18 = 4;
      if (v15 != 1)
      {
        uint64_t v18 = 0;
        uint64_t v17 = 0;
      }
      if (v15) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 3;
      }
      if (v15) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v16;
      }
      uint64_t v21 = [STDowntimeConfiguration alloc];
      char v22 = [v9 endDate];
      BOOL v23 = [(STDowntimeConfiguration *)v21 initWithCurrentState:v19 currentDate:v10 nextState:v20 nextStateChangeDate:v22 calendar:v11];

      char v24 = v23;
      goto LABEL_26;
    }
    if (v14)
    {
      int v25 = [v8 isActiveAtDate:v10 inCalendar:v11];
      if (v25) {
        uint64_t v26 = 2;
      }
      else {
        uint64_t v26 = 1;
      }
      if (v25) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = 2;
      }
      uint64_t v28 = [v8 computeNextScheduleBoundaryAfterDate:v10 inCalendar:v11 isStartDate:0];
      uint64_t v29 = [[STDowntimeConfiguration alloc] initWithCurrentState:v26 currentDate:v10 nextState:v27 nextStateChangeDate:v28 calendar:v11];

      char v30 = v29;
      goto LABEL_27;
    }
  }
  char v24 = v13;
LABEL_26:
  char v30 = v24;
LABEL_27:

  return v30;
}

- (STDowntimeConfiguration)downtimeConfiguration
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  id v5 = [(STBlueprint *)self _downtimeConfigurationAtDate:v3 inCalendar:v4];

  return (STDowntimeConfiguration *)v5;
}

+ (id)downtimeConfigurationForUserID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  BOOL v8 = +[STBlueprint _userForUserID:a3 inContext:v7 error:a5];
  id v9 = +[STBlueprint _downtimeForUser:v8 inContext:v7 error:a5];

  if (v9)
  {
    id v10 = [v9 downtimeConfiguration];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(STBlueprint *)self schedule];
  [v8 setStartTime:v7 endTime:v6];

  [(STBlueprint *)self setIsDirty:1];
  [(STBlueprint *)self _updateActiveOverrideAfterScheduleChange];
}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(STBlueprint *)self schedule];
  [v10 setStartTime:v9 endTime:v8 forDay:a5];

  [(STBlueprint *)self setIsDirty:1];
  [(STBlueprint *)self _updateActiveOverrideAfterScheduleChange];
}

- (void)disableDowntimeForDay:(unint64_t)a3
{
  id v5 = [(STBlueprint *)self schedule];
  [v5 setStartTime:0 endTime:0 forDay:a3];

  [(STBlueprint *)self setIsDirty:1];
  [(STBlueprint *)self _updateActiveOverrideAfterScheduleChange];
}

- (void)_updateActiveOverrideAfterScheduleChange
{
  id v3 = [[STBlueprintBackedDowntimeOverrideModifier alloc] initWithDowntimeBlueprint:self];
  id v7 = 0;
  BOOL v4 = +[STDowntimeOverrideUpdater updateActiveOverrideOnBlueprintNow:self usingModifier:v3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    id v6 = +[STLog blueprint];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STBlueprint(Downtime) _updateActiveOverrideAfterScheduleChange]();
    }
  }
}

- (id)activeOverride
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(STBlueprint *)self override];
  id v3 = v2;
  if (!v2 || ([v2 isTombstoned] & 1) != 0 || objc_msgSend(v3, "isDeleted"))
  {
    BOOL v4 = +[STLog blueprint];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1DA519000, v4, OS_LOG_TYPE_INFO, "No active override for downtime", (uint8_t *)&v8, 2u);
    }
    id v5 = 0;
  }
  else
  {
    id v7 = [v3 managedObjectContext];
    id v5 = +[STDowntimeOverrideTransformer downtimeOverrideFromCoreDowntimeOverride:v3 inContext:v7];

    BOOL v4 = +[STLog blueprint];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1DA519000, v4, OS_LOG_TYPE_DEFAULT, "Got active override for downtime: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5;
}

- (id)_applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 atDate:(id)a5 inCalendar:(id)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  uint64_t v13 = STUTCErasedDateFromDate(a5, v12);
  unsigned int v14 = (void *)[v12 copy];

  uint64_t v15 = STUTCTimeZone();
  [v14 setTimeZone:v15];

  uint64_t v16 = +[STLog blueprint];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      uint64_t v17 = @"Enable";
    }
    else {
      uint64_t v17 = @"Disable";
    }
    uint64_t v18 = [NSNumber numberWithDouble:a4];
    int v24 = 138412802;
    int v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v13;
    _os_log_impl(&dword_1DA519000, v16, OS_LOG_TYPE_DEFAULT, "Applying on-demand state change: %@, for fixed duration: %@, at: %@", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v19 = +[STDowntimeOverrideBuilder createFixedDurationOverrideWithInterval:a3 == 1 state:v13 creationDate:v14 calendar:a4];
  uint64_t v20 = [[STBlueprintBackedDowntimeOverrideModifier alloc] initWithDowntimeBlueprint:self];
  BOOL v21 = [(STBlueprintBackedDowntimeOverrideModifier *)v20 applyDowntimeOverride:v19 error:a7];

  if (v21)
  {
    char v22 = [(STBlueprint *)self _downtimeConfigurationAtDate:v13 inCalendar:v14];
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (id)_applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  unint64_t v11 = STUTCErasedDateFromDate(a4, v10);
  id v12 = (void *)[v10 copy];

  uint64_t v13 = STUTCTimeZone();
  [v12 setTimeZone:v13];

  unsigned int v14 = [(STBlueprint *)self _downtimeConfigurationAtDate:v11 inCalendar:v12];
  if (+[STBlueprint _isStateChangeValid:forState:](STBlueprint, "_isStateChangeValid:forState:", a3, [v14 currentState]))
  {
    uint64_t v15 = +[STLog blueprint];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = @"Enable";
      if (!a3) {
        uint64_t v16 = @"Disable";
      }
      int v23 = 138412546;
      int v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v11;
      _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "Applying on-demand (automatic duration) state change: %@ at: %@", (uint8_t *)&v23, 0x16u);
    }

    uint64_t v17 = [(STBlueprint *)self schedule];
    uint64_t v18 = +[STDowntimeOverrideBuilder createAutomaticOverrideWithState:a3 == 1 schedule:v17 creationDate:v11 calendar:v12];

    uint64_t v19 = [[STBlueprintBackedDowntimeOverrideModifier alloc] initWithDowntimeBlueprint:self];
    BOOL v20 = [(STBlueprintBackedDowntimeOverrideModifier *)v19 applyDowntimeOverride:v18 error:a6];

    if (v20)
    {
      BOOL v21 = [(STBlueprint *)self _downtimeConfigurationAtDate:v11 inCalendar:v12];
      [(STBlueprint *)self _reportCoreAnalyticsEventForDowntimeOverride:v18 currentDate:v11];
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
    if (a6) {
      *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:1 userInfo:0];
    }
  }

  return v21;
}

+ (BOOL)_isStateChangeValid:(int64_t)a3 forState:(int64_t)a4
{
  switch(a4)
  {
    case 0:
    case 1:
    case 3:
      BOOL v5 = a3 == 1;
      goto LABEL_4;
    case 2:
    case 4:
      BOOL v5 = a3 == 0;
LABEL_4:
      char v4 = v5;
      break;
    default:
      return v4 & 1;
  }
  return v4 & 1;
}

+ (id)_downtimeForUser:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 managingOrganization];
  if (v7)
  {
    int v8 = [v6 dsid];
    id v9 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v8 ofType:@"downtime" fromOrganization:v7];

    id v20 = 0;
    id v10 = [v9 execute:&v20];
    id v11 = v20;
    if (v10)
    {
      if ((unint64_t)[v10 count] >= 2)
      {
        id v12 = +[STLog persistence];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[STBlueprint(Downtime) _downtimeForUser:inContext:error:]();
        }
      }
      uint64_t v13 = [v10 firstObject];
      unsigned int v14 = v13;
      if (v13)
      {
        unsigned int v14 = v13;
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v17 = +[STLog blueprint];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = [v6 dsid];
          *(_DWORD *)buf = 138412290;
          char v22 = v18;
          _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_INFO, "User has no downtime: %@", buf, 0xCu);
        }
        uint64_t v15 = 0;
      }
    }
    else
    {
      unsigned int v14 = +[STLog blueprint];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(Downtime) _downtimeForUser:inContext:error:]();
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
    uint64_t v16 = +[STLog persistence];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
    }

    if (a5)
    {
      id v11 = v11;
      uint64_t v15 = 0;
      *a5 = v11;
    }
    else
    {
      uint64_t v15 = 0;
    }
  }

  return v15;
}

- (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 error:(id *)a5
{
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  id v10 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  id v11 = [(STBlueprint *)self _applyOnDemandDowntimeStateChange:a3 withFixedDuration:v9 atDate:v10 inCalendar:a5 error:a4];

  return v11;
}

- (BOOL)removeFixedDurationOnDemandDowntimeWithError:(id *)a3
{
  BOOL v5 = +[STLog blueprint];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Removing fixed duration on-demand downtime", v11, 2u);
  }

  id v6 = [(STBlueprint *)self activeOverride];
  id v7 = v6;
  if (v6 && [v6 type] == 1)
  {
    int v8 = [[STBlueprintBackedDowntimeOverrideModifier alloc] initWithDowntimeBlueprint:self];
    char v9 = [(STBlueprintBackedDowntimeOverrideModifier *)v8 removeDowntimeOverrideWithError:a3];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  int v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  char v9 = [(STBlueprint *)self _applyAutomaticOnDemandDowntimeStateChange:a3 atDate:v7 inCalendar:v8 error:a4];

  return v9;
}

- (id)applyScheduleStateChange:(int64_t)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  int v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  char v9 = [(STBlueprint *)self _applyScheduleStateChange:a3 atDate:v7 inCalendar:v8 error:a4];

  return v9;
}

+ (id)applyOnDemandDowntimeStateChange:(int64_t)a3 withFixedDuration:(double)a4 forUserID:(id)a5 context:(id)a6 error:(id *)a7
{
  id v10 = +[STBlueprint _fetchOrCreateDowntimeForUserID:a5 inContext:a6 error:a7];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 applyOnDemandDowntimeStateChange:a3 withFixedDuration:a7 error:a4];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)removeFixedDurationOnDemandDowntimeForUserID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = +[STBlueprint _userForUserID:a3 inContext:v7 error:a5];
  char v9 = +[STBlueprint _downtimeForUser:v8 inContext:v7 error:a5];

  if (v9) {
    char v10 = [v9 removeFixedDurationOnDemandDowntimeWithError:a5];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

+ (id)applyAutomaticOnDemandDowntimeStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6
{
  int v8 = +[STBlueprint _fetchOrCreateDowntimeForUserID:a4 inContext:a5 error:a6];
  char v9 = v8;
  if (v8)
  {
    char v10 = [v8 applyAutomaticOnDemandDowntimeStateChange:a3 error:a6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)applyScheduleStateChange:(int64_t)a3 forUserID:(id)a4 context:(id)a5 error:(id *)a6
{
  int v8 = +[STBlueprint _fetchOrCreateDowntimeForUserID:a4 inContext:a5 error:a6];
  char v9 = v8;
  if (v8)
  {
    char v10 = [v8 applyScheduleStateChange:a3 error:a6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_reportCoreAnalyticsEventForDowntimeOverride:(id)a3 currentDate:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v20 state];
  int v8 = [(STBlueprint *)self configurations];
  char v9 = [v8 anyObject];

  BOOL v10 = +[STBlueprint shouldUseGracePeriodForDowntimeOverride:v20 configuration:v9];
  id v11 = [(STBlueprint *)self schedule];
  id v12 = v11;
  if (v11) {
    uint64_t v13 = [v11 enabled];
  }
  else {
    uint64_t v13 = 0;
  }
  unsigned int v14 = [v20 calendar];
  uint64_t v15 = [v14 component:32 fromDate:v6];

  uint64_t v16 = [(STBlueprint *)self users];
  uint64_t v17 = [v16 anyObject];
  uint64_t v18 = [v17 isManaged];

  uint64_t v19 = [[STDowntimeOverrideCoreAnalyticsEvent alloc] initWithDowntimeEnabled:v7 == 1 gracePeriodUsed:v10 scheduleEnabled:v13 hourOfDay:v15 userIsManaged:v18];
  +[STCoreAnalyticsReporter reportEvent:v19];
}

+ (id)_fetchOrCreateDowntimeForUserID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v9 = +[STBlueprint _userForUserID:a3 inContext:v8 error:a5];
  BOOL v10 = +[STBlueprint _downtimeForUser:v9 inContext:v8 error:a5];

  if (!v10)
  {
    uint64_t v11 = [v9 isManaged];
    id v12 = +[STBlueprint defaultStartTime];
    uint64_t v13 = +[STBlueprint defaultEndTime];
    BOOL v10 = [a1 _updatedDowntimeForUser:v9 startTime:v12 endTime:v13 scheduleByWeekdayIndex:0 enabled:0 behaviorType:v11 error:a5];
  }
  id v14 = v10;

  return v14;
}

+ (id)_userForUserID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 dsid];
  id v15 = 0;
  BOOL v10 = +[STCoreUser fetchUserWithDSID:v9 inContext:v8 error:&v15];

  id v11 = v15;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = +[STLog blueprint];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint(Downtime) _userForUserID:inContext:error:]();
    }

    if (a5) {
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:11 userInfo:0];
    }
  }

  return v10;
}

+ (BOOL)saveDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9
{
  BOOL v10 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v36 = [v18 managedObjectContext];
  uint64_t v19 = +[STBlueprint _downtimeForUser:inContext:error:](STBlueprint, "_downtimeForUser:inContext:error:", v18);
  id v20 = [v19 schedule];
  uint64_t v35 = [v20 dictionaryRepresentation];

  BOOL v21 = [a1 _updatedDowntimeForUser:v18 startTime:v17 endTime:v16 scheduleByWeekdayIndex:v15 enabled:v10 behaviorType:a8 error:a9];

  if (v21)
  {
    char v22 = [v21 schedule];
    uint64_t v23 = [v22 dictionaryRepresentation];

    int v24 = [v21 schedule];
    if ([v24 enabled] == v10)
    {
      __int16 v26 = v35;
      char v28 = [v35 isEqualToDictionary:v23];

      __int16 v25 = (void *)v36;
      if (v28) {
        goto LABEL_8;
      }
    }
    else
    {

      __int16 v26 = v35;
      __int16 v25 = (void *)v36;
    }
    id v38 = 0;
    uint64_t v29 = [v21 applyScheduleStateChange:v10 error:&v38];
    id v30 = v38;

    if (!v29)
    {
      uint64_t v33 = +[STLog blueprint];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(Downtime) saveDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:](v10, (uint64_t)v30, v33);
      }

      goto LABEL_18;
    }

LABEL_8:
    if (_os_feature_enabled_impl())
    {
      BOOL v27 = 1;
LABEL_24:

      goto LABEL_25;
    }
    if ([v25 hasChanges])
    {
      id v37 = 0;
      char v31 = [v25 save:&v37];
      id v30 = v37;
      if ((v31 & 1) == 0)
      {
        char v32 = +[STLog persistence];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint(Downtime) saveDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:]();
        }

LABEL_18:
        if (a9)
        {
          id v30 = v30;
          BOOL v27 = 0;
          *a9 = v30;
        }
        else
        {
          BOOL v27 = 0;
        }
        goto LABEL_23;
      }
    }
    else
    {
      id v30 = 0;
    }
    BOOL v27 = 1;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v27 = 0;
  __int16 v26 = v35;
  __int16 v25 = (void *)v36;
LABEL_25:

  return v27;
}

+ (id)_updatedDowntimeForUser:(id)a3 startTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 enabled:(BOOL)a7 behaviorType:(unint64_t)a8 error:(id *)a9
{
  id v14 = a9;
  v54[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (v18 || v16 && v17)
  {
    uint64_t v19 = [v15 managingOrganization];
    if (v19)
    {
      unint64_t v49 = a8;
      id v51 = v17;
      id v20 = [v15 managedObjectContext];
      BOOL v21 = [v15 dsid];
      char v22 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v21 ofType:@"downtime" fromOrganization:v19];

      id v52 = 0;
      uint64_t v23 = [v22 execute:&v52];
      id v50 = v52;
      if (v23)
      {
        id v46 = v22;
        if ((unint64_t)[v23 count] >= 2)
        {
          int v24 = +[STLog persistence];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint(Downtime) _downtimeForUser:inContext:error:]();
          }
        }
        __int16 v25 = [v23 firstObject];
        if (!v25)
        {
          __int16 v25 = [a1 _createDowntimeForUser:v15 organization:v19 context:v20];
        }
        __int16 v26 = [v25 schedule];
        if (!v26)
        {
          __int16 v26 = [[STBlueprintSchedule alloc] initWithContext:v20];
          [NSNumber numberWithDouble:300.0];
          v28 = id v27 = v16;
          [(STBlueprintSchedule *)v26 setNotificationTimeInterval:v28];

          id v16 = v27;
          id v14 = a9;
          [(STBlueprintSchedule *)v26 setEnabled:0];
          [v25 setSchedule:v26];
        }
        id v47 = v16;
        id v48 = [a1 _updatedScheduleFromSchedule:v26 withStartTime:v16 endTime:v51 scheduleByWeekdayIndex:v18 context:v20];

        uint64_t v29 = [a1 _configurationForDowntime:v25 context:v20];
        id v30 = [a1 _declarationForDowntime:v25 user:v15 configuration:v29 behaviorType:v49 context:v20 error:v14];
        if (v30
          && [a1 _updateConfiguration:v29 withDeclaration:v30 context:v20 error:v14])
        {
          char v31 = v50;
          if (([v29 hasChanges] & 1) != 0
            || ([v48 hasChanges] & 1) != 0
            || [v25 hasChanges])
          {
            [v25 setIsDirty:1];
          }
          id v14 = v25;
        }
        else
        {
          id v14 = 0;
          char v31 = v50;
        }

        char v34 = v46;
        id v16 = v47;
      }
      else
      {
        char v34 = v22;
        uint64_t v35 = +[STLog persistence];
        char v31 = v50;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint(Downtime) _downtimeForUser:inContext:error:]();
        }

        if (a9)
        {
          id v14 = 0;
          *a9 = v50;
        }
      }

      id v17 = v51;
      goto LABEL_37;
    }
    char v32 = +[STLog persistence];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint(Downtime) _updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:]();
    }

    if (!a9) {
      goto LABEL_37;
    }
    uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
LABEL_36:
    id v14 = 0;
    *a9 = v33;
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v36 = +[STLog persistence];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
    +[STBlueprint(Downtime) _updatedDowntimeForUser:startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
  }

  if (a9)
  {
    id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v54[0] = @"Cannot create downtime without valid start/end time or schedule";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    uint64_t v33 = (void *)[v44 initWithDomain:@"STErrorDomain" code:1 userInfo:v19];
    goto LABEL_36;
  }
LABEL_38:

  return v14;
}

+ (id)_organizationIdentifierForUser:(id)a3 context:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 localUserDeviceState];
  id v6 = &STOrganizationIdentifierFamily;
  if (v5)
  {
    id v7 = (void *)v5;
    int v8 = [v4 isManaged];

    if (!v8) {
      id v6 = STOrganizationIdentifierPersonal;
    }
  }
  char v9 = *v6;

  return v9;
}

+ (id)_userDSIDStringForUser:(id)a3 context:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 localUserDeviceState];
  if (v5 && (id v6 = (void *)v5, v7 = [v4 isManaged], v6, !v7))
  {
    char v9 = 0;
  }
  else
  {
    int v8 = [v4 dsid];
    char v9 = [v8 stringValue];
  }
  return v9;
}

+ (id)_createDowntimeForUser:(id)a3 organization:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [a1 _organizationIdentifierForUser:v8 context:v9];
  id v12 = [a1 _userDSIDStringForUser:v8 context:v9];
  uint64_t v13 = [[STBlueprint alloc] initWithContext:v9];

  [(STBlueprint *)v13 setType:@"downtime"];
  id v14 = v11;
  id v15 = v12;
  id v16 = [NSString alloc];
  if (v15) {
    uint64_t v17 = [v16 initWithFormat:@"%@_%@_%@", @"bedtime_activation", v14, v15];
  }
  else {
    uint64_t v17 = [v16 initWithFormat:@"%@_%@", @"bedtime_activation", v14, v22];
  }
  id v18 = (void *)v17;

  [(STBlueprint *)v13 setIdentifier:v18];
  [(STBlueprint *)v13 setOrganization:v10];

  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [(STBlueprint *)v13 setUsers:v19];

  [(STBlueprint *)v13 setEnabled:0];
  id v20 = objc_opt_new();
  [(STBlueprint *)v13 setCreationDate:v20];

  return v13;
}

+ (id)_updatedScheduleFromSchedule:(id)a3 withStartTime:(id)a4 endTime:(id)a5 scheduleByWeekdayIndex:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v14)
  {
    id v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v16 maximumRangeOfUnit:512];
    uint64_t v18 = v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v18);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__STBlueprint_Downtime___updatedScheduleFromSchedule_withStartTime_endTime_scheduleByWeekdayIndex_context___block_invoke;
    v21[3] = &unk_1E6BC7280;
    id v22 = v14;
    id v23 = v11;
    [v19 enumerateIndexesUsingBlock:v21];
  }
  else if (v12 && v13)
  {
    [v11 setStartTime:v12 endTime:v13];
  }

  return v11;
}

void __107__STBlueprint_Downtime___updatedScheduleFromSchedule_withStartTime_endTime_scheduleByWeekdayIndex_context___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v4 objectForKeyedSubscript:v5];

  id v6 = *(void **)(a1 + 40);
  int v7 = [v9 startTime];
  id v8 = [v9 endTime];
  [v6 setStartTime:v7 endTime:v8 forDay:a2];
}

+ (id)_declarationModeForBehaviorType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v4 = (id *)MEMORY[0x1E4F59ED8];
  }
  else
  {
    id v4 = (id *)MEMORY[0x1E4F59EE0];
  }
  a1 = *v4;
LABEL_6:
  return a1;
}

+ (id)_configurationForDowntime:(id)a3 context:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  id v9 = [v5 configurations];
  id v10 = [v9 sortedArrayUsingDescriptors:v8];
  id v11 = [v10 firstObject];

  if (!v11)
  {
    id v11 = [[STBlueprintConfiguration alloc] initWithContext:v6];
    [(STBlueprintConfiguration *)v11 setBlueprint:v5];
  }

  return v11;
}

+ (id)_declarationForDowntime:(id)a3 user:(id)a4 configuration:(id)a5 behaviorType:(unint64_t)a6 context:(id)a7 error:(id *)a8
{
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a1 _organizationIdentifierForUser:v15 context:v13];
  uint64_t v17 = [a1 _userDSIDStringForUser:v15 context:v13];

  uint64_t v18 = [a1 _declarationModeForBehaviorType:a6];
  uint64_t v19 = [v14 payloadPlist];

  id v20 = (void *)MEMORY[0x1E4F59F70];
  if (!v19)
  {
    id v23 = v16;
    id v24 = v17;
    id v25 = [NSString alloc];
    if (v24) {
      uint64_t v26 = [v25 initWithFormat:@"%@_%@_%@", @"bedtime_configuration", v23, v24];
    }
    else {
      uint64_t v26 = [v25 initWithFormat:@"%@_%@", @"bedtime_configuration", v23, v29];
    }
    id v27 = (void *)v26;

    BOOL v21 = [v20 buildRequiredOnlyWithIdentifier:v27 withMode:v18];

    goto LABEL_12;
  }
  id v30 = 0;
  BOOL v21 = [MEMORY[0x1E4F59F70] declarationForData:v19 error:&v30];
  id v22 = v30;
  if (v21)
  {
    [v21 setPayloadMode:v18];

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[STBlueprint(Downtime) _declarationForDowntime:user:configuration:behaviorType:context:error:]();
    if (!a8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a8) {
LABEL_8:
  }
    *a8 = v22;
LABEL_9:

  BOOL v21 = 0;
LABEL_12:

  return v21;
}

+ (BOOL)_updateConfiguration:(id)a3 withDeclaration:(id)a4 context:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = STAvailableVersion1CategoriesExcludingSystemCategories();
  [v9 setPayloadCategories:v10];

  id v11 = STAvailableCategoriesExcludingSystemCategories();
  [v9 setPayloadCategoriesVersion2:v11];

  [v9 updateServerHash];
  id v20 = 0;
  id v12 = [v9 serializeAsDataWithError:&v20];
  id v13 = v20;
  if (v12)
  {
    id v14 = [v8 payloadPlist];
    char v15 = [v14 isEqualToData:v12];

    if ((v15 & 1) == 0)
    {
      [v8 setPayloadPlist:v12];
      id v16 = [v9 declarationIdentifier];
      [v8 setIdentifier:v16];

      uint64_t v17 = [v9 declarationType];
      [v8 setType:v17];
    }
  }
  else
  {
    uint64_t v18 = +[STLog persistence];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint(Downtime) _updateConfiguration:withDeclaration:context:error:]();
    }

    if (a6) {
      *a6 = v13;
    }
  }

  return v12 != 0;
}

+ (NSDateComponents)defaultStartTime
{
  uint64_t v2 = objc_opt_new();
  [v2 setHour:22];
  [v2 setMinute:0];
  return (NSDateComponents *)v2;
}

+ (NSDateComponents)defaultEndTime
{
  uint64_t v2 = objc_opt_new();
  [v2 setHour:7];
  [v2 setMinute:0];
  return (NSDateComponents *)v2;
}

- (id)_applyScheduleStateChange:(int64_t)a3 atDate:(id)a4 inCalendar:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = STUTCErasedDateFromDate(a4, v10);
  id v12 = (void *)[v10 copy];

  id v13 = STUTCTimeZone();
  [v12 setTimeZone:v13];

  id v14 = [(STBlueprint *)self schedule];
  char v15 = +[STLog blueprint];
  id v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[STBlueprint(Downtime) _applyScheduleStateChange:atDate:inCalendar:error:](a3, v16, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = @"Enable";
    if (!a3) {
      uint64_t v17 = @"Disable";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v17;
    __int16 v38 = 2112;
    uint64_t v39 = v11;
    _os_log_impl(&dword_1DA519000, v16, OS_LOG_TYPE_DEFAULT, "Appying schedule state change: %@ at: %@", buf, 0x16u);
  }

  if (a3)
  {
    if (a3 != 1 || ([v14 enabled] & 1) != 0) {
      goto LABEL_28;
    }
    uint64_t v18 = 1;
  }
  else
  {
    if (![v14 enabled]) {
      goto LABEL_28;
    }
    uint64_t v18 = 0;
  }
  [v14 setEnabled:v18];
  [(STBlueprint *)self setEnabled:v18];
  [(STBlueprint *)self setIsDirty:1];
  id v16 = [v14 managedObjectContext];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v16 hasChanges])
    {
      id v35 = 0;
      char v26 = [v16 save:&v35];
      id v27 = v35;
      if ((v26 & 1) == 0)
      {
        char v28 = +[STLog persistence];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[STBlueprint(Downtime) _applyScheduleStateChange:atDate:inCalendar:error:]();
        }

        if (a6) {
          *a6 = v27;
        }

LABEL_12:
        id v25 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      id v27 = 0;
    }
  }
  uint64_t v29 = +[STLog blueprint];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v29, OS_LOG_TYPE_DEFAULT, "Saved downtime schedule state change", buf, 2u);
  }

LABEL_28:
  id v30 = [[STBlueprintBackedDowntimeOverrideModifier alloc] initWithDowntimeBlueprint:self];
  char v31 = [(STBlueprint *)self schedule];
  id v34 = 0;
  BOOL v32 = +[STDowntimeOverrideUpdater updateActiveOverrideUsingModifier:v30 byRecomputingFromSchedule:v31 atDate:v11 inCalendar:v12 error:&v34];
  id v16 = v34;

  if (v32)
  {
    id v25 = [(STBlueprint *)self _downtimeConfigurationAtDate:v11 inCalendar:v12];
  }
  else
  {
    id v25 = 0;
    if (a6) {
      *a6 = v16;
    }
  }

LABEL_33:
  return v25;
}

+ (id)keyPathsForValuesAffectingDowntimeScheduleText
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"schedule.scheduleRepresentation"];
}

- (NSString)downtimeScheduleText
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(STBlueprint *)self schedule];
  id v4 = [v3 scheduleRepresentation];

  id v5 = [v4 simpleSchedule];
  if (v5)
  {
    id v6 = objc_opt_class();
    int v7 = [v5 startTime];
    id v8 = [v5 endTime];
    id v9 = [v6 simpleScheduleTimeRangeWithStartTimeComponents:v7 endTimeComponents:v8];
  }
  else
  {
    uint64_t v23 = v4;
    id v10 = [v4 customScheduleItems];
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "day"));
          [v11 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    uint64_t v19 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke;
    v27[3] = &unk_1E6BC72A8;
    id v28 = v11;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke_2;
    v24[3] = &unk_1E6BC72D0;
    id v20 = v28;
    id v25 = v20;
    char v26 = self;
    id v9 = [v19 scheduleTextWithLocale:0 weekdayScheduleComparator:v27 scheduleTimeGetter:v24];
    if (!v9)
    {
      uint64_t v21 = +[STScreenTimeCoreBundle bundle];
      id v9 = [v21 localizedStringForKey:@"ScheduleOff" value:&stru_1F3487700 table:0];
    }
    id v4 = v23;
  }

  return (NSString *)v9;
}

uint64_t __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:a2 - 1];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [NSNumber numberWithUnsignedInteger:a3 - 1];
    id v10 = [v8 objectForKeyedSubscript:v9];

    id v11 = [v10 startTime];
    id v12 = [v7 startTime];
    if ([v11 isEqual:v12])
    {
      uint64_t v13 = [v10 endTime];
      uint64_t v14 = [v7 endTime];
      uint64_t v15 = [v13 isEqual:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id __45__STBlueprint_Downtime__downtimeScheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2 - 1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = objc_opt_class();
    id v6 = [v4 startTime];
    int v7 = [v4 endTime];
    id v8 = [v5 customScheduleTimeRangeWithLocale:0 startTimeComponents:v6 endTimeComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)customScheduleTimeRangeWithLocale:(id)a3 startTimeComponents:(id)a4 endTimeComponents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = v10;
  if (v7) {
    [v10 setLocale:v7];
  }
  [v11 setTimeStyle:1];
  [v11 setDateStyle:0];
  [v11 setFormattingContext:1];
  id v12 = objc_opt_new();
  uint64_t v13 = v12;
  if (v7) {
    [v12 setLocale:v7];
  }
  [v13 setFormattingContext:1];
  [v13 setLocalizedDateFormatFromTemplate:@"j"];
  uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v15 = [v14 dateFromComponents:v8];
  uint64_t v37 = v14;
  uint64_t v39 = v9;
  id v16 = [v14 dateFromComponents:v9];
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = v17;
  if (v7) {
    [v17 setLocale:v7];
  }
  [v18 setLocalizedDateFormatFromTemplate:@"a"];
  uint64_t v41 = [v18 stringFromDate:v15];
  uint64_t v40 = [v18 stringFromDate:v16];
  uint64_t v19 = (void *)MEMORY[0x1E4F28C10];
  if (v7)
  {
    id v20 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:v7];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v20 = [v19 dateFormatFromTemplate:@"j" options:0 locale:v21];
  }
  __int16 v38 = v8;
  if ([v20 containsString:@"H"])
  {

LABEL_13:
    BOOL v23 = 0;
    char v24 = 1;
    goto LABEL_15;
  }
  char v22 = [v20 containsString:@"k"];

  if (v22) {
    goto LABEL_13;
  }
  uint64_t v25 = [v8 minute];
  char v24 = 0;
  BOOL v23 = v25 == 0;
LABEL_15:
  if ([v41 isEqualToString:v40])
  {
    char v26 = objc_opt_new();
    id v27 = v26;
    if (v7) {
      [v26 setLocale:v7];
    }
    [v27 setFormattingContext:1];
    if (v23) {
      id v28 = @"J";
    }
    else {
      id v28 = @"Jmm";
    }
    [v27 setLocalizedDateFormatFromTemplate:v28];
    long long v29 = [v27 stringFromDate:v15];
  }
  else
  {
    if (v23) {
      long long v30 = v13;
    }
    else {
      long long v30 = v11;
    }
    long long v29 = [v30 stringFromDate:v15];
  }
  long long v31 = v11;
  if ((v24 & 1) == 0)
  {
    if ([v39 minute]) {
      long long v31 = v11;
    }
    else {
      long long v31 = v13;
    }
  }
  long long v32 = [v31 stringFromDate:v16];
  uint64_t v33 = +[STScreenTimeCoreBundle bundle];
  uint64_t v34 = [v33 localizedStringForKey:@"TimeRangeFormat" value:&stru_1F3487700 table:0];

  id v35 = objc_msgSend(NSString, "localizedStringWithFormat:", v34, v29, v32);

  return v35;
}

+ (id)simpleScheduleTimeRangeWithStartTimeComponents:(id)a3 endTimeComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v8 = objc_opt_new();
  id v9 = [v7 startOfDayForDate:v8];

  if ([v7 date:v9 matchesComponents:v5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [v7 nextDateAfterDate:v9 matchingComponents:v5 options:512];
  }
  id v11 = v10;
  if ([v7 date:v9 matchesComponents:v6])
  {
    id v12 = v9;
  }
  else
  {
    id v12 = [v7 nextDateAfterDate:v9 matchingComponents:v6 options:512];
  }
  uint64_t v13 = v12;
  uint64_t v14 = objc_opt_new();
  [v14 setDateStyle:0];
  [v14 setTimeStyle:1];
  uint64_t v15 = [v14 stringFromDate:v11 toDate:v13];

  return v15;
}

+ (BOOL)saveManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 createManagedUserBlueprintForUser:v6 error:a4];
  if (!v7)
  {
    uint64_t v15 = +[STLog blueprint];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(ManagedUser) saveManagedUserBlueprintForUser:error:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    id v12 = 0;
    if (a4) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || ([v6 managedObjectContext],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasChanges],
        v8,
        !v9))
  {
    id v12 = 0;
  }
  else
  {
    id v10 = [v6 managedObjectContext];
    id v24 = 0;
    char v11 = [v10 save:&v24];
    id v12 = v24;

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = +[STLog persistence];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(ManagedUser) saveManagedUserBlueprintForUser:error:]();
      }

      if (a4)
      {
        id v12 = v12;
LABEL_14:
        BOOL v14 = 0;
        *a4 = v12;
        goto LABEL_16;
      }
LABEL_15:
      BOOL v14 = 0;
      goto LABEL_16;
    }
  }
  BOOL v14 = 1;
LABEL_16:

  return v14;
}

+ (id)createManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 managingOrganization];
  if (v6)
  {
    id v7 = [v5 dsid];
    id v8 = [v5 managedUserActivationIdentifier];
    int v9 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v7 ofType:@"managed-user" withIdentifier:v8 fromOrganization:v6];

    id v50 = 0;
    id v10 = [v9 execute:&v50];
    id v11 = v50;
    if (v10)
    {
      int v45 = v9;
      if ((unint64_t)[v10 count] >= 2)
      {
        id v12 = +[STLog persistence];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.5();
        }
      }
      uint64_t v41 = a4;
      id v47 = [v5 managedObjectContext];
      id v44 = v10;
      uint64_t v13 = [v10 firstObject];
      if (!v13)
      {
        uint64_t v13 = [[STBlueprint alloc] initWithContext:v47];
        [(STBlueprint *)v13 setType:@"managed-user"];
        BOOL v14 = [v5 managedUserActivationIdentifier];
        [(STBlueprint *)v13 setIdentifier:v14];

        [(STBlueprint *)v13 setOrganization:v6];
        uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
        [(STBlueprint *)v13 setUsers:v15];
      }
      [(STBlueprint *)v13 setEnabled:1];
      [(STBlueprint *)v13 setIsDirty:1];
      uint64_t v16 = [v5 iCloudLogoutConfigurationIdentifier];
      uint64_t v17 = [(STBlueprint *)v13 configurations];
      uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v16];
      uint64_t v19 = [v17 filteredSetUsingPredicate:v18];
      uint64_t v20 = [v19 anyObject];

      if (!v20)
      {
        uint64_t v20 = [[STBlueprintConfiguration alloc] initWithContext:v47];
        [(STBlueprintConfiguration *)v20 setIdentifier:v16];
        [(STBlueprintConfiguration *)v20 setBlueprint:v13];
      }
      uint64_t v43 = (void *)v16;
      uint64_t v21 = [MEMORY[0x1E4F59F80] buildRequiredOnlyWithIdentifier:v16 withMode:*MEMORY[0x1E4F59EF8]];
      id v49 = v11;
      uint64_t v22 = [v21 serializeAsDataWithError:&v49];
      id v23 = v49;

      uint64_t v42 = v21;
      id v46 = (void *)v22;
      if (v22)
      {
        [(STBlueprintConfiguration *)v20 setPayloadPlist:v22];
        id v24 = [v21 declarationType];
        [(STBlueprintConfiguration *)v20 setType:v24];

        uint64_t v25 = [v5 automaticDateTimeConfigurationIdentifier];
        char v26 = [(STBlueprint *)v13 configurations];
        id v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v25];
        id v28 = [v26 filteredSetUsingPredicate:v27];
        long long v29 = [v28 anyObject];

        if (!v29)
        {
          long long v29 = [[STBlueprintConfiguration alloc] initWithContext:v47];
          [(STBlueprintConfiguration *)v29 setIdentifier:v25];
          [(STBlueprintConfiguration *)v29 setBlueprint:v13];
        }
        uint64_t v40 = (void *)v25;
        long long v30 = [MEMORY[0x1E4F5A010] buildRequiredOnlyWithIdentifier:v25];
        [v30 setPayloadForceAutomaticDateAndTime:MEMORY[0x1E4F1CC38]];
        [v30 updateServerHash];
        id v48 = v23;
        long long v31 = [v30 serializeAsDataWithError:&v48];
        id v11 = v48;

        if (v31)
        {
          [(STBlueprintConfiguration *)v29 setPayloadPlist:v31];
          long long v32 = [v30 declarationType];
          [(STBlueprintConfiguration *)v29 setType:v32];

          uint64_t v33 = v13;
        }
        else
        {
          uint64_t v37 = +[STLog persistence];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.4();
          }

          uint64_t v33 = 0;
          if (v41) {
            id *v41 = v11;
          }
        }
        __int16 v38 = v43;

        id v10 = v44;
        int v9 = v45;
      }
      else
      {
        uint64_t v36 = +[STLog persistence];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:]();
        }

        id v10 = v44;
        int v9 = v45;
        if (v41)
        {
          id v11 = v23;
          uint64_t v33 = 0;
          id *v41 = v11;
        }
        else
        {
          uint64_t v33 = 0;
          id v11 = v23;
        }
        __int16 v38 = v43;
      }
    }
    else
    {
      id v35 = +[STLog persistence];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:]();
      }

      if (a4)
      {
        id v11 = v11;
        uint64_t v33 = 0;
        *a4 = v11;
      }
      else
      {
        uint64_t v33 = 0;
      }
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
    uint64_t v34 = +[STLog persistence];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:]();
    }

    if (a4)
    {
      id v11 = v11;
      uint64_t v33 = 0;
      *a4 = v11;
    }
    else
    {
      uint64_t v33 = 0;
    }
  }

  return v33;
}

+ (BOOL)deleteManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v19 = 0;
  char v7 = [a1 disableManagedUserBlueprintForUser:v6 error:&v19];
  id v8 = v19;
  if (v7)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || ([v6 managedObjectContext],
          int v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 hasChanges],
          v9,
          !v10))
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }
    id v11 = [v6 managedObjectContext];
    id v18 = v8;
    char v12 = [v11 save:&v18];
    id v13 = v18;

    if (v12)
    {
      BOOL v14 = 1;
LABEL_17:
      id v8 = v13;
      goto LABEL_18;
    }
    uint64_t v16 = +[STLog persistence];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(ManagedUser) deleteManagedUserBlueprintForUser:error:]();
    }

    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    id v8 = v13;
  }
  else
  {
    uint64_t v15 = +[STLog persistence];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(ManagedUser) deleteManagedUserBlueprintForUser:error:]();
    }

    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_18;
    }
  }
  id v8 = v8;
  BOOL v14 = 0;
  *a4 = v8;
LABEL_18:

  return v14;
}

+ (BOOL)disableManagedUserBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 managingOrganization];
  if (v6)
  {
    char v7 = [v5 dsid];
    id v8 = [v5 managedUserActivationIdentifier];
    int v9 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v7 ofType:@"managed-user" withIdentifier:v8 fromOrganization:v6];

    id v19 = 0;
    int v10 = [v9 execute:&v19];
    id v11 = v19;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      uint64_t v13 = [v10 count];
      if (v13)
      {
        if (v13 != 1)
        {
          BOOL v14 = +[STLog persistence];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:].cold.5();
          }
        }
        uint64_t v15 = [v10 firstObject];
        [v15 setEnabled:0];
        [v15 setIsDirty:1];
      }
    }
    else
    {
      uint64_t v17 = +[STLog persistence];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(ManagedUser) disableManagedUserBlueprintForUser:error:]();
      }

      if (a4) {
        *a4 = v11;
      }
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
    uint64_t v16 = +[STLog persistence];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:]();
    }

    if (a4)
    {
      id v11 = v11;
      BOOL v12 = 0;
      *a4 = v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)disableRestrictionsBlueprintForUser:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 dsid];
  char v7 = [v5 managingOrganization];
  if (v7)
  {
    id v8 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v6 ofType:@"restrictions" fromOrganization:v7];
    id v22 = 0;
    int v9 = [v8 execute:&v22];
    id v10 = v22;
    if (v9)
    {
      id v11 = [v5 managedObjectContext];
      BOOL v12 = [v9 firstObject];
      BOOL v13 = 1;
      [v12 setIsDirty:1];
      [v12 setEnabled:0];
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        BOOL v14 = +[STLog persistence];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:].cold.4(v14);
        }

        if ([v11 hasChanges])
        {
          id v21 = v10;
          char v15 = [v11 save:&v21];
          id v20 = v21;

          if (v15)
          {
            BOOL v13 = 1;
            id v10 = v20;
          }
          else
          {
            id v18 = +[STLog persistence];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:]();
            }

            if (a4)
            {
              id v10 = v20;
              BOOL v13 = 0;
              *a4 = v10;
            }
            else
            {
              id v10 = v20;
              BOOL v13 = 0;
            }
          }
        }
        else
        {
          BOOL v13 = 1;
        }
      }
    }
    else
    {
      uint64_t v17 = +[STLog persistence];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:]();
      }

      if (a4)
      {
        id v10 = v10;
        BOOL v13 = 0;
        *a4 = v10;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
    uint64_t v16 = +[STLog persistence];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
    }

    if (a4)
    {
      id v10 = v10;
      BOOL v13 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)_webFilterBlacklistStringsForURL:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 absoluteString];
  id v5 = [v4 lowercaseString];
  id v6 = NSString;
  char v7 = [v3 scheme];

  id v8 = [v6 stringWithFormat:@"%@://", v7];
  int v9 = [v4 stringByReplacingOccurrencesOfString:v8 withString:&stru_1F3487700];

  id v10 = [v9 lowercaseString];
  v13[0] = v4;
  v13[1] = v5;
  void v13[2] = v9;
  v13[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];

  return v11;
}

- (BOOL)permitWebFilterURL:(id)a3 pageTitle:(id)a4 error:(id *)a5
{
  int v45 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v7 = a4;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v8 = [(STBlueprint *)self configurations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v48;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v48 != v11) {
        objc_enumerationMutation(v8);
      }
      BOOL v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      BOOL v14 = objc_msgSend(v13, "type", v45);
      char v15 = [v14 isEqualToString:@"system.webcontentfilter.basic"];

      if (v15)
      {
        id v16 = v13;

        if (!v16) {
          goto LABEL_20;
        }
        uint64_t v17 = [v16 cemConfiguration];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v17 payloadRestrictWeb],
              id v18 = objc_claimAutoreleasedReturnValue(),
              char v19 = [v18 BOOLValue],
              v18,
              (v19 & 1) != 0))
        {
          id v20 = [v17 payloadUseContentFilter];
          int v21 = [v20 BOOLValue];

          id v22 = [v17 payloadWhiteListEnabled];
          int v23 = [v22 BOOLValue];

          id v24 = v46;
          uint64_t v25 = v7;
          if (v21 && (v23 & 1) == 0)
          {
            char v26 = [v17 payloadFilterBlackList];
            if (v26)
            {
              id v27 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v26];
              id v28 = [(STBlueprint *)self _webFilterBlacklistStringsForURL:v46];
              [v27 removeObjectsInArray:v28];
              long long v29 = [v27 array];
              [v17 setPayloadFilterBlackList:v29];
            }
            uint64_t v30 = [v17 payloadFilterWhiteList];
            long long v31 = (void *)v30;
            long long v32 = (void *)MEMORY[0x1E4F1CBF0];
            if (v30) {
              long long v32 = (void *)v30;
            }
            id v33 = v32;

            uint64_t v34 = [v46 host];
            id v35 = [v33 arrayByAddingObject:v34];

            [v17 setPayloadFilterWhiteList:v35];
LABEL_37:

            [v17 updateServerHash];
            [v16 setCemConfiguration:v17];
            BOOL v36 = 1;
            [(STBlueprint *)self setIsDirty:1];
LABEL_38:

            goto LABEL_39;
          }
          if (((v21 | v23 ^ 1) & 1) == 0)
          {
            char v26 = objc_opt_new();
            uint64_t v39 = [v46 absoluteString];
            [v26 setPayloadAddress:v39];

            [v26 setPayloadPageTitle:v25];
            uint64_t v40 = [v17 payloadSiteWhiteList];
            uint64_t v41 = (void *)v40;
            uint64_t v42 = (void *)MEMORY[0x1E4F1CBF0];
            if (v40) {
              uint64_t v42 = (void *)v40;
            }
            id v43 = v42;

            uint64_t v34 = [v43 arrayByAddingObject:v26];

            [v17 setPayloadSiteWhiteList:v34];
            goto LABEL_37;
          }
          __int16 v38 = +[STLog blueprint];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[STBlueprint(Restrictions) permitWebFilterURL:pageTitle:error:]();
          }
        }
        else
        {
          uint64_t v37 = +[STLog blueprint];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[STBlueprint(Restrictions) permitWebFilterURL:pageTitle:error:]();
          }

          id v24 = v46;
          uint64_t v25 = v7;
        }
        if (v45)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:1 userInfo:0];
          BOOL v36 = 0;
          id *v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v36 = 0;
        }
        goto LABEL_38;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_9:

LABEL_20:
  if (v45)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:14 userInfo:0];
    BOOL v36 = 0;
    id *v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v36 = 0;
  }
  id v24 = v46;
  uint64_t v25 = v7;
LABEL_39:

  return v36;
}

+ (BOOL)saveRestrictionsBlueprintWithValuesForPresetRestrictions:(id)a3 forUser:(id)a4 error:(id *)a5
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v150 = a4;
  id v7 = v6;
  id v8 = objc_opt_new();
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v187 objects:v203 count:16];
  unint64_t v11 = 0x1E4F29000uLL;
  id v147 = v9;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v171 = *(void *)v188;
    id v152 = v8;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v188 != v171) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v187 + 1) + 8 * v13);
        char v15 = [v14 componentsSeparatedByString:@"."];
        id v16 = (void *)[v15 mutableCopy];

        id v17 = [v16 lastObject];
        [v16 removeLastObject];
        id v18 = [v16 componentsJoinedByString:@"."];

        id v19 = v17;
        id v20 = v18;
        obuint64_t j = [v9 objectForKeyedSubscript:v14];
        if (!obj)
        {
          obuint64_t j = [MEMORY[0x1E4F1CA98] null];
        }
        if ([v20 isEqualToString:@"STCustomRestrictionConfiguration"])
        {
          if ([v19 isEqualToString:@"STCustomRestrictionCellularData"])
          {
            v201[0] = @"network.cellular.settings.allowAppCellularDataModification";
            v201[1] = @"network.cellular.settings.allowCellularPlanModification";
            int v21 = obj;
            v202[0] = obj;
            v202[1] = obj;
            id v22 = (void *)MEMORY[0x1E4F1C9E8];
            int v23 = v202;
            id v24 = v201;
LABEL_20:
            long long v29 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:2];
            goto LABEL_21;
          }
          int v21 = obj;
          if ([v19 isEqualToString:@"STCustomRestrictionSiriDictation"])
          {
            v199[0] = @"system.siri.allowAssistant";
            v199[1] = @"system.siri.allowDictation";
            v200[0] = obj;
            v200[1] = obj;
            id v22 = (void *)MEMORY[0x1E4F1C9E8];
            int v23 = v200;
            id v24 = v199;
            goto LABEL_20;
          }
          id v162 = v20;
          if ([v19 isEqualToString:@"STCustomRestrictionWebFilterState"])
          {
            uint64_t v30 = [obj unsignedIntegerValue];
            if (v30)
            {
              uint64_t v31 = v30;
              if (v30 == 2)
              {
                id v156 = v19;
                uint64_t v160 = v12;
                long long v154 = (void *)[&unk_1F349EEC8 mutableCopy];
                uint64_t v34 = [MEMORY[0x1E4F74230] sharedConnection];
                id v35 = [v34 defaultUserBookmarks];

                BOOL v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
                long long v191 = 0u;
                long long v192 = 0u;
                long long v193 = 0u;
                long long v194 = 0u;
                id v37 = v35;
                uint64_t v38 = [v37 countByEnumeratingWithState:&v191 objects:buf count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v192;
                  do
                  {
                    for (uint64_t i = 0; i != v39; ++i)
                    {
                      if (*(void *)v192 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      uint64_t v42 = *(void **)(*((void *)&v191 + 1) + 8 * i);
                      id v43 = (void *)MEMORY[0x1E4F59FF8];
                      id v44 = [v42 URL];
                      int v45 = [v44 absoluteString];
                      id v46 = [v42 title];
                      long long v47 = [v43 buildWithAddress:v45 withPageTitle:v46];

                      [v36 addObject:v47];
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v191 objects:buf count:16];
                  }
                  while (v39);
                }

                long long v48 = (void *)[v36 copy];
                [v154 setObject:v48 forKeyedSubscript:@"system.webcontentfilter.basic.siteWhiteList"];

                long long v29 = (void *)[v154 copy];
                id v9 = v147;
                unint64_t v11 = 0x1E4F29000;
                id v8 = v152;
                id v19 = v156;
                uint64_t v12 = v160;
                int v21 = obj;
              }
              else if (v30 == 1)
              {
                long long v29 = &unk_1F349EEA0;
              }
              else
              {
                long long v49 = [MEMORY[0x1E4F28B00] currentHandler];
                [*(id *)(v11 + 24) stringWithUTF8String:"NSDictionary<NSString *,id> * _Nonnull restrictionsForWebFilterState(STWebFilterState)"];
                id v50 = v19;
                v52 = uint64_t v51 = v12;
                objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v52, @"STBlueprint+Restrictions.m", 446, @"Unimplemented web filter state %d", v31);

                uint64_t v12 = v51;
                id v19 = v50;

                long long v29 = (void *)MEMORY[0x1E4F1CC08];
              }
            }
            else
            {
              long long v29 = &unk_1F349EE78;
            }
            id v20 = v162;
          }
          else
          {
            long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
            id v33 = [*(id *)(v11 + 24) stringWithUTF8String:"NSDictionary<NSString *,id> * _Nonnull valuesForRestrictionsToSaveFromPresetRestrictions(NSDictionary<NSString *,id> * _Nonnull __strong)"];
            [v32 handleFailureInFunction:v33, @"STBlueprint+Restrictions.m", 363, @"Unimplemented restriction %@ %@", v162, v19 file lineNumber description];

            id v20 = v162;
            long long v29 = 0;
          }
        }
        else
        {
          if ([v20 isEqualToString:@"system.gamecenter"]
            && [v19 isEqualToString:@"allowedGameCenterOtherPlayerTypes"])
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            v26 = id v25 = v20;
            id v27 = [*(id *)(v11 + 24) stringWithUTF8String:"NSDictionary<NSString *,id> * _Nonnull valuesForRestrictionsToSaveFromPresetRestrictions(NSDictionary<NSString *,id> * _Nonnull __strong)"];
            [v26 handleFailureInFunction:v27, @"STBlueprint+Restrictions.m", 367, @"Unimplemented non-preset restriction %@ %@", v25, v19 file lineNumber description];

            id v20 = v25;
          }
          v197 = v14;
          int v21 = obj;
          id v28 = obj;
          if (!obj)
          {
            v168 = [MEMORY[0x1E4F1CA98] null];
            id v28 = v168;
          }
          id v198 = v28;
          long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
          if (!obj) {
        }
          }
LABEL_21:
        [v8 addEntriesFromDictionary:v29];

        ++v13;
      }
      while (v13 != v12);
      uint64_t v53 = [v9 countByEnumeratingWithState:&v187 objects:v203 count:16];
      uint64_t v12 = v53;
    }
    while (v53);
  }

  uint64_t v54 = (void *)[v8 copy];
  id v55 = [v150 dsid];
  id v56 = v150;
  id v57 = [v56 localUserDeviceState];

  long long v58 = &STOrganizationIdentifierFamily;
  if (v57)
  {
    uint64_t v59 = [v56 familySettings];
    int v60 = [v59 isManaged];

    if (!v60) {
      long long v58 = STOrganizationIdentifierPersonal;
    }
  }
  id v61 = *v58;
  v146 = v56;

  unint64_t v161 = objc_opt_new();
  long long v151 = objc_opt_new();
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id obja = v54;
  id v153 = v61;
  uint64_t v172 = [obja countByEnumeratingWithState:&v183 objects:v196 count:16];
  if (v172)
  {
    uint64_t v169 = *(void *)v184;
    long long v148 = v55;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v184 != v169) {
          objc_enumerationMutation(obja);
        }
        BOOL v63 = *(void **)(*((void *)&v183 + 1) + 8 * v62);
        long long v64 = [obja objectForKeyedSubscript:v63];
        uint64_t v65 = [MEMORY[0x1E4F1CA98] null];

        if (v64 == v65)
        {

          long long v64 = 0;
        }
        id v66 = v63;
        uint64_t v67 = [v66 componentsSeparatedByString:@"."];
        id v68 = (void *)[v67 mutableCopy];

        id v69 = [v68 lastObject];
        [v68 removeLastObject];
        id v70 = [v68 componentsJoinedByString:@"."];

        id v71 = v69;
        id v72 = v70;
        uint64_t v73 = +[STLog persistence];
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          uint64_t v205 = (uint64_t)v66;
          __int16 v206 = 2114;
          v207 = v64;
          __int16 v208 = 2114;
          v209 = v61;
          __int16 v210 = 2112;
          v211 = v55;
          _os_log_impl(&dword_1DA519000, v73, OS_LOG_TYPE_DEFAULT, "Asked to change restriction %{public}@ value to %{public}@ for %{public}@.%@", buf, 0x2Au);
        }

        if ([v72 isEqualToString:@"STCustomRestrictionConfiguration"])
        {
          id v74 = [MEMORY[0x1E4F28B00] currentHandler];
          [v74 handleFailureInMethod:a2, a1, @"STBlueprint+Restrictions.m", 211, @"Unimplemented restriction %@ %@", v72, v71 object file lineNumber description];
          goto LABEL_60;
        }
        if ([v72 isEqualToString:@"STSBCapabilityConfiguration"])
        {
          BOOL v75 = [MEMORY[0x1E4F28B00] currentHandler];
          id v74 = v75;
          id v142 = v72;
          id v143 = v71;
          id v77 = a1;
          SEL v76 = a2;
          uint64_t v78 = 213;
LABEL_59:
          [v75 handleFailureInMethod:v76, v77, @"STBlueprint+Restrictions.m", v78, @"Unimplemented non-preset restriction %@ %@", v142, v143 object file lineNumber description];
          goto LABEL_60;
        }
        if ([v72 isEqualToString:@"STMCFeatureConfiguration"])
        {
          BOOL v75 = [MEMORY[0x1E4F28B00] currentHandler];
          id v74 = v75;
          id v142 = v72;
          id v143 = v71;
          id v77 = a1;
          SEL v76 = a2;
          uint64_t v78 = 215;
          goto LABEL_59;
        }
        v79 = [v161 objectForKeyedSubscript:v72];
        if (!v79)
        {
          id v80 = v72;
          uint64_t v81 = v61;
          id v82 = v55;
          v83 = +[STLog persistence];
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v205 = (uint64_t)v80;
            _os_log_impl(&dword_1DA519000, v83, OS_LOG_TYPE_DEFAULT, "Creating new restriction configuration %{public}@", buf, 0xCu);
          }

          id v84 = v80;
          id v85 = v82;
          v86 = v81;
          if ([(__CFString *)v86 isEqualToString:@"personal"]) {
            [NSString stringWithFormat:@"%@.%@", @"digital_health_restrictions", v84, v144];
          }
          else {
          v87 = [NSString stringWithFormat:@"%@.%@.%@", @"digital_health_restrictions", v85, v84];
          }

          if ([v84 isEqualToString:@"account.settings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F18];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"application.settings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F28];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"application.store"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F30];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"legacy.restrictions.apps"])
          {
            v79 = [MEMORY[0x1E4F59F48] buildRequiredOnlyWithIdentifier:v87];
            [v79 setPayloadBlacklistedAppBundleIDs:MEMORY[0x1E4F1CBF0]];
            goto LABEL_76;
          }
          if ([v84 isEqualToString:@"media.settings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F50];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"network.cellular.settings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F58];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"passcode.settings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59F60];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.airdrop"])
          {
            long long v88 = (void *)MEMORY[0x1E4F59FE8];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.camera"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A000];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.carplay"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A008];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.donotdisturb"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A018];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.gamecenter"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A020];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.icloud"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A050];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.music"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A028];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.ratings"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A030];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.siri"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A038];
            goto LABEL_74;
          }
          if ([v84 isEqualToString:@"system.tvprovider"])
          {
            long long v88 = (void *)MEMORY[0x1E4F5A040];
LABEL_74:
            uint64_t v89 = [v88 buildRequiredOnlyWithIdentifier:v87];
          }
          else
          {
            if (![v84 isEqualToString:@"system.webcontentfilter.basic"])
            {
              v158 = v86;
              if ([v84 isEqualToString:@"system.web.tracking"])
              {
                v79 = [MEMORY[0x1E4F5A048] buildRequiredOnlyWithIdentifier:v87];
              }
              else
              {
                v99 = [MEMORY[0x1E4F28B00] currentHandler];
                v100 = objc_msgSend(NSString, "stringWithUTF8String:", "__kindof CEMConfigurationBase * _Nonnull createUnrestrictedConfiguration(NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSNumber * _Nonnull __strong)");
                [v99 handleFailureInFunction:v100, @"STBlueprint+Restrictions.m", 517, @"Unimplemented for type %@", v84 file lineNumber description];

                v79 = 0;
              }
              v86 = v158;
              goto LABEL_76;
            }
            uint64_t v89 = [MEMORY[0x1E4F59FF0] buildRequiredOnlyWithIdentifier:v87 withRestrictWeb:MEMORY[0x1E4F1CC28]];
          }
          v79 = (void *)v89;
LABEL_76:
        }
        id v74 = v79;
        id v90 = v71;
        long long v91 = v64;
        long long v92 = [v90 substringToIndex:1];
        uint64_t v93 = objc_msgSend(v90, "substringWithRange:", 1, objc_msgSend(v90, "length") - 1);
        v203[0] = @"payload";
        long long v157 = v92;
        long long v94 = [v92 capitalizedString];
        v203[1] = v94;
        long long v155 = (void *)v93;
        v203[2] = v93;
        uint64_t v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:3];
        v96 = [v95 componentsJoinedByString:&stru_1F3487700];

        v97 = +[STLog persistence];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v98 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          uint64_t v205 = v98;
          __int16 v206 = 2112;
          v207 = v96;
          __int16 v208 = 2112;
          v209 = v91;
          _os_log_impl(&dword_1DA519000, v97, OS_LOG_TYPE_DEFAULT, "Setting CEM key %@.%@ to %@", buf, 0x20u);
        }

        [v74 setValue:v91 forKeyPath:v96];
        [v74 updateServerHash];

        [v161 setObject:v74 forKeyedSubscript:v72];
        [v151 addObject:v72];
        id v55 = v148;
        id v61 = v153;
LABEL_60:

        ++v62;
      }
      while (v172 != v62);
      uint64_t v101 = [obja countByEnumeratingWithState:&v183 objects:v196 count:16];
      uint64_t v172 = v101;
    }
    while (v101);
  }

  if ([v151 count])
  {
    v102 = v146;
    v103 = [v146 managingOrganization];
    v104 = v147;
    if (!v103)
    {
      v108 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
      v115 = +[STLog persistence];
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(AlwaysAllow) saveAlwaysAllowListForUser:withBundleIDs:overwriteExistingList:error:]();
      }

      if (a5)
      {
        v108 = v108;
        BOOL v114 = 0;
        *a5 = v108;
      }
      else
      {
        BOOL v114 = 0;
      }
      goto LABEL_161;
    }
    v105 = +[STLog persistence];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG)) {
      +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.6((uint64_t)v103, v105);
    }

    uint64_t v106 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v55 ofType:@"restrictions" fromOrganization:v103];
    id v182 = 0;
    uint64_t v107 = [v106 execute:&v182];
    v108 = v182;
    v167 = v107;
    if (!v107)
    {
      int v116 = +[STLog persistence];
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(Restrictions) disableRestrictionsBlueprintForUser:error:]();
      }

      id v61 = v153;
      if (a5)
      {
        v108 = v108;
        BOOL v114 = 0;
        *a5 = v108;
      }
      else
      {
        BOOL v114 = 0;
      }
      goto LABEL_160;
    }
    v173 = [v146 managedObjectContext];
    id v109 = [v107 firstObject];
    if (!v109)
    {
      uint64_t v110 = [[STBlueprint alloc] initWithContext:v173];
      [(STBlueprint *)v110 setType:@"restrictions"];
      uint64_t v111 = v153;
      id v112 = v55;
      if ([(__CFString *)v111 isEqualToString:@"personal"])
      {
        v113 = @"digital_health_restrictions";
      }
      else
      {
        v113 = [NSString stringWithFormat:@"%@.%@", @"digital_health_restrictions", v112];
      }
      uint64_t v117 = v113;

      id v109 = v110;
      [(STBlueprint *)v110 setIdentifier:v117];

      [(STBlueprint *)v110 setOrganization:v103];
      v118 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v146, 0);
      [(STBlueprint *)v110 setUsers:v118];
    }
    v159 = v106;
    v163 = v103;
    long long v149 = v55;
    [v109 setIsDirty:1];
    [v109 setEnabled:1];
    v170 = v109;
    v119 = [v109 configurations];
    v120 = [v119 allObjects];

    v121 = (void *)MEMORY[0x1E4F1C9E8];
    v122 = [v120 valueForKey:@"type"];
    v165 = v120;
    v123 = [v121 dictionaryWithObjects:v120 forKeys:v122];

    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v124 = v151;
    uint64_t v125 = [v124 countByEnumeratingWithState:&v178 objects:v195 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v179;
      while (2)
      {
        uint64_t v128 = 0;
        v129 = v108;
        do
        {
          if (*(void *)v179 != v127) {
            objc_enumerationMutation(v124);
          }
          uint64_t v130 = *(void *)(*((void *)&v178 + 1) + 8 * v128);
          v131 = [v161 objectForKeyedSubscript:v130];
          v132 = [v123 objectForKeyedSubscript:v130];
          if (!v132)
          {
            v132 = [[STBlueprintConfiguration alloc] initWithContext:v173];
            uint32_t v133 = [v131 declarationIdentifier];
            [(STBlueprintConfiguration *)v132 setIdentifier:v133];

            [(STBlueprintConfiguration *)v132 setType:v130];
            [(STBlueprintConfiguration *)v132 setBlueprint:v170];
          }
          [v131 updateServerHash];
          v177 = v129;
          v134 = [v131 serializeAsDataWithError:&v177];
          v108 = v177;

          if (!v134)
          {
            v135 = +[STLog persistence];
            if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT)) {
              +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.5();
            }

            id v61 = v153;
            v103 = v163;
            if (a5) {
              *a5 = v108;
            }

            BOOL v114 = 0;
            v102 = v146;
            v104 = v147;
            goto LABEL_157;
          }
          [(STBlueprintConfiguration *)v132 setPayloadPlist:v134];

          ++v128;
          v129 = v108;
          id v61 = v153;
        }
        while (v126 != v128);
        uint64_t v126 = [v124 countByEnumeratingWithState:&v178 objects:v195 count:16];
        if (v126) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v61 = v153;
    }

    if (_os_feature_enabled_impl())
    {
      BOOL v114 = 1;
      v102 = v146;
      v104 = v147;
      v103 = v163;
LABEL_157:
      uint64_t v106 = v159;
    }
    else
    {
      v138 = +[STLog persistence];
      v102 = v146;
      v104 = v147;
      uint64_t v106 = v159;
      v136 = v173;
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG)) {
        +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:].cold.4(v138);
      }

      v103 = v163;
      if (![v173 hasChanges])
      {
        BOOL v114 = 1;
        goto LABEL_159;
      }
      v176 = v108;
      char v139 = [v173 save:&v176];
      v140 = v176;

      if (v139)
      {
        BOOL v114 = 1;
        v108 = v140;
        goto LABEL_159;
      }
      v141 = +[STLog persistence];
      if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(Restrictions) saveRestrictionsBlueprintWithValuesForPresetRestrictions:forUser:error:]();
      }

      if (a5)
      {
        v108 = v140;
        BOOL v114 = 0;
        *a5 = v108;
      }
      else
      {
        BOOL v114 = 0;
        v108 = v140;
      }
    }
    v136 = v173;
LABEL_159:

    id v55 = v149;
LABEL_160:

LABEL_161:
    goto LABEL_162;
  }
  v108 = +[STLog persistence];
  v102 = v146;
  v104 = v147;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v108, OS_LOG_TYPE_DEFAULT, "No preset restrictions to apply, exiting.", buf, 2u);
  }
  BOOL v114 = 1;
LABEL_162:

  return v114;
}

- (void)setUsageLimitEnabled:(BOOL)a3
{
  [(STBlueprint *)self setLimitEnabled:a3];
  [(STBlueprint *)self setIsDirty:1];
}

+ (BOOL)saveUsageLimitWithIdentifier:(id)a3 user:(id)a4 bundleIdentifiers:(id)a5 webDomains:(id)a6 categoryIdentifiers:(id)a7 dailyBudgetLimit:(double)a8 budgetLimitByWeekday:(id)a9 enabled:(BOOL)a10 behaviorType:(unint64_t)a11 error:(id *)a12
{
  v205[1] = *MEMORY[0x1E4F143B8];
  id v136 = a3;
  id v138 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v131 = a9;
  v134 = v20;
  uint64_t v23 = [v20 count];
  uint32_t v133 = v21;
  uint64_t v24 = [v21 count];
  v135 = v22;
  uint64_t v25 = [v22 count];
  uint64_t v26 = v25;
  BOOL v27 = v25 != 0;
  if (!v23 && !v24 && !v25)
  {
    v118 = [MEMORY[0x1E4F28B00] currentHandler];
    [v118 handleFailureInMethod:a2, a1, @"STBlueprint+UsageLimit.m", 76, @"Invalid parameter not satisfying: %@", @"hasBundleIdentifiers || hasWebDomains || hasCategoryIdentifiers" object file lineNumber description];
  }
  uint64_t v199 = 0;
  v200 = (id *)&v199;
  uint64_t v201 = 0x3032000000;
  v202 = __Block_byref_object_copy__1;
  v203 = __Block_byref_object_dispose__1;
  id v204 = 0;
  v137 = [v138 managingOrganization];
  if (v137)
  {
    if (v136)
    {
      id v28 = [v138 dsid];
      long long v29 = [a1 fetchRequestMatchingBlueprintsForUserWithDSID:v28 ofType:@"usage-limit" withIdentifier:v136 fromOrganization:v137];

      [v29 setReturnsObjectsAsFaults:0];
      uint64_t v30 = v200;
      id v198 = v200[5];
      uint64_t v31 = [v29 execute:&v198];
      objc_storeStrong(v30 + 5, v198);

      if (!v31)
      {
        long long v49 = +[STLog persistence];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.8();
        }
        v132 = 0;
        BOOL v36 = 0;
        goto LABEL_100;
      }
      long long v32 = (void *)v31;
    }
    else
    {
      id v37 = [NSString alloc];
      uint64_t v38 = objc_opt_new();
      uint64_t v39 = [v38 UUIDString];
      id v136 = (id)[v37 initWithFormat:@"%@_%@", @"budget_activation", v39];

      long long v32 = 0;
    }
    v132 = v32;
    if ((unint64_t)[v32 count] >= 2)
    {
      uint64_t v40 = +[STLog persistence];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.7();
      }
    }
    uint64_t v41 = [v138 managedObjectContext];
    uint64_t v42 = [v132 firstObject];
    if (!v42)
    {
      uint64_t v42 = [[STBlueprint alloc] initWithContext:v41];
      [(STBlueprint *)v42 setType:@"usage-limit"];
      [(STBlueprint *)v42 setIdentifier:v136];
      [(STBlueprint *)v42 setOrganization:v137];
      id v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v138, 0);
      [(STBlueprint *)v42 setUsers:v43];

      id v44 = objc_opt_new();
      [(STBlueprint *)v42 setCreationDate:v44];
    }
    [(STBlueprint *)v42 setIsDirty:1];
    [(STBlueprint *)v42 setLimitEnabled:a10];
    int v45 = [(STBlueprint *)v42 usageLimit];
    if (!v45)
    {
      int v45 = [[STBlueprintUsageLimit alloc] initWithContext:v41];
      id v46 = [NSNumber numberWithDouble:300.0];
      [(STBlueprintUsageLimit *)v45 setNotificationTimeInterval:v46];
    }
    [(STBlueprintUsageLimit *)v45 setApplicationIdentifiers:v134];
    [(STBlueprintUsageLimit *)v45 setWebsiteIdentifiers:v133];
    [(STBlueprintUsageLimit *)v45 setCategoryIdentifiersVersion2:v135];
    long long v47 = (void *)[v135 mutableCopy];
    [v47 removeObject:*MEMORY[0x1E4F58088]];
    [v47 removeObject:*MEMORY[0x1E4F58040]];
    [v47 removeObject:*MEMORY[0x1E4F58080]];
    if (v26 && ![v47 count]) {
      [v47 addObject:*MEMORY[0x1E4F58028]];
    }
    [(STBlueprintUsageLimit *)v45 setCategoryIdentifiers:v47];
    if (v26)
    {
      [(STBlueprintUsageLimit *)v45 setItemIdentifiers:v47];
      long long v48 = &STBlueprintUsageLimitItemTypeCategory;
    }
    else if (v23)
    {
      [(STBlueprintUsageLimit *)v45 setItemIdentifiers:v134];
      long long v48 = STBlueprintUsageLimitItemTypeApp;
    }
    else
    {
      if (!v24) {
        goto LABEL_34;
      }
      [(STBlueprintUsageLimit *)v45 setItemIdentifiers:v133];
      long long v48 = STBlueprintUsageLimitItemTypeWebDomain;
    }
    [(STBlueprintUsageLimit *)v45 setUsageItemType:*v48];
LABEL_34:
    if (v131)
    {
      v196[0] = MEMORY[0x1E4F143A8];
      v196[1] = 3221225472;
      v196[2] = __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke;
      v196[3] = &unk_1E6BC7308;
      v197 = v45;
      [v131 enumerateKeysAndObjectsUsingBlock:v196];
    }
    else
    {
      [(STBlueprintUsageLimit *)v45 setBudgetLimit:a8];
    }
    [(STBlueprint *)v42 setUsageLimit:v45];
    uint64_t v190 = 0;
    long long v191 = &v190;
    uint64_t v192 = 0x3032000000;
    long long v193 = __Block_byref_object_copy__1;
    long long v194 = __Block_byref_object_dispose__1;
    id v195 = 0;
    uint64_t v184 = 0;
    long long v185 = &v184;
    uint64_t v186 = 0x3032000000;
    long long v187 = __Block_byref_object_copy__1;
    long long v188 = __Block_byref_object_dispose__1;
    id v189 = 0;
    uint64_t v178 = 0;
    long long v179 = &v178;
    uint64_t v180 = 0x3032000000;
    long long v181 = __Block_byref_object_copy__1;
    id v182 = __Block_byref_object_dispose__1;
    id v183 = 0;
    uint64_t v172 = 0;
    v173 = &v172;
    uint64_t v174 = 0x3032000000;
    v175 = __Block_byref_object_copy__1;
    v176 = __Block_byref_object_dispose__1;
    id v177 = 0;
    uint64_t v166 = 0;
    v167 = &v166;
    uint64_t v168 = 0x3032000000;
    uint64_t v169 = __Block_byref_object_copy__1;
    v170 = __Block_byref_object_dispose__1;
    id v171 = 0;
    uint64_t v160 = 0;
    unint64_t v161 = &v160;
    uint64_t v162 = 0x3032000000;
    v163 = __Block_byref_object_copy__1;
    __int16 v164 = __Block_byref_object_dispose__1;
    id v165 = 0;
    id v50 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
    v205[0] = v50;
    uint64_t v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:1];

    uint64_t v51 = [(STBlueprint *)v42 configurations];
    uint64_t v127 = [v51 sortedArrayUsingDescriptors:v128];

    uint64_t v156 = 0;
    long long v157 = &v156;
    uint64_t v158 = 0x2020000000;
    char v159 = 0;
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke_2;
    v143[3] = &unk_1E6BC7330;
    v145 = &v199;
    v146 = &v156;
    BOOL v153 = v23 != 0;
    id v147 = &v190;
    long long v148 = &v184;
    uint64_t v52 = v41;
    uint64_t v144 = v52;
    long long v149 = &v178;
    BOOL v154 = v24 != 0;
    id v150 = &v172;
    long long v151 = &v166;
    BOOL v155 = v27;
    id v152 = &v160;
    [v127 enumerateObjectsUsingBlock:v143];
    if (*((unsigned char *)v157 + 24))
    {
      uint64_t v53 = +[STLog persistence];
      long long v49 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.6();
      }
      BOOL v36 = 0;
      goto LABEL_99;
    }
    long long v49 = v52;
    if (a11)
    {
      if (a11 != 1)
      {
        id v129 = 0;
        uint64_t v130 = 0;
        id v126 = 0;
        if (v23) {
          goto LABEL_47;
        }
        goto LABEL_50;
      }
      uint64_t v54 = (id *)MEMORY[0x1E4F59ED8];
      id v55 = (id *)MEMORY[0x1E4F59EE8];
      id v56 = (id *)MEMORY[0x1E4F59EC0];
    }
    else
    {
      uint64_t v54 = (id *)MEMORY[0x1E4F59EE0];
      id v55 = (id *)MEMORY[0x1E4F59EF0];
      id v56 = (id *)MEMORY[0x1E4F59ED0];
    }
    uint64_t v130 = *v56;
    id v129 = *v55;
    id v126 = *v54;
    if (v23)
    {
LABEL_47:
      if (v191[5])
      {
        [(id)v185[5] setPayloadMode:v130];
        [(id)v185[5] setPayloadApps:v134];
      }
      else
      {
        long long v58 = [[STBlueprintConfiguration alloc] initWithContext:v49];
        uint64_t v59 = (void *)v191[5];
        v191[5] = (uint64_t)v58;

        [(id)v191[5] setBlueprint:v42];
        v119 = (void *)MEMORY[0x1E4F59F68];
        id v60 = v138;
        id v61 = [v60 localUserDeviceState];
        if (v61 && (int v62 = [v60 isManaged], v61, !v62))
        {
          id v66 = [NSString alloc];
          BOOL v63 = objc_opt_new();
          v123 = [v63 UUIDString];
          v121 = (void *)[v66 initWithFormat:@"%@_%@_%@", @"budget_configuration", @"personal", v123];
        }
        else
        {
          id v120 = [NSString alloc];
          BOOL v63 = [v60 dsid];
          v123 = [v63 stringValue];
          long long v64 = objc_opt_new();
          uint64_t v65 = [v64 UUIDString];
          v121 = (void *)[v120 initWithFormat:@"%@_%@_%@_%@", @"budget_configuration", @"family", v123, v65];
        }
        uint64_t v67 = [v119 buildWithIdentifier:v121 withMode:v130 withApps:v134];
        id v68 = (void *)v185[5];
        v185[5] = v67;
      }
      id v69 = [(id)v185[5] declarationIdentifier];
      [(id)v191[5] setIdentifier:v69];

      id v70 = [(id)v185[5] declarationType];
      [(id)v191[5] setType:v70];

      [(id)v185[5] updateServerHash];
      id v71 = (void *)v185[5];
      id v72 = v200;
      obuint64_t j = v200[5];
      uint64_t v73 = [v71 serializeAsDataWithError:&obj];
      objc_storeStrong(v72 + 5, obj);
      BOOL v57 = v73 != 0;
      if (v73)
      {
        [(id)v191[5] setPayloadPlist:v73];
      }
      else
      {
        id v74 = +[STLog persistence];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT)) {
          +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]();
        }
      }
LABEL_62:
      if (v57 && v24)
      {
        if (v179[5])
        {
          [(id)v173[5] setPayloadMode:v129];
          [(id)v173[5] setPayloadHostnames:v133];
        }
        else
        {
          BOOL v75 = [[STBlueprintConfiguration alloc] initWithContext:v49];
          SEL v76 = (void *)v179[5];
          v179[5] = (uint64_t)v75;

          [(id)v179[5] setBlueprint:v42];
          id v77 = (void *)MEMORY[0x1E4F59F78];
          id v78 = v138;
          v79 = [v78 localUserDeviceState];
          if (v79 && (int v80 = [v78 isManaged], v79, !v80))
          {
            id v85 = [NSString alloc];
            id v124 = objc_opt_new();
            v122 = [v124 UUIDString];
            id v84 = (void *)[v85 initWithFormat:@"%@_%@_%@", @"budget_configuration", @"personal", v122];
          }
          else
          {
            id v81 = [NSString alloc];
            id v124 = [v78 dsid];
            v122 = [v124 stringValue];
            id v82 = objc_opt_new();
            v83 = [v82 UUIDString];
            id v84 = (void *)[v81 initWithFormat:@"%@_%@_%@_%@", @"budget_configuration", @"family", v122, v83];
          }
          uint64_t v86 = [v77 buildWithIdentifier:v84 withMode:v129 withHostnames:v133];
          v87 = (void *)v173[5];
          v173[5] = v86;
        }
        long long v88 = [(id)v173[5] declarationIdentifier];
        [(id)v179[5] setIdentifier:v88];

        uint64_t v89 = [(id)v173[5] declarationType];
        [(id)v179[5] setType:v89];

        [(id)v173[5] updateServerHash];
        id v90 = (void *)v173[5];
        long long v91 = v200;
        id v141 = v200[5];
        long long v92 = [v90 serializeAsDataWithError:&v141];
        objc_storeStrong(v91 + 5, v141);
        BOOL v57 = v92 != 0;
        if (v92)
        {
          [(id)v179[5] setPayloadPlist:v92];
        }
        else
        {
          uint64_t v93 = +[STLog persistence];
          if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]();
          }
        }
      }
      if (v57 && v26)
      {
        if (v167[5])
        {
          [(id)v161[5] setPayloadMode:v126];
          [(id)v161[5] setPayloadCategories:v47];
          [(id)v161[5] setPayloadCategoriesVersion2:v135];
        }
        else
        {
          long long v94 = [[STBlueprintConfiguration alloc] initWithContext:v49];
          uint64_t v95 = (void *)v167[5];
          v167[5] = (uint64_t)v94;

          [(id)v167[5] setBlueprint:v42];
          v96 = (void *)MEMORY[0x1E4F59F70];
          id v97 = v138;
          uint64_t v98 = [v97 localUserDeviceState];
          if (v98 && (int v99 = [v97 isManaged], v98, !v99))
          {
            id v105 = [NSString alloc];
            uint64_t v125 = objc_opt_new();
            uint64_t v101 = [v125 UUIDString];
            v104 = (void *)[v105 initWithFormat:@"%@_%@_%@", @"budget_configuration", @"personal", v101];
          }
          else
          {
            id v100 = [NSString alloc];
            uint64_t v125 = [v97 dsid];
            uint64_t v101 = [v125 stringValue];
            v102 = objc_opt_new();
            v103 = [v102 UUIDString];
            v104 = (void *)[v100 initWithFormat:@"%@_%@_%@_%@", @"budget_configuration", @"family", v101, v103];
          }
          uint64_t v106 = [v96 buildWithIdentifier:v104 withMode:v126 withCategories:v47 withCategoriesVersion2:v135];
          uint64_t v107 = (void *)v161[5];
          v161[5] = v106;
        }
        v108 = [(id)v161[5] declarationIdentifier];
        [(id)v167[5] setIdentifier:v108];

        id v109 = [(id)v161[5] declarationType];
        [(id)v167[5] setType:v109];

        [(id)v161[5] updateServerHash];
        uint64_t v110 = (void *)v161[5];
        uint64_t v111 = v200;
        id v140 = v200[5];
        id v112 = [v110 serializeAsDataWithError:&v140];
        objc_storeStrong(v111 + 5, v140);
        if (!v112)
        {
          int v116 = +[STLog persistence];
          if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT)) {
            +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]();
          }
LABEL_96:

LABEL_97:
          BOOL v36 = 0;
          goto LABEL_98;
        }
        [(id)v167[5] setPayloadPlist:v112];
      }
      else if (!v57)
      {
        goto LABEL_97;
      }
      v113 = +[STAdminPersistenceController sharedController];
      BOOL v114 = v200;
      id v139 = v200[5];
      char v115 = [v113 saveContext:v49 error:&v139];
      objc_storeStrong(v114 + 5, v139);

      if (v115)
      {
        BOOL v36 = 1;
LABEL_98:

        uint64_t v53 = v130;
LABEL_99:

        _Block_object_dispose(&v156, 8);
        _Block_object_dispose(&v160, 8);

        _Block_object_dispose(&v166, 8);
        _Block_object_dispose(&v172, 8);

        _Block_object_dispose(&v178, 8);
        _Block_object_dispose(&v184, 8);

        _Block_object_dispose(&v190, 8);
LABEL_100:

        goto LABEL_101;
      }
      int v116 = +[STLog persistence];
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]();
      }
      goto LABEL_96;
    }
LABEL_50:
    BOOL v57 = 1;
    goto LABEL_62;
  }
  uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:21 userInfo:0];
  id v34 = v200[5];
  v200[5] = (id)v33;

  id v35 = +[STLog persistence];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
    +[STBlueprint(ManagedUser) createManagedUserBlueprintForUser:error:]();
  }

  v132 = 0;
  BOOL v36 = 0;
LABEL_101:
  if (a12) {
    *a12 = v200[5];
  }

  _Block_object_dispose(&v199, 8);
  return v36;
}

uint64_t __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  double v7 = v6;
  uint64_t v8 = [v5 unsignedIntegerValue];

  return [v4 setBudgetLimit:v8 forDay:v7];
}

void __175__STBlueprint_UsageLimit__saveUsageLimitWithIdentifier_user_bundleIdentifiers_webDomains_categoryIdentifiers_dailyBudgetLimit_budgetLimitByWeekday_enabled_behaviorType_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [v7 payloadPlist];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F59F38];
    uint64_t v10 = [v7 payloadPlist];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    obuint64_t j = *(id *)(v11 + 40);
    uint64_t v12 = [v9 declarationForData:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if (!v12)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_26;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (*(unsigned char *)(a1 + 104))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
          uint64_t v13 = *(void *)(a1 + 64);
LABEL_17:
          objc_storeStrong((id *)(*(void *)(v13 + 8) + 40), v12);
          goto LABEL_26;
        }
        BOOL v14 = +[STLog screentime];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (*(unsigned char *)(a1 + 105))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
          uint64_t v13 = *(void *)(a1 + 80);
          goto LABEL_17;
        }
        BOOL v14 = +[STLog screentime];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (*(unsigned char *)(a1 + 106))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
          uint64_t v13 = *(void *)(a1 + 96);
          goto LABEL_17;
        }
        BOOL v14 = +[STLog screentime];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_24:
          *(_DWORD *)buf = 136446466;
          id v17 = "+[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentif"
                "iers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:]_block_invoke";
          __int16 v18 = 2112;
          id v19 = v7;
          _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting configuration (%@)", buf, 0x16u);
        }
LABEL_25:

        [*(id *)(a1 + 32) deleteObject:v7];
      }
    }
  }
  else
  {
    uint64_t v12 = +[STLog persistence];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[STBlueprint _buildConfigurationsByDeclarationIdentifierFromBlueprint:error:]();
    }
  }
LABEL_26:
}

+ (BOOL)deleteUsageLimitWithIdentifier:(id)a3 user:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v10 managingOrganization];
  uint64_t v13 = [v10 dsid];

  BOOL v14 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v13 ofType:@"usage-limit" withIdentifier:v11 fromOrganization:v12];

  [v14 setReturnsObjectsAsFaults:0];
  id v25 = 0;
  char v15 = [v14 execute:&v25];
  id v16 = v25;
  if (v15)
  {
    if ((unint64_t)[v15 count] >= 2)
    {
      id v17 = +[STLog persistence];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        +[STBlueprint(UsageLimit) saveUsageLimitWithIdentifier:user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:].cold.7();
      }
    }
    if ([v15 count])
    {
      __int16 v18 = [v15 objectAtIndexedSubscript:0];
      [v18 tombstone];
      id v19 = +[STAdminPersistenceController sharedController];
      uint64_t v24 = v16;
      char v20 = [v19 saveContext:v9 error:&v24];
      id v21 = v24;

      if ((v20 & 1) == 0)
      {
        id v22 = +[STLog persistence];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[STBlueprint(UsageLimit) deleteUsageLimitWithIdentifier:user:managedObjectContext:error:]();
        }
      }
    }
    else
    {
      id v21 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:14 userInfo:0];
      char v20 = 0;
      __int16 v18 = v16;
    }
  }
  else
  {
    __int16 v18 = +[STLog persistence];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[STBlueprint(UsageLimit) deleteUsageLimitWithIdentifier:user:managedObjectContext:error:]();
    }
    char v20 = 0;
    id v21 = v16;
  }

  if (a6) {
    *a6 = v21;
  }

  return v20;
}

+ (id)keyPathsForValuesAffectingLimitDisplayName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"usageLimit.categoryIdentifiers", @"usageLimit.categoryIdentifiersVersion2", @"usageLimit.applicationIdentifiers", @"usageLimit.websiteIdentifiers", @"usageLimit.usageItemType", @"usageLimit.itemIdentifiers", 0);
}

- (NSString)limitDisplayName
{
  uint64_t v2 = [(STBlueprint *)self usageLimit];
  id v3 = [v2 categoryIdentifiersVersion2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 categoryIdentifiers];
  }
  double v6 = v5;

  id v7 = [v2 applicationIdentifiers];
  uint64_t v8 = [v2 websiteIdentifiers];
  if (![v6 count] && !objc_msgSend(v7, "count") && !objc_msgSend(v8, "count"))
  {
    id v9 = [v2 usageItemType];
    if ([v9 isEqualToString:@"category"])
    {
      uint64_t v10 = [v2 itemIdentifiers];
      id v11 = v6;
      double v6 = (void *)v10;
    }
    else if ([v9 isEqualToString:@"app"])
    {
      uint64_t v12 = [v2 itemIdentifiers];
      id v11 = v7;
      id v7 = (void *)v12;
    }
    else
    {
      if (![v9 isEqualToString:@"webdomain"])
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v13 = [v2 itemIdentifiers];
      id v11 = v8;
      uint64_t v8 = (void *)v13;
    }

    goto LABEL_14;
  }
LABEL_15:
  BOOL v14 = +[STBlueprint displayNameForUsageLimitWithCategoryIdentifiers:v6 bundleIdentifiers:v7 webDomains:v8];

  return (NSString *)v14;
}

+ (id)displayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v42 = a4;
  id v41 = a5;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__1;
  id v55 = __Block_byref_object_dispose__1;
  id v56 = 0;
  uint64_t v50 = 2;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v9 = [a1 _getDisplayNameAndAddCategories:v7 toItemNames:v8 remainingItems:&v50];
  uint64_t v10 = (void *)v52[5];
  v52[5] = v9;

  if (!v52[5])
  {
    uint64_t v11 = [v7 count];
    uint64_t v12 = [v42 count];
    uint64_t v13 = [v41 count];
    if (v50)
    {
      uint64_t v39 = v12 + v11 + v13;
      BOOL v14 = +[STAppInfoCache sharedCache];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = v42;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v63 count:16];
      if (v16)
      {
        uint64_t v18 = *(void *)v46;
        *(void *)&long long v17 = 138543874;
        long long v38 = v17;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v15);
            }
            char v20 = objc_msgSend(v14, "appInfoForBundleIdentifier:", *(void *)(*((void *)&v45 + 1) + 8 * v19), v38);
            id v21 = v20;
            if (!v20)
            {
              id v25 = +[STLog appInfo];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                long long v32 = [0 description];
                *(_DWORD *)buf = v38;
                long long v58 = v32;
                __int16 v59 = 2080;
                id v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                __int16 v61 = 1024;
                int v62 = 421;
                _os_log_error_impl(&dword_1DA519000, v25, OS_LOG_TYPE_ERROR, "Nil appInfo: %{public}@ in function: %s:%d", buf, 0x1Cu);
              }
              goto LABEL_13;
            }
            id v22 = [v20 displayName];
            BOOL v23 = [v22 length] == 0;

            if (v23)
            {
              id v28 = [v21 bundleIdentifier];
              BOOL v29 = [v28 length] == 0;

              if (v29)
              {
                id v25 = +[STLog appInfo];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  id v34 = [v21 description];
                  *(_DWORD *)buf = v38;
                  long long v58 = v34;
                  __int16 v59 = 2080;
                  id v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                  __int16 v61 = 1024;
                  int v62 = 429;
                  _os_log_error_impl(&dword_1DA519000, v25, OS_LOG_TYPE_ERROR, "Display name and bundleId missing for appInfo: %{public}@ in function: %s:%d", buf, 0x1Cu);
                }
LABEL_13:

                uint64_t v26 = +[STScreenTimeCoreBundle bundle];
                BOOL v27 = [v26 localizedStringForKey:@"DisplayNameUnknown" value:&stru_1F3487700 table:0];

                goto LABEL_19;
              }
              uint64_t v30 = +[STLog appInfo];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                uint64_t v33 = [v21 description];
                *(_DWORD *)buf = v38;
                long long v58 = v33;
                __int16 v59 = 2080;
                id v60 = "+[STBlueprint(UsageLimit) displayNameForUsageLimitWithCategoryIdentifiers:bundleIdentifiers:webDomains:]";
                __int16 v61 = 1024;
                int v62 = 426;
                _os_log_error_impl(&dword_1DA519000, v30, OS_LOG_TYPE_ERROR, "Display name missing for appInfo: %{public}@ in function: %s:%d. using bundleId instead", buf, 0x1Cu);
              }
              uint64_t v24 = [v21 bundleIdentifier];
            }
            else
            {
              uint64_t v24 = [v21 displayName];
            }
            BOOL v27 = (void *)v24;
LABEL_19:
            [v8 addObject:v27];
            BOOL v31 = --v50 == 0;

            if (v31) {
              goto LABEL_26;
            }
            ++v19;
          }
          while (v16 != v19);
          uint64_t v35 = [v15 countByEnumeratingWithState:&v45 objects:v63 count:16];
          uint64_t v16 = v35;
        }
        while (v35);
      }
LABEL_26:

      if (v50)
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_2;
        v43[3] = &unk_1E6BC7358;
        v43[4] = &v51;
        [a1 _addWebDomains:v41 toItemNames:v8 remainingItems:v50 totalCount:v39 completionHandler:v43];
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_62;
        v44[3] = &unk_1E6BC7358;
        v44[4] = &v51;
        [a1 _createDisplayNameWithItemNames:v8 itemCount:v39 completionHandler:v44];
      }
    }
    else
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke;
      v49[3] = &unk_1E6BC7358;
      v49[4] = &v51;
      [a1 _createDisplayNameWithItemNames:v8 itemCount:v12 + v11 + v13 completionHandler:v49];
    }
  }
  id v36 = (id)v52[5];

  _Block_object_dispose(&v51, 8);
  return v36;
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke(uint64_t a1, void *a2)
{
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_62(uint64_t a1, void *a2)
{
}

void __104__STBlueprint_UsageLimit__displayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)fetchDisplayNameForUsageLimitWithCategoryIdentifiers:(id)a3 bundleIdentifiers:(id)a4 webDomains:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 2;
  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v15 = (void *)[v14 initWithCapacity:v37[3]];
  uint64_t v16 = [a1 _getDisplayNameAndAddCategories:v10 toItemNames:v15 remainingItems:v37 + 3];
  if (v16)
  {
    v13[2](v13, v16);
  }
  else
  {
    uint64_t v17 = [v11 count];
    uint64_t v18 = [v10 count];
    uint64_t v19 = [v12 count];
    if (v37[3])
    {
      if (v17)
      {
        uint64_t v27 = v18 + v17 + v19;
        if ((unint64_t)[v11 count] >= 2 && v37[3] == 2)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          id v21 = [v11 objectAtIndexedSubscript:0];
          id v22 = [v11 objectAtIndexedSubscript:1];
          BOOL v23 = objc_msgSend(v20, "initWithObjects:", v21, v22, 0);
        }
        else
        {
          id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          id v21 = [v11 objectAtIndexedSubscript:0];
          BOOL v23 = objc_msgSend(v24, "initWithObjects:", v21, 0);
        }

        id v25 = +[STAppInfoCache sharedCache];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __127__STBlueprint_UsageLimit__fetchDisplayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains_completionHandler___block_invoke;
        v28[3] = &unk_1E6BC7380;
        id v26 = v23;
        id v29 = v26;
        id v30 = v15;
        uint64_t v33 = &v36;
        id v34 = a1;
        uint64_t v35 = v27;
        long long v32 = v13;
        id v31 = v12;
        [v25 fetchAppInfoForBundleIdentifiers:v26 completionHandler:v28];
      }
      else
      {
        objc_msgSend(a1, "_addWebDomains:toItemNames:remainingItems:totalCount:completionHandler:", v12, v15);
      }
    }
    else
    {
      [a1 _createDisplayNameWithItemNames:v15 itemCount:v18 + v17 + v19 completionHandler:v13];
    }
  }

  _Block_object_dispose(&v36, 8);
}

void __127__STBlueprint_UsageLimit__fetchDisplayNameForUsageLimitWithCategoryIdentifiers_bundleIdentifiers_webDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, (void)v15);
        id v11 = [v10 displayName];

        if (v11) {
          id v12 = v11;
        }
        else {
          id v12 = v9;
        }
        [*(id *)(a1 + 40) addObject:v12];
        --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v13 = *(void **)(a1 + 72);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v14) {
    [v13 _addWebDomains:*(void *)(a1 + 48) toItemNames:*(void *)(a1 + 40) remainingItems:v14 totalCount:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 56)];
  }
  else {
    [v13 _createDisplayNameWithItemNames:*(void *)(a1 + 40) itemCount:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 56)];
  }
}

+ (id)_getDisplayNameAndAddCategories:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v11 = STAvailableCategoriesExcludingSystemCategories();
  id v12 = (void *)[v10 initWithArray:v11];

  if ([v9 isEqualToSet:v12])
  {
    uint64_t v13 = +[STScreenTimeCoreBundle bundle];
    uint64_t v14 = [v13 localizedStringForKey:@"AllAppsAndCategoriesDisplayName" value:&stru_1F3487700 table:0];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
LABEL_5:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = STCategoryNameWithIdentifier(*(void *)(*((void *)&v23 + 1) + 8 * v19));
        objc_msgSend(v8, "addObject:", v20, (void)v23);

        if ((*a5)-- == 1) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    uint64_t v14 = 0;
  }

  return v14;
}

+ (void)_addWebDomains:(id)a3 toItemNames:(id)a4 remainingItems:(unint64_t)a5 totalCount:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "_lp_userVisibleHost");
      [v12 addObject:v19];

      if (a5 - 1 == v18) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        a5 -= v18;
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [a1 _createDisplayNameWithItemNames:v12 itemCount:a6 completionHandler:v13];
}

+ (void)_createDisplayNameWithItemNames:(id)a3 itemCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v16 = a3;
  id v7 = a5;
  id v8 = (void (**)(void, void))v7;
  if (a4)
  {
    uint64_t v9 = [v16 objectAtIndexedSubscript:0];
    if (a4 == 1)
    {
      ((void (**)(void, void *))v8)[2](v8, v9);
    }
    else
    {
      id v10 = [v16 objectAtIndexedSubscript:1];
      id v11 = +[STScreenTimeCoreBundle bundle];
      id v12 = [v11 localizedStringForKey:@"BudgetPredicateTitleText" value:&stru_1F3487700 table:0];

      id v13 = [NSString alloc];
      id v14 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v15 = objc_msgSend(v13, "initWithFormat:locale:", v12, v14, a4 - 2, v9, v10);
      ((void (**)(void, void *))v8)[2](v8, v15);
    }
  }
  else
  {
    (*((void (**)(id, __CFString *))v7 + 2))(v7, &stru_1F3487700);
  }
}

+ (id)keyPathsForValuesAffectingLimitScheduleText
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"usageLimit.budgetLimitScheduleRepresentation"];
}

- (NSString)limitScheduleText
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  [v3 setFormattingContext:1];
  [v3 setUnitsStyle:5];
  id v4 = [(STBlueprint *)self usageLimit];
  uint64_t v5 = [v4 budgetLimitScheduleRepresentation];

  uint64_t v6 = [v5 simpleSchedule];
  id v7 = v6;
  if (v6)
  {
    [v6 budgetLimit];
    id v8 = objc_msgSend(v3, "stringFromTimeInterval:");
    uint64_t v9 = +[STScreenTimeCoreBundle bundle];
    id v10 = [v9 localizedStringForKey:@"TimeEveryDayFormat" value:&stru_1F3487700 table:0];

    id v11 = [NSString alloc];
    id v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v13 = objc_msgSend(v11, "initWithFormat:locale:", v10, v12, v8);
  }
  else
  {
    id v29 = v5;
    id v14 = [v5 customScheduleItems];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v22 = NSNumber;
          [v21 budgetLimit];
          long long v23 = objc_msgSend(v22, "numberWithDouble:");
          long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "day"));
          [v15 setObject:v23 forKeyedSubscript:v24];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v18);
    }

    long long v25 = objc_opt_class();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke;
    v33[3] = &unk_1E6BC72A8;
    id v34 = v15;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke_2;
    v30[3] = &unk_1E6BC72D0;
    id v26 = v34;
    id v31 = v26;
    id v32 = v3;
    id v13 = [v25 scheduleTextWithLocale:0 weekdayScheduleComparator:v33 scheduleTimeGetter:v30];
    if (!v13)
    {
      uint64_t v27 = +[STScreenTimeCoreBundle bundle];
      id v13 = [v27 localizedStringForKey:@"ScheduleOff" value:&stru_1F3487700 table:0];
    }
    id v7 = 0;
    uint64_t v5 = v29;
  }

  return (NSString *)v13;
}

uint64_t __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a2];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [v8 objectForKeyedSubscript:v9];

    uint64_t v11 = [v10 isEqualToNumber:v7];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id __44__STBlueprint_UsageLimit__limitScheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    [v5 doubleValue];
    id v7 = objc_msgSend(v6, "stringFromTimeInterval:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)declarationsWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Unable to build predicate for blueprint: %{public}@", v4, v5, v6, v7, v8);
}

- (void)declarationsWithError:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA519000, v0, v1, "Unknown blueprint type: %{public}@", v2);
}

+ (void)_predicateForDowntimeBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'downtime': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_predicateForUsageLimitBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'usage limit': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_predicateForUsageLimitOverrideBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'usage limit override': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_predicateForAlwaysAllowedAppsBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'always allowed apps': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_predicateForRestrictionsBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'restrictions': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_predicateForManagedUserBlueprint:(void *)a1 withDateFormatter:calendar:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1DA519000, v2, v3, "Blueprint is not of type 'managed user': %{public}@", v4, v5, v6, v7, v8);
}

+ (void)_buildConfigurationsByDeclarationIdentifierFromBlueprint:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "blueprint is missing a config: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_buildConfigurationsByDeclarationIdentifierFromBlueprint:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1DA519000, v1, OS_LOG_TYPE_FAULT, "failed to deserialize config: %{public}@: %{public}@", v2, 0x16u);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "No blueprint configuration. Defaulting to no grace period.", v1, 2u);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(os_log_t)log configuration:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "No blueprint configuration declaration data. Defaulting to no grace period.", v1, 2u);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:(uint64_t)a1 configuration:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = 0;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Failed to deserialize declaration: %{public}@: %{public}@. Defaulting to no grace period.", (uint8_t *)&v2, 0x16u);
}

+ (void)shouldUseGracePeriodForDowntimeOverride:configuration:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
}

- (void)updateWithDictionaryRepresentation:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA519000, v0, v1, "Failed to fetch users: %{public}@", v2);
}

- (void)updateWithDictionaryRepresentation:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA519000, v0, v1, "unknown organization class name: %{public}@", v2);
}

- (void)updateWithDictionaryRepresentation:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Unable to fetch organizations: %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "There were no organizations for %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Multiple organizations of type: %{public}@ found in database", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DA519000, v0, v1, "R: %@", v2, v3, v4, v5, v6);
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = [a1 dictionaryRepresentation];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1DA519000, v2, v3, "L: %@", v4, v5, v6, v7, v8);
}

+ (void)fetchOrCreateWithDictionaryRepresentation:inContext:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA519000, v0, v1, "Could not query for orphaned blueprint configurations: %{public}@", v2);
}

- (void)validateForUpdate:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for update on Blueprint failed for type: %{public}@, blueprint:%@", v4, v5, v6, v7, 2u);
}

- (void)validateForUpdate:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136446466;
  uint64_t v4 = "-[STBlueprint validateForUpdate:]";
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "%{public}s Built-in CoreData Validation for update on Blueprint failed with: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)validateForInsert:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for update on Blueprint failed for type: %{public}@, blueprint:%@", v4, v5, v6, v7, 2u);
}

- (void)validateForDelete:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 type];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for update on Blueprint failed for type: %{public}@, blueprint:%@", v4, v5, v6, v7, 2u);
}

@end
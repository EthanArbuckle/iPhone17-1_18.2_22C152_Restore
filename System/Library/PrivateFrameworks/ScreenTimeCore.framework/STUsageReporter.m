@interface STUsageReporter
+ (id)keyPathsForValuesAffectingNotifications;
- (BOOL)generateReport:(id *)a3;
- (BOOL)includeTotalUsageDetailItem;
- (NSArray)applicationAndWebUsage;
- (NSArray)categoryUsage;
- (NSArray)notifications;
- (NSArray)pickups;
- (NSDate)firstPickup;
- (NSDateInterval)dateInterval;
- (NSFetchedResultsController)fetchedResultsController;
- (NSFetchedResultsController)installedAppsController;
- (NSNumber)userDSID;
- (NSSet)installedBundleIdentifiers;
- (STUsageReporter)initWithUsage:(id)a3 dateInterval:(id)a4;
- (double)totalScreenTime;
- (id)_categoryUsageWithoutAllUsageItem;
- (id)_firstPickupFromUsageBlocks:(id)a3;
- (id)_ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4 useTotalScreenTime:(BOOL)a5;
- (id)categoryRatiosPerCalendarUnit:(unint64_t)a3 numberOfCategories:(unint64_t)a4;
- (id)firstPickupOfIntervalWithMostPickups:(unint64_t *)a3 perCalendarUnit:(unint64_t)a4;
- (id)notificationRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4;
- (id)notificationsPerCalendarUnit:(unint64_t)a3;
- (id)pickupRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4;
- (id)pickupsPerCalendarUnit:(unint64_t)a3;
- (id)ratiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4;
- (id)ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4;
- (id)ratiosForWebDomain:(id)a3 perCalendarUnit:(unint64_t)a4;
- (id)screenTimeUsagePerCalendarUnit:(unint64_t)a3;
- (int64_t)totalNotifications;
- (int64_t)totalPickups;
- (void)_enumerateUsageBlocksWithUnitGranularity:(unint64_t)a3 block:(id)a4;
- (void)_updateInstalledBundleIdentifiers;
- (void)controllerDidChangeContent:(id)a3;
- (void)installedAppsController;
- (void)setIncludeTotalUsageDetailItem:(BOOL)a3;
- (void)setInstalledAppsController:(id)a3;
- (void)setInstalledBundleIdentifiers:(id)a3;
@end

@implementation STUsageReporter

- (STUsageReporter)initWithUsage:(id)a3 dateInterval:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)STUsageReporter;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STUsageReporter *)&v22 init];
  uint64_t v8 = objc_msgSend(v5, "copy", v22.receiver, v22.super_class);
  dateInterval = v7->_dateInterval;
  v7->_dateInterval = (NSDateInterval *)v8;

  v10 = [v6 user];
  v11 = [v10 dsid];
  uint64_t v12 = [v11 copy];
  userDSID = v7->_userDSID;
  v7->_userDSID = (NSNumber *)v12;

  v14 = +[STUsageBlock fetchRequestMatchingUsage:v6 dateInterval:v5];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
  v23[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v14 setSortDescriptors:v16];

  [v14 setShouldRefreshRefetchedObjects:1];
  id v17 = objc_alloc(MEMORY[0x1E4F1C0F0]);
  v18 = [v6 managedObjectContext];

  uint64_t v19 = [v17 initWithFetchRequest:v14 managedObjectContext:v18 sectionNameKeyPath:0 cacheName:0];
  fetchedResultsController = v7->_fetchedResultsController;
  v7->_fetchedResultsController = (NSFetchedResultsController *)v19;

  [(NSFetchedResultsController *)v7->_fetchedResultsController setDelegate:v7];
  return v7;
}

- (BOOL)generateReport:(id *)a3
{
  v4 = [(STUsageReporter *)self fetchedResultsController];
  LOBYTE(a3) = [v4 performFetch:a3];

  return (char)a3;
}

- (NSFetchedResultsController)installedAppsController
{
  v22[1] = *MEMORY[0x1E4F143B8];
  installedAppsController = self->_installedAppsController;
  if (!installedAppsController)
  {
    v4 = +[STInstalledApp fetchRequest];
    [v4 setReturnsDistinctResults:1];
    v22[0] = @"bundleIdentifier";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v4 setPropertiesToFetch:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"bundleIdentifier" ascending:1];
    v21 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v4 setSortDescriptors:v7];

    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    v9 = [(STUsageReporter *)self userDSID];
    v10 = [v8 predicateWithFormat:@"%K == %@", @"userDeviceState.user.dsid", v9];
    [v4 setPredicate:v10];

    [v4 setShouldRefreshRefetchedObjects:1];
    id v11 = objc_alloc(MEMORY[0x1E4F1C0F0]);
    uint64_t v12 = [(STUsageReporter *)self fetchedResultsController];
    v13 = [(id)v12 managedObjectContext];
    v14 = (NSFetchedResultsController *)[v11 initWithFetchRequest:v4 managedObjectContext:v13 sectionNameKeyPath:0 cacheName:0];
    v15 = self->_installedAppsController;
    self->_installedAppsController = v14;

    [(NSFetchedResultsController *)self->_installedAppsController setDelegate:self];
    v16 = self->_installedAppsController;
    id v20 = 0;
    LOBYTE(v12) = [(NSFetchedResultsController *)v16 performFetch:&v20];
    id v17 = v20;
    if ((v12 & 1) == 0)
    {
      v18 = +[STLog usage];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        [(STUsageReporter *)(uint64_t)v17 installedAppsController];
      }
    }
    installedAppsController = self->_installedAppsController;
  }
  return installedAppsController;
}

- (double)totalScreenTime
{
  v2 = [(STUsageReporter *)self fetchedResultsController];
  v3 = [v2 fetchedObjects];
  +[STUsageBlock totalScreenTimeForUsageBlocks:v3];
  double v5 = v4;

  return v5;
}

- (int64_t)totalPickups
{
  v2 = [(STUsageReporter *)self fetchedResultsController];
  v3 = [v2 fetchedObjects];
  int64_t v4 = +[STUsageBlock totalPickupsForUsageBlocks:v3];

  return v4;
}

- (int64_t)totalNotifications
{
  v2 = [(STUsageReporter *)self fetchedResultsController];
  v3 = [v2 fetchedObjects];
  int64_t v4 = +[STUsageBlock totalNotificationsForUsageBlocks:v3];

  return v4;
}

- (NSArray)categoryUsage
{
  v3 = [(STUsageReporter *)self _categoryUsageWithoutAllUsageItem];
  int64_t v4 = (void *)[v3 mutableCopy];

  if ([(STUsageReporter *)self includeTotalUsageDetailItem])
  {
    double v5 = [[STUsageDetailItem alloc] initWithType:3 identifier:@"__AllCategories__"];
    [(STUsageReporter *)self totalScreenTime];
    *(float *)&double v6 = v6;
    [(STUsageDetailItem *)v5 setQuantity:v6];
    [v4 insertObject:v5 atIndex:0];
  }
  return (NSArray *)v4;
}

- (id)_categoryUsageWithoutAllUsageItem
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [(STUsageReporter *)self fetchedResultsController];
  v3 = [v2 fetchedObjects];
  int64_t v4 = +[STUsageBlock usageCategoriesForUsageBlocks:v3];

  double v5 = +[STUsageCategory categoryItemsExcludingSystemCategories:v4];
  double v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"quantity" ascending:0];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (NSArray)applicationAndWebUsage
{
  v3 = [(STUsageReporter *)self fetchedResultsController];
  int64_t v4 = [v3 fetchedObjects];
  double v5 = +[STUsageBlock usageCategoriesForUsageBlocks:v4];

  double v6 = +[STUsageCategory applicationAndWebItemsExcludingSystemHiddenApplications:v5];
  v7 = (void *)[v6 mutableCopy];

  if ([(STUsageReporter *)self includeTotalUsageDetailItem])
  {
    uint64_t v8 = [[STUsageDetailItem alloc] initWithType:3 identifier:@"__AllApps__"];
    [(STUsageReporter *)self totalScreenTime];
    *(float *)&double v9 = v9;
    [(STUsageDetailItem *)v8 setQuantity:v9];
    [v7 insertObject:v8 atIndex:0];
  }
  return (NSArray *)v7;
}

+ (id)keyPathsForValuesAffectingNotifications
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"installedBundleIdentifiers"];
}

- (NSArray)notifications
{
  v3 = [(STUsageReporter *)self fetchedResultsController];
  int64_t v4 = [v3 fetchedObjects];
  double v5 = +[STUsageBlock usageCountedItemsForUsageBlocks:v4];

  double v6 = +[STUsageCountedItem notificationItemsExcludingSystemHiddenApplications:v5];
  v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(STUsageReporter *)self installedBundleIdentifiers];
  double v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __32__STUsageReporter_notifications__block_invoke;
    v14[3] = &unk_1E6BC8078;
    id v15 = v8;
    v10 = [v7 indexesOfObjectsPassingTest:v14];
    [v7 removeObjectsAtIndexes:v10];
  }
  else
  {
    [(STUsageReporter *)self _updateInstalledBundleIdentifiers];
  }
  if ([(STUsageReporter *)self includeTotalUsageDetailItem])
  {
    id v11 = [[STUsageDetailItem alloc] initWithType:3 identifier:@"__AllApps__"];
    *(float *)&double v12 = (float)[(STUsageReporter *)self totalNotifications];
    [(STUsageDetailItem *)v11 setQuantity:v12];
    [v7 insertObject:v11 atIndex:0];
  }
  return (NSArray *)v7;
}

uint64_t __32__STUsageReporter_notifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (NSArray)pickups
{
  v3 = [(STUsageReporter *)self fetchedResultsController];
  uint64_t v4 = [v3 fetchedObjects];
  double v5 = +[STUsageBlock usageCountedItemsForUsageBlocks:v4];

  double v6 = +[STUsageCountedItem pickupItemsExcludingSystemHiddenApplications:v5];
  v7 = (void *)[v6 mutableCopy];

  if ([(STUsageReporter *)self includeTotalUsageDetailItem])
  {
    uint64_t v8 = [[STUsageDetailItem alloc] initWithType:3 identifier:@"__AllApps__"];
    *(float *)&double v9 = (float)[(STUsageReporter *)self totalPickups];
    [(STUsageDetailItem *)v8 setQuantity:v9];
    [v7 insertObject:v8 atIndex:0];
  }
  return (NSArray *)v7;
}

- (id)screenTimeUsagePerCalendarUnit:(unint64_t)a3
{
  double v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__STUsageReporter_screenTimeUsagePerCalendarUnit___block_invoke;
  v8[3] = &unk_1E6BC80A0;
  id v6 = v5;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a3 block:v8];

  return v6;
}

void __50__STUsageReporter_screenTimeUsagePerCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v5 = [[STUsageDetailItem alloc] initWithType:1 identifier:@"__AllApps__"];
  uint64_t v4 = [v3 valueForKeyPath:@"@sum.screenTimeInSeconds"];

  [v4 floatValue];
  -[STUsageDetailItem setQuantity:](v5, "setQuantity:");

  [*(id *)(a1 + 32) addObject:v5];
}

- (id)categoryRatiosPerCalendarUnit:(unint64_t)a3 numberOfCategories:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [(STUsageReporter *)self _categoryUsageWithoutAllUsageItem];
  if ((unint64_t)[v7 count] >= 4)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, a4);

    v7 = (void *)v8;
  }
  id v9 = objc_opt_new();
  v10 = [v7 valueForKeyPath:@"identifier"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(STUsageReporter *)self _ratiosForCategory:*(void *)(*((void *)&v17 + 1) + 8 * i) perCalendarUnit:a3 useTotalScreenTime:0];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4
{
  return [(STUsageReporter *)self _ratiosForCategory:a3 perCalendarUnit:a4 useTotalScreenTime:1];
}

- (id)_ratiosForCategory:(id)a3 perCalendarUnit:(unint64_t)a4 useTotalScreenTime:(BOOL)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__STUsageReporter__ratiosForCategory_perCalendarUnit_useTotalScreenTime___block_invoke;
  v15[3] = &unk_1E6BC80C8;
  BOOL v18 = a5;
  id v16 = v8;
  id v10 = v9;
  id v17 = v10;
  id v11 = v8;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v15];
  uint64_t v12 = v17;
  id v13 = v10;

  return v13;
}

void __73__STUsageReporter__ratiosForCategory_perCalendarUnit_useTotalScreenTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  float v4 = 0.0;
  float v5 = 0.0;
  if (*(unsigned char *)(a1 + 48))
  {
    +[STUsageBlock totalScreenTimeForUsageBlocks:v3];
    float v5 = v6;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:", v3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        float v13 = (float)[v12 totalTimeInSeconds];
        v14 = [v12 identifier];
        int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

        if (v15) {
          float v16 = v13;
        }
        else {
          float v16 = -0.0;
        }
        float v4 = v4 + v16;
        if (*(unsigned char *)(a1 + 48)) {
          float v17 = -0.0;
        }
        else {
          float v17 = v13;
        }
        float v5 = v5 + v17;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  BOOL v18 = [[STUsageDetailItem alloc] initWithType:3 identifier:*(void *)(a1 + 32)];
  long long v20 = v18;
  if (v5 != 0.0)
  {
    if ((float)(v4 / v5) <= 1.0) {
      float v5 = v4 / v5;
    }
    else {
      float v5 = 1.0;
    }
  }
  *(float *)&double v19 = v5;
  [(STUsageDetailItem *)v18 setQuantity:v19];
  [*(id *)(a1 + 40) addObject:v20];
}

- (id)ratiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__STUsageReporter_ratiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E6BC80F0;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v13];
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __56__STUsageReporter_ratiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = a2;
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v25 = *(void *)v31;
    float v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = [v7 timedItems];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              float v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              uint64_t v14 = [v13 totalTimeInSeconds];
              id v15 = [v13 bundleIdentifier];
              int v16 = [v15 isEqualToString:*(void *)(a1 + 32)];

              float v17 = (float)v14;
              if (!v16) {
                float v17 = -0.0;
              }
              float v5 = v5 + v17;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v4);
  }
  else
  {
    float v5 = 0.0;
  }

  +[STUsageBlock totalScreenTimeForUsageBlocks:v23];
  float v19 = v18;
  long long v20 = [[STUsageDetailItem alloc] initWithType:1 identifier:*(void *)(a1 + 32)];
  long long v22 = v20;
  if (v19 != 0.0)
  {
    if ((float)(v5 / v19) <= 1.0) {
      float v19 = v5 / v19;
    }
    else {
      float v19 = 1.0;
    }
  }
  *(float *)&double v21 = v19;
  [(STUsageDetailItem *)v20 setQuantity:v21];
  [*(id *)(a1 + 40) addObject:v22];
}

- (id)ratiosForWebDomain:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__STUsageReporter_ratiosForWebDomain_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E6BC80F0;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v13];
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __54__STUsageReporter_ratiosForWebDomain_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = a2;
  +[STUsageBlock usageCategoriesForUsageBlocks:](STUsageBlock, "usageCategoriesForUsageBlocks:");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v25 = *(void *)v31;
    float v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = [v7 timedItems];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              float v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              uint64_t v14 = [v13 totalTimeInSeconds];
              id v15 = [v13 domain];
              int v16 = [v15 isEqualToString:*(void *)(a1 + 32)];

              float v17 = (float)v14;
              if (!v16) {
                float v17 = -0.0;
              }
              float v5 = v5 + v17;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v4);
  }
  else
  {
    float v5 = 0.0;
  }

  +[STUsageBlock totalScreenTimeForUsageBlocks:v23];
  float v19 = v18;
  long long v20 = [[STUsageDetailItem alloc] initWithType:2 identifier:*(void *)(a1 + 32)];
  long long v22 = v20;
  if (v19 != 0.0)
  {
    if ((float)(v5 / v19) <= 1.0) {
      float v19 = v5 / v19;
    }
    else {
      float v19 = 1.0;
    }
  }
  *(float *)&double v21 = v19;
  [(STUsageDetailItem *)v20 setQuantity:v21];
  [*(id *)(a1 + 40) addObject:v22];
}

- (id)pickupsPerCalendarUnit:(unint64_t)a3
{
  float v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__STUsageReporter_pickupsPerCalendarUnit___block_invoke;
  v8[3] = &unk_1E6BC80A0;
  id v6 = v5;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a3 block:v8];

  return v6;
}

void __42__STUsageReporter_pickupsPerCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        float v7 = v7 + (float)[v9 numberOfPickupsWithoutApplicationUsage];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = objc_msgSend(v9, "countedItems", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              float v7 = v7 + (float)[*(id *)(*((void *)&v17 + 1) + 8 * j) numberOfPickups];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }
  id v15 = [[STUsageDetailItem alloc] initWithType:1 identifier:@"__AllApps__"];
  *(float *)&double v16 = v7;
  [(STUsageDetailItem *)v15 setQuantity:v16];
  [*(id *)(a1 + 32) addObject:v15];
}

- (id)pickupRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6 = a3;
  float v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__STUsageReporter_pickupRatiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E6BC80F0;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v13];
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __62__STUsageReporter_pickupRatiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v23 = *(void *)v29;
    float v5 = 0.0;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        float v5 = v5 + (float)[v8 numberOfPickupsWithoutApplicationUsage];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = [v8 countedItems];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              uint64_t v15 = [v14 numberOfPickups];
              double v16 = [v14 bundleIdentifier];
              int v17 = [v16 isEqualToString:*(void *)(a1 + 32)];

              if (v17) {
                float v18 = (float)v15;
              }
              else {
                float v18 = -0.0;
              }
              float v6 = v6 + v18;
              float v5 = v5 + (float)v15;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }
  else
  {
    float v5 = 0.0;
    float v6 = 0.0;
  }
  long long v19 = [[STUsageDetailItem alloc] initWithType:1 identifier:*(void *)(a1 + 32)];
  long long v20 = v19;
  *(float *)&double v21 = v6 / v5;
  if (v5 == 0.0) {
    *(float *)&double v21 = v5;
  }
  [(STUsageDetailItem *)v19 setQuantity:v21];
  [*(id *)(a1 + 40) addObject:v20];
}

- (NSDate)firstPickup
{
  uint64_t v3 = [(STUsageReporter *)self fetchedResultsController];
  uint64_t v4 = [v3 fetchedObjects];
  float v5 = [(STUsageReporter *)self _firstPickupFromUsageBlocks:v4];

  return (NSDate *)v5;
}

- (id)firstPickupOfIntervalWithMostPickups:(unint64_t *)a3 perCalendarUnit:(unint64_t)a4
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__18;
  uint64_t v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  *a3 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__STUsageReporter_firstPickupOfIntervalWithMostPickups_perCalendarUnit___block_invoke;
  v6[3] = &unk_1E6BC8118;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__STUsageReporter_firstPickupOfIntervalWithMostPickups_perCalendarUnit___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = +[STUsageBlock totalPickupsForUsageBlocks:](STUsageBlock, "totalPickupsForUsageBlocks:");
  id v4 = *(unint64_t **)(a1 + 48);
  if (v3 > *v4)
  {
    unint64_t *v4 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) _firstPickupFromUsageBlocks:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)_firstPickupFromUsageBlocks:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_21];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
    uint64_t v5 = [v6 firstPickupDate];
  }
  return v5;
}

BOOL __47__STUsageReporter__firstPickupFromUsageBlocks___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 firstPickupDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)notificationsPerCalendarUnit:(unint64_t)a3
{
  uint64_t v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__STUsageReporter_notificationsPerCalendarUnit___block_invoke;
  v8[3] = &unk_1E6BC80A0;
  id v6 = v5;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a3 block:v8];

  return v6;
}

void __48__STUsageReporter_notificationsPerCalendarUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", a2, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        float v7 = v7 + (float)[*(id *)(*((void *)&v11 + 1) + 8 * i) numberOfNotifications];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  id v9 = [[STUsageDetailItem alloc] initWithType:1 identifier:@"__AllApps__"];
  *(float *)&double v10 = v7;
  [(STUsageDetailItem *)v9 setQuantity:v10];
  [*(id *)(a1 + 32) addObject:v9];
}

- (id)notificationRatiosForApplication:(id)a3 perCalendarUnit:(unint64_t)a4
{
  id v6 = a3;
  float v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__STUsageReporter_notificationRatiosForApplication_perCalendarUnit___block_invoke;
  v13[3] = &unk_1E6BC80F0;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [(STUsageReporter *)self _enumerateUsageBlocksWithUnitGranularity:a4 block:v13];
  double v10 = v15;
  id v11 = v8;

  return v11;
}

void __68__STUsageReporter_notificationRatiosForApplication_perCalendarUnit___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v3 = +[STUsageBlock usageCountedItemsForUsageBlocks:](STUsageBlock, "usageCountedItemsForUsageBlocks:", a2, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    float v7 = 0.0;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        float v11 = (float)[v10 numberOfNotifications];
        long long v12 = [v10 bundleIdentifier];
        int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

        if (v13) {
          float v14 = v11;
        }
        else {
          float v14 = -0.0;
        }
        float v8 = v8 + v14;
        float v7 = v7 + v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
    float v8 = 0.0;
  }

  id v15 = [[STUsageDetailItem alloc] initWithType:1 identifier:*(void *)(a1 + 32)];
  uint64_t v16 = v15;
  *(float *)&double v17 = v8 / v7;
  if (v7 == 0.0) {
    *(float *)&double v17 = v7;
  }
  [(STUsageDetailItem *)v15 setQuantity:v17];
  [*(id *)(a1 + 40) addObject:v16];
}

- (void)_enumerateUsageBlocksWithUnitGranularity:(unint64_t)a3 block:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  float v7 = [(STUsageReporter *)self fetchedResultsController];
  float v8 = [v7 fetchedObjects];
  long long v26 = (void *)[v8 mutableCopy];

  long long v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = [(STUsageReporter *)self dateInterval];
  uint64_t v10 = [v9 endDate];
  long long v22 = v9;
  float v11 = [v9 startDate];
  long long v24 = (void *)v10;
  if ([v11 compare:v10] == -1)
  {
    uint64_t v23 = v6;
    do
    {
      long long v12 = v11;
      float v11 = [v25 dateByAddingUnit:a3 value:1 toDate:v11 options:512];
      int v13 = objc_opt_new();
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v14 = v26;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        while (2)
        {
          unint64_t v18 = a3;
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            long long v21 = [v20 startDate];
            if ([v12 compare:v21] == 1 || objc_msgSend(v21, "compare:", v11) != -1)
            {

              a3 = v18;
              uint64_t v6 = v23;
              goto LABEL_14;
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
          a3 = v18;
          uint64_t v6 = v23;
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      v6[2](v6, v13);
      [v14 removeObjectsInArray:v13];
    }
    while ([v11 compare:v24] == -1);
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v8 = a3;
  id v4 = [(STUsageReporter *)self fetchedResultsController];

  if (v4 == v8)
  {
    [(STUsageReporter *)self willChangeValueForKey:@"totalScreenTime"];
    [(STUsageReporter *)self willChangeValueForKey:@"totalNotifications"];
    [(STUsageReporter *)self willChangeValueForKey:@"totalPickups"];
    [(STUsageReporter *)self willChangeValueForKey:@"categoryUsage"];
    [(STUsageReporter *)self willChangeValueForKey:@"applicationAndWebUsage"];
    [(STUsageReporter *)self willChangeValueForKey:@"pickups"];
    [(STUsageReporter *)self willChangeValueForKey:@"notifications"];
    [(STUsageReporter *)self willChangeValueForKey:@"firstPickup"];
    [(STUsageReporter *)self didChangeValueForKey:@"totalScreenTime"];
    [(STUsageReporter *)self didChangeValueForKey:@"totalNotifications"];
    [(STUsageReporter *)self didChangeValueForKey:@"totalPickups"];
    [(STUsageReporter *)self didChangeValueForKey:@"categoryUsage"];
    [(STUsageReporter *)self didChangeValueForKey:@"applicationAndWebUsage"];
    [(STUsageReporter *)self didChangeValueForKey:@"pickups"];
    [(STUsageReporter *)self didChangeValueForKey:@"notifications"];
    [(STUsageReporter *)self didChangeValueForKey:@"firstPickup"];
    float v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"UsageReporterDidChangeContent" object:self];
  }
  else
  {
    id v5 = [(STUsageReporter *)self installedAppsController];

    uint64_t v6 = v8;
    if (v5 != v8) {
      goto LABEL_6;
    }
    [(STUsageReporter *)self _updateInstalledBundleIdentifiers];
  }
  uint64_t v6 = v8;
LABEL_6:
}

- (void)_updateInstalledBundleIdentifiers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(STUsageReporter *)self installedAppsController];
  id v5 = [v4 fetchedObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) bundleIdentifier];
        [v3 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  float v11 = [MEMORY[0x1E4F580A0] sharedCategories];
  long long v12 = [v3 array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke;
  v14[3] = &unk_1E6BC7628;
  id v15 = v3;
  uint64_t v16 = self;
  id v13 = v3;
  [v11 categoriesForBundleIDs:v12 completionHandler:v14];
}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_2;
    v14[3] = &unk_1E6BC8160;
    id v15 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
    uint64_t v7 = v15;
  }
  else
  {
    uint64_t v7 = +[STLog usage];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }

  uint64_t v8 = [*(id *)(a1 + 32) set];
  uint64_t v9 = [*(id *)(a1 + 40) installedBundleIdentifiers];
  char v10 = [v9 isEqualToSet:v8];

  if ((v10 & 1) == 0)
  {
    float v11 = [MEMORY[0x1E4F28F08] mainQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_69;
    v12[3] = &unk_1E6BC7D98;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v8;
    [v11 addOperationWithBlock:v12];
  }
}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a3 equivalentBundleIdentifiers];
  [v3 addObjectsFromArray:v4];
}

uint64_t __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstalledBundleIdentifiers:*(void *)(a1 + 40)];
}

- (BOOL)includeTotalUsageDetailItem
{
  return self->_includeTotalUsageDetailItem;
}

- (void)setIncludeTotalUsageDetailItem:(BOOL)a3
{
  self->_includeTotalUsageDetailItem = a3;
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)userDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSFetchedResultsController)fetchedResultsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstalledAppsController:(id)a3
{
}

- (NSSet)installedBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInstalledBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedAppsController, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)installedAppsController
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch installed apps: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __52__STUsageReporter__updateInstalledBundleIdentifiers__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch categories for installed apps: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
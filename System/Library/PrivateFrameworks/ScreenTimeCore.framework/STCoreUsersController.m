@interface STCoreUsersController
+ (id)keyPathsForValuesAffectingLocalUser;
+ (id)keyPathsForValuesAffectingSelectedUser;
+ (id)keyPathsForValuesAffectingUsers;
- (BOOL)_updateSelectedIndexForDSID:(id)a3 isManaged:(BOOL)a4;
- (BOOL)updateSelectedIndexForChildDSID:(id)a3;
- (BOOL)updateSelectedIndexForDSID:(id)a3;
- (NSArray)users;
- (NSFetchedResultsController)childUserController;
- (NSFetchedResultsController)localUserController;
- (NSFetchedResultsController)settingsController;
- (NSManagedObjectContext)managedObjectContext;
- (STCoreUser)localUser;
- (STCoreUser)selectedUser;
- (STCoreUsersController)initWithManagedObjectContext:(id)a3;
- (unint64_t)selectedIndex;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)localUser;
- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3 forUser:(id)a4;
- (void)refresh;
- (void)setChildUserController:(id)a3;
- (void)setLocalUserController:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedUser:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation STCoreUsersController

- (STCoreUsersController)initWithManagedObjectContext:(id)a3
{
  v4 = (NSManagedObjectContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCoreUsersController;
  v5 = [(STCoreUsersController *)&v8 init];
  managedObjectContext = v5->_managedObjectContext;
  v5->_managedObjectContext = v4;

  return v5;
}

+ (id)keyPathsForValuesAffectingLocalUser
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"localUserController"];
}

- (STCoreUser)localUser
{
  v4 = [(STCoreUsersController *)self localUserController];
  v5 = [v4 fetchedObjects];

  if (![v5 count])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"STCoreUsersController.m" lineNumber:54 description:@"No local user in database"];
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    v6 = +[STLog screentime];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(STCoreUsersController *)(uint64_t)v5 localUser];
    }
  }
  v7 = [v5 objectAtIndexedSubscript:0];

  return (STCoreUser *)v7;
}

- (NSFetchedResultsController)localUserController
{
  v17[1] = *MEMORY[0x1E4F143B8];
  localUserController = self->_localUserController;
  if (!localUserController)
  {
    v5 = +[STCoreUser fetchRequestMatchingLocalUser];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"givenName" ascending:1];
    v17[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v5 setSortDescriptors:v7];

    [v5 setShouldRefreshRefetchedObjects:1];
    id v8 = objc_alloc(MEMORY[0x1E4F1C0F0]);
    uint64_t v9 = [(STCoreUsersController *)self managedObjectContext];
    v10 = (NSFetchedResultsController *)[v8 initWithFetchRequest:v5 managedObjectContext:v9 sectionNameKeyPath:0 cacheName:0];
    v11 = self->_localUserController;
    self->_localUserController = v10;

    [(NSFetchedResultsController *)self->_localUserController setDelegate:self];
    v12 = self->_localUserController;
    id v16 = 0;
    LOBYTE(v9) = [(NSFetchedResultsController *)v12 performFetch:&v16];
    id v13 = v16;
    if ((v9 & 1) == 0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"STCoreUsersController.m", 76, @"Failed to fetch the local user: %@", v13 object file lineNumber description];
    }
    localUserController = self->_localUserController;
  }
  return localUserController;
}

+ (id)keyPathsForValuesAffectingUsers
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"localUser.isParent", @"localUser.isFamilyOrganizer", @"childUserController", 0);
}

- (NSArray)users
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v3 = [(STCoreUsersController *)self localUser];
  v4 = [(STCoreUsersController *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__STCoreUsersController_users__block_invoke;
  v10[3] = &unk_1E6BC78C8;
  v12 = &v13;
  id v5 = v3;
  id v11 = v5;
  [v4 performBlockAndWait:v10];

  if (*((unsigned char *)v14 + 24))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
    v7 = [(STCoreUsersController *)self childUserController];
    id v8 = [v7 fetchedObjects];
    [v6 addObjectsFromArray:v8];
  }
  else
  {
    v17[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v6;
}

uint64_t __30__STCoreUsersController_users__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isParent]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [*(id *)(a1 + 32) isFamilyOrganizer];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSFetchedResultsController)childUserController
{
  v18[1] = *MEMORY[0x1E4F143B8];
  childUserController = self->_childUserController;
  if (!childUserController)
  {
    id v5 = +[STCoreUser fetchRequest];
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == YES) || (%K == %@) || (%K == %@)", @"familySettings.isManaged", @"familyMemberType", @"Child", @"familyMemberType", @"Teen"];
    [v5 setPredicate:v6];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"givenName" ascending:1];
    v18[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v5 setSortDescriptors:v8];

    [v5 setShouldRefreshRefetchedObjects:1];
    id v9 = objc_alloc(MEMORY[0x1E4F1C0F0]);
    uint64_t v10 = [(STCoreUsersController *)self managedObjectContext];
    id v11 = (NSFetchedResultsController *)[v9 initWithFetchRequest:v5 managedObjectContext:v10 sectionNameKeyPath:0 cacheName:0];
    v12 = self->_childUserController;
    self->_childUserController = v11;

    [(NSFetchedResultsController *)self->_childUserController setDelegate:self];
    uint64_t v13 = self->_childUserController;
    id v17 = 0;
    LOBYTE(v10) = [(NSFetchedResultsController *)v13 performFetch:&v17];
    id v14 = v17;
    if ((v10 & 1) == 0)
    {
      char v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"STCoreUsersController.m", 131, @"Failed to fetch child users: %@", v14 object file lineNumber description];
    }
    childUserController = self->_childUserController;
  }
  return childUserController;
}

+ (id)keyPathsForValuesAffectingSelectedUser
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"users", @"selectedIndex", 0);
}

- (STCoreUser)selectedUser
{
  v3 = [(STCoreUsersController *)self users];
  v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[STCoreUsersController selectedIndex](self, "selectedIndex"));

  return (STCoreUser *)v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  v6 = [(STCoreUsersController *)self users];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"STCoreUsersController.m", 149, @"Invalid parameter not satisfying: %@", @"selectedIndex < self.users.count" object file lineNumber description];
  }
  self->_selectedIndex = a3;
}

- (BOOL)updateSelectedIndexForDSID:(id)a3
{
  return [(STCoreUsersController *)self _updateSelectedIndexForDSID:a3 isManaged:0];
}

- (BOOL)updateSelectedIndexForChildDSID:(id)a3
{
  return [(STCoreUsersController *)self _updateSelectedIndexForDSID:a3 isManaged:1];
}

- (BOOL)_updateSelectedIndexForDSID:(id)a3 isManaged:(BOOL)a4
{
  id v6 = a3;
  unint64_t v7 = [(STCoreUsersController *)self users];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke;
  uint64_t v15 = &unk_1E6BC7940;
  id v8 = v6;
  id v16 = v8;
  BOOL v17 = a4;
  uint64_t v9 = [v7 indexOfObjectPassingTest:&v12];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = +[STLog screentime];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STCoreUsersController _updateSelectedIndexForDSID:isManaged:]((uint64_t)v8, self, v10);
    }
  }
  else
  {
    -[STCoreUsersController setSelectedIndex:](self, "setSelectedIndex:", v9, v12, v13, v14, v15);
  }

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  void v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke_55;
  v8[3] = &unk_1E6BC7918;
  uint64_t v10 = v18;
  id v5 = v3;
  id v9 = v5;
  id v11 = &v12;
  [v4 performBlockAndWait:v8];

  uint64_t v6 = [(id)v13[5] isEqualToNumber:*(void *)(a1 + 32)];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v18, 8);
  return v6;
}

uint64_t __63__STCoreUsersController__updateSelectedIndexForDSID_isManaged___block_invoke_55(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isManaged];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) dsid];
  return MEMORY[0x1F41817F8]();
}

- (void)refresh
{
  v14[1] = *MEMORY[0x1E4F143B8];
  [(STCoreUsersController *)self setLocalUserController:0];
  [(STCoreUsersController *)self setChildUserController:0];
  v4 = +[STScreenTimeSettings fetchRequest];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"screenTimeEnabled" ascending:1];
  v14[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v4 setSortDescriptors:v6];

  [v4 setShouldRefreshRefetchedObjects:1];
  id v7 = objc_alloc(MEMORY[0x1E4F1C0F0]);
  id v8 = [(STCoreUsersController *)self managedObjectContext];
  id v9 = (void *)[v7 initWithFetchRequest:v4 managedObjectContext:v8 sectionNameKeyPath:0 cacheName:0];

  [v9 setDelegate:self];
  [(STCoreUsersController *)self setSettingsController:v9];
  id v13 = 0;
  char v10 = [v9 performFetch:&v13];
  id v11 = v13;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"STCoreUsersController.m", 204, @"Failed to fetch the local Screen Time settings: %@", v11 object file lineNumber description];
  }
}

- (void)notifyServerOfScreenTimeEnabled:(BOOL)a3 forUser:(id)a4
{
}

- (void)controllerWillChangeContent:(id)a3
{
  id v9 = a3;
  id v4 = [(STCoreUsersController *)self localUserController];

  if (v4 == v9)
  {
    id v8 = @"localUser";
  }
  else
  {
    id v5 = [(STCoreUsersController *)self childUserController];

    if (v5 == v9)
    {
      id v8 = @"users";
    }
    else
    {
      id v6 = [(STCoreUsersController *)self settingsController];

      id v7 = v9;
      if (v6 != v9) {
        goto LABEL_8;
      }
      [(STCoreUsersController *)self willChangeValueForKey:@"localUser.screenTimeEnabled"];
      id v8 = @"localUser.syncingEnabled";
    }
  }
  [(STCoreUsersController *)self willChangeValueForKey:v8];
  id v7 = v9;
LABEL_8:
}

- (void)controllerDidChangeContent:(id)a3
{
  id v9 = a3;
  id v4 = [(STCoreUsersController *)self localUserController];

  if (v4 == v9)
  {
    id v8 = @"localUser";
  }
  else
  {
    id v5 = [(STCoreUsersController *)self childUserController];

    if (v5 == v9)
    {
      id v8 = @"users";
    }
    else
    {
      id v6 = [(STCoreUsersController *)self settingsController];

      id v7 = v9;
      if (v6 != v9) {
        goto LABEL_8;
      }
      [(STCoreUsersController *)self didChangeValueForKey:@"localUser.screenTimeEnabled"];
      id v8 = @"localUser.syncingEnabled";
    }
  }
  [(STCoreUsersController *)self didChangeValueForKey:v8];
  id v7 = v9;
LABEL_8:
}

- (void)setUsers:(id)a3
{
}

- (void)setSelectedUser:(id)a3
{
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalUserController:(id)a3
{
}

- (void)setChildUserController:(id)a3
{
}

- (NSFetchedResultsController)settingsController
{
  return (NSFetchedResultsController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettingsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_childUserController, 0);
  objc_storeStrong((id *)&self->_localUserController, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_selectedUser, 0);
  objc_storeStrong((id *)&self->_users, 0);
}

- (void)localUser
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Fetched more than one local user: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSelectedIndexForDSID:(NSObject *)a3 isManaged:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 users];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1DA519000, a3, OS_LOG_TYPE_ERROR, "Could not find user with dsid: %{public}@ in users: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end
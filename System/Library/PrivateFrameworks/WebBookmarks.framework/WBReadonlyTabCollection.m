@interface WBReadonlyTabCollection
- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5;
- (BOOL)hasCompletedMigration;
- (BOOL)isPersistent;
- (NSArray)allNamedTabGroupsUnsorted;
- (NSArray)namedTabGroupsInDefaultProfile;
- (NSArray)profiles;
- (NSArray)windowStates;
- (WBBrowserState)browserState;
- (WBBrowserState)lastSessionBrowserState;
- (WBReadonlyTabCollection)init;
- (id)devicesForProfile:(id)a3;
- (id)namedTabGroupsForProfileWithIdentifier:(id)a3;
- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3;
- (id)tabGroupWithUUID:(id)a3;
- (id)tabWithUUID:(id)a3;
- (id)tabsForTabGroup:(id)a3;
- (id)windowStateWithUUID:(id)a3;
- (int)pinnedTabsFolderID;
- (int)privatePinnedTabsFolderID;
- (unint64_t)maximumTabsPerGroup;
- (void)disableSuddenTerminationForPendingChanges;
- (void)setMaximumTabsPerGroup:(unint64_t)a3;
- (void)waitForPendingChanges;
@end

@implementation WBReadonlyTabCollection

- (WBReadonlyTabCollection)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBReadonlyTabCollection;
  v2 = [(WBReadonlyTabCollection *)&v9 init];
  if (v2)
  {
    v3 = [WBTabCollection alloc];
    v4 = +[WBCollectionConfiguration readonlySafariTabCollectionConfiguration];
    uint64_t v5 = [(WBTabCollection *)v3 initWithConfiguration:v4 openDatabase:1];
    collection = v2->_collection;
    v2->_collection = (WBTabCollection *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)hasCompletedMigration
{
  return [(WBTabCollection *)self->_collection hasCompletedMigration];
}

- (BOOL)isPersistent
{
  return [(WBTabCollection *)self->_collection isPersistent];
}

- (WBBrowserState)browserState
{
  return [(WBTabCollection *)self->_collection browserState];
}

- (WBBrowserState)lastSessionBrowserState
{
  return [(WBTabCollection *)self->_collection lastSessionBrowserState];
}

- (NSArray)windowStates
{
  return [(WBTabCollection *)self->_collection windowStates];
}

- (id)windowStateWithUUID:(id)a3
{
  return [(WBTabCollection *)self->_collection windowStateWithUUID:a3];
}

- (NSArray)profiles
{
  return [(WBTabCollection *)self->_collection profiles];
}

- (int)pinnedTabsFolderID
{
  return [(WBTabCollection *)self->_collection pinnedTabsFolderID];
}

- (int)privatePinnedTabsFolderID
{
  return [(WBTabCollection *)self->_collection privatePinnedTabsFolderID];
}

- (NSArray)namedTabGroupsInDefaultProfile
{
  return [(WBTabCollection *)self->_collection namedTabGroupsInDefaultProfile];
}

- (NSArray)allNamedTabGroupsUnsorted
{
  return [(WBTabCollection *)self->_collection allNamedTabGroupsUnsorted];
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  return [(WBTabCollection *)self->_collection namedTabGroupsForProfileWithIdentifier:a3];
}

- (id)devicesForProfile:(id)a3
{
  return [(WBTabCollection *)self->_collection devicesForProfile:a3];
}

- (id)tabsForTabGroup:(id)a3
{
  return [(WBTabCollection *)self->_collection tabsForTabGroup:a3];
}

- (id)tabGroupWithUUID:(id)a3
{
  return [(WBTabCollection *)self->_collection tabGroupWithUUID:a3];
}

- (id)tabWithUUID:(id)a3
{
  return [(WBTabCollection *)self->_collection tabWithUUID:a3];
}

- (void)disableSuddenTerminationForPendingChanges
{
}

- (void)waitForPendingChanges
{
}

- (unint64_t)maximumTabsPerGroup
{
  return [(WBTabCollection *)self->_collection maximumTabsPerGroup];
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  return [(WBTabCollection *)self->_collection tabCollectionDataSummaryLogHidingSensitiveData:a3];
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  return [(WBTabCollection *)self->_collection copyTabsDatabase:a3 hidingSensitiveData:a4 error:a5];
}

- (void).cxx_destruct
{
}

@end
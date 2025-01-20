@interface RMPersistentHistoryNotifierChanges
+ (BOOL)isExistingPersistentHistoryToken:(id)a3 fromSameStoreAsUpdatedToken:(id)a4;
- (NSDictionary)tombstoneByObjectID;
- (NSDictionary)updatedPropertiesByObjectID;
- (NSPersistentHistoryToken)persistentHistoryToken;
- (NSSet)deletedObjectIDs;
- (NSSet)insertedObjectIDs;
- (NSSet)updatedObjectIDs;
- (RMPersistentHistoryNotifierChanges)init;
- (void)_updatePropertiesWithChange:(id)a3;
- (void)setPersistentHistoryToken:(id)a3;
- (void)updateWithChange:(id)a3;
@end

@implementation RMPersistentHistoryNotifierChanges

- (NSSet)insertedObjectIDs
{
  return (NSSet *)self->_insertedObjectIDs;
}

- (NSSet)updatedObjectIDs
{
  return (NSSet *)self->_updatedObjectIDs;
}

- (NSDictionary)updatedPropertiesByObjectID
{
  return (NSDictionary *)self->_updatedPropertiesByObjectID;
}

- (NSSet)deletedObjectIDs
{
  v2 = [(NSMutableDictionary *)self->_tombstoneByObjectID allKeys];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (NSDictionary)tombstoneByObjectID
{
  return (NSDictionary *)self->_tombstoneByObjectID;
}

+ (BOOL)isExistingPersistentHistoryToken:(id)a3 fromSameStoreAsUpdatedToken:(id)a4
{
  return !a3 || [a3 compareToken:a4 error:0] != 0;
}

- (RMPersistentHistoryNotifierChanges)init
{
  v12.receiver = self;
  v12.super_class = (Class)RMPersistentHistoryNotifierChanges;
  v2 = [(RMPersistentHistoryNotifierChanges *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    insertedObjectIDs = v2->_insertedObjectIDs;
    v2->_insertedObjectIDs = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    updatedObjectIDs = v2->_updatedObjectIDs;
    v2->_updatedObjectIDs = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    updatedPropertiesByObjectID = v2->_updatedPropertiesByObjectID;
    v2->_updatedPropertiesByObjectID = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    tombstoneByObjectID = v2->_tombstoneByObjectID;
    v2->_tombstoneByObjectID = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (void)updateWithChange:(id)a3
{
  id v9 = a3;
  v4 = [v9 changedObjectID];
  id v5 = [v9 changeType];
  if (v5 == (id)2)
  {
    uint64_t v6 = [v9 tombstone];
    uint64_t v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = &__NSDictionary0__struct;
    }
    [(NSMutableDictionary *)self->_tombstoneByObjectID setObject:v8 forKeyedSubscript:v4];
  }
  else if (v5 == (id)1)
  {
    [(NSMutableSet *)self->_updatedObjectIDs addObject:v4];
    [(RMPersistentHistoryNotifierChanges *)self _updatePropertiesWithChange:v9];
  }
  else if (!v5)
  {
    [(NSMutableSet *)self->_insertedObjectIDs addObject:v4];
  }
}

- (void)_updatePropertiesWithChange:(id)a3
{
  id v9 = a3;
  v4 = [v9 updatedProperties];
  if ([v4 count])
  {
    id v5 = [v9 changedObjectID];
    uint64_t v6 = self->_updatedPropertiesByObjectID;
    uint64_t v7 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v5];
    if (!v7)
    {
      uint64_t v7 = objc_opt_new();
      [(NSMutableDictionary *)v6 setObject:v7 forKeyedSubscript:v5];
    }
    v8 = [v4 valueForKey:@"name"];
    [v7 unionSet:v8];
  }
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return self->_persistentHistoryToken;
}

- (void)setPersistentHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentHistoryToken, 0);
  objc_storeStrong((id *)&self->_tombstoneByObjectID, 0);
  objc_storeStrong((id *)&self->_updatedPropertiesByObjectID, 0);
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);

  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
}

@end
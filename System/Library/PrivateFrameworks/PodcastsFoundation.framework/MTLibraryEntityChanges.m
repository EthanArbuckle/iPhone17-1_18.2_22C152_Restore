@interface MTLibraryEntityChanges
- (BOOL)hasChanges;
- (BOOL)hasDeletes;
- (BOOL)hasInserts;
- (BOOL)hasUpdates;
- (MTLibraryEntityChanges)initWithEntityName:(id)a3;
- (NSMutableSet)deletedObjectIDs;
- (NSMutableSet)insertedObjectIDs;
- (NSMutableSet)updatedObjectIDs;
- (NSString)entityName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)insertedAndUpdatedObjectIDs;
- (void)add:(id)a3 changeType:(int)a4;
- (void)combineChanges:(id)a3;
- (void)setDeletedObjectIDs:(id)a3;
- (void)setInsertedObjectIDs:(id)a3;
- (void)setUpdatedObjectIDs:(id)a3;
@end

@implementation MTLibraryEntityChanges

- (void)add:(id)a3 changeType:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 <= 2)
  {
    id v8 = v6;
    id v6 = (id)[(NSMutableSet *)(&self->_insertedObjectIDs)[a4] addObject:v6];
    id v7 = v8;
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (MTLibraryEntityChanges)initWithEntityName:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTLibraryEntityChanges;
  id v6 = [(MTLibraryEntityChanges *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entityName, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    insertedObjectIDs = v7->_insertedObjectIDs;
    v7->_insertedObjectIDs = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    deletedObjectIDs = v7->_deletedObjectIDs;
    v7->_deletedObjectIDs = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    updatedObjectIDs = v7->_updatedObjectIDs;
    v7->_updatedObjectIDs = (NSMutableSet *)v12;
  }
  return v7;
}

- (BOOL)hasUpdates
{
  v2 = [(MTLibraryEntityChanges *)self updatedObjectIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableSet)updatedObjectIDs
{
  return self->_updatedObjectIDs;
}

- (BOOL)hasChanges
{
  if ([(MTLibraryEntityChanges *)self hasInserts]
    || [(MTLibraryEntityChanges *)self hasDeletes])
  {
    return 1;
  }
  return [(MTLibraryEntityChanges *)self hasUpdates];
}

- (BOOL)hasInserts
{
  v2 = [(MTLibraryEntityChanges *)self insertedObjectIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableSet)insertedObjectIDs
{
  return self->_insertedObjectIDs;
}

- (BOOL)hasDeletes
{
  v2 = [(MTLibraryEntityChanges *)self deletedObjectIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableSet)deletedObjectIDs
{
  return self->_deletedObjectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(MTLibraryEntityChanges *)self entityName];
  id v7 = (void *)[v5 initWithEntityName:v6];

  uint64_t v8 = [(MTLibraryEntityChanges *)self insertedObjectIDs];
  v9 = (void *)[v8 mutableCopyWithZone:a3];
  [v7 setInsertedObjectIDs:v9];

  uint64_t v10 = [(MTLibraryEntityChanges *)self deletedObjectIDs];
  v11 = (void *)[v10 mutableCopyWithZone:a3];
  [v7 setDeletedObjectIDs:v11];

  uint64_t v12 = [(MTLibraryEntityChanges *)self updatedObjectIDs];
  v13 = (void *)[v12 mutableCopyWithZone:a3];
  [v7 setUpdatedObjectIDs:v13];

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: inserted(%li), deleted(%li), updated(%li)", self->_entityName, -[NSMutableSet count](self->_insertedObjectIDs, "count"), -[NSMutableSet count](self->_deletedObjectIDs, "count"), -[NSMutableSet count](self->_updatedObjectIDs, "count")];
}

- (id)insertedAndUpdatedObjectIDs
{
  BOOL v3 = objc_opt_new();
  v4 = [(MTLibraryEntityChanges *)self insertedObjectIDs];
  [v3 unionSet:v4];

  id v5 = [(MTLibraryEntityChanges *)self updatedObjectIDs];
  [v3 unionSet:v5];

  return v3;
}

- (void)combineChanges:(id)a3
{
  insertedObjectIDs = self->_insertedObjectIDs;
  id v5 = a3;
  id v6 = [v5 insertedObjectIDs];
  [(NSMutableSet *)insertedObjectIDs unionSet:v6];

  deletedObjectIDs = self->_deletedObjectIDs;
  uint64_t v8 = [v5 deletedObjectIDs];
  [(NSMutableSet *)deletedObjectIDs unionSet:v8];

  updatedObjectIDs = self->_updatedObjectIDs;
  id v10 = [v5 updatedObjectIDs];

  [(NSMutableSet *)updatedObjectIDs unionSet:v10];
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setInsertedObjectIDs:(id)a3
{
}

- (void)setDeletedObjectIDs:(id)a3
{
}

- (void)setUpdatedObjectIDs:(id)a3
{
}

@end
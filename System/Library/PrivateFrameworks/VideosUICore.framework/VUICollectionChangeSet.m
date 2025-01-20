@interface VUICollectionChangeSet
- (BOOL)containsOnlyChangeKind:(unint64_t)a3;
- (BOOL)hasChanges;
- (NSArray)moveChanges;
- (NSArray)updateChanges;
- (VUICollectionChange)deleteChange;
- (VUICollectionChange)insertChange;
- (id)_changesKinds;
- (id)description;
- (void)setDeleteChange:(id)a3;
- (void)setInsertChange:(id)a3;
- (void)setMoveChanges:(id)a3;
- (void)setUpdateChanges:(id)a3;
@end

@implementation VUICollectionChangeSet

- (BOOL)hasChanges
{
  v3 = [(VUICollectionChangeSet *)self deleteChange];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(VUICollectionChangeSet *)self insertChange];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(VUICollectionChangeSet *)self moveChanges];
      if ([v6 count])
      {
        BOOL v4 = 1;
      }
      else
      {
        v7 = [(VUICollectionChangeSet *)self updateChanges];
        BOOL v4 = [v7 count] != 0;
      }
    }
  }
  return v4;
}

- (BOOL)containsOnlyChangeKind:(unint64_t)a3
{
  BOOL v4 = [(VUICollectionChangeSet *)self _changesKinds];
  if ([v4 count] == 1)
  {
    v5 = [v4 firstObject];
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24.receiver = self;
  v24.super_class = (Class)VUICollectionChangeSet;
  BOOL v4 = [(VUICollectionChangeSet *)&v24 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = VUIBoolLogString([(VUICollectionChangeSet *)self hasChanges]);
  char v7 = [v5 stringWithFormat:@"%@=%@", @"hasChanges", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUICollectionChangeSet *)self deleteChange];
  v10 = [v8 stringWithFormat:@"%@=%@", @"deleteChange", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [(VUICollectionChangeSet *)self insertChange];
  v13 = [v11 stringWithFormat:@"%@=%@", @"insertChange", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(VUICollectionChangeSet *)self moveChanges];
  v16 = [v14 stringWithFormat:@"%@=%@", @"moveChanges", v15];
  [v3 addObject:v16];

  v17 = NSString;
  v18 = [(VUICollectionChangeSet *)self updateChanges];
  v19 = [v17 stringWithFormat:@"%@=%@", @"updateChanges", v18];
  [v3 addObject:v19];

  v20 = NSString;
  v21 = [v3 componentsJoinedByString:@", "];
  v22 = [v20 stringWithFormat:@"<%@>", v21];

  return v22;
}

- (id)_changesKinds
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(VUICollectionChangeSet *)self deleteChange];

  if (v4) {
    [v3 addObject:&unk_1F3DFD650];
  }
  v5 = [(VUICollectionChangeSet *)self insertChange];

  if (v5) {
    [v3 addObject:&unk_1F3DFD668];
  }
  v6 = [(VUICollectionChangeSet *)self moveChanges];
  uint64_t v7 = [v6 count];

  if (v7) {
    [v3 addObject:&unk_1F3DFD680];
  }
  v8 = [(VUICollectionChangeSet *)self updateChanges];
  uint64_t v9 = [v8 count];

  if (v9) {
    [v3 addObject:&unk_1F3DFD698];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (VUICollectionChange)deleteChange
{
  return self->_deleteChange;
}

- (void)setDeleteChange:(id)a3
{
}

- (VUICollectionChange)insertChange
{
  return self->_insertChange;
}

- (void)setInsertChange:(id)a3
{
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
}

- (NSArray)updateChanges
{
  return self->_updateChanges;
}

- (void)setUpdateChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateChanges, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong((id *)&self->_insertChange, 0);
  objc_storeStrong((id *)&self->_deleteChange, 0);
}

@end
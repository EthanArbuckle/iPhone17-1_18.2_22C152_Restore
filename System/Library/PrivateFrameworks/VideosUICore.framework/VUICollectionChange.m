@interface VUICollectionChange
- (NSIndexSet)destinationIndexes;
- (NSIndexSet)sourceIndexes;
- (VUICollectionChange)init;
- (VUICollectionChange)initWithChangeKind:(unint64_t)a3 sourceIndexes:(id)a4 destinationIndexes:(id)a5;
- (VUICollectionChangeSet)updateChangeSet;
- (id)description;
- (unint64_t)changeKind;
- (void)setUpdateChangeSet:(id)a3;
@end

@implementation VUICollectionChange

- (VUICollectionChange)initWithChangeKind:(unint64_t)a3 sourceIndexes:(id)a4 destinationIndexes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUICollectionChange;
  v10 = [(VUICollectionChange *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_changeKind = a3;
    uint64_t v12 = [v8 copy];
    sourceIndexes = v11->_sourceIndexes;
    v11->_sourceIndexes = (NSIndexSet *)v12;

    uint64_t v14 = [v9 copy];
    destinationIndexes = v11->_destinationIndexes;
    v11->_destinationIndexes = (NSIndexSet *)v14;
  }
  return v11;
}

- (VUICollectionChange)init
{
  return [(VUICollectionChange *)self initWithChangeKind:0 sourceIndexes:0 destinationIndexes:0];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21.receiver = self;
  v21.super_class = (Class)VUICollectionChange;
  v4 = [(VUICollectionChange *)&v21 description];
  [v3 addObject:v4];

  unint64_t v5 = [(VUICollectionChange *)self changeKind];
  if (v5 > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1E6DDD0F8[v5];
  }
  v7 = [NSString stringWithFormat:@"%@=%@", @"changeKind", v6];
  [v3 addObject:v7];

  id v8 = NSString;
  id v9 = [(VUICollectionChange *)self sourceIndexes];
  v10 = [v8 stringWithFormat:@"%@=%@", @"sourceIndexes", v9];
  [v3 addObject:v10];

  v11 = NSString;
  uint64_t v12 = [(VUICollectionChange *)self destinationIndexes];
  v13 = [v11 stringWithFormat:@"%@=%@", @"destinationIndexes", v12];
  [v3 addObject:v13];

  uint64_t v14 = NSString;
  v15 = [(VUICollectionChange *)self updateChangeSet];
  v16 = [v14 stringWithFormat:@"%@=%@", @"updateChangeSet", v15];
  [v3 addObject:v16];

  objc_super v17 = NSString;
  v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

- (unint64_t)changeKind
{
  return self->_changeKind;
}

- (NSIndexSet)sourceIndexes
{
  return self->_sourceIndexes;
}

- (NSIndexSet)destinationIndexes
{
  return self->_destinationIndexes;
}

- (VUICollectionChangeSet)updateChangeSet
{
  return self->_updateChangeSet;
}

- (void)setUpdateChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateChangeSet, 0);
  objc_storeStrong((id *)&self->_destinationIndexes, 0);
  objc_storeStrong((id *)&self->_sourceIndexes, 0);
}

@end
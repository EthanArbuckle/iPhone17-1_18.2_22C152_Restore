@interface SetChange
+ (id)emptyChange;
- (BOOL)isDeleteAll;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChange:(id)a3;
- (BOOL)isInsertAll;
- (BOOL)isSingleDelete;
- (NSIndexSet)deletedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)modifiedIndexes;
- (NSSet)moves;
- (SetChange)initWithInsertedIndexes:(id)a3 deletedIndexes:(id)a4 modifiedIndexes:(id)a5 moves:(id)a6;
- (id)description;
- (id)initAsDeleteAllWithIndexes:(id)a3;
- (id)initAsInsertAllWithIndexes:(id)a3;
- (unint64_t)hash;
- (void)_appendDescriptionForIndexSet:(uint64_t)a3 named:(void *)a4 toDescription:;
@end

@implementation SetChange

- (id)initAsInsertAllWithIndexes:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SetChange;
  v6 = [(SetChange *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_insertedIndexes, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D60] indexSet];
    deletedIndexes = v7->_deletedIndexes;
    v7->_deletedIndexes = (NSIndexSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D60] indexSet];
    modifiedIndexes = v7->_modifiedIndexes;
    v7->_modifiedIndexes = (NSIndexSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    moves = v7->_moves;
    v7->_moves = (NSSet *)v12;

    v7->_empty = [v5 count] == 0;
    v7->_insertAll = [v5 count] != 0;
    v14 = v7;
  }

  return v7;
}

- (id)initAsDeleteAllWithIndexes:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SetChange;
  v6 = [(SetChange *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D60] indexSet];
    insertedIndexes = v6->_insertedIndexes;
    v6->_insertedIndexes = (NSIndexSet *)v7;

    objc_storeStrong((id *)&v6->_deletedIndexes, a3);
    uint64_t v9 = [MEMORY[0x1E4F28D60] indexSet];
    modifiedIndexes = v6->_modifiedIndexes;
    v6->_modifiedIndexes = (NSIndexSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    moves = v6->_moves;
    v6->_moves = (NSSet *)v11;

    v6->_empty = [v5 count] == 0;
    v6->_singleDelete = [v5 count] == 1;
    v6->_deleteAll = [v5 count] != 0;
    v13 = v6;
  }

  return v6;
}

- (SetChange)initWithInsertedIndexes:(id)a3 deletedIndexes:(id)a4 modifiedIndexes:(id)a5 moves:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SetChange;
  objc_super v15 = [(SetChange *)&v21 init];
  objc_super v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_insertedIndexes, a3);
    objc_storeStrong((id *)&v16->_deletedIndexes, a4);
    objc_storeStrong((id *)&v16->_modifiedIndexes, a5);
    objc_storeStrong((id *)&v16->_moves, a6);
    BOOL v17 = ![v11 count]
       && ![v12 count]
       && ![v13 count]
       && [v14 count] == 0;
    v16->_empty = v17;
    BOOL v18 = [(NSIndexSet *)v16->_deletedIndexes count] == 1
       && ![(NSIndexSet *)v16->_insertedIndexes count]
       && ![(NSIndexSet *)v16->_modifiedIndexes count]
       && [(NSSet *)v16->_moves count] == 0;
    v16->_singleDelete = v18;
    v19 = v16;
  }

  return v16;
}

+ (id)emptyChange
{
  if (emptyChange_onceToken != -1) {
    dispatch_once(&emptyChange_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)emptyChange_instance;
  return v2;
}

void __24__SetChange_emptyChange__block_invoke()
{
  v0 = [SetChange alloc];
  id v6 = [MEMORY[0x1E4F28D60] indexSet];
  v1 = [MEMORY[0x1E4F28D60] indexSet];
  v2 = [MEMORY[0x1E4F28D60] indexSet];
  v3 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v4 = [(SetChange *)v0 initWithInsertedIndexes:v6 deletedIndexes:v1 modifiedIndexes:v2 moves:v3];
  id v5 = (void *)emptyChange_instance;
  emptyChange_instance = v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SetChange *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SetChange *)self isEqualToChange:v4];
  }

  return v5;
}

- (BOOL)isEqualToChange:(id)a3
{
  uint64_t v4 = (SetChange *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(NSIndexSet *)self->_insertedIndexes isEqualToIndexSet:v4->_insertedIndexes]
      && [(NSIndexSet *)self->_deletedIndexes isEqualToIndexSet:v5->_deletedIndexes]
      && [(NSIndexSet *)self->_modifiedIndexes isEqualToIndexSet:v5->_modifiedIndexes]
      && [(NSSet *)self->_moves isEqualToSet:v5->_moves];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSIndexSet *)self->_insertedIndexes hash];
  uint64_t v4 = [(NSIndexSet *)self->_deletedIndexes hash] ^ v3;
  uint64_t v5 = [(NSIndexSet *)self->_modifiedIndexes hash];
  return v4 ^ v5 ^ [(NSSet *)self->_moves hash];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_empty) {
    [v3 appendString:@"; _empty=YES"];
  }
  if (self->_singleDelete) {
    [v4 appendString:@"; _singleDelete=YES"];
  }
  if (self->_deleteAll) {
    [v4 appendString:@"; _deleteAll=YES"];
  }
  if (self->_insertAll) {
    [v4 appendString:@"; _insertAll=YES"];
  }
  if ([(NSIndexSet *)self->_insertedIndexes count]) {
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_insertedIndexes, @"_insertedIndexes", v4);
  }
  if ([(NSIndexSet *)self->_deletedIndexes count]) {
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_deletedIndexes, @"_deletedIndexes", v4);
  }
  if ([(NSIndexSet *)self->_modifiedIndexes count]) {
    -[SetChange _appendDescriptionForIndexSet:named:toDescription:]((uint64_t)self, self->_modifiedIndexes, @"_modifiedIndexes", v4);
  }
  if ([(NSSet *)self->_moves count]) {
    [v4 appendFormat:@";\n_moves=%@", self->_moves];
  }
  [v4 appendString:@">"];
  return v4;
}

- (void)_appendDescriptionForIndexSet:(uint64_t)a3 named:(void *)a4 toDescription:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "appendFormat:", @";\n%@=("), a3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__SetChange__appendDescriptionForIndexSet_named_toDescription___block_invoke;
    v11[3] = &unk_1E6D7EB88;
    id v10 = v9;
    id v12 = v10;
    id v13 = v7;
    [v13 enumerateIndexesUsingBlock:v11];
    [v10 appendString:@""]);
  }
}

unint64_t __63__SetChange__appendDescriptionForIndexSet_named_toDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @" %ld", a2);
  unint64_t result = [*(id *)(a1 + 40) count];
  if (a2 + 1 < result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 appendString:@","];
  }
  return result;
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (NSIndexSet)deletedIndexes
{
  return self->_deletedIndexes;
}

- (NSIndexSet)modifiedIndexes
{
  return self->_modifiedIndexes;
}

- (NSSet)moves
{
  return self->_moves;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (BOOL)isSingleDelete
{
  return self->_singleDelete;
}

- (BOOL)isInsertAll
{
  return self->_insertAll;
}

- (BOOL)isDeleteAll
{
  return self->_deleteAll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moves, 0);
  objc_storeStrong((id *)&self->_modifiedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
}

@end
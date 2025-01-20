@interface REMMutableCRUndo
- (NSMutableArray)undoBlocks;
- (REMMutableCRUndo)init;
- (id)immutableCopy;
- (void)addUndoBlock:(id)a3;
@end

@implementation REMMutableCRUndo

- (REMMutableCRUndo)init
{
  v6.receiver = self;
  v6.super_class = (Class)REMMutableCRUndo;
  v2 = [(REMMutableCRUndo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    undoBlocks = v2->_undoBlocks;
    v2->_undoBlocks = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addUndoBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(REMMutableCRUndo *)self undoBlocks];
  v5 = (void *)MEMORY[0x1BA9DBBC0](v4);

  [v6 addObject:v5];
}

- (id)immutableCopy
{
  uint64_t v3 = [REMCRUndo alloc];
  id v4 = [(REMMutableCRUndo *)self undoBlocks];
  v5 = (void *)[v4 copy];
  id v6 = [(REMCRUndo *)v3 initWithUndoBlocks:v5];

  return v6;
}

- (NSMutableArray)undoBlocks
{
  return self->_undoBlocks;
}

- (void).cxx_destruct
{
}

@end
@interface REMCRUndo
- (NSArray)undoBlocks;
- (REMCRUndo)init;
- (REMCRUndo)initWithUndoBlocks:(id)a3;
@end

@implementation REMCRUndo

- (REMCRUndo)init
{
  return [(REMCRUndo *)self initWithUndoBlocks:MEMORY[0x1E4F1CBF0]];
}

- (REMCRUndo)initWithUndoBlocks:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMCRUndo;
  v5 = [(REMCRUndo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    undoBlocks = v5->_undoBlocks;
    v5->_undoBlocks = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)undoBlocks
{
  return self->_undoBlocks;
}

- (void).cxx_destruct
{
}

@end
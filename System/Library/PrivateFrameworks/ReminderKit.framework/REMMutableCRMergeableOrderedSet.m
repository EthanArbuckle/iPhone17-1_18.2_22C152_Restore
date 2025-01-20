@interface REMMutableCRMergeableOrderedSet
- (BOOL)wantsUndoCommands;
- (CRDocument)document;
- (NSMutableArray)undos;
- (NSString)description;
- (REMMutableCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4 undos:(id)a5;
- (REMMutableCRUndo)currentUndo;
- (REMReplicaIDHelper)replicaIDHelper;
- (REMReplicaIDSource)replicaIDSource;
- (REMReplicaManagerProviding)replicaManagerProvider;
- (id)addObject:(id)a3;
- (id)documentToEdit;
- (id)immutableOrderedSet;
- (id)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (id)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (id)removeObjectAtIndex:(unint64_t)a3;
- (void)addUndoCommandsForObject:(id)a3 block:(id)a4;
- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3;
- (void)setCurrentUndo:(id)a3;
- (void)setDocument:(id)a3;
- (void)setReplicaIDHelper:(id)a3;
- (void)setReplicaIDSource:(id)a3;
- (void)setReplicaManagerProvider:(id)a3;
- (void)undo;
- (void)undo:(id)a3;
@end

@implementation REMMutableCRMergeableOrderedSet

- (REMMutableCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4 undos:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)REMMutableCRMergeableOrderedSet;
  v12 = [(REMMutableCRMergeableOrderedSet *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeStrong((id *)&v13->_document, a4);
    v14 = [(CRDocument *)v13->_document rootObject];
    [v14 setDelegate:v13];

    uint64_t v15 = [v11 mutableCopy];
    undos = v13->_undos;
    v13->_undos = (NSMutableArray *)v15;

    v17 = [[REMReplicaIDHelper alloc] initWithReplicaIDSource:v9 owner:v13 replicaClockProvider:v10];
    replicaIDHelper = v13->_replicaIDHelper;
    v13->_replicaIDHelper = v17;
  }
  return v13;
}

- (id)immutableOrderedSet
{
  v3 = (void *)MEMORY[0x1BA9DB950](self, a2);
  v4 = [(REMMutableCRMergeableOrderedSet *)self document];
  v5 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  v6 = (void *)[v4 copyForReplica:v5];

  v7 = [(REMMutableCRMergeableOrderedSet *)self replicaIDHelper];
  [v7 didCopy];

  v8 = [REMCRMergeableOrderedSet alloc];
  id v9 = [(REMMutableCRMergeableOrderedSet *)self replicaIDSource];
  id v10 = [(REMMutableCRMergeableOrderedSet *)self undos];
  id v11 = [(REMCRMergeableOrderedSet *)v8 initWithReplicaIDSource:v9 document:v6 undos:v10];

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMMutableCRMergeableOrderedSet *)self document];
  v6 = [v3 stringWithFormat:@"<%@: %p document: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)setReplicaManagerProvider:(id)a3
{
}

- (id)documentToEdit
{
  v3 = [(REMMutableCRMergeableOrderedSet *)self replicaIDHelper];
  [v3 willEdit];

  return [(REMMutableCRMergeableOrderedSet *)self document];
}

- (id)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:v7];

  v8 = (void *)MEMORY[0x1BA9DB950]();
  id v9 = [(REMMutableCRMergeableOrderedSet *)self documentToEdit];
  id v10 = [v9 rootObject];
  [v10 insertObject:v6 atIndex:a4];

  id v11 = [(REMMutableCRMergeableOrderedSet *)self currentUndo];
  v12 = [v11 immutableCopy];

  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:0];
  v13 = [(REMMutableCRMergeableOrderedSet *)self undos];
  [v13 addObject:v12];

  return v12;
}

- (id)addObject:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:v5];

  id v6 = (void *)MEMORY[0x1BA9DB950]();
  v7 = [(REMMutableCRMergeableOrderedSet *)self documentToEdit];
  v8 = [v7 rootObject];
  [v8 addObject:v4];

  id v9 = [(REMMutableCRMergeableOrderedSet *)self currentUndo];
  id v10 = [v9 immutableCopy];

  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:0];
  id v11 = [(REMMutableCRMergeableOrderedSet *)self undos];
  [v11 addObject:v10];

  return v10;
}

- (id)removeObjectAtIndex:(unint64_t)a3
{
  v5 = objc_opt_new();
  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:v5];

  id v6 = (void *)MEMORY[0x1BA9DB950]();
  v7 = [(REMMutableCRMergeableOrderedSet *)self documentToEdit];
  v8 = [v7 rootObject];
  [v8 removeObjectAtIndex:a3];

  id v9 = [(REMMutableCRMergeableOrderedSet *)self currentUndo];
  id v10 = [v9 immutableCopy];

  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:0];
  id v11 = [(REMMutableCRMergeableOrderedSet *)self undos];
  [v11 addObject:v10];

  return v10;
}

- (id)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  v7 = objc_opt_new();
  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:v7];

  v8 = (void *)MEMORY[0x1BA9DB950]();
  id v9 = [(REMMutableCRMergeableOrderedSet *)self documentToEdit];
  id v10 = [v9 rootObject];
  [v10 moveObjectFromIndex:a3 toIndex:a4];

  id v11 = [(REMMutableCRMergeableOrderedSet *)self currentUndo];
  v12 = [v11 immutableCopy];

  [(REMMutableCRMergeableOrderedSet *)self setCurrentUndo:0];
  v13 = [(REMMutableCRMergeableOrderedSet *)self undos];
  [v13 addObject:v12];

  return v12;
}

- (void)undo
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Undo stack is empty. Cannot -undo.", v1, 2u);
}

- (void)undo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(REMMutableCRMergeableOrderedSet *)self undos];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v17 = +[REMLog crdt];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[REMMutableCRMergeableOrderedSet undo:](self, v17);
    }
  }
  v7 = (void *)MEMORY[0x1BA9DB950]();
  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v4, "undoBlocks", 0);
    id v9 = [v8 reverseObjectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [(REMMutableCRMergeableOrderedSet *)self documentToEdit];
          v16 = [v15 rootObject];
          (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[REMMutableCRMergeableOrderedSet undo](v9);
    }
  }
}

- (BOOL)wantsUndoCommands
{
  return 1;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = [(REMMutableCRMergeableOrderedSet *)self currentUndo];
  [v6 addUndoBlock:v5];
}

- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3
{
  id v12 = a3;
  id v4 = (void *)MEMORY[0x1BA9DB950]();
  id v5 = [v12 replicaUUID];
  id v6 = [(REMMutableCRMergeableOrderedSet *)self document];
  v7 = (void *)[v6 copyForReplica:v5];
  [(REMMutableCRMergeableOrderedSet *)self setDocument:v7];

  v8 = [(REMMutableCRMergeableOrderedSet *)self document];
  id v9 = [(REMMutableCRMergeableOrderedSet *)self replicaIDHelper];
  [v9 setReplicaClockProvider:v8];

  uint64_t v10 = [(REMMutableCRMergeableOrderedSet *)self document];
  uint64_t v11 = [v10 rootObject];
  [v11 setDelegate:self];
}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (REMReplicaIDHelper)replicaIDHelper
{
  return self->_replicaIDHelper;
}

- (void)setReplicaIDHelper:(id)a3
{
}

- (NSMutableArray)undos
{
  return self->_undos;
}

- (REMMutableCRUndo)currentUndo
{
  return self->_currentUndo;
}

- (void)setCurrentUndo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUndo, 0);
  objc_storeStrong((id *)&self->_undos, 0);
  objc_storeStrong((id *)&self->_replicaIDHelper, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);

  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
}

- (void)undo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 undos];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self.undos containsObject:undo]) -- Supplied undo is not found in undo stack. Normally, if the undo is obtained from this particular REMCRMergeableOrderedSet, the undo will also be present in self.undos, whose value is now: %@", (uint8_t *)&v4, 0xCu);
}

@end
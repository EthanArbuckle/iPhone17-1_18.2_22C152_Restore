@interface _UIArrayController
- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4;
- (NSArray)sortDescriptors;
- (NSOperationQueue)operationQueue;
- (NSOrderedSet)lastSnapshot;
- (NSPredicate)predicate;
- (_UIArrayController)initWithDelegate:(id)a3;
- (_UIArrayControllerDelegate)delegate;
- (id)_computeUpdatesFromOld:(id)a3 toNew:(id)a4 changedItems:(id)a5;
- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)processUpdate:(id)a3 changedObjects:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLastSnapshot:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation _UIArrayController

- (_UIArrayController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIArrayController;
  v5 = [(_UIArrayController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(_UIArrayController *)v5 setDelegate:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(_UIArrayController *)v6 setOperationQueue:v7];

    v8 = [(_UIArrayController *)v6 operationQueue];
    [v8 setMaxConcurrentOperationCount:1];

    v9 = [MEMORY[0x1E4F1CAA0] orderedSet];
    [(_UIArrayController *)v6 setLastSnapshot:v9];
  }
  return v6;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UIArrayController.m" lineNumber:56 description:@"_UIArrayController deallocated without being invalidated first"];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIArrayController;
  [(_UIArrayController *)&v5 dealloc];
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIArrayController *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41___UIArrayController_setSortDescriptors___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (NSArray)sortDescriptors
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__101;
  v12 = __Block_byref_object_dispose__101;
  id v13 = 0;
  v3 = [(_UIArrayController *)self operationQueue];
  id v4 = [v3 underlyingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___UIArrayController_sortDescriptors__block_invoke;
  v7[3] = &unk_1E52E3210;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)setPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIArrayController *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35___UIArrayController_setPredicate___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (NSPredicate)predicate
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__101;
  v12 = __Block_byref_object_dispose__101;
  id v13 = 0;
  v3 = [(_UIArrayController *)self operationQueue];
  id v4 = [v3 underlyingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31___UIArrayController_predicate__block_invoke;
  v7[3] = &unk_1E52E3210;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSPredicate *)v5;
}

- (void)invalidate
{
  v3 = [(_UIArrayController *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32___UIArrayController_invalidate__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)setOperationQueue:(id)a3
{
  id v6 = (NSOperationQueue *)a3;
  if (self->_firstUpdateSent)
  {
    objc_super v11 = v6;
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIArrayController.m" lineNumber:108 description:@"Operation queue changed after first update sent"];

    id v6 = v11;
  }
  operationQueue = self->_operationQueue;
  p_operationQueue = &self->_operationQueue;
  if (operationQueue != v6)
  {
    uint64_t v10 = v6;
    objc_storeStrong((id *)p_operationQueue, a3);
    id v6 = v10;
  }
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  return 0;
}

- (id)_computeUpdatesFromOld:(id)a3 toNew:(id)a4 changedItems:(id)a5
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  v9 = [MEMORY[0x1E4F1CA48] array];
  v29 = [MEMORY[0x1E4F1CA48] array];
  v31 = [MEMORY[0x1E4F1CA48] array];
  v33 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = 0;
  if ([v7 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [v7 objectAtIndex:v11];
      uint64_t v13 = [v8 indexOfObject:v12];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v11 != v13)
      {
        v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
        v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
        [v33 setObject:v14 forKey:v15];

LABEL_10:
        if ((unint64_t)++v10 > 0x80) {
          goto LABEL_15;
        }
        goto LABEL_11;
      }
      if (v32)
      {
        if (![v32 containsObject:v12]) {
          goto LABEL_11;
        }
      }
      else
      {
        v16 = [v8 objectAtIndex:v11];
        BOOL v17 = [(_UIArrayController *)self objectAttributeModified:v12 newObject:v16];

        if (!v17) {
          goto LABEL_11;
        }
      }
      v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
      [v31 addObject:v18];

      if ((unint64_t)++v10 >= 0x81)
      {
LABEL_15:

        v19 = (void *)MEMORY[0x1E4F1CC08];
        v20 = v29;
        goto LABEL_31;
      }
LABEL_11:

      if (++v11 >= (unint64_t)[v7 count]) {
        goto LABEL_16;
      }
    }
    v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
    [v9 addObject:v14];
    goto LABEL_10;
  }
LABEL_16:
  uint64_t v21 = [v8 count];
  v20 = v29;
  if ((v21 != [v7 count] || objc_msgSend(v9, "count")) && objc_msgSend(v8, "count"))
  {
    uint64_t v22 = 0;
    while (1)
    {
      v23 = [v8 objectAtIndex:v22];
      if (([v7 containsObject:v23] & 1) == 0)
      {
        v24 = [MEMORY[0x1E4F28D58] indexPathForItem:v22 inSection:0];
        [v29 addObject:v24];

        if ((unint64_t)++v10 > 0x80) {
          break;
        }
      }

      if (++v22 >= (unint64_t)[v8 count]) {
        goto LABEL_23;
      }
    }

LABEL_30:
    v19 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_31;
  }
LABEL_23:
  if ([v29 count]
    || [v9 count]
    || [v33 count]
    || [v31 count])
  {
    uint64_t v25 = [v7 count];
    uint64_t v26 = [v29 count] + v25;
    uint64_t v27 = v26 - [v9 count];
    if (v27 == [v8 count])
    {
      v34[0] = @"ins";
      v34[1] = @"del";
      v35[0] = v29;
      v35[1] = v9;
      v34[2] = @"mov";
      v34[3] = @"mod";
      v35[2] = v33;
      v35[3] = v31;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v19 = 0;
LABEL_31:

  return v19;
}

- (void)processUpdate:(id)a3 changedObjects:(id)a4
{
  unint64_t v7 = (unint64_t)a4;
  id v8 = (void *)[a3 copy];
  BOOL firstUpdateSent = self->_firstUpdateSent;
  self->_BOOL firstUpdateSent = 1;
  if (!((unint64_t)a3 | v7))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIArrayController.m" lineNumber:198 description:@"Either updated set or changed set must be non-nil"];
  }
  uint64_t v10 = [(_UIArrayController *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51___UIArrayController_processUpdate_changedObjects___block_invoke;
  v14[3] = &unk_1E52DC3F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = (id)v7;
  BOOL v17 = !firstUpdateSent;
  id v11 = (id)v7;
  id v12 = v8;
  [v10 addOperationWithBlock:v14];
}

- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_UIArrayController *)self setLastSnapshot:v7];
  id v8 = [(_UIArrayController *)self delegate];
  [v8 arrayController:self modelChanged:v7 differences:v6];
}

- (_UIArrayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIArrayControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSOrderedSet)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
@interface _UITableViewDropPlaceholderContextImpl
- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3;
- (BOOL)deletePlaceholder;
- (NSString)reuseIdentifier;
- (NSUUID)_shadowUpdateIdentifier;
- (UIDragAnimating)_animator;
- (UIDragItem)dragItem;
- (_UITableViewDropPlaceholderContextImpl)initWithDelegate:(id)a3 dragItem:(id)a4 reuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7;
- (_UITableViewPlaceholderContextDelegate)delegate;
- (double)rowHeight;
- (id)cellUpdateHandler;
- (void)_setAnimator:(id)a3;
- (void)_setShadowUpdateIdentifier:(id)a3;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setCellUpdateHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragItem:(id)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setRowHeight:(double)a3;
@end

@implementation _UITableViewDropPlaceholderContextImpl

- (_UITableViewDropPlaceholderContextImpl)initWithDelegate:(id)a3 dragItem:(id)a4 reuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_UITableViewDropPlaceholderContextImpl;
  v16 = [(_UITableViewDropPlaceholderContextImpl *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v12);
    objc_storeStrong((id *)&v17->_dragItem, a4);
    objc_storeStrong((id *)&v17->_reuseIdentifier, a5);
    v17->_rowHeight = a6;
    uint64_t v18 = [v15 copy];
    id cellUpdateHandler = v17->_cellUpdateHandler;
    v17->_id cellUpdateHandler = (id)v18;
  }
  return v17;
}

- (void)addAnimations:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  animator = self->_animator;
  if (has_internal_diagnostics)
  {
    if (!animator)
    {
      v8 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:

        goto LABEL_3;
      }
      v9 = NSStringFromSelector(a2);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "The animator should always be non-nil when %@ is called", (uint8_t *)&v11, 0xCu);
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (!animator)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addAnimations____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v8 = v10;
      v9 = NSStringFromSelector(a2);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "The animator should always be non-nil when %@ is called", (uint8_t *)&v11, 0xCu);
      goto LABEL_9;
    }
  }
LABEL_3:
  [(UIDragAnimating *)self->_animator addAnimations:v5];
}

- (void)addCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  animator = self->_animator;
  if (has_internal_diagnostics)
  {
    if (!animator)
    {
      v8 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:

        goto LABEL_3;
      }
      v9 = NSStringFromSelector(a2);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "The animator should always be non-nil when %@ is called", (uint8_t *)&v11, 0xCu);
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (!animator)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addCompletion____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v8 = v10;
      v9 = NSStringFromSelector(a2);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "The animator should always be non-nil when %@ is called", (uint8_t *)&v11, 0xCu);
      goto LABEL_9;
    }
  }
LABEL_3:
  [(UIDragAnimating *)self->_animator addCompletion:v5];
}

- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UITableViewDropCoordinator.m" lineNumber:406 description:@"Must provide a block of data source updates to run when committing the insertion of a placeholder."];
  }
  if (pthread_main_np() != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 409, @"%@ must be called from the main queue!", v11 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = [WeakRetained commitPlaceholderInsertionWithContext:self dataSourceUpdates:v5];

  return v7;
}

- (BOOL)deletePlaceholder
{
  if (pthread_main_np() != 1)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 417, @"%@ must be called from the main queue!", v8 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained deletePlaceholder:self];

  return v5;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (id)cellUpdateHandler
{
  return self->_cellUpdateHandler;
}

- (void)setCellUpdateHandler:(id)a3
{
}

- (UIDragAnimating)_animator
{
  return self->_animator;
}

- (void)_setAnimator:(id)a3
{
}

- (NSUUID)_shadowUpdateIdentifier
{
  return self->_shadowUpdateIdentifier;
}

- (void)_setShadowUpdateIdentifier:(id)a3
{
}

- (_UITableViewPlaceholderContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITableViewPlaceholderContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shadowUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

@end
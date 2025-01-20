@interface _UITableViewDropCoordinatorImpl
- (NSArray)_items;
- (NSArray)items;
- (NSIndexPath)_destinationIndexPath;
- (NSIndexPath)_translatedDestinationIndexPath;
- (NSIndexPath)destinationIndexPath;
- (UIDropSession)_dropSession;
- (UIDropSession)session;
- (UITableViewDropProposal)_dropProposal;
- (UITableViewDropProposal)proposal;
- (_UITableViewDropCoordinatorDelegate)delegate;
- (_UITableViewDropCoordinatorImpl)initWithDelegate:(id)a3 destinationIndexPath:(id)a4 dropProposal:(id)a5 session:(id)a6;
- (id)_sourceIndexPaths;
- (id)dropItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5;
- (id)dropItem:(id)a3 toPlaceholder:(id)a4;
- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7;
- (id)dropItem:(id)a3 toRowAtIndexPath:(id)a4;
- (id)dropItem:(id)a3 toTarget:(id)a4;
- (void)_dropItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5;
- (void)_dropItem:(id)a3 toRowAtIndexPath:(id)a4;
- (void)_dropItem:(id)a3 toTarget:(id)a4;
- (void)_setTranslatedDestinationIndexPath:(id)a3;
- (void)_translateDestinationIndexPath:(id)a3;
- (void)_translateSourceIndexPathsOfDropItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationIndexPath:(id)a3;
- (void)setItems:(id)a3;
- (void)setProposal:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation _UITableViewDropCoordinatorImpl

- (_UITableViewDropCoordinatorImpl)initWithDelegate:(id)a3 destinationIndexPath:(id)a4 dropProposal:(id)a5 session:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)_UITableViewDropCoordinatorImpl;
  v14 = [(_UITableViewDropCoordinatorImpl *)&v39 init];
  v15 = v14;
  if (v14)
  {
    id v31 = a4;
    v32 = v14;
    id v33 = v12;
    id v34 = a5;
    id v35 = v11;
    objc_storeWeak((id *)&v14->_delegate, v10);
    id v36 = v10;
    id v37 = [v10 tableView];
    id v30 = v13;
    v16 = [v13 items];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v16;
    uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v23 = [v22 _privateLocalContext];
          if (v23 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            id v24 = v23;
            id v25 = [v24 tableView];

            if (v25 == v37)
            {
              v26 = [v24 indexPath];
            }
            else
            {
              v26 = 0;
            }
          }
          else
          {
            v26 = 0;
          }
          v27 = [[_UITableViewDropItemImpl alloc] initWithDragItem:v22 sourceIndexPath:v26];
          [(NSArray *)v17 addObject:v27];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v19);
    }

    v15 = v32;
    items = v32->_items;
    v32->_items = v17;

    objc_storeStrong((id *)&v32->_destinationIndexPath, v31);
    objc_storeStrong((id *)&v32->_proposal, v34);
    objc_storeStrong((id *)&v32->_session, a6);

    id v10 = v36;
    id v11 = v35;
    id v12 = v33;
    id v13 = v30;
  }

  return v15;
}

- (NSIndexPath)destinationIndexPath
{
  translatedDestinationIndexPath = self->_translatedDestinationIndexPath;
  if (!translatedDestinationIndexPath) {
    translatedDestinationIndexPath = self->_destinationIndexPath;
  }
  return translatedDestinationIndexPath;
}

- (id)_sourceIndexPaths
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(_UITableViewDropCoordinatorImpl *)self _items];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "sourceIndexPath", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_translateDestinationIndexPath:(id)a3
{
  (*((void (**)(id, NSIndexPath *))a3 + 2))(a3, self->_destinationIndexPath);
  id v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  translatedDestinationIndexPath = self->_translatedDestinationIndexPath;
  self->_translatedDestinationIndexPath = v4;
}

- (void)_translateSourceIndexPathsOfDropItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(_UITableViewDropCoordinatorImpl *)self _items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _translateSourceIndexPath:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)_items
{
  return self->_items;
}

- (NSIndexPath)_destinationIndexPath
{
  return self->_destinationIndexPath;
}

- (UITableViewDropProposal)_dropProposal
{
  return self->_proposal;
}

- (UIDropSession)_dropSession
{
  return self->_session;
}

- (id)dropItem:(id)a3 toPlaceholder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 282, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = NSStringFromSelector(a2);
    [v22 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 283, @"The drag item passed to %@ must be an instance of UIDragItem", v23 object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 284, @"Invalid parameter not satisfying: %@", @"placeholder != nil" object file lineNumber description];

LABEL_5:
  uint64_t v9 = [_UITableViewDropPlaceholderContextImpl alloc];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  long long v12 = [v8 reuseIdentifier];
  [v8 rowHeight];
  double v14 = v13;
  uint64_t v15 = [v8 cellUpdateHandler];
  uint64_t v16 = [(_UITableViewDropPlaceholderContextImpl *)v9 initWithDelegate:WeakRetained dragItem:v7 reuseIdentifier:v12 rowHeight:v15 cellUpdateHandler:v14];

  id v17 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v18 = [v8 insertionIndexPath];
  uint64_t v19 = [v8 previewParametersProvider];
  [v17 insertPlaceholderAtIndexPath:v18 withContext:v16 previewParametersProvider:v19];

  return v16;
}

- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 295, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v14) {
      goto LABEL_5;
    }
LABEL_13:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 297, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_6;
    }
LABEL_14:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 298, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

    goto LABEL_6;
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  id v25 = NSStringFromSelector(a2);
  [v24 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 296, @"The drag item passed to %@ must be an instance of UIDragItem", v25 object file lineNumber description];

  if (!v14) {
    goto LABEL_13;
  }
LABEL_5:
  if (!v15) {
    goto LABEL_14;
  }
LABEL_6:
  if (a6 > 0.0 || a6 == -1.0)
  {
    if (v16) {
      goto LABEL_9;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"_UITableViewDropCoordinator.m" lineNumber:299 description:@"Invalid row height provided for the placeholder row. Value must be greater than zero or UITableViewAutomaticDimension."];

    if (v16) {
      goto LABEL_9;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 300, @"Invalid parameter not satisfying: %@", @"cellUpdateHandler != nil" object file lineNumber description];

LABEL_9:
  id v17 = [_UITableViewDropPlaceholderContextImpl alloc];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v20 = [(_UITableViewDropPlaceholderContextImpl *)v17 initWithDelegate:WeakRetained dragItem:v13 reuseIdentifier:v15 rowHeight:v16 cellUpdateHandler:a6];

  id v21 = objc_loadWeakRetained((id *)p_delegate);
  [v21 insertPlaceholderAtIndexPath:v14 withContext:v20 previewParametersProvider:0];

  return v20;
}

- (id)dropItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  if (!v12)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 317, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 318, @"The drag item passed to %@ must be an instance of UIDragItem", v19 object file lineNumber description];

    if (v13) {
      goto LABEL_5;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 319, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

LABEL_5:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = objc_msgSend(WeakRetained, "animateDragItem:intoRowAtIndexPath:rect:", v12, v13, x, y, width, height);

  return v15;
}

- (id)dropItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 326, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 327, @"The drag item passed to %@ must be an instance of UIDragItem", v14 object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 328, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

LABEL_5:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v10 = [WeakRetained animateDragItem:v7 toRowAtIndexPath:v8];

  return v10;
}

- (void)_dropItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v4 = [(_UITableViewDropCoordinatorImpl *)self dropItem:a3 toRowAtIndexPath:a4];
}

- (id)dropItem:(id)a3 toTarget:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 340, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 341, @"The drag item passed to %@ must be an instance of UIDragItem", v14 object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 342, @"Invalid parameter not satisfying: %@", @"target != nil" object file lineNumber description];

LABEL_5:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v10 = [WeakRetained animateDragItem:v7 toTarget:v8];

  return v10;
}

- (void)_dropItem:(id)a3 toTarget:(id)a4
{
  id v4 = [(_UITableViewDropCoordinatorImpl *)self dropItem:a3 toTarget:a4];
}

- (void)_dropItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v17)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 354, @"Invalid parameter not satisfying: %@", @"dragItem != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 355, @"The drag item passed to %@ must be an instance of UIDragItem", v15 object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_UITableViewDropCoordinator.m", 356, @"Invalid parameter not satisfying: %@", @"cell != nil" object file lineNumber description];

LABEL_5:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = (id)[WeakRetained animateDragItem:v17 toCell:v9 withPreviewParameters:v10];
}

- (_UITableViewDropCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITableViewDropCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void)setDestinationIndexPath:(id)a3
{
}

- (NSIndexPath)_translatedDestinationIndexPath
{
  return self->_translatedDestinationIndexPath;
}

- (void)_setTranslatedDestinationIndexPath:(id)a3
{
}

- (UITableViewDropProposal)proposal
{
  return self->_proposal;
}

- (void)setProposal:(id)a3
{
}

- (UIDropSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_proposal, 0);
  objc_storeStrong((id *)&self->_translatedDestinationIndexPath, 0);
  objc_storeStrong((id *)&self->_destinationIndexPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
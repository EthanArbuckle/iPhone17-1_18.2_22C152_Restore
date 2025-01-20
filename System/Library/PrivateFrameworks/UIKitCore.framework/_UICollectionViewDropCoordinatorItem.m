@interface _UICollectionViewDropCoordinatorItem
- (BOOL)shouldRemainInHierarchy;
- (NSIndexPath)destinationIndexPath;
- (NSString)description;
- (UIDragItem)dragItem;
- (UIDragPreviewTarget)target;
- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4;
- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4 placeholderConfiguration:(id)a5;
- (_UICollectionViewDropCoordinatorItem)initWithDragItem:(id)a3 target:(id)a4;
- (_UIDropAnimationHandlers)animationHandlers;
- (id)previewParametersProvider;
- (int)kind;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setAnimationHandlers:(id)a3;
- (void)setDestinationIndexPath:(id)a3;
- (void)setDragItem:(id)a3;
- (void)setKind:(int)a3;
- (void)setPreviewParametersProvider:(id)a3;
- (void)setShouldRemainInHierarchy:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation _UICollectionViewDropCoordinatorItem

- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  v9 = [(_UICollectionViewDropCoordinatorItem *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_kind = 0;
    objc_storeStrong((id *)&v9->_destinationIndexPath, a3);
    objc_storeWeak((id *)&v10->_dragItem, v8);
    v11 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_dragItem);
    [WeakRetained _visibleDropItemSize];
    double v14 = v13;
    double v16 = v15;

    BOOL v17 = v14 != *MEMORY[0x1E4F1DB30];
    if (v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v17 = 1;
    }
    v11->_shouldRemainInHierarchy = v17;
    v18 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v11->_animationHandlers;
    v11->_animationHandlers = v18;
  }
  return v10;
}

- (_UICollectionViewDropCoordinatorItem)initWithDragItem:(id)a3 target:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  id v8 = [(_UICollectionViewDropCoordinatorItem *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_kind = 1;
    uint64_t v10 = [v7 copy];
    target = v9->_target;
    v9->_target = (UIDragPreviewTarget *)v10;

    objc_storeWeak((id *)&v9->_dragItem, v6);
    v12 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_dragItem);
    [WeakRetained _visibleDropItemSize];
    double v15 = v14;
    double v17 = v16;

    BOOL v18 = v15 != *MEMORY[0x1E4F1DB30];
    if (v17 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v18 = 1;
    }
    v12->_shouldRemainInHierarchy = v18;
    v19 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v12->_animationHandlers;
    v12->_animationHandlers = v19;
  }
  return v9;
}

- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4 placeholderConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  v12 = [(_UICollectionViewDropCoordinatorItem *)&v27 init];
  double v13 = v12;
  if (v12)
  {
    v12->_kind = 2;
    double v14 = [v11 previewParametersProvider];
    uint64_t v15 = [v14 copy];
    id previewParametersProvider = v13->_previewParametersProvider;
    v13->_id previewParametersProvider = (id)v15;

    objc_storeWeak((id *)&v13->_dragItem, v10);
    objc_storeStrong((id *)&v13->_destinationIndexPath, a3);
    double v17 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_dragItem);
    [WeakRetained _visibleDropItemSize];
    double v20 = v19;
    double v22 = v21;

    BOOL v23 = v20 != *MEMORY[0x1E4F1DB30];
    if (v22 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v23 = 1;
    }
    v17->_shouldRemainInHierarchy = v23;
    v24 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v17->_animationHandlers;
    v17->_animationHandlers = v24;
  }
  return v13;
}

- (NSString)description
{
  uint64_t kind = self->_kind;
  if (kind > 2) {
    v4 = &stru_1ED0E84C0;
  }
  else {
    v4 = off_1E52E66A8[kind];
  }
  v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragItem);
  id v9 = __UICVIndexPathDescription(self->_destinationIndexPath);
  id v10 = [(_UICollectionViewDropCoordinatorItem *)self target];
  [v10 center];
  id v11 = NSStringFromCGPoint(v16);
  v12 = [NSNumber numberWithBool:self->_shouldRemainInHierarchy];
  objc_msgSend(v5, "stringWithFormat:", @"<%@: uint64_t kind = %@; dragItem = %@; destinationIndexPath = %@ location = %@; shouldRemainInHierarchy = %@>",
    v7,
    v4,
    WeakRetained,
    v9,
    v11,
  double v13 = v12);

  return (NSString *)v13;
}

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewDropCoordinatorItem *)self animationHandlers];
  [v5 addAnimations:v4];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewDropCoordinatorItem *)self animationHandlers];
  [v5 addCompletion:v4];
}

- (NSIndexPath)destinationIndexPath
{
  return self->_destinationIndexPath;
}

- (void)setDestinationIndexPath:(id)a3
{
}

- (BOOL)shouldRemainInHierarchy
{
  return self->_shouldRemainInHierarchy;
}

- (void)setShouldRemainInHierarchy:(BOOL)a3
{
  self->_shouldRemainInHierarchy = a3;
}

- (UIDragItem)dragItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragItem);
  return (UIDragItem *)WeakRetained;
}

- (void)setDragItem:(id)a3
{
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_uint64_t kind = a3;
}

- (UIDragPreviewTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (_UIDropAnimationHandlers)animationHandlers
{
  return self->_animationHandlers;
}

- (void)setAnimationHandlers:(id)a3
{
}

- (id)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewParametersProvider, 0);
  objc_storeStrong((id *)&self->_animationHandlers, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_dragItem);
  objc_storeStrong((id *)&self->_destinationIndexPath, 0);
}

@end
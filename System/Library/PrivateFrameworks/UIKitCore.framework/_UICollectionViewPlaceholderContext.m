@interface _UICollectionViewPlaceholderContext
- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3;
- (BOOL)deletePlaceholder;
- (NSString)description;
- (UIDragItem)dragItem;
- (_UICollectionViewPlaceholderContextDelegate)delegate;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setAnimationHandlers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragItem:(id)a3;
- (void)setNeedsCellUpdate;
@end

@implementation _UICollectionViewPlaceholderContext

- (BOOL)deletePlaceholder
{
  v2 = self;
  v3 = [(_UICollectionViewPlaceholderContext *)self delegate];
  v4 = [v3 placeholderContextDidDismiss:v2];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(_UICollectionViewPlaceholderContext *)self delegate];
  LOBYTE(self) = [v5 placeholderContext:self didCommitInsertionWithDataSourceUpdates:v4];

  return (char)self;
}

- (void)setNeedsCellUpdate
{
  id v3 = [(_UICollectionViewPlaceholderContext *)self delegate];
  [v3 placeholderContextNeedsCellUpdate:self];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_originalInsertionIndexPath;
    reuseIdentifier = self->_reuseIdentifier;
  }
  else
  {
    v6 = 0;
    reuseIdentifier = 0;
  }
  v8 = [v3 stringWithFormat:@"<%@:%p insertionIndexPath=%@ reuseIdentifier=%@>", v5, self, v6, reuseIdentifier];

  return (NSString *)v8;
}

- (void)addAnimations:(id)a3
{
  if (self) {
    self = (_UICollectionViewPlaceholderContext *)self->_animationHandlers;
  }
  [(_UICollectionViewPlaceholderContext *)self addAnimations:a3];
}

- (void)addCompletion:(id)a3
{
  if (self) {
    self = (_UICollectionViewPlaceholderContext *)self->_animationHandlers;
  }
  [(_UICollectionViewPlaceholderContext *)self addCompletion:a3];
}

- (void)setAnimationHandlers:(id)a3
{
}

- (_UICollectionViewPlaceholderContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UICollectionViewPlaceholderContextDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_animationHandlers, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
  objc_storeStrong((id *)&self->_originalInsertionIndexPath, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_shadowUpdateIdentifier, 0);
}

@end
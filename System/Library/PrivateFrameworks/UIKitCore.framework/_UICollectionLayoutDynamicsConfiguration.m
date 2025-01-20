@interface _UICollectionLayoutDynamicsConfiguration
- (CGRect)currentVisibleBounds;
- (CGRect)previousVisibleBounds;
- (NSArray)dynamicItems;
- (NSMutableDictionary)behaviorDict;
- (_UICollectionLayoutDynamicsConfiguration)init;
- (id)_dirtyItems;
- (id)behaviorsForItem:(id)a3;
- (void)_reset;
- (void)_setBehaviors:(id)a3 forItem:(id)a4;
- (void)setBehaviorDict:(id)a3;
- (void)setBehaviors:(id)a3 forItem:(id)a4;
- (void)setCurrentVisibleBounds:(CGRect)a3;
- (void)setDynamicItems:(id)a3;
- (void)setPreviousVisibleBounds:(CGRect)a3;
@end

@implementation _UICollectionLayoutDynamicsConfiguration

- (_UICollectionLayoutDynamicsConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionLayoutDynamicsConfiguration;
  v2 = [(_UICollectionLayoutDynamicsConfiguration *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    behaviorDict = v2->_behaviorDict;
    v2->_behaviorDict = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dirtyItems = v2->_dirtyItems;
    v2->_dirtyItems = v5;
  }
  return v2;
}

- (id)behaviorsForItem:(id)a3
{
  if (a3)
  {
    uint64_t v5 = *((void *)a3 + 2);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutHelpers.m", 1212, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

    uint64_t v5 = 0;
  }
  v6 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v5);
  v7 = [(_UICollectionLayoutDynamicsConfiguration *)self behaviorDict];
  objc_super v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)setBehaviors:(id)a3 forItem:(id)a4
{
  if (!a4)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UICollectionLayoutHelpers.m", 1220, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  [(NSMutableArray *)self->_dirtyItems addObject:a4];
  [(_UICollectionLayoutDynamicsConfiguration *)self _setBehaviors:a3 forItem:a4];
}

- (NSArray)dynamicItems
{
  return self->_items;
}

- (void)setDynamicItems:(id)a3
{
}

- (void)_setBehaviors:(id)a3 forItem:(id)a4
{
  if (a4)
  {
    uint64_t v6 = *((void *)a4 + 2);
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UICollectionLayoutHelpers.m", 1236, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

    uint64_t v6 = 0;
  }
  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  v7 = [(_UICollectionLayoutDynamicsConfiguration *)self behaviorDict];
  [v7 setObject:a3 forKeyedSubscript:v10];
}

- (void)_reset
{
  [(NSMutableArray *)self->_dirtyItems removeAllObjects];
  v3 = [(_UICollectionLayoutDynamicsConfiguration *)self behaviorDict];
  [v3 removeAllObjects];

  items = self->_items;
  self->_items = (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)_dirtyItems
{
  return self->_dirtyItems;
}

- (CGRect)previousVisibleBounds
{
  double x = self->_previousVisibleBounds.origin.x;
  double y = self->_previousVisibleBounds.origin.y;
  double width = self->_previousVisibleBounds.size.width;
  double height = self->_previousVisibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousVisibleBounds:(CGRect)a3
{
  self->_previousVisibleBounds = a3;
}

- (CGRect)currentVisibleBounds
{
  double x = self->_currentVisibleBounds.origin.x;
  double y = self->_currentVisibleBounds.origin.y;
  double width = self->_currentVisibleBounds.size.width;
  double height = self->_currentVisibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentVisibleBounds:(CGRect)a3
{
  self->_currentVisibleBounds = a3;
}

- (NSMutableDictionary)behaviorDict
{
  return self->_behaviorDict;
}

- (void)setBehaviorDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorDict, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dirtyItems, 0);
}

@end
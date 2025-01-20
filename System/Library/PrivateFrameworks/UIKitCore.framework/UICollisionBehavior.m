@interface UICollisionBehavior
+ (BOOL)_isPrimitiveBehavior;
- (BOOL)translatesReferenceBoundsIntoBoundary;
- (NSArray)boundaryIdentifiers;
- (NSArray)items;
- (UIBezierPath)boundaryWithIdentifier:(id)identifier;
- (UICollisionBehavior)init;
- (UICollisionBehavior)initWithItems:(NSArray *)items;
- (UICollisionBehaviorMode)collisionMode;
- (id)collisionDelegate;
- (id)description;
- (void)_addCollisionItem:(id)a3;
- (void)_applySettings;
- (void)_associate;
- (void)_didBeginContact:(id)a3;
- (void)_didEndContact:(id)a3;
- (void)_dissociate;
- (void)_reevaluate:(unint64_t)a3;
- (void)_registerBodyForIdentifier:(id)a3 path:(id)a4;
- (void)_registerBoundaryForIdentifier:(id)a3 path:(id)a4;
- (void)_removeExplicitBoundaryBodies;
- (void)_removeExplicitBoundaryPaths;
- (void)_removeImplicitBoundaries;
- (void)_setCollisions:(BOOL)a3 forBody:(id)a4 isEdge:(BOOL)a5;
- (void)_setTranslatesReferenceItemBounds:(BOOL)a3 intoBoundaryWithInsets:(UIEdgeInsets)a4;
- (void)_setupExplicitBoundaries;
- (void)_setupImplicitBoundaries;
- (void)addBoundaryWithIdentifier:(id)identifier forPath:(UIBezierPath *)bezierPath;
- (void)addBoundaryWithIdentifier:(id)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
- (void)addItem:(id)item;
- (void)removeAllBoundaries;
- (void)removeBoundaryWithIdentifier:(id)identifier;
- (void)removeItem:(id)item;
- (void)setCollisionDelegate:(id)collisionDelegate;
- (void)setCollisionMode:(UICollisionBehaviorMode)collisionMode;
- (void)setTranslatesReferenceBoundsIntoBoundary:(BOOL)translatesReferenceBoundsIntoBoundary;
- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(UIEdgeInsets)insets;
@end

@implementation UICollisionBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UICollisionBehavior)init
{
  return [(UICollisionBehavior *)self initWithItems:MEMORY[0x1E4F1CBF0]];
}

- (UICollisionBehavior)initWithItems:(NSArray *)items
{
  v4 = items;
  v8.receiver = self;
  v8.super_class = (Class)UICollisionBehavior;
  v5 = [(UIDynamicBehavior *)&v8 init];
  if (v5)
  {
    v6 = (void *)[(NSArray *)v4 mutableCopy];
    [(UIDynamicBehavior *)v5 _setItems:v6];

    v5->_collisionMode = -1;
  }

  return v5;
}

- (NSArray)items
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIDynamicBehavior *)self _items];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (void)_addCollisionItem:(id)a3
{
  id v4 = a3;
  v5 = [(UIDynamicBehavior *)self _context];
  id v6 = [v5 _registerBodyForItem:v4];

  [(UICollisionBehavior *)self _setCollisions:1 forBody:v6 isEdge:0];
}

- (void)addItem:(id)item
{
  id v7 = item;
  id v4 = [(UIDynamicBehavior *)self _items];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    [(UIDynamicBehavior *)self _addItem:v7];
    id v6 = [(UIDynamicBehavior *)self _context];

    if (v6) {
      [(UICollisionBehavior *)self _addCollisionItem:v7];
    }
  }
}

- (void)removeItem:(id)item
{
  id v4 = item;
  char v5 = [(UIDynamicBehavior *)self _items];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(UIDynamicBehavior *)self _context];

    if (v7)
    {
      objc_super v8 = [(UIDynamicBehavior *)self _context];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __34__UICollisionBehavior_removeItem___block_invoke;
      v9[3] = &unk_1E52EC598;
      v9[4] = self;
      [v8 _unregisterBodyForItem:v4 action:v9];
    }
    [(UIDynamicBehavior *)self _removeItem:v4];
  }
}

uint64_t __34__UICollisionBehavior_removeItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setCollisions:0 forBody:a2 isEdge:0];
}

- (void)_applySettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(UIDynamicBehavior *)self _items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(UICollisionBehavior *)self _addCollisionItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (UICollisionBehaviorMode)collisionMode
{
  return self->_collisionMode;
}

- (void)setCollisionMode:(UICollisionBehaviorMode)collisionMode
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_collisionMode != collisionMode)
  {
    self->_collisionMode = collisionMode;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [(UIDynamicBehavior *)self _items];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v10 = [(UIDynamicBehavior *)self _context];
          long long v11 = [v10 _bodyForItem:v9];

          [(UICollisionBehavior *)self _setCollisions:1 forBody:v11 isEdge:0];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    [(UICollisionBehavior *)self _setCollisions:1 forBody:self->_implicitBoundsBody isEdge:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v12 = self->_boundaryBodies;
    uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = -[NSMutableDictionary objectForKey:](self->_boundaryBodies, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
          [(UICollisionBehavior *)self _setCollisions:0 forBody:v17 isEdge:0];
        }
        uint64_t v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (void)_setCollisions:(BOOL)a3 forBody:(id)a4 isEdge:(BOOL)a5
{
  if (!a4) {
    return;
  }
  BOOL v5 = a3;
  uint64_t v7 = 4;
  if (a5) {
    uint64_t v7 = 3;
  }
  int v8 = *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___UICollisionBehavior__collisionMode[v7]);
  id v14 = a4;
  UICollisionBehaviorMode v9 = [(UICollisionBehavior *)self collisionMode];
  if (v9 == 1)
  {
    uint64_t v10 = 128;
  }
  else
  {
    if (v9 != 2)
    {
      unsigned int v11 = self->_groupBID | self->_groupVID;
      goto LABEL_11;
    }
    uint64_t v10 = 132;
  }
  unsigned int v11 = *(_DWORD *)((char *)&self->super.super.isa + v10);
LABEL_11:
  uint64_t v12 = [v14 collisionBitMask] & ~(self->_groupBID | self->_groupVID);
  if (v5)
  {
    uint64_t v12 = v12 | v11;
    [v14 setCollisionBitMask:v12];
    uint64_t v13 = [v14 categoryBitMask] & ~(self->_groupBID | self->_groupVID) | v8;
  }
  else
  {
    [v14 setCollisionBitMask:v12];
    uint64_t v13 = [v14 categoryBitMask] & ~(self->_groupBID | self->_groupVID);
  }
  [v14 setCategoryBitMask:v13];
  [v14 setContactTestBitMask:v12];
  [(UIDynamicBehavior *)self _changedParameterForBody:v14];
}

- (void)_didBeginContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 bodyA];
  uint64_t v6 = [v4 bodyB];
  uint64_t v7 = [(PKExtendedPhysicsBody *)v5 representedObject];
  uint64_t v8 = [(PKExtendedPhysicsBody *)v6 representedObject];
  UICollisionBehaviorMode v9 = [(UIDynamicBehavior *)self _items];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  unsigned int v11 = [(UIDynamicBehavior *)self _items];
  char v12 = [v11 containsObject:v8];

  if ((v12 & 1) == 0)
  {

    uint64_t v8 = 0;
  }
  if (v7 | v8)
  {
    if (v7 && v8 && (*(unsigned char *)&self->_collisionBehaviorFlags & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
      [v4 contactPoint];
      objc_msgSend(WeakRetained, "collisionBehavior:beganContactForItem:withItem:atPoint:", self, v7, v8);
    }
    else
    {
      implicitBoundsBody = self->_implicitBoundsBody;
      if (v5 == implicitBoundsBody)
      {
        if ((*(unsigned char *)&self->_collisionBehaviorFlags & 4) == 0 || !v8) {
          goto LABEL_22;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
        [v4 contactPoint];
        v16 = WeakRetained;
        v17 = self;
        uint64_t v18 = v8;
      }
      else
      {
        if (v6 != implicitBoundsBody)
        {
          if ((*(unsigned char *)&self->_collisionBehaviorFlags & 4) != 0)
          {
            boundaryBodies = self->_boundaryBodies;
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __40__UICollisionBehavior__didBeginContact___block_invoke;
            v19[3] = &unk_1E52EC5C0;
            long long v20 = v5;
            long long v21 = self;
            id v22 = (id)v8;
            id v23 = v4;
            long long v24 = v6;
            id v25 = (id)v7;
            [(NSMutableDictionary *)boundaryBodies enumerateKeysAndObjectsUsingBlock:v19];
          }
          goto LABEL_22;
        }
        if (!v7 || (*(unsigned char *)&self->_collisionBehaviorFlags & 4) == 0) {
          goto LABEL_22;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
        [v4 contactPoint];
        v16 = WeakRetained;
        v17 = self;
        uint64_t v18 = v7;
      }
      objc_msgSend(v16, "collisionBehavior:beganContactForItem:withBoundaryIdentifier:atPoint:", v17, v18, 0);
    }
  }
LABEL_22:
}

void __40__UICollisionBehavior__didBeginContact___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (*(id *)(a1 + 32) == v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 120));
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
  }
  else
  {
    if (*(id *)(a1 + 64) != v7) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 120));
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 72);
  }
  [*(id *)(a1 + 56) contactPoint];
  objc_msgSend(WeakRetained, "collisionBehavior:beganContactForItem:withBoundaryIdentifier:atPoint:", v10, v11, v12);

  *a4 = 1;
LABEL_6:
}

- (id)collisionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
  return WeakRetained;
}

- (void)setCollisionDelegate:(id)collisionDelegate
{
  p_collisionDelegate = &self->_collisionDelegate;
  id v5 = collisionDelegate;
  objc_storeWeak((id *)p_collisionDelegate, v5);
  *(unsigned char *)&self->_collisionBehaviorFlags = *(unsigned char *)&self->_collisionBehaviorFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_collisionBehaviorFlags = *(unsigned char *)&self->_collisionBehaviorFlags & 0xFD | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_collisionBehaviorFlags = *(unsigned char *)&self->_collisionBehaviorFlags & 0xFB | v7;
  char v8 = objc_opt_respondsToSelector();

  if (v8) {
    char v9 = 8;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_collisionBehaviorFlags = *(unsigned char *)&self->_collisionBehaviorFlags & 0xF7 | v9;
}

- (void)_didEndContact:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bodyA];
  char v6 = [v4 bodyB];

  uint64_t v7 = [(PKExtendedPhysicsBody *)v5 representedObject];
  uint64_t v8 = [(PKExtendedPhysicsBody *)v6 representedObject];
  char v9 = [(UIDynamicBehavior *)self _items];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  uint64_t v11 = [(UIDynamicBehavior *)self _items];
  char v12 = [v11 containsObject:v8];

  if ((v12 & 1) == 0)
  {

    uint64_t v8 = 0;
  }
  if (!(v7 | v8)) {
    goto LABEL_21;
  }
  if (v7 && v8)
  {
    if ((*(unsigned char *)&self->_collisionBehaviorFlags & 2) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
      [WeakRetained collisionBehavior:self endedContactForItem:v7 withItem:v8];
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  implicitBoundsBody = self->_implicitBoundsBody;
  if (v5 == implicitBoundsBody)
  {
    if ((*(unsigned char *)&self->_collisionBehaviorFlags & 8) == 0 || !v8) {
      goto LABEL_21;
    }
    id v16 = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    id WeakRetained = v16;
    v17 = self;
    uint64_t v18 = v8;
LABEL_19:
    [v16 collisionBehavior:v17 endedContactForItem:v18 withBoundaryIdentifier:0];
    goto LABEL_20;
  }
  if (v6 != implicitBoundsBody)
  {
    boundaryBodies = self->_boundaryBodies;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __38__UICollisionBehavior__didEndContact___block_invoke;
    v19[3] = &unk_1E52EC5E8;
    long long v20 = v5;
    long long v21 = self;
    id v22 = (id)v8;
    id v23 = v6;
    id v24 = (id)v7;
    [(NSMutableDictionary *)boundaryBodies enumerateKeysAndObjectsUsingBlock:v19];

    goto LABEL_21;
  }
  if (v7 && (*(unsigned char *)&self->_collisionBehaviorFlags & 8) != 0)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    id WeakRetained = v16;
    v17 = self;
    uint64_t v18 = v7;
    goto LABEL_19;
  }
LABEL_21:
}

void __38__UICollisionBehavior__didEndContact___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if ((id)a1[4] == v7)
  {
    uint64_t v14 = a1[5];
    if ((*(unsigned char *)(v14 + 136) & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v14 + 120));
      uint64_t v11 = WeakRetained;
      uint64_t v12 = a1[5];
      uint64_t v13 = a1[6];
      goto LABEL_7;
    }
  }
  else
  {
    if ((id)a1[7] != v7) {
      goto LABEL_9;
    }
    uint64_t v9 = a1[5];
    if ((*(unsigned char *)(v9 + 136) & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v9 + 120));
      uint64_t v11 = WeakRetained;
      uint64_t v12 = a1[5];
      uint64_t v13 = a1[8];
LABEL_7:
      [WeakRetained collisionBehavior:v12 endedContactForItem:v13 withBoundaryIdentifier:v15];
    }
  }
  *a4 = 1;
LABEL_9:
}

- (void)_reevaluate:(unint64_t)a3
{
  if (a3 == 1) {
    [(UICollisionBehavior *)self _setupImplicitBoundaries];
  }
}

- (void)_associate
{
  v3 = [(UIDynamicBehavior *)self _context];
  char v4 = [v3 _registerCollisionGroup];

  if (self->_usesImplicitBounds)
  {
    id v5 = [(UIDynamicBehavior *)self _context];
    [v5 _registerImplicitBounds];
  }
  self->_groupVID = 1 << (2 * v4);
  self->_groupBID = 1 << ((2 * v4) | 1);
  [(UICollisionBehavior *)self _applySettings];
  [(UICollisionBehavior *)self _setupImplicitBoundaries];
  [(UICollisionBehavior *)self _setupExplicitBoundaries];
}

- (void)_dissociate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(UIDynamicBehavior *)self _context];
  [v3 _unregisterCollisionGroup];

  if (self->_usesImplicitBounds)
  {
    char v4 = [(UIDynamicBehavior *)self _context];
    [v4 _unregisterImplicitBounds];
  }
  [(UICollisionBehavior *)self _removeImplicitBoundaries];
  [(UICollisionBehavior *)self _removeExplicitBoundaryBodies];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(UIDynamicBehavior *)self _items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [(UIDynamicBehavior *)self _context];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __34__UICollisionBehavior__dissociate__block_invoke;
        v12[3] = &unk_1E52EC598;
        v12[4] = self;
        [v11 _unregisterBodyForItem:v10 action:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __34__UICollisionBehavior__dissociate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setCollisions:0 forBody:a2 isEdge:0];
}

- (void)setTranslatesReferenceBoundsIntoBoundary:(BOOL)translatesReferenceBoundsIntoBoundary
{
}

- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(UIEdgeInsets)insets
{
}

- (void)_setTranslatesReferenceItemBounds:(BOOL)a3 intoBoundaryWithInsets:(UIEdgeInsets)a4
{
  BOOL v4 = a3;
  if (a3)
  {
    self->_usesImplicitBounds = 1;
    self->_implicitBoundsInsets = a4;
  }
  else
  {
    self->_usesImplicitBounds = 0;
    *(_OWORD *)&self->_implicitBoundsInsets.top = 0u;
    *(_OWORD *)&self->_implicitBoundsInsets.bottom = 0u;
  }
  uint64_t v6 = [(UIDynamicBehavior *)self _context];

  if (v6)
  {
    uint64_t v7 = [(UIDynamicBehavior *)self _context];
    uint64_t v8 = v7;
    if (v4) {
      [v7 _registerImplicitBounds];
    }
    else {
      [v7 _unregisterImplicitBounds];
    }

    [(UICollisionBehavior *)self _setupImplicitBoundaries];
  }
}

- (BOOL)translatesReferenceBoundsIntoBoundary
{
  return self->_usesImplicitBounds;
}

- (void)_removeImplicitBoundaries
{
  if (self->_implicitBoundsBody)
  {
    v3 = [(UIDynamicBehavior *)self _context];
    BOOL v4 = [v3 _world];
    [v4 removeBody:self->_implicitBoundsBody];

    implicitBoundsBody = self->_implicitBoundsBody;
    self->_implicitBoundsBody = 0;
  }
}

- (void)_setupImplicitBoundaries
{
  v3 = [(UIDynamicBehavior *)self _context];
  [v3 _referenceSystemBounds];
  BOOL v4 = CGRectEqualToRect(v25, *MEMORY[0x1E4F1DB20]);

  if (!v4)
  {
    [(UICollisionBehavior *)self _removeImplicitBoundaries];
    if (self->_usesImplicitBounds)
    {
      id v5 = [(UIDynamicBehavior *)self _context];
      [v5 _referenceSystemBounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      double top = self->_implicitBoundsInsets.top;
      double left = self->_implicitBoundsInsets.left;
      double v16 = v9 + top;
      double v17 = v11 - (left + self->_implicitBoundsInsets.right);
      double v18 = v13 - (top + self->_implicitBoundsInsets.bottom);
      v26.origin.x = v7 + left + -1.0;
      v26.origin.y = v16 + -1.0;
      v26.size.width = v17 + 2.0;
      v26.size.height = v18 + 2.0;
      long long v19 = CGPathCreateWithRect(v26, 0);
      long long v20 = +[PKExtendedPhysicsBody bodyWithEdgeLoopFromPath:v19];
      implicitBoundsBody = self->_implicitBoundsBody;
      self->_implicitBoundsBody = v20;

      [(PKExtendedPhysicsBody *)self->_implicitBoundsBody setAffectedByGravity:0];
      [(PKExtendedPhysicsBody *)self->_implicitBoundsBody setDynamic:0];
      [(UICollisionBehavior *)self _setCollisions:1 forBody:self->_implicitBoundsBody isEdge:1];
      id v22 = [(UIDynamicBehavior *)self _context];
      id v23 = [v22 _world];
      [v23 addBody:self->_implicitBoundsBody];

      CGPathRelease(v19);
      [(UIDynamicBehavior *)self _changedParameterForBody:0];
    }
  }
}

- (void)addBoundaryWithIdentifier:(id)identifier forPath:(UIBezierPath *)bezierPath
{
  if (identifier)
  {
    if (bezierPath) {
      -[UICollisionBehavior _registerBoundaryForIdentifier:path:](self, "_registerBoundaryForIdentifier:path:");
    }
  }
}

- (void)addBoundaryWithIdentifier:(id)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (identifier)
  {
    double y = p2.y;
    double x = p2.x;
    double v7 = p1.y;
    double v8 = p1.x;
    double v10 = (void *)MEMORY[0x1E4F29238];
    id v11 = identifier;
    double v12 = objc_msgSend(v10, "valueWithCGPoint:", v8, v7);
    v15[0] = v12;
    double v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    v15[1] = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(UICollisionBehavior *)self _registerBoundaryForIdentifier:v11 path:v14];
  }
}

- (void)_registerBoundaryForIdentifier:(id)a3 path:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  boundaryPaths = self->_boundaryPaths;
  if (!boundaryPaths)
  {
    double v8 = (NSMutableDictionary *)objc_opt_new();
    double v9 = self->_boundaryPaths;
    self->_boundaryPaths = v8;

    boundaryPaths = self->_boundaryPaths;
  }
  [(NSMutableDictionary *)boundaryPaths setObject:v6 forKey:v10];
  [(UICollisionBehavior *)self _registerBodyForIdentifier:v10 path:v6];
}

- (void)_registerBodyForIdentifier:(id)a3 path:(id)a4
{
  id v24 = a3;
  id v7 = a4;
  double v8 = [(UIDynamicBehavior *)self _context];

  if (!v8) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v7 firstObject];
      [v10 CGPointValue];
      double v12 = v11;
      double v14 = v13;
      long long v15 = [v7 lastObject];
      [v15 CGPointValue];
      double v9 = +[PKExtendedPhysicsBody bodyWithEdgeFromPoint:toPoint:](PKExtendedPhysicsBody, "bodyWithEdgeFromPoint:toPoint:", v12, v14, v16, v17);

      if (v9) {
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
  double v9 = +[PKExtendedPhysicsBody bodyWithEdgeLoopFromPath:](PKExtendedPhysicsBody, "bodyWithEdgeLoopFromPath:", [v7 CGPath]);
  if (!v9)
  {
LABEL_7:
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UICollisionBehavior.m" lineNumber:368 description:@"invalid path for collision boundary"];

    double v9 = 0;
  }
LABEL_8:
  if (!self->_boundaryBodies)
  {
    long long v19 = (NSMutableDictionary *)objc_opt_new();
    boundaryBodies = self->_boundaryBodies;
    self->_boundaryBodies = v19;
  }
  long long v21 = [v9 representedObject];

  if (!v21) {
    [v9 setRepresentedObject:self];
  }
  [(NSMutableDictionary *)self->_boundaryBodies setObject:v9 forKey:v24];
  [v9 setAffectedByGravity:0];
  [v9 setDynamic:0];
  id v22 = [(UIDynamicBehavior *)self _context];
  id v23 = [v22 _world];
  [v23 addBody:v9];

  [(UICollisionBehavior *)self _setCollisions:1 forBody:v9 isEdge:1];
  [(UIDynamicBehavior *)self _changedParameterForBody:0];

LABEL_13:
}

- (UIBezierPath)boundaryWithIdentifier:(id)identifier
{
  id v5 = [(NSMutableDictionary *)self->_boundaryPaths objectForKey:identifier];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"UICollisionBehavior.m" lineNumber:397 description:0];
      }
      id v7 = v5;
      id v6 = +[UIBezierPath bezierPath];
      double v8 = [v7 objectAtIndex:0];
      [v8 CGPointValue];
      objc_msgSend(v6, "moveToPoint:");

      double v9 = [v7 objectAtIndex:1];

      [v9 CGPointValue];
      objc_msgSend(v6, "addLineToPoint:");
    }
  }
  else
  {
    id v6 = 0;
  }

  return (UIBezierPath *)v6;
}

- (void)removeBoundaryWithIdentifier:(id)identifier
{
  id v4 = identifier;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(NSMutableDictionary *)self->_boundaryBodies objectForKey:v4];
    if (v5)
    {
      [(UICollisionBehavior *)self _setCollisions:0 forBody:v5 isEdge:1];
      id v6 = [(UIDynamicBehavior *)self _context];
      id v7 = [v6 _world];
      [v7 removeBody:v5];

      [(NSMutableDictionary *)self->_boundaryBodies removeObjectForKey:v8];
    }
    [(NSMutableDictionary *)self->_boundaryPaths removeObjectForKey:v8];
    [(UIDynamicBehavior *)self _changedParameterForBody:0];

    id v4 = v8;
  }
}

- (NSArray)boundaryIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_boundaryPaths allKeys];
}

- (void)removeAllBoundaries
{
  [(UICollisionBehavior *)self _removeExplicitBoundaryBodies];
  [(UICollisionBehavior *)self _removeExplicitBoundaryPaths];
}

- (void)_setupExplicitBoundaries
{
  boundaryPaths = self->_boundaryPaths;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__UICollisionBehavior__setupExplicitBoundaries__block_invoke;
  v3[3] = &unk_1E52EC610;
  v3[4] = self;
  [(NSMutableDictionary *)boundaryPaths enumerateKeysAndObjectsUsingBlock:v3];
}

void __47__UICollisionBehavior__setupExplicitBoundaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:v7];

  if (!v6) {
    [*(id *)(a1 + 32) _registerBodyForIdentifier:v7 path:v5];
  }
}

- (void)_removeExplicitBoundaryBodies
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_boundaryBodies;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKey:](self->_boundaryBodies, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v7), (void)v12);
        [(UICollisionBehavior *)self _setCollisions:0 forBody:v8 isEdge:0];
        double v9 = [(UIDynamicBehavior *)self _context];
        id v10 = [v9 _world];
        [v10 removeBody:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  boundaryBodies = self->_boundaryBodies;
  self->_boundaryBodies = 0;

  [(UIDynamicBehavior *)self _changedParameterForBody:0];
}

- (void)_removeExplicitBoundaryPaths
{
  boundaryPaths = self->_boundaryPaths;
  self->_boundaryPaths = 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)UICollisionBehavior;
  uint64_t v4 = [(UIDynamicBehavior *)&v16 description];
  uint64_t v5 = [v3 stringWithString:v4];

  UICollisionBehaviorMode v6 = [(UICollisionBehavior *)self collisionMode];
  uint64_t v7 = @" (All) ";
  if (v6 == 1) {
    uint64_t v7 = @" (Items) ";
  }
  if (v6 == 2) {
    id v8 = @" (Boundaries) ";
  }
  else {
    id v8 = v7;
  }
  [v5 appendString:v8];
  if ([(UICollisionBehavior *)self translatesReferenceBoundsIntoBoundary])
  {
    CGFloat top = self->_implicitBoundsInsets.top;
    double left = self->_implicitBoundsInsets.left;
    double bottom = self->_implicitBoundsInsets.bottom;
    double right = self->_implicitBoundsInsets.right;
    if (left == 0.0 && top == 0.0 && right == 0.0 && bottom == 0.0)
    {
      [v5 appendString:@"(Reference Bounds) "];
    }
    else
    {
      long long v13 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)&top);
      [v5 appendFormat:@"(Reference Bounds + %@) ", v13];
    }
  }
  else
  {
    [v5 appendFormat:@"(%@) ", self->_boundaryPaths];
  }
  long long v14 = [(UIDynamicBehavior *)self _itemsDescription];
  [v5 appendString:v14];

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collisionDelegate);
  objc_storeStrong((id *)&self->_boundaryPaths, 0);
  objc_storeStrong((id *)&self->_boundaryBodies, 0);
  objc_storeStrong((id *)&self->_implicitBoundsBody, 0);
}

@end
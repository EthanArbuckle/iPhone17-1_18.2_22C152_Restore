@interface UIGravityBehavior
+ (BOOL)_isPrimitiveBehavior;
- (CGFloat)angle;
- (CGFloat)magnitude;
- (CGPoint)denormalizedGravity;
- (CGPoint)gravity;
- (CGVector)gravityDirection;
- (NSArray)items;
- (UIGravityBehavior)init;
- (UIGravityBehavior)initWithItems:(NSArray *)items;
- (double)yComponent;
- (id)description;
- (void)_addGravityItem:(id)a3;
- (void)_associate;
- (void)_dissociate;
- (void)_setAngle:(double)a3 magnitude:(double)a4;
- (void)addItem:(id)item;
- (void)removeItem:(id)item;
- (void)setAngle:(CGFloat)angle;
- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;
- (void)setGravity:(CGPoint)a3;
- (void)setMagnitude:(CGFloat)magnitude;
- (void)setXComponent:(double)a3;
- (void)setYComponent:(double)a3;
@end

@implementation UIGravityBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIGravityBehavior)init
{
  return [(UIGravityBehavior *)self initWithItems:MEMORY[0x1E4F1CBF0]];
}

- (UIGravityBehavior)initWithItems:(NSArray *)items
{
  v4 = items;
  v9.receiver = self;
  v9.super_class = (Class)UIGravityBehavior;
  v5 = [(UIDynamicBehavior *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_gravity = (CGPoint)xmmword_186B89740;
    v7 = (void *)[(NSArray *)v4 mutableCopy];
    [(UIDynamicBehavior *)v6 _setItems:v7];
  }
  return v6;
}

- (void)_addGravityItem:(id)a3
{
  id v4 = a3;
  v5 = [(UIDynamicBehavior *)self _context];
  id v6 = [v5 _registerBodyForItem:v4];

  [v6 setUsesPreciseCollisionDetection:1];
  [v6 setAffectedByGravity:1];
  [v6 setResting:0];
}

- (void)addItem:(id)item
{
  id v8 = item;
  id v4 = [(UIDynamicBehavior *)self _items];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    [(UIDynamicBehavior *)self _addItem:v8];
    id v6 = [(UIDynamicBehavior *)self _context];

    if (v6)
    {
      [(UIGravityBehavior *)self _addGravityItem:v8];
      v7 = [(UIDynamicBehavior *)self _context];
      [v7 _tickle];
    }
  }
}

- (void)removeItem:(id)item
{
  id v8 = item;
  id v4 = [(UIDynamicBehavior *)self _items];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = [(UIDynamicBehavior *)self _context];
    [v6 _unregisterBodyForItem:v8 action:&__block_literal_global_180];

    v7 = [(UIDynamicBehavior *)self _context];
    [v7 _tickle];

    [(UIDynamicBehavior *)self _removeItem:v8];
  }
}

void __32__UIGravityBehavior_removeItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAffectedByGravity:0];
  [v2 setResting:0];
}

- (CGVector)gravityDirection
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  result.ddouble y = y;
  result.ddouble x = x;
  return result;
}

- (CGPoint)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)denormalizedGravity
{
  [(UIGravityBehavior *)self gravity];
  double v4 = v3 * 10.0;
  [(UIGravityBehavior *)self gravity];
  double v6 = v5 * 10.0;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (double)yComponent
{
  [(UIGravityBehavior *)self gravity];
  return v2;
}

- (CGFloat)angle
{
  return atan2(self->_gravity.y, self->_gravity.x);
}

- (CGFloat)magnitude
{
  return sqrt(self->_gravity.x * self->_gravity.x + self->_gravity.y * self->_gravity.y);
}

- (void)setAngle:(CGFloat)angle
{
  [(UIGravityBehavior *)self magnitude];
  [(UIGravityBehavior *)self setAngle:angle magnitude:v5];
}

- (void)setMagnitude:(CGFloat)magnitude
{
  [(UIGravityBehavior *)self angle];
  -[UIGravityBehavior setAngle:magnitude:](self, "setAngle:magnitude:");
}

- (void)setXComponent:(double)a3
{
  [(UIGravityBehavior *)self yComponent];
  -[UIGravityBehavior setGravity:](self, "setGravity:", a3, v5);
}

- (void)setYComponent:(double)a3
{
  [(UIGravityBehavior *)self xComponent];
  -[UIGravityBehavior setGravity:](self, "setGravity:");
}

- (void)_setAngle:(double)a3 magnitude:(double)a4
{
  float v6 = a3;
  __float2 v7 = __sincosf_stret(v6);
  -[UIGravityBehavior setGravity:](self, "setGravity:", v7.__cosval * a4, v7.__sinval * a4);
}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
  float v6 = angle;
  __float2 v7 = __sincosf_stret(v6);
  -[UIGravityBehavior setGravity:](self, "setGravity:", v7.__cosval * magnitude, v7.__sinval * magnitude);
}

- (void)setGravity:(CGPoint)a3
{
  if (a3.x != self->_gravity.x || a3.y != self->_gravity.y)
  {
    self->_gravitdouble y = a3;
    double v5 = [(UIDynamicBehavior *)self _context];
    float v6 = [v5 _world];
    [(UIGravityBehavior *)self gravity];
    double v8 = v7 * 10.0;
    [(UIGravityBehavior *)self gravity];
    objc_msgSend(v6, "setGravity:", v8, v9 * 10.0);

    [(UIDynamicBehavior *)self _changedParameterForBody:0];
  }
}

- (NSArray)items
{
  double v2 = (void *)MEMORY[0x1E4F1C978];
  double v3 = [(UIDynamicBehavior *)self _items];
  double v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (void)_associate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIDynamicBehavior *)self _context];
  double v4 = [v3 _world];
  [(UIGravityBehavior *)self gravity];
  double v6 = v5 * 10.0;
  [(UIGravityBehavior *)self gravity];
  objc_msgSend(v4, "setGravity:", v6, v7 * 10.0);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [(UIDynamicBehavior *)self _items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(UIGravityBehavior *)self _addGravityItem:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_dissociate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIDynamicBehavior *)self _context];
  double v4 = [v3 _world];
  objc_msgSend(v4, "setGravity:", 0.0, 0.0);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(UIDynamicBehavior *)self _items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(UIDynamicBehavior *)self _context];
        [v11 _unregisterBodyForItem:v10 action:&__block_literal_global_2_11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

uint64_t __32__UIGravityBehavior__dissociate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAffectedByGravity:0];
}

- (id)description
{
  double v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)UIGravityBehavior;
  double v4 = [(UIDynamicBehavior *)&v9 description];
  double v5 = NSStringFromCGPoint(self->_gravity);
  uint64_t v6 = [(UIDynamicBehavior *)self _itemsDescription];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v6];

  return v7;
}

@end
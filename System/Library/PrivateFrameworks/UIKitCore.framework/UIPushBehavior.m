@interface UIPushBehavior
+ (BOOL)_isPrimitiveBehavior;
- (BOOL)active;
- (CGFloat)angle;
- (CGFloat)magnitude;
- (CGPoint)targetPointForItem:(id)a3;
- (CGVector)pushDirection;
- (NSArray)items;
- (UIPushBehavior)init;
- (UIPushBehavior)initWithItems:(NSArray *)items mode:(UIPushBehaviorMode)mode;
- (UIPushBehavior)initWithItems:(id)a3;
- (UIPushBehaviorMode)mode;
- (double)xComponent;
- (double)yComponent;
- (id)description;
- (void)_associate;
- (void)_dissociate;
- (void)_step;
- (void)addItem:(id)item;
- (void)removeItem:(id)item;
- (void)setActive:(BOOL)active;
- (void)setAngle:(CGFloat)angle;
- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;
- (void)setMagnitude:(CGFloat)magnitude;
- (void)setTargetPoint:(CGPoint)a3 forItem:(id)a4;
- (void)setXComponent:(double)a3;
- (void)setXComponent:(double)a3 yComponent:(double)a4;
- (void)setYComponent:(double)a3;
@end

@implementation UIPushBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIPushBehavior)init
{
  return [(UIPushBehavior *)self initWithItems:0];
}

- (UIPushBehavior)initWithItems:(NSArray *)items mode:(UIPushBehaviorMode)mode
{
  v6 = items;
  v11.receiver = self;
  v11.super_class = (Class)UIPushBehavior;
  v7 = [(UIDynamicBehavior *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_forceVector.dx = 0.0;
    v7->_forceVector.dy = 0.0;
    v7->_active = 1;
    v7->_mode = mode;
    v9 = (void *)[(NSArray *)v6 mutableCopy];
    [(UIDynamicBehavior *)v8 _setItems:v9];
  }
  return v8;
}

- (UIPushBehavior)initWithItems:(id)a3
{
  return [(UIPushBehavior *)self initWithItems:a3 mode:0];
}

- (NSArray)items
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIDynamicBehavior *)self _items];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (void)setActive:(BOOL)active
{
  if (self->_active != active)
  {
    self->_active = active;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _tickle];
  }
}

- (BOOL)active
{
  return self->_active;
}

- (UIPushBehaviorMode)mode
{
  return self->_mode;
}

- (void)addItem:(id)item
{
  id v8 = item;
  v4 = [(UIDynamicBehavior *)self _items];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    v6 = [(UIDynamicBehavior *)self _context];
    id v7 = (id)[v6 _registerBodyForItem:v8];

    [(UIDynamicBehavior *)self _addItem:v8];
  }
}

- (void)removeItem:(id)item
{
  id v9 = item;
  v4 = [(UIDynamicBehavior *)self _items];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    v6 = [(UIDynamicBehavior *)self _context];
    [v6 _unregisterBodyForItem:v9 action:0];

    targetPoints = self->_targetPoints;
    id v8 = [MEMORY[0x1E4F29238] valueWithPointer:v9];
    [(NSMutableDictionary *)targetPoints removeObjectForKey:v8];

    [(UIDynamicBehavior *)self _removeItem:v9];
  }
}

- (CGPoint)targetPointForItem:(id)a3
{
  targetPoints = self->_targetPoints;
  v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  int v5 = [(NSMutableDictionary *)targetPoints objectForKey:v4];

  if (v5)
  {
    [v5 CGPointValue];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = 0.0;
    double v9 = 0.0;
  }

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3 forItem:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    targetPoints = self->_targetPoints;
    BOOL v11 = *MEMORY[0x1E4F1DAD8] == x && v9 == y;
    id v17 = v7;
    if (v11)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", v7, *MEMORY[0x1E4F1DAD8], v9);
      [(NSMutableDictionary *)targetPoints removeObjectForKey:v16];

      if ([(NSMutableDictionary *)self->_targetPoints count])
      {
LABEL_12:
        [(UIDynamicBehavior *)self _changedParameterForBody:0];
        double v8 = v17;
        goto LABEL_13;
      }
      v14 = self->_targetPoints;
      self->_targetPoints = 0;
    }
    else
    {
      if (!targetPoints)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v13 = self->_targetPoints;
        self->_targetPoints = v12;

        targetPoints = self->_targetPoints;
      }
      v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
      v15 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
      [(NSMutableDictionary *)targetPoints setObject:v14 forKey:v15];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_associate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(UIDynamicBehavior *)self _items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        double v9 = [(UIDynamicBehavior *)self _context];
        double v10 = [v9 _registerBodyForItem:v8];

        [v10 setUsesPreciseCollisionDetection:1];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_dissociate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(UIDynamicBehavior *)self _items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        double v9 = [(UIDynamicBehavior *)self _context];
        [v9 _unregisterBodyForItem:v8 action:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
  if (self->_magnitude != magnitude || self->_angle != angle)
  {
    self->_magnitude = magnitude;
    self->_angle = angle;
    p_forceVector = &self->_forceVector;
    double v6 = self->_magnitude;
    float v7 = angle;
    __float2 v8 = __sincosf_stret(v7);
    p_forceVector->ddouble x = v6 * v8.__cosval;
    self->_forceVector.ddouble y = v6 * v8.__sinval;
    [(UIDynamicBehavior *)self _changedParameterForBody:0];
  }
}

- (void)setXComponent:(double)a3 yComponent:(double)a4
{
  if (self->_forceVector.dx != a3 || self->_forceVector.dy != a4)
  {
    self->_forceVector.ddouble x = a3;
    self->_forceVector.ddouble y = a4;
    self->_angle = atan2(a4, a3);
    self->_magnitude = sqrt(a3 * a3 + a4 * a4);
    [(UIDynamicBehavior *)self _changedParameterForBody:0];
  }
}

- (CGVector)pushDirection
{
  ddouble x = self->_forceVector.dx;
  ddouble y = self->_forceVector.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (CGFloat)angle
{
  return self->_angle;
}

- (CGFloat)magnitude
{
  return self->_magnitude;
}

- (double)xComponent
{
  return self->_forceVector.dx;
}

- (double)yComponent
{
  return self->_forceVector.dy;
}

- (void)setXComponent:(double)a3
{
  [(UIPushBehavior *)self yComponent];
  [(UIPushBehavior *)self setXComponent:a3 yComponent:v5];
}

- (void)setYComponent:(double)a3
{
  [(UIPushBehavior *)self xComponent];
  -[UIPushBehavior setXComponent:yComponent:](self, "setXComponent:yComponent:");
}

- (void)setAngle:(CGFloat)angle
{
  [(UIPushBehavior *)self magnitude];
  [(UIPushBehavior *)self setAngle:angle magnitude:v5];
}

- (void)setMagnitude:(CGFloat)magnitude
{
  [(UIPushBehavior *)self angle];
  -[UIPushBehavior setAngle:magnitude:](self, "setAngle:magnitude:");
}

- (void)_step
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_active)
  {
    targetPoints = self->_targetPoints;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(UIDynamicBehavior *)self _items];
    uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(obj);
          }
          __float2 v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          double v9 = [(UIDynamicBehavior *)self _context];
          long long v10 = [v9 _bodyForItem:v8];

          if (targetPoints)
          {
            long long v11 = self->_targetPoints;
            long long v12 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
            long long v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

            if (v13)
            {
              [v13 CGPointValue];
              double v15 = v14;
              double v17 = v16;
              [v8 center];
              double v19 = v15 + v18;
              [v8 center];
              double v21 = v17 + v20;
              ddouble x = self->_forceVector.dx;
              ddouble y = self->_forceVector.dy;
              if (self->_mode == 1) {
                objc_msgSend(v10, "applyUnscaledImpulse:atPoint:", dx, dy, v19, v21);
              }
              else {
                objc_msgSend(v10, "applyUnscaledForce:atPoint:", dx, dy, v19, v21);
              }
            }
            else
            {
              double v26 = self->_forceVector.dx;
              double v27 = self->_forceVector.dy;
              if (self->_mode == 1) {
                objc_msgSend(v10, "applyUnscaledImpulse:", v26, v27);
              }
              else {
                objc_msgSend(v10, "applyUnscaledForce:", v26, v27);
              }
            }
          }
          else
          {
            double v24 = self->_forceVector.dx;
            double v25 = self->_forceVector.dy;
            if (self->_mode == 1) {
              objc_msgSend(v10, "applyUnscaledImpulse:", v24, v25);
            }
            else {
              objc_msgSend(v10, "applyUnscaledForce:", v24, v25);
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v5);
    }

    if (self->_mode == 1) {
      self->_active = 0;
    }
  }
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v23.receiver = self;
  v23.super_class = (Class)UIPushBehavior;
  uint64_t v4 = [(UIDynamicBehavior *)&v23 description];
  uint64_t v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@" {%f, %f} - <%f,%f> ", *(void *)&self->_forceVector.dx, *(void *)&self->_forceVector.dy, *(void *)&self->_magnitude, *(void *)&self->_angle];
  if (self->_targetPoints)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(UIDynamicBehavior *)self _items];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      double v9 = v5;
      uint64_t v10 = *(void *)v20;
      do
      {
        long long v11 = v6;
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v11);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          targetPoints = self->_targetPoints;
          double v15 = [MEMORY[0x1E4F29238] valueWithPointer:v13];
          double v16 = [(NSMutableDictionary *)targetPoints objectForKey:v15];

          if (v16)
          {
            [v16 CGPointValue];
            double v17 = NSStringFromCGPoint(v27);
            [v9 appendFormat:@"(%@ -> %@)", v17, v13];
          }
        }
        uint64_t v6 = v11;
        uint64_t v8 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
      uint64_t v5 = v9;
    }
  }
  else
  {
    uint64_t v6 = [(UIDynamicBehavior *)self _itemsDescription];
    [v5 appendString:v6];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end
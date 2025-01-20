@interface UISnapBehavior
+ (BOOL)_isPrimitiveBehavior;
- (CGFloat)damping;
- (CGPoint)snapPoint;
- (UISnapBehavior)init;
- (UISnapBehavior)initWithItem:(id)item snapToPoint:(CGPoint)point;
- (double)_distance;
- (double)_frequency;
- (id)description;
- (void)_associate;
- (void)_dissociate;
- (void)_setDistance:(double)a3;
- (void)_setFrequency:(double)a3;
- (void)setDamping:(CGFloat)damping;
- (void)setSnapPoint:(CGPoint)snapPoint;
@end

@implementation UISnapBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UISnapBehavior)init
{
  return 0;
}

- (UISnapBehavior)initWithItem:(id)item snapToPoint:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  id v7 = item;
  v11.receiver = self;
  v11.super_class = (Class)UISnapBehavior;
  v8 = [(UIDynamicBehavior *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(UIDynamicBehavior *)v8 _addItem:v7];
    v9->_anchorPoint.CGFloat x = x;
    v9->_anchorPoint.CGFloat y = y;
    v9->_damping = 0.5;
    v9->_distance = 50.0;
    v9->_frequencCGFloat y = 4.0;
    *(unsigned char *)&v9->_stateFlags &= ~1u;
  }

  return v9;
}

- (double)_distance
{
  return self->_distance;
}

- (void)_setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)_frequency
{
  return self->_frequency;
}

- (void)_setFrequency:(double)a3
{
  if (self->_frequency != a3)
  {
    self->_frequencCGFloat y = a3;
    [(UIDynamicBehavior *)self _changedParameterForBody:0];
  }
}

- (void)setSnapPoint:(CGPoint)snapPoint
{
  if (snapPoint.x != self->_anchorPoint.x || snapPoint.y != self->_anchorPoint.y)
  {
    self->_anchorPoint = snapPoint;
    -[PKPhysicsBody setPosition:](self->_anchorBody, "setPosition:");
    [(UIDynamicBehavior *)self _changedParameterForBody:self->_anchorBody];
    v5 = [(UIDynamicBehavior *)self _context];
    v6 = [(UIDynamicBehavior *)self _items];
    id v7 = [v6 firstObject];
    id v8 = [v5 _bodyForItem:v7];

    [v8 setResting:0];
  }
}

- (CGPoint)snapPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_associate
{
  v3 = [(UIDynamicBehavior *)self _items];
  v4 = [v3 objectAtIndex:0];

  v5 = [(UIDynamicBehavior *)self _context];
  v6 = [v5 _registerBodyForItem:v4];

  [v4 bounds];
  v9 = +[PKExtendedPhysicsBody bodyWithRectangleOfSize:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:", v7, v8);
  objc_msgSend(v9, "setPosition:", self->_anchorPoint.x, self->_anchorPoint.y);
  [v9 setDynamic:0];
  v10 = [(UIDynamicBehavior *)self _context];
  objc_super v11 = [v10 _world];

  [v11 addBody:v9];
  frequencdouble y = self->_frequency;
  double distance = self->_distance;
  [v4 bounds];
  double v15 = v14 * 0.5;
  [v4 bounds];
  v21[1] = 3221225472;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[2] = __28__UISnapBehavior__associate__block_invoke;
  v21[3] = &unk_1E52EC898;
  id v22 = v6;
  id v23 = v9;
  double v27 = v15;
  double v28 = v16 * 0.5;
  double v29 = distance;
  double v30 = frequency;
  v24 = self;
  id v25 = v4;
  id v26 = v11;
  id v17 = v11;
  id v18 = v4;
  id v19 = v9;
  id v20 = v6;
  [v17 _runBlockOutsideOfTimeStep:v21];
}

void __28__UISnapBehavior__associate__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F913E0], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(void *)(a1 + 32), *(void *)(a1 + 40), -*(double *)(a1 + 72), -*(double *)(a1 + 80), -*(double *)(a1 + 72) - *(double *)(a1 + 88), -*(double *)(a1 + 80));
  [v2 setDamping:*(double *)(*(void *)(a1 + 48) + 64)];
  [v2 setFrequency:*(double *)(a1 + 96)];
  [*(id *)(a1 + 56) bounds];
  [v2 setLength:v3 * 0.5];
  [*(id *)(a1 + 64) addJoint:v2];
  v4 = objc_msgSend(MEMORY[0x1E4F913E0], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(void *)(a1 + 32), *(void *)(a1 + 40), -*(double *)(a1 + 72), -*(double *)(a1 + 80), -*(double *)(a1 + 72), -*(double *)(a1 + 80) - *(double *)(a1 + 88));
  [v4 setDamping:*(double *)(*(void *)(a1 + 48) + 64)];
  [v4 setFrequency:*(double *)(a1 + 96)];
  [*(id *)(a1 + 56) bounds];
  [v4 setLength:v5 * 0.5];
  [*(id *)(a1 + 64) addJoint:v4];
  v6 = objc_msgSend(MEMORY[0x1E4F913E0], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 72) + *(double *)(a1 + 88), *(double *)(a1 + 80));
  [v6 setDamping:*(double *)(*(void *)(a1 + 48) + 64)];
  [v6 setFrequency:*(double *)(a1 + 96)];
  [*(id *)(a1 + 64) addJoint:v6];
  double v7 = objc_msgSend(MEMORY[0x1E4F913E0], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 72), *(double *)(a1 + 80) + *(double *)(a1 + 88));
  [v7 setDamping:*(double *)(*(void *)(a1 + 48) + 64)];
  [v7 setFrequency:*(double *)(a1 + 96)];
  [*(id *)(a1 + 64) addJoint:v7];
  dispatch_time_t v8 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__UISnapBehavior__associate__block_invoke_2;
  block[3] = &unk_1E52DAD48;
  id v9 = v2;
  id v18 = v9;
  uint64_t v22 = *(void *)(a1 + 88);
  id v10 = v4;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  id v12 = v7;
  id v21 = v12;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
  uint64_t v13 = *(void *)(a1 + 48);
  if (!*(void *)(v13 + 96))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = *(void *)(a1 + 48);
    double v16 = *(void **)(v15 + 96);
    *(void *)(v15 + 96) = v14;

    [*(id *)(*(void *)(a1 + 48) + 96) addObject:v9];
    [*(id *)(*(void *)(a1 + 48) + 96) addObject:v10];
    [*(id *)(*(void *)(a1 + 48) + 96) addObject:v11];
    [*(id *)(*(void *)(a1 + 48) + 96) addObject:v12];
    uint64_t v13 = *(void *)(a1 + 48);
  }
  objc_storeStrong((id *)(v13 + 104), *(id *)(a1 + 40));
}

uint64_t __28__UISnapBehavior__associate__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setLength:*(double *)(a1 + 64)];
  [*(id *)(a1 + 40) setLength:*(double *)(a1 + 64)];
  [*(id *)(a1 + 48) setLength:*(double *)(a1 + 64)];
  double v2 = *(double *)(a1 + 64);
  double v3 = *(void **)(a1 + 56);
  return [v3 setLength:v2];
}

- (void)_dissociate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIDynamicBehavior *)self _context];
  v4 = [v3 _world];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = self->_joints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeJoint:", *(void *)(*((void *)&v15 + 1) + 8 * v9++), (void)v15);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v4 removeBody:self->_anchorBody];
  id v10 = [(UIDynamicBehavior *)self _items];
  id v11 = [v10 objectAtIndex:0];

  id v12 = [(UIDynamicBehavior *)self _context];
  [v12 _unregisterBodyForItem:v11 action:0];

  anchorBoddouble y = self->_anchorBody;
  self->_anchorBoddouble y = 0;

  joints = self->_joints;
  self->_joints = 0;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)UISnapBehavior;
  v4 = [(UIDynamicBehavior *)&v10 description];
  double v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(UIDynamicBehavior *)self _items];
  uint64_t v7 = [v6 objectAtIndex:0];

  [v5 appendFormat:@" %@ <-", v7];
  if ((*(unsigned char *)&self->_stateFlags & 2) != 0) {
    objc_msgSend(v5, "appendFormat:", @"(D:%f)", *(void *)&self->_damping);
  }
  uint64_t v8 = NSStringFromCGPoint(self->_anchorPoint);
  [v5 appendFormat:@"-> %@", v8];

  return v5;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setDamping:(CGFloat)damping
{
  self->_damping = damping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBody, 0);
  objc_storeStrong((id *)&self->_joints, 0);
}

@end
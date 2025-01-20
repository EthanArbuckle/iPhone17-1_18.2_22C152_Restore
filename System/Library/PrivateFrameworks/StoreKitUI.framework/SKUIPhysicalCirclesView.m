@interface SKUIPhysicalCirclesView
- (BOOL)_addNextMissingSpringJoint;
- (CGPoint)_initialPositionForCircleIndex:(int64_t)a3 view:(id)a4;
- (SKUIPhysicalCircleConstants)constants;
- (SKUIPhysicalCirclesDataSource)dataSource;
- (SKUIPhysicalCirclesDelegate)delegate;
- (SKUIPhysicalCirclesView)initWithFrame:(CGRect)a3;
- (id)_circleBodyWithView:(id)a3;
- (id)addRepellorWithCenter:(CGPoint)a3 radius:(double)a4 bufferSize:(double)a5;
- (id)circleViewAtIndex:(int64_t)a3;
- (int64_t)_circleIndexForPoint:(CGPoint)a3;
- (void)_addSpringForCircleBody:(id)a3;
- (void)_calculateFrequencyScaling;
- (void)_cancelStepTimers;
- (void)_displayLinkTick:(id)a3;
- (void)_loadCirclesWithStartIndex:(int64_t)a3 totalCount:(int64_t)a4;
- (void)_longPressAction:(id)a3;
- (void)_panGestureAction:(id)a3;
- (void)_reloadDidFinish;
- (void)_removeCircleBodies:(id)a3;
- (void)_startFluctuationForCircleView:(id)a3;
- (void)_stopFluctuationForCircleView:(id)a3;
- (void)_tapGestureAction:(id)a3;
- (void)addCirclesWithCount:(int64_t)a3;
- (void)dealloc;
- (void)reloadData;
- (void)removeAllCirclesAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)removeAllRepellors;
- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)removeCirclesInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)removeCirclesInIndexSet:(id)a3 byAnimatingToPoint:(CGPoint)a4 delay:(double)a5 completionBlock:(id)a6;
- (void)removeRepellor:(id)a3;
- (void)setConstants:(SKUIPhysicalCircleConstants *)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSize:(CGSize)a3 forCircleAtIndex:(int64_t)a4;
- (void)startPhysics;
- (void)stopPhysics;
@end

@implementation SKUIPhysicalCirclesView

- (SKUIPhysicalCirclesView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPhysicalCirclesView initWithFrame:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIPhysicalCirclesView;
  id v8 = -[SKUIPhysicalCirclesView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = SKUIPhysicsKitFramework();
    *((void *)v8 + 70) = v9;
    id v10 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Pkphysicsworld.isa, v9));
    v11 = (void *)*((void *)v8 + 71);
    *((void *)v8 + 71) = v10;

    [*((id *)v8 + 71) setContactDelegate:v8];
    objc_msgSend(*((id *)v8 + 71), "setGravity:", 0.0, 0.0);
    id v12 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Pkphysicsbody.isa, *((void *)v8 + 70)));
    v13 = (void *)*((void *)v8 + 64);
    *((void *)v8 + 64) = v12;

    objc_msgSend(*((id *)v8 + 64), "setPosition:", 0.0, 0.0);
    [*((id *)v8 + 71) addBody:*((void *)v8 + 64)];
    [*((id *)v8 + 64) setDynamic:0];
    *((void *)v8 + 65) = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v8 action:sel__longPressAction_];
    v15 = (void *)*((void *)v8 + 66);
    *((void *)v8 + 66) = v14;

    [v8 addGestureRecognizer:*((void *)v8 + 66)];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v8 action:sel__panGestureAction_];
    v17 = (void *)*((void *)v8 + 69);
    *((void *)v8 + 69) = v16;

    [v8 addGestureRecognizer:*((void *)v8 + 69)];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel__tapGestureAction_];
    v19 = (void *)*((void *)v8 + 73);
    *((void *)v8 + 73) = v18;

    [v8 addGestureRecognizer:*((void *)v8 + 73)];
    [v8 setClipsToBounds:1];
  }
  return (SKUIPhysicalCirclesView *)v8;
}

- (void)dealloc
{
  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer) {
    dispatch_source_cancel(circleLoadStepTimer);
  }
  [(CADisplayLink *)self->_displayLink invalidate];
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer removeTarget:self action:0];
  [(SKUIPhysicalCirclesView *)self removeGestureRecognizer:self->_longPressRecognizer];
  [(UIPanGestureRecognizer *)self->_panRecognizer removeTarget:self action:0];
  [(SKUIPhysicalCirclesView *)self removeGestureRecognizer:self->_panRecognizer];
  [(UITapGestureRecognizer *)self->_tapRecognizer removeTarget:self action:0];
  [(SKUIPhysicalCirclesView *)self removeGestureRecognizer:self->_tapRecognizer];
  v4.receiver = self;
  v4.super_class = (Class)SKUIPhysicalCirclesView;
  [(SKUIPhysicalCirclesView *)&v4 dealloc];
}

- (void)addCirclesWithCount:(int64_t)a3
{
  if (self->_circleLoadStepTimer)
  {
    [(SKUIPhysicalCirclesView *)self reloadData];
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_circleBodies count];
    if (!self->_circleBodies)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      circleBodies = self->_circleBodies;
      self->_circleBodies = v6;
    }
    [(SKUIPhysicalCirclesView *)self _loadCirclesWithStartIndex:v5 totalCount:v5 + a3];
  }
}

- (id)addRepellorWithCenter:(CGPoint)a3 radius:(double)a4 bufferSize:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v10 = objc_alloc_init(SKUICircleRepellor);
  [(SKUICircleRepellor *)v10 setBufferSize:a5];
  -[SKUICircleRepellor setCenter:](v10, "setCenter:", x, y);
  [(SKUICircleRepellor *)v10 setRadius:a4];
  v11 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Pkphysicsbody.isa, (uint64_t)self->_physicsKitFramework), "bodyWithCircleOfRadius:", a4);
  [v11 setCategoryBitMask:1];
  [v11 setCollisionBitMask:1];
  [v11 setDensity:1.0];
  [v11 setFriction:0.0];
  [v11 setLinearDamping:0.2];
  [(SKUIPhysicalCirclesView *)self bounds];
  objc_msgSend(v11, "setPosition:", x, v12 - y);
  [v11 setRestitution:0.1];
  [(PKPhysicsWorld *)self->_physicsWorld addBody:v11];
  [(SKUICircleRepellor *)v10 setPhysicsBody:v11];
  [v11 setDynamic:0];
  repellors = self->_repellors;
  if (!repellors)
  {
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = self->_repellors;
    self->_repellors = v14;

    repellors = self->_repellors;
  }
  [(NSMutableArray *)repellors addObject:v10];

  return v10;
}

- (id)circleViewAtIndex:(int64_t)a3
{
  if ([(NSMutableArray *)self->_circleBodies count] <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_circleBodies objectAtIndex:a3];
    v6 = [v5 representedObject];
  }

  return v6;
}

- (void)reloadData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(SKUIPhysicalCirclesView *)self traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == 2;

  double v5 = dbl_1C1CCC1B0[v4];
  *(void *)&self->_maximumFrequencyDistance = qword_1C1CCC1A0[v4];
  self->_minimumFrequencyDistance = v5;
  [(SKUIPhysicalCirclesView *)self _cancelStepTimers];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_circleBodies;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v12 = [v11 representedObject];
        [v12 removeFromSuperview];
        [(PKPhysicsWorld *)self->_physicsWorld removeBody:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  [(PKPhysicsWorld *)self->_physicsWorld removeAllJoints];
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  circleBodies = self->_circleBodies;
  self->_circleBodies = v13;

  self->_longPressCircleIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v16 = [WeakRetained numberOfCirclesInCircleView:self];

  if (v16 < 1)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__SKUIPhysicalCirclesView_reloadData__block_invoke;
    v17[3] = &unk_1E6422250;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x1E4F14428], v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SKUIPhysicalCirclesView *)self _loadCirclesWithStartIndex:0 totalCount:v16];
  }
}

void __37__SKUIPhysicalCirclesView_reloadData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadDidFinish];
}

- (void)removeAllCirclesAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(SKUIPhysicalCirclesView *)self _cancelStepTimers];
  uint64_t v7 = [(NSMutableArray *)self->_circleBodies count];
  if (v4 && v7)
  {
    uint64_t v27 = v7;
    v28 = self;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    long long v38 = 0u;
    uint64_t v25 = 416;
    obuint64_t j = self->_circleBodies;
    uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "representedObject", v25);
          v15 = (void *)MEMORY[0x1E4FB1EB0];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __68__SKUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke;
          v36[3] = &unk_1E6422020;
          id v16 = v14;
          id v37 = v16;
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __68__SKUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke_2;
          v29[3] = &unk_1E6428738;
          id v30 = v16;
          v31 = v28;
          v32 = v13;
          id v33 = v6;
          uint64_t v34 = v10 + i;
          uint64_t v35 = v27;
          id v17 = v16;
          [v15 animateWithDuration:0x10000 delay:v36 options:v29 animations:0.2 completion:(double)(v10 + i) * 0.04];
        }
        uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        v10 += i;
      }
      while (v9);
    }

    [*(id *)((char *)&v28->super.super.super.isa + v25) removeAllObjects];
    v28->_longPressCircleIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = self->_circleBodies;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v24 = [v23 representedObject];
          [v24 removeFromSuperview];
          [(PKPhysicsWorld *)self->_physicsWorld removeBody:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v20);
    }

    [(NSMutableArray *)self->_circleBodies removeAllObjects];
    self->_longPressCircleIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

uint64_t __68__SKUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  return [v2 setTransform:&v4];
}

uint64_t __68__SKUIPhysicalCirclesView_removeAllCirclesAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 40) + 568) removeBody:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result && *(void *)(a1 + 64) == *(void *)(a1 + 72) - 1)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeAllRepellors
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_repellors copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SKUIPhysicalCirclesView removeRepellor:](self, "removeRepellor:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F28D60];
  id v9 = a5;
  id v10 = (id)[[v8 alloc] initWithIndex:a3];
  [(SKUIPhysicalCirclesView *)self removeCirclesInIndexSet:v10 animated:v5 completionBlock:v9];
}

- (void)removeCirclesInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  longPressCircleIndedouble x = self->_longPressCircleIndex;
  id v10 = a3;
  if ([v10 containsIndex:longPressCircleIndex]) {
    self->_longPressCircleIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke;
  v19[3] = &unk_1E6424780;
  id v12 = v11;
  id v20 = v12;
  uint64_t v21 = self;
  [v10 enumerateIndexesWithOptions:2 usingBlock:v19];

  if (a4)
  {
    v13 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_2;
    v17[3] = &unk_1E6422020;
    id v18 = v12;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_3;
    v14[3] = &unk_1E6428760;
    v14[4] = self;
    id v15 = v18;
    id v16 = v8;
    [v13 animateWithDuration:0x10000 delay:v17 options:v14 animations:0.2 completion:0.0];
  }
  else
  {
    [(SKUIPhysicalCirclesView *)self _removeCircleBodies:v12];
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
}

uint64_t __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 416) objectAtIndex:a2];
  [v4 addObject:v5];

  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 416);

  return [v6 removeObjectAtIndex:a2];
}

void __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * v5) representedObject];
        [v6 setAlpha:0.0];
        CGAffineTransformMakeScale(&v7, 0.9, 0.9);
        [v6 setTransform:&v7];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

uint64_t __76__SKUIPhysicalCirclesView_removeCirclesInIndexSet_animated_completionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCircleBodies:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeCirclesInIndexSet:(id)a3 byAnimatingToPoint:(CGPoint)a4 delay:(double)a5 completionBlock:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __92__SKUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke;
  v47[3] = &unk_1E6424780;
  v47[4] = self;
  id v14 = v13;
  id v48 = v14;
  uint64_t v35 = v11;
  [v11 enumerateIndexesWithOptions:2 usingBlock:v47];
  [MEMORY[0x1E4F39CF8] begin];
  id v15 = (void *)MEMORY[0x1E4F39CF8];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __92__SKUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke_2;
  v44[3] = &unk_1E6423820;
  id v16 = v14;
  id v45 = v16;
  id v34 = v12;
  id v46 = v34;
  [v15 setCompletionBlock:v44];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v16;
  uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v41;
    uint64_t v37 = *MEMORY[0x1E4F39FA8];
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v41 != v38) {
          objc_enumerationMutation(obj);
        }
        id v18 = [*(id *)(*((void *)&v40 + 1) + 8 * v17) layer];
        uint64_t v19 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
        id v20 = +[SKUISimpleAnimationFactory easeQuadOutTimingFunction];
        [v19 setTimingFunction:v20];

        uint64_t v21 = NSNumber;
        [v18 position];
        long long v22 = objc_msgSend(v21, "numberWithDouble:");
        [v19 setFromValue:v22];

        long long v23 = [NSNumber numberWithDouble:x];
        [v19 setToValue:v23];

        v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.y"];
        uint64_t v25 = +[SKUISimpleAnimationFactory easeQuadInTimingFunction];
        [v24 setTimingFunction:v25];

        v26 = NSNumber;
        [v18 position];
        v28 = [v26 numberWithDouble:v27];
        [v24 setFromValue:v28];

        v29 = [NSNumber numberWithDouble:y];
        [v24 setToValue:v29];

        id v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
        v31 = +[SKUISimpleAnimationFactory easeQuadInOutTimingFunction];
        [v30 setTimingFunction:v31];

        [v30 setFromValue:&unk_1F1D61EB0];
        [v30 setToValue:&unk_1F1D62158];
        v32 = [MEMORY[0x1E4F39B38] animation];
        v49[0] = v19;
        v49[1] = v24;
        v49[2] = v30;
        id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
        [v32 setAnimations:v33];

        [v32 setDuration:0.5];
        [v32 setFillMode:v37];
        [v32 setRemovedOnCompletion:0];
        a5 = a5 + 0.075;
        [v32 setBeginTime:a5 + CACurrentMediaTime()];
        [v18 addAnimation:v32 forKey:@"groupAnimation"];

        ++v17;
      }
      while (v39 != v17);
      uint64_t v39 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v39);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

void __92__SKUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 416) objectAtIndex:a2];
  uint64_t v4 = [v5 representedObject];
  [*(id *)(a1 + 40) addObject:v4];
  [*(id *)(a1 + 32) bringSubviewToFront:v4];
  [*(id *)(*(void *)(a1 + 32) + 568) removeBody:v5];
  [*(id *)(*(void *)(a1 + 32) + 416) removeObjectAtIndex:a2];
}

uint64_t __92__SKUIPhysicalCirclesView_removeCirclesInIndexSet_byAnimatingToPoint_delay_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "removeFromSuperview", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)removeRepellor:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_repellors, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    physicsWorld = self->_physicsWorld;
    CGAffineTransform v7 = [v8 physicsBody];
    [(PKPhysicsWorld *)physicsWorld removeBody:v7];

    [(NSMutableArray *)self->_repellors removeObjectAtIndex:v5];
  }
}

- (void)setSize:(CGSize)a3 forCircleAtIndex:(int64_t)a4
{
  double width = a3.width;
  -[NSMutableArray objectAtIndex:](self->_circleBodies, "objectAtIndex:", a4, a3.width, a3.height);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (float (*)(void))SKUIWeakLinkedSymbolForString("PKGet_INV_PTM_RATIO", self->_physicsKitFramework);
  if (v6) {
    [v7 setRadius:width * 0.5 * v6()];
  }
  [(SKUIPhysicalCirclesView *)self _calculateFrequencyScaling];
}

- (void)startPhysics
{
  displayLink = self->_displayLink;
  if (displayLink) {
    [(CADisplayLink *)displayLink invalidate];
  }
  uint64_t v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkTick_];
  uint64_t v5 = self->_displayLink;
  self->_displayLink = v4;

  uint64_t v6 = self->_displayLink;
  id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)stopPhysics
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)_longPressAction:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(SKUIPhysicalCirclesView *)self delegate];
  uint64_t v5 = [v12 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    longPressCircleIndedouble x = self->_longPressCircleIndex;
    self->_longPressCircleIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    if (longPressCircleIndex == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    id v7 = [(NSMutableArray *)self->_circleBodies objectAtIndex:longPressCircleIndex];
    [v7 setDynamic:1];
    id v8 = [v7 representedObject];
    [(SKUIPhysicalCirclesView *)self _stopFluctuationForCircleView:v8];

    if (objc_opt_respondsToSelector()) {
      [v4 circleView:self didEndLongPressForCircleAtIndex:longPressCircleIndex];
    }
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    [v12 locationInView:self];
    int64_t v9 = -[SKUIPhysicalCirclesView _circleIndexForPoint:](self, "_circleIndexForPoint:");
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = v9;
      self->_longPressCircleIndedouble x = v9;
      id v7 = [(NSMutableArray *)self->_circleBodies objectAtIndex:v9];
      [v7 setDynamic:0];
      long long v11 = [v7 representedObject];
      [(SKUIPhysicalCirclesView *)self _startFluctuationForCircleView:v11];

      if (objc_opt_respondsToSelector()) {
        [v4 circleView:self didBeginLongPressForCircleAtIndex:v10];
      }
LABEL_9:
    }
  }
LABEL_10:
}

- (void)_panGestureAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 2)
  {
    [v4 translationInView:self];
    double v6 = v5;
    double v8 = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int64_t v9 = self->_circleBodies;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      double v13 = -v8;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "representedObject", (void)v18);
          [v16 bounds];
          objc_msgSend(v15, "applyForce:", v6 * self->_constants.translationForceMultiplier * (v17 / self->_constants.circleMinimumDiameter * 1.5), self->_constants.translationForceMultiplier * v13 * (v17 / self->_constants.circleMinimumDiameter * 1.5));
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (void)_tapGestureAction:(id)a3
{
  id v6 = a3;
  id v4 = [(SKUIPhysicalCirclesView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 state] == 3)
  {
    [v6 locationInView:self];
    int64_t v5 = -[SKUIPhysicalCirclesView _circleIndexForPoint:](self, "_circleIndexForPoint:");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [v4 circleView:self didTapCircleAtIndex:v5];
    }
  }
}

- (void)_displayLinkTick:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_circleBodies;
  uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v44;
    v36 = self;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        int64_t v5 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_msgSend(v5, "position", v33);
        double v7 = v6;
        double v9 = v8;
        uint64_t v10 = [v5 representedObject];
        [(SKUIPhysicalCirclesView *)self bounds];
        double v12 = v11 - v9;
        objc_msgSend(v10, "setCenter:", v7, v12);
        double v13 = [v5 joints];
        uint64_t v14 = [v13 firstObject];

        if (v14)
        {
          [(PKPhysicsWorld *)self->_physicsWorld removeJoint:v14];
          [(SKUIPhysicalCirclesView *)self _calculateFrequencyScaling];
          [(SKUIPhysicalCirclesView *)self _addSpringForCircleBody:v5];
        }
        uint64_t v38 = (void *)v14;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v15 = self->_repellors;
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v40 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
              [v20 center];
              double v23 = v12 - v22;
              *(float *)&double v21 = (v7 - v21) * (v7 - v21) + v23 * v23;
              double v24 = sqrtf(*(float *)&v21);
              [v10 bounds];
              double v26 = v25 * 0.5;
              [v20 bufferSize];
              double v28 = v27;
              [v20 radius];
              if (v24 - v29 - v28 - v26 < 0.0)
              {
                double v30 = v24 - v26;
                if (v24 - v26 <= v29)
                {
                  double v31 = 50.0;
                }
                else
                {
                  double v31 = 0.0;
                  if (v30 < v28 + v29) {
                    double v31 = (v30 - v29) / (v28 + v29 - v29) * -50.0 + 50.0;
                  }
                }
                objc_msgSend(v5, "applyForce:", 0.0, -v23 / v24 * v31);
              }
            }
            uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v17);
        }

        self = v36;
      }
      uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v37);
  }

  physicsWorld = self->_physicsWorld;
  [v33 duration];
  -[PKPhysicsWorld stepWithTime:velocityIterations:positionIterations:](physicsWorld, "stepWithTime:velocityIterations:positionIterations:", 8, 2);
}

- (BOOL)_addNextMissingSpringJoint
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_circleBodies;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "joints", (void)v13);
        uint64_t v10 = [v9 count];

        if (!v10)
        {
          [(SKUIPhysicalCirclesView *)self _calculateFrequencyScaling];
          [(SKUIPhysicalCirclesView *)self _addSpringForCircleBody:v8];
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addSpringForCircleBody:(id)a3
{
  id v4 = a3;
  [(SKUIPhysicalCirclesView *)self bounds];
  double v6 = v5 * 0.5;
  double v8 = v7 * 0.5;
  [v4 position];
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Pkphysicsjoint.isa, (uint64_t)self->_physicsKitFramework), "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", self->_groundBody, v4, v6, v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  [v18 setCollideConnected:1];
  [v18 setDamping:self->_constants.springDamping];
  float v13 = (v8 - v12) * (v8 - v12) + (v6 - v10) * (v6 - v10);
  double v14 = fabsf(sqrtf(v13));
  double minimumFrequencyDistance = self->_minimumFrequencyDistance;
  springMinimumFrequencdouble y = self->_constants.springMinimumFrequency;
  if (minimumFrequencyDistance < v14)
  {
    double maximumFrequencyDistance = self->_maximumFrequencyDistance;
    if (maximumFrequencyDistance <= v14) {
      springMinimumFrequencdouble y = self->_constants.springMaximumFrequency;
    }
    else {
      springMinimumFrequencdouble y = springMinimumFrequency
    }
                             + (v14 - minimumFrequencyDistance)
                             / (maximumFrequencyDistance - minimumFrequencyDistance)
                             * (self->_constants.springMaximumFrequency - springMinimumFrequency);
  }
  [v18 setFrequency:springMinimumFrequency];
  [(PKPhysicsWorld *)self->_physicsWorld addJoint:v18];
  [v18 setLength:0.0];
}

- (void)_cancelStepTimers
{
  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer)
  {
    dispatch_source_cancel(circleLoadStepTimer);
    id v4 = self->_circleLoadStepTimer;
    self->_circleLoadStepTimer = 0;
  }
}

- (void)_calculateFrequencyScaling
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = self->_circleBodies;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "joints", (void)v19);
        uint64_t v12 = [v11 count];

        if (v12)
        {
          float v13 = [v10 representedObject];
          [v13 bounds];
          double v8 = v8 + v14;
          ++v6;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);

    if (v6 >= 1)
    {
      float v15 = v8 / (double)v6;
      float v16 = sqrtf(v15);
      uint64_t v17 = 16;
      if (v6 > 16) {
        uint64_t v17 = v6;
      }
      double v18 = (float)(v16 * (float)v17);
      self->_double maximumFrequencyDistance = v18 * 4.0 * v18 * 0.00715;
      self->_double minimumFrequencyDistance = v18 * 1.89999998 * v18 * 0.00715;
    }
  }
  else
  {
  }
}

- (id)_circleBodyWithView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  [v4 center];
  double v8 = v7;
  double v10 = v9;
  id v11 = SKUIWeakLinkedClassForString(&cfstr_Pkphysicsbody.isa, (uint64_t)self->_physicsKitFramework);
  float v12 = v6 * 0.5;
  float v13 = [v11 bodyWithCircleOfRadius:floorf(v12)];
  [v13 setCategoryBitMask:1];
  [v13 setCollisionBitMask:1];
  [v13 setDensity:self->_constants.circleDensity];
  [v13 setDynamic:1];
  [v13 setFriction:0.0];
  [v13 setLinearDamping:self->_constants.circleLinearDamping];
  [(SKUIPhysicalCirclesView *)self bounds];
  objc_msgSend(v13, "setPosition:", v8, v14 - v10);
  [v13 setRepresentedObject:v4];

  [v13 setRestitution:0.0];

  return v13;
}

- (int64_t)_circleIndexForPoint:(CGPoint)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  circleBodies = self->_circleBodies;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SKUIPhysicalCirclesView__circleIndexForPoint___block_invoke;
  v6[3] = &unk_1E6428788;
  CGPoint v7 = a3;
  v6[4] = &v8;
  [(NSMutableArray *)circleBodies enumerateObjectsUsingBlock:v6];
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __48__SKUIPhysicalCirclesView__circleIndexForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 representedObject];
  [v7 frame];
  if (CGRectContainsPoint(v9, *(CGPoint *)(a1 + 40)))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (CGPoint)_initialPositionForCircleIndex:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  [(SKUIPhysicalCirclesView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  [v6 bounds];
  double v12 = v11;
  double v14 = v13;

  if (a3 >= 0) {
    int64_t v15 = a3;
  }
  else {
    int64_t v15 = a3 + 1;
  }
  unint64_t v16 = v15 >> 1;
  p_constants = &self->_constants;
  double circleMinimumDiameter = p_constants->circleMinimumDiameter;
  int v19 = rand();
  double v20 = v12 + p_constants->circleMaximumDiameter + v12 * (double)(v16 >> 1) * 2.0;
  float v21 = v8 + v20;
  *(float *)&double v20 = v20;
  float v22 = -*(float *)&v20;
  if (a3) {
    float v22 = v21;
  }
  double v23 = floorf(v22);
  float v24 = v10 * 0.5 + (double)(uint64_t)(2 * (v16 & 1)) * v14 - v14;
  double v25 = (double)v19 / 2147483650.0 * (circleMinimumDiameter * 0.200000003) + 0.0 + roundf(v24);
  result.double y = v25;
  result.double x = v23;
  return result;
}

- (void)_loadCirclesWithStartIndex:(int64_t)a3 totalCount:(int64_t)a4
{
  if (a3 < a4)
  {
    int64_t v6 = a3;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      double v8 = [WeakRetained circlesView:self circleForIndex:v6];

      [(SKUIPhysicalCirclesView *)self _initialPositionForCircleIndex:v6 view:v8];
      objc_msgSend(v8, "setCenter:");
      [v8 setUserInteractionEnabled:0];
      double v9 = [(SKUIPhysicalCirclesView *)self _circleBodyWithView:v8];
      [(NSMutableArray *)self->_circleBodies addObject:v9];
      [(PKPhysicsWorld *)self->_physicsWorld addBody:v9];
      [(SKUIPhysicalCirclesView *)self addSubview:v8];

      ++v6;
    }
    while (a4 != v6);
  }
  double v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  circleLoadStepTimer = self->_circleLoadStepTimer;
  self->_circleLoadStepTimer = v10;

  dispatch_source_set_timer((dispatch_source_t)self->_circleLoadStepTimer, 0, 0x4C4B400uLL, 0);
  objc_initWeak(&location, self);
  double v12 = self->_circleLoadStepTimer;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SKUIPhysicalCirclesView__loadCirclesWithStartIndex_totalCount___block_invoke;
  v13[3] = &unk_1E6422250;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v12, v13);
  dispatch_resume((dispatch_object_t)self->_circleLoadStepTimer);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __65__SKUIPhysicalCirclesView__loadCirclesWithStartIndex_totalCount___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v4 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained _addNextMissingSpringJoint];
    uint64_t v2 = (uint64_t)v4;
    if ((WeakRetained & 1) == 0)
    {
      uint64_t WeakRetained = [v4 _reloadDidFinish];
      uint64_t v2 = (uint64_t)v4;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)_reloadDidFinish
{
  circleLoadStepTimer = self->_circleLoadStepTimer;
  if (circleLoadStepTimer)
  {
    dispatch_source_cancel(circleLoadStepTimer);
    int64_t v4 = self->_circleLoadStepTimer;
    self->_circleLoadStepTimer = 0;
  }
  id v5 = [(SKUIPhysicalCirclesView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 circleViewReloadDidFinish:self];
  }
}

- (void)_removeCircleBodies:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v10 = [v9 representedObject];
        [v10 removeFromSuperview];
        [(PKPhysicsWorld *)self->_physicsWorld removeBody:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_startFluctuationForCircleView:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke;
  v6[3] = &unk_1E6422020;
  id v7 = v3;
  id v5 = v3;
  [v4 animateKeyframesWithDuration:8 delay:v6 options:0 animations:0.2 completion:0.0];
}

void __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_2;
  v9[3] = &unk_1E6422020;
  id v10 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v9 relativeDuration:0.0 animations:0.33];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_3;
  v7[3] = &unk_1E6422020;
  id v8 = *(id *)(a1 + 32);
  [v3 addKeyframeWithRelativeStartTime:v7 relativeDuration:0.33 animations:0.33];
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_4;
  v5[3] = &unk_1E6422020;
  id v6 = *(id *)(a1 + 32);
  [v4 addKeyframeWithRelativeStartTime:v5 relativeDuration:0.66 animations:0.33];
}

uint64_t __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.05, 1.05);
  return [v1 setTransform:&v3];
}

uint64_t __58__SKUIPhysicalCirclesView__startFluctuationForCircleView___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)_stopFluctuationForCircleView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SKUIPhysicalCirclesView__stopFluctuationForCircleView___block_invoke;
  v7[3] = &unk_1E6422020;
  id v8 = v3;
  id v6 = v3;
  [v5 animateWithDuration:v7 animations:0.2];
}

uint64_t __57__SKUIPhysicalCirclesView__stopFluctuationForCircleView___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (SKUIPhysicalCircleConstants)constants
{
  long long v3 = *(_OWORD *)&self[6].translationForceMultiplier;
  *(_OWORD *)&retstr->circleDensitdouble y = *(_OWORD *)&self[6].springMinimumFrequency;
  *(_OWORD *)&retstr->circleMaximumDiameter = v3;
  long long v4 = *(_OWORD *)&self[7].circleMinimumDiameter;
  *(_OWORD *)&retstr->springMaximumFrequencdouble y = *(_OWORD *)&self[7].circleLinearDamping;
  *(_OWORD *)&retstr->springDamping = v4;
  return self;
}

- (void)setConstants:(SKUIPhysicalCircleConstants *)a3
{
  long long v3 = *(_OWORD *)&a3->springDamping;
  long long v5 = *(_OWORD *)&a3->circleDensity;
  long long v4 = *(_OWORD *)&a3->circleMaximumDiameter;
  *(_OWORD *)&self->_constants.springMaximumFrequencdouble y = *(_OWORD *)&a3->springMaximumFrequency;
  *(_OWORD *)&self->_constants.springDamping = v3;
  *(_OWORD *)&self->_constants.circleDensitdouble y = v5;
  *(_OWORD *)&self->_constants.circleMaximumDiameter = v4;
}

- (SKUIPhysicalCirclesDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUIPhysicalCirclesDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SKUIPhysicalCirclesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIPhysicalCirclesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_repellors, 0);
  objc_storeStrong((id *)&self->_physicsWorld, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_groundBody, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_circleBodies, 0);

  objc_storeStrong((id *)&self->_circleLoadStepTimer, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIPhysicalCirclesView initWithFrame:]";
}

@end
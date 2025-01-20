@interface BCUIHoverInteraction
- (BCUIHoverInteraction)initWithDelegate:(id)a3 view:(id)a4;
- (BCUIHoverInteractionDelegate)delegate;
- (BOOL)isHovering;
- (BOOL)stateForRegionWithKey:(id)a3;
- (UIView)view;
- (double)settleDuration;
- (void)_checkIfSettledWithTime:(unint64_t)a3;
- (void)_hoverGesture:(id)a3;
- (void)_updateSettled;
- (void)_updateState;
- (void)addRegionWithKey:(id)a3 rect:(CGRect)a4;
- (void)didMoveToView:(id)a3;
- (void)rebuildAllRegionsWithBlock:(id)a3;
- (void)rebuildRegionWithKey:(id)a3 block:(id)a4;
- (void)setSettleDuration:(double)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation BCUIHoverInteraction

- (BCUIHoverInteraction)initWithDelegate:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCUIHoverInteraction;
  v8 = [(BCUIHoverInteraction *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = objc_opt_new();
    regionBounds = v9->_regionBounds;
    v9->_regionBounds = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    regionState = v9->_regionState;
    v9->_regionState = (NSSet *)v12;

    objc_storeWeak((id *)&v9->_targetView, v7);
    v9->_settleDuration = 0.25;
    v9->_lastUpdatedTime = 0;
    v9->_checkSettled = objc_opt_respondsToSelector() & 1;
  }

  return v9;
}

- (void)willMoveToView:(id)a3
{
  if (self->_gestureRecognizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeGestureRecognizer:self->_gestureRecognizer];

    gestureRecognizer = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;
  }

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  v5 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:self action:"_hoverGesture:"];
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v5;

  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [WeakRetained addGestureRecognizer:self->_gestureRecognizer];
}

- (void)_hoverGesture:(id)a3
{
  if (self->_gestureRecognizer == a3) {
    [(BCUIHoverInteraction *)self _updateState];
  }
}

- (BOOL)stateForRegionWithKey:(id)a3
{
  return [(NSSet *)self->_regionState containsObject:a3];
}

- (void)rebuildAllRegionsWithBlock:(id)a3
{
  v4 = (void (**)(id, BCUIHoverInteraction *))a3;
  [(NSMutableDictionary *)self->_regionBounds removeAllObjects];
  if (v4) {
    v4[2](v4, self);
  }
  [(BCUIHoverInteraction *)self _updateState];
}

- (void)rebuildRegionWithKey:(id)a3 block:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, _BCUIHoverRegionBuilder *))a4;
  id v7 = objc_alloc_init(_BCUIHoverRegionBuilder);
  if (v6) {
    v6[2](v6, v7);
  }
  v8 = [(_BCUIHoverRegionBuilder *)v7 bounds];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(_BCUIHoverRegionBuilder *)v7 bounds];
    [(NSMutableDictionary *)self->_regionBounds setObject:v10 forKeyedSubscript:v11];
  }
  else
  {
    [(NSMutableDictionary *)self->_regionBounds setObject:0 forKeyedSubscript:v11];
  }
  [(BCUIHoverInteraction *)self _updateState];
}

- (void)addRegionWithKey:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_regionBounds, "objectForKeyedSubscript:");
  if (!v9)
  {
    id v9 = objc_opt_new();
    [(NSMutableDictionary *)self->_regionBounds setObject:v9 forKeyedSubscript:v11];
  }
  uint64_t v10 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
  [v9 addObject:v10];
}

- (BOOL)isHovering
{
  return (char *)[(UIHoverGestureRecognizer *)self->_gestureRecognizer state] - 1 < (unsigned char *)&def_7D91C + 2;
}

- (void)_updateSettled
{
  if (self->_checkSettled)
  {
    dispatch_time_t v3 = dispatch_time(0, 0);
    self->_lastUpdatedTime = v3;
    [(BCUIHoverInteraction *)self _checkIfSettledWithTime:v3];
  }
}

- (void)_checkIfSettledWithTime:(unint64_t)a3
{
  if (!self->_settleCheckScheduled)
  {
    self->_settleCheckScheduled = 1;
    dispatch_time_t v5 = dispatch_time(a3, (uint64_t)(self->_settleDuration * 1000000000.0));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_16C7B4;
    v6[3] = &unk_2C3C28;
    v6[4] = self;
    v6[5] = a3;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_updateState
{
  unsigned int v3 = [(BCUIHoverInteraction *)self isHovering];
  if ((char *)[(UIHoverGestureRecognizer *)self->_gestureRecognizer state] - 1 <= (unsigned char *)&def_7D91C + 1) {
    [(BCUIHoverInteraction *)self _updateSettled];
  }
  v4 = (NSSet *)objc_opt_new();
  if (v3)
  {
    gestureRecognizer = self->_gestureRecognizer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    [(UIHoverGestureRecognizer *)gestureRecognizer locationInView:WeakRetained];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    regionBounds = self->_regionBounds;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_16C9C8;
    v16[3] = &unk_2CA9A8;
    uint64_t v18 = v8;
    uint64_t v19 = v10;
    v17 = v4;
    [(NSMutableDictionary *)regionBounds enumerateKeysAndObjectsUsingBlock:v16];
  }
  id v12 = [(NSSet *)self->_regionState mutableCopy];
  [v12 intersectSet:v4];
  id v13 = [(NSSet *)self->_regionState mutableCopy];
  [v13 unionSet:v4];
  [v13 minusSet:v12];
  regionState = self->_regionState;
  self->_regionState = v4;

  if ([v13 count])
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 hoverInteraction:self didChangeStateForRegionWithKeys:v13];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (BCUIHoverInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCUIHoverInteractionDelegate *)WeakRetained;
}

- (double)settleDuration
{
  return self->_settleDuration;
}

- (void)setSettleDuration:(double)a3
{
  self->_settleDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_regionState, 0);
  objc_storeStrong((id *)&self->_regionBounds, 0);

  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
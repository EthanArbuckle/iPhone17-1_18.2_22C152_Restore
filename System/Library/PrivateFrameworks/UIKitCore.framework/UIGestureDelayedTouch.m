@interface UIGestureDelayedTouch
- (NSString)description;
- (double)timestampForDelivery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithEvent:(void *)a3 touch:;
- (int64_t)phaseForDelivery;
- (uint64_t)saveCurrentTouchState;
@end

@implementation UIGestureDelayedTouch

- (int64_t)phaseForDelivery
{
  uint64_t v2 = 40;
  if (!self->_clonedForSecondDelivery) {
    uint64_t v2 = 32;
  }
  return [*(id *)((char *)&self->super.isa + v2) phase];
}

- (uint64_t)saveCurrentTouchState
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(UITouch);
    v3 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v2;

    v4 = *(void **)(v1 + 40);
    uint64_t v5 = *(void *)(v1 + 24);
    return [v4 _loadStateFromTouch:v5];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateWhenDelivered, 0);
  objc_storeStrong((id *)&self->_stateWhenDelayed, 0);
  objc_storeStrong((id *)&self->_touch, 0);
}

- (double)timestampForDelivery
{
  uint64_t v2 = 40;
  if (!self->_clonedForSecondDelivery) {
    uint64_t v2 = 32;
  }
  [*(id *)((char *)&self->super.isa + v2) timestamp];
  return result;
}

- (id)initWithEvent:(void *)a3 touch:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)UIGestureDelayedTouch;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 6, a2);
      objc_storeStrong(a1 + 3, a3);
      v9 = objc_alloc_init(UITouch);
      id v10 = a1[4];
      a1[4] = v9;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[UIGestureDelayedTouch allocWithZone:a3] init];
  uint64_t v5 = objc_alloc_init(UITouch);
  objc_storeStrong((id *)&v4->_touch, self->_touch);
  objc_storeStrong((id *)&v4->_event, self->_event);
  stateWhenDelayed = v4->_stateWhenDelayed;
  v4->_stateWhenDelayed = v5;
  id v7 = v5;

  v4->_clonedForSecondDelivery = self->_clonedForSecondDelivery;
  [(UITouch *)v7 _loadStateFromTouch:self->_stateWhenDelayed];

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = objc_opt_class();
  touch = self->_touch;
  if (touch)
  {
    id v6 = NSString;
    id v7 = touch;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v6 stringWithFormat:@"<%@: %p>", v9, v7];
  }
  else
  {
    id v10 = @"(nil)";
  }
  [v3 appendFormat:@"<%@: %p; touch = %@", v4, self, v10];

  if (self->_clonedForSecondDelivery) {
    [v3 appendString:@"; clone = YES"];
  }
  v11 = [(UITouch *)self->_stateWhenDelayed _phaseDescription];
  [v3 appendFormat:@"; delayed phase = %@", v11];

  if (self->_clonedForSecondDelivery)
  {
    stateWhenDelivered = self->_stateWhenDelivered;
    if (stateWhenDelivered)
    {
      v13 = [(UITouch *)stateWhenDelivered _phaseDescription];
      [v3 appendFormat:@"; current phase = %@", v13];
    }
  }
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

@end
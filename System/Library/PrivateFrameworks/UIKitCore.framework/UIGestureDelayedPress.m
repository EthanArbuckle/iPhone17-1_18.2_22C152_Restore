@interface UIGestureDelayedPress
- (NSString)description;
- (double)timestampForDelivery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithEvent:(void *)a3 press:;
- (int64_t)phaseForDelivery;
- (uint64_t)saveCurrentPressState;
@end

@implementation UIGestureDelayedPress

- (id)initWithEvent:(void *)a3 press:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)UIGestureDelayedPress;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 6, a2);
      objc_storeStrong(a1 + 3, a3);
      v9 = objc_alloc_init(UIPress);
      id v10 = a1[4];
      a1[4] = v9;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[UIGestureDelayedPress allocWithZone:a3] init];
  v5 = objc_alloc_init(UIPress);
  objc_storeStrong((id *)&v4->_press, self->_press);
  objc_storeStrong((id *)&v4->_event, self->_event);
  stateWhenDelayed = v4->_stateWhenDelayed;
  v4->_stateWhenDelayed = v5;
  id v7 = v5;

  v4->_clonedForSecondDelivery = self->_clonedForSecondDelivery;
  [(UIPress *)v7 _loadStateFromPress:self->_stateWhenDelayed];

  return v4;
}

- (uint64_t)saveCurrentPressState
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = objc_alloc_init(UIPress);
    v3 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v2;

    v4 = *(void **)(v1 + 40);
    uint64_t v5 = *(void *)(v1 + 24);
    return [v4 _loadStateFromPress:v5];
  }
  return result;
}

- (int64_t)phaseForDelivery
{
  uint64_t v2 = 40;
  if (!self->_clonedForSecondDelivery) {
    uint64_t v2 = 32;
  }
  return [*(id *)((char *)&self->super.isa + v2) phase];
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

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%@: %p", objc_opt_class(), self];
  if (self && self->_clonedForSecondDelivery) {
    [v3 appendString:@"; clone = YES"];
  }
  v4 = [(UIPress *)self->_stateWhenDelayed _phaseDescription];
  [v3 appendFormat:@"; delayed phase = %@", v4];

  if (self->_clonedForSecondDelivery)
  {
    stateWhenDelivered = self->_stateWhenDelivered;
    if (stateWhenDelivered)
    {
      id v6 = [(UIPress *)stateWhenDelivered _phaseDescription];
      [v3 appendFormat:@"; current phase = %@", v6];
    }
  }
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateWhenDelivered, 0);
  objc_storeStrong((id *)&self->_stateWhenDelayed, 0);
  objc_storeStrong((id *)&self->_press, 0);
}

@end
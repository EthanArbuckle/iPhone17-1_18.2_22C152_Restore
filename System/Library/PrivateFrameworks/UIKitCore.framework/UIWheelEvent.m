@interface UIWheelEvent
- (BOOL)_canHaveVelocity;
- (double)_wheelVelocity;
- (int64_t)subtype;
- (int64_t)type;
- (void)_sendEventToResponder:(id)a3;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation UIWheelEvent

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UIWheelEvent;
  -[UIEvent _setHIDEvent:](&v17, sel__setHIDEvent_);
  if ([(UIEvent *)self _hidEvent] && [(UIWheelEvent *)self _canHaveVelocity])
  {
    if (!self->_recentScrollEvents)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      recentScrollEvents = self->_recentScrollEvents;
      self->_recentScrollEvents = v4;
    }
    int64_t lastSubtype = self->lastSubtype;
    if (lastSubtype != [(UIWheelEvent *)self subtype])
    {
      [(NSMutableArray *)self->_recentScrollEvents removeAllObjects];
      self->_recentScrollDistance = 0;
      self->int64_t lastSubtype = [(UIWheelEvent *)self subtype];
    }
    [(UIEvent *)self timestamp];
    double v8 = v7 + -0.5;
    v9 = (void *)[(NSMutableArray *)self->_recentScrollEvents copy];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__UIWheelEvent__setHIDEvent___block_invoke;
    v16[3] = &unk_1E5304328;
    *(double *)&v16[5] = v8;
    v16[4] = self;
    [v9 enumerateObjectsUsingBlock:v16];
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    self->_recentScrollDistance += IntegerValue;
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v12 = NSNumber;
    [(UIEvent *)self timestamp];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    v14 = [NSNumber numberWithInteger:IntegerValue];
    v15 = objc_msgSend(v11, "initWithObjectsAndKeys:", v13, @"scrollTimestamp", v14, @"scrollAmount", 0);

    [(NSMutableArray *)self->_recentScrollEvents addObject:v15];
  }
}

void __29__UIWheelEvent__setHIDEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v6 = [v11 objectForKey:@"scrollTimestamp"];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 >= *(double *)(a1 + 40))
  {
    *a4 = 1;
  }
  else
  {
    v9 = [v11 objectForKey:@"scrollAmount"];
    uint64_t v10 = [v9 integerValue];

    [*(id *)(*(void *)(a1 + 32) + 128) removeObject:v11];
    *(void *)(*(void *)(a1 + 32) + 120) -= v10;
  }
}

- (int64_t)type
{
  return 7;
}

- (int64_t)subtype
{
  if (IOHIDEventGetType() != 6) {
    return 0;
  }
  [(UIEvent *)self _hidEvent];
  if (IOHIDEventGetIntegerValue() >= 0) {
    return 200;
  }
  else {
    return 201;
  }
}

- (void)_sendEventToResponder:(id)a3
{
}

- (BOOL)_canHaveVelocity
{
  return ([(UIWheelEvent *)self subtype] & 0xFFFFFFFFFFFFFFFELL) == 200;
}

- (double)_wheelVelocity
{
  if ([(UIWheelEvent *)self _canHaveVelocity]) {
    return (double)self->_recentScrollDistance + (double)self->_recentScrollDistance;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIWheelEvent;
  [(UIEvent *)&v4 _wheelVelocity];
  return result;
}

- (void).cxx_destruct
{
}

@end
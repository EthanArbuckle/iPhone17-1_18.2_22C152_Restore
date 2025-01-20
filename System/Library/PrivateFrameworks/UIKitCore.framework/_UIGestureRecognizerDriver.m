@interface _UIGestureRecognizerDriver
- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4;
- (BOOL)shouldReceiveEvent:(id)a3;
- (_UIGestureRecognizerDriver)init;
- (_UIGestureRecognizerDriverContext)context;
- (_UIGestureRecognizerDriverDelegate)delegate;
- (id)description;
- (int64_t)state;
- (void)_setState:(int)a3 notifyDelegate:;
- (void)fail;
- (void)reset;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIGestureRecognizerDriver

- (_UIGestureRecognizerDriver)init
{
  v23.receiver = self;
  v23.super_class = (Class)_UIGestureRecognizerDriver;
  v2 = [(_UIGestureRecognizerDriver *)&v23 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v3, sel_touchesBegan_withEvent_);
    v5 = (objc_class *)objc_opt_class();
    *(unsigned char *)&v2->_flags |= MethodImplementation != class_getMethodImplementation(v5, sel_touchesBegan_withEvent_);
    v6 = (objc_class *)objc_opt_class();
    IMP v7 = class_getMethodImplementation(v6, sel_touchesMoved_withEvent_);
    v8 = (objc_class *)objc_opt_class();
    *(unsigned char *)&v2->_flags |= v7 != class_getMethodImplementation(v8, sel_touchesMoved_withEvent_);
    v9 = (objc_class *)objc_opt_class();
    IMP v10 = class_getMethodImplementation(v9, sel_touchesEnded_withEvent_);
    v11 = (objc_class *)objc_opt_class();
    *(unsigned char *)&v2->_flags |= v10 != class_getMethodImplementation(v11, sel_touchesEnded_withEvent_);
    v12 = (objc_class *)objc_opt_class();
    IMP v13 = class_getMethodImplementation(v12, sel_touchesCancelled_withEvent_);
    v14 = (objc_class *)objc_opt_class();
    *(unsigned char *)&v2->_flags |= v13 != class_getMethodImplementation(v14, sel_touchesCancelled_withEvent_);
    v15 = (objc_class *)objc_opt_class();
    IMP v16 = class_getMethodImplementation(v15, sel_transformChangedWithEvent_);
    v17 = (objc_class *)objc_opt_class();
    IMP v18 = class_getMethodImplementation(v17, sel_transformChangedWithEvent_);
    $6FF5F18925EDE1B3D0A1797B7431039E flags = v2->_flags;
    int v20 = (*(unsigned int *)&flags >> 1) & 1;
    if (v16 != v18) {
      int v20 = 1;
    }
    if (v20) {
      char v21 = 2;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v2->_$6FF5F18925EDE1B3D0A1797B7431039E flags = v21 | *(unsigned char *)&flags & 0xFD;
  }
  return v2;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)_setState:(int)a3 notifyDelegate:
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5 != a2 || v5 == 1)
    {
      *(void *)(a1 + 8) = a2;
      [(id)a1 didUpdateState:a2 previousState:v5];
      if (a3)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        [WeakRetained _gestureRecognizerDriver:a1 didUpdateState:a2 previousState:v5];
      }
    }
  }
}

- (void)reset
{
  if (self)
  {
    if (self->_state)
    {
      self->_state = 0;
      -[_UIGestureRecognizerDriver didUpdateState:previousState:](self, "didUpdateState:previousState:", 0);
    }
  }
}

- (void)fail
{
  if (self)
  {
    if (self->_state != 3)
    {
      self->_state = 3;
      -[_UIGestureRecognizerDriver didUpdateState:previousState:](self, "didUpdateState:previousState:", 3);
    }
  }
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return ![a3 type] && (*(unsigned char *)&self->_flags & 1) != 0
      || [a3 type] == 14 && (*(unsigned char *)&self->_flags & 2) != 0;
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIGestureRecognizerDriver;
  v3 = [(_UIGestureRecognizerDriver *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    unint64_t v5 = self->_state - 1;
    if (v5 > 2) {
      v6 = @"possible";
    }
    else {
      v6 = off_1E52FE8F0[v5];
    }
    [v4 appendFormat:@"; state = %@>", v6];
  }
  return v4;
}

- (_UIGestureRecognizerDriverContext)context
{
  return self->_context;
}

- (_UIGestureRecognizerDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIGestureRecognizerDriverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
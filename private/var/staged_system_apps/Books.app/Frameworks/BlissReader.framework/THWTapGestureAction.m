@interface THWTapGestureAction
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (THWTapGestureAction)initWithAction:(id)a3;
- (id)action;
- (void)dealloc;
- (void)setAction:(id)a3;
@end

@implementation THWTapGestureAction

- (THWTapGestureAction)initWithAction:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWTapGestureAction;
  v4 = [(THWTapGestureAction *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THWTapGestureAction *)v4 setAction:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWTapGestureAction;
  [(THWTapGestureAction *)&v3 dealloc];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3 = [a3 gestureKind];
  return v3 == (id)TSDShortTap;
}

- (BOOL)handleGesture:(id)a3
{
  if ([a3 gestureState] == 3)
  {
    action = (void (**)(void))self->_action;
    if (action) {
      action[2]();
    }
    [(THWTapGestureAction *)self setAction:0];
  }
  return 1;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

@end
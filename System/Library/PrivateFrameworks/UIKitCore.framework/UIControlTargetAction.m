@interface UIControlTargetAction
- (BOOL)cancelled;
- (id)description;
- (void)setCancelled:(BOOL)a3;
@end

@implementation UIControlTargetAction

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

- (id)description
{
  v3 = NSString;
  if (self->_actionHandler)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIControlTargetAction;
    v4 = [(UIControlTargetAction *)&v11 description];
    v5 = [v3 stringWithFormat:@"%@ actionHandler=%@ events=0x%lX", v4, self->_actionHandler, self->_eventMask];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControlTargetAction;
    v4 = [(UIControlTargetAction *)&v10 description];
    id WeakRetained = objc_loadWeakRetained(&self->_target);
    if (self->_action) {
      action = self->_action;
    }
    else {
      action = 0;
    }
    v8 = NSStringFromSelector(action);
    v5 = [v3 stringWithFormat:@"%@ target=%p action=%@ events=0x%lX", v4, WeakRetained, v8, self->_eventMask];
  }
  return v5;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
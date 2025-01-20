@interface _PXTimerTarget
- (SEL)selector;
- (id)target;
- (void)handleTimer:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation _PXTimerTarget

- (void).cxx_destruct
{
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)handleTimer:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXTimerTarget *)self target];
  objc_msgSend(v5, "performSelector:withObject:", -[_PXTimerTarget selector](self, "selector"), v4);
}

@end
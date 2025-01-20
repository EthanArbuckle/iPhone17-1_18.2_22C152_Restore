@interface UIGestureRecognizerTarget
- (SEL)action;
- (id)description;
- (id)target;
- (void)_sendActionWithGestureRecognizer:(uint64_t)a1;
@end

@implementation UIGestureRecognizerTarget

- (void).cxx_destruct
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)_sendActionWithGestureRecognizer:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (*(void *)(a1 + 16)) {
      v4 = *(const char **)(a1 + 16);
    }
    else {
      v4 = 0;
    }
    if (dyld_program_sdk_at_least()) {
      objc_msgSend(WeakRetained, v4, a2);
    }
    else {
      objc_msgSend(WeakRetained, sel_performSelector_withObject_, v4, a2);
    }
  }
}

- (id)description
{
  v3 = NSString;
  if (self->_action) {
    action = self->_action;
  }
  else {
    action = 0;
  }
  v5 = NSStringFromSelector(action);
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(p_target);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v10 = objc_loadWeakRetained(p_target);
  v11 = [v3 stringWithFormat:@"(action=%@, target=<%@ %p>)", v5, v9, v10];

  return v11;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

@end
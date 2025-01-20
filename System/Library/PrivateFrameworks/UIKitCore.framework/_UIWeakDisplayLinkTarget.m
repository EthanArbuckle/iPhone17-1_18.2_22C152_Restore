@interface _UIWeakDisplayLinkTarget
+ (SEL)displayLinkAction;
- (_UIWeakDisplayLinkTarget)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_displayLinkTick:(id)a3;
@end

@implementation _UIWeakDisplayLinkTarget

- (void)_displayLinkTick:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (self->_action) {
    action = self->_action;
  }
  else {
    action = 0;
  }
  if (dyld_program_sdk_at_least()) {
    objc_msgSend(WeakRetained, action, v6);
  }
  else {
    objc_msgSend(WeakRetained, sel_performSelector_withObject_, action, v6);
  }
}

- (_UIWeakDisplayLinkTarget)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIWeakDisplayLinkTarget.m", 20, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"_UIWeakDisplayLinkTarget.m", 21, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_UIWeakDisplayLinkTarget;
  v8 = [(_UIWeakDisplayLinkTarget *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_target, v7);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->_action = v10;
  }

  return v9;
}

+ (SEL)displayLinkAction
{
  return sel__displayLinkTick_;
}

- (void).cxx_destruct
{
}

@end
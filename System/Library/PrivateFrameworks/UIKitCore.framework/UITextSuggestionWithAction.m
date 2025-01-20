@interface UITextSuggestionWithAction
- (SEL)action;
- (id)target;
- (void)performActionWihSender:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation UITextSuggestionWithAction

- (void)performActionWihSender:(id)a3
{
  v4 = [(UITextSuggestionWithAction *)self target];
  if (v4)
  {
    id v8 = v4;
    if ([(UITextSuggestionWithAction *)self action])
    {
      v5 = [(UITextSuggestionWithAction *)self target];
      [(UITextSuggestionWithAction *)self action];
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      id v8 = [(UITextSuggestionWithAction *)self target];
      v7 = [(UITextSuggestionWithAction *)self action];
      if (dyld_program_sdk_at_least()) {
        objc_msgSend(v8, v7, self);
      }
      else {
        objc_msgSend(v8, sel_performSelector_withObject_, v7, self);
      }
    }
    v4 = v8;
  }
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
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

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
}

@end
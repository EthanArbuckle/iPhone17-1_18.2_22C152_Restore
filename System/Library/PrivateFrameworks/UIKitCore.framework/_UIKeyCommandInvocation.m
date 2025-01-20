@interface _UIKeyCommandInvocation
- (UIKeyCommand)keyCommand;
- (UIPhysicalKeyboardEvent)triggeringEvent;
- (_UIKeyCommandInvocation)initWithKeyCommand:(id)a3 triggeringEvent:(id)a4 target:(id)a5;
- (id)target;
@end

@implementation _UIKeyCommandInvocation

- (_UIKeyCommandInvocation)initWithKeyCommand:(id)a3 triggeringEvent:(id)a4 target:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyCommandInvocation;
  v12 = [(_UIKeyCommandInvocation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyCommand, a3);
    objc_storeStrong((id *)&v13->_triggeringEvent, a4);
    objc_storeWeak(&v13->_target, v11);
  }

  return v13;
}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (UIPhysicalKeyboardEvent)triggeringEvent
{
  return self->_triggeringEvent;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_triggeringEvent, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

@end
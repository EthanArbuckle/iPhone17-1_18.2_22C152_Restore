@interface _UIUserNotificationRestrictedAlertViewProxy
+ (id)restrictedProxyForAlertView:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)delegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIUserNotificationRestrictedAlertViewProxy

+ (id)restrictedProxyForAlertView:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIUserNotificationRestrictedAlertViewProxy;
  v3 = objc_msgSendSuper2(&v5, sel_proxyWithTarget_, a3);
  return v3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UITargetedProxy *)self _target];
  [v5 setDelegate:0];

  id delegate = self->_delegate;
  self->_id delegate = v4;

  id v7 = [(_UITargetedProxy *)self _target];
  [v7 setDelegate:self];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (isAlertViewDelegateMethod(a3))
  {
    objc_super v5 = [self->_delegate methodSignatureForSelector:a3];
  }
  else
  {
    v6 = [(_UITargetedProxy *)self _target];
    objc_super v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (isAlertViewDelegateMethod(a3))
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    objc_super v5 = [(_UITargetedProxy *)self _target];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (isAlertViewDelegateMethod((SEL)[v4 selector]))
  {
    objc_super v5 = self;
    v12 = v5;
    [v4 setArgument:&v12 atIndex:2];
    [v4 invokeWithTarget:v5->_delegate];
  }
  else
  {
    v6 = (char *)[v4 selector];
    if (!+[UIView instancesRespondToSelector:v6]
      || ([MEMORY[0x1E4FBA8A8] instancesRespondToSelector:v6] & 1) != 0
      || v6 == sel_resignFirstResponder)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UIUserNotificationRestrictedAlertViewProxy;
      [(_UITargetedProxy *)&v11 forwardInvocation:v4];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3A8];
      v9 = NSStringFromSelector((SEL)[v4 selector]);
      v10 = [(_UITargetedProxy *)self _target];
      [v7 raise:v8, @"UIView API (%@) is not supported for UIAlertViews presented from view services: %@", v9, v10 format];
    }
  }
}

- (void).cxx_destruct
{
}

@end
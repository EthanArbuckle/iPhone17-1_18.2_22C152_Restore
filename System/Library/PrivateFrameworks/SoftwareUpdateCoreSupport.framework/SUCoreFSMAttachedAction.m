@interface SUCoreFSMAttachedAction
- (Class)eventInfoClass;
- (NSString)fsmAction;
- (SUCoreFSMAttachedAction)initWithAction:(id)a3 usingDelegate:(id)a4 withInfoClass:(Class)a5;
- (id)actionDelegate;
- (id)description;
@end

@implementation SUCoreFSMAttachedAction

- (id)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_actionDelegate);
  return WeakRetained;
}

- (NSString)fsmAction
{
  return self->_fsmAction;
}

- (Class)eventInfoClass
{
  return self->_eventInfoClass;
}

- (SUCoreFSMAttachedAction)initWithAction:(id)a3 usingDelegate:(id)a4 withInfoClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUCoreFSMAttachedAction;
  v11 = [(SUCoreFSMAttachedAction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fsmAction, a3);
    objc_storeWeak(&v12->_actionDelegate, v10);
    objc_storeStrong((id *)&v12->_eventInfoClass, a5);
  }

  return v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SUCoreFSMAttachedAction *)self fsmAction];
  v5 = [(SUCoreFSMAttachedAction *)self actionDelegate];
  v6 = (void *)[v3 initWithFormat:@"action(%@),delegate(%@),class(%@)", v4, v5, -[SUCoreFSMAttachedAction eventInfoClass](self, "eventInfoClass")];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfoClass, 0);
  objc_destroyWeak(&self->_actionDelegate);
  objc_storeStrong((id *)&self->_fsmAction, 0);
}

@end
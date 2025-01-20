@interface REElementAction
- (BOOL)forceExecution;
- (REElementAction)initWithCoder:(id)a3;
- (REElementActionDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_didFinish:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceExecution:(BOOL)a3;
@end

@implementation REElementAction

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (REElementAction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REElementAction;
  return [(REElementAction *)&v4 init];
}

- (REElementActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REElementActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)_didFinish:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 elementAction:self didFinishTask:v3];
  }
}

- (BOOL)forceExecution
{
  return self->_forceExecution;
}

- (void)setForceExecution:(BOOL)a3
{
  self->_forceExecution = a3;
}

- (void).cxx_destruct
{
}

@end
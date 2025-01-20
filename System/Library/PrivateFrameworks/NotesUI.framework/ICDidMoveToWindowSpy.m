@interface ICDidMoveToWindowSpy
- (ICDidMoveToWindowSpy)initWithOwner:(id)a3 handler:(id)a4;
- (id)handler;
- (id)owner;
- (void)callHandler;
- (void)didMoveToWindow;
- (void)scheduleCallHandler;
@end

@implementation ICDidMoveToWindowSpy

- (ICDidMoveToWindowSpy)initWithOwner:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICDidMoveToWindowSpy;
  v8 = [(ICDidMoveToWindowSpy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    v10 = _Block_copy(v7);
    id handler = v9->_handler;
    v9->_id handler = v10;
  }
  return v9;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)ICDidMoveToWindowSpy;
  [(ICDidMoveToWindowSpy *)&v3 didMoveToWindow];
  [(ICDidMoveToWindowSpy *)self scheduleCallHandler];
}

- (void)scheduleCallHandler
{
  v4[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_callHandler object:0];
  v4[0] = *MEMORY[0x1E4F1C4B0];
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [(ICDidMoveToWindowSpy *)self performSelector:sel_callHandler withObject:0 afterDelay:v3 inModes:0.0];
}

- (void)callHandler
{
  id v4 = [(ICDidMoveToWindowSpy *)self owner];
  if (v4)
  {
    id handler = [(ICDidMoveToWindowSpy *)self handler];
    ((void (**)(void, ICDidMoveToWindowSpy *, id))handler)[2](handler, self, v4);
  }
  else
  {
    id handler = (void (**)(void, void, void))self->_handler;
    self->_id handler = 0;
  }
}

- (id)owner
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  return WeakRetained;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak(&self->_owner);
}

@end
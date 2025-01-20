@interface _UIDragMonitorSessionLifecyleListener
- (_UIDragMonitor)dragMonitor;
- (_UIDragMonitorDelegate)delegate;
- (_UIDragMonitorSessionLifecyleListener)initWithDragMonitor:(id)a3;
- (void)dragDidBeginWithSession:(id)a3 identifier:(unsigned int)a4 reply:(id)a5;
- (void)dragDidEndWithSession:(id)a3;
- (void)dragDidEndWithSession:(id)a3 identifier:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setDragMonitor:(id)a3;
@end

@implementation _UIDragMonitorSessionLifecyleListener

- (_UIDragMonitorSessionLifecyleListener)initWithDragMonitor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDragMonitorSessionLifecyleListener;
  v5 = [(_UIDragMonitorSessionLifecyleListener *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dragMonitor, v4);
  }

  return v6;
}

- (void)dragDidBeginWithSession:(id)a3 identifier:(unsigned int)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82___UIDragMonitorSessionLifecyleListener_dragDidBeginWithSession_identifier_reply___block_invoke;
  v12[3] = &unk_1E52FC6A0;
  unsigned int v16 = a4;
  id v13 = v8;
  v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

- (void)dragDidEndWithSession:(id)a3
{
}

- (void)dragDidEndWithSession:(id)a3 identifier:(unsigned int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74___UIDragMonitorSessionLifecyleListener_dragDidEndWithSession_identifier___block_invoke;
  v4[3] = &unk_1E52E7FF0;
  v4[4] = self;
  unsigned int v5 = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

- (_UIDragMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIDragMonitor)dragMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragMonitor);
  return (_UIDragMonitor *)WeakRetained;
}

- (void)setDragMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragMonitor);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
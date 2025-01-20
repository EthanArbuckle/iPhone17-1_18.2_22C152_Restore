@interface _UIDragMonitor
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)activeConnections;
- (NSString)serviceName;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)xpcQueue;
- (_UIDragMonitor)initWithMachServiceName:(id)a3;
- (_UIDragMonitorDelegate)delegate;
- (_UIDragMonitorSessionLifecyleListener)lifecycleListener;
- (void)_tearDownConnections;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setActiveConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLifecycleListener:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)setXpcQueue:(id)a3;
@end

@implementation _UIDragMonitor

- (_UIDragMonitor)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIDragMonitor;
  v5 = [(_UIDragMonitor *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v4];
    xpcListener = v5->_xpcListener;
    v5->_xpcListener = (NSXPCListener *)v8;

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.UIKit.uidragmonitor.xpcQueue", v10);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v11;

    [(NSXPCListener *)v5->_xpcListener _setQueue:v5->_xpcQueue];
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    activeConnections = v5->_activeConnections;
    v5->_activeConnections = (NSMutableArray *)v13;

    v15 = [[_UIDragMonitorSessionLifecyleListener alloc] initWithDragMonitor:v5];
    lifecycleListener = v5->_lifecycleListener;
    v5->_lifecycleListener = v15;
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _DUIDragSessionLifecycleListeningInterface();
  [v7 setExportedInterface:v8];

  v9 = [(_UIDragMonitor *)self activeConnections];
  [v9 addObject:v7];

  v10 = [(_UIDragMonitor *)self lifecycleListener];
  [v7 setExportedObject:v10];

  dispatch_queue_t v11 = [(_UIDragMonitor *)self xpcQueue];
  [v7 _setQueue:v11];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __53___UIDragMonitor_listener_shouldAcceptNewConnection___block_invoke;
  v16 = &unk_1E52DA7A0;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  [v7 setInvalidationHandler:&v13];
  objc_msgSend(v7, "resume", v13, v14, v15, v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(_UIDragMonitor *)self lifecycleListener];
  [v6 setDelegate:v5];
}

- (void)activate
{
  v3 = [(_UIDragMonitor *)self xpcListener];
  [v3 setDelegate:self];

  id v4 = [(_UIDragMonitor *)self xpcListener];
  [v4 activate];
}

- (void)invalidate
{
  v3 = [(_UIDragMonitor *)self xpcListener];
  [v3 invalidate];

  [(_UIDragMonitor *)self _tearDownConnections];
}

- (void)_tearDownConnections
{
  v3 = [(_UIDragMonitor *)self xpcQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___UIDragMonitor__tearDownConnections__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)dealloc
{
  [(_UIDragMonitor *)self _tearDownConnections];
  v3.receiver = self;
  v3.super_class = (Class)_UIDragMonitor;
  [(_UIDragMonitor *)&v3 dealloc];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (_UIDragMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragMonitorDelegate *)WeakRetained;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (_UIDragMonitorSessionLifecyleListener)lifecycleListener
{
  return self->_lifecycleListener;
}

- (void)setLifecycleListener:(id)a3
{
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_lifecycleListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
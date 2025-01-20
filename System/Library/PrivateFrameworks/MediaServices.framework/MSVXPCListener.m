@interface MSVXPCListener
- (MSVXPCListener)initWithMachServiceName:(id)a3;
- (id)localProxy;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation MSVXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxy, 0);
  objc_storeStrong((id *)&self->_registeredServiceName, 0);
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSVXPCListener;
  id v4 = a3;
  [(MSVXPCListener *)&v5 setDelegate:v4];
  -[NSXPCListener setDelegate:](self->_localProxy, "setDelegate:", v4, v5.receiver, v5.super_class);
}

- (void)suspend
{
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  [(MSVXPCListener *)&v3 suspend];
  [(NSXPCListener *)self->_localProxy suspend];
}

- (void)resume
{
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  [(MSVXPCListener *)&v3 resume];
  [(NSXPCListener *)self->_localProxy resume];
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  [(MSVXPCListener *)&v3 invalidate];
  [(NSXPCListener *)self->_localProxy invalidate];
}

- (void)activate
{
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  [(MSVXPCListener *)&v3 activate];
  [(NSXPCListener *)self->_localProxy activate];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_localProxy invalidate];
  +[MSVXPCConnection unregisterLocalListerWithName:self->_registeredServiceName];
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  [(MSVXPCListener *)&v3 dealloc];
}

- (id)localProxy
{
  return self->_localProxy;
}

- (MSVXPCListener)initWithMachServiceName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSVXPCListener;
  v6 = [(MSVXPCListener *)&v10 initWithMachServiceName:v5];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    localProxy = v6->_localProxy;
    v6->_localProxy = (NSXPCListener *)v7;

    objc_storeStrong((id *)&v6->_registeredServiceName, a3);
    +[MSVXPCConnection registerLocalListener:v6 withServiceName:v6->_registeredServiceName];
  }

  return v6;
}

@end
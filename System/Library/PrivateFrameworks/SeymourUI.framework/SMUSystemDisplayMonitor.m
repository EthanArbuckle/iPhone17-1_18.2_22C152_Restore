@interface SMUSystemDisplayMonitor
- (FBSDisplayMonitor)displayMonitor;
- (NSSet)connectedIdentities;
- (SMUSystemDisplayIdentity)mainIdentity;
- (SMUSystemDisplayMonitor)init;
- (id)onDisplayConnected;
- (id)onDisplayDisconnected;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)setOnDisplayConnected:(id)a3;
- (void)setOnDisplayDisconnected:(id)a3;
@end

@implementation SMUSystemDisplayMonitor

- (void)setOnDisplayDisconnected:(id)a3
{
}

- (void)setOnDisplayConnected:(id)a3
{
}

- (NSSet)connectedIdentities
{
  v2 = [(SMUSystemDisplayMonitor *)self displayMonitor];
  v3 = [v2 connectedIdentities];

  return (NSSet *)v3;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)dealloc
{
  [(FBSDisplayMonitor *)self->_displayMonitor removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SMUSystemDisplayMonitor;
  [(SMUSystemDisplayMonitor *)&v3 dealloc];
}

- (SMUSystemDisplayMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SMUSystemDisplayMonitor;
  v2 = [(SMUSystemDisplayMonitor *)&v6 init];
  if (v2)
  {
    objc_super v3 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x263F3F750]);
    displayMonitor = v2->_displayMonitor;
    v2->_displayMonitor = v3;

    [(FBSDisplayMonitor *)v2->_displayMonitor addObserver:v2];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong(&self->onDisplayDisconnected, 0);

  objc_storeStrong(&self->onDisplayConnected, 0);
}

- (SMUSystemDisplayIdentity)mainIdentity
{
  v2 = [(SMUSystemDisplayMonitor *)self displayMonitor];
  objc_super v3 = [v2 mainIdentity];

  return (SMUSystemDisplayIdentity *)v3;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6 = a4;
  v7 = [(SMUSystemDisplayMonitor *)self onDisplayConnected];
  v7[2](v7, v6);
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5 = a4;
  id v6 = [(SMUSystemDisplayMonitor *)self onDisplayDisconnected];
  v6[2](v6, v5);
}

- (id)onDisplayConnected
{
  return self->onDisplayConnected;
}

- (id)onDisplayDisconnected
{
  return self->onDisplayDisconnected;
}

@end
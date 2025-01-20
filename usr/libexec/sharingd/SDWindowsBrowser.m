@interface SDWindowsBrowser
- (NSArray)nodes;
- (NSString)workgroup;
- (SDWindowsBrowser)initWithWorkgroup:(id)a3;
- (SDWindowsBrowserDelegate)delegate;
- (void)bonjourNodesDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDWindowsBrowser

- (SDWindowsBrowser)initWithWorkgroup:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDWindowsBrowser;
  v6 = [(SDWindowsBrowser *)&v10 init];
  v7 = v6;
  if (v6)
  {
    browser = v6->_browser;
    v6->_browser = 0;

    objc_storeStrong((id *)&v7->_workgroup, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SDWindowsBrowser *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDWindowsBrowser;
  [(SDWindowsBrowser *)&v3 dealloc];
}

- (NSArray)nodes
{
  return [(SDBonjourBrowser *)self->_browser nodes];
}

- (void)bonjourNodesDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained windowsNodesDidChange:self];
}

- (void)start
{
  if (!self->_browser)
  {
    objc_super v3 = [SDBonjourBrowser alloc];
    workgroup = self->_workgroup;
    CFStringRef v8 = @"_netbios._udp.";
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
    v6 = [(SDBonjourBrowser *)v3 initWithDomain:workgroup types:v5];
    browser = self->_browser;
    self->_browser = v6;

    [(SDBonjourBrowser *)self->_browser setDelegate:self];
    [(SDBonjourBrowser *)self->_browser start];
  }
}

- (void)stop
{
  browser = self->_browser;
  if (browser)
  {
    [(SDBonjourBrowser *)browser setDelegate:0];
    [(SDBonjourBrowser *)self->_browser invalidate];
    v4 = self->_browser;
    self->_browser = 0;
  }
}

- (NSString)workgroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SDWindowsBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDWindowsBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workgroup, 0);

  objc_storeStrong((id *)&self->_browser, 0);
}

@end
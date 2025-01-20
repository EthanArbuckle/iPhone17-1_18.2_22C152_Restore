@interface NRNSXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NRNSXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[NRNSXPCConnection alloc] initWithConnection:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listenerDelegate);
  LOBYTE(self) = [WeakRetained listener:self shouldAcceptNewConnection:v6];

  return (char)self;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listenerDelegate, a3);
  if (a3) {
    -[NRNSXPCListener setDelegate:](&v6, sel_setDelegate_, self, v5.receiver, v5.super_class, self, NRNSXPCListener);
  }
  else {
    -[NRNSXPCListener setDelegate:](&v5, sel_setDelegate_, 0, self, NRNSXPCListener, v6.receiver, v6.super_class);
  }
}

- (void).cxx_destruct
{
}

@end
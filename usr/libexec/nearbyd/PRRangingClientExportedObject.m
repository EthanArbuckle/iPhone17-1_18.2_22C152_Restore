@interface PRRangingClientExportedObject
- (PRRangingClientExportedObject)initWithRangingClient:(id)a3;
- (PRRangingClientProtocol)rangingClient;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)sendDataToPeers:(id)a3;
- (void)setRangingClient:(id)a3;
@end

@implementation PRRangingClientExportedObject

- (PRRangingClientExportedObject)initWithRangingClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRRangingClientExportedObject;
  v5 = [(PRRangingClientExportedObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_rangingClient, v4);
  }

  return v6;
}

- (void)didFailWithError:(id)a3
{
  p_rangingClient = &self->_rangingClient;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didFailWithError:v4];
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  [WeakRetained rangingServiceDidUpdateState:a3 cause:a4];
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didReceiveNewSolutions:v5];
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained rangingRequestDidUpdateStatus:a3];
  }
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteDevice:v7 didChangeState:a4];
  }
}

- (void)sendDataToPeers:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sendDataToPeers:v5];
  }
}

- (PRRangingClientProtocol)rangingClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);

  return (PRRangingClientProtocol *)WeakRetained;
}

- (void)setRangingClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
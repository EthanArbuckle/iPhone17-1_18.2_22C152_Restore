@interface PRBTRangingClientExportedObject
- (PRBTRangingClientExportedObject)initWithRangingClient:(id)a3;
- (PRBTRangingClientProtocol)rangingClient;
- (void)didConnectDevice:(id)a3 error:(id)a4;
- (void)didFailWithError:(id)a3;
- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5;
- (void)didReceiveNewBTRSSI:(id)a3;
- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4;
- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4;
- (void)setRangingClient:(id)a3;
@end

@implementation PRBTRangingClientExportedObject

- (PRBTRangingClientExportedObject)initWithRangingClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRBTRangingClientExportedObject;
  v5 = [(PRBTRangingClientExportedObject *)&v8 init];
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

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  p_rangingClient = &self->_rangingClient;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didFetchTxPower:v10 fromDevice:v9 withError:v8];
}

- (void)didConnectDevice:(id)a3 error:(id)a4
{
  p_rangingClient = &self->_rangingClient;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didConnectDevice:v7 error:v6];
}

- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4
{
  p_rangingClient = &self->_rangingClient;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didStartRangingOnDevice:v7 withError:v6];
}

- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4
{
  p_rangingClient = &self->_rangingClient;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didStopOwnerRangingOnDevice:v7 withError:v6];
}

- (void)didReceiveNewBTRSSI:(id)a3
{
  p_rangingClient = &self->_rangingClient;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  [WeakRetained didReceiveNewBTRSSI:v4];
}

- (PRBTRangingClientProtocol)rangingClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  return (PRBTRangingClientProtocol *)WeakRetained;
}

- (void)setRangingClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
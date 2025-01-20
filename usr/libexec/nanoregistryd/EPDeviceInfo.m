@interface EPDeviceInfo
- (BOOL)deviceWasHere;
- (BOOL)hasClassicDevice;
- (BOOL)isPairing;
- (CBPeer)peer;
- (EPDevice)device;
- (EPDeviceInfo)initWithPeer:(id)a3;
- (EPDeviceInfoDelegate)delegate;
- (EPPeripheralObserverFactory)peripheralFactory;
- (EPResourceManagerProtocol)connectors;
- (NSString)btAddress;
- (NSUUID)uuid;
- (id)initBase;
- (id)newCentralDevice;
- (id)newClassicDevice;
- (id)newConnectorWithDelegate:(id)a3;
- (id)newPeripheralDeviceWithAdvertisementData:(id)a3 withRSSI:(id)a4;
- (void)dealloc;
- (void)device:(id)a3 peerDidInvalidate:(id)a4;
- (void)deviceDidDeallocate:(id)a3;
- (void)devicePairingFailure:(id)a3;
- (void)devicePairingSuccess:(id)a3;
- (void)reset;
- (void)setConnectors:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceWasHere:(BOOL)a3;
@end

@implementation EPDeviceInfo

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)EPDeviceInfo;
  return [(EPDeviceInfo *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EPDeviceInfo;
  [(EPDeviceInfo *)&v2 dealloc];
}

- (EPDeviceInfo)initWithPeer:(id)a3
{
  id v5 = a3;
  v6 = [(EPDeviceInfo *)self initBase];
  v7 = (EPDeviceInfo *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 4, a3);
    uint64_t v8 = [v5 identifier];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;
  }
  return v7;
}

- (id)newPeripheralDeviceWithAdvertisementData:(id)a3 withRSSI:(id)a4
{
  self->_deviceWasHere = 1;
  id v5 = +[EPDevice newDeviceWithInfo:self withAdvertisementData:a3 withRSSI:a4];
  objc_storeWeak((id *)&self->_device, v5);
  return v5;
}

- (id)newCentralDevice
{
  self->_deviceWasHere = 1;
  id v3 = +[EPDevice newDeviceWithInfo:self];
  objc_storeWeak((id *)&self->_device, v3);
  return v3;
}

- (id)newClassicDevice
{
  self->_deviceWasHere = 1;
  id v3 = +[EPDevice newClassicDeviceWithInfo:self];
  objc_storeWeak((id *)&self->_device, v3);
  return v3;
}

- (void)reset
{
  peripheralFactory = self->_peripheralFactory;
  self->_peripheralFactory = 0;

  peer = self->_peer;
  self->_peer = 0;

  connectors = self->_connectors;
  self->_connectors = 0;
}

- (BOOL)isPairing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  unsigned __int8 v3 = [WeakRetained isPairing];

  return v3;
}

- (void)deviceDidDeallocate:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deviceInfoDeviceDidDeallocate:self];

  [(EPDeviceInfo *)self reset];
}

- (void)device:(id)a3 peerDidInvalidate:(id)a4
{
  id v6 = a4;
  if (self->_peer) {
    [(EPDeviceInfo *)self reset];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deviceInfo:self peerDidInvalidate:v6];
}

- (void)devicePairingFailure:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 deviceInfoPairingFailure:self];
  }
}

- (void)devicePairingSuccess:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 deviceInfoPairingSuccess:self];
  }
}

- (EPPeripheralObserverFactory)peripheralFactory
{
  if (!self->_peripheralFactory)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v3 = self->_peer;
      v4 = [[EPPeripheralObserverFactory alloc] initWithPeripheral:v3];
      peripheralFactory = self->_peripheralFactory;
      self->_peripheralFactory = v4;
    }
  }
  char v6 = self->_peripheralFactory;

  return v6;
}

- (id)newConnectorWithDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (WeakRetained)
  {
    if (!self->_connectors)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v6 = [(EPDeviceInfo *)self peripheralFactory];
        id v7 = [v6 connectorManager];
      }
      else
      {
        v9 = [EPNullResourceManager alloc];
        char v6 = +[EPFactory queue];
        id v7 = [(EPResourceManager *)v9 initWithQueue:v6];
      }
      connectors = self->_connectors;
      self->_connectors = v7;
    }
    id v8 = [(EPResourceManagerProtocol *)self->_connectors newResourceWithDelegate:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CBPeer)peer
{
  return self->_peer;
}

- (BOOL)hasClassicDevice
{
  return self->_hasClassicDevice;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (EPDeviceInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPDeviceInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)deviceWasHere
{
  return self->_deviceWasHere;
}

- (void)setDeviceWasHere:(BOOL)a3
{
  self->_deviceWasHere = a3;
}

- (EPDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (EPDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (EPResourceManagerProtocol)connectors
{
  return self->_connectors;
}

- (void)setConnectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectors, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_peripheralFactory, 0);

  objc_storeStrong((id *)&self->me, 0);
}

@end
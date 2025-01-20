@interface MRAVExternalRoutingDiscoverySession
- (BOOL)devicePresenceDetected;
- (MRAVEndpoint)destination;
- (MRAVExternalRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (MRExternalDevice)externalDevice;
- (id)debugDescription;
- (id)description;
- (id)destinationOutputDeviceUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)dealloc;
- (void)setDestination:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setExternalDevice:(id)a3;
@end

@implementation MRAVExternalRoutingDiscoverySession

- (MRAVExternalRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRAVExternalRoutingDiscoverySession;
  v7 = [(MRAVRoutingDiscoverySession *)&v19 initWithConfiguration:v6];
  if (v7)
  {
    v8 = [v6 outputDeviceUID];

    if (!v8)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v7, @"MRAVExternalRoutingDiscoverySession.m", 33, @"Invalid parameter not satisfying: %@", @"configuration.outputDeviceUID" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_configuration, a3);
    objc_initWeak(&location, v7);
    v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke;
    v16[3] = &unk_1E57D17C0;
    id v17 = v6;
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke_2;
    v14[3] = &unk_1E57D17E8;
    objc_copyWeak(&v15, &location);
    [(MRAVLightweightReconnaissanceSession *)v9 searchEndpointsWithPredicate:v16 timeout:@"MRAVExternalRoutingDiscoverySession" reason:v10 queue:v14 completion:7.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 designatedGroupLeader];
  int v5 = [v4 canBeAirPlayReceiver];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) outputDeviceUID];
    uint64_t v7 = [v3 containsOutputDeviceWithUID:v6];
  }
  else
  {
    id v6 = [v3 designatedGroupLeader];
    v8 = [v6 uid];
    v9 = [*(id *)(a1 + 32) outputDeviceUID];
    uint64_t v7 = [v8 isEqualToString:v9];
  }
  return v7;
}

void __61__MRAVExternalRoutingDiscoverySession_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setDestination:v3];
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = MRMediaRemoteEndpointFeaturesDescription([(MRAVExternalRoutingDiscoverySession *)v2 endpointFeatures]);
  id v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v2->_discoveryMode);
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p> (%@ - %@)", v4, v2, v5, v6];

  objc_sync_exit(v2);

  return v7;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = NSString;
  uint64_t v4 = [(MRAVExternalRoutingDiscoverySession *)v2 description];
  int v5 = [(MRAVExternalRoutingDiscoverySession *)v2 availableOutputDevices];
  id v6 = [v3 stringWithFormat:@"%@\n%@", v4, v5];

  objc_sync_exit(v2);

  return v6;
}

- (void)dealloc
{
  if (self->_externalDeviceDiscoveryToken) {
    -[MRExternalDevice unregisterDiscoveryToken:](self->_externalDevice, "unregisterDiscoveryToken:");
  }
  v3.receiver = self;
  v3.super_class = (Class)MRAVExternalRoutingDiscoverySession;
  [(MRAVExternalRoutingDiscoverySession *)&v3 dealloc];
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_discoveryMode != v3)
  {
    obj->_unsigned int discoveryMode = v3;
    [(MRExternalDevice *)obj->_externalDevice setDiscoveryMode:v3 forToken:obj->_externalDeviceDiscoveryToken];
  }
  objc_sync_exit(obj);
}

- (unsigned)endpointFeatures
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(MRAVRoutingDiscoverySessionConfiguration *)v2->_configuration features];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)devicePresenceDetected
{
  if ([(MRAVExternalRoutingDiscoverySession *)self endpointFeatures])
  {
    uint64_t v4 = [(MRAVExternalRoutingDiscoverySession *)self availableOutputDevices];
LABEL_6:
    int v5 = v4;
    BOOL v3 = [v4 count] != 0;

    return v3;
  }
  if (([(MRAVExternalRoutingDiscoverySession *)self endpointFeatures] & 8) != 0)
  {
    uint64_t v4 = [(MRAVExternalRoutingDiscoverySession *)self availableEndpoints];
    goto LABEL_6;
  }
  return 0;
}

- (void)setDestination:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_destination, a3);
  if (v5)
  {
    uint64_t v10 = @"MREndpointConnectionReasonUserInfoKey";
    v11[0] = @"MRAVExternalRoutingDiscoverySession";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__MRAVExternalRoutingDiscoverySession_setDestination___block_invoke;
    v8[3] = &unk_1E57D1810;
    v8[4] = v6;
    id v9 = v5;
    [v9 connectToExternalDeviceWithUserInfo:v7 completion:v8];
  }
  else
  {
    [(MRAVExternalRoutingDiscoverySession *)v6 setExternalDevice:0];
  }
  objc_sync_exit(v6);
}

void __54__MRAVExternalRoutingDiscoverySession_setDestination___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4 == *(void **)(*(void *)(a1 + 32) + 160))
  {
    id v5 = [v4 externalDevice];
    [*(id *)(a1 + 32) setExternalDevice:v5];
  }
  objc_sync_exit(v3);
}

- (id)destinationOutputDeviceUID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MRAVRoutingDiscoverySessionConfiguration *)v2->_configuration outputDeviceUID];
  objc_sync_exit(v2);

  return v3;
}

- (void)setExternalDevice:(id)a3
{
  id v5 = a3;
  if (self->_externalDeviceDiscoveryToken) {
    -[MRExternalDevice unregisterDiscoveryToken:](self->_externalDevice, "unregisterDiscoveryToken:");
  }
  objc_storeStrong((id *)&self->_externalDevice, a3);
  objc_initWeak(&location, self);
  id v6 = [(MRExternalDevice *)self->_externalDevice registerDiscoveryTokenForConfiguration:self->_configuration];
  id externalDeviceDiscoveryToken = self->_externalDeviceDiscoveryToken;
  self->_id externalDeviceDiscoveryToken = v6;

  externalDevice = self->_externalDevice;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke;
  v12 = &unk_1E57D1860;
  objc_copyWeak(&v13, &location);
  [(MRExternalDevice *)externalDevice setDiscoveryOutputDevicesChangedCallback:&v9 forToken:self->_externalDeviceDiscoveryToken];
  -[MRExternalDevice setDiscoveryMode:forToken:](self->_externalDevice, "setDiscoveryMode:forToken:", self->_discoveryMode, self->_externalDeviceDiscoveryToken, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke_2;
    v7[3] = &unk_1E57D1838;
    v7[4] = WeakRetained;
    id v6 = objc_msgSend(v3, "msv_map:", v7);
    [v5 notifyOutputDevicesChanged:v6];
  }
}

MRAVDistantOutputDevice *__57__MRAVExternalRoutingDiscoverySession_setExternalDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocalDevice])
  {
    uint64_t v4 = [*(id *)(a1 + 32) destination];
    id v5 = [*(id *)(a1 + 32) destinationOutputDeviceUID];
    id v6 = [v4 outputDeviceWithUID:v5];
  }
  else
  {
    id v6 = v3;
  }
  uint64_t v7 = [v6 descriptor];
  if ([v3 isLocalDevice]) {
    objc_msgSend(v7, "setIsGroupable:", objc_msgSend(v3, "isGroupable"));
  }
  v8 = [*(id *)(a1 + 32) destination];
  uint64_t v9 = [v8 designatedGroupLeader];
  objc_msgSend(v7, "setTransportType:", objc_msgSend(v9, "transportType"));

  uint64_t v10 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v7];

  return v10;
}

- (MRAVEndpoint)destination
{
  return self->_destination;
}

- (MRExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong(&self->_externalDeviceDiscoveryToken, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
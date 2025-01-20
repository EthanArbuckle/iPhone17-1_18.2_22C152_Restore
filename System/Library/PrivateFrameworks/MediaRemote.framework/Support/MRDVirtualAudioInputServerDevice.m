@interface MRDVirtualAudioInputServerDevice
- (MRDMediaRemoteClient)owningClient;
- (MRDVirtualAudioInputServerDevice)initWithOwningClient:(id)a3;
@end

@implementation MRDVirtualAudioInputServerDevice

- (MRDVirtualAudioInputServerDevice)initWithOwningClient:(id)a3
{
  id v5 = a3;
  uint64_t v6 = atomic_fetch_add_explicit(dword_10047DFE8, 1u, memory_order_relaxed) + 1;
  v10.receiver = self;
  v10.super_class = (Class)MRDVirtualAudioInputServerDevice;
  v7 = [(MRDVirtualAudioInputServerDevice *)&v10 initWithDeviceID:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_owningClient, a3);
  }

  return v8;
}

- (MRDMediaRemoteClient)owningClient
{
  return self->_owningClient;
}

- (void).cxx_destruct
{
}

@end
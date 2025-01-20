@interface MRDeviceInfoOutputDevice
- (BOOL)canAccessAppleMusic;
- (BOOL)canAccessRemoteAssets;
- (BOOL)canAccessiCloudMusicLibrary;
- (BOOL)exporting;
- (BOOL)groupContainsGroupLeader;
- (BOOL)isAirPlayReceiverSessionActive;
- (BOOL)isGroupLeader;
- (BOOL)isGroupable;
- (BOOL)isLocalDevice;
- (BOOL)isProxyGroupPlayer;
- (BOOL)isRemoteControllable;
- (BOOL)isVolumeMuted;
- (BOOL)parentGroupContainsDiscoverableLeader;
- (BOOL)shouldBeLocallyHosted;
- (BOOL)supportsBufferedAirPlay;
- (BOOL)supportsMultiplayer;
- (MRAVOutputDevice)fallbackOutputDevice;
- (MRDeviceInfo)deviceInfo;
- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3;
- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 fallbackOutputDevice:(id)a4 forExporting:(BOOL)a5;
- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 forExporting:(BOOL)a4;
- (float)volume;
- (id)airPlayGroupID;
- (id)avOutputDevice;
- (id)clusterComposition;
- (id)clusterCompositionMembers;
- (id)clusterCompositionOutputDevices;
- (id)modelID;
- (id)name;
- (id)parentGroupIdentifier;
- (id)uid;
- (int64_t)hostDeviceClass;
- (unint64_t)configuredClusterSize;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (unsigned)volumeCapabilities;
- (void)setExporting:(BOOL)a3;
- (void)setFallbackOutputDevice:(id)a3;
@end

@implementation MRDeviceInfoOutputDevice

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3
{
  return [(MRDeviceInfoOutputDevice *)self initWithDeviceInfo:a3 forExporting:0];
}

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 forExporting:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDeviceInfoOutputDevice;
  v7 = [(MRDeviceInfoOutputDevice *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    deviceInfo = v7->_deviceInfo;
    v7->_deviceInfo = (MRDeviceInfo *)v8;

    v7->_exporting = a4;
  }

  return v7;
}

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 fallbackOutputDevice:(id)a4 forExporting:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v10 = [(MRDeviceInfoOutputDevice *)self initWithDeviceInfo:a3 forExporting:v5];
  objc_super v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_fallbackOutputDevice, a4);
  }

  return v11;
}

- (id)uid
{
  return [(MRDeviceInfo *)self->_deviceInfo deviceUID];
}

- (id)name
{
  unsigned int v3 = [(MRDeviceInfo *)self->_deviceInfo clusterType];
  deviceInfo = self->_deviceInfo;
  if (v3) {
    [(MRDeviceInfo *)deviceInfo groupName];
  }
  else {
  BOOL v5 = [(MRDeviceInfo *)deviceInfo computerName];
  }

  return v5;
}

- (id)modelID
{
  return [(MRDeviceInfo *)self->_deviceInfo modelID];
}

- (id)parentGroupIdentifier
{
  return [(MRDeviceInfo *)self->_deviceInfo parentGroupID];
}

- (id)airPlayGroupID
{
  return [(MRDeviceInfo *)self->_deviceInfo airPlayGroupUID];
}

- (BOOL)isGroupable
{
  return 1;
}

- (BOOL)isRemoteControllable
{
  return 1;
}

- (BOOL)supportsMultiplayer
{
  return [(MRDeviceInfo *)self->_deviceInfo supportsMultiplayer];
}

- (BOOL)canAccessAppleMusic
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice canAccessAppleMusic];
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice canAccessiCloudMusicLibrary];
}

- (BOOL)canAccessRemoteAssets
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice canAccessRemoteAssets];
}

- (BOOL)supportsBufferedAirPlay
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice supportsBufferedAirPlay];
}

- (BOOL)isLocalDevice
{
  if ([(MRDeviceInfoOutputDevice *)self exporting]) {
    return 0;
  }
  v4 = [(MRDeviceInfoOutputDevice *)self uid];
  BOOL v5 = (void *)MRMediaRemoteCopyDeviceUID();
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)shouldBeLocallyHosted
{
  return 1;
}

- (unsigned)deviceType
{
  return 1;
}

- (unsigned)deviceSubtype
{
  if ([(MRDeviceInfo *)self->_deviceInfo clusterType]) {
    return 15;
  }
  int64_t v4 = [(MRDeviceInfoOutputDevice *)self hostDeviceClass];
  if ((unint64_t)(v4 - 1) > 6) {
    return 0;
  }
  else {
    return dword_195224728[v4 - 1];
  }
}

- (int64_t)hostDeviceClass
{
  return [(MRDeviceInfo *)self->_deviceInfo deviceClass];
}

- (id)avOutputDevice
{
  return 0;
}

- (float)volume
{
  [(MRAVOutputDevice *)self->_fallbackOutputDevice volume];
  return result;
}

- (unsigned)volumeCapabilities
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice volumeCapabilities];
}

- (BOOL)isVolumeMuted
{
  return [(MRAVOutputDevice *)self->_fallbackOutputDevice isVolumeMuted];
}

- (unsigned)clusterType
{
  return [(MRDeviceInfo *)self->_deviceInfo clusterType];
}

- (BOOL)isProxyGroupPlayer
{
  return [(MRDeviceInfo *)self->_deviceInfo isProxyGroupPlayer];
}

- (BOOL)isGroupLeader
{
  return [(MRDeviceInfo *)self->_deviceInfo isGroupLeader];
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return [(MRDeviceInfo *)self->_deviceInfo isAirPlayActive];
}

- (BOOL)groupContainsGroupLeader
{
  return [(MRDeviceInfo *)self->_deviceInfo groupContainsDiscoverableGroupLeader];
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return [(MRDeviceInfo *)self->_deviceInfo parentGroupContainsDiscoverableGroupLeader];
}

- (id)clusterComposition
{
  v2 = [(MRDeviceInfo *)self->_deviceInfo clusteredDevices];
  unsigned int v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_107);

  return v3;
}

MRAVOutputDeviceDescription *__46__MRDeviceInfoOutputDevice_clusterComposition__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = [MRAVOutputDeviceDescription alloc];
  int64_t v4 = [v2 deviceUID];
  BOOL v5 = [v2 computerName];
  char v6 = [v2 modelID];

  v7 = [(MRAVOutputDeviceDescription *)v3 initWithDeviceType:1 deviceSubtype:12 uid:v4 name:v5 modelID:v6];

  return v7;
}

- (id)clusterCompositionMembers
{
  unsigned int v3 = [(MRDeviceInfo *)self->_deviceInfo allClusteredDevices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MRDeviceInfoOutputDevice_clusterCompositionMembers__block_invoke;
  v6[3] = &unk_1E57D9C10;
  v6[4] = self;
  int64_t v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

id __53__MRDeviceInfoOutputDevice_clusterCompositionMembers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceInfo:forExporting:", v3, objc_msgSend(*(id *)(a1 + 32), "exporting"));

  return v4;
}

- (id)clusterCompositionOutputDevices
{
  id v3 = [(MRDeviceInfo *)self->_deviceInfo allClusteredDevices];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MRDeviceInfoOutputDevice_clusterCompositionOutputDevices__block_invoke;
  v6[3] = &unk_1E57D9C10;
  v6[4] = self;
  int64_t v4 = objc_msgSend(v3, "msv_map:", v6);

  return v4;
}

id __59__MRDeviceInfoOutputDevice_clusterCompositionOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceInfo:forExporting:", v3, objc_msgSend(*(id *)(a1 + 32), "exporting"));

  return v4;
}

- (unint64_t)configuredClusterSize
{
  return [(MRDeviceInfo *)self->_deviceInfo configuredClusterSize];
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (BOOL)exporting
{
  return self->_exporting;
}

- (void)setExporting:(BOOL)a3
{
  self->_exporting = a3;
}

- (MRAVOutputDevice)fallbackOutputDevice
{
  return self->_fallbackOutputDevice;
}

- (void)setFallbackOutputDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackOutputDevice, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
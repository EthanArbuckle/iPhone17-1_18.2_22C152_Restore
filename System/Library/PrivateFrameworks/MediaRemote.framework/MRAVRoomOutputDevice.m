@interface MRAVRoomOutputDevice
+ (id)calculateOutputDeviceIDFromOutputDeviceID:(id)a3 withRoomID:(id)a4;
- (BOOL)containsUID:(id)a3;
- (BOOL)isPickable;
- (BOOL)isVolumeMuted;
- (MRAVConcreteOutputDevice)concreteOutputDevice;
- (MRAVOutputDevice)outputDevice;
- (MRAVOutputDevice)roomMemberOutputDevice;
- (MRAVRoomOutputDevice)initWithOutputDevice:(id)a3 memberOutputDevices:(id)a4;
- (NSArray)roomMemberOutputDevices;
- (NSString)label;
- (float)volume;
- (id)clusterComposition;
- (id)debugName;
- (id)modelID;
- (id)parentUID;
- (id)primaryID;
- (id)roomID;
- (id)roomName;
- (id)uid;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
- (unsigned)volumeCapabilities;
- (void)adjustVolume:(int64_t)a3 details:(id)a4;
- (void)setVolumeMuted:(BOOL)a3 details:(id)a4;
@end

@implementation MRAVRoomOutputDevice

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)MEMORY[0x1E4F28E78];
  id v8 = a4;
  id v9 = [v7 alloc];
  v10 = [v8 requestID];

  v11 = (void *)[v9 initWithFormat:@"%@<%@>", @"MRAVRoomOutputDevice.muteVolume", v10];
  v12 = [NSNumber numberWithBool:v4];

  if (v12)
  {
    v13 = [NSNumber numberWithBool:v4];
    [v11 appendFormat:@" to %@", v13];
  }
  v14 = [(MRAVRoomOutputDevice *)self debugName];

  if (v14)
  {
    v15 = [(MRAVRoomOutputDevice *)self debugName];
    [v11 appendFormat:@" for %@", v15];
  }
  v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (!self->_concreteOutputDevice)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MRAVRoomOutputDevice.m", 185, @"Invalid parameter not satisfying: %@", @"_concreteOutputDevice" object file lineNumber description];
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"MRAVRoomOutputDevice.m", 186, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
}

- (MRAVRoomOutputDevice)initWithOutputDevice:(id)a3 memberOutputDevices:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MRAVRoomOutputDevice;
  v10 = [(MRAVRoomOutputDevice *)&v25 init];
  if (v10)
  {
    if (!v8)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v10, @"MRAVRoomOutputDevice.m", 34, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
    }
    if (![v9 count])
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v10, @"MRAVRoomOutputDevice.m", 35, @"Invalid parameter not satisfying: %@", @"roomMemberOutputDevices.count > 0" object file lineNumber description];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_concreteOutputDevice, a3);
    }
    objc_storeStrong((id *)&v10->_outputDevice, a3);
    objc_storeStrong((id *)&v10->_roomMemberOutputDevices, a4);
    v11 = objc_opt_class();
    v12 = [(MRAVRoomOutputDevice *)v10 primaryID];
    v13 = [(MRAVRoomOutputDevice *)v10 roomID];
    uint64_t v14 = [v11 calculateOutputDeviceIDFromOutputDeviceID:v12 withRoomID:v13];
    uid = v10->_uid;
    v10->_uid = (NSString *)v14;

    id v16 = [NSString alloc];
    v17 = [(MRAVOutputDevice *)v10->_outputDevice debugName];
    v18 = [(MRAVRoomOutputDevice *)v10 roomID];
    v19 = [(MRAVRoomOutputDevice *)v10 roomName];
    uint64_t v20 = [v16 initWithFormat:@"<outputDevice=%@, room=%@:%@>", v17, v18, v19];
    label = v10->_label;
    v10->_label = (NSString *)v20;
  }
  return v10;
}

+ (id)calculateOutputDeviceIDFromOutputDeviceID:(id)a3 withRoomID:(id)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithFormat:@"%@/%@", v7, v6];

  return v8;
}

- (MRAVOutputDevice)roomMemberOutputDevice
{
  return (MRAVOutputDevice *)[(NSArray *)self->_roomMemberOutputDevices firstObject];
}

- (id)debugName
{
  return self->_label;
}

- (id)uid
{
  return self->_uid;
}

- (id)parentUID
{
  v2 = [(MRAVRoomOutputDevice *)self outputDevice];
  v3 = [v2 uid];

  return v3;
}

- (id)primaryID
{
  v2 = [(MRAVRoomOutputDevice *)self outputDevice];
  v3 = [v2 primaryID];

  return v3;
}

- (BOOL)containsUID:(id)a3
{
  id v4 = a3;
  v5 = [(MRAVRoomOutputDevice *)self uid];
  if ([v4 isEqualToString:v5])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(MRAVRoomOutputDevice *)self clusterComposition];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__MRAVRoomOutputDevice_containsUID___block_invoke;
    v9[3] = &unk_1E57D0460;
    id v10 = v4;
    char v6 = objc_msgSend(v7, "mr_any:", v9);
  }
  return v6;
}

uint64_t __36__MRAVRoomOutputDevice_containsUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)modelID
{
  v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  v3 = [v2 modelID];

  return v3;
}

- (unsigned)deviceType
{
  v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  unsigned int v3 = [v2 deviceType];

  return v3;
}

- (unsigned)deviceSubtype
{
  return 15;
}

- (BOOL)isPickable
{
  return 0;
}

- (unsigned)clusterType
{
  return 3;
}

- (id)roomID
{
  v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  unsigned int v3 = [v2 roomID];

  return v3;
}

- (id)roomName
{
  v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  unsigned int v3 = [v2 roomName];

  return v3;
}

- (id)clusterComposition
{
  v2 = self;
  objc_sync_enter(v2);
  clusterComposition = v2->_clusterComposition;
  if (!clusterComposition)
  {
    uint64_t v4 = [(NSArray *)v2->_roomMemberOutputDevices msv_map:&__block_literal_global_78];
    v5 = v2->_clusterComposition;
    v2->_clusterComposition = (NSArray *)v4;

    clusterComposition = v2->_clusterComposition;
  }
  char v6 = (void *)[(NSArray *)clusterComposition copy];
  objc_sync_exit(v2);

  return v6;
}

MRAVOutputDeviceDescription *__42__MRAVRoomOutputDevice_clusterComposition__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = [MRAVOutputDeviceDescription alloc];
  uint64_t v4 = [v2 deviceType];
  uint64_t v5 = [v2 deviceSubtype];
  char v6 = [v2 uid];
  id v7 = [v2 name];
  id v8 = [v2 modelID];

  id v9 = [(MRAVOutputDeviceDescription *)v3 initWithDeviceType:v4 deviceSubtype:v5 uid:v6 name:v7 modelID:v8];

  return v9;
}

- (float)volume
{
  id v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (BOOL)isVolumeMuted
{
  id v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  char v3 = [v2 isVolumeMuted];

  return v3;
}

- (unsigned)volumeCapabilities
{
  id v2 = [(MRAVRoomOutputDevice *)self roomMemberOutputDevice];
  unsigned int v3 = [v2 volumeCapabilities];

  return v3;
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F28E78];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = [v8 requestID];

  v11 = (void *)[v9 initWithFormat:@"%@<%@>", @"MRAVRoomOutputDevice.adjustVolume", v10];
  v12 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);

  if (v12)
  {
    v13 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
    [v11 appendFormat:@" to %@", v13];
  }
  uint64_t v14 = [(MRAVRoomOutputDevice *)self debugName];

  if (v14)
  {
    v15 = [(MRAVRoomOutputDevice *)self debugName];
    [v11 appendFormat:@" for %@", v15];
  }
  id v16 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v11;
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (!self->_concreteOutputDevice)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MRAVRoomOutputDevice.m", 178, @"Invalid parameter not satisfying: %@", @"_concreteOutputDevice" object file lineNumber description];
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"MRAVRoomOutputDevice.m", 179, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRAVConcreteOutputDevice)concreteOutputDevice
{
  return self->_concreteOutputDevice;
}

- (NSArray)roomMemberOutputDevices
{
  return self->_roomMemberOutputDevices;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_roomMemberOutputDevices, 0);
  objc_storeStrong((id *)&self->_concreteOutputDevice, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_uid, 0);

  objc_storeStrong((id *)&self->_clusterComposition, 0);
}

@end
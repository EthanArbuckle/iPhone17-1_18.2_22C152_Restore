@interface MRVirtualOutputContext
- (BOOL)isVolumeControlAvailable;
- (BOOL)supportsMultipleBluetoothOutputDevices;
- (BOOL)supportsVolumeControl;
- (MRVirtualOutputContext)initWithUID:(id)a3;
- (float)volume;
- (id)outputDevices;
- (id)predictedOutputDevice;
- (id)uniqueIdentifier;
- (unsigned)type;
@end

@implementation MRVirtualOutputContext

- (MRVirtualOutputContext)initWithUID:(id)a3
{
  id v5 = a3;
  v6 = +[MRVirtualOutputContextManager sharedManager];
  v7 = [v6 fetchForUID:v5];

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MRVirtualOutputContext;
    v9 = [(MRVirtualOutputContext *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uniqueIdentifier, a3);
      v11 = +[MRVirtualOutputContextManager sharedManager];
      [v11 addOutputContext:v10];
    }
    v8 = v10;
    self = v8;
  }
  v12 = v8;

  return v12;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unsigned)type
{
  return 5;
}

- (id)outputDevices
{
  return 0;
}

- (id)predictedOutputDevice
{
  return 0;
}

- (BOOL)isVolumeControlAvailable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MRVirtualOutputContext *)self outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isVolumeControlAvailable])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsVolumeControl
{
  return 1;
}

- (float)volume
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(MRVirtualOutputContext *)self outputDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    float v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 volume];
        if (v6 <= v9)
        {
          [v8 volume];
          float v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
@interface MRExternalOutputContextDataSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isVolumeMuted;
- (MRExternalOutputContextDataSource)initWithCoder:(id)a3;
- (MRExternalOutputContextDataSource)initWithUniqueIdentifier:(id)a3;
- (float)_calculateMasterVolume;
- (float)volume;
- (id)outputDevices;
- (id)uniqueIdentifier;
- (uint64_t)_calculateGroupMute;
- (uint64_t)_calculateMasterVolumeCapabilities;
- (unsigned)volumeControlCapabilities;
- (void)_reevaluateGroupVolumeMuted;
- (void)_reevaluateMasterVolume;
- (void)_reevaluateMasterVolumeControlCapabilities;
- (void)_updateOutputDevice:(void *)a3 predicate:(void *)a4 update:(void *)a5 action:;
- (void)_updateOutputDevices:(id *)a1;
- (void)encodeWithCoder:(id)a3;
- (void)initializeVolumeCapabilitiesForLegacyCleints;
- (void)removeAllOutputDevices;
- (void)removeOutputDevices:(id)a3;
- (void)updateOutputDevices:(id)a3;
- (void)updateVolume:(float)a3 outputDeviceUID:(id)a4;
- (void)updateVolumeControlCapabilities:(unsigned int)a3 outputDeviceUID:(id)a4;
- (void)updateVolumeMuted:(BOOL)a3 outputDeviceUID:(id)a4;
@end

@implementation MRExternalOutputContextDataSource

- (MRExternalOutputContextDataSource)initWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRExternalOutputContextDataSource;
  v6 = [(MRExternalOutputContextDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    outputDevices = v7->_outputDevices;
    v7->_outputDevices = v8;
  }
  return v7;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (float)volume
{
  v2 = self;
  objc_sync_enter(v2);
  float masterVolume = v2->_masterVolume;
  objc_sync_exit(v2);

  return masterVolume;
}

- (unsigned)volumeControlCapabilities
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int masterVolumeControlCapabilities = v2->_masterVolumeControlCapabilities;
  objc_sync_exit(v2);

  return masterVolumeControlCapabilities;
}

- (BOOL)isVolumeMuted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL groupVolumeMuted = v2->_groupVolumeMuted;
  objc_sync_exit(v2);

  return groupVolumeMuted;
}

- (void)updateOutputDevices:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = objc_msgSend(v7, "mr_allOutputDevices");
  v6 = objc_msgSend(v5, "mr_redactClusterMembers");
  -[MRExternalOutputContextDataSource _updateOutputDevices:]((id *)&v4->super.super.isa, v6);

  objc_sync_exit(v4);
}

- (void)_updateOutputDevices:(id *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)[a1[7] mutableCopy];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __58__MRExternalOutputContextDataSource__updateOutputDevices___block_invoke;
          v23[3] = &unk_1E57D07B8;
          v23[4] = v9;
          v10 = objc_msgSend(v4, "msv_firstWhere:", v23);
          if (v10)
          {
            objc_super v11 = [v9 mergingVolumeFrom:v10];
            [a1[7] removeObject:v10];
            [a1[7] addObject:v11];
            -[MROutputContextDataSource notifyOutputDeviceChanged:](a1, v11);
            int v12 = [v11 volumeCapabilities];
            if (v12 != [v10 volumeCapabilities]) {
              -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1, [v11 volumeCapabilities], v11);
            }
            [v11 volume];
            float v14 = v13;
            [v10 volume];
            if (vabds_f32(v14, v15) > 0.00000011921)
            {
              [v11 volume];
              -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1, v11, v16);
            }
            int v17 = [v11 isVolumeMuted];
            if (v17 != [v10 isVolumeMuted]) {
              -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1, [v11 isVolumeMuted], v11);
            }
          }
          else
          {
            v18 = [v9 uid];

            if (v18)
            {
              v19 = [MRAVDistantOutputDevice alloc];
              v20 = [v9 descriptor];
              objc_super v11 = [(MRAVDistantOutputDevice *)v19 initWithDescriptor:v20];

              [a1[7] addObject:v11];
              -[MROutputContextDataSource notifyOutputDeviceAdded:](a1, v11);
              -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](a1);
              -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)a1);
              -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](a1);
            }
            else
            {
              objc_super v11 = _MRLogForCategory(0);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v9;
                _os_log_fault_impl(&dword_194F3C000, v11, OS_LOG_TYPE_FAULT, "Empty outputDeviceUID: %@", buf, 0xCu);
              }
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v6);
    }

    id v3 = v21;
  }
}

uint64_t __58__MRExternalOutputContextDataSource__updateOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uid];
  v4 = [*(id *)(a1 + 32) uid];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_reevaluateMasterVolumeControlCapabilities
{
  if (a1)
  {
    int v2 = -[MRExternalOutputContextDataSource _calculateMasterVolumeCapabilities]((uint64_t)a1);
    if (v2 != a1[17])
    {
      a1[17] = v2;
      uint64_t v3 = a1[17];
      -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](a1, v3, 0);
    }
  }
}

- (void)_reevaluateMasterVolume
{
  if (a1)
  {
    float v2 = -[MRExternalOutputContextDataSource _calculateMasterVolume]((uint64_t)a1);
    if (vabds_f32(v2, a1[16]) > 0.00000011921)
    {
      a1[16] = v2;
      float v3 = a1[16];
      -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](a1, 0, v3);
    }
  }
}

- (void)_reevaluateGroupVolumeMuted
{
  if (a1)
  {
    uint64_t v2 = -[MRExternalOutputContextDataSource _calculateGroupMute]((uint64_t)a1);
    if (a1[72] != v2)
    {
      a1[72] = v2;
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](a1, v2, 0);
    }
  }
}

- (void)removeOutputDevices:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int v17 = (void *)[(NSMutableArray *)v5->_outputDevices copy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = v17;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v7);
              }
              objc_super v11 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              int v12 = [v11 uid];
              if ([v12 isEqualToString:v6])
              {
              }
              else
              {
                float v13 = [v11 parentUID];
                int v14 = [v13 isEqualToString:v6];

                if (!v14) {
                  continue;
                }
              }
              [(NSMutableArray *)v5->_outputDevices removeObject:v11];
              -[MROutputContextDataSource notifyOutputDeviceRemoved:](v5, v11);
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v8);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }

  -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)v5);
  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](v5);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](v5);

  objc_sync_exit(v5);
}

- (void)removeAllOutputDevices
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  float v3 = v2->_outputDevices;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[MROutputContextDataSource notifyOutputDeviceRemoved:](v2, *(void **)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)v2->_outputDevices removeAllObjects];
  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](v2);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolume]((float *)v2);
  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](v2);
  objc_sync_exit(v2);
}

- (void)updateVolumeControlCapabilities:(unsigned int)a3 outputDeviceUID:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke;
  v8[3] = &__block_descriptor_36_e26_B16__0__MRAVOutputDevice_8l;
  unsigned int v9 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_36_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  unsigned int v7 = a3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E57D2D88;
  v4[4] = self;
  unsigned int v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 volumeCapabilities] != *(_DWORD *)(a1 + 32);
}

uint64_t __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setVolumeCapabilities:*(unsigned int *)(a1 + 32)];
}

void __85__MRExternalOutputContextDataSource_updateVolumeControlCapabilities_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](*(void **)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
  float v3 = *(_DWORD **)(a1 + 32);

  -[MRExternalOutputContextDataSource _reevaluateMasterVolumeControlCapabilities](v3);
}

- (void)_updateOutputDevice:(void *)a3 predicate:(void *)a4 update:(void *)a5 action:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  long long v10 = a3;
  objc_super v11 = a4;
  uint64_t v12 = a5;
  if (a1)
  {
    float v13 = a1;
    objc_sync_enter(v13);
    if (v9)
    {
      id v14 = v13[7];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__MRExternalOutputContextDataSource__updateOutputDevice_predicate_update_action___block_invoke;
      v22[3] = &unk_1E57D07B8;
      id v15 = v9;
      id v23 = v15;
      uint64_t v16 = objc_msgSend(v14, "msv_firstWhere:", v22);
      int v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 descriptor];
        if (v10[2](v10, v17)) {
          v11[2](v11, v18);
        }
        v19 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v18];
        [v13[7] removeObject:v17];
        [v13[7] addObject:v19];
        v12[2](v12, v19);
      }
      else
      {
        uint64_t v18 = _MRLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          long long v25 = v20;
          __int16 v26 = 2048;
          long long v27 = v13;
          __int16 v28 = 2114;
          id v29 = v15;
          id v21 = v20;
          _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Attempted to update a non-existent outputDevice %{public}@", buf, 0x20u);
        }
      }
    }
    objc_sync_exit(v13);
  }
}

- (void)updateVolume:(float)a3 outputDeviceUID:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke;
  v8[3] = &unk_1E57D2DB0;
  float v9 = a3;
  void v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_36_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  float v7 = a3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E57D2D88;
  v4[4] = self;
  float v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  [a2 volume];
  float v3 = *(float *)(a1 + 40);
  return vabds_f32(v4, v3) > 0.00000011921 || v3 > (float)(*(float *)(*(void *)(a1 + 32) + 64) + 0.00000011921);
}

uint64_t __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setVolume:a3];
}

void __66__MRExternalOutputContextDataSource_updateVolume_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](*(void **)(a1 + 32), a2, *(float *)(a1 + 40));
  float v3 = *(float **)(a1 + 32);

  -[MRExternalOutputContextDataSource _reevaluateMasterVolume](v3);
}

- (void)updateVolumeMuted:(BOOL)a3 outputDeviceUID:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke;
  v8[3] = &__block_descriptor_33_e26_B16__0__MRAVOutputDevice_8l;
  BOOL v9 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_2;
  v6[3] = &__block_descriptor_33_e45_v16__0___MRAVOutputDeviceDescriptorProtobuf_8l;
  BOOL v7 = a3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_3;
  v4[3] = &unk_1E57D2E18;
  v4[4] = self;
  BOOL v5 = a3;
  -[MRExternalOutputContextDataSource _updateOutputDevice:predicate:update:action:](self, a4, v8, v6, v4);
}

BOOL __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) != [a2 isVolumeMuted];
}

uint64_t __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setVolumeMuted:*(unsigned __int8 *)(a1 + 32)];
}

void __71__MRExternalOutputContextDataSource_updateVolumeMuted_outputDeviceUID___block_invoke_3(uint64_t a1, void *a2)
{
  -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a2);
  float v3 = *(unsigned char **)(a1 + 32);

  -[MRExternalOutputContextDataSource _reevaluateGroupVolumeMuted](v3);
}

uint64_t __81__MRExternalOutputContextDataSource__updateOutputDevice_predicate_update_action___block_invoke(uint64_t a1, void *a2)
{
  float v3 = [a2 uid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)outputDevices
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id obj = self;
  objc_sync_enter(obj);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  float v3 = obj->_outputDevices;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v8 = [v7 parentUID];
        if (!v8)
        {
          BOOL v9 = [v7 uid];
          BOOL v10 = v9 == 0;

          if (v10) {
            continue;
          }
          long long v8 = [v7 uid];
          [v2 setObject:v7 forKeyedSubscript:v8];
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v4);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v11 = obj->_outputDevices;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v16 = [v15 parentUID];

        if (v16)
        {
          int v17 = [v15 parentUID];
          uint64_t v18 = [v2 objectForKeyedSubscript:v17];

          if (!v18)
          {
            id v23 = [MEMORY[0x1E4F28B00] currentHandler];
            [v23 handleFailureInMethod:a2, obj, @"MROutputContextDataSource.m", 584, @"Invalid parameter not satisfying: %@", @"parent" object file lineNumber description];
          }
          v19 = [v18 descriptor];
          long long v20 = [v15 descriptor];
          [v19 addActivatedClusterMembers:v20];

          id v21 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v19];
          long long v22 = [v15 parentUID];
          [v2 setObject:v21 forKeyedSubscript:v22];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v12);
  }

  long long v24 = [v2 allValues];

  objc_sync_exit(obj);

  return v24;
}

- (void)initializeVolumeCapabilitiesForLegacyCleints
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  float v3 = [(MRExternalOutputContextDataSource *)self outputDevices];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 volumeCapabilities]) {
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, [v8 volumeCapabilities], v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  uint64_t v9 = [(MRExternalOutputContextDataSource *)self volumeControlCapabilities];
  if (v9) {
    -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, v9, 0);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_outputDevices msv_map:&__block_literal_global_163];
  objc_sync_exit(v4);

  [v6 encodeObject:v5 forKey:@"outputDevices"];
  [v6 encodeObject:v4->_uniqueIdentifier forKey:@"uid"];
}

uint64_t __53__MRExternalOutputContextDataSource_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (MRExternalOutputContextDataSource)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  long long v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:@"outputDevices"];
  long long v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_175);
  long long v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"uid"];

  long long v12 = [[MRExternalOutputContextDataSource alloc] initWithUniqueIdentifier:v11];
  uint64_t v13 = [v10 mutableCopy];
  outputDevices = v12->_outputDevices;
  v12->_outputDevices = (NSMutableArray *)v13;

  v12->_unsigned int masterVolumeControlCapabilities = -[MRExternalOutputContextDataSource _calculateMasterVolumeCapabilities]((uint64_t)v12);
  v12->_float masterVolume = -[MRExternalOutputContextDataSource _calculateMasterVolume]((uint64_t)v12);
  v12->_BOOL groupVolumeMuted = -[MRExternalOutputContextDataSource _calculateGroupMute]((uint64_t)v12);

  return v12;
}

MRAVDistantOutputDevice *__51__MRExternalOutputContextDataSource_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  float v3 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v2];

  return v3;
}

- (uint64_t)_calculateMasterVolumeCapabilities
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 56);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    LODWORD(v4) = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v4 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "volumeCapabilities", (void)v8) | v4;
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (float)_calculateMasterVolume
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 56);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    float v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        BOOL v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "volumeCapabilities", (void)v11) & 2) != 0)
        {
          [v7 volume];
          if (v8 > v5)
          {
            [v7 volume];
            float v5 = v9;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (uint64_t)_calculateGroupMute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v1 = *(id *)(a1 + 56);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      int v4 = 0;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v1);
          }
          BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ((objc_msgSend(v7, "volumeCapabilities", (void)v9) & 8) != 0) {
            v4 |= [v7 isVolumeMuted];
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v3);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
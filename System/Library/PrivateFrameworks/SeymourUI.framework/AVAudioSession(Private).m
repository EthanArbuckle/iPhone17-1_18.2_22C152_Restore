@interface AVAudioSession(Private)
- (id)smu_playbackRoutes;
@end

@implementation AVAudioSession(Private)

- (id)smu_playbackRoutes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFA7B8];
  v2 = [a1 routingContextUID];
  v3 = [v1 outputContextForID:v2];
  v4 = [v3 outputDevices];

  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (const void *)MRAVOutputDeviceCreateFromAVOutputDevice();
        id v12 = objc_alloc(MEMORY[0x263F11D10]);
        v20 = v11;
        v13 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v20, 1, v16);
        v14 = (void *)[v12 initWithOutputDevices:v13];

        CFRelease(v11);
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

@end
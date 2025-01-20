@interface TPAudioRouting
+ (BOOL)deviceSupportsContinuityCamera;
+ (id)eligibleLagunaDevices:(id)a3;
@end

@implementation TPAudioRouting

+ (BOOL)deviceSupportsContinuityCamera
{
  return MEMORY[0x1F40D0EB8](*MEMORY[0x1E4F15AC8], a2);
}

+ (id)eligibleLagunaDevices:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FADBD0]);
  if ([v4 lagunaEnabled]
    && +[TPAudioRouting deviceSupportsContinuityCamera])
  {
    v5 = [v3 frontmostAudioOrVideoCall];
    if (v5)
    {
      v6 = [v3 activeConversationForCall:v5];
      int v7 = [v5 service];
      int v8 = [v4 lagunaAudioCallsEnabled];
      if (v7 == 3) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8;
      }
      if (v8 && v7 != 3) {
        BOOL v9 = [v5 service] == 2;
      }
      v10 = 0;
      if (v6 && v9)
      {
        v11 = [v3 neighborhoodActivityConduit];
        v12 = [v11 activeSplitSessionTV];

        if (v12)
        {
          v10 = 0;
        }
        else
        {
          v31 = v6;
          v10 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_8];
          id v33 = v3;
          v14 = [v3 neighborhoodActivityConduit];
          v15 = [v14 nearbyTVDeviceHandles];
          v30 = (void *)v13;
          v39[0] = v13;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
          v17 = [v15 sortedArrayUsingDescriptors:v16];

          v32 = v5;
          int v18 = [v5 service];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v19 = v17;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v35 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                v25 = [v24 capabilities];
                int v26 = [v25 isLagunaCapable];

                if (v26)
                {
                  if (v18 != 2
                    || ([v24 capabilities],
                        v27 = objc_claimAutoreleasedReturnValue(),
                        int v28 = [v27 isAudioCallCapable],
                        v27,
                        v28))
                  {
                    [v10 addObject:v24];
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
            }
            while (v21);
          }

          v5 = v32;
          id v3 = v33;
          v6 = v31;
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __40__TPAudioRouting_eligibleLagunaDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

@end
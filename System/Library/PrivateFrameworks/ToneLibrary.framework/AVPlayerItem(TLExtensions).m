@interface AVPlayerItem(TLExtensions)
- (TLAlertQueuePlayerItemHapticTracks)tl_hapticTracks;
@end

@implementation AVPlayerItem(TLExtensions)

- (TLAlertQueuePlayerItemHapticTracks)tl_hapticTracks
{
  v1 = a1;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [a1 tracks];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (!v3)
  {

    v5 = 0;
    goto LABEL_22;
  }
  uint64_t v4 = v3;
  v22 = v1;
  v5 = 0;
  v6 = 0;
  uint64_t v7 = *(void *)v26;
  uint64_t v8 = *MEMORY[0x1E4F15BD8];
  uint64_t v23 = *MEMORY[0x1E4F15B88];
  id obj = v2;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v11 = [v10 assetTrack];
      v12 = [v11 mediaType];
      int v13 = [v12 isEqualToString:v8];

      if (!v13) {
        goto LABEL_16;
      }
      if ([v11 hasMediaCharacteristic:v23])
      {
        v14 = v10;
        v15 = v6;
        v16 = v5;
        if (!v5) {
          goto LABEL_14;
        }
      }
      else
      {
        v16 = v5;
        v14 = v5;
        v15 = v10;
        if (!v6)
        {
LABEL_14:
          id v17 = v10;
          v16 = v14;
          v6 = v15;
          if (!v15)
          {
LABEL_15:
            v5 = v16;
            goto LABEL_16;
          }
          goto LABEL_12;
        }
      }
      if (!v6) {
        goto LABEL_15;
      }
LABEL_12:
      v5 = v16;
      if (v16)
      {

        id v2 = obj;
        v1 = v22;
LABEL_19:
        v18 = [[TLAlertQueuePlayerItemHapticTracks alloc] initWithHapticPlayerItemTrack:v6 attenuatedHapticPlayerItemTrack:v5];
        v19 = TLLogPlayback();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v1;
          __int16 v31 = 2114;
          uint64_t v32 = (uint64_t)v6;
          __int16 v33 = 2114;
          id v34 = v5;
          _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "Found haptic tracks for %{public}@. hapticPlayerItemTrack = %{public}@, attenuatedHapticPlayerItemTrack = %{public}@.", buf, 0x20u);
        }
        goto LABEL_25;
      }
LABEL_16:
    }
    id v2 = obj;
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v4) {
      continue;
    }
    break;
  }

  v1 = v22;
  if (v6) {
    goto LABEL_19;
  }
LABEL_22:
  v19 = TLLogPlayback();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v2 count];
    *(_DWORD *)buf = 138543874;
    v30 = v1;
    __int16 v31 = 2048;
    uint64_t v32 = v20;
    __int16 v33 = 2114;
    id v34 = v2;
    _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "Cannot find any haptic tracks for %{public}@. Available tracks (%lu): %{public}@", buf, 0x20u);
  }
  v6 = 0;
  v18 = 0;
LABEL_25:

  return v18;
}

@end
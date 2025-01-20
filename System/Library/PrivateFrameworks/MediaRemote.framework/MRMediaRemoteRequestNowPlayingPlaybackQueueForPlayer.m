@interface MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer
@end

@implementation MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer

uint64_t ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_99(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  v7 = [v5 resolvedPlayerPath];
  v8 = [v5 contentItems];
  v9 = MRContentItemsCopyMinimalReadableDescription(v8, 0);
  v10 = _MRLogForCategory(0xAuLL);
  v11 = v10;
  if (!v6 && v9)
  {
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544386;
      v49 = @"playbackQueue";
      __int16 v50 = 2114;
      uint64_t v51 = v13;
      __int16 v52 = 2112;
      v53 = v9;
      __int16 v54 = 2114;
      v55 = v7;
      __int16 v56 = 2048;
      uint64_t v57 = v15;
      v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v17 = v11;
      uint32_t v18 = 52;
      goto LABEL_16;
    }
    if (!v12) {
      goto LABEL_22;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138544130;
    v49 = @"playbackQueue";
    __int16 v50 = 2114;
    uint64_t v51 = v25;
    __int16 v52 = 2112;
    v53 = v9;
    __int16 v54 = 2048;
    v55 = v26;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v19) {
        goto LABEL_22;
      }
      uint64_t v20 = *(void *)(a1 + 32);
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544386;
      v49 = @"playbackQueue";
      __int16 v50 = 2114;
      uint64_t v51 = v20;
      __int16 v52 = 2114;
      v53 = v6;
      __int16 v54 = 2114;
      v55 = v7;
      __int16 v56 = 2048;
      uint64_t v57 = v21;
      _os_log_error_impl(&dword_194F3C000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v19) {
      ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_cold_1(a1);
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v22) {
        goto LABEL_22;
      }
      uint64_t v23 = *(void *)(a1 + 32);
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138544130;
      v49 = @"playbackQueue";
      __int16 v50 = 2114;
      uint64_t v51 = v23;
      __int16 v52 = 2114;
      v53 = v7;
      __int16 v54 = 2048;
      v55 = v24;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v17 = v11;
      uint32_t v18 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v22)
    {
      uint64_t v27 = *(void *)(a1 + 32);
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)buf = 138543874;
      v49 = @"playbackQueue";
      __int16 v50 = 2114;
      uint64_t v51 = v27;
      __int16 v52 = 2048;
      v53 = v28;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v11;
      uint32_t v18 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  if (v5)
  {
    v29 = [*(id *)(a1 + 32) requestIdentifier];
    [v5 setRequestIdentifier:v29];

    v30 = [(__CFString *)v7 origin];
    if (([v30 isLocallyHosted] & 1) == 0)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v31 = [v5 contentItems];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v44 != v34) {
              objc_enumerationMutation(v31);
            }
            MRContentItemSetDeviceSpecificUserInfo(*(void **)(*((void *)&v43 + 1) + 8 * i), 0);
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v33);
      }
    }
  }
  v36 = *(void **)(a1 + 56);
  if (v36)
  {
    v37 = *(NSObject **)(a1 + 48);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_99;
    v39[3] = &unk_1E57D0EA8;
    id v42 = v36;
    id v40 = v5;
    v41 = v6;
    v38 = MRCreateDonatedQosBlock(v39);
    dispatch_async(v37, v38);
  }
}

void ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_cold_1(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 40)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

@end
@interface MRMediaRemotePlaybackSessionRequest
@end

@implementation MRMediaRemotePlaybackSessionRequest

void ___MRMediaRemotePlaybackSessionRequest_block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_2;
  v17[3] = &unk_1E57D4AC0;
  id v6 = v5;
  id v18 = v6;
  id v19 = a1[4];
  id v20 = a1[5];
  id v22 = a1[7];
  id v21 = a1[6];
  v7 = (void (**)(void, void, void))MEMORY[0x1997190F0](v17);
  if ([v6 isResolved])
  {
    if ([v6 isLocal])
    {
      uint64_t v8 = (uint64_t)a1[4];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_22;
      v15[3] = &unk_1E57D2318;
      v16 = v7;
      MRServiceClientPlaybackSessionCallback((uint64_t)v6, v8, v15);
      v9 = v16;
    }
    else
    {
      v9 = [[MRPlaybackSessionRequestMessage alloc] initWithRequest:a1[4] forPlayerPath:v6];
      v11 = (void *)MRGetSharedService();
      id v12 = a1[6];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_3;
      v13[3] = &unk_1E57D4AE8;
      v14 = v7;
      MRMediaRemoteServicePlaybackSessionRequest(v11, v9, v12, v13);
    }
  }
  else
  {
    if (a3) {
      Error = a3;
    }
    else {
      Error = (MRPlaybackSessionRequestMessage *)MRMediaRemoteNowPlayingPlayerPathCreateError(v6);
    }
    v9 = Error;
    ((void (**)(void, void, MRPlaybackSessionRequestMessage *))v7)[2](v7, 0, Error);
  }
}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10) {
        goto LABEL_22;
      }
      uint64_t v12 = a1[4];
      uint64_t v11 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544386;
      v37 = @"playbackSession";
      __int16 v38 = 2114;
      uint64_t v39 = v11;
      __int16 v40 = 2112;
      id v41 = v5;
      __int16 v42 = 2114;
      uint64_t v43 = v12;
      __int16 v44 = 2048;
      uint64_t v45 = v14;
      v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v16 = v9;
      uint32_t v17 = 52;
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v26 = a1[5];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[6]];
    *(_DWORD *)buf = 138544130;
    v37 = @"playbackSession";
    __int16 v38 = 2114;
    uint64_t v39 = v26;
    __int16 v40 = 2112;
    id v41 = v5;
    __int16 v42 = 2048;
    uint64_t v43 = v27;
    v15 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v6)
  {
    BOOL v18 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v18) {
        goto LABEL_22;
      }
      uint64_t v20 = a1[4];
      uint64_t v19 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544386;
      v37 = @"playbackSession";
      __int16 v38 = 2114;
      uint64_t v39 = v19;
      __int16 v40 = 2114;
      id v41 = v6;
      __int16 v42 = 2114;
      uint64_t v43 = v20;
      __int16 v44 = 2048;
      uint64_t v45 = v21;
      _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v18) {
      ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v6, v9);
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v22) {
        goto LABEL_22;
      }
      v24 = (void *)a1[4];
      uint64_t v23 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544130;
      v37 = @"playbackSession";
      __int16 v38 = 2114;
      uint64_t v39 = v23;
      __int16 v40 = 2114;
      id v41 = v24;
      __int16 v42 = 2048;
      uint64_t v43 = v25;
      v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v16 = v9;
      uint32_t v17 = 42;
LABEL_16:
      _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_17:

      goto LABEL_22;
    }
    if (v22)
    {
      uint64_t v28 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138543874;
      v37 = @"playbackSession";
      __int16 v38 = 2114;
      uint64_t v39 = v28;
      __int16 v40 = 2048;
      id v41 = v29;
      v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v16 = v9;
      uint32_t v17 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  v30 = (void *)a1[8];
  if (v30)
  {
    v31 = a1[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_19;
    block[3] = &unk_1E57D0EA8;
    id v35 = v30;
    id v33 = v5;
    id v34 = v6;
    dispatch_async(v31, block);
  }
}

uint64_t ___MRMediaRemotePlaybackSessionRequest_block_invoke_19(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 playbackSession];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 48)];
  int v9 = 138544130;
  BOOL v10 = @"playbackSession";
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v9, 0x2Au);
}

@end
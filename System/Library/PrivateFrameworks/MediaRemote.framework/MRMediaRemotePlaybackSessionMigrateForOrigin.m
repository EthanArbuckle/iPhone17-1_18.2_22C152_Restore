@interface MRMediaRemotePlaybackSessionMigrateForOrigin
@end

@implementation MRMediaRemotePlaybackSessionMigrateForOrigin

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [a1[4] setResolvedPlayerPath:v9];
  [a1[4] endEvent:@"requestType" withError:v12];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2;
  v22 = &unk_1E57D3A18;
  id v13 = v9;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  id v25 = a1[5];
  id v26 = a1[4];
  id v27 = a1[6];
  id v28 = a1[8];
  uint64_t v15 = MEMORY[0x1997190F0](&v19);
  v16 = (void *)v15;
  if (v11)
  {
    v17 = objc_alloc_init(MRPlaybackSessionRequest);
    -[MRPlaybackSessionRequest setType:](v17, "setType:", v11, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    v18 = [a1[4] requestID];
    [(MRPlaybackSessionRequest *)v17 setRequestIdentifier:v18];

    [a1[4] setPlaybackSessionRequest:v17];
    _MRMediaRemotePlaybackSessionMigrateForPlayer(a1[4], v13, v14, a1[7], v16);
  }
  else
  {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v12);
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[[NSString alloc] initWithFormat:@"source=%@ destination=%@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v5 = _MRLogForCategory(0xAuLL);
  v6 = v5;
  if (!v3)
  {
    BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v13 = *(void *)(a1 + 48);
      id v9 = [*(id *)(a1 + 56) requestID];
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2048;
      id v28 = v14;
      uint64_t v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v16 = v6;
      uint32_t v17 = 42;
    }
    else
    {
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v18 = *(void *)(a1 + 48);
      id v9 = [*(id *)(a1 + 56) requestID];
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v18;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2048;
      id v26 = v19;
      uint64_t v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v16 = v6;
      uint32_t v17 = 32;
    }
    _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 56) requestID];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138544386;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v3;
    __int16 v27 = 2114;
    id v28 = v4;
    __int16 v29 = 2048;
    uint64_t v30 = v11;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2_cold_1();
  }
LABEL_14:

  uint64_t v20 = *(void *)(a1 + 72);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v3);
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  v2 = [*(id *)(v1 + 56) requestID];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(v0 + 64)];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, 2u);
}

@end
@interface MRMediaRemotePlaybackSessionMigrateForPlayer
@end

@implementation MRMediaRemotePlaybackSessionMigrateForPlayer

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 startEvent:@"endPlaybackSessionMigration"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2;
  v25[3] = &unk_1E57D1DA0;
  id v26 = *(id *)(a1 + 32);
  id v27 = v5;
  id v8 = v5;
  v9 = (void *)MEMORY[0x1997190F0](v25);
  v10 = [*(id *)(a1 + 40) origin];
  if ([v10 isLocal]) {
    double v11 = 7.0;
  }
  else {
    double v11 = 15.0;
  }

  v12 = [MRBlockGuard alloc];
  id v13 = [NSString alloc];
  v14 = [*(id *)(a1 + 32) requestID];
  v15 = (void *)[v13 initWithFormat:@"endPlaybackSessionMigration<%@>", v14];
  v16 = [(MRBlockGuard *)v12 initWithTimeout:v15 reason:v9 handler:v11];

  v17 = [*(id *)(a1 + 32) playbackSessionRequest];
  v19 = *(void **)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3;
  v22[3] = &unk_1E57D1DA0;
  v23 = v16;
  id v24 = v9;
  id v20 = v9;
  v21 = v16;
  MRMediaRemoteSendPlaybackSessionMigrateEnd(v17, v7, v19, v18, v22);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"endPlaybackSessionMigration" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_5;
  v8[3] = &unk_1E57D0DE0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  v6 = *(void (**)(uint64_t, id, void *))(v4 + 16);
  id v7 = v3;
  v6(v4, v7, v8);
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"requestPlaybackSession"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_7;
  v24[3] = &unk_1E57D1DA0;
  id v25 = *(id *)(a1 + 32);
  id v26 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1997190F0](v24);
  v6 = [*(id *)(a1 + 40) origin];
  if ([v6 isLocal]) {
    double v7 = 7.0;
  }
  else {
    double v7 = 15.0;
  }

  id v8 = [MRBlockGuard alloc];
  id v9 = [NSString alloc];
  id v10 = [*(id *)(a1 + 32) requestID];
  double v11 = (void *)[v9 initWithFormat:@"requestPlaybackSession<%@>", v10];
  v12 = [(MRBlockGuard *)v8 initWithTimeout:v11 reason:v5 handler:v7];

  id v13 = [*(id *)(a1 + 32) playbackSessionRequest];
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_8;
  v19[3] = &unk_1E57D3720;
  id v20 = *(id *)(a1 + 32);
  v21 = v12;
  uint64_t v16 = *(void *)(a1 + 56);
  id v22 = v5;
  uint64_t v23 = v16;
  id v17 = v5;
  v18 = v12;
  MRMediaRemotePlaybackSessionRequest(v13, v14, v15, v19);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"requestPlaybackSession" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = (id)MRPlaybackSessionCopyPlaybackSessionData(a2);
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackSessionSize:", objc_msgSend(v4, "length"));
  if ([*(id *)(a1 + 40) disarm])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"beginPlaybackSessionMigration"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_10;
  v21[3] = &unk_1E57D1DA0;
  id v22 = *(id *)(a1 + 32);
  id v23 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1997190F0](v21);
  v6 = [*(id *)(a1 + 40) origin];
  if ([v6 isLocal]) {
    double v7 = 7.0;
  }
  else {
    double v7 = 15.0;
  }

  id v8 = [MRBlockGuard alloc];
  id v9 = [NSString alloc];
  id v10 = [*(id *)(a1 + 32) requestID];
  double v11 = (void *)[v9 initWithFormat:@"beginPlaybackSessionMigration<%@>", v10];
  v12 = [(MRBlockGuard *)v8 initWithTimeout:v11 reason:v5 handler:v7];

  id v13 = [*(id *)(a1 + 32) playbackSessionRequest];
  v15 = *(void **)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_11;
  v18[3] = &unk_1E57D1DA0;
  v19 = v12;
  id v20 = v5;
  id v16 = v5;
  id v17 = v12;
  MRMediaRemoteSendPlaybackSessionMigrateBegin(v13, v15, v14, v18);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"beginPlaybackSessionMigration" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_11(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_12(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_13;
    v64[3] = &unk_1E57D3748;
    id v65 = *(id *)(a1 + 32);
    id v66 = *(id *)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 72);
    id v67 = v4;
    uint64_t v68 = v5;
    v6 = (void *)MEMORY[0x1997190F0](v64);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_15;
    v62[3] = &unk_1E57D3860;
    int8x16_t v63 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    double v7 = (void *)MEMORY[0x1997190F0](v62);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_20;
    v56[3] = &unk_1E57D38B0;
    id v57 = *(id *)(a1 + 32);
    id v8 = v7;
    id v60 = v8;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 88);
    id v58 = v9;
    uint64_t v61 = v10;
    id v59 = *(id *)(a1 + 48);
    double v11 = (void *)MEMORY[0x1997190F0](v56);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_23;
    v51[3] = &unk_1E57D3748;
    id v52 = *(id *)(a1 + 32);
    id v53 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 80);
    id v54 = v12;
    uint64_t v55 = v13;
    v14 = (void *)MEMORY[0x1997190F0](v51);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_25;
    v47[3] = &unk_1E57D3770;
    id v48 = *(id *)(a1 + 32);
    id v49 = *(id *)(a1 + 40);
    id v50 = *(id *)(a1 + 48);
    v15 = (void *)MEMORY[0x1997190F0](v47);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_27;
    v41[3] = &unk_1E57D3950;
    id v42 = *(id *)(a1 + 32);
    id v43 = *(id *)(a1 + 40);
    id v44 = *(id *)(a1 + 48);
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 96);
    id v45 = v16;
    uint64_t v46 = v17;
    v18 = (void *)MEMORY[0x1997190F0](v41);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_126;
    v35[3] = &unk_1E57D39C8;
    id v36 = *(id *)(a1 + 32);
    id v39 = v8;
    id v37 = *(id *)(a1 + 56);
    id v38 = *(id *)(a1 + 48);
    id v40 = v16;
    id v19 = v16;
    id v34 = v8;
    id v20 = (void *)MEMORY[0x1997190F0](v35);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = (void *)[v6 copy];
    id v23 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v23];

    id v24 = (void *)[v11 copy];
    id v25 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v25];

    id v26 = (void *)[v6 copy];
    id v27 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v27];

    v28 = (void *)[v14 copy];
    v29 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v29];

    v30 = (void *)[v18 copy];
    v31 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v31];

    v32 = (void *)[v20 copy];
    v33 = (void *)MEMORY[0x1997190F0]();
    [v21 addObject:v33];

    MRPerformAsyncOperationsUntilError(v21, *(void **)(a1 + 64));
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"getPlaybackQueue"];
  id v4 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", 0, 1);
  uint64_t v5 = [*(id *)(a1 + 32) requestID];
  [(MRPlaybackQueueRequest *)v4 setRequestIdentifier:v5];

  [(MRPlaybackQueueRequest *)v4 setIncludeMetadata:1];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_14;
  v9[3] = &unk_1E57D3798;
  uint64_t v12 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  id v8 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v4, v6, v7, v9);
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 contentItemWithOffset:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) endEvent:@"getPlaybackQueue" withError:a3];
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

id ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 copy];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_16;
  v33[3] = &unk_1E57D37C0;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v34 = v5;
  uint64_t v35 = v6;
  uint64_t v7 = (unsigned int (**)(void))MEMORY[0x1997190F0](v33);
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadata];
  [v8 playbackRate];
  int v10 = v9;

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_17;
  v29[3] = &unk_1E57D37E8;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 40);
  id v30 = v11;
  uint64_t v31 = v12;
  int v32 = v10;
  uint64_t v13 = (unsigned int (**)(void))MEMORY[0x1997190F0](v29);
  double CalculatedPlaybackPosition = MRContentItemGetCalculatedPlaybackPosition(*(void **)(*(void *)(*(void *)(a1 + 40)
                                                                                               + 8)
                                                                                   + 40));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_18;
  v25[3] = &unk_1E57D3810;
  id v15 = v11;
  uint64_t v16 = *(void *)(a1 + 40);
  id v26 = v15;
  uint64_t v27 = v16;
  double v28 = CalculatedPlaybackPosition;
  uint64_t v17 = (unsigned int (**)(void))MEMORY[0x1997190F0](v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_19;
  v23[3] = &unk_1E57D3838;
  id v18 = v15;
  id v24 = v18;
  id v19 = (unsigned int (**)(void))MEMORY[0x1997190F0](v23);
  [v4 setContentItem:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  if (v7[2](v7)) {
    [v4 setPlaybackState:1];
  }
  if (v13[2](v13))
  {
    id v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadata];
    [v20 playbackRate];
    [v4 setPlaybackRate:v21];
  }
  if (v17[2](v17)) {
    [v4 setPlaybackPosition:CalculatedPlaybackPosition];
  }
  if (v19[2](v19)) {
    [v4 setAllowFadeTransition:1];
  }

  return v4;
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_16(uint64_t a1)
{
  if (([*(id *)(a1 + 32) playerOptions] & 4) != 0) {
    return 1;
  }
  if (([*(id *)(a1 + 32) playerOptions] & 2) == 0) {
    return 0;
  }
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return MRMediaRemotePlaybackStateIsAdvancing(v3);
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_17(uint64_t a1)
{
  if (([*(id *)(a1 + 32) playerOptions] & 0x20) == 0) {
    return 0;
  }
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadata];
  char v3 = [v2 isAlwaysLive];

  if (v3) {
    return 0;
  }
  float v5 = *(float *)(a1 + 48);
  BOOL v6 = fabsf(v5) >= 0.001;
  return fabsf(v5 + -1.0) >= 0.001 && v6;
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_18(uint64_t a1)
{
  if (([*(id *)(a1 + 32) playerOptions] & 0x10) != 0
    && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadata],
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isAlwaysLive],
        v2,
        (v3 & 1) == 0))
  {
    return fabs(*(double *)(a1 + 48)) >= 0.001;
  }
  else
  {
    return 0;
  }
}

unint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_19(uint64_t a1)
{
  return ((unint64_t)[*(id *)(a1 + 32) playerOptions] >> 6) & 1;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"sendPlaybackSession"];
  id v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [v4 setPlayerOptions:0];
  [v4 setEndpointOptions:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_21;
  v23[3] = &unk_1E57D1DA0;
  id v24 = *(id *)(a1 + 32);
  id v25 = v3;
  id v5 = v3;
  BOOL v6 = (void *)MEMORY[0x1997190F0](v23);
  uint64_t v7 = [*(id *)(a1 + 40) origin];
  if ([v7 isLocal]) {
    double v8 = 7.0;
  }
  else {
    double v8 = 15.0;
  }

  int v9 = [MRBlockGuard alloc];
  id v10 = [NSString alloc];
  id v11 = [*(id *)(a1 + 32) requestID];
  uint64_t v12 = (void *)[v10 initWithFormat:@"sendPlaybackSession<%@>", v11];
  uint64_t v13 = [(MRBlockGuard *)v9 initWithTimeout:v12 reason:v6 handler:v8];

  v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void **)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_22;
  v19[3] = &unk_1E57D3888;
  id v20 = v13;
  id v21 = *(id *)(a1 + 32);
  id v22 = v6;
  id v17 = v6;
  id v18 = v13;
  MRMediaRemoteSendPlaybackSession(v14, v4, v15, v16, v19);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 endEvent:@"sendPlaybackSession" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) disarm])
  {
    [*(id *)(a1 + 40) merge:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"getPlaybackState"];
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_24;
  v7[3] = &unk_1E57D38D8;
  uint64_t v10 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  MRMediaRemoteGetPlaybackStateForPlayer(v4, v5, v7);
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_24(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  [*(id *)(a1 + 32) endEvent:@"getPlaybackState"];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) playerOptions] & 8) != 0)
  {
    [*(id *)(a1 + 32) startEvent:@"pause"];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [NSString alloc];
    id v6 = [*(id *)(a1 + 32) requestID];
    uint64_t v7 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(8);
    id v8 = (void *)[v5 initWithFormat:@"migrationPlaybackSession<%@> for option %@", v6, v7];
    [v4 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];

    id v9 = [*(id *)(a1 + 32) requestID];
    [v4 setObject:v9 forKeyedSubscript:@"kMRMediaRemoteOptionContextID"];

    uint64_t v10 = [MRPlayerPath alloc];
    id v11 = [*(id *)(a1 + 40) origin];
    uint64_t v12 = [(MRPlayerPath *)v10 initWithOrigin:v11 client:0 player:0];

    uint64_t v13 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_26;
    v14[3] = &unk_1E57D3900;
    id v15 = *(id *)(a1 + 32);
    id v16 = v3;
    MRMediaRemoteSendCommandToPlayer(1, v4, v12, 0, v13, v14);
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) endEvent:@"pause" withError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) playerOptions] & 0x40) != 0
    && [*(id *)(a1 + 32) allowFadeTransition])
  {
    [*(id *)(a1 + 32) startEvent:@"fadeOutSource"];
    id v4 = [[MRNowPlayingRequest alloc] initWithPlayerPath:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28;
    v8[3] = &unk_1E57D3928;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 64);
    id v11 = v6;
    uint64_t v12 = v7;
    [(MRNowPlayingRequest *)v4 triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:v5 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) endEvent:@"fadeOutSource"];
  if (v5)
  {
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28_cold_1((uint64_t)v5, v6);
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startEvent:@"coordinatePlayback"];
  id v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2_130;
  v10[3] = &unk_1E57D39A0;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 64);
  id v15 = v3;
  id v8 = v3;
  id v9 = v5;
  MRMediaRemoteSendPlaybackSession(0, v4, v6, v7, v10);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2_130(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) merge:a2];
  [*(id *)(a1 + 32) endEvent:@"coordinatePlayback" withError:v5];
  if (([*(id *)(a1 + 32) playerOptions] & 0x40) != 0
    && [*(id *)(a1 + 32) allowFadeTransition])
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v8 = v7;

    double v9 = 0.0;
    if (1.0 - v8 >= 0.0) {
      double v9 = (1.0 - v8) * 1000000000.0;
    }
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)v9);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3_131;
    block[3] = &unk_1E57D3978;
    id v11 = *(NSObject **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    id v13 = v5;
    dispatch_after(v10, v11, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3_131(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4_132;
  v3[3] = &unk_1E57D0DE0;
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4_132(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRPlaybackSession] Fade out failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
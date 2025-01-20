@interface MRMediaRemoteSendCommandToPlayerWithResult
@end

@implementation MRMediaRemoteSendCommandToPlayerWithResult

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MRCommandResult commandResultWithSendError:3];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2;
  v14 = &unk_1E57D4D68;
  int v22 = *(_DWORD *)(a1 + 88);
  id v7 = v5;
  id v15 = v7;
  int v23 = *(_DWORD *)(a1 + 92);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  v8 = (void (**)(void, void))MEMORY[0x1997190F0](&v11);
  if (v6)
  {
    v9 = [MRCommandResult alloc];
    v10 = -[MRCommandResult initWithError:](v9, "initWithError:", v6, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    ((void (**)(void, MRCommandResult *))v8)[2](v8, v10);
  }
  else
  {
    _MRMediaRemoteSendCommandToPlayer(*(unsigned int *)(a1 + 92), *(void **)(a1 + 32), *(void **)(a1 + 48), v7, *(void **)(a1 + 72), v8);
  }
}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = qos_class_self();
  [v3 setStartQOS:*(unsigned int *)(a1 + 88)];
  [v3 setEndQOS:v4];
  id v5 = [v3 error];
  if (v5)
  {
  }
  else
  {
    v8 = [v3 debugDescription];

    if (v8)
    {
      v9 = [v3 playerPath];
      if (v9)
      {
      }
      else if (!*(void *)(a1 + 32))
      {
        v10 = _MRLogForCategory(0xAuLL);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        uint64_t v11 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
        uint64_t v12 = [v3 debugDescription];
        v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 138544130;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        v88 = v12;
        *(_WORD *)v89 = 2048;
        *(void *)&v89[2] = v72;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_19:
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 0x2Au);
LABEL_25:

        goto LABEL_26;
      }
      v10 = _MRLogForCategory(0xAuLL);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      uint64_t v11 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
      uint64_t v12 = [v3 debugDescription];
      v14 = [v3 playerPath];
      id v17 = v14;
      if (!v14) {
        id v17 = *(void **)(a1 + 32);
      }
      id v18 = [MEMORY[0x1E4F1C9C8] date];
      [v18 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      v88 = v12;
      *(_WORD *)v89 = 2114;
      *(void *)&v89[2] = v17;
      *(_WORD *)&v89[10] = 2048;
      *(void *)&v89[12] = v19;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      goto LABEL_25;
    }
  }
  id v6 = [v3 error];

  id v7 = [v3 playerPath];
  if (!v6)
  {
    if (v7)
    {
    }
    else if (!*(void *)(a1 + 32))
    {
      v10 = _MRLogForCategory(0xAuLL);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      uint64_t v11 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2048;
      v88 = v71;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
LABEL_26:

      goto LABEL_27;
    }
    v10 = _MRLogForCategory(0xAuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    uint64_t v11 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
    uint64_t v12 = [v3 playerPath];
    v13 = v12;
    if (!v12) {
      v13 = *(void **)(a1 + 32);
    }
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2114;
    v88 = v13;
    *(_WORD *)v89 = 2048;
    *(void *)&v89[2] = v15;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_19;
  }
  if (v7)
  {

    goto LABEL_12;
  }
  if (*(void *)(a1 + 32))
  {
LABEL_12:
    v10 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_2(a1, v3, v10);
    }
    goto LABEL_27;
  }
  v10 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_1(a1, v3, v10);
  }
LABEL_27:

  if (*(_DWORD *)(a1 + 92) == 122)
  {
    id v20 = _MRLogForCategory(2uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = -v21;
      _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[MRSendCommand] WHAPRO: SetPlaybackQueue took %f seconds", buf, 0xCu);
    }

    int v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kMRMediaRemoteOptionHomeKitUserIdentifier"];
    if (v22 && ![v3 sendError])
    {
      int v23 = (void *)MRGetSharedService();
      MRMediaRemoteServiceSetNearbyDevicesToRemoteControl(v23, v22);
    }
  }
  if ([v3 sendError] == 6)
  {
    v24 = [*(id *)(a1 + 56) origin];

    if (v24)
    {
      v25 = +[MRMediaRemoteServiceClient sharedServiceClient];
      v26 = [*(id *)(a1 + 56) origin];
      [v25 processPlayerPathInvalidationHandlersWithInvalidOrigin:v26];
    }
  }
  v27 = _MRLogForCategory(2uLL);
  v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  os_signpost_id_t v29 = [v28 hash];

  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_194F3C000, v27, OS_SIGNPOST_INTERVAL_END, v29, "SendCommandWithResult", (const char *)&unk_195251F31, buf, 2u);
  }

  v30 = *(void **)(a1 + 80);
  if (v30)
  {
    v31 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_27;
    block[3] = &unk_1E57D0DB8;
    id v86 = v30;
    id v85 = v3;
    dispatch_async(v31, block);
  }
  v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kMRMediaRemoteOptionIsRedirectingCommand"];
  char v33 = [v32 BOOLValue];

  if ((v33 & 1) == 0)
  {
    v34 = *(void **)(a1 + 72);
    v35 = *(void **)(a1 + 56);
    v37 = *(void **)(a1 + 32);
    v36 = *(void **)(a1 + 40);
    v38 = [v3 playerPath];
    v39 = [v3 handlerReturnStatuses];
    int v80 = [v3 sendError];
    v40 = *(void **)(a1 + 48);
    id v81 = v34;
    id v41 = v36;
    id v42 = v35;
    id v43 = v38;
    id v44 = v39;
    id v45 = v40;
    id v46 = v37;
    v82 = [v46 origin];
    char v79 = [v46 isLocal];
    char v78 = [v46 isLocal];

    v47 = [MEMORY[0x1E4F28B50] mainBundle];
    v77 = [v47 bundleIdentifier];

    v83 = v44;
    if ([v44 count])
    {
      if ([v44 containsObject:&unk_1EE66EF70])
      {
        v48 = 0;
      }
      else
      {
        v48 = objc_msgSend(v44, "mr_first:", &__block_literal_global_53);
      }
      v49 = (__CFString *)MRMediaRemoteCopyCommandHandlerStatusDescription([v48 intValue]);
      v50 = v49;
      if (v49)
      {
        v51 = v49;
      }
      else
      {
        v51 = [v48 description];
      }
      v76 = v51;
    }
    else
    {
      v76 = 0;
    }
    v52 = [v41 objectForKeyedSubscript:@"kMRMediaRemoteOptionDirectUserInteraction"];
    char v73 = [v52 BOOLValue];

    v53 = [v42 client];
    v54 = [v53 bundleIdentifier];
    id v75 = v3;
    if ([v54 length])
    {
      BOOL v55 = 1;
    }
    else
    {
      [v42 client];
      v57 = id v56 = v42;
      BOOL v55 = (int)[v57 processIdentifier] > 0;

      id v42 = v56;
    }

    v58 = [v42 client];
    char v59 = [v58 hasPlaceholder];

    v60 = [v41 objectForKeyedSubscript:@"kMRMediaRemoteOptionContextID"];
    v61 = v41;
    v74 = v41;
    char v62 = [v60 BOOLValue];

    v63 = [v61 objectForKeyedSubscript:@"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"];
    v64 = dispatch_get_global_queue(-2, 0);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __trackAnalyticsSendCommand_block_invoke_2;
    v88 = &unk_1E57D4E50;
    *(void *)v89 = v45;
    *(void *)&v89[8] = v77;
    *(void *)&v89[16] = v43;
    id v90 = v81;
    id v91 = v63;
    char v94 = v78;
    char v95 = v79;
    int v93 = v80;
    char v96 = v73;
    BOOL v97 = v55;
    char v98 = v59;
    char v99 = v62;
    v92 = v76;
    id v65 = v45;
    id v66 = v77;
    id v67 = v43;
    id v68 = v81;
    id v69 = v63;
    v70 = v76;
    +[MRDeviceInfoRequest deviceInfoForOrigin:v82 queue:v64 completion:buf];

    id v3 = v75;
  }
}

uint64_t ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
  id v7 = [a2 error];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
  int v10 = 138544130;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_0_11();
  __int16 v12 = 2048;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
  id v7 = [a2 error];
  v8 = [a2 playerPath];
  uint64_t v9 = v8;
  if (!v8) {
    uint64_t v9 = *(void **)(a1 + 32);
  }
  int v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:*(void *)(a1 + 48)];
  int v13 = 138544386;
  uint64_t v14 = v6;
  OUTLINED_FUNCTION_0_11();
  __int16 v15 = v11;
  id v16 = v9;
  __int16 v17 = 2048;
  uint64_t v18 = v12;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v13, 0x34u);
}

@end
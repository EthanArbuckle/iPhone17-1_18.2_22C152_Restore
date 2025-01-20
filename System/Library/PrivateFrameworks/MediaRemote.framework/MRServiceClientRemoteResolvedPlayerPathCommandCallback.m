@interface MRServiceClientRemoteResolvedPlayerPathCommandCallback
@end

@implementation MRServiceClientRemoteResolvedPlayerPathCommandCallback

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  v5 = _MRLogForCategory(0xAuLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v4)
    {
      if (v6)
      {
        uint64_t v19 = a1[5];
        v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:a1[6]];
        int v27 = 138543874;
        v28 = @"playerCommand";
        __int16 v29 = 2114;
        uint64_t v30 = v19;
        __int16 v31 = 2048;
        id v32 = v20;
        v11 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v12 = v5;
        uint32_t v13 = 32;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (!v6) {
      goto LABEL_14;
    }
    v15 = (void *)a1[4];
    uint64_t v14 = a1[5];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:a1[6]];
    int v27 = 138544130;
    v28 = @"playerCommand";
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    __int16 v31 = 2114;
    id v32 = v15;
    __int16 v33 = 2048;
    uint64_t v34 = v16;
    v11 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_10:
    v12 = v5;
    uint32_t v13 = 42;
    goto LABEL_13;
  }
  if (!v4)
  {
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v17 = a1[5];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:a1[6]];
    int v27 = 138544130;
    v28 = @"playerCommand";
    __int16 v29 = 2114;
    uint64_t v30 = v17;
    __int16 v31 = 2112;
    id v32 = v3;
    __int16 v33 = 2048;
    uint64_t v34 = v18;
    v11 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_10;
  }
  if (v6)
  {
    uint64_t v8 = a1[4];
    uint64_t v7 = a1[5];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:a1[6]];
    int v27 = 138544386;
    v28 = @"playerCommand";
    __int16 v29 = 2114;
    uint64_t v30 = v7;
    __int16 v31 = 2112;
    id v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    uint64_t v36 = v10;
    v11 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    v12 = v5;
    uint32_t v13 = 52;
LABEL_13:
    _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);
  }
LABEL_14:

  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], v3, v21, v22, v23, v24, v25, v26);
}

uint64_t ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_70(void *a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MRServiceClientRemoteResolvedPlayerPathCommandCallback(MRMediaRemoteCommand, NSDictionary *__strong, MRPlayerPath *__strong, __strong MRMediaRemoteCommandHandlerCallback, void (^__strong)(NSArray<MRSendCommandResultStatus *> *__strong))_block_invoke");
    [v4 handleFailureInFunction:v5, @"MRCommandServiceClient.m", 237, @"Completion was not called for commandHandler=%@<%@>", a1[4], a1[5] file lineNumber description];
  }
  v2 = *(uint64_t (**)(void))(a1[6] + 16);

  return v2();
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_2()
{
  v0 = _MRLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();
  }
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_74()
{
  v0 = _MRLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();
  }

  v1 = _MRLogForCategory(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    ___MRServiceClientOriginCommandCallback_block_invoke_64_cold_1();
  }
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_75(uint64_t a1)
{
  v2 = _MRLogForCategory(2uLL);
  uint64_t v3 = [*(id *)(a1 + 32) hash];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_194F3C000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SendCommandPlayerMain", (const char *)&unk_195251F31, buf, 2u);
    }
  }

  v5 = _MRLogForCategory(2uLL);
  uint64_t v6 = [*(id *)(a1 + 32) hash];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_194F3C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SendCommandPlayer", (const char *)&unk_195251F31, buf, 2u);
    }
  }

  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(unsigned int *)(a1 + 88);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_76;
  v11[3] = &unk_1E57D5518;
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 80);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10, v11);
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
  if ([*(id *)(a1 + 48) disarm])
  {
    os_signpost_id_t v4 = _MRLogForCategory(2uLL);
    uint64_t v5 = [*(id *)(a1 + 56) hash];
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)os_signpost_id_t v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_194F3C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SendCommandPlayer", (const char *)&unk_195251F31, v7, 2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

@end
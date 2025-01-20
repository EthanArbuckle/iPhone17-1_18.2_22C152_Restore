@interface MRServiceClientOriginCommandCallback
@end

@implementation MRServiceClientOriginCommandCallback

void ___MRServiceClientOriginCommandCallback_block_invoke(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 error];

  v4 = [v3 error];

  uint64_t v5 = a1[4];
  v6 = _MRLogForCategory(0xAuLL);
  v7 = v6;
  if (!v4)
  {
    BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v14) {
        goto LABEL_14;
      }
      v16 = (void *)a1[4];
      uint64_t v15 = a1[5];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v23 = 138544130;
      v24 = @"originCommand";
      __int16 v25 = 2114;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      __int16 v29 = 2048;
      uint64_t v30 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v7;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v21 = a1[5];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v23 = 138543874;
      v24 = @"originCommand";
      __int16 v25 = 2114;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      v28 = v22;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v7;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, v20);
    goto LABEL_13;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = a1[5];
      v10 = [v3 error];
      uint64_t v11 = a1[4];
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:a1[6]];
      int v23 = 138544386;
      v24 = @"originCommand";
      __int16 v25 = 2114;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      uint64_t v30 = v11;
      __int16 v31 = 2048;
      uint64_t v32 = v13;
      _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v23, 0x34u);

LABEL_13:
    }
  }
  else if (v8)
  {
    ___MRServiceClientOriginCommandCallback_block_invoke_cold_1((uint64_t)a1, v3, v7);
  }
LABEL_14:

  (*(void (**)(void))(a1[7] + 16))();
}

void ___MRServiceClientOriginCommandCallback_block_invoke_54(void *a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MRServiceClientOriginCommandCallback(MRPlayerPath *__strong, MRMediaRemoteCommand, NSDictionary *__strong, __strong MRMediaRemotePlayerPathCommandHandlerCallback, void (^__strong)(MRCommandResult *__strong))_block_invoke");
    [v3 handleFailureInFunction:v4, @"MRCommandServiceClient.m", 196, @"Completion was not called for originCommandHandler=%@<%@>", a1[4], a1[5] file lineNumber description];
  }
  uint64_t v2 = a1[6];
  id v5 = +[MRCommandResult commandResultWithSendError:8];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void ___MRServiceClientOriginCommandCallback_block_invoke_2()
{
  v0 = _MRLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();
  }
}

void ___MRServiceClientOriginCommandCallback_block_invoke_64()
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

void ___MRServiceClientOriginCommandCallback_block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
  if ([*(id *)(a1 + 48) disarm])
  {
    v4 = _MRLogForCategory(2uLL);
    uint64_t v5 = [*(id *)(a1 + 56) hash];
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_194F3C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SendCommandOrigin", (const char *)&unk_195251F31, v7, 2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void ___MRServiceClientOriginCommandCallback_block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  os_signpost_id_t v6 = [a2 error];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 48)];
  int v9 = 138544130;
  v10 = @"originCommand";
  __int16 v11 = 2114;
  uint64_t v12 = v5;
  __int16 v13 = 2114;
  BOOL v14 = v6;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v9, 0x2Au);
}

void ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_2_4(&dword_194F3C000, v0, v1, "It has been more than <%lf> seconds since commandHandler=%@<%@> was called and still waiting for completion", v2, v3, v4, v5, v6);
}

void ___MRServiceClientOriginCommandCallback_block_invoke_64_cold_1()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_13();
  _os_log_fault_impl(&dword_194F3C000, v0, OS_LOG_TYPE_FAULT, "It has been more than <%lf> seconds since commandHandler=%@<%@> was called and still waiting for completion", v1, 0x20u);
}

@end
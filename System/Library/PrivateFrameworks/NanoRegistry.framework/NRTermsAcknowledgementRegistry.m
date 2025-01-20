@interface NRTermsAcknowledgementRegistry
+ (id)errorStringWithEnum:(unint64_t)a3;
+ (id)errorWithEnum:(unint64_t)a3;
- (id)proxyWithErrorHandler:(uint64_t)a1;
- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5;
@end

@implementation NRTermsAcknowledgementRegistry

void __44__NRTermsAcknowledgementRegistry_connection__block_invoke()
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D6408];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanoregistry.termsacknowledgementregistry" options:4096];
  v1 = (void *)qword_1EB30BA60;
  qword_1EB30BA60 = v0;

  [(id)qword_1EB30BA60 setRemoteObjectInterface:v2];
  [(id)qword_1EB30BA60 resume];
}

- (id)proxyWithErrorHandler:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_138);
    }
    id v3 = (id)qword_1EB30BA60;
    v4 = [v3 remoteObjectProxyWithErrorHandler:v2];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 termsText];
  unint64_t v12 = [v11 length];

  if (v12 > 9)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_2;
    v19[3] = &unk_1E5B00080;
    id v14 = v10;
    id v20 = v14;
    v15 = -[NRTermsAcknowledgementRegistry proxyWithErrorHandler:]((uint64_t)self, v19);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_189;
    v16[3] = &unk_1E5B000A8;
    id v17 = v8;
    id v18 = v14;
    [v15 add:v17 forDeviceID:v9 withCompletion:v16];
  }
  else
  {
    v13 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke;
    block[3] = &unk_1E5B00058;
    block[4] = self;
    id v22 = v10;
    dispatch_async(v13, block);
  }
}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [(id)objc_opt_class() errorWithEnum:10];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry add:forEventID:withCompletion: XPC error %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = nr_framework_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      v6 = nr_framework_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138412546;
        id v9 = v3;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry add:forEventID:withCompletion: returning error %@ event %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [v8 termsText];
  unint64_t v12 = [v11 length];

  if (v12 > 9)
  {
    if ([v8 eventType])
    {
      id v14 = [(id)objc_opt_class() errorWithEnum:3];
      v15 = nr_framework_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        id v17 = nr_framework_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v14;
          __int16 v29 = 2112;
          id v30 = v8;
          _os_log_error_impl(&dword_1A356E000, v17, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: exception %@ event %@", buf, 0x16u);
        }
      }
      v10[2](v10, 0, v14);
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_190;
      v23[3] = &unk_1E5B00080;
      id v18 = v10;
      id v24 = v18;
      v19 = -[NRTermsAcknowledgementRegistry proxyWithErrorHandler:]((uint64_t)self, v23);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_191;
      v20[3] = &unk_1E5B000D0;
      id v21 = v8;
      id v22 = v18;
      [v19 checkForAcknowledgement:v21 forDeviceID:v9 withCompletion:v20];
    }
  }
  else
  {
    v13 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke;
    block[3] = &unk_1E5B00058;
    block[4] = self;
    v26 = v10;
    dispatch_async(v13, block);
  }
}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [(id)objc_opt_class() errorWithEnum:10];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_190(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: XPC error %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_191(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      int v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: returning error %@ event %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)errorStringWithEnum:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"🤷‍♂️";
  }
  else {
    return off_1E5B00138[a3];
  }
}

+ (id)errorWithEnum:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  BOOL v5 = +[NRTermsAcknowledgementRegistry errorStringWithEnum:](NRTermsAcknowledgementRegistry, "errorStringWithEnum:");
  v10[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v7 = [v4 errorWithDomain:@"com.apple.nanoregistry.termsacknowledgementregistry" code:a3 userInfo:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end
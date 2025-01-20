@interface AeroMLTracerSession
+ (id)generateTraceId;
+ (id)logChannelWithSubsystem:(const char *)a3 category:(const char *)a4;
- (AeroMLTracerSession)initWithProjectName:(id)a3;
- (AeroMLTracerSession)initWithTraceId:(id)a3 projectName:(id)a4;
- (NSString)projectName;
- (NSString)traceId;
- (OS_os_log)traceChannel;
- (OS_os_log)traceSignpost;
- (id)createRootSpanWithName:(id)a3;
- (id)createSubSpanWithName:(id)a3 parentSpanId:(id)a4;
- (void)setTraceChannel:(id)a3;
- (void)setTraceSignpost:(id)a3;
@end

@implementation AeroMLTracerSession

+ (id)generateTraceId
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  return v3;
}

+ (id)logChannelWithSubsystem:(const char *)a3 category:(const char *)a4
{
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%s", a3, a4);
  if (logChannelWithSubsystem_category___pasOnceToken2 != -1) {
    dispatch_once(&logChannelWithSubsystem_category___pasOnceToken2, &__block_literal_global_19);
  }
  id v7 = (id)logChannelWithSubsystem_category___pasExprOnceResult;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5;
  v11[3] = &unk_1E5AE01E0;
  v13 = &v16;
  id v8 = v6;
  id v12 = v8;
  v14 = a3;
  v15 = a4;
  [v7 runWithLockAcquired:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  v4 = (void *)logChannelWithSubsystem_category___pasExprOnceResult;
  logChannelWithSubsystem_category___pasExprOnceResult = v3;
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:a1[4]];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v8 = (const char *)a1[6];
    id v7 = a1 + 6;
    os_log_t v9 = os_log_create(v8, (const char *)v7[1]);
    uint64_t v10 = *(void *)(*(v7 - 1) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [v3 setObject:*(void *)(*(void *)(*(v7 - 1) + 8) + 40) forKeyedSubscript:*(v7 - 2)];
    if (*(void *)(*(void *)(*(v7 - 1) + 8) + 40))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *v7;
        uint64_t v13 = v7[1];
        int v14 = 136315394;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1A314B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Successfully created os_log_t for subsystem: %s, category: %s", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5_cold_1(v7, v7 + 1);
    }
  }
}

- (AeroMLTracerSession)initWithTraceId:(id)a3 projectName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AeroMLTracerSession;
  id v8 = [(AeroMLTracerSession *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    traceId = v8->_traceId;
    v8->_traceId = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    projectName = v8->_projectName;
    v8->_projectName = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    id v14 = v7;
    uint64_t v15 = objc_msgSend(v13, "logChannelWithSubsystem:category:", objc_msgSend(v14, "UTF8String"), "signpost");
    traceSignpost = v8->_traceSignpost;
    v8->_traceSignpost = (OS_os_log *)v15;

    uint64_t v17 = objc_msgSend( objc_opt_class(), "logChannelWithSubsystem:category:", objc_msgSend(v14, "UTF8String"), "AMLTracer");
    traceChannel = v8->_traceChannel;
    v8->_traceChannel = (OS_os_log *)v17;
  }
  return v8;
}

- (AeroMLTracerSession)initWithProjectName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AeroMLTracerSession generateTraceId];
  id v6 = [(AeroMLTracerSession *)self initWithTraceId:v5 projectName:v4];

  return v6;
}

- (id)createRootSpanWithName:(id)a3
{
  id v4 = a3;
  id v5 = [[AeroMLTracerSpan alloc] initSpanWithSpanName:v4 traceSession:self parentSpanId:0];

  return v5;
}

- (id)createSubSpanWithName:(id)a3 parentSpanId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AeroMLTracerSpan alloc] initSpanWithSpanName:v7 traceSession:self parentSpanId:v6];

  return v8;
}

- (NSString)traceId
{
  return self->_traceId;
}

- (NSString)projectName
{
  return self->_projectName;
}

- (OS_os_log)traceSignpost
{
  return self->_traceSignpost;
}

- (void)setTraceSignpost:(id)a3
{
}

- (OS_os_log)traceChannel
{
  return self->_traceChannel;
}

- (void)setTraceChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceChannel, 0);
  objc_storeStrong((id *)&self->_traceSignpost, 0);
  objc_storeStrong((id *)&self->_projectName, 0);

  objc_storeStrong((id *)&self->_traceId, 0);
}

void __56__AeroMLTracerSession_logChannelWithSubsystem_category___block_invoke_5_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 136315394;
  uint64_t v5 = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1A314B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t for subsystem: %s, category: %s", (uint8_t *)&v4, 0x16u);
}

@end
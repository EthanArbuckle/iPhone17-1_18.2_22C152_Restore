@interface PLXPCMessageLogger
+ (BOOL)enabled;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
@end

@implementation PLXPCMessageLogger

void __29__PLXPCMessageLogger_enabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  enabled_enabled = [v0 BOOLForKey:@"PLXPCMessageLogger"];
}

+ (BOOL)enabled
{
  if (enabled_onceToken != -1) {
    dispatch_once(&enabled_onceToken, &__block_literal_global_11221);
  }
  return enabled_enabled;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = [v6 userInfo];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F292F0]];
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F292F8]];
    v11 = [v10 objectForKeyedSubscript:@"SignpostId"];

    if (v11)
    {
      v12 = PLRequestGetLog();
      uint64_t v13 = [v11 unsignedLongLongValue];
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          int v16 = 138543362;
          ClassName = v9;
          _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Async", "%{public}@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      ClassName = v9;
      _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEFAULT, "PLXPC ->reply: %@", (uint8_t *)&v16, 0xCu);
    }

    goto LABEL_12;
  }
  v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 target];
    int v16 = 136315394;
    ClassName = object_getClassName(v9);
    __int16 v18 = 2080;
    Name = sel_getName((SEL)[v7 selector]);
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "PLXPC request: -[%s %s]", (uint8_t *)&v16, 0x16u);
LABEL_12:
  }
  [v7 invoke];
}

@end
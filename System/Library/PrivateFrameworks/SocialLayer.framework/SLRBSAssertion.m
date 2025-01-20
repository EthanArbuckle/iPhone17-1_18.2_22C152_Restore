@interface SLRBSAssertion
+ (id)assertionNameForType:(int64_t)a3;
+ (id)assertionWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5;
- (BOOL)isValid;
- (RBSAssertion)assertion;
- (SLRBSAssertion)initWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SLRBSAssertion

+ (id)assertionNameForType:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"CollaborationHandshake";
  }
}

+ (id)assertionWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:a3 pid:*(void *)&a4 error:a5];
  return v5;
}

- (SLRBSAssertion)initWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v38[1] = *MEMORY[0x1E4F143B8];
  v8 = +[SLRBSAssertion assertionNameForType:a3];
  if (v8)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"SLRBSAssertion for pid: %i", v6);
    v10 = [MEMORY[0x1E4F96478] targetWithPid:v6];
    v11 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.sociallayer" name:v8];
    id v12 = objc_alloc(MEMORY[0x1E4F96318]);
    v36 = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    v14 = (void *)[v12 initWithExplanation:v9 target:v10 attributes:v13];

    if ([v14 acquireWithError:a5])
    {
      v25.receiver = self;
      v25.super_class = (Class)SLRBSAssertion;
      v15 = [(SLRBSAssertion *)&v25 init];
      if (v15)
      {
        p_isa = (id *)&v15->super.isa;
        v17 = SLDaemonLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v29 = "-[SLRBSAssertion initWithType:pid:error:]";
          __int16 v30 = 2048;
          v31 = v14;
          __int16 v32 = 2112;
          v33 = v8;
          __int16 v34 = 1024;
          int v35 = v6;
          _os_log_impl(&dword_19BE17000, v17, OS_LOG_TYPE_DEFAULT, "%s acquired assertion: <RBSAssertion: %p> name: '%@' for pid: %i", buf, 0x26u);
        }

        objc_storeStrong(p_isa + 1, v14);
        self = p_isa;
        v18 = self;
        goto LABEL_17;
      }
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28228];
        v27 = @"SLRBSAssertion init failed";
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        *a5 = [v21 errorWithDomain:@"com.apple.sociallayerd.SLRBSAssertion" code:0 userInfo:v22];
      }
      v23 = SLDaemonLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SLRBSAssertion initWithType:pid:error:](v23);
      }

      [v14 invalidate];
      self = 0;
    }
    else
    {
      v20 = SLDaemonLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SLRBSAssertion initWithType:pid:error:]((uint64_t *)a5, v6, v20);
      }
    }
    v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v37 = *MEMORY[0x1E4F28228];
  v38[0] = @"SLRBSAssertion: invalid assertion type";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  [v19 errorWithDomain:@"com.apple.sociallayerd.SLRBSAssertion" code:0 userInfo:v9];
  v18 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

- (BOOL)isValid
{
  v2 = [(SLRBSAssertion *)self assertion];
  char v3 = [v2 isValid];

  return v3;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(SLRBSAssertion *)self isValid])
  {
    char v3 = SLDaemonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(SLRBSAssertion *)self assertion];
      int v6 = 136315394;
      v7 = "-[SLRBSAssertion invalidate]";
      __int16 v8 = 2048;
      v9 = v4;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "%s invalidating assertion: <RBSAssertion: %p>", (uint8_t *)&v6, 0x16u);
    }
    v5 = [(SLRBSAssertion *)self assertion];
    [v5 invalidate];
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SLRBSAssertion *)self isValid])
  {
    char v3 = SLDaemonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(SLRBSAssertion *)self assertion];
      *(_DWORD *)buf = 136315394;
      __int16 v8 = "-[SLRBSAssertion dealloc]";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "%s invalidating assertion: <RBSAssertion: %p>", buf, 0x16u);
    }
    v5 = [(SLRBSAssertion *)self assertion];
    [v5 invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)SLRBSAssertion;
  [(SLRBSAssertion *)&v6 dealloc];
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
}

- (void)initWithType:(os_log_t)log pid:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SLRBSAssertion initWithType:pid:error:]";
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "%s initialization failed, but we acquired the assertion. Invalidating it and returning nil", (uint8_t *)&v1, 0xCu);
}

- (void)initWithType:(uint64_t *)a1 pid:(int)a2 error:(os_log_t)log .cold.2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  v5 = "-[SLRBSAssertion initWithType:pid:error:]";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "%s Unable to acquire assertion for pid: %i error: %@", (uint8_t *)&v4, 0x1Cu);
}

@end
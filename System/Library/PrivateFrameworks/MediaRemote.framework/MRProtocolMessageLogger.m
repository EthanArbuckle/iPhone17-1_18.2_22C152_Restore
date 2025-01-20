@interface MRProtocolMessageLogger
+ (id)sharedLogger;
- (BOOL)shouldLog;
- (BOOL)shouldVerboselyLog;
- (MRProtocolMessageLogger)init;
- (void)logMessage:(id)a3 client:(id)a4 protocolMessage:(id)a5;
- (void)logMessage:(id)a3 label:(id)a4 deviceInfo:(id)a5 protocolMessage:(id)a6;
- (void)setShouldLog:(BOOL)a3;
- (void)setShouldVerboselyLog:(BOOL)a3;
@end

@implementation MRProtocolMessageLogger

- (MRProtocolMessageLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRProtocolMessageLogger;
  v2 = [(MRProtocolMessageLogger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MRProtocolMessageLogger *)v2 setShouldLog:1];
    v4 = +[MRUserSettings currentSettings];
    -[MRProtocolMessageLogger setShouldVerboselyLog:](v3, "setShouldVerboselyLog:", [v4 verboseProtocolMessageLogging]);
  }
  return v3;
}

+ (id)sharedLogger
{
  if (sharedLogger___once != -1) {
    dispatch_once(&sharedLogger___once, &__block_literal_global_114);
  }
  v2 = (void *)sharedLogger___sharedContext;

  return v2;
}

uint64_t __39__MRProtocolMessageLogger_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(MRProtocolMessageLogger);
  uint64_t v1 = sharedLogger___sharedContext;
  sharedLogger___sharedContext = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)logMessage:(id)a3 client:(id)a4 protocolMessage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v9 label];
  v11 = [v9 deviceInfo];

  [(MRProtocolMessageLogger *)self logMessage:v10 label:v12 deviceInfo:v11 protocolMessage:v8];
}

- (void)logMessage:(id)a3 label:(id)a4 deviceInfo:(id)a5 protocolMessage:(id)a6
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v50 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(MRProtocolMessageLogger *)self shouldLog])
  {
    v66[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    objc_opt_class();
    id v42 = v12;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v12 messages];

      v13 = (void *)v14;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v65 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v52;
      id v48 = v15;
      id v49 = v11;
      id v47 = v10;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v52 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v51 + 1) + 8 * v19);
          if ([v20 shouldLog])
          {
            if (v10)
            {
              uint64_t v21 = [[NSString alloc] initWithFormat:@"[%@] ", v10];
              if (v21)
              {
                v22 = v21;
                v23 = self;
                if ([(MRProtocolMessageLogger *)self shouldVerboselyLog]
                  || [v20 shouldVerboselyLog])
                {
                  v24 = _MRLogForCategory(1uLL);
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    v25 = [v11 deviceUID];
                    uint64_t v26 = (uint64_t)v25;
                    if (!v25)
                    {
                      uint64_t v26 = [v11 identifier];
                      v45 = (void *)v26;
                    }
                    v27 = [v11 name];
                    v28 = [v20 description];
                    *(_DWORD *)buf = 138544386;
                    v56 = v22;
                    __int16 v57 = 2114;
                    v58 = v50;
                    __int16 v59 = 2114;
                    uint64_t v60 = v26;
                    __int16 v61 = 2112;
                    v62 = v27;
                    __int16 v63 = 2114;
                    v64 = v28;
                    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@ <%{public}@-%@>]: %{public}@", buf, 0x34u);

                    if (!v25)
                    {
                      v29 = v45;
                      goto LABEL_37;
                    }
                    goto LABEL_38;
                  }
                }
                else
                {
                  v24 = _MRLogForCategory(0);
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    v25 = [v11 deviceUID];
                    uint64_t v38 = (uint64_t)v25;
                    if (!v25)
                    {
                      uint64_t v43 = [v11 identifier];
                      uint64_t v38 = v43;
                    }
                    v39 = [v11 name];
                    v40 = [v20 description];
                    *(_DWORD *)buf = 138544386;
                    v56 = v22;
                    __int16 v57 = 2114;
                    v58 = v50;
                    __int16 v59 = 2114;
                    uint64_t v60 = v38;
                    __int16 v61 = 2112;
                    v62 = v39;
                    __int16 v63 = 2114;
                    v64 = v40;
                    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@ <%{public}@-%@>]: %{public}@", buf, 0x34u);

                    if (!v25)
                    {
                      v29 = (void *)v43;
LABEL_37:
                    }
LABEL_38:

                    id v15 = v48;
                    id v11 = v49;
                  }
                }

                self = v23;
                id v10 = v47;
LABEL_40:

                goto LABEL_41;
              }
            }
            if (self->_shouldVerboselyLog || [v20 shouldVerboselyLog])
            {
              v22 = _MRLogForCategory(1uLL);
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_40;
              }
              v30 = [v11 deviceUID];
              v31 = v30;
              if (!v30)
              {
                uint64_t v46 = [v11 identifier];
                v31 = v46;
              }
              v32 = [v11 name];
              v33 = [v20 description];
              *(_DWORD *)buf = 138413058;
              v56 = v50;
              __int16 v57 = 2114;
              v58 = v31;
              __int16 v59 = 2112;
              uint64_t v60 = (uint64_t)v32;
              __int16 v61 = 2114;
              v62 = v33;
              _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "[%@ <%{public}@-%@>]: %{public}@", buf, 0x2Au);

              if (!v30)
              {
                v34 = (void *)v46;
                goto LABEL_26;
              }
            }
            else
            {
              v22 = _MRLogForCategory(0);
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_40;
              }
              v30 = [v11 deviceUID];
              v35 = v30;
              if (!v30)
              {
                uint64_t v44 = [v11 identifier];
                v35 = v44;
              }
              v36 = [v11 name];
              v37 = [v20 description];
              *(_DWORD *)buf = 138413058;
              v56 = v50;
              __int16 v57 = 2114;
              v58 = v35;
              __int16 v59 = 2112;
              uint64_t v60 = (uint64_t)v36;
              __int16 v61 = 2114;
              v62 = v37;
              _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "[%@ <%{public}@-%@>]: %{public}@", buf, 0x2Au);

              if (!v30)
              {
                v34 = (void *)v44;
LABEL_26:
              }
            }

            id v15 = v48;
            id v11 = v49;
            goto LABEL_40;
          }
LABEL_41:
          ++v19;
        }
        while (v17 != v19);
        uint64_t v41 = [v15 countByEnumeratingWithState:&v51 objects:v65 count:16];
        uint64_t v17 = v41;
      }
      while (v41);
    }

    id v12 = v42;
  }
}

- (BOOL)shouldLog
{
  return self->_shouldLog;
}

- (void)setShouldLog:(BOOL)a3
{
  self->_shouldLog = a3;
}

- (BOOL)shouldVerboselyLog
{
  return self->_shouldVerboselyLog;
}

- (void)setShouldVerboselyLog:(BOOL)a3
{
  self->_shouldVerboselyLog = a3;
}

@end
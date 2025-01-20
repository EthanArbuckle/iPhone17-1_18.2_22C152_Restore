@interface RBPersonaManager
- (BOOL)isConcretePersona:(id)a3;
- (BOOL)personaForIdentity:(id)a3 context:(id)a4 personaUID:(unsigned int *)a5 personaUniqueString:(id *)a6;
- (BOOL)personaRequiredForExtensionContext:(id)a3 serviceDict:(id)a4;
- (BOOL)personasAreSupported;
- (RBPersonaManager)init;
- (id)personalPersonaUniqueString;
@end

@implementation RBPersonaManager

- (BOOL)personaForIdentity:(id)a3 context:(id)a4 personaUID:(unsigned int *)a5 personaUniqueString:(id *)a6
{
  v34[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (![(RBPersonaManager *)self personasAreSupported])
  {
    BOOL v21 = 0;
    goto LABEL_24;
  }
  v28 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  v34[0] = [v10 personaString];
  uint64_t v13 = [v11 managedPersona];
  char v14 = 0;
  uint64_t v15 = 0;
  id v16 = 0;
  v34[1] = v13;
  unsigned int personalPersonaUID = -1;
  do
  {
    v18 = (void *)v34[v15];
    if (v18)
    {
      *(void *)buf = 1;
      [v18 UTF8String];
      kpersona_find();
    }
    char v19 = v14;
    char v14 = 1;
    uint64_t v15 = 1;
  }
  while ((v19 & 1) == 0);
  if ([v11 lsPersona])
  {
    uint64_t v33 = 0;
    memset(v32, 0, sizeof(v32));
    long long v31 = 0u;
    long long v30 = 0u;
    memset(&buf[4], 0, 48);
    *(_DWORD *)buf = 2;
    v20 = v28;
    if (!kpersona_info())
    {
      unsigned int personalPersonaUID = *(_DWORD *)&buf[4];
      uint64_t v23 = [NSString stringWithUTF8String:(char *)v32 + 4];

      id v16 = (id)v23;
      if (!v28)
      {
LABEL_16:
        if (a6)
        {
          id v16 = v16;
          *a6 = v16;
        }
        BOOL v21 = 1;
        goto LABEL_19;
      }
LABEL_15:
      unsigned int *v20 = personalPersonaUID;
      goto LABEL_16;
    }
  }
  else
  {
    v20 = v28;
  }
  if (objc_opt_class())
  {
    unsigned int personalPersonaUID = self->_personalPersonaUID;
    v22 = self->_personalPersonaUniqueString;

    id v16 = v22;
    if (!v20) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL v21 = 0;
LABEL_19:
  double v24 = CFAbsoluteTimeGetCurrent();
  v25 = rbs_job_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:]";
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (v24 - Current) * 1000.0;
    *(_WORD *)&buf[32] = 1024;
    *(_DWORD *)&buf[34] = personalPersonaUID;
    *(_WORD *)&buf[38] = 2114;
    *(void *)&buf[40] = v16;
    _os_log_impl(&dword_226AB3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: %s required %f ms (wallclock); resolved to {%u, %{public}@}",
      buf,
      0x30u);
  }

  for (uint64_t i = 1; i != -1; --i)
LABEL_24:

  return v21;
}

- (BOOL)personasAreSupported
{
  return self->_personasSupported;
}

- (BOOL)personaRequiredForExtensionContext:(id)a3 serviceDict:(id)a4
{
  id v5 = a4;
  v6 = [a3 identity];
  v7 = [v6 personaString];
  if (v7)
  {
    v8 = xpc_dictionary_get_value(v5, "PersonaEnterprise");
    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (RBPersonaManager)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)RBPersonaManager;
  v2 = [(RBPersonaManager *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_personasSupported = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    personalPersonaUniqueString = v2->_personalPersonaUniqueString;
    v2->_personalPersonaUniqueString = 0;

    if (objc_opt_class())
    {
      id v5 = [MEMORY[0x263F841C8] personaAttributesForPersonaType:3];
      v6 = [MEMORY[0x263F841C8] personaAttributesForPersonaType:0];
      v7 = v6;
      if (v5) {
        BOOL v8 = v6 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      char v9 = !v8;
      v3->_personasSupported = v9;
      if (!v8)
      {
        v3->_unsigned int personalPersonaUID = objc_msgSend(v6, "userPersona_id");
        uint64_t v10 = [v7 userPersonaUniqueString];
        id v11 = v3->_personalPersonaUniqueString;
        v3->_personalPersonaUniqueString = (NSString *)v10;
      }
      v12 = [MEMORY[0x263F841A8] sharedManager];
      int v13 = [v12 isSharedIPad];

      if (v13) {
        char v14 = "YES";
      }
      else {
        char v14 = "NO";
      }
    }
    else
    {
      char v14 = "NO";
    }
    uint64_t v15 = rbs_job_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_personasSupported) {
        id v16 = "YES";
      }
      else {
        id v16 = "NO";
      }
      *(_DWORD *)buf = 136315394;
      v20 = v16;
      __int16 v21 = 2080;
      v22 = v14;
      _os_log_impl(&dword_226AB3000, v15, OS_LOG_TYPE_DEFAULT, "Personas are supported: %s; isSharedIPad: %s",
        buf,
        0x16u);
    }
  }
  return v3;
}

- (id)personalPersonaUniqueString
{
  if ([(RBPersonaManager *)self personasAreSupported]) {
    v3 = self->_personalPersonaUniqueString;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isConcretePersona:(id)a3
{
  id v4 = a3;
  if ([(RBPersonaManager *)self personasAreSupported])
  {
    [v4 UTF8String];
    kpersona_find();
  }

  return 0;
}

- (void).cxx_destruct
{
}

@end
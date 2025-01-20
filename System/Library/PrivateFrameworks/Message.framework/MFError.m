@interface MFError
+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5;
+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5 title:(id)a6 userInfo:(id)a7;
+ (MFError)errorWithException:(id)a3;
- (MFError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (id)localizedDescription;
- (id)mf_moreInfo;
- (id)mf_shortDescription;
- (id)recoveryAttempter;
- (id)userInfo;
- (void)setLocalizedDescription:(id)a3;
- (void)setMoreInfo:(id)a3;
- (void)setShortDescription:(id)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)useGenericDescription:(id)a3;
@end

@implementation MFError

- (MFError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (initWithDomain_code_userInfo__onceToken != -1) {
    dispatch_once(&initWithDomain_code_userInfo__onceToken, &__block_literal_global_31);
  }
  v13.receiver = self;
  v13.super_class = (Class)MFError;
  v10 = [(MFError *)&v13 initWithDomain:v8 code:a4 userInfo:v9];
  v11 = v10;
  if (v10) {
    v10->_moreUserInfoLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

uint64_t __40__MFError_initWithDomain_code_userInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "ef_setDecoder:forDomain:", &__block_literal_global_22, @"MFMessageErrorDomain");
}

__CFString *__40__MFError_initWithDomain_code_userInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1028) >= 0x21)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown Error Code %ld", a2);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = off_1E5D3E5F0[a2 - 1028];
  }
  return v2;
}

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5
{
  v5 = [a1 errorWithDomain:a3 code:a4 localizedDescription:a5 title:0 userInfo:0];
  return (MFError *)v5;
}

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5 title:(id)a6 userInfo:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  unint64_t v13 = (unint64_t)a5;
  unint64_t v14 = (unint64_t)a6;
  id v15 = a7;
  v16 = v15;
  if (v12)
  {
    if (v13 | v14)
    {
      if (v15) {
        id v18 = (id)[v15 mutableCopy];
      }
      else {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v19 = v18;
      if (v13) {
        [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      if (v14) {
        [v19 setObject:v14 forKeyedSubscript:@"_MFShortDescription"];
      }
      id v17 = [a1 errorWithDomain:v12 code:a4 localizedDescription:0 title:0 userInfo:v19];
      v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v21 = [v20 BOOLForKey:@"MFNoErrorLog"];

      if ((v21 & 1) == 0)
      {
        v22 = MFLogGeneral();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_msgSend(v17, "ef_publicDescription");
          +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](v23, v25, v22);
        }
      }
    }
    else
    {
      id v17 = [a1 errorWithDomain:v12 code:a4 userInfo:v15];
    }
  }
  else
  {
    id v17 = 0;
  }

  return (MFError *)v17;
}

+ (MFError)errorWithException:(id)a3
{
  v4 = [a3 reason];
  v5 = [a1 errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:v4];

  return (MFError *)v5;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
}

- (id)userInfo
{
  v8.receiver = self;
  v8.super_class = (Class)MFError;
  v3 = [(MFError *)&v8 userInfo];
  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  moreUserInfo = self->_moreUserInfo;
  if (moreUserInfo)
  {
    if (v3)
    {
      v6 = (void *)[(NSMutableDictionary *)moreUserInfo mutableCopy];
      [v6 addEntriesFromDictionary:v3];
    }
    else
    {
      v6 = (void *)[(NSMutableDictionary *)moreUserInfo copy];
    }
  }
  else
  {
    v6 = v3;
  }
  os_unfair_lock_unlock(p_moreUserInfoLock);
  return v6;
}

- (id)localizedDescription
{
  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  v4 = [(NSMutableDictionary *)self->_moreUserInfo objectForKey:*MEMORY[0x1E4F28568]];
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    v4 = [(MFError *)&v6 localizedDescription];
  }
  return v4;
}

- (id)recoveryAttempter
{
  v2 = [(MFError *)self userInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F288B8]];
  if (!v3)
  {
    v4 = [v2 objectForKey:@"RecoveryAttemptorClassName"];
    v5 = v4;
    if (v4) {
      id v3 = objc_alloc_init(NSClassFromString(v4));
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)mf_moreInfo
{
  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  v4 = [(NSMutableDictionary *)self->_moreUserInfo objectForKey:@"_MFMoreInfo"];
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    v4 = [(NSError *)&v6 mf_moreInfo];
  }
  return v4;
}

- (id)mf_shortDescription
{
  p_moreUserInfoLock = &self->_moreUserInfoLock;
  os_unfair_lock_lock(&self->_moreUserInfoLock);
  v4 = [(NSMutableDictionary *)self->_moreUserInfo objectForKey:@"_MFShortDescription"];
  os_unfair_lock_unlock(p_moreUserInfoLock);
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFError;
    v4 = [(NSError *)&v6 mf_shortDescription];
  }
  return v4;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void)setMoreInfo:(id)a3
{
}

- (void)setShortDescription:(id)a3
{
}

- (void)useGenericDescription:(id)a3
{
  id v9 = a3;
  v4 = [(MFError *)self localizedDescription];
  v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    id v6 = objc_allocWithZone(NSString);
    v7 = MFLookupLocalizedString(@"MSG_SERVER_ERROR", @"%@\n\nThe server error encountered was: %@", @"Delayed");
    uint64_t v8 = objc_msgSend(v6, "initWithFormat:", v7, v9, v5);

    id v9 = (id)v8;
  }
  [(MFError *)self setLocalizedDescription:v9];
}

- (void).cxx_destruct
{
}

+ (void)errorWithDomain:(os_log_t)log code:localizedDescription:title:userInfo:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Created error: %{public}@", buf, 0xCu);
}

@end
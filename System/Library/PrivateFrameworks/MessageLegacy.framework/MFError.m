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
- (void)dealloc;
- (void)setLocalizedDescription:(id)a3;
- (void)setMoreInfo:(id)a3;
- (void)setShortDescription:(id)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)useGenericDescription:(id)a3;
@end

@implementation MFError

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5
{
  return (MFError *)[a1 errorWithDomain:a3 code:a4 localizedDescription:a5 title:0 userInfo:0];
}

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5 title:(id)a6 userInfo:(id)a7
{
  if (!a3) {
    return 0;
  }
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if (a7) {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)a7);
    }
    else {
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    v15 = MutableCopy;
    if (a5) {
      CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F28568], a5);
    }
    if (a6) {
      CFDictionarySetValue(v15, @"_MFShortDescription", a6);
    }
    v13 = (MFError *)[a1 errorWithDomain:a3 code:a4 localizedDescription:0 title:0 userInfo:v15];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"MFNoErrorLog") & 1) == 0)
    {
      v16 = MFLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](v13, v16);
      }
    }

    return v13;
  }
  return (MFError *)objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

- (MFError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  if (initWithDomain_code_userInfo__onceToken != -1) {
    dispatch_once(&initWithDomain_code_userInfo__onceToken, &__block_literal_global_13);
  }
  v10.receiver = self;
  v10.super_class = (Class)MFError;
  return [(MFError *)&v10 initWithDomain:a3 code:a4 userInfo:a5];
}

uint64_t __40__MFError_initWithDomain_code_userInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "ef_setDecoder:forDomain:", &__block_literal_global_16, @"MFMessageErrorDomain");
}

__CFString *__40__MFError_initWithDomain_code_userInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 - 1028) >= 0x20) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown Error Code %d", a2);
  }
  else {
    return off_1E6867350[(int)a2 - 1028];
  }
}

+ (MFError)errorWithException:(id)a3
{
  uint64_t v4 = [a3 reason];
  return (MFError *)[a1 errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:v4];
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
}

- (id)userInfo
{
  v7.receiver = self;
  v7.super_class = (Class)MFError;
  id v3 = [(MFError *)&v7 userInfo];
  moreUserInfo = self->_moreUserInfo;
  if (moreUserInfo)
  {
    if (v3)
    {
      id v5 = (id)[(NSMutableDictionary *)moreUserInfo mutableCopyWithZone:0];
      [v5 addEntriesFromDictionary:v3];
      return v5;
    }
    else
    {
      return (id)[(NSMutableDictionary *)moreUserInfo copyWithZone:0];
    }
  }
  return v3;
}

- (id)localizedDescription
{
  id result = (id)[(NSMutableDictionary *)self->_moreUserInfo objectForKey:*MEMORY[0x1E4F28568]];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return [(MFError *)&v4 localizedDescription];
  }
  return result;
}

- (id)recoveryAttempter
{
  id v2 = [(MFError *)self userInfo];
  id v3 = (NSString *)(id)[v2 objectForKey:*MEMORY[0x1E4F288B8]];
  if (!v3)
  {
    id v3 = (NSString *)[v2 objectForKey:@"RecoveryAttemptorClassName"];
    if (v3) {
      id v3 = (NSString *)objc_alloc_init(NSClassFromString(v3));
    }
  }
  return v3;
}

- (id)mf_moreInfo
{
  id result = (id)[(NSMutableDictionary *)self->_moreUserInfo objectForKey:@"_MFMoreInfo"];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return [(NSError *)&v4 mf_moreInfo];
  }
  return result;
}

- (id)mf_shortDescription
{
  id result = (id)[(NSMutableDictionary *)self->_moreUserInfo objectForKey:@"_MFShortDescription"];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return [(NSError *)&v4 mf_shortDescription];
  }
  return result;
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
  id v4 = [(MFError *)self localizedDescription];
  if (v4 && (id v5 = v4, ([v4 isEqualToString:&stru_1F265CF90] & 1) == 0))
  {
    id v7 = (id)[objc_allocWithZone(NSString) initWithFormat:MFLookupLocalizedString(@"MSG_SERVER_ERROR", @"%@\n\nThe server error encountered was: %@", @"Delayed", a3, v5];
  }
  else
  {
    id v6 = a3;
    id v7 = a3;
  }
  id v9 = v7;
  [(MFError *)self setLocalizedDescription:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFError;
  [(MFError *)&v3 dealloc];
}

+ (void)errorWithDomain:(void *)a1 code:(NSObject *)a2 localizedDescription:title:userInfo:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = objc_msgSend(a1, "ef_publicDescription");
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "Created error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
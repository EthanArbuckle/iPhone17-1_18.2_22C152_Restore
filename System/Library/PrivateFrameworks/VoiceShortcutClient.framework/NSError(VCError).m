@interface NSError(VCError)
+ (id)_vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:;
+ (id)vc_partialPersistenceErrorWithPartialErrors:()VCError;
+ (id)vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:;
+ (id)vc_voiceShortcutErrorWithCode:()VCError reason:;
+ (id)vc_voiceShortcutErrorWithCode:()VCError underlyingError:reason:;
+ (uint64_t)vc_persistenceErrorWithUnderlyingError:()VCError;
+ (uint64_t)vc_voiceShortcutErrorWithCode:()VCError underlyingError:;
- (BOOL)vc_isFileAlreadyExists;
- (BOOL)vc_isFileNotFound;
@end

@implementation NSError(VCError)

- (BOOL)vc_isFileAlreadyExists
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  BOOL result = 1;
  if (!v3 || [a1 code] != 516)
  {
    v4 = [a1 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F28798]];

    if (!v5 || [a1 code] != 17) {
      return 0;
    }
  }
  return result;
}

- (BOOL)vc_isFileNotFound
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  BOOL result = 1;
  if (!v3 || [a1 code] != 260 && objc_msgSend(a1, "code") != 4)
  {
    v4 = [a1 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F28798]];

    if (!v5 || [a1 code] != 2) {
      return 0;
    }
  }
  return result;
}

+ (uint64_t)vc_voiceShortcutErrorWithCode:()VCError underlyingError:
{
  return objc_msgSend(a1, "vc_voiceShortcutErrorWithCode:underlyingError:reason:", a3, a4, 0);
}

+ (id)vc_partialPersistenceErrorWithPartialErrors:()VCError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = @"VCPartialErrorsByItemIDKey";
    v9[0] = v3;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    int v5 = 0;
  }
  v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCVoiceShortcutsErrorDomain" code:1006 userInfo:v5];

  return v6;
}

+ (uint64_t)vc_persistenceErrorWithUnderlyingError:()VCError
{
  return objc_msgSend(a1, "vc_voiceShortcutErrorWithCode:underlyingError:", 1004, a3);
}

+ (id)_vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:
{
  id v7 = a4;
  id v8 = a5;
  if (v7) {
    id v9 = (id)[v7 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v10 = v9;
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCVoiceShortcutsErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError extraUserInfo:reason:
{
  id v12 = a4;
  if (a5)
  {
    v13 = (objc_class *)NSString;
    id v14 = a5;
    a5 = (void *)[[v13 alloc] initWithFormat:v14 arguments:&a9];
  }
  v15 = objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, v12, a5);

  return v15;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError reason:
{
  if (a4)
  {
    v11 = (objc_class *)NSString;
    id v12 = a4;
    v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];
  }
  else
  {
    v13 = 0;
  }
  id v14 = objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, 0, v13);

  return v14;
}

+ (id)vc_voiceShortcutErrorWithCode:()VCError underlyingError:reason:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  v18 = &a9;
  if (v13)
  {
    id v14 = (void *)[[NSString alloc] initWithFormat:v13 arguments:&a9];
    if (v12)
    {
LABEL_3:
      uint64_t v19 = *MEMORY[0x1E4F28A50];
      v20[0] = v12;
      v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, &a9);
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  v15 = 0;
LABEL_6:
  v16 = objc_msgSend(a1, "_vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", a3, v15, v14, v18);

  return v16;
}

@end
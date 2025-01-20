@interface NSError(MNExtras)
+ (id)_navigation_errorWithCode:()MNExtras debugDescription:underlyingError:;
+ (id)_navigation_errorWithCode:()MNExtras userInfo:;
+ (uint64_t)_navigation_errorWithCode:()MNExtras;
+ (uint64_t)_navigation_errorWithCode:()MNExtras debugDescription:;
- (__CFString)_navigation_errorCodeAsString;
@end

@implementation NSError(MNExtras)

+ (uint64_t)_navigation_errorWithCode:()MNExtras
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)_navigation_errorWithCode:()MNExtras debugDescription:
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", a3, a4, 0);
}

+ (id)_navigation_errorWithCode:()MNExtras debugDescription:underlyingError:
{
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (id)_navigation_errorWithCode:()MNExtras userInfo:
{
  int v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNErrorDomain" code:a3 userInfo:a4];
  v6 = MNGetErrorsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend(v5, "_navigation_errorCodeAsString");
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Navigation service error: %@ (%d)", (uint8_t *)&v9, 0x12u);
  }
  return v5;
}

- (__CFString)_navigation_errorCodeAsString
{
  unint64_t v1 = [a1 code];
  if (v1 > 0x12) {
    return @"MNErrorCode_MissingEntitlement";
  }
  else {
    return off_1E60F7288[v1];
  }
}

@end
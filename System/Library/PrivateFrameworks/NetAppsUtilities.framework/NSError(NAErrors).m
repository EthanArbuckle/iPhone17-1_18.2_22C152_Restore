@interface NSError(NAErrors)
+ (uint64_t)na_cancelledError;
+ (uint64_t)na_errorWithCode:()NAErrors;
+ (uint64_t)na_genericError;
+ (uint64_t)na_timeoutError;
- (BOOL)na_isCancelledError;
- (BOOL)na_isTimeoutError;
@end

@implementation NSError(NAErrors)

- (BOOL)na_isCancelledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 3072;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)na_errorWithCode:()NAErrors
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"NAErrorDomain" code:a3 userInfo:0];
}

+ (uint64_t)na_timeoutError
{
  return objc_msgSend(a1, "na_errorWithCode:", 1);
}

+ (uint64_t)na_cancelledError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

+ (uint64_t)na_genericError
{
  return objc_msgSend(a1, "na_errorWithCode:", 330669);
}

- (BOOL)na_isTimeoutError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"NAErrorDomain"]) {
    BOOL v3 = [a1 code] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end
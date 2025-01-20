@interface NSError(TSUIO)
+ (id)tsu_fileReadCorruptedFileErrorWithUserInfo:()TSUIO;
+ (id)tsu_fileReadPOSIXErrorWithNumber:()TSUIO userInfo:;
+ (id)tsu_fileReadUnknownErrorWithUserInfo:()TSUIO;
+ (id)tsu_fileWritePOSIXErrorWithNumber:()TSUIO userInfo:;
+ (id)tsu_fileWriteUnknownErrorWithUserInfo:()TSUIO;
+ (id)tsu_userInfoWithErrorType:()TSUIO userInfo:;
- (uint64_t)tsu_isCorruptedError;
- (uint64_t)tsu_isReadError;
- (uint64_t)tsu_isWriteError;
@end

@implementation NSError(TSUIO)

+ (id)tsu_userInfoWithErrorType:()TSUIO userInfo:
{
  id v5 = a4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  v7 = v6;
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"TSUIOErrorType"];

  return v7;
}

+ (id)tsu_fileReadUnknownErrorWithUserInfo:()TSUIO
{
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  id v5 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  v6 = [v3 errorWithDomain:v4 code:256 userInfo:v5];

  return v6;
}

+ (id)tsu_fileReadCorruptedFileErrorWithUserInfo:()TSUIO
{
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  id v5 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  v6 = [v3 errorWithDomain:v4 code:259 userInfo:v5];

  return v6;
}

+ (id)tsu_fileReadPOSIXErrorWithNumber:()TSUIO userInfo:
{
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08438];
  uint64_t v5 = a3;
  v6 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1);
  v7 = [v3 errorWithDomain:v4 code:v5 userInfo:v6];

  return v7;
}

+ (id)tsu_fileWriteUnknownErrorWithUserInfo:()TSUIO
{
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  uint64_t v5 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, a3);
  v6 = [v3 errorWithDomain:v4 code:512 userInfo:v5];

  return v6;
}

+ (id)tsu_fileWritePOSIXErrorWithNumber:()TSUIO userInfo:
{
  v6 = (objc_class *)MEMORY[0x263F087E8];
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v9 = *MEMORY[0x263F08438];
  v10 = objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, v7);

  v11 = (void *)[v8 initWithDomain:v9 code:a3 userInfo:v10];
  return v11;
}

- (uint64_t)tsu_isReadError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_27);
}

- (uint64_t)tsu_isCorruptedError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_6_1);
}

- (uint64_t)tsu_isWriteError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_8_1);
}

@end
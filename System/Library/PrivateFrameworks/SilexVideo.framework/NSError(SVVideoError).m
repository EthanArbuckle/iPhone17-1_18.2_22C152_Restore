@interface NSError(SVVideoError)
+ (id)videoErrorWithUnderlyingError:()SVVideoError;
+ (uint64_t)errorCodeForUnderlyingErrorDomain:()SVVideoError;
+ (uint64_t)videoErrorWithErrorCode:()SVVideoError;
@end

@implementation NSError(SVVideoError)

+ (id)videoErrorWithUnderlyingError:()SVVideoError
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 domain];
  uint64_t v6 = [a1 errorCodeForUnderlyingErrorDomain:v5];

  if (v4)
  {
    id v10 = v4;
    v11[0] = *MEMORY[0x263F08608];
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA78];
  }
  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SVVideoErrorDomain" code:v6 userInfo:v7];

  return v8;
}

+ (uint64_t)videoErrorWithErrorCode:()SVVideoError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"SVVideoErrorDomain" code:a3 userInfo:MEMORY[0x263EFFA78]];
}

+ (uint64_t)errorCodeForUnderlyingErrorDomain:()SVVideoError
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EF98B0]])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

@end
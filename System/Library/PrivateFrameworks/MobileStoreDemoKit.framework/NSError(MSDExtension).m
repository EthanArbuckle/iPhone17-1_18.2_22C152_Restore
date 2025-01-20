@interface NSError(MSDExtension)
+ (id)errorDomainMSDWithCode:()MSDExtension message:;
+ (id)errorDomainMSDWithCode:()MSDExtension message:reason:;
+ (id)masterServerErrorRetryAfter:()MSDExtension;
+ (id)masterServerErrorWithCode:()MSDExtension mesage:reason:;
- (uint64_t)initWithDomainMSDCode:()MSDExtension message:;
- (uint64_t)initWithDomainMSDCode:()MSDExtension message:reason:;
@end

@implementation NSError(MSDExtension)

+ (id)errorDomainMSDWithCode:()MSDExtension message:
{
  v5 = (objc_class *)MEMORY[0x263F087E8];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithDomainMSDCode:a3 message:v6];

  return v7;
}

+ (id)errorDomainMSDWithCode:()MSDExtension message:reason:
{
  v7 = (objc_class *)MEMORY[0x263F087E8];
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[[v7 alloc] initWithDomainMSDCode:a3 message:v9 reason:v8];

  return v10;
}

+ (id)masterServerErrorWithCode:()MSDExtension mesage:reason:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:*MEMORY[0x263F08320]];
  }
  if (v8) {
    [v10 setObject:v8 forKey:*MEMORY[0x263F08338]];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MSDMasterServerErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (id)masterServerErrorRetryAfter:()MSDExtension
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionaryWithCapacity:0];
  [v5 setObject:v4 forKey:@"RetryAfter"];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MSDMasterServerErrorDomain" code:202 userInfo:v5];
  return v6;
}

- (uint64_t)initWithDomainMSDCode:()MSDExtension message:
{
  id v6 = [NSDictionary dictionaryWithObject:a4 forKey:*MEMORY[0x263F08320]];
  uint64_t v7 = [a1 initWithDomain:@"MSDDemodErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (uint64_t)initWithDomainMSDCode:()MSDExtension message:reason:
{
  uint64_t v7 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x263F08320], a5, *MEMORY[0x263F08338], 0);
  uint64_t v8 = [a1 initWithDomain:@"MSDDemodErrorDomain" code:a3 userInfo:v7];

  return v8;
}

@end
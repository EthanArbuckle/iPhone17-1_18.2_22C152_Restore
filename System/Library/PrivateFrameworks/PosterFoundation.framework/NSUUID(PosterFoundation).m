@interface NSUUID(PosterFoundation)
+ (__CFString)pf_nonnullUUIDStringOrSentinel:()PosterFoundation;
+ (id)pf_UUIDFromArbitraryString:()PosterFoundation;
+ (id)pf_defaultInstanceIdentifier;
+ (id)pf_invalidInstanceIdentifier;
@end

@implementation NSUUID(PosterFoundation)

+ (id)pf_invalidInstanceIdentifier
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  return v0;
}

+ (id)pf_defaultInstanceIdentifier
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  return v0;
}

+ (id)pf_UUIDFromArbitraryString:()PosterFoundation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  v5 = objc_opt_new();
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  v8 = NSString;
  v9 = objc_msgSend(v5, "substringWithRange:", 0, 8);
  v10 = objc_msgSend(v5, "substringWithRange:", 8, 4);
  v11 = objc_msgSend(v5, "substringWithRange:", 12, 4);
  v12 = objc_msgSend(v5, "substringWithRange:", 16, 4);
  v13 = objc_msgSend(v5, "substringWithRange:", 20, 12);
  v14 = [v8 stringWithFormat:@"%@-%@-%@-%@-%@", v9, v10, v11, v12, v13];
  v15 = (void *)[v7 initWithUUIDString:v14];

  return v15;
}

+ (__CFString)pf_nonnullUUIDStringOrSentinel:()PosterFoundation
{
  v3 = [a3 UUIDString];
  CC_LONG v4 = v3;
  if (!v3) {
    v3 = @"(Null UUID)";
  }
  v5 = v3;

  return v5;
}

@end
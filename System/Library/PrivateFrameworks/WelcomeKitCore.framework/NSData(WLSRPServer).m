@interface NSData(WLSRPServer)
+ (id)wl_hmacSHA256DataForData:()WLSRPServer key:;
@end

@implementation NSData(WLSRPServer)

+ (id)wl_hmacSHA256DataForData:()WLSRPServer key:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = (const void *)[v5 bytes];
  size_t v8 = [v5 length];

  id v9 = v6;
  v10 = (const void *)[v9 bytes];
  size_t v11 = [v9 length];

  CCHmac(2u, v7, v8, v10, v11, macOut);
  v12 = [MEMORY[0x263EFF8F8] dataWithBytes:macOut length:32];
  return v12;
}

@end
@interface NSString(SHA1Base62)
- (id)mt_SHA1Base62String;
@end

@implementation NSString(SHA1Base62)

- (id)mt_SHA1Base62String
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:md];
  v3 = objc_msgSend(v2, "mt_base62String");

  return v3;
}

@end
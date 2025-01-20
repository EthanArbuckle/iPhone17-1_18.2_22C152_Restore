@interface NSData(sha256)
- (id)sha256;
@end

@implementation NSData(sha256)

- (id)sha256
{
  id v1 = a1;
  if ([v1 bytes] && objc_msgSend(v1, "length"))
  {
    v2 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    id v3 = v1;
    v4 = (const void *)[v3 bytes];
    CC_LONG v5 = [v3 length];
    id v6 = v2;
    CC_SHA256(v4, v5, (unsigned __int8 *)[v6 mutableBytes]);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

@end
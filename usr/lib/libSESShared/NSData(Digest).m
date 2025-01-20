@interface NSData(Digest)
- (id)ses_sha1;
- (id)ses_sha256;
- (id)ses_sha384;
@end

@implementation NSData(Digest)

- (id)ses_sha1
{
  v2 = [MEMORY[0x263EFF990] dataWithLength:20];
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  LODWORD(v3) = [v3 length];
  id v5 = v2;
  CC_SHA1(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);

  return v5;
}

- (id)ses_sha256
{
  v2 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  LODWORD(v3) = [v3 length];
  id v5 = v2;
  CC_SHA256(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);

  return v5;
}

- (id)ses_sha384
{
  v2 = [MEMORY[0x263EFF990] dataWithLength:48];
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  LODWORD(v3) = [v3 length];
  id v5 = v2;
  CC_SHA384(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);

  return v5;
}

@end
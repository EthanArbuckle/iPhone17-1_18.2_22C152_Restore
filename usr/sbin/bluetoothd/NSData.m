@interface NSData
- (id)sha256;
@end

@implementation NSData

- (id)sha256
{
  memset(v5, 0, sizeof(v5));
  v2 = self;
  v3 = CC_SHA256([(NSData *)v2 bytes], (CC_LONG)[(NSData *)v2 length], (unsigned __int8 *)v5);
  if (v3)
  {
    v3 = +[NSData dataWithBytes:v5 length:32];
  }

  return v3;
}

@end
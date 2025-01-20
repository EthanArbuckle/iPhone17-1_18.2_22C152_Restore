@interface NSData(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation NSData(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v5 = a3;
  [v5 addString:@"NSData<"];
  id v4 = a1;
  objc_msgSend(v5, "addBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  [v5 addString:@">"];
}

@end
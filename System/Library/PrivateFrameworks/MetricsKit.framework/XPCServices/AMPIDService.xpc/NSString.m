@interface NSString
- (id)mt_SHA1Base62String;
@end

@implementation NSString

- (id)mt_SHA1Base62String
{
  id v2 = [(NSString *)self dataUsingEncoding:4];
  CC_SHA1([v2 bytes], (CC_LONG)objc_msgSend(v2, "length"), md);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:md];
  v4 = objc_msgSend(v3, "mt_base62String");

  return v4;
}

@end
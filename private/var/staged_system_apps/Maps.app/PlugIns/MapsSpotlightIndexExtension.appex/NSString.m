@interface NSString
- (NSString)_maps_sha1Hash;
@end

@implementation NSString

- (NSString)_maps_sha1Hash
{
  id v2 = [(NSString *)self dataUsingEncoding:4];
  CC_SHA1([v2 bytes], (CC_LONG)[v2 length], md);
  id v3 = objc_alloc_init((Class)NSMutableString);
  for (uint64_t i = 0; i != 20; ++i)
    [v3 appendFormat:@"%02x", md[i]];

  return (NSString *)v3;
}

@end
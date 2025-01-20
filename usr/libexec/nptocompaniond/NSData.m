@interface NSData
- (id)npto_uuid;
@end

@implementation NSData

- (id)npto_uuid
{
  if ((id)[(NSData *)self length] == (id)16) {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:-[NSData bytes](self, "bytes")];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end
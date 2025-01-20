@interface NSDate(SSXPCCoding)
- (id)initWithXPCEncoding:()SSXPCCoding;
@end

@implementation NSDate(SSXPCCoding)

- (id)initWithXPCEncoding:()SSXPCCoding
{
  uint64_t v5 = objc_opt_class();
  id NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v5);

  return NSSecureCodingObjectForXPCObject;
}

@end
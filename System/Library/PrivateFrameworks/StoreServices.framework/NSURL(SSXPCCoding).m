@interface NSURL(SSXPCCoding)
- (id)initWithXPCEncoding:()SSXPCCoding;
@end

@implementation NSURL(SSXPCCoding)

- (id)initWithXPCEncoding:()SSXPCCoding
{
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v5 = MEMORY[0x1A62689E0](a3);
  if (v5 == MEMORY[0x1E4F145F0])
  {
    v9 = SSXPCCreateCFObjectFromXPCObject(a3);
LABEL_7:
    v10 = v9;
    if (v9)
    {
      id NSSecureCodingObjectForXPCObject = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v9];

      goto LABEL_10;
    }
LABEL_9:
    id NSSecureCodingObjectForXPCObject = 0;
    goto LABEL_10;
  }
  if (v5 != MEMORY[0x1E4F14580]) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_opt_class();
  id NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v6);
  if (!NSSecureCodingObjectForXPCObject)
  {
    uint64_t v8 = objc_opt_class();
    v9 = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v8);
    goto LABEL_7;
  }
LABEL_10:

  return NSSecureCodingObjectForXPCObject;
}

@end
@interface AVContentKeyRequest(ICAdditions)
- (id)ic_description;
@end

@implementation AVContentKeyRequest(ICAdditions)

- (id)ic_description
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 identifier];
  v5 = [v2 stringWithFormat:@"<%@ %p (%@, status:%d, persistable:%d)>", v3, a1, v4, objc_msgSend(a1, "status"), objc_msgSend(a1, "canProvidePersistableContentKey")];

  return v5;
}

@end
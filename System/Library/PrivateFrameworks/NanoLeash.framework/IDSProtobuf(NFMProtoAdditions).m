@interface IDSProtobuf(NFMProtoAdditions)
- (id)nfmDescription;
@end

@implementation IDSProtobuf(NFMProtoAdditions)

- (id)nfmDescription
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [a1 type];
  unsigned int v5 = [a1 isResponse];
  v6 = [a1 data];
  v7 = [v2 stringWithFormat:@"%@, <%p> type %d isResponse %d context %@ length %lu", v3, a1, v4, v5, a1, objc_msgSend(v6, "length")];

  return v7;
}

@end
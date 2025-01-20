@interface _SFPBURL(SearchFoundationTypeNaming)
- (id)_siriui_protobufTypeName;
@end

@implementation _SFPBURL(SearchFoundationTypeNaming)

- (id)_siriui_protobufTypeName
{
  v0 = NSString;
  v1 = (objc_class *)objc_opt_class();
  v2 = NSStringFromClass(v1);
  v3 = [v2 substringFromIndex:objc_msgSend(@"_SFPB", "length")];
  v4 = [v0 stringWithFormat:@"searchfoundation.%@", v3];

  return v4;
}

@end
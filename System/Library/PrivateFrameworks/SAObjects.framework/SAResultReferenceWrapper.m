@interface SAResultReferenceWrapper
+ (id)resultReferenceWrapper;
- (SAResultObjectReference)resultReference;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResultReference:(id)a3;
@end

@implementation SAResultReferenceWrapper

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ResultReferenceWrapper";
}

+ (id)resultReferenceWrapper
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAResultObjectReference)resultReference
{
  return (SAResultObjectReference *)AceObjectAceObjectForProperty(self, @"resultReference");
}

- (void)setResultReference:(id)a3
{
}

@end
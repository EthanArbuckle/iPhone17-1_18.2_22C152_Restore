@interface SAStructuredDictationAddressResult
+ (id)structuredDictationAddressResult;
- (NSData)forwardGeoProtobuf;
- (NSString)addressLabel;
- (NSString)contactName;
- (NSURL)contactId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddressLabel:(id)a3;
- (void)setContactId:(id)a3;
- (void)setContactName:(id)a3;
- (void)setForwardGeoProtobuf:(id)a3;
@end

@implementation SAStructuredDictationAddressResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StructuredDictationAddressResult";
}

+ (id)structuredDictationAddressResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)addressLabel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"addressLabel"];
}

- (void)setAddressLabel:(id)a3
{
}

- (NSURL)contactId
{
  return (NSURL *)AceObjectURLForProperty(self, @"contactId");
}

- (void)setContactId:(id)a3
{
}

- (NSString)contactName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contactName"];
}

- (void)setContactName:(id)a3
{
}

- (NSData)forwardGeoProtobuf
{
  return (NSData *)[(AceObject *)self propertyForKey:@"forwardGeoProtobuf"];
}

- (void)setForwardGeoProtobuf:(id)a3
{
}

@end
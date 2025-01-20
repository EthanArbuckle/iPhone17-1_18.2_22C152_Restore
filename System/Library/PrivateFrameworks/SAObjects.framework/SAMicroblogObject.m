@interface SAMicroblogObject
+ (id)object;
- (NSArray)recipients;
- (NSDate)dateSent;
- (NSDictionary)hashtagAlternatives;
- (NSDictionary)socialProfileReferences;
- (NSNumber)outgoing;
- (NSNumber)useLocation;
- (NSString)content;
- (NSString)serviceType;
- (NSURL)attachment;
- (NSURL)refereceId;
- (SALocation)location;
- (SAPersonAttribute)sender;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttachment:(id)a3;
- (void)setContent:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setHashtagAlternatives:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRefereceId:(id)a3;
- (void)setSender:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSocialProfileReferences:(id)a3;
- (void)setUseLocation:(id)a3;
@end

@implementation SAMicroblogObject

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)attachment
{
  return (NSURL *)AceObjectURLForProperty(self, @"attachment");
}

- (void)setAttachment:(id)a3
{
}

- (NSString)content
{
  return (NSString *)[(AceObject *)self propertyForKey:@"content"];
}

- (void)setContent:(id)a3
{
}

- (NSDate)dateSent
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateSent"];
}

- (void)setDateSent:(id)a3
{
}

- (NSDictionary)hashtagAlternatives
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"hashtagAlternatives"];
}

- (void)setHashtagAlternatives:(id)a3
{
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSNumber)outgoing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"outgoing"];
}

- (void)setOutgoing:(id)a3
{
}

- (NSArray)recipients
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recipients", v3);
}

- (void)setRecipients:(id)a3
{
}

- (NSURL)refereceId
{
  return (NSURL *)AceObjectURLForProperty(self, @"refereceId");
}

- (void)setRefereceId:(id)a3
{
}

- (SAPersonAttribute)sender
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"sender");
}

- (void)setSender:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceType"];
}

- (void)setServiceType:(id)a3
{
}

- (NSDictionary)socialProfileReferences
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"socialProfileReferences"];
}

- (void)setSocialProfileReferences:(id)a3
{
}

- (NSNumber)useLocation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"useLocation"];
}

- (void)setUseLocation:(id)a3
{
}

@end
@interface SAEmailEmail
+ (id)email;
- (NSArray)attachments;
- (NSArray)receivingAddresses;
- (NSArray)recipientsBcc;
- (NSArray)recipientsCc;
- (NSArray)recipientsTo;
- (NSDate)dateSent;
- (NSNumber)outgoing;
- (NSString)message;
- (NSString)messagePreview;
- (NSString)subject;
- (NSString)timeZoneId;
- (NSString)type;
- (NSURL)referenceId;
- (SAPersonAttribute)fromEmail;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttachments:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setFromEmail:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessagePreview:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setReceivingAddresses:(id)a3;
- (void)setRecipientsBcc:(id)a3;
- (void)setRecipientsCc:(id)a3;
- (void)setRecipientsTo:(id)a3;
- (void)setReferenceId:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SAEmailEmail

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
}

- (id)encodedClassName
{
  return @"Email";
}

+ (id)email
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attachments
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attachments", v3);
}

- (void)setAttachments:(id)a3
{
}

- (NSDate)dateSent
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateSent"];
}

- (void)setDateSent:(id)a3
{
}

- (SAPersonAttribute)fromEmail
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"fromEmail");
}

- (void)setFromEmail:(id)a3
{
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
{
}

- (NSString)messagePreview
{
  return (NSString *)[(AceObject *)self propertyForKey:@"messagePreview"];
}

- (void)setMessagePreview:(id)a3
{
}

- (NSNumber)outgoing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"outgoing"];
}

- (void)setOutgoing:(id)a3
{
}

- (NSArray)receivingAddresses
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"receivingAddresses"];
}

- (void)setReceivingAddresses:(id)a3
{
}

- (NSArray)recipientsBcc
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recipientsBcc", v3);
}

- (void)setRecipientsBcc:(id)a3
{
}

- (NSArray)recipientsCc
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recipientsCc", v3);
}

- (void)setRecipientsCc:(id)a3
{
}

- (NSArray)recipientsTo
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recipientsTo", v3);
}

- (void)setRecipientsTo:(id)a3
{
}

- (NSURL)referenceId
{
  return (NSURL *)AceObjectURLForProperty(self, @"referenceId");
}

- (void)setReferenceId:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end
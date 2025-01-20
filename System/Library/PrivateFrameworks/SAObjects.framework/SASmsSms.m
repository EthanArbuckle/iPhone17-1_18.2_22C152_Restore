@interface SASmsSms
+ (id)sms;
- (BOOL)hasGroupName;
- (NSArray)attachments;
- (NSArray)msgRecipients;
- (NSArray)recipients;
- (NSDate)dateLastMessageReadInThread;
- (NSDate)dateReadingStarted;
- (NSDate)dateSent;
- (NSNumber)isAudioMessage;
- (NSNumber)outgoing;
- (NSString)chatIdentifier;
- (NSString)effect;
- (NSString)groupName;
- (NSString)groupNameId;
- (NSString)message;
- (NSString)messageType;
- (NSString)sender;
- (NSString)subject;
- (NSString)timezoneId;
- (NSURL)attachment;
- (SAAppInfo)appInfo;
- (SAPersonAttribute)msgSender;
- (SASmsSms)referencedMessage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppInfo:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setDateLastMessageReadInThread:(id)a3;
- (void)setDateReadingStarted:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setEffect:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNameId:(id)a3;
- (void)setHasGroupName:(BOOL)a3;
- (void)setIsAudioMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setMsgRecipients:(id)a3;
- (void)setMsgSender:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setReferencedMessage:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTimezoneId:(id)a3;
@end

@implementation SASmsSms

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"Sms";
}

+ (id)sms
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAppInfo)appInfo
{
  return (SAAppInfo *)AceObjectAceObjectForProperty(self, @"appInfo");
}

- (void)setAppInfo:(id)a3
{
}

- (NSURL)attachment
{
  return (NSURL *)AceObjectURLForProperty(self, @"attachment");
}

- (void)setAttachment:(id)a3
{
}

- (NSArray)attachments
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attachments", v3);
}

- (void)setAttachments:(id)a3
{
}

- (NSString)chatIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"chatIdentifier"];
}

- (void)setChatIdentifier:(id)a3
{
}

- (NSDate)dateLastMessageReadInThread
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateLastMessageReadInThread"];
}

- (void)setDateLastMessageReadInThread:(id)a3
{
}

- (NSDate)dateReadingStarted
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateReadingStarted"];
}

- (void)setDateReadingStarted:(id)a3
{
}

- (NSDate)dateSent
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateSent"];
}

- (void)setDateSent:(id)a3
{
}

- (NSString)effect
{
  return (NSString *)[(AceObject *)self propertyForKey:@"effect"];
}

- (void)setEffect:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupName"];
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupNameId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupNameId"];
}

- (void)setGroupNameId:(id)a3
{
}

- (BOOL)hasGroupName
{
  return AceObjectBoolForProperty(self, @"hasGroupName");
}

- (void)setHasGroupName:(BOOL)a3
{
}

- (NSNumber)isAudioMessage
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isAudioMessage"];
}

- (void)setIsAudioMessage:(id)a3
{
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
{
}

- (NSString)messageType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"messageType"];
}

- (void)setMessageType:(id)a3
{
}

- (NSArray)msgRecipients
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"msgRecipients", v3);
}

- (void)setMsgRecipients:(id)a3
{
}

- (SAPersonAttribute)msgSender
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"msgSender");
}

- (void)setMsgSender:(id)a3
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
  return (NSArray *)[(AceObject *)self propertyForKey:@"recipients"];
}

- (void)setRecipients:(id)a3
{
}

- (SASmsSms)referencedMessage
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, @"referencedMessage");
}

- (void)setReferencedMessage:(id)a3
{
}

- (NSString)sender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sender"];
}

- (void)setSender:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

- (NSString)timezoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timezoneId"];
}

- (void)setTimezoneId:(id)a3
{
}

@end
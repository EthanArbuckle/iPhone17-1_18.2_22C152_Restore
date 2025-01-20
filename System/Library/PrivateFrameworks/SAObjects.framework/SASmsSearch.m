@interface SASmsSearch
+ (id)search;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)recipients;
- (NSArray)senders;
- (NSDate)end;
- (NSDate)start;
- (NSNumber)outgoing;
- (NSNumber)unread;
- (NSString)message;
- (NSString)subject;
- (SASmsGroupName)smsGroup;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnd:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSenders:(id)a3;
- (void)setSmsGroup:(id)a3;
- (void)setStart:(id)a3;
- (void)setSubject:(id)a3;
- (void)setUnread:(id)a3;
@end

@implementation SASmsSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)end
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"end"];
}

- (void)setEnd:(id)a3
{
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
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

- (NSArray)senders
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"senders", v3);
}

- (void)setSenders:(id)a3
{
}

- (SASmsGroupName)smsGroup
{
  return (SASmsGroupName *)AceObjectAceObjectForProperty(self, @"smsGroup");
}

- (void)setSmsGroup:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"start"];
}

- (void)setStart:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

- (NSNumber)unread
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"unread"];
}

- (void)setUnread:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
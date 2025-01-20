@interface SAReminderSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSDate)dueAfter;
- (NSDate)dueBefore;
- (NSNumber)completionStatus;
- (NSString)listName;
- (NSString)subject;
- (NSString)timeZoneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCompletionStatus:(id)a3;
- (void)setDueAfter:(id)a3;
- (void)setDueBefore:(id)a3;
- (void)setListName:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTimeZoneId:(id)a3;
@end

@implementation SAReminderSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
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

- (NSNumber)completionStatus
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"completionStatus"];
}

- (void)setCompletionStatus:(id)a3
{
}

- (NSDate)dueAfter
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dueAfter"];
}

- (void)setDueAfter:(id)a3
{
}

- (NSDate)dueBefore
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dueBefore"];
}

- (void)setDueBefore:(id)a3
{
}

- (NSString)listName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"listName"];
}

- (void)setListName:(id)a3
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

- (BOOL)requiresResponse
{
  return 1;
}

@end
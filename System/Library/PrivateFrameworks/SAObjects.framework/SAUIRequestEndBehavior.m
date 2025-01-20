@interface SAUIRequestEndBehavior
- (BOOL)premptivelyResumeMedia;
- (NSNumber)minimumAutoDismissalTimeInMs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMinimumAutoDismissalTimeInMs:(id)a3;
- (void)setPremptivelyResumeMedia:(BOOL)a3;
@end

@implementation SAUIRequestEndBehavior

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"RequestEndBehavior";
}

- (NSNumber)minimumAutoDismissalTimeInMs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minimumAutoDismissalTimeInMs"];
}

- (void)setMinimumAutoDismissalTimeInMs:(id)a3
{
}

- (BOOL)premptivelyResumeMedia
{
  return AceObjectBoolForProperty(self, @"premptivelyResumeMedia");
}

- (void)setPremptivelyResumeMedia:(BOOL)a3
{
}

@end
@interface SACalendarDefaultSourceGetCompleted
+ (id)defaultSourceGetCompleted;
+ (id)defaultSourceGetCompletedWithAceCalendarSource:(id)a3;
- (BOOL)requiresResponse;
- (SACalendarDefaultSourceGetCompleted)initWithAceCalendarSource:(id)a3;
- (SACalendarSource)aceCalendarSource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceCalendarSource:(id)a3;
@end

@implementation SACalendarDefaultSourceGetCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"DefaultSourceGetCompleted";
}

+ (id)defaultSourceGetCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)defaultSourceGetCompletedWithAceCalendarSource:(id)a3
{
  id v3 = a3;
  v4 = [[SACalendarDefaultSourceGetCompleted alloc] initWithAceCalendarSource:v3];

  return v4;
}

- (SACalendarDefaultSourceGetCompleted)initWithAceCalendarSource:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SACalendarDefaultSourceGetCompleted *)v5 setAceCalendarSource:v4];
  }

  return v6;
}

- (SACalendarSource)aceCalendarSource
{
  return (SACalendarSource *)AceObjectAceObjectForProperty(self, @"aceCalendarSource");
}

- (void)setAceCalendarSource:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
@interface SACalendarEventSearchCompleted
+ (id)eventSearchCompleted;
+ (id)eventSearchCompletedWithResults:(id)a3;
- (BOOL)requiresResponse;
- (NSArray)results;
- (SACalendarEventSearchCompleted)initWithResults:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResults:(id)a3;
@end

@implementation SACalendarEventSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"EventSearchCompleted";
}

+ (id)eventSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)eventSearchCompletedWithResults:(id)a3
{
  id v3 = a3;
  v4 = [[SACalendarEventSearchCompleted alloc] initWithResults:v3];

  return v4;
}

- (SACalendarEventSearchCompleted)initWithResults:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SACalendarEventSearchCompleted *)v5 setResults:v4];
  }

  return v6;
}

- (NSArray)results
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"results", v3);
}

- (void)setResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
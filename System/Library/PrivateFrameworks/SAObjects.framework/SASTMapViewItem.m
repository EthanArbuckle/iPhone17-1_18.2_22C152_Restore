@interface SASTMapViewItem
+ (id)mapViewItem;
- (NSDate)extSessionGuidCreatedTimestamp;
- (NSNumber)zoomLevel;
- (NSString)extSessionGuid;
- (SALocation)location;
- (SASTTemplateAction)action;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setExtSessionGuid:(id)a3;
- (void)setExtSessionGuidCreatedTimestamp:(id)a3;
- (void)setLocation:(id)a3;
- (void)setZoomLevel:(id)a3;
@end

@implementation SASTMapViewItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"MapViewItem";
}

+ (id)mapViewItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (NSString)extSessionGuid
{
  return (NSString *)[(AceObject *)self propertyForKey:@"extSessionGuid"];
}

- (void)setExtSessionGuid:(id)a3
{
}

- (NSDate)extSessionGuidCreatedTimestamp
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"extSessionGuidCreatedTimestamp"];
}

- (void)setExtSessionGuidCreatedTimestamp:(id)a3
{
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSNumber)zoomLevel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"zoomLevel"];
}

- (void)setZoomLevel:(id)a3
{
}

@end
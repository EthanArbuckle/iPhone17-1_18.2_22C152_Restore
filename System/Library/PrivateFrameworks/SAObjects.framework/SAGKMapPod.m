@interface SAGKMapPod
+ (id)mapPod;
- (NSNumber)showButton;
- (NSNumber)zoomLevel;
- (SALocation)location;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocation:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setShowButton:(id)a3;
- (void)setZoomLevel:(id)a3;
@end

@implementation SAGKMapPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"MapPod";
}

+ (id)mapPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

- (NSNumber)showButton
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"showButton"];
}

- (void)setShowButton:(id)a3
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
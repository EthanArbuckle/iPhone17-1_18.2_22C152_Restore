@interface SALocalSearchAceNavigationEta
+ (id)aceNavigationEta;
- (SADistance)distanceEta;
- (SADuration)timeEta;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDistanceEta:(id)a3;
- (void)setTimeEta:(id)a3;
@end

@implementation SALocalSearchAceNavigationEta

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"AceNavigationEta";
}

+ (id)aceNavigationEta
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADistance)distanceEta
{
  return (SADistance *)AceObjectAceObjectForProperty(self, @"distanceEta");
}

- (void)setDistanceEta:(id)a3
{
}

- (SADuration)timeEta
{
  return (SADuration *)AceObjectAceObjectForProperty(self, @"timeEta");
}

- (void)setTimeEta:(id)a3
{
}

@end
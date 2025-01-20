@interface SAScreenActionActivateUIElement
+ (id)activateUIElement;
- (BOOL)requiresResponse;
- (NSString)elementId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setElementId:(id)a3;
@end

@implementation SAScreenActionActivateUIElement

- (id)groupIdentifier
{
  return @"com.apple.ace.onscreenaction";
}

- (id)encodedClassName
{
  return @"ActivateUIElement";
}

+ (id)activateUIElement
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)elementId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"elementId"];
}

- (void)setElementId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
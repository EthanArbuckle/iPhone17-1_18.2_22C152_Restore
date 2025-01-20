@interface SALCMShowModalView
+ (id)showModalView;
- (BOOL)requiresResponse;
- (SAAceView)view;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setView:(id)a3;
@end

@implementation SALCMShowModalView

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"ShowModalView";
}

+ (id)showModalView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAceView)view
{
  return (SAAceView *)AceObjectAceObjectForProperty(self, @"view");
}

- (void)setView:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
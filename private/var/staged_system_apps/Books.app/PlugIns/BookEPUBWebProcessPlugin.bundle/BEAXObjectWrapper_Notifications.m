@interface BEAXObjectWrapper_Notifications
+ (Class)baxBaseSafeCategoryClass;
+ (id)baxTargetClassName;
- (id)_accessibilityMakeScrollStatus;
- (id)_beaxParentWebPageObject;
@end

@implementation BEAXObjectWrapper_Notifications

+ (id)baxTargetClassName
{
  return @"WebAccessibilityObjectWrapper";
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityMakeScrollStatus
{
  v2 = [(BEAXObjectWrapper_Notifications *)self _beaxParentWebPageObject];
  v3 = [v2 _accessibilityScrollStatus];

  return v3;
}

- (id)_beaxParentWebPageObject
{
  id v2 = [(BEAXObjectWrapper_Notifications *)self accessibilityContainer];
  if (v2)
  {
    while (1)
    {
      NSClassFromString(@"WKAccessibilityWebPageObject");
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 accessibilityContainer];

      id v2 = (id)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

@end
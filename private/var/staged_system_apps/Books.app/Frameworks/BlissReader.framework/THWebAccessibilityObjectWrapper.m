@interface THWebAccessibilityObjectWrapper
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_thaxBookViewController;
- (id)accessibilityLanguage;
@end

@implementation THWebAccessibilityObjectWrapper

+ (id)tsaxTargetClassName
{
  return @"WebAccessibilityObjectWrapper";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_thaxBookViewController
{
  id v2 = [+[UIApplication sharedApplication] tsaxValueForKey:@"delegate"] tsaxValueForKey:@"bookController"];

  return [v2 tsaxValueForKey:@"existingViewController"];
}

- (id)accessibilityLanguage
{
  id v3 = [(THWebAccessibilityObjectWrapper *)self _thaxBookViewController];
  NSClassFromString(@"THBookViewController");
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(objc_msgSend(v3, "tsaxValueForKey:", @"bookDescription"), "tsaxValueForKey:", @"language");
    return +[NSLocale canonicalLanguageIdentifierFromString:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)THWebAccessibilityObjectWrapper;
    return [(THWebAccessibilityObjectWrapper *)&v6 accessibilityLanguage];
  }
}

@end
@interface __NSCFStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)appendString:(id)a3;
@end

@implementation __NSCFStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"__NSCFString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)appendString:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)__NSCFStringAccessibility;
  id v4 = a3;
  [(__NSCFStringAccessibility *)&v9 appendString:v4];
  v5 = objc_msgSend(v4, "_accessibilityAttributedLocalizedString", v9.receiver, v9.super_class);

  if (v5)
  {
    v6 = [(__NSCFStringAccessibility *)self _accessibilityAttributedLocalizedString];
    v7 = v6;
    if (v6)
    {
      [v6 appendAXAttributedString:v5];
    }
    else
    {
      v8 = (void *)[v5 copy];
      [(__NSCFStringAccessibility *)self _setAccessibilityAttributedLocalizedString:v8];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)__NSCFStringAccessibility;
  id v5 = -[__NSCFStringAccessibility copyWithZone:](&v10, sel_copyWithZone_);
  v6 = [(__NSCFStringAccessibility *)self _accessibilityAttributedLocalizedString];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 copyWithZone:a3];
    [v5 _setAccessibilityAttributedLocalizedString:v8];
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)__NSCFStringAccessibility;
  id v5 = -[__NSCFStringAccessibility mutableCopyWithZone:](&v10, sel_mutableCopyWithZone_);
  v6 = [(__NSCFStringAccessibility *)self _accessibilityAttributedLocalizedString];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 copyWithZone:a3];
    [v5 _setAccessibilityAttributedLocalizedString:v8];
  }
  return v5;
}

@end
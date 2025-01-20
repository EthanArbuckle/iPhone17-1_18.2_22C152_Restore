@interface NSConcreteAttributedStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (NSConcreteAttributedStringAccessibility)initWithAttributedString:(id)a3;
- (NSConcreteAttributedStringAccessibility)initWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)string;
@end

@implementation NSConcreteAttributedStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSConcreteAttributedString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSConcreteAttributedStringAccessibility)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = [(NSConcreteAttributedStringAccessibility *)&v9 initWithString:v4];
  if (v5)
  {
    v6 = [v4 _accessibilityAttributedLocalizedString];
    v7 = (void *)[v6 copy];

    [(NSConcreteAttributedStringAccessibility *)v5 _setAccessibilityAttributedLocalizedString:v7];
  }

  return v5;
}

- (NSConcreteAttributedStringAccessibility)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = [(NSConcreteAttributedStringAccessibility *)&v9 initWithAttributedString:v4];
  if (v5)
  {
    v6 = [v4 _accessibilityAttributedLocalizedString];
    v7 = (void *)[v6 copy];

    [(NSConcreteAttributedStringAccessibility *)v5 _setAccessibilityAttributedLocalizedString:v7];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSConcreteAttributedStringAccessibility;
  id v5 = -[NSConcreteAttributedStringAccessibility copyWithZone:](&v10, sel_copyWithZone_);
  v6 = [(NSConcreteAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
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
  v10.super_class = (Class)NSConcreteAttributedStringAccessibility;
  id v5 = -[NSConcreteAttributedStringAccessibility mutableCopyWithZone:](&v10, sel_mutableCopyWithZone_);
  v6 = [(NSConcreteAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)[v6 copyWithZone:a3];
    [v5 _setAccessibilityAttributedLocalizedString:v8];
  }
  return v5;
}

- (id)string
{
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v3 = [(NSConcreteAttributedStringAccessibility *)&v7 string];
  id v4 = [(NSConcreteAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
  id v5 = (void *)[v4 copy];

  if (v5) {
    [v3 _setAccessibilityAttributedLocalizedString:v5];
  }

  return v3;
}

@end
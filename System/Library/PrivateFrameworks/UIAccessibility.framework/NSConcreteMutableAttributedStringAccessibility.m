@interface NSConcreteMutableAttributedStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (NSConcreteMutableAttributedStringAccessibility)initWithAttributedString:(id)a3;
- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3;
- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3 attributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)string;
@end

@implementation NSConcreteMutableAttributedStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSConcreteMutableAttributedString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSConcreteMutableAttributedStringAccessibility)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v5 = [(NSConcreteMutableAttributedStringAccessibility *)&v9 initWithAttributedString:v4];
  if (v5)
  {
    v6 = [v4 _accessibilityAttributedLocalizedString];
    v7 = (void *)[v6 copy];

    [(NSConcreteMutableAttributedStringAccessibility *)v5 _setAccessibilityAttributedLocalizedString:v7];
  }

  return v5;
}

- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v5 = [(NSConcreteMutableAttributedStringAccessibility *)&v9 initWithString:v4];
  if (v5)
  {
    v6 = [v4 _accessibilityAttributedLocalizedString];
    v7 = (void *)[v6 copy];

    [(NSConcreteMutableAttributedStringAccessibility *)v5 _setAccessibilityAttributedLocalizedString:v7];
  }

  return v5;
}

- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v7 = [(NSConcreteMutableAttributedStringAccessibility *)&v11 initWithString:v6 attributes:a4];
  if (v7)
  {
    v8 = [v6 _accessibilityAttributedLocalizedString];
    objc_super v9 = (void *)[v8 copy];

    [(NSConcreteMutableAttributedStringAccessibility *)v7 _setAccessibilityAttributedLocalizedString:v9];
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  id v4 = [(NSConcreteMutableAttributedStringAccessibility *)&v8 mutableCopyWithZone:a3];
  if (v4)
  {
    v5 = [(NSConcreteMutableAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
    id v6 = (void *)[v5 copy];

    [v4 _setAccessibilityAttributedLocalizedString:v6];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  id v4 = [(NSConcreteMutableAttributedStringAccessibility *)&v8 copyWithZone:a3];
  if (v4)
  {
    v5 = [(NSConcreteMutableAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
    id v6 = (void *)[v5 copy];

    [v4 _setAccessibilityAttributedLocalizedString:v6];
  }
  return v4;
}

- (id)string
{
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v3 = [(NSConcreteMutableAttributedStringAccessibility *)&v7 string];
  id v4 = [(NSConcreteMutableAttributedStringAccessibility *)self _accessibilityAttributedLocalizedString];
  v5 = (void *)[v4 copy];

  if (v5) {
    [v3 _setAccessibilityAttributedLocalizedString:v5];
  }

  return v3;
}

@end
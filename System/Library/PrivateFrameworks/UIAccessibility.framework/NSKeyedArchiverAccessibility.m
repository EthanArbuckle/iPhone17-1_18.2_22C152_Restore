@interface NSKeyedArchiverAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)decodeObjectForKey:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation NSKeyedArchiverAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSKeyedArchiver";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NSKeyedArchiverAccessibility;
  id v7 = a3;
  [(NSKeyedArchiverAccessibility *)&v10 encodeObject:v7 forKey:v6];
  v8 = objc_msgSend(v7, "_accessibilityAttributedLocalizedString", v10.receiver, v10.super_class);

  if (v8)
  {
    v9 = [v6 stringByAppendingString:@"_delocalized"];
    [(NSKeyedArchiverAccessibility *)self encodeObject:v8 forKey:v9];
  }
}

- (id)decodeObjectForKey:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSKeyedArchiverAccessibility;
  id v4 = a3;
  v5 = [(NSKeyedArchiverAccessibility *)&v9 decodeObjectForKey:v4];
  id v6 = objc_msgSend(v4, "stringByAppendingString:", @"_delocalized", v9.receiver, v9.super_class);

  id v7 = [(NSKeyedArchiverAccessibility *)self decodeObjectForKey:v6];

  if (v7) {
    [v5 _setAccessibilityAttributedLocalizedString:v7];
  }

  return v5;
}

@end
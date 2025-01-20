@interface BKUIToolbarButtonAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation BKUIToolbarButtonAccessibility

+ (id)imaxTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(BKUIToolbarButtonAccessibility *)self imaxValueForKey:@"_info"];
  NSClassFromString(@"UISwappableImageView");
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 imaxValueForKey:@"_value"];
    v5 = [v4 imaxValueForKey:@"accessibilityIdentification"];
    if ([v5 isEqualToString:@"brightness-nav-glyph.png"])
    {
      v6 = sub_1000B86A8(@"brightness.button.hint");
      [(BKUIToolbarButtonAccessibility *)self setAccessibilityHint:v6];

      v7 = @"brightness.button";
LABEL_6:
      v8 = sub_1000B86A8(v7);

      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"ib_tb_icon_bookmark.png"])
    {
      v7 = @"bookmark.button";
      goto LABEL_6;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BKUIToolbarButtonAccessibility;
  v8 = [(BKUIToolbarButtonAccessibility *)&v10 accessibilityLabel];
LABEL_9:

  return v8;
}

@end
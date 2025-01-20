@interface UIFont
+ (id)rcs_dynamicMonospacedTitle0Font;
+ (id)rcs_monospacedSubheadlineFont;
+ (id)scaledMonospacedSystemFontOfSize:(double)a3;
+ (id)scaledSystemFontOfSize:(double)a3;
+ (id)scaledSystemFontOfSize:(double)a3 weight:(double)a4;
- (NSString)rc_textStyle;
@end

@implementation UIFont

+ (id)scaledMonospacedSystemFontOfSize:(double)a3
{
  v3 = +[UIFont monospacedDigitSystemFontOfSize:a3 weight:UIFontWeightRegular];
  v4 = +[UIFontMetrics defaultMetrics];
  v5 = [v4 scaledFontForFont:v3];

  return v5;
}

+ (id)scaledSystemFontOfSize:(double)a3 weight:(double)a4
{
  v4 = +[UIFont systemFontOfSize:a3 weight:a4];
  v5 = +[UIFontMetrics defaultMetrics];
  v6 = [v5 scaledFontForFont:v4];

  return v6;
}

+ (id)scaledSystemFontOfSize:(double)a3
{
  v3 = +[UIFont systemFontOfSize:a3];
  v4 = +[UIFontMetrics defaultMetrics];
  v5 = [v4 scaledFontForFont:v3];

  return v5;
}

+ (id)rcs_dynamicMonospacedTitle0Font
{
  v2 = +[UIScreen mainScreen];
  v3 = [v2 traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v5 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle compatibleWithTraitCollection:v5];
  }
  else
  {
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle];
  }
  v7 = sub_1000854BC(v6);

  return v7;
}

+ (id)rcs_monospacedSubheadlineFont
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v3 = sub_1000854BC(v2);

  return v3;
}

- (NSString)rc_textStyle
{
  v2 = [(UIFont *)self fontDescriptor];
  v3 = [v2 fontAttributes];
  v4 = [v3 objectForKeyedSubscript:UIFontDescriptorTextStyleAttribute];

  return (NSString *)v4;
}

@end
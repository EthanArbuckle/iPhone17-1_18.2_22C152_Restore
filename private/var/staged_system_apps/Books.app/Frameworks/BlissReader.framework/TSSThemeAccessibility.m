@interface TSSThemeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxOrderedShapeDescriptions;
- (NSArray)tsaxOrderedTableDescriptions;
- (NSArray)tsaxOrderedTableHelps;
- (NSArray)tsaxOrderedTextboxDescriptions;
@end

@implementation TSSThemeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSSTheme";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)tsaxOrderedShapeDescriptions
{
  result = (NSArray *)qword_573898;
  if (!qword_573898)
  {
    v3[0] = TSAccessibilityLocalizedString(@"Line");
    v3[1] = TSAccessibilityLocalizedString(@"LineArrow");
    v3[2] = TSAccessibilityLocalizedString(@"ConnectionLine");
    v3[3] = TSAccessibilityLocalizedString(@"Square");
    v3[4] = TSAccessibilityLocalizedString(@"RoundRect");
    v3[5] = TSAccessibilityLocalizedString(@"Circle");
    v3[6] = TSAccessibilityLocalizedString(@"Triangle");
    v3[7] = TSAccessibilityLocalizedString(@"Isosceles");
    v3[8] = TSAccessibilityLocalizedString(@"Arrow");
    v3[9] = TSAccessibilityLocalizedString(@"DoubleArrow");
    v3[10] = TSAccessibilityLocalizedString(@"Diamond");
    v3[11] = TSAccessibilityLocalizedString(@"RoundQuoteBubble");
    v3[12] = TSAccessibilityLocalizedString(@"BoxQuoteBubble");
    v3[13] = TSAccessibilityLocalizedString(@"Pentagon");
    v3[14] = TSAccessibilityLocalizedString(@"Star");
    result = +[NSArray arrayWithObjects:v3 count:15];
    qword_573898 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTableDescriptions
{
  result = (NSArray *)qword_5738A0;
  if (!qword_5738A0)
  {
    v3[0] = TSAccessibilityLocalizedString(@"table.headers");
    v3[1] = TSAccessibilityLocalizedString(@"table.basic");
    v3[2] = TSAccessibilityLocalizedString(@"table.plain");
    v3[3] = TSAccessibilityLocalizedString(@"table.sums");
    result = +[NSArray arrayWithObjects:v3 count:4];
    qword_5738A0 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTableHelps
{
  result = (NSArray *)qword_5738A8;
  if (!qword_5738A8)
  {
    v3[0] = TSAccessibilityLocalizedString(@"table.headers.help");
    v3[1] = TSAccessibilityLocalizedString(@"table.basic.help");
    v3[2] = TSAccessibilityLocalizedString(@"table.plain.help");
    v3[3] = TSAccessibilityLocalizedString(@"table.sums.help");
    result = +[NSArray arrayWithObjects:v3 count:4];
    qword_5738A8 = (uint64_t)result;
  }
  return result;
}

- (NSArray)tsaxOrderedTextboxDescriptions
{
  result = (NSArray *)qword_5738B0;
  if (!qword_5738B0)
  {
    v3[0] = TSAccessibilityLocalizedString(@"textbox.body");
    v3[1] = TSAccessibilityLocalizedString(@"textbox.title");
    v3[2] = TSAccessibilityLocalizedString(@"textbox.heading");
    v3[3] = TSAccessibilityLocalizedString(@"textbox.heading.alternate");
    void v3[4] = TSAccessibilityLocalizedString(@"textbox.caption");
    v3[5] = TSAccessibilityLocalizedString(@"textbox.list");
    result = +[NSArray arrayWithObjects:v3 count:6];
    qword_5738B0 = (uint64_t)result;
  }
  return result;
}

@end
@interface IMAccessibilityLabelAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation IMAccessibilityLabelAccessibility

+ (id)imaxTargetClassName
{
  return @"UILabel";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v14.receiver = self;
  v14.super_class = (Class)IMAccessibilityLabelAccessibility;
  v3 = [(IMAccessibilityLabelAccessibility *)&v14 accessibilityLabel];
  v4 = [(IMAccessibilityLabelAccessibility *)self imaxIdentification];
  unsigned int v5 = [v4 isEqualToString:@"LabelWithSeparatedChars"];

  if (v5)
  {
    id v6 = +[NSMutableString string];
    v7 = (char *)[v3 length];
    if ((uint64_t)v7 >= 1)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        unsigned int v10 = [v3 characterAtIndex:i];
        if (i)
        {
          unsigned int v11 = v10;
          if ([v3 characterAtIndex:i - 1] != 32 && v11 == 32) {
            continue;
          }
        }
        v12 = [v3 substringWithRange:i, 1];
        [v6 appendString:v12];
      }
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

@end
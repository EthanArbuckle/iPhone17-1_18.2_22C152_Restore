@interface UIFont
+ (BOOL)fr_accessibilityFontSizesEnabled;
+ (BOOL)fr_contentSizeCategoryIsGreaterThan:(id)a3;
+ (BOOL)fr_isDefaultContentSizeCategory;
+ (double)fr_inverselyScaledValueForValue:(double)a3;
+ (double)fr_inverselyScaledValueForValue:(double)a3 scalingRate:(double)a4;
+ (double)fr_notRoundedScaledValueForValue:(double)a3;
+ (double)fr_preferredHeightForString:(id)a3 baseFontSize:(double)a4 maxFontSize:(double)a5 textStyle:(id)a6 constrainedToWidth:(double)a7;
+ (double)fr_preferredHeightForString:(id)a3 constrainedToWidth:(double)a4;
+ (double)fr_preferredHeightForString:(id)a3 textStyle:(id)a4 constrainedToWidth:(double)a5;
+ (double)fr_scaledValueForValue:(double)a3;
+ (double)fr_scaledValueForValue:(double)a3 scalingRate:(double)a4;
+ (id)_fr_fontNameWithPrefix:(id)a3 midfix:(id)a4 suffix:(id)a5;
+ (id)_fr_fontWeightLookup;
+ (id)fr_appropriateValueForCurrentContentSizeCategoryUsingMap:(id)a3;
+ (id)fr_drukTextBoldForSize:(double)a3;
+ (id)fr_drukWideMediumForSize:(double)a3;
+ (id)fr_fontWithName:(id)a3 size:(double)a4;
+ (id)fr_orderedContentSizeCategories;
+ (id)fr_preferredFontForBaseFont:(id)a3;
+ (id)fr_systemFontNameForWeight:(double)a3;
+ (id)fr_systemFontNameForWeight:(double)a3 condensed:(BOOL)a4;
@end

@implementation UIFont

+ (id)_fr_fontWeightLookup
{
  if (qword_1000EDF30 != -1) {
    dispatch_once(&qword_1000EDF30, &stru_1000C5870);
  }
  v2 = (void *)qword_1000EDF28;

  return v2;
}

+ (id)fr_fontWithName:(id)a3 size:(double)a4
{
  id v6 = a3;
  v7 = [a1 _fr_fontWeightLookup];
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v13 = [a1 fontWithName:v6 size:a4];

    if (v13)
    {
      id v14 = v13;
    }
    else
    {
      id v14 = [a1 systemFontOfSize:a4];
    }
    UIFontForLanguage = v14;

    goto LABEL_22;
  }
  unsigned int v9 = [v6 hasPrefix:@"FRSystemFont-Condensed"];

  if (v9)
  {
    v10 = +[NSNumber numberWithDouble:UIFontWeightBold];
    unsigned int v11 = [v8 isEqualToNumber:v10];

    if (v11)
    {
      UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xA9u, a4, 0);
      if (UIFontForLanguage) {
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006F8F0();
      }
    }
    else
    {
      v15 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
      unsigned int v16 = [v8 isEqualToNumber:v15];

      if (v16)
      {
        UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemCmdKeyFontType|0xA0, a4, 0);
        if (UIFontForLanguage) {
          goto LABEL_22;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006F9B4();
        }
      }
      else
      {
        v17 = +[NSNumber numberWithDouble:UIFontWeightBlack];
        unsigned int v18 = [v8 isEqualToNumber:v17];

        if (v18)
        {
          UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0xB0u, a4, 0);
          if (UIFontForLanguage) {
            goto LABEL_22;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10006FA78();
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10006FB3C();
        }
      }
    }
  }
  [v8 doubleValue];
  UIFontForLanguage = [a1 systemFontOfSize:a4 weight:v19];
LABEL_22:

  return UIFontForLanguage;
}

+ (id)_fr_fontNameWithPrefix:(id)a3 midfix:(id)a4 suffix:(id)a5
{
  return +[NSString stringWithFormat:@"%@%@-%@", a3, a4, a5];
}

+ (id)fr_systemFontNameForWeight:(double)a3
{
  return [a1 fr_systemFontNameForWeight:0 condensed:a3];
}

+ (id)fr_systemFontNameForWeight:(double)a3 condensed:(BOOL)a4
{
  if (UIFontWeightUltraLight == a3)
  {
    CFStringRef v4 = @"Ultralight";
  }
  else if (UIFontWeightThin == a3)
  {
    CFStringRef v4 = @"Thin";
  }
  else if (UIFontWeightLight == a3)
  {
    CFStringRef v4 = @"Light";
  }
  else if (UIFontWeightRegular == a3)
  {
    CFStringRef v4 = @"Regular";
  }
  else if (UIFontWeightMedium == a3)
  {
    CFStringRef v4 = @"Medium";
  }
  else if (UIFontWeightSemibold == a3)
  {
    CFStringRef v4 = @"Semibold";
  }
  else if (UIFontWeightBold == a3)
  {
    CFStringRef v4 = @"Bold";
  }
  else if (UIFontWeightHeavy == a3)
  {
    CFStringRef v4 = @"Heavy";
  }
  else if (UIFontWeightBlack == a3)
  {
    CFStringRef v4 = @"Black";
  }
  else
  {
    CFStringRef v4 = 0;
  }
  if (a4) {
    CFStringRef v5 = @"-Condensed";
  }
  else {
    CFStringRef v5 = &stru_1000CABC0;
  }
  return _objc_msgSend(a1, "_fr_fontNameWithPrefix:midfix:suffix:", @"FRSystemFont", v5, v4);
}

+ (BOOL)fr_contentSizeCategoryIsGreaterThan:(id)a3
{
  v3 = (NSString *)a3;
  CFStringRef v4 = +[UIContentSizeCategoryPreference system];
  CFStringRef v5 = [v4 preferredContentSizeCategory];

  NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v5, v3);
  return v6 == NSOrderedDescending;
}

+ (id)fr_orderedContentSizeCategories
{
  v2 = (void *)qword_1000EDF38;
  if (!qword_1000EDF38)
  {
    uint64_t v3 = +[NSOrderedSet orderedSetWithObjects:](NSOrderedSet, "orderedSetWithObjects:", UIContentSizeCategoryUnspecified, UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium, UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, 0);
    CFStringRef v4 = (void *)qword_1000EDF38;
    qword_1000EDF38 = v3;

    v2 = (void *)qword_1000EDF38;
  }

  return v2;
}

+ (id)fr_drukWideMediumForSize:(double)a3
{
  return +[UIFont fr_fontWithName:@"DrukWide-Medium" size:a3];
}

+ (id)fr_drukTextBoldForSize:(double)a3
{
  return +[UIFont fr_fontWithName:@"DrukText-Bold" size:a3];
}

+ (id)fr_appropriateValueForCurrentContentSizeCategoryUsingMap:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[UIContentSizeCategoryPreference system];
  NSComparisonResult v6 = [v5 preferredContentSizeCategory];

  v7 = [v4 objectForKeyedSubscript:UIContentSizeCategoryLarge];

  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006FCE4();
  }
  v8 = [v4 objectForKeyedSubscript:v6];
  unsigned int v9 = v8;
  if (v8)
  {
    v10 = v8;
    goto LABEL_44;
  }
  [a1 fr_orderedContentSizeCategories];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v41;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
      if ([v17 isEqualToString:v6]) {
        break;
      }
      unsigned int v18 = [v4 objectForKeyedSubscript:v17];

      if (v18)
      {
        id v19 = v17;

        unint64_t v14 = (unint64_t)v19;
      }
      if (v13 == (id)++v16)
      {
        id v13 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v13) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v14 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v35 = v11;
  v20 = [v11 reverseObjectEnumerator];
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    unint64_t v23 = 0;
    uint64_t v24 = *(void *)v37;
LABEL_20:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v20);
      }
      v26 = *(void **)(*((void *)&v36 + 1) + 8 * v25);
      if ([v26 isEqualToString:v6]) {
        break;
      }
      v27 = [v4 objectForKeyedSubscript:v26];

      if (v27)
      {
        id v28 = v26;

        unint64_t v23 = (unint64_t)v28;
      }
      if (v22 == (id)++v25)
      {
        id v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v22) {
          goto LABEL_20;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v23 = 0;
  }

  if (!v14 || v23)
  {
    v29 = v35;
    if (!v14 && v23) {
      goto LABEL_41;
    }
    if (!(v14 | v23))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006FC10();
      }
      v10 = &off_1000CFB58;
      goto LABEL_43;
    }
    v30 = [v35 indexOfObject:v6];
    v31 = (char *)(v30 - (unsigned char *)[v35 indexOfObject:v14]);
    if ((unint64_t)v31 >= (unsigned char *)[v35 indexOfObject:v23] - v30)
    {
LABEL_41:
      v32 = v4;
      unint64_t v33 = v23;
    }
    else
    {
      v32 = v4;
      unint64_t v33 = v14;
    }
    v10 = [v32 objectForKeyedSubscript:v33];
  }
  else
  {
    v10 = [v4 objectForKeyedSubscript:v14];
    v29 = v35;
  }
LABEL_43:

  unsigned int v9 = 0;
LABEL_44:

  return v10;
}

+ (BOOL)fr_accessibilityFontSizesEnabled
{
  v2 = +[UIContentSizeCategoryPreference system];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

+ (BOOL)fr_isDefaultContentSizeCategory
{
  v2 = +[UIContentSizeCategoryPreference system];
  uint64_t v3 = [v2 preferredContentSizeCategory];
  unsigned __int8 v4 = [v3 isEqualToString:UIContentSizeCategoryLarge];

  return v4;
}

+ (id)fr_preferredFontForBaseFont:(id)a3
{
  id v3 = a3;
  [v3 pointSize];
  double v5 = v4;
  NSComparisonResult v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v6 _scaledValueForValue:v5];
  v8 = [v3 fontWithSize:round(v7)];

  return v8;
}

+ (double)fr_scaledValueForValue:(double)a3
{
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v4 _scaledValueForValue:a3];
  double v6 = round(v5);

  return v6;
}

+ (double)fr_notRoundedScaledValueForValue:(double)a3
{
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v4 _scaledValueForValue:a3];
  double v6 = v5;

  return v6;
}

+ (double)fr_inverselyScaledValueForValue:(double)a3
{
  [a1 fr_scaledValueForValue:];
  return round(a3 / v4 * a3);
}

+ (double)fr_scaledValueForValue:(double)a3 scalingRate:(double)a4
{
  [a1 fr_scaledValueForValue:];
  return round(a3 + (v6 - a3) * a4);
}

+ (double)fr_inverselyScaledValueForValue:(double)a3 scalingRate:(double)a4
{
  [a1 fr_scaledValueForValue:a3 scalingRate:a4];
  return round(a3 / v5 * a3);
}

+ (double)fr_preferredHeightForString:(id)a3 constrainedToWidth:(double)a4
{
  [a1 fr_preferredHeightForString:a3 textStyle:UIFontTextStyleBody constrainedToWidth:a4];
  return result;
}

+ (double)fr_preferredHeightForString:(id)a3 textStyle:(id)a4 constrainedToWidth:(double)a5
{
  [a1 fr_preferredHeightForString:a3 baseFontSize:a4 maxFontSize:0.0 textStyle:1.79769313e308 constrainedToWidth:a5];
  return result;
}

+ (double)fr_preferredHeightForString:(id)a3 baseFontSize:(double)a4 maxFontSize:(double)a5 textStyle:(id)a6 constrainedToWidth:(double)a7
{
  id v11 = a3;
  id v12 = +[UIFont preferredFontForTextStyle:a6];
  id v13 = v12;
  if (a4 > 0.0)
  {
    [v12 _scaledValueForValue:a4];
    if (v14 >= a5) {
      double v14 = a5;
    }
    float v15 = v14;
    uint64_t v16 = [v13 fontWithSize:roundf(v15)];

    id v13 = (void *)v16;
  }
  NSAttributedStringKey v22 = NSFontAttributeName;
  unint64_t v23 = v13;
  v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v11 boundingRectWithSize:3 options:v17 attributes:0 context:1.79769313e308];
  double v19 = v18;

  float v20 = v19;
  return roundf(v20);
}

@end
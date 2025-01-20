@interface UIViewAuditIssuesAccessibility
+ (id)_axAuditContrastDetectionForView:(id)a3;
+ (id)_axAuditCreateContrastIssueForCATextLayer:(id)a3 withView:(id)a4;
+ (id)_axAuditCreateContrastIssueForView:(id)a3 text:(id)a4;
+ (id)_axAuditHexValueForColor:(id)a3;
+ (id)_axAuditTextCandidateForView:(id)a3;
@end

@implementation UIViewAuditIssuesAccessibility

+ (id)_axAuditContrastDetectionForView:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 _axAuditTextCandidateForView:v4];
  v6 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    v15 = @"AX Audit: Element: %@ has an unknown contrast issue type.";
    id v16 = v4;
    _AXLogWithFacility();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(NSString, "stringWithFormat:", @"%li", 4001, v15, v16);
        [v11 setObject:v12 forKey:@"AXAuditIssueTypeKey"];

        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v11];
        [v6 addObject:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)_axAuditTextCandidateForView:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = +[UIApplicationAuditIssuesAccessibility _axAuditGetTextFromObject:v3];
  if ([v5 length])
  {
    [v3 alpha];
    if (v6 > 0.0
      && ([v3 isHidden] & 1) == 0
      && ([v3 isHiddenOrHasHiddenAncestor] & 1) == 0)
    {
      uint64_t v7 = [a1 _axAuditCreateContrastIssueForView:v3 text:v5];
      [v4 addObject:v7];
    }
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = objc_msgSend(v3, "layer", v5);
  v10 = [v8 arrayWithObject:v9];

  if ([v10 count])
  {
    unsigned int v11 = 0;
    do
    {
      v12 = [v10 firstObject];
      [v10 removeObjectAtIndex:0];
      [v12 opacity];
      if (v13 > 0.0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v12 string];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            id v16 = [a1 _axAuditCreateContrastIssueForCATextLayer:v12 withView:v3];
            [v4 addObject:v16];
          }
        }
      }
      uint64_t v17 = [v12 sublayers];
      if (v17)
      {
        long long v18 = (void *)v17;
        long long v19 = [v12 sublayers];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          long long v21 = [v12 sublayers];
          [v10 addObjectsFromArray:v21];
        }
      }

      if (![v10 count]) {
        break;
      }
    }
    while (v11++ < 0x270F);
  }

  return v4;
}

+ (id)_axAuditCreateContrastIssueForView:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    LOBYTE(v26) = 0;
    objc_opt_class();
    uint64_t v8 = [v6 safeValueForKey:@"textColor"];
    uint64_t v9 = __UIAccessibilityCastAsClass();

    if (v9)
    {
      v10 = [a1 _axAuditHexValueForColor:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  unsigned int v11 = [v6 backgroundColor];
  v12 = v11;
  if (v11)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    double v23 = 0.0;
    uint64_t v24 = 0;
    uint64_t v22 = 0;
    if ([v11 getRed:&v26 green:&v25 blue:&v24 alpha:&v23]) {
      int v13 = 1;
    }
    else {
      int v13 = [v12 getWhite:&v22 alpha:&v23];
    }
    v14 = 0;
    if (v13 && v23 > 0.0)
    {
      v14 = objc_msgSend(a1, "_axAuditHexValueForColor:", v12, v23);
    }
  }
  else
  {
    v14 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    LOBYTE(v26) = 0;
    objc_opt_class();
    uint64_t v15 = [v6 safeValueForKey:@"font"];
    id v16 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v26) {
      abort();
    }
    if (v16)
    {
      uint64_t v17 = NSNumber;
      [v16 pointSize];
      long long v18 = objc_msgSend(v17, "numberWithDouble:");
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    long long v18 = 0;
  }
  long long v19 = +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:0 element:v6 additionalInfo:0 identifier:v7 foregroundColor:v10 backgroundColor:v14 fontSize:v18 elementRect:0 text:v7];
  uint64_t v20 = (void *)[v19 mutableCopy];

  return v20;
}

+ (id)_axAuditCreateContrastIssueForCATextLayer:(id)a3 withView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 string];
  [v6 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v6 superlayer];
  if (v17)
  {
    long long v18 = (void *)v17;
    do
    {
      [v18 frame];
      double v10 = v10 + v19;
      [v18 frame];
      double v12 = v12 + v20;
      uint64_t v21 = [v18 superlayer];

      long long v18 = (void *)v21;
    }
    while (v21);
  }
  [v7 accessibilityFrame];
  double v23 = v10 + v22;
  [v7 accessibilityFrame];
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v23, v12 + v24, v14, v16);
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v6, "foregroundColor"));
  v27 = [a1 _axAuditHexValueForColor:v26];

  v28 = NSNumber;
  [v6 fontSize];
  *(float *)&double v29 = v29;
  v30 = [v28 numberWithFloat:v29];
  v31 = +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:0 element:v7 additionalInfo:0 identifier:v8 foregroundColor:v27 backgroundColor:0 fontSize:v30 elementRect:v25 text:v8];
  v32 = (void *)[v31 mutableCopy];

  return v32;
}

+ (id)_axAuditHexValueForColor:(id)a3
{
  id v3 = a3;
  Components = CGColorGetComponents((CGColorRef)[v3 CGColor]);
  id v5 = v3;
  id v6 = (CGColor *)[v5 CGColor];

  size_t NumberOfComponents = CGColorGetNumberOfComponents(v6);
  if (NumberOfComponents == 2)
  {
    float v8 = *Components * 255.0;
    uint64_t v9 = llroundf(v8);
    uint64_t v10 = v9;
    uint64_t v11 = v9;
  }
  else if (NumberOfComponents < 3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    float v12 = *Components * 255.0;
    uint64_t v11 = llroundf(v12);
    float v13 = Components[1] * 255.0;
    uint64_t v10 = llroundf(v13);
    float v14 = Components[2] * 255.0;
    uint64_t v9 = llroundf(v14);
  }
  unint64_t v15 = v11 & ~(v11 >> 63);
  if (v15 >= 0xFF) {
    unint64_t v15 = 255;
  }
  unint64_t v16 = v10 & ~(v10 >> 63);
  if (v16 >= 0xFF) {
    unint64_t v16 = 255;
  }
  unint64_t v17 = v9 & ~(v9 >> 63);
  if (v17 >= 0xFF) {
    unint64_t v17 = 255;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX", v15, v16, v17);
}

@end
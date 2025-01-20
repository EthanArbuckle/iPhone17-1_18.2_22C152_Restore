@interface SXCondition
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
- (NSSet)types;
- (double)maxViewportAspectRatioWithValue:(id)a3 withType:(int)a4;
- (double)maxViewportWidthWithValue:(id)a3 withType:(int)a4;
- (double)minViewportAspectRatioWithValue:(id)a3 withType:(int)a4;
- (double)minViewportWidthWithValue:(id)a3 withType:(int)a4;
- (id)contentSizeCategoryFromJSONContentSizeCategory:(id)a3;
- (id)maxContentSizeCategoryWithValue:(id)a3 withType:(int)a4;
- (id)minContentSizeCategoryWithValue:(id)a3 withType:(int)a4;
- (int64_t)horizontalSizeClassWithValue:(id)a3 withType:(int)a4;
- (int64_t)interfaceSizeClassFromJSONSizeClass:(id)a3;
- (int64_t)offerUpsellScenarioWithValue:(id)a3 withType:(int)a4;
- (int64_t)subscriptionActivationEligibilityWithValue:(id)a3 withType:(int)a4;
- (int64_t)verticalSizeClassWithValue:(id)a3 withType:(int)a4;
- (unint64_t)newsletterSubscriptionStatusWithValue:(id)a3 withType:(int)a4;
- (unint64_t)preferredColorSchemeWithValue:(id)a3 withType:(int)a4;
- (unint64_t)testingWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXCondition

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"testing"])
  {
    v5 = @"_anf_testing";
  }
  else if ([v4 isEqualToString:@"newsletterSubscriptionStatus"])
  {
    v5 = @"newsletter";
  }
  else if ([v4 isEqualToString:@"offerUpsellScenario"])
  {
    v5 = @"upsellScenario";
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXCondition;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)minViewportWidthWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 0.0;
  }
  [a3 doubleValue];
  return result;
}

- (double)maxViewportWidthWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 1.79769313e308;
  }
  [a3 doubleValue];
  return result;
}

- (double)minViewportAspectRatioWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 0.0;
  }
  [a3 doubleValue];
  return result;
}

- (double)maxViewportAspectRatioWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 1.79769313e308;
  }
  [a3 doubleValue];
  return result;
}

- (int64_t)horizontalSizeClassWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3) {
    return [(SXCondition *)self interfaceSizeClassFromJSONSizeClass:a3];
  }
  else {
    return 0;
  }
}

- (int64_t)verticalSizeClassWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3) {
    return [(SXCondition *)self interfaceSizeClassFromJSONSizeClass:a3];
  }
  else {
    return 0;
  }
}

- (id)minContentSizeCategoryWithValue:(id)a3 withType:(int)a4
{
  id v7 = (id)*MEMORY[0x263F1D1A0];
  if (a4 == 3)
  {
    uint64_t v8 = [(SXCondition *)self contentSizeCategoryFromJSONContentSizeCategory:a3];

    id v7 = (id)v8;
  }
  return v7;
}

- (id)maxContentSizeCategoryWithValue:(id)a3 withType:(int)a4
{
  id v7 = (id)*MEMORY[0x263F1D1A0];
  if (a4 == 3)
  {
    uint64_t v8 = [(SXCondition *)self contentSizeCategoryFromJSONContentSizeCategory:a3];

    id v7 = (id)v8;
  }
  return v7;
}

- (unint64_t)testingWithValue:(id)a3 withType:(int)a4
{
  unint64_t result = (unint64_t)a3;
  if (a3)
  {
    if (a4 == 2) {
      return objc_msgSend(a3, "BOOLValue", v4, v5);
    }
  }
  return result;
}

- (unint64_t)preferredColorSchemeWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    id v7 = v5;
    if ([v7 length])
    {
      if ([v7 isEqualToString:@"light"])
      {
        unint64_t v8 = 2;
      }
      else if ([v7 isEqualToString:@"dark"])
      {
        unint64_t v8 = 3;
      }
      else if ([v7 isEqualToString:@"any"])
      {
        unint64_t v8 = 4;
      }
      else
      {
        unint64_t v8 = 1;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)newsletterSubscriptionStatusWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    id v7 = v5;
    unint64_t v8 = v7;
    if (v7 && [v7 length])
    {
      if ([v8 isEqualToString:@"unavailable"])
      {
        unint64_t v9 = 2;
      }
      else if ([v8 isEqualToString:@"not_subscribed"])
      {
        unint64_t v9 = 3;
      }
      else if ([v8 isEqualToString:@"non_personalized"])
      {
        unint64_t v9 = 4;
      }
      else if ([v8 isEqualToString:@"personalized"])
      {
        unint64_t v9 = 5;
      }
      else
      {
        unint64_t v9 = 1;
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)offerUpsellScenarioWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    id v7 = v5;
    unint64_t v8 = v7;
    if (v7 && [v7 length] && (objc_msgSend(v8, "isEqualToString:", @"undefined") & 1) == 0)
    {
      if ([v8 isEqualToString:@"unknown"])
      {
        int64_t v9 = 2;
      }
      else if ([v8 isEqualToString:@"news_plus"])
      {
        int64_t v9 = 3;
      }
      else if ([v8 isEqualToString:@"bundle_any"])
      {
        int64_t v9 = 4;
      }
      else if ([v8 isEqualToString:@"bundle_none"])
      {
        int64_t v9 = 5;
      }
      else if ([v8 isEqualToString:@"bundle_savings"])
      {
        int64_t v9 = 6;
      }
      else if ([v8 isEqualToString:@"bundle_price_reduction"])
      {
        int64_t v9 = 7;
      }
      else if ([v8 isEqualToString:@"bundle_best_value"])
      {
        int64_t v9 = 8;
      }
      else if ([v8 isEqualToString:@"bundle_suggestion"])
      {
        int64_t v9 = 9;
      }
      else
      {
        int64_t v9 = 1;
      }
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)subscriptionActivationEligibilityWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    id v7 = v5;
    unint64_t v8 = v7;
    if (v7 && [v7 length] && (objc_msgSend(v8, "isEqualToString:", @"unknown") & 1) == 0)
    {
      if ([v8 isEqualToString:@"any"])
      {
        int64_t v9 = 2;
      }
      else if ([v8 isEqualToString:@"none"])
      {
        int64_t v9 = 1;
      }
      else if ([v8 isEqualToString:@"appleOneViaCarrier"])
      {
        int64_t v9 = 3;
      }
      else if ([v8 isEqualToString:@"newsPlusViaHardware"])
      {
        int64_t v9 = 4;
      }
      else
      {
        int64_t v9 = 0;
      }
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (NSSet)types
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = [(SXJSONObject *)self JSONRepresentation];
  uint64_t v4 = [v3 allKeys];
  id v5 = [v2 setWithArray:v4];

  v6 = SXConditionTypes();
  [v5 intersectSet:v6];

  return (NSSet *)v5;
}

- (int64_t)interfaceSizeClassFromJSONSizeClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"compact"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"regular"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)contentSizeCategoryFromJSONContentSizeCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"XS"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D178];
  }
  else if ([v3 isEqualToString:@"S"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D198];
  }
  else if ([v3 isEqualToString:@"M"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D188];
  }
  else if ([v3 isEqualToString:@"L"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D180];
  }
  else if ([v3 isEqualToString:@"XL"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D170];
  }
  else if ([v3 isEqualToString:@"XXL"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D168];
  }
  else if ([v3 isEqualToString:@"XXXL"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D160];
  }
  else if ([v3 isEqualToString:@"AX-M"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D150];
  }
  else if ([v3 isEqualToString:@"AX-L"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D148];
  }
  else if ([v3 isEqualToString:@"AX-XL"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D140];
  }
  else if ([v3 isEqualToString:@"AX-XXL"])
  {
    int64_t v4 = (id *)MEMORY[0x263F1D138];
  }
  else
  {
    int v5 = [v3 isEqualToString:@"AX-XXXL"];
    int64_t v4 = (id *)MEMORY[0x263F1D1A0];
    if (v5) {
      int64_t v4 = (id *)MEMORY[0x263F1D130];
    }
  }
  id v6 = *v4;

  return v6;
}

@end
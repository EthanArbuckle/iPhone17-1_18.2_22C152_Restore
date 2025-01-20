@interface THGlossaryEntryRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)childRepsForHitTesting;
- (id)p_newTitleLayer;
@end

@implementation THGlossaryEntryRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryEntryRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)p_newTitleLayer
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryRepAccessibility;
  id v2 = [(THGlossaryEntryRepAccessibility *)&v4 p_newTitleLayer];
  [v2 setIsAccessibilityElement:1];
  return v2;
}

- (id)childRepsForHitTesting
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    NSClassFromString(@"THGlossaryEntryFloatingRep");
    v3 = objc_opt_new();
    id v4 = [(THGlossaryEntryRepAccessibility *)self tsaxValueForKey:@"childReps"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            v11 = v7;
            if (!v7)
            {
              v11 = objc_opt_new();
              v7 = v11;
            }
          }
          else
          {
            v11 = v3;
          }
          [v11 addObject:v10];
        }
        id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)j), "tsaxValueForKey:", @"childReps"));
        }
        id v14 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    v12 = +[NSArray arrayWithArray:v3];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)THGlossaryEntryRepAccessibility;
    return [(THGlossaryEntryRepAccessibility *)&v18 childRepsForHitTesting];
  }
  return v12;
}

@end
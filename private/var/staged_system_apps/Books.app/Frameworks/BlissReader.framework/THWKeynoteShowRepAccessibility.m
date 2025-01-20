@interface THWKeynoteShowRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CALayer)thaxShowLayer;
- (NSArray)thaxAccessibilityRegions;
- (NSArray)thaxCachedElements;
- (NSString)thaxLabelForCurrentEvent;
- (NSString)thaxLastSeenEventIdentifier;
- (NSString)thaxLastSpokenAnnouncement;
- (id)accessibilityElements;
- (void)p_keynoteShowDidUpdate:(id)a3;
- (void)thaxGotoNextEvent;
- (void)thaxGotoPreviousEvent;
- (void)thaxSetCachedElements:(id)a3;
- (void)thaxSetLastSeenEventIdentifier:(id)a3;
- (void)thaxSetLastSpokenAnnouncement:(id)a3;
@end

@implementation THWKeynoteShowRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWKeynoteShowRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxLabelForCurrentEvent
{
  v2 = [(TSDRepAccessibility *)self tsaxValueForKey:@"kpfPlayer"];
  char v7 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = [v2 tsaxValueForKey:@"accessibilityLabelForCurrentEvent"];
  v5 = __TSAccessibilityCastAsClass(v3, (uint64_t)v4, 1, &v7);

  if (v7) {
    abort();
  }

  return (NSString *)v5;
}

- (NSArray)thaxAccessibilityRegions
{
  [(TSDRepAccessibility *)self tsaxValueForKey:@"kpfPlayer"];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_289FAC;
  v12 = sub_289FBC;
  id v13 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_289FC4;
  v5[3] = &unk_46C450;
  char v7 = &v8;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }

  id v3 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v3;
}

- (CALayer)thaxShowLayer
{
  char v7 = 0;
  id v3 = (objc_class *)objc_opt_class();
  v4 = [(TSDRepAccessibility *)self tsaxValueForKey:@"_showLayer"];
  v5 = __TSAccessibilityCastAsClass(v3, (uint64_t)v4, 1, &v7);

  if (v7) {
    abort();
  }

  return (CALayer *)v5;
}

- (void)thaxGotoNextEvent
{
  [(TSDRepAccessibility *)self tsaxValueForKey:@"kpfPlayer"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28A14C;
  v3[3] = &unk_456D40;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)thaxGotoPreviousEvent
{
  [(TSDRepAccessibility *)self tsaxValueForKey:@"kpfPlayer"];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28A1F4;
  v3[3] = &unk_456D40;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (NSString)thaxLastSpokenAnnouncement
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_573A79);
}

- (void)thaxSetLastSpokenAnnouncement:(id)a3
{
}

- (NSString)thaxLastSeenEventIdentifier
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_573A7A);
}

- (void)thaxSetLastSeenEventIdentifier:(id)a3
{
}

- (NSArray)thaxCachedElements
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_573A7B);
}

- (void)thaxSetCachedElements:(id)a3
{
}

- (void)p_keynoteShowDidUpdate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)THWKeynoteShowRepAccessibility;
  [(THWKeynoteShowRepAccessibility *)&v10 p_keynoteShowDidUpdate:a3];
  id v4 = [(THWKeynoteShowRepAccessibility *)self thaxLabelForCurrentEvent];
  v5 = [(THWKeynoteShowRepAccessibility *)self thaxLastSpokenAnnouncement];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v4);
    UIAccessibilityNotifications v7 = UIAccessibilityLayoutChangedNotification;
    uint64_t v8 = [(THWKeynoteShowRepAccessibility *)self accessibilityElements];
    v9 = [v8 firstObject];
    UIAccessibilityPostNotification(v7, v9);
  }
  [(THWKeynoteShowRepAccessibility *)self thaxSetLastSpokenAnnouncement:v4];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v2 = self;
  id v3 = [(THWKeynoteShowRepAccessibility *)self thaxLabelForCurrentEvent];
  id v4 = [(THWKeynoteShowRepAccessibility *)v2 thaxLastSeenEventIdentifier];
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    v32 = objc_opt_new();
    v33 = v2;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unsigned __int8 v6 = [(THWKeynoteShowRepAccessibility *)v2 thaxAccessibilityRegions];
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          char v34 = 0;
          v12 = (objc_class *)objc_opt_class();
          id v13 = [v11 objectForKeyedSubscript:@"text"];
          v14 = __TSAccessibilityCastAsClass(v12, (uint64_t)v13, 1, &v34);

          if (v34
            || (char v34 = 0,
                v15 = (objc_class *)objc_opt_class(),
                [v11 objectForKeyedSubscript:@"targetRectangle"],
                v16 = objc_claimAutoreleasedReturnValue(),
                __TSAccessibilityCastAsClass(v15, (uint64_t)v16, 1, &v34),
                v17 = objc_claimAutoreleasedReturnValue(),
                v16,
                v34))
          {
            abort();
          }
          [v17 CGRectValue];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;

          if ([v14 length])
          {
            v41.origin.x = v19;
            v41.origin.y = v21;
            v41.size.width = v23;
            v41.size.height = v25;
            if (!CGRectIsEmpty(v41))
            {
              v26 = [[THWKeynoteShowRepAccessibilityElement alloc] initWithAccessibilityContainer:v33];
              [(THWKeynoteShowRepAccessibilityElement *)v26 setIsAccessibilityElement:1];
              [(THWKeynoteShowRepAccessibilityElement *)v26 setAccessibilityLabel:v14];
              -[THWKeynoteShowRepAccessibilityElement setFrameInShowLayer:](v26, "setFrameInShowLayer:", v19, v21, v23, v25);
              v27 = [(THWKeynoteShowRepAccessibility *)v33 thaxShowLayer];
              [(THWKeynoteShowRepAccessibilityElement *)v26 setShowLayer:v27];

              [v32 addObject:v26];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v8);
    }

    id v2 = v33;
    v28 = [(THWKeynoteShowRepAccessibility *)v33 thaxLabelForCurrentEvent];
    [(THWKeynoteShowRepAccessibility *)v33 thaxSetLastSeenEventIdentifier:v28];

    id v29 = [v32 copy];
    [(THWKeynoteShowRepAccessibility *)v33 thaxSetCachedElements:v29];
  }
  v30 = [(THWKeynoteShowRepAccessibility *)v2 thaxCachedElements];

  return v30;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    [(THWKeynoteShowRepAccessibility *)self thaxGotoPreviousEvent];
    return 1;
  }
  if (a3 == 2)
  {
    [(THWKeynoteShowRepAccessibility *)self thaxGotoNextEvent];
    return 1;
  }
  return 0;
}

@end
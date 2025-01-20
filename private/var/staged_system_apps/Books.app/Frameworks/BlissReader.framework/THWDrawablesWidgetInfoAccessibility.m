@interface THWDrawablesWidgetInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxWidgetDescription;
- (id)thaxExpandedStageDrawable;
- (id)thaxStageDrawable;
@end

@implementation THWDrawablesWidgetInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWDrawablesWidgetInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxWidgetDescription
{
  id v3 = +[NSMutableArray array];
  [v3 tsaxAddObjectIfNotNil:[self thaxExpandedStageDrawable]];
  [v3 tsaxAddObjectIfNotNil:[self thaxStageDrawable]];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = (char *)[v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        NSClassFromString(@"THImageInfo");
        char isKindOfClass = objc_opt_isKindOfClass();
        CFStringRef v9 = @"widgets.image.roledescription";
        if (isKindOfClass) {
          goto LABEL_23;
        }
        NSClassFromString(@"THWMovieInfo");
        char v10 = objc_opt_isKindOfClass();
        CFStringRef v9 = @"widgets.movie.roledescription";
        if (v10) {
          goto LABEL_23;
        }
        NSClassFromString(@"THWKeynoteInfo");
        char v11 = objc_opt_isKindOfClass();
        CFStringRef v9 = @"widgets.keynote.roledescription";
        if (v11) {
          goto LABEL_23;
        }
        NSClassFromString(@"THWViewportInfo");
        char v12 = objc_opt_isKindOfClass();
        CFStringRef v9 = @"widgets.viewport.roledescription";
        if (v12) {
          goto LABEL_23;
        }
        NSClassFromString(@"THWReviewInfo");
        char v13 = objc_opt_isKindOfClass();
        CFStringRef v9 = @"widgets.review.roledescription";
        if ((v13 & 1) == 0)
        {
          NSClassFromString(@"THWSceneInfo");
          char v14 = objc_opt_isKindOfClass();
          CFStringRef v9 = @"widgets.3D.roledescription";
          if ((v14 & 1) == 0)
          {
            NSClassFromString(@"THWWebInfo");
            char v15 = objc_opt_isKindOfClass();
            CFStringRef v9 = @"widgets.html.roledescription";
            if ((v15 & 1) == 0) {
              continue;
            }
          }
        }
LABEL_23:
        v16 = THAccessibilityLocalizedString((uint64_t)v9);
        if (v16) {
          return v16;
        }
      }
      v5 = (char *)[v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v17 = THAccessibilityLocalizedString(@"widgets.unknown.roledescription");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Failed to create a description for widget: %@", v19, v20, v21, v22, v23, (uint64_t)self))abort(); {
  }
    }
  return v17;
}

- (id)thaxStageDrawable
{
  return [(THWDrawablesWidgetInfoAccessibility *)self tsaxValueForKey:@"stageDrawable"];
}

- (id)thaxExpandedStageDrawable
{
  return [(THWDrawablesWidgetInfoAccessibility *)self tsaxValueForKey:@"expandedStageDrawable"];
}

@end
@interface TSUILabelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation TSUILabelAccessibility

+ (id)tsaxTargetClassName
{
  return @"UILabel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v3 = [[-[TSUILabelAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"text") stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length];
  if (v3)
  {
    if (![(TSUILabelAccessibility *)self tsaxViewAncestorOfType:NSClassFromString(@"TSADocumentManagerPopoverView")])
    {
      if (![(TSUILabelAccessibility *)self tsaxViewAncestorOfType:NSClassFromString(@"TSADocumentManagerPopoverView")])goto LABEL_15; {
      [(TSUILabelAccessibility *)self frame];
      }
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      id v12 = [self superview].subviews;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v13)
      {
LABEL_15:
        v18.receiver = self;
        v18.super_class = (Class)TSUILabelAccessibility;
        LOBYTE(v3) = [(TSUILabelAccessibility *)&v18 isAccessibilityElement];
        return (char)v3;
      }
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
LABEL_7:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (*(TSUILabelAccessibility **)(*((void *)&v19 + 1) + 8 * v16) != self)
        {
          [*(id *)(*((void *)&v19 + 1) + 8 * v16) frame];
          v25.origin.x = v5;
          v25.origin.y = v7;
          v25.size.width = v9;
          v25.size.height = v11;
          if (CGRectContainsRect(v24, v25))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v14) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

@end
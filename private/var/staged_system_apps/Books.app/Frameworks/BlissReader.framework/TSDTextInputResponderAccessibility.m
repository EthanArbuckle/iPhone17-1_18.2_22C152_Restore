@interface TSDTextInputResponderAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxFocusedElement;
- (void)forwardInvocation:(id)a3;
- (void)selectAll:(id)a3;
@end

@implementation TSDTextInputResponderAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDTextInputResponder";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)selectAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponderAccessibility;
  [(TSDTextInputResponderAccessibility *)&v5 selectAll:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionSelectAll");
  UIAccessibilityPostNotification(v3, UIKitLocalizedString);
}

- (void)forwardInvocation:(id)a3
{
  if (![(TSDTextInputResponderAccessibility *)self tsaxValueForKey:@"editor"]) {
    goto LABEL_11;
  }
  objc_super v5 = (char *)[a3 selector];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  if (v5 == "copy:")
  {
    v6 = &TSAccessibilityTextOperationActionCopy;
  }
  else if (v5 == "cut:")
  {
    v6 = &TSAccessibilityTextOperationActionCut;
  }
  else
  {
    if (v5 != "paste:") {
      goto LABEL_11;
    }
    v6 = &TSAccessibilityTextOperationActionPaste;
  }
  v7 = *v6;
  if (*v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_2629F0;
    v9[3] = &unk_456E38;
    v9[4] = a3;
    v9[5] = self;
    [(TSDTextInputResponderAccessibility *)self tsaxHandleTextOperationAction:v7 usingBlock:v9];
    return;
  }
LABEL_11:
  v8.receiver = self;
  v8.super_class = (Class)TSDTextInputResponderAccessibility;
  [(TSDTextInputResponderAccessibility *)&v8 forwardInvocation:a3];
}

- (id)tsaxFocusedElement
{
  UIAccessibilityNotifications v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[-[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"editor") tsaxValueForKey:@"selection"], 0, 0);
  if (!v4 || (objc_super v5 = [(objc_class *)v4 tsaxRange], v5 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_19:
    char v28 = 0;
    v21 = objc_opt_class();
    Class v22 = __TSAccessibilityCastAsSafeCategory(v21, (uint64_t)[(TSDTextInputResponderAccessibility *)self tsaxValueForKey:@"p_ICC"], 1, &v28);
    if (!v28)
    {
      Class v17 = [objc_class tsaxFocusedRep tsaxFocusedElement];
      if (!v17) {
        return [(TSDTextInputResponderAccessibility *)self tsaxValueForKey:@"editingTextRep"];
      }
      return v17;
    }
LABEL_23:
    abort();
  }
  v6 = v5;
  char v28 = 0;
  v7 = (objc_class *)objc_opt_class();
  objc_super v8 = (void *)__TSAccessibilityCastAsClass(v7, (uint64_t)[(TSDTextInputResponderAccessibility *)self tsaxValueForKey:@"editingTextReps"], 1, &v28);
  if (v28) {
    goto LABEL_23;
  }
  v9 = v8;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v25;
LABEL_6:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v25 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
    char v28 = 0;
    v15 = objc_opt_class();
    Class v16 = __TSAccessibilityCastAsSafeCategory(v15, v14, 1, &v28);
    if (v28) {
      goto LABEL_23;
    }
    Class v17 = v16;
    v18 = [(objc_class *)v16 tsaxStorageRangeOfRep];
    if (v6 >= v18 && v6 - v18 < v19) {
      break;
    }
    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (!v11) {
        goto LABEL_19;
      }
      goto LABEL_6;
    }
  }
  if (!v17) {
    goto LABEL_19;
  }
  return v17;
}

@end
@interface UIView(UIAccessibilityPrivate)
+ (id)_accessibilityTitleForSystemTag:()UIAccessibilityPrivate;
- (double)_accessibilityFrameExpansion;
- (id)_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:()UIAccessibilityPrivate;
- (id)_accessibleNonSupplementarySubviews;
- (id)_accessibleSubviews:()UIAccessibilityPrivate;
- (uint64_t)_accessibilityAllowsSiblingsWhenOvergrown;
- (uint64_t)_accessibilityOverridesInvalidFrames;
- (uint64_t)_accessibilitySetAllowsSiblingsWhenOvergrown:()UIAccessibilityPrivate;
- (uint64_t)_accessibilitySetOverridesInvalidFrames:()UIAccessibilityPrivate;
- (uint64_t)_accessibilityShouldIgnoreSwipeActionCompletionHandler;
- (uint64_t)_accessibilityViewIsActive;
- (uint64_t)_accessibilityViewIsVisible;
- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate;
- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate stoppingBeforeContainer:;
- (uint64_t)_accessibleSubviews;
- (void)_accessibilitySetFrameExpansion:()UIAccessibilityPrivate;
- (void)_accessibilitySetViewIsVisible:()UIAccessibilityPrivate;
@end

@implementation UIView(UIAccessibilityPrivate)

- (double)_accessibilityFrameExpansion
{
  v1 = [a1 _accessibilityValueForKey:@"AXFrameSizeExpansion"];
  [v1 sizeValue];
  double v3 = v2;

  return v3;
}

- (void)_accessibilitySetFrameExpansion:()UIAccessibilityPrivate
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXFrameSizeExpansion"];
}

- (uint64_t)_accessibilityViewIsActive
{
  uint64_t result = [a1 _accessibilityViewIsVisible];
  if (result)
  {
    return [a1 isUserInteractionEnabled];
  }
  return result;
}

- (uint64_t)_accessibilityViewIsVisible
{
  return [a1 _accessibilityViewIsVisibleIgnoringAXOverrides:0];
}

- (void)_accessibilitySetViewIsVisible:()UIAccessibilityPrivate
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kAccessibilityViewIsVisibleStorage, v2, (void *)0x301);
}

- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate
{
  v5 = [(id)*MEMORY[0x1E4F43630] _accessibilityContainerToStopVisibilityCheck];
  uint64_t v6 = [a1 _accessibilityViewIsVisibleIgnoringAXOverrides:a3 stoppingBeforeContainer:v5];

  return v6;
}

- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate stoppingBeforeContainer:
{
  id v6 = a4;
  v7 = objc_getAssociatedObject(a1, &kAccessibilityViewIsVisibleStorage);
  v8 = v7;
  if (!v7)
  {
    if (a3 & 1) == 0 && ([a1 accessibilityElementsHidden])
    {
      uint64_t v9 = 0;
      goto LABEL_20;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__UIView_UIAccessibilityPrivate___accessibilityViewIsVisibleIgnoringAXOverrides_stoppingBeforeContainer___block_invoke;
    v20[3] = &unk_1E59B9948;
    id v21 = v6;
    v10 = [a1 _accessibilityFindViewAncestor:v20 startWithSelf:1];
    if (v10 && ![a1 _accessibilityOverridesInvisibility]) {
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = [a1 window];
      if (!v13) {
        goto LABEL_18;
      }
      v14 = (void *)v13;
      v15 = [a1 window];
      [v15 alpha];
      if (v16 <= 0.0)
      {

        goto LABEL_18;
      }
      v17 = [a1 window];
      char v18 = [v17 isHidden];

      if (v18) {
        goto LABEL_18;
      }
    }
    [a1 frame];
    if (fabs(v12) >= 0.001 && fabs(v11) >= 0.001
      || [a1 _accessibilityOverridesInvalidFrames])
    {
      uint64_t v9 = 1;
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = [v7 BOOLValue];
LABEL_20:

  return v9;
}

- (id)_accessibleSubviews:()UIAccessibilityPrivate
{
  v5 = +[UIAccessibilityElementTraversalOptions options];
  [v5 setShouldUseAllSubviews:1];
  [v5 setSorted:a3 == 0];
  id v6 = [a1 _accessibilityViewChildrenWithOptions:v5];

  return v6;
}

- (uint64_t)_accessibleSubviews
{
  uint64_t v2 = [a1 _accessibilityBoolValueForKey:@"AXPerformingChildrenCount"];

  return [a1 _accessibleSubviews:v2];
}

- (id)_accessibleNonSupplementarySubviews
{
  uint64_t v2 = [a1 _accessibilityBoolValueForKey:@"AXPerformingChildrenCount"] ^ 1;
  double v3 = +[UIAccessibilityElementTraversalOptions options];
  [v3 setShouldUseAllSubviews:1];
  [v3 setSorted:v2];
  [v3 setShouldExcludeSupplementaryViews:1];
  v4 = [a1 _accessibilityViewChildrenWithOptions:v3];

  return v4;
}

- (uint64_t)_accessibilityOverridesInvalidFrames
{
  return MEMORY[0x1F4106398](a1, &__UIView___accessibilityOverridesInvalidFrames);
}

- (uint64_t)_accessibilitySetOverridesInvalidFrames:()UIAccessibilityPrivate
{
  return MEMORY[0x1F41063D0](a1, &__UIView___accessibilityOverridesInvalidFrames);
}

- (uint64_t)_accessibilityAllowsSiblingsWhenOvergrown
{
  return MEMORY[0x1F4106398](a1, &__UIView___accessibilityAllowsSiblingsWhenOvergrown);
}

- (uint64_t)_accessibilitySetAllowsSiblingsWhenOvergrown:()UIAccessibilityPrivate
{
  return MEMORY[0x1F41063D0](a1, &__UIView___accessibilityAllowsSiblingsWhenOvergrown);
}

- (id)_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:()UIAccessibilityPrivate
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v5 = [a1 accessibilityUserDefinedLabel];

  if (v5)
  {
    id v6 = [a1 accessibilityUserDefinedLabel];
    goto LABEL_26;
  }
  v7 = [a1 window];

  if (!v7)
  {
LABEL_7:
    id v6 = 0;
    goto LABEL_26;
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = [a1 safeValueForKey:@"image"];
  }
  else
  {
    v8 = 0;
  }
  if ([v4 isSystemItem] && objc_msgSend(v4, "systemItem") == 4)
  {
    uint64_t v9 = @"uibutton.navbar.add.button.title";
LABEL_15:
    double v12 = UIKitAccessibilityLocalizedString(v9);
    goto LABEL_17;
  }
  if (v8)
  {
    v10 = UIImageGetNavigationBarBackArrow();
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      uint64_t v9 = @"uibutton.navbar.back.button.title";
      goto LABEL_15;
    }
  }
  v20.receiver = a1;
  v20.super_class = (Class)UIView_0;
  double v12 = objc_msgSendSuper2(&v20, sel_accessibilityLabel);
LABEL_17:
  id v6 = v12;
  if (![v12 length] && objc_msgSend(v4, "isSystemItem"))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F42FF0], "_accessibilityTitleForSystemTag:", objc_msgSend(v4, "systemItem"));

    id v6 = (void *)v13;
  }
  if (![v6 length])
  {
    v14 = [a1 accessibilityIdentification];

    if (v14)
    {
      v15 = [a1 accessibilityIdentification];
      uint64_t v16 = [v15 integerValue];

      uint64_t v17 = [MEMORY[0x1E4F42FF0] _accessibilityTitleForSystemTag:v16];

      id v6 = (void *)v17;
    }
  }
  if (![v6 length])
  {
    uint64_t v18 = [v4 title];

    id v6 = (void *)v18;
  }

LABEL_26:

  return v6;
}

- (uint64_t)_accessibilityShouldIgnoreSwipeActionCompletionHandler
{
  return 0;
}

+ (id)_accessibilityTitleForSystemTag:()UIAccessibilityPrivate
{
  id v4 = 0;
  switch(a3)
  {
    case 0:
      v5 = @"done.toolbar.button.text";
      goto LABEL_28;
    case 1:
      v5 = @"cancel.toolbar.button.text";
      goto LABEL_28;
    case 2:
      v5 = @"edit.toolbar.button.text";
      goto LABEL_28;
    case 3:
      v5 = @"save.toolbar.button.text";
      goto LABEL_28;
    case 4:
      v5 = @"uibutton.navbar.add.button.title";
      goto LABEL_28;
    case 5:
    case 6:
    case 21:
    case 22:
    case 23:
      break;
    case 7:
      v5 = @"compose.button";
      goto LABEL_28;
    case 8:
      v5 = @"reply.button";
      goto LABEL_28;
    case 9:
      v5 = @"action.button";
      goto LABEL_28;
    case 10:
      v5 = @"organize.button";
      goto LABEL_28;
    case 11:
      v5 = @"bookmarks.button";
      goto LABEL_28;
    case 12:
      v5 = @"search.button";
      goto LABEL_28;
    case 13:
      v5 = @"refresh.button";
      goto LABEL_28;
    case 14:
      v5 = @"stop.button";
      goto LABEL_28;
    case 15:
      v5 = @"camera.button";
      goto LABEL_28;
    case 16:
      v5 = @"garbage.toolbar.button.text";
      goto LABEL_28;
    case 17:
      v5 = @"play.button";
      goto LABEL_28;
    case 18:
      v5 = @"pause.button";
      goto LABEL_28;
    case 19:
      v5 = @"rewind.button";
      goto LABEL_28;
    case 20:
      v5 = @"fastforward.button";
      goto LABEL_28;
    case 24:
      v5 = @"close.button";
      goto LABEL_28;
    case 25:
      v5 = @"writingtools.button";
LABEL_28:
      id v4 = UIKitAccessibilityLocalizedString(v5);
      break;
    default:
      v5 = @"uibutton.navbar.back.button.title";
      switch(a3)
      {
        case 'e':
          goto LABEL_28;
        case 'f':
          v5 = @"uibutton.navbar.forward.button.title";
          goto LABEL_28;
        case 'g':
        case 'k':
          v5 = @"uibutton.table.previous.button.title";
          goto LABEL_28;
        case 'h':
        case 'l':
          v5 = @"uibutton.table.next.button.title";
          goto LABEL_28;
        case 'o':
          v5 = @"airtunes.text";
          goto LABEL_28;
        default:
          goto LABEL_29;
      }
  }
LABEL_29:
  return v4;
}

@end
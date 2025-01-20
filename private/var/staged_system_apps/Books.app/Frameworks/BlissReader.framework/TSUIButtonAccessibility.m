@interface TSUIButtonAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxAddDocumentButtonLabel;
+ (id)tsaxAdditionalButtonLabelsPerImageFileName;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxCanDismissAssociatedPopoverController;
- (BOOL)_tsaxDismissAssociatedPopoverControllerIfAppropriate;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)tsaxPreventPopoverAssociation;
- (TSKPopoverControllerAccessibility)tsaxAssociatedPopoverController;
- (id)__accessibilityLabel;
- (id)_tsaxAssociatedPopoverController;
- (id)accessibilityLabel;
- (void)tsaxSetAssociatedPopoverController:(id)a3;
- (void)tsaxSetPreventPopoverAssociation:(BOOL)a3;
@end

@implementation TSUIButtonAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIButton";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxPreventPopoverAssociation
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573870);
}

- (void)tsaxSetPreventPopoverAssociation:(BOOL)a3
{
}

- (TSKPopoverControllerAccessibility)tsaxAssociatedPopoverController
{
  return (TSKPopoverControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_573871);
}

- (void)tsaxSetAssociatedPopoverController:(id)a3
{
}

+ (id)tsaxAdditionalButtonLabelsPerImageFileName
{
  return 0;
}

+ (id)tsaxAddDocumentButtonLabel
{
  return 0;
}

- (id)__accessibilityLabel
{
  id v3 = [[self attributedTitleForState:0] string];
  if ([v3 length]) {
    return v3;
  }
  id v3 = [(TSUIButtonAccessibility *)self titleForState:0];
  if ([v3 length]) {
    return v3;
  }
  id v4 = [(TSUIButtonAccessibility *)self imageForState:0];
  if (!v4) {
    id v4 = [(TSUIButtonAccessibility *)self backgroundImageForState:0];
  }
  id v3 = [v4 accessibilityLabel];
  if ([v3 length]) {
    return v3;
  }
  if (!qword_573878)
  {
    id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "tsaxAdditionalButtonLabelsPerImageFileName"), "mutableCopy");
    qword_573878 = (uint64_t)v5;
    if (!v5)
    {
      id v5 = (id)objc_opt_new();
      qword_573878 = (uint64_t)v5;
    }
    [v5 setObject:TSAccessibilityLocalizedString(@"extras") forKey:@"TSA_NavigationBarExtrasIcon.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"preview.button") forKey:@"TSA_Preview_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"paragraph.align.justified") forKey:@"TSWP_align-H_justify_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"paragraph.align.left") forKey:@"TSWP_align-H_left_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"paragraph.align.center") forKey:@"TSWP_align-H_center_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"paragraph.align.right") forKey:@"TSWP_align-H_right_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"paragraph.align.natural") forKey:@"TSWP_align-H_natural_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"vertical.align.top") forKey:@"TSWP_align-V_top_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"vertical.align.middle") forKey:@"TSWP_align-V_middle_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"vertical.align.bottom") forKey:@"TSWP_align-V_bottom_N.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"bold") forKey:@"sf_inspector_style_bold.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"italic") forKey:@"sf_inspector_style_italic.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"underline") forKey:@"sf_inspector_style_underline.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"strikethrough") forKey:@"sf_inspector_style_strikethrough.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"gear.button") forKey:@"TSCH_Gear.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"gear.button") forKey:@"TSA_GearIcon.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"delete.button") forKey:@"DeleteGlyph.png"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"formula.input.key.delete") forKey:@"TSWPKeyboard_glyph_delete-N"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"formula.input.key.functionbrowser") forKey:@"TSWPKeyboard-Formula_glyph_fx-P"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"formula.input.key.operatortoggle") forKey:@"TSWPKeyboard-Formula_glyph_formula2-P"];
    [(id)qword_573878 setObject:TSAccessibilityLocalizedString(@"formula.input.key.date.duration") forKey:@"Keyboard-DateTime.png"];
  }
  id v6 = objc_msgSend(objc_msgSend(v4, "accessibilityIdentifier"), "lastPathComponent");
  id v3 = [(id)qword_573878 objectForKey:v6];
  if (v3) {
    return v3;
  }
  id v3 = [qword_573878 objectForKey:[v6 stringByAppendingPathExtension:@"png"]];
  if (v3) {
    return v3;
  }
  if ([v6 hasPrefix:@"TSA_Sync"])
  {
    CFStringRef v8 = @"sync.button";
  }
  else if ([v6 hasPrefix:@"TSA_Duplicate"])
  {
    CFStringRef v8 = @"duplicate.button";
  }
  else if ([v6 hasPrefix:@"TSA_Delete"])
  {
    CFStringRef v8 = @"delete.button";
  }
  else
  {
    if (![v6 hasPrefix:@"TSA_Action"])
    {
      if ([v6 hasPrefix:@"TSA_New"])
      {
        [(TSUIButtonAccessibility *)self superview];
        NSClassFromString(@"TSKToolbar");
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v3 = [(id)objc_opt_class() tsaxAddDocumentButtonLabel]) == 0)
        {
          CFStringRef v8 = @"new.button";
          goto LABEL_30;
        }
      }
      else
      {
        if ([v6 hasPrefix:@"TSA_GearIcon"])
        {
          CFStringRef v8 = @"gear.button";
          goto LABEL_30;
        }
        if (([v6 hasPrefix:@"kn_tb_icon_play"] & 1) != 0
          || [v6 hasPrefix:@"kn_tb_icon_extdisplay"])
        {
          CFStringRef v8 = @"preview.animation";
          goto LABEL_30;
        }
        v9.receiver = self;
        v9.super_class = (Class)TSUIButtonAccessibility;
        return [(TSUIButtonAccessibility *)&v9 accessibilityLabel];
      }
      return v3;
    }
    CFStringRef v8 = @"action.button";
  }
LABEL_30:

  return TSAccessibilityLocalizedString((uint64_t)v8);
}

- (id)accessibilityLabel
{
  id v3 = [(TSUIButtonAccessibility *)self accessibilityUserDefinedLabel];
  if ([v3 length]) {
    return v3;
  }
  id v3 = [(TSUIButtonAccessibility *)self __accessibilityLabel];
  if (![(TSUIButtonAccessibility *)self _tsaxCanDismissAssociatedPopoverController])return v3; {
  else
  }
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"dismiss.popover.button.label.format %@"), v3];
}

- (BOOL)accessibilityActivate
{
  if ([(TSUIButtonAccessibility *)self _tsaxDismissAssociatedPopoverControllerIfAppropriate])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIButtonAccessibility;
  return [(TSUIButtonAccessibility *)&v4 accessibilityActivate];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(TSUIButtonAccessibility *)self _tsaxDismissAssociatedPopoverControllerIfAppropriate])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIButtonAccessibility;
  return [(TSUIButtonAccessibility *)&v4 accessibilityPerformEscape];
}

- (id)_tsaxAssociatedPopoverController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSUIButtonAccessibility *)self tsaxAssociatedPopoverController], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)_tsaxDismissAssociatedPopoverControllerIfAppropriate
{
  id v2 = [(TSUIButtonAccessibility *)self _tsaxAssociatedPopoverController];
  char v3 = objc_opt_respondsToSelector();
  if (v3) {
    [v2 dismissPopoverAnimated:1];
  }
  return v3 & 1;
}

- (BOOL)_tsaxCanDismissAssociatedPopoverController
{
  id v2 = [(TSUIButtonAccessibility *)self _tsaxAssociatedPopoverController];
  if (!v2) {
    return 0;
  }
  unsigned __int8 v3 = [v2 tsaxIsPopoverVisible];
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v3 & 1) == 0)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      unsigned __int8 v3 = 0;
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"_tsaxAssociatedPopoverController should be cleared when the popover goes away", v5, v6, v7, v8, v9, v11))abort(); {
    }
      }
  }
  return v3;
}

@end
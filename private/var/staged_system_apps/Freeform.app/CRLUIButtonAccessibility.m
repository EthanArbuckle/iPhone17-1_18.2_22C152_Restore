@interface CRLUIButtonAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxAddDocumentButtonLabel;
+ (id)crlaxAdditionalButtonLabelsPerImageFileName;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxPreventPopoverAssociation;
- (id)__accessibilityLabel;
- (id)crlaxAssociatedPopoverController;
- (void)crlaxSetAssociatedPopoverController:(id)a3;
- (void)crlaxSetPreventPopoverAssociation:(BOOL)a3;
@end

@implementation CRLUIButtonAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIButton";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)crlaxPreventPopoverAssociation
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9800);
}

- (void)crlaxSetPreventPopoverAssociation:(BOOL)a3
{
}

- (id)crlaxAssociatedPopoverController
{
  return __CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A9801);
}

- (void)crlaxSetAssociatedPopoverController:(id)a3
{
}

+ (id)crlaxAdditionalButtonLabelsPerImageFileName
{
  return 0;
}

+ (id)crlaxAddDocumentButtonLabel
{
  return 0;
}

- (id)__accessibilityLabel
{
  id v3 = [(CRLUIButtonAccessibility *)self imageForState:0];
  if (!v3)
  {
    id v3 = [(CRLUIButtonAccessibility *)self backgroundImageForState:0];
  }
  v4 = [v3 accessibilityLabel];
  if ([v4 length])
  {
    id v5 = v4;
    goto LABEL_31;
  }
  if (!qword_1016A9808)
  {
    v6 = [(id)objc_opt_class() crlaxAdditionalButtonLabelsPerImageFileName];
    id v7 = [v6 mutableCopy];
    v8 = (void *)qword_1016A9808;
    qword_1016A9808 = (uint64_t)v7;

    v9 = (void *)qword_1016A9808;
    if (!qword_1016A9808)
    {
      uint64_t v10 = objc_opt_new();
      v11 = (void *)qword_1016A9808;
      qword_1016A9808 = v10;

      v9 = (void *)qword_1016A9808;
    }
    v12 = CRLAccessibilityLocalizedString(@"extras");
    [v9 setObject:v12 forKey:@"CRL_NavigationBarExtrasIcon.png"];

    v13 = (void *)qword_1016A9808;
    v14 = CRLAccessibilityLocalizedString(@"preview.button");
    [v13 setObject:v14 forKey:@"CRL_Preview_N.png"];

    v15 = (void *)qword_1016A9808;
    v16 = CRLAccessibilityLocalizedString(@"paragraph.align.justified");
    [v15 setObject:v16 forKey:@"TSWP_align-H_justify_N.png"];

    v17 = (void *)qword_1016A9808;
    v18 = CRLAccessibilityLocalizedString(@"paragraph.align.left");
    [v17 setObject:v18 forKey:@"TSWP_align-H_left_N.png"];

    v19 = (void *)qword_1016A9808;
    v20 = CRLAccessibilityLocalizedString(@"paragraph.align.center");
    [v19 setObject:v20 forKey:@"TSWP_align-H_center_N.png"];

    v21 = (void *)qword_1016A9808;
    v22 = CRLAccessibilityLocalizedString(@"paragraph.align.right");
    [v21 setObject:v22 forKey:@"TSWP_align-H_right_N.png"];

    v23 = (void *)qword_1016A9808;
    v24 = CRLAccessibilityLocalizedString(@"paragraph.align.natural");
    [v23 setObject:v24 forKey:@"TSWP_align-H_natural_N.png"];

    v25 = (void *)qword_1016A9808;
    v26 = CRLAccessibilityLocalizedString(@"vertical.align.top");
    [v25 setObject:v26 forKey:@"TSWP_align-V_top_N.png"];

    v27 = (void *)qword_1016A9808;
    v28 = CRLAccessibilityLocalizedString(@"vertical.align.middle");
    [v27 setObject:v28 forKey:@"TSWP_align-V_middle_N.png"];

    v29 = (void *)qword_1016A9808;
    v30 = CRLAccessibilityLocalizedString(@"vertical.align.bottom");
    [v29 setObject:v30 forKey:@"TSWP_align-V_bottom_N.png"];

    v31 = (void *)qword_1016A9808;
    v32 = CRLAccessibilityLocalizedString(@"bold");
    [v31 setObject:v32 forKey:@"sf_inspector_style_bold.png"];

    v33 = (void *)qword_1016A9808;
    v34 = CRLAccessibilityLocalizedString(@"italic");
    [v33 setObject:v34 forKey:@"sf_inspector_style_italic.png"];

    v35 = (void *)qword_1016A9808;
    v36 = CRLAccessibilityLocalizedString(@"underline");
    [v35 setObject:v36 forKey:@"sf_inspector_style_underline.png"];

    v37 = (void *)qword_1016A9808;
    v38 = CRLAccessibilityLocalizedString(@"strikethrough");
    [v37 setObject:v38 forKey:@"sf_inspector_style_strikethrough.png"];

    v39 = (void *)qword_1016A9808;
    v40 = CRLAccessibilityLocalizedString(@"gear.button");
    [v39 setObject:v40 forKey:@"CRL_GearIcon.png"];

    v41 = (void *)qword_1016A9808;
    v42 = CRLAccessibilityLocalizedString(@"delete.button");
    [v41 setObject:v42 forKey:@"DeleteGlyph.png"];

    v43 = (void *)qword_1016A9808;
    v44 = CRLAccessibilityLocalizedString(@"formula.input.key.delete");
    [v43 setObject:v44 forKey:@"Keyboard_glyph_delete-N"];

    v45 = (void *)qword_1016A9808;
    v46 = CRLAccessibilityLocalizedString(@"formula.input.key.functionbrowser");
    [v45 setObject:v46 forKey:@"Keyboard-Formula_glyph_fx-P"];

    v47 = (void *)qword_1016A9808;
    v48 = CRLAccessibilityLocalizedString(@"formula.input.key.operatortoggle");
    [v47 setObject:v48 forKey:@"Keyboard-Formula_glyph_formula2-P"];

    v49 = (void *)qword_1016A9808;
    v50 = CRLAccessibilityLocalizedString(@"formula.input.key.date.duration");
    [v49 setObject:v50 forKey:@"Keyboard-DateTime.png"];
  }
  v51 = [v3 accessibilityIdentifier];
  v52 = [v51 lastPathComponent];

  id v5 = [(id)qword_1016A9808 objectForKey:v52];
  if (!v5)
  {
    v53 = (void *)qword_1016A9808;
    v54 = [v52 stringByAppendingPathExtension:@"png"];
    id v5 = [v53 objectForKey:v54];

    if (!v5)
    {
      if ([v52 hasPrefix:@"CRL_Sync"])
      {
        v55 = @"sync.button";
      }
      else if ([v52 hasPrefix:@"CRL_Duplicate"])
      {
        v55 = @"duplicate.button";
      }
      else if ([v52 hasPrefix:@"CRL_Delete"])
      {
        v55 = @"delete.button";
      }
      else if ([v52 hasPrefix:@"CRL_Action"])
      {
        v55 = @"action.button";
      }
      else if ([v52 hasPrefix:@"CRL_New"])
      {
        v56 = [(CRLUIButtonAccessibility *)self superview];
        NSClassFromString(@"CRLToolbar");
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v5 = [(id)objc_opt_class() crlaxAddDocumentButtonLabel];
          if (v5) {
            goto LABEL_30;
          }
        }
        v55 = @"new.button";
      }
      else if ([v52 hasPrefix:@"CRL_GearIcon"])
      {
        v55 = @"gear.button";
      }
      else
      {
        if (([v52 hasPrefix:@"kn_tb_icon_play"] & 1) == 0
          && ![v52 hasPrefix:@"kn_tb_icon_extdisplay"])
        {
          v60.receiver = self;
          v60.super_class = (Class)CRLUIButtonAccessibility;
          uint64_t v58 = [(CRLUIButtonAccessibility *)&v60 accessibilityLabel];
          goto LABEL_29;
        }
        v55 = @"preview.animation";
      }
      uint64_t v58 = CRLAccessibilityLocalizedString(v55);
LABEL_29:
      id v5 = (id)v58;
    }
  }
LABEL_30:

LABEL_31:

  return v5;
}

@end
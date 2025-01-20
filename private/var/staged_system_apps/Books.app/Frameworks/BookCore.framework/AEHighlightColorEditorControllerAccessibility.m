@interface AEHighlightColorEditorControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)_imaxAddNoteButton;
- (id)_imaxColorControls;
- (id)_imaxDeleteButton;
- (id)_imaxRightArrowButton;
- (id)_imaxShareButton;
- (void)_axClearReferencesToSelfInButtons;
- (void)_axEnumerateButtonsUsingBlock:(id)a3;
- (void)dealloc;
- (void)didShow;
- (void)p_updateAppearance;
- (void)releaseOutlets;
- (void)showColorControlsMenu:(id)a3;
- (void)viewDidLoad;
@end

@implementation AEHighlightColorEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AEHighlightColorEditorController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_axEnumerateButtonsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, id, unsigned char *))a3;
  v5 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxColorControls];
  v6 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxAddNoteButton];
  v7 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxDeleteButton];
  v8 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxShareButton];
  v9 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxRightArrowButton];
  unsigned __int8 v33 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = v9;
    v26 = v8;
    v27 = v7;
    v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v30;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        v16 = [v15 imaxValueForKey:@"tag" v25, v26, v27, v28, (void)v29];
        v4[2](v4, v15, [v16 unsignedIntegerValue], &v33);

        if (v33) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v7 = v27;
    v6 = v28;
    v9 = v25;
    v8 = v26;
  }
  id v17 = v6;
  v34[0] = v17;
  id v18 = v7;
  v34[1] = v18;
  id v19 = v8;
  v34[2] = v19;
  id v20 = v9;
  v34[3] = v20;
  if (!v33)
  {
    unint64_t v21 = 0;
    do
    {
      v22 = (void *)v34[v21];
      if (v22)
      {
        v4[2](v4, v22, 0, &v33);
        int v23 = v33;
      }
      else
      {
        int v23 = 0;
      }
      if (v21 > 2) {
        break;
      }
      ++v21;
    }
    while (!v23);
  }
  for (uint64_t i = 3; i != -1; --i)
}

- (void)_axClearReferencesToSelfInButtons
{
}

- (void)dealloc
{
  [(AEHighlightColorEditorControllerAccessibility *)self _axClearReferencesToSelfInButtons];
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v3 dealloc];
}

- (void)releaseOutlets
{
  [(AEHighlightColorEditorControllerAccessibility *)self _axClearReferencesToSelfInButtons];
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v3 releaseOutlets];
}

- (void)showColorControlsMenu:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v8 showColorControlsMenu:a3];
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"colorControls"];
  v5 = [v4 imaxValueForKey:@"subviews"];

  if ([v5 count])
  {
    UIAccessibilityNotifications v6 = IMAccessibilityMoveToElementNotification;
    v7 = [v5 objectAtIndex:0];
    UIAccessibilityPostNotification(v6, v7);
  }
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v27 viewDidLoad];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_85FF8;
  v26[3] = &unk_2C7208;
  v26[4] = self;
  [(AEHighlightColorEditorControllerAccessibility *)self _axEnumerateButtonsUsingBlock:v26];
  objc_super v3 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"calloutBar"];
  v4 = [v3 imaxValueForKey:@"controls"];

  if ([(AEHighlightColorEditorControllerAccessibility *)self imaxBoolValueForKey:@"p_shouldShowCompactMenu"])
  {
    char v25 = 0;
    v5 = (objc_class *)objc_opt_class();
    UIAccessibilityNotifications v6 = [v4 objectAtIndex:0];
    v7 = __IMAccessibilityCastAsClass(v5, v6, 1, &v25);

    if (v25) {
      abort();
    }
    objc_super v8 = IMAXLocString(@"highlight.colors");
    [v7 setAccessibilityLabel:v8];

    [v7 setIsAccessibilityElement:1];
    [v7 setAccessibilityTraits:IMAccessibilityTraitMenuItem];
  }
  v9 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"annotation"];
  id v10 = [v9 imaxValueForKey:@"annotationNote"];
  id v11 = [v10 length];

  if (v11) {
    id v12 = @"edit.annotation";
  }
  else {
    id v12 = @"create.annotation";
  }
  uint64_t v13 = IMAXLocString(v12);
  uint64_t v14 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxAddNoteButton];
  [v14 setAccessibilityLabel:v13];

  uint64_t v15 = IMAccessibilityTraitMenuItem;
  v16 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxAddNoteButton];
  [v16 setAccessibilityTraits:v15];

  id v17 = IMAXLocString(@"delete.annotation");
  id v18 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxDeleteButton];
  [v18 setAccessibilityLabel:v17];

  uint64_t v19 = IMAccessibilityTraitMenuItem;
  id v20 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxDeleteButton];
  [v20 setAccessibilityTraits:v19];

  unint64_t v21 = IMAXLocString(@"show.next.items.menu.button");
  v22 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxRightArrowButton];
  [v22 setAccessibilityLabel:v21];

  uint64_t v23 = IMAccessibilityTraitMenuItem;
  v24 = [(AEHighlightColorEditorControllerAccessibility *)self _imaxRightArrowButton];
  [v24 setAccessibilityTraits:v23];
}

- (void)didShow
{
  v17.receiver = self;
  v17.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v17 didShow];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_8622C;
  uint64_t v15 = sub_8623C;
  id v16 = 0;
  uint64_t v5 = 0;
  UIAccessibilityNotifications v6 = (id *)&v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = sub_8622C;
  v9 = sub_8623C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_86244;
  v4[3] = &unk_2C7230;
  v4[4] = &v11;
  v4[5] = &v5;
  [(AEHighlightColorEditorControllerAccessibility *)self _axEnumerateButtonsUsingBlock:v4];
  id v3 = v6[5];
  if (!v3)
  {
    objc_storeStrong(v6 + 5, (id)v12[5]);
    id v3 = v6[5];
  }
  UIAccessibilityPostNotification(IMAccessibilityMoveToElementNotification, v3);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

- (void)p_updateAppearance
{
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightColorEditorControllerAccessibility;
  [(AEHighlightColorEditorControllerAccessibility *)&v3 p_updateAppearance];
  [(AEHighlightColorEditorControllerAccessibility *)self _axEnumerateButtonsUsingBlock:&stru_2C7250];
}

- (id)_imaxColorControls
{
  char v7 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"colorControls"];
  uint64_t v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return v5;
}

- (id)_imaxAddNoteButton
{
  char v7 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"addNoteButton"];
  uint64_t v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return v5;
}

- (id)_imaxDeleteButton
{
  char v7 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"deleteButton"];
  uint64_t v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return v5;
}

- (id)_imaxShareButton
{
  char v7 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"shareButton"];
  uint64_t v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return v5;
}

- (id)_imaxRightArrowButton
{
  char v7 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = [(AEHighlightColorEditorControllerAccessibility *)self imaxValueForKey:@"rightArrowButton"];
  uint64_t v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return v5;
}

@end
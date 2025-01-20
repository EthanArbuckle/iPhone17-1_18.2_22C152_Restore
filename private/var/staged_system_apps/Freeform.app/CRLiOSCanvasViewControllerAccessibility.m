@interface CRLiOSCanvasViewControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxIsEditMenuAllowedToAppear;
- (BOOL)_crlaxIsInEyeDropperMode;
- (BOOL)accessibilityPerformEscape;
- (BOOL)crlaxIsInEyeDropperMode;
- (CRLCanvasInteractiveCanvasControllerAccessibility)_crlaxInteractiveCanvasController;
- (NSArray)crlaxEditMenuItems;
- (SEL)crlaxSelectorForEditMenuItemName:(id)a3;
- (id)accessibilityCustomActions;
- (id)crlaxBasicEditMenuItemNames;
- (id)crlaxWindow;
- (void)_crlaxSetIsInEyeDropperMode:(BOOL)a3;
- (void)crlaxCancelEyeDropperMode;
- (void)crlaxEnterQuickSelect;
- (void)showEditMenuForSelectionPath:(id)a3;
@end

@implementation CRLiOSCanvasViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLiOSCanvasViewController";
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

- (BOOL)_crlaxIsInEyeDropperMode
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A8DDB);
}

- (void)_crlaxSetIsInEyeDropperMode:(BOOL)a3
{
}

- (BOOL)crlaxIsInEyeDropperMode
{
  return [(CRLiOSCanvasViewControllerAccessibility *)self _crlaxIsInEyeDropperMode];
}

- (void)crlaxCancelEyeDropperMode
{
  if ([(CRLiOSCanvasViewControllerAccessibility *)self crlaxIsInEyeDropperMode])
  {
    id v4 = +[NSBundle mainBundle];
    id v3 = [v4 localizedStringForKey:@"Eye dropper mode canceled" value:0 table:0];
    CRLAccessibilityPostHighPriorityAnnouncementNotification(self, v3);
  }
}

- (NSArray)crlaxEditMenuItems
{
  if ([(CRLiOSCanvasViewControllerAccessibility *)self _crlaxIsEditMenuAllowedToAppear])
  {
    id v3 = [(CRLiOSCanvasViewControllerAccessibility *)self _crlaxInteractiveCanvasController];
    id v4 = [v3 crlaxEditorController];
    v5 = [v4 crlaxSelectionPath];

    if (v5)
    {
      v6 = +[NSMutableArray array];
      v7 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxBasicEditMenuItemNames];
      [v6 addObjectsFromArray:v7];

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001F988;
      v11[3] = &unk_1014CBE50;
      v11[4] = self;
      id v8 = v6;
      id v12 = v8;
      id v13 = v5;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
        abort();
      }

      if ([v8 count]) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (id)crlaxWindow
{
  v2 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 view];
  id v4 = [v3 window];

  return v4;
}

- (void)showEditMenuForSelectionPath:(id)a3
{
  id v4 = a3;
  v5 = +[UIMenuController sharedMenuController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FAB4;
  v7[3] = &unk_1014CBE78;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 crlaxPerformBlockPreventingMakingVisible:v7];
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  unsigned int v4 = [v3 isCurrentlyInQuickSelectMode];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  [(id)v5 leaveQuickSelectModeIfNeeded];

  id v6 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  LOBYTE(v5) = [v6 isCurrentlyInQuickSelectMode];

  return v5 ^ 1;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)_crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 interactiveCanvasController];

  unsigned int v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = (void *)v5;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v6;
}

- (id)crlaxBasicEditMenuItemNames
{
  v2 = +[NSMutableArray array];
  id v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"Cut" value:0 table:0];
  [v2 addObject:v4];

  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Copy" value:0 table:0];
  [v2 addObject:v6];

  v7 = +[NSBundle mainBundle];
  char v8 = [v7 localizedStringForKey:@"Paste" value:0 table:0];
  [v2 addObject:v8];

  id v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Delete" value:0 table:0];
  [v2 addObject:v10];

  v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"Duplicate" value:0 table:0];
  [v2 addObject:v12];

  id v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Lock" value:0 table:0];
  [v2 addObject:v14];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Unlock" value:0 table:0];
  [v2 addObject:v16];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Back" value:0 table:0];
  [v2 addObject:v18];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Front" value:0 table:0];
  [v2 addObject:v20];

  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Select" value:0 table:0];
  [v2 addObject:v22];

  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"Select All" value:0 table:0];
  [v2 addObject:v24];

  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"Deselect All" value:0 table:0];
  [v2 addObject:v26];

  id v27 = [v2 copy];

  return v27;
}

- (SEL)crlaxSelectorForEditMenuItemName:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Cut" value:0 table:0];
  unsigned int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    v7 = "cut:";
  }
  else
  {
    char v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Copy" value:0 table:0];
    unsigned int v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      v7 = "copy:";
    }
    else
    {
      v11 = +[NSBundle mainBundle];
      id v12 = [v11 localizedStringForKey:@"Paste" value:0 table:0];
      unsigned int v13 = [v3 isEqualToString:v12];

      if (v13)
      {
        v7 = "paste:";
      }
      else
      {
        v14 = +[NSBundle mainBundle];
        v15 = [v14 localizedStringForKey:@"Delete" value:0 table:0];
        unsigned int v16 = [v3 isEqualToString:v15];

        if (v16)
        {
          v7 = "delete:";
        }
        else
        {
          v17 = +[NSBundle mainBundle];
          v18 = [v17 localizedStringForKey:@"Duplicate" value:0 table:0];
          unsigned int v19 = [v3 isEqualToString:v18];

          if (v19)
          {
            v7 = "duplicate:";
          }
          else
          {
            v20 = +[NSBundle mainBundle];
            v21 = [v20 localizedStringForKey:@"Lock" value:0 table:0];
            unsigned int v22 = [v3 isEqualToString:v21];

            if (v22)
            {
              v7 = "lock:";
            }
            else
            {
              v23 = +[NSBundle mainBundle];
              v24 = [v23 localizedStringForKey:@"Unlock" value:0 table:0];
              unsigned int v25 = [v3 isEqualToString:v24];

              if (v25)
              {
                v7 = "unlock:";
              }
              else
              {
                v26 = +[NSBundle mainBundle];
                id v27 = [v26 localizedStringForKey:@"Back" value:0 table:0];
                unsigned int v28 = [v3 isEqualToString:v27];

                if (v28)
                {
                  v7 = "sendToBack:";
                }
                else
                {
                  v29 = +[NSBundle mainBundle];
                  v30 = [v29 localizedStringForKey:@"Front" value:0 table:0];
                  unsigned int v31 = [v3 isEqualToString:v30];

                  if (v31)
                  {
                    v7 = "bringToFront:";
                  }
                  else
                  {
                    v32 = +[NSBundle mainBundle];
                    v33 = [v32 localizedStringForKey:@"Select" value:0 table:0];
                    unsigned int v34 = [v3 isEqualToString:v33];

                    if (v34)
                    {
                      v7 = "select:";
                    }
                    else
                    {
                      v35 = +[NSBundle mainBundle];
                      v36 = [v35 localizedStringForKey:@"Select All" value:0 table:0];
                      unsigned int v37 = [v3 isEqualToString:v36];

                      if (v37)
                      {
                        v7 = "selectAll:";
                      }
                      else
                      {
                        v38 = +[NSBundle mainBundle];
                        v39 = [v38 localizedStringForKey:@"Deselect All" value:0 table:0];
                        unsigned int v40 = [v3 isEqualToString:v39];

                        if (v40) {
                          v7 = "deselectAll:";
                        }
                        else {
                          v7 = 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)accessibilityCustomActions
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithArray:&__NSArray0__struct];
  id v4 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  if ([v4 allowedToEnterQuickSelectMode])
  {
    uint64_t v5 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
    unsigned __int8 v6 = [v5 isCurrentlyInQuickSelectMode];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    char v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Select Objects" value:0 table:0];
    id v4 = [v7 initWithName:v9 image:0 target:self selector:"crlaxEnterQuickSelect"];

    [v3 addObject:v4];
  }

LABEL_5:

  return v3;
}

- (void)crlaxEnterQuickSelect
{
  id v2 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  [v2 enterQuickSelectMode];
}

- (BOOL)_crlaxIsEditMenuAllowedToAppear
{
  id v2 = [(CRLiOSCanvasViewControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 delegate];

  NSSelectorFromString(@"allowEditMenuToAppear");
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 crlaxBoolValueForKey:@"allowEditMenuToAppear"];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

@end
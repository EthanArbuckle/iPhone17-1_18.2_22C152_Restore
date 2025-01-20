@interface _SBHStackConfigurationIconView
+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3;
- (BOOL)_cannotRemoveLastWidgetInWidgetSheet;
- (BOOL)shouldShowCloseBox;
- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures;
- (id)_iconListView;
- (id)_stackConfigurationViewController;
- (unint64_t)customIconImageViewControllerPriority;
- (void)_updateCloseBoxForAllIconsInListView:(id)a3 animated:(BOOL)a4;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
@end

@implementation _SBHStackConfigurationIconView

+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
  {
    v5 = 0;
  }
  else if (((1 << a3) & 0x4D) != 0)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____SBHStackConfigurationIconView;
    objc_msgSendSuper2(&v7, sel_groupNameBaseForComponentBackgroundViewOfType_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (((1 << a3) & 0x22) != 0) {
      v5 = @"SBHStackConfigurationCloseBox";
    }
    else {
      v5 = @"SBHStackConfigurationWidget";
    }
  }
  return v5;
}

- (unint64_t)customIconImageViewControllerPriority
{
  return 1;
}

- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures
{
  return 0;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v5 = a3;
  if (-[_SBHStackConfigurationIconView _cannotRemoveLastWidgetInWidgetSheet](self, "_cannotRemoveLastWidgetInWidgetSheet")&& [v5 numberOfDisplayedIconViews] == 2)
  {
    [(_SBHStackConfigurationIconView *)self _updateCloseBoxForAllIconsInListView:v5 animated:1];
  }
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5 = a3;
  if (-[_SBHStackConfigurationIconView _cannotRemoveLastWidgetInWidgetSheet](self, "_cannotRemoveLastWidgetInWidgetSheet")&& [v5 numberOfDisplayedIconViews] == 1)
  {
    [(_SBHStackConfigurationIconView *)self _updateCloseBoxForAllIconsInListView:v5 animated:1];
  }
}

- (BOOL)shouldShowCloseBox
{
  v13.receiver = self;
  v13.super_class = (Class)_SBHStackConfigurationIconView;
  BOOL v3 = [(SBIconView *)&v13 shouldShowCloseBox];
  uint64_t v4 = [(_SBHStackConfigurationIconView *)self _iconListView];
  id v5 = [v4 model];
  BOOL v6 = v3;
  if ([v5 numberOfIcons] == 1)
  {
    objc_super v7 = [(_SBHStackConfigurationIconView *)self _iconListView];
    uint64_t v8 = [v7 model];
    uint64_t v9 = [v8 firstIcon];
    v10 = [(SBIconView *)self icon];
    char v11 = [v9 isEqual:v10];

    BOOL v6 = v3 & ~v11;
  }

  if ([(_SBHStackConfigurationIconView *)self _cannotRemoveLastWidgetInWidgetSheet])
  {
    return v6;
  }
  else
  {
    return v3;
  }
}

- (id)_stackConfigurationViewController
{
  v2 = [(SBIconView *)self delegate];
  BOOL v3 = self;
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_iconListView
{
  v2 = [(_SBHStackConfigurationIconView *)self _stackConfigurationViewController];
  BOOL v3 = [v2 iconListView];

  return v3;
}

- (BOOL)_cannotRemoveLastWidgetInWidgetSheet
{
  v2 = [(_SBHStackConfigurationIconView *)self _stackConfigurationViewController];
  BOOL v3 = [v2 presenter];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 cannotRemoveLastWidgetInWidgetSheet];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_updateCloseBoxForAllIconsInListView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v5, "icons", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = [v5 displayedIconViewForIcon:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [v11 _updateCloseBoxAnimated:v4];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

@end
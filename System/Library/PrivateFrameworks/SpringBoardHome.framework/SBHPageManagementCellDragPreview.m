@interface SBHPageManagementCellDragPreview
+ (id)_pageManagementCellViewForIconImageViewController:(id)a3;
- (BOOL)hasCleanedUp;
- (BOOL)iconAllowsAccessory;
- (BOOL)iconAllowsLabelArea;
- (BOOL)iconCanShowCloseBox;
- (BOOL)iconIsEditing;
- (BOOL)isDelayingCleanup;
- (BOOL)isFlocked;
- (SBHPageManagementCellDragPreview)initWithReferenceIconView:(id)a3;
- (SBIcon)icon;
- (SBIconView)iconView;
- (SBIconView)referenceIconView;
- (SBIconViewCustomImageViewControlling)customIconImageViewController;
- (double)iconContentScale;
- (id)_pageManagementCellView;
- (id)cleanUpHandler;
- (id)delayCleanUpForReason:(id)a3;
- (unint64_t)dragState;
- (void)_configureIconViewWithReferenceIconView:(id)a3;
- (void)_removeDelayCleanupAssertion:(id)a3;
- (void)cleanUp;
- (void)draggingSourceDroppedWithOperation:(unint64_t)a3;
- (void)dropDestinationAnimationCompleted;
- (void)handleCleanup;
- (void)setCleanUpHandler:(id)a3;
- (void)setCleanedUp:(BOOL)a3;
- (void)setCustomIconImageViewController:(id)a3;
- (void)setDelayingCleanup:(BOOL)a3;
- (void)setDragState:(unint64_t)a3;
- (void)setFlocked:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconAllowsAccessory:(BOOL)a3;
- (void)setIconAllowsLabelArea:(BOOL)a3;
- (void)setIconCanShowCloseBox:(BOOL)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconIsEditing:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIconViewCustomIconImageViewController:(id)a3;
- (void)setReferenceIconView:(id)a3;
@end

@implementation SBHPageManagementCellDragPreview

- (SBHPageManagementCellDragPreview)initWithReferenceIconView:(id)a3
{
  id v5 = a3;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v5 iconImageInfo];
  v13.receiver = self;
  v13.super_class = (Class)SBHPageManagementCellDragPreview;
  v10 = -[SBHPageManagementCellDragPreview initWithFrame:](&v13, sel_initWithFrame_, v6, v7, v8, v9);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_referenceIconView, a3);
  }

  return v11;
}

- (id)_pageManagementCellView
{
  v2 = [(SBIconView *)self->_iconView customIconImageViewController];
  v3 = [(id)objc_opt_class() _pageManagementCellViewForIconImageViewController:v2];

  return v3;
}

+ (id)_pageManagementCellViewForIconImageViewController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  double v8 = [v7 pageManagementCellView];

  return v8;
}

- (void)_configureIconViewWithReferenceIconView:(id)a3
{
  id v4 = a3;
  id v5 = (SBIconView *)[objc_alloc((Class)objc_opt_class()) initWithConfigurationOptions:4];
  [(SBIconView *)v5 setCustomIconImageViewControllerPriority:3];
  id v12 = [(SBHPageManagementCellDragPreview *)self customIconImageViewController];
  double v6 = [(id)objc_opt_class() _pageManagementCellViewForIconImageViewController:v12];
  id v7 = [v6 listView];
  [v7 ignoreNextWindowChange];

  [(SBIconView *)v5 setOverrideCustomIconImageViewController:v12];
  [v4 configureMatchingIconView:v5];
  -[SBIconView setEditing:](v5, "setEditing:", [v4 isEditing]);
  double v8 = [v4 accessibilityTintColor];

  [(SBIconView *)v5 setAccessibilityTintColor:v8];
  [(SBIconView *)v5 setAllowsEditingAnimation:0];
  [(SBIconView *)v5 setIconContentScalingEnabled:1];
  [(SBHPageManagementCellDragPreview *)self bounds];
  -[SBIconView setFrame:](v5, "setFrame:");
  [(SBIconView *)v5 setIconContentScale:1.1];
  iconView = self->_iconView;
  self->_iconView = v5;
  v10 = v5;

  [(SBHPageManagementCellDragPreview *)self addSubview:v10];
  [v6 setListHighlighted:1];
  v11 = [v6 listView];
  [v11 enumerateIconViewsUsingBlock:&__block_literal_global_41];
}

void __76__SBHPageManagementCellDragPreview__configureIconViewWithReferenceIconView___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 customIconImageViewController];
  if (v2)
  {
    id v7 = v2;
    uint64_t v3 = objc_opt_class();
    id v4 = v7;
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

    [v6 setWantsEditingDisplayStyle:1 animated:0];
    v2 = v7;
  }
}

- (BOOL)iconCanShowCloseBox
{
  return 1;
}

- (SBIcon)icon
{
  return [(SBIconView *)self->_iconView icon];
}

- (void)setIcon:(id)a3
{
}

- (void)setDragState:(unint64_t)a3
{
  if (self->_dragState == a3) {
    return;
  }
  self->_dragState = a3;
  if (a3 < 2 || self->_iconView) {
    goto LABEL_6;
  }
  if (self->_referenceIconView)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__SBHPageManagementCellDragPreview_setDragState___block_invoke;
    v19[3] = &unk_1E6AAC810;
    v19[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v19];
    referenceIconView = self->_referenceIconView;
    self->_referenceIconView = 0;

LABEL_6:
    id v6 = [(SBHPageManagementCellDragPreview *)self _pageManagementCellView];
    id v7 = v6;
    if (a3 == 2)
    {
      double v8 = [v6 layer];
      LODWORD(v9) = *(_DWORD *)"fff>";
      [v8 setShadowOpacity:v9];

      v10 = [v7 layer];
      [v10 setShadowRadius:14.0];

      v11 = [v7 layer];
      objc_msgSend(v11, "setShadowOffset:", 0.0, 10.0);

      [(SBIconView *)self->_iconView setAllowsCloseBox:0];
    }
    else if (a3 - 3 <= 1)
    {
      [(SBIconView *)self->_iconView setIconContentScale:1.0];
      [v7 setListHighlighted:0];
      id v12 = [v7 layer];
      [v12 setShadowOpacity:0.0];

      objc_super v13 = [v7 layer];
      [v13 setShadowRadius:0.0];

      v14 = [v7 layer];
      objc_msgSend(v14, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

      v15 = [v7 listView];
      v16 = [v15 model];
      if ([v16 isHidden]) {
        [(SBIconView *)self->_iconView setAllowsCloseBox:1];
      }
    }
    [(SBHPageManagementCellDragPreview *)self setNeedsLayout];
    [(SBHPageManagementCellDragPreview *)self layoutIfNeeded];

    return;
  }
  v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_referenceIconView != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBHPageManagementCellDragPreview *)a2 setDragState:(uint64_t)v18];
  }
  [v18 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __49__SBHPageManagementCellDragPreview_setDragState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 448) customIconImageViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 448) customIconImageViewController];
    [v4 setShowingContextMenu:0];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[56];
  return [v5 _configureIconViewWithReferenceIconView:v6];
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  if ([(NSHashTable *)self->_cleanupDelayAssertions count])
  {
    [(SBHPageManagementCellDragPreview *)self setDelayingCleanup:1];
  }
  else
  {
    [(SBHPageManagementCellDragPreview *)self handleCleanup];
  }
}

- (void)cleanUp
{
  if (![(SBHPageManagementCellDragPreview *)self hasCleanedUp])
  {
    [(SBHPageManagementCellDragPreview *)self handleCleanup];
  }
}

- (void)handleCleanup
{
  [(SBHPageManagementCellDragPreview *)self setCleanedUp:1];
  uint64_t v6 = [(SBHPageManagementCellDragPreview *)self cleanUpHandler];
  if (v6)
  {
    char v3 = [(SBHPageManagementCellDragPreview *)self customIconImageViewController];
    id v4 = [(id)objc_opt_class() _pageManagementCellViewForIconImageViewController:v3];
    id v5 = [v4 listView];
    [v5 ignoreNextWindowChange];

    [(SBHPageManagementCellDragPreview *)self setCleanUpHandler:0];
    v6[2](v6, self);
  }
}

- (void)dropDestinationAnimationCompleted
{
  char v3 = [(SBHPageManagementCellDragPreview *)self iconView];
  [v3 setIcon:0];

  id v4 = [(SBHPageManagementCellDragPreview *)self iconView];
  [v4 setDelegate:0];
}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  id v4 = a3;
  [(SBHPageManagementCellDragPreview *)self setCustomIconImageViewController:v4];
  id v5 = [(SBHPageManagementCellDragPreview *)self iconView];
  [v5 setOverrideCustomIconImageViewController:v4];
}

- (id)delayCleanUpForReason:(id)a3
{
  id v4 = a3;
  if (!self->_cleanupDelayAssertions)
  {
    id v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cleanupDelayAssertions = self->_cleanupDelayAssertions;
    self->_cleanupDelayAssertions = v5;
  }
  id v7 = [[SBHPageManagementCellDragPreviewDelayCleanupAssertion alloc] initWithDragPreview:self reason:v4];
  [(NSHashTable *)self->_cleanupDelayAssertions addObject:v7];

  return v7;
}

- (void)_removeDelayCleanupAssertion:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_cleanupDelayAssertions, "containsObject:"))
  {
    [(NSHashTable *)self->_cleanupDelayAssertions removeObject:v4];
    if (![(NSHashTable *)self->_cleanupDelayAssertions count])
    {
      if ([(SBHPageManagementCellDragPreview *)self isDelayingCleanup]) {
        [(SBHPageManagementCellDragPreview *)self handleCleanup];
      }
    }
  }
}

- (unint64_t)dragState
{
  return self->_dragState;
}

- (BOOL)isFlocked
{
  return self->flocked;
}

- (void)setFlocked:(BOOL)a3
{
  self->flocked = a3;
}

- (BOOL)iconAllowsLabelArea
{
  return self->iconAllowsLabelArea;
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  self->iconAllowsLabelArea = a3;
}

- (BOOL)iconAllowsAccessory
{
  return self->iconAllowsAccessory;
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  self->iconAllowsAccessory = a3;
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
  self->iconCanShowCloseBox = a3;
}

- (double)iconContentScale
{
  return self->iconContentScale;
}

- (void)setIconContentScale:(double)a3
{
  self->iconContentScale = a3;
}

- (BOOL)iconIsEditing
{
  return self->iconIsEditing;
}

- (void)setIconIsEditing:(BOOL)a3
{
  self->iconIsEditing = a3;
}

- (id)cleanUpHandler
{
  return self->_cleanupHandler;
}

- (void)setCleanUpHandler:(id)a3
{
}

- (SBIconView)referenceIconView
{
  return self->_referenceIconView;
}

- (void)setReferenceIconView:(id)a3
{
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (SBIconViewCustomImageViewControlling)customIconImageViewController
{
  return self->_customIconImageViewController;
}

- (void)setCustomIconImageViewController:(id)a3
{
}

- (BOOL)isDelayingCleanup
{
  return self->_delayingCleanup;
}

- (void)setDelayingCleanup:(BOOL)a3
{
  self->_delayingCleanup = a3;
}

- (BOOL)hasCleanedUp
{
  return self->_cleanedUp;
}

- (void)setCleanedUp:(BOOL)a3
{
  self->_cleanedUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong(&self->_cleanupHandler, 0);
  objc_storeStrong((id *)&self->_cleanupDelayAssertions, 0);
}

- (void)setDragState:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBHPageManagementCellDragPreview.m";
  __int16 v16 = 1024;
  int v17 = 137;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end
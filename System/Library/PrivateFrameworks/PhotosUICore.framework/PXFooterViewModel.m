@interface PXFooterViewModel
- (BOOL)hasImportantInformation;
- (BOOL)isPaused;
- (BOOL)isProcessing;
- (BOOL)showBadge;
- (BOOL)useBlankActionSeparator;
- (NSString)actionConfirmationAlertButtonTitle;
- (NSString)actionConfirmationAlertSubtitle;
- (NSString)actionConfirmationAlertTitle;
- (NSString)actionTitle;
- (NSString)extendedSystemImageName;
- (NSString)extendedTitle;
- (NSString)internalMessageSubtitle;
- (NSString)subtitle1;
- (NSString)subtitle2;
- (NSString)title;
- (PXFooterViewModel)init;
- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor;
- (UIView)accessoryView;
- (UIView)filterView;
- (UIView)topAccessoryView;
- (float)progress;
- (id)action;
- (id)adjustedChromeColor:(id)a3;
- (int64_t)actionStyle;
- (int64_t)animatedIconMode;
- (int64_t)subtitle1Style;
- (void)configureWithPhotosEnvironment:(id)a3;
- (void)performChanges:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionConfirmationAlertButtonTitle:(id)a3;
- (void)setActionConfirmationAlertSubtitle:(id)a3;
- (void)setActionConfirmationAlertTitle:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setAnimatedIconMode:(int64_t)a3;
- (void)setExtendedSystemImageName:(id)a3;
- (void)setExtendedTitle:(id)a3;
- (void)setFilterView:(id)a3;
- (void)setHasImportantInformation:(BOOL)a3;
- (void)setInternalMessageSubtitle:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsProcessing:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setShowBadge:(BOOL)a3;
- (void)setSubtitle1:(id)a3;
- (void)setSubtitle1Style:(int64_t)a3;
- (void)setSubtitle2:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopAccessoryView:(id)a3;
- (void)setUseBlankActionSeparator:(BOOL)a3;
@end

@implementation PXFooterViewModel

- (PXFooterViewModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXFooterViewModel;
  result = [(PXFooterViewModel *)&v3 init];
  if (result) {
    result->_progress = -1.0;
  }
  return result;
}

- (id)adjustedChromeColor:(id)a3
{
}

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
}

- (void)configureWithPhotosEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_internalMessageSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle1, 0);
  objc_storeStrong((id *)&self->_extendedSystemImageName, 0);
  objc_storeStrong((id *)&self->_extendedTitle, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)showBadge
{
  return self->_showBadge;
}

- (BOOL)isProcessing
{
  return self->_isProcessing;
}

- (int64_t)subtitle1Style
{
  return self->_subtitle1Style;
}

- (BOOL)useBlankActionSeparator
{
  return self->_useBlankActionSeparator;
}

- (BOOL)hasImportantInformation
{
  return self->_hasImportantInformation;
}

- (UIView)topAccessoryView
{
  return self->_topAccessoryView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (id)action
{
  return self->_action;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (NSString)internalMessageSubtitle
{
  return self->_internalMessageSubtitle;
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (NSString)subtitle1
{
  return self->_subtitle1;
}

- (NSString)extendedSystemImageName
{
  return self->_extendedSystemImageName;
}

- (NSString)extendedTitle
{
  return self->_extendedTitle;
}

- (UIView)filterView
{
  return self->_filterView;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)animatedIconMode
{
  return self->_animatedIconMode;
}

- (void)setShowBadge:(BOOL)a3
{
  if (self->_showBadge != a3)
  {
    self->_showBadge = a3;
    [(PXFooterViewModel *)self signalChange:0x200000];
  }
}

- (void)setIsProcessing:(BOOL)a3
{
  if (self->_isProcessing != a3)
  {
    self->_isProcessing = a3;
    [(PXFooterViewModel *)self signalChange:0x100000];
  }
}

- (void)setSubtitle1Style:(int64_t)a3
{
  if (self->_subtitle1Style != a3)
  {
    self->_subtitle1Style = a3;
    [(PXFooterViewModel *)self signalChange:0x80000];
  }
}

- (void)setHasImportantInformation:(BOOL)a3
{
  if (self->_hasImportantInformation != a3)
  {
    self->_hasImportantInformation = a3;
    [(PXFooterViewModel *)self signalChange:0x40000];
  }
}

- (void)setAnimatedIconMode:(int64_t)a3
{
  if (self->_animatedIconMode != a3)
  {
    self->_animatedIconMode = a3;
    [(PXFooterViewModel *)self signalChange:0x8000];
  }
}

- (void)setTopAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_topAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topAccessoryView, a3);
    [(PXFooterViewModel *)self signalChange:0x10000];
    v5 = v6;
  }
}

- (void)setAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(PXFooterViewModel *)self signalChange:0x4000];
    v5 = v6;
  }
}

- (void)setUseBlankActionSeparator:(BOOL)a3
{
  if (self->_useBlankActionSeparator != a3)
  {
    self->_useBlankActionSeparator = a3;
    [(PXFooterViewModel *)self signalChange:0x400000];
  }
}

- (void)setAction:(id)a3
{
  if (self->_action != a3)
  {
    v4 = (void *)[a3 copy];
    id action = self->_action;
    self->_id action = v4;

    [(PXFooterViewModel *)self signalChange:0x2000];
  }
}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      [(PXFooterViewModel *)self signalChange:4096];
    }
  }
}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      [(PXFooterViewModel *)self signalChange:2048];
    }
  }
}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      [(PXFooterViewModel *)self signalChange:1024];
    }
  }
}

- (void)setActionTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      [(PXFooterViewModel *)self signalChange:512];
    }
  }
}

- (void)setProgress:(float)a3
{
  if (a3 != -1.0 && (a3 < 0.0 || a3 > 1.0))
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXFooterViewModel.m", 107, @"Invalid parameter not satisfying: %@", @"(progress == PXFooterViewModelNoProgress) || ((progress >= 0.0f) && (progress <= 1.0f))" object file lineNumber description];
  }
  PXFloatApproximatelyEqualToFloat();
}

- (void)setIsPaused:(BOOL)a3
{
  if (self->_isPaused != a3)
  {
    self->_isPaused = a3;
    [(PXFooterViewModel *)self signalChange:64];
  }
}

- (void)setInternalMessageSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_internalMessageSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      internalMessageSubtitle = self->_internalMessageSubtitle;
      self->_internalMessageSubtitle = v6;

      [(PXFooterViewModel *)self signalChange:32];
    }
  }
}

- (void)setSubtitle2:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_subtitle2;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      subtitle2 = self->_subtitle2;
      self->_subtitle2 = v6;

      [(PXFooterViewModel *)self signalChange:16];
    }
  }
}

- (void)setSubtitle1:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_subtitle1;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      subtitle1 = self->_subtitle1;
      self->_subtitle1 = v6;

      [(PXFooterViewModel *)self signalChange:8];
    }
  }
}

- (void)setFilterView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->_filterView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_filterView, a3);
    [(PXFooterViewModel *)self signalChange:4];
    BOOL v5 = v6;
  }
}

- (void)setExtendedSystemImageName:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_extendedSystemImageName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      extendedSystemImageName = self->_extendedSystemImageName;
      self->_extendedSystemImageName = v6;

      [(PXFooterViewModel *)self signalChange:0x20000];
    }
  }
}

- (void)setExtendedTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_extendedTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      extendedTitle = self->_extendedTitle;
      self->_extendedTitle = v6;

      [(PXFooterViewModel *)self signalChange:2];
    }
  }
}

- (void)setTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXFooterViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXFooterViewModel;
  [(PXFooterViewModel *)&v3 performChanges:a3];
}

@end
@interface PXActionProgressToast
- (BOOL)_hasFinalState;
- (BOOL)isLocked;
- (NSArray)errors;
- (NSProgress)progress;
- (NSString)localizedProgressText;
- (NSString)localizedTitle;
- (PXActionProgressToast)initWithTargetDestination:(id)a3 progress:(id)a4;
- (PXProgrammaticNavigationDestination)targetDestination;
- (double)bottomSpacing;
- (id)_determinateProgressView;
- (id)_mainViewController;
- (id)_tabBarController;
- (id)closeButtonAction;
- (id)errorButtonAction;
- (int64_t)state;
- (void)_cancel;
- (void)_close:(id)a3;
- (void)_dismissAnimated:(BOOL)a3;
- (void)_dismissAnimated:(BOOL)a3 afterDelay:(double)a4;
- (void)_errorButtonClicked:(id)a3;
- (void)_handleContentModeChange:(id)a3;
- (void)_handleSingleTouchTap:(id)a3;
- (void)_prepareForReuse;
- (void)_showToast;
- (void)_updateDeterminateProgress;
- (void)_updateDisplayForDestination:(id)a3;
- (void)_updateIcons;
- (void)_updatePrimaryLabel;
- (void)_updateSecondaryLabel;
- (void)_updateToastMargin;
- (void)dealloc;
- (void)finishProgressMarkingAsComplete:(BOOL)a3;
- (void)finishProgressMarkingAsComplete:(BOOL)a3 updatedLocalizedTitle:(id)a4 updatedLocalizedDescription:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBottomSpacing:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCloseButtonAction:(id)a3;
- (void)setErrorButtonAction:(id)a3;
- (void)setErrors:(id)a3;
- (void)setErrors:(id)a3 forMediaType:(int64_t)a4;
- (void)setLocalizedProgressText:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetDestination:(id)a3;
- (void)updateConstraints;
- (void)willStartProgress;
@end

@implementation PXActionProgressToast

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDestination, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong(&self->_errorButtonAction, 0);
  objc_storeStrong(&self->_closeButtonAction, 0);
  objc_storeStrong((id *)&self->_localizedProgressText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_secondaryLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toast, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

- (void)setTargetDestination:(id)a3
{
}

- (PXProgrammaticNavigationDestination)targetDestination
{
  return self->_targetDestination;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrorButtonAction:(id)a3
{
}

- (id)errorButtonAction
{
  return self->_errorButtonAction;
}

- (id)closeButtonAction
{
  return self->_closeButtonAction;
}

- (NSString)localizedProgressText
{
  return self->_localizedProgressText;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 560, 1);
}

- (double)bottomSpacing
{
  return self->_bottomSpacing;
}

- (int64_t)state
{
  return self->_state;
}

- (void)_updateDisplayForDestination:(id)a3
{
  id v7 = a3;
  v4 = [(PXActionProgressToast *)self targetDestination];
  if (v4)
  {
    v5 = [(PXActionProgressToast *)self targetDestination];
    uint64_t v6 = [v5 isEqualToNavigationDestination:v7] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (v6 != [(PXActionProgressToast *)self isHidden])
  {
    [(PXActionProgressToast *)self setHidden:v6];
    if ((v6 & [(PXActionProgressToast *)self _hasFinalState]) == 1) {
      [(PXActionProgressToast *)self _dismissAnimated:0];
    }
  }
}

- (void)_handleContentModeChange:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F8ADC0]];

  [(PXActionProgressToast *)self _updateDisplayForDestination:v5];
}

- (void)_updateIcons
{
  unint64_t v3 = [(PXActionProgressToast *)self state];
  if (v3 <= 4)
  {
    uint64_t v4 = (0xFu >> v3) & 1;
    uint64_t v5 = (0x18u >> v3) & 1;
    [(UIButton *)self->_errorView setHidden:(0x17u >> v3) & 1];
    [(UIImageView *)self->_checkmarkView setHidden:v4];
    progressView = self->_progressView;
    [(UIView *)progressView setHidden:v5];
  }
}

- (void)_prepareForReuse
{
  errors = self->_errors;
  self->_errors = 0;

  [(PXActionProgressToast *)self setState:0];
  [(PXActionProgressToast *)self _updatePrimaryLabel];
  [(PXActionProgressToast *)self _updateSecondaryLabel];
  [(PXActionProgressToast *)self _updateToastMargin];
  uint64_t v4 = [(PXActionProgressToast *)self _determinateProgressView];
  [v4 prepareForReuse];

  labelContainerWidthConstraint = self->_labelContainerWidthConstraint;
  [(NSLayoutConstraint *)labelContainerWidthConstraint setConstant:0.0];
}

- (id)_tabBarController
{
  v2 = [(PXActionProgressToast *)self _mainViewController];
  unint64_t v3 = [v2 tabBarController];

  return v3;
}

- (id)_mainViewController
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v3 = objc_msgSend(v2, "px_firstKeyWindow");

  uint64_t v4 = [v3 rootViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 contentViewController];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v5 = [v4 selectedViewController];
  }
  uint64_t v6 = (void *)v5;

  uint64_t v4 = v6;
LABEL_6:

  return v4;
}

- (void)_updateToastMargin
{
  [(PXActionProgressToast *)self bottomSpacing];
  double v4 = v3;
  uint64_t v5 = [(PXActionProgressToast *)self _tabBarController];
  id v10 = v5;
  if (v5)
  {
    uint64_t v6 = [v5 tabBar];
    [v6 frame];
    double v8 = v7;
  }
  else
  {
    uint64_t v6 = [(PXActionProgressToast *)self _mainViewController];
    objc_msgSend(v6, "px_safeAreaInsets");
    double v8 = v9;
  }

  self->_toastMargin = v4 + 8.0 + v8;
  -[PXToast setBottomMargin:](self->_toast, "setBottomMargin:");
}

- (void)_close:(id)a3
{
  if ([(PXActionProgressToast *)self state] == 1)
  {
    double v4 = [(PXActionProgressToast *)self closeButtonAction];

    if (v4)
    {
      uint64_t v5 = [(PXActionProgressToast *)self closeButtonAction];
      v5[2]();
    }
    [(PXActionProgressToast *)self _cancel];
    [(PXActionProgressToast *)self _dismissAnimated:1 afterDelay:1.0];
  }
  else
  {
    [(PXActionProgressToast *)self _dismissAnimated:1];
  }
}

- (void)_cancel
{
  if ([(PXActionProgressToast *)self state] == 1)
  {
    [(PXActionProgressToast *)self setState:2];
    double v3 = PXLocalizedStringFromTable(@"PXActionProgressCanceling", @"PhotosUICore");
    [(PXActionProgressToast *)self setLocalizedProgressText:v3];

    [(PXActionProgressToast *)self _updateIcons];
  }
}

- (void)_errorButtonClicked:(id)a3
{
  double v4 = [(PXActionProgressToast *)self errorButtonAction];

  if (v4)
  {
    uint64_t v6 = [(PXActionProgressToast *)self errorButtonAction];
    uint64_t v5 = [(PXActionProgressToast *)self errors];
    v6[2](v6, v5);
  }
}

- (void)_handleSingleTouchTap:(id)a3
{
  id v5 = [(PXActionProgressToast *)self _tabBarController];
  double v4 = [(PXActionProgressToast *)self targetDestination];
  objc_msgSend(v5, "px_switchToTabAndNavigateToDestination:options:completionHandler:", v4, 0, &__block_literal_global_236682);
}

- (void)setCloseButtonAction:(id)a3
{
  id v5 = _Block_copy(a3);
  id closeButtonAction = self->_closeButtonAction;
  self->_id closeButtonAction = v5;

  [(UIButton *)self->_closeButton setHidden:a3 == 0];
  [(PXActionProgressToast *)self setNeedsUpdateConstraints];
}

- (void)_updateSecondaryLabel
{
  double v3 = [(PXActionProgressToast *)self localizedProgressText];
  [(UILabel *)self->_secondaryLabel setText:v3];

  [(PXActionProgressToast *)self setNeedsUpdateConstraints];
}

- (void)setLocalizedProgressText:(id)a3
{
  double v8 = (NSString *)a3;
  id v5 = self->_localizedProgressText;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedProgressText, a3);
      [(PXActionProgressToast *)self _updateSecondaryLabel];
    }
  }
}

- (void)_updatePrimaryLabel
{
  id v6 = [(PXActionProgressToast *)self localizedTitle];
  BOOL v3 = [(PXActionProgressToast *)self state] != 4 && [(PXActionProgressToast *)self state] != 3;
  if (v3 || !v6)
  {
    double v4 = [(PXActionProgressToast *)self progress];
    id v5 = [v4 localizedDescription];
    [(UILabel *)self->_primaryLabel setText:v5];
  }
  else
  {
    [(UILabel *)self->_primaryLabel setText:v6];
  }
  [(PXActionProgressToast *)self setNeedsUpdateConstraints];
}

- (void)setLocalizedTitle:(id)a3
{
  double v8 = (NSString *)a3;
  id v5 = self->_localizedTitle;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedTitle, a3);
      [(PXActionProgressToast *)self _updatePrimaryLabel];
    }
  }
}

- (BOOL)_hasFinalState
{
  return (unint64_t)([(PXActionProgressToast *)self state] - 2) < 3;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXActionProgressToast *)self _updatePrimaryLabel];
  }
}

- (void)setBottomSpacing:(double)a3
{
  if (self->_bottomSpacing != a3)
  {
    self->_bottomSpacing = a3;
    [(PXActionProgressToast *)self _updateToastMargin];
  }
}

- (void)finishProgressMarkingAsComplete:(BOOL)a3 updatedLocalizedTitle:(id)a4 updatedLocalizedDescription:(id)a5
{
  BOOL v6 = a3;
  id v16 = a4;
  id v8 = a5;
  if ([(PXActionProgressToast *)self state] == 1)
  {
    [(PXActionProgressToast *)self setState:4];
    if (!v6)
    {
      double v14 = 1.7;
LABEL_17:
      [(PXActionProgressToast *)self _dismissAnimated:1 afterDelay:v14];
      goto LABEL_18;
    }
    if (v16)
    {
      id v9 = [(PXActionProgressToast *)self localizedTitle];
      if (v9 == v16)
      {

        if (!v8) {
          goto LABEL_15;
        }
LABEL_8:
        id v11 = [(PXActionProgressToast *)self localizedProgressText];
        if (v11 == v8)
        {
        }
        else
        {
          v12 = v11;
          char v13 = [v8 isEqualToString:v11];

          if ((v13 & 1) == 0)
          {
            [(PXActionProgressToast *)self setLocalizedProgressText:v8];
LABEL_16:
            [(PXActionProgressToast *)self _updateIcons];
            double v14 = 1.0;
            goto LABEL_17;
          }
        }
LABEL_15:
        v15 = PXLocalizedStringFromTable(@"PXActionProgressCompleted", @"PhotosUICore");
        [(PXActionProgressToast *)self setLocalizedProgressText:v15];

        goto LABEL_16;
      }
      char v10 = [v16 isEqualToString:v9];

      if ((v10 & 1) == 0) {
        [(PXActionProgressToast *)self setLocalizedTitle:v16];
      }
    }
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
LABEL_18:
}

- (void)finishProgressMarkingAsComplete:(BOOL)a3
{
}

- (void)setErrors:(id)a3 forMediaType:(int64_t)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_errors, a3);
  if ([v8 count])
  {
    if ([(PXActionProgressToast *)self state] != 1)
    {
      [(PXActionProgressToast *)self _prepareForReuse];
      [(PXActionProgressToast *)self _showToast];
    }
    [(PXActionProgressToast *)self setState:3];
    BOOL v7 = PXLocalizedAssetCountForUsage([v8 count], a4, 0, 5);
    [(PXActionProgressToast *)self setLocalizedProgressText:v7];
    [(PXActionProgressToast *)self _updateIcons];
  }
}

- (void)setErrors:(id)a3
{
}

- (BOOL)isLocked
{
  int64_t v3 = [(PXActionProgressToast *)self state];
  double v4 = [(PXActionProgressToast *)self closeButtonAction];

  return v3 == 1 && v4 != 0;
}

- (void)_dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(PXActionProgressToast *)self targetDestination];
  id v5 = objc_msgSend((id)_activeToasts_236687, "objectForKey:");

  if (v5) {
    [(id)_activeToasts_236687 removeObjectForKey:v6];
  }
  [(PXToast *)self->_toast dismissAnimated:v3];
}

- (void)_dismissAnimated:(BOOL)a3 afterDelay:(double)a4
{
  objc_initWeak(&location, self);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXActionProgressToast__dismissAnimated_afterDelay___block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__PXActionProgressToast__dismissAnimated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_showToast
{
  BOOL v3 = (void *)_activeToasts_236687;
  if (!_activeToasts_236687)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v5 = (void *)_activeToasts_236687;
    _activeToasts_236687 = v4;

    BOOL v3 = (void *)_activeToasts_236687;
  }
  dispatch_time_t v6 = [(PXActionProgressToast *)self targetDestination];
  BOOL v7 = [v3 objectForKey:v6];

  if (!v7) {
    goto LABEL_9;
  }
  if (([v7 isLocked] & 1) == 0)
  {
    [v7 _dismissAnimated:1];
LABEL_9:
    BOOL v9 = (void *)_activeToasts_236687;
    char v10 = [(PXActionProgressToast *)self targetDestination];
    [v9 setObject:self forKey:v10];

    objc_initWeak(buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__PXActionProgressToast__showToast__block_invoke;
    v13[3] = &unk_1E5DC8EB8;
    objc_copyWeak(&v14, buf);
    v13[4] = self;
    id v11 = +[PXToast show:v13];
    toast = self->_toast;
    self->_toast = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
    goto LABEL_10;
  }
  id v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXActionProgressToast: Cannot display new toast with locked toast in existence.", (uint8_t *)buf, 2u);
  }

LABEL_10:
}

void __35__PXActionProgressToast__showToast__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v5 setContentView:WeakRetained];

  [v5 setBottomMargin:*(double *)(*(void *)(a1 + 32) + 480)];
}

- (void)_updateDeterminateProgress
{
  id v5 = [(PXActionProgressToast *)self _determinateProgressView];
  BOOL v3 = [(PXActionProgressToast *)self progress];
  [v3 fractionCompleted];
  *(float *)&double v4 = v4;
  [v5 setProgress:v4];
}

- (id)_determinateProgressView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    progressView = self->_progressView;
  }
  else {
    progressView = 0;
  }
  return progressView;
}

- (void)willStartProgress
{
  [(PXActionProgressToast *)self _updateIcons];
  id v5 = [(PXActionProgressToast *)self progress];
  BOOL v3 = [v5 localizedAdditionalDescription];
  [(PXActionProgressToast *)self setLocalizedProgressText:v3];

  double v4 = [(PXActionProgressToast *)self targetDestination];
  [(PXActionProgressToast *)self _updateDisplayForDestination:v4];

  [(PXActionProgressToast *)self setState:1];
  [(PXActionProgressToast *)self _showToast];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = v10;
  if ((void *)PXActionProgressToastContext == a6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PXActionProgressToast_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD32A8;
    id v14 = v10;
    v15 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXActionProgressToast;
    [(PXActionProgressToast *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

void __72__PXActionProgressToast_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = NSStringFromSelector(sel_fractionCompleted);
  if ([v2 isEqualToString:v3])
  {
    double v4 = [*(id *)(a1 + 40) progress];
    char v5 = [v4 isIndeterminate];

    if ((v5 & 1) == 0)
    {
      dispatch_time_t v6 = [*(id *)(a1 + 40) progress];
      [v6 fractionCompleted];
      double v8 = v7;

      BOOL v9 = *(void **)(a1 + 40);
      if (v8 <= 0.0)
      {
        [v9 _prepareForReuse];
      }
      else if (![v9 state])
      {
        [*(id *)(a1 + 40) willStartProgress];
      }
      v15 = *(void **)(a1 + 40);
      [v15 _updateDeterminateProgress];
      return;
    }
  }
  else
  {
  }
  id v10 = *(void **)(a1 + 32);
  id v11 = NSStringFromSelector(sel_localizedDescription);
  LODWORD(v10) = [v10 isEqualToString:v11];

  if (v10)
  {
    objc_super v12 = *(void **)(a1 + 40);
    [v12 _updatePrimaryLabel];
  }
  else
  {
    char v13 = *(void **)(a1 + 32);
    id v14 = NSStringFromSelector(sel_localizedAdditionalDescription);
    LODWORD(v13) = [v13 isEqualToString:v14];

    if (v13 && ([*(id *)(a1 + 40) _hasFinalState] & 1) == 0)
    {
      id v17 = [*(id *)(a1 + 40) progress];
      id v16 = [v17 localizedAdditionalDescription];
      [*(id *)(a1 + 40) setLocalizedProgressText:v16];
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXActionProgressToast;
  -[PXActionProgressToast setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXActionProgressToast *)self _updateToastMargin];
}

- (void)updateConstraints
{
  v53.receiver = self;
  v53.super_class = (Class)PXActionProgressToast;
  [(PXActionProgressToast *)&v53 updateConstraints];
  [(UILabel *)self->_primaryLabel intrinsicContentSize];
  double v4 = v3;
  primaryLabelWidthConstraint = self->_primaryLabelWidthConstraint;
  if (primaryLabelWidthConstraint)
  {
    [(NSLayoutConstraint *)primaryLabelWidthConstraint setConstant:v3];
  }
  else
  {
    dispatch_time_t v6 = [(UILabel *)self->_primaryLabel widthAnchor];
    double v7 = [v6 constraintEqualToConstant:v4];
    double v8 = self->_primaryLabelWidthConstraint;
    self->_primaryLabelWidthConstraint = v7;

    LODWORD(v9) = 1132068864;
    [(NSLayoutConstraint *)self->_primaryLabelWidthConstraint setPriority:v9];
    [(NSLayoutConstraint *)self->_primaryLabelWidthConstraint setActive:1];
  }
  [(UILabel *)self->_secondaryLabel intrinsicContentSize];
  double v11 = v10;
  secondaryLabelWidthConstraint = self->_secondaryLabelWidthConstraint;
  if (secondaryLabelWidthConstraint)
  {
    [(NSLayoutConstraint *)secondaryLabelWidthConstraint setConstant:v10];
  }
  else
  {
    char v13 = [(UILabel *)self->_secondaryLabel widthAnchor];
    id v14 = [v13 constraintEqualToConstant:v11];
    v15 = self->_secondaryLabelWidthConstraint;
    self->_secondaryLabelWidthConstraint = v14;

    LODWORD(v16) = 1132068864;
    [(NSLayoutConstraint *)self->_secondaryLabelWidthConstraint setPriority:v16];
    [(NSLayoutConstraint *)self->_secondaryLabelWidthConstraint setActive:1];
  }
  if (v4 < v11) {
    double v4 = v11;
  }
  labelContainerWidthConstraint = self->_labelContainerWidthConstraint;
  if (labelContainerWidthConstraint)
  {
    [(NSLayoutConstraint *)labelContainerWidthConstraint constant];
    if (v18 < v4) {
      double v18 = v4;
    }
    [(NSLayoutConstraint *)self->_labelContainerWidthConstraint setConstant:v18];
  }
  else
  {
    v19 = [(UIView *)self->_labelContainer widthAnchor];
    v20 = [v19 constraintEqualToConstant:v4];
    v21 = self->_labelContainerWidthConstraint;
    self->_labelContainerWidthConstraint = v20;

    [(NSLayoutConstraint *)self->_labelContainerWidthConstraint setActive:1];
  }
  if (self->_primaryLabelAlignmentConstraint) {
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  }
  if (self->_secondaryLabelWidthConstraint) {
    [(PXActionProgressToast *)self removeConstraint:self->_secondaryLabelAlignmentConstraint];
  }
  if (self->_closeButtonWidthConstraint) {
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  }
  if (self->_trailingSpacingConstraint) {
    -[PXActionProgressToast removeConstraint:](self, "removeConstraint:");
  }
  v22 = [(PXActionProgressToast *)self closeButtonAction];

  labelContainer = self->_labelContainer;
  if (v22)
  {
    v24 = [(UIView *)labelContainer centerXAnchor];
    v25 = [(UILabel *)self->_primaryLabel centerXAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    primaryLabelAlignmentConstraint = self->_primaryLabelAlignmentConstraint;
    self->_primaryLabelAlignmentConstraint = v26;

    [(NSLayoutConstraint *)self->_primaryLabelAlignmentConstraint setActive:1];
    v28 = [(UIView *)self->_labelContainer centerXAnchor];
    v29 = [(UILabel *)self->_secondaryLabel centerXAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    secondaryLabelAlignmentConstraint = self->_secondaryLabelAlignmentConstraint;
    self->_secondaryLabelAlignmentConstraint = v30;

    [(NSLayoutConstraint *)self->_secondaryLabelAlignmentConstraint setActive:1];
    v32 = [(PXActionProgressToast *)self trailingAnchor];
    v33 = [(UIButton *)self->_closeButton trailingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:12.0];
    trailingSpacingConstraint = self->_trailingSpacingConstraint;
    self->_trailingSpacingConstraint = v34;

    [(NSLayoutConstraint *)self->_trailingSpacingConstraint setActive:1];
    v36 = [(UIButton *)self->_closeButton widthAnchor];
    v37 = v36;
    double v38 = 18.0;
  }
  else
  {
    v39 = [(UIView *)labelContainer leadingAnchor];
    v40 = [(UILabel *)self->_primaryLabel leadingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v42 = self->_primaryLabelAlignmentConstraint;
    self->_primaryLabelAlignmentConstraint = v41;

    [(NSLayoutConstraint *)self->_primaryLabelAlignmentConstraint setActive:1];
    v43 = [(UIView *)self->_labelContainer leadingAnchor];
    v44 = [(UILabel *)self->_secondaryLabel leadingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v46 = self->_secondaryLabelAlignmentConstraint;
    self->_secondaryLabelAlignmentConstraint = v45;

    [(NSLayoutConstraint *)self->_secondaryLabelAlignmentConstraint setActive:1];
    v47 = [(PXActionProgressToast *)self trailingAnchor];
    v48 = [(UIView *)self->_labelContainer trailingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:22.0];
    v50 = self->_trailingSpacingConstraint;
    self->_trailingSpacingConstraint = v49;

    [(NSLayoutConstraint *)self->_trailingSpacingConstraint setActive:1];
    v36 = [(UIButton *)self->_closeButton widthAnchor];
    v37 = v36;
    double v38 = 0.0;
  }
  v51 = [v36 constraintEqualToConstant:v38];
  closeButtonWidthConstraint = self->_closeButtonWidthConstraint;
  self->_closeButtonWidthConstraint = v51;

  [(NSLayoutConstraint *)self->_closeButtonWidthConstraint setActive:1];
}

- (void)dealloc
{
  progress = self->_progress;
  double v4 = NSStringFromSelector(sel_fractionCompleted);
  [(NSProgress *)progress removeObserver:self forKeyPath:v4 context:PXActionProgressToastContext];

  char v5 = self->_progress;
  dispatch_time_t v6 = NSStringFromSelector(sel_localizedDescription);
  [(NSProgress *)v5 removeObserver:self forKeyPath:v6 context:PXActionProgressToastContext];

  double v7 = self->_progress;
  double v8 = NSStringFromSelector(sel_localizedAdditionalDescription);
  [(NSProgress *)v7 removeObserver:self forKeyPath:v8 context:PXActionProgressToastContext];

  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4F8ADB8] object:0];

  v10.receiver = self;
  v10.super_class = (Class)PXActionProgressToast;
  [(PXActionProgressToast *)&v10 dealloc];
}

- (PXActionProgressToast)initWithTargetDestination:(id)a3 progress:(id)a4
{
  v144[27] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v143.receiver = self;
  v143.super_class = (Class)PXActionProgressToast;
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  char v13 = -[PXActionProgressToast initWithFrame:](&v143, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v10, v11, v12);
  id v14 = v13;
  if (v13)
  {
    id v142 = v7;
    v15 = [(PXActionProgressToast *)v13 layer];
    [v15 setCornerRadius:22.0];

    +[PXToastDefaultContentView configureBackgroundOfToastContentView:v14];
    objc_storeStrong((id *)&v14->_targetDestination, a3);
    p_progress = (void **)&v14->_progress;
    objc_storeStrong((id *)&v14->_progress, a4);
    id v141 = v8;
    if ([v8 isIndeterminate])
    {
      id v17 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      double v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UIView *)v17 setColor:v18];

      [(UIView *)v17 startAnimating];
      progressView = v14->_progressView;
      v14->_progressView = v17;
    }
    else
    {
      v20 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 5, v9, v10, v11, v12);
      progressView = v14->_progressView;
      v14->_progressView = &v20->super;
    }

    v21 = *p_progress;
    v22 = NSStringFromSelector(sel_fractionCompleted);
    [v21 addObserver:v14 forKeyPath:v22 options:4 context:PXActionProgressToastContext];

    v23 = *p_progress;
    v24 = NSStringFromSelector(sel_localizedDescription);
    [v23 addObserver:v14 forKeyPath:v24 options:4 context:PXActionProgressToastContext];

    v25 = *p_progress;
    v26 = NSStringFromSelector(sel_localizedAdditionalDescription);
    [v25 addObserver:v14 forKeyPath:v26 options:4 context:PXActionProgressToastContext];

    v140 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v140 addObserver:v14 selector:sel__handleContentModeChange_ name:*MEMORY[0x1E4F8ADB8] object:0];
    v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    v139 = [v27 imageWithRenderingMode:2];

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v139];
    checkmarkView = v14->_checkmarkView;
    v14->_checkmarkView = (UIImageView *)v28;

    v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIImageView *)v14->_checkmarkView setTintColor:v30];

    [(PXActionProgressToast *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v31 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    errorView = v14->_errorView;
    v14->_errorView = (UIButton *)v31;

    v33 = v14->_errorView;
    v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle.fill"];
    [(UIButton *)v33 setImage:v34 forState:0];

    [(UIButton *)v14->_errorView addTarget:v14 action:sel__errorButtonClicked_ forControlEvents:64];
    v35 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIButton *)v14->_errorView setTintColor:v35];

    id v36 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UIView *)v14->_progressView frame];
    uint64_t v37 = objc_msgSend(v36, "initWithFrame:");
    leadingView = v14->_leadingView;
    v14->_leadingView = (UIView *)v37;

    [(UIView *)v14->_leadingView addSubview:v14->_progressView];
    [(UIView *)v14->_leadingView addSubview:v14->_checkmarkView];
    [(UIView *)v14->_leadingView addSubview:v14->_errorView];
    [(PXActionProgressToast *)v14 addSubview:v14->_leadingView];
    v138 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    v39 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    closeButton = v14->_closeButton;
    v14->_closeButton = v39;

    [(UIButton *)v14->_closeButton setImage:v138 forState:0];
    [(UIButton *)v14->_closeButton addTarget:v14 action:sel__close_ forControlEvents:64];
    v41 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIButton *)v14->_closeButton setTintColor:v41];

    [(PXActionProgressToast *)v14 addSubview:v14->_closeButton];
    [(UIButton *)v14->_closeButton setHidden:1];
    v42 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v14->_primaryLabel;
    v14->_primaryLabel = v42;

    v44 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v14->_primaryLabel setTextColor:v44];

    v45 = [(PXActionProgressToast *)v14 localizedTitle];
    [(UILabel *)v14->_primaryLabel setText:v45];

    [(UILabel *)v14->_primaryLabel setLineBreakMode:4];
    v46 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
    [(UILabel *)v14->_primaryLabel setFont:v46];

    LODWORD(v47) = 1148846080;
    [(UILabel *)v14->_primaryLabel setContentHuggingPriority:0 forAxis:v47];
    LODWORD(v48) = 1132068864;
    [(UILabel *)v14->_primaryLabel setContentCompressionResistancePriority:0 forAxis:v48];
    [(UILabel *)v14->_primaryLabel sizeToFit];
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v14->_secondaryLabel;
    v14->_secondaryLabel = v49;

    v51 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v14->_secondaryLabel setTextColor:v51];

    [(UILabel *)v14->_secondaryLabel setLineBreakMode:4];
    v52 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [(UILabel *)v14->_secondaryLabel setFont:v52];

    LODWORD(v53) = 1148846080;
    [(UILabel *)v14->_secondaryLabel setContentHuggingPriority:0 forAxis:v53];
    LODWORD(v54) = 1132068864;
    [(UILabel *)v14->_secondaryLabel setContentCompressionResistancePriority:0 forAxis:v54];
    [(UILabel *)v14->_secondaryLabel sizeToFit];
    v55 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    labelContainer = v14->_labelContainer;
    v14->_labelContainer = v55;

    [(UIView *)v14->_labelContainer addSubview:v14->_primaryLabel];
    [(UIView *)v14->_labelContainer addSubview:v14->_secondaryLabel];
    [(PXActionProgressToast *)v14 addSubview:v14->_labelContainer];
    v137 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v14 action:sel__handleSingleTouchTap_];
    [v137 setNumberOfTouchesRequired:1];
    [v137 setNumberOfTapsRequired:1];
    [(PXActionProgressToast *)v14 addGestureRecognizer:v137];
    [(PXActionProgressToast *)v14 _prepareForReuse];
    [(UIView *)v14->_labelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v14->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v14->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v14->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v14->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v14->_leadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v14->_errorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v14->_leadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v14->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v57 = v14;
    v58 = [(PXActionProgressToast *)v57 heightAnchor];
    v59 = [v58 constraintEqualToConstant:44.0];
    [v59 setActive:1];

    v108 = (void *)MEMORY[0x1E4F28DC8];
    v136 = [(PXActionProgressToast *)v57 leadingAnchor];
    v135 = [(UIView *)v14->_leadingView leadingAnchor];
    v134 = [v136 constraintEqualToAnchor:v135 constant:-12.0];
    v144[0] = v134;
    v133 = [(PXActionProgressToast *)v57 centerYAnchor];
    v132 = [(UIView *)v14->_leadingView centerYAnchor];
    v131 = [v133 constraintEqualToAnchor:v132];
    v144[1] = v131;
    v130 = [(PXActionProgressToast *)v57 heightAnchor];
    v129 = [(UIView *)v14->_leadingView heightAnchor];
    v128 = [v130 constraintEqualToAnchor:v129];
    v144[2] = v128;
    v127 = [(PXActionProgressToast *)v57 heightAnchor];
    v126 = [v127 constraintGreaterThanOrEqualToConstant:80.0];
    v144[3] = v126;
    v125 = [(UIView *)v14->_leadingView widthAnchor];
    v124 = [v125 constraintEqualToConstant:18.0];
    v144[4] = v124;
    v123 = [(UIView *)v14->_leadingView centerXAnchor];
    v122 = [(UIView *)v14->_progressView centerXAnchor];
    v121 = [v123 constraintEqualToAnchor:v122];
    v144[5] = v121;
    v120 = [(UIView *)v14->_leadingView centerYAnchor];
    v119 = [(UIView *)v14->_progressView centerYAnchor];
    v118 = [v120 constraintEqualToAnchor:v119];
    v144[6] = v118;
    v117 = [(UIView *)v14->_leadingView centerYAnchor];
    v116 = [(UIImageView *)v14->_checkmarkView centerYAnchor];
    v115 = [v117 constraintEqualToAnchor:v116];
    v144[7] = v115;
    v114 = [(UIView *)v14->_leadingView centerYAnchor];
    v113 = [(UIButton *)v14->_errorView centerYAnchor];
    v112 = [v114 constraintEqualToAnchor:v113];
    v144[8] = v112;
    v111 = [(UIView *)v14->_progressView widthAnchor];
    v110 = [v111 constraintEqualToConstant:18.0];
    v144[9] = v110;
    v109 = [(UIView *)v14->_progressView heightAnchor];
    v107 = [v109 constraintEqualToConstant:18.0];
    v144[10] = v107;
    v106 = [(UIImageView *)v14->_checkmarkView widthAnchor];
    v105 = [v106 constraintEqualToConstant:18.0];
    v144[11] = v105;
    v104 = [(UIImageView *)v14->_checkmarkView heightAnchor];
    v103 = [v104 constraintEqualToConstant:18.0];
    v144[12] = v103;
    v102 = [(UIButton *)v14->_errorView widthAnchor];
    v101 = [v102 constraintEqualToConstant:18.0];
    v144[13] = v101;
    v100 = [(UIButton *)v14->_errorView heightAnchor];
    v99 = [v100 constraintEqualToConstant:18.0];
    v144[14] = v99;
    v60 = v57;
    v98 = [(PXActionProgressToast *)v57 centerYAnchor];
    v97 = [(UIButton *)v14->_closeButton centerYAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v144[15] = v96;
    v95 = [(UIButton *)v14->_closeButton heightAnchor];
    v94 = [v95 constraintEqualToConstant:18.0];
    v144[16] = v94;
    v93 = [(PXActionProgressToast *)v57 centerYAnchor];
    v92 = [(UIView *)v14->_labelContainer centerYAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v144[17] = v91;
    v90 = [(UIView *)v14->_leadingView trailingAnchor];
    v89 = [(UIView *)v14->_labelContainer leadingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89 constant:-12.0];
    v144[18] = v88;
    v87 = [(UIButton *)v14->_closeButton leadingAnchor];
    v86 = [(UIView *)v14->_labelContainer trailingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86 constant:12.0];
    v144[19] = v85;
    v84 = [(UIView *)v14->_labelContainer topAnchor];
    v83 = [(UILabel *)v14->_primaryLabel topAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v144[20] = v82;
    v81 = [(UIView *)v14->_labelContainer bottomAnchor];
    v80 = [(UILabel *)v14->_secondaryLabel bottomAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v144[21] = v79;
    v78 = [(UILabel *)v14->_primaryLabel bottomAnchor];
    v77 = [(UILabel *)v14->_secondaryLabel topAnchor];
    v76 = [v78 constraintEqualToAnchor:v77 constant:-2.0];
    v144[22] = v76;
    v75 = [(UIView *)v14->_labelContainer widthAnchor];
    v74 = [(UILabel *)v14->_primaryLabel widthAnchor];
    v73 = [v75 constraintGreaterThanOrEqualToAnchor:v74];
    v144[23] = v73;
    v72 = [(UIView *)v14->_labelContainer widthAnchor];
    v61 = [(UILabel *)v14->_secondaryLabel widthAnchor];
    v62 = [v72 constraintGreaterThanOrEqualToAnchor:v61];
    v144[24] = v62;
    v63 = [(UIView *)v14->_leadingView trailingAnchor];
    v64 = [(UIView *)v14->_labelContainer leadingAnchor];
    v65 = [v63 constraintLessThanOrEqualToAnchor:v64];
    v144[25] = v65;
    v66 = [(PXActionProgressToast *)v57 trailingAnchor];
    v67 = v14->_labelContainer;

    v68 = [(UIView *)v67 trailingAnchor];
    v69 = [v66 constraintGreaterThanOrEqualToAnchor:v68];
    v144[26] = v69;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:27];
    [v108 activateConstraints:v70];

    id v7 = v142;
    id v8 = v141;
  }

  return v14;
}

@end
@interface SBDashBoardSetupView
- (BOOL)_actsLikeStoreRestricted;
- (BOOL)_isShowingModalTakeoverUI;
- (BOOL)isActivationLocked;
- (CSHomeAffordanceView)homeAffordanceView;
- (SBDashBoardSetupView)initWithFrame:(CGRect)a3 usingHomeAffordance:(BOOL)a4 coverSheetContext:(id)a5 isStoreRestricted:(BOOL)a6 isSecurityResearchDevice:(BOOL)a7;
- (UIButton)infoButton;
- (UIView)activationInfoView;
- (UIView)childIconView;
- (UIView)regulatoryInfoView;
- (_UILegibilitySettings)legibilitySettings;
- (double)setTitleString:(id)a3 forLanguage:(id)a4;
- (id)_titleView;
- (void)_addActivationLockLabels;
- (void)_addHomeAffordanceCallToAction;
- (void)_addHomeAffordanceForCoverSheetContext:(id)a3;
- (void)_addHomeButtonCallToAction;
- (void)_addInfoButton;
- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4 dispatchGroup:(id)a5;
- (void)_addSecurityResearchLabels;
- (void)_addStoreRestrictedLabels;
- (void)_addTitleLabel;
- (void)_adjustTitleVisibilityForInfoViews;
- (void)_animateCursiveForTimePassed;
- (void)_animateHomeAffordanceCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4;
- (void)_animateHomeAffordanceToActive:(BOOL)a3 withDispatchGroup:(id)a4;
- (void)_animateHomeButtonCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4;
- (void)_animateView:(id)a3 toActive:(BOOL)a4 withDispatchGroup:(id)a5;
- (void)_createDisplayLink;
- (void)_layoutActivationInfoView;
- (void)_layoutHomeAffordance;
- (void)_layoutHomeAffordanceCallToAction;
- (void)_layoutHomeButtonCallToAction;
- (void)_layoutRegulatoryInfo;
- (void)_onDisplayLink:(id)a3;
- (void)_removeDisplayLink;
- (void)_removeNormalAnimationForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4;
- (void)_setupActivationInfoConstraintsIfNeeded;
- (void)_setupConstraints;
- (void)_updateBaselineAndChildIconConstraints;
- (void)_updateLegibilitySettings;
- (void)animateComponents:(unint64_t)a3 toActive:(BOOL)a4 withCompletion:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActivationInfoView:(id)a3;
- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5;
- (void)setActivationLocked:(BOOL)a3;
- (void)setCallToActionString:(id)a3 forLanguage:(id)a4;
- (void)setChildIconView:(id)a3;
- (void)setChildIconVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5;
- (void)setHomeAffordanceView:(id)a3;
- (void)setInfoButtonVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5;
- (void)setLegibilitySettings:(id)a3;
- (void)setRegulatoryInfoView:(id)a3;
- (void)setStoreRestrictedStrings:(id)a3 bodyString:(id)a4 linkString:(id)a5 forLanguage:(id)a6;
@end

@implementation SBDashBoardSetupView

- (SBDashBoardSetupView)initWithFrame:(CGRect)a3 usingHomeAffordance:(BOOL)a4 coverSheetContext:(id)a5 isStoreRestricted:(BOOL)a6 isSecurityResearchDevice:(BOOL)a7
{
  BOOL v9 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBDashBoardSetupView;
  v16 = -[SBDashBoardSetupView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_isStoreRestricted = a6;
    v16->_isSecurityResearchDevice = a7;
    v16->_customDelayDuration = 4.0;
    v18 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBDashBoardSetupView *)v17 setBackgroundColor:v18];

    if (a7)
    {
      [(SBDashBoardSetupView *)v17 _addSecurityResearchLabels];
    }
    else if (![(SBDashBoardSetupView *)v17 _actsLikeStoreRestricted])
    {
      if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0) {
        [(SBDashBoardSetupView *)v17 _addActivationLockLabels];
      }
      [(SBDashBoardSetupView *)v17 _addTitleLabel];
    }
    [(SBDashBoardSetupView *)v17 _addInfoButton];
    if ([(SBDashBoardSetupView *)v17 _actsLikeStoreRestricted])
    {
      [(SBDashBoardSetupView *)v17 _addStoreRestrictedLabels];
    }
    else if (v9)
    {
      [(SBDashBoardSetupView *)v17 _addHomeAffordanceCallToAction];
      [(SBDashBoardSetupView *)v17 _addHomeAffordanceForCoverSheetContext:v15];
    }
    else
    {
      [(SBDashBoardSetupView *)v17 _addHomeButtonCallToAction];
    }
    [(SBDashBoardSetupView *)v17 _setupConstraints];
  }

  return v17;
}

- (void)dealloc
{
  homeButtonCallToActionTimer = self->_homeButtonCallToActionTimer;
  if (homeButtonCallToActionTimer)
  {
    dispatch_source_cancel(homeButtonCallToActionTimer);
    v4 = self->_homeButtonCallToActionTimer;
    self->_homeButtonCallToActionTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardSetupView;
  [(SBDashBoardSetupView *)&v5 dealloc];
}

- (void)setActivationInfoView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_activationInfoView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activationInfoView, a3);
    [(SBDashBoardSetupView *)self _adjustTitleVisibilityForInfoViews];
    activationInfoViewConstraints = self->_activationInfoViewConstraints;
    self->_activationInfoViewConstraints = 0;

    [(SBDashBoardSetupView *)self _setupActivationInfoConstraintsIfNeeded];
    objc_super v5 = v7;
  }
}

- (void)setRegulatoryInfoView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_regulatoryInfoView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regulatoryInfoView, a3);
    [(UIView *)self->_activationInfoView setHidden:self->_regulatoryInfoView != 0];
    [(SBDashBoardSetupView *)self _adjustTitleVisibilityForInfoViews];
    objc_super v5 = v6;
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBDashBoardSetupView *)self _updateLegibilitySettings];
  }
}

- (double)setTitleString:(id)a3 forLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (_os_feature_enabled_impl())
    {
      objc_storeStrong((id *)&self->_currentLanguage, a4);
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v9 = [v8 URLForResource:@"CursiveHello" withExtension:@"plist" subdirectory:0 localization:v7];

      cursiveTextView = self->_cursiveTextView;
      if (__sb__runningInSpringBoard())
      {
        int v11 = SBFEffectiveDeviceClass();
        double v12 = 64.0;
        if (v11 == 2) {
          double v12 = 106.0;
        }
        [(SBCursiveTextView *)cursiveTextView loadText:v9 pointSize:v12];
      }
      else
      {
        id v15 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v16 = [v15 userInterfaceIdiom];
        double v17 = 64.0;
        if (v16 == 1) {
          double v17 = 106.0;
        }
        [(SBCursiveTextView *)cursiveTextView loadText:v9 pointSize:v17];
      }
      [(SBCursiveTextView *)self->_cursiveTextView setAccessibilityLabel:v6];
      [(SBCursiveTextView *)self->_cursiveTextView setAccessibilityLanguage:v7];
      self->_startTime = CFAbsoluteTimeGetCurrent();
      [(SBCursiveTextView *)self->_cursiveTextView duration];
      double v19 = v18 + 1.0;
      if (v19 >= 4.0) {
        double v13 = v19;
      }
      else {
        double v13 = 4.0;
      }
      self->_customDelayDuration = v13;
      [(SBDashBoardSetupView *)self _createDisplayLink];
      [(SBDashBoardSetupView *)self setNeedsLayout];
    }
    else
    {
      BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
      if ([v7 length])
      {
        v14 = [v9 string];
        objc_msgSend(v9, "addAttribute:value:range:", @"NSLanguage", v7, 0, objc_msgSend(v14, "length"));
      }
      [(UILabel *)self->_titleLabel setAttributedText:v9];
      [(SBDashBoardSetupView *)self setNeedsLayout];
      double v13 = 0.0;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (void)setStoreRestrictedStrings:(id)a3 bodyString:(id)a4 linkString:(id)a5 forLanguage:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v12 length])
  {
    if ([v19 length])
    {
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19];
      v14 = [v13 string];
      objc_msgSend(v13, "addAttribute:value:range:", @"NSLanguage", v12, 0, objc_msgSend(v14, "length"));

      [(UILabel *)self->_storeRestrictedTitleLabel setAttributedText:v13];
      [(SBDashBoardSetupView *)self setNeedsLayout];
    }
    if ([v10 length])
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10];
      uint64_t v16 = [v15 string];
      objc_msgSend(v15, "addAttribute:value:range:", @"NSLanguage", v12, 0, objc_msgSend(v16, "length"));

      [(UILabel *)self->_storeRestrictedBodyLabel setAttributedText:v15];
      [(SBDashBoardSetupView *)self setNeedsLayout];
    }
    if ([v11 length])
    {
      double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
      double v18 = [v17 string];
      objc_msgSend(v17, "addAttribute:value:range:", @"NSLanguage", v12, 0, objc_msgSend(v18, "length"));

      [(UILabel *)self->_storeRestrictedLinkLabel setAttributedText:v17];
      [(SBDashBoardSetupView *)self setNeedsLayout];
    }
  }
}

- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v14 length] && objc_msgSend(v8, "length"))
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
    if ([v9 length])
    {
      id v12 = [v10 string];
      objc_msgSend(v10, "addAttribute:value:range:", @"NSLanguage", v9, 0, objc_msgSend(v12, "length"));

      double v13 = [v11 string];
      objc_msgSend(v11, "addAttribute:value:range:", @"NSLanguage", v9, 0, objc_msgSend(v13, "length"));
    }
    [(UILabel *)self->_activationLockWarningLabel setAttributedText:v10];
    [(UILabel *)self->_activationLockDetailLabel setAttributedText:v11];
    [(SBDashBoardSetupView *)self setNeedsLayout];
  }
}

- (void)setCallToActionString:(id)a3 forLanguage:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 length])
  {
    if (self->_homeAffordanceCallToActionLabel)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
      if ([v6 length])
      {
        id v8 = [v7 string];
        objc_msgSend(v7, "addAttribute:value:range:", @"NSLanguage", v6, 0, objc_msgSend(v8, "length"));
      }
      [(SBUILegibilityLabel *)self->_homeAffordanceCallToActionLabel setAttributedText:v7];
    }
    else
    {
      [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel setText:v9 forLanguage:v6 animated:0];
    }
    [(SBDashBoardSetupView *)self setNeedsLayout];
  }
}

- (void)setInfoButtonVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = [(UIButton *)self->_infoButton layer];
  if (v8)
  {
    id v19 = v8;
    id v9 = [v8 presentationLayer];
    [v9 opacity];
    float v11 = v10;

    HIDWORD(v12) = 0;
    double v13 = v7 ? 1.0 : 0.0;
    *(float *)&double v12 = v13;
    [v19 setOpacity:v12];
    id v8 = v19;
    if (v6)
    {
      double v14 = v11;
      if (v13 != v14)
      {
        id v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v15 setBeginTime:CACurrentMediaTime() + a5];
        [v15 setDuration:1.0];
        uint64_t v16 = [NSNumber numberWithDouble:v14];
        [v15 setFromValue:v16];

        double v17 = [NSNumber numberWithDouble:v13];
        [v15 setToValue:v17];

        [v15 setFillMode:*MEMORY[0x1E4F39F98]];
        if (v7) {
          double v18 = @"SBDashBoardSetupNormalAnimation";
        }
        else {
          double v18 = @"SBDashBoardSetupResetAnimation";
        }
        [v19 addAnimation:v15, -[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", @"-%@", @"opacity" forKey];

        id v8 = v19;
      }
    }
  }
}

- (void)setChildIconVisible:(BOOL)a3 animated:(BOOL)a4 withDelay:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = [(UIView *)self->_childIconView layer];
  if (v8)
  {
    id v19 = v8;
    id v9 = [v8 presentationLayer];
    [v9 opacity];
    float v11 = v10;

    HIDWORD(v12) = 0;
    double v13 = v7 ? 1.0 : 0.0;
    *(float *)&double v12 = v13;
    [v19 setOpacity:v12];
    id v8 = v19;
    if (v6)
    {
      double v14 = v11;
      if (v13 != v14)
      {
        id v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v15 setBeginTime:CACurrentMediaTime() + a5];
        [v15 setDuration:1.0];
        uint64_t v16 = [NSNumber numberWithDouble:v14];
        [v15 setFromValue:v16];

        double v17 = [NSNumber numberWithDouble:v13];
        [v15 setToValue:v17];

        [v15 setFillMode:*MEMORY[0x1E4F39F98]];
        if (v7) {
          double v18 = @"SBDashBoardSetupNormalAnimation";
        }
        else {
          double v18 = @"SBDashBoardSetupResetAnimation";
        }
        [v19 addAnimation:v15, -[__CFString stringByAppendingFormat:](v18, "stringByAppendingFormat:", @"-%@", @"opacity" forKey];

        id v8 = v19;
      }
    }
  }
}

- (void)setActivationLocked:(BOOL)a3
{
  if (self->_activationLocked != a3)
  {
    self->_activationLocked = a3;
    if (a3 && ![(SBDashBoardSetupView *)self _actsLikeStoreRestricted])
    {
      uint64_t v5 = 0;
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 1;
    }
    [(UILabel *)self->_titleLabel setHidden:v4];
    [(UIView *)self->_childIconView setHidden:v4];
    activationLockStackView = self->_activationLockStackView;
    [(UIStackView *)activationLockStackView setHidden:v5];
  }
}

- (void)setChildIconView:(id)a3
{
  p_childIconView = &self->_childIconView;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(UIView *)*p_childIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_childIconView, a3);
    [(SBDashBoardSetupView *)self addSubview:v6];
    [(SBDashBoardSetupView *)self _updateBaselineAndChildIconConstraints];
    if (self->_activationLocked || [(SBDashBoardSetupView *)self _isShowingModalTakeoverUI]) {
      [(UIView *)*p_childIconView setHidden:1];
    }
  }
}

- (void)animateComponents:(unint64_t)a3 toActive:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  if (a3)
  {
    block = v8;
    id v9 = dispatch_group_create();
    if (a3)
    {
      titleLabel = self->_titleLabel;
      if (titleLabel) {
        [(SBDashBoardSetupView *)self _animateView:titleLabel toActive:v5 withDispatchGroup:v9];
      }
      if (self->_cursiveTextView)
      {
        if (v5)
        {
          [(SBDashBoardSetupView *)self _animateCursiveForTimePassed];
          if (self->_activationLocked) {
            int v11 = BYSetupAssistantHasCompletedInitialRun() ^ 1;
          }
          else {
            int v11 = 0;
          }
          [(SBCursiveTextView *)self->_cursiveTextView setHidden:[(SBDashBoardSetupView *)self _isShowingModalTakeoverUI] | v11];
          [(UIView *)self->_childIconView setHidden:[(SBDashBoardSetupView *)self _isShowingModalTakeoverUI] | v11];
          [(SBDashBoardSetupView *)self _createDisplayLink];
          [(SBDashBoardSetupView *)self _animateView:self->_cursiveTextView toActive:1 withDispatchGroup:v9];
          if ((a3 & 8) != 0)
          {
LABEL_27:
            [(SBDashBoardSetupView *)self _animateView:self->_storeRestrictedContainer toActive:v5 withDispatchGroup:v9];
            if ((a3 & 0x10) != 0)
            {
LABEL_28:
              [(SBDashBoardSetupView *)self _animateView:self->_securityResearchDeviceContainer toActive:v5 withDispatchGroup:v9];
              if ((a3 & 2) != 0)
              {
LABEL_29:
                [(SBDashBoardSetupView *)self _animateHomeButtonCallToActionToActive:v5 withDispatchGroup:v9];
                [(SBDashBoardSetupView *)self _animateHomeAffordanceCallToActionToActive:v5 withDispatchGroup:v9];
                if ((a3 & 4) != 0)
                {
LABEL_30:
                  [(SBDashBoardSetupView *)self _animateHomeAffordanceToActive:v5 withDispatchGroup:v9];
                  if ((a3 & 0x20) == 0) {
                    goto LABEL_18;
                  }
                  goto LABEL_17;
                }
LABEL_16:
                if ((a3 & 0x20) == 0)
                {
LABEL_18:
                  if (block) {
                    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
                  }

                  goto LABEL_21;
                }
LABEL_17:
                [(SBDashBoardSetupView *)self _animateView:self->_activationLockStackView toActive:v5 withDispatchGroup:v9];
                goto LABEL_18;
              }
LABEL_15:
              if ((a3 & 4) != 0) {
                goto LABEL_30;
              }
              goto LABEL_16;
            }
LABEL_14:
            if ((a3 & 2) != 0) {
              goto LABEL_29;
            }
            goto LABEL_15;
          }
LABEL_13:
          if ((a3 & 0x10) != 0) {
            goto LABEL_28;
          }
          goto LABEL_14;
        }
        [(SBDashBoardSetupView *)self _removeDisplayLink];
        [(SBDashBoardSetupView *)self _animateView:self->_cursiveTextView toActive:0 withDispatchGroup:v9];
        [(SBCursiveTextView *)self->_cursiveTextView setHidden:1];
        [(UIView *)self->_childIconView setHidden:1];
      }
    }
    if ((a3 & 8) != 0) {
      goto LABEL_27;
    }
    goto LABEL_13;
  }
  if (!v8) {
    goto LABEL_22;
  }
  block = v8;
  v8[2]();
LABEL_21:
  id v8 = block;
LABEL_22:
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardSetupView;
  [(SBDashBoardSetupView *)&v13 layoutSubviews];
  [(SBDashBoardSetupView *)self _layoutRegulatoryInfo];
  [(SBDashBoardSetupView *)self _layoutActivationInfoView];
  [(SBDashBoardSetupView *)self _layoutHomeButtonCallToAction];
  [(SBDashBoardSetupView *)self _layoutHomeAffordanceCallToAction];
  [(SBDashBoardSetupView *)self _layoutHomeAffordance];
  [(SBDashBoardSetupView *)self bounds];
  homeAffordanceCallToActionLabel = self->_homeAffordanceCallToActionLabel;
  if (homeAffordanceCallToActionLabel)
  {
    [(SBUILegibilityLabel *)homeAffordanceCallToActionLabel frame];
    double v6 = v5 + -33.0;
  }
  else
  {
    homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
    if (homeButtonCallToActionLabel)
    {
      [(SBUICallToActionLabel *)homeButtonCallToActionLabel frame];
      double v6 = v8;
    }
    else
    {
      double v6 = v3;
    }
  }
  [(UIView *)self->_activationInfoView frame];
  double v10 = v9;
  [(UIView *)self->_activationInfoView frame];
  BOOL v12 = v10 + v11 > v6;
  -[SBUILegibilityLabel setHidden:](self->_homeAffordanceCallToActionLabel, "setHidden:", v12, v10 + v11);
  [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel setHidden:v12];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v4 = objc_msgSend(a3, "valueForKey:", @"SBDashBoardSetupDispatchGroup", a4);
  if (v4)
  {
    double v5 = v4;
    dispatch_group_leave(v4);
    uint64_t v4 = v5;
  }
}

- (void)_addInfoButton
{
  double v3 = [MEMORY[0x1E4F427E0] buttonWithType:3];
  infoButton = self->_infoButton;
  self->_infoButton = v3;

  [(UIButton *)self->_infoButton setTranslatesAutoresizingMaskIntoConstraints:0];
  if (_os_feature_enabled_impl())
  {
    double v5 = self->_infoButton;
    double v6 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UIButton *)v5 setTintColor:v6];
  }
  -[UIButton _setTouchInsets:](self->_infoButton, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);
  [(UIButton *)self->_infoButton setAlpha:0.0];
  BOOL v7 = self->_infoButton;
  [(SBDashBoardSetupView *)self addSubview:v7];
}

- (void)_addTitleLabel
{
  if (_os_feature_enabled_impl())
  {
    double v3 = objc_alloc_init(SBCursiveTextView);
    p_cursiveTextView = (id *)&self->_cursiveTextView;
    cursiveTextView = self->_cursiveTextView;
    self->_cursiveTextView = v3;

    double v6 = self->_cursiveTextView;
    BOOL v7 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(SBCursiveTextView *)v6 setFillColor:v7];
  }
  else
  {
    double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    p_cursiveTextView = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    double v10 = self->_titleLabel;
    double v11 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UILabel *)v10 setTextColor:v11];

    BOOL v12 = self->_titleLabel;
    objc_super v13 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:60.0];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
  }
  [*p_cursiveTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = *p_cursiveTextView;
  [(SBDashBoardSetupView *)self addSubview:v14];
}

- (void)_addStoreRestrictedLabels
{
  v71[12] = *MEMORY[0x1E4F143B8];
  double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  storeRestrictedContainer = self->_storeRestrictedContainer;
  self->_storeRestrictedContainer = v3;

  [(UIView *)self->_storeRestrictedContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = (void *)MEMORY[0x1E4F42A80];
  double v6 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:46.0];
  v70 = [v5 systemImageNamed:@"lock.fill" withConfiguration:v6];

  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v70];
  double v8 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [v7 setTintColor:v8];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = v7;
  [(UIView *)self->_storeRestrictedContainer addSubview:v7];
  double v10 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  double v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  storeRestrictedTitleLabel = self->_storeRestrictedTitleLabel;
  self->_storeRestrictedTitleLabel = v11;

  objc_super v13 = self->_storeRestrictedTitleLabel;
  id v14 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)v13 setColor:v14];

  id v15 = self->_storeRestrictedTitleLabel;
  uint64_t v16 = [v10 preferredFontForTextStyle:*MEMORY[0x1E4F438B8] hiFontStyle:4];
  [(UILabel *)v15 setFont:v16];

  [(UILabel *)self->_storeRestrictedTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_storeRestrictedTitleLabel setTextAlignment:1];
  [(UILabel *)self->_storeRestrictedTitleLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_storeRestrictedTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_storeRestrictedContainer addSubview:self->_storeRestrictedTitleLabel];
  double v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  storeRestrictedBodyLabel = self->_storeRestrictedBodyLabel;
  self->_storeRestrictedBodyLabel = v17;

  id v19 = self->_storeRestrictedBodyLabel;
  objc_super v20 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)v19 setColor:v20];

  v21 = self->_storeRestrictedBodyLabel;
  uint64_t v22 = *MEMORY[0x1E4F43870];
  v69 = v10;
  v23 = [v10 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:1];
  [(UILabel *)v21 setFont:v23];

  [(UILabel *)self->_storeRestrictedBodyLabel setNumberOfLines:0];
  [(UILabel *)self->_storeRestrictedBodyLabel setTextAlignment:1];
  [(UILabel *)self->_storeRestrictedBodyLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_storeRestrictedBodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_storeRestrictedContainer addSubview:self->_storeRestrictedBodyLabel];
  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  storeRestrictedLinkLabel = self->_storeRestrictedLinkLabel;
  self->_storeRestrictedLinkLabel = v24;

  v26 = self->_storeRestrictedLinkLabel;
  v27 = [MEMORY[0x1E4F428B8] lightGrayColor];
  [(UILabel *)v26 setColor:v27];

  v28 = self->_storeRestrictedLinkLabel;
  v29 = [v10 preferredFontForTextStyle:v22 hiFontStyle:1];
  [(UILabel *)v28 setFont:v29];

  [(UILabel *)self->_storeRestrictedLinkLabel setNumberOfLines:0];
  [(UILabel *)self->_storeRestrictedLinkLabel setTextAlignment:1];
  [(UILabel *)self->_storeRestrictedLinkLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_storeRestrictedLinkLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_storeRestrictedContainer addSubview:self->_storeRestrictedLinkLabel];
  [(SBDashBoardSetupView *)self addSubview:self->_storeRestrictedContainer];
  v53 = (void *)MEMORY[0x1E4F28DC8];
  v68 = [v9 centerXAnchor];
  v67 = [(UIView *)self->_storeRestrictedContainer centerXAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v71[0] = v66;
  v65 = [(UIView *)self->_storeRestrictedContainer topAnchor];
  v63 = v9;
  v64 = [v9 topAnchor];
  v62 = [v65 constraintEqualToAnchor:v64];
  v71[1] = v62;
  v61 = [(UILabel *)self->_storeRestrictedTitleLabel centerXAnchor];
  v60 = [(UIView *)self->_storeRestrictedContainer centerXAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v71[2] = v59;
  v58 = [(UILabel *)self->_storeRestrictedTitleLabel topAnchor];
  v57 = [v9 bottomAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:20.0];
  v71[3] = v56;
  v55 = [(UILabel *)self->_storeRestrictedBodyLabel centerXAnchor];
  v54 = [(UIView *)self->_storeRestrictedContainer centerXAnchor];
  v52 = [v55 constraintEqualToAnchor:v54];
  v71[4] = v52;
  v51 = [(UILabel *)self->_storeRestrictedBodyLabel topAnchor];
  v50 = [(UILabel *)self->_storeRestrictedTitleLabel bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:15.0];
  v71[5] = v49;
  v48 = [(UILabel *)self->_storeRestrictedLinkLabel centerXAnchor];
  v47 = [(UIView *)self->_storeRestrictedContainer centerXAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v71[6] = v46;
  v45 = [(UILabel *)self->_storeRestrictedLinkLabel topAnchor];
  v44 = [(UILabel *)self->_storeRestrictedBodyLabel bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:15.0];
  v71[7] = v43;
  v42 = [(UIView *)self->_storeRestrictedContainer bottomAnchor];
  v41 = [(UILabel *)self->_storeRestrictedLinkLabel bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v71[8] = v40;
  v39 = [(UIView *)self->_storeRestrictedContainer widthAnchor];
  v38 = [(UILabel *)self->_storeRestrictedTitleLabel widthAnchor];
  v30 = [v39 constraintGreaterThanOrEqualToAnchor:v38];
  v71[9] = v30;
  v31 = [(UIView *)self->_storeRestrictedContainer widthAnchor];
  v32 = [(UILabel *)self->_storeRestrictedBodyLabel widthAnchor];
  v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
  v71[10] = v33;
  v34 = [(UIView *)self->_storeRestrictedContainer widthAnchor];
  v35 = [(UILabel *)self->_storeRestrictedLinkLabel widthAnchor];
  v36 = [v34 constraintGreaterThanOrEqualToAnchor:v35];
  v71[11] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:12];
  [v53 activateConstraints:v37];
}

- (void)_addActivationLockLabels
{
  v38[3] = *MEMORY[0x1E4F143B8];
  if (!self->_activationLockStackView)
  {
    v36 = [MEMORY[0x1E4F42A98] configurationWithPointSize:60.0];
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"lock.fill" withConfiguration:v36];
    double v5 = (UIImageView *)[v3 initWithImage:v4];
    activationLockImage = self->_activationLockImage;
    self->_activationLockImage = v5;

    BOOL v7 = self->_activationLockImage;
    double v8 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UIImageView *)v7 setTintColor:v8];

    [(UIImageView *)self->_activationLockImage setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    activationLockWarningLabel = self->_activationLockWarningLabel;
    self->_activationLockWarningLabel = v9;

    double v11 = self->_activationLockWarningLabel;
    BOOL v12 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UILabel *)v11 setTextColor:v12];

    objc_super v13 = self->_activationLockWarningLabel;
    id v14 = [MEMORY[0x1E4F42A30] systemFontOfSize:32.0 weight:*MEMORY[0x1E4F43908]];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)self->_activationLockWarningLabel setNumberOfLines:0];
    [(UILabel *)self->_activationLockWarningLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_activationLockWarningLabel setTextAlignment:1];
    [(UILabel *)self->_activationLockWarningLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    activationLockDetailLabel = self->_activationLockDetailLabel;
    self->_activationLockDetailLabel = v15;

    double v17 = self->_activationLockDetailLabel;
    double v18 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UILabel *)v17 setTextColor:v18];

    id v19 = self->_activationLockDetailLabel;
    objc_super v20 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)self->_activationLockDetailLabel setNumberOfLines:0];
    [(UILabel *)self->_activationLockDetailLabel setMinimumScaleFactor:0.5];
    [(UILabel *)self->_activationLockDetailLabel setTextAlignment:1];
    [(UILabel *)self->_activationLockDetailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v21 = objc_alloc(MEMORY[0x1E4F42E20]);
    uint64_t v22 = self->_activationLockWarningLabel;
    v38[0] = self->_activationLockImage;
    v38[1] = v22;
    v38[2] = self->_activationLockDetailLabel;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    v24 = (UIStackView *)[v21 initWithArrangedSubviews:v23];
    activationLockStackView = self->_activationLockStackView;
    self->_activationLockStackView = v24;

    [(UIStackView *)self->_activationLockStackView setAxis:1];
    [(UIStackView *)self->_activationLockStackView setAlignment:3];
    [(UIStackView *)self->_activationLockStackView setDistribution:3];
    [(UIStackView *)self->_activationLockStackView setBaselineRelativeArrangement:1];
    [(UIStackView *)self->_activationLockStackView setCustomSpacing:self->_activationLockImage afterView:46.0];
    [(UIStackView *)self->_activationLockStackView setCustomSpacing:self->_activationLockWarningLabel afterView:42.0];
    [(UIStackView *)self->_activationLockStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_activationLockStackView setHidden:1];
    [(SBDashBoardSetupView *)self addSubview:self->_activationLockStackView];
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UIStackView *)self->_activationLockStackView widthAnchor];
    v28 = [v27 constraintLessThanOrEqualToConstant:327.0];
    v37[0] = v28;
    v29 = [(UIStackView *)self->_activationLockStackView centerXAnchor];
    v30 = [(SBDashBoardSetupView *)self centerXAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v37[1] = v31;
    v32 = [(UIStackView *)self->_activationLockStackView centerYAnchor];
    v33 = [(SBDashBoardSetupView *)self centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v37[2] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
    [v26 activateConstraints:v35];
  }
}

- (void)_addSecurityResearchLabels
{
  v56[9] = *MEMORY[0x1E4F143B8];
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  securityResearchDeviceContainer = self->_securityResearchDeviceContainer;
  self->_securityResearchDeviceContainer = v3;

  [(UIView *)self->_securityResearchDeviceContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  securityResearchDeviceTitleLabel = self->_securityResearchDeviceTitleLabel;
  self->_securityResearchDeviceTitleLabel = v6;

  double v8 = self->_securityResearchDeviceTitleLabel;
  double v9 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)v8 setColor:v9];

  double v10 = self->_securityResearchDeviceTitleLabel;
  v54 = v5;
  double v11 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4F438E8] hiFontStyle:4];
  [(UILabel *)v10 setFont:v11];

  [(UILabel *)self->_securityResearchDeviceTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_securityResearchDeviceTitleLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_securityResearchDeviceTitleLabel setTextAlignment:1];
  [(UILabel *)self->_securityResearchDeviceTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_securityResearchDeviceTitleLabel setText:@"Security Research Device"];
  [(UIView *)self->_securityResearchDeviceContainer addSubview:self->_securityResearchDeviceTitleLabel];
  BOOL v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.triangle.fill"];
  objc_super v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:46.0];
  id v14 = [v12 imageWithConfiguration:v13];
  v55 = [v14 imageWithRenderingMode:2];

  id v15 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v55];
  securityResearchHeaderIcon = self->_securityResearchHeaderIcon;
  self->_securityResearchHeaderIcon = v15;

  double v17 = self->_securityResearchHeaderIcon;
  double v18 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UIImageView *)v17 setTintColor:v18];

  [(UIImageView *)self->_securityResearchHeaderIcon setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_securityResearchDeviceContainer addSubview:self->_securityResearchHeaderIcon];
  id v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  securityResearchSubtitleLabel = self->_securityResearchSubtitleLabel;
  self->_securityResearchSubtitleLabel = v19;

  id v21 = self->_securityResearchSubtitleLabel;
  uint64_t v22 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)v21 setColor:v22];

  v23 = self->_securityResearchSubtitleLabel;
  v24 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:1];
  [(UILabel *)v23 setFont:v24];

  [(UILabel *)self->_securityResearchSubtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_securityResearchSubtitleLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_securityResearchSubtitleLabel setTextAlignment:1];
  [(UILabel *)self->_securityResearchSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_securityResearchSubtitleLabel setText:@"Property of Apple Inc."];
  [(UIView *)self->_securityResearchDeviceContainer addSubview:self->_securityResearchSubtitleLabel];
  [(SBDashBoardSetupView *)self addSubview:self->_securityResearchDeviceContainer];
  v43 = (void *)MEMORY[0x1E4F28DC8];
  v53 = [(UIImageView *)self->_securityResearchHeaderIcon centerXAnchor];
  v52 = [(UIView *)self->_securityResearchDeviceContainer centerXAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v56[0] = v51;
  v50 = [(UIView *)self->_securityResearchDeviceContainer topAnchor];
  v49 = [(UIImageView *)self->_securityResearchHeaderIcon topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v56[1] = v48;
  v47 = [(UILabel *)self->_securityResearchDeviceTitleLabel centerXAnchor];
  v46 = [(UIView *)self->_securityResearchDeviceContainer centerXAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v56[2] = v45;
  v44 = [(UILabel *)self->_securityResearchDeviceTitleLabel topAnchor];
  v42 = [(UIImageView *)self->_securityResearchHeaderIcon bottomAnchor];
  v41 = [v44 constraintEqualToAnchor:v42 constant:20.0];
  v56[3] = v41;
  v40 = [(UILabel *)self->_securityResearchSubtitleLabel centerXAnchor];
  v39 = [(UIView *)self->_securityResearchDeviceContainer centerXAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v56[4] = v38;
  v37 = [(UILabel *)self->_securityResearchSubtitleLabel topAnchor];
  v36 = [(UILabel *)self->_securityResearchDeviceTitleLabel bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:15.0];
  v56[5] = v35;
  v34 = [(UIView *)self->_securityResearchDeviceContainer bottomAnchor];
  v25 = [(UILabel *)self->_securityResearchSubtitleLabel bottomAnchor];
  v26 = [v34 constraintEqualToAnchor:v25];
  v56[6] = v26;
  v27 = [(UIView *)self->_securityResearchDeviceContainer widthAnchor];
  v28 = [(UILabel *)self->_securityResearchDeviceTitleLabel widthAnchor];
  v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28];
  v56[7] = v29;
  v30 = [(UIView *)self->_securityResearchDeviceContainer widthAnchor];
  v31 = [(UILabel *)self->_securityResearchSubtitleLabel widthAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31];
  v56[8] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:9];
  [v43 activateConstraints:v33];
}

- (void)_addHomeButtonCallToAction
{
  id v3 = (SBUICallToActionLabel *)objc_alloc_init(MEMORY[0x1E4FA7C78]);
  homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
  self->_homeButtonCallToActionLabel = v3;

  if (_os_feature_enabled_impl())
  {
    double v5 = self->_homeButtonCallToActionLabel;
    double v6 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(SBUICallToActionLabel *)v5 setTintColor:v6];
  }
  [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel bs_setHitTestingDisabled:1];
  [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel setVisible:0 animated:0];
  BOOL v7 = self->_homeButtonCallToActionLabel;
  [(SBDashBoardSetupView *)self addSubview:v7];
}

- (void)_addHomeAffordanceForCoverSheetContext:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4FA6028];
  id v5 = a3;
  double v6 = (SBFTouchPassThroughView *)objc_alloc_init(v4);
  homeAffordanceContainer = self->_homeAffordanceContainer;
  self->_homeAffordanceContainer = v6;

  [(SBDashBoardSetupView *)self addSubview:self->_homeAffordanceContainer];
  double v8 = (CSHomeAffordanceView *)[objc_alloc(MEMORY[0x1E4F5E3F8]) initWithCoverSheetContext:v5];

  homeAffordanceView = self->_homeAffordanceView;
  self->_homeAffordanceView = v8;

  [(CSHomeAffordanceView *)self->_homeAffordanceView setStyle:1];
  double v10 = self->_homeAffordanceContainer;
  double v11 = self->_homeAffordanceView;
  [(SBFTouchPassThroughView *)v10 addSubview:v11];
}

- (void)_addHomeAffordanceCallToAction
{
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  homeAffordanceCallToActionContainer = self->_homeAffordanceCallToActionContainer;
  self->_homeAffordanceCallToActionContainer = v3;

  [(UIView *)self->_homeAffordanceCallToActionContainer bs_setHitTestingDisabled:1];
  [(UIView *)self->_homeAffordanceCallToActionContainer setAlpha:0.0];
  [(SBDashBoardSetupView *)self addSubview:self->_homeAffordanceCallToActionContainer];
  id v5 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C0]];
  id v10 = [v5 fontDescriptorWithSymbolicTraits:32770];

  double v6 = (SBUILegibilityLabel *)objc_alloc_init(MEMORY[0x1E4FA7CA0]);
  homeAffordanceCallToActionLabel = self->_homeAffordanceCallToActionLabel;
  self->_homeAffordanceCallToActionLabel = v6;

  double v8 = self->_homeAffordanceCallToActionLabel;
  double v9 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v10 size:0.0];
  [(SBUILegibilityLabel *)v8 setFont:v9];

  [(SBUILegibilityLabel *)self->_homeAffordanceCallToActionLabel setNumberOfLines:0];
  [(SBUILegibilityLabel *)self->_homeAffordanceCallToActionLabel setTextAlignment:1];
  [(SBUILegibilityLabel *)self->_homeAffordanceCallToActionLabel bs_setHitTestingDisabled:1];
  [(UIView *)self->_homeAffordanceCallToActionContainer addSubview:self->_homeAffordanceCallToActionLabel];
}

- (id)_titleView
{
  titleLabel = self->_titleLabel;
  if (!titleLabel) {
    titleLabel = self->_cursiveTextView;
  }
  return titleLabel;
}

- (void)_updateBaselineAndChildIconConstraints
{
  v40[4] = *MEMORY[0x1E4F143B8];
  if (self->_titleYOffsetConstraint) {
    -[SBDashBoardSetupView removeConstraint:](self, "removeConstraint:");
  }
  childIconView = self->_childIconView;
  uint64_t v4 = [(SBDashBoardSetupView *)self _titleView];
  id v5 = [v4 lastBaselineAnchor];
  double v6 = [(SBDashBoardSetupView *)self centerYAnchor];
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (childIconView)
  {
    if (v7)
    {
      BOOL v9 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      childIconView = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v9 = [childIconView userInterfaceIdiom] == 1;
    }
    double v11 = 32.0;
    if (!v9) {
      double v11 = 14.0;
    }
    BOOL v12 = [v5 constraintEqualToAnchor:v6 constant:v11];
    titleYOffsetConstraint = self->_titleYOffsetConstraint;
    self->_titleYOffsetConstraint = v12;

    if ((v8 & 1) == 0) {
    [(SBDashBoardSetupView *)self addConstraint:self->_titleYOffsetConstraint];
    }
    v35 = (void *)MEMORY[0x1E4F28DC8];
    id v14 = [(UIView *)self->_childIconView leadingAnchor];
    uint64_t v15 = [(SBDashBoardSetupView *)self leadingAnchor];
    v38 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:30.0];
    v40[0] = v38;
    uint64_t v16 = [(UIView *)self->_childIconView trailingAnchor];
    v36 = [(SBDashBoardSetupView *)self trailingAnchor];
    v37 = v16;
    double v17 = objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", -30.0);
    v40[1] = v17;
    double v18 = [(UIView *)self->_childIconView centerXAnchor];
    id v19 = [(SBDashBoardSetupView *)self centerXAnchor];
    objc_super v20 = [v18 constraintEqualToAnchor:v19];
    v40[2] = v20;
    id v21 = [(UIView *)self->_childIconView centerYAnchor];
    uint64_t v22 = [(SBDashBoardSetupView *)self centerYAnchor];
    int v23 = __sb__runningInSpringBoard();
    char v24 = v23;
    v39 = v14;
    v25 = (void *)v15;
    if (v23)
    {
      BOOL v26 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v34 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v26 = [v34 userInterfaceIdiom] == 1;
    }
    double v27 = -90.0;
    if (v26) {
      double v27 = -110.0;
    }
    v28 = [v21 constraintEqualToAnchor:v22 constant:v27];
    v40[3] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    [v35 activateConstraints:v29];

    if ((v24 & 1) == 0) {
  }
    }
  else
  {
    if (v7)
    {
      BOOL v10 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      childIconView = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v10 = [childIconView userInterfaceIdiom] == 1;
    }
    double v30 = -16.0;
    if (v10) {
      double v30 = 0.0;
    }
    v31 = [v5 constraintEqualToAnchor:v6 constant:v30];
    v32 = self->_titleYOffsetConstraint;
    self->_titleYOffsetConstraint = v31;

    if ((v8 & 1) == 0) {
    v33 = self->_titleYOffsetConstraint;
    }
    [(SBDashBoardSetupView *)self addConstraint:v33];
  }
}

- (void)_setupConstraints
{
  v55[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBDashBoardSetupView *)self _titleView];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 leadingAnchor];
    double v6 = [(SBDashBoardSetupView *)self leadingAnchor];
    int v7 = [v5 constraintGreaterThanOrEqualToAnchor:v6 constant:30.0];
    [(SBDashBoardSetupView *)self addConstraint:v7];

    char v8 = [v4 trailingAnchor];
    BOOL v9 = [(SBDashBoardSetupView *)self trailingAnchor];
    BOOL v10 = [v8 constraintLessThanOrEqualToAnchor:v9 constant:-30.0];
    [(SBDashBoardSetupView *)self addConstraint:v10];

    double v11 = [v4 centerXAnchor];
    BOOL v12 = [(SBDashBoardSetupView *)self centerXAnchor];
    objc_super v13 = [v11 constraintEqualToAnchor:v12];
    [(SBDashBoardSetupView *)self addConstraint:v13];

    [(SBDashBoardSetupView *)self _updateBaselineAndChildIconConstraints];
  }
  storeRestrictedContainer = self->_storeRestrictedContainer;
  if (storeRestrictedContainer && self->_storeRestrictedTitleLabel)
  {
    v42 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(UIView *)storeRestrictedContainer leadingAnchor];
    v50 = [(SBDashBoardSetupView *)self leadingAnchor];
    v48 = [v52 constraintEqualToAnchor:v50 constant:30.0];
    v55[0] = v48;
    v46 = [(UIView *)self->_storeRestrictedContainer trailingAnchor];
    v44 = [(SBDashBoardSetupView *)self trailingAnchor];
    uint64_t v15 = [v46 constraintEqualToAnchor:v44 constant:-30.0];
    v55[1] = v15;
    uint64_t v16 = [(UILabel *)self->_storeRestrictedTitleLabel centerXAnchor];
    double v17 = [(SBDashBoardSetupView *)self centerXAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    v55[2] = v18;
    id v19 = [(UILabel *)self->_storeRestrictedTitleLabel centerYAnchor];
    objc_super v20 = [(SBDashBoardSetupView *)self centerYAnchor];
    id v21 = [v19 constraintEqualToAnchor:v20];
    v55[3] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
    [v42 activateConstraints:v22];
  }
  if (self->_securityResearchDeviceTitleLabel)
  {
    securityResearchDeviceContainer = self->_securityResearchDeviceContainer;
    if (securityResearchDeviceContainer)
    {
      v43 = (void *)MEMORY[0x1E4F28DC8];
      v53 = [(UIView *)securityResearchDeviceContainer leadingAnchor];
      v51 = [(SBDashBoardSetupView *)self leadingAnchor];
      v49 = [v53 constraintEqualToAnchor:v51 constant:30.0];
      v54[0] = v49;
      v47 = [(UIView *)self->_securityResearchDeviceContainer trailingAnchor];
      v45 = [(SBDashBoardSetupView *)self trailingAnchor];
      char v24 = [v47 constraintEqualToAnchor:v45 constant:-30.0];
      v54[1] = v24;
      v25 = [(UILabel *)self->_securityResearchDeviceTitleLabel centerXAnchor];
      BOOL v26 = [(SBDashBoardSetupView *)self centerXAnchor];
      double v27 = [v25 constraintEqualToAnchor:v26];
      v54[2] = v27;
      v28 = [(UILabel *)self->_securityResearchDeviceTitleLabel centerYAnchor];
      v29 = [(SBDashBoardSetupView *)self centerYAnchor];
      double v30 = [v28 constraintEqualToAnchor:v29];
      v54[3] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
      [v43 activateConstraints:v31];
    }
  }
  if (self->_infoButton)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass())
      {
        double v32 = 15.0;
        if (SBFEffectiveDeviceClass() != 1) {
          goto LABEL_19;
        }
      }
      double v32 = 15.0;
      if (SBFEffectiveHomeButtonType() != 2) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    v33 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v33 userInterfaceIdiom])
    {

      double v32 = 15.0;
    }
    else
    {
      uint64_t v34 = SBFEffectiveHomeButtonType();

      double v32 = 15.0;
      if (v34 == 2) {
LABEL_18:
      }
        double v32 = 30.0;
    }
LABEL_19:
    v35 = [(UIButton *)self->_infoButton trailingAnchor];
    v36 = [(SBDashBoardSetupView *)self trailingAnchor];
    double v37 = -v32;
    v38 = [v35 constraintEqualToAnchor:v36 constant:v37];
    [(SBDashBoardSetupView *)self addConstraint:v38];

    v39 = [(UIButton *)self->_infoButton bottomAnchor];
    v40 = [(SBDashBoardSetupView *)self bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:v37];
    [(SBDashBoardSetupView *)self addConstraint:v41];
  }
}

- (void)_setupActivationInfoConstraintsIfNeeded
{
  v18[3] = *MEMORY[0x1E4F143B8];
  activationInfoView = self->_activationInfoView;
  activationInfoViewConstraints = self->_activationInfoViewConstraints;
  if (activationInfoView)
  {
    if (!activationInfoViewConstraints)
    {
      [(UIView *)activationInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          double v5 = 120.0;
        }
        else if (SBFEffectiveHomeButtonType() == 2)
        {
          double v5 = 200.0;
        }
        else
        {
          double v5 = 120.0;
        }
      }
      else
      {
        double v6 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v6 userInterfaceIdiom])
        {
          double v5 = 120.0;
        }
        else if (SBFEffectiveHomeButtonType() == 2)
        {
          double v5 = 200.0;
        }
        else
        {
          double v5 = 120.0;
        }
      }
      int v7 = [(UIView *)self->_activationInfoView centerXAnchor];
      char v8 = [(SBDashBoardSetupView *)self centerXAnchor];
      BOOL v9 = [v7 constraintEqualToAnchor:v8];

      BOOL v10 = [(UIView *)self->_activationInfoView topAnchor];
      double v11 = [(SBDashBoardSetupView *)self topAnchor];
      BOOL v12 = [v10 constraintEqualToAnchor:v11 constant:v5];

      objc_super v13 = [(UIButton *)self->_infoButton topAnchor];
      id v14 = [(UIView *)self->_activationInfoView bottomAnchor];
      uint64_t v15 = [v13 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];

      v18[0] = v9;
      v18[1] = v12;
      v18[2] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
      double v17 = self->_activationInfoViewConstraints;
      self->_activationInfoViewConstraints = v16;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_activationInfoViewConstraints];
    }
  }
  else if (activationInfoViewConstraints)
  {
    self->_activationInfoViewConstraints = 0;
  }
}

- (void)_layoutRegulatoryInfo
{
  regulatoryInfoView = self->_regulatoryInfoView;
  if (regulatoryInfoView)
  {
    uint64_t v4 = [(UIView *)regulatoryInfoView superview];

    if (!v4)
    {
      double v5 = self->_regulatoryInfoView;
      [(SBDashBoardSetupView *)self addSubview:v5];
    }
  }
}

- (void)_layoutActivationInfoView
{
  activationInfoView = self->_activationInfoView;
  if (activationInfoView)
  {
    uint64_t v4 = [(UIView *)activationInfoView superview];

    if (!v4) {
      [(SBDashBoardSetupView *)self addSubview:self->_activationInfoView];
    }
    [(SBDashBoardSetupView *)self _setupActivationInfoConstraintsIfNeeded];
  }
}

- (void)_layoutHomeButtonCallToAction
{
  if (self->_homeButtonCallToActionLabel)
  {
    [(SBDashBoardSetupView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel frame];
    objc_msgSend(MEMORY[0x1E4FA5EE0], "suggestedFrameForCallToActionLabel:yOffset:inBounds:", self->_homeButtonCallToActionLabel, CGRectGetHeight(v13) + 15.0, v4, v6, v8, v10);
    homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
    -[SBUICallToActionLabel setFrame:](homeButtonCallToActionLabel, "setFrame:");
  }
}

- (void)_layoutHomeAffordanceCallToAction
{
  if (self->_homeAffordanceCallToActionLabel)
  {
    [(SBDashBoardSetupView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    -[UIView setFrame:](self->_homeAffordanceCallToActionContainer, "setFrame:");
    -[SBUILegibilityLabel sizeThatFits:](self->_homeAffordanceCallToActionLabel, "sizeThatFits:", 200.0, 1.79769313e308);
    double v8 = v7;
    SBRectWithSize();
    -[SBUILegibilityLabel setBounds:](self->_homeAffordanceCallToActionLabel, "setBounds:");
    homeAffordanceCallToActionLabel = self->_homeAffordanceCallToActionLabel;
    -[SBUILegibilityLabel setCenter:](homeAffordanceCallToActionLabel, "setCenter:", v4 * 0.5, v6 - v8 * 0.5 + -11.0);
  }
}

- (void)_layoutHomeAffordance
{
  if (self->_homeAffordanceView)
  {
    [(SBDashBoardSetupView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[SBFTouchPassThroughView setFrame:](self->_homeAffordanceContainer, "setFrame:");
    v18.origin.double x = v4;
    v18.origin.double y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double MidX = CGRectGetMidX(v18);
    v19.origin.double x = v4;
    v19.origin.double y = v6;
    v19.size.double width = v8;
    v19.size.double height = v10;
    double Height = CGRectGetHeight(v19);
    [(CSHomeAffordanceView *)self->_homeAffordanceView bounds];
    double v14 = Height + v13 * -0.5;
    [(CSHomeAffordanceView *)self->_homeAffordanceView suggestedEdgeSpacing];
    homeAffordanceView = self->_homeAffordanceView;
    -[CSHomeAffordanceView setCenter:](homeAffordanceView, "setCenter:", MidX, v14 - v15);
  }
}

- (void)_animateView:(id)a3 toActive:(BOOL)a4 withDispatchGroup:(id)a5
{
  BOOL v5 = a4;
  v16[4] = *MEMORY[0x1E4F143B8];
  CGFloat v8 = a5;
  double v9 = [a3 layer];
  if (v9)
  {
    if (v5)
    {
      dispatch_group_enter(v8);
      [(SBDashBoardSetupView *)self _removeResetAnimationForKeyPath:@"opacity" onLayer:v9];
      [(SBDashBoardSetupView *)self _removeNormalAnimationForKeyPath:@"opacity" onLayer:v9];
      CGFloat v10 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v10 setKeyTimes:&unk_1F3348708];
      double v11 = NSNumber;
      [v9 opacity];
      BOOL v12 = objc_msgSend(v11, "numberWithFloat:");
      v16[0] = v12;
      v16[1] = &unk_1F3348E98;
      v16[2] = &unk_1F3348E98;
      v16[3] = &unk_1F3348EA8;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
      [v10 setValues:v13];

      [v10 setCalculationMode:@"linear"];
      [v10 setDuration:self->_customDelayDuration];
      [v10 setDelegate:self];
      [v10 setValue:v8 forKey:@"SBDashBoardSetupDispatchGroup"];
      double v14 = [v10 keyPath];
      [v9 addAnimation:v10, objc_msgSend(@"SBDashBoardSetupNormalAnimation", "stringByAppendingFormat:", @"-%@", v14) forKey];

      [v9 setOpacity:0.0];
    }
    else
    {
      [(SBDashBoardSetupView *)self _addResetAnimationForKeyPath:@"opacity" onLayer:v9 dispatchGroup:v8];
      LODWORD(v15) = 1.0;
      [v9 setOpacity:v15];
    }
  }
}

- (void)_animateHomeButtonCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  BOOL v4 = a3;
  CGFloat v6 = a4;
  double v7 = v6;
  if (self->_homeButtonCallToActionLabel)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      dispatch_group_enter(v7);
      homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke;
      v28[3] = &unk_1E6AF4AC0;
      double v9 = (id *)&v29;
      CGFloat v10 = v7;
      v29 = v10;
      [(SBUICallToActionLabel *)homeButtonCallToActionLabel fadeInImmediately:1 completion:v28];
      objc_initWeak(&location, self);
      double v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      homeButtonCallToActionTimer = self->_homeButtonCallToActionTimer;
      self->_homeButtonCallToActionTimer = v11;

      dispatch_time_t v13 = dispatch_time(0, (uint64_t)((self->_customDelayDuration + -1.0) * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_homeButtonCallToActionTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
      double v14 = self->_homeButtonCallToActionTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_2;
      handler[3] = &unk_1E6AF5AF0;
      objc_copyWeak(&v26, &location);
      double v15 = v10;
      v25 = v15;
      dispatch_source_set_event_handler(v14, handler);
      uint64_t v16 = self->_homeButtonCallToActionTimer;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_4;
      v22[3] = &unk_1E6AF4AC0;
      int v23 = v15;
      dispatch_source_set_cancel_handler(v16, v22);
      dispatch_resume((dispatch_object_t)self->_homeButtonCallToActionTimer);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      double v17 = self->_homeButtonCallToActionTimer;
      if (v17)
      {
        dispatch_source_cancel(v17);
        CGRect v18 = self->_homeButtonCallToActionTimer;
        self->_homeButtonCallToActionTimer = 0;
      }
      dispatch_group_enter(v7);
      CGRect v19 = self->_homeButtonCallToActionLabel;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_5;
      v20[3] = &unk_1E6AF4AC0;
      double v9 = (id *)&v21;
      id v21 = v7;
      [(SBUICallToActionLabel *)v19 fadeOutWithDuration:v20 completion:0.0];
    }
  }
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke(uint64_t a1)
{
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = (void *)WeakRetained[69];
    WeakRetained[69] = 0;

    BOOL v5 = (void *)v3[68];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_3;
    v6[3] = &unk_1E6AF4AC0;
    id v7 = *(id *)(a1 + 32);
    [v5 fadeOutWithDuration:v6 completion:1.0];
  }
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_3(uint64_t a1)
{
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_4(uint64_t a1)
{
}

void __81__SBDashBoardSetupView__animateHomeButtonCallToActionToActive_withDispatchGroup___block_invoke_5(uint64_t a1)
{
}

- (void)_animateHomeAffordanceCallToActionToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  BOOL v4 = a3;
  v18[5] = *MEMORY[0x1E4F143B8];
  CGFloat v6 = a4;
  id v7 = [(UIView *)self->_homeAffordanceCallToActionContainer layer];
  if (v7)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      dispatch_group_enter(v6);
      [(SBDashBoardSetupView *)self _removeResetAnimationForKeyPath:@"opacity" onLayer:v7];
      [(SBDashBoardSetupView *)self _removeNormalAnimationForKeyPath:@"opacity" onLayer:v7];
      [(SBDashBoardSetupView *)self _removeResetAnimationForKeyPath:@"position.y" onLayer:v7];
      [(SBDashBoardSetupView *)self _removeNormalAnimationForKeyPath:@"position.y" onLayer:v7];
      CGFloat v8 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v8 setKeyTimes:&unk_1F3348720];
      [v8 setValues:&unk_1F3348738];
      [v8 setCalculationMode:@"cubic"];
      [v8 setBeginTime:CACurrentMediaTime() + 1.0];
      [v8 setDuration:self->_customDelayDuration];
      [v8 setDelegate:self];
      [v8 setValue:v6 forKey:@"SBDashBoardSetupDispatchGroup"];
      double v9 = [v8 keyPath];
      [v7 addAnimation:v8, objc_msgSend(@"SBDashBoardSetupNormalAnimation", "stringByAppendingFormat:", @"-%@", v9) forKey];

      CGFloat v10 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
      [v10 setKeyTimes:&unk_1F3348750];
      double v17 = [NSNumber numberWithDouble:0.0];
      v18[0] = v17;
      double v11 = [NSNumber numberWithDouble:-16.0];
      v18[1] = v11;
      BOOL v12 = [NSNumber numberWithDouble:-30.0];
      v18[2] = v12;
      dispatch_time_t v13 = [NSNumber numberWithDouble:-33.0];
      v18[3] = v13;
      double v14 = [NSNumber numberWithDouble:-33.0];
      void v18[4] = v14;
      double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
      [v10 setValues:v15];

      [v10 setCalculationMode:@"cubic"];
      [v10 setBeginTime:CACurrentMediaTime() + 1.0];
      [v10 setDuration:self->_customDelayDuration];
      [v10 setAdditive:1];
      [v10 setDelegate:self];
      [v10 setValue:v6 forKey:@"SBDashBoardSetupDispatchGroup"];
      uint64_t v16 = [v10 keyPath];
      [v7 addAnimation:v10, objc_msgSend(@"SBDashBoardSetupNormalAnimation", "stringByAppendingFormat:", @"-%@", v16) forKey];
    }
    else
    {
      [(SBDashBoardSetupView *)self _addResetAnimationForKeyPath:@"opacity" onLayer:v7 dispatchGroup:v6];
      [(SBDashBoardSetupView *)self _addResetAnimationForKeyPath:@"position.y" onLayer:v7 dispatchGroup:v6];
    }
  }
}

- (void)_animateHomeAffordanceToActive:(BOOL)a3 withDispatchGroup:(id)a4
{
  BOOL v4 = a3;
  void v16[5] = *MEMORY[0x1E4F143B8];
  CGFloat v6 = a4;
  id v7 = [(SBFTouchPassThroughView *)self->_homeAffordanceContainer layer];
  if (v7)
  {
    if (v4)
    {
      dispatch_group_enter(v6);
      [(SBDashBoardSetupView *)self _removeResetAnimationForKeyPath:@"position.y" onLayer:v7];
      [(SBDashBoardSetupView *)self _removeNormalAnimationForKeyPath:@"position.y" onLayer:v7];
      CGFloat v8 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.y"];
      [v8 setKeyTimes:&unk_1F3348768];
      double v9 = [NSNumber numberWithDouble:0.0];
      v16[0] = v9;
      CGFloat v10 = [NSNumber numberWithDouble:-5.0];
      v16[1] = v10;
      double v11 = [NSNumber numberWithDouble:-15.0];
      v16[2] = v11;
      BOOL v12 = [NSNumber numberWithDouble:-2.0];
      v16[3] = v12;
      dispatch_time_t v13 = [NSNumber numberWithDouble:0.0];
      v16[4] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
      [v8 setValues:v14];

      [v8 setCalculationMode:@"cubic"];
      [v8 setBeginTime:CACurrentMediaTime() + 1.0];
      [v8 setDuration:self->_customDelayDuration];
      [v8 setAdditive:1];
      [v8 setDelegate:self];
      [v8 setValue:v6 forKey:@"SBDashBoardSetupDispatchGroup"];
      double v15 = [v8 keyPath];
      [v7 addAnimation:v8, objc_msgSend(@"SBDashBoardSetupNormalAnimation", "stringByAppendingFormat:", @"-%@", v15) forKey];
    }
    else
    {
      [(SBDashBoardSetupView *)self _addResetAnimationForKeyPath:@"position.y" onLayer:v7 dispatchGroup:v6];
    }
  }
}

- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4 dispatchGroup:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  double v9 = a5;
  CGFloat v10 = [v8 presentationLayer];
  double v11 = [v10 valueForKeyPath:v21];
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [v8 valueForKeyPath:v21];
  [v14 doubleValue];
  double v16 = v15;

  if (v9) {
    dispatch_group_enter(v9);
  }
  [(SBDashBoardSetupView *)self _removeNormalAnimationForKeyPath:v21 onLayer:v8];
  double v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v21];
  [v17 setDuration:0.25];
  CGRect v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v18];

  CGRect v19 = [NSNumber numberWithDouble:v13];
  [v17 setFromValue:v19];

  objc_super v20 = [NSNumber numberWithDouble:v16];
  [v17 setToValue:v20];

  [v17 setValue:v9 forKey:@"SBDashBoardSetupDispatchGroup"];
  [v8 addAnimation:v17, objc_msgSend(@"SBDashBoardSetupResetAnimation", "stringByAppendingFormat:", @"-%@", v21) forKey];
}

- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5 = a4;
  [v5 removeAnimationForKey:objc_msgSend(@"SBDashBoardSetupResetAnimation", "stringByAppendingFormat:", @"-%@", a3)];
}

- (void)_removeNormalAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5 = a4;
  [v5 removeAnimationForKey:objc_msgSend(@"SBDashBoardSetupNormalAnimation", "stringByAppendingFormat:", @"-%@", a3)];
}

- (void)_createDisplayLink
{
  if (self->_displayLink) {
    [(SBDashBoardSetupView *)self _removeDisplayLink];
  }
  double v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
  displayLink = self->_displayLink;
  self->_displayLink = v3;

  id v5 = self->_displayLink;
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
  [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1114135];
  CGFloat v6 = self->_displayLink;
  id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_removeDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)_onDisplayLink:(id)a3
{
  if (self->_displayLink == a3) {
    [(SBDashBoardSetupView *)self _animateCursiveForTimePassed];
  }
}

- (void)_animateCursiveForTimePassed
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(float *)&CFAbsoluteTime Current = Current - self->_startTime;
  [(SBCursiveTextView *)self->_cursiveTextView setTime:Current];
  if (BSFloatGreaterThanFloat())
  {
    [(SBDashBoardSetupView *)self _removeDisplayLink];
  }
}

- (BOOL)_isShowingModalTakeoverUI
{
  return self->_activationInfoView || self->_regulatoryInfoView != 0;
}

- (void)_adjustTitleVisibilityForInfoViews
{
  BOOL v3 = [(SBDashBoardSetupView *)self _isShowingModalTakeoverUI];
  titleLabel = self->_titleLabel;
  if (v3)
  {
    [(UILabel *)titleLabel setHidden:1];
    [(SBCursiveTextView *)self->_cursiveTextView setHidden:1];
    [(CADisplayLink *)self->_displayLink setPaused:1];
    [(UIView *)self->_storeRestrictedContainer setHidden:1];
    [(UIView *)self->_securityResearchDeviceContainer setHidden:1];
    [(UIStackView *)self->_activationLockStackView setHidden:1];
    childIconView = self->_childIconView;
    BOOL activationLocked = 1;
  }
  else
  {
    [(UILabel *)titleLabel setHidden:self->_activationLocked];
    [(SBCursiveTextView *)self->_cursiveTextView setHidden:self->_activationLocked];
    [(CADisplayLink *)self->_displayLink setPaused:self->_activationLocked];
    [(UIView *)self->_storeRestrictedContainer setHidden:0];
    [(UIView *)self->_securityResearchDeviceContainer setHidden:0];
    [(UIStackView *)self->_activationLockStackView setHidden:!self->_activationLocked];
    childIconView = self->_childIconView;
    BOOL activationLocked = self->_activationLocked;
  }
  [(UIView *)childIconView setHidden:activationLocked];
}

- (void)_updateLegibilitySettings
{
  [(SBUILegibilityLabel *)self->_homeAffordanceCallToActionLabel setLegibilitySettings:self->_legibilitySettings];
  [(SBUICallToActionLabel *)self->_homeButtonCallToActionLabel setLegibilitySettings:self->_legibilitySettings];
  [(CSHomeAffordanceView *)self->_homeAffordanceView setLegibilitySettings:self->_legibilitySettings];
  int v3 = _os_feature_enabled_impl();
  legibilitySettings = self->_legibilitySettings;
  if (v3)
  {
    cursiveTextView = self->_cursiveTextView;
    CGFloat v6 = [(_UILegibilitySettings *)legibilitySettings primaryColor];
    [(SBCursiveTextView *)cursiveTextView setFillColor:v6];

    infoButton = self->_infoButton;
    id v8 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UIButton *)infoButton setTintColor:v8];

    homeButtonCallToActionLabel = self->_homeButtonCallToActionLabel;
    CGFloat v10 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(SBUICallToActionLabel *)homeButtonCallToActionLabel setTintColor:v10];
  }
  else
  {
    titleLabel = self->_titleLabel;
    CGFloat v10 = [(_UILegibilitySettings *)legibilitySettings primaryColor];
    [(UILabel *)titleLabel setTextColor:v10];
  }

  storeRestrictedTitleLabel = self->_storeRestrictedTitleLabel;
  double v13 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)storeRestrictedTitleLabel setColor:v13];

  storeRestrictedBodyLabel = self->_storeRestrictedBodyLabel;
  double v15 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)storeRestrictedBodyLabel setColor:v15];

  activationLockImage = self->_activationLockImage;
  double v17 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UIImageView *)activationLockImage setTintColor:v17];

  activationLockWarningLabel = self->_activationLockWarningLabel;
  CGRect v19 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)activationLockWarningLabel setTextColor:v19];

  activationLockDetailLabel = self->_activationLockDetailLabel;
  id v21 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)activationLockDetailLabel setTextColor:v21];

  securityResearchDeviceTitleLabel = self->_securityResearchDeviceTitleLabel;
  int v23 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)securityResearchDeviceTitleLabel setColor:v23];

  securityResearchHeaderIcon = self->_securityResearchHeaderIcon;
  v25 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UIImageView *)securityResearchHeaderIcon setTintColor:v25];

  securityResearchSubtitleLabel = self->_securityResearchSubtitleLabel;
  id v27 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)securityResearchSubtitleLabel setColor:v27];
}

- (BOOL)_actsLikeStoreRestricted
{
  return self->_isStoreRestricted && !self->_isSecurityResearchDevice;
}

- (CSHomeAffordanceView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
}

- (UIView)activationInfoView
{
  return self->_activationInfoView;
}

- (UIView)regulatoryInfoView
{
  return self->_regulatoryInfoView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (BOOL)isActivationLocked
{
  return self->_activationLocked;
}

- (UIView)childIconView
{
  return self->_childIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childIconView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoView, 0);
  objc_storeStrong((id *)&self->_activationInfoView, 0);
  objc_storeStrong((id *)&self->_titleYOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_cursiveTextView, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_activationInfoViewConstraints, 0);
  objc_storeStrong((id *)&self->_homeButtonCallToActionTimer, 0);
  objc_storeStrong((id *)&self->_homeButtonCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_homeAffordanceCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_homeAffordanceCallToActionContainer, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceContainer, 0);
  objc_storeStrong((id *)&self->_securityResearchSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_securityResearchHeaderIcon, 0);
  objc_storeStrong((id *)&self->_securityResearchDeviceContainer, 0);
  objc_storeStrong((id *)&self->_securityResearchDeviceTitleLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedContainer, 0);
  objc_storeStrong((id *)&self->_storeRestrictedLinkLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedBodyLabel, 0);
  objc_storeStrong((id *)&self->_storeRestrictedTitleLabel, 0);
  objc_storeStrong((id *)&self->_activationLockDetailLabel, 0);
  objc_storeStrong((id *)&self->_activationLockWarningLabel, 0);
  objc_storeStrong((id *)&self->_activationLockImage, 0);
  objc_storeStrong((id *)&self->_activationLockStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
@interface UIStatusBarCarPlayDockItemView
- (BOOL)allowsUserInteraction;
- (BOOL)animatesDataChange;
- (BOOL)isShowingCallTimer;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (NSArray)currentBundleIdentifiers;
- (NSLayoutConstraint)inCallLabelSpacingConstraint;
- (NSLayoutConstraint)itemOneTopConstraint;
- (NSString)currentActiveBundleIdentifier;
- (UILabel)inCallDurationLabel;
- (UIStatusBarCarPlayDockAppItemButton)itemOneButton;
- (UIStatusBarCarPlayDockAppItemButton)itemThreeButton;
- (UIStatusBarCarPlayDockAppItemButton)itemTwoButton;
- (UIStatusBarCarPlayDockItemView)initWithFrame:(CGRect)a3;
- (UIView)preferredItemViewToFocus;
- (double)_neededSizeWithCallTimer;
- (double)_neededSizeWithoutCallTimer;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (double)neededSizeForImageSet:(id)a3;
- (id)_toItemViewForBundleIdentifier:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)preferredFocusEnvironments;
- (unint64_t)_numberOfEnabledItems;
- (void)_updateInCallDurationIfNecessary:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentActiveBundleIdentifier:(id)a3;
- (void)setCurrentBundleIdentifiers:(id)a3;
- (void)setInCallDurationLabel:(id)a3;
- (void)setInCallLabelSpacingConstraint:(id)a3;
- (void)setItemOneButton:(id)a3;
- (void)setItemOneTopConstraint:(id)a3;
- (void)setItemThreeButton:(id)a3;
- (void)setItemTwoButton:(id)a3;
- (void)setPreferredItemViewToFocus:(id)a3;
- (void)setShowingCallTimer:(BOOL)a3;
- (void)updateForNewStyle:(id)a3;
@end

@implementation UIStatusBarCarPlayDockItemView

- (UIStatusBarCarPlayDockItemView)initWithFrame:(CGRect)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)UIStatusBarCarPlayDockItemView;
  v3 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStatusBarCarPlayDockAppItemButton alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    itemOneButton = v3->_itemOneButton;
    v3->_itemOneButton = (UIStatusBarCarPlayDockAppItemButton *)v9;

    [(UIView *)v3 addSubview:v3->_itemOneButton];
    v11 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:]([UIStatusBarCarPlayDockAppItemButton alloc], "initWithFrame:", v5, v6, v7, v8);
    itemTwoButton = v3->_itemTwoButton;
    v3->_itemTwoButton = v11;

    [(UIView *)v3 addSubview:v3->_itemTwoButton];
    v13 = -[UIStatusBarCarPlayDockAppItemButton initWithFrame:]([UIStatusBarCarPlayDockAppItemButton alloc], "initWithFrame:", v5, v6, v7, v8);
    itemThreeButton = v3->_itemThreeButton;
    v3->_itemThreeButton = v13;

    [(UIView *)v3 addSubview:v3->_itemThreeButton];
    v15 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    inCallDurationLabel = v3->_inCallDurationLabel;
    v3->_inCallDurationLabel = v15;

    [(UIView *)v3->_inCallDurationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3 addSubview:v3->_inCallDurationLabel];
    [(UIView *)v3->_inCallDurationLabel setHidden:1];
    v17 = [(UIView *)v3->_inCallDurationLabel firstBaselineAnchor];
    v18 = [(UIView *)v3->_itemThreeButton bottomAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18 constant:5.5];
    inCallLabelSpacingConstraint = v3->_inCallLabelSpacingConstraint;
    v3->_inCallLabelSpacingConstraint = (NSLayoutConstraint *)v19;

    v27[0] = v3->_inCallLabelSpacingConstraint;
    v21 = [(UIView *)v3->_inCallDurationLabel centerXAnchor];
    v22 = [(UIView *)v3 centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v27[1] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

    [MEMORY[0x1E4F5B268] activateConstraints:v24];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarCarPlayDockItemView;
  double v6 = [(UIView *)&v19 hitTest:a4 withEvent:a3.x];
  double v7 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
  if (v6 != v7) {
    goto LABEL_2;
  }
  int v8 = [v6 isActive];

  if (v8)
  {
    uint64_t v9 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
    [v9 origin];
    if (_UIInternalPreferencesRevisionOnce != -1)
    {
      double v17 = v10;
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      double v10 = v17;
    }
    double v11 = 15.0;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v15 = _UIInternalPreference_CarPlayDockSecondItemHitTestExtension;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_CarPlayDockSecondItemHitTestExtension)
      {
        int v16 = _UIInternalPreferencesRevisionVar;
        double v18 = v10;
        while (v16 >= v15)
        {
          _UIInternalPreferenceSync(v16, &_UIInternalPreference_CarPlayDockSecondItemHitTestExtension, @"CarPlayDockSecondItemHitTestExtension", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
          int v15 = _UIInternalPreference_CarPlayDockSecondItemHitTestExtension;
          if (v16 == _UIInternalPreference_CarPlayDockSecondItemHitTestExtension)
          {
            double v10 = v18;
            double v11 = 15.0;
            goto LABEL_7;
          }
        }
        double v11 = *(double *)&qword_1E8FD5430;
        double v10 = v18;
      }
    }
LABEL_7:
    double v12 = v10 - v11;

    if (y > v12)
    {
      uint64_t v13 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
      double v7 = v6;
      double v6 = (void *)v13;
LABEL_2:
    }
  }
  return v6;
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v4 = v3;
  UIRoundToViewScale(self);
  double v6 = v5;
  double v7 = v5 + 38.0;
  double v8 = v5 + 38.0 + 38.0;
  uint64_t v9 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
  objc_msgSend(v9, "setFrame:", 0.0, v6, v4, 38.0);

  double v10 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
  objc_msgSend(v10, "setFrame:", 0.0, v7, v4, 38.0);

  id v11 = [(UIStatusBarCarPlayDockItemView *)self itemThreeButton];
  objc_msgSend(v11, "setFrame:", 0.0, v8, v4, 38.0);
}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (double)_neededSizeWithCallTimer
{
  double v3 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  [v3 frame];
  double v5 = v4;
  double v6 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  [v6 _firstBaselineOffsetFromTop];
  double v8 = v5 + v7 + 8.0;

  return v8;
}

- (double)_neededSizeWithoutCallTimer
{
  return (double)[(UIStatusBarCarPlayDockItemView *)self _numberOfEnabledItems] * 38.0 + 3.5;
}

- (double)neededSizeForImageSet:(id)a3
{
  if ([(UIStatusBarCarPlayDockItemView *)self isShowingCallTimer])
  {
    [(UIStatusBarCarPlayDockItemView *)self _neededSizeWithCallTimer];
  }
  else
  {
    [(UIStatusBarCarPlayDockItemView *)self _neededSizeWithoutCallTimer];
  }
  return result;
}

- (void)updateForNewStyle:(id)a3
{
  id v4 = a3;
  double v5 = [v4 untintedImageNamed:@"AppIcon_Highlight_Sliced"];
  double v6 = [v5 imageWithRenderingMode:2];
  double v7 = +[UIColor externalSystemTealColor];
  id v29 = [v6 _flatImageWithColor:v7];

  double v8 = objc_msgSend(v29, "resizableImageWithCapInsets:", 12.0, 12.0, 12.0, 12.0);
  uint64_t v9 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
  double v10 = [v9 iconHighlightImageView];
  [v10 setImage:v8];

  id v11 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
  double v12 = [v11 iconHighlightImageView];
  [v12 setImage:v8];

  uint64_t v13 = [(UIStatusBarCarPlayDockItemView *)self itemThreeButton];
  v14 = [v13 iconHighlightImageView];
  [v14 setImage:v8];

  int v15 = [v4 untintedImageNamed:@"Dock_Badge"];
  int v16 = +[UIColor redColor];
  double v17 = [v15 _flatImageWithColor:v16];

  double v18 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
  objc_super v19 = [v18 badgeView];
  [v19 setImage:v17];

  v20 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
  v21 = [v20 badgeView];
  [v21 setImage:v17];

  v22 = [(UIStatusBarCarPlayDockItemView *)self itemThreeButton];
  v23 = [v22 badgeView];
  [v23 setImage:v17];

  v24 = [v4 textFontForStyle:4];

  v25 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  [v25 setFont:v24];

  objc_super v26 = +[UIColor whiteColor];
  v27 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  [v27 setTextColor:v26];

  v28 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  [v28 setTextAlignment:1];
}

- (BOOL)animatesDataChange
{
  return 1;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ((v4 & 0x100) != 0)
  {
    double v8 = [(UIStatusBarItemView *)self foregroundView];
    uint64_t v9 = [v8 statusBar];
    double v10 = [v9 dockDataProvider];

    if (!v10)
    {
LABEL_27:

      BOOL v7 = 1;
      goto LABEL_28;
    }
    id v11 = [v10 bundleIdentifiers];
    double v12 = [v10 activeBundleIdentifier];
    uint64_t v13 = [(UIStatusBarCarPlayDockItemView *)self currentBundleIdentifiers];
    uint64_t v14 = [v11 count];
    if (v14)
    {
      unint64_t v15 = v14;
      uint64_t v16 = [v11 firstObject];
      if (v15 == 1)
      {
        double v17 = 0;
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = [v11 objectAtIndex:1];
        if (v15 < 3)
        {
          double v17 = 0;
        }
        else
        {
          double v17 = [v11 objectAtIndex:2];
        }
      }
    }
    else
    {
      double v17 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = 0;
    }
    v59 = (void *)v16;
    unsigned int v55 = [v10 shouldDisplayBadgeForBundleIdentifier:v16];
    v58 = (void *)v18;
    uint64_t v19 = [v10 shouldDisplayBadgeForBundleIdentifier:v18];
    uint64_t v20 = [v10 shouldDisplayBadgeForBundleIdentifier:v17];
    v62 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
    v61 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
    v60 = [(UIStatusBarCarPlayDockItemView *)self itemThreeButton];
    v57 = (void *)v13;
    unsigned int v54 = v19;
    if ([v11 isEqualToArray:v13])
    {
      v21 = [(UIStatusBarCarPlayDockItemView *)self currentActiveBundleIdentifier];
      v22 = v21;
      if ((v12 == 0) != (v21 != 0))
      {
        uint64_t v23 = [(UIStatusBarCarPlayDockItemView *)self currentActiveBundleIdentifier];
        if (!v23)
        {

LABEL_30:
          [v62 setHasBadge:v55];
          objc_msgSend(v62, "setBadgeHidden:animated:", objc_msgSend(v62, "shouldShowBadge") ^ 1, 1);
          [v61 setHasBadge:v19];
          objc_msgSend(v61, "setBadgeHidden:animated:", objc_msgSend(v61, "shouldShowBadge") ^ 1, 1);
          [v60 setHasBadge:v20];
          objc_msgSend(v60, "setBadgeHidden:animated:", objc_msgSend(v60, "shouldShowBadge") ^ 1, 1);
          v38 = v57;
          v40 = v58;
          v39 = v59;
LABEL_26:
          v41 = [v10 callDuration];
          [(UIStatusBarCarPlayDockItemView *)self _updateInCallDurationIfNecessary:v41];

          goto LABEL_27;
        }
        v24 = (void *)v23;
        [(UIStatusBarCarPlayDockItemView *)self currentActiveBundleIdentifier];
        objc_super v26 = v25 = v20;
        char v50 = [v26 isEqualToString:v12];

        uint64_t v20 = v25;
        uint64_t v19 = v54;

        if (v50) {
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    char v53 = v20;
    v27 = [(UIView *)self traitCollection];
    v28 = [v10 dockImageForBundleIdentifier:v59 format:9 traitCollection:v27];

    id v29 = [(UIView *)self traitCollection];
    v51 = [v10 dockImageForBundleIdentifier:v58 format:9 traitCollection:v29];

    v30 = [(UIView *)self traitCollection];
    v48 = [v10 dockImageForBundleIdentifier:v17 format:9 traitCollection:v30];

    [v62 setUserInteractionEnabled:0];
    [v61 setUserInteractionEnabled:0];
    [v60 setUserInteractionEnabled:0];
    v118[0] = 0;
    v118[1] = v118;
    v118[2] = 0x3032000000;
    v118[3] = __Block_byref_object_copy__175;
    v118[4] = __Block_byref_object_dispose__175;
    if (v59)
    {
      v31 = [(UIStatusBarCarPlayDockItemView *)self _toItemViewForBundleIdentifier:v59];
    }
    else
    {
      v31 = 0;
    }
    id v119 = v31;
    if (v58)
    {
      v32 = [(UIStatusBarCarPlayDockItemView *)self _toItemViewForBundleIdentifier:v58];
    }
    else
    {
      v32 = 0;
    }
    v56 = v17;
    if (v17)
    {
      double v17 = [(UIStatusBarCarPlayDockItemView *)self _toItemViewForBundleIdentifier:v17];
    }
    v116[0] = 0;
    v116[1] = v116;
    v116[2] = 0x3032000000;
    v116[3] = __Block_byref_object_copy__175;
    v116[4] = __Block_byref_object_dispose__175;
    id v117 = 0;
    v114[0] = 0;
    v114[1] = v114;
    v114[2] = 0x3032000000;
    v114[3] = __Block_byref_object_copy__175;
    v114[4] = __Block_byref_object_dispose__175;
    id v115 = 0;
    v112[0] = 0;
    v112[1] = v112;
    v112[2] = 0x3032000000;
    v112[3] = __Block_byref_object_copy__175;
    v112[4] = __Block_byref_object_dispose__175;
    id v113 = 0;
    v110[0] = 0;
    v110[1] = v110;
    v110[2] = 0x3032000000;
    v110[3] = __Block_byref_object_copy__175;
    v110[4] = __Block_byref_object_dispose__175;
    id v111 = 0;
    v108[0] = 0;
    v108[1] = v108;
    v108[2] = 0x3032000000;
    v108[3] = __Block_byref_object_copy__175;
    v108[4] = __Block_byref_object_dispose__175;
    id v109 = 0;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke;
    v83[3] = &unk_1E5304E30;
    v99 = v118;
    id v84 = v57;
    v45 = v11;
    id v46 = v11;
    id v85 = v46;
    v86 = self;
    v100 = v108;
    v101 = v114;
    id v87 = v59;
    v102 = v112;
    id v88 = v58;
    id v44 = v32;
    id v89 = v44;
    v103 = v110;
    id v90 = v56;
    id v43 = v17;
    id v91 = v43;
    id v47 = v28;
    id v92 = v47;
    id v33 = v62;
    id v93 = v33;
    id v34 = v61;
    id v94 = v34;
    id v35 = v60;
    id v95 = v35;
    v104 = v116;
    id v36 = v12;
    id v96 = v36;
    id v52 = v51;
    id v97 = v52;
    id v49 = v48;
    id v98 = v49;
    char v105 = v55;
    char v106 = v54;
    char v107 = v53;
    +[UIView performWithoutAnimation:v83];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_3;
    v73[3] = &unk_1E5304E58;
    v78 = v114;
    v79 = v112;
    v80 = v110;
    id v37 = v36;
    id v74 = v37;
    v81 = v108;
    id v75 = v33;
    id v76 = v34;
    id v77 = v35;
    v82 = v116;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_4;
    v64[3] = &unk_1E5304E80;
    id v65 = v75;
    id v66 = v76;
    id v67 = v77;
    v68 = self;
    v69 = v114;
    v70 = v108;
    v71 = v112;
    v72 = v110;
    +[UIView animateWithDuration:v73 animations:v64 completion:0.4];
    [(UIStatusBarCarPlayDockItemView *)self setCurrentBundleIdentifiers:v46];
    [(UIStatusBarCarPlayDockItemView *)self setCurrentActiveBundleIdentifier:v37];

    _Block_object_dispose(v108, 8);
    _Block_object_dispose(v110, 8);

    _Block_object_dispose(v112, 8);
    _Block_object_dispose(v114, 8);

    _Block_object_dispose(v116, 8);
    _Block_object_dispose(v118, 8);

    id v11 = v45;
    v38 = v57;
    v40 = v58;
    v39 = v59;
    double v17 = v56;
    goto LABEL_26;
  }
  v63.receiver = self;
  v63.super_class = (Class)UIStatusBarCarPlayDockItemView;
  BOOL v7 = [(UIStatusBarItemView *)&v63 updateForNewData:v6 actions:v4];
LABEL_28:

  return v7;
}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40))
  {
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    id v47 = __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_2;
    v48 = &unk_1E5304E08;
    v2 = *(void **)(a1 + 32);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v49 = v3;
    uint64_t v50 = v4;
    long long v51 = *(_OWORD *)(a1 + 152);
    [v2 enumerateObjectsUsingBlock:&v45];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    id v6 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) copy];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40), v6);
  if (v5) {

  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    double v8 = (void *)[*(id *)(a1 + 72) copy];
  }
  else {
    double v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40), v8);
  if (v7) {

  }
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    double v10 = (void *)[*(id *)(a1 + 88) copy];
  }
  else {
    double v10 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40), v10);
  if (v9) {

  }
  if (*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40))
  {
    uint64_t v11 = *(void *)(a1 + 96);
    double v12 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) iconImageView];
    [v12 setImage:v11];
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40), "setUserInteractionEnabled:", 0, v45, v46, v47, v48);
  [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) setUserInteractionEnabled:0];
  [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) setUserInteractionEnabled:0];
  [*(id *)(*(void *)(*(void *)(a1 + 160) + 8) + 40) setUserInteractionEnabled:0];
  [*(id *)(a1 + 48) addSubview:*(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 40)];
  [*(id *)(a1 + 48) addSubview:*(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 40)];
  [*(id *)(a1 + 48) addSubview:*(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40)];
  [*(id *)(a1 + 48) addSubview:*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40)];
  uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
  [*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) frame];
  objc_msgSend(v13, "setFrame:");
  uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 176) + 8) + 40);
  [*(id *)(a1 + 72) frame];
  objc_msgSend(v14, "setFrame:");
  unint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 184) + 8) + 40);
  [*(id *)(a1 + 88) frame];
  objc_msgSend(v15, "setFrame:");
  [*(id *)(a1 + 104) setHidden:1];
  [*(id *)(a1 + 112) setHidden:1];
  [*(id *)(a1 + 120) setHidden:1];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setShowsTouchWhenHighlighted:0];
  [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) setShowsTouchWhenHighlighted:0];
  [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) setShowsTouchWhenHighlighted:0];
  [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 160) + 8) + 40) layoutIfNeeded];
  if ([*(id *)(a1 + 104) isFocused]
    && ([*(id *)(a1 + 104) isActive] & 1) == 0
    || [*(id *)(a1 + 112) isFocused])
  {
    uint64_t v16 = *(void *)(a1 + 176);
  }
  else
  {
    if (![*(id *)(a1 + 120) isFocused]) {
      goto LABEL_27;
    }
    uint64_t v16 = *(void *)(a1 + 184);
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 192) + 8);
  id v18 = *(id *)(*(void *)(v16 + 8) + 40);
  uint64_t v19 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v18;

LABEL_27:
  if (*(void *)(a1 + 128))
  {
    uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 192) + 8) + 40) iconHighlightImageView];
    [v20 setAlpha:0.0];

    v21 = [*(id *)(*(void *)(*(void *)(a1 + 192) + 8) + 40) iconHighlightImageView];
    [v21 setHidden:0];
  }
  [*(id *)(a1 + 104) setBundleIdentifier:*(void *)(a1 + 56)];
  uint64_t v22 = *(void *)(a1 + 96);
  uint64_t v23 = [*(id *)(a1 + 104) iconImageView];
  [v23 setImage:v22];

  [*(id *)(a1 + 112) setBundleIdentifier:*(void *)(a1 + 64)];
  uint64_t v24 = *(void *)(a1 + 136);
  uint64_t v25 = [*(id *)(a1 + 112) iconImageView];
  [v25 setImage:v24];

  [*(id *)(a1 + 120) setBundleIdentifier:*(void *)(a1 + 80)];
  uint64_t v26 = *(void *)(a1 + 144);
  v27 = [*(id *)(a1 + 120) iconImageView];
  [v27 setImage:v26];

  v28 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) badgeView];
  [v28 setHidden:0];

  id v29 = [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) badgeView];
  [v29 setHidden:0];

  v30 = [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) badgeView];
  [v30 setHidden:0];

  v31 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) badgeView];
  v32 = [*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) badgeView];
  if ([v32 isHidden]) {
    double v33 = 0.0;
  }
  else {
    double v33 = 1.0;
  }
  [v31 setAlpha:v33];

  id v34 = [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) badgeView];
  id v35 = [*(id *)(a1 + 72) badgeView];
  if ([v35 isHidden]) {
    double v36 = 0.0;
  }
  else {
    double v36 = 1.0;
  }
  [v34 setAlpha:v36];

  id v37 = [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) badgeView];
  v38 = [*(id *)(a1 + 88) badgeView];
  if ([v38 isHidden]) {
    double v39 = 0.0;
  }
  else {
    double v39 = 1.0;
  }
  [v37 setAlpha:v39];

  v40 = *(void **)(a1 + 104);
  v41 = [v40 bundleIdentifier];
  objc_msgSend(v40, "setActive:", objc_msgSend(v41, "isEqualToString:", *(void *)(a1 + 128)));

  objc_msgSend(*(id *)(a1 + 104), "setEnabled:", objc_msgSend(*(id *)(a1 + 104), "isActive") ^ 1);
  [*(id *)(a1 + 104) setHasBadge:*(unsigned __int8 *)(a1 + 200)];
  [*(id *)(a1 + 112) setHasBadge:*(unsigned __int8 *)(a1 + 201)];
  [*(id *)(a1 + 120) setHasBadge:*(unsigned __int8 *)(a1 + 202)];
  v42 = [*(id *)(a1 + 104) badgeView];
  objc_msgSend(v42, "setHidden:", objc_msgSend(*(id *)(a1 + 104), "shouldShowBadge") ^ 1);

  id v43 = [*(id *)(a1 + 112) badgeView];
  objc_msgSend(v43, "setHidden:", objc_msgSend(*(id *)(a1 + 112), "shouldShowBadge") ^ 1);

  id v44 = [*(id *)(a1 + 120) badgeView];
  objc_msgSend(v44, "setHidden:", objc_msgSend(*(id *)(a1 + 120), "shouldShowBadge") ^ 1);
}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) _toItemViewForBundleIdentifier:v14];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [*(id *)(*(void *)(v12 + 8) + 40) frame];
    objc_msgSend(v13, "setFrame:");
    *a4 = 1;
  }
}

void __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) iconHighlightImageView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) iconHighlightImageView];
  [v3 setAlpha:0.0];

  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) iconHighlightImageView];
  [v4 setAlpha:0.0];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setActive:*(void *)(a1 + 32) != 0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setActive:0];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setActive:0];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setActive:*(void *)(a1 + 32) != 0];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) badgeView];
  if ([*(id *)(a1 + 40) shouldShowBadge]) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  [v5 setAlpha:v6];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) badgeView];
  if ([*(id *)(a1 + 48) shouldShowBadge]) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  [v7 setAlpha:v8];

  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) badgeView];
  if ([*(id *)(a1 + 56) shouldShowBadge]) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  [v9 setAlpha:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) layoutIfNeeded];
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v11, "setFrame:");
  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  [*(id *)(a1 + 48) frame];
  objc_msgSend(v12, "setFrame:");
  uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  [*(id *)(a1 + 56) frame];
  objc_msgSend(v13, "setFrame:");
  id v14 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v14, "setFrame:");
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setAlpha:0.0];
  if (*(void *)(a1 + 32))
  {
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) iconHighlightImageView];
    [v15 setAlpha:1.0];
  }
}

uint64_t __59__UIStatusBarCarPlayDockItemView_updateForNewData_actions___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 bundleIdentifier];
  [v2 setHidden:v3 == 0];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 bundleIdentifier];
  [v4 setHidden:v5 == 0];

  double v6 = *(void **)(a1 + 48);
  uint64_t v7 = [v6 bundleIdentifier];
  [v6 setHidden:v7 == 0];

  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  [*(id *)(a1 + 40) setUserInteractionEnabled:1];
  [*(id *)(a1 + 48) setUserInteractionEnabled:1];
  if ([*(id *)(a1 + 32) isFocused])
  {
    [*(id *)(a1 + 56) setPreferredItemViewToFocus:*(void *)(a1 + 40)];
    [*(id *)(a1 + 56) setNeedsFocusUpdate];
    [*(id *)(a1 + 56) updateFocusIfNeeded];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeFromSuperview];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeFromSuperview];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) removeFromSuperview];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) removeFromSuperview];
  double v8 = *(void **)(a1 + 56);
  return [v8 updateContentsAndWidth];
}

- (id)_toItemViewForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__175;
  uint64_t v16 = __Block_byref_object_dispose__175;
  id v17 = 0;
  uint64_t v5 = [(UIView *)self subviews];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__UIStatusBarCarPlayDockItemView__toItemViewForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E5304EA8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__UIStatusBarCarPlayDockItemView__toItemViewForBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v9 bundleIdentifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)_updateInCallDurationIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIStatusBarCarPlayDockItemView *)self inCallDurationLabel];
  BOOL v6 = [(UIStatusBarCarPlayDockItemView *)self isShowingCallTimer];
  if (!v4)
  {
    if (!v6) {
      goto LABEL_8;
    }
    [(UIStatusBarCarPlayDockItemView *)self setShowingCallTimer:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_3;
    v11[3] = &unk_1E52D9F98;
    v11[4] = self;
    id v12 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_4;
    v9[3] = &unk_1E52DC3A0;
    id v10 = v12;
    +[UIView animateWithDuration:v11 animations:v9 completion:0.4];

    id v7 = v12;
LABEL_7:

    goto LABEL_8;
  }
  if (!v6)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke;
    v16[3] = &unk_1E52DCB30;
    v16[4] = self;
    id v8 = v5;
    id v17 = v8;
    id v18 = v4;
    +[UIView performWithoutAnimation:v16];
    [(UIStatusBarCarPlayDockItemView *)self setShowingCallTimer:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_2;
    v13[3] = &unk_1E52D9F98;
    id v14 = v8;
    id v15 = self;
    +[UIView animateWithDuration:v13 animations:0.4];

    id v7 = v17;
    goto LABEL_7;
  }
  [v5 setText:v4];
  [v5 sizeToFit];
LABEL_8:
}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5B268];
  id v3 = [*(id *)(a1 + 32) inCallLabelSpacingConstraint];
  v15[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v2 deactivateConstraints:v4];

  uint64_t v5 = [*(id *)(a1 + 32) itemThreeButton];
  LODWORD(v3) = [v5 itemHasBundleIdentifier];

  BOOL v6 = [*(id *)(a1 + 40) firstBaselineAnchor];
  uint64_t v7 = 8;
  if (v3) {
    uint64_t v7 = 9;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___UIStatusBarCarPlayDockAppItemButton__iconImageView[v7]) bottomAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8 constant:5.5];
  [*(id *)(a1 + 32) setInCallLabelSpacingConstraint:v9];

  id v10 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v11 = [*(id *)(a1 + 32) inCallLabelSpacingConstraint];
  id v14 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v10 activateConstraints:v12];

  [*(id *)(a1 + 40) setText:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) sizeToFit];
  [*(id *)(a1 + 40) setAlpha:0.0];
  return [*(id *)(a1 + 40) setHidden:0];
}

void __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v3 = [*(id *)(a1 + 40) layoutManager];
  v2 = *(void **)(a1 + 40);
  [v2 updateContentsAndWidth];
  objc_msgSend(v3, "itemView:sizeChangedBy:", v2);
}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layoutManager];
  id v3 = *(void **)(a1 + 32);
  [v3 updateContentsAndWidth];
  objc_msgSend(v2, "itemView:sizeChangedBy:", v3);

  id v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:0.0];
}

uint64_t __67__UIStatusBarCarPlayDockItemView__updateInCallDurationIfNecessary___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

- (double)extraLeftPadding
{
  return 0.0;
}

- (double)extraRightPadding
{
  return -8.0;
}

- (unint64_t)_numberOfEnabledItems
{
  id v3 = [(UIStatusBarCarPlayDockItemView *)self itemOneButton];
  unsigned int v4 = [v3 itemHasBundleIdentifier];

  uint64_t v5 = [(UIStatusBarCarPlayDockItemView *)self itemTwoButton];
  unint64_t v6 = [v5 itemHasBundleIdentifier] + (unint64_t)v4;

  uint64_t v7 = [(UIStatusBarCarPlayDockItemView *)self itemThreeButton];
  unint64_t v8 = v6 + [v7 itemHasBundleIdentifier];

  return v8;
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIStatusBarCarPlayDockItemView *)self preferredItemViewToFocus];
  if (v3)
  {
    unsigned int v4 = [(UIStatusBarCarPlayDockItemView *)self preferredItemViewToFocus];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIStatusBarCarPlayDockItemView;
    uint64_t v5 = [(UIView *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (UILabel)inCallDurationLabel
{
  return self->_inCallDurationLabel;
}

- (void)setInCallDurationLabel:(id)a3
{
}

- (UIStatusBarCarPlayDockAppItemButton)itemOneButton
{
  return self->_itemOneButton;
}

- (void)setItemOneButton:(id)a3
{
}

- (UIStatusBarCarPlayDockAppItemButton)itemTwoButton
{
  return self->_itemTwoButton;
}

- (void)setItemTwoButton:(id)a3
{
}

- (UIStatusBarCarPlayDockAppItemButton)itemThreeButton
{
  return self->_itemThreeButton;
}

- (void)setItemThreeButton:(id)a3
{
}

- (NSLayoutConstraint)inCallLabelSpacingConstraint
{
  return self->_inCallLabelSpacingConstraint;
}

- (void)setInCallLabelSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)itemOneTopConstraint
{
  return self->_itemOneTopConstraint;
}

- (void)setItemOneTopConstraint:(id)a3
{
}

- (NSArray)currentBundleIdentifiers
{
  return self->_currentBundleIdentifiers;
}

- (void)setCurrentBundleIdentifiers:(id)a3
{
}

- (NSString)currentActiveBundleIdentifier
{
  return self->_currentActiveBundleIdentifier;
}

- (void)setCurrentActiveBundleIdentifier:(id)a3
{
}

- (UIView)preferredItemViewToFocus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredItemViewToFocus);
  return (UIView *)WeakRetained;
}

- (void)setPreferredItemViewToFocus:(id)a3
{
}

- (BOOL)isShowingCallTimer
{
  return self->_showingCallTimer;
}

- (void)setShowingCallTimer:(BOOL)a3
{
  self->_showingCallTimer = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredItemViewToFocus);
  objc_storeStrong((id *)&self->_currentActiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemOneTopConstraint, 0);
  objc_storeStrong((id *)&self->_inCallLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_itemThreeButton, 0);
  objc_storeStrong((id *)&self->_itemTwoButton, 0);
  objc_storeStrong((id *)&self->_itemOneButton, 0);
  objc_storeStrong((id *)&self->_inCallDurationLabel, 0);
}

@end
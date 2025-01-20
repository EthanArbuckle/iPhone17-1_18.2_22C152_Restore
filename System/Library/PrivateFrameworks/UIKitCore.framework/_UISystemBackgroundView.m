@interface _UISystemBackgroundView
+ (BOOL)_supportsInvalidatingFocusCache;
- (BOOL)_isEligibleForFocusInteraction;
- (CGRect)frameInContainerView:(id)a3;
- (UIEdgeInsets)effectiveInsetsInContainerView:(id)a3;
- (_UIBackgroundConfigurationInternal)configuration;
- (_UISystemBackgroundView)initWithCoder:(id)a3;
- (_UISystemBackgroundView)initWithConfiguration:(id)a3;
- (id)_encodableSubviews;
- (id)_internalSubviewsOfType:(unsigned __int8 *)a1;
- (id)_visiblePathInContainerView:(int)a3 nullableBehavior:;
- (id)currentBackgroundColor;
- (id)currentVisiblePathInContainerView:(id)a3;
- (id)description;
- (id)focusItemsInRect:(CGRect)a3;
- (id)outlinePathInContainerView:(id)a3;
- (id)shapeInContainerView:(id)a3;
- (void)_addInternalSubview:(unsigned __int8 *)a3 ofType:;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_layoutColorView;
- (void)_layoutCustomView;
- (void)_layoutImageView;
- (void)_layoutShadowView;
- (void)_layoutStrokeView;
- (void)_layoutVisualEffectView;
- (void)_removeInternalSubview:(uint64_t)a3 ofType:;
- (void)_updateBackgroundColor;
- (void)_updateCornerMaskingForType:(uint64_t)a1;
- (void)_updateShadowViewProperties;
- (void)_updateStrokeColor;
- (void)didAddSubview:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setConfiguration:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)tintColorDidChange;
- (void)willRemoveSubview:(id)a3;
@end

@implementation _UISystemBackgroundView

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)didAddSubview:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v8 didAddSubview:v5];
  if (dyld_program_sdk_at_least())
  {
    if ((*(unsigned char *)&self->_systemBackgroundViewFlags & 4) == 0
      && (*(void *)&self->super._viewFlags & 0x1000) == 0
      && ([v5 _isInternalDebugView] & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISystemBackgroundView.m", 200, @"A subview was unexpectedly added to the background view that renders a UIBackgroundConfiguration. Manually adding subviews to the background view is not allowed. Any view set to the customView property of the UIBackgroundConfiguration will be automatically added to the view hierarchy when necessary. Subview added: %@; Background view: %@",
        v5,
        self);
    }
  }
  else if ((*(unsigned char *)&self->_systemBackgroundViewFlags & 4) == 0 {
         && (*(void *)&self->super._viewFlags & 0x1000) == 0
  }
         && ([v5 _isInternalDebugView] & 1) == 0)
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &didAddSubview____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "A subview was unexpectedly added to the background view that renders a UIBackgroundConfiguration. Manually adding subviews to the background view is not allowed. Any view set to the customView property of the UIBackgroundConfiguration will be automatically added to the view hierarchy when necessary. Subview added: %@; Background view: %@",
        buf,
        0x16u);
    }
  }
}

- (void)willRemoveSubview:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v8 willRemoveSubview:v5];
  if (dyld_program_sdk_at_least())
  {
    if ((*(unsigned char *)&self->_systemBackgroundViewFlags & 4) == 0
      && (*(void *)&self->super._viewFlags & 0x1000) == 0
      && ([v5 _isInternalDebugView] & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISystemBackgroundView.m", 206, @"A subview was unexpectedly removed from the background view that renders a UIBackgroundConfiguration. Any view set to the customView property of the UIBackgroundConfiguration will be automatically removed from the view hierarchy when necessary; never call removeFromSuperview on the customView yourself. Also ensure that the customView of each UIBackgroundConfiguration that gets applied to a different view is unique; setting the same UIView instance to the customView of configurations applied to different views is not allowed. Subview removed: %@; Background view: %@",
        v5,
        self);
    }
  }
  else if ((*(unsigned char *)&self->_systemBackgroundViewFlags & 4) == 0 {
         && (*(void *)&self->super._viewFlags & 0x1000) == 0
  }
         && ([v5 _isInternalDebugView] & 1) == 0)
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &willRemoveSubview____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "A subview was unexpectedly removed from the background view that renders a UIBackgroundConfiguration. Any view set to the customView property of the UIBackgroundConfiguration will be automatically removed from the view hierarchy when necessary; never call removeFromSuperview on the customView yourself. Also ensure that the customView "
        "of each UIBackgroundConfiguration that gets applied to a different view is unique; setting the same UIView insta"
        "nce to the customView of configurations applied to different views is not allowed. Subview removed: %@; Background view: %@",
        buf,
        0x16u);
    }
  }
}

- (_UISystemBackgroundView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemBackgroundView;
  id v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(_UISystemBackgroundView *)v5 setConfiguration:v4];
  }

  return v6;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v5 tintColorDidChange];
  v3 = [(_UIBackgroundConfigurationInternal *)self->_configuration backgroundColor];

  if (!v3) {
    -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
  }
  id v4 = [(_UIBackgroundConfigurationInternal *)self->_configuration strokeColor];

  if (!v4) {
    -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
  }
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:a2, self, @"_UISystemBackgroundView.m", 223, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  if (([(_UIBackgroundConfigurationInternal *)self->_configuration _isEqualToInternalConfigurationQuick:v5] & 1) == 0)
  {
    v6 = self->_configuration;
    v7 = (_UIBackgroundConfigurationInternal *)[v5 copyWithZone:0];
    configuration = self->_configuration;
    self->_configuration = v7;

    v9 = off_1E52D4000;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __44___UISystemBackgroundView_setConfiguration___block_invoke;
      v79[3] = &unk_1E52DD7F8;
      v79[4] = self;
      v80 = v6;
      +[UIView _addCompletionWithPosition:v79];
    }
    id v10 = [(_UIBackgroundConfigurationInternal *)v6 customView];
    __int16 v11 = [v5 customView];
    id v12 = v10;
    id v13 = v11;
    v14 = v13;
    if (v12 != v13)
    {
      if (v13)
      {
        uint64_t v81 = MEMORY[0x1E4F143A8];
        uint64_t v82 = 3221225472;
        v83 = __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke;
        v84 = &unk_1E52D9F98;
        v85 = self;
        id v86 = v13;
        +[UIView performWithoutAnimation:&v81];
      }
      [v14 setAlpha:1.0];
      [v12 setAlpha:0.0];
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke_2;
      v90 = &unk_1E52DFFB0;
      v91 = (_UISystemBackgroundView *)v12;
      v92 = self;
      id v93 = v14;
      v15 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:v15])
      {
        v15[2](v15, 1, 0);
      }
    }
    v16 = [(_UIBackgroundConfigurationInternal *)v6 visualEffect];
    v17 = [v5 visualEffect];
    v18 = [(_UIBackgroundConfigurationInternal *)v6 __visualEffectGroupName];
    v19 = objc_msgSend(v5, "__visualEffectGroupName");
    v78 = v6;
    [(_UIBackgroundConfigurationInternal *)v6 __visualEffectblurClippingMode];
    objc_msgSend(v5, "__visualEffectblurClippingMode");
    id v20 = v16;
    id v21 = v17;
    id v22 = v18;
    id v23 = v19;
    if (!v20 && v21)
    {
      uint64_t v81 = MEMORY[0x1E4F143A8];
      uint64_t v82 = 3221225472;
      v83 = __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke;
      v84 = &unk_1E52D9F70;
      v85 = self;
      +[UIView performWithoutAnimation:&v81];
    }
    [(UIVisualEffectView *)self->_visualEffectView setEffect:v21];
    [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v23];
    v77 = v20;
    if (v20 && !v21)
    {
      v24 = self->_visualEffectView;
      v25 = [(UIVisualEffectView *)v24 contentView];
      v26 = [v25 backgroundColor];

      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = 0;

      [(UIVisualEffectView *)v24 setEffect:0];
      v28 = +[UIColor clearColor];
      v29 = [(UIVisualEffectView *)v24 contentView];
      [v29 setBackgroundColor:v28];

      id v20 = v77;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke_2;
      v90 = &unk_1E52DFFD8;
      v91 = self;
      v92 = (_UISystemBackgroundView *)v24;
      id v93 = v77;
      id v94 = v22;
      id v30 = v26;
      id v95 = v30;
      v31 = v24;
      v32 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:v32])
      {
        v32[2](v32, 1, 0);
      }

      v9 = off_1E52D4000;
    }

    v33 = v78;
    int v34 = [(_UIBackgroundConfigurationInternal *)v78 _hasBackgroundColor];
    if (v20) {
      int v35 = 0;
    }
    else {
      int v35 = v34;
    }
    int v36 = [v5 _hasBackgroundColor];
    if (v21) {
      int v37 = 0;
    }
    else {
      int v37 = v36;
    }
    if ((v35 & 1) == 0 && v37)
    {
      uint64_t v81 = MEMORY[0x1E4F143A8];
      uint64_t v82 = 3221225472;
      v83 = __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke;
      v84 = &unk_1E52D9F70;
      v85 = self;
      +[UIView performWithoutAnimation:&v81];
    }
    -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
    if (((v37 | v35 ^ 1) & 1) == 0)
    {
      v38 = self->_colorView;
      v39 = [(UIView *)v38 backgroundColor];
      colorView = self->_colorView;
      self->_colorView = 0;

      v41 = +[UIColor clearColor];
      [(UIView *)v38 setBackgroundColor:v41];

      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke_2;
      v90 = &unk_1E52DFFB0;
      v91 = self;
      v92 = (_UISystemBackgroundView *)v38;
      id v42 = v39;
      id v93 = v42;
      v43 = v38;
      v44 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:v44])
      {
        v44[2](v44, 1, 0);
      }
    }
    v45 = [(_UIBackgroundConfigurationInternal *)v78 image];
    v46 = [v5 image];
    id v47 = v45;
    id v48 = v46;
    v49 = v48;
    if (v47 || !v48)
    {
      if (!v48)
      {
        if (v47)
        {
          v72 = self->_imageView;
          imageView = self->_imageView;
          self->_imageView = 0;

          [(UIView *)v72 setAlpha:0.0];
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v88 = 3221225472;
          v89 = __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke_2;
          v90 = &unk_1E52DD7F8;
          v91 = self;
          v92 = (_UISystemBackgroundView *)v72;
          v74 = v72;
          v75 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
          if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:v75])
          {
            v75[2](v75, 1, 0);
          }

          v9 = off_1E52D4000;
        }
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke;
      v90 = &unk_1E52D9F98;
      v91 = self;
      v92 = (_UISystemBackgroundView *)v48;
      +[UIView performWithoutAnimation:&aBlock];
    }
    [(UIImageView *)self->_imageView setImage:v49];
    [(UIImageView *)self->_imageView setContentMode:[(_UIBackgroundConfigurationInternal *)self->_configuration imageContentMode]];
    [(UIView *)self->_imageView setAlpha:1.0];
LABEL_41:

    int v50 = [(_UIBackgroundConfigurationInternal *)v78 _hasStroke];
    int v51 = [v5 _hasStroke];
    int v52 = v51;
    if ((v50 & 1) == 0 && v51)
    {
      v53 = v9[422];
      uint64_t v81 = MEMORY[0x1E4F143A8];
      uint64_t v82 = 3221225472;
      v83 = __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke;
      v84 = &unk_1E52D9F70;
      v85 = self;
      [(__objc2_class *)v53 performWithoutAnimation:&v81];
    }
    [(_UIBackgroundConfigurationInternal *)self->_configuration strokeWidth];
    -[_UISystemBackgroundStrokeView setStrokeWidth:](self->_strokeView, "setStrokeWidth:");
    -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
    if (((v52 | v50 ^ 1) & 1) == 0)
    {
      v54 = self->_strokeView;
      strokeView = self->_strokeView;
      self->_strokeView = 0;

      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke_2;
      v90 = &unk_1E52DD7F8;
      v91 = self;
      v92 = (_UISystemBackgroundView *)v54;
      v56 = v54;
      v57 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
      if (![(__objc2_class *)v9[422] _isInAnimationBlockWithAnimationsEnabled]|| ([(__objc2_class *)v9[422] _addCompletionWithPosition:v57] & 1) == 0)
      {
        v57[2](v57, 1, 0);
      }
    }
    v58 = [(_UIBackgroundConfigurationInternal *)v78 _shadowProperties];
    id v59 = [v5 _shadowProperties];
    id v60 = v58;
    uint64_t v61 = [v60 _backgroundConfigurationShadowType];
    uint64_t v62 = [v59 _backgroundConfigurationShadowType];
    if (v61 == 3) {
      v63 = 0;
    }
    else {
      v63 = v60;
    }
    if (v62 == 3) {
      v64 = 0;
    }
    else {
      v64 = v59;
    }
    id v65 = v63;
    id v66 = v64;
    v67 = v66;
    if (!v65 && v66)
    {
      uint64_t v81 = MEMORY[0x1E4F143A8];
      uint64_t v82 = 3221225472;
      v83 = __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke;
      v84 = &unk_1E52D9F70;
      v85 = self;
      +[UIView performWithoutAnimation:&v81];
    }
    [(UIView *)self->_shadowView setAlpha:1.0];
    -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)self);
    if (v65 && !v67)
    {
      v68 = self->_shadowView;
      [(UIView *)v68 setAlpha:0.0];
      shadowView = self->_shadowView;
      self->_shadowView = 0;

      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v88 = 3221225472;
      v89 = __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke_2;
      v90 = &unk_1E52DD7F8;
      v91 = self;
      v92 = (_UISystemBackgroundView *)v68;
      v70 = v68;
      v71 = (void (**)(void *, uint64_t, void))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:v71])
      {
        v71[2](v71, 1, 0);
      }

      v33 = v78;
    }

    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
    [(UIView *)self setNeedsLayout];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UIView *)self layoutIfNeeded];
    }
  }
}

- (void)_updateCornerMaskingForType:(uint64_t)a1
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a2 == 6)
  {
    BOOL v68 = 1;
    BOOL v69 = 1;
    BOOL v3 = 1;
    BOOL v4 = 1;
    BOOL v5 = 1;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = a2 == 4;
    BOOL v5 = a2 == 1;
    BOOL v4 = a2 == 0;
    BOOL v3 = a2 == 2;
    BOOL v68 = a2 == 3;
    BOOL v69 = a2 == 5;
  }
  v7 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 472), "__maskedCorners");
  uint64_t v70 = [*(id *)(a1 + 472) _strokeLocation];
  [(id)a1 bounds];
  CGFloat x = v97.origin.x;
  CGFloat y = v97.origin.y;
  CGFloat width = v97.size.width;
  CGFloat height = v97.size.height;
  double v13 = CGRectGetWidth(v97);
  v98.origin.CGFloat x = x;
  v98.origin.CGFloat y = y;
  v98.size.CGFloat width = width;
  v98.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v98);
  if (v13 >= v14) {
    double v15 = v14;
  }
  else {
    double v15 = v13;
  }
  if ((~(_BYTE)v8 & 3) == 0 || (v8 & 0xC) == 12)
  {
    v99.origin.CGFloat x = x;
    v99.origin.CGFloat y = y;
    v99.size.CGFloat width = width;
    v99.size.CGFloat height = height;
    double v17 = CGRectGetWidth(v99) * 0.5;
    if (v15 >= v17) {
      double v15 = v17;
    }
  }
  if ((~v8 & 5) == 0 || (v8 & 0xA) == 10)
  {
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.CGFloat width = width;
    v100.size.CGFloat height = height;
    double v19 = CGRectGetHeight(v100) * 0.5;
    if (v15 >= v19) {
      double v15 = v19;
    }
  }
  [*(id *)(a1 + 472) cornerRadius];
  if (v20 <= v15) {
    double v21 = v20;
  }
  else {
    double v21 = v15;
  }
  if (v8 != 15) {
    goto LABEL_28;
  }
  if (vabdd_f64(v21, v15) > 0.1) {
    goto LABEL_28;
  }
  v101.origin.CGFloat x = x;
  v101.origin.CGFloat y = y;
  v101.size.CGFloat width = width;
  v101.size.CGFloat height = height;
  double v22 = CGRectGetWidth(v101);
  v102.origin.CGFloat x = x;
  v102.origin.CGFloat y = y;
  v102.size.CGFloat width = width;
  v102.size.CGFloat height = height;
  if (vabdd_f64(v22, CGRectGetHeight(v102)) <= 0.1)
  {
    uint64_t v23 = 0;
    if (v6) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_28:
    uint64_t v23 = 1;
    if (v6)
    {
LABEL_29:
      if (v21 > 0.0 || (*(unsigned char *)(a1 + 464) & 2) != 0)
      {
        BOOL v65 = v5;
        BOOL v66 = v3;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v24 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 4);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v87 objects:v95 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v88;
          v28 = (uint64_t *)MEMORY[0x1E4F39EA8];
          if (!v23) {
            v28 = (uint64_t *)MEMORY[0x1E4F39EA0];
          }
          uint64_t v29 = *v28;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v88 != v27) {
                objc_enumerationMutation(v24);
              }
              v31 = *(void **)(*((void *)&v87 + 1) + 8 * i);
              *(unsigned char *)(a1 + 464) |= 2u;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v31 _setCornerRadius:v23 continuous:v8 maskedCorners:v21];
              }
              else
              {
                v32 = [v31 layer];
                [v32 setMasksToBounds:1];
                [v32 setMaskedCorners:v8];
                [v32 setCornerCurve:v29];
                [v32 setCornerRadius:v21];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v87 objects:v95 count:16];
          }
          while (v26);
        }

        BOOL v3 = v66;
        v7 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
        BOOL v5 = v65;
      }
    }
  }
  if (v5)
  {
    BOOL v67 = v4;
    BOOL v33 = v3;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    int v34 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 1);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v84;
      v38 = (uint64_t *)MEMORY[0x1E4F39EA0];
      if (v23) {
        v38 = (uint64_t *)MEMORY[0x1E4F39EA8];
      }
      uint64_t v39 = *v38;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v84 != v37) {
            objc_enumerationMutation(v34);
          }
          v41 = [*(id *)(*((void *)&v83 + 1) + 8 * j) layer];
          id v42 = v41;
          if (v21 <= 0.0) {
            uint64_t v43 = [v41 masksToBounds];
          }
          else {
            uint64_t v43 = 1;
          }
          [v42 setMasksToBounds:v43];
          [v42 setMaskedCorners:v8];
          [v42 setCornerCurve:v39];
          [v42 setCornerRadius:v21];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v36);
    }

    v7 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
    BOOL v3 = v33;
    BOOL v4 = v67;
  }
  if (v3)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v44 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 2);
    uint64_t v45 = [v44 countByEnumeratingWithState:&v79 objects:v93 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v80 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * k) _setCornerRadius:v23 continuous:v8 maskedCorners:v21];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v79 objects:v93 count:16];
      }
      while (v46);
    }
  }
  if (v68)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v49 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 3);
    uint64_t v50 = [v49 countByEnumeratingWithState:&v75 objects:v92 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v76;
      v53 = (uint64_t *)MEMORY[0x1E4F39EA0];
      if (v23) {
        v53 = (uint64_t *)MEMORY[0x1E4F39EA8];
      }
      uint64_t v54 = *v53;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v76 != v52) {
            objc_enumerationMutation(v49);
          }
          v56 = [*(id *)(*((void *)&v75 + 1) + 8 * m) layer];
          [v56 setMasksToBounds:1];
          [v56 setMaskedCorners:v8];
          [v56 setCornerCurve:v54];
          [v56 setCornerRadius:v21];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v75 objects:v92 count:16];
      }
      while (v51);
    }

    v7 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
  }
  if (v69)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v57 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 5);
    uint64_t v58 = [v57 countByEnumeratingWithState:&v71 objects:v91 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v72;
      do
      {
        for (uint64_t n = 0; n != v59; ++n)
        {
          if (*(void *)v72 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void **)(*((void *)&v71 + 1) + 8 * n);
          [*(id *)(a1 + v7[277]) strokeOutset];
          objc_msgSend(v62, "setStrokeCornerRadius:", fmax(v21 + v63, 0.0));
          uint64_t v64 = v8;
          switch(v70)
          {
            case 0:
              break;
            case 1:
              uint64_t v64 = 0;
              break;
            case 2:
              uint64_t v64 = 3;
              break;
            case 3:
              uint64_t v64 = 12;
              break;
            default:
              uint64_t v64 = 15;
              break;
          }
          [v62 setMaskedCorners:v64];
          [v62 setUseContinuousCurve:v23];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v71 objects:v91 count:16];
      }
      while (v59);
    }
  }
  *(double *)(a1 + 448) = v21;
  *(unsigned char *)(a1 + 464) = *(unsigned char *)(a1 + 464) & 0xFE | v23;
  if (v4) {
    -[_UISystemBackgroundView _updateShadowViewProperties](a1);
  }
}

- (id)_internalSubviewsOfType:(unsigned __int8 *)a1
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1 + 456;
  if (a2 <= 0)
  {
    unint64_t v6 = 0;
    unint64_t v7 = *v3;
  }
  else
  {
    BOOL v5 = &v3[a2];
    unint64_t v6 = *(v5 - 1);
    unint64_t v7 = *v5;
    if (v6 > v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [a1 subviews];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__internalSubviewsOfType_, a1, @"_UISystemBackgroundView.m", 133, @"Subview insertion indices are invalid (type=%ld, start=%ld, end=%ld). View: %@; Subviews: %@",
        a2,
        v6,
        v7,
        a1,
        v9);
    }
  }
  if (v7 == v6)
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    __int16 v11 = [a1 subviews];
    if ([v11 count] < v7)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [v11 count];
      double v17 = [a1 subviews];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__internalSubviewsOfType_, a1, @"_UISystemBackgroundView.m", 139, @"Subview insertion index %ld exceeds subviews count %ld: View: %@; Subviews: %@",
        v7,
        v16,
        a1,
        v17);
    }
    if (v7 - v6 == 1)
    {
      id v12 = [v11 objectAtIndexedSubscript:v6];
      v18[0] = v12;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
    else
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7 - v6];
      if (v7 > v6)
      {
        do
        {
          double v13 = [v11 objectAtIndexedSubscript:v6];
          [v10 addObject:v13];

          ++v6;
        }
        while (v7 != v6);
      }
    }
  }
  return v10;
}

- (void)_updateShadowViewProperties
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 440) layer];
    if (v2)
    {
      id v10 = v2;
      BOOL v3 = [*(id *)(a1 + 472) _shadowProperties];
      BOOL v4 = v3;
      if (!v3 || [v3 _backgroundConfigurationShadowType] != 3)
      {
        id v5 = [v4 color];
        objc_msgSend(v10, "setShadowColor:", objc_msgSend(v5, "CGColor"));

        [v4 opacity];
        *(float *)&double v6 = v6;
        [v10 setShadowOpacity:v6];
        [v4 offset];
        objc_msgSend(v10, "setShadowOffset:");
        [v4 radius];
        objc_msgSend(v10, "setShadowRadius:");
        unint64_t v7 = [v4 path];
        if (v7)
        {
          [v10 setCornerRadius:0.0];
          [v10 setMaskedCorners:0];
          [v10 setShadowPathIsBounds:0];
          [v10 setPunchoutShadow:0];
          objc_msgSend(v10, "setShadowPath:", objc_msgSend(v7, "CGPath"));
        }
        else
        {
          [v10 setCornerRadius:*(double *)(a1 + 448)];
          if (*(unsigned char *)(a1 + 464)) {
            uint64_t v8 = (void *)MEMORY[0x1E4F39EA8];
          }
          else {
            uint64_t v8 = (void *)MEMORY[0x1E4F39EA0];
          }
          [v10 setCornerCurve:*v8];
          if (*(double *)(a1 + 448) <= 0.0) {
            uint64_t v9 = 0;
          }
          else {
            uint64_t v9 = objc_msgSend(*(id *)(a1 + 472), "__maskedCorners");
          }
          [v10 setMaskedCorners:v9];
          [v10 setShadowPathIsBounds:1];
          [v10 setPunchoutShadow:1];
        }
      }
      v2 = v10;
    }
  }
}

- (_UIBackgroundConfigurationInternal)configuration
{
  v2 = (void *)[(_UIBackgroundConfigurationInternal *)self->_configuration copyWithZone:0];
  return (_UIBackgroundConfigurationInternal *)v2;
}

- (void)_updateStrokeColor
{
  if (a1 && *(void *)(a1 + 432))
  {
    v2 = *(void **)(a1 + 472);
    BOOL v3 = [(id)a1 tintColor];
    id v4 = [v2 resolvedStrokeColorForTintColor:v3];

    [*(id *)(a1 + 432) setStrokeColor:v4];
  }
}

- (void)_updateBackgroundColor
{
  if (a1)
  {
    v2 = *(void **)(a1 + 472);
    BOOL v3 = [(id)a1 tintColor];
    id v6 = [v2 resolvedBackgroundColorForTintColor:v3];

    id v4 = *(void **)(a1 + 416);
    if (v4)
    {
      id v5 = [v4 contentView];
      [v5 setBackgroundColor:v6];
    }
    else
    {
      [*(id *)(a1 + 408) setBackgroundColor:v6];
    }
  }
}

- (void)_removeInternalSubview:(uint64_t)a3 ofType:
{
  id v5 = a2;
  if (a1)
  {
    id v12 = v5;
    id v6 = (id)[v5 superview];
    id v5 = v12;
    if (v6)
    {
      if (v6 != a1)
      {
        __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeInternalSubview_ofType_, a1, @"_UISystemBackgroundView.m", 184, @"Attempted to remove an internal subview whose superview is not self. View: %@; Superview: %@",
          v12,
          v6);
      }
      char v7 = a1[464];
      a1[464] = v7 | 4;
      [v12 removeFromSuperview];
      id v5 = v12;
      a1[464] = a1[464] & 0xFB | v7 & 4;
      uint64_t v8 = a3;
      do
      {
        char v9 = a1[v8 + 456];
        if (!v9)
        {
          id v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:sel__removeInternalSubview_ofType_, a1, @"_UISystemBackgroundView.m", 192, @"Subviews are out-of-sync with insertion indices: insertion index for type %ld is invalid after adjusting due to remove of internal subview with type %ld. Subview: %@", v8, a3, v12 object file lineNumber description];

          id v5 = v12;
          char v9 = a1[v8 + 456];
        }
        a1[v8++ + 456] = v9 - 1;
      }
      while (v8 != 6);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UISystemBackgroundView;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  if (v9 != v13 || v11 != v12) {
    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
  }
}

- (CGRect)frameInContainerView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"_UISystemBackgroundView.m", 818, @"Invalid parameter not satisfying: %@", @"containerView != nil" object file lineNumber description];
  }
  int v6 = [v5 _shouldReverseLayoutDirection];
  [(_UIBackgroundConfigurationInternal *)self->_configuration backgroundInsets];
  double v10 = v9;
  double v12 = v11;
  if (v6) {
    double v13 = v8;
  }
  else {
    double v13 = v7;
  }
  if (v6) {
    double v14 = v7;
  }
  else {
    double v14 = v8;
  }
  uint64_t v15 = [(_UIBackgroundConfigurationInternal *)self->_configuration edgesAddingLayoutMarginsToBackgroundInsets];
  if (v15)
  {
    char v16 = v15;
    uint64_t v17 = 2;
    if (v6) {
      uint64_t v18 = 8;
    }
    else {
      uint64_t v18 = 2;
    }
    if (!v6) {
      uint64_t v17 = 8;
    }
    unint64_t v19 = v18 & (v15 << 62 >> 63) | v17 & (v15 << 60 >> 63);
    [v5 layoutMargins];
    if ((v16 & 1) == 0) {
      double v20 = -0.0;
    }
    double v10 = v10 + v20;
    if ((v19 & 2) != 0) {
      double v24 = v21;
    }
    else {
      double v24 = -0.0;
    }
    double v13 = v13 + v24;
    if ((v16 & 4) != 0) {
      double v25 = v22;
    }
    else {
      double v25 = -0.0;
    }
    double v12 = v12 + v25;
    if (v19 >= 8) {
      double v26 = v23;
    }
    else {
      double v26 = -0.0;
    }
    double v14 = v14 + v26;
  }
  [v5 bounds];
  double v28 = v13 + v27;
  double v30 = v10 + v29;
  double v32 = v31 - (v14 + v13);
  double v34 = v33 - (v12 + v10);
  [v5 _currentScreenScale];
  double v36 = UIRectIntegralWithScale(v28, v30, v32, v34, v35);
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  double v43 = v36;
  double v44 = v38;
  double v45 = v40;
  double v46 = v42;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v3 layoutSubviews];
  -[_UISystemBackgroundView _layoutCustomView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutColorView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutVisualEffectView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutImageView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutStrokeView]((id *)&self->super.super.super.isa);
  -[_UISystemBackgroundView _layoutShadowView]((unsigned __int8 *)self);
}

- (void)_layoutColorView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 1);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (void)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_layoutCustomView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 4);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (void)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_layoutVisualEffectView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 2);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (void)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_layoutStrokeView
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1[59] strokeOutset];
    double v3 = v2;
    [a1 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v12 = -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 5);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      double v15 = -v3 - v3;
      double v16 = v11 - v15;
      double v17 = v9 - v15;
      double v18 = v7 - v3;
      double v19 = v5 - v3;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "setFrame:", v19, v18, v17, v16, (void)v22);
        }
        while (v14 != v21);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (void)_layoutShadowView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    double v2 = -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (void)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)a1);
  }
}

- (void)_layoutImageView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    double v2 = -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 3);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (void)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_addInternalSubview:(unsigned __int8 *)a3 ofType:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1 || !v5) {
    goto LABEL_15;
  }
  double v7 = (unsigned __int8 *)v5;
  switch((unint64_t)a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      long long v9 = (objc_class *)objc_opt_class();
      break;
    default:
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v20 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          long long v22 = a3;
          __int16 v23 = 2112;
          long long v24 = v7;
          _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Unhandled _UISystemBackgroundSubviewType %ld for internal subview: %@", buf, 0x16u);
        }
      }
      else
      {
        long long v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_10) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          long long v22 = a3;
          __int16 v23 = 2112;
          long long v24 = v7;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unhandled _UISystemBackgroundSubviewType %ld for internal subview: %@", buf, 0x16u);
        }
      }
      long long v9 = 0;
      break;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (has_internal_diagnostics)
  {
    if (isKindOfClass) {
      goto LABEL_11;
    }
    double v17 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    NSStringFromClass(v9);
    double v18 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    long long v22 = v18;
    __int16 v23 = 2048;
    long long v24 = a3;
    __int16 v25 = 2112;
    double v26 = v7;
    _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "_UISystemBackgroundView internal subview is not of expected class '%@' for _UISystemBackgroundSubviewType %ld! Subview: %@", buf, 0x20u);
LABEL_21:

LABEL_22:
    goto LABEL_11;
  }
  if ((isKindOfClass & 1) == 0)
  {
    double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A090) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      double v17 = v19;
      NSStringFromClass(v9);
      double v18 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      long long v22 = v18;
      __int16 v23 = 2048;
      long long v24 = a3;
      __int16 v25 = 2112;
      double v26 = v7;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "_UISystemBackgroundView internal subview is not of expected class '%@' for _UISystemBackgroundSubviewType %ld! Subview: %@", buf, 0x20u);
      goto LABEL_21;
    }
  }
LABEL_11:

  uint64_t v12 = a3[(void)(a1 + 456)];
  char v13 = a1[464];
  a1[464] = v13 | 4;
  [a1 insertSubview:v7 atIndex:v12];
  a1[464] = a1[464] & 0xFB | v13 & 4;
  do
  {
    int v14 = a3[(void)(a1 + 456)];
    if (v14 == 255)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      double v16 = [a1 subviews];
      [v15 handleFailureInMethod:sel__addInternalSubview_ofType_, a1, @"_UISystemBackgroundView.m", 171, @"Subview insertion index for type %ld is too large, there should never be this many internal subviews. Subviews: %@", a3, v16 object file lineNumber description];

      LOBYTE(v14) = a3[(void)(a1 + 456)];
    }
    (a3++)[(void)(a1 + 456)] = v14 + 1;
  }
  while (a3 != (unsigned __int8 *)6);
LABEL_15:
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
  -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
  -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_strokeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

- (_UISystemBackgroundView)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationAPI"];
  if (v5
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)_UISystemBackgroundView;
    uint64_t v6 = [(UIView *)&v9 initWithCoder:v4];
    double v7 = v6;
    if (v6) {
      [(_UISystemBackgroundView *)v6 setConfiguration:v5];
    }
  }
  else
  {

    double v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISystemBackgroundView;
  [(UIView *)&v10 encodeWithCoder:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = @"configurationAPI";
    double v7 = v5;
    configuratiouint64_t n = self->_configuration;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"_UISystemBackgroundView.m", 88, @"Cannot encode configuration of unknown class: %@", self->_configuration object file lineNumber description];

      goto LABEL_7;
    }
    configuratiouint64_t n = self->_configuration;
    uint64_t v6 = @"configuration";
    double v7 = v5;
  }
  [v7 encodeObject:configuration forKey:v6];
LABEL_7:
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UISystemBackgroundView;
  objc_super v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 length])
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendFormat:@"; configuratiouint64_t n = %@>", self->_configuration];
  }
  return v4;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UISystemBackgroundView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  [(UIView *)self bounds];
  if (v9 != v13 || v11 != v12) {
    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
  }
}

- (UIEdgeInsets)effectiveInsetsInContainerView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(_UISystemBackgroundView *)self frameInContainerView:v4];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v30 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v34.origin.double x = v14;
  CGFloat v31 = v14;
  v34.origin.double y = v16;
  v34.size.double width = v18;
  v34.size.double height = v20;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = v6;
  v35.origin.double y = v8;
  v35.size.double width = v10;
  v35.size.double height = v12;
  double v33 = MinY - CGRectGetMinY(v35);
  v36.origin.double x = v14;
  v36.origin.double y = v30;
  v36.size.double width = v18;
  v36.size.double height = v20;
  double MinX = CGRectGetMinX(v36);
  v37.origin.double x = v6;
  v37.origin.double y = v8;
  v37.size.double width = v10;
  v37.size.double height = v12;
  double v32 = MinX - CGRectGetMinX(v37);
  v38.origin.double x = v6;
  v38.origin.double y = v8;
  v38.size.double width = v10;
  v38.size.double height = v12;
  double MaxY = CGRectGetMaxY(v38);
  v39.origin.double x = v31;
  v39.origin.double y = v30;
  v39.size.double width = v18;
  v39.size.double height = v20;
  double v24 = MaxY - CGRectGetMaxY(v39);
  v40.origin.double x = v6;
  v40.origin.double y = v8;
  v40.size.double width = v10;
  v40.size.double height = v12;
  double MaxX = CGRectGetMaxX(v40);
  v41.origin.double x = v31;
  v41.origin.double y = v30;
  v41.size.double width = v18;
  v41.size.double height = v20;
  double v26 = MaxX - CGRectGetMaxX(v41);
  double v28 = v32;
  double v27 = v33;
  double v29 = v24;
  result.right = v26;
  result.bottouint64_t m = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (id)currentBackgroundColor
{
  configuratiouint64_t n = self->_configuration;
  objc_super v3 = [(UIView *)self tintColor];
  id v4 = [(_UIBackgroundConfigurationInternal *)configuration resolvedBackgroundColorForTintColor:v3];

  return v4;
}

- (id)shapeInContainerView:(id)a3
{
  id v4 = a3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double currentlyAppliedCornerRadius = self->_currentlyAppliedCornerRadius;
  char systemBackgroundViewFlags = (char)self->_systemBackgroundViewFlags;
  if (currentlyAppliedCornerRadius <= 0.0) {
    char v15 = 0;
  }
  else {
    char v15 = [(_UIBackgroundConfigurationInternal *)self->_configuration __maskedCorners];
  }
  if (([v4 clipsToBounds] & 1) != 0
    && ([v4 layer],
        CGFloat v16 = objc_claimAutoreleasedReturnValue(),
        [v16 cornerRadius],
        double v18 = v17,
        v16,
        v18 > 0.0))
  {
    double v19 = [v4 layer];
    [v19 cornerRadius];
    double v21 = v20;

    if (currentlyAppliedCornerRadius < v21) {
      double currentlyAppliedCornerRadius = v21;
    }
    if (systemBackgroundViewFlags)
    {
      int v24 = 1;
    }
    else
    {
      long long v22 = [v4 layer];
      __int16 v23 = [v22 cornerCurve];
      int v24 = [v23 isEqualToString:*MEMORY[0x1E4F39EA8]];
    }
    __int16 v25 = [v4 layer];
    v15 |= [v25 maskedCorners];
  }
  else
  {
    int v24 = systemBackgroundViewFlags & 1;
  }
  [(_UISystemBackgroundView *)self effectiveInsetsInContainerView:v4];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  if ([(_UIBackgroundConfigurationInternal *)self->_configuration _hasStroke])
  {
    [(_UIBackgroundConfigurationInternal *)self->_configuration strokeOutset];
    double v31 = v30;
    int v32 = [v4 clipsToBounds];
    double v33 = 0.0;
    double v34 = fmax(v31, 0.0);
    if ((v32 & (v31 > 0.0)) == 0) {
      double v33 = v31;
    }
    if (v32) {
      double v34 = -0.0;
    }
    double currentlyAppliedCornerRadius = currentlyAppliedCornerRadius + v34;
    double v6 = v6 - v33;
    double v8 = v8 - v33;
    double v35 = -v33 - v33;
    double v10 = v10 - v35;
    double v12 = v12 - v35;
  }
  CGAffineTransformMakeTranslation(&v39, v29, v27);
  v41.origin.double x = v6;
  v41.origin.double y = v8;
  v41.size.double width = v10;
  v41.size.double height = v12;
  CGRect v42 = CGRectApplyAffineTransform(v41, &v39);
  if (v24) {
    uint64_t v36 = 2;
  }
  else {
    uint64_t v36 = 1;
  }
  CGRect v37 = +[UIShape fixedRectShapeWithRect:cornerRadius:cornerCurve:maskedCorners:](UIShape, "fixedRectShapeWithRect:cornerRadius:cornerCurve:maskedCorners:", v36, v15 & 0xF, v42.origin.x, v42.origin.y, v42.size.width, v42.size.height, currentlyAppliedCornerRadius);

  return v37;
}

- (id)_visiblePathInContainerView:(int)a3 nullableBehavior:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  [(id)a1 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)(a1 + 448);
  int v15 = *(unsigned char *)(a1 + 464) & 1;
  if (v14 <= 0.0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = objc_msgSend(*(id *)(a1 + 472), "__maskedCorners");
  }
  int v17 = [v5 clipsToBounds];
  if (v17 && a3)
  {
    double v18 = [v5 layer];
    [v18 cornerRadius];
    double v20 = v19;

    if (v20 <= 0.0) {
      goto LABEL_18;
    }
LABEL_10:
    if (v16) {
      double v21 = v14;
    }
    else {
      double v21 = 0.0;
    }
    long long v22 = [v5 layer];
    [v22 cornerRadius];
    double v24 = v23;

    if (v24 >= v21)
    {
      __int16 v25 = [v5 layer];
      [v25 cornerRadius];
      double v14 = v26;

      if (v15)
      {
        int v15 = 1;
      }
      else
      {
        CGFloat v27 = [v5 layer];
        double v28 = [v27 cornerCurve];
        int v15 = [v28 isEqualToString:*MEMORY[0x1E4F39EA8]];
      }
      CGFloat v29 = [v5 layer];
      uint64_t v16 = [v29 maskedCorners];
    }
    goto LABEL_18;
  }
  if (v17) {
    goto LABEL_10;
  }
LABEL_18:
  if ([*(id *)(a1 + 472) _hasStroke])
  {
    [*(id *)(a1 + 472) strokeOutset];
    double v31 = v30;
    int v32 = [v5 clipsToBounds];
    double v33 = 0.0;
    double v34 = fmax(v31, 0.0);
    if ((v32 & (v31 > 0.0)) == 0) {
      double v33 = v31;
    }
    if (v32) {
      double v34 = -0.0;
    }
    double v14 = v14 + v34;
    double v7 = v7 - v33;
    double v9 = v9 - v33;
    double v35 = -v33 - v33;
    double v11 = v11 - v35;
    double v13 = v13 - v35;
  }
  [(id)a1 effectiveInsetsInContainerView:v5];
  CGFloat v40 = v36;
  CGFloat v41 = v37;
  if (a3
    && !v16
    && v37 == 0.0
    && v36 == 0.0
    && v39 == 0.0
    && v38 == 0.0
    && ![*(id *)(a1 + 472) _hasStroke])
  {
    a1 = 0;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v44, v41, v40);
    v46.origin.double x = v7;
    v46.origin.double y = v9;
    v46.size.double width = v11;
    v46.size.double height = v13;
    CGRect v47 = CGRectApplyAffineTransform(v46, &v44);
    if (v16 && v14 > 0.0)
    {
      uint64_t v42 = +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v16 & 0xF, 16, v15 == 0, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height, v14);
    }
    else
    {
      uint64_t v42 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
    }
    a1 = v42;
  }
LABEL_36:

  return (id)a1;
}

- (id)currentVisiblePathInContainerView:(id)a3
{
  return -[_UISystemBackgroundView _visiblePathInContainerView:nullableBehavior:]((uint64_t)self, a3, 1);
}

- (id)outlinePathInContainerView:(id)a3
{
  return -[_UISystemBackgroundView _visiblePathInContainerView:nullableBehavior:]((uint64_t)self, a3, 0);
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end
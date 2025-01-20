@interface UIToolbarButton
+ (id)_defaultLabelColor;
+ (id)_defaultLabelFont;
+ (id)defaultButtonFont;
- (BOOL)_canGetPadding;
- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3;
- (BOOL)_createdByBarButtonItem;
- (BOOL)_infoIsButton;
- (BOOL)_isBordered;
- (BOOL)_isBorderedOtherThanAccessibility;
- (BOOL)_shouldApplyPadding;
- (BOOL)_showsAccessibilityBackgroundWhenEnabled;
- (BOOL)_useBarHeight;
- (BOOL)_wantsAccessibilityButtonShapes;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_buttonBarHitRect;
- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)_appearanceGuideClass;
- (UIColor)_tintColor;
- (UIEdgeInsets)_additionalSelectionInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3;
- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3;
- (double)_paddingForLeft:(BOOL)a3;
- (double)initWithImage:(double)a3 pressedImage:(double)a4 label:(double)a5 labelHeight:(double)a6 withBarStyle:(uint64_t)a7 withStyle:(void *)a8 withInsets:(void *)a9 possibleTitles:(uint64_t)a10 possibleSystemItems:(uint64_t)a11 withToolbarTintColor:(uint64_t)a12 bezel:(uint64_t)a13 imageInsets:(double)a14 glowInsets:(double)a15 landscape:(double)a16;
- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5;
- (id)_info;
- (id)_titleTextAttributesForState:(unint64_t)a3;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6;
- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTintColor:(id)a3;
- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)_adjustPushButtonForMiniBar:(BOOL)a3 isChangingBarHeight:(BOOL)a4;
- (void)_adjustToolbarButtonInfo;
- (void)_adjustToolbarButtonInfoTintColorHasChanged:(BOOL)a3;
- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4;
- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3;
- (void)_setAppearanceGuideClass:(Class)a3;
- (void)_setBarHeight:(float)a3;
- (void)_setButtonBarHitRect:(CGRect)a3;
- (void)_setCreatedByBarButtonItem:(BOOL)a3;
- (void)_setInTopBar:(BOOL)a3;
- (void)_setInfoExtremityWidth:(float)a3 isMin:(BOOL)a4;
- (void)_setInfoFlexibleWidth:(BOOL)a3;
- (void)_setInfoWidth:(float)a3;
- (void)_setLastHighlightSuccessful:(BOOL)a3;
- (void)_setPressed:(BOOL)a3;
- (void)_setTouchHasHighlighted:(BOOL)a3;
- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3;
- (void)_sizeView:(id)a3 toPossibleTitles:(id)a4 pressedTitle:(id)a5;
- (void)_updateInfoTextColorsForState:(unint64_t)a3;
- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBarStyle:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setToolbarTintColor:(id)a3;
- (void)setUseSelectedImage:(BOOL)a3;
@end

@implementation UIToolbarButton

+ (id)defaultButtonFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:17.0];
}

- (void)_setInTopBar:(BOOL)a3
{
  if (self->_isInTopBar != a3)
  {
    self->_isInTopBar = a3;
    [(UIToolbarButton *)self layoutSubviews];
  }
}

+ (id)_defaultLabelFont
{
  return (id)[off_1E52D39B8 boldSystemFontOfSize:10.0];
}

+ (id)_defaultLabelColor
{
  id result = (id)_defaultLabelColor___labelColor;
  if (!_defaultLabelColor___labelColor)
  {
    id result = [[UIColor alloc] initWithWhite:0.6 alpha:1.0];
    _defaultLabelColor___labelColor = (uint64_t)result;
  }
  return result;
}

- (double)initWithImage:(double)a3 pressedImage:(double)a4 label:(double)a5 labelHeight:(double)a6 withBarStyle:(uint64_t)a7 withStyle:(void *)a8 withInsets:(void *)a9 possibleTitles:(uint64_t)a10 possibleSystemItems:(uint64_t)a11 withToolbarTintColor:(uint64_t)a12 bezel:(uint64_t)a13 imageInsets:(double)a14 glowInsets:(double)a15 landscape:(double)a16
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a8)
  {
    [a8 size];
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    double v32 = *MEMORY[0x1E4F1DB30];
    double v34 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v35 = MEMORY[0x1E4F1DB28];
  v36 = (double *)MEMORY[0x1E4F1DAD8];
  if (a9)
  {
    [a9 size];
    if (v37 > v32) {
      double v32 = v37;
    }
    if (v38 > v34) {
      double v34 = v38;
    }
  }
  double v39 = *(double *)(v35 + 16);
  double v41 = *v36;
  double v40 = v36[1];
  if (a17)
  {
    double v42 = v36[1];
    if ([a17 count])
    {
      uint64_t v58 = a10;
      double v43 = *MEMORY[0x1E4F1DB30];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v44 = [a17 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v68 != v46) {
              objc_enumerationMutation(a17);
            }
            uint64_t v48 = [*(id *)(*((void *)&v67 + 1) + 8 * i) integerValue];
            id v65 = 0;
            id v66 = 0;
            LOWORD(v57) = a28;
            +[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:](UIBarButtonItem, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:", 0, 0, &v66, &v65, 0, a11, v57, v48, 0);
            [v66 size];
            if (v43 < v49)
            {
              [v66 size];
              double v43 = v50;
            }
            if (v65)
            {
              [v65 size];
              if (v43 < v51)
              {
                [v65 size];
                double v43 = v52;
              }
            }
          }
          uint64_t v45 = [a17 countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v45);
      }
      if (v32 < v43) {
        double v32 = v43;
      }
      a10 = v58;
    }
    double v40 = v42;
  }
  if (v39 + 2.0 <= v32) {
    double v53 = v32;
  }
  else {
    double v53 = v39 + 2.0;
  }
  v64.receiver = a1;
  v64.super_class = (Class)UIToolbarButton;
  v54 = (double *)objc_msgSendSuper2(&v64, sel_initWithFrame_, v41, v40, v53, v34);
  *((void *)v54 + 77) = a18;
  *((void *)v54 + 65) = a24;
  *((void *)v54 + 66) = a25;
  *((void *)v54 + 67) = a26;
  *((void *)v54 + 68) = a27;
  *((void *)v54 + 63) = a11;
  v54[64] = 0.0;
  if (a8)
  {
    *((void *)v54 + 61) = [(UINavigationButton *)[_UIToolbarNavigationButton alloc] initWithImage:a8 width:2 * (a12 == 2) style:1 applyBezel:*((void *)v54 + 63) forBarStyle:0 buttonItemStyle:0.0];
  }
  else if (a10)
  {
    v54[62] = 0.0;
    double v55 = 4.0;
    if (a2 > 0.0) {
      double v55 = a2;
    }
    v54[72] = v55;
  }
  v54[73] = a3 + a20;
  v54[74] = a4 + a21;
  v54[75] = a5 + a22;
  v54[76] = a6 + a23;
  [v54 setOpaque:0];
  [v54 addSubview:*((void *)v54 + 61)];
  [v54 _adjustPushButtonForMiniBar:0 isChangingBarHeight:0];
  [v54 addSubview:*((void *)v54 + 62)];
  [v54 setNeedsLayout];
  return v54;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIToolbarButton;
  [(UIView *)&v3 dealloc];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (dyld_program_sdk_at_least())
  {
    info = self->_info;
    return [(UIButton *)info gestureRecognizerShouldBegin:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIToolbarButton;
    return [(UIView *)&v7 gestureRecognizerShouldBegin:a3];
  }
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    info = self->_info;
    [(UINavigationButton *)info _setWantsBlendModeForAccessibilityBackgrounds:v3];
  }
}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  info = self->_info;
  return [(UINavigationButton *)info _showsAccessibilityBackgroundWhenEnabled];
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  info = self->_info;
  return [(UINavigationButton *)info _wantsAccessibilityButtonShapes];
}

- (void)_setCreatedByBarButtonItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    info = self->_info;
    [(UINavigationButton *)info _setCreatedByBarButtonItem:v3];
  }
}

- (BOOL)_createdByBarButtonItem
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  info = self->_info;
  return [(UINavigationButton *)info _createdByBarButtonItem];
}

- (void)_sizeView:(id)a3 toPossibleTitles:(id)a4 pressedTitle:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [a3 frame];
  double v10 = v9;
  if (isKindOfClass) {
    v11 = (void *)[a3 titleForState:0];
  }
  else {
    v11 = (void *)[a3 text];
  }
  float v12 = v10;
  id v13 = v11;
  if (a5 && ([a4 containsObject:a5] & 1) == 0)
  {
    if (isKindOfClass) {
      [a3 setTitle:a5 forState:0];
    }
    else {
      [a3 setText:a5];
    }
    [a3 sizeToFit];
    [a3 frame];
    float v15 = v14;
    if (v15 > v12) {
      float v12 = v14;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [a4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(a4);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (isKindOfClass) {
          [a3 setTitle:v20 forState:0];
        }
        else {
          [a3 setText:v20];
        }
        [a3 sizeToFit];
        [a3 frame];
        float v22 = v21;
        if (v12 < v22) {
          float v12 = v21;
        }
      }
      uint64_t v17 = [a4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
  [a3 frame];
  objc_msgSend(a3, "setFrame:");
  if (isKindOfClass) {
    [a3 setTitle:v13 forState:0];
  }
  else {
    [a3 setText:v13];
  }
}

- (void)setImage:(id)a3
{
}

- (void)_setButtonBarHitRect:(CGRect)a3
{
  self->_hitRect = a3;
}

- (CGRect)_buttonBarHitRect
{
  double x = self->_hitRect.origin.x;
  double y = self->_hitRect.origin.y;
  double width = self->_hitRect.size.width;
  double height = self->_hitRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIToolbarButton *)self _infoIsButton])
  {
    self->_onState = v3;
    [(UINavigationButton *)self->_info setHighlighted:v3];
  }
  label = self->_label;
  if (v3) {
    v6 = +[UIColor whiteColor];
  }
  else {
    v6 = (UIColor *)[(id)objc_opt_class() _defaultLabelColor];
  }
  [(UILabel *)label setTextColor:v6];
  [(UIView *)self setNeedsLayout];
}

- (void)setUseSelectedImage:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIToolbarButton *)self _infoIsButton])
  {
    info = self->_info;
    [(UIButton *)info setSelected:v3];
  }
  else if (v3)
  {
    objc_super v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIToolbarButton.m" lineNumber:313 description:@"Selection not supported on toolbar items not backed by a UIButton subclass."];
  }
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = left == self->__additionalSelectionInsets.left && top == self->__additionalSelectionInsets.top;
    BOOL v9 = v8 && right == self->__additionalSelectionInsets.right;
    if (!v9 || bottom != self->__additionalSelectionInsets.bottom)
    {
      -[UINavigationButton _setAdditionalSelectionInsets:](self->_info, "_setAdditionalSelectionInsets:", top, left, bottom, right);
      info = self->_info;
      [(UIButton *)info setNeedsLayout];
    }
  }
}

- (void)_setInfoWidth:(float)a3
{
  double v4 = a3;
  self->_minimumWidth = a3;
  self->_maximumWidth = a3;
  [(UIView *)self->_info frame];
  -[UIButton setFrame:](self->_info, "setFrame:");
  [(UIView *)self frame];
  if (v5 < v4)
  {
    [(UIView *)self frame];
    -[UIView setFrame:](self, "setFrame:");
  }
}

- (void)_setInfoExtremityWidth:(float)a3 isMin:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = a3;
  if (a4)
  {
    self->_double minimumWidth = v6;
    double maximumWidth = self->_maximumWidth;
  }
  else
  {
    self->_double maximumWidth = v6;
    double maximumWidth = a3;
  }
  if (maximumWidth > 0.0)
  {
    double minimumWidth = self->_minimumWidth;
    if (maximumWidth < minimumWidth) {
      self->_double maximumWidth = minimumWidth;
    }
  }
  [(UIView *)self->_info frame];
  if (v9 >= v6) {
    double v10 = v9;
  }
  else {
    double v10 = v6;
  }
  if (v9 >= v6) {
    double v9 = v6;
  }
  if (v4) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  -[UIButton setFrame:](self->_info, "setFrame:");
  [(UIView *)self frame];
  if (v11 != v12)
  {
    [(UIView *)self frame];
    -[UIView setFrame:](self, "setFrame:");
  }
}

- (void)_setInfoFlexibleWidth:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIView *)self->_info autoresizingMask];
  if (v3) {
    uint64_t v6 = v5 & 0xFFFFFFFD | 2;
  }
  else {
    uint64_t v6 = v5 & 0xFFFFFFFD;
  }
  info = self->_info;
  [(UIView *)info setAutoresizingMask:v6];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIToolbarButton;
    [(UIControl *)&v10 setEnabled:v3];
    if ([(UIToolbarButton *)self _infoIsButton])
    {
      [(UINavigationButton *)self->_info setEnabled:v3];
      uint64_t v5 = [self->_appearanceStorage textAttributesForState:0];
      if (v5)
      {
        uint64_t v6 = v5;
        BOOL v7 = [(UIControl *)self isHighlighted];
        uint64_t v8 = 2;
        if (v3) {
          uint64_t v8 = 0;
        }
        if (v7) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v8;
        }
        if (v7 || !v3) {
          uint64_t v6 = [self->_appearanceStorage textAttributesForState:v9];
        }
        [(UIToolbarButton *)self _updateShadowOffsetWithAttributes:v6 forState:v9];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [self->_appearanceStorage textAttributesForState:2]) {
        [(UIToolbarButton *)self _adjustToolbarButtonInfo];
      }
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)UIToolbarButton;
  if (-[UIControl pointMostlyInside:withEvent:](&v10, sel_pointMostlyInside_withEvent_, a4)) {
    return 1;
  }
  p_hitRect = &self->_hitRect;
  v11.double x = x;
  v11.double y = y;
  if (CGRectContainsPoint(self->_hitRect, v11)) {
    return 1;
  }
  uint64_t v9 = [[(UIView *)self superview] _barPosition];
  BOOL result = 0;
  if (v9 != 1 && v9 != 4)
  {
    v12.origin.double x = p_hitRect->origin.x;
    v12.origin.double y = self->_hitRect.origin.y;
    v12.size.double width = self->_hitRect.size.width;
    v12.size.double height = self->_hitRect.size.height;
    if (x >= CGRectGetMinX(v12)
      && (v13.origin.double x = p_hitRect->origin.x,
          v13.origin.double y = self->_hitRect.origin.y,
          v13.size.double width = self->_hitRect.size.width,
          v13.size.double height = self->_hitRect.size.height,
          x <= CGRectGetMaxX(v13)))
    {
      v14.origin.double x = p_hitRect->origin.x;
      v14.origin.double y = self->_hitRect.origin.y;
      v14.size.double width = self->_hitRect.size.width;
      v14.size.double height = self->_hitRect.size.height;
      return y <= CGRectGetMaxY(v14);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIToolbarButton;
  uint64_t v5 = -[UIControl hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
  if ([(UIToolbarButton *)self _infoIsButton] && v5 == self->_info) {
    return self;
  }
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIToolbarButton;
  uint64_t v5 = -[UIControl hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([(UIToolbarButton *)self _infoIsButton] && v5 == self->_info) {
    return self;
  }
  return v5;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return 1;
}

- (void)_setLastHighlightSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarButton;
  -[UIControl _setLastHighlightSuccessful:](&v5, sel__setLastHighlightSuccessful_);
  if ([(UIToolbarButton *)self _infoIsButton]) {
    [(UIControl *)self->_info _setLastHighlightSuccessful:v3];
  }
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarButton;
  -[UIControl _setTouchHasHighlighted:](&v5, sel__setTouchHasHighlighted_);
  if ([(UIToolbarButton *)self _infoIsButton]) {
    [(UIControl *)self->_info _setTouchHasHighlighted:v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v37.receiver = self;
  v37.super_class = (Class)UIToolbarButton;
  -[UIControl setHighlighted:](&v37, sel_setHighlighted_);
  if ([(UIToolbarButton *)self _infoIsButton])
  {
    [(UINavigationButton *)self->_info setHighlighted:self->_onState | v3];
    uint64_t v5 = [self->_appearanceStorage textAttributesForState:0];
    if (v5)
    {
      uint64_t v6 = v5;
      if (v3) {
        uint64_t v6 = [self->_appearanceStorage textAttributesForState:1];
      }
      [(UIToolbarButton *)self _updateShadowOffsetWithAttributes:v6 forState:v3];
    }
  }
  else if (v3)
  {
    if (!__backgroundGlow)
    {
      __backgroundGlow = [[UIImageView alloc] initWithImage:_UIImageWithName(@"UIButtonBarPressedIndicator.png")];
      [(id)__backgroundGlow setEnabled:0];
      [(id)__backgroundGlow setOpaque:0];
    }
    if (-[UIView _containerStyle](self) == 1) {
      objc_super v7 = [(UIView *)self window];
    }
    else {
      objc_super v7 = [(UIView *)self superview];
    }
    [(UIView *)v7 addSubview:__backgroundGlow];
    [(UIView *)self frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(id)__backgroundGlow frame];
    double top = self->_infoInsets.top;
    double left = self->_infoInsets.left;
    double v20 = left + v9 - round((v16 - v13) * 0.5);
    double v21 = top + v11 - round((v17 - v15) * 0.5);
    double v22 = v16 - (left + self->_infoInsets.right);
    double v23 = v17 - (top + self->_infoInsets.bottom);
    double v24 = self->_glowAdjust.top;
    double v25 = self->_glowAdjust.left;
    double v26 = v20 + v25;
    double v27 = v21 + v24;
    double v28 = v22 - (v25 + self->_glowAdjust.right);
    double v29 = v23 - (v24 + self->_glowAdjust.bottom);
    if (-[UIView _containerStyle](self) == 1)
    {
      -[UIView convertRect:fromView:]([(UIView *)self window], "convertRect:fromView:", [(UIView *)self superview], v26, v27, v28, v29);
      double v26 = v30;
      double v27 = v31;
      double v28 = v32;
      double v29 = v33;
    }
    objc_msgSend((id)__backgroundGlow, "setFrame:", v26, v27, v28, v29);
    [(id)__backgroundGlow setAlpha:1.0];
    [[(UIView *)self superview] bringSubviewToFront:self];
    if (-[UIView _containerStyle](self) == 1)
    {
      double v34 = [(UIView *)self window];
      [(UIView *)v34 addSubview:__backgroundGlow];
      uint64_t v35 = [(UIView *)self window];
      [(UIView *)v35 bringSubviewToFront:__backgroundGlow];
    }
    else
    {
      v36 = [(UIView *)self superview];
      [(UIView *)v36 _addSubview:__backgroundGlow positioned:-2 relativeTo:self];
    }
  }
  else if ([(UIControl *)self isTouchInside])
  {
    +[UIView animateWithDuration:&__block_literal_global_54 animations:0 completion:0.25];
  }
  else
  {
    [(id)__backgroundGlow setAlpha:0.0];
  }
}

uint64_t __34__UIToolbarButton_setHighlighted___block_invoke()
{
  return [(id)__backgroundGlow setAlpha:0.0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UINavigationButton sizeThatFits:](self->_info, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(UIButton *)self->_info alignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UIToolbarButton *)self _isBordered])
  {
    double v11 = v4;
    double v12 = v6;
    double v13 = v8;
    double v14 = v10;
  }
  else
  {
    double v15 = [(UIButton *)self->_info imageForState:0];
    [(UIImage *)v15 alignmentRectInsets];
  }
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v9 = [(UIToolbarButton *)self _wantsAccessibilityButtonShapes];
  if (a3 || !v9)
  {
    id appearanceStorage = self->_appearanceStorage;
    return (id)[appearanceStorage backgroundImageForState:a3 style:a4 isMini:v5];
  }
  else
  {
    return _UINavigationButtonAccessibilityBackground(0, v5);
  }
}

- (void)_adjustPushButtonForMiniBar:(BOOL)a3 isChangingBarHeight:(BOOL)a4
{
  BOOL v5 = a3;
  if ([self->_appearanceStorage anyBackgroundImage]) {
    char v7 = 0;
  }
  else {
    char v7 = ![(UIToolbarButton *)self _wantsAccessibilityButtonShapes];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || (v7) {
    return;
  }
  info = self->_info;
  id v9 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:0 style:self->_style isMini:v5];
  id v10 = v9;
  if (v5)
  {
    if (v9)
    {
      char v11 = 1;
      goto LABEL_12;
    }
    id v10 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:0 style:self->_style isMini:0];
  }
  char v11 = 0;
LABEL_12:
  double v12 = [(UIToolbarButton *)self _tintColor];
  int64_t style = self->_style;
  if (style != 7 && v10 != 0)
  {
    [(UIButton *)info setBackgroundImage:v10 forState:0];
    id v16 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:1 style:self->_style isMini:v5];
    if (v16) {
      int v17 = 1;
    }
    else {
      int v17 = !v5;
    }
    if (v17) {
      id v18 = v16;
    }
    else {
      id v18 = 0;
    }
    if (((v11 | v17) & 1) == 0) {
      id v18 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:1 style:self->_style isMini:0];
    }
    [(UIButton *)info setBackgroundImage:v18 forState:1];
    id v19 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:4 style:self->_style isMini:v5];
    if (v19) {
      int v20 = 1;
    }
    else {
      int v20 = !v5;
    }
    if (v20) {
      id v21 = v19;
    }
    else {
      id v21 = 0;
    }
    if (((v11 | v20) & 1) == 0) {
      id v21 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:4 style:self->_style isMini:0];
    }
    [(UIButton *)info setBackgroundImage:v21 forState:4];
    id v22 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:2 style:self->_style isMini:v5];
    if (v22) {
      int v23 = 1;
    }
    else {
      int v23 = !v5;
    }
    if (v23) {
      id v24 = v22;
    }
    else {
      id v24 = 0;
    }
    if (((v11 | v23) & 1) == 0) {
      id v24 = [(UIToolbarButton *)self _customOrAccessibilityBackgroundImageForState:2 style:self->_style isMini:0];
    }
    [(UIButton *)info setBackgroundImage:v24 forState:2];
    [(UINavigationButton *)info setControlSize:v5];
    [(UIView *)info frame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    -[UINavigationButton sizeThatFits:](info, "sizeThatFits:", 10000.0, 10000.0);
    if (self->_minimumWidth >= minimumWidth) {
      double minimumWidth = self->_minimumWidth;
    }
    if (minimumWidth < v30) {
      double minimumWidth = v30;
    }
    double maximumWidth = self->_maximumWidth;
    if (maximumWidth >= minimumWidth || maximumWidth <= 0.0) {
      double maximumWidth = minimumWidth;
    }
    if (v34 >= v32) {
      double v37 = v34;
    }
    else {
      double v37 = v32;
    }
    -[UIButton setFrame:](info, "setFrame:", v26, v28, maximumWidth, v37);
    goto LABEL_64;
  }
  if (style == 7 || v12 == 0)
  {
    [(UIButton *)info setBackgroundImage:0 forState:0];
    [(UIButton *)info setBackgroundImage:0 forState:1];
    if (self->_style != 2) {
      goto LABEL_64;
    }
  }
  else
  {
    [(UIButton *)info setBackgroundImage:0 forState:0];
    [(UIButton *)info setBackgroundImage:0 forState:1];
    if (style != 2) {
      goto LABEL_64;
    }
  }
  [(UIButton *)info setBackgroundImage:0 forState:2];
LABEL_64:
  if (!a4) {
    [(UIButton *)info setTitleColor:0 forState:2];
  }
  if (!v10 || [(UIButton *)info currentTitle] || [(UIButton *)info currentImage])
  {
    [(UIView *)info frame];
    -[UIButton setFrame:](info, "setFrame:");
  }
  [(UIView *)info sizeToFit];
  [(UIView *)info layoutBelowIfNeeded];
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  CGRect v70 = CGRectInset(v69, 0.0, 0.0);
  CGFloat x = v70.origin.x;
  double y = v70.origin.y;
  double width = v70.size.width;
  double height = v70.size.height;
  label = self->_label;
  if (label)
  {
    [(UIView *)label frame];
    -[UILabel setFrame:](self->_label, "setFrame:", round((width - v8) * 0.5), y + height - v9);
    double height = height - self->_labelHeight;
  }
  if (self->_info)
  {
    objc_opt_class();
    BOOL v10 = (objc_opt_isKindOfClass() & 1) != 0 && [(UIButton *)self->_info imageForState:0] != 0;
    if ([(UIView *)self window])
    {
      BOOL v11 = [(UIToolbarButton *)self _showsAccessibilityBackgroundWhenEnabled];
      if (v10 || v11)
      {
        BOOL v12 = v11;
        -[_UIToolbarNavigationButton updateImageIfNeededWithTintColor:](self->_info, "updateImageIfNeededWithTintColor:", [self->_appearanceStorage tintColor]);
        if (v12) {
          [(UIView *)self->_info sizeToFit];
        }
      }
    }
    [(UIView *)self->_info frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double rect = v17;
    double v19 = v18;
    +[UIToolbar defaultHeight];
    double v21 = v20;
    if ([(UIToolbarButton *)self _wantsAccessibilityButtonShapes] || v19 >= 30.0)
    {
      v71.origin.CGFloat x = v14;
      v71.origin.double y = v16;
      v71.size.double width = rect;
      v71.size.double height = v19;
      BOOL v22 = CGRectGetHeight(v71) <= 24.0;
    }
    else
    {
      BOOL v22 = 1;
    }
    [(UIView *)self superview];
    if (objc_opt_respondsToSelector())
    {
      double v23 = height;
      if (([[(UIView *)self superview] _hidesShadow] & 1) == 0)
      {
        id v24 = [(UIView *)self superview];
        objc_msgSend(-[UIView _screen](self, "_screen"), "scale");
        double v26 = 1.0 / v25;
        uint64_t v27 = [(UIView *)v24 _barPosition];
        BOOL v28 = v27 == 4 || v27 == 1;
        double v29 = 0.0;
        if (v28) {
          double v29 = v26;
        }
        double y = y - v29;
        double v23 = height + v26;
      }
    }
    else
    {
      double v23 = height;
    }
    BOOL v30 = [(UIToolbarButton *)self _isBordered];
    if (v30 && v22 != height < v21)
    {
      [(UIToolbarButton *)self _adjustPushButtonForMiniBar:height < v21 isChangingBarHeight:1];
      [(UIView *)self->_info frame];
      double rect = v31;
      double v19 = v32;
    }
    double v66 = v21;
    UIRoundToViewScale(self);
    double v34 = v33;
    if (v30 || !v10)
    {
      v72.origin.CGFloat x = x;
      v72.origin.double y = y;
      v72.size.double width = width;
      v72.size.double height = v23;
      CGRectGetMinY(v72);
      UIFloorToViewScale(self);
      double v36 = v35;
    }
    else
    {
      double v63 = v33;
      CGFloat v64 = y;
      CGFloat v65 = width;
      if (![(CALayer *)[(UIView *)self->_info layer] needsLayout]
        && ![(UIButton *)self->_info _imageView]
        && [(UIButton *)self->_info imageForState:0])
      {
        [(UIButton *)self->_info setNeedsLayout];
      }
      [(UIView *)self->_info layoutIfNeeded];
      objc_msgSend(-[UIButton _imageView](self->_info, "_imageView"), "frame");
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      v73.origin.CGFloat x = x;
      v73.origin.double y = v64;
      v73.size.double width = v65;
      v73.size.double height = v23;
      CGRectGetMinY(v73);
      UIFloorToViewScale(self);
      double v46 = v45;
      v74.origin.CGFloat x = v38;
      v74.origin.double y = v40;
      v74.size.double width = v42;
      v74.size.double height = v44;
      double v36 = v46 - CGRectGetMinY(v74);
      double v34 = v63;
    }
    double top = self->_infoInsets.top;
    double left = self->_infoInsets.left;
    double v49 = left + self->_infoInsets.right;
    double v50 = top + self->_infoInsets.bottom;
    id appearanceStorage = self->_appearanceStorage;
    if (height >= v66) {
      uint64_t v52 = [appearanceStorage titlePositionOffset];
    }
    else {
      uint64_t v52 = [appearanceStorage miniTitlePositionOffset];
    }
    double v53 = (void *)v52;
    double v54 = v34 + left;
    double v55 = v36 + top;
    if (v30)
    {
      BOOL v56 = height < v66;
      double v57 = 2.0;
      if (!self->_isInTopBar) {
        double v57 = 3.0;
      }
      double v58 = v55 + v57;
      [self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:v56];
      double v55 = v59 + v58;
      if (v53)
      {
        [v53 UIOffsetValue];
        -[UIButton setTitleEdgeInsets:](self->_info, "setTitleEdgeInsets:", v61, v60, -v61, -v60);
      }
    }
    info = self->_info;
    -[UIButton setFrame:](info, "setFrame:", v54, v55, rect - v49, v19 - v50);
  }
}

- (BOOL)_isBorderedOtherThanAccessibility
{
  return [self->_appearanceStorage anyBackgroundImage] != 0;
}

- (BOOL)_isBordered
{
  if ([(UIToolbarButton *)self _wantsAccessibilityButtonShapes]) {
    return 1;
  }
  return [(UIToolbarButton *)self _isBorderedOtherThanAccessibility];
}

- (BOOL)_infoIsButton
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  return [(UIToolbarButton *)self _isBordered];
}

- (BOOL)_canGetPadding
{
  [(UIView *)self bounds];
  return v3 > 0.0 && v2 > 0.0;
}

- (BOOL)_shouldApplyPadding
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_style
      && [self->_appearanceStorage anyBackgroundImage];
}

- (double)_paddingForLeft:(BOOL)a3
{
  double v5 = 0.0;
  if ([(UIToolbarButton *)self _shouldApplyPadding])
  {
    [(UIView *)self layoutIfNeeded];
    [(UIView *)self->_info frame];
    double v5 = v7;
    if (!a3)
    {
      double v8 = v6;
      [(UIView *)self bounds];
      return v9 - v5 - v8;
    }
  }
  return v5;
}

- (void)_setBarHeight:(float)a3
{
  self->_barHeight = 1;
  [(UIView *)self frame];
  -[UIView setFrame:](self, "setFrame:");
}

- (BOOL)_useBarHeight
{
  return self->_barHeight;
}

- (void)setToolbarTintColor:(id)a3
{
  toolbarTintColor = self->_toolbarTintColor;
  if (toolbarTintColor != a3)
  {

    self->_toolbarTintColor = (UIColor *)a3;
    [(UIToolbarButton *)self _adjustToolbarButtonInfo];
  }
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    [(UIToolbarButton *)self _adjustToolbarButtonInfo];
  }
}

- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3
{
  double v3 = 0.0;
  double v4 = -1.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  info = self->_info;
  if ((isKindOfClass & 1) != 0 || !info)
  {
    double v9 = 0;
  }
  else
  {
    if ([(UIControl *)self isEnabled]) {
      a4 = 0;
    }
    else {
      a4 = 2;
    }
    double v9 = info;
    info = 0;
  }
  BOOL v10 = (void *)[a3 objectForKey:*(void *)off_1E52D2238];
  if (v10) {
    [v10 shadowOffset];
  }
  else {
    [(UIToolbarButton *)self _defaultTitleShadowOffsetForState:a4];
  }
  double v13 = v11;
  double v14 = v12;
  -[UILabel setShadowOffset:]([(UIButton *)info titleLabel], "setShadowOffset:", v11, v12);
  -[_UIToolbarNavigationButton setShadowOffset:](v9, "setShadowOffset:", v13, v14);
}

- (void)_updateInfoTextColorsForState:(unint64_t)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  info = self->_info;
  if ((isKindOfClass & 1) != 0 || !info)
  {
    double v8 = 0;
    unint64_t v7 = a3;
  }
  else
  {
    if ([(UIControl *)self isEnabled]) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = 2;
    }
    double v8 = info;
    info = 0;
  }
  double v9 = (void *)[self->_appearanceStorage textAttributesForState:0];
  if (v9)
  {
    if (v7) {
      double v9 = (void *)[self->_appearanceStorage textAttributesForState:v7];
    }
    BOOL v10 = v9;
    uint64_t v11 = [v9 objectForKey:*(void *)off_1E52D2048];
    [(UIButton *)info setTitleColor:v11 forState:a3];
    [(_UIToolbarNavigationButton *)v8 setTextColor:v11];
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", *(void *)off_1E52D2238), "shadowColor");
    [(UIButton *)info setTitleShadowColor:v12 forState:a3];
    [(_UIToolbarNavigationButton *)v8 setShadowColor:v12];
    BOOL v13 = [(UIControl *)self isEnabled];
    uint64_t v14 = 2;
    if (v13) {
      uint64_t v14 = 0;
    }
    if (v14 == a3)
    {
      [(UIToolbarButton *)self _updateShadowOffsetWithAttributes:v10 forState:a3];
    }
  }
}

- (void)_adjustToolbarButtonInfo
{
}

- (void)_adjustToolbarButtonInfoTintColorHasChanged:(BOOL)a3
{
  [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = [(UIView *)self superview];
  }
  else {
    double v4 = 0;
  }
  uint64_t v5 = [(UIView *)v4 isMinibar];
  BOOL v6 = [(UIToolbarButton *)self _infoIsButton];
  if (v6)
  {
    [(UIToolbarButton *)self _adjustPushButtonForMiniBar:v5 isChangingBarHeight:0];
    info = self->_info;
    toolbarTintColor = (UIColor *)[self->_appearanceStorage tintColor];
    if (!toolbarTintColor) {
      toolbarTintColor = self->_toolbarTintColor;
    }
    [(UIView *)self setTintColor:toolbarTintColor];
    [(UINavigationButton *)info setBarStyle:self->_barStyle];
    -[UINavigationButton _setTitleTextAttributes:forState:](info, "_setTitleTextAttributes:forState:", [self->_appearanceStorage textAttributesForState:0], 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(self->_appearanceStorage, "textAttributesForState:", 0), "objectForKey:", *(void *)off_1E52D2040);
  if (v9)
  {
    BOOL v10 = (void *)v9;
    uint64_t v11 = self->_info;
    if (v6) {
      uint64_t v11 = [(UIButton *)v11 titleLabel];
    }
    [v10 pointSize];
    if (v12 == 0.0)
    {
      double v13 = 17.0;
      if (v6) {
        double v13 = 12.0;
      }
      BOOL v10 = (void *)[v10 fontWithSize:v13];
    }
    [(UIButton *)v11 setFont:v10];
  }
  if (v6)
  {
    [(UIToolbarButton *)self _updateInfoTextColorsForState:0];
    [(UIToolbarButton *)self _updateInfoTextColorsForState:1];
    [(UIToolbarButton *)self _updateInfoTextColorsForState:2];
  }
  else
  {
    if ([(UIControl *)self isEnabled]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 2;
    }
    [(UIToolbarButton *)self _updateInfoTextColorsForState:v14];
    [(UIView *)self alpha];
    if (v15 > 0.0 && [self->_appearanceStorage textAttributesForState:2])
    {
      [(UIView *)self setAlpha:1.0];
    }
  }
}

- (id)_info
{
  return self->_info;
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6
{
  if ((unint64_t)(a6 - 101) > 1)
  {
    id v9 = a3;
    id appearanceStorage = self->_appearanceStorage;
    if (a3)
    {
      if (!appearanceStorage) {
        self->_id appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      }
      if (([v9 _isResizable] & 1) == 0)
      {
        [v9 size];
        double v13 = floor(v12 * 0.5);
        id v9 = (id)objc_msgSend(v9, "resizableImageWithCapInsets:", 0.0, v13, 0.0, v12 - v13 + -1.0);
      }
    }
    else
    {
      if (!appearanceStorage) {
        return;
      }
      id v9 = 0;
    }
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a4 == 4) {
      unint64_t v15 = a4;
    }
    else {
      unint64_t v15 = 1;
    }
    if ((id)[self->_appearanceStorage backgroundImageForState:v15 style:a5 isMini:a6 == 1] != v9)
    {
      [self->_appearanceStorage setBackgroundImage:v9 forState:v15 style:a5 isMini:a6 == 1];
      [(UINavigationButton *)self->_info _setBackgroundImage:v9 forState:a4 style:a5 barMetrics:a6];
      [(UIToolbarButton *)self _adjustToolbarButtonInfo];
      CGFloat v16 = [(UIView *)self superview];
      [(UIView *)v16 setNeedsLayout];
    }
  }
  else if ((_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_0 & 1) == 0)
  {
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_0 = 1;
    NSLog(&cfstr_SCustomization.isa, a2, a3, a4, a5, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
}

- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 4) {
      a3 = 1;
    }
    int64_t style = self->_style;
    id appearanceStorage = self->_appearanceStorage;
    return (id)[appearanceStorage backgroundImageForState:a3 style:style isMini:a4 == 1];
  }
  else
  {
    if ((_backgroundImageForState_barMetrics__didWarn_0 & 1) == 0)
    {
      _backgroundImageForState_barMetrics__didWarn_0 = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return 0;
  }
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  id appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage)
    {
      id appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      self->_id appearanceStorage = appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  BOOL v6 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage tintColor];
  [self->_appearanceStorage setTintColor:a3];
  if (v6 != a3)
  {
    [(UIToolbarButton *)self _adjustToolbarButtonInfoTintColorHasChanged:1];
  }
}

- (UIColor)_tintColor
{
  CGSize result = (UIColor *)[self->_appearanceStorage tintColor];
  if (!result) {
    return self->_toolbarTintColor;
  }
  return result;
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return (id)[self->_appearanceStorage textAttributesForState:a3];
}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    id appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
    if (a3 != 0.0 || appearanceStorage != 0)
    {
      if (!appearanceStorage)
      {
        id appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        self->_id appearanceStorage = appearanceStorage;
      }
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backgroundVerticalAdjustmentForBarMetrics:a4];
      if (v9 != a3)
      {
        [self->_appearanceStorage setBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
        [(UIView *)self setNeedsLayout];
      }
    }
  }
  else if ((_UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn & 1) == 0)
  {
    _UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn = 1;
    NSLog(&cfstr_SCustomization.isa, a2, a3, "UIBarButtonItem", @"toolbar button background vertical position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) > 1)
  {
    id appearanceStorage = self->_appearanceStorage;
    objc_msgSend(appearanceStorage, "backgroundVerticalAdjustmentForBarMetrics:");
  }
  else
  {
    if ((_backgroundVerticalPositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _backgroundVerticalPositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"toolbar button background vertical position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return 0.0;
  }
  return result;
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_0 = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3.horizontal, a3.vertical, "UIBarButtonItem", @"title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  id appearanceStorage = (_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage;
  if (!appearanceStorage)
  {
    if (a3.horizontal == 0.0 && a3.vertical == 0.0) {
      return;
    }
    id appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    self->_id appearanceStorage = appearanceStorage;
  }
  if (a4 != 1)
  {
    double v9 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
    if (v9) {
      goto LABEL_10;
    }
LABEL_12:
    double v10 = 0.0;
    double v11 = 0.0;
    goto LABEL_13;
  }
  double v9 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
  if (!v9) {
    goto LABEL_12;
  }
LABEL_10:
  [(NSValue *)v9 UIOffsetValue];
LABEL_13:
  if (horizontal != v10 || vertical != v11)
  {
    id v12 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)uint64_t v14 = horizontal;
      *(double *)&v14[1] = vertical;
      objc_msgSend(v12, "setMiniTitlePositionOffset:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v14, "{UIOffset=dd}"));
    }
    else
    {
      *(double *)double v13 = horizontal;
      *(double *)&v13[1] = vertical;
      objc_msgSend(v12, "setTitlePositionOffset:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v13, "{UIOffset=dd}"));
    }
    [(UIView *)self setNeedsLayout];
  }
}

- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) <= 1)
  {
    double v3 = 0.0;
    if ((_titlePositionAdjustmentForBarMetrics__didWarn_0 & 1) == 0)
    {
      _titlePositionAdjustmentForBarMetrics__didWarn_0 = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    goto LABEL_9;
  }
  id appearanceStorage = self->_appearanceStorage;
  if (a3 != 1)
  {
    uint64_t v5 = (void *)[appearanceStorage titlePositionOffset];
    if (v5) {
      goto LABEL_6;
    }
LABEL_8:
    double v3 = 0.0;
LABEL_9:
    double v6 = 0.0;
    goto LABEL_10;
  }
  uint64_t v5 = (void *)[appearanceStorage miniTitlePositionOffset];
  if (!v5) {
    goto LABEL_8;
  }
LABEL_6:
  [v5 UIOffsetValue];
  double v3 = v7;
LABEL_10:
  double v8 = v3;
  result.double vertical = v6;
  result.double horizontal = v8;
  return result;
}

- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  if (a4) {
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, a4, (void *)1);
  }
  if (a3)
  {
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:0 style:self->_style isMini:0], 0, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:1 style:self->_style isMini:0], 1, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:4 style:self->_style isMini:0], 4, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:2 style:self->_style isMini:0], 2, self->_style, 0);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:0 style:self->_style isMini:1], 0, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:1 style:self->_style isMini:1], 1, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:4 style:self->_style isMini:1], 4, self->_style, 1);
    -[UIToolbarButton _setBackgroundImage:forState:style:barMetrics:](self, "_setBackgroundImage:forState:style:barMetrics:", [a3 backgroundImageForState:2 style:self->_style isMini:1], 2, self->_style, 1);
    -[UIToolbarButton _setTintColor:](self, "_setTintColor:", [a3 tintColor]);
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", [a3 textAttributesForState:0], 0);
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", [a3 textAttributesForState:2], 2);
    -[UIToolbarButton _setTitleTextAttributes:forState:](self, "_setTitleTextAttributes:forState:", [a3 textAttributesForState:1], 1);
    double v6 = (void *)[a3 titlePositionOffset];
    if (v6)
    {
      [v6 UIOffsetValue];
      -[UIToolbarButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 0);
    }
    double v7 = (void *)[a3 miniTitlePositionOffset];
    if (v7)
    {
      [v7 UIOffsetValue];
      -[UIToolbarButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 1);
    }
    [a3 backgroundVerticalAdjustmentForBarMetrics:0];
    -[UIToolbarButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    [a3 backgroundVerticalAdjustmentForBarMetrics:1];
    -[UIToolbarButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
  }
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  self->_appearanceGuideClass = a3;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top = self->__additionalSelectionInsets.top;
  double left = self->__additionalSelectionInsets.left;
  double bottom = self->__additionalSelectionInsets.bottom;
  double right = self->__additionalSelectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end
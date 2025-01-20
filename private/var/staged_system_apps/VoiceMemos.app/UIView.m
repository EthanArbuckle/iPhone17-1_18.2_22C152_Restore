@interface UIView
+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 completion:(id)a5;
+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 damping:(double)a5 completion:(id)a6;
+ (void)rc_beginDisablingAnimations;
+ (void)rc_endDisablingAnimations;
+ (void)rc_performAnimateableChangesWithAnimationDuration:(double)a3 setupBlock:(id)a4 animatablesBlock:(id)a5 completion:(id)a6;
- (BOOL)rc_canAnimate;
- (BOOL)rc_isProperDescendantOfView:(id)a3;
- (CGSize)size;
- (double)height;
- (double)width;
- (id)_rc_constraintsByNameDictionary:(BOOL)a3;
- (id)_rc_constraintsNamed:(id)a3;
- (id)associatedConstraints;
- (id)rc_autolayoutView;
- (void)addBottomToBottomConstraintWithView:(id)a3 padding:(double)a4;
- (void)addBottomToBottomMarginConstraintWithView:(id)a3 padding:(double)a4;
- (void)addBottomToTopConstraintWithView:(id)a3 padding:(double)a4;
- (void)addCenterXConstraintWithView:(id)a3;
- (void)addCenterXConstraintWithView:(id)a3 padding:(double)a4;
- (void)addCenterYConstraintWithView:(id)a3;
- (void)addCenterYConstraintWithView:(id)a3 padding:(double)a4;
- (void)addConstraintWithAttribute:(int64_t)a3 constant:(double)a4;
- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 padding:(double)a5;
- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 scale:(double)a5 padding:(double)a6;
- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 padding:(double)a6;
- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 scale:(double)a6 padding:(double)a7;
- (void)addLeadingToLeadingConstraintWithView:(id)a3 padding:(double)a4;
- (void)addLeadingToLeadingMarginConstraintWithView:(id)a3 padding:(double)a4;
- (void)addLeadingToTrailingConstraintWithView:(id)a3 padding:(double)a4;
- (void)addLeftToCenterConstraintWithView:(id)a3 padding:(double)a4;
- (void)addLeftToLeftConstraintWithView:(id)a3 padding:(double)a4;
- (void)addLeftToRightConstraintWithView:(id)a3 padding:(double)a4;
- (void)addRightToCenterConstraintWithView:(id)a3 padding:(double)a4;
- (void)addRightToLeftConstraintWithView:(id)a3 padding:(double)a4;
- (void)addRightToRightConstraintWithView:(id)a3 padding:(double)a4;
- (void)addSubviewAndCenter:(id)a3;
- (void)addSubviewAndPinToEdges:(id)a3;
- (void)addTopToBottomConstraintWithView:(id)a3 padding:(double)a4;
- (void)addTopToTopConstraintWithView:(id)a3 padding:(double)a4;
- (void)addTopToTopMarginConstraintWithView:(id)a3 padding:(double)a4;
- (void)addTrailingToLeadingConstraintWithView:(id)a3 padding:(double)a4;
- (void)addTrailingToTrailingConstraintWithView:(id)a3 padding:(double)a4;
- (void)addTrailingToTrailingMarginConstraintWithView:(id)a3 padding:(double)a4;
- (void)alignBottomLeadingToBottomLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeadingToBottomMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeadingToBottomMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignBottomTrailingToBottomTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterBottomToCenterBottomOfView:(id)a3 padding:(double)a4;
- (void)alignCenterBottomToCenterTopOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterLeftToCenterLeftOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeftToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterLeftToCenterRightOfView:(id)a3 padding:(double)a4;
- (void)alignCenterLeftToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterRightToCenterLeftOfView:(id)a3 padding:(double)a4;
- (void)alignCenterRightToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterRightToCenterRightOfView:(id)a3 padding:(double)a4;
- (void)alignCenterRightToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterToCenterOfView:(id)a3;
- (void)alignCenterToCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterTopToCenterBottomOfView:(id)a3 padding:(double)a4;
- (void)alignCenterTopToCenterTopOfView:(id)a3 padding:(double)a4;
- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 padding:(double)a4;
- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignCenterTrailingToCenterTrailingMarginOfView:(id)a3 padding:(double)a4;
- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 padding:(double)a4;
- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeadingToTopLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeadingToTopMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeadingToTopMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeftToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopRightToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopTrailingToTopMarginTrailingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)alignTopTrailingToTopTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)constrainHeight:(double)a3;
- (void)constrainHeightBetweenTopView:(id)a3 bottomView:(id)a4 topPadding:(double)a5 bottomPadding:(double)a6;
- (void)constrainHeightWithView:(id)a3 padding:(double)a4;
- (void)constrainHeightWithView:(id)a3 scale:(double)a4 padding:(double)a5;
- (void)constrainSize:(CGSize)a3;
- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3;
- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3 sizePaddingX:(double)a4 sizePaddingY:(double)a5 centerPaddingX:(double)a6 centerPaddingY:(double)a7;
- (void)constrainSizeWithView:(id)a3 paddingX:(double)a4 paddingY:(double)a5;
- (void)constrainWidth:(double)a3;
- (void)constrainWidthWithView:(id)a3 padding:(double)a4;
- (void)constrainWidthWithView:(id)a3 scale:(double)a4 padding:(double)a5;
- (void)rc_addConstraint:(id)a3;
- (void)rc_addConstraints:(id)a3;
- (void)rc_layoutBelowIfNeeded;
- (void)rc_removeConstraint:(id)a3;
- (void)rc_removeConstraints:(id)a3;
- (void)rc_removeConstraintsNamed:(id)a3;
- (void)rc_removeNamedConstraints;
- (void)rc_setNamedConstraints:(id)a3 forName:(id)a4;
- (void)rc_showAllViewBoundsRecursively:(BOOL)a3;
- (void)rc_updateConstraintsAndLayoutSubtree;
- (void)removeAllConstraints;
- (void)resetAssociatedConstraints;
- (void)setAssociatedConstraints:(id)a3;
- (void)setDoneButtonEnabledState:(int64_t)a3;
@end

@implementation UIView

- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3 sizePaddingX:(double)a4 sizePaddingY:(double)a5 centerPaddingX:(double)a6 centerPaddingY:(double)a7
{
  id v12 = a3;
  [(UIView *)self constrainSizeWithView:v12 paddingX:a4 paddingY:a5];
  [(UIView *)self alignCenterToCenterOfView:v12 paddingX:a6 paddingY:a7];
}

- (void)constrainSizeWithView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addConstraintWithView:v8 attribute:7 padding:a4];
  [(UIView *)self addConstraintWithView:v8 attribute:8 padding:a5];
}

- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignCenterToCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterXConstraintWithView:v8 padding:a4];
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
}

- (void)setDoneButtonEnabledState:(int64_t)a3
{
  if (a3 == 2)
  {
    [(UIView *)self setHidden:1];
    [(UIView *)self setEnabled:0];
    v4 = self;
    uint64_t v5 = 0;
LABEL_6:
    [(UIView *)v4 setUserInteractionEnabled:v5];
    return;
  }
  if (a3 != 1)
  {
    if (a3) {
      return;
    }
    -[UIView setHidden:](self, "setHidden:");
    [(UIView *)self setAlpha:1.0];
    [(UIView *)self setEnabled:1];
    [(UIView *)self setAccessibilityTraits:UIAccessibilityTraitButton];
    v4 = self;
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  [(UIView *)self setHidden:0];
  v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v6 recordingSectionDoneButtonDisabledOpacity];
  -[UIView setAlpha:](self, "setAlpha:");

  [(UIView *)self setEnabled:0];
  [(UIView *)self setUserInteractionEnabled:0];
  unint64_t v7 = (unint64_t)[(UIView *)self accessibilityTraits];
  UIAccessibilityTraits v8 = UIAccessibilityTraitNotEnabled | v7;

  [(UIView *)self setAccessibilityTraits:v8];
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 scale:(double)a6 padding:(double)a7
{
  id v23 = a3;
  id v12 = [(UIView *)self associatedConstraints];
  v13 = +[NSNumber numberWithInteger:a4];
  v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = [v14 secondItem];
    if (v15 == v23 && [v14 secondAttribute] == (id)a5)
    {
      [v14 multiplier];
      double v17 = v16;

      if (v17 == a6)
      {
        [v14 setConstant:a7];
        v18 = [(UIView *)self superview];
        [v18 addConstraint:v14];
        goto LABEL_9;
      }
    }
    else
    {
    }
    v19 = [(UIView *)self superview];
    [v19 removeConstraint:v14];
  }
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v20 = +[NSLayoutConstraint constraintWithItem:self attribute:a4 relatedBy:0 toItem:v23 attribute:a5 multiplier:a6 constant:a7];

  v21 = [(UIView *)self superview];
  [v21 addConstraint:v20];

  v18 = [(UIView *)self associatedConstraints];
  v22 = +[NSNumber numberWithInteger:a4];
  [v18 setObject:v20 forKeyedSubscript:v22];

  v14 = (void *)v20;
LABEL_9:
}

- (id)associatedConstraints
{
  v3 = objc_getAssociatedObject(self, "associatedConstraints");
  if (!v3) {
    [(UIView *)self resetAssociatedConstraints];
  }

  return v3;
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 scale:(double)a5 padding:(double)a6
{
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 padding:(double)a5
{
}

- (void)resetAssociatedConstraints
{
  id v3 = +[NSMutableDictionary dictionary];
  [(UIView *)self setAssociatedConstraints:v3];
}

- (void)setAssociatedConstraints:(id)a3
{
}

- (void)constrainWidthWithView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterTopToCenterTopOfView:(id)a3 padding:(double)a4
{
  id v6 = a3;
  [(UIView *)self addCenterXConstraintWithView:v6];
  [(UIView *)self addTopToTopConstraintWithView:v6 padding:a4];
}

- (void)addTopToTopConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeadingToLeadingConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addCenterXConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addCenterXConstraintWithView:(id)a3
{
}

- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addTrailingToTrailingConstraintWithView:v8 padding:a4];
}

- (void)addTrailingToTrailingConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addCenterYConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3
{
}

- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 padding:(double)a4
{
}

- (void)addBottomToBottomConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)rc_showAllViewBoundsRecursively:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v6 = (double)arc4random_uniform(0xFFu) / 255.0;
  unint64_t v7 = +[UIColor colorWithRed:v5 green:v6 blue:(double)arc4random_uniform(0xFFu) / 255.0 alpha:0.400000006];
  [(UIView *)self setBackgroundColor:v7];

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = [(UIView *)self subviews];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) rc_showAllViewBoundsRecursively:1];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)rc_canAnimate
{
  if (!+[UIView areAnimationsEnabled]) {
    return 0;
  }
  BOOL v3 = [(UIView *)self window];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)rc_beginDisablingAnimations
{
  if (!qword_10026A730++) {
    +[UIView setAnimationsEnabled:0];
  }
}

+ (void)rc_endDisablingAnimations
{
  if (!--qword_10026A730) {
    +[UIView setAnimationsEnabled:1];
  }
}

+ (void)rc_performAnimateableChangesWithAnimationDuration:(double)a3 setupBlock:(id)a4 animatablesBlock:(id)a5 completion:(id)a6
{
  id v11 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = (void (**)(id, uint64_t))a6;
  if (v11) {
    +[UIView performWithoutAnimation:v11];
  }
  if (+[UIView areAnimationsEnabled])
  {
    +[UIView animateWithDuration:v9 animations:v10 completion:a3];
  }
  else
  {
    if (v9) {
      v9[2](v9);
    }
    if (v10) {
      v10[2](v10, 1);
    }
  }
}

- (id)rc_autolayoutView
{
  return self;
}

- (void)rc_updateConstraintsAndLayoutSubtree
{
  [(UIView *)self setNeedsUpdateConstraints];
  [(UIView *)self setNeedsLayout];

  [(UIView *)self layoutBelowIfNeeded];
}

- (void)rc_layoutBelowIfNeeded
{
}

- (BOOL)rc_isProperDescendantOfView:(id)a3
{
  if (a3 == self) {
    return 0;
  }
  else {
    return -[UIView isDescendantOfView:](self, "isDescendantOfView:");
  }
}

- (void)rc_removeConstraint:(id)a3
{
  if (a3) {
    -[UIView removeConstraint:](self, "removeConstraint:");
  }
}

- (void)rc_removeConstraints:(id)a3
{
  if (a3) {
    -[UIView removeConstraints:](self, "removeConstraints:");
  }
}

- (void)rc_addConstraint:(id)a3
{
  if (a3) {
    -[UIView addConstraint:](self, "addConstraint:");
  }
}

- (void)rc_addConstraints:(id)a3
{
  if (a3) {
    -[UIView addConstraints:](self, "addConstraints:");
  }
}

- (id)_rc_constraintsByNameDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = objc_getAssociatedObject(self, "_rc_constraintsByNameStorageKey");
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    double v5 = +[NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, "_rc_constraintsByNameStorageKey", v5, (void *)0x301);
  }

  return v5;
}

- (id)_rc_constraintsNamed:(id)a3
{
  id v4 = a3;
  double v5 = [(UIView *)self _rc_constraintsByNameDictionary:0];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)rc_setNamedConstraints:(id)a3 forName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    unint64_t v7 = [(UIView *)self _rc_constraintsNamed:v6];

    if (v7) {
      [(UIView *)self rc_removeConstraintsNamed:v6];
    }
    id v8 = [(UIView *)self _rc_constraintsByNameDictionary:1];
    id v9 = [v11 constraints];

    if (v9)
    {
      id v10 = [v11 constraints];
      [(UIView *)self addConstraints:v10];
    }
    [v8 setObject:v11 forKey:v6];
  }
  else
  {
    [(UIView *)self rc_removeConstraintsNamed:v6];
  }
}

- (void)rc_removeConstraintsNamed:(id)a3
{
  id v9 = a3;
  id v4 = -[UIView _rc_constraintsNamed:](self, "_rc_constraintsNamed:");
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 constraints];

    if (v6)
    {
      unint64_t v7 = [v5 constraints];
      [(UIView *)self removeConstraints:v7];
    }
    id v8 = [(UIView *)self _rc_constraintsByNameDictionary:0];
    [v8 removeObjectForKey:v9];
  }
}

- (void)rc_removeNamedConstraints
{
  BOOL v3 = [(UIView *)self _rc_constraintsByNameDictionary:0];
  id v4 = [v3 allKeys];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UIView rc_removeConstraintsNamed:](self, "rc_removeConstraintsNamed:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CGSize)size
{
  [(UIView *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)height
{
  [(UIView *)self frame];
  return v2;
}

- (double)width
{
  [(UIView *)self frame];
  return v2;
}

- (void)removeAllConstraints
{
  double v3 = [(UIView *)self associatedConstraints];
  id v5 = [v3 allValues];

  double v4 = [(UIView *)self superview];
  [v4 removeConstraints:v5];

  [(UIView *)self resetAssociatedConstraints];
}

- (void)alignTopLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToRightConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToRightConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeftToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToCenterConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeadingToTopLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeadingToTopMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopMarginConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingMarginConstraintWithView:v8 padding:a4];
}

- (void)alignTopLeadingToTopMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopMarginConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignTopRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToRightConstraintWithView:v8 padding:a4];
}

- (void)alignTopRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignTopRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToRightConstraintWithView:v8 padding:a4];
}

- (void)alignTopRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignTopRightToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToCenterConstraintWithView:v8 padding:a4];
}

- (void)alignTopTrailingToTopTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addTrailingToTrailingConstraintWithView:v8 padding:a4];
}

- (void)alignTopTrailingToTopMarginTrailingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToTopMarginConstraintWithView:v8 padding:a5];
  [(UIView *)self addTrailingToTrailingMarginConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToRightConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addTopToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToRightConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeadingToBottomLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeadingToBottomMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomMarginConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingMarginConstraintWithView:v8 padding:a4];
}

- (void)alignBottomLeadingToBottomMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomMarginConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignBottomRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToRightConstraintWithView:v8 padding:a4];
}

- (void)alignBottomRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignBottomRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToRightConstraintWithView:v8 padding:a4];
}

- (void)alignBottomRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToTopConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignBottomTrailingToBottomTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addBottomToBottomConstraintWithView:v8 padding:a5];
  [(UIView *)self addTrailingToTrailingConstraintWithView:v8 padding:a4];
}

- (void)alignCenterTopToCenterBottomOfView:(id)a3 padding:(double)a4
{
  id v6 = a3;
  [(UIView *)self addCenterXConstraintWithView:v6];
  [(UIView *)self addTopToBottomConstraintWithView:v6 padding:a4];
}

- (void)alignCenterBottomToCenterBottomOfView:(id)a3 padding:(double)a4
{
  id v6 = a3;
  [(UIView *)self addCenterXConstraintWithView:v6];
  [(UIView *)self addBottomToBottomConstraintWithView:v6 padding:a4];
}

- (void)alignCenterBottomToCenterTopOfView:(id)a3 padding:(double)a4
{
  id v6 = a3;
  [(UIView *)self addCenterXConstraintWithView:v6];
  [(UIView *)self addBottomToTopConstraintWithView:v6 padding:a4];
}

- (void)alignCenterLeftToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignCenterLeftToCenterLeftOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterLeftToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeftToRightConstraintWithView:v8 padding:a4];
}

- (void)alignCenterLeftToCenterRightOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterRightToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToRightConstraintWithView:v8 padding:a4];
}

- (void)alignCenterRightToCenterRightOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterRightToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addRightToLeftConstraintWithView:v8 padding:a4];
}

- (void)alignCenterRightToCenterLeftOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToLeadingMarginConstraintWithView:v8 padding:a4];
}

- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addLeadingToTrailingConstraintWithView:v8 padding:a4];
}

- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8 = a3;
  [(UIView *)self addCenterYConstraintWithView:v8 padding:a5];
  [(UIView *)self addTrailingToLeadingConstraintWithView:v8 padding:a4];
}

- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 padding:(double)a4
{
}

- (void)alignCenterTrailingToCenterTrailingMarginOfView:(id)a3 padding:(double)a4
{
  id v6 = a3;
  [(UIView *)self addConstraintWithView:v6 attribute:6 viewAttribute:18 padding:a4];
  [(UIView *)self addCenterYConstraintWithView:v6];
}

- (void)alignCenterToCenterOfView:(id)a3
{
  id v4 = a3;
  [(UIView *)self addCenterXConstraintWithView:v4];
  [(UIView *)self addCenterYConstraintWithView:v4];
}

- (void)constrainWidth:(double)a3
{
}

- (void)constrainWidthWithView:(id)a3 scale:(double)a4 padding:(double)a5
{
}

- (void)constrainHeight:(double)a3
{
}

- (void)constrainHeightWithView:(id)a3 padding:(double)a4
{
}

- (void)constrainHeightWithView:(id)a3 scale:(double)a4 padding:(double)a5
{
}

- (void)constrainHeightBetweenTopView:(id)a3 bottomView:(id)a4 topPadding:(double)a5 bottomPadding:(double)a6
{
  id v10 = a4;
  [(UIView *)self alignCenterTopToCenterBottomOfView:a3 padding:a5];
  [(UIView *)self alignCenterBottomToCenterTopOfView:v10 padding:a6];
}

- (void)constrainSize:(CGSize)a3
{
  double height = a3.height;
  [(UIView *)self addConstraintWithAttribute:7 constant:a3.width];

  [(UIView *)self addConstraintWithAttribute:8 constant:height];
}

- (void)addTopToTopMarginConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addTopToBottomConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addBottomToBottomMarginConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addBottomToTopConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeftToLeftConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeftToRightConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeftToCenterConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addRightToRightConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addRightToLeftConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addRightToCenterConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addTrailingToLeadingConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeadingToTrailingConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addLeadingToLeadingMarginConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addTrailingToTrailingMarginConstraintWithView:(id)a3 padding:(double)a4
{
}

- (void)addCenterYConstraintWithView:(id)a3
{
}

- (void)addConstraintWithAttribute:(int64_t)a3 constant:(double)a4
{
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 padding:(double)a6
{
}

- (void)addSubviewAndPinToEdges:(id)a3
{
  id v4 = a3;
  [(UIView *)self addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = _NSDictionaryOfVariableBindings(@"subviewToAddAndPin", v4, 0);
  id v6 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[subviewToAddAndPin]-0-|", 0, 0, v5);
  [(UIView *)self addConstraints:v6];

  _NSDictionaryOfVariableBindings(@"subviewToAddAndPin", v4, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0-[subviewToAddAndPin]-0-|", 0, 0, v8);
  [(UIView *)self addConstraints:v7];
}

- (void)addSubviewAndCenter:(id)a3
{
  id v4 = a3;
  [(UIView *)self addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(UIView *)self addConstraint:v5];

  id v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

  [(UIView *)self addConstraint:v6];
}

+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 completion:(id)a5
{
}

+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 damping:(double)a5 completion:(id)a6
{
}

@end
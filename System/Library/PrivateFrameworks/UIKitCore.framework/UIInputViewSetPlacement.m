@interface UIInputViewSetPlacement
+ (BOOL)supportsSecureCoding;
+ (id)deactivatedKeyboardPlacementWithCurrentPlacement:(id)a3;
+ (id)encodablePlacementsForXPC;
+ (id)placement;
- (BOOL)accessoryViewWillAppear;
- (BOOL)inputViewWillAppear;
- (BOOL)isCompactAssistantView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (BOOL)isFloatingAssistantView;
- (BOOL)isHiddenForFloatingTransition;
- (BOOL)isInteractive;
- (BOOL)isUndocked;
- (BOOL)isVisible;
- (BOOL)requiresWindowBasedSafeAreaInsets;
- (BOOL)showsInputOrAssistantViews;
- (BOOL)showsInputViews;
- (BOOL)showsKeyboard;
- (CGAffineTransform)transform;
- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (NSArray)subPlacements;
- (UIEdgeInsets)inputAccessoryViewPadding;
- (UIInputViewSetPlacement)assistantView;
- (UIInputViewSetPlacement)initWithCoder:(id)a3;
- (UIInputViewSetPlacementDelegate)delegate;
- (double)alpha;
- (double)extendedHeight;
- (double)inputAssistantViewHeightForInputViewSet:(id)a3;
- (id)applicatorInfoForOwner:(id)a3;
- (id)description;
- (id)expiringPlacement;
- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (unint64_t)computeComparisonMask;
- (unint64_t)indexForPurpose:(unint64_t)a3;
- (unint64_t)notificationsForTransitionToPlacement:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirty;
- (void)setExtendedHeight:(double)a3;
- (void)setSubPlacements:(id)a3;
@end

@implementation UIInputViewSetPlacement

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 inputView];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  [v7 _findAutolayoutHeightConstraint];
  if (v12 != -1.0) {
    double v11 = v12;
  }
  if (v7 && v9 == 0.0)
  {
    NSLog(&cfstr_ApiErrorReturn.isa, v7);
LABEL_7:
    [v7 frame];
    double v9 = v13;
    goto LABEL_8;
  }
  if (v9 == -1.0) {
    goto LABEL_7;
  }
LABEL_8:
  if (v11 == -1.0)
  {
    [v7 frame];
    double v11 = v14;
    if (v14 == 0.0)
    {
      if ([v6 isCustomInputView])
      {
        v15 = [v7 constraints];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v17 = [v7 constraints];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (!v18) {
            goto LABEL_26;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v49;
          while (1)
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v49 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
              v23 = [v22 firstItem];
              if (v23 != v7) {
                goto LABEL_20;
              }
              v24 = [v22 secondItem];
              if (v24)
              {

                v23 = v7;
LABEL_20:

                goto LABEL_21;
              }
              uint64_t v25 = [v22 firstAttribute];

              if (v25 == 8)
              {
                [v22 constant];
                double v11 = v27;
                goto LABEL_26;
              }
LABEL_21:
              ++v21;
            }
            while (v19 != v21);
            uint64_t v26 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
            uint64_t v19 = v26;
            if (!v26)
            {
LABEL_26:

              break;
            }
          }
        }
      }
    }
  }
  uint64_t v28 = [v6 keyboard];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = +[UIKeyboardImpl activeInstance];
    if ([v30 isMinimized])
    {

LABEL_35:
      double v11 = 0.0;
      goto LABEL_36;
    }
    if (![(UIInputViewSetPlacement *)self showsKeyboard])
    {
      BOOL v47 = [(UIInputViewSetPlacement *)self isUndocked];

      if (v47) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if (![(UIInputViewSetPlacement *)self showsKeyboard] {
         && ![(UIInputViewSetPlacement *)self isUndocked])
  }
  {
    goto LABEL_35;
  }
LABEL_36:
  v31 = [v6 inputAssistantView];
  if (!v31 || v11 == 0.0 && +[UIKeyboard isInputSystemUI])
  {
  }
  else
  {
    BOOL v32 = +[UIKeyboard usesInputSystemUI];

    if (!v32)
    {
      v33 = [v6 inputAssistantView];
      [v33 intrinsicContentSize];
      double v35 = v34;

      if (v35 == -1.0)
      {
        double v35 = 0.0;
        if (!+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout])
        {
          if ([(UIInputViewSetPlacement *)self showsInputViews])
          {
            [(UIInputViewSetPlacement *)self inputAssistantViewHeightForInputViewSet:v6];
            double v35 = v36;
          }
        }
      }
      double v11 = v11 + v35;
    }
  }
  if (v4)
  {
    v37 = [v6 inputAccessoryView];

    if (v37)
    {
      v38 = [v6 inputAccessoryView];
      [v38 intrinsicContentSize];
      double v40 = v39;

      if (v40 == -1.0)
      {
        v41 = [v6 inputAccessoryView];
        [v41 frame];
        double v40 = v42;
      }
      double v11 = v11 + v40;
    }
  }

  double v43 = 0.0;
  double v44 = 0.0;
  double v45 = v9;
  double v46 = v11;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (BOOL)showsKeyboard
{
  return 0;
}

- (BOOL)isUndocked
{
  return 0;
}

+ (id)deactivatedKeyboardPlacementWithCurrentPlacement:(id)a3
{
  v3 = (void (**)(void))a3;
  BOOL v4 = +[UIInputViewSetPlacement placement];
  if (_AXSReduceMotionReduceSlideTransitionsEnabled())
  {
    v5 = v3[2](v3);
    uint64_t v6 = +[UIInputViewSetPlacementInvisible placementWithPlacement:v5];

    BOOL v4 = (void *)v6;
  }

  return v4;
}

+ (id)placement
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    v5 = NSStringFromClass((Class)a1);
    [v3 raise:v4, @"%@ is not meant to be instantiated directly", v5 format];
  }
  id v6 = objc_alloc_init((Class)a1);
  return v6;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    id v6 = [MEMORY[0x1E4F5B268] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:a5 attribute:7 multiplier:1.0 constant:0.0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    id v6 = [MEMORY[0x1E4F5B268] constraintWithItem:a4 attribute:1 relatedBy:0 toItem:a5 attribute:1 multiplier:1.0 constant:0.0];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unint64_t)computeComparisonMask
{
  v3 = [(UIInputViewSetPlacement *)self subPlacements];
  unint64_t v4 = [v3 count] + 1;

  for (uint64_t i = 0; i != 7; ++i)
    v4 |= 1 << i << (7
                   * [(UIInputViewSetPlacement *)self indexForPurpose:computeComparisonMask_allPurposes[i]]+ 4);
  return v4;
}

- (NSArray)subPlacements
{
  return 0;
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  return 0;
}

- (BOOL)showsInputViews
{
  return 0;
}

- (id)applicatorInfoForOwner:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"Alpha";
  unint64_t v4 = NSNumber;
  [(UIInputViewSetPlacement *)self alpha];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  v12[0] = v5;
  v11[1] = @"Transform";
  id v6 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetPlacement *)self transform];
  v7 = [v6 valueWithCGAffineTransform:v10];
  v12[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v8;
}

- (CGAffineTransform)transform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)alpha
{
  return 1.0;
}

- (BOOL)isHiddenForFloatingTransition
{
  return 0;
}

- (BOOL)isFloating
{
  return 0;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

+ (id)encodablePlacementsForXPC
{
  v6[24] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v6[12] = objc_opt_class();
  v6[13] = objc_opt_class();
  v6[14] = objc_opt_class();
  v6[15] = objc_opt_class();
  v6[16] = objc_opt_class();
  v6[17] = objc_opt_class();
  v6[18] = objc_opt_class();
  v6[19] = objc_opt_class();
  v6[20] = objc_opt_class();
  v6[21] = objc_opt_class();
  v6[22] = objc_opt_class();
  v6[23] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:24];
  long long v4 = [v2 setWithArray:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)isFloatingAssistantView
{
  return 0;
}

- (BOOL)isVisible
{
  return 1;
}

- (UIInputViewSetPlacementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (UIInputViewSetPlacementDelegate *)WeakRetained;
}

- (BOOL)requiresWindowBasedSafeAreaInsets
{
  BOOL v3 = [(UIInputViewSetPlacement *)self showsInputViews];
  if (v3) {
    LOBYTE(v3) = ![(UIInputViewSetPlacement *)self isUndocked];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIInputViewSetPlacement)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacement;
  uint64_t v5 = [(UIInputViewSetPlacement *)&v8 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"ExtendedHeight"];
    v5->_extendedHeight = v6;
    v5->_dirty = [v4 decodeBoolForKey:@"Dirty"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float extendedHeight = self->_extendedHeight;
  id v6 = a3;
  *(float *)&double v5 = extendedHeight;
  [v6 encodeFloat:@"ExtendedHeight" forKey:v5];
  [v6 encodeBool:self->_dirty forKey:@"Dirty"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@>", objc_opt_class()];
}

- (void)setDirty
{
  self->_dirty = 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIInputViewSetPlacement *)a3;
  double v5 = v4;
  if (self->_dirty) {
    goto LABEL_2;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_3;
  }
  if (![(UIInputViewSetPlacement *)v4 isMemberOfClass:objc_opt_class()]) {
LABEL_2:
  }
    BOOL v6 = 0;
  else {
    BOOL v6 = !v5->_dirty;
  }
LABEL_3:

  return v6;
}

- (UIInputViewSetPlacement)assistantView
{
  return 0;
}

- (BOOL)isCompactAssistantView
{
  return 0;
}

- (BOOL)showsInputOrAssistantViews
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    BOOL v6 = [MEMORY[0x1E4F5B268] constraintWithItem:a4 attribute:4 relatedBy:0 toItem:a5 attribute:4 multiplier:1.0 constant:0.0];
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 inputAssistantView];
  double v5 = 0.0;
  if (v4)
  {
    BOOL v6 = (void *)v4;
    v7 = [v3 inputAssistantView];
    char v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      double v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v10 = [v9 systemInputAssistantViewController];

      double v11 = [v3 inputAssistantView];
      double v12 = [v11 traitCollection];
      [v10 preferredHeightForTraitCollection:v12];
      double v5 = v13;
    }
  }

  return v5;
}

- (unint64_t)notificationsForTransitionToPlacement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIInputViewSetPlacement *)self showsInputViews];
  int v6 = [v4 showsInputViews];
  int v7 = v6;
  int v8 = 1;
  if (!v5 && (v6 & 1) == 0)
  {
    BOOL v9 = [(UIInputViewSetPlacement *)self inputViewWillAppear];
    int v8 = v9 ^ [v4 inputViewWillAppear];
  }
  if ([(UIInputViewSetPlacement *)self isFloatingAssistantView]) {
    int v10 = [v4 isFloatingAssistantView] ^ 1;
  }
  else {
    int v10 = 0;
  }
  if ([(UIInputViewSetPlacement *)self isFloating]) {
    int v11 = 1;
  }
  else {
    int v11 = [v4 isFloating] ^ 1;
  }
  unint64_t v12 = 0;
  if (![(UIInputViewSetPlacement *)self isEqual:v4] && (v11 & ~(v8 | v10) & 1) == 0)
  {
    if ((v5 | v7 ^ 1) == 1)
    {
      if ((!v5 | v7) != 1) {
        goto LABEL_21;
      }
      if ((!v5 | v7 ^ 1))
      {
        if (v10) {
          unint64_t v12 = 3;
        }
        else {
          unint64_t v12 = 1;
        }
        goto LABEL_23;
      }
      if ([(UIInputViewSetPlacement *)self showsKeyboard]
        && ([v4 showsKeyboard] & 1) == 0
        && ([v4 accessoryViewWillAppear] & 1) != 0)
      {
LABEL_21:
        unint64_t v12 = 3;
        goto LABEL_23;
      }
    }
    unint64_t v12 = 2;
  }
LABEL_23:

  return v12;
}

- (BOOL)inputViewWillAppear
{
  return 0;
}

- (BOOL)accessoryViewWillAppear
{
  return 0;
}

- (id)expiringPlacement
{
  return +[UIInputViewSetPlacement placement];
}

- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3
{
  id v3 = [a3 hostView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)inputAccessoryViewPadding
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (double)extendedHeight
{
  return self->_extendedHeight;
}

- (void)setExtendedHeight:(double)a3
{
  self->_float extendedHeight = a3;
}

- (void)setSubPlacements:(id)a3
{
}

uint64_t __68__UIInputViewSetPlacement_FloatingAssistantApplicator_applyChanges___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHideInputAssistantBackdrop:1];
  [*(id *)(a1 + 32) setHideInputViewBackdrops:1];
  double v2 = *(void **)(a1 + 32);
  return [v2 setHideInputView:1];
}

uint64_t __59__UIInputViewSetPlacement_FloatingApplicator_applyChanges___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHideInputViewBackdrops:1];
  double v2 = *(void **)(a1 + 32);
  return [v2 updateCombinedBackdropView];
}

uint64_t __53__UIInputViewSetPlacement_FloatingApplicator_prepare__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyChanges:*(void *)(a1 + 40)];
}

@end
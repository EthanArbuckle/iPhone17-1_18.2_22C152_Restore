@interface UIKeyboardDockView
+ ($35570C6CB20FD1065279CABE7A6FABE9)_itemFramesForBoundingSize:(SEL)a3;
+ (id)dockViewHomeGestureExclusionZones;
+ (int64_t)_currentInterfaceOrientation;
- (CGSize)intrinsicContentSize;
- (UIKeyboardDockItem)centerDockItem;
- (UIKeyboardDockItem)leftDockItem;
- (UIKeyboardDockItem)rightDockItem;
- (UIKeyboardDockView)initWithFrame:(CGRect)a3;
- (UIKeyboardDockViewDelegate)delegate;
- (id)_dockItemWithButton:(id)a3;
- (id)_keyboardLayoutView;
- (id)_keyboardLongPressInteractionRegions;
- (void)_configureDockItem:(id)a3;
- (void)_dockItemButtonWasTapped:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCenterDockItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftDockItem:(id)a3;
- (void)setRightDockItem:(id)a3;
@end

@implementation UIKeyboardDockView

+ (int64_t)_currentInterfaceOrientation
{
  v2 = +[UIKeyboard activeKeyboard];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 interfaceOrientation];
  }
  else {
    uint64_t v4 = [(id)UIApp activeInterfaceOrientation];
  }
  int64_t v5 = v4;

  return v5;
}

+ ($35570C6CB20FD1065279CABE7A6FABE9)_itemFramesForBoundingSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  if ((unint64_t)([a2 _currentInterfaceOrientation] - 3) >= 2)
  {
    v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v9 = [v8 preferencesActions];
    uint64_t v6 = [v9 handBias];

    double v7 = 33.0;
  }
  else
  {
    uint64_t v6 = 0;
    double v7 = 30.0;
  }
  double v42 = v7;
  v10 = +[UIScreen mainScreen];
  [v10 _nativePointsPerMillimeter];
  double v12 = v11;

  double v44 = width;
  double v13 = width + -320.0;
  double v14 = v12 * 7.04351612;
  double v15 = v12 * 7.04351612;
  if (v6 == 1)
  {
    UIRoundToScale(v13, 0.0);
    double v15 = v16 + 22.0;
  }
  double v41 = v15;
  double v17 = MillimeterSizeToPointSize();
  double v19 = v18;
  double v20 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  if (v6 == 2)
  {
    UIRoundToScale(v13, 0.0);
    double v14 = v27 + 22.0;
  }
  CGFloat v40 = v20 + height - v19 - v42;
  CGFloat v28 = v17 - (v22 + v26);
  CGFloat v29 = v19 - (v20 + v24);
  double v30 = MillimeterSizeToPointSize();
  double v32 = v31;
  double v33 = height - v31 - v42;
  double v35 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
  CGFloat v38 = v30 - (v36 + v37);
  retstr->var0.origin.x = v41 - v28 * 0.5;
  retstr->var0.origin.y = v40;
  retstr->var0.size.double width = v28;
  retstr->var0.size.double height = v29;
  retstr->var1.origin.x = v44 - v38 * 0.5 - v14;
  retstr->var1.origin.y = v35 + v33;
  retstr->var1.size.double width = v38;
  retstr->var1.size.double height = v32 - (v35 + v39);
  return result;
}

+ (id)dockViewHomeGestureExclusionZones
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  objc_msgSend(a1, "_itemFramesForBoundingSize:", v5, v7);
  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (unsigned __int128)0, (unsigned __int128)0);
  v12[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (unsigned __int128)0, (unsigned __int128)0);
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardHandBiasDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDockView;
  [(UIView *)&v4 dealloc];
}

- (UIKeyboardDockView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardDockView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__didReceiveHandBiasChangeNotification_ name:@"UIKeyboardHandBiasDidChangeNotification" object:0];
  }
  return v3;
}

- (void)_dockItemButtonWasTapped:(id)a3 withEvent:(id)a4
{
  id v9 = a4;
  objc_super v6 = [(UIKeyboardDockView *)self _dockItemWithButton:a3];
  if (v6)
  {
    double v7 = [(UIKeyboardDockView *)self delegate];

    if (v7)
    {
      v8 = [(UIKeyboardDockView *)self delegate];
      [v8 keyboardDockView:self didPressDockItem:v6 withEvent:v9];
    }
  }
}

- (void)_configureDockItem:(id)a3
{
  id v4 = a3;
  double v5 = [v4 button];
  [v5 addTarget:self action:sel__dockItemButtonWasTapped_withEvent_ forControlEvents:0xFFFFFFFFLL];

  objc_super v6 = [v4 button];

  [(UIView *)self addSubview:v6];
  [(UIView *)self setNeedsLayout];
}

- (id)_dockItemWithButton:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKeyboardDockView *)self leftDockItem];
  id v6 = [v5 button];

  if (v6 == v4)
  {
    uint64_t v12 = [(UIKeyboardDockView *)self leftDockItem];
  }
  else
  {
    double v7 = [(UIKeyboardDockView *)self rightDockItem];
    id v8 = [v7 button];

    if (v8 == v4)
    {
      uint64_t v12 = [(UIKeyboardDockView *)self rightDockItem];
    }
    else
    {
      id v9 = [(UIKeyboardDockView *)self centerDockItem];
      id v10 = [v9 button];

      if (v10 != v4)
      {
        double v11 = 0;
        goto LABEL_9;
      }
      uint64_t v12 = [(UIKeyboardDockView *)self centerDockItem];
    }
  }
  double v11 = (void *)v12;
LABEL_9:

  return v11;
}

- (void)setLeftDockItem:(id)a3
{
  p_leftDockItem = &self->_leftDockItem;
  id v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_leftDockItem, "isEqual:"))
  {
    id v6 = [(UIKeyboardDockItem *)*p_leftDockItem button];
    [v6 removeFromSuperview];

    objc_storeStrong((id *)&self->_leftDockItem, a3);
    [(UIKeyboardDockView *)self _configureDockItem:v7];
  }
}

- (void)setRightDockItem:(id)a3
{
  p_rightDockItem = &self->_rightDockItem;
  id v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_rightDockItem, "isEqual:"))
  {
    id v6 = [(UIKeyboardDockItem *)*p_rightDockItem button];
    [v6 removeFromSuperview];

    objc_storeStrong((id *)&self->_rightDockItem, a3);
    [(UIKeyboardDockView *)self _configureDockItem:v7];
  }
}

- (void)setCenterDockItem:(id)a3
{
  p_centerDockItem = &self->_centerDockItem;
  id v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_centerDockItem, "isEqual:"))
  {
    id v6 = [(UIKeyboardDockItem *)*p_centerDockItem button];
    [v6 removeFromSuperview];

    objc_storeStrong((id *)&self->_centerDockItem, a3);
    [(UIKeyboardDockView *)self _configureDockItem:v7];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v2 = +[UIKeyboard usesInputSystemUI];
  double v3 = -1.0;
  if (!v2) {
    double v3 = 75.0;
  }
  double v4 = 150.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  v84.receiver = self;
  v84.super_class = (Class)UIKeyboardDockView;
  [(UIView *)&v84 layoutSubviews];
  double v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v3 valueForPreferenceKey:@"KeyboardDockItemHitAreaReductionPercent"];

  double v5 = 1.0;
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      [v4 doubleValue];
      double v5 = v6 / 100.0;
    }
    else
    {
      double v5 = 0.9;
    }
  }
  [(UIView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v76 = 0u;
  long long v79 = 0u;
  double v11 = objc_opt_class();
  if (v11)
  {
    objc_msgSend(v11, "_itemFramesForBoundingSize:", v8, v10);
  }
  else
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v76 = 0u;
    long long v79 = 0u;
  }
  uint64_t v12 = [(UIKeyboardDockView *)self leftDockItem];

  if (v12)
  {
    double v13 = [(UIKeyboardDockView *)self leftDockItem];
    double v14 = [v13 button];
    [v14 setContentMode:4];

    double v15 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(UIKeyboardDockView *)self leftDockItem];
    double v23 = [v22 button];
    objc_msgSend(v23, "setImageEdgeInsets:", v15, v17, v19, v21);

    double v24 = [(UIKeyboardDockView *)self leftDockItem];
    double v25 = [v24 image];
    [v25 baselineOffsetFromBottom];
    double v27 = v78 + v26;

    CGFloat v28 = [(UIKeyboardDockView *)self leftDockItem];
    CGFloat v29 = [v28 button];
    objc_msgSend(v29, "setFrame:", v77, v27, v80, v81);

    double v30 = [(UIKeyboardDockView *)self leftDockItem];
    double v31 = [v30 button];
    objc_msgSend(v31, "setTapActionRegion:", v80 - v5 * (v80 + -12.49376), 0.0, v5 * (v80 + -12.49376), v81 + -6.11907);
  }
  double v32 = [(UIKeyboardDockView *)self rightDockItem];

  if (v32)
  {
    double v33 = [(UIKeyboardDockView *)self rightDockItem];
    v34 = [v33 button];
    [v34 setContentMode:4];

    double v35 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v42 = [(UIKeyboardDockView *)self rightDockItem];
    v43 = [v42 button];
    objc_msgSend(v43, "setImageEdgeInsets:", v35, v37, v39, v41);

    double v44 = *(double *)&v82;
    v45 = [(UIKeyboardDockView *)self rightDockItem];
    v46 = [v45 image];
    [v46 baselineOffsetFromBottom];
    double v48 = *((double *)&v82 + 1) + v47;

    v49 = [(UIKeyboardDockView *)self rightDockItem];
    v50 = [v49 identifier];
    int v51 = [v50 isEqualToString:@"keyboardkeyboard"];

    if (v51) {
      double v44 = *(double *)&v82 + -5.0;
    }
    v52 = [(UIKeyboardDockView *)self rightDockItem];
    v53 = [v52 button];
    objc_msgSend(v53, "setFrame:", v44, v48, v83);

    v54 = [(UIKeyboardDockView *)self rightDockItem];
    v55 = [v54 button];
    objc_msgSend(v55, "setTapActionRegion:", 0.0, 0.0, v5 * (*(double *)&v83 + -12.49376), *((double *)&v83 + 1) + -6.11907);
  }
  v56 = [(UIKeyboardDockView *)self centerDockItem];

  if (v56)
  {
    v57 = [(UIKeyboardDockView *)self centerDockItem];
    v58 = [v57 button];
    [v58 setContentMode:4];

    double v59 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    v66 = [(UIKeyboardDockView *)self centerDockItem];
    v67 = [v66 button];
    objc_msgSend(v67, "setImageEdgeInsets:", v59, v61, v63, v65);

    v68 = [(UIKeyboardDockView *)self centerDockItem];
    v69 = [v68 image];
    [v69 baselineOffsetFromBottom];
    double v71 = *((double *)&v82 + 1) + v70;

    v72 = [(UIKeyboardDockView *)self centerDockItem];
    v73 = [v72 button];
    objc_msgSend(v73, "setFrame:", floor((v8 - *(double *)&v83) * 0.5), v71, v83);

    v74 = [(UIKeyboardDockView *)self centerDockItem];
    v75 = [v74 button];
    objc_msgSend(v75, "setTapActionRegion:", 0.0, 0.0, *(double *)&v83 + -12.49376, *((double *)&v83 + 1) + -6.11907);
  }
}

- (id)_keyboardLayoutView
{
  BOOL v2 = +[UIKeyboardImpl activeInstance];
  double v3 = +[UIKeyboard activeKeyboard];
  int v4 = [v2 isDescendantOfView:v3];

  if (v4)
  {
    double v5 = [v2 _layout];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_keyboardLongPressInteractionRegions
{
  v20[1] = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  memset(&v19, 0, sizeof(v19));
  long long v16 = 0u;
  long long v18 = 0u;
  double v7 = objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "_itemFramesForBoundingSize:", v4, v6);
  }
  else
  {
    memset(&v19, 0, sizeof(v19));
    long long v16 = 0u;
    long long v18 = 0u;
  }
  double v8 = [(UIView *)self _rootInputWindowController];
  [v8 _inputViewPadding];
  double v10 = v9;

  double MaxX = CGRectGetMaxX(v17);
  double MinX = CGRectGetMinX(v19);
  double v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", MaxX, 0.0, MinX - CGRectGetMaxX(v17), v6 + v10 * 0.5);
  v20[0] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v14;
}

- (UIKeyboardDockViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardDockViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIKeyboardDockItem)leftDockItem
{
  return self->_leftDockItem;
}

- (UIKeyboardDockItem)rightDockItem
{
  return self->_rightDockItem;
}

- (UIKeyboardDockItem)centerDockItem
{
  return self->_centerDockItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerDockItem, 0);
  objc_storeStrong((id *)&self->_rightDockItem, 0);
  objc_storeStrong((id *)&self->_leftDockItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
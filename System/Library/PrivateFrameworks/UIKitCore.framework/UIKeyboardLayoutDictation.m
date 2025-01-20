@interface UIKeyboardLayoutDictation
+ (BOOL)keyboardInputMode:(id)a3 supportsResizingOffsetForScreenTraits:(id)a4;
+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5;
+ (id)activeInstance;
- (BOOL)shouldFadeFromLayout;
- (BOOL)shouldFadeToLayout;
- (BOOL)usesAutoShift;
- (BOOL)visible;
- (CGRect)dragGestureRectInView:(id)a3;
- (CGSize)splitLeftSize;
- (UIKeyboardLayoutDictation)initWithFrame:(CGRect)a3;
- (id)currentKeyplane;
- (unint64_t)_clipCornersOfView:(id)a3;
- (void)layoutSubviews;
- (void)setRenderConfig:(id)a3;
- (void)setupBackgroundViewForNewSplitTraits:(id)a3;
- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5;
@end

@implementation UIKeyboardLayoutDictation

+ (id)activeInstance
{
  return (id)gDictationLayout;
}

- (UIKeyboardLayoutDictation)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardLayoutDictation;
  v3 = -[UIKeyboardLayout initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:1];
    objc_storeStrong((id *)&gDictationLayout, v4);
    v5 = v4;
  }

  return v4;
}

+ (BOOL)keyboardInputMode:(id)a3 supportsResizingOffsetForScreenTraits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 idiom] == 1
    || [v6 idiom] == 24
    || [v6 idiom] == 25
    || [v6 idiom] == 26
    || [v6 idiom] == 23)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v9 = [v6 orientation];
    char v7 = 0;
    if (v5 && (unint64_t)(v9 - 1) <= 1)
    {
      v10 = KBStarLayoutString(v5);
      char v7 = [v10 hasPrefix:@"HWR"];
    }
  }

  return v7;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v6 = a4;
  char v7 = +[UIDictationController sharedInstance];
  v8 = [v7 keyboardInputModeToReturn];
  uint64_t v9 = [v8 identifier];

  +[UIKeyboardLayoutStar keyboardSizeForInputMode:v9 screenTraits:v6 keyboardType:a5];
  double v11 = v10;
  double v13 = v12;
  if ([(id)objc_opt_class() keyboardInputMode:v9 supportsResizingOffsetForScreenTraits:v6])
  {
    +[UIKBResizingKeyplaneCoordinator savedResizingOffset];
    double v13 = v13 + v14;
  }
  BOOL v15 = +[UIKeyboardImpl isSplit];
  if (!+[UIKeyboardImpl showsGlobeAndDictationKeysExternally])
  {
    [v6 keyboardWidth];
    double v11 = v16;
  }
  if (v15) {
    double v13 = 216.0;
  }

  double v17 = v11;
  double v18 = v13;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)visible
{
  v2 = [(UIView *)self superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  if (self->_backgroundView == a3) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)setupBackgroundViewForNewSplitTraits:(id)a3
{
  id v42 = a3;
  unint64_t v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  id v5 = v42;
  if (v4 == 1)
  {
    backgroundView = self->_backgroundView;
    if (v42)
    {
      if (!backgroundView)
      {
        char v7 = [UIKBBackgroundView alloc];
        [(UIView *)self bounds];
        v8 = -[UIKBBackgroundView initWithFrame:](v7, "initWithFrame:");
        uint64_t v9 = self->_backgroundView;
        self->_backgroundView = v8;

        backgroundView = self->_backgroundView;
      }
      [(UIView *)self addSubview:backgroundView];
      [(UIView *)self bounds];
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      keyplane = self->_keyplane;
      if (keyplane)
      {
        self->_keyplane = 0;
      }
      double v11 = +[UIKBTree treeOfType:2];
      double v12 = self->_keyplane;
      self->_keyplane = v11;

      [(UIKBTree *)self->_keyplane setVisualStyle:103];
      [(UIKBTree *)self->_keyplane setName:@"iPad-dictation-split"];
      double v13 = +[UIKBTree treeOfType:3];
      [v13 setName:@"split-left"];
      double v14 = +[UIKBShape shape];
      [v42 leftFrame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      objc_msgSend(v14, "setFrame:");
      objc_msgSend(v14, "setPaddedFrame:", v16, v18, v20, v22);
      [v13 setShape:v14];
      v23 = [(UIKBTree *)self->_keyplane subtrees];
      [v23 addObject:v13];

      v24 = +[UIScreen mainScreen];
      objc_msgSend(v24, "_boundsForInterfaceOrientation:", -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
      double v26 = v25;

      v27 = +[UIKBTree treeOfType:3];
      [v27 setName:@"split-right"];
      [v42 rightFrame];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v34 = v26 - v30;
      v35 = +[UIKBShape shape];
      objc_msgSend(v35, "setFrame:", v34, v29, v31, v33);
      objc_msgSend(v35, "setPaddedFrame:", v34, v29, v31, v33);
      [v27 setShape:v35];
      v36 = [(UIKBTree *)self->_keyplane subtrees];
      [v36 addObject:v27];

      [(UIView *)self setNeedsDisplay];
      [(UIView *)self->_backgroundView setNeedsDisplay];
      v37 = self->_backgroundView;
      v38 = +[UIKeyboardImpl activeInstance];
      v39 = [v38 _inheritedRenderConfig];
      [(UIKBBackgroundView *)v37 setRenderConfig:v39];

      [(UIKBBackgroundView *)self->_backgroundView refreshStyleForKeyplane:self->_keyplane inputTraits:self->super._inputTraits];
      [v13 frame];
      -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, 0.0, v26);
      [(UIView *)self frame];
      double v41 = v40;
      [(UIView *)self frame];
      [(UIView *)self setFrame:v41];
    }
    else
    {
      [(UIView *)self->_backgroundView removeFromSuperview];
      double v13 = self->_backgroundView;
      self->_backgroundView = 0;
    }

    id v5 = v42;
  }
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[UIKeyboard isModelessActive])
  {
    v23.receiver = self;
    v23.super_class = (Class)UIKeyboardLayoutDictation;
    [(UIKeyboardLayout *)&v23 showKeyboardWithInputTraits:v8 screenTraits:v9 splitTraits:v10];
    [(UIKeyboardLayoutDictation *)self setupBackgroundViewForNewSplitTraits:v10];
    double v11 = +[UIDictationView sharedInstance];
    [v11 setDisplayDelegate:0];

    double v12 = +[UIDictationView sharedInstance];
    [(UIView *)self addSubview:v12];

    double v13 = +[UIDictationView sharedInstance];
    [v13 setNeedsLayout];

    double v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v15 = [v14 automaticAppearanceEnabled];

    double v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v16 setAutomaticAppearanceEnabled:1];

    double v17 = [(UIView *)self superview];

    if (v17)
    {
      double v18 = [(UIView *)self superview];
      [(UIView *)self bounds];
      double v21 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v19, v20);
      [v18 _didChangeKeyplaneWithContext:v21];
    }
    double v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v22 setAutomaticAppearanceEnabled:v15];
  }
}

- (void)setRenderConfig:(id)a3
{
  id v7 = a3;
  unint64_t v4 = +[UIDictationView sharedInstance];
  id v5 = [v4 superview];
  if (v5 == self)
  {
    int v6 = +[UIDictationController viewMode];

    if (v6 != 2) {
      goto LABEL_6;
    }
    unint64_t v4 = +[UIDictationView sharedInstance];
    [v4 setRenderConfig:v7];
  }
  else
  {
  }
LABEL_6:
  [(UIKBBackgroundView *)self->_backgroundView setRenderConfig:v7];
}

- (void)layoutSubviews
{
  BOOL v3 = +[UIDictationView sharedInstance];
  unint64_t v4 = [v3 superview];

  if (v4 == self)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = +[UIDictationView sharedInstance];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    double v14 = +[UIDictationView sharedInstance];
    [v14 setNeedsLayout];

    v15.receiver = self;
    v15.super_class = (Class)UIKeyboardLayoutDictation;
    [(UIView *)&v15 layoutSubviews];
  }
}

- (BOOL)shouldFadeFromLayout
{
  return 0;
}

- (BOOL)shouldFadeToLayout
{
  return 1;
}

- (CGSize)splitLeftSize
{
  [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-left"];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)currentKeyplane
{
  return self->_keyplane;
}

- (BOOL)usesAutoShift
{
  return 1;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
@interface _UICursorAccessoryViewController
- ($90CBC7AD7F202ACD7E5E12C06C780520)_contentForAccessory:(SEL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)isVisible;
- (BOOL)touchFallbackEnabled;
- (CGRect)cursorRect;
- (NSArray)accessories;
- (NSArray)selectionRects;
- (NSDictionary)accessoriesByIdentifier;
- (UIColor)accessoryTintColor;
- (UITextRange)selectedRange;
- (_UICursorAccessoryHostView)hostView;
- (_UICursorAccessoryViewController)init;
- (_UICursorAccessoryViewControllerDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 fromView:(id)a5;
- (void)_setSelectionRect:(CGRect)a3 preferredPlacement:(unint64_t)a4 animated:(BOOL)a5;
- (void)_updateSelectionRectAnimated:(BOOL)a3;
- (void)configureItemView:(id)a3 forAccessoryIdentifier:(id)a4;
- (void)didTapToActivateAccessoryWithIdentifier:(id)a3;
- (void)loadView;
- (void)setAccessories:(id)a3;
- (void)setAccessories:(id)a3 animated:(BOOL)a4;
- (void)setAccessoriesByIdentifier:(id)a3;
- (void)setAccessoryTintColor:(id)a3;
- (void)setCursorRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setHostView:(id)a3;
- (void)setSelectedRange:(id)a3;
- (void)setSelectionRects:(id)a3;
- (void)setTouchFallbackEnabled:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4;
- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation _UICursorAccessoryViewController

- (_UICursorAccessoryViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryViewController;
  v2 = [(UIViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    [(_UICursorAccessoryViewController *)v2 setVisible:0 animationStyle:0];
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [[_UICursorAccessoryHostView alloc] initWithCursorItemDataSource:self];
  hostView = self->_hostView;
  self->_hostView = v3;

  objc_super v5 = self->_hostView;
  [(UIViewController *)self setView:v5];
}

- (void)viewDidLoad
{
}

- (void)_setSelectionRect:(CGRect)a3 preferredPlacement:(unint64_t)a4 animated:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a5 && self->_visible)
  {
    BOOL v11 = CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB28]);
    -[_UICursorAccessoryHostView setSelectionRect:](self->_hostView, "setSelectionRect:", x, y, width, height);
    [(_UICursorAccessoryHostView *)self->_hostView setPreferredPlacementEdge:a4];
    if (!v11)
    {
      v12 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.13];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82___UICursorAccessoryViewController__setSelectionRect_preferredPlacement_animated___block_invoke;
      v14[3] = &unk_1E52D9F70;
      v14[4] = self;
      +[UIView _animateUsingSpringBehavior:v12 tracking:0 animations:v14 completion:0];
    }
  }
  else
  {
    -[_UICursorAccessoryHostView setSelectionRect:](self->_hostView, "setSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    hostView = self->_hostView;
    [(_UICursorAccessoryHostView *)hostView setPreferredPlacementEdge:a4];
  }
}

- (void)_updateSelectionRectAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = self->_selectionRects;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "rect", (void)v26);
        if (CGRectGetWidth(v32) >= 2.22044605e-16)
        {
          [v14 rect];
          v36.origin.CGFloat x = v15;
          v36.origin.CGFloat y = v16;
          v36.size.CGFloat width = v17;
          v36.size.CGFloat height = v18;
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          CGRect v34 = CGRectUnion(v33, v36);
          CGFloat x = v34.origin.x;
          CGFloat y = v34.origin.y;
          CGFloat width = v34.size.width;
          CGFloat height = v34.size.height;
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (CGRectIsNull(v35))
  {
    double v19 = self->_cursorRect.origin.x;
    double v20 = self->_cursorRect.origin.y;
    double v21 = self->_cursorRect.size.width;
    double v22 = self->_cursorRect.size.height;
    v23 = self;
    BOOL v24 = v3;
    uint64_t v25 = 4;
  }
  else
  {
    v23 = self;
    double v19 = x;
    double v20 = y;
    double v21 = width;
    double v22 = height;
    BOOL v24 = v3;
    uint64_t v25 = 1;
  }
  -[_UICursorAccessoryViewController _setSelectionRect:preferredPlacement:animated:](v23, "_setSelectionRect:preferredPlacement:animated:", v25, v24, v19, v20, v21, v22, (void)v26);
}

- (void)setCursorRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v8 = self->_visible && !CGRectEqualToRect(self->_cursorRect, a3);
  self->_cursorRect.origin.CGFloat x = x;
  self->_cursorRect.origin.CGFloat y = y;
  self->_cursorRect.size.CGFloat width = width;
  self->_cursorRect.size.CGFloat height = height;
  [(_UICursorAccessoryViewController *)self _updateSelectionRectAnimated:v8];
}

- (void)setSelectionRects:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRects, a3);
  BOOL visible = self->_visible;
  [(_UICursorAccessoryViewController *)self _updateSelectionRectAnimated:visible];
}

- (void)setAccessories:(id)a3
{
}

- (void)setAccessories:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = v4 && [(NSArray *)self->_accessories count] != 0;
  if (![(NSArray *)self->_accessories isEqualToArray:v7])
  {
    BOOL v24 = v8;
    uint64_t v25 = self;
    objc_storeStrong((id *)&self->_accessories, a3);
    v9 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CGFloat v17 = [v16 identifier];
          CGFloat v18 = v17;
          if (v17)
          {
            id v19 = v17;
          }
          else
          {
            double v20 = [MEMORY[0x1E4F29128] UUID];
            id v19 = [v20 UUIDString];
          }
          [v10 setObject:v16 forKey:v19];
          [v9 addObject:v19];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    objc_storeStrong((id *)&v25->_accessoriesByIdentifier, v10);
    double v21 = [(_UICursorAccessoryHostView *)v25->_hostView cursorAccessoryView];
    double v22 = [v9 array];
    [v21 setAccessoryIdentifiers:v22 animated:v24];

    [(UIView *)v25->_hostView setNeedsLayout];
    if (v24)
    {
      v23 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.9 response:0.2];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __60___UICursorAccessoryViewController_setAccessories_animated___block_invoke;
      v27[3] = &unk_1E52D9F70;
      v27[4] = v25;
      +[UIView _animateUsingSpringBehavior:v23 tracking:0 animations:v27 completion:0];
    }
    id v7 = v26;
  }
}

- (UIColor)accessoryTintColor
{
  return [(UIView *)self->_hostView tintColor];
}

- (void)setAccessoryTintColor:(id)a3
{
  hostView = self->_hostView;
  id v5 = a3;
  [(UIView *)hostView setTintColor:v5];
  id v6 = [(_UICursorAccessoryHostView *)self->_hostView cursorAccessoryView];
  [v6 setTintColor:v5];
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4
{
}

- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke;
  aBlock[3] = &unk_1E52E8F50;
  id v9 = v8;
  id v36 = v9;
  id v10 = _Block_copy(aBlock);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_2;
  v33[3] = &unk_1E52D9FE8;
  id v11 = v10;
  id v34 = v11;
  uint64_t v12 = (void (**)(void *, uint64_t))_Block_copy(v33);
  if (self->_visible == v6) {
    goto LABEL_2;
  }
  self->_BOOL visible = v6;
  if (a4 == 2)
  {
    CGFloat v15 = +[_UIDictationSettingsDomain rootSettings];
    [v15 revealFadeTime];
    double v17 = v16;

    hostView = self->_hostView;
    if (v6)
    {
      [(_UICursorAccessoryHostView *)hostView setHidden:0];
      [(_UICursorAccessoryHostView *)self->_hostView setCollapsed:0];
      [(UIView *)self->_hostView setAlpha:0.0];
      [(_UICursorAccessoryHostView *)self->_hostView layoutSubviews];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      long long v28 = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_5;
      long long v29 = &unk_1E52D9F70;
      long long v30 = self;
      id v19 = &v26;
    }
    else
    {
      [(UIView *)hostView setAlpha:1.0];
      [(_UICursorAccessoryHostView *)self->_hostView setHidden:0];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_6;
      BOOL v24 = &unk_1E52D9F70;
      uint64_t v25 = self;
      id v19 = &v21;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v19, v12, v17, 0.0, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    if (a4 != 1)
    {
      double v20 = self->_hostView;
      if (v6)
      {
        [(_UICursorAccessoryHostView *)v20 setHidden:0];
        [(_UICursorAccessoryHostView *)self->_hostView setCollapsed:0];
        [(UIView *)self->_hostView setAlpha:1.0];
      }
      else
      {
        [(_UICursorAccessoryHostView *)v20 setHidden:1];
        [(_UICursorAccessoryHostView *)self->_hostView setCollapsed:1];
      }
LABEL_2:
      v12[2](v12, 1);
      goto LABEL_15;
    }
    if (v6)
    {
      [(_UICursorAccessoryHostView *)self->_hostView setHidden:0];
      [(_UICursorAccessoryHostView *)self->_hostView setCollapsed:1];
      [(UIView *)self->_hostView setAlpha:1.0];
      [(_UICursorAccessoryHostView *)self->_hostView layoutSubviews];
      uint64_t v13 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.8 response:0.2];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_3;
      v32[3] = &unk_1E52D9F70;
      v32[4] = self;
      uint64_t v14 = v32;
    }
    else
    {
      uint64_t v13 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.15];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_4;
      v31[3] = &unk_1E52D9F70;
      v31[4] = self;
      uint64_t v14 = v31;
    }
    +[UIView _animateUsingSpringBehavior:v13 tracking:0 animations:v14 completion:v11];
  }
LABEL_15:
}

- (void)setTouchFallbackEnabled:(BOOL)a3
{
}

- (BOOL)touchFallbackEnabled
{
  return [(_UICursorAccessoryHostView *)self->_hostView touchFallbackEnabled];
}

- ($90CBC7AD7F202ACD7E5E12C06C780520)_contentForAccessory:(SEL)a3
{
  id v7 = a4;
  id v8 = [v7 _dictationCursorAccessory];

  if (v8)
  {
    retstr->var0 = 0;
    id v9 = @"mic";
  }
  else
  {
    id v10 = [v7 _deleteCursorAccessory];

    if (!v10)
    {
      uint64_t v12 = [v7 _inputModeCursorAccessory];

      if (v12)
      {
        uint64_t v13 = [v7 _inputModeCursorAccessory];
        uint64_t v14 = [v13 dictationLanguage];
        if (v14
          && (CGFloat v15 = (void *)v14,
              id TUIKeyboardInputModeIconRendererClass = getTUIKeyboardInputModeIconRendererClass(),
              v15,
              TUIKeyboardInputModeIconRendererClass))
        {
          double v17 = +[UIKeyboardInputModeController sharedInputModeController];
          CGFloat v18 = [v17 enabledDictationLanguages];

          id v19 = [v13 dictationLanguage];
          uint64_t v20 = [v18 indexOfObject:v19];

          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v21 = 0;
          }
          else {
            uint64_t v21 = v20;
          }
          uint64_t v22 = [MEMORY[0x1E4F1CA20] abbreviationsForLanguages:v18 minimizeVariants:1];
          v23 = [v22 objectAtIndexedSubscript:v21];
          BOOL v24 = [v23 componentsSeparatedByString:@" "];
          v48 = [v24 firstObject];
          uint64_t v25 = 0;
          if ([v24 count] == 2)
          {
            uint64_t v25 = [v24 lastObject];
          }
          id v26 = objc_alloc_init((Class)getTUIKeyboardInputModeIconRendererClass());
          uint64_t v50 = 0;
          v51 = &v50;
          uint64_t v52 = 0x2050000000;
          uint64_t v27 = (void *)getTUIKeyboardInputModeIconRendererConfigurationClass_softClass;
          uint64_t v53 = getTUIKeyboardInputModeIconRendererConfigurationClass_softClass;
          if (!getTUIKeyboardInputModeIconRendererConfigurationClass_softClass)
          {
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __getTUIKeyboardInputModeIconRendererConfigurationClass_block_invoke;
            v49[3] = &unk_1E52D9900;
            v49[4] = &v50;
            __getTUIKeyboardInputModeIconRendererConfigurationClass_block_invoke((uint64_t)v49);
            uint64_t v27 = (void *)v51[3];
          }
          v46 = v23;
          v47 = v22;
          long long v28 = v27;
          _Block_object_dispose(&v50, 8);
          id v29 = objc_alloc_init(v28);
          long long v30 = +[UIColor whiteColor];
          [v29 setTintColor:v30];

          long long v31 = v26;
          if ([v13 isLarge]) {
            +[_UICursorAccessoryView largeItemSize];
          }
          else {
            +[_UICursorAccessoryView defaultItemSize];
          }
          [v29 setSize:v32 + -6.0];
          +[_UICursorAccessoryView baseFontSize];
          objc_msgSend(v29, "setBaseFontSize:");
          [v29 setStyle:0];
          if (objc_opt_respondsToSelector())
          {
            v41 = [v13 dictationLanguage];
            [v29 setLanguage:v41];
          }
          v42 = v26;
          v43 = (void *)v25;
          v44 = [v42 imageForPrimaryLabel:v48 secondaryLabel:v25 withConfiguration:v29];
          v45 = [v44 imageWithRenderingMode:2];

          retstr->var0 = 0;
          retstr->var1 = v45;
          retstr->var2 = 3;
        }
        else
        {
          uint64_t v33 = [v13 inputModeIdentifier];
          id v34 = [v13 inputModeIdentifier];
          CGRect v35 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v34];

          if ([v13 isLarge]) {
            [v35 largeCursorAccessoryIcon];
          }
          else {
          id v36 = [v35 cursorAccessoryIcon];
          }
          retstr->var0 = 0;
          retstr->var1 = v36;
          retstr->var2 = 3;
        }
      }
      else
      {
        v37 = [v7 _modifierKeyCursorAccessory];

        if (!v37)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:a3 object:self file:@"_UICursorAccessoryViewController.m" lineNumber:343 description:@"Unsupported accessory type."];

          retstr->var0 = 0;
          retstr->var1 = 0;
          retstr->var2 = 0;
          goto LABEL_6;
        }
        uint64_t v13 = [v7 _modifierKeyCursorAccessory];
        uint64_t v38 = [v13 modifierType];
        if ((unint64_t)(v38 - 1) > 2) {
          v39 = @"question";
        }
        else {
          v39 = off_1E52F1030[v38 - 1];
        }
        retstr->var0 = 0;
        retstr->var1 = +[UIImage systemImageNamed:v39];
        retstr->var2 = 2;
      }

      goto LABEL_6;
    }
    retstr->var0 = 0;
    id v9 = @"delete.left";
  }
  retstr->var1 = +[UIImage systemImageNamed:v9];
  retstr->var2 = 2;
LABEL_6:

  return result;
}

- (void)configureItemView:(id)a3 forAccessoryIdentifier:(id)a4
{
  id v6 = a3;
  accessoriesByIdentifier = self->_accessoriesByIdentifier;
  id v8 = a4;
  id v9 = [(NSDictionary *)accessoriesByIdentifier objectForKey:v8];
  [(_UICursorAccessoryViewController *)self _contentForAccessory:v9];
  id v10 = v16;
  id v13 = v10;
  id v11 = v17;
  id v14 = v11;
  uint64_t v15 = v18;
  if (v6)
  {
    [v6 setContent:&v13];
  }
  else
  {
    uint64_t v12 = v11;
  }
  objc_msgSend(v6, "setStyle:", objc_msgSend(v9, "style", v13, v14, v15));
  [v6 setAccessibilityIdentifier:v8];
  [v6 setAccessibilityLabel:v8];

  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityTraits:1];
}

- (void)didTapToActivateAccessoryWithIdentifier:(id)a3
{
  id v5 = [(NSDictionary *)self->_accessoriesByIdentifier objectForKey:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cursorAccessoryViewController:self didActivateCursorAccessory:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 fromView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  hostView = self->_hostView;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [(_UICursorAccessoryHostView *)hostView cursorAccessoryView];
  objc_msgSend(v12, "convertPoint:fromView:", v10, x, y);
  double v14 = v13;
  double v16 = v15;

  id v17 = [(_UICursorAccessoryHostView *)self->_hostView cursorAccessoryView];
  uint64_t v18 = objc_msgSend(v17, "hitTest:withEvent:", v11, v14, v16);

  return v18;
}

- (_UICursorAccessoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UICursorAccessoryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)cursorRect
{
  double x = self->_cursorRect.origin.x;
  double y = self->_cursorRect.origin.y;
  double width = self->_cursorRect.size.width;
  double height = self->_cursorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (UITextRange)selectedRange
{
  return self->_selectedRange;
}

- (void)setSelectedRange:(id)a3
{
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (_UICursorAccessoryHostView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
}

- (NSDictionary)accessoriesByIdentifier
{
  return self->_accessoriesByIdentifier;
}

- (void)setAccessoriesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_selectedRange, 0);
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end